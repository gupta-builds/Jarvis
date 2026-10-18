# 07-build5-leftovers.ps1  (Build 4b, A10, 2026-10-15)  ASCII only. PowerShell 5.1 and 7 safe. No admin needed.
#   powershell -ExecutionPolicy Bypass -File D:\WSL\ops\windows\07-build5-leftovers.ps1            (dry run: reports sizes and blockers, changes nothing)
#   powershell -ExecutionPolicy Bypass -File D:\WSL\ops\windows\07-build5-leftovers.ps1 -Apply     (does what is safe, skips what is blocked)
# What it handles (approved by Anant on 2026-10-14; repo pilot and packageManager pins are NOT part of this script):
#   1. Cursor server data in WSL: ~/.cursor-server/data/snapshots and .../globalStorage/anysphere.cursor-agent-worker.
#      Moved to D:\Backup\Quarantine only when NO cursor-server process runs in WSL and NO Cursor runs on Windows. It never stops or kills anything.
#   2. Old pnpm stores: ~/.local/share/pnpm/store/v10 and ~/.pnpm-store/v10 (pnpm 12.4.2 uses store/v11). v3 (1.8 GB) is NOT touched.
#   3. Scheduled task ConversationCapture-Backfill-WSL (starts wsl.exe every 30 minutes): disabled, not deleted. Undo: Enable-ScheduledTask.
# Nothing is deleted. Undo for the moves: move the folders back (undo.txt in the quarantine folder lists the paths).
param([switch]$Apply)
$ErrorActionPreference = 'Stop'
$dry = -not $Apply
$date = Get-Date -Format 'yyyy-MM-dd'
$logDir = 'D:\WSL\ops\windows\logs'
if (-not (Test-Path $logDir)) { New-Item -ItemType Directory -Path $logDir -Force | Out-Null }
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$log = Join-Path $logDir ('build5-leftovers-' + $stamp + '.log')
try { Start-Transcript -Path (Join-Path $logDir ('build5-leftovers-' + $stamp + '.transcript.txt')) -Force | Out-Null } catch { }
function Log([string]$m) { $l = (Get-Date -Format 'HH:mm:ss') + ' ' + $m; Write-Host $l; Add-Content -Path $log -Value $l -Encoding ASCII }
Log ("build 5 leftovers. DryRun={0}  Log: {1}" -f $dry, $log)

$Distro = 'Ubuntu'
$helper = ((wsl.exe -d $Distro --exec wslpath -a 'D:\WSL\ops\windows\build5-leftovers.sh') -join '').Trim()
$wslDest = "/mnt/d/Backup/Quarantine/build5-leftovers-$date"
$winDest = "D:\Backup\Quarantine\build5-leftovers-$date"

# ---- state
$out = @(wsl.exe -d $Distro --exec bash $helper check 2>$null)
$srv = 0; $items = @()
foreach ($o in $out) {
  if ($o -match '^cursor_server=(\d+)') { $srv = [int]$Matches[1] }
  elseif ($o -match '^SIZE\|([^|]*)\|([^|]*)\|(.*)$') { $items += [pscustomobject]@{ name = $Matches[1]; size = $Matches[2]; path = $Matches[3] } }
}
$winCursor = @(Get-Process -Name Cursor -ErrorAction SilentlyContinue).Count
Log ("  cursor-server processes in WSL: {0}   Cursor processes on Windows: {1}" -f $srv, $winCursor)
foreach ($i in $items) { Log ("  {0,-20} {1,8}  {2}" -f $i.name, $i.size, $i.path) }
Log '  pnpm store v3 (1.8 GB, last written 2026-02-22) is left alone: not approved'

$undo = New-Object System.Collections.ArrayList
# ---- 1. Cursor server data
Log '== 1 Cursor server data'
if ($srv -gt 0 -or $winCursor -gt 0) {
  Log '  BLOCKED: Cursor is running (the WSL server keeps an agent worker with these folders open). Nothing was moved.'
  Log '  Close every Cursor window (including Cursor Agents), wait until `wsl.exe -d Ubuntu --exec pgrep -fa cursor-server` prints nothing (the server exits by itself after a while), then re-run.'
  Log '  This script never kills Cursor or its server.'
} elseif ($dry) { Log ("  [dry run] would move snapshots and agent-worker to {0}" -f $winDest) }
else {
  $r = @(wsl.exe -d $Distro --exec bash $helper move cursor $wslDest 2>$null)
  $r | ForEach-Object { Log ('  ' + $_) }
  foreach ($x in $r) { if ($x -match '^MOVED\|([^|]*)\|(/mnt/d[^|]*)\|0$') { [void]$undo.Add(("move back: {0} -> {1}" -f $Matches[2], ($items | Where-Object { $_.name -eq $Matches[1] }).path)) } }
}
# ---- 2. old pnpm stores
Log '== 2 old pnpm stores (v10)'
if ($dry) { Log ("  [dry run] would move store/v10 and ~/.pnpm-store/v10 to {0}" -f $winDest) }
else {
  $r = @(wsl.exe -d $Distro --exec bash $helper move pnpm $wslDest 2>$null)
  $r | ForEach-Object { Log ('  ' + $_) }
  foreach ($x in $r) { if ($x -match '^MOVED\|([^|]*)\|(/mnt/d[^|]*)\|0$') { [void]$undo.Add(("move back: {0} -> {1}" -f $Matches[2], ($items | Where-Object { $_.name -eq $Matches[1] }).path)) } }
}
# ---- 3. backfill task
Log '== 3 ConversationCapture-Backfill-WSL'
$t = Get-ScheduledTask -TaskName 'ConversationCapture-Backfill-WSL' -ErrorAction SilentlyContinue
if (-not $t) { Log '  task not found' }
else {
  Log ("  state now: {0}" -f $t.State)
  if ($t.State -eq 'Disabled') { Log '  already disabled' }
  elseif ($dry) { Log '  [dry run] would disable it (undo: Enable-ScheduledTask -TaskName ConversationCapture-Backfill-WSL)' }
  else {
    try { Disable-ScheduledTask -TaskName 'ConversationCapture-Backfill-WSL' | Out-Null; Log ("  disabled; state now {0}" -f (Get-ScheduledTask -TaskName 'ConversationCapture-Backfill-WSL').State); [void]$undo.Add('re-enable: Enable-ScheduledTask -TaskName ConversationCapture-Backfill-WSL') }
    catch { Log ("  FAILED to disable: {0}. Try once from an elevated PowerShell." -f $_.Exception.Message) }
  }
}
if (-not $dry -and $undo.Count -gt 0) {
  if (-not (Test-Path $winDest)) { New-Item -ItemType Directory -Path $winDest -Force | Out-Null }
  [IO.File]::WriteAllLines((Join-Path $winDest 'undo.txt'), [string[]](@('Undo steps for 07-build5-leftovers.ps1 run ' + (Get-Date -Format 's')) + @($undo)), (New-Object Text.ASCIIEncoding))
  Log ("  undo steps written: {0}\undo.txt" -f $winDest)
}
if ($dry) { Log 'DRY RUN: nothing changed.' }
Log "DONE. Log: $log"
try { Stop-Transcript | Out-Null } catch { }
