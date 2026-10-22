---
type: index
status: sprout
created: 2026-10-21
updated: 2026-10-22
tags:
  - moc
  - ai
  - conversations
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Layer|Conversation Layer]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Layer Postmortem|Conversation Layer Postmortem]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Sources|Conversation Loop Sources]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Build Plan|Conversation Loop Build Plan]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Monthly Review Protocol|Monthly Review Protocol]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Intervention Ledger|Intervention Ledger]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Local Reviewer|Local Reviewer]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Machine Audit 2026-10-22|Machine Audit 2026-10-22]]"
  - "[[60_Claude/05_Clippings/AI Conversations/README|AI Conversations README]]"
  - "[[60_Claude/07_AI_Information/AI Conversation - Summaries/README|AI Conversation - Summaries README]]"
  - "[[60_Claude/07_AI_Information/How to Use Claude/Track Conversations|Track Conversations]]"
  - "[[60_Claude/30_Reviews/AI/Conversations/Conversation Loop Review|Conversation Loop Review]]"
  - "[[10_Areas/AI/Setup/Folder Map|Folder Map]]"
next: Update this map after the pre-implementation postmortem and again when build B10 rewrites the conversation standards.
---
# Conversation Map
## Purpose
Where everything about AI conversations lives: the raw archive, the scripts that fill it, the summaries meant to come out of it, and the reviews meant to check it. Read this first when a conversation note is missing or a script behaves oddly. It describes what exists on 2026-10-22, with the designed loop in its own paragraph below.
## Map
The raw archive is `60_Claude/05_Clippings/AI Conversations/`, one note per session under `<Machine>/<OS>/<Tool>/<Project>/`; its [[60_Claude/05_Clippings/AI Conversations/README|README]] holds the live layout and a lot of pre-2026-10-17 history. What sits in each tree, including the legacy `Windows/` copies and the 14 archive folders, is in [[20_Progress/Projects/AI Use/Conversations/Legacy Layout and Archives|Legacy Layout and Archives]]. Which AI platforms have any capture at all is in [[20_Progress/Projects/AI Use/Conversations/Platform Coverage|Platform Coverage]].
The machinery is in `30_Order/System/claude-workflow/` (Windows hook, exporters, backfill, health) and `30_Order/System/cursor-workflow/` (Cursor). [[20_Progress/Projects/AI Use/Conversations/Capture Pipeline - As Built|Capture Pipeline]] walks a session through it; [[20_Progress/Projects/AI Use/Conversations/Capture Scripts|Capture Scripts]] has one card per script; [[20_Progress/Projects/AI Use/Conversations/Capture Registration|Capture Registration]] says what is registered where; [[20_Progress/Projects/AI Use/Conversations/Conversation Layer Logs|Conversation Layer Logs]] lists every record the layer writes. The data a session leaves behind before any script touches it is in [[20_Progress/Projects/AI Use/Conversations/Claude Code Session Source|Claude Code Session Source]], and how far the written notes drift from the Standard is in [[20_Progress/Projects/AI Use/Conversations/Export Conformance|Export Conformance]].
Summaries are meant to land in `60_Claude/07_AI_Information/AI Conversation - Summaries/`; five exist, and [[60_Claude/07_AI_Information/AI Conversation - Summaries/Summaries-to-Create|Summaries-to-Create]] now lists the first candidates. To check that capture is working, follow [[60_Claude/07_AI_Information/How to Use Claude/Track Conversations|Track Conversations]].
Reviews live in `60_Claude/30_Reviews/AI/Conversations/`: one note per capture track ([[60_Claude/30_Reviews/AI/Conversations/Acer Windows Track|Acer Windows]], [[60_Claude/30_Reviews/AI/Conversations/Dell Windows Track|Dell Windows]], [[60_Claude/30_Reviews/AI/Conversations/Dell WSL Track|Dell WSL]]), a first [[60_Claude/30_Reviews/AI/Conversations/Tool Call Analysis|Tool Call Analysis]], and the [[60_Claude/30_Reviews/AI/Conversations/Conversation Loop Review|Conversation Loop Review]]. The earlier counted audit is [[60_Claude/30_Reviews/Conversation Capture Layer Audit (2026-10-17)|Conversation Capture Layer Audit]].
The story of how it got here and why the loop never closed is [[20_Progress/Projects/AI Use/Conversations/Conversation Layer Postmortem|Conversation Layer Postmortem]]. The research is in [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Research Plan|Conversation Loop Research Plan]] and its ten locked sources in [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Sources|Conversation Loop Sources]]. The locked design is [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]] and the build order is [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Build Plan|Conversation Loop Build Plan]]. The rules in `30_Order` ([[30_Order/Standards/AI Loop/Conversations|Conversations]], [[30_Order/Workflows/Toolkit/Conversation Capture|Conversation Capture]], [[30_Order/Workflows/Ingestion/Conversations Loop|Conversations Loop]]) are scratchpads until that research lands.
The designed loop: what is written per prompt is [[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]]; the vocabulary for coding failures is [[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]]; the human review is [[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]] and [[20_Progress/Projects/AI Use/Conversations/Monthly Review Protocol|Monthly Review Protocol]]; every change to the setup is logged in [[20_Progress/Projects/AI Use/Conversations/Intervention Ledger|Intervention Ledger]]; the local model's limited job is [[20_Progress/Projects/AI Use/Conversations/Local Reviewer|Local Reviewer]]; what runs on the machine today is [[20_Progress/Projects/AI Use/Conversations/Machine Audit 2026-10-22|Machine Audit 2026-10-22]]. None of it is built yet.
## Status
| Part | State on 2026-10-22 |
|---|---|
| Capture, Acer Windows | Live; all 92 recent sessions captured |
| Capture, other tracks | Dell and WSL unverified from here; Cursor stopped 2026-10-08; Cowork stopped 2026-07-24 |
| Distillation | 5 summaries; backlog seeded today |
| Reviews | First track and loop reviews written today |
| Logs that prove capture ran | None |
| Loop design | Locked pending a postmortem; nothing built |
