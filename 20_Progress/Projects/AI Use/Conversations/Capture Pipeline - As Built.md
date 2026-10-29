---
type: project
status: active
created: 2026-10-21
updated: 2026-10-21
tags:
  - project
  - ai
  - conversations
  - claude-code
project_kind: spec
next: Compare each step here with what Claude Code exposes once the research plan's first section is done.
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Layer|Conversation Layer]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Capture Scripts|Capture Scripts]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Capture Registration|Capture Registration]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Layer Logs|Conversation Layer Logs]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Claude Code Session Source|Claude Code Session Source]]"
---
# Capture Pipeline - As Built
## What This Is
==One Claude Code session on the Acer's Windows side travels from a transcript file to a synced, redacted note in eight steps, and only two of them leave any record that they ran.==
This is the path as it runs on 2026-10-21. It is not a design. The WSL side follows the same shape with `wsl-session-export.ps1` and a systemd timer, and was last verified on 2026-10-17 ([[Old Laptop Rebuild - Build 5c Acer Workspace and Capture Findings]]). Cowork and Cursor have their own paths, listed after the steps.
```
Claude Code writes  ~/.claude/projects/<cwd-slug>/<session_id>.jsonl   (live, every entry)
  |  Stop after every assistant turn, SessionEnd when the session closes
  v
jarvis-session-continuity.ps1   (global user settings, Stop + SessionEnd)
  |-- append one line to  ~/.claude/jarvis-session-activity.jsonl
  |-- export-claude-session.ps1 -TranscriptPath -SessionId -Cwd -SourceApp ClaudeCode
  |-- SessionEnd only: sweep Cowork sandboxes, export each new transcript
  v
60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/<project>/
    MM-DD {title}.md   .exported/<session_id>.done   _raw_jsonl (junction)
    00 - Session Index.md   00 - Tool Usage Rollup.md
  ^
  |  every 30 min: ConversationCapture-Backfill-Windows -> backfill-windows-silent.vbs
  |  -> export-claude-session.ps1 -BackfillAll -> update-capture-health.ps1 -> 00 - Capture Health.md
  v
Jarvis-GitAutoSync (every 30 min) commits and pushes; Syncthing carries files to the Dell
```
## Steps
1. **Claude Code appends to the transcript.** Every user turn, assistant turn, tool call, tool result, and system event is one JSON line. Shape in [[20_Progress/Projects/AI Use/Conversations/Claude Code Session Source|Claude Code Session Source]].
2. **The hook fires.** `Stop` and `SessionEnd` in `C:\Users\anant\.claude\settings.json` run the same command: `powershell -NoProfile -ExecutionPolicy Bypass -File D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/claude-workflow/hooks/jarvis-session-continuity.ps1`. `SessionStart` is not registered there, so the context-pack branch inside the script never runs.
3. **The hook logs intent.** It appends `{timestamp, event, session_id, cwd, reason, transcript_path, in_jarvis}` to `%USERPROFILE%\.claude\jarvis-session-activity.jsonl`. This is the only record the hook itself writes.
4. **The exporter picks a machine and a project.** The host name maps to `Acer` or `Dell`; any other host writes nothing and appends a line to `%LOCALAPPDATA%\claude-capture\unknown-host.log`. The project is the leaf of the session's `cwd`, with the home directory named `Home`.
5. **The exporter decides whether to write.** A `.exported/<session_id>.done` marker means the session was exported; the marker is stale if the transcript is newer, and then the note is rewritten in place. Legacy markers under the older trees also count as exported. A session with no real assistant turn is skipped and still gets a marker.
6. **The exporter renders.** Two passes over the JSONL: the first collects `ai-title` entries and indexes tool results by `tool_use_id`, the second builds turns, tool calls, token usage per model, cost, and the files touched. Secrets are redacted by regex. The note is written as `MM-DD {title}.md`, the marker is written (its content is the note's file name), `_raw_jsonl` is created as a junction to the project's transcript folder if missing, and both `00 -` rollup files are regenerated.
7. **The backfill catches misses.** Every 30 minutes the scheduled task runs the same exporter over every top-level transcript. It does not read subagent transcripts. The launcher then calls `update-capture-health.ps1` with the exit code, which appends one record and rewrites `00 - Capture Health.md`.
8. **Sync.** `Jarvis-GitAutoSync` commits and pushes the vault every 30 minutes; the commit subject carries a file count (for example `Auto-sync: 2026-10-21 19:03, 6 files changed`). Syncthing carries the same files to the Dell. `_raw_jsonl/`, `_raw_composer/`, the health state files, and the health note are excluded from both.
## Current State
Verified on the Acer on 2026-10-21.

| Step | Evidence |
|---|---|
| Hook registered | Global settings list `Stop` and `SessionEnd` with the command above; project settings carry only the two guard hooks |
| Hook fires | `jarvis-session-activity.jsonl` is 19,387 bytes, first line 2026-10-17T21:09, 56 events across 5 days; 29 `stop_hook_summary` entries in transcripts show the hook ran with 0 errors |
| Backfill | Task `ConversationCapture-Backfill-Windows` last ran 19:33 with result 0, next 20:03 |
| Health record | `00 - Capture Health.md` lists Windows runs through 2026-10-22T00:33Z, all exit 0; WSL's last row is 2026-10-18T02:31Z |
| Ground truth | 122 top-level transcripts, 92 with at least one assistant turn, against 108 Acer Windows notes; the extra notes come from transcripts since deleted (see the postmortem) |
| Sync | `Auto-sync` commits every 30 minutes through 2026-10-21 19:03 |
The seven-step list leaves two records of a run: the activity line (step 3) and the health row (step 7). No step records that an export wrote, skipped, or failed.
## Other Paths
- **WSL:** `wsl-session-export.ps1` under `pwsh` in WSL, hooks in `~/.claude/settings.json`, systemd user timer `claude-capture-backfill` every 30 minutes. Acer WSL (`Ubuntu-24.04`) was Stopped on 2026-10-21; its newest note is 2026-10-17.
- **Cowork:** swept from `%APPDATA%\Claude\local-agent-mode-sessions` on SessionEnd, grouped by month under `<Machine>\Windows\Claude\Cowork\<YYYY-MM>\`. No session after July.
- **Cursor:** a Windows scheduled task on the Dell, `Jarvis-Cursor-Session-Export`, every 15 minutes, joining agent-transcript JSONL with the SQLite `composerHeaders` table. Not registered on the Acer. See [[30_Order/System/cursor-workflow/README|Cursor Workflow]].
## Non-Goals
This note does not say what the pipeline should do, does not cover distillation or review, and makes no claim about the Dell or WSL beyond the sources named. Redaction coverage, re-export cost, and Claude Code version drift are open questions in the postmortem, not answered here.
