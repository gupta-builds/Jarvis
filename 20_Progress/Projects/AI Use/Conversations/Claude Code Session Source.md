---
type: project
status: active
created: 2026-10-21
updated: 2026-10-30
tags:
  - project
  - ai
  - conversations
  - claude-code
project_kind: spec
next: Check each field below against Claude Code's documentation and decide which ones a session record must keep.
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Layer|Conversation Layer]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Capture Pipeline - As Built|Capture Pipeline]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Export Conformance|Export Conformance]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Research Plan|Conversation Loop Research Plan]]"
---
# Claude Code Session Source
## What This Is
==A Claude Code transcript already holds almost everything worth tracking per session, and the exporter reads about a fifth of the entry types in it.==
This note records what is in the raw transcripts on the Acer today, counted from all 122 top-level files in `C:\Users\anant\.claude\projects\` on 2026-10-21 (counts only; no transcript text was copied). It is the starting inventory for the research plan, not Claude Code's documented schema, which has not been read yet.
## Where the files are
- `~/.claude/projects/<cwd-slug>/<session_id>.jsonl`, where the slug is the working directory with separators turned into hyphens (`D---Anant-20-Progress-Documents-Jarvis`).
- Subfolders hold subagent and tool-result files. This Acer has 96 subagent transcripts beside the 122 top-level ones.
- Windows-only directories seen: six project slugs, among them `C--Users-anant` (the home directory, 26 sessions, 13 with an assistant turn), the Jarvis vault (68 sessions, 57 with one), and The Plan (25, 19).
- Observed 2026-10-22: each session also has a folder `<session_id>/` holding `subagents/agent-<id>.jsonl` with a `.meta.json` beside it, and `tool-results/` with the raw output of large tool calls (five of seven files in this session were PDFs fetched from the web). The sweep covers all of them. Layout and sizes: [[20_Progress/Projects/AI Use/Conversations/Machine Audit 2026-10-22|Machine Audit 2026-10-22]].
- User entries in the transcript carry a `promptId`, which ties a typed prompt to everything that followed it; it is the key in [[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]]. The format is documented as internal and unstable, so a script must tolerate missing fields.
- The oldest top-level file is dated 2026-09-21. No `cleanupPeriodDays` is set in the user settings. The docs state a 30-day default, so older sessions are deleted (see "What the docs say" below).
## What a transcript holds
Entry types across the 122 files, with counts:

| Type | Count | Exporter uses it |
|---|---|---|
| assistant | 11,352 | Yes: text, tool calls, `usage`, `model` |
| attachment | 7,338 | No |
| user | 6,605 | Yes: text and image blocks; tool results |
| atis-latch | 2,731 | No |
| last-prompt | 2,750 | No |
| mode | 2,636 | No |
| permission-mode | 2,263 | No |
| ai-title | 2,497 | Yes: the note title |
| system | 606 | No |
| api-request-blob, api-request, api-request-shape | 981, 673, 30 | No |
| file-history-delta, file-history-snapshot | 494, 295 | No |
| queue-operation | 384 | No |
| cost-state | 202 | No |
| agent-name | 107 | No |
| continued-in | 1 | No |
System entries by `subtype`: `turn_duration` 320, `away_summary` 149, `local_command` 51, `informational` 37, `stop_hook_summary` 29, `compact_boundary` 18, `api_error` 2.
Content blocks inside assistant and user messages: `text`, `tool_use`, `tool_result`, `thinking`, `image`, and `tool_addition`. The exporter renders text, image, `tool_use`, and `tool_result`; it has no handling for `thinking`.
Fields seen on entries, from the one transcript sampled in detail: `sessionId`, `uuid`, `parentUuid`, `timestamp`, `cwd`, `gitBranch`, `version`, `entrypoint`, `isSidechain`, `permissionMode`, `requestedModel`, `effort`, `durationMs`, `thinkingDurationMs`, `stopReason`, `toolUseResult`, `hookInfos`, `hookCount`, `hookErrors`.
## What the hook is given
The hook reads JSON on stdin. The script uses `hook_event_name`, `cwd`, `transcript_path`, `session_id`, and `reason`. It writes those to the activity log. Other fields in the payload have not been inspected.
## Counts that matter for tracking
- **Tool calls:** 6,318 results on this Acer, 316 flagged as errors (5.0 percent). The error flag is not in any note.
- **Most used tools:** Bash 2,039, Read 1,608, Edit 811, PowerShell 546, Write 352, Grep 293, Glob 204, Agent 96, WebSearch 70, WebFetch 67, ToolSearch 65, `mcp__jarvis__vault_read` 51. Full table in [[60_Claude/30_Reviews/AI/Conversations/Tool Call Analysis|Tool Call Analysis]].
- **Skills and commands:** the `Skill` tool ran 9 times (pdf 2, weekly-review 2, and one each of xlsx, schedule, copilot-web-fetch, mentorship, json-canvas). Slash commands visible as `<command-name>` tags: `/clear` 33, `/startday` 6, `/model` 6, `/weekly-review` 3, `/mcp` 3, `/compact` 2, `/config` 2, and singles. The exporter skips every turn that starts with `<`, so none of these reach the notes.
- **Subagents:** `fork` 41, `web-fetch` 25, `general-purpose` 11, `vault-curator` 4, `research-distiller` 5, `Explore` 3, `claude-code-guide` 3, and singles.
- **MCP servers called:** `jarvis` 129, `the-plan` 22, Calendar 6, Gmail 5, Context7 5, Drive 4.
- **Hooks:** 29 `stop_hook_summary` entries show `jarvis-session-continuity.ps1`, 0 hook errors.
- **Permission mode:** `auto` on 2,248 entries, `plan` on 15.
- **Entry points:** `cli` 24,653 entries, `sdk-cli` 1,248 (headless runs such as the weekly review).
- **Models on assistant turns:** `claude-sonnet-5` 6,808, `claude-sonnet-5-5` 2,941, `claude-opus-5-5` 1,590, `<synthetic>` 13.
- **Versions:** 24 distinct Claude Code versions, 2.1.278 through 2.1.307.
## What the docs say about this data
Checked 2026-10-21 against `code.claude.com/docs`. "Verbatim" means quoted from the page in an independent second read.
- *Verbatim:* "The entry format is internal to Claude Code and changes between versions, so scripts that parse these files directly can break on any release." Recommended instead: `/export`, `claude -p` with `--output-format json` or `stream-json`, the `transcript_path` hook field, and the Agent SDK. The counts above are therefore a snapshot of version-specific entries (24 versions on this Acer).
- *Verbatim:* retention default 30 days, minimum 1, `0` rejected. The sweep deletes `projects/<project>/<session>.jsonl`, `subagents/`, `tool-results/`, `file-history/`, `plans/`, `debug/`, and `usage-data/`. It leaves `history.jsonl`, `stats-cache.json`, and auto memory files.
- *Verbatim:* `/context` shows "what is currently consuming context". The context-window page lists what loads before the first prompt (CLAUDE.md, auto memory, MCP tool names, skill descriptions) and what survives compaction (project-root CLAUDE.md and auto memory re-injected; up to five recently read files re-read; invoked skill bodies capped at 5,000 tokens each and 25,000 total).
- *One pass:* 33 hook events, with `prompt_id` among the common input fields, and `InstructionsLoaded` reporting `file_path`, `memory_type`, and `load_reason` (`session_start`, `nested_traversal`, `path_glob_match`, `include`, `compact`). *One pass:* the telemetry events `tool_result`, `tool_decision`, `api_request`, `skill_activated`, `subagent_completed`, `hook_execution_complete`, and `compaction`.
- The architecture paper (arXiv 2604.14228, a preprint) describes a nine-step turn and five context shapers before every model call, from Claude Code v2.1.88. It lists 27 hook events where the current docs list 33, so treat its version-specific details as dated.
## Non-Goals
Not the official schema, and not a statement of what should be kept. Fields not listed under the counts were not examined. The doc-derived items are checked only as marked; nothing here was compared with another machine's transcripts.
## Corrections
*2026-10-30. The inventory above is kept as written. The "one pass" items are now checked against the live pages (hooks, commands, skills, headless, costs, monitoring-usage on code.claude.com, fetched 2026-10-30), and the counts were refreshed on the Acer. Counts only; no transcript text was read.*
### Documented, now confirmed
- **33 hook events**, counted from the event table: SessionStart, Setup, UserPromptSubmit, UserPromptExpansion, PreToolUse, PermissionRequest, PermissionDenied, PostToolUse, PostToolUseFailure, PostToolBatch, Notification, MessageDisplay, SubagentStart, SubagentStop, TaskCreated, TaskCompleted, Stop, StopFailure, TeammateIdle, InstructionsLoaded, ConfigChange, CwdChanged, DirectoryAdded, FileChanged, WorktreeCreate, WorktreeRemove, PreCompact, PostCompact, PreModelSwitch, PostModelSwitch, Elicitation, ElicitationResult, SessionEnd.
- **Common input fields:** `session_id`, `prompt_id` ("absent until the first user input"; it matches the `prompt.id` attribute on OpenTelemetry events), `transcript_path` ("written asynchronously and may lag the in-memory conversation"; use `last_assistant_message` on Stop and SubagentStop for the final text), `cwd`, `scratchpad_dir`, `permission_mode`, `effort`, `hook_event_name`. `agent_id` and `agent_type` identify a subagent or teammate; a subagent's tool calls fire the same hooks.
- **Per event:** `PostToolUse` carries `tool_name`, `tool_input`, `tool_use_id`, `tool_response`, `duration_ms` (excluding permission prompts and PreToolUse hooks). `PostToolUseFailure` carries `error`, `is_interrupt`, `duration_ms`. `SubagentStop` carries `agent_id`, `agent_type`, `agent_transcript_path`, `last_assistant_message`. `InstructionsLoaded` carries `file_path`, `memory_type`, `load_reason` (`session_start`, `nested_traversal`, `path_glob_match`, `include`, `compact`), is asynchronous and cannot block. `StopFailure` carries the API error string in `last_assistant_message`.
- **Behavior that the design depends on:** matching hooks run in parallel; `PostToolUse` fires concurrently for parallel tool calls (`PostToolBatch` fires once per batch); an async hook's `timeout` is not enforced; under `claude -p` any async hook still running at teardown is killed and finalized as `cancelled`; `SessionEnd` hooks share a 1.5-second budget unless a per-hook `timeout` raises it, up to 60 seconds; `SessionEnd` reasons are `clear`, `resume`, `logout`, `prompt_input_exit`, `other`.
- **Two facts that change the design:** `PermissionDenied` "only fires in auto mode" (not for a manual denial or a PreToolUse deny). `UserPromptSubmit` also fires for a session-scoped scheduled task or `/loop` iteration, a background subagent reporting back, and a message from another session, and for a typed skill or custom command with the line as typed; `UserPromptExpansion` fires for the expansion and carries `command_name`. Whether a typed built-in command such as `/clear` fires `UserPromptSubmit` is not documented.
- **Telemetry:** `OTEL_LOGS_EXPORTER` accepts `otlp`, `console` and `none`; there is no file exporter.
- **`/insights`:** a built-in command that writes `~/.claude/usage-data/report.html` and a timestamped copy, analyzes up to 200 sessions it has not seen on this machine, counts against plan usage, and is deleted on the `cleanupPeriodDays` schedule. Skills docs: bundled skills are prompt-based, "Most built-in commands instead execute fixed logic directly", so a skill cannot run it. Headless docs: "Built-in commands that only run in the terminal interface, such as `/login`, aren't available" (nothing is said about `/insights`).
### Counts, refreshed on 2026-10-30
- **Top-level transcripts:** 150. By `entrypoint` on the first entry: `cli` 130, `sdk-cli` 19, `claude-desktop` 1. The oldest is dated 2026-09-28 by last write. Claude Code is 2.1.314.
- **Sampled transcript** (a 20 MB Jarvis session): 302 `promptId` fields; `permissionMode` `auto` on all 162 entries that carry it; 9 `turn_duration`, 9 `stop_hook_summary` and 3 `away_summary` system entries; attachment types `environment`, `edited_text_file`, `deferred_tools_record`, `prompt_snapshot`, `skill_listing`, `instructions` and a few singles. One `instructions` attachment was seen, so whether lazy instruction loads reach the transcript is not known; `InstructionsLoaded` is the documented source.
- **Hook outcomes:** the activity log has 355 lines; 75 are `export_result`. Hook-only facts a transcript lacks: lazy instruction loads (unverified), the `PermissionDenied` reason, compaction triggers, and life beyond the 60-day sweep.
- **Slash commands:** the notes still drop them (the exporter skips turns that start with `<`), so `/clear` and skill invocations reach neither the notes nor, until P6, any other record.
### Stale in the sections above
"The oldest top-level file is dated 2026-09-21. No `cleanupPeriodDays` is set" is now 2026-09-28 and 60 days. "122 top-level files" is 150. "24 distinct versions, 2.1.278 through 2.1.307" runs to 2.1.314. "Docs state a 30-day default" still holds as the default; the Acer overrides it.
