---
type: system
status: sprout
created: 2026-05-26
updated: 2026-11-04
tags:
  - system
  - tooling
  - claude-code
system_kind: spec
trigger: Claude Code hook events (Stop, SessionEnd, PreToolUse, PostToolUse), plus Task Scheduler jobs for git sync (every 30 minutes), the conversation backfill (every 30 minutes) and the weekly review (Sundays).
owner: Anant. The sync banner on 00_Dashboard shows a failed git-auto-sync run.
notes:
  - "[[Cowork-Operating-System]]"
  - "[[Conversations]]"
  - "[[Orchestration]]"
---
# Claude Workflow
## Purpose
Local automation around Claude Code in the Jarvis vault: four hook scripts, the transcript exporter, and the scheduled jobs that commit the vault, back-fill missed sessions and run the weekly review. If it stops, sessions are not captured, writes are not guarded, PDFs can flood the context, and the git history and GitHub backup stop growing. The standing contract: Claude Code is the implementation surface, Claude Desktop is read-first planning, mobile is capture only, and MCP retrieves small context packs, not the whole vault.
## Trigger
| Part | Fires on | Registered in |
|---|---|---|
| `hooks/jarvis-write-guard.ps1` | PreToolUse for Write, Edit, MultiEdit | project `.claude/settings.json` |
| `hooks/jarvis-internship-note-guard.ps1` | PostToolUse for the same tools | project `.claude/settings.json` |
| `hooks/jarvis-pdf-guard.ps1` | PreToolUse for Read, Bash and PowerShell; denies a PDF read or a PDF tool that is not MinerU and prints the `scripts/mineru-pdf.ps1` command to run instead | user-level `~/.claude/settings.json`, three entries, each with an absolute path to the script |
| `hooks/jarvis-session-continuity.ps1` | Stop (after every turn) and SessionEnd: both export the transcript, and SessionEnd also sweeps Cowork sessions. The script also has a SessionStart branch that prints a context-pack reminder, but nothing registers SessionStart | user-level `~/.claude/settings.json`, Stop and SessionEnd only, with an absolute path to the script. Neither the project `.claude/settings.json` nor `settings.local.json` registers it, and no file registers SessionStart, so the context pack is never printed (checked 2026-11-04) |
| `Jarvis-GitAutoSync` | Every 30 minutes, at :03 and :33 (a daily trigger repeating for 23h55), through `scripts/git-auto-sync-silent.vbs` | `scripts/register-git-auto-sync-task.ps1` |
| `Jarvis-WeeklyReview` | Sundays, through `scripts/weekly-review-silent.vbs` and `scripts/run-weekly-review.ps1` (a headless `/weekly-review` run). Registered for 06:00; on 2026-11-04 Task Scheduler listed the next run as 2026-11-08 05:00, The stored start time is `05:00` with a `-06:00` offset, which fits a one-hour shift at the 2026-11-01 clock change; I did not test the cause | `scripts/register-weekly-review-task.ps1` |
| `ConversationCapture-Backfill-Windows` | Every 30 minutes, through `scripts/backfill-windows-silent.vbs`: `-BackfillAll` as a safety net for hooks that missed a session, then `update-capture-health.ps1` | `scripts/register-capture-backfill-windows-task.ps1`. Its WSL twin `scripts/backfill-wsl-silent.vbs` has no registration script here, and I did not check whether it is registered |
`scripts/register-jarvis-sync-task.ps1` would register `SecondBrainClaudekit-JarvisSync` (every 15 minutes), a Unison sync of the second-brain-claudekit `.claude` layer into the vault. No task of that name exists on this machine (checked 2026-11-04).
## Inputs and Outputs
Reads hook JSON on stdin, Claude Code and Cowork transcripts, and the git repo. Writes exported sessions to `60_Claude/05_Clippings/AI Conversations/<Machine>/Windows/Claude/<project>/` (format in [[Conversations]]), where `<Machine>` comes from the host name inside `export-claude-session.ps1` (two names are mapped, and an unknown host writes nothing), a capture-health note `60_Claude/05_Clippings/AI Conversations/00 - Capture Health.md` after each backfill run, `logs/` in this folder, a machine-local hook activity log at `%USERPROFILE%\.claude\jarvis-session-activity.jsonl`, and git commits. The session log is not written here. No hook or script in this folder appends to `60_Claude/07_AI_Information/Session Logs/log.md`: the write guard only allows writes to it, and the hooks' own record of a session is the activity log above. The one writer of the session log is the agent or skill that ran the session, which appends one entry at its end (see [[Memory Management]]); the weekly review does so through its own Step 8 when the scheduled task runs it. The write guard denies new root files and writes into `50_Archive/`, `60_Claude/05_Clippings/`, `.obsidian/`, `.cursor/`, `.kiro/`, and `.git/`, with an allowlist for the daily-operations paths. The internship guard checks required frontmatter fields on internship notes and reports a gap as context; it never blocks. `claude_desktop_config.read-first.example.json` is a reference config for Claude Desktop, not a secret store. `.mcp.json` at the vault root registers the `jarvis` server only.
Paths: the write guard, the internship guard, the continuity hook (the PDF guard instead finds `scripts\mineru-pdf.ps1` as a sibling folder), `git-auto-sync.ps1`, the two exporters, `update-capture-health.ps1` and `run-weekly-review.ps1` find the vault by going four folders up from themselves (`$PSScriptRoot\..\..\..\..`), so this folder must stay at `30_Order/System/claude-workflow/`. Machine-specific lines that remain: `scripts/register-jarvis-sync-task.ps1:12` and `scripts/sync-jarvis-silent.vbs:9` (one WSL user's home), `scripts/reroute-acer-notes.ps1:29` (a default archive folder on drive D), the host-name map at `scripts/export-claude-session.ps1:35-36` and `scripts/wsl-session-export.ps1:24-25`, an error message that names one user's `.mineru` folder at `scripts/mineru-pdf.ps1:101`, and `scripts/run-weekly-review.ps1:37`, which expects `claude.exe` in `%USERPROFILE%\.local\bin`. Outside this folder, the user-level `~/.claude/settings.json` hook commands and all five scheduled-task actions hold an absolute path to the vault on this machine, so a laptop with a different drive layout has to re-register them.
## State
Ignored by git, each by a line in the root `.gitignore`: `logs/git-auto-sync.log` (3.8 MB on 2026-11-04, line 102), `logs/internship-note-guard.jsonl` (119), `logs/weekly-review.log` (127), `logs/capture-health-*.json` (149), `scripts/.git-auto-sync.lock` (103) and `scripts/.weekly-review.lock` (134). Outside the vault: `%USERPROFILE%\.claude\jarvis-session-activity.jsonl`. Tracked leftovers that no script reads, checked by searching every script in this folder on 2026-11-04: `distilled-sessions.json`, `_retired-2026-07-31/` (two session-index JSON files, 30 KB), and `excalidraw.log` (the Excalidraw server writes its log elsewhere now; the ignored copy is in `excalidraw-mcp/`). The only mention is a comment in `jarvis-session-continuity.ps1` saying the index file is gone. The [[System Component Standard]] says no tracked file here is runtime state and that a `_retired-<date>` folder is deleted after a yes, so all three wait for the owner's yes.
## Failure Behavior
The write guard, the PDF guard and the continuity hook fail open: a parse problem exits 0, and an export error never blocks Claude Code from exiting. The internship guard reports a gap as context and never blocks. `git-auto-sync.ps1` exits 1 on a real problem (a pull-rebase conflict, a push that fails twice, a stale lock) and writes a final `=== git-auto-sync end (FAILED, ...) ===` line; it aborts a failed rebase instead of leaving the repo mid-rebase, and treats a lock older than 30 minutes as stale. The weekly review skips when its lock is under 120 minutes old. Each VBS launcher waits and returns the real exit code, so Task Scheduler's last result is honest. A failed sync is surfaced by the banner described in the sync-workflow record.
## Verify
```powershell
Get-ScheduledTask -TaskName Jarvis-GitAutoSync, Jarvis-WeeklyReview | Get-ScheduledTaskInfo
Get-Content 30_Order\System\claude-workflow\logs\git-auto-sync.log -Tail 5
```
The last result is 0 and the last line reads `=== git-auto-sync end (success) ===`, `(nothing to do)`, or `(deferred, ...)`; any `(FAILED, ...)` needs a human. On 2026-11-04 at 00:33 the last result was 1 and the log showed a commit followed by `=== git-auto-sync end (FAILED, local changes could not be committed) ===`, so the check at `git-auto-sync.ps1` line 399 to 405 found changes still unstaged or uncommitted after the commit. I did not find the cause, and the sync-workflow banner reported the failure. Compare the number of Claude Code sessions in `~/.claude/projects` with the notes in the Windows export folder. In a Claude Code session, `/hooks` should list the write guard, the internship guard, the PDF guard (three entries) and the continuity hook (Stop and SessionEnd).
## Retire
Unregister the tasks (`Unregister-ScheduledTask -TaskName Jarvis-GitAutoSync` and the others), remove the hook entries from the settings files, then delete this folder's scripts and hooks in one commit that states the reason. Git is the archive.
