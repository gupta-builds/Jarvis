# _lib.ps1 - shared helpers for the Windows Toolkit scripts.
# ASCII only. Works in Windows PowerShell 5.1 and PowerShell 7. Dot-source it:  . "$PSScriptRoot\_lib.ps1"
# No ternary, no &&, no 2>&1 on native commands (they go through Invoke-Native).

$global:TKLibDir = $PSScriptRoot
$global:TK = $null
try { [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12 } catch { }
$global:TKBlockBegin = '# >>> TOOLKIT MANAGED BLOCK (Build 4) >>>'
$global:TKBlockEnd = '# <<< TOOLKIT MANAGED BLOCK (Build 4) <<<'
$global:TKUtf8NoBom = New-Object System.Text.UTF8Encoding($false)
$global:TKGenericVersion = '(\d+\.\d+(?:\.\d+)*)'
$global:TKSecretPatterns = @(
    'AKIA[0-9A-Z]{16}',
    'gh[pousr]_[A-Za-z0-9]{30,}',
    'github_pat_[A-Za-z0-9_]{30,}',
    'sk-[A-Za-z0-9]{20,}',
    'xox[baprs]-[A-Za-z0-9-]{10,}',
    '-----BEGIN[ A-Z]*PRIVATE KEY-----',
    'AIza[0-9A-Za-z\-_]{35}',
    'ya29\.[0-9A-Za-z\-_]+',
    '(?i)\b(api[_-]?key|secret|passwd|password)\b\s*[=:]\s*[''"]?[A-Za-z0-9/_\-\.]{8,}',
    '(?i)Bearer\s+[A-Za-z0-9\-_\.]{15,}'
)

# ---------------------------------------------------------------- basics
function Test-IsAdmin {
    $id = [Security.Principal.WindowsIdentity]::GetCurrent()
    return ([Security.Principal.WindowsPrincipal]$id).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

function ConvertTo-Ascii {
    param([string]$Text)
    if ($null -eq $Text) { return '' }
    return ([regex]::Replace($Text, '[^\x20-\x7E\r\n\t]', '?'))
}

function Expand-ToolkitPath {
    param([string]$Path, [string]$VaultRoot)
    if (-not $Path) { return $Path }
    $p = $Path
    if ($p -match '\{MyDocuments\}') { $p = $p.Replace('{MyDocuments}', [Environment]::GetFolderPath('MyDocuments')) }
    if ($p -match '\{vaultRoot\}') { $p = $p.Replace('{vaultRoot}', $VaultRoot) }
    return [Environment]::ExpandEnvironmentVariables($p)
}

function Update-SessionPath {
    $m = [Environment]::ExpandEnvironmentVariables([string][Environment]::GetEnvironmentVariable('Path', 'Machine'))
    $u = [Environment]::ExpandEnvironmentVariables([string][Environment]::GetEnvironmentVariable('Path', 'User'))
    $env:Path = (($m, $u) | Where-Object { $_ }) -join ';'
}

function Read-JsonLoose {
    param([string]$Path)
    Add-Type -AssemblyName System.Web.Extensions
    $ser = New-Object System.Web.Script.Serialization.JavaScriptSerializer
    $ser.MaxJsonLength = [int]::MaxValue
    $ser.RecursionLimit = 200
    return $ser.DeserializeObject([IO.File]::ReadAllText($Path))
}

function Write-Utf8NoBom {
    param([string]$Path, [string]$Text, [switch]$KeepEol)
    $dir = Split-Path -Parent $Path
    if ($dir -and -not (Test-Path -LiteralPath $dir)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
    $t = $Text
    if (-not $KeepEol) { $t = $t.Replace("`r`n", "`n") }
    [IO.File]::WriteAllText($Path, $t, $global:TKUtf8NoBom)
}

function Get-FileSha256 {
    param([string]$Path)
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) { return $null }
    return (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToUpper()
}

function Get-TextSha256 {
    param([string]$Text)
    $sha = [Security.Cryptography.SHA256]::Create()
    $bytes = $global:TKUtf8NoBom.GetBytes($Text)
    return (($sha.ComputeHash($bytes) | ForEach-Object { $_.ToString('X2') }) -join '')
}

function Get-SecretHitCount {
    param([string]$Text)
    $n = 0
    if (-not $Text) { return 0 }
    foreach ($p in $global:TKSecretPatterns) { if ($Text -match $p) { $n++ } }
    return $n
}

# ---------------------------------------------------------------- machine and vault
function Find-VaultRoot {
    $cands = New-Object System.Collections.Generic.List[string]
    if ($env:TOOLKIT_VAULT_ROOT) { $cands.Add($env:TOOLKIT_VAULT_ROOT) }
    $u = [Environment]::GetEnvironmentVariable('TOOLKIT_VAULT_ROOT', 'User')
    if ($u) { $cands.Add($u) }
    $d = $global:TKLibDir
    for ($i = 0; $i -lt 10 -and $d; $i++) {
        $cands.Add($d)
        $d = Split-Path -Parent $d
    }
    $cands.Add('D:\Users\_Anant\10_Areas\Documents\Jarvis')
    $cands.Add('D:\_Anant\20_Progress\Documents\Jarvis')
    try { $cands.Add((Join-Path ([Environment]::GetFolderPath('MyDocuments')) 'Jarvis')) } catch { }
    foreach ($c in $cands) {
        if ($c -and (Test-Path -LiteralPath (Join-Path $c 'AGENTS.md'))) { return $c }
    }
    return $null
}

function Get-MachineRole {
    param($Manifest, [string]$VaultRoot, [string]$Override)
    if ($Override) { return $Override }
    foreach ($name in 'dell', 'acer') {
        $mv = $Manifest.machines.$name.vaultRoot
        if ($mv -and $VaultRoot -and ($VaultRoot -ieq $mv)) { return $name }
    }
    if ($env:COMPUTERNAME -ieq $Manifest.machines.dell.computerName) { return 'dell' }
    return $null
}

function Test-ToolOnMachine {
    param($Tool, [string]$Role)
    return (@($Tool.machines) -contains $Role)
}

# ---------------------------------------------------------------- init, log, results
function Initialize-Toolkit {
    param([Parameter(Mandatory)][string]$Name, [bool]$DryRun = $false, [string]$Machine)
    $root = Split-Path -Parent $global:TKLibDir
    $manifestPath = Join-Path $root 'toolkit.json'
    if (-not (Test-Path -LiteralPath $manifestPath)) { throw "toolkit.json not found at $manifestPath" }
    $manifest = Get-Content -LiteralPath $manifestPath -Raw | ConvertFrom-Json
    $vault = Find-VaultRoot
    $role = Get-MachineRole -Manifest $manifest -VaultRoot $vault -Override $Machine
    if (-not $role) { throw 'Cannot tell which laptop this is. Re-run with -Machine dell or -Machine acer.' }
    $logDir = 'D:\WSL\ops\windows\logs'
    try { New-Item -ItemType Directory -Force -Path $logDir | Out-Null } catch { $logDir = $env:TEMP }
    $ts = Get-Date -Format 'yyyyMMdd-HHmmss'
    $resDir = Join-Path (Join-Path $root 'results') $env:COMPUTERNAME
    New-Item -ItemType Directory -Force -Path $resDir | Out-Null
    $global:TK = @{
        Name = $Name; Root = $root; ManifestPath = $manifestPath; Manifest = $manifest
        Vault = $vault; Role = $role; Host = $env:COMPUTERNAME; Ts = $ts; DryRun = $DryRun
        LogFile = (Join-Path $logDir ("toolkit-{0}-{1}.log" -f $Name, $ts))
        ResultsDir = $resDir; Items = (New-Object System.Collections.Generic.List[object])
        Started = Get-Date; Backups = (New-Object System.Collections.Generic.List[object])
        ManifestHash = (Get-FileSha256 $manifestPath)
    }
    Update-SessionPath
    Write-Log ("=== {0} on {1} ({2}) role={3} dryRun={4} admin={5}" -f $Name, $env:COMPUTERNAME, $manifest.machines.$role.label, $role, $DryRun, (Test-IsAdmin)) 'STEP'
    Write-Log ("Toolkit root: {0}" -f $root)
    Write-Log ("Vault root:   {0}" -f $vault)
    Write-Log ("Log file:     {0}" -f $global:TK.LogFile)
    if ($DryRun) { Write-Log '*** DRY RUN: nothing will be changed ***' 'WARN' }
    return $global:TK
}

function Write-Log {
    param([string]$Message, [string]$Level = 'INFO')
    $m = ConvertTo-Ascii $Message
    $line = ('{0} [{1}] {2}' -f (Get-Date -Format 'HH:mm:ss'), $Level, $m)
    $color = 'Gray'
    if ($Level -eq 'ERROR') { $color = 'Red' }
    elseif ($Level -eq 'WARN') { $color = 'Yellow' }
    elseif ($Level -eq 'OK') { $color = 'Green' }
    elseif ($Level -eq 'STEP') { $color = 'Cyan' }
    Write-Host $line -ForegroundColor $color
    if ($global:TK -and $global:TK.LogFile) {
        try { [IO.File]::AppendAllText($global:TK.LogFile, $line + [Environment]::NewLine, $global:TKUtf8NoBom) } catch { }
    }
}

function Add-Result {
    param([string]$Id, [string]$Status, [string]$Detail = '', [hashtable]$Extra)
    $o = [ordered]@{ id = $Id; status = $Status; detail = (ConvertTo-Ascii $Detail) }
    if ($Extra) { foreach ($k in $Extra.Keys) { $o[$k] = $Extra[$k] } }
    $global:TK.Items.Add([pscustomobject]$o)
    $lvl = 'INFO'
    if ($Status -eq 'FAIL') { $lvl = 'ERROR' }
    elseif ($Status -in 'WARN', 'DIFF', 'MANUAL', 'PENDING') { $lvl = 'WARN' }
    elseif ($Status -in 'PASS', 'OK', 'INSTALLED', 'UPGRADED', 'CHANGED', 'UNCHANGED') { $lvl = 'OK' }
    Write-Log ("{0,-8} {1,-22} {2}" -f $Status, $Id, $Detail) $lvl
}

function Complete-Toolkit {
    param([hashtable]$Summary)
    $items = $global:TK.Items
    $counts = @{}
    foreach ($i in $items) { if ($counts.ContainsKey($i.status)) { $counts[$i.status]++ } else { $counts[$i.status] = 1 } }
    Write-Host ''
    Write-Host ('{0,-24} {1,-9} {2}' -f 'ID', 'STATUS', 'DETAIL')
    foreach ($i in $items) {
        $d = [string]$i.detail
        if ($d.Length -gt 110) { $d = $d.Substring(0, 107) + '...' }
        Write-Host ('{0,-24} {1,-9} {2}' -f $i.id, $i.status, $d)
    }
    Write-Host ''
    $cs = ($counts.Keys | Sort-Object | ForEach-Object { '{0}={1}' -f $_, $counts[$_] }) -join '  '
    Write-Log ("SUMMARY: {0}" -f $cs) 'STEP'
    $fails = 0
    if ($counts.ContainsKey('FAIL')) { $fails = $counts['FAIL'] }
    $res = [ordered]@{
        script = $global:TK.Name; host = $global:TK.Host; machine = $global:TK.Role; dryRun = $global:TK.DryRun
        started = $global:TK.Started.ToString('s'); finished = (Get-Date).ToString('s')
        admin = (Test-IsAdmin); manifestSha256 = $global:TK.ManifestHash; vaultRoot = $global:TK.Vault
        log = $global:TK.LogFile; counts = $counts; items = $items.ToArray()
    }
    if ($Summary) { foreach ($k in $Summary.Keys) { $res[$k] = $Summary[$k] } }
    $json = ConvertTo-Json -InputObject ([pscustomobject]$res) -Depth 12
    $stamp = Join-Path $global:TK.ResultsDir ("{0}-{1}.json" -f $global:TK.Name, $global:TK.Ts)
    $latest = Join-Path $global:TK.ResultsDir ("{0}-latest.json" -f $global:TK.Name)
    if ($global:TK.DryRun) {
        $stamp = Join-Path $global:TK.ResultsDir ("{0}-dryrun-{1}.json" -f $global:TK.Name, $global:TK.Ts)
        $latest = Join-Path $global:TK.ResultsDir ("{0}-dryrun-latest.json" -f $global:TK.Name)
    }
    Write-Utf8NoBom -Path $stamp -Text $json
    Write-Utf8NoBom -Path $latest -Text $json
    Write-Log ("Result JSON: {0}" -f $stamp)
    if ($fails -gt 0) { Write-Log ("{0} required failure(s). Exit code 1." -f $fails) 'ERROR'; exit 1 }
    Write-Log 'No required failures. Exit code 0.' 'OK'
    exit 0
}

# ---------------------------------------------------------------- native commands
function Format-NativeArg {
    param([string]$A)
    if ($null -eq $A) { return '""' }
    if ($A -eq '') { return '""' }
    if ($A -notmatch '[\s"]') { return $A }
    return '"' + $A.Replace('"', '\"') + '"'
}

function Invoke-Native {
    param([string]$File, [string[]]$Arguments = @(), [int]$TimeoutSec = 120, [hashtable]$Env)
    $ext = [IO.Path]::GetExtension($File).ToLower()
    $args2 = @($Arguments)
    $exe = $File
    if ($ext -eq '.ps1') {
        $exe = (Get-Command powershell.exe).Source
        $args2 = @('-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', $File) + @($Arguments)
    }
    $psi = New-Object System.Diagnostics.ProcessStartInfo
    $psi.FileName = $exe
    $psi.Arguments = (($args2 | ForEach-Object { Format-NativeArg $_ }) -join ' ')
    $psi.UseShellExecute = $false
    $psi.RedirectStandardOutput = $true
    $psi.RedirectStandardError = $true
    $psi.RedirectStandardInput = $true
    $psi.CreateNoWindow = $true
    $psi.StandardOutputEncoding = [Text.Encoding]::UTF8
    $psi.StandardErrorEncoding = [Text.Encoding]::UTF8
    if ($Env) { foreach ($k in $Env.Keys) { $psi.EnvironmentVariables[$k] = [string]$Env[$k] } }
    try {
        $p = [System.Diagnostics.Process]::Start($psi)
    } catch {
        return [pscustomobject]@{ ExitCode = -2; Output = ''; Error = $_.Exception.Message; TimedOut = $false }
    }
    try { $p.StandardInput.Close() } catch { }
    $outTask = $p.StandardOutput.ReadToEndAsync()
    $errTask = $p.StandardError.ReadToEndAsync()
    if (-not $p.WaitForExit($TimeoutSec * 1000)) {
        try { $p.Kill() } catch { }
        return [pscustomobject]@{ ExitCode = -1; Output = ''; Error = 'timeout'; TimedOut = $true }
    }
    $p.WaitForExit()
    return [pscustomobject]@{ ExitCode = $p.ExitCode; Output = $outTask.Result; Error = $errTask.Result; TimedOut = $false }
}

function Invoke-PSCode {
    # Runs code in a fresh PowerShell via -EncodedCommand. $Exe defaults to Windows PowerShell 5.1.
    # With redirected streams PowerShell wraps progress in CLIXML on stderr; that is stripped, real error text is kept.
    param([string]$Code, [int]$TimeoutSec = 90, [switch]$NoProfile, [string]$Exe)
    $full = '$ProgressPreference = ''SilentlyContinue''; ' + $Code
    $b64 = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($full))
    $e = $Exe
    if (-not $e) { $e = (Get-Command powershell.exe).Source }
    $a = @('-NoLogo', '-NonInteractive')
    if ($NoProfile) { $a += '-NoProfile' }
    $a += @('-EncodedCommand', $b64)
    $r = Invoke-Native -File $e -Arguments $a -TimeoutSec $TimeoutSec
    $err = [string]$r.Error
    if ($err -match '^\s*#< CLIXML') {
        $msgs = @()
        foreach ($mm in [regex]::Matches($err, '<S S="Error">(.*?)</S>')) {
            $msgs += ([regex]::Replace($mm.Groups[1].Value, '_x([0-9A-Fa-f]{4})_', { param($x) [string][char][Convert]::ToInt32($x.Groups[1].Value, 16) })).Trim()
        }
        $err = ($msgs | Where-Object { $_ }) -join ' '
    }
    return [pscustomobject]@{ ExitCode = $r.ExitCode; Output = $r.Output; Error = $err; TimedOut = $r.TimedOut }
}
function Resolve-CmdAll {
    param([string]$Name)
    $all = @(Get-Command $Name -All -ErrorAction SilentlyContinue | Where-Object { $_.CommandType -eq 'Application' -or $_.CommandType -eq 'ExternalScript' })
    return @($all | ForEach-Object { $_.Source })
}

function Resolve-Cmd {
    param([string]$Name)
    $all = @(Resolve-CmdAll $Name)
    if ($all.Count -eq 0) { return $null }
    return [string]$all[0]
}

function Write-NativeTail {
    param($R, [int]$Lines = 12)
    $text = (ConvertTo-Ascii (($R.Output + "`n" + $R.Error)))
    $keep = @($text -split "`r?`n" | ForEach-Object { $_.Trim() } | Where-Object { $_ -and $_ -notmatch '^[-\\|/ ]+$' })
    $tail = $keep | Select-Object -Last $Lines
    foreach ($l in $tail) { Write-Log ("    | {0}" -f $l) }
}

# ---------------------------------------------------------------- winget
function Get-WingetInstalledVersion {
    param([string]$Id)
    $w = Resolve-Cmd 'winget'
    if (-not $w) { return $null }
    $r = Invoke-Native -File $w -Arguments @('list', '--id', $Id, '--exact', '--accept-source-agreements', '--disable-interactivity') -TimeoutSec 120
    $rx = '(?:^|\s)' + [regex]::Escape($Id) + '\s+(?:[<>~=]+\s*)?(\S+)'
    foreach ($line in ($r.Output -split "`r?`n")) {
        $mm = [regex]::Match($line, $rx)
        if ($mm.Success) { return $mm.Groups[1].Value }
    }
    return $null
}
function Invoke-WingetAction {
    # Action: install | upgrade | uninstall. Returns the Invoke-Native result.
    param([string]$Action, [string]$Id, [string]$Version)
    $w = Resolve-Cmd 'winget'
    $a = @($Action, '--id', $Id, '--exact', '--source', 'winget', '--accept-source-agreements', '--disable-interactivity')
    if ($Action -ne 'uninstall') { $a += '--accept-package-agreements' }
    if ($Version -and $Action -ne 'uninstall') { $a += @('--version', $Version) }
    if ($Action -eq 'uninstall') { $a += '--silent' }
    Write-Log ("winget {0}" -f ($a -join ' '))
    $r = Invoke-Native -File $w -Arguments $a -TimeoutSec 1800
    Write-NativeTail $r
    Write-Log ("winget exit code {0}" -f $r.ExitCode)
    return $r
}

# ---------------------------------------------------------------- tool state
function Get-ToolVersionFromExe {
    param([string]$Path, $Tool)
    $va = @('--version')
    if ($Tool.versionArgs) { $va = @($Tool.versionArgs) }
    $r = Invoke-Native -File $Path -Arguments $va -TimeoutSec 40
    $text = ($r.Output + ' ' + $r.Error)
    $rx = $global:TKGenericVersion
    if ($Tool.versionRegex) { $rx = $Tool.versionRegex }
    $m = [regex]::Match($text, $rx)
    if ($m.Success) { return $m.Groups[1].Value }
    return $null
}

function Test-FontFamily {
    param([string]$Family)
    $code = "Add-Type -AssemblyName System.Drawing; `$f = (New-Object System.Drawing.Text.InstalledFontCollection).Families | Where-Object { `$_.Name -eq '$Family' }; if (`$f) { 'FONT-YES' } else { 'FONT-NO' }"
    $r = Invoke-PSCode -Code $code -NoProfile
    return ($r.Output -match 'FONT-YES')
}

function Get-PSModuleVersion {
    param([string]$Module, [string]$Exe)
    $code = "`$m = Get-Module -ListAvailable -Name '$Module' | Sort-Object Version -Descending | Select-Object -First 1; if (`$m) { 'MODVER=' + `$m.Version.ToString() } else { 'MODVER=' }"
    $r = Invoke-PSCode -Code $code -NoProfile -Exe $Exe
    $m = [regex]::Match($r.Output, 'MODVER=(\S*)')
    if ($m.Success -and $m.Groups[1].Value) { return $m.Groups[1].Value }
    return $null
}

function Get-ToolState {
    param($Tool)
    $s = [ordered]@{ installed = $false; version = $null; path = $null; via = $null; detail = '' }
    $detect = $Tool.detect
    if (-not $detect) {
        if ($Tool.exe) { $detect = 'exe' } elseif ($Tool.wingetId) { $detect = 'winget' } else { $detect = 'none' }
    }
    if ($detect -eq 'exe') {
        $path = $null
        if ($Tool.exePath) {
            $p = [Environment]::ExpandEnvironmentVariables($Tool.exePath)
            if (Test-Path -LiteralPath $p) { $path = $p }
        } else {
            $path = Resolve-Cmd $Tool.exe
        }
        if ($path) {
            $s.installed = $true; $s.path = $path; $s.via = 'exe'
            $s.version = Get-ToolVersionFromExe -Path $path -Tool $Tool
        }
        if ((-not $s.version) -and $Tool.wingetId) {
            $wv = Get-WingetInstalledVersion $Tool.wingetId
            if ($wv) { $s.installed = $true; $s.version = $wv; if (-not $s.via) { $s.via = 'winget' } }
        }
    } elseif ($detect -eq 'winget') {
        $wv = Get-WingetInstalledVersion $Tool.wingetId
        if ($wv) { $s.installed = $true; $s.version = $wv; $s.via = 'winget' }
        if ((-not $s.installed) -and $Tool.exe) {
            $path = Resolve-Cmd $Tool.exe
            if ($path) { $s.installed = $true; $s.path = $path; $s.via = 'exe'; $s.version = Get-ToolVersionFromExe -Path $path -Tool $Tool }
        }
    } elseif ($detect -eq 'appx') {
        try {
            $pk = @(Get-AppxPackage -Name $Tool.appxName -ErrorAction Stop) | Select-Object -First 1
            if ($pk) { $s.installed = $true; $s.version = [string]$pk.Version; $s.via = 'appx'; $s.path = $pk.InstallLocation }
        } catch { $s.detail = 'Get-AppxPackage failed: ' + $_.Exception.Message }
    } elseif ($detect -eq 'font') {
        $fam = $global:TK.Manifest.pins.font.family
        if (Test-FontFamily $fam) { $s.installed = $true; $s.version = $global:TK.Manifest.pins.font.release; $s.via = 'font'; $s.detail = $fam }
    } elseif ($detect -eq 'psmodule') {
        $v5 = Get-PSModuleVersion -Module $Tool.moduleName
        $pw = Resolve-Cmd 'pwsh'
        $v7 = $null
        if ($pw) { $v7 = Get-PSModuleVersion -Module $Tool.moduleName -Exe $pw }
        $s.detail = ('5.1={0} 7={1}' -f $v5, $v7)
        if ($v5) { $s.installed = $true; $s.version = $v5; $s.via = 'psmodule' }
        $s['version51'] = $v5; $s['version7'] = $v7; $s['pwshPresent'] = [bool]$pw
    } elseif ($detect -eq 'uv-python') {
        $uvp = [Environment]::ExpandEnvironmentVariables('%USERPROFILE%\.local\bin\uv.exe')
        if (Test-Path -LiteralPath $uvp) {
            # Count only interpreters that uv itself manages (folders in uv's python dir); system Pythons such as C:\Python313 do not count.
            $r = Invoke-Native -File $uvp -Arguments @('python', 'dir') -TimeoutSec 60
            $pdir = $r.Output.Trim()
            $spec = $global:TK.Manifest.pins.python.uvSpec
            if ($pdir -and (Test-Path -LiteralPath $pdir)) {
                $found = @(Get-ChildItem -LiteralPath $pdir -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -match ('^cpython-' + [regex]::Escape($spec) + '\.\d+-') } | Sort-Object Name -Descending)
                if ($found.Count -gt 0) {
                    $mv = [regex]::Match($found[0].Name, '^cpython-(\d+\.\d+\.\d+)')
                    $s.installed = $true; $s.version = $mv.Groups[1].Value; $s.via = 'uv-python'; $s.path = $found[0].FullName
                }
            }
        }
    }
    if ($Tool.policy -eq 'absent' -and (-not $s.installed) -and $Tool.exe) {
        $path = Resolve-Cmd $Tool.exe
        if ($path) { $s.installed = $true; $s.path = $path; $s.via = 'exe' }
    }
    return [pscustomobject]$s
}

function Get-InstallInfo {
    param([string]$Path)
    $info = [ordered]@{ drive = $null; sizeMB = $null; root = $null }
    if (-not $Path) { return [pscustomobject]$info }
    try {
        $info.drive = ([IO.Path]::GetPathRoot($Path)).Substring(0, 2)
        $root = $null
        if ($Path -match '^(.*\\WinGet\\Packages\\[^\\]+)\\') { $root = $Matches[1] }
        elseif ($Path -match '^([A-Za-z]:\\Program Files(?: \(x86\))?\\[^\\]+)\\') { $root = $Matches[1] }
        if ($Path -match '\\WindowsApps\\') { $root = $null; $info.root = 'WindowsApps (not readable)'; return [pscustomobject]$info }
        if ($root -and (Test-Path -LiteralPath $root)) {
            $sum = (Get-ChildItem -LiteralPath $root -Recurse -File -Force -ErrorAction SilentlyContinue | Measure-Object Length -Sum).Sum
            $info.root = $root; $info.sizeMB = [math]::Round(([double]$sum) / 1MB, 1)
        } elseif (Test-Path -LiteralPath $Path -PathType Leaf) {
            $info.root = $Path; $info.sizeMB = [math]::Round((Get-Item -LiteralPath $Path).Length / 1MB, 1)
        }
    } catch { }
    return [pscustomobject]$info
}

function Read-ToolkitLock {
    $p = Join-Path $global:TK.Root 'toolkit.lock.json'
    if (Test-Path -LiteralPath $p) { return (Get-Content -LiteralPath $p -Raw | ConvertFrom-Json) }
    return $null
}

function Get-LockedVersion {
    param($Lock, [string]$Id)
    if (-not $Lock) { return $null }
    $t = $Lock.tools.$Id
    if ($t) { return $t.version }
    return $null
}

# ---------------------------------------------------------------- backups
function Backup-Target {
    param([string]$Path)
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) { return $null }
    $base = $global:TK.BackupBase
    if (-not $base) { $base = 'D:\Backup\Toolkit' }
    $dir = Join-Path $base $global:TK.Ts
    if ($global:TK.DryRun) { Write-Log ("[DRYRUN] would back up {0} to {1}" -f $Path, $dir); return '(dry run)' }
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
    $flat = (Get-TextSha256 $Path).Substring(0, 8) + '_' + (Split-Path -Leaf $Path)
    $dest = Join-Path $dir $flat
    Copy-Item -LiteralPath $Path -Destination $dest -Force
    $global:TK.Backups.Add([pscustomobject]@{ original = $Path; backup = $dest })
    $idx = Join-Path $dir 'backup-index.json'
    Write-Utf8NoBom -Path $idx -Text (ConvertTo-Json -InputObject $global:TK.Backups.ToArray() -Depth 4)
    Write-Log ("backup: {0} -> {1}" -f $Path, $dest)
    return $dest
}

# ---------------------------------------------------------------- PATH helper
function Get-PathWithFirst {
    # Pure string function. Returns RawPath with the Preferred folder first; other entries keep their order and text
    # (so %VARIABLES% stay unexpanded) and later duplicates of the preferred folder are dropped.
    param([string]$RawPath, [string]$Preferred)
    $want = $Preferred.TrimEnd('\')
    $entries = @($RawPath -split ';' | Where-Object { $_ })
    $head = $Preferred
    $rest = New-Object System.Collections.Generic.List[string]
    $taken = $false
    foreach ($e in $entries) {
        if ([Environment]::ExpandEnvironmentVariables($e).TrimEnd('\') -ieq $want) {
            if (-not $taken) { $head = $e; $taken = $true }
            continue
        }
        $rest.Add($e)
    }
    return ((@($head) + $rest.ToArray()) -join ';')
}

# ---------------------------------------------------------------- MCP inventory (names and command names only)
function Get-McpInventory {
    # Returns one row per configured server: file label, name, command (or $null for url servers), resolves, purpose, note.
    # Arguments, environment values and urls are never read into the output.
    $rows = New-Object System.Collections.Generic.List[object]
    $m = $global:TK.Manifest
    foreach ($cf in $m.mcp.configFiles) {
        $path = Expand-ToolkitPath $cf.path $global:TK.Vault
        if (-not (Test-Path -LiteralPath $path)) { $rows.Add([pscustomobject]@{ file = $cf.label; name = '(file absent)'; command = $null; resolves = $null; purpose = ''; note = 'file not present' }); continue }
        $servers = @()
        try {
            if ($path -like '*.toml') {
                $cur = $null
                foreach ($line in ([IO.File]::ReadAllLines($path))) {
                    $mh = [regex]::Match($line, '^\s*\[mcp_servers\.([^\].]+)(\..*)?\]\s*$')
                    if ($mh.Success) { $cur = $mh.Groups[1].Value; if (-not ($servers | Where-Object { $_.name -eq $cur })) { $servers += [pscustomobject]@{ name = $cur; command = $null } }; continue }
                    if ($line -match '^\s*\[') { $cur = $null; continue }
                    $mc = [regex]::Match($line, '^\s*command\s*=\s*"([^"]+)"')
                    if ($cur -and $mc.Success) { ($servers | Where-Object { $_.name -eq $cur }).command = $mc.Groups[1].Value }
                }
            } else {
                $d = Read-JsonLoose $path
                foreach ($key in 'mcpServers', 'servers') {
                    if ($d -is [System.Collections.IDictionary] -and (@($d.Keys) -contains $key) -and ($d[$key] -is [System.Collections.IDictionary])) {
                        foreach ($name in $d[$key].Keys) {
                            $entry = $d[$key][$name]
                            $cmd = $null
                            if ($entry -is [System.Collections.IDictionary] -and (@($entry.Keys) -contains 'command')) { $cmd = [string]$entry['command'] }
                            $servers += [pscustomobject]@{ name = [string]$name; command = $cmd }
                        }
                    }
                }
            }
        } catch { $rows.Add([pscustomobject]@{ file = $cf.label; name = '(unreadable)'; command = $null; resolves = $null; purpose = ''; note = ('could not read: ' + $_.Exception.Message) }); continue }
        if ($servers.Count -eq 0) { $rows.Add([pscustomobject]@{ file = $cf.label; name = '(none)'; command = $null; resolves = $null; purpose = ''; note = 'no servers found' }); continue }
        foreach ($sv in $servers) {
            $purpose = $m.mcp.purposes.($sv.name)
            if (-not $purpose) { $purpose = '' }
            $ok = $null
            $note = ''
            if (-not $sv.command) { $note = 'remote/url server, no local launch command (url not printed)' }
            else {
                if ($sv.command -match '[\\/]') { $ok = Test-Path -LiteralPath ([Environment]::ExpandEnvironmentVariables($sv.command)) }
                else { $ok = [bool](Get-Command $sv.command -ErrorAction SilentlyContinue) }
            }
            $rows.Add([pscustomobject]@{ file = $cf.label; name = $sv.name; command = $sv.command; resolves = $ok; purpose = $purpose; note = $note })
        }
    }
    return $rows.ToArray()
}

# ---------------------------------------------------------------- planning
function Get-ToolPlan {
    # Decides what 10-install-toolkit would do for one tool. Returns action, version (pin) and reason.
    param($Tool, $State, $Lock)
    $p = [ordered]@{ action = 'none'; version = $null; reason = '' }
    $policy = $Tool.policy
    $lockVer = $null
    if ($Lock -and $Lock.host -ne $global:TK.Host) { $lockVer = Get-LockedVersion -Lock $Lock -Id $Tool.id }
    if ($policy -eq 'catalog-only') { $p.action = 'skip'; $p.reason = 'catalog only'; return [pscustomobject]$p }
    if ($policy -eq 'absent') {
        if ($State.installed) { $p.action = 'warn-present'; $p.reason = 'must not exist on this machine' } else { $p.reason = 'absent as required' }
        return [pscustomobject]$p
    }
    if ($policy -eq 'retire') {
        if ($State.installed) { $p.action = 'pending-retire'; $p.reason = $Tool.retireCommand } else { $p.reason = 'already retired' }
        return [pscustomobject]$p
    }
    if ($Tool.method -eq 'verify') {
        if ($State.installed) { $p.reason = 'present' } else { $p.action = 'missing'; $p.reason = 'verify-only tool is missing' }
        return [pscustomobject]$p
    }
    if ($Tool.method -eq 'winget') {
        foreach ($c in @($Tool.conflictsWith)) {
            if ($c -and (Get-WingetInstalledVersion $c)) {
                $p.action = 'manual'; $p.reason = ("{0} is installed; run {1} by hand" -f $c, $Tool.manualScript)
                return [pscustomobject]$p
            }
        }
        if (-not $State.installed) { $p.action = 'install'; $p.version = $lockVer; $p.reason = 'not installed'; return [pscustomobject]$p }
        if ($Tool.expectMajor -and $State.version) {
            $maj = [int](($State.version -split '\.')[0])
            if ($maj -ne [int]$Tool.expectMajor) { $p.action = 'manual'; $p.reason = ("major {0} installed, {1} wanted; run {2} by hand" -f $maj, $Tool.expectMajor, $Tool.manualScript); return [pscustomobject]$p }
        }
        if ($policy -eq 'latest') { $p.action = 'upgrade'; $p.reason = 'policy latest' } else { $p.reason = 'present, adopted' }
        return [pscustomobject]$p
    }
    if ($Tool.method -eq 'npm') {
        if (-not $State.installed) { $p.action = 'install'; $p.version = $lockVer; $p.reason = 'not installed' } else { $p.reason = 'present, adopted' }
        return [pscustomobject]$p
    }
    if ($Tool.method -eq 'uv-standalone') {
        $pin = $global:TK.Manifest.pins.uv.version
        if ($State.installed -and $State.version -eq $pin) { $p.reason = 'standalone uv at pin' }
        else { $p.action = 'install'; $p.version = $pin; $p.reason = 'standalone uv missing or not at pin' }
        return [pscustomobject]$p
    }
    if ($Tool.method -eq 'uv-python') {
        if (-not $State.installed) { $p.action = 'install'; $p.reason = 'no uv-managed python' } else { $p.reason = 'present' }
        return [pscustomobject]$p
    }
    if ($Tool.method -eq 'font') {
        if (-not $State.installed) { $p.action = 'install'; $p.reason = 'family not registered' } else { $p.reason = 'family registered' }
        return [pscustomobject]$p
    }
    if ($Tool.method -eq 'psmodule') {
        $need5 = (-not $State.installed)
        $need7 = ($State.pwshPresent -and (-not $State.version7))
        if ($need5 -or $need7) { $p.action = 'install'; $p.reason = ("5.1 missing={0} 7 missing={1}" -f $need5, $need7) } else { $p.reason = 'present in both editions' }
        return [pscustomobject]$p
    }
    return [pscustomobject]$p
}
