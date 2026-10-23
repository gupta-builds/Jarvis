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
task: digest-schedule-and-nudge
model: claude-sonnet-5-5
---
# P7 - Schedule and Review Nudge
Paste into a fresh Claude Code session started in the Jarvis vault: `Read and run 20_Progress/Projects/AI Use/Conversations/Prompts/P7 - Schedule and Review Nudge.md. Follow Hard Rules and Report Back exactly.`
## Why This Exists
A loop that depends on remembering to run a script is the loop that died in week three before. The owner asked for scheduled runs. This prompt makes the digest generate itself, creates the week's review skeleton, and puts "review due" in front of the owner on `/startday`. The review itself stays human. It is new in the revised order; the original [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Build Plan|Build Plan]] left scheduling as "by hand or by schedule".
- **Verified 2026-10-22:** `Jarvis-WeeklyReview` runs Sundays 06:00, last ran 2026-10-18 with result 0, and it runs the concept-mastery `/weekly-review`, not a conversation review. The pattern for a task is `register-weekly-review-task.ps1` plus `weekly-review-silent.vbs` plus `run-weekly-review.ps1` with a lock file and a log. `check-syncthing-status.ps1` holds the proven toast code. `ConversationCapture-Backfill-Windows` registers only on the Acer and runs dry unless `-Apply`.
- **Verified in the standards:** [[30_Order/Standards/AI Loop/Review System|Review System]] says "nothing runs on its own", meaning a review is triggered by the owner. A generator that builds the input to a review is not a review; P3 records the wording conflict, and Review System is not edited until build B10.
- **Unknown, step 1 checks:** whether the Unison task (`SecondBrainClaudekit-JarvisSync`, not registered on the Acer) would overwrite `.claude/skills` edits if it were registered here.
- **Owner decision 2026-10-22:** skills and hooks live in the Jarvis `.claude/` only.
## Hard Rules
- Scope is the Acer, Windows side. The scheduled task makes no model call. Do not change `Jarvis-WeeklyReview`, `Jarvis-GitAutoSync`, or the backfill task.
- Do not edit `30_Order/Standards`, `Templates`, or `Workflows`, or `00_Dashboard.md`.
- Never read or print `.credentials.json`, `.env*`, tokens, or `history.jsonl` text.
- The register script is a dry run unless `-Apply`, refuses any host except `GUPTA-BUILDS`, and logs to `%LOCALAPPDATA%\claude-capture\`.
- The runner takes a lock, writes `logs/conversation-digest.log` (add ignore lines for it as P5 did, proven with `git check-ignore -v`), and exits with an honest code.
- Create the weekly review skeleton only if it does not exist. Never overwrite an owner-edited note.
- Do not run `git commit`. After any vault write, look for `.sync-conflict-*` copies.
- Notes: no em dashes, no blank line after a heading, path-qualified wikilinks, patch by heading, update `updated:`.
- Do not set the status of this prompt to `complete`.
## Implementation Order
1. Read `register-weekly-review-task.ps1`, `weekly-review-silent.vbs`, `run-weekly-review.ps1`, `register-capture-backfill-windows-task.ps1`, and `register-jarvis-sync-task.ps1` with `sync-jarvis-silent.vbs`. Confirm whether Unison could overwrite `.claude/skills`. If it could, stop and ask the owner before step 6.
2. Write `scripts/run-conversation-digest.ps1`: compute the ISO week (default: the current week, run on Sunday evening; a `-Week` parameter for any other), call the P6 digest script, then create `AI Tools Weekly Review - <ISO week>.md` in `60_Claude/30_Reviews/AI/Scheduled/Weekly/` from the AI Weekly Review Template with the Templater placeholders rendered by the script (date, title), `status: seed`, Period Covered filled, and a link to the digest. Exit non-zero if the digest fails.
3. Write `scripts/conversation-digest-silent.vbs` and `scripts/register-conversation-digest-task.ps1` modeled on the weekly-review pair: Sundays 21:00 by default (a parameter), hidden, start when available, 10-minute limit, ignore new instances, runs on battery.
4. Toast on completion using the `check-syncthing-status.ps1` pattern: the week, prompts found, coverage percentage, and "review due". Toast on failure as well.
5. Test: run the runner by hand for a past week; run it twice and confirm the second run does not overwrite the skeleton; register with `-Apply`; run `Start-ScheduledTask`; read `LastTaskResult` (must be 0), the log line, and the new files.
6. Nudge: in `.claude/skills/starting-day/SKILL.md` (confirm the path first), add one instruction to `/startday`: if the newest `AI Tools Weekly Review` note has `status: seed` and today is Sunday through Tuesday, add "Do the weekly conversation review (about 60 minutes the first four weeks)" to Today's Focus. Patch by heading and keep the skill under its length limit.
7. Add the task to [[20_Progress/Projects/AI Use/Conversations/Capture Registration|Capture Registration]] and the trigger table in `30_Order/System/claude-workflow/README.md`, each with a dated entry.
## Report Back
- What the Unison check found.
- The registered task's schedule, `LastTaskResult`, and the log line from the test run.
- The skeleton note's path, and proof that a second run left it untouched.
- The `/startday` diff and the toast text.
- Anything the owner must decide, such as a different day or time.
## What Not To Do
- Do not let the scheduled task write codes, flags, or findings. It only prepares the review.
- Do not auto-open the review note or change the owner's dashboard.
- Do not register this on the Dell.
## Related Notes
[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Build Plan|Build Plan]], [[20_Progress/Projects/AI Use/Conversations/Capture Registration|Capture Registration]], [[30_Order/Standards/AI Loop/Review System|Review System]].
