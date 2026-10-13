<#
99-verify.ps1 - compares the manifest with reality. Read-only except for its log, result JSON and (with -WriteLock) toolkit.lock.json.
Run in a NORMAL shell, ideally in a fresh window after 10 and 20. Statuses: PASS, FAIL, PENDING (waits for a gated step), DIFF (differs from the Dell lock), WARN, INFO.
  -WriteLock   Dell only: when there is no FAIL, record the verified versions and config hashes in toolkit.lock.json
Exit code 1 only when something FAILs.
#>
param([switch]$WriteLock, [ValidateSet('dell', 'acer')][string]$Machine)

. "$PSScriptRoot\_lib.ps1"
$ErrorActionPreference = 'Stop'
Initialize-Toolkit -Name '99-verify' -DryRun $false -Machine $Machine | Out-Null
$m = $global:TK.Manifest
$role = $global:TK.Role
$lock = Read-ToolkitLock
$lockOther = ($lock -and $lock.host -ne $global:TK.Host)
$lockTools = [ordered]@{}
$lockConfigs = [ordered]@{}
$python = $null

function Test-Section { param([string]$Name, [scriptblock]$Body) Write-Log ("--- " + $Name) 'STEP'; try { & $Body } catch { Add-Result ('error-' + $Name) 'FAIL' $_.Exception.Message } }

# ------------------------------------------------------------------ A tools
Test-Section 'A Tools versus manifest' {
    foreach ($t in $m.tools) {
        if ($t.policy -eq 'catalog-only') { continue }
        if (-not (Test-ToolOnMachine $t $role)) { continue }
        $st = Get-ToolState $t
        $ver = $st.version; if (-not $ver) { $ver = '-' }
        if ($t.policy -eq 'absent') {
            if ($st.installed) { Add-Result $t.id 'FAIL' ("present but must be absent (version {0})" -f $ver) } else { Add-Result $t.id 'PASS' 'absent as required' }
            continue
        }
        if ($t.policy -eq 'retire') {
            if ($st.installed) { Add-Result $t.id 'PENDING' ("still present ({0}); retire with: {1}" -f $ver, $t.retireCommand) @{ version = $st.version } } else { Add-Result $t.id 'PASS' 'retired (absent)' }
            continue
        }
        if (-not $st.installed) { Add-Result $t.id 'FAIL' ("not installed / not detected ({0})" -f $t.name); continue }
        $info = Get-InstallInfo $st.path
        $extra = @{ version = $st.version; path = $st.path; drive = $info.drive; sizeMB = $info.sizeMB }
        $notes = @()
        $status = 'PASS'
        if ($t.expect -and $st.version -and ($st.version -notmatch $t.expect)) { $status = 'FAIL'; $notes += ("version {0} does not match /{1}/" -f $st.version, $t.expect) }
        if ($t.expectMajor -and $st.version) {
            $maj = [int](($st.version -split '\.')[0])
            if ($maj -ne [int]$t.expectMajor) { $status = 'FAIL'; $notes += ("major {0}, expected {1}" -f $maj, $t.expectMajor) }
        }
        if ($t.id -eq 'uv-python' -and $st.version) { $notes += ("cpython {0}" -f $st.version) }
        if ($t.detect -eq 'psmodule') {
            if ($st.pwshPresent -and -not $st.version7) { $status = 'FAIL'; $notes += 'missing in PowerShell 7' }
            $notes += $st.detail
        }
        if ($lockOther -and $status -eq 'PASS') {
            $lv = Get-LockedVersion -Lock $lock -Id $t.id
            if ($lv -and $st.version -and ($lv -ne $st.version)) { $status = 'DIFF'; $notes += ("Dell lock has {0}" -f $lv) }
        }
        $dr = ''; if ($info.drive) { $dr = (' on {0}' -f $info.drive) }
        $sz = ''; if ($info.sizeMB) { $sz = (', {0} MB' -f $info.sizeMB) }
        $msg = ("version {0}{1}{2}" -f $ver, $dr, $sz)
        if ($notes.Count -gt 0) { $msg = $msg + '; ' + ($notes -join '; ') }
        Add-Result $t.id $status $msg $extra
        if ($status -in 'PASS', 'DIFF') {
            $lockTools[$t.id] = [ordered]@{ version = $st.version; policy = $t.policy; wingetId = $t.wingetId; path = $st.path; drive = $info.drive; sizeMB = $info.sizeMB }
        }
    }
    # uv must win on PATH once the Chocolatey Python is gone
    $uvAll = @(Resolve-CmdAll 'uv')
    $want = [Environment]::ExpandEnvironmentVariables('%USERPROFILE%\.local\bin\uv.exe')
    $pyTool = $m.tools | Where-Object { $_.id -eq 'python-choco' }
    $pyThere = $false
    if ($pyTool -and (Test-ToolOnMachine $pyTool $role)) { $pyThere = (Get-ToolState $pyTool).installed }
    if ($uvAll.Count -gt 0 -and ($uvAll[0] -ieq $want)) { Add-Result 'uv-path-first' 'PASS' 'standalone uv is the first uv on PATH' }
    elseif ($pyThere) { Add-Result 'uv-path-first' 'PENDING' ("first uv on PATH is {0}; wins until 04-admin-remove.ps1 -IncludePython retires Python" -f $uvAll[0]) }
    else { Add-Result 'uv-path-first' 'FAIL' ("first uv on PATH is '{0}', expected {1}" -f $(if ($uvAll.Count) { $uvAll[0] } else { '(none)' }), $want) }
    # junctions
    foreach ($t in $m.tools | Where-Object { $_.junction -and (Test-ToolOnMachine $_ $role) }) {
        $jp = Expand-ToolkitPath $t.junction.path $global:TK.Vault
        if (Test-Path -LiteralPath $jp) {
            $it = Get-Item -LiteralPath $jp -Force
            if ($it.Attributes -band [IO.FileAttributes]::ReparsePoint) { Add-Result ('junction-' + $t.id) 'PASS' ("{0} -> {1}" -f $jp, ($it.Target -join ';')) } else { Add-Result ('junction-' + $t.id) 'FAIL' ("{0} is not a junction" -f $jp) }
        } else { Add-Result ('junction-' + $t.id) 'FAIL' ("{0} missing" -f $jp) }
    }
}

# ------------------------------------------------------------------ B configs
Test-Section 'B Config hashes' {
    foreach ($cfg in $m.configs | Where-Object { $_.kind -eq 'copy' }) {
        $src = Join-Path $global:TK.Root $cfg.source
        $tgt = Expand-ToolkitPath $cfg.target $global:TK.Vault
        $sh = Get-FileSha256 $src; $th = Get-FileSha256 $tgt
        if ($cfg.requiresTool -and -not (Resolve-Cmd $cfg.requiresTool)) { Add-Result ('cfg-' + $cfg.id) 'FAIL' ("{0} not installed" -f $cfg.requiresTool); continue }
        if ($th -and $th -eq $sh) { Add-Result ('cfg-' + $cfg.id) 'PASS' ("{0} sha256 {1}... matches source" -f $tgt, $th.Substring(0, 12)) @{ sha256 = $th }; $lockConfigs[$cfg.id] = $th }
        elseif ($th -and $cfg.onExisting.$role -eq 'keep') { Add-Result ('cfg-' + $cfg.id) 'DIFF' ("{0} is this machine's own file (kept by design until promoted)" -f $tgt) @{ sha256 = $th; sourceSha256 = $sh } }
        elseif ($th) { Add-Result ('cfg-' + $cfg.id) 'FAIL' ("{0} differs from source ({1}... vs {2}...)" -f $tgt, $th.Substring(0, 12), $sh.Substring(0, 12)) }
        else { Add-Result ('cfg-' + $cfg.id) 'FAIL' ("{0} missing" -f $tgt) }
    }
    $blockSrc = ([IO.File]::ReadAllText((Join-Path $global:TK.Root 'configs\powershell\managed-block.ps1'))).Replace("`r`n", "`n")
    $blockHash = Get-TextSha256 ($blockSrc.Substring($blockSrc.IndexOf($global:TKBlockBegin)).TrimEnd("`n"))
    foreach ($cfg in $m.configs | Where-Object { $_.kind -eq 'profile-block' }) {
        $tgt = Expand-ToolkitPath $cfg.target $global:TK.Vault
        if (-not (Test-Path -LiteralPath $tgt)) { Add-Result ('cfg-' + $cfg.id) 'FAIL' ("{0} missing" -f $tgt); continue }
        $txt = ([IO.File]::ReadAllText($tgt)).Replace("`r`n", "`n")
        $rx = '(?s)' + [regex]::Escape($global:TKBlockBegin) + '.*?' + [regex]::Escape($global:TKBlockEnd)
        $mm = [regex]::Match($txt, $rx)
        $errs = $null; $tok = $null
        [System.Management.Automation.Language.Parser]::ParseInput($txt, [ref]$tok, [ref]$errs) | Out-Null
        $n = 0; if ($errs) { $n = $errs.Count }
        $initLines = @($txt -split "`n" | Where-Object { $_ -match 'starship\s+init\s+powershell' -and $_ -notmatch '^\s*#' }).Count
        if ($mm.Success -and ((Get-TextSha256 $mm.Value) -eq $blockHash) -and $n -eq 0 -and $initLines -eq 1) { Add-Result ('cfg-' + $cfg.id) 'PASS' ("{0}: block hash matches, parses clean, one starship init" -f $tgt) @{ blockSha256 = $blockHash }; $lockConfigs[$cfg.id] = $blockHash }
        else { Add-Result ('cfg-' + $cfg.id) 'FAIL' ("{0}: block present={1}, hash ok={2}, parse errors={3}, active starship init lines={4}" -f $tgt, $mm.Success, ($mm.Success -and ((Get-TextSha256 $mm.Value) -eq $blockHash)), $n, $initLines) }
    }
}

Test-Section 'B2 User PATH order' {
    $po = $m.configs | Where-Object { $_.kind -eq 'path-order' } | Select-Object -First 1
    if ($po) {
        $want = [Environment]::ExpandEnvironmentVariables($po.prefer)
        $rawUser = [string][Microsoft.Win32.Registry]::CurrentUser.OpenSubKey('Environment').GetValue('Path', '', [Microsoft.Win32.RegistryValueOptions]::DoNotExpandEnvironmentNames)
        $first = ($rawUser -split ';' | Where-Object { $_ } | Select-Object -First 1)
        if ($first -and ([Environment]::ExpandEnvironmentVariables($first).TrimEnd('\') -ieq $want.TrimEnd('\'))) { Add-Result 'cfg-path-order' 'PASS' ("{0} is first on the user PATH" -f $want) }
        else { Add-Result 'cfg-path-order' 'FAIL' ("first user PATH entry is '{0}', expected {1}; run 20-apply-configs.ps1" -f $first, $want) }
    }
}

Test-Section 'C Terminal, git, environment' {
    # terminal
    $pkg = Get-ChildItem (Join-Path $env:LOCALAPPDATA 'Packages') -Filter 'Microsoft.WindowsTerminal_*' -Directory -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($pkg) {
        $wtp = Join-Path $pkg.FullName 'LocalState\settings.json'
        try {
            $s = Get-Content -LiteralPath $wtp -Raw | ConvertFrom-Json
            $frag = Get-Content -LiteralPath (Join-Path $global:TK.Root 'configs\terminal\toolkit-fragment.json') -Raw | ConvertFrom-Json
            $checks = @(
                @('default profile is PowerShell 7', ($s.defaultProfile -ieq $frag.defaultProfile)),
                @(('font face ' + $frag.defaults.font.face), ($s.profiles.defaults.font.face -eq $frag.defaults.font.face)),
                @(('scheme ' + $frag.defaults.colorScheme + ' applied'), ($s.profiles.defaults.colorScheme -eq $frag.defaults.colorScheme)),
                @('extra scheme defined once', (@($s.schemes | Where-Object { $_.name -eq $frag.scheme.name }).Count -eq 1)),
                @('opacity 85, acrylic, cursor #98C379', (($s.profiles.defaults.opacity -eq 85) -and ($s.profiles.defaults.useAcrylic -eq $true) -and ($s.profiles.defaults.cursorColor -eq '#98C379'))),
                @('keybindings ctrl+c ctrl+v ctrl+shift+f alt+shift+d', (@($s.keybindings | Where-Object { $_.keys -in 'ctrl+c', 'ctrl+v', 'ctrl+shift+f', 'alt+shift+d' }).Count -ge 4)),
                @('pwsh profile entry present', (@($s.profiles.list | Where-Object { $_.guid -ieq $frag.powershellProfile.guid }).Count -ge 1)),
                @(("Ubuntu profile named '{0}'" -f $m.machines.$role.ubuntuProfileName), (@($s.profiles.list | Where-Object { $_.name -eq $m.machines.$role.ubuntuProfileName }).Count -ge 1))
            )
            foreach ($c in $checks) { if ($c[1]) { Add-Result ('wt-' + ($c[0] -replace '[^A-Za-z0-9]+', '-').ToLower().Trim('-')) 'PASS' $c[0] } else { Add-Result ('wt-' + ($c[0] -replace '[^A-Za-z0-9]+', '-').ToLower().Trim('-')) 'FAIL' $c[0] } }
            $lockConfigs['terminal'] = Get-FileSha256 $wtp
        } catch { Add-Result 'wt-settings' 'FAIL' ("settings.json unreadable: " + $_.Exception.Message) }
    } else { Add-Result 'wt-settings' 'FAIL' 'Windows Terminal package not found' }
    # font files + family (fresh process)
    $fontTool = $m.tools | Where-Object { $_.id -eq 'iosevkaterm-nfm' }
    foreach ($fam in @($m.pins.font.baseFamily, $m.pins.font.family)) { if (Test-FontFamily $fam) { Add-Result ('font-family-' + ($fam -replace ' ', '-')) 'PASS' ("family '{0}' registered (seen by a fresh process)" -f $fam) } else { Add-Result ('font-family-' + ($fam -replace ' ', '-')) 'FAIL' ("family '{0}' not registered; sign out/in once, then re-run" -f $fam) } }
    # git
    $git = Resolve-Cmd 'git'
    if ($git) {
        foreach ($s in $m.gitSettings) {
            $cur = (Invoke-Native -File $git -Arguments @('config', '--global', '--get', $s.key) -TimeoutSec 30).Output.Trim()
            if ($cur -eq $s.value) { Add-Result ('git-' + $s.key) 'PASS' ("{0}={1}" -f $s.key, $cur) } else { Add-Result ('git-' + $s.key) 'FAIL' ("{0} is '{1}', expected '{2}'" -f $s.key, $cur, $s.value) }
        }
        foreach ($h in $m.gitCredentialHosts) {
            $key = 'credential.' + $h + '.helper'
            $cur = ((Invoke-Native -File $git -Arguments @('config', '--global', '--get-all', $key) -TimeoutSec 30).Output -replace "`r", '').TrimEnd("`n")
            if ($cur -ceq "`n!gh auth git-credential") { Add-Result ('git-cred-' + $h) 'PASS' ("{0} uses gh auth git-credential" -f $h) } else { Add-Result ('git-cred-' + $h) 'FAIL' ("{0} helper not set to gh" -f $h) }
        }
        $inc = (Invoke-Native -File $git -Arguments @('config', '--global', '--get-all', 'include.path') -TimeoutSec 30).Output
        if ($inc -match [regex]::Escape($m.gitDeltaInclude)) { Add-Result 'git-delta-include' 'PASS' 'shared delta include is active' } else { Add-Result 'git-delta-include' 'FAIL' 'shared delta include missing' }
        $pager = (Invoke-Native -File $git -Arguments @('config', '--includes', '--global', '--get', 'core.pager') -TimeoutSec 30).Output.Trim()
        if ($pager -eq 'delta') { Add-Result 'git-pager' 'PASS' 'core.pager=delta' } else { Add-Result 'git-pager' 'FAIL' ("core.pager is '{0}'" -f $pager) }
    }
    $gh = Resolve-Cmd 'gh'
    if ($gh) {
        $r = Invoke-Native -File $gh -Arguments @('auth', 'status') -TimeoutSec 40
        if ($r.ExitCode -eq 0) { Add-Result 'gh-auth' 'PASS' 'gh is logged in (details not printed)' } else { Add-Result 'gh-auth' 'WARN' 'gh is not logged in; run: gh auth login' }
    }
    # environment variables
    foreach ($e in $m.env.set) {
        $want = Expand-ToolkitPath $e.value $global:TK.Vault
        $cur = [Environment]::GetEnvironmentVariable($e.name, 'User')
        if ($cur -eq $want) { Add-Result ('env-' + $e.name) 'PASS' ("{0}={1}" -f $e.name, $cur) } else { Add-Result ('env-' + $e.name) 'FAIL' ("{0} is '{1}', expected '{2}'" -f $e.name, $cur, $want) }
    }
    foreach ($e in $m.env.verify) {
        $cur = [Environment]::GetEnvironmentVariable($e.name, 'User')
        if ($role -eq 'dell' -and $e.dell) {
            if ($cur -eq $e.dell) { Add-Result ('env-' + $e.name) 'PASS' ("{0}={1}" -f $e.name, $cur) } else { Add-Result ('env-' + $e.name) 'FAIL' ("{0} is '{1}', expected '{2}'" -f $e.name, $cur, $e.dell) }
        } else {
            $shown = $cur; if (-not $shown) { $shown = '(unset)' }
            Add-Result ('env-' + $e.name) 'INFO' ("{0}={1} (Acer: reported only)" -f $e.name, $shown)
        }
    }
    if ($role -eq 'dell') {
        $npm = Resolve-Cmd 'npm'
        if ($npm) {
            $c = (Invoke-Native -File $npm -Arguments @('config', 'get', 'cache') -TimeoutSec 60).Output.Trim()
            if ($c -like 'D:\*') { Add-Result 'npm-cache' 'PASS' ("npm cache {0}" -f $c) } else { Add-Result 'npm-cache' 'FAIL' ("npm cache is {0}, expected a D: path" -f $c) }
        }
    }
}

# ------------------------------------------------------------------ D live behaviour
Test-Section 'D Shells, Starship, tools in a fresh process' {
    $probe = "'LOADED:' + [bool]`$global:ToolkitStarshipLoaded + ':' + [bool]`$global:ToolkitZoxideLoaded + ':' + `$env:STARSHIP_CONFIG"
    $editions = @(@{ n = 'powershell-5.1'; exe = (Get-Command powershell.exe).Source })
    $pw = Resolve-Cmd 'pwsh'
    if ($pw) { $editions += @{ n = 'pwsh-7'; exe = $pw } } else { Add-Result 'shell-pwsh-7' 'FAIL' 'pwsh not found' }
    foreach ($ed in $editions) {
        $sw = [Diagnostics.Stopwatch]::StartNew()
        $r = Invoke-PSCode -Code $probe -Exe $ed.exe -TimeoutSec 90
        $sw.Stop()
        $ms = [int]$sw.ElapsedMilliseconds
        $loaded = ($r.Output -match 'LOADED:True:True:')
        $errTxt = (ConvertTo-Ascii $r.Error).Trim()
        if ($loaded -and -not $errTxt) { Add-Result ('shell-' + $ed.n) 'PASS' ("profile loads; Starship and zoxide initialised; startup {0} ms" -f $ms) @{ startupMs = $ms } }
        elseif ($loaded) { Add-Result ('shell-' + $ed.n) 'WARN' ("profile loads but wrote to stderr: {0}" -f $errTxt.Substring(0, [math]::Min(160, $errTxt.Length))) @{ startupMs = $ms } }
        else { Add-Result ('shell-' + $ed.n) 'FAIL' ("profile did not initialise Starship/zoxide. output='{0}' error='{1}'" -f (ConvertTo-Ascii $r.Output).Trim(), $errTxt.Substring(0, [math]::Min(160, $errTxt.Length))) }
        if ($ms -gt 4000) { Add-Result ('startup-' + $ed.n) 'WARN' ("startup {0} ms is slow (budget 4000)" -f $ms) }
    }
    $sx = Resolve-Cmd 'starship'
    if ($sx) {
        $cfg = [Environment]::GetEnvironmentVariable('STARSHIP_CONFIG', 'User')
        $r = Invoke-Native -File $sx -Arguments @('print-config') -TimeoutSec 40 -Env @{ STARSHIP_CONFIG = $cfg }
        if ($r.ExitCode -eq 0 -and $r.Output.Length -gt 100) { Add-Result 'starship-config' 'PASS' 'starship print-config parses the shared config' } else { Add-Result 'starship-config' 'FAIL' ("print-config exit {0}: {1}" -f $r.ExitCode, (ConvertTo-Ascii $r.Error).Trim()) }
        $r2 = Invoke-Native -File $sx -Arguments @('prompt') -TimeoutSec 40 -Env @{ STARSHIP_CONFIG = $cfg }
        if ($r2.ExitCode -eq 0 -and $r2.Output.Length -gt 5) { Add-Result 'starship-render' 'PASS' ("starship prompt rendered {0} characters" -f $r2.Output.Length) } else { Add-Result 'starship-render' 'FAIL' ("prompt exit {0}" -f $r2.ExitCode) }
    } else { Add-Result 'starship-render' 'FAIL' 'starship not found' }
    $zx = Resolve-Cmd 'zoxide'
    if ($zx) {
        $r = Invoke-Native -File $zx -Arguments @('init', 'powershell') -TimeoutSec 30
        if ($r.ExitCode -eq 0 -and $r.Output.Length -gt 50) { Add-Result 'zoxide-init' 'PASS' 'zoxide init powershell works' } else { Add-Result 'zoxide-init' 'FAIL' 'zoxide init failed' }
    }
    # Ollama: who answers on 11434 (information only)
    try {
        $o = Invoke-RestMethod -Uri 'http://127.0.0.1:11434/api/version' -TimeoutSec 5
        Add-Result 'ollama-port' 'INFO' ("port 11434 answers with server version {0} (the WSL Ollama on the Dell until Build 5 decides)" -f $o.version)
    } catch { Add-Result 'ollama-port' 'INFO' 'nothing answers on 127.0.0.1:11434' }
}

# ------------------------------------------------------------------ E MCP launch commands
Test-Section 'E MCP launch commands (names only)' {
    $inv = Get-McpInventory
    $seen = 0
    foreach ($r in $inv) {
        $id = 'mcp-' + $r.file + '-' + $r.name
        if ($r.name -like '(*') { Add-Result $id 'INFO' $r.note; continue }
        $seen++
        if (-not $r.command) { Add-Result $id 'INFO' $r.note @{ purpose = $r.purpose }; continue }
        if ($r.resolves) { Add-Result $id 'PASS' ("command '{0}' resolves" -f $r.command) @{ command = $r.command; purpose = $r.purpose } }
        else { Add-Result $id 'WARN' ("command '{0}' does not resolve" -f $r.command) @{ command = $r.command } }
    }
    Add-Result 'mcp-total' 'INFO' ("{0} server entries inspected (names and command names only; args, env and urls are never read into output)" -f $seen)
}

# ------------------------------------------------------------------ lock
$failCount = @($global:TK.Items | Where-Object { $_.status -eq 'FAIL' }).Count
if ($WriteLock) {
    if ($role -ne 'dell') { Add-Result 'lock-write' 'WARN' 'lock is written on the Dell only; skipped' }
    elseif ($failCount -gt 0) { Add-Result 'lock-write' 'FAIL' ("not written: {0} check(s) failed" -f $failCount) }
    else {
        $obj = [ordered]@{ schema = 1; created = (Get-Date).ToString('s'); host = $global:TK.Host; machine = $role; manifestSha256 = $global:TK.ManifestHash; tools = $lockTools; configs = $lockConfigs }
        $lp = Join-Path $global:TK.Root 'toolkit.lock.json'
        Write-Utf8NoBom -Path $lp -Text ((ConvertTo-Json -InputObject ([pscustomobject]$obj) -Depth 8) + "`n")
        Add-Result 'lock-write' 'PASS' ("wrote {0} with {1} tools and {2} config hashes" -f $lp, $lockTools.Count, $lockConfigs.Count)
    }
}
Complete-Toolkit
