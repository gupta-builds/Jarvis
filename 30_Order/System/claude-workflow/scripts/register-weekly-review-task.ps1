# Registers Jarvis-WeeklyReview: runs the /weekly-review skill headlessly
# every Friday via the hidden VBS launcher (no console popup, real exit code
# propagated). Register independently on each laptop - the skill itself
# checks the Weekly Synthesis Index for this week's entry first, so a
# duplicate fire from the other laptop is a safe no-op. Idempotent: safe to
# re-run to update the registration.

$TaskName = "Jarvis-WeeklyReview"
$Launcher = Join-Path $PSScriptRoot "weekly-review-silent.vbs"

if (-not (Test-Path $Launcher)) {
    Write-Error "Missing launcher at $Launcher"
    exit 1
}

Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false -ErrorAction SilentlyContinue

$action = New-ScheduledTaskAction `
    -Execute "wscript.exe" `
    -Argument "//B `"$Launcher`""

$trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Friday -At "09:00"

$settings = New-ScheduledTaskSettingsSet `
    -AllowStartIfOnBatteries `
    -DontStopIfGoingOnBatteries `
    -StartWhenAvailable `
    -MultipleInstances IgnoreNew `
    -Hidden `
    -ExecutionTimeLimit (New-TimeSpan -Hours 1)

$principal = New-ScheduledTaskPrincipal -UserId $env:USERNAME -LogonType Interactive -RunLevel Limited

Register-ScheduledTask `
    -TaskName $TaskName `
    -Action $action `
    -Trigger $trigger `
    -Settings $settings `
    -Principal $principal `
    -Description "Headless /weekly-review skill run (log maintenance + vault synthesis), Fridays 09:00. Hidden VBS launcher, real exit code." |
    Out-Null

Write-Output "Registered scheduled task: $TaskName (Fridays 09:00, hidden)"
Get-ScheduledTask -TaskName $TaskName | Format-List TaskName, State
(Get-ScheduledTask -TaskName $TaskName).Actions | Format-List Execute, Arguments
(Get-ScheduledTask -TaskName $TaskName).Triggers | Format-List DaysOfWeek, StartBoundary
