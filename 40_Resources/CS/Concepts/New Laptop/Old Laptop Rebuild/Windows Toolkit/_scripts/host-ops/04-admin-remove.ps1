<#
04-admin-remove.ps1  (ELEVATED PowerShell)
Default is a DRY RUN. Add -Apply to make changes.
Always:      Logi Options+, Logi Plugin Service, VC++ 2010 and 2012, .NET 9.x, C:\ProgramData\Epic
Optional:    -IncludeDotnet8   also remove .NET 8.x (Dell Command Update may need it - see README note in chat)
             -IncludePython    remove Python 3.13.5 (choco python313) and then Chocolatey itself.
                               Run only AFTER the standalone uv is installed (Build 4), because it leaves no python on PATH.
Nothing here touches C:\Windows\Installer or Package Cache; those shrink by themselves as products are removed.
#>
param([switch]$Apply, [switch]$IncludeDotnet8, [switch]$IncludePython)
$ErrorActionPreference = 'Continue'
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) { throw 'Run this from an elevated PowerShell.' }
$log = "D:\WSL\ops\windows\logs\04-admin-remove-$(Get-Date -Format yyyyMMdd-HHmm).log"
Start-Transcript -Path $log | Out-Null
if (-not $Apply) { Write-Host '*** DRY RUN (nothing changes). Re-run with -Apply ***' -ForegroundColor Yellow }
$start = (Get-PSDrive C).Free / 1GB

$keys = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*', 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'
function Get-Arp($regex) {
  Get-ItemProperty $keys -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -match $regex } | Sort-Object DisplayName
}
function Remove-Arp($e) {
  $cmd = if ($e.QuietUninstallString) { $e.QuietUninstallString } else { $e.UninstallString }
  Write-Host "   $($e.DisplayName) $($e.DisplayVersion)"
  if (-not $cmd) { Write-Host '     no uninstall string'; return }
  if ($cmd -match 'MsiExec') {
    $guid = [regex]::Match($cmd, '\{[0-9A-Fa-f-]{36}\}').Value
    $args2 = "/X$guid /qn /norestart"
    Write-Host "     msiexec $args2"
    if ($Apply) { $p = Start-Process msiexec.exe -ArgumentList $args2 -Wait -PassThru; Write-Host "     exit $($p.ExitCode) (3010 = reboot needed)" }
  } else {
    $m = [regex]::Match($cmd, '^\s*("([^"]+)"|(\S+))\s*(.*)$')
    $exe = if ($m.Groups[2].Success) { $m.Groups[2].Value } else { $m.Groups[3].Value }
    $rest = $m.Groups[4].Value
    if ($rest -notmatch 'quiet|/S\b|silent') { $rest = ($rest + ' /quiet /norestart').Trim() }
    Write-Host "     $exe $rest"
    if (-not (Test-Path $exe)) { Write-Host '     uninstaller file missing, skipped'; return }
    if ($Apply) { $p = Start-Process $exe -ArgumentList $rest -Wait -PassThru; Write-Host "     exit $($p.ExitCode)" }
  }
}

Write-Host "`n--- 1 Logi Options+ and Logi Plugin Service"
$lo = Get-Arp '^Logi Options\+'
foreach ($e in $lo) {
  $u = 'C:\Program Files\LogiOptionsPlus\logioptionsplus_updater.exe'
  Write-Host "   $($e.DisplayName): $u --uninstall --full --shadow"
  if ($Apply -and (Test-Path $u)) { Get-Process | Where-Object ProcessName -match 'logi' | Stop-Process -Force -ErrorAction SilentlyContinue; Start-Process $u -ArgumentList '--uninstall --full --shadow' -Wait }
}
Get-Arp '^Logi Plugin Service' | ForEach-Object { Remove-Arp $_ }
if ($Apply) {
  Get-Service | Where-Object { $_.Name -match 'LogiPluginService|OptionsPlusUpdaterService|LogiOptions' } | ForEach-Object { Write-Host "   delete service $($_.Name)"; Stop-Service $_ -Force -ErrorAction SilentlyContinue; sc.exe delete $_.Name | Out-Null }
}
foreach ($d in 'C:\ProgramData\LogiOptionsPlus', 'C:\Program Files\LogiOptionsPlus') {
  if (Test-Path $d) { Write-Host "   leftover: $d"; if ($Apply) { Remove-Item $d -Recurse -Force -ErrorAction SilentlyContinue } }
}

Write-Host "`n--- 2 Visual C++ 2010 and 2012 redistributables (2015-2022 stays)"
# 2012 'Additional/Minimum Runtime' MSIs are children of the bundle and go with it.
Get-Arp 'Visual C\+\+ 2010' | ForEach-Object { Remove-Arp $_ }
Get-Arp 'Visual C\+\+ 2012 Redistributable' | ForEach-Object { Remove-Arp $_ }

Write-Host "`n--- 3 .NET 9.x (and 8.x with -IncludeDotnet8). 10.x stays."
$ver = if ($IncludeDotnet8) { '(?<![\d.])(8|9)\.0\.\d+' } else { '(?<![\d.])9\.0\.\d+' }
$dn = Get-Arp '(\.NET Runtime|ASP\.NET Core|Windows Desktop Runtime)' | Where-Object { $_.DisplayName -match $ver }
# bundles (exe) first, then raw MSIs
$dn | Where-Object { ($_.UninstallString -notmatch 'MsiExec') } | ForEach-Object { Remove-Arp $_ }
$dn | Where-Object { ($_.UninstallString -match 'MsiExec') } | ForEach-Object { Remove-Arp $_ }
if (-not $IncludeDotnet8) { Write-Host '   .NET 8.x kept (use -IncludeDotnet8 after checking Dell Command Update still opens)' }

Write-Host "`n--- 4 Epic leftovers"
if (Test-Path 'C:\ProgramData\Epic') { Write-Host '   C:\ProgramData\Epic'; if ($Apply) { Remove-Item 'C:\ProgramData\Epic' -Recurse -Force -ErrorAction SilentlyContinue } }

if ($IncludePython) {
  Write-Host "`n--- 5 Python 3.13.5 (choco python313), then Chocolatey"
  # Build 4 fix 2026-10-13: Get-Command without -All returns only the FIRST uv on PATH, which is the pip copy this step removes,
  # so the old gate could never pass. Check every uv on PATH and the standalone install folder, and require a uv-managed Python 3.13.
  $uvStandalone = [bool](Get-Command uv -All -ErrorAction SilentlyContinue | Where-Object { $_.Source -notmatch 'Python313' }) -or (Test-Path (Join-Path $env:USERPROFILE '.local\bin\uv.exe'))
  $uvPyDir = Join-Path $env:APPDATA 'uv\python'
  $uvPy313 = (Test-Path $uvPyDir) -and [bool](Get-ChildItem $uvPyDir -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -match '^cpython-3\.13\.' })
  if (-not $uvStandalone) {
    Write-Host '   STOP: no standalone uv found yet. Install uv first (Build 4), then re-run with -IncludePython.' -ForegroundColor Red
  } elseif (-not $uvPy313) {
    Write-Host '   STOP: no uv-managed Python 3.13 yet. Run 10-install-toolkit.ps1 -Only uv-python first, so a Python exists after C:\Python313 is removed.' -ForegroundColor Red
  } else {
    Write-Host '   choco uninstall python313 -y'
    if ($Apply) { choco uninstall python313 -y }
    foreach ($d in 'C:\Python313') { if (Test-Path $d) { Write-Host "   leftover: $d"; if ($Apply) { Remove-Item $d -Recurse -Force -ErrorAction SilentlyContinue } } }
    Write-Host '   remove Chocolatey: C:\ProgramData\chocolatey, ChocolateyInstall variable, PATH entry'
    if ($Apply) {
      Remove-Item 'C:\ProgramData\chocolatey' -Recurse -Force -ErrorAction SilentlyContinue
      [Environment]::SetEnvironmentVariable('ChocolateyInstall', $null, 'Machine')
      [Environment]::SetEnvironmentVariable('ChocolateyLastPathUpdate', $null, 'User')
      # Build 4 fix 2026-10-13: edit the RAW registry value so %SystemRoot% entries and the REG_EXPAND_SZ type survive; save the old value first.
      $envKey = [Microsoft.Win32.Registry]::LocalMachine.OpenSubKey('SYSTEM\CurrentControlSet\Control\Session Manager\Environment', $true)
      $oldPath = [string]$envKey.GetValue('Path', '', [Microsoft.Win32.RegistryValueOptions]::DoNotExpandEnvironmentNames)
      $pathBackup = "D:\WSL\ops\windows\logs\machine-path-before-$(Get-Date -Format yyyyMMdd-HHmm).txt"
      [IO.File]::WriteAllText($pathBackup, $oldPath)
      $mp = ($oldPath -split ';') | Where-Object { $_ -and ($_ -notmatch 'chocolatey|Python313') }
      $envKey.SetValue('Path', ($mp -join ';'), [Microsoft.Win32.RegistryValueKind]::ExpandString)
      $envKey.Close()
      [Environment]::SetEnvironmentVariable('TOOLKIT_PATH_REFRESH', '1', 'Machine')
      [Environment]::SetEnvironmentVariable('TOOLKIT_PATH_REFRESH', $null, 'Machine')
      Write-Host "   machine PATH rewritten (old value saved to $pathBackup); open new windows to pick it up"
    }
  }
} else {
  Write-Host "`n--- 5 Python 3.13.5 and Chocolatey: skipped (needs -IncludePython after uv is installed)"
}

$end = (Get-PSDrive C).Free / 1GB
Write-Host ("`nEND  C: free {0:N2} -> {1:N2} GiB   log: {2}" -f $start, $end, $log)
if ($Apply) { Write-Host 'Reboot afterwards if any exit code was 3010.' }
Stop-Transcript | Out-Null
