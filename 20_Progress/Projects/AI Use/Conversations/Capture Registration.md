---
type: project
status: active
created: 2026-10-21
updated: 2026-10-29
tags:
  - project
  - ai
  - conversations
  - registration
project_kind: spec
next: Add a verified-on date for the Dell Windows and Dell WSL rows when the Dell is next reachable.
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Layer|Conversation Layer]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Capture Scripts|Capture Scripts]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Capture Pipeline - As Built|Capture Pipeline]]"
  - "[[60_Claude/30_Reviews/AI/Conversations/Acer Windows Track|Acer Windows Track]]"
  - "[[60_Claude/30_Reviews/AI/Conversations/Dell Windows Track|Dell Windows Track]]"
  - "[[60_Claude/30_Reviews/AI/Conversations/Dell WSL Track|Dell WSL Track]]"
---
# Capture Registration
## What This Is
==Capture exists only where a hook, a scheduled task, or a timer is registered, and the registrations live in four places that nothing compares: user settings, project settings, Task Scheduler, and systemd.==
This note lists what is registered, where, and how it was checked, per machine and OS. A row marked unverified was not checked on the date shown.
## Host names
| Host name | Machine | Source |
|---|---|---|
| `GUPTA-BUILDS` | Acer | `Get-CaptureMachine` in `export-claude-session.ps1`; this session's `$env:COMPUTERNAME` |
| `DESKTOP-3VBG0JH` | Dell | same function |
| anything else | none: writes nothing, logs one line to `%LOCALAPPDATA%\claude-capture\unknown-host.log` | same function |
WSL mirrors the Windows host name, so the same lookup serves both OSes. A third machine would write nothing until the function is edited in both exporters.
## Acer, Windows (verified 2026-10-21)
| What | Where registered | Value |
|---|---|---|
| `Stop` hook | `C:\Users\anant\.claude\settings.json` | `powershell -NoProfile -ExecutionPolicy Bypass -File D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/claude-workflow/hooks/jarvis-session-continuity.ps1` |
| `SessionEnd` hook | same file | same command |
| `SessionStart` hook | not registered | the script has a branch for it that never runs |
| `PreToolUse` guard (Write, Edit, MultiEdit) | project `.claude/settings.json` | `jarvis-write-guard.ps1` |
| `PostToolUse` guard (Write, Edit, MultiEdit) | project `.claude/settings.json` | `jarvis-internship-note-guard.ps1` |
| `cleanupPeriodDays` | `C:\Users\anant\.claude\settings.json` | `60`, set 2026-10-28 (was the 30-day default). Safety copy: `D:\_Anant\99_Archive\Claude Transcript Snapshot 2026-10-22`, 272 `.jsonl` files, 633,702,146 bytes. Retention check pending, run on or after 2026-10-30 |
Neither entry carries a `timeout` or `async` key, so `SessionEnd` runs under the documented 1.5-second budget and both run in the foreground (see the postmortem, finding 12). The hook command is an absolute path into the vault, so it follows the vault if the vault is cloned to the same place and breaks if it is not.

| Task | Cadence | Last run | Result | Registered by |
|---|---|---|---|---|
| `ConversationCapture-Backfill-Windows` | every 30 min | 2026-10-21 19:33 | 0 | `register-capture-backfill-windows-task.ps1`, 2026-10-17 |
| `Jarvis-GitAutoSync` | every 30 min | 2026-10-21 19:33 | 0 | `register-git-auto-sync-task.ps1` |
| `Jarvis-WeeklyReview` | Sundays 06:00 | 2026-10-18 13:15 | 0 | `register-weekly-review-task.ps1` |
| `Jarvis-Syncthing-Health` | about every 5 min | 2026-10-21 19:36 | **1** | not read |
| `Jarvis-Codex-Daemon-Guard` | not read | not read | not read | `sync-workflow/scripts/codex-daemon-guard.ps1`, untracked |
| `ThePlan-GitSync` | not read | not read | not read | The Plan vault |
Not registered on the Acer: `Jarvis-Cursor-Session-Export` (the Cursor sweep) and `SecondBrainClaudekit-JarvisSync` (the Unison leg).
Checks used: `Get-ScheduledTask` with `Get-ScheduledTaskInfo` for the tasks; a read of both settings files for the hooks; `Get-Content` on `jarvis-session-activity.jsonl` for the hook's own trail.
## Project routing (Acer Windows)
Which project folder a session lands in comes from its working directory, through one editable file: `30_Order/System/claude-workflow/capture-projects.json`. The exporter reads it on every run. The rules are checked in order and the first match wins. A path under a rule means the folder itself or anything inside it; a path must match whole folder names, so `Jarvis-old` is not inside `Jarvis`. Case is ignored.

| Order | Project folder | Match | Path |
|---|---|---|---|
| 1 | `Jarvis` | under | the vault, `D:\_Anant\20_Progress\Documents\Jarvis` |
| 2 | `The Plan` | under | `D:\_Anant\20_Progress\Documents\The Plan` |
| 3 | `UMN Courses` | under | `D:\_Anant\10_Areas\UMN` |
| 4 | `Home` | exact | `C:\Users\anant` |
| 5 | `Scratch` | under | `%LOCALAPPDATA%\Temp\claude` |
A directory no rule matches gets a folder named after its last path segment, so a new place Claude Code is used is recorded without any edit. An empty cwd gives `Unknown`. To add a project, add a rule to the file; put narrower paths above wider ones. If the file is missing or invalid, the exporter uses the built-in Jarvis, The Plan and Home rules and writes one line to `%LOCALAPPDATA%\claude-capture\routing.log`; it never fails the hook. `Scratch` holds Claude Code's own scratch folders, so one-off test runs do not each become a project; the owner is asked to confirm it. A session stays in the folder holding its `.exported` marker, so changing a rule moves only new sessions. Moving old ones is `scripts/reroute-acer-notes.ps1` followed by `export-claude-session.ps1 -BackfillAll -Force`; both are in [[20_Progress/Projects/AI Use/Conversations/Capture Scripts|Capture Scripts]].
`UMN Courses` folds every course into one folder, so its `_raw_jsonl` junction points at one Claude Code transcript folder only and is a partial view of the course transcripts.
## Acer, WSL (from Build 5c, 2026-10-17; not re-verified)
| What | Value |
|---|---|
| Hooks | `Stop` and `SessionEnd` in `~/.claude/settings.json` inside the distro, same command shape as the Dell |
| Timer | systemd user unit `claude-capture-backfill`, `OnCalendar=*:0/30`, `Persistent=true`, `RandomizedDelaySec=120`, log `~/.local/state/claude-capture/backfill.log` |
| Distro state 2026-10-21 | `Ubuntu-24.04` Stopped, so the timer cannot fire |
| Evidence of life | 18 notes written on 2026-10-17; last Capture Health WSL row 2026-10-18T02:31Z; newest session start 2026-10-18 |
I did not start WSL to read its settings. Build 5c's end-to-end test (`claude -p` in `/tmp/capture-test`) is the last proof.
## Dell, Windows and WSL (from Build 5c, not touched here)
| What | State |
|---|---|
| WSL hooks | Two export entries in `~/.claude/settings.json` edited on 2026-10-17 to run the vault script; old hook kept as `wsl-session-export.ps1.pre-5c` |
| WSL timer | `claude-capture-backfill` created 2026-10-17 on the Dell, `Persistent=true` |
| Windows hook | unverified |
| Windows backfill task | `ConversationCapture-Backfill-Windows` existed on the Dell; the Acer's task copies its settings. Current state unverified |
| Cursor sweep | `Jarvis-Cursor-Session-Export`, every 15 minutes, per the Cursor README. Dell notes stop at 2026-10-08, so it has probably stopped; unverified |
| Evidence of life | newest Dell session starts: Windows 2026-10-18, WSL 2026-10-18 |
## Schedule (Acer, read from Task Scheduler on 2026-10-22, 23:40)
Every process that runs on a clock, in one place. Planned rows are not registered yet. Phase P8 owns this table from now on: each new task adds a row here in the same session that registers it.

| Process | When | What it does | Script | Last result |
|---|---|---|---|---|
| `ConversationCapture-Backfill-Windows` | every 30 min, at :03 and :33 | Exports every top-level transcript that is new or grew, then writes Capture Health | `backfill-windows-silent.vbs` | 0 at 23:33 |
| `Jarvis-GitAutoSync` | every 30 min, at :03 and :33 | Commits and pushes the vault; the Acer is the only git writer since 2026-10-22 | `git-auto-sync-silent.vbs` | 0 at 23:33 |
| `ThePlan-GitSync` | every 15 min, at :08, :23, :38, :53 | Syncs The Plan vault | not read | 0 at 23:38 |
| `Jarvis-Codex-Daemon-Guard` | every 15 min, at :12, :27, :42, :57, and at logon | Keeps the Codex daemon alive | `sync-workflow/scripts/codex-daemon-guard.ps1` | 0 at 23:42 |
| `Jarvis-Syncthing-Health` | every 5 min | Checks Syncthing status and raises the toast | `sync-workflow/scripts/check-syncthing-status.ps1` | 0 at 23:41 |
| `Jarvis-WeeklyReview` | Sundays 06:00, starts when available | Runs the concept-mastery `/weekly-review` headlessly; it does not read conversations | `run-weekly-review.ps1` | 0 on 2026-10-18 at 13:15 (late: the laptop was off at 06:00) |
| Claude Code retention sweep | at session start (inferred), age limit `cleanupPeriodDays` | Deletes old transcripts, tool results, file history | Claude Code itself | `.last-cleanup` 2026-10-22 22:57 |
| Conversation digest and review skeleton (planned, P8) | Sundays 21:00 | Builds the week's digest and the review skeleton, then a toast | `run-conversation-digest.ps1` | not registered |
| Capture watchdog (planned, after P8) | every 60 min, at :18 | Looks for missing evidence that capture ran | `check-conversation-capture.ps1` | not registered |
Slot rule: a new task takes a free minute. Taken minutes are :01 and every fifth minute from :01:45 (Syncthing), :03, :33, :08, :23, :38, :53, :12, :27, :42, :57. The backfill and the git sync share :03 and :33; the git script's hot-file defer is what keeps them from racing, so do not remove it.
## What nothing compares
No file lists what should be registered per machine, so a missing registration is found only when notes stop appearing. The 10-08 tracking analysis found the Acer's hook unregistered by reading settings files by hand; the 10-04 audit found the backfill tasks missing the same way. Each registration also differs in form: JSON in user settings, JSON in project settings, Task Scheduler XML, systemd unit files.
## Non-Goals
This is not a registry to maintain by hand and not a proposal for one. It records what a person can check today and how.
## Corrections
*2026-10-28. The sections above are kept as written.*
- **`Stop` row, `timeout` and `async`:** the sentence "Neither entry carries a `timeout` or `async` key" no longer holds. The `Stop` entry in `C:\Users\anant\.claude\settings.json` now has `"async": true` and `"timeout": 60`, so the export runs in the background and no longer holds up the end of a turn. The docs say an async hook's `timeout` is not enforced; it is set anyway as a stated upper bound.
- **`SessionEnd` row, `timeout`:** the entry now has `"timeout": 30` and stays synchronous. Without it the 1.5-second budget applied, and a fresh export of the largest transcript took 4.8 to 5.1 seconds (p50 to p95 of 5 runs). The docs do not say whether an async hook survives `SessionEnd` in an interactive session, so it was not made async.
- **Basis:** the timing table is in the Corrections of [[20_Progress/Projects/AI Use/Conversations/Capture Scripts|Capture Scripts]]. Two checks are still pending on the owner's side (a real `/clear` and a day of real timings); both are written out there.
- **Changed by:** targeted edits to the two entries only; every other key and hook event matches the copy taken before the edit.
- **2026-10-29, async and `SessionEnd` together:** the undocumented overlap of an async `Stop` export with `SessionEnd` was tested and was a real defect (two notes per session). The hook now serializes exports per session, so the settings above stand unchanged. See the close-out in [[20_Progress/Projects/AI Use/Conversations/Capture Scripts|Capture Scripts]].
