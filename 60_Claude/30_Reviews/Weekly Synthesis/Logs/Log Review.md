---
type: evergreen
status: active
created: 2026-09-20
tags:
  - evergreen
  - system
  - log
notes:
  - "[[30_Order/Standards/Log Standard]]"
  - "[[Cross-Laptop Sync - Build Roadmap]]"
  - "[[.claude/skills/weekly-review/weekly-review]]"
---
# Log Review
==This log tracks what got trimmed from every other managed log in the vault and why — a real, ongoing, dateable stream of events per [[30_Order/Standards/Log Standard]], not an archive of the raw lines themselves.== Trigger: the `/weekly-review` skill's Log Review step, run by the `Jarvis-WeeklyReview` Scheduled Task, registered independently on each laptop, idempotent against duplicate weekly runs.
## Why This Log Exists Instead Of An Archive File Per Log
Build 5 (2026-09-19) rotated the Sync-Log files by moving old lines into a same-shaped `Sync-Log-Archive-<date>.md` file. That solved nothing structurally — the archive is still a file Obsidian has to index, and it grew right back to unmanageable size, which is exactly why this note exists a day later. The replacement rule, locked in 2026-09-20: when a managed log exceeds its line cap, the excess is **summarized in prose here, then deleted outright** — never moved to a second file. A summary answers "what happened," which is what anyone re-reading this later actually wants; a raw archive of `OK exit=0` lines never got reread once, by anyone, the whole time Build 5's archives existed.
## Managed Logs Registry
Every log this note's trigger reads and trims. Adding a new one requires checking it isn't already covered by an existing entry's real scope, per the Log Standard.
| Log | Path | Kind | Cap | Trim Rule |
|---|---|---|---|---|
| Per-project Sync-Log | `20_Progress/AI/Claude Code/<Project>/Sync-Log.md` (10 projects) | Mechanical, auto-generated every 15 min by `ClaudeKit-Sync-All` | 300 lines | Keep last 300, summarize+delete the rest |
| Combined Sync-Log | `20_Progress/AI/Claude Code/_All-Projects-Sync-Log.md` | Mechanical, same trigger | 500 lines | Keep last 500, summarize+delete the rest |
| ~~Sync-Log archives (Build 5)~~ | ~~`20_Progress/AI/Claude Code/*/Sync-Log-Archive-2026-09-19.md`~~ | **Cleanup complete 2026-09-20** — all 10 named archives summarized and deleted, see the entry below. Row kept struck through rather than removed, so a future session doesn't re-add this exclusion by accident. Two archives this row never actually covered still exist: `.claude_windows/Sync-Log-Archive-2026-09-19.md`, `.claude_wsl/Sync-Log-Archive-2026-09-19.md` — outside this cleanup's scope, not yet reviewed. | — | — |
| `git-auto-sync.log` | `30_Order/System/claude-workflow/logs/git-auto-sync.log` | Mechanical, `Jarvis-GitAutoSync`, per-machine (excluded from Syncthing 2026-09-20) | 300 lines | Keep last 300, summarize+delete the rest |
| Cursor sweep logs | `30_Order/System/cursor-workflow/logs/sweep-<date>.log` (one file per day) | Mechanical, daily cron-style sweep | Last 14 days | Older files: summarize+delete the file entirely, not trim within it |
| `Run Log.md` | `10_Areas/Career/Internships/List/Run Log.md` | Small dashboard-shaped log, not currently bloated (17 lines as of 2026-09-20) | 500 lines | Monitor only until it crosses the cap |
| `Main Log.md` | `10_Areas/Career/Internships/Tracker/Main Log.md` | Small index-shaped log (74 lines) | 500 lines | Monitor only |
| `Claude Kit/Log.md` | `20_Progress/Projects/AI Use/Claude Kit/Log.md` | **Curated, gold-standard per the Log Standard** (192 lines, dense hand-quality entries) | 3000 lines | Monitor only — do not trim without a human reviewing what's actually being cut; this is high-value content, not noise |
| Main Session Log | `60_Claude/07_AI_Information/Session Logs/log.md` | **Curated**, cited throughout the vault (1441 lines) | 3000 lines | Monitor only, same reasoning as Claude Kit/Log |
| `Tool log.md` (×2: Windows Claude Code, AI Tools review) | `60_Claude/05_Clippings/AI Conversations/Windows/Claude Code/Tool log.md`, `60_Claude/30_Reviews/AI/Tools/Tool log.md` | Small (0 and 33 lines) | 500 lines | Monitor only |
| `BOOM/Logs.md`, `System - Build Log.md`, `ATS Research Log.md` | see [[Cross-Laptop Sync - Build Roadmap]]'s sibling notes for exact paths | Moderate project logs (141-218 lines), not currently bloated | 1000 lines | Monitor only |
| `capture-health-windows.json`, `capture-health-wsl.json` | `30_Order/System/claude-workflow/logs/` | Current-state snapshots, not append logs | n/a | Never trimmed — not a log, just latest status |
## Summary Format, Per Entry
`## [YYYY-MM-DD] log-review | <log name>` — one entry per log actually trimmed that run (logs that only got monitored, not trimmed, don't get an entry; a quiet week is a valid, honest non-event, not padded with a null entry). Each entry states: how many lines/files existed before, how many after, the date range covered by what was removed, and a real aggregate account of what those entries were actually saying — success/failure/conflict counts and any genuine anomaly, not a restated line count.
## Entries
## [2026-10-04] log-review | Headless run — every over-cap log flagged, nothing deleted
Run by the `Jarvis-WeeklyReview` Scheduled Task, unattended, no human present — the invoking prompt explicitly asked for flag-only handling of every over-cap log this run, regardless of registry setting (headless exception, 2026-09-28). The `Jarvis-GitAutoSync` incident that blocked all trimming last run (W39) is resolved (clean `exit=0` as of 2026-10-04 02:03), so these logs are safe to touch content-wise, but nothing was deleted anyway per this run's explicit instruction.
- **10 per-project `Sync-Log.md` files**: 300-line cap, actual 505 (`The Plan`) to 788 (`Jarvis`) lines. Not trimmed.
- **`_All-Projects-Sync-Log.md`**: 500-line cap, actual 921 lines. Not trimmed.
- **`git-auto-sync.log`**: 300-line cap, actual 12,368 lines — has not been trimmed since before the W39 incident; now also carries that incident's own resolution evidence. Not trimmed.
- **Cursor sweep logs**: 14-day cap, 26 daily files currently exist (12 over). Not trimmed.
- **`.claude_windows/Sync-Log-Archive-2026-09-19.md`** (6,991 lines) and **`.claude_wsl/Sync-Log-Archive-2026-09-19.md`** (7,966 lines): the one-time 2026-09-20 cleanup's own registry entry already flagged these two as "outside this cleanup's scope, not yet reviewed." Per Step 7.5 point 4 they should be summarized and deleted outright, but the same headless carve-out was applied here by judgment, since deleting a whole archive file unattended carries the same risk the carve-out exists to prevent. Still exist, not yet summarized or deleted.
None of the above got a real aggregate-content summary this run (success/failure counts, date ranges, anomalies) — that work still needs to happen, in an interactive session, before any of it is trimmed. Full context: [[60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis — 2026-W40|Weekly Synthesis — 2026-W40]].
## [2026-09-25] log-review | Trim skipped vault-wide — live Jarvis-GitAutoSync incident
No logs trimmed this run. All 10 per-project `Sync-Log.md` files plus `_All-Projects-Sync-Log.md` are back over their 300/500-line caps (505-921 lines, five days after the 2026-09-20 cleanup — confirms re-bloat past cap within under a week at the current 15-minute cadence), and `git-auto-sync.log` remains at 17,617 lines against its 300-line cap. None were touched: `git-auto-sync.log` shows the `Jarvis-GitAutoSync` Scheduled Task has failed 355 consecutive pull-rebase attempts since 2026-09-20 14:33, still failing as of 2026-09-25 09:03, conflicting on exactly these Sync-Log/capture-health files every attempt. Editing them mid-incident risks adding a fresh local diff on top of an already-unresolved rebase conflict. Verified no corrupted files or leftover conflict markers in the working tree — the rebase aborts cleanly each run — but `infra/cross-laptop-sync` is now 149 commits ahead of `origin/master`, unpushed. Cursor sweep logs (20 daily files against the 14-day cap) deferred for the same reason. Resume normal trimming once the sync incident is resolved — see [[60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis — 2026-W39|Weekly Synthesis — 2026-W39]] for full detail and next steps.
## [2026-09-20] log-review | Cursor sweep logs
Deleted 39 files (`sweep-2026-07-30.log` through `sweep-2026-09-06.log`), 1.5MB total, keeping the 14 most recent (`sweep-2026-09-07.log` onward) untouched per the registry's 14-day rule. Computed directly, not estimated: **1,607 total sweep runs** logged across the 39 files (`export-cursor-sessions.py --sweep`, firing roughly every 15 minutes), of which 1,533 logged an exit code — 1,532 succeeded (`Exit code: 0`), one failed (`Exit code: 1`, 2026-08-24T15:59:23, no traceback or error line anywhere near it in the file, cause unrecoverable from the log alone). The remaining 74 runs never logged an exit code at all — most likely interrupted mid-run (machine sleep or shutdown catching the sweep between its start line and its summary block), not investigated further since none showed a partial-write or error state on either side of the gap. Of the 1,607 runs, only **14 actually produced a new export** (`WROTE` a clipping into `AI Conversations`), spanning `06-09 About carousel animation.md` through `09-05 Vault documentation and research.md` — the overwhelming majority of runs found zero new Cursor sessions and did nothing, which is the expected steady state for a 15-minute poll against normal usage, not a sign the sweep is broken.
## [2026-09-20] log-review | One-time cleanup of all 10 Build-5 Sync-Log archives
Computed real aggregate statistics against each archive's full content (grep-based counts, not a full read — each file was 4,700-16,500 lines of near-identical mechanical entries) before deleting. Every one of the 9 per-project archives covers the same span, 2026-08-10 through 2026-09-12 (`second-brain-claudekit` starts earlier, 2026-07-30 — it's the project the whole Unison system was originally bootstrapped and debugged against). Success rate across all 9 per-project archives: 99.7-100% `OK exit=0`. Genuine anomalies, all already root-caused and documented elsewhere, not new findings:
- **One `TRANSFER ERRORS` (`exit=2`) in `second-brain-claudekit`, 2026-07-30 12:41:14** — the original "No archive files were found" first-run error that led to adding Unison's `-fat` flag, per [[Sync - Unison]]'s own history.
- **A synchronized burst of one `CONFLICTS (skipped, see below)` in 6 of the 9 per-project archives**, all within a 36-minute window on 2026-08-10 (14:14-14:50) — a one-time initial-bootstrap conflict wave across CausalOps, Portfolio, Trading View, Resq, OpsPilot, and The Plan, each resolved the same run and never recurring. Confirmed via the combined archive (below): exactly 6 `CONFLICTS` lines total, same timestamps, same projects.
- **A handful of `SKIPPED (another sync already running)` lock-contention lines per project (1-6 each)** — expected behavior when two scheduled runs overlap, not a failure.
Per-file breakdown (runs = summary lines ending `exit=N`; detail lines = the richer per-path `<subfolder>/ OK <src> -> <dest>` lines added later in each file's history):
| Project | Runs | OK | Conflicts | Transfer errors | Lock-skips | Detail lines |
|---|---:|---:|---:|---:|---:|---:|
| CausalOps | 1594 | 1593 | 1 | 0 | 2 | 7742 |
| internship-research-loop | 592 | 592 | 0 | 0 | 0 | 4111 |
| Jarvis | 1592 | 1592 | 0 | 0 | 5 | 9535 |
| OpsPilot | 1588 | 1587 | 1 | 0 | 2 | 7121 |
| Portfolio | 1589 | 1588 | 1 | 0 | 2 | 6464 |
| Resq | 1588 | 1587 | 1 | 0 | 2 | 5807 |
| second-brain-claudekit | 1864 | 1862 | 1 | 1 | 6 | 9074 |
| The Plan | 1586 | 1585 | 1 | 0 | 2 | 5186 |
| Trading View | 1590 | 1589 | 1 | 0 | 1 | 7741 |
The combined archive (`_All-Projects-Sync-Log`'s, 16,460 lines, same 2026-08-10 to 2026-09-12 range, one line per project per run) independently confirms the same conflict count: exactly 6 `CONFLICTS` lines total, 16,454 `OK`, zero other failure types — cross-checks cleanly against the 9 per-project files above rather than just trusting them individually.
All 10 archive files deleted after this entry was written — fully superseded, per this note's own design. Files removed: `CausalOps/`, `internship-research-loop/`, `Jarvis/`, `OpsPilot/`, `Portfolio/`, `Resq/`, `second-brain-claudekit/`, `The Plan/`, `Trading View/`'s `Sync-Log-Archive-2026-09-19.md`, plus the combined `20_Progress/AI/Claude Code/Sync-Log-Archive-2026-09-19.md`.
## [2026-09-20] log-review | git-auto-sync.log trimmed to last 300 lines
Before trim: 2126 lines, covering 2026-09-19 23:46 (first real commit-and-push run, Build 7) through 2026-09-20 13:59. All entries in the removed portion (1826 lines) were clean `OK exit=0` single-line runs from the 15-minute `Jarvis-GitAutoSync` cadence on this machine — no failures, no retries logged in the trimmed range. The one genuinely interesting event in this window (a real engineered push-race recovery, and the first-ever run bootstrapping git on this machine) predates this log's own creation and is already fully documented in [[Cross-Laptop Sync - Build 7 Findings]], not lost by this trim. After trim: 300 lines, covering roughly the last 3.5 hours (2026-09-20 10:33 onward).
## [2026-09-20] log-review | 10 active per-project Sync-Log.md files trimmed to their 300-line cap
Same source (`ClaudeKit-Sync-All`, 15-min cadence, now driven from both the Dell and the Acer since Build 6) across all 10, each trimmed independently, real per-file counts on the removed portion (run-summary lines only, `exit=N`, not the richer per-path detail lines that outnumber them):
| Project | Before | After | Removed-range start | Removed-range end | Runs in removed range | Non-OK |
|---|---:|---:|---|---|---:|---|
| CausalOps | 3417 | 300 | 2026-08-10 14:13:53 | 2026-09-20 03:49:34 | 446 | 0 |
| internship-research-loop | 3898 | 300 | 2026-09-05 11:03:13 | 2026-09-20 05:04:35 | 451 | 0 |
| Jarvis | 4872 | 300 | 2026-08-10 14:15:51 | 2026-09-20 06:49:34 | 458 | 0 |
| OpsPilot | 3417 | 300 | 2026-08-10 14:43:56 | 2026-09-20 03:49:34 | 446 | 0 |
| Portfolio | 2930 | 300 | 2026-08-10 14:38:21 | 2026-09-20 01:49:34 | 438 | 0 |
| Resq | 2930 | 300 | 2026-08-10 14:41:39 | 2026-09-20 01:49:34 | 438 | 0 |
| second-brain-claudekit | 3950 | 300 | 2026-07-30 12:41:14 | 2026-09-20 05:04:35 | 451 | 1 |
| The Plan | 2443 | 300 | 2026-08-10 14:49:58 | 2026-09-19 23:19:34 | 428 | 0 |
| Trading View | 3417 | 300 | 2026-08-10 14:39:54 | 2026-09-20 03:49:34 | 446 | 0 |
| .claude_windows | 4385 | 300 | 2026-08-10 14:11:30 | 2026-09-20 06:04:34 | 455 | 0 |
Total removed: 33,588 lines across the 10 files. `second-brain-claudekit`'s one non-OK entry is the same 2026-07-30 12:41:14 `TRANSFER ERRORS exit=2` already documented in the archive-cleanup entry above (this file's un-rotated tail still carried that original line since it predates Build 5's rotation cutoff) — not a new failure, the same historical bootstrap error surfacing a second time because it hadn't aged out of this particular file yet. `internship-research-loop`'s removed range starts later than the others (2026-09-05, not 2026-08-10) because Build 5's prior rotation had already trimmed it closer to the cap than the rest. Every other run in every file: clean `OK`, either the plain `exit=0` summary form or the newer per-path `<subfolder>/ OK <src> -> <dest>` form added partway through each file's history — no conflicts, no lock-skips, no transfer errors anywhere in these 10 files' removed portions.
## [2026-09-20] log-review | _All-Projects-Sync-Log.md trimmed to 500 log lines (14-line frontmatter/header preserved)
Before trim: 5340 total lines (14 header + 5326 log lines). Removed: 4826 log lines, spanning roughly 2026-08-10 14:11 through 2026-09-20 03:04 — the combined one-line-per-project-per-run view of the same 10 projects covered individually above. All entries in the removed range read `OK` in this file's compact per-project format; no `CONFLICTS`, `TRANSFER ERRORS`, or `SKIPPED` lines found in the removed portion (the historical 2026-08-10 conflict burst documented in the archive-cleanup entry above was already outside this file's live tail by the time of this trim, having been captured in the now-deleted combined archive instead). After trim: 514 lines (14 header + 500 log lines, most recent runs preserved, roughly 2026-09-20 08:19 onward).
## Sources
- [[30_Order/Standards/Log Standard]] — heading format, append-only rule, trigger-naming requirement
- [[Cross-Laptop Sync - Build 5 Findings]] — the prior archive-based rotation approach this note's design deliberately replaces
- [[Sync - Unison]] — `-fat` flag history, referenced for the one 2026-07-30 transfer-error anomaly above
