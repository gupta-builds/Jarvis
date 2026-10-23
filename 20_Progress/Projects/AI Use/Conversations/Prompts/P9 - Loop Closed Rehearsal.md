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
task: loop-closed-rehearsal
model: claude-sonnet-5-5
---
# P9 - Loop Closed Rehearsal
Paste into a fresh Claude Code session started in the Jarvis vault: `Read and run 20_Progress/Projects/AI Use/Conversations/Prompts/P9 - Loop Closed Rehearsal.md. Follow Hard Rules and Report Back exactly.`
## Why This Exists
The owner's finish line for the Claude Code loop is: scheduled runs work, a test run passes, the human review loop has run, and existing sessions are captured on the Acer. The original build plan had a check per build and no check for the whole. This prompt is that check, run once on a real week. Nothing in it builds anything.
- **Cannot start before:** P0 to P8 are complete and reviewed, and at least seven days of event rows exist from P5. If not, say so and stop.
- **Honest limit:** the loop is not closed until a change made in a weekly review has been judged against its metric on its review date. This prompt can declare the loop running; it can only declare it closed when the first ledger row has been reviewed (usually two weeks after the first review).
## Hard Rules
- Scope is the Acer, Windows side, tracked projects.
- Do not fix anything you find. Every failed check becomes a finding and, if needed, a build-plan row. The only writes are the report note, the hub Log and Current State, and the Build Plan row status.
- Do not edit `30_Order/Standards`, `Templates`, or `Workflows`.
- Never read or print `.credentials.json`, `.env*`, tokens, `history.jsonl` text, or transcript text.
- Do not run `git commit`; look for `.sync-conflict-*` after writing.
- Notes: no em dashes, no blank line after a heading, path-qualified wikilinks, patch by heading, update `updated:`.
- Do not set the status of this prompt to `complete`.
## Implementation Order
1. Check the precondition above and list the P-prompts with their statuses.
2. Run the twelve checks. For each one write the command or file you used, the output, and pass or fail.
   1. **Coverage.** For the last seven days and the tracked projects, prompts in `history.jsonl` (count only) against prompts with event rows. Pass at 100%, or every gap explained by a known cause (a slash command, a headless run).
   2. **Unattended schedule.** The digest task ran without anyone starting it: task result 0, a log line, a digest file for the week, and the review skeleton.
   3. **Digest accuracy.** Ten sampled prompts hand-counted by the owner match the digest.
   4. **Human pass.** The owner's blind pass took 60 minutes or less, and the ledger holds a row with change, metric, baseline, and a review date.
   5. **Fresh-session test.** The owner repeated the prompt that failed in a fresh session after the change, and wrote down the result.
   6. **Kill drill.** The watchdog turned FAIL within its grace window after capture was disabled, and cleared after it was re-enabled.
   7. **Retention.** The oldest transcript is older than 30 days and still on disk.
   8. **Sync.** No `.sync-conflict-*` under the capture or Conversations folders; the latest Auto-sync commit contains the digest and does not contain any `events-*.jsonl`.
   9. **Privacy.** A pattern search of the events file and the digest for the exporter's secret prefixes finds nothing, and the digest holds no prompt text.
   10. **Overhead.** The measured p95 per event from P5 still holds on the week's data, and the owner reports no slower sessions.
   11. **Back-out.** Setting `JARVIS_EVENTS_OFF=1` stops event writes within one prompt, and removing the hook entries returns Claude Code to its old behavior. Both steps are written in `30_Order/System/claude-workflow/README.md`.
   12. **Docs match reality.** [[20_Progress/Projects/AI Use/Conversations/Capture Registration|Capture Registration]], [[20_Progress/Projects/AI Use/Conversations/Capture Scripts|Capture Scripts]], and the Build Plan describe what is installed, with no stale "not built" lines.
3. Write `60_Claude/30_Reviews/AI/Conversations/Loop Closed Rehearsal 2026-W<N>.md` as an audit (`review_kind: audit`) with the twelve results.
4. Update the hub's Current State and Log, and mark each Build Plan row. If every check passes, write "loop running, not yet closed: first ledger review due <date>". If any fails, write the failing check first.
5. Queue the next prompts only after this one, because their inputs now exist: B6 local reviewer pilot (needs 30 hand-coded prompts), B7 `/insights` skill (Jarvis `.claude/`), B9 Dell rollout (repo conversations only: Jarvis, internship-research-loop, second-brain-claudekit, portfolio, CausalOps, tradingview, re-exported from live transcripts), B10 rewrite of the `30_Order` conversation standards, then Codex. List what each one needs as input; do not write them.
## Report Back
- The twelve-row result table, with evidence.
- Every finding, ranked, and what each blocks.
- The state of each open owner decision.
- The exact date the first ledger row is due for review.
## What Not To Do
- Do not mark a check passed on a count of runs. Mark it on evidence from this week.
- Do not declare the loop closed.
- Do not repair a failing check and then re-run it as if nothing happened.
## Related Notes
[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]], [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Build Plan|Build Plan]], [[20_Progress/Projects/AI Use/Conversations/Intervention Ledger|Intervention Ledger]], [[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]].
