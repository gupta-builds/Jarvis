---
type: project
status: active
created: 2026-10-22
updated: 2026-10-30
tags:
  - project
  - ai
  - conversations
  - design
project_kind: spec
next: P6 builds the hook that writes the fact rows below, after P5 (the hand review) says which fields the review actually needed. P6's key capture settles the open items marked "verify in P6".
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Claude Code Session Source|Claude Code Session Source]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Machine Audit 2026-10-22|Machine Audit 2026-10-22]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Sources|Conversation Loop Sources]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design Postmortem|Conversation Loop Design Postmortem]]"
---
# Per-Prompt Record
## What This Is
==The unit of tracking is one prompt and everything the agent did until the next one. The hook writes only facts, one line per event; the digest folds them into a per-prompt record; the person adds the verdict.==
Designed 2026-10-22, rewritten 2026-10-30 after the postmortem and a re-read of the live hooks reference. Nothing here is built. A prompt is the right grain because the hooks share a `prompt_id`, a record this short is readable in under a minute, and a weekly review of about 25 prompts fits an hour. On this Acer the volume is 13 Stop events in 2026-W42 (from 10-17), 56 in W43 and 110 in W44 so far, so a 25-prompt sample is 20 to 45 percent of a week.
Source tags: **D** documented hook field (hooks reference, re-read 2026-10-30), **O** observed in this machine's transcript, **G** read from git, **C** computed by the digest, **H** written by the human, **L** proposed by the second reviewer.
## Two kinds of record
- **Fact rows (written by the hook):** append-only, one JSON line per event, nothing derived and nothing judged. They never hold prompt text, assistant text, tool output or pasted documents.
- **Prompt records (built by the digest):** the fact rows of one prompt folded together, with the computed flags. They are rebuilt every run and can be thrown away.
## Keys
Every fact row carries `session_id`, `agent` (`main`, or the `agent_id` of the subagent or teammate the hook fired in), and `prompt_id` or null. The docs say `prompt_id` is "absent until the first user input", so rows from session start (instruction loads with `load_reason` `session_start`) have null and the digest attaches them to the session's first prompt. A subagent's tool calls fire the same hooks and carry `agent_id` and `agent_type`; whether they also carry the parent's `prompt_id` is not documented (verify in P6).
## Fact rows
| Event | Fields kept | Source |
|---|---|---|
| Common to all | `v` (schema version), `ts`, `machine`, `session_id`, `agent`, `prompt_id`, `cwd`, `project` (from `capture-projects.json`), `claude_version`, `permission_mode`, `effort` | D, C |
| `UserPromptSubmit` | `length`, `lines`, `pasted` (true over 2,000 characters or 40 lines, a working rule), `command_name` (the first word if it starts with `/`; the typed line arrives as typed) | D |
| `PostToolUse` | `tool`, `target` (path or first token of a command), `tool_use_id`, `ok: true`, `ms` (`duration_ms`), `result_bytes` | D |
| `PostToolUseFailure` | `tool`, `target`, `ok: false`, `error_class` (a short code, never the message), `interrupt` (`is_interrupt`), `ms` | D |
| `PermissionDenied` | `tool`, `reason_class`. Fires only in auto mode, not for a manual denial. All 162 `permissionMode` values in a sampled transcript are `auto` | D, O |
| `InstructionsLoaded` | `file` (relative), `memory_type`, `load_reason`, `trigger_file` | D |
| `SubagentStart` and `SubagentStop` | `agent_id`, `agent_type`, `transcript` (the subagent file's name) | D |
| `PreCompact` and `PostCompact` | `trigger` (`manual` or `auto`) | D |
| `Stop` | `last_message_length`. The doc advises `last_assistant_message` over the transcript for the final text, which can lag | D |
| `StopFailure` | `error_class` | D |
| `hook_error` | `stage`, a truncated error class, no payload text. Written when parsing fails | this layer |
A row is one `appendFileSync` of under 4 KB. 100 simultaneous Node appends of 3.0 KB and of 3.9 KB left 0 torn lines in 200 on this Acer (one run each, so the P6 test with 50 processes stays as the guard).
## Prompt record (built by the digest)
| Group | Field | Meaning | Source |
|---|---|---|---|
| Identity | `prompt_id`, `session_id`, `ts`, `machine`, `project` | Which prompt, where | D, C |
| Setup | `model`, `effort`, `permission_mode`, `claude_version`, `git_branch` | How the agent was set up | D, O (`requestedModel`, `gitBranch` in the transcript) |
| Source class | `source`: `typed`, `scheduled`, `subagent_report`, `other_session`, `unknown` | Whether you typed it | O (`origin`, `promptSource` in the transcript); the hook payload has no source field |
| Start context | `context_tokens_start`, `loaded_instruction_files[]` | How full the window was; which CLAUDE.md and rules loaded | O (`usage` on the prior assistant entry, deduplicated), D |
| Work | `tools[]`, `commands[]`, `files_read[]`, `files_written[]`, `skills[]`, `subagents[]`, `mcp[]` | Everything the agent did, one entry each | D, C |
| Flags | `compactions`, `permission_denials`, `retry_runs`, `reads_twice`, `claims_done`, `verified_after_last_edit` | Rule results, defined in [[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]] | C |
| End | `stop_reason`, `duration_s`, `tokens_out`, `tokens_cache_read`, `tokens_cache_creation` | How the turn ended and what it used | O (deduplicated by message id and request id; `turn_duration`) |
| Next | `next_prompt_class`: `continue`, `pushback`, `new_task` | What you said next | C (pattern rule), H, L |
| Outcome | `commits[]` | Commits inside the prompt's time window | G |
| Review | `codes[]`, `first_failure_note`, `second_reviewer_flags[]`, `human_decision` | The weekly review's verdict | H, L |
`claims_done` is a regex over the final message and `verified_after_last_edit` is true when a Bash or PowerShell row with a test, lint or build command follows the last Edit or Write row of the same prompt. Both are computed by the digest from rows that are all written, never by the hook at Stop time. Token and cost fields come from the transcript, because no hook payload carries usage, and must be deduplicated: the exporter overstated totals 2.2 to 2.5 times before the 2026-10-22 fix.
## What was cut, and why
- **Prompt text in raw events** (was: first 200 characters, redacted). The exporter notes already hold the redacted prompts, the digest carries ids only, and a second copy of every prompt on disk has no reader.
- **`agent_lines_kept_7d`** (the share of agent-written lines unchanged after a week). Line survival needs lines traced to prompts through commits. SWE-chat measures it from complete traces with authorship attribution; here 874 of 974 commits in the last 30 days are `Auto-sync` snapshots taken every 30 minutes, which also carry your own edits. The output check is five hand-opened files (weekly step 7).
- **`last_message_head`** (the first 300 characters of the final message). Same reason as prompt text.
## Shape
```json
{"v":1,"ts":"2026-11-02T05:40:11Z","machine":"GUPTA-BUILDS","session_id":"d4e37e22","agent":"main","prompt_id":"6a1f","cwd":"D:\\_Anant\\20_Progress\\Documents\\Jarvis","project":"Jarvis","event":"PostToolUse","tool":"Edit","target":"30_Order/System/claude-workflow/README.md","ok":true,"ms":88,"result_bytes":310}
```
Invented values. The line for a failure is the same shape with `ok:false` and `error_class`.
## Where it lives
- **Fact rows:** `30_Order/System/claude-workflow/logs/events-<machine>.jsonl`. The folder is **not** already ignored for a new file: on 2026-10-30 `git check-ignore -v` on `events-GUPTA-BUILDS.jsonl` exits 1, and `.gitignore` and `.stignore` list named logs only. P6 adds `events-*.jsonl` and the fallback log to both, proves them with `git check-ignore -v`, and only then writes. `.stignore` does not sync, so the Dell needs the same lines.
- **What the other laptop and the review see:** the weekly digest, which is generated, small and rebuildable. It holds ids, counts and links. For a prompt in The Plan it holds the session id only, with no title, link, path or quote.
- **Raw transcripts** stay where Claude Code puts them and live 60 days on the Acer. When a prompt has no fact rows (a headless `claude -p` run kills async hooks at teardown, and 19 of 150 transcripts on the Acer are headless), the digest folds the prompt from the transcript and marks it `folded`.
- **The activity log** `~/.claude/jarvis-session-activity.jsonl` (the export hook's own file) begins with a UTF-8 byte-order mark on its first line, so a strict JSON reader drops line 1. Every reader strips the mark; the file is not rewritten.
## What the record deliberately leaves out
Assistant prose, thinking blocks, tool result bodies, pasted documents, prompt text, and `history.jsonl`, which is only ever counted. The exporter's session notes do contain tool results (142 notes, 25.3 MB, median 76 KB), which is why the notes and the events have different privacy rules.
## Verify in P6
Whether a subagent's rows carry the parent `prompt_id`; whether a typed built-in command such as `/clear` fires `UserPromptSubmit` (the docs say a typed skill or custom command does, with the line as typed); whether the 33 documented events all fire under Claude Code 2.1.314; and that every field above is present, pinned as fixtures so a release that renames one fails a test.
## Change Log
*2026-10-30.* The 2026-10-22 text is in git. Changes: keys now include `agent` and a null `prompt_id` (postmortem 1); the ignore claim corrected; prompt text, `last_message_head` and `agent_lines_kept_7d` cut (postmortem 1, 2); `claims_done` and `verified_after_last_edit` moved from the hook to the digest (postmortem 1); source class added (postmortem 2); privacy rule for The Plan added (postmortem 9, owner 2026-10-30); BOM note and the folded-prompt rule added (second pass).
## Non-Goals
Not a replacement for the transcript, and not scored. The record has no quality score; the review decides what was wrong, and the code list in [[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]] is the vocabulary.
