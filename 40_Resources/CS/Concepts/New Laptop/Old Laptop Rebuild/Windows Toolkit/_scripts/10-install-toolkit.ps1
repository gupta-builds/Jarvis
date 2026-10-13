<#
10-install-toolkit.ps1 - installs and adopts the toolkit from toolkit.json. Run in a NORMAL (not elevated) shell.
Windows will show UAC prompts for the machine-wide installers (Git, GitHub CLI, Starship, Node); click Yes.
  -DryRun   print the plan, change nothing
  -Only     limit to some tool ids, for example -Only starship,fzf
  -Machine  force dell or acer if detection fails
Safe to run twice. Continues past a failed package and prints a summary table. Exit code 1 only on a required failure.
Never installs Tailscale, never touches Node 22 (use 11-node-lts-swap.ps1), never removes anything.
#>
param([switch]$DryRun, [ValidateSet('dell', 'acer')][string]$Machine, [string[]]$Only)

. "$PSScriptRoot\_lib.ps1"
$ErrorActionPreference = 'Stop'
if ($Only) { $Only = @($Only | ForEach-Object { $_ -split ',' } | Where-Object { $_ }) }
Initialize-Toolkit -Name '10-install-toolkit' -DryRun $DryRun.IsPresent -Machine $Machine | Out-Null
$m = $global:TK.Manifest
$role = $global:TK.Role
$dry = $global:TK.DryRun
$lock = Read-ToolkitLock

function Add-ToolInfo {
    param($Tool, $State)
    $info = Get-InstallInfo $State.path
    return @{ version = $State.version; path = $State.path; drive = $info.drive; sizeMB = $info.sizeMB; policy = $Tool.policy }
}

function Repair-PortablePath {
    param($Tool)
    $pkgRoot = Join-Path $env:LOCALAPPDATA 'Microsoft\WinGet\Packages'
    $pkg = Get-ChildItem -LiteralPath $pkgRoot -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -like ($Tool.wingetId + '_*') } | Select-Object -First 1
    if (-not $pkg) { Write-Log ("no package folder found for {0}" -f $Tool.wingetId) 'WARN'; return $false }
    $exe = Get-ChildItem -LiteralPath $pkg.FullName -Recurse -Filter ($Tool.exe + '.exe') -File -ErrorAction SilentlyContinue | Select-Object -First 1
    if (-not $exe) { Write-Log ("{0}.exe not found under {1}" -f $Tool.exe, $pkg.FullName) 'WARN'; return $false }
    $links = Join-Path $env:LOCALAPPDATA 'Microsoft\WinGet\Links'
    New-Item -ItemType Directory -Force -Path $links | Out-Null
    $link = Join-Path $links ($Tool.exe + '.exe')
    if (-not (Test-Path -LiteralPath $link)) {
        New-Item -ItemType HardLink -Path $link -Value $exe.FullName | Out-Null
        Write-Log ("hard link created: {0} -> {1}" -f $link, $exe.FullName)
    }
    $up = [Environment]::GetEnvironmentVariable('Path', 'User')
    $has = $false
    foreach ($e in ($up -split ';')) { if ($e.TrimEnd('\') -ieq $links.TrimEnd('\')) { $has = $true } }
    if (-not $has) {
        [Environment]::SetEnvironmentVariable('Path', ($links + ';' + $up), 'User')
        Write-Log ("added {0} to the user PATH" -f $links)
    }
    Update-SessionPath
    return $true
}

function Install-WingetTool {
    param($Tool, $Plan)
    $r = Invoke-WingetAction -Action 'install' -Id $Tool.wingetId -Version $Plan.version
    Update-SessionPath
    $st = Get-ToolState $Tool
    if ((-not $st.installed) -and $Plan.version) {
        Write-Log ("pinned version {0} failed; retrying with the current version" -f $Plan.version) 'WARN'
        $r = Invoke-WingetAction -Action 'install' -Id $Tool.wingetId -Version $null
        Update-SessionPath
        $st = Get-ToolState $Tool
    }
    if ((-not $st.installed) -and $Tool.portable) {
        if (Repair-PortablePath $Tool) { $st = Get-ToolState $Tool }
    }
    if ($st.installed) { Add-Result $Tool.id 'INSTALLED' ("version {0} (winget exit {1})" -f $st.version, $r.ExitCode) (Add-ToolInfo $Tool $st) }
    else { Add-Result $Tool.id 'FAIL' ("not detected after install (winget exit {0}); open a new shell and re-run" -f $r.ExitCode) }
}

function Update-WingetTool {
    param($Tool, $State)
    $before = $State.version
    $r = Invoke-WingetAction -Action 'upgrade' -Id $Tool.wingetId -Version $null
    Update-SessionPath
    $st = Get-ToolState $Tool
    if ($st.installed -and $st.version -ne $before) { Add-Result $Tool.id 'UPGRADED' ("{0} -> {1}" -f $before, $st.version) (Add-ToolInfo $Tool $st) }
    elseif ($st.installed) { Add-Result $Tool.id 'OK' ("already current at {0} (winget exit {1})" -f $st.version, $r.ExitCode) (Add-ToolInfo $Tool $st) }
    else { Add-Result $Tool.id 'FAIL' ("tool not detected after upgrade (winget exit {0})" -f $r.ExitCode) }
}

function Install-NpmTool {
    param($Tool, $Plan)
    $npm = Resolve-Cmd 'npm'
    if (-not $npm) { Add-Result $Tool.id 'FAIL' 'npm not found (Node missing)'; return }
    $spec = $Tool.npmPackage
    if ($Plan.version) { $spec = $spec + '@' + $Plan.version }
    Write-Log ("npm install -g {0}" -f $spec)
    $r = Invoke-Native -File $npm -Arguments @('install', '-g', $spec) -TimeoutSec 900
    Write-NativeTail $r
    Update-SessionPath
    $st = Get-ToolState $Tool
    if (-not $st.installed) {
        $gp = Join-Path $env:APPDATA 'npm'
        if (Test-Path -LiteralPath $gp) { $env:Path = $env:Path + ';' + $gp; $st = Get-ToolState $Tool }
    }
    if ($st.installed) { Add-Result $Tool.id 'INSTALLED' ("npm exit {0}, version {1}" -f $r.ExitCode, $st.version) (Add-ToolInfo $Tool $st) }
    else { Add-Result $Tool.id 'FAIL' ("not detected after npm install (exit {0})" -f $r.ExitCode) }
}

function Install-UvStandalone {
    param($Tool)
    $pin = $m.pins.uv
    $dir = Join-Path $env:TEMP ("toolkit-uv-" + $global:TK.Ts)
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
    $f = Join-Path $dir 'uv-installer.ps1'
    try {
        Invoke-WebRequest -Uri $pin.installerUrl -OutFile $f -UseBasicParsing
    } catch { Add-Result $Tool.id 'FAIL' ("download failed: " + $_.Exception.Message); return }
    $h = Get-FileSha256 $f
    if ($h -ne $pin.installerSha256.ToUpper()) { Add-Result $Tool.id 'FAIL' ("installer SHA-256 mismatch: got {0}" -f $h); return }
    Write-Log ("uv installer verified, sha256 {0}" -f $h)
    $r = Invoke-Native -File $f -Arguments @() -TimeoutSec 600 -Env @{ UV_NO_MODIFY_PATH = '1' }
    Write-NativeTail $r
    $bin = Join-Path $env:USERPROFILE '.local\bin'
    $up = [Environment]::GetEnvironmentVariable('Path', 'User')
    $has = $false
    foreach ($e in ($up -split ';')) { if ([Environment]::ExpandEnvironmentVariables($e).TrimEnd('\') -ieq $bin.TrimEnd('\')) { $has = $true } }
    if (-not $has) {
        [Environment]::SetEnvironmentVariable('Path', ($bin + ';' + $up), 'User')
        Write-Log ("added {0} to the user PATH" -f $bin)
    }
    Update-SessionPath
    Remove-Item -LiteralPath $dir -Recurse -Force -ErrorAction SilentlyContinue
    $st = Get-ToolState $Tool
    if ($st.installed -and $st.version -eq $pin.version) { Add-Result $Tool.id 'INSTALLED' ("standalone uv {0} at {1}" -f $st.version, $st.path) (Add-ToolInfo $Tool $st) }
    else { Add-Result $Tool.id 'FAIL' ("uv not at pin after install (found {0}, installer exit {1})" -f $st.version, $r.ExitCode) }
}

function Install-UvPython {
    param($Tool)
    $uv = [Environment]::ExpandEnvironmentVariables('%USERPROFILE%\.local\bin\uv.exe')
    if (-not (Test-Path -LiteralPath $uv)) { Add-Result $Tool.id 'FAIL' 'standalone uv missing, cannot install Python'; return }
    $spec = $m.pins.python.uvSpec
    $r = Invoke-Native -File $uv -Arguments @('python', 'install', $spec) -TimeoutSec 900
    Write-NativeTail $r
    $st = Get-ToolState $Tool
    if ($st.installed) { Add-Result $Tool.id 'INSTALLED' ("cpython {0} (uv exit {1})" -f $st.version, $r.ExitCode) @{ version = $st.version } }
    else { Add-Result $Tool.id 'FAIL' ("no uv-managed python found after install (exit {0})" -f $r.ExitCode) }
}

function Install-Font {
    param($Tool)
    $pin = $m.pins.font
    $work = Join-Path $env:TEMP ("toolkit-font-" + $global:TK.Ts)
    New-Item -ItemType Directory -Force -Path $work | Out-Null
    $arc = Join-Path $work 'IosevkaTerm.tar.xz'
    $out = Join-Path $work 'ttf'
    New-Item -ItemType Directory -Force -Path $out | Out-Null
    Write-Log ("downloading {0} (about 87.5 MB)" -f $pin.url)
    try { Invoke-WebRequest -Uri $pin.url -OutFile $arc -UseBasicParsing } catch { Add-Result $Tool.id 'FAIL' ("download failed: " + $_.Exception.Message); return }
    $h = (Get-FileSha256 $arc)
    if ($h -ne $pin.sha256.ToUpper()) { Add-Result $Tool.id 'FAIL' ("SHA-256 mismatch: got {0}" -f $h); return }
    Write-Log 'archive SHA-256 verified'
    $tar = (Get-Command tar.exe).Source
    $r = Invoke-Native -File $tar -Arguments @('-xf', $arc, '-C', $out, $pin.filePattern) -TimeoutSec 300
    $ttf = @(Get-ChildItem -LiteralPath $out -Filter '*.ttf' -File)
    if ($ttf.Count -lt 20) { Add-Result $Tool.id 'FAIL' ("extracted only {0} TTF files (tar exit {1}: {2})" -f $ttf.Count, $r.ExitCode, (ConvertTo-Ascii $r.Error)); return }
    $fontDir = Join-Path $env:LOCALAPPDATA 'Microsoft\Windows\Fonts'
    New-Item -ItemType Directory -Force -Path $fontDir | Out-Null
    $reg = 'HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Fonts'
    if (-not (Test-Path $reg)) { New-Item -Path $reg -Force | Out-Null }
    $total = 0.0
    foreach ($f in $ttf) {
        $dest = Join-Path $fontDir $f.Name
        Copy-Item -LiteralPath $f.FullName -Destination $dest -Force
        New-ItemProperty -Path $reg -Name ([IO.Path]::GetFileNameWithoutExtension($f.Name) + ' (TrueType)') -Value $dest -PropertyType String -Force | Out-Null
        $total += $f.Length
    }
    if (-not ('ToolkitNative.Win32' -as [type])) {
        Add-Type -Namespace ToolkitNative -Name Win32 -MemberDefinition '[System.Runtime.InteropServices.DllImport("user32.dll", SetLastError=true, CharSet=System.Runtime.InteropServices.CharSet.Auto)] public static extern System.IntPtr SendMessageTimeout(System.IntPtr hWnd, uint Msg, System.UIntPtr wParam, System.IntPtr lParam, uint fuFlags, uint uTimeout, out System.UIntPtr lpdwResult);'
    }
    $res = [UIntPtr]::Zero
    [ToolkitNative.Win32]::SendMessageTimeout([IntPtr]0xffff, 0x1D, [UIntPtr]::Zero, [IntPtr]::Zero, 2, 2000, [ref]$res) | Out-Null
    Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue
    $sizeMB = [math]::Round($total / 1MB, 1)
    if (Test-FontFamily $pin.family) { Add-Result $Tool.id 'INSTALLED' ("{0} TTF files, {1} MB, family '{2}' registered" -f $ttf.Count, $sizeMB, $pin.family) @{ drive = 'C:'; sizeMB = $sizeMB; version = $pin.release } }
    else { Add-Result $Tool.id 'WARN' ("{0} files copied ({1} MB) but family '{2}' is not visible yet; sign out and back in, then run 99-verify" -f $ttf.Count, $sizeMB, $pin.family) @{ drive = 'C:'; sizeMB = $sizeMB } }
}

function Install-PsModule {
    param($Tool, $State)
    $ver = $m.pins.psfzf.version
    $core = "Install-Module -Name '{0}' -RequiredVersion '{1}' -Scope CurrentUser -Repository PSGallery -Force -AllowClobber -Confirm:`$false -ErrorAction Stop; 'MOD-DONE'" -f $Tool.moduleName, $ver
    if (-not $State.installed) {
        $code = "[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12; if (-not (Get-PackageProvider -Name NuGet -ListAvailable -ErrorAction SilentlyContinue)) { Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Scope CurrentUser -Force | Out-Null }; " + $core
        $r = Invoke-PSCode -Code $code -NoProfile -TimeoutSec 600
        Write-NativeTail $r 6
    }
    $pw = Resolve-Cmd 'pwsh'
    if ($pw -and (-not $State.version7)) {
        $r2 = Invoke-PSCode -Code $core -NoProfile -TimeoutSec 600 -Exe $pw
        Write-NativeTail $r2 6
    }
    $st = Get-ToolState $Tool
    if ($st.installed -and ((-not $st.pwshPresent) -or $st.version7)) { Add-Result $Tool.id 'INSTALLED' ("PSFzf {0} ({1})" -f $st.version, $st.detail) @{ version = $st.version } }
    else { Add-Result $Tool.id 'FAIL' ("PSFzf not present in every edition: {0}" -f $st.detail) }
}

# ------------------------------------------------------------------ pass 1: plan
Write-Log '--- Plan' 'STEP'
$rows = @()
foreach ($t in $m.tools) {
    if ($t.policy -eq 'catalog-only') { continue }
    if (-not (Test-ToolOnMachine $t $role)) { continue }
    if ($Only -and ($Only -notcontains $t.id)) { continue }
    $st = Get-ToolState $t
    $pl = Get-ToolPlan -Tool $t -State $st -Lock $lock
    $rows += [pscustomobject]@{ Tool = $t; State = $st; Plan = $pl }
    $v = $st.version; if (-not $v) { $v = '-' }
    Write-Log ("{0,-18} installed={1,-5} version={2,-14} action={3} ({4})" -f $t.id, $st.installed, $v, $pl.action, $pl.reason)
}
$todo = @($rows | Where-Object { $_.Plan.action -in 'install', 'upgrade' })
Write-Log ("Planned total: {0} install/upgrade action(s)" -f $todo.Count) 'STEP'
$uac = @($todo | Where-Object { $_.Tool.uac } | ForEach-Object { $_.Tool.id })
if ($uac.Count -gt 0) { Write-Log ("UAC prompts expected for: {0}. Click Yes on each." -f ($uac -join ', ')) 'WARN' }

# ------------------------------------------------------------------ pass 2: execute (state re-read per tool)
Write-Log '--- Execute' 'STEP'
foreach ($row in $rows) {
    $t = $row.Tool
    try {
        $st = Get-ToolState $t
        $pl = Get-ToolPlan -Tool $t -State $st -Lock $lock
        $action = $pl.action
        if ($dry) {
            if ($action -in 'install', 'upgrade') {
                $ver = ''; if ($pl.version) { $ver = ' ' + $pl.version }
                Add-Result $t.id 'PLAN' ("[DRYRUN] would {0}{1} ({2})" -f $action, $ver, $pl.reason)
            } elseif ($action -eq 'missing' -and $t.dependsOn) {
                Add-Result $t.id 'PLAN' ("[DRYRUN] available after {0} is installed" -f $t.dependsOn)
            } elseif ($action -eq 'missing') { Add-Result $t.id 'MANUAL' ("missing; install by hand ({0})" -f $t.name) }
            elseif ($action -eq 'manual') { Add-Result $t.id 'MANUAL' $pl.reason }
            elseif ($action -eq 'pending-retire') { Add-Result $t.id 'PENDING' $pl.reason }
            elseif ($action -eq 'warn-present') { Add-Result $t.id 'WARN' $pl.reason }
            else { Add-Result $t.id 'OK' ("{0} (version {1})" -f $pl.reason, $st.version) (Add-ToolInfo $t $st) }
            continue
        }
        switch ($action) {
            'install' {
                if ($t.method -eq 'winget') { Install-WingetTool $t $pl }
                elseif ($t.method -eq 'npm') { Install-NpmTool $t $pl }
                elseif ($t.method -eq 'uv-standalone') { Install-UvStandalone $t }
                elseif ($t.method -eq 'uv-python') { Install-UvPython $t }
                elseif ($t.method -eq 'font') { Install-Font $t }
                elseif ($t.method -eq 'psmodule') { Install-PsModule $t $st }
                else { Add-Result $t.id 'FAIL' ("no installer for method {0}" -f $t.method) }
            }
            'upgrade' { Update-WingetTool $t $st }
            'manual' { Add-Result $t.id 'MANUAL' $pl.reason }
            'missing' { Add-Result $t.id 'MANUAL' ("missing; install by hand ({0})" -f $t.name) }
            'pending-retire' { Add-Result $t.id 'PENDING' $pl.reason }
            'warn-present' { Add-Result $t.id 'WARN' $pl.reason }
            default { Add-Result $t.id 'OK' ("{0} (version {1})" -f $pl.reason, $st.version) (Add-ToolInfo $t $st) }
        }
    } catch {
        Add-Result $t.id 'FAIL' ("exception: " + $_.Exception.Message)
    }
}
Complete-Toolkit -Summary @{ plannedActions = $todo.Count }
