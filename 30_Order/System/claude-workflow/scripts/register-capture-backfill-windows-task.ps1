# Registers ConversationCapture-Backfill-Windows on this machine: runs
# backfill-windows-silent.vbs every 30 minutes (hidden, real exit code, then
# the capture-health update). Settings mirror the Dell's task of the same name,
# read from the Dell on 2026-10-17: PT30M repetition for P3650D, RestartCount 3,
# RestartInterval PT2M, Hidden, StartWhenAvailable, 10 minute limit,
# MultipleInstances IgnoreNew. Runs in the user's own context (Interactive,
# Limited). Unlike the Dell's task it also runs on battery, matching the other
# Acer tasks.
#
# Dry run by default: prints what would change. Add -Apply to register.
# Safe to run twice: an existing task is replaced.
#
#   powershell -NoProfile -ExecutionPolicy Bypass -File register-capture-backfill-windows-task.ps1
#   powershell -NoProfile -ExecutionPolicy Bypass -File register-capture-backfill-windows-task.ps1 -Apply

param(
    [switch]$Apply
)

$env:PSModulePath = [Environment]::GetEnvironmentVariable('PSModulePath', 'Machine')
$ErrorActionPreference = "Stop"

$TaskName = "ConversationCapture-Backfill-Windows"
$Launcher = Join-Path $PSScriptRoot "backfill-windows-silent.vbs"
$LogDir = Join-Path $env:LOCALAPPDATA "claude-capture"
$LogPath = Join-Path $LogDir "register-task.log"

function Write-Log {
    param([string]$Message)
    $line = "$((Get-Date).ToString('yyyy-MM-ddTHH:mm:ss')) $Message"
    Write-Output $line
    if (-not (Test-Path -LiteralPath $LogDir)) { New-Item -ItemType Directory -Path $LogDir -Force | Out-Null }
    Add-Content -LiteralPath $LogPath -Value $line
}

$machine = [Environment]::MachineName.ToLowerInvariant()
if ($machine -ne 'gupta-builds') {
    Write-Log "Refusing to run on host '$machine': this script registers the Acer task only."
    exit 1
}
if (-not (Test-Path -LiteralPath $Launcher)) {
    Write-Log "Missing launcher at $Launcher"
    exit 1
}

$existing = Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue
if ($existing) { Write-Log "Existing task found (state $($existing.State)); it would be replaced." }
else { Write-Log "No existing task named $TaskName." }

$action = New-ScheduledTaskAction -Execute "wscript.exe" -Argument "//B `"$Launcher`""

$start = (Get-Date).Date.AddMinutes(3)
$trigger = New-ScheduledTaskTrigger -Once -At $start `
    -RepetitionInterval (New-TimeSpan -Minutes 30) `
    -RepetitionDuration (New-TimeSpan -Days 3650)

$settings = New-ScheduledTaskSettingsSet `
    -AllowStartIfOnBatteries `
    -DontStopIfGoingOnBatteries `
    -StartWhenAvailable `
    -MultipleInstances IgnoreNew `
    -Hidden `
    -RestartCount 3 `
    -RestartInterval (New-TimeSpan -Minutes 2) `
    -ExecutionTimeLimit (New-TimeSpan -Minutes 10)

$principal = New-ScheduledTaskPrincipal -UserId $env:USERNAME -LogonType Interactive -RunLevel Limited

Write-Log "Plan: every 30 min from $($start.ToString('yyyy-MM-dd HH:mm')), RestartCount 3, RestartInterval PT2M, hidden, user $($env:USERNAME), action wscript.exe //B $Launcher"

if (-not $Apply) {
    Write-Log "Dry run only. Re-run with -Apply to register."
    exit 0
}

if ($existing) { Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false }
Register-ScheduledTask -TaskName $TaskName -Action $action -Trigger $trigger -Settings $settings -Principal $principal `
    -Description "Safety-net backfill of Windows Claude Code and Cowork sessions into the Jarvis vault (build 5c, Acer)." | Out-Null

$t = Get-ScheduledTask -TaskName $TaskName
$s = $t.Settings
Write-Log "Registered $TaskName state=$($t.State) interval=$($t.Triggers[0].Repetition.Interval) restartCount=$($s.RestartCount) restartInterval=$($s.RestartInterval) hidden=$($s.Hidden)"
