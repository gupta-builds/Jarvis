---
type: system
status: sprout
created: 2026-09-19
updated: 2026-10-17
tags:
  - system
  - tooling
  - sync
system_kind: spec
trigger: Windows Task Scheduler job Jarvis-Syncthing-Health, every 5 minutes, run hidden through check-syncthing-status-silent.vbs. Log rotation is run by hand.
owner: Anant. A problem shows as a banner at the top of 00_Dashboard and as a Windows toast.
notes:
  - "[[Orchestration]]"
  - "[[Memory Management]]"
---
# Sync Workflow
## Purpose
Answers one question every five minutes: is the vault folder really synced between the laptops right now, and is git still committing it? Syncthing keeps the working tree converged in real time and git-auto-sync records history, so a silent failure of either leaves the two laptops quietly different. A Task Scheduler exit code is not a warning if nothing shows it, so this check raises a banner and a toast.
## Trigger
`Jarvis-Syncthing-Health` repeats every 5 minutes (a 3650-day repetition from 2026-09-20) and runs `scripts/check-syncthing-status-silent.vbs`, which runs `scripts/check-syncthing-status.ps1` hidden, waits, and returns its real exit code. No registration script is kept in this repo; the task was created by hand, so recreate it from the values above on a new machine. `scripts/rotate-sync-logs.ps1` is run manually.
## Inputs and Outputs
Reads Syncthing's REST API (`http://127.0.0.1:8384`, folder id `jarvis`) with the API key from `%LOCALAPPDATA%\Syncthing\config.xml`, and the tail of `30_Order/System/claude-workflow/logs/git-auto-sync.log`. It reports a problem when Syncthing is not running (and tries to start it), the GUI listener on port 8384 is not owned by exactly one Syncthing process, the API is unreachable, the folder still needs files or bytes or has errors, live `*.sync-conflict-*` files or stuck `~syncthing~*.tmp` files exist (`.stversions` and `99_Archive` are excluded), a remote device cannot be reached, or git-auto-sync's latest run ended `FAILED`. On a problem it writes `Sync Alert Banner.md` in this folder and, once, a static embed line into `00_Dashboard.md` between `<!-- SYNC-ALERT:BEGIN -->` and `<!-- SYNC-ALERT:END -->`, so the changing text never edits the dashboard itself. It sends a Windows toast on first detection and then every 12th tick (hourly), and a recovery toast when it clears. Exit 0 means synced (or no remote device yet); exit 1 means a problem.
`rotate-sync-logs.ps1` trims the Unison `Sync-Log.md` files (`20_Progress/AI/Claude Code/*/Sync-Log.md` and `_All-Projects-Sync-Log.md` if it exists) to 7 days by default. It is a dry run unless `-Apply` is passed, and moves old lines into `Sync-Log-Archive-<date>.md` next to the source; nothing is deleted. Run `-Apply` only when no sync is writing the file.
## State
Ignored by git: `Sync Alert Banner.md` (generated; its content changes per machine), `scripts/.sync-alert-state.json` (the consecutive-failure count that rate-limits toasts), and `scripts/.syncthing-exe-path.txt` (a cache used to restart Syncthing). The banner is exempt from Standards because a script rewrites it and it is empty when everything is healthy.
## Failure Behavior
It always reaches the alert step; it never exits early before the problem list is built. A failed toast never changes the exit code. If Syncthing's config or API key is missing it reports that as a problem and exits 1. The launcher returns the real exit code, so the task's last result is 1 while a problem stands. A problem it cannot fix itself needs a human: read each conflict file against its canonical copy before touching it, and never bulk-discard.
## Verify
```powershell
Get-ScheduledTask -TaskName Jarvis-Syncthing-Health | Get-ScheduledTaskInfo
powershell -File 30_Order\System\sync-workflow\scripts\check-syncthing-status.ps1
```
A healthy run prints the folder state with `needFiles : 0` and exits 0, and the banner file is empty. Make one deliberate test change on the other laptop and confirm it arrives and the banner stays clear.
## Retire
Unregister `Jarvis-Syncthing-Health`, remove the `SYNC-ALERT` embed lines from `00_Dashboard.md`, and delete this folder's scripts in one commit that states the reason. Syncthing itself is a separate install and is not affected.
