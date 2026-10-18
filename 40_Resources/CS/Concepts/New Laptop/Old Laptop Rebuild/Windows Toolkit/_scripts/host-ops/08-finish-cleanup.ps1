<#
08-finish-cleanup.ps1   (ELEVATED PowerShell; a dry run also works from a normal shell)
Default is a DRY RUN. Add -Apply to act. Run 06 -StoreApps -Apply FIRST.
  1  Respondus cache folder that script 05 could not remove
  2  empty leftover folders of removed apps (explicit list; each is checked to contain no files)
  3  Spotify: close it (-CloseSpotify), set offline storage to D:\Cache\Spotify, cap the cache, empty Local\Spotify\Data
  4  Downloads: move the remaining installers (.exe/.msi) to quarantine (-KeepInstallers skips this)
  5  archive the finished one-time scripts to D:\WSL\ops\windows\archive\build3-20261012
Kept in place: 04-admin-remove.ps1 (Python/Chocolatey/.NET 8 wait for Build 4), weekly-clean.ps1, watch-c.ps1, logs, watch, backup-20261012-1807.
Not touched: the ~50 empty-looking agent dot-folders (.adal, .agents, .hermes ...): they hold skill junctions, a separate task.
#>
param([switch]$Apply, [switch]$CloseSpotify, [switch]$KeepInstallers)
$ErrorActionPreference = 'Continue'
$admin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if ($Apply -and -not $admin) { throw 'Run -Apply from an elevated PowerShell.' }
$log = "D:\WSL\ops\windows\logs\08-finish-cleanup-$(Get-Date -Format yyyyMMdd-HHmm).log"
Start-Transcript -Path $log | Out-Null
if (-not $Apply) { Write-Host '*** DRY RUN (nothing changes). Re-run with -Apply ***' -ForegroundColor Yellow }
$startFree = (Get-PSDrive C).Free / 1GB
$L = $env:LOCALAPPDATA; $R = $env:APPDATA

function Get-MB($p) { $it = Get-Item -LiteralPath $p -Force -ErrorAction SilentlyContinue; if (-not $it) { return 0 }; if (-not $it.PSIsContainer) { return [math]::Round($it.Length / 1MB, 1) }; [math]::Round(((Get-ChildItem -LiteralPath $p -Recurse -Force -File -ErrorAction SilentlyContinue | Measure-Object Length -Sum).Sum) / 1MB, 1) }
function Remove-Force($p) {
  Remove-Item -LiteralPath $p -Recurse -Force -ErrorAction SilentlyContinue
  if (Test-Path -LiteralPath $p) { takeown /f "$p" /r /d y 2>$null | Out-Null; icacls "$p" /grant "$($env:USERNAME):(OI)(CI)F" /t /c 2>$null | Out-Null; cmd /c rd /s /q "\\?\$p" 2>$null }
  -not (Test-Path -LiteralPath $p)
}

Write-Host "`n--- 1 Respondus cache (app already uninstalled)"
$rs = "$L\Respondus"
if (Test-Path -LiteralPath $rs) { Write-Host ("   {0:N1} MB  {1}" -f (Get-MB $rs), $rs); if ($Apply) { Write-Host ("   removed: {0}" -f (Remove-Force $rs)) } } else { Write-Host '   already gone' }

Write-Host "`n--- 2 Empty leftover folders (removed only if they contain no files)"
$empties = @("$L\DBG", "$L\main.kts.compiled.cache", "$L\ms-playwright-go", "$L\PackageManagement", "$L\PeerDistRepub", "$L\NEO", "$R\Adobe", "$R\Dell",
  'C:\Program Files\JetBrains', 'C:\Program Files\HPPrintScanDoctor', 'C:\Program Files\Logi', 'C:\Program Files (x86)\Microsoft Office', 'C:\Program Files (x86)\Temp', 'C:\ProgramData\Logishrd')
foreach ($e in $empties) {
  if (-not (Test-Path -LiteralPath $e)) { continue }
  $it = Get-Item -LiteralPath $e -Force
  if ($it.LinkType) { Write-Host "   skip (link): $e"; continue }
  if (Get-ChildItem -LiteralPath $e -Recurse -Force -File -ErrorAction SilentlyContinue | Select-Object -First 1) { Write-Host "   skip (has files): $e"; continue }
  if (($e -like 'C:\Program Files*' -or $e -like 'C:\ProgramData*') -and -not $admin) { Write-Host "   needs admin (skipped in this dry run): $e"; continue }
  Write-Host "   empty: $e"
  if ($Apply) { Write-Host ("      removed: {0}" -f (Remove-Force $e)) }
}

Write-Host "`n--- 3 Spotify"
$sp = Get-Process -Name Spotify -ErrorAction SilentlyContinue
if ($sp -and -not $CloseSpotify) { Write-Host '   Spotify is running. Quit it from the tray, or re-run with -CloseSpotify. Skipped.' -ForegroundColor Yellow }
else {
  if ($sp) { Write-Host '   closing Spotify'; if ($Apply) { Stop-Process -Name Spotify -Force -ErrorAction SilentlyContinue; Start-Sleep -Seconds 3 } }
  $prefs = "$R\Spotify\prefs"; $data = "$L\Spotify\Data"
  Write-Host ("   cache to empty: {0:N2} GB  {1}" -f ((Get-MB $data) / 1024), $data)
  Write-Host '   prefs: storage.location="D:\\Cache\\Spotify"  and  storage.size=1024 (MB cache cap)   [key names from community docs, check Settings > Storage after launch]'
  if ($Apply) {
    New-Item -ItemType Directory -Force -Path 'D:\Cache\Spotify', 'D:\WSL\ops\backups' | Out-Null
    if (Test-Path -LiteralPath $prefs) {
      Copy-Item -LiteralPath $prefs -Destination ("D:\WSL\ops\backups\spotify-prefs-{0}.bak" -f (Get-Date -Format yyyyMMdd-HHmm)) -Force
      $lines = @(Get-Content -LiteralPath $prefs | Where-Object { $_ -notmatch '^storage\.location=' -and $_ -notmatch '^storage\.size=' })
      $lines += 'storage.location="D:\\Cache\\Spotify"'; $lines += 'storage.size=1024'
      [IO.File]::WriteAllLines($prefs, $lines, (New-Object System.Text.UTF8Encoding($false)))
      Write-Host '   prefs updated (backup in D:\WSL\ops\backups)'
    } else { Write-Host '   no prefs file yet; start Spotify once, quit it, re-run' -ForegroundColor Yellow }
    if (Test-Path -LiteralPath $data) { Get-ChildItem -LiteralPath $data -Force -ErrorAction SilentlyContinue | ForEach-Object { Remove-Item -LiteralPath $_.FullName -Recurse -Force -ErrorAction SilentlyContinue }; Write-Host ("   Data now {0:N2} GB" -f ((Get-MB $data) / 1024)) }
  }
}

Write-Host "`n--- 4 Downloads installers"
$dl = [Environment]::ExpandEnvironmentVariables((Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders').'{374DE290-123F-4565-9164-39C4925E467B}')
$q = 'D:\Quarantine\c-deep-clean-review-2026-11-11\Downloads_installers'
if ($KeepInstallers) { Write-Host '   skipped (-KeepInstallers)' }
else {
  Get-ChildItem -LiteralPath $dl -File -Force -ErrorAction SilentlyContinue | Where-Object { $_.Extension -in '.exe', '.msi' } | ForEach-Object {
    Write-Host ("   {0,7:N1} MB  {1}" -f ($_.Length / 1MB), $_.Name)
    if ($Apply) { New-Item -ItemType Directory -Force -Path $q | Out-Null; Move-Item -LiteralPath $_.FullName -Destination $q -Force -ErrorAction SilentlyContinue }
  }
  Write-Host ('   left in Downloads (your documents, review by hand): ' + ((Get-ChildItem -LiteralPath $dl -File -Force -ErrorAction SilentlyContinue | Where-Object { $_.Name -ne 'desktop.ini' -and $_.Extension -notin '.exe', '.msi' } | Select-Object -ExpandProperty Name) -join ', '))
}

Write-Host "`n--- 5 Archive finished one-time scripts"
$gone = $false
if ($admin) { try { $gone = -not (Get-AppxPackage -AllUsers -ErrorAction Stop | Where-Object { $_.Name -match 'MSTeams|LinkedInforWindows|Netflix|HPPrinterControl' }) } catch { $gone = $false } }
$arc = 'D:\WSL\ops\windows\archive\build3-20261012'
$files = '01-user-cleanup.ps1', '02-admin-cleanup.ps1', '03-user-tidy.ps1', '05-user-deep-clean.ps1', '06-admin-deep-clean.ps1', '07-register-watch-tasks.ps1', 'diag-pagefile-bitlocker.ps1', 'diag-pagefile-bitlocker-20261011-1905.txt'
if (-not $admin) { Write-Host '   (cannot check Store apps without admin; shown as a plan only)' }
elseif (-not $gone) { Write-Host '   Store apps still installed: run 06-admin-deep-clean.ps1 -StoreApps -Apply first. Archive skipped.' -ForegroundColor Yellow }
if ($gone -or (-not $admin -and -not $Apply)) {
  foreach ($f in $files) {
    $src = "D:\WSL\ops\windows\$f"
    if (-not (Test-Path -LiteralPath $src)) { continue }
    Write-Host "   $f -> $arc"
    if ($Apply) { New-Item -ItemType Directory -Force -Path $arc | Out-Null; Move-Item -LiteralPath $src -Destination $arc -Force }
  }
}

Write-Host ("`nEND  C: free {0:N2} -> {1:N2} GiB   log: {2}" -f $startFree, ((Get-PSDrive C).Free / 1GB), $log)
Stop-Transcript | Out-Null
