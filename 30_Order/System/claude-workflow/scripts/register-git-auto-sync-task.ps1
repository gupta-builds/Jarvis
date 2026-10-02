# Registers Jarvis-GitAutoSync: runs git-auto-sync.ps1 every 30 minutes via
# the hidden VBS launcher (no console popup, real exit code propagated).
#
# Build 9 (2026-10-02): widened from the original 15-minute cadence (Build
# 7/ClaudeKit-Sync-All's interval) after a full log audit — 425 logged runs,
# of which every single "CONFLICT" entry outside the initial 2026-09-20
# bootstrap traced to a transient DNS/network blip (`Could not resolve host:
# github.com`), not a real rebase conflict, and the one genuine content-loss
# incident (2026-09-29, see Cross-Laptop Sync - Build 9 Findings) came from
# the rebase/autostash checkout itself racing Syncthing's watcher, which
# happens once per run regardless of whether that run had anything to do.
# Halving the run frequency halves the number of daily windows where that
# race can occur. Syncthing already mirrors content near-real-time and keeps
# indefinite staggered version history independent of this cadence, so git's
# job here (version history + GitHub backup) does not need 15-minute
# granularity to stay safe. Idempotent: safe to re-run to update the
# registration. Re-run this same script on every machine that runs
# Jarvis-GitAutoSync — the Scheduled Task's interval is per-machine and is
# NOT carried by Syncthing just because this script file is.

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
    -RepetitionInterval (New-TimeSpan -Minutes 30) `
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

Write-Output "Registered scheduled task: $TaskName (every 30 min, hidden)"
Get-ScheduledTask -TaskName $TaskName | Format-List TaskName, State
(Get-ScheduledTask -TaskName $TaskName).Actions | Format-List Execute, Arguments
(Get-ScheduledTask -TaskName $TaskName).Settings | Format-List Hidden
