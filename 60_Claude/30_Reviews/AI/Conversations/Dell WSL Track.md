---
type: review
status: sprout
created: 2026-10-21
updated: 2026-10-21
tags:
  - review
  - audit
  - ai-tools
  - conversations
review_kind: audit
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Capture Registration|Capture Registration]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Capture Scripts|Capture Scripts]]"
  - "[[60_Claude/30_Reviews/AI/Conversations/Acer Windows Track|Acer Windows Track]]"
  - "[[60_Claude/30_Reviews/AI/Conversations/Dell Windows Track|Dell Windows Track]]"
  - "[[Old Laptop Rebuild - Build 5c Acer Workspace and Capture Findings]]"
---
# Dell WSL Track
## Summary
Read from the Acer through synced notes only; the Dell was not reached. The track holds 142 Claude Code notes from 2026-06-30 to 2026-10-18 and 62 Cursor notes that end on 2026-09-05. It is the heaviest track per project (internship loop alone is 46 notes and $1,258) and the one whose capture broke most quietly: the hook pointed at a missing folder from 2026-10-13 until Build 5c repaired it on 2026-10-17.
## Scope
`Dell/WSL/Claude/` and `Dell/WSL/Cursor/` as copied to the Acer, measured 2026-10-21. Facts about the Dell's WSL settings and timer come from Build 5c's session, which read the Dell over Tailscale SSH on 2026-10-17 and has not been repeated.

| Item | Value |
|---|---|
| Claude notes | 142 |
| Projects | internship-research-loop 46, second-brain-claudekit 30, portfolio 18, CausalOps 17, tradingview 9, anant_gupta 9, gupta-builds 7, projects 3, and one each for ai-job-search, gbrain, scripts |
| Date range | 2026-06-30 to 2026-10-18 |
| Tokens and cost | about 6.52 billion tokens and $2,864 as written in the notes; both are inflated roughly 2 to 3 times by duplicate counting (see [[20_Progress/Projects/AI Use/Conversations/Export Conformance\|Export Conformance]]) and undercounted for unpriced newer models |
| September and October | 43 notes ($601) and 15 notes ($0, every October note's model is unpriced) |
| Cursor notes | 62 across 9 project folders, 2026-03-07 to 2026-09-05 |
| Archive folders | 11 `_archive-pre-fix*` folders holding 52 notes |
| Empty folders | `capture-test`, `ecc`, `everything-claude-code` |
## Findings
### 1. The hook was silent for four days before anyone saw it
Build 5c recorded that the Dell's hook pointed at a folder that no longer existed, so every export returned silently; the newest Dell WSL note was 2026-10-13. Eight sessions from 10-11 to 10-17 were written by the repair. Nothing alerted.
### 2. October cost shows $0 for 15 notes
All 15 October notes in this track ran on `claude-sonnet-5-5` (8) or `claude-haiku-5-5` (7), and all carry `cost_usd: null`. Neither model is in the price table, which the Windows exporter says it reused from the WSL one.
### 3. Six sessions appear under two project folders
Six `session_id` values are filed under two project folders inside `Dell/WSL/Claude`. Cause unconfirmed; a changed working directory is the guess.
### 4. WSL exporter differs from the Windows one in dedup
It dedups on the existence of `_raw_jsonl/<session_id>.jsonl`, a real one-way copy, so WSL does not lose its raw files when Claude Code cleans up transcripts. Windows uses a junction. Which behavior is better is a research question.
### 5. Cursor notes in this track end in September, and all 12 of its Cursor indexes point at old paths
The Cursor sweep runs from Windows on the Dell and routes WSL workspaces here. It has not written since 2026-10-08.
### 6. The WSL side cannot be checked from the Acer
A Dell hook, timer, or settings change leaves no trace on the Acer other than missing or late notes.
## Priority Queue
1. Run the Track Conversations checks on the Dell's WSL when reachable. Answers findings 1 and 6.
2. Add the three missing models to the price table in whichever form the research chooses. Answers finding 2.
3. Decide whether the WSL raw-copy behavior becomes the rule for Windows. Answers finding 4. Research step 6.
## Open Questions
- [ ] Is the `claude-capture-backfill` timer on the Dell still firing every 30 minutes?
- [ ] Is the Dell's WSL hook entry still the vault script?
