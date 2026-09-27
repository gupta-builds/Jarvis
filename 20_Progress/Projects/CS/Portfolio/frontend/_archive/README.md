---
type: index
status: sprout
created: 2026-09-27
tags:
  - portfolio
  - frontend
  - archive
---

# Frontend Archive — Superseded Generations

Three generations of "UI fixes" planning got layered on top of each other over 2026-06 through 2026-07 before the current tracking surface existed. Archived here on 2026-09-27 so the active `frontend/` folder only holds what's still live. Nothing here is deleted — all content was checked against the current specs first; anything not already captured there is noted below.

## What's in each folder

- **`frontend-overhaul-plan-2026-06/`** — the original 17-note "Frontend Overhaul — Build Plan" (`Ran/00`–`16`). First design pass for every section. Superseded twice over: once by the R-phase execution kit that implemented it, then again by the July/September UI-fixes line. Historical record only.
- **`r-phase-execution-kit-2026-06/`** — the Claude Code tooling (subagents, commands, hooks, CSP prompt, per-phase build prompts) that executed the plan above. Per its own build-status note, this pass shipped. Kept as a record of *how* that build was run, not as an open backlog.
- **`ui-fixes-prompt-passes-2026-07/`** — three planning passes (`analysis`, `audit-pass`, `pass-3`) that iteratively built the requirements/design/tasks trio, plus the July implementation prompts. The three passes already self-label as superseded in their own headers. The implementation-prompts file describes the July-era spec (4-card telemetry, capped auto-play, etc.) that the trio's September revision explicitly replaced.
- **`BUILD-STATUS.md`** — status tracker for the R-phase execution kit (2026-06-12, corrected 2026-06-13). Its own phase table was already flagged stale by its own correction banner; it's now further superseded by the entire July/September UI-fixes line. Kept for reference, not tracking.

## Current source of truth (not archived)

For what's actually built vs. open on the frontend, use:
1. [[ui-fixes-index]] — navigation hub
2. [[ui-fixes-requirements]], [[ui-fixes-design]], [[ui-fixes-tasks]] — the trio, each carries its own correction history
3. `ui-fix-01-hero-background.md` through `ui-fix-08-carry-forward.md` — per-component specs, re-verified against the live repo on 2026-09-05 with exact file/line citations. This is the most reliable layer in the folder — several items `_UI Fixes.md`'s walkthrough table still calls "open" are confirmed built here (see the correction banner in [[_UI Fixes]]).
