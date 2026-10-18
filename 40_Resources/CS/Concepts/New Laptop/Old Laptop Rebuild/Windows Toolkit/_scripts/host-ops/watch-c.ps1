<#
watch-c.ps1   READ-ONLY watcher (never deletes anything)
Runs daily from the Toolkit-Watch-C scheduled task. Appends one row to watch\watch-history.csv,
rewrites watch\latest.json, and writes watch\ALERTS.txt (removed when everything is fine).
Pass -Quiet to skip the Windows toast.
#>
param([switch]$Quiet)
$ErrorActionPreference = 'SilentlyContinue'
$dir = 'D:\WSL\ops\windows\watch'
New-Item -ItemType Directory -Force -Path $dir | Out-Null
function GB($b) { [math]::Round(([double]$b) / 1GB, 2) }
function DirGB($p) { if (Test-Path -LiteralPath $p) { GB ((Get-ChildItem -LiteralPath $p -Recurse -Force -File -ErrorAction SilentlyContinue | Measure-Object Length -Sum).Sum) } else { 0 } }
function FileGB($p) { if (Test-Path -LiteralPath $p) { GB (Get-Item -LiteralPath $p -Force).Length } else { 0 } }

$c = Get-PSDrive C; $d = Get-PSDrive D
$pf = Get-CimInstance Win32_PageFileUsage | Select-Object -First 1
$bat = Get-CimInstance Win32_Battery | Select-Object -First 1
$boot = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
$row = [ordered]@{
  time            = (Get-Date).ToString('s')
  c_free_gb       = GB $c.Free
  d_free_gb       = GB $d.Free
  pagefile_use_mb = $pf.CurrentUsage
  temp_user_gb    = DirGB $env:TEMP
  temp_d_gb       = DirGB 'D:\Cache\Temp'
  live_kernel_gb  = DirGB 'C:\Windows\LiveKernelReports'
  wer_gb          = DirGB 'C:\ProgramData\Microsoft\Windows\WER'
  cache_dot_gb    = DirGB "$env:USERPROFILE\.cache"
  npm_roaming_gb  = DirGB "$env:APPDATA\npm"
  spotify_gb      = DirGB "$env:LOCALAPPDATA\Spotify"
  packages_gb     = DirGB "$env:LOCALAPPDATA\Packages"
  driveFS_gb      = DirGB "$env:LOCALAPPDATA\Google\DriveFS"
  ubuntu_vhdx_gb  = FileGB 'D:\WSL\Ubuntu\ext4.vhdx'
  docker_vhdx_gb  = FileGB 'D:\WSL\Docker\DockerDesktopWSL\disk\docker_data.vhdx'
  wsl_swap_gb     = FileGB 'D:\WSL\swap.vhdx'
  backup_gb       = DirGB 'D:\Backup'
  quarantine_gb   = DirGB 'D:\Quarantine'
  battery_pct     = $bat.EstimatedChargeRemaining
  on_ac           = [int]($bat.BatteryStatus -eq 2)
  uptime_days     = [math]::Round(((Get-Date) - $boot).TotalDays, 1)
  syncthing_up    = [int][bool](Get-Process syncthing)
}

$alerts = @()
if ($row.c_free_gb -lt 60)  { $alerts += "CRITICAL: C: free is $($row.c_free_gb) GiB (limit 60)" }
elseif ($row.c_free_gb -lt 80) { $alerts += "WARN: C: free is $($row.c_free_gb) GiB (limit 80)" }
if ($row.d_free_gb -lt 100) { $alerts += "WARN: D: free is $($row.d_free_gb) GiB (limit 100)" }
if ($row.live_kernel_gb -gt 0.5) { $alerts += "WARN: LiveKernelReports holds $($row.live_kernel_gb) GiB (USB-C / driver watchdog dumps; weekly clean removes them, update Dell drivers if they return)" }
if ($row.temp_user_gb -gt 3) { $alerts += "WARN: user Temp is $($row.temp_user_gb) GiB" }
if ($row.wsl_swap_gb -gt 4) { $alerts += "WARN: WSL swap.vhdx is $($row.wsl_swap_gb) GiB (memory pressure inside WSL)" }
if ($row.pagefile_use_mb -gt 12288) { $alerts += "WARN: pagefile in use $($row.pagefile_use_mb) MB of 16-32 GB" }
if ($row.packages_gb -gt 4) { $alerts += "NOTE: Local\Packages is $($row.packages_gb) GiB" }
if ($row.uptime_days -gt 21) { $alerts += "NOTE: up for $($row.uptime_days) days - pick a night to reboot for updates" }
if (-not $row.syncthing_up) { $alerts += 'WARN: Syncthing is not running' }
$q = Get-ChildItem 'D:\Quarantine' -Directory -Filter 'c-cleanup-review-*' | Select-Object -First 1
if ($q -and $q.Name -match '(\d{4}-\d{2}-\d{2})$') { if ((Get-Date) -ge [datetime]$Matches[1]) { $alerts += "NOTE: quarantine review date $($Matches[1]) has arrived: $($q.FullName) ($($row.quarantine_gb) GiB)" } }

$csv = Join-Path $dir 'watch-history.csv'
$hist = if (Test-Path $csv) { Import-Csv $csv } else { @() }
$old = $hist | Where-Object { [datetime]$_.time -lt (Get-Date).AddDays(-6) } | Select-Object -Last 1
if ($old) {
  foreach ($k in 'ubuntu_vhdx_gb', 'docker_vhdx_gb') {
    $grow = [double]$row[$k] - [double]$old.$k
    if ($grow -gt 5) { $alerts += ("WARN: {0} grew {1:N1} GiB in a week" -f $k, $grow) }
  }
  $drop = [double]$old.c_free_gb - [double]$row.c_free_gb
  if ($drop -gt 10) { $alerts += ("WARN: C: free fell {0:N1} GiB in a week" -f $drop) }
}
$obj = [pscustomobject]$row
if (Test-Path $csv) { $obj | Export-Csv -Path $csv -Append -NoTypeInformation } else { $obj | Export-Csv -Path $csv -NoTypeInformation }
($row | ConvertTo-Json) | Set-Content -Path (Join-Path $dir 'latest.json') -Encoding ASCII

$af = Join-Path $dir 'ALERTS.txt'
if ($alerts.Count) {
  (@("Alerts at $($row.time)") + $alerts) | Set-Content -Path $af -Encoding ASCII
  if (-not $Quiet) {
    try {
      [void][Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime]
      $xml = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType]::ToastText02)
      $t = $xml.GetElementsByTagName('text')
      [void]$t.Item(0).AppendChild($xml.CreateTextNode('Laptop watch: ' + $alerts.Count + ' alert(s)'))
      [void]$t.Item(1).AppendChild($xml.CreateTextNode($alerts[0]))
      [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier('Toolkit Watch').Show([Windows.UI.Notifications.ToastNotification]::new($xml))
    } catch { }
  }
} elseif (Test-Path $af) { Remove-Item $af -Force }
$row.GetEnumerator() | ForEach-Object { '{0,-16} {1}' -f $_.Key, $_.Value }
if ($alerts.Count) { '--- ALERTS'; $alerts }
