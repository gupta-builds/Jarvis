<#
00-preflight.ps1 - READ-ONLY. Run first, on either laptop, in a normal (not elevated) shell.
Detects the machine and the vault, checks the manifest and every script, compares the manifest with reality,
prints the plan that 10-install-toolkit.ps1 would carry out, and scans the config sources for secrets.
Nothing is installed or changed. Writes only a log and a result JSON.
#>
param([ValidateSet('dell', 'acer')][string]$Machine)

. "$PSScriptRoot\_lib.ps1"
$ErrorActionPreference = 'Stop'
Initialize-Toolkit -Name '00-preflight' -DryRun $false -Machine $Machine | Out-Null
$m = $global:TK.Manifest
$role = $global:TK.Role

try {
    # ---- 1 environment facts
    Write-Log '--- 1 Environment' 'STEP'
    $c = Get-PSDrive C; $d = Get-PSDrive D -ErrorAction SilentlyContinue
    $freeC = [math]::Round($c.Free / 1GB, 1)
    $freeD = 0
    if ($d) { $freeD = [math]::Round($d.Free / 1GB, 1) }
    Add-Result 'env-drives' 'INFO' ("C: free {0} GiB, D: free {1} GiB" -f $freeC, $freeD) @{ freeC = $freeC; freeD = $freeD }
    Add-Result 'env-powershell' 'INFO' ("PowerShell {0}, admin={1}, execution policy (effective) {2}" -f $PSVersionTable.PSVersion, (Test-IsAdmin), (Get-ExecutionPolicy))
    if (Test-IsAdmin) { Add-Result 'env-elevation' 'WARN' 'Running elevated. Installers and config writes are meant to run in a normal shell.' }
    $wg = Resolve-Cmd 'winget'
    if ($wg) { Add-Result 'env-winget' 'PASS' ("winget at {0}" -f $wg) } else { Add-Result 'env-winget' 'FAIL' 'winget not found' }
    Add-Result 'env-vault' 'PASS' ("vault root {0}" -f $global:TK.Vault) @{ vaultRoot = $global:TK.Vault }
    Add-Result 'env-machine' 'PASS' ("{0} ({1}) detected" -f $role, $m.machines.$role.label)
    try {
        $r = Invoke-WebRequest -Uri 'https://github.com' -Method Head -UseBasicParsing -TimeoutSec 20
        Add-Result 'env-network' 'PASS' ("github.com reachable (HTTP {0})" -f $r.StatusCode)
    } catch { Add-Result 'env-network' 'WARN' 'github.com not reachable; font and uv downloads would fail' }

    # ---- 2 scripts: ASCII and parse
    Write-Log '--- 2 Scripts parse and ASCII check' 'STEP'
    foreach ($f in Get-ChildItem -LiteralPath $global:TKLibDir -Filter '*.ps1' | Sort-Object Name) {
        $bytes = [IO.File]::ReadAllBytes($f.FullName)
        $bad = 0; foreach ($b in $bytes) { if ($b -gt 127) { $bad++ } }
        $errs = $null; $tokens = $null
        [System.Management.Automation.Language.Parser]::ParseFile($f.FullName, [ref]$tokens, [ref]$errs) | Out-Null
        $n = 0; if ($errs) { $n = $errs.Count }
        if ($bad -eq 0 -and $n -eq 0) { Add-Result ('script-' + $f.Name) 'PASS' 'ASCII only, parses clean' }
        else { Add-Result ('script-' + $f.Name) 'FAIL' ("non-ASCII bytes={0}, parse errors={1}" -f $bad, $n) }
    }

    # ---- 3 manifest sanity and config sources
    Write-Log '--- 3 Manifest and config sources' 'STEP'
    $ids = @($m.tools | ForEach-Object { $_.id })
    $dups = @($ids | Group-Object | Where-Object { $_.Count -gt 1 })
    if ($dups.Count -eq 0) { Add-Result 'manifest-ids' 'PASS' ("{0} tools, ids unique" -f $ids.Count) } else { Add-Result 'manifest-ids' 'FAIL' 'duplicate ids' }
    foreach ($cfg in $m.configs) {
        if (-not $cfg.source) { continue }
        $sp = Join-Path $global:TK.Root $cfg.source
        if (-not (Test-Path -LiteralPath $sp)) { Add-Result ('config-src-' + $cfg.id) 'FAIL' ("missing source {0}" -f $cfg.source); continue }
        $text = [IO.File]::ReadAllText($sp)
        $hits = Get-SecretHitCount $text
        $hash = Get-FileSha256 $sp
        $st = 'PASS'; $dt = ("sha256 {0}..." -f $hash.Substring(0, 12))
        if ($hits -gt 0) { $st = 'FAIL'; $dt = ("secret-like patterns matched: {0} (text not shown)" -f $hits) }
        elseif ($cfg.sha256 -and ($cfg.sha256 -ne $hash)) { $st = 'FAIL'; $dt = ("hash differs from manifest ({0})" -f $hash) }
        elseif ($cfg.sha256) { $dt += ' matches the Acer snapshot hash' }
        Add-Result ('config-src-' + $cfg.id) $st $dt @{ sha256 = $hash }
    }

    # ---- 4 existing profiles, terminal, git on THIS machine
    Write-Log '--- 4 Existing files that will be touched' 'STEP'
    foreach ($cfg in $m.configs | Where-Object { $_.kind -eq 'profile-block' }) {
        $tp = Expand-ToolkitPath $cfg.target $global:TK.Vault
        if (Test-Path -LiteralPath $tp) {
            $txt = [IO.File]::ReadAllText($tp)
            $hits = Get-SecretHitCount $txt
            $has = $txt.Contains($global:TKBlockBegin)
            $errs = $null; $tokens = $null
            [System.Management.Automation.Language.Parser]::ParseInput($txt, [ref]$tokens, [ref]$errs) | Out-Null
            $n = 0; if ($errs) { $n = $errs.Count }
            $detail = ("{0} exists, {1} bytes, sha256 {2}..., managed block present={3}, parse errors={4}, secret-like hits={5}" -f $tp, $txt.Length, (Get-FileSha256 $tp).Substring(0, 12), $has, $n, $hits)
            $st = 'INFO'; if ($n -gt 0 -or $hits -gt 0) { $st = 'WARN' }
            Add-Result ('profile-' + $cfg.id) $st $detail @{ path = $tp; sha256 = (Get-FileSha256 $tp) }
        } else {
            Add-Result ('profile-' + $cfg.id) 'INFO' ("{0} does not exist yet; it will be created" -f $tp) @{ path = $tp }
        }
    }
    $wtDir = Get-ChildItem (Join-Path $env:LOCALAPPDATA 'Packages') -Filter 'Microsoft.WindowsTerminal_*' -Directory -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($wtDir) {
        $wtp = Join-Path $wtDir.FullName 'LocalState\settings.json'
        if (Test-Path -LiteralPath $wtp) {
            $ok = $true; try { $null = Get-Content -LiteralPath $wtp -Raw | ConvertFrom-Json } catch { $ok = $false }
            if ($ok) { Add-Result 'terminal-settings' 'INFO' ("{0} parses as JSON, sha256 {1}..." -f $wtp, (Get-FileSha256 $wtp).Substring(0, 12)) @{ path = $wtp } }
            else { Add-Result 'terminal-settings' 'WARN' 'settings.json has comments or is not strict JSON; 20-apply-configs will report MANUAL and not touch it' @{ path = $wtp } }
        } else { Add-Result 'terminal-settings' 'INFO' 'no settings.json yet (open Windows Terminal once)' }
    } else { Add-Result 'terminal-settings' 'WARN' 'Windows Terminal package folder not found' }
    $gp = Join-Path $env:USERPROFILE '.gitconfig'
    if (Test-Path -LiteralPath $gp) {
        $git = Resolve-Cmd 'git'
        if ($git) {
            $r = Invoke-Native -File $git -Arguments @('config', '--global', '--get', 'core.autocrlf') -TimeoutSec 20
            Add-Result 'git-global' 'INFO' ("global .gitconfig present; core.autocrlf={0} (will become input)" -f $r.Output.Trim())
        }
    } else { Add-Result 'git-global' 'INFO' 'no global .gitconfig yet' }

    # ---- 5 manifest vs reality (the plan)
    Write-Log '--- 5 Manifest versus reality (the plan for 10-install-toolkit)' 'STEP'
    $lock = Read-ToolkitLock
    if ($lock) { Add-Result 'lock' 'INFO' ("toolkit.lock.json present (host {0}, {1})" -f $lock.host, $lock.created) } else { Add-Result 'lock' 'INFO' 'no toolkit.lock.json yet (this host will create it after 99-verify -WriteLock)' }
    $planned = 0
    foreach ($t in $m.tools) {
        if (-not (Test-ToolOnMachine $t $role) -and $t.policy -ne 'catalog-only') { continue }
        if ($t.policy -eq 'catalog-only') { continue }
        $st = Get-ToolState $t
        $pl = Get-ToolPlan -Tool $t -State $st -Lock $lock
        $status = 'OK'
        if ($pl.action -in 'install', 'upgrade') { $status = 'PLAN'; $planned++ }
        elseif ($pl.action -eq 'manual') { $status = 'MANUAL' }
        elseif ($pl.action -in 'pending-retire') { $status = 'PENDING' }
        elseif ($pl.action -in 'missing', 'warn-present') { $status = 'WARN' }
        $ver = $st.version; if (-not $ver) { $ver = '-' }
        $act = $pl.action; if ($pl.version) { $act = $act + ' ' + $pl.version }
        Add-Result $t.id $status ("installed={0} version={1} -> {2} ({3})" -f $st.installed, $ver, $act, $pl.reason) @{ installed = $st.installed; version = $st.version; path = $st.path; action = $pl.action }
    }
    Add-Result 'plan-total' 'INFO' ("{0} install/upgrade action(s) planned for 10-install-toolkit.ps1" -f $planned)

    # ---- 6 environment variables (known, non-secret names only)
    Write-Log '--- 6 Environment variables' 'STEP'
    foreach ($e in $m.env.verify) {
        $v = [Environment]::GetEnvironmentVariable($e.name, 'User')
        $want = $e.dell
        if ($role -eq 'dell' -and $want) {
            if ($v -eq $want) { Add-Result ('env-' + $e.name) 'PASS' ("{0}={1}" -f $e.name, $v) } else { Add-Result ('env-' + $e.name) 'WARN' ("{0} is '{1}', expected '{2}' (Build 3 variable, not changed here)" -f $e.name, $v, $want) }
        } else {
            $shown = $v; if (-not $shown) { $shown = '(unset)' }
            Add-Result ('env-' + $e.name) 'INFO' ("{0}={1}" -f $e.name, $shown)
        }
    }
    foreach ($e in $m.env.set) {
        $v = [Environment]::GetEnvironmentVariable($e.name, 'User')
        $shown = $v; if (-not $shown) { $shown = '(unset, will be set by 20-apply-configs)' }
        Add-Result ('env-' + $e.name) 'INFO' ("{0}={1}" -f $e.name, $shown)
    }

    # ---- 7 junctions
    foreach ($t in $m.tools | Where-Object { $_.junction -and (Test-ToolOnMachine $_ $role) }) {
        $jp = Expand-ToolkitPath $t.junction.path $global:TK.Vault
        if (Test-Path -LiteralPath $jp) {
            $it = Get-Item -LiteralPath $jp -Force
            $isLink = [bool]($it.Attributes -band [IO.FileAttributes]::ReparsePoint)
            $tgt = ''; try { $tgt = ($it.Target -join ';') } catch { }
            if ($isLink) { Add-Result ('junction-' + $t.id) 'PASS' ("{0} -> {1}" -f $jp, $tgt) } else { Add-Result ('junction-' + $t.id) 'WARN' ("{0} exists but is not a junction" -f $jp) }
        } else { Add-Result ('junction-' + $t.id) 'WARN' ("{0} missing" -f $jp) }
    }
    $ctx = @{ plannedActions = $planned; freeC = $freeC; freeD = $freeD }
} catch {
    Add-Result 'preflight-error' 'FAIL' $_.Exception.Message
    $ctx = @{}
}
Complete-Toolkit -Summary $ctx
