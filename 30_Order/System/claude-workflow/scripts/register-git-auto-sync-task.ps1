# Registers Jarvis-GitAutoSync: runs git-auto-sync.ps1 every 15 minutes via
# the hidden VBS launcher (no console popup, real exit code propagated).
# 15-minute cadence matches ClaudeKit-Sync-All's existing interval per
# Build 7's instructions. Idempotent: safe to re-run to update the
# registration.

$TaskName = "Jarvis-GitAutoSync"
$Launcher = Join-Path $PSScriptRoot "git-auto-sync-silent.vbs"

if (-not (Test-Path $Launcher)) {
    Write-Error "Missing launcher at $Launcher"
    exit 1
}

Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false -ErrorAction SilentlyContinue

$action = New-ScheduledTaskAction `
    -Execute "wscript.exe" `
    -Argument "//B `"$Launcher`""

$trigger = New-ScheduledTaskTrigger -Daily -At "00:03"
$trigger.Repetition = (New-ScheduledTaskTrigger -Once -At "00:03" `
    -RepetitionInterval (New-TimeSpan -Minutes 15) `
    -RepetitionDuration (New-TimeSpan -Hours 23 -Minutes 55)).Repetition

$settings = New-ScheduledTaskSettingsSet `
    -AllowStartIfOnBatteries `
    -DontStopIfGoingOnBatteries `
    -StartWhenAvailable `
    -MultipleInstances IgnoreNew `
    -Hidden

$principal = New-ScheduledTaskPrincipal -UserId $env:USERNAME -LogonType Interactive -RunLevel Limited

Register-ScheduledTask `
    -TaskName $TaskName `
    -Action $action `
    -Trigger $trigger `
    -Settings $settings `
    -Principal $principal `
    -Description "Scheduled git pull/commit/push for the Jarvis vault (Build 7). Hidden VBS launcher, no console popup, real exit code." |
    Out-Null

Write-Output "Registered scheduled task: $TaskName (every 15 min, hidden)"
Get-ScheduledTask -TaskName $TaskName | Format-List TaskName, State
(Get-ScheduledTask -TaskName $TaskName).Actions | Format-List Execute, Arguments
(Get-ScheduledTask -TaskName $TaskName).Settings | Format-List Hidden
