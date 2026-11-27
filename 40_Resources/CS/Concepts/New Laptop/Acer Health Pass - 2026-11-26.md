---
type: reference
status: sprout
created: 2026-11-27
updated: 2026-11-27
tags:
  - machine
  - acer
  - health
reference_kind: runbook
machine: acer
notes:
  - "[[Acer Live State — 2026-09-16]]"
  - "[[Installations]]"
  - "[[C Drive Bloat - Failure Log and Prevention Rules]]"
  - "[[Local AI Memory Budget]]"
  - "[[Hermes Map]]"
next: "Run ops-16-ssd-log.ps1 for after-restart (new session, same prompt), then after-shutdown. Pagefile check on or after 2026-12-03."
---
# Acer Health Pass - 2026-11-26
## Why This Note Exists
The Acer (GUPTA-BUILDS) needed three things at once: a slim C:, about 22 GB of free RAM for local models, and an SSD that an NVIDIA driver bug was not wearing down. This note records every change made on 2026-11-26 and 2026-11-27, the evidence for each, how to undo each one, and what is still being measured. The scripts and logs live in `D:\WSL\ops\windows` (outside the vault), and `ops-90-verify.ps1` is the single check that all of it still holds.
## Gate
Run before undoing anything on this list:
1. `powershell -NoProfile -ExecutionPolicy Bypass -File D:\WSL\ops\windows\ops-90-verify.ps1` ends with `FAIL=0`. Last run 2026-11-27 02:41: PASS=66, FAIL=0, PENDING=4.
2. Elevated scripts run only through `ops-elevate.ps1 -Run "script args"`, and the owner clicks the UAC prompt.
3. Do not touch `D:\AI`, `D:\Apps\Hermes`, any `D:\WSL` `.vhdx`, Syncthing data or Claude transcripts. Never stop a process by the name `claude.exe`, because the Claude Code CLI uses it too.
## Steps
Each step says what changed, and how to undo it. Steps marked (state change) alter the machine; the undo for each is a script switch, not a manual edit.
1. **NVIDIA write bug (state change, registry and service).** Driver 621.14 and 621.24 had `NVDisplay.Container.exe` rewriting `C:\ProgramData\NVIDIA Corporation\nvtopps\nct\nvlog.nvlgstg` constantly. Driver 621.40 is installed and still wrote 0.11 to 0.35 GB per hour from the container, so the `_nvtopps` plugin is now disabled: `DisableLoad=1` under `HKLM\SYSTEM\CurrentControlSet\Services\NVDisplay.ContainerLocalSystem\Parameters\LocalSystem\_nvtopps` (`ops-96-nvtopps-off.ps1`). The SYSTEM task `Toolkit-Guard-NvTopps` (at start-up and daily 12:00) sets the value again after a driver update. Possible cost, unverified: WhisperMode and Battery Boost, which the plugin appears to carry. Undo, elevated: `ops-elevate.ps1 -Run "ops-96-nvtopps-off.ps1 -Rollback"`. It removes the value and the guard task, and restarts the container. Test the guard with `-TestGuard`.
2. **Claude Cowork VM off (state change, task and service).** Claude Desktop's startup task is off and no VM runs (`ops-95-cowork-off.ps1`). Opening Claude Desktop by hand starts the 4 GB VM again, so close the app before loading a model. The 9 GB bundle in Claude-Data is kept on purpose: deleting it frees no RAM and forces a 1.3 GB re-download with about 9 GB of writes. `CoworkVMService` restarts by itself and sits idle without a VM. Undo: `ops-95-cowork-off.ps1 -Rollback`.
3. **Apps removed (state change).** Teams and its Office add-in, OneDrive, the Copilot app, and 19 Store apps including Dropbox OEM, Mixed Reality Link and Power Automate Desktop (`ops-30-appx-user.ps1`, `ops-40-admin-remove.ps1`). What was removed is saved in `state\ops-30-appx-user-removed.json` and `state\ops-40-admin-removed.json`, and the watcher alerts if any of it returns. Undo: reinstall from the Microsoft Store, or `winget install Microsoft.OneDrive` for OneDrive.
4. **Startup trimmed (state change, per user).** Docker Desktop, Loom, Slack, OneDrive and RiotClient are disabled in StartupApproved, and the broken task `Startup-Delayed-Toggl` is removed (Toggl still starts by its own Run entry). Undo: `ops-20-startup-trim.ps1 -Rollback`, which restores the saved task XML.
5. **Tool caches moved to `D:\Cache\<tool>` (state change, user environment variables).** `TEMP` and `TMP` stay on C: because Claude Cowork breaks otherwise. Undo: `ops-10-cache-env.ps1 -Rollback`.
6. **Scheduled tasks (state change).** `Toolkit-Weekly-Clean` (Sunday 03:30), `Toolkit-Watch-C` (08:00 and 20:00), `Toolkit-Guard-Statusline` (every 15 minutes), plus the SYSTEM task from step 1. The old `WeeklyCacheCleanup` is disabled, not deleted. Undo: `ops-50-register-tasks.ps1 -Rollback`.
7. **Status line guard (state change).** The `statusLine` command has a 10 s timeout and the guard stops `statusline.sh` shells older than 10 minutes (`ops-71-statusline-timeout.ps1`, `ops-70-statusline-guard.ps1`). The VS Code settings backup is `state\vscode-settings-before-20261126.json`.
8. **Monitoring (read-only).** `watch-c.ps1` appends a row to `watch\watch-history.csv`, rewrites `watch\latest.json` and writes `watch\ALERTS.txt`, which exists only while something is wrong. Read `ALERTS.txt` first, then `ops-90-verify.ps1`. Logs for every script are in `logs\`.
9. **CrystalDiskInfo startup (state change, task).** Function > Startup creates the task `CrystalDiskInfo` (logon trigger, run level Highest) so its 10-minute SMART history keeps logging. Undo: untick Function > Startup in its window.
10. **Before loading a big model (the owner runs it).** `ops-85-model-mode.ps1` closes ChatGPT and Toggl politely, reports RAM and prints PASS or FAIL against 22 GB. Switches: `-StopMinerU`, `-StopDocker`, `-StopWsl`, `-Apps "A,B"`, `-Force`, `-TargetFreeGB`. Add `-WhatIf` first for a dry run.
11. **SSD counter test (the owner acts, the script records).** Per step: perform the action, open CrystalDiskInfo, press F5, read Unsafe Shutdowns, then `ops-16-ssd-log.ps1 -Label <label> -UnsafeShutdowns <value>`. Labels in order: `after-sleep`, `after-restart`, `after-shutdown`. Power cycles should rise by 1 per restart or shutdown, and unsafe shutdowns should stay at 26.
## Checkpoints
**2026-11-26, Acer:** Baseline SSD row: 4954 GB written, 90 power cycles, 26 unsafe shutdowns, health 0% used, 100% spare, 0 media errors. The write bug was confirmed in drivers 621.14 and 621.24, and 621.40 still wrote 0.11 to 0.35 GB per hour from the container. Whole-disk writes while working were 0.46 to 0.85 MB/s. After step 1 `nvlog.nvlgstg` was gone and the container wrote 0.00 MB in 60 s.
**2026-11-26, Acer:** The watcher's first row is 19:12. Most fixes landed around 23:40. Last watcher row at 23:42: C: free 152.4 GB, D: free 535.8 GB, RAM available 11.4 GB with the normal apps open, commit 30.7 of 70.9 GB, 24-hour SSD writes 20 GB.
**2026-11-27, Acer:** `ops-90-verify.ps1` at 02:41: PASS=66, FAIL=0, PENDING=4. The only watcher alert was `NOTE: task Jarvis-Syncthing-Health last result 1`.
**2026-11-27, Acer:** Clean idle test, 04:12 to 04:22 (605 s, no keyboard or mouse input, log `logs\ops-15-idle-write-20261127-041208.txt`). `NVDisplay.Container.exe` wrote 0.0 MB (0.000 GB per hour) and `nvlog.nvlgstg` was absent. Idle-only disk writes were 0.08 MB/s, 0.27 GB per hour over 116 samples, against a lifetime average of about 3.4 GB per hour. Top I/O processes: SearchIndexer.exe 4.9 MB, svchost.exe 4.3 MB, System 2.2 MB, Registry 1.5 MB. Busiest folder by change events: `D:\Apps\Hermes` (714 events).
**2026-11-27, Acer:** SSD row `after-sleep`. Windows logged Modern Standby from 04:31:23 to 04:34:28 (about 3 minutes). CrystalDiskInfo, launched fresh and elevated, showed Unsafe Shutdowns 0x1A = 26, Power Cycles 0x5A = 90, Total Host Writes 4991 GB, Power On Hours 1478. Against `pre-sleep` (19:47): host writes +31 GB, power cycles +0, unsafe shutdowns +0. The 31 GB covers 8.8 hours of use, mostly the evening before the NVIDIA fix (about 3.5 GB per hour), so it says nothing about sleep itself. Power cycles and unsafe shutdowns did not move across sleep, which is the result the test wanted.
**2026-11-27, Acer:** CrystalDiskInfo Function > Startup enabled by the owner. The task `CrystalDiskInfo` appeared at 04:36 with a logon trigger and run level Highest.
## Open Questions
1. **SSD steps still pending:** `after-restart` and `after-shutdown`. Each ends the Claude session. To continue, start a new session in the vault folder and paste the same prompt again: task 1 finds the next missing label. Expected: power cycles 91 after restart and 92 after shutdown, unsafe shutdowns still 26. A rise in unsafe shutdowns is reported as measured, not explained away.
2. **Pagefile (trigger: on or after 2026-12-03).** `ops-80-pagefile.ps1` refuses until `watch-history.csv` spans 7 days. It takes the highest `commit_used_gb` from every row, so rows from before the fixes inflate it. On 2026-11-27 it reported 8 rows over 0.2 days, highest commit 35.5 GB (all before the fixes; the rows after 23:40 peak at 30.8 GB) and recommended initial 16384 MB, maximum 32768 MB. The 32768 MB floor decides that figure, so the inflated peak changes nothing today. Read the recommendation again on the day. The script was not changed.
3. **Model mode (trigger: before loading a model of about 22 GB).** Run step 10, close Claude Desktop first, and read the PASS or FAIL line.
4. **Office kept.** Microsoft 365 / Office was left out of the removal batch by decision. Revisit only if a reason appears.
5. **Phone Link and Cross Device kept.** The owner's phone is paired and in use.
6. **Unverified cost of step 1.** WhisperMode and Battery Boost may be gone with the plugin. If battery life or fan behavior changes, run the `-Rollback` from step 1 and expect the write bug to return.
7. **Syncthing.** The task `Jarvis-Syncthing-Health` returns 1 (the other device is not fully synced). It returned 1 at 23:41 on 2026-11-26 and again at 04:34 on 2026-11-27. Observed only, not investigated. See [[Cross-Laptop Sync - Known Failure Modes and Prevention]].
## Related Notes
- [[Acer Live State — 2026-09-16]]: the Acer's running checkpoint record, which points here for this pass
- [[Installations]]: the Windows software list, now without Teams, OneDrive, Copilot and the 19 Store apps
- [[C Drive Bloat - Failure Log and Prevention Rules]]: the earlier C: failure log for the Dell, with the growth rules this pass applies to the Acer
- [[Local AI Memory Budget]]: the RAM budget that the 22 GB target comes from
- [[Hermes Map]]: the local AI cluster that needs that RAM
