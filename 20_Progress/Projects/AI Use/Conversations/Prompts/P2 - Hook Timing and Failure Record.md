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
task: hook-timing-and-failure-record
model: claude-sonnet-5-5
---
# P2 - Hook Timing and Failure Record
Paste into a fresh Claude Code session started in the Jarvis vault: `Read and run 20_Progress/Projects/AI Use/Conversations/Prompts/P2 - Hook Timing and Failure Record.md. Follow Hard Rules and Report Back exactly.`
## Why This Exists
The capture hook runs the full exporter on every `Stop` (every assistant turn) in the foreground, and swallows every error. Nobody has measured what it costs, and a failed export leaves no record. This is build B2 plus the cheapest slice of the failure record, from [[20_Progress/Projects/AI Use/Conversations/Conversation Layer Postmortem|Conversation Layer Postmortem]] findings 3 and 12.
- **Verified in the hooks reference, re-read 2026-10-22:** hooks block Claude by default; `async: true` on a command hook runs it in the background, and its `timeout` is not enforced for async hooks; `SessionEnd` has a 1.5 second default timeout that a per-hook `timeout` (up to 60 seconds) or `CLAUDE_CODE_SESSIONEND_HOOKS_TIMEOUT_MS` raises; `transcript_path` may lag the live conversation, so a Stop-time export can miss the newest messages; `-p` runs kill async hooks at teardown.
- **Not stated in the docs:** whether an async hook survives `SessionEnd` in an interactive session. Do not assume it does.
- **Verified by reading files 2026-10-22:** `Stop` and `SessionEnd` in `~/.claude/settings.json` both run `jarvis-session-continuity.ps1` with no `timeout` and no `async`. The script writes one activity line, then calls the exporter inside an empty `catch`, so the export result is discarded (`| Out-Null`).
- **Unmeasured:** wall time of the hook on a small, a median, and the largest transcript (this session's own transcript is over 8 MB).
## Hard Rules
- Scope is the Acer, Windows side, Claude Code only. Do not touch WSL, the Dell, Cowork, Cursor, Codex, or `.obsidian/`.
- Do not edit `30_Order/Standards`, `Templates`, or `Workflows`.
- Never read or print `.credentials.json`, `.env*`, tokens, `history.jsonl` text, or transcript text. Time the hook with real transcripts as input, but report only milliseconds.
- Search before creating. Write only the files named below. Scratch work goes to the scratchpad. Nothing at the vault root.
- Do not run `git commit` or `git push`.
- After any vault write, search for `.sync-conflict-*` copies and restore corrected text.
- Notes: no em dashes, no blank line after a heading, path-qualified wikilinks, patch by heading, update `updated:`.
- The hook must exit 0 on every input, including empty and garbage stdin. A log write must never throw. Keep it compatible with Windows PowerShell 5.1 and keep the BOM on the `.ps1`.
- Edit only the `Stop` and `SessionEnd` entries of `~/.claude/settings.json`, with targeted edits, after copying the file to the scratchpad.
- Do not set the status of this prompt to `complete`.
## Implementation Order
1. Measure. For each of three transcripts (smallest non-empty, median, largest on disk), run `Measure-Command` on `jarvis-session-continuity.ps1` with synthetic stdin `{hook_event_name, session_id, transcript_path, cwd}`, five times each. Do this once for `Stop` and once for `SessionEnd`. Record milliseconds in a table. Note that a re-export of an already current session returns early, so also measure one forced stale case.
2. Add a result record. Capture the exporter's returned status and elapsed milliseconds and append a second line to `jarvis-session-activity.jsonl`: `{timestamp, event: "export_result", session_id, status, ms, error}`. Write it before the exception is swallowed. Never write transcript text or paths beyond the session id.
3. Decide from step 1 and put the reasoning in Report Back. Default: `Stop` gets `"async": true` and `"timeout": 60` if the p95 is over 500 ms, otherwise stays synchronous with a `timeout`. `SessionEnd` stays synchronous with `"timeout": 30` unless the owner's interactive test in step 5 proves an async hook survives.
4. Apply the settings edits, then parse the file and confirm only those two entries changed.
5. Write the owner-run check for `SessionEnd`: start a throwaway session in a scratch folder, send one prompt, run `/clear`, then read the last three lines of `jarvis-session-activity.jsonl`. The `export_result` line must appear. Do not run this yourself in a headless session, because `-p` kills async hooks and would give a false negative.
6. Add `scripts/test-session-hook.ps1`: garbage stdin, empty stdin, a missing transcript path, and a valid one, each asserting exit 0, and that failure cases produce an `export_result` line with an `error`, not silence.
7. Patch [[20_Progress/Projects/AI Use/Conversations/Capture Registration|Capture Registration]] (the `timeout` and `async` rows) and [[20_Progress/Projects/AI Use/Conversations/Capture Scripts|Capture Scripts]] (the hook card) with dated Corrections.
## Report Back
- The timing table (3 transcripts, 2 events, 5 runs each) and the p50 and p95.
- The `settings.json` diff, the backup path, and your decision with its reasoning.
- The new test's output under both shells.
- The exact owner-run check from step 5 and, if the owner ran it, its result.
- Anything unexpected, such as a hook that took longer than 1.5 seconds on `SessionEnd`.
## What Not To Do
- Do not make `SessionEnd` async on documentation alone.
- Do not change what the exporter renders. That was P1.
- Do not add the new per-event hooks here. That is P5.
## Related Notes
[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Build Plan|Build Plan]], [[20_Progress/Projects/AI Use/Conversations/Conversation Layer Postmortem|Conversation Layer Postmortem]], [[20_Progress/Projects/AI Use/Conversations/Capture Registration|Capture Registration]].
