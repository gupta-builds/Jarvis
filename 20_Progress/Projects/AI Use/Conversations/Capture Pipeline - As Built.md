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
## Corrections
*2026-10-30. The path above is kept as written (it is the 2026-10-21 state). This section is the same path as it runs today on the Acer (Windows). Checked by reading the settings, the hook log, the coverage script and the scheduled tasks.*
```
Claude Code writes  ~/.claude/projects/<cwd-slug>/<session_id>.jsonl   (live, every entry)
  |  Stop (async, timeout 60) after every assistant turn, SessionEnd (sync, timeout 30) when the session closes
  v
jarvis-session-continuity.ps1   (global user settings; 272 lines; per-session named lock)
  |-- append  {Stop|SessionEnd, session_id, cwd, reason, transcript_path}   to ~/.claude/jarvis-session-activity.jsonl
  |-- export-claude-session.ps1  (routing from capture-projects.json; -Force for re-render)
  |-- append  {export_result, status, ms, error}   (status: written, dup, junk, legacy, error, skipped, no_status)
  v
60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/<project>/   project = Jarvis | The Plan | UMN Courses | Home | Scratch | leaf name
  ^
  |  every 30 min: ConversationCapture-Backfill-Windows -> export -BackfillAll -> update-capture-health.ps1
  v
check-capture-coverage.ps1 (read-only, by hand)    Jarvis-GitAutoSync (every 30 min, branch infra/cross-laptop-sync)
```
### What changed, step by step
- **Step 2, the hook.** `Stop` is async with `timeout: 60`. `SessionEnd` stays synchronous with `timeout: 30` because a fresh export of the 115.9 MB transcript takes 4.8 to 5.1 seconds and the default budget is 1.5. A named mutex per session stops an async Stop and a SessionEnd from writing two notes (it had: 8 sessions gave 16 notes). The PDF guard is a different hook (PreToolUse); it is not capture.
- **Step 3, what the hook logs.** Two lines per event: the intent line, then an `export_result` line written before any error is swallowed. From 2026-10-28 22:36 to 2026-10-30 21:14, 75 `export_result` lines: `written` 60, `skipped` 10, `dup` 3, `junk` 2. All 10 skips say "transcript not found" and follow a `SessionEnd` with reason `resume` or `other`: a session that ended before it had a transcript. The activity file's first line carries a byte-order mark.
- **Step 4, project.** Five ordered rules in `capture-projects.json`, then the leaf of the cwd.
- **Step 5, the marker.** Unchanged, and it has a hole: if the note is deleted but its `.exported/<id>.done` marker stays, the exporter reports `dup` forever. This happened to `10-02 ENGL 1004 Journal Entry 3` on 2026-10-30.
- **Step 6, render.** New notes have `status: seed`, `review_state: raw`, no BOM, deduplicated tokens, priced 5.5 models, fenced commands, tool results included. A sampled session's note is 76 KB at the median and 1.35 MB at the largest; the 142 Acer notes total 25.3 MB.
- **Step 7, the backfill.** Still writes an exit code and no per-export record. Headless `claude -p` runs may leave no hook line (3 of the 8 headless transcripts since 2026-10-17 have none; the cause was not determined). The coverage script walks all 150 transcripts and finds only the deleted note uncovered, so the backfill appears to catch them; that is an inference, not a per-session proof.
- **Step 8, sync.** `Jarvis-GitAutoSync` commits and pushes to `origin/infra/cross-laptop-sync` every 30 minutes; 874 of the last 974 commits are Auto-sync snapshots. It ended FAILED in 2 of its last 12 runs on 2026-10-30 and recovered.
### Current State table, refreshed
| Step | Evidence |
|---|---|
| Hook registered | Global settings: Stop, SessionEnd, three PreToolUse; project settings: the two vault guards |
| Hook fires and records | 51 of 51 Stop and 24 of 24 SessionEnd events since 2026-10-28 22:36 have an `export_result`; 5 of 5 `/clear` exits |
| Hook speed | 60 written exports: p50 729 ms, p95 1,911 ms, max 2,382 ms. Stop is async, so the user does not wait |
| Backfill | Last run 21:03 on 2026-10-30, result 0, every 30 minutes |
| Ground truth | 150 top-level transcripts; 120 have an assistant turn; 119 have exactly one note in the right folder; 30 have no assistant turn (exempt) |
| Notes | 142 in the Acer tree; 23 have no live transcript and no `review_state` |
### Still not recorded
No step records what the backfill exported or skipped, nothing watches for a gap (P9), and nothing reads the notes (P5 to P8).
