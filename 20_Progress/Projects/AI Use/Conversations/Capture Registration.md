---
type: project
status: active
created: 2026-10-21
updated: 2026-10-21
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
## What nothing compares
No file lists what should be registered per machine, so a missing registration is found only when notes stop appearing. The 10-08 tracking analysis found the Acer's hook unregistered by reading settings files by hand; the 10-04 audit found the backfill tasks missing the same way. Each registration also differs in form: JSON in user settings, JSON in project settings, Task Scheduler XML, systemd unit files.
## Non-Goals
This is not a registry to maintain by hand and not a proposal for one. It records what a person can check today and how.
