---
type: project
status: active
created: 2026-10-21
updated: 2026-10-22
tags:
  - project
  - ai
  - conversations
project_kind: project
next: Write the pre-implementation postmortem of Conversation Loop Design, then hand Conversation Loop Build Plan to its own session.
related_progress:
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Research Plan|Conversation Loop Research Plan]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Build Plan|Conversation Loop Build Plan]]"
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Layer Postmortem|Conversation Layer Postmortem]]"
  - "[[10_Areas/AI/Setup/Conversation Map|Conversation Map]]"
  - "[[60_Claude/30_Reviews/Conversation Capture Layer Audit (2026-10-17)|Conversation Capture Layer Audit]]"
  - "[[60_Claude/05_Clippings/AI Conversations/README|AI Conversations README]]"
---
# Conversation Layer
## Goal
==Every Claude Code session on every machine becomes one redacted note with its tool calls, files, and cost, a log proves each capture ran, and a recurring review turns the pile of notes into decisions that change how the next session runs.==
## Current State
*As of 2026-10-22, measured on the Acer (`gupta-builds`) unless a line says otherwise.*
Capture works and nothing after capture does. The Windows hook and a 30-minute backfill task turn Claude Code transcripts into notes under `60_Claude/05_Clippings/AI Conversations/`: 630 notes holding 523 distinct sessions across both laptops, with token counts, tool counts, files touched, and an API-equivalent cost on most (the token and cost totals are inflated roughly 2 to 3 times by duplicate counting, per [[20_Progress/Projects/AI Use/Conversations/Export Conformance|Export Conformance]]). Distillation, review, and the logs that would prove capture ran are empty or missing: 5 summaries exist, `Summaries-to-Create` was a 0-byte file until today, the AI tools weekly review has run once (W34, August), and no log records whether an export succeeded or failed.
**Research is complete and the loop design is locked pending a postmortem; the loop itself does not exist yet.** The design is in [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]], the ten sources behind it in [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Sources|Conversation Loop Sources]], and the build order in [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Build Plan|Conversation Loop Build Plan]].  What exists is a capture pipeline plus stubs. The standards, templates, and workflows in `30_Order` that describe the conversation layer were written on 2026-10-15 and 2026-10-16 before this was measured, so they are scratchpads until the research in [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Research Plan|Conversation Loop Research Plan]] lands.
Scope decision for this round: Claude Code only. The Dell and both WSL sides are described from synced notes and the Build 5c record, not touched. The Dell picks up the build later through Jarvis sync and the build notes.
| Where | Job | State |
|---|---|---|
| `60_Claude/05_Clippings/AI Conversations/` | Raw archive, one note per session, machine first | Live on the Acer, README half historical |
| `30_Order/System/claude-workflow/` | The hook, the exporters, the backfill and health scripts | Running; see [[20_Progress/Projects/AI Use/Conversations/Capture Scripts|Capture Scripts]] |
| `60_Claude/07_AI_Information/AI Conversation - Summaries/` | Distilled summaries and their backlog | 5 summaries, backlog seeded 2026-10-21 |
| `60_Claude/07_AI_Information/How to Use Claude/Track Conversations.md` | How to check the layer is working | Written 2026-10-21 |
| `60_Claude/30_Reviews/AI/Conversations/` | Per-track status notes, tool call analysis, the loop review | First pass written 2026-10-21 |
| `10_Areas/AI/Setup/Conversation Map.md` | The map of all of the above | Written 2026-10-21 |
| This folder | Postmortem, as-built records, research plan, design, sources, protocols, ledger, taxonomy, local reviewer, machine audit | Written 2026-10-21 and 2026-10-22 |
## Next Action
Write the pre-implementation postmortem of [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]]: one finding per layer, each stress-tested against [[20_Progress/Projects/AI Use/Conversations/Machine Audit 2026-10-22|Machine Audit 2026-10-22]]. Then run B0 and B1 from the build plan. The design stays `active` until that postmortem lands.
## Open Questions
- [ ] Keep or retire the legacy `Windows/Claude Code/` and `Windows/Cowork/` trees. 107 notes are duplicates of sessions that also sit under `Dell/` or inside one tree. Owner decision.
- [ ] Wire or retire Cowork capture. No Cowork session has been captured since 2026-07-24.
- [ ] Where do the future logs live: inside the vault (synced, visible on both laptops) or outside it like `jarvis-session-activity.jsonl`?
- [x] Is the 30-day transcript retention real? Yes, per the docs (2026-10-21); details in [[20_Progress/Projects/AI Use/Conversations/Claude Code Session Source|Claude Code Session Source]]. Whether to raise `cleanupPeriodDays` is an open owner decision.
- [ ] Owner decisions for the build: `cleanupPeriodDays` value, events per machine or synced, which local models to pull, weekly time budget. Listed in [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Build Plan|Conversation Loop Build Plan]].
- [ ] Which of the two empty `How to Use Claude` notes (`How to Run Plugins & Tools`, `How to Use Skill Map`) belong to this project? They are not conversation notes and were left empty.
## Log
- **2026-10-21:** Measured the live layer against the Acer's own transcripts, wrote the postmortem and the as-built records in this folder, filled the empty notes in the five locations listed above, and corrected two counts in the 2026-10-17 audit. Standards in `30_Order` left untouched.
- **2026-10-21 (later):** Checked the layer against the Claude Code docs and re-read three papers from full text. Added the documented risks (30-day sweep, unstable transcript format, 1.5-second SessionEnd budget, unused hook events) to the postmortem and the as-built notes. The research plan's source list is being narrowed to verified sources only.
- **2026-10-22:** Research finished. Replaced three weak sources, locked ten in [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Sources|Conversation Loop Sources]], audited what runs on the machine, and wrote the design, the weekly and monthly protocols, the per-prompt record, the failure taxonomy, the intervention ledger, the local reviewer protocol, and the build plan with a handoff. The pre-implementation postmortem is next.
## Related Notes
- [[20_Progress/Projects/AI Use/Conversations/Conversation Layer Postmortem|Conversation Layer Postmortem]] holds the chronology and causes. The counted version is the [[60_Claude/30_Reviews/Conversation Capture Layer Audit (2026-10-17)|audit]].
- As-built records, one job each: [[20_Progress/Projects/AI Use/Conversations/Capture Pipeline - As Built|Capture Pipeline]], [[20_Progress/Projects/AI Use/Conversations/Claude Code Session Source|Claude Code Session Source]], [[20_Progress/Projects/AI Use/Conversations/Capture Scripts|Capture Scripts]], [[20_Progress/Projects/AI Use/Conversations/Capture Registration|Capture Registration]], [[20_Progress/Projects/AI Use/Conversations/Conversation Layer Logs|Conversation Layer Logs]], [[20_Progress/Projects/AI Use/Conversations/Export Conformance|Export Conformance]], [[20_Progress/Projects/AI Use/Conversations/Legacy Layout and Archives|Legacy Layout and Archives]], [[20_Progress/Projects/AI Use/Conversations/Platform Coverage|Platform Coverage]].
- The locked loop: [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Design]], [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Sources|Sources]], [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Build Plan|Build Plan]], [[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]], [[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]], [[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]], [[20_Progress/Projects/AI Use/Conversations/Monthly Review Protocol|Monthly Review Protocol]], [[20_Progress/Projects/AI Use/Conversations/Intervention Ledger|Intervention Ledger]], [[20_Progress/Projects/AI Use/Conversations/Local Reviewer|Local Reviewer]], [[20_Progress/Projects/AI Use/Conversations/Machine Audit 2026-10-22|Machine Audit 2026-10-22]].
- The rules these notes will eventually be measured against: [[30_Order/Standards/AI Loop/Conversations|Conversations]], [[30_Order/Workflows/Toolkit/Conversation Capture|Conversation Capture]], [[30_Order/Workflows/Ingestion/Conversations Loop|Conversations Loop]], [[30_Order/Standards/AI Loop/Logs|Logs]].
- Background: [[60_Claude/40_Project_Briefs/Codebase Sync Decision and Logging Failure Audit — 2026-10-04|the 2026-10-04 logging audit]] and [[Old Laptop Rebuild - Build 5c Acer Workspace and Capture Findings]].
