---
type: project
status: active
created: 2026-11-18
updated: 2026-11-18
tags:
  - project
  - ai
  - conversations
  - dell
  - wsl
project_kind: record
task: wsl-claude-code-health-fix
model: claude-sonnet-5-5
---
# D0 - WSL Claude Code Health Fix
Run by Sonnet 5.5 in the Dell's WSL (`DESKTOP-3VBG0JH`, distro user `anant_gupta`), working directory `~/projects/hub/portfolio`, on 2026-11-18. This is a record of what was found and changed, not a prompt to paste. Scope was set by the owner: **WSL health only**. The Dell conversation loop (P14) is not started; the Dell gate in [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Build Plan|Conversation Loop Build Plan]] is still unfilled.
## What was wrong
| Symptom | Cause | Evidence |
|---|---|---|
| Every hook printed `Invalid package config .../portfolio/package.json` (SessionStart x3, UserPromptSubmit, PreToolUse, PostToolUse) | Line 1 of the portfolio repo's `package.json` read `Great {` instead of `{`. The plugin hooks (vercel, ecc, codex, gemini) run `node` in the project directory and all failed on it. Written 2026-11-18 21:53; the origin of the word is unknown | `JSON.parse` raised `Unexpected token 'G'`; `git diff` showed `-{` / `+Great {` |
| `SessionEnd hook ... failed: Hook cancelled` on exit | `wsl-session-export.ps1` took 1.95 s in a dry run. The `SessionEnd` default budget is about 1.5 s ([[20_Progress/Projects/AI Use/Conversations/Conversation Loop Sources|Conversation Loop Sources]], row 1) and the WSL entry set no `timeout` and no `async` | Dry run timed with `pwsh -DryRun`; the Acer's P3 build measured p95 1.9 s for the same export |
| No PDF protection in WSL | The vault's `jarvis-pdf-guard.ps1` is Windows PowerShell 5.1 with Windows paths and was never registered in the WSL `settings.json` | `grep pdf-guard ~/.claude/settings.json` returned 0 |
| Default 30-day transcript sweep | `cleanupPeriodDays` was unset on the Dell (the Acer reads 60) | `settings.json` had no such key |
| `mineru` missing, `firecrawl` only as a Windows shim | Neither was installed natively. `firecrawl` resolved to `/mnt/c/.../npm/firecrawl` (v1.19.21). `mineru` was missing in Windows and WSL alike | `command -v mineru` empty; `type -a firecrawl` |
| No `FIRECRAWL_API_KEY` anywhere | Not in WSL, and not in the Windows user environment | Names listed on both sides, values never printed |
| No standing rules for WSL | `~/.claude/rules/` did not exist | `ls` error |
## What changed
All in the WSL home; nothing under `30_Order/` and no git commit.
1. **`package.json` repaired.** Removed the stray `Great ` from line 1 of the portfolio repo. Other uncommitted edits (scripts, gsap, lenis, fast-check) were left alone. It parses and hooks run again.
2. **Hook timeouts and async** in `~/.claude/settings.json`, mirroring the Acer's P3 design:
   - `Stop` export: `async: true`, `timeout: 60`
   - `SessionEnd` export: `timeout: 30` (sync, a real budget instead of 1.5 s)
   - `PostToolUse` edit logger: `timeout: 10`; `Stop` wrap-up: `timeout: 30`
3. **`cleanupPeriodDays: 60`**, matching the Acer. First full test is 2026-11-27 on the Acer; the Dell's oldest transcripts predate this, so check them before that date.
4. **PDF guard.** New `~/.claude/hooks/jarvis-pdf-guard.py`, a Python port of the vault guard (same deny rules, same log schema `{timestamp,event:"pdf_guard",session_id,tool,rule}`, no paths logged, `JARVIS_ALLOW_PDF_READ=1` override, always exit 0). Registered as `PreToolUse` on `Read|Bash` with `timeout: 5`. Tested with 17 synthetic calls: 7 denies (Read .pdf, pdftotext, `cd && pdftoppm`, quoted full path, python pypdf, uv pdfplumber, mutool) and 10 allows (`.pdf.md`, mineru, `rg pdftotext`, grep after a pipe, `ls *.pdf`, `--pdf-output`, Write of a .pdf, garbage and empty stdin). All exit 0.
5. **mineru installed natively** with `uv tool install --python 3.12 "mineru>=4.0,<5"`: version 4.2.3 (the vault note says 4.0.10 on the Acer; both satisfy the pin). New wrapper `~/.local/bin/mineru-pdf`, a bash port of `mineru-pdf.ps1` (starts the server from `~/.mineru`, always passes `--pages`, exit codes 0/1/2/3/4). Model download (`--tier standard --vlm-engine llama-cpp`) was started in the background; see Open items.
6. **firecrawl installed natively** (`npm i -g firecrawl-cli`, v1.30.0 under nvm node 24). It now shadows the Windows shim.
7. **Global keys, extending the existing system instead of building a new one.** WSL already had `~/.mcp.env` (0600), `~/.config/mcp/launch.sh` wrappers and `mcp-sync set-secret`. I added one line to `launch.sh`: a `firecrawl()` wrapper, so the key reaches it process-locally like the AI CLIs. Verified in a fresh interactive shell (`firecrawl is a function`, prints 1.30.0, which also shows `~/.mcp.env` parses). I did not open or write `~/.mcp.env`.
8. **Rules** in `~/.claude/rules/` (auto-loaded each session): `wsl-paths.md`, `pdf-and-web.md`, `secrets-and-env.md`, `hooks-and-hygiene.md`.
9. **Clutter archived, nothing deleted:** four old `settings.json` backups and the `.pre-5c` hook copy moved to `~/.claude/backups/settings-history/` and `old-hooks/`; two one-off migration scripts (`_mcp_migrate_win_desktop.py`, `_wrap_desktop_servers.py`) to `old-scripts/`. `~/.claude` root is down to live files only.
## Decisions
- The guard is a separate WSL copy, not an edit of the vault's `.ps1`, because that file is synced to the Acer and tuned to PS 5.1.
- No new secret helper: `mcp-sync set-secret NAME` already exists. A duplicate was drafted, then dropped after finding it.
- The rules are auto-loaded from `~/.claude/rules/` rather than imported from `CLAUDE.md`, so nothing loads twice.
## Not changed (on purpose)
- The Dell's **Windows** `~/.claude/settings.json` still has only `PostToolUse` and `Stop` hooks, no SessionEnd export, no PDF guard, no retention setting. Out of scope for this WSL-only pass.
- Two cached `ecc` plugin versions (2.1.0 and 2.2.1) were left, because plugin caches are Claude Code's to manage.
- `~/.mcp.json` (a project-scope GitHub entry) and `~/.claude.json` were not touched.
## Open items
- **Firecrawl key.** `FIRECRAWL_API_KEY` does not exist yet. The owner runs `! mcp-sync set-secret FIRECRAWL_API_KEY` (hidden prompt, typed twice). Until then `firecrawl` installs and runs but cannot scrape.
- **mineru models.** The standard-tier download (about 800 kB/s) was still running when this note was written; the log is `~/.local/state/mineru/models-install.log`. Once it prints `MODELS_DONE`, test `mineru-pdf` on one small PDF.
- **Hook cancel not yet observed fixed.** The config is verified and the timing is understood, but the proof is a clean `/exit` in a new session with no `Hook cancelled` line. Check that first.
- **Unknown origin of the stray `Great`.** If `package.json` breaks again, look at what edited it at 21:53 on 2026-11-18.
- **Dell Windows hooks** and the Dell conversation loop wait for the gate (P12).
- **Sources and research.** The `Conversation Loop Sources` firecrawl research and the per-platform settings for Codex, Cursor and the others were not started.
## Rollback
Restore `~/.claude/backups/settings-history/settings.json.pre-dell-fix-20261118-222531` over `~/.claude/settings.json`; delete `~/.claude/hooks/jarvis-pdf-guard.py`, `~/.local/bin/mineru-pdf` and `~/.claude/rules/`; remove the `firecrawl()` line from `~/.config/mcp/launch.sh`; `npm rm -g firecrawl-cli`; `uv tool uninstall mineru`.
## Related Notes
- [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Build Plan|Conversation Loop Build Plan]]
- [[20_Progress/Projects/AI Use/Conversations/Platform Coverage|Platform Coverage]]
- [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Sources|Conversation Loop Sources]]
- [[40_Resources/CS/Concepts/New Laptop/Ubuntu - WSL|Ubuntu - WSL]]
- [[40_Resources/CS/Concepts/New Laptop/VS Code - MCP and Secrets|VS Code - MCP and Secrets]]
