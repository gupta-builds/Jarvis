---
type: project
status: active
created: 2026-10-22
updated: 2026-10-22
tags:
  - project
  - ai
  - conversations
  - audit
project_kind: spec
next: Re-run the same checks on the Dell and fill the Dell column of the registration table.
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Layer|Conversation Layer]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Capture Registration|Capture Registration]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Build Plan|Conversation Loop Build Plan]]"
---
# Machine Audit 2026-10-22
## What This Is
==On the Acer, Claude Code writes at least a dozen kinds of record per prompt and per tool call, and the vault's capture keeps copies of two of them.==
This is what runs and what is written on `GUPTA-BUILDS` on 2026-10-22, found by listing folders, reading settings, counting lines, and querying Task Scheduler, processes, and ports. No credential file, no prompt text, and no transcript text was read; `history.jsonl` and the transcripts were only counted. It is the factual base for [[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]] and the build order in [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Build Plan|Conversation Loop Build Plan]].
## What is running
| Part | State |
|---|---|
| Claude Code | 18 `claude` processes. `~/.claude/sessions/` holds 8 live-registry files (pid, `sessionId`, `cwd`, `startedAt`, `version` 2.1.307, `kind`, `entrypoint`, `status` busy or idle, `updatedAt`); this session is `jarvis-c6`, pid 28004 |
| Codex | 5 `codex` processes plus the `CodexSandboxService.OpenAI.Codex` service. No exporter reads it |
| Obsidian | 5 processes. The `jarvis` MCP server in `.mcp.json` is HTTP at `127.0.0.1:27123/mcp/` with an `Authorization` header; a process (pid 50600) listens there now, but nothing did when this session started (`ECONNREFUSED`), so a session begun with Obsidian closed loses the `mcp__jarvis__*` tools |
| Syncthing | 2 processes. `Jarvis-Syncthing-Health` returned 1 at its last check |
| WSL | `Ubuntu-24.04` Running at about 00:35 (it was Stopped on 2026-10-21 evening). The WSL backfill timer only fires while it runs |
| Ollama | Installed. `ollama list` shows no models |
| Hardware | Intel Core Ultra 9 275HX, 31.4 GB RAM, NVIDIA GeForce RTX 5070 Ti Laptop GPU with 12,227 MiB |
| Status line | `statusline.sh` (18,274 bytes) through Git Bash every 30 seconds |
| Plugins | `context7` and `skill-creator` enabled. Seven other marketplace plugins carry a `hooks.json` but are not enabled, so no plugin hooks run |
| Scheduled tasks | `ConversationCapture-Backfill-Windows` (30 min), `Jarvis-GitAutoSync` (30 min), `Jarvis-WeeklyReview` (Sundays), `Jarvis-Syncthing-Health` (about 5 min), `Jarvis-Codex-Daemon-Guard`, `ThePlan-GitSync` |
## Hooks and settings
- Global `~/.claude/settings.json`: `Stop` and `SessionEnd` both run `jarvis-session-continuity.ps1`, with no `timeout` and no `async`. `autoMode.environment` is configured (trusted repo recorded as the home directory with no remotes). Permissions: 1 allow, 12 deny, 1 ask.
- Project `.claude/settings.json`: `PreToolUse` runs `jarvis-write-guard.ps1` and `PostToolUse` runs `jarvis-internship-note-guard.ps1`, both on `Write|Edit|MultiEdit`. A project `settings.local.json` also exists.
- Global `settings.local.json` enables the `github` and `jarvis` MCP servers and disables `the-plan`.
- Not registered anywhere: `SessionStart`, `UserPromptSubmit`, `PostToolUseFailure`, `PermissionDenied`, `SubagentStop`, `InstructionsLoaded`, `PreCompact`, `PostCompact`, `StopFailure`.
## What is written, and when
| Record | Written by | When | Size on 2026-10-22 | Swept at 30 days |
|---|---|---|---|---|
| `projects/<slug>/<session>.jsonl` | Claude Code | every entry, live | this session 8.48 MB, 2,157 lines over 4 days: 486 assistant, 331 user, 215 attachment, 197 `api-request-blob`, 131 `api-request`, 22 system | yes |
| `<session>/subagents/agent-<id>.jsonl` and `.meta.json` | Claude Code | per subagent | 54 files, 9.27 MB so far (27 subagents) | yes |
| `<session>/tool-results/` | Claude Code | large tool outputs kept aside | 7 files, 13.87 MB (five are raw PDFs saved by WebFetch) | yes |
| `history.jsonl` | Claude Code | one line per typed prompt: `display`, `pastedContents`, `timestamp`, `project`, `sessionId` | 432 lines, 442,355 bytes, since 2026-09-18; 104 lines carry pasted content | **no** |
| `file-history/<session>/` | Claude Code | a copy of a file before each edit | 761 files, 10.6 MB | yes |
| `shell-snapshots/`, `paste-cache/`, `uploads/`, `plans/` | Claude Code | per shell start, paste, upload, plan | 23, 75, 20 (15.7 MB), 1 files | yes |
| `sessions/<pid>.json` | Claude Code | continuously while a session runs | 8 files | no (own rule) |
| `telemetry/1p_failed_events.*.json` | Claude Code | when an event fails to send | 4 files, 1.1 MB, newest 2026-10-01; not opened | not listed |
| `.last-cleanup` | Claude Code | each retention sweep | `2026-10-22T01:53:36Z` | n/a |
| `jarvis-session-activity.jsonl` | our hook | every Stop and SessionEnd | 26,033 bytes since 2026-10-17 | no |
| Note, `.exported` marker, `_raw_jsonl` junction, two rollup files | our exporter | every Stop and every 30 minutes | see [[20_Progress/Projects/AI Use/Conversations/Capture Pipeline - As Built\|Capture Pipeline]] | no |
| `Auto-sync` commit | `Jarvis-GitAutoSync` | every 30 minutes | one commit per tick | no |
In the transcript, a user entry carries `promptId`, `permissionMode`, `gitBranch`, `cwd`, `version`, `origin`, `promptSource`, `turnPosition`, `entrypoint`, and `sessionId`. This session so far holds 394 tool results (6 errors), 69 Bash, 132 Edit, 82 Read, 59 WebSearch, 34 Write, and 28 Agent calls (16 `web-fetch`, 12 `fork`).
## Findings
1. **Prompts and pasted text live forever in `history.jsonl`.** The sweep does not touch it. A copy of it into the vault or anywhere synced would carry every pasted document.
2. **The hook layer sees a tenth of what Claude Code offers.** Two of 33 events, plus two project guards.
3. **`projects/` is 606 MB, 87% of it (528.6 MB) the Jarvis project.** Subagent transcripts and saved tool results are the growth. There is no cap besides the 30-day sweep.
4. **The status line leaves 111 stray `.statusline-ratelimit-cache.json.tmp.*` files in `~/.claude` (18 are zero bytes).** They accumulate at one per failed rename and are not swept.
5. **A session's tools depend on Obsidian being open.** The `jarvis` server was refused at the start of this session and is up now.
6. **Codex, WSL, and Syncthing run alongside Claude Code with no shared record of any of them.**
7. **Local AI is possible and not started.** 12 GB of GPU memory fits quantized models in the 7B to 14B range; no model is pulled.
## Non-Goals
Not a security audit, and not a Dell check. Contents of `.credentials.json`, `history.jsonl`, the transcripts, and the telemetry files were not read.
