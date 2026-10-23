---
type: project
status: active
created: 2026-10-22
updated: 2026-10-22
tags:
  - project
  - ai
  - conversations
  - prompt
project_kind: prompt
task: capture-watchdog
model: claude-sonnet-5-5
---
# P8 - Capture Watchdog
Paste into a fresh Claude Code session started in the Jarvis vault: `Read and run 20_Progress/Projects/AI Use/Conversations/Prompts/P8 - Capture Watchdog.md. Follow Hard Rules and Report Back exactly.`
## Why This Exists
Capture has failed silently at least five times and a person noticed every time ([[20_Progress/Projects/AI Use/Conversations/Conversation Layer Postmortem|postmortem]] finding 2). `00 - Capture Health.md` records an exit code, which stays 0 while a hook points at a missing folder. No file lists what should be registered ([[20_Progress/Projects/AI Use/Conversations/Capture Registration|Capture Registration]]). This is build B8, the dead-man's switch: a check on its own schedule that looks for the absence of evidence, as in the healthchecks pattern the 2026-10-08 session cited.
- **Verified 2026-10-22:** the backfill task runs every 30 minutes with result 0; `Jarvis-Syncthing-Health` is the only existing alarm and uses a toast; the activity log and the health state files live outside synced paths.
- **Depends on:** P2 (the `export_result` lines), P5 (event rows and the settings entries), P7 (the digest task).
- **Design rule, from the 10-08 session:** the watcher must not be the thing it watches, and the grace window is 1.5 times the expected cadence.
## Hard Rules
- Scope is the Acer, Windows side. The watchdog is read-only on everything except its own state and log. It never repairs and never restarts a task.
- Do not edit `30_Order/Standards`, `Templates`, or `Workflows`, or `00_Dashboard.md`.
- Never read or print `.credentials.json`, `.env*`, tokens, or `history.jsonl` text. Mtimes and counts only.
- Compatible with Windows PowerShell 5.1. All paths come from parameters with defaults, so tests can point at synthetic folders.
- Toast only on a change of state into WARN or FAIL, and once when it clears. No repeats.
- Do not run `git commit`; add ignore lines for its state and log as in P5 and prove them. Look for `.sync-conflict-*` after writing.
- Notes: no em dashes, no blank line after a heading, path-qualified wikilinks, patch by heading, update `updated:`.
- Do not set the status of this prompt to `complete`.
## Implementation Order
1. Write `capture-expected.json` in `30_Order/System/claude-workflow/`: what must be true on this machine (hook entries and events, `cleanupPeriodDays` at or above 45, scheduled tasks and their cadence, the tracked project list). It is versioned in git and is the answer to "no file says what should be registered".
2. Write `scripts/check-conversation-capture.ps1`. Each check returns OK, WARN, or FAIL with its evidence: (1) settings match the expected hooks and retention; (2) each expected task exists, is enabled, last result 0, last run younger than 1.5 times its cadence; (3) if a tracked-project transcript changed in the last N hours, event rows exist in that window; (4) the newest note is not older than its transcript by more than 35 minutes; (5) the oldest transcript is younger than `cleanupPeriodDays`; (6) `.sync-conflict-*` count under the capture and Conversations folders; (7) the digest task's last result; (8) informational: the stray statusline temp file count.
3. Write state to `logs/capture-watchdog-<machine>.json` (last result per check, last state change) and a toast on state change. Exit 0 for OK, 1 for WARN, 2 for FAIL.
4. Register it with its own task, every 60 minutes, using the same register-script pattern as P7 (dry run unless `-Apply`, host-locked). It is not called from any other script.
5. Tests with synthetic folders: each check passing and failing; the debounce (a second run in the same state sends no second toast).
6. Kill drill, written for the owner: set `JARVIS_EVENTS_OFF=1` as a user environment variable, use Claude Code in a tracked project for a few minutes, wait past the grace window or run the watchdog with `-GraceMinutes 5`, confirm a FAIL naming the events gap and a toast, then unset the variable and confirm it clears. Repeat once by disabling the backfill task for an hour. Do not run the drills yourself in a way that disables the owner's real capture without telling them first.
7. Patch [[20_Progress/Projects/AI Use/Conversations/Capture Registration|Capture Registration]] (it now points at `capture-expected.json`) and [[60_Claude/07_AI_Information/How to Use Claude/Track Conversations|Track Conversations]] (the manual checks become "run the watchdog, then read these"), each with a dated entry.
## Report Back
- The expected-state file and the first live run's table of eight checks.
- Test output and the task registration result.
- The kill drill result (or the drill instructions if the owner has not run it), with the time between the break and the alert.
- Any check that produced a false alarm on live data.
## What Not To Do
- Do not call this from the hook or the backfill. A dead job cannot report its own death.
- Do not alert on every WARN run.
- Do not fold in Dell, WSL, Cursor, or Cowork checks.
## Related Notes
[[20_Progress/Projects/AI Use/Conversations/Capture Registration|Capture Registration]], [[20_Progress/Projects/AI Use/Conversations/Conversation Layer Postmortem|Conversation Layer Postmortem]], [[60_Claude/07_AI_Information/How to Use Claude/Track Conversations|Track Conversations]].
