<#
weekly-clean.ps1   SAFE routine cleanup, run weekly by the Toolkit-Weekly-Clean scheduled task.
Only regenerable files older than a threshold are removed. Pass -DryRun to list instead of delete.
It never touches: installed programs, Spotify data, Docker, WSL, Syncthing, Google DriveFS, editors' User folders,
C:\Windows\Installer, Package Cache, WinSxS, restore points, the vault, the Claude scratch folder in Temp.
#>
param([switch]$DryRun)
$ErrorActionPreference = 'SilentlyContinue'
$logDir = 'D:\WSL\ops\windows\logs'
$log = Join-Path $logDir ("weekly-clean-{0}.log" -f (Get-Date -Format yyyyMMdd-HHmm))
Start-Transcript -Path $log | Out-Null
$startFree = (Get-PSDrive C).Free / 1GB
$script:mb = 0.0
if ($DryRun) { Write-Host '*** DRY RUN ***' }

function Purge-Old($path, $days, $label, $skipNames) {
  if (-not (Test-Path -LiteralPath $path)) { return }
  $cut = (Get-Date).AddDays(-$days); $sum = 0.0
  Get-ChildItem -LiteralPath $path -Force | Where-Object { $_.LastWriteTime -lt $cut -and ($skipNames -notcontains $_.Name) } | ForEach-Object {
    $s = if ($_.PSIsContainer) { (Get-ChildItem -LiteralPath $_.FullName -Recurse -Force -File | Measure-Object Length -Sum).Sum } else { $_.Length }
    $sum += [double]$s
    if (-not $DryRun) {
      if ($_.LinkType) { cmd /c rmdir "$($_.FullName)" | Out-Null } else { Remove-Item -LiteralPath $_.FullName -Recurse -Force -ErrorAction SilentlyContinue }
    }
  }
  $script:mb += $sum / 1MB
  Write-Host ("  {0,9:N1} MB  {1}  (older than {2} d)" -f ($sum / 1MB), $label, $days)
}

Purge-Old $env:TEMP 7 'user Temp' @('claude')
Purge-Old 'D:\Cache\Temp' 7 'D:\Cache\Temp' @()
Purge-Old 'C:\Windows\Temp' 7 'Windows Temp' @()
Purge-Old 'C:\Windows\LiveKernelReports' 3 'LiveKernelReports' @()
Purge-Old 'C:\Windows\Minidump' 7 'Minidump' @()
foreach ($w in 'ReportArchive', 'ReportQueue') { Purge-Old "C:\ProgramData\Microsoft\Windows\WER\$w" 14 "WER $w" @() }
Purge-Old (Join-Path $env:LOCALAPPDATA 'CrashDumps') 7 'user CrashDumps' @()
foreach ($u in 'loom-updater', 'obsidian-updater', 'todoist-updater', 'antigravity-updater', 'bitwarden-updater', '16x-prompt-updater', 'SquirrelTemp') {
  Purge-Old (Join-Path $env:LOCALAPPDATA $u) 14 $u @()
}
foreach ($app in 'Code', 'Cursor', 'Kiro', 'Todoist') { Purge-Old (Join-Path $env:APPDATA "$app\Crashpad\reports") 7 "$app crash reports" @() }
if (-not $DryRun) { Delete-DeliveryOptimizationCache -Force -ErrorAction SilentlyContinue }
# keep 60 days of logs
Get-ChildItem $logDir -Filter *.log -File | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-60) } | ForEach-Object { if (-not $DryRun) { Remove-Item $_.FullName -Force } }

Write-Host ("TOTAL {0:N2} GiB   C: free {1:N2} -> {2:N2} GiB" -f ($script:mb / 1024), $startFree, ((Get-PSDrive C).Free / 1GB))
Stop-Transcript | Out-Null
if (-not $DryRun) { & 'D:\WSL\ops\windows\watch-c.ps1' | Out-Null }
