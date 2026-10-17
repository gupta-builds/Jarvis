---
type: system
status: sprout
created: 2026-07-05
updated: 2026-10-17
tags:
  - system
  - tooling
  - cursor
system_kind: spec
trigger: Windows Task Scheduler job Jarvis-Cursor-Session-Export, every 15 minutes (daily 00:05 re-arm), run hidden through sweep-cursor-sessions-silent.vbs.
owner: Anant, who checks the sweep log and the Cursor folder in the AI Conversations archive.
notes:
  - "[[Conversations]]"
  - "[[Orchestration]]"
---
# Cursor Workflow
## Purpose
Exports Cursor agent sessions into the raw conversation archive described in [[Conversations]], so decisions made in Cursor survive the chat. If it stops, Cursor sessions are never captured and the archive silently falls behind.
## Trigger
Task Scheduler, not a Cursor `sessionEnd` hook. For `vscode-remote+wsl` workspaces Cursor loads user hooks from the WSL path (`~/.cursor/hooks.json`), not the Windows one, and a WSL-side hook cannot reliably open the Windows SQLite store while Cursor holds it. So the export is an eventually consistent sweep: `register-cursor-export-task.ps1` registers `Jarvis-Cursor-Session-Export` (daily 00:05, repeating every 15 minutes for 23h55). The task runs `sweep-cursor-sessions-silent.vbs` (a hidden launcher) which runs `sweep-cursor-sessions.ps1`, which runs `export-cursor-sessions.py --sweep` with `py` or `python`.
## Inputs and Outputs
Two stores joined on `composerId`, which equals the JSONL file name:
| Source | Holds |
|---|---|
| `~/.cursor/projects/**/agent-transcripts/<uuid>/<uuid>.jsonl` (in the WSL home or the Windows profile, wherever the workspace ran) | Role and `message.content[]` turns with `text` and `tool_use`. No timestamps, usage, or model |
| `%APPDATA%\Cursor\User\globalStorage\state.vscdb`, table of `composerHeaders` | `composerId`, timestamps, `isArchived`, `isSubagent`, and a value blob with `name`, `subtitle`, `isDraft`, `filesChangedCount`, line counts. No tokens or cost, so those frontmatter keys are omitted, never invented |
| `%APPDATA%\Cursor\User\workspaceStorage\<workspaceId>\workspace.json` | The workspace folder, used for routing when the value blob has no workspace URI |
Output goes to `60_Claude/05_Clippings/AI Conversations/WSL/Cursor/<project>/` or `.../Windows/Cursor/<project>/`, chosen from the workspace URI, plus a flat `_raw_jsonl/<session_id>.jsonl` copy. Commands and tool inputs pass through `redact_secrets.py` before they reach a note. Exporter modes: `--backfill` (every session present in both stores, idempotent), `--sweep` (rows newer than the saved watermark), `--composer-id <uuid>` (one session), and `--archive-old` (move flat pre-rewrite notes into `_archive-pre-fix/`, never delete). The older bubble-store scripts (`export-cursor-composer.py`, `list-cursor-composers.py`, `dump-composer-raw.py`, `cursor-db-run.py`, `append-exported-composer.py`) are legacy and not the live path. The `scripts/_*.ps1` files are one-off test and registration helpers.
Skip rule: no `composerHeaders` row, `isDraft`, `isArchived`, `isSubagent`, or no real assistant turn in the JSONL. Dedup: the flat `_raw_jsonl/<session_id>.jsonl`, or a `session_id:` already present in a project note.
> [!WARNING]
> The exporter's WSL branch and the Windows fallbacks hardcode the old machine's paths (`C:\Users\Anant Gupta\...`, `/mnt/d/Users/_Anant/10_Areas/...`). The Windows branch resolves the vault from the script location, so it is safe; running the script inside WSL is not.
## State
`cursor-export-state.json` holds the sweep watermark and `logs/sweep-YYYY-MM-DD.log` holds the run log. Both are ignored by git (`.gitignore` lines for `cursor-export-state.json` and `logs/*.log`). `exported-cursor-composers.json` is a tracked legacy index read only by `append-exported-composer.py` and `composer_index.py`.
## Failure Behavior
`sweep-cursor-sessions.ps1` logs a `FATAL:` line and exits 1 if the exporter or both `py` and `python` are missing, and otherwise exits with the exporter's own exit code after logging every output line. The VBS launcher does not wait (`waitOnReturn` false), so Task Scheduler's last result is not reliable here: read the log, not the task result.
## Verify
```powershell
Get-ScheduledTask -TaskName Jarvis-Cursor-Session-Export | Get-ScheduledTaskInfo
Get-Content 30_Order\System\cursor-workflow\logs\sweep-$(Get-Date -Format yyyy-MM-dd).log -Tail 5
py 30_Order\System\cursor-workflow\scripts\export-cursor-sessions.py --composer-id <uuid>
```
The log's last line reads `Exit code: 0`. Compare the count of `agent-transcripts` sessions with the notes under `AI Conversations/*/Cursor/`. On 2026-10-17 this machine had no registered task, no state file, and no sweep logs, so the sweep runs on another machine or not at all.
## Retire
Run `Unregister-ScheduledTask -TaskName Jarvis-Cursor-Session-Export`, then delete this folder's scripts in one commit that states the reason. The existing notes in the archive stay; they are raw records.
