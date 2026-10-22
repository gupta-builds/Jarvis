---
type: project
status: active
created: 2026-10-21
updated: 2026-10-21
tags:
  - project
  - ai
  - conversations
  - logs
project_kind: spec
next: Decide, after the research, which of these records belong in a single log family and which stay as state files.
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Layer|Conversation Layer]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Capture Pipeline - As Built|Capture Pipeline]]"
  - "[[30_Order/Standards/AI Loop/Logs|Logs]]"
  - "[[30_Order/Standards/Log Standard|Log Standard]]"
  - "[[30_Order/Workflows/Toolkit/Maintaining Logs|Maintaining Logs]]"
---
# Conversation Layer Logs
## What This Is
==Fifteen records belong to the conversation layer, and the two that could show a failed export, the activity log and the health note, only show that something ran.==
Every log, state file, and marker that the layer writes or is supposed to write, with who writes it and who reads it, as of 2026-10-21. "Synced" means carried between laptops by Syncthing and git. Sizes are as measured on the Acer.
## Records the capture path writes
| Record | Where | Writer | Shape | Synced | Read by |
|---|---|---|---|---|---|
| Session activity | `%USERPROFILE%\.claude\jarvis-session-activity.jsonl` (outside the vault, 19,387 bytes, since 2026-10-17) | the hook, every Stop and SessionEnd | JSONL: timestamp, event, session_id, cwd, reason, transcript_path, in_jarvis | no | nothing |
| Export marker | `<project>/.exported/<session_id>.done` (663 across the tree; the one sampled is 66 bytes and holds the note's file name) | the exporter | text | yes | the exporter, to skip or refresh |
| Raw transcript view | `<project>/_raw_jsonl` | the exporter | junction (Windows) or one-way copy (WSL) | no, ignored by git and Syncthing | nothing |
| Backfill state | `30_Order/System/claude-workflow/logs/capture-health-windows.json` and `-wsl.json` | `update-capture-health.ps1` | JSON array, last 20 `{timestamp, exitCode}` | no | the health script |
| Capture Health | `AI Conversations/00 - Capture Health.md` (1,019 bytes) | `update-capture-health.ps1` | markdown, overwritten each run, last 10 rows | no | a person who opens it |
| Session Index and Tool Usage Rollup | `<project>/00 - Session Index.md`, `00 - Tool Usage Rollup.md` (56 pairs) | the exporter, rewritten every export | Dataview and DataviewJS, typed `index` | yes | Obsidian when rendered |
| Unknown host | `%LOCALAPPDATA%\claude-capture\unknown-host.log` | the exporter | one line per unknown host | no | nothing |
| Task registration | `%LOCALAPPDATA%\claude-capture\register-task.log` | the register script | text | no | nothing |
Two things to read off the table. The activity log and the markers are the only per-session records, and the activity log lives outside the vault, where the other laptop and every review miss it. The health note shows a person that the launcher exited cleanly and nothing about what it exported.
## Logs the reading side expects
| Record | Where | Writer | State |
|---|---|---|---|
| Tool log (old) | `60_Claude/30_Reviews/AI/Toolkit/Tool log.md` | `/export-ai-session` | one row, 2026-08-19; the skill is not installed |
| Tool log (per machine) | `AI Conversations/Dell/Windows/Claude/Tool log.md` | nothing | 0 bytes, no frontmatter |
| Summary backlog | `60_Claude/07_AI_Information/AI Conversation - Summaries/Summaries-to-Create.md` | a person, per [[30_Order/Workflows/Ingestion/Conversations Loop|Conversations Loop]] | 0 bytes from 2026-07-30 until seeded on 2026-10-21 |
| Distilled-session ledger | `30_Order/System/claude-workflow/distilled-sessions.json` | the old skill | one entry, 2026-08-19; no script reads it |
| AI tools reviews | `60_Claude/30_Reviews/AI/Scheduled/Weekly/` | `/weekly-review` was meant to feed it | one file, W34 |
| Session log | `60_Claude/07_AI_Information/Session Logs/log.md` | agents at session end ([[30_Order/Standards/AI Loop/Memory Management|Memory Management]]) | 312,764 bytes, about three times the 100 KB rotation line in [[30_Order/Standards/Log Standard|Log Standard]]; no heading-form entries between 2026-10-02 and 2026-10-17 |
| Claude Kit log | `20_Progress/Projects/AI Use/Claude Kit/Log.md` | agents | 76,498 bytes, narrative |
## Logs of neighbors
- `30_Order/System/claude-workflow/logs/git-auto-sync.log`: 3.37 MB, one block per run, ignored by git. The commit subjects (`Auto-sync: 2026-10-21 19:03, 6 files changed`) are the readable trace that notes were committed.
- `logs/weekly-review.log`: four lines, runs on 2026-10-11 and 2026-10-18, both exit 0.
- `logs/internship-note-guard.jsonl`: 247 bytes.
- `30_Order/System/cursor-workflow/logs/`: empty.
- Claude Code's own sweep deletes, after 30 days by default, the transcripts, subagent files, tool results, file history, and `usage-data/` (the `/insights` reports). It keeps `history.jsonl` and `stats-cache.json`. No record in this table outlives a transcript except the exported note and the activity log.
- Hook outcomes inside transcripts: `stop_hook_summary` entries (29 on this Acer) record the hook command, count, and errors. They are in the raw transcripts only and no note carries them.
- `~/.claude/history.jsonl`: one line per typed prompt with the text, any pasted content, project, and session id. 432 lines on 2026-10-22, 104 with pasted content. The sweep does not touch it, so it is the only complete list of prompts that outlives a transcript, and it must not be copied into the vault. Build B3 uses it only to count prompts for the coverage line.
- `~/.claude/sessions/`: a live registry of running sessions (process id, session id, start time, status). It is deleted as sessions end and is not a record.
- `~/.claude/file-history/`: 761 files of pre-edit copies, swept at 30 days. Useful for the output check in the weekly review; not captured.
- What runs and what is written now, with sizes: [[20_Progress/Projects/AI Use/Conversations/Machine Audit 2026-10-22|Machine Audit 2026-10-22]].
## Rules on file that these records do not meet
[[30_Order/Standards/Log Standard|Log Standard]] says every log names its feeder, and that a silent log is investigated. [[30_Order/Standards/AI Loop/Logs|Logs]] defines three shapes (narrative, row, machine) and says a machine log carries no frontmatter. The activity log and the health state file are machine logs in all but name, and neither is described in either Standard. These Standards are scratchpads until the research lands, so this is a note of the gap, not a violation.
## Non-Goals
Not a design for new logs. The logs the 2026-10-09 tracking session proposed (a per-machine script-run log, a session ledger, a tool and hook utilization log) are not listed because none exists.
