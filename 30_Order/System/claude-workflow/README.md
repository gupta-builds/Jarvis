---
type: system
status: sprout
created: 2026-05-26
updated: 2026-10-17
tags:
  - system
  - tooling
  - claude-code
system_kind: spec
trigger: Claude Code hook events (SessionStart, Stop, SessionEnd, PreToolUse, PostToolUse), plus Task Scheduler jobs for git sync (every 30 minutes) and the weekly review (Sundays 06:00).
owner: Anant. The sync banner on 00_Dashboard shows a failed git-auto-sync run.
notes:
  - "[[Cowork-Operating-System]]"
  - "[[Conversations]]"
  - "[[Orchestration]]"
---
# Claude Workflow
## Purpose
Local automation around Claude Code in the Jarvis vault: three hooks, the transcript exporter, and the scheduled jobs that commit the vault and run the weekly review. If it stops, sessions are not captured, writes are not guarded, and the git history and GitHub backup stop growing. The standing contract: Claude Code is the implementation surface, Claude Desktop is read-first planning, mobile is capture only, and MCP retrieves small context packs, not the whole vault.
## Trigger
| Part | Fires on | Registered in |
|---|---|---|
| `hooks/jarvis-write-guard.ps1` | PreToolUse for Write, Edit, MultiEdit | project `.claude/settings.json` |
| `hooks/jarvis-internship-note-guard.ps1` | PostToolUse for the same tools | project `.claude/settings.json` |
| `hooks/jarvis-session-continuity.ps1` | SessionStart inside the vault (prints the context pack), Stop (after every turn) and SessionEnd (both export the transcript; SessionEnd also sweeps Cowork sessions) | user-level Claude Code settings. It is not in the project file and I did not find it in the Windows user settings, so check `/hooks` in a session |
| `Jarvis-GitAutoSync` | Daily 00:03, repeating every 30 minutes for 23h55, through `scripts/git-auto-sync-silent.vbs` | `scripts/register-git-auto-sync-task.ps1` |
| `Jarvis-WeeklyReview` | Sundays 06:00, through `scripts/weekly-review-silent.vbs` and `scripts/run-weekly-review.ps1` (a headless `/weekly-review` run) | `scripts/register-weekly-review-task.ps1` |
| Conversation backfill (Windows and WSL) | `scripts/backfill-windows-silent.vbs` and `backfill-wsl-silent.vbs` run `-BackfillAll` as a safety net for hooks that missed a session | no registration script in this folder |
`scripts/register-jarvis-sync-task.ps1` registers `SecondBrainClaudekit-JarvisSync` (every 15 minutes), a Unison sync of the second-brain-claudekit `.claude` layer into the vault.
## Inputs and Outputs
Reads hook JSON on stdin, Claude Code and Cowork transcripts, and the git repo. Writes exported sessions to `60_Claude/05_Clippings/AI Conversations/Windows/<project>/` (format in [[Conversations]]), a capture-health note `60_Claude/05_Clippings/AI Conversations/00 - Capture Health.md` after each backfill run, `logs/` in this folder, and git commits. The write guard denies new root files and writes into `50_Archive/`, `60_Claude/05_Clippings/`, `.obsidian/`, `.cursor/`, `.kiro/`, and `.git/`, with an allowlist for the daily-operations paths. The internship guard checks required frontmatter fields on internship notes and reports a gap as context; it never blocks. `claude_desktop_config.read-first.example.json` is a reference config for Claude Desktop, not a secret store. `.mcp.json` at the vault root registers the `jarvis` server only.
## State
Ignored by git: `logs/git-auto-sync.log`, `logs/internship-note-guard.jsonl`, `logs/weekly-review.log`, `logs/capture-health-*.json`, `scripts/.git-auto-sync.lock`, `scripts/.weekly-review.lock`. Outside the vault: `%USERPROFILE%\.claude\jarvis-session-activity.jsonl`. Tracked leftovers that no script reads: `distilled-sessions.json`, `_retired-2026-07-31/` (two session-index JSON files), and `excalidraw.log` (the Excalidraw server writes its log elsewhere now).
## Failure Behavior
Both guards and the continuity hook fail open: a parse problem exits 0, and an export error never blocks Claude Code from exiting. `git-auto-sync.ps1` exits 1 on a real problem (a pull-rebase conflict, a push that fails twice, a stale lock) and writes a final `=== git-auto-sync end (FAILED, ...) ===` line; it aborts a failed rebase instead of leaving the repo mid-rebase, and treats a lock older than 30 minutes as stale. The weekly review skips when its lock is under 120 minutes old. Each VBS launcher waits and returns the real exit code, so Task Scheduler's last result is honest. A failed sync is surfaced by the banner described in the sync-workflow record.
## Verify
```powershell
Get-ScheduledTask -TaskName Jarvis-GitAutoSync, Jarvis-WeeklyReview | Get-ScheduledTaskInfo
Get-Content 30_Order\System\claude-workflow\logs\git-auto-sync.log -Tail 5
```
The last result is 0 and the last line reads `=== git-auto-sync end (success) ===`, `(nothing to do)`, or `(deferred, ...)`; any `(FAILED, ...)` needs a human. Compare the number of Claude Code sessions in `~/.claude/projects` with the notes in the Windows export folder. In a Claude Code session, `/hooks` should list all three hooks.
## Retire
Unregister the tasks (`Unregister-ScheduledTask -TaskName Jarvis-GitAutoSync` and the others), remove the hook entries from the settings files, then delete this folder's scripts and hooks in one commit that states the reason. Git is the archive.
