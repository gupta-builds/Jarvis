---
type: review
status: sprout
created: 2026-10-17
updated: 2026-10-17
tags:
  - review
  - audit
  - ai
  - conversation-capture
review_kind: audit
notes:
  - "[[60_Claude/05_Clippings/AI Conversations/README]]"
  - "[[30_Order/Standards/AI Loop/Conversations]]"
  - "[[30_Order/Workflows/Ingestion/Conversations Loop]]"
  - "[[10_Areas/AI/Setup/Gaps]]"
  - "[[60_Claude/30_Reviews/AI/Scheduled/Weekly/AI Tools Weekly Review — 2026-W34]]"
  - "[[Review System]]"
  - "[[Capability Review Standard]]"
---
# Conversation Capture Layer Audit (2026-10-17)
## Summary
Audited the AI-conversation capture and distillation layer across both laptops (Dell, Acer) and both OS environments (Windows, WSL) looking for the "conversation-layer postmortem" remembered from a prior session. No such document exists. What exists instead is a scattered set of honest incident write-ups, plus one raw session transcript that had been mistaken for a finished postmortem. Verdict: the loop meant to turn captured sessions into reviewed, distilled knowledge has effectively never run. Capture itself works intermittently; everything downstream of capture (distillation, weekly review, cross-platform coverage) is stalled or was never built.
## Scope
Covers the raw-transcript capture pipeline (hooks, scheduled backfill, `.exported` markers) under `60_Claude/05_Clippings/AI Conversations/`; the distillation step into `60_Claude/07_AI_Information/AI Conversation - Summaries/`; the weekly/monthly review cadence meant to run on top of both (`60_Claude/30_Reviews/AI/`); and the newly written 30_Order Template/Standard/Workflow family for this note type. Excludes the laptop-rename and WSL-rebuild work from the earlier item-2549 plan, and the separate `second-brain-claudekit` repo's own pipeline (its `_docs/Gaps.md` is cross-referenced, not audited here, since that repo has its own write contract and is live-synced separately).
## Findings
### 1. No consolidated postmortem exists; the thing remembered as one is a raw transcript
`60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/Jarvis/10-17 Second-brain conversation layer postmortem.md` is the unprocessed capture of the prior session itself, not an authored report. No separate file titled or shaped as a postmortem of the capture layer exists anywhere in the vault. What does exist and is honest about current state: `20_Progress/AI/Claude Code/second-brain-claudekit/_docs/Gaps.md`, its `Gaps-Archive.md`, `conversation-capture.md`, and this vault's own `10_Areas/AI/Setup/Gaps.md` under "Conversation capture," last touched 2026-08-20.
### 2. Distillation has nearly stopped: 7 summaries against roughly 863 raw notes
`60_Claude/07_AI_Information/AI Conversation - Summaries/` holds 6 summaries plus 1 more under a `Claude Code/` subfolder, 7 total, against on the order of 863 raw session notes in the capture folder. `30_Order/Workflows/Ingestion/Conversations Loop.md`, written 2026-10-15, already admitted "only about 10 summaries exist for roughly 490 sessions" two days before this audit. The raw count has grown roughly 75% since that admission with no matching growth in summaries. The loop's own backlog file, `Summaries-to-Create.md`, is 0 bytes.
### 3. The weekly review this loop depends on has fired once and gone silent for ten weeks
`60_Claude/30_Reviews/AI/Scheduled/Weekly/` contains exactly one file, `AI Tools Weekly Review — 2026-W34.md` (August). `second-brain-claudekit/_docs/Gaps.md`'s own text states plainly that nothing runs this automatically and that `CronList` returns no scheduled jobs. Ten-plus weeks have passed since W34 with no further review.
### 4. Four of six target platforms have zero captured sessions, ever
Of the platforms named in the original item-2549 plan (Claude, Codex, Antigravity, Kiro, Cursor, local models), only Claude Code and Cursor have a real captured session on either machine. `Acer/WSL/{Codex,Kiro,AGY,Local}` and `Acer/Windows/{Codex,Kiro,AGY,Local}` exist as directories and are empty. These scaffold folders exist only on Acer; Dell, the machine the original plan designates as canonical, does not have them at all.
### 5. Two prior rewrite passes already failed and were archived in place, not fixed and removed
Fourteen `_archive-pre-fix` / `_archive-pre-fix-2` folders exist across both machines' Claude and Cursor conversation trees (Dell WSL Claude: CausalOps, ecc, everything-claude-code, gupta-builds, internship-research-loop, two under portfolio, second-brain-claudekit, tradingview; Dell Windows Claude/Cowork/Cursor; Dell WSL Cursor), dated to two separate attempts, 2026-07-30 and 2026-07-31. The "fix once, verify, remove" shape the item-2549 plan assumes has already failed to hold twice on this exact system.
### 6. The capture mechanism has silently failed at least three separate times, with no alarm
A `pwsh`/.NET assembly-load crash killed every `Stop`/`SessionEnd` hook for 11 days (2026-07-30 to 2026-08-19) while the dashboard kept showing green. A WSL hook pointed at a deleted folder and "returned silently from 2026-10-13" per `AI Conversations/README.md`'s own Build 5c note. The Dell hook pointed at the pre-rename folder layout, the failure that triggered the original item-2549 conversation. Three independent silent failures of the same mechanism, each caught by accident (a stray terminal error, a manual re-check), never by anything built to catch it.
### 7. The health dashboard proves the script ran, not that anything real was captured
`60_Claude/05_Clippings/AI Conversations/00 - Capture Health.md` logs `exit 0` from the backfill script. A script can log a clean exit while pointed at the wrong folder (finding 6's 2026-10-13 incident) or against zero new sessions. Nothing cross-checks a clean exit against a real new file landing. The dashboard's own scope, per `10_Areas/AI/Setup/Gaps.md`, is Windows/WSL Claude Code backfill only; it has never covered Cowork, Cursor, or any other platform.
### 8. A real 30_Order contract for this note type exists, but has not been run against the backlog
`30_Order/Standards/AI Loop/Conversations.md`, `30_Order/Workflows/Toolkit/Conversation Capture.md`, `30_Order/Workflows/Ingestion/Conversations Loop.md`, and `30_Order/Templates/AI Toolkit/AI Conversation.md` were all created 2026-10-15/16, two days before this audit. The Standard's own "Legacy Shapes" table lists seven known non-conforming patterns (BOM markers, wrong `status`, missing `created`/`updated`, among others) still present in the roughly 863 pre-existing notes. No migration pass against that backlog has run.
### 9. The originally planned fixes, even fully implemented, leave several failure modes undeclared
Redaction is specified as a one-time check at export with nothing gating a commit on it actually having succeeded before the vault's auto-sync pushes. A hook-triggered export and a scheduled backfill sweep have no declared winner if they race on the same session. A human edit to a captured note (against the vault's own "files dropped here are immutable" rule, which will still get violated) gets silently overwritten on the next backfill re-run, since re-export is specified to update the same note in place. A remote-SSH-driven session can split across two machines' folders for one logical conversation, flagged as "not yet live-verified" in the Two-Laptop SSH postmortem itself. There is no "N days of silence" tripwire anywhere in the system, the exact shape of all three incidents in finding 6.
## Priority Queue
1. Decide whether to build a real silence tripwire (a check that pages or logs when zero new sessions land for N days) before adding any more platforms. Answers finding 6 and 7, and is cheaper than anything else here.
2. Populate `Summaries-to-Create.md` and run one real pass of `Conversations Loop.md` end to end, to prove the loop works at all before trusting it to keep up. Answers finding 2 and 3.
3. Decide, with the user: do the empty Codex/Antigravity/Kiro/local-model scaffold folders get built for real, or removed until there is an actual capture plan for each. Leaving them as empty directories currently reads as coverage that does not exist. Answers finding 4.
4. Decide, with the user: keep the 14 `_archive-pre-fix*` folders as incident history, or delete them now that a real Standard exists to prevent a third pass. Answers finding 5.
5. Run the Legacy Shapes migration from the Conversations Standard against the pre-existing capture backlog. Answers finding 8.
6. Add an explicit redaction gate ahead of the auto-sync commit, and declare, in the Workflow doc, who wins a hook-vs-backfill race and what happens to a human edit on re-export. Answers finding 9.
## What Changed
This audit is itself new. `10_Areas/AI/Setup/Gaps.md`'s "Conversation capture" section gained a 2026-10-17 entry pointing here, since that section was the vault's existing, still-accurate-as-of-2026-08-20 record of this subsystem's state. Nothing else was changed; `second-brain-claudekit`'s own `_docs/Gaps.md` was read and cross-referenced but deliberately not edited, since it is governed by that repo's own write contract and live-synced separately.
## Open Questions
- [ ] Should the capture-health dashboard log a file hash or count per run, so a clean exit can't mask a silent failure, or is a simpler per-platform new-file check enough?
- [ ] Keep the empty Codex/Antigravity/Kiro/local-model folders as a visible to-do, or remove them until a real plan exists for each?
- [ ] Keep the 14 `_archive-pre-fix*` folders as incident history, or delete them now?
- [ ] Is a shared per-platform test harness (one redaction and dedup check run the same way against every platform) worth building before Codex/Antigravity/Kiro integration starts, given the Claude Code pipeline's own history of passing a one-time manual check and then failing silently later?
