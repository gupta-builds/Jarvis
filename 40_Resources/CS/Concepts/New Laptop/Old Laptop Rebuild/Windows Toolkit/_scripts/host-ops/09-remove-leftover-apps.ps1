# 09-remove-leftover-apps.ps1  (Build 4b follow-up, 2026-10-17)  ASCII only. PowerShell 5.1 and 7 safe.
#   powershell -ExecutionPolicy Bypass -File D:\WSL\ops\windows\09-remove-leftover-apps.ps1            (dry run: lists what exists, works in a normal shell)
#   ELEVATED PowerShell:  ... 09-remove-leftover-apps.ps1 -Apply                                       (removes it; needs admin because 10 Python entries are per-machine MSIs)
# Removes (all approved by Anant on 2026-10-17):
#   1. Rize: Squirrel uninstall, then its folders, its (already disabled) startup entries.
#   2. GitKrakenCLI leftovers: %LOCALAPPDATA%\GitKrakenCLI and %LOCALAPPDATA%\gk (logs and an install lock; no program is installed).
#   3. The 11 stale Python 3.13.5 uninstall registrations (files are gone since Build 4): the bundle's own uninstaller first, then msiexec /x for stragglers.
# Machine PATH is recorded (type, length, SHA-256) before and after the Python step to prove the uninstall did not damage it.
param([switch]$Apply)
$ErrorActionPreference = 'Stop'
$dry = -not $Apply
$logDir = 'D:\WSL\ops\windows\logs'
if (-not (Test-Path $logDir)) { New-Item -ItemType Directory -Path $logDir -Force | Out-Null }
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$log = Join-Path $logDir ('remove-leftover-apps-' + $stamp + '.log')
try { Start-Transcript -Path (Join-Path $logDir ('remove-leftover-apps-' + $stamp + '.transcript.txt')) -Force | Out-Null } catch { }
function Log([string]$m) { $l = (Get-Date -Format 'HH:mm:ss') + ' ' + $m; Write-Host $l; Add-Content -Path $log -Value $l -Encoding ASCII }
Log ("remove leftover apps. DryRun={0}  Log: {1}" -f $dry, $log)
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
Log ("  elevated: {0}" -f $isAdmin)
if ($Apply -and -not $isAdmin) { Log 'STOP: -Apply needs an elevated PowerShell (the Python MSIs are per-machine).'; Log "DONE. Log: $log"; try { Stop-Transcript | Out-Null } catch { }; exit 2 }
function Size-MB([string]$p) { if (-not (Test-Path -LiteralPath $p)) { return 'absent' }; $s = (Get-ChildItem -LiteralPath $p -Recurse -Force -File -ErrorAction SilentlyContinue | Measure-Object Length -Sum).Sum; if (-not $s) { $s = 0 }; return ('{0:N1} MB' -f ($s / 1MB)) }
function Remove-Tree([string]$p) { if (Test-Path -LiteralPath $p) { & cmd.exe /c ('rd /s /q "\\?\' + $p + '"') 2>&1 | Out-Null; if (Test-Path -LiteralPath $p) { Log ("    STILL THERE: {0}" -f $p) } else { Log ("    removed {0}" -f $p) } } }

# ---------------------------------------------------------------- 1 Rize
Log '== 1 Rize'
$rizeLocal = Join-Path $env:LOCALAPPDATA 'Rize'; $rizeRoam = Join-Path $env:APPDATA 'Rize'
$runKey = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run'; $saKey = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run'; $rn = 'com.squirrel.Rize.Rize'
Log ("  {0}  {1}" -f $rizeLocal, (Size-MB $rizeLocal)); Log ("  {0}  {1}" -f $rizeRoam, (Size-MB $rizeRoam))
Log ("  Run value present: {0}   StartupApproved value present: {1}" -f [bool](Get-ItemProperty $runKey -Name $rn -ErrorAction SilentlyContinue), [bool](Get-ItemProperty $saKey -Name $rn -ErrorAction SilentlyContinue))
$rp = @(Get-Process -ErrorAction SilentlyContinue | Where-Object { $_.Name -match '^rize' })
if ($rp.Count -gt 0) { Log ("  BLOCKED: Rize is running ({0} process). Quit it from its tray icon and re-run." -f $rp.Count) }
elseif ($dry) { Log '  [dry run] would run Update.exe --uninstall -s, delete both folders and both startup values' }
else {
  $u = Join-Path $rizeLocal 'Update.exe'
  if (Test-Path $u) { $p = Start-Process -FilePath $u -ArgumentList '--uninstall', '-s' -Wait -PassThru; Log ("  Squirrel uninstall exit code {0}" -f $p.ExitCode) }
  Remove-Tree $rizeLocal; Remove-Tree $rizeRoam
  foreach ($k in $runKey, $saKey) { if (Get-ItemProperty $k -Name $rn -ErrorAction SilentlyContinue) { Remove-ItemProperty -Path $k -Name $rn; Log ("  removed value {0} from {1}" -f $rn, $k) } }
}

# ---------------------------------------------------------------- 2 GitKrakenCLI
Log '== 2 GitKrakenCLI leftovers'
$gk = @((Join-Path $env:LOCALAPPDATA 'GitKrakenCLI'), (Join-Path $env:LOCALAPPDATA 'gk'))
foreach ($g in $gk) { Log ("  {0}  {1}" -f $g, (Size-MB $g)) }
$gp = @(Get-Process -ErrorAction SilentlyContinue | Where-Object { $_.Name -match '^(gk|gitkraken)' })
if ($gp.Count -gt 0) { Log ("  BLOCKED: {0} GitKraken process running; close it and re-run." -f $gp.Count) }
elseif ($dry) { Log '  [dry run] would delete both folders' } else { foreach ($g in $gk) { Remove-Tree $g } }
Log '  NOTE: the GitLens extension (VS Code, Kiro, WSL VS Code server) downloads and self-updates gk.exe for its GitKraken MCP feature and has no documented opt-out. This folder returns the next time GitLens starts unless GitLens is uninstalled (your decision: extension lists sync between laptops).'

# ---------------------------------------------------------------- 3 Python registrations
Log '== 3 stale Python 3.13.5 registrations'
$msi = [ordered]@{
  '{011563DC-4658-4F00-838A-BE003808BD5B}' = 'Documentation'; '{20342031-463F-47B0-B7D8-56D0BA99FCCC}' = 'pip Bootstrap'; '{3B9AEBC3-8AFD-40C4-8204-A3CEA6F21058}' = 'Executables'
  '{970C5B01-B0C6-4312-82D8-809E04BACDD5}' = 'Core Interpreter'; '{9CFD7F1D-07FE-4ED5-BC70-0191659412D4}' = 'Test Suite'; '{AC3F660A-8ABD-4E2A-9C2E-D9C1F734D7C9}' = 'Tcl/Tk Support'
  '{B40BFBCD-3D0F-4608-B49A-3AA1030370A0}' = 'Development Libraries'; '{CCD10098-5E72-48F8-834E-AF2364A86653}' = 'Standard Library'; '{D556EDC0-3FAA-4124-B6EF-B3F5D1839EB3}' = 'Add to Path'
  '{69012533-AE90-48A1-B7E5-7124E81C4B40}' = 'Python Launcher'
}
$bundleGuid = '{2a612b01-6a34-408a-b31b-2fa0f048823f}'
$uk = @('HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall', 'HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall')
function Count-Registered { $n = 0; foreach ($g in $msi.Keys) { foreach ($k in $uk) { if (Test-Path (Join-Path $k $g)) { $n++; break } } }; if (Test-Path ('HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\' + $bundleGuid)) { $n++ }; return $n }
function Machine-Path { $k = [Microsoft.Win32.Registry]::LocalMachine.OpenSubKey('SYSTEM\CurrentControlSet\Control\Session Manager\Environment'); $v = [string]$k.GetValue('Path', '', [Microsoft.Win32.RegistryValueOptions]::DoNotExpandEnvironmentNames); $t = $k.GetValueKind('Path'); $h = [BitConverter]::ToString([Security.Cryptography.SHA256]::Create().ComputeHash([Text.Encoding]::UTF8.GetBytes($v))).Replace('-', '').Substring(0, 16); return ('type={0} length={1} sha256={2}' -f $t, $v.Length, $h) }
$before = Count-Registered
Log ("  registered now: {0} of 11 (10 MSI components + 1 bundle)" -f $before)
$bundle = Join-Path $env:LOCALAPPDATA ('Package Cache\' + $bundleGuid + '\python-3.13.5-amd64.exe')
Log ("  bundle uninstaller present: {0}   C:\Python313 present: {1}   C:\Windows\py.exe present: {2}" -f (Test-Path $bundle), (Test-Path 'C:\Python313'), (Test-Path 'C:\Windows\py.exe'))
Log ("  Machine PATH before: {0}" -f (Machine-Path))
if ($dry) { Log '  [dry run] would run the bundle uninstaller (/uninstall /quiet /norestart), then msiexec /x for anything still registered, then re-count' }
else {
  if (Test-Path $bundle) { $p = Start-Process -FilePath $bundle -ArgumentList '/uninstall', '/quiet', '/norestart' -Wait -PassThru; Log ("  bundle uninstall exit code {0} (0 ok, 3010 reboot needed)" -f $p.ExitCode) } else { Log '  bundle uninstaller missing; going straight to msiexec' }
  foreach ($g in $msi.Keys) {
    $still = $false; foreach ($k in $uk) { if (Test-Path (Join-Path $k $g)) { $still = $true } }
    if ($still) { $p = Start-Process -FilePath 'msiexec.exe' -ArgumentList '/x', $g, '/qn', '/norestart' -Wait -PassThru; Log ("  msiexec /x {0} ({1}) exit code {2} (1605 or 1614 = already gone, 3010 = reboot)" -f $g, $msi[$g], $p.ExitCode) }
  }
  $bk = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\' + $bundleGuid
  if (Test-Path $bk) { Log '  bundle registration still present after uninstall; removing its Uninstall key (registration only, no files)'; Remove-Item -Path $bk -Recurse -Force }
  Log ("  Machine PATH after:  {0}" -f (Machine-Path))
  Log ("  registered now: {0} of 11" -f (Count-Registered))
  Log ("  C:\Windows\py.exe present: {0}" -f (Test-Path 'C:\Windows\py.exe'))
  $w = (winget list --disable-interactivity 2>$null | Select-String -Pattern 'Python 3\.13\.5|Python Launcher' | Measure-Object).Count
  Log ("  winget list still shows {0} Python 3.13.5 / Launcher row(s)" -f $w)
}
if ($dry) { Log 'DRY RUN: nothing changed.' }
Log "DONE. Log: $log"
try { Stop-Transcript | Out-Null } catch { }
