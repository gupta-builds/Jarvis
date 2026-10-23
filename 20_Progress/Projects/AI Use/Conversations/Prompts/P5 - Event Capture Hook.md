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
task: event-capture-hook
model: claude-sonnet-5-5
---
# P5 - Event Capture Hook
Paste into a fresh Claude Code session started in the Jarvis vault: `Read and run 20_Progress/Projects/AI Use/Conversations/Prompts/P5 - Event Capture Hook.md. Follow Hard Rules and Report Back exactly.`
## Why This Exists
Layer L0 of [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]]: one deterministic, model-free script that writes a JSON line per prompt, tool call, tool failure, permission denial, subagent stop, compaction, and instruction load, so the weekly review reads facts and not scraped transcripts. This is build B3. Read the P3 postmortem first: if it changed the record shape, follow P3 over this note.
- **Verified in the hooks reference, re-read 2026-10-22:** 33 events. Common stdin fields: `session_id`, `prompt_id` (absent until the first user input), `transcript_path`, `cwd`, `permission_mode`, `effort`, `hook_event_name`. Event fields: `UserPromptSubmit` `prompt`; `PostToolUse` `tool_name`, `tool_input`, `tool_use_id`, `tool_response`, `duration_ms`; `PostToolUseFailure` adds `error`, `is_interrupt`; `PermissionDenied` `reason`; `SubagentStop` `agent_id`, `agent_type`, `agent_transcript_path`, `last_assistant_message`; `PreCompact` and `PostCompact` `trigger`; `InstructionsLoaded` `file_path`, `memory_type`, `load_reason`; `Stop` `last_assistant_message`.
- **Verified in the same read:** matching hooks run in parallel; `PostToolUse` fires concurrently for parallel tool calls; async hooks cannot block or change Claude's behavior; the same handler defined in several settings files runs once; stdout of `UserPromptSubmit` hooks is added to context, so it must stay empty; `-p` runs kill async hooks at teardown.
- **Verified on the machine 2026-10-22:** Node v24.19.0 is installed. `.gitignore` and `.stignore` list specific log names only, so `events-*.jsonl` is not ignored yet and must be added.
- **Owner decisions 2026-10-22:** raw events stay per machine; scope is tracked projects only (the list confirmed in P1), which keeps The Plan's personal content out of Jarvis logs; no personal-life or pasted-document text is stored.
- **Not verified, step 1 does it:** the field names at runtime on Claude Code 2.1.309, and whether a slash command fires `UserPromptSubmit`.
## Hard Rules
- Scope is the Acer, Windows side, Claude Code only. Do not touch WSL, the Dell, Cowork, Cursor, or Codex.
- Do not edit `30_Order/Standards`, `Templates`, or `Workflows`. Build in `30_Order/System/claude-workflow/hooks/` (the script and a `lib/` folder) and its tests beside the existing `test-*.ps1` files.
- The script prints nothing to stdout, ever. It exits 0 on every input. It makes no model call and no network call.
- It never stores a `tool_response` body (byte length only), a full shell command (first token and ok state only), a pasted-looking prompt (over 2,000 characters or 40 lines: keep length, the first 200 characters, and `pasted: true`; these two limits are working rules, not from a source), or any text from a project outside the scope file.
- Redact stored text with the same eight rules as the exporter (`sk-ant-`, `sk-`, `ghp_`, `xox*-`, `AKIA`, Bearer tokens, `SetEnvironmentVariable` values, long mixed tokens). Write the rules once, in a Node module with fixture vectors in a test.
- One `fs.appendFileSync` of one line under 4 KB per event. `JARVIS_EVENTS_OFF=1` disables the script entirely.
- Never read or print `.credentials.json`, `.env*`, tokens, or `history.jsonl` text. Counting `history.jsonl` lines for a coverage test is allowed.
- Edit only the `hooks` block of `~/.claude/settings.json`, with targeted edits, after copying the file to the scratchpad. Do not touch the existing `Stop` and `SessionEnd` entries.
- Do not run `git commit` or `git push`. After any vault write, look for `.sync-conflict-*` copies.
- Notes: no em dashes, no blank line after a heading, path-qualified wikilinks, patch by heading, update `updated:`.
- Do not set the status of this prompt to `complete`.
## Implementation Order
1. **Key capture.** Register a temporary logger that records only field names and value types per event for about one hour of normal use. Compare with the documented fields above, answer the slash-command question, then remove the logger. Pin the observed field lists as fixtures in `test-events-schema.js` so a release that renames a field fails a test.
2. Write `hooks/jarvis-events.js` and `hooks/lib/`: parse stdin, drop out-of-scope projects (scope file `hooks/events-scope.json`, one cwd prefix per tracked project), classify, redact, and append. Common row: `{v, ts, machine, session_id, prompt_id, agent_id, event, cwd, project}`. Event fields follow [[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]]. On `Stop` also write a `turn_end` row with the first 300 redacted characters of `last_assistant_message`, `claims_done` (a regex list in a JSON config), and `verified_after_last_edit` (any Bash or PowerShell row with a command head in a test, lint, or build list, after the last Edit or Write row of this `prompt_id`; the list is a JSON config the owner can edit).
3. Failures: a parse error or unknown payload writes `{event: "failure", stage, message}` (message truncated) to the same file and a line to stderr. If the file cannot be written, append to `%LOCALAPPDATA%\claude-capture\events-fallback.log`. Silence is never an outcome.
4. Tests (`node --test`, fixtures are synthetic): each event type produces the expected row; stdout is empty for every event; garbage and empty stdin give a failure row and exit 0; an out-of-scope cwd writes nothing but a counter row; redaction vectors; a 50-process concurrent run leaves 50 intact lines.
5. Measure overhead: 100 sequential invocations, p50 and p95 wall time including Node startup. Report them. If p95 is over 150 ms, investigate before registering (a working ceiling, not a sourced one).
6. Register, after the tests pass: one handler, `node "<abs path>/hooks/jarvis-events.js"`, with `"async": true` and `"timeout": 10`, for `UserPromptSubmit`, `PostToolUse`, `PostToolUseFailure`, `PermissionDenied`, `SubagentStop`, `PreCompact`, `PostCompact`, `InstructionsLoaded`, `StopFailure`, and a second `Stop` entry. Leave every existing entry as it is.
7. Add ignore lines for `30_Order/System/claude-workflow/logs/events-*.jsonl` and the fallback to `.gitignore` and to `.stignore` (with the `(?d)` prefix, like the neighbors). Prove it with `git check-ignore -v`. Note that `.stignore` does not sync: the Dell needs the same line by hand in build B9.
8. Owner smoke test, written for them: open a fresh session in a tracked project, send one prompt that uses two tools, then run the counting one-liner you provide. It prints row counts per event for the session and the `history.jsonl` prompt count for that session id, never any text.
9. Patch [[20_Progress/Projects/AI Use/Conversations/Capture Registration|Capture Registration]], [[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]] (the ignored-folder claim), and the hook table in `30_Order/System/claude-workflow/README.md`, each with a dated entry.
## Report Back
- The key-capture result: any documented field that was missing or renamed, and the slash-command answer.
- Test output, the overhead table, and the `git check-ignore` output.
- The `settings.json` hook-block diff and backup path.
- The smoke-test one-liner and, if the owner ran it, its counts.
- Anything you cut from the record and why.
## What Not To Do
- Do not print anything to stdout.
- Do not store prompt text from outside the scope file, or any `tool_response` content.
- Do not launch the hook through PowerShell. Node starts faster.
- Do not register for events not listed above.
## Related Notes
[[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]], [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]], [[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]], [[20_Progress/Projects/AI Use/Conversations/Capture Registration|Capture Registration]].
