<#
20-apply-configs.ps1 - applies the shared configs. Run in a NORMAL shell after 10-install-toolkit.ps1.
Applies: starship.toml, global git ignore, shared delta include, bat and fd configs, the managed block in both PowerShell profiles,
the shared Windows Terminal fragment (merged, machine profiles preserved), global git settings, user environment variables.
Every replaced file is backed up first to D:\Backup\Toolkit\<timestamp>\ (index: backup-index.json). Nothing is deleted.
  -DryRun        print what would change
  -Only          limit to config ids (starship, git-ignore, git-delta, bat, fd-ignore, profile-ps5, profile-pwsh, terminal, git-settings, env)
  -RestoreFrom   path of a D:\Backup\Toolkit\<timestamp> folder; copies the backed-up files back (git settings and env vars are listed, not auto-reverted)
  -TerminalSettingsPath, -TestProfileDir, -BackupBase   test overrides only
Safe to run twice: unchanged files report UNCHANGED.
#>
param(
    [switch]$DryRun,
    [ValidateSet('dell', 'acer')][string]$Machine,
    [string[]]$Only,
    [string]$RestoreFrom,
    [string]$TerminalSettingsPath,
    [string]$TestProfileDir,
    [string]$BackupBase
)

. "$PSScriptRoot\_lib.ps1"
$ErrorActionPreference = 'Stop'
if ($Only) { $Only = @($Only | ForEach-Object { $_ -split ',' } | Where-Object { $_ }) }
Initialize-Toolkit -Name '20-apply-configs' -DryRun $DryRun.IsPresent -Machine $Machine | Out-Null
if ($BackupBase) { $global:TK.BackupBase = $BackupBase }
$m = $global:TK.Manifest
$role = $global:TK.Role
$dry = $global:TK.DryRun
$hashRows = New-Object System.Collections.Generic.List[object]

function Test-Wanted { param([string]$Id) if ($Only -and ($Only -notcontains $Id)) { return $false }; return $true }

function Set-Prop {
    param($Obj, [string]$Name, $Value)
    if ($Obj.PSObject.Properties[$Name]) { $Obj.$Name = $Value } else { $Obj | Add-Member -NotePropertyName $Name -NotePropertyValue $Value }
}

# ------------------------------------------------------------------ restore mode
if ($RestoreFrom) {
    $idx = Join-Path $RestoreFrom 'backup-index.json'
    if (-not (Test-Path -LiteralPath $idx)) { Write-Log ("No backup-index.json in {0}" -f $RestoreFrom) 'ERROR'; exit 1 }
    $entries = @(Get-Content -LiteralPath $idx -Raw | ConvertFrom-Json)
    foreach ($e in $entries) {
        if (-not (Test-Path -LiteralPath $e.backup)) { Add-Result 'restore' 'FAIL' ("backup file missing: {0}" -f $e.backup); continue }
        if ($dry) { Add-Result 'restore' 'PLAN' ("[DRYRUN] would restore {0}" -f $e.original); continue }
        Copy-Item -LiteralPath $e.backup -Destination $e.original -Force
        Add-Result 'restore' 'CHANGED' ("restored {0}" -f $e.original)
    }
    Write-Log 'Git settings and user environment variables are not auto-reverted. To undo: git config --global --unset <key>; remove STARSHIP_CONFIG / TOOLKIT_VAULT_ROOT in System Properties.' 'WARN'
    Complete-Toolkit
}

# ------------------------------------------------------------------ helpers: copy
function Apply-CopyConfig {
    param($Cfg)
    $src = Join-Path $global:TK.Root $Cfg.source
    $tgt = Expand-ToolkitPath $Cfg.target $global:TK.Vault
    if (-not (Test-Path -LiteralPath $src)) { Add-Result $Cfg.id 'FAIL' ("source missing: {0}" -f $Cfg.source); return }
    if ($Cfg.requiresTool -and -not (Resolve-Cmd $Cfg.requiresTool)) { Add-Result $Cfg.id 'WARN' ("{0} is not installed yet; skipped (run 10-install-toolkit first)" -f $Cfg.requiresTool); return }
    $hits = Get-SecretHitCount ([IO.File]::ReadAllText($src))
    if ($hits -gt 0) { Add-Result $Cfg.id 'FAIL' ("source matches {0} secret pattern(s); not written, text not shown" -f $hits); return }
    $srcHash = Get-FileSha256 $src
    $dstHash = Get-FileSha256 $tgt
    $mode = $Cfg.onExisting.$role
    if ($dstHash -and ($dstHash -eq $srcHash)) {
        Add-Result $Cfg.id 'UNCHANGED' ("{0} already matches the source" -f $tgt) @{ sha256 = $srcHash; target = $tgt }
        $hashRows.Add([pscustomobject]@{ id = $Cfg.id; target = $tgt; source = $srcHash; target_hash = $dstHash; match = $true }); return
    }
    if ($dstHash -and $mode -eq 'keep') {
        Add-Result $Cfg.id 'DIFF' ("kept this machine's own file ({0}); differs from the shared copy by design until promoted" -f $tgt) @{ sha256 = $dstHash; sourceSha256 = $srcHash; target = $tgt }
        $hashRows.Add([pscustomobject]@{ id = $Cfg.id; target = $tgt; source = $srcHash; target_hash = $dstHash; match = $false }); return
    }
    if ($dry) { Add-Result $Cfg.id 'PLAN' ("[DRYRUN] would write {0} (source sha256 {1}...)" -f $tgt, $srcHash.Substring(0, 12)); return }
    $bk = Backup-Target $tgt
    $dir = Split-Path -Parent $tgt
    if (-not (Test-Path -LiteralPath $dir)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
    Copy-Item -LiteralPath $src -Destination $tgt -Force
    $new = Get-FileSha256 $tgt
    if ($new -eq $srcHash) { Add-Result $Cfg.id 'CHANGED' ("wrote {0}; hash matches source; backup {1}" -f $tgt, $bk) @{ sha256 = $new; target = $tgt; backup = $bk } }
    else { Add-Result $Cfg.id 'FAIL' ("hash mismatch after copy to {0}" -f $tgt) }
    $hashRows.Add([pscustomobject]@{ id = $Cfg.id; target = $tgt; source = $srcHash; target_hash = $new; match = ($new -eq $srcHash) })
}

# ------------------------------------------------------------------ helpers: profile block
function Get-ProfileText {
    param([string]$Path)
    $bytes = [IO.File]::ReadAllBytes($Path)
    $hadBom = ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF)
    $start = 0; if ($hadBom) { $start = 3 }
    $strict = New-Object System.Text.UTF8Encoding($false, $true)
    $text = $strict.GetString($bytes, $start, $bytes.Length - $start)
    return [pscustomobject]@{ Text = $text; HadBom = $hadBom }
}

function Remove-ManagedBlock {
    param([string]$NormText)
    $rx = '(?s)' + [regex]::Escape($global:TKBlockBegin) + '.*?' + [regex]::Escape($global:TKBlockEnd) + '\n?'
    return [regex]::Replace($NormText, $rx, '')
}

function Get-ManagedBlock {
    param([string]$NormText)
    $rx = '(?s)' + [regex]::Escape($global:TKBlockBegin) + '.*?' + [regex]::Escape($global:TKBlockEnd)
    $mm = [regex]::Match($NormText, $rx)
    if ($mm.Success) { return $mm.Value }
    return $null
}

function Update-ProfileBlock {
    # Returns @{ Status; Detail; Final; Enc }. Never writes.
    param([string]$Path, [string]$BlockNorm)
    $exists = Test-Path -LiteralPath $Path
    $existingText = ''
    $hadBom = $false
    $eol = "`n"
    if ($exists) {
        try { $pt = Get-ProfileText $Path } catch { return @{ Status = 'MANUAL'; Detail = 'profile is not valid UTF-8; left untouched' } }
        $existingText = $pt.Text; $hadBom = $pt.HadBom
        if ($existingText.Contains("`r`n")) { $eol = "`r`n" }
    }
    $norm = $existingText.Replace("`r`n", "`n")
    $norm = Remove-ManagedBlock $norm
    $notes = @()
    # supersede single statements that the block now provides
    $errs = $null; $tok = $null
    $ast = [System.Management.Automation.Language.Parser]::ParseInput($norm, [ref]$tok, [ref]$errs)
    if ($errs -and $errs.Count -gt 0) { return @{ Status = 'MANUAL'; Detail = ("existing profile has {0} parse error(s) outside the managed block; left untouched" -f $errs.Count) } }
    $pats = @('starship\s+init\s+powershell', 'zoxide\s+init\s+powershell', 'Set-PsFzfOption', 'Import-Module\s+PSFzf', 'vscode-env', '\[Console\]::OutputEncoding\s*=', '\$OutputEncoding\s*=')
    $stmts = @()
    if ($ast.EndBlock) { $stmts = @($ast.EndBlock.Statements) }
    $toComment = @()
    foreach ($s in $stmts) {
        $t = $s.Extent.Text
        foreach ($p in $pats) { if ($t -match $p) { $toComment += $s; break } }
    }
    if ($toComment.Count -gt 0) {
        $lines = [System.Collections.ArrayList]@($norm -split "`n")
        $ranges = @($toComment | ForEach-Object { ,@($_.Extent.StartLineNumber, $_.Extent.EndLineNumber) })
        foreach ($s in $stmts) {
            if ($toComment -contains $s) { continue }
            foreach ($r in $ranges) {
                if ($s.Extent.StartLineNumber -le $r[1] -and $s.Extent.EndLineNumber -ge $r[0]) {
                    return @{ Status = 'MANUAL'; Detail = ("a superseded statement shares lines {0}-{1} with other code; edit the profile by hand and re-run" -f $r[0], $r[1]) }
                }
            }
        }
        foreach ($s in $toComment) {
            if ($s.Extent.Text.Length -gt 900) { return @{ Status = 'MANUAL'; Detail = ("statement at line {0} is large and overlaps the managed block; edit by hand" -f $s.Extent.StartLineNumber) } }
            for ($ln = $s.Extent.StartLineNumber; $ln -le $s.Extent.EndLineNumber; $ln++) {
                $lines[$ln - 1] = '# [toolkit-superseded] ' + $lines[$ln - 1]
            }
            $notes += ("lines {0}-{1} superseded" -f $s.Extent.StartLineNumber, $s.Extent.EndLineNumber)
        }
        $norm = ($lines -join "`n")
    }
    $body = $norm.TrimEnd("`n")
    $block = $BlockNorm.TrimEnd("`n") + "`n"
    $final = $block
    if ($body.Length -gt 0) { $final = $body + "`n`n" + $block }
    $e2 = $null; $t2 = $null
    [System.Management.Automation.Language.Parser]::ParseInput($final, [ref]$t2, [ref]$e2) | Out-Null
    if ($e2 -and $e2.Count -gt 0) { return @{ Status = 'MANUAL'; Detail = ("result would have {0} parse error(s); left untouched" -f $e2.Count) } }
    $finalEol = $final.Replace("`n", $eol)
    if ($exists -and ($finalEol -ceq $existingText)) { return @{ Status = 'UNCHANGED'; Detail = 'managed block already current'; Final = $finalEol; HadBom = $hadBom } }
    return @{ Status = 'CHANGED'; Detail = ($notes -join '; '); Final = $finalEol; HadBom = $hadBom }
}

function Apply-ProfileBlock {
    param($Cfg)
    $src = Join-Path $global:TK.Root $Cfg.source
    $tgt = Expand-ToolkitPath $Cfg.target $global:TK.Vault
    if ($TestProfileDir) {
        if ($Cfg.id -eq 'profile-ps5') { $tgt = Join-Path $TestProfileDir 'WindowsPowerShell\Microsoft.PowerShell_profile.ps1' }
        else { $tgt = Join-Path $TestProfileDir 'PowerShell\Microsoft.PowerShell_profile.ps1' }
    }
    $blockNorm = ([IO.File]::ReadAllText($src)).Replace("`r`n", "`n")
    if ((Get-SecretHitCount $blockNorm) -gt 0) { Add-Result $Cfg.id 'FAIL' 'block source matches a secret pattern; not written'; return }
    $blockHash = Get-TextSha256 (Get-ManagedBlock $blockNorm)
    $res = Update-ProfileBlock -Path $tgt -BlockNorm $blockNorm
    if ($res.Status -eq 'MANUAL') { Add-Result $Cfg.id 'MANUAL' ("{0}: {1}" -f $tgt, $res.Detail) @{ target = $tgt }; return }
    if ($res.Status -eq 'UNCHANGED') {
        Add-Result $Cfg.id 'UNCHANGED' ("{0}: {1}" -f $tgt, $res.Detail) @{ target = $tgt; blockSha256 = $blockHash }
        $hashRows.Add([pscustomobject]@{ id = $Cfg.id; target = $tgt; source = $blockHash; target_hash = $blockHash; match = $true }); return
    }
    if ($dry) { Add-Result $Cfg.id 'PLAN' ("[DRYRUN] would insert/refresh the managed block in {0} {1}" -f $tgt, $res.Detail) @{ target = $tgt }; return }
    $bk = Backup-Target $tgt
    $enc = New-Object System.Text.UTF8Encoding($res.HadBom)
    $dir = Split-Path -Parent $tgt
    if (-not (Test-Path -LiteralPath $dir)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
    [IO.File]::WriteAllText($tgt, $res.Final, $enc)
    $back = (Get-ProfileText $tgt).Text.Replace("`r`n", "`n")
    $got = Get-ManagedBlock $back
    $gotHash = $null; if ($got) { $gotHash = Get-TextSha256 $got }
    if ($gotHash -eq $blockHash) { Add-Result $Cfg.id 'CHANGED' ("block written to {0} {1}; backup {2}" -f $tgt, $res.Detail, $bk) @{ target = $tgt; blockSha256 = $gotHash; backup = $bk } }
    else { Add-Result $Cfg.id 'FAIL' ("block hash mismatch after writing {0}" -f $tgt) }
    $hashRows.Add([pscustomobject]@{ id = $Cfg.id; target = $tgt; source = $blockHash; target_hash = $gotHash; match = ($gotHash -eq $blockHash) })
}

# ------------------------------------------------------------------ helpers: terminal
function Merge-TerminalSettings {
    param($S, $F, [string]$UbuntuName)
    if (-not $S.profiles -or $S.profiles -is [System.Array]) { throw 'unsupported settings.json layout (profiles is not an object)' }
    Set-Prop $S 'defaultProfile' $F.defaultProfile
    if (-not $S.profiles.PSObject.Properties['defaults'] -or $null -eq $S.profiles.defaults) { Set-Prop $S.profiles 'defaults' ([pscustomobject]@{}) }
    $def = $S.profiles.defaults
    foreach ($p in $F.defaults.PSObject.Properties) {
        if ($p.Value -is [System.Management.Automation.PSCustomObject]) {
            if (-not $def.PSObject.Properties[$p.Name] -or $null -eq $def.($p.Name)) { Set-Prop $def $p.Name ([pscustomobject]@{}) }
            foreach ($q in $p.Value.PSObject.Properties) { Set-Prop $def.($p.Name) $q.Name $q.Value }
        } else { Set-Prop $def $p.Name $p.Value }
    }
    $schemes = @()
    if ($S.PSObject.Properties['schemes'] -and $S.schemes) { $schemes = @($S.schemes | Where-Object { $_.name -ne $F.scheme.name }) }
    Set-Prop $S 'schemes' (@($schemes) + @($F.scheme))
    $fIds = @($F.actions | ForEach-Object { $_.id })
    $fKeys = @($F.keybindings | ForEach-Object { ([string]$_.keys).ToLower() })
    $actions = @()
    if ($S.PSObject.Properties['actions'] -and $S.actions) { $actions = @($S.actions | Where-Object { $fIds -notcontains $_.id }) }
    Set-Prop $S 'actions' (@($actions) + @($F.actions))
    $kb = @()
    if ($S.PSObject.Properties['keybindings'] -and $S.keybindings) {
        $kb = @($S.keybindings | Where-Object { ($fIds -notcontains $_.id) -and ($fKeys -notcontains ([string]$_.keys).ToLower()) })
    }
    Set-Prop $S 'keybindings' (@($kb) + @($F.keybindings))
    $list = @($S.profiles.list)
    $guid = $F.powershellProfile.guid
    if (-not (@($list | Where-Object { $_.guid -ieq $guid }).Count)) { $list = $list + @($F.powershellProfile) }
    foreach ($p in $list) {
        if ($p.source -eq 'Microsoft.WSL' -and $p.name -match '^Ubuntu') { $p.name = $UbuntuName }
    }
    $S.profiles.list = $list
    return $S
}

function Apply-Terminal {
    param($Cfg)
    $frag = Get-Content -LiteralPath (Join-Path $global:TK.Root $Cfg.source) -Raw | ConvertFrom-Json
    $wtp = $TerminalSettingsPath
    if (-not $wtp) {
        $pkg = Get-ChildItem (Join-Path $env:LOCALAPPDATA 'Packages') -Filter 'Microsoft.WindowsTerminal_*' -Directory -ErrorAction SilentlyContinue | Select-Object -First 1
        if ($pkg) { $wtp = Join-Path $pkg.FullName 'LocalState\settings.json' }
    }
    if (-not $wtp -or -not (Test-Path -LiteralPath $wtp)) { Add-Result $Cfg.id 'WARN' 'Windows Terminal settings.json not found; open Windows Terminal once and re-run'; return }
    $raw = [IO.File]::ReadAllText($wtp)
    try { $orig = $raw | ConvertFrom-Json; $S = $raw | ConvertFrom-Json } catch { Add-Result $Cfg.id 'MANUAL' ("{0} is not strict JSON (comments?); not touched" -f $wtp); return }
    $ubuntu = $m.machines.$role.ubuntuProfileName
    try { $S = Merge-TerminalSettings -S $S -F $frag -UbuntuName $ubuntu } catch { Add-Result $Cfg.id 'MANUAL' ("{0}: {1}" -f $wtp, $_.Exception.Message); return }
    $j1 = ConvertTo-Json -InputObject $orig -Depth 30
    $j2 = ConvertTo-Json -InputObject $S -Depth 30
    if ($j1 -ceq $j2) { Add-Result $Cfg.id 'UNCHANGED' ("{0} already carries the fragment" -f $wtp) @{ target = $wtp }; return }
    if ($dry) {
        $prev = Join-Path $global:TK.ResultsDir ("terminal-settings-preview-" + $global:TK.Ts + ".json")
        Write-Utf8NoBom -Path $prev -Text ($j2 + "`n")
        Add-Result $Cfg.id 'PLAN' ("[DRYRUN] would merge scheme, defaults, actions, keybindings, pwsh profile and rename Ubuntu to '{0}' in {1}; preview: {2}" -f $ubuntu, $wtp, $prev) @{ target = $wtp }; return
    }
    $bk = Backup-Target $wtp
    Write-Utf8NoBom -Path $wtp -Text ($j2 + "`n")
    $chk = Get-Content -LiteralPath $wtp -Raw | ConvertFrom-Json
    $ok = ($chk.defaultProfile -eq $frag.defaultProfile) -and ($chk.profiles.defaults.font.face -eq $frag.defaults.font.face) -and ($chk.profiles.defaults.colorScheme -eq $frag.defaults.colorScheme) -and (@($chk.schemes | Where-Object { $_.name -eq $frag.scheme.name }).Count -eq 1)
    if ($ok) { Add-Result $Cfg.id 'CHANGED' ("merged into {0}; backup {1}" -f $wtp, $bk) @{ target = $wtp; sha256 = (Get-FileSha256 $wtp); backup = $bk } }
    else { Add-Result $Cfg.id 'FAIL' ("settings.json did not re-read as expected; restore from {0}" -f $bk) }
}

# ------------------------------------------------------------------ helpers: git and env
function Invoke-Git {
    param([string[]]$GitArgs)
    $git = Resolve-Cmd 'git'
    return (Invoke-Native -File $git -Arguments $GitArgs -TimeoutSec 60)
}

function Apply-GitSettings {
    if (-not (Resolve-Cmd 'git')) { Add-Result 'git-settings' 'FAIL' 'git not found'; return }
    $changed = @(); $same = 0
    foreach ($s in $m.gitSettings) {
        $cur = (Invoke-Git @('config', '--global', '--get', $s.key)).Output.Trim()
        if ($cur -eq $s.value) { $same++; continue }
        if ($dry) { $changed += ("{0}: '{1}' -> '{2}'" -f $s.key, $cur, $s.value); continue }
        $r = Invoke-Git @('config', '--global', $s.key, $s.value)
        if ($r.ExitCode -eq 0) { $changed += ("{0}: '{1}' -> '{2}'" -f $s.key, $cur, $s.value) } else { Add-Result ('git-' + $s.key) 'FAIL' ("git config exit {0}" -f $r.ExitCode) }
    }
    # credential helper (gh) for each host
    if (Resolve-Cmd 'gh') {
        foreach ($h in $m.gitCredentialHosts) {
            $key = 'credential.' + $h + '.helper'
            $cur = ((Invoke-Git @('config', '--global', '--get-all', $key)).Output -replace "`r", '').TrimEnd("`n")
            $want = "`n!gh auth git-credential"
            if ($cur -ceq $want) { $same++; continue }
            if ($dry) { $changed += ("{0}: would reset and set to gh auth git-credential" -f $key); continue }
            Invoke-Git @('config', '--global', '--unset-all', $key) | Out-Null
            Invoke-Git @('config', '--global', '--add', $key, '') | Out-Null
            Invoke-Git @('config', '--global', '--add', $key, '!gh auth git-credential') | Out-Null
            $changed += ("{0}: set to gh auth git-credential" -f $key)
        }
    } else { Add-Result 'git-credential' 'WARN' 'gh not installed; credential helper skipped' }
    # shared delta include
    $deltaTarget = Expand-ToolkitPath '%USERPROFILE%\.config\git\delta.gitconfig' $global:TK.Vault
    if ((Resolve-Cmd 'delta') -and (Test-Path -LiteralPath $deltaTarget)) {
        $inc = (Invoke-Git @('config', '--global', '--get-all', 'include.path')).Output
        if ($inc -notmatch [regex]::Escape($m.gitDeltaInclude)) {
            if ($dry) { $changed += 'include.path: would add the shared delta include' }
            else { Invoke-Git @('config', '--global', '--add', 'include.path', $m.gitDeltaInclude) | Out-Null; $changed += 'include.path: added the shared delta include' }
        } else { $same++ }
    } else { Add-Result 'git-delta-include' 'WARN' 'delta or its include file is missing; pager include skipped' }
    $verb = 'CHANGED'; if ($dry) { $verb = 'PLAN' }
    if ($changed.Count -gt 0) { Add-Result 'git-settings' $verb ("{0} setting(s) {1}; {2} already correct. {3}" -f $changed.Count, $(if ($dry) { 'would change' } else { 'changed' }), $same, ($changed -join ' | ')) }
    else { Add-Result 'git-settings' 'UNCHANGED' ("all {0} git settings already correct" -f $same) }
}

function Apply-Env {
    foreach ($e in $m.env.set) {
        $val = Expand-ToolkitPath $e.value $global:TK.Vault
        $cur = [Environment]::GetEnvironmentVariable($e.name, 'User')
        if ($cur -eq $val) { Add-Result ('env-' + $e.name) 'UNCHANGED' ("{0}={1}" -f $e.name, $val); continue }
        if ($dry) { Add-Result ('env-' + $e.name) 'PLAN' ("[DRYRUN] would set {0}={1} (was '{2}')" -f $e.name, $val, $cur); continue }
        [Environment]::SetEnvironmentVariable($e.name, $val, 'User')
        Set-Item -Path ('Env:' + $e.name) -Value $val
        Add-Result ('env-' + $e.name) 'CHANGED' ("{0}={1} (was '{2}')" -f $e.name, $val, $cur)
    }
    foreach ($e in $m.env.verify) {
        $v = [Environment]::GetEnvironmentVariable($e.name, 'User')
        if ($role -eq 'dell' -and $e.dell) {
            if ($v -eq $e.dell) { Add-Result ('envchk-' + $e.name) 'PASS' ("{0}={1} (Build 3, untouched)" -f $e.name, $v) } else { Add-Result ('envchk-' + $e.name) 'WARN' ("{0} is '{1}', expected '{2}' (not changed here)" -f $e.name, $v, $e.dell) }
        }
    }
}

function Apply-PathOrder {
    # Puts the preferred folder (the standalone uv in ~\.local\bin) first on the USER path, keeping the registry value type
    # and every other entry. The old value is saved to the backup folder first. Machine PATH is not touched here.
    param($Cfg)
    $want = [Environment]::ExpandEnvironmentVariables($Cfg.prefer)
    $key = [Microsoft.Win32.Registry]::CurrentUser.OpenSubKey('Environment', $true)
    try {
        $raw = [string]$key.GetValue('Path', '', [Microsoft.Win32.RegistryValueOptions]::DoNotExpandEnvironmentNames)
        $new = Get-PathWithFirst -RawPath $raw -Preferred $want
        if ($new -ceq $raw) { Add-Result $Cfg.id 'UNCHANGED' ("{0} is already first on the user PATH" -f $want); return }
        if ($dry) { Add-Result $Cfg.id 'PLAN' ("[DRYRUN] would move {0} to the front of the user PATH (all other entries kept in order)" -f $want); return }
        $base = $global:TK.BackupBase; if (-not $base) { $base = 'D:\Backup\Toolkit' }
        $dir = Join-Path $base $global:TK.Ts
        New-Item -ItemType Directory -Force -Path $dir | Out-Null
        $bk = Join-Path $dir 'user-path-before.txt'
        Write-Utf8NoBom -Path $bk -Text $raw
        $kind = $key.GetValueKind('Path')
        $key.SetValue('Path', $new, $kind)
        [Environment]::SetEnvironmentVariable('TOOLKIT_PATH_REFRESH', '1', 'User')
        [Environment]::SetEnvironmentVariable('TOOLKIT_PATH_REFRESH', $null, 'User')
        Update-SessionPath
        $chk = [string]$key.GetValue('Path', '', [Microsoft.Win32.RegistryValueOptions]::DoNotExpandEnvironmentNames)
        $first = ($chk -split ';' | Where-Object { $_ } | Select-Object -First 1)
        if ([Environment]::ExpandEnvironmentVariables($first).TrimEnd('\') -ieq $want.TrimEnd('\')) {
            Add-Result $Cfg.id 'CHANGED' ("{0} is now first on the user PATH; old value saved to {1}; open a new window to use it" -f $want, $bk) @{ backup = $bk }
        } else { Add-Result $Cfg.id 'FAIL' ("PATH did not re-read as expected; old value is in {0}" -f $bk) }
    } finally { $key.Close() }
}

# ------------------------------------------------------------------ run
try {
    foreach ($cfg in $m.configs) {
        if (-not (Test-Wanted $cfg.id)) { continue }
        try {
            switch ($cfg.kind) {
                'copy' { Apply-CopyConfig $cfg }
                'profile-block' { Apply-ProfileBlock $cfg }
                'terminal-merge' { Apply-Terminal $cfg }
                'git' { Apply-GitSettings }
                'path-order' { Apply-PathOrder $cfg }
            }
        } catch { Add-Result $cfg.id 'FAIL' ("exception: " + $_.Exception.Message) }
    }
    if (Test-Wanted 'env') { try { Apply-Env } catch { Add-Result 'env' 'FAIL' ("exception: " + $_.Exception.Message) } }
} catch {
    Add-Result 'apply-error' 'FAIL' $_.Exception.Message
}
Write-Host ''
Write-Host 'SHA-256 table (source vs target; identical means the hashes match)'
foreach ($h in $hashRows) { Write-Host ('{0,-14} match={1,-5} src={2}... dst={3}...' -f $h.id, $h.match, ([string]$h.source).Substring(0, 12), ([string]$h.target_hash).Substring(0, [math]::Min(12, ([string]$h.target_hash).Length))) }
Complete-Toolkit -Summary @{ hashTable = $hashRows.ToArray() }
