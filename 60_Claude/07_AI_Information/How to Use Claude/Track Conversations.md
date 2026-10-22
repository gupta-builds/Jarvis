---
type: system
status: sprout
created: 2026-10-21
updated: 2026-10-22
tags:
  - system
  - guide
  - conversations
system_kind: guide
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Layer|Conversation Layer]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Capture Registration|Capture Registration]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Capture Pipeline - As Built|Capture Pipeline]]"
  - "[[60_Claude/30_Reviews/AI/Conversations/Acer Windows Track|Acer Windows Track]]"
  - "[[30_Order/Workflows/Ingestion/Conversations Loop|Conversations Loop]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]]"
---
# Track Conversations
How to check, by hand, that Claude Code conversations on this machine are being captured. It checks that capture ran. It cannot tell you the notes are right or that anything was learned from them, because the summary and review half of the loop does not exist yet ([[20_Progress/Projects/AI Use/Conversations/Conversation Layer Postmortem|Conversation Layer Postmortem]]). Written for the Acer's Windows side and run there on 2026-10-21; the Dell has not been checked.
## Use when
Notes seem missing, a day went by with no new session note, a machine or settings change just happened, or the weekly AI tools review is due ([[30_Order/Workflows/Ingestion/Conversations Loop|Conversations Loop]] step 1).
## Checks
Run in PowerShell. Each has what a healthy answer looks like.
1. **The hook is registered.** `Select-String -Path "$env:USERPROFILE\.claude\settings.json" -Pattern 'jarvis-session-continuity'` should print two lines, one under `Stop` and one under `SessionEnd`. Inside a Claude Code session, `/hooks` lists them too.
2. **The hook fired recently.** `Get-Content "$env:USERPROFILE\.claude\jarvis-session-activity.jsonl" -Tail 3`. The newest timestamp should match the last time you used Claude Code. A hook that fires still tells you nothing about the export.
3. **The backfill task ran.** `Get-ScheduledTask -TaskName ConversationCapture-Backfill-Windows | Get-ScheduledTaskInfo`. `LastTaskResult` should be 0 and `LastRunTime` within 30 minutes.
4. **The health note agrees.** Open `60_Claude/05_Clippings/AI Conversations/00 - Capture Health.md`. The latest Windows row should be recent and exit 0, with no warning callout. It lists exit codes only.
5. **Every real session has a note.** Count transcripts that exist, then compare with notes started since the oldest transcript. `(Get-ChildItem "$env:USERPROFILE\.claude\projects" -Directory | Get-ChildItem -Filter *.jsonl).Count` gives sessions on disk, including empty ones; about a quarter had no assistant turn on 2026-10-21 (92 of 122), so expect fewer notes than transcripts. A stricter check matches `session_id` values, as the 2026-10-21 measurement did.
6. **The newest note is current.** `Get-ChildItem "D:\_Anant\20_Progress\Documents\Jarvis\60_Claude\05_Clippings\AI Conversations\Acer\Windows\Claude" -Recurse -Filter *.md | Where-Object Name -notlike '00 -*' | Sort-Object LastWriteTime -Descending | Select-Object -First 3 LastWriteTime, Name`.
7. **Git carries them.** `git -C "D:\_Anant\20_Progress\Documents\Jarvis" log -3 --oneline`. Subjects read `Auto-sync: <date>, N files changed`, one about every 30 minutes.
8. **A Session Index renders.** Open `00 - Session Index.md` in a project folder. An empty table with notes present usually means its `FROM` path is stale ([[20_Progress/Projects/AI Use/Conversations/Export Conformance|Export Conformance]]).
## After capture
This guide only checks that capture ran. Reading what was captured is the weekly review in [[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]] and the monthly one in [[20_Progress/Projects/AI Use/Conversations/Monthly Review Protocol|Monthly Review Protocol]]; both are designed, not yet running.
## When a check fails
Write the failure down where the next review will find it: a line in [[60_Claude/30_Reviews/AI/Conversations/Conversation Loop Review|Conversation Loop Review]] under Findings, and a session log entry per [[30_Order/Standards/AI Loop/Memory Management|Memory Management]]. Do not fix a hook or script from this guide; changes wait for the research plan ([[20_Progress/Projects/AI Use/Conversations/Conversation Loop Research Plan|Conversation Loop Research Plan]]). What each part is and where it is registered: [[20_Progress/Projects/AI Use/Conversations/Capture Registration|Capture Registration]].
## Do not
Do not trust one green check. Checks 3 and 4 pass when the launcher exits 0, which is true even if the export wrote nothing. Check 5 is the one that compares against ground truth.
