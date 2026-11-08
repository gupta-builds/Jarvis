---
type: system
status: sprout
created: 2026-10-15
updated: 2026-11-07
tags:
  - system
  - standards
system_kind: standard
family: policy
maps_to: []
used_by:
  - "[[Maintaining Logs]]"
gold_standard: none
notes:
  - "[[Logs]]"
  - "[[AI_CONTEXT]]"
  - "[[Orchestration]]"
  - "[[CPR - Compress Preserve Resume]]"
---
# Memory Management
==Whatever is not written to the session log, a `next:` field, or the dashboard before a session ends is gone at the next context reset.==
This is the behavior policy for what an agent must persist, where, and when, so the next session starts from fact. It says what a session owes the logs. Whether a log should exist, and its shape and entry format, are in [[Logs]]. It is the one owner of the session-log entry: skills, agents, and Workflows point here and do not append an entry of their own.
## What must survive a reset
| What | Where it goes |
|---|---|
| Decisions and why | The session log entry |
| Files created or changed | The session log entry, as wikilinks |
| What was verified, not assumed | The session log entry, marked as verified |
| Open questions | The log entry, and the note's `Open Questions` heading if it has one |
| The next concrete action | The project or plan note's `next:` field, so the dashboard can surface it |
| Changes to focus or priorities | `00_Dashboard.md` or the relevant board, not the log alone |
## Rules
| Rule | Why | Enforced by |
|---|---|---|
| Append one entry to `60_Claude/07_AI_Information/Session Logs/log.md` at the end of a session that changed something, in the narrative format of [[Logs]]. It is written by whoever ran the session | A session that is not logged is lost at the next reset | Reader |
| Skip the entry for a session that changed nothing | A log with filler entries is a log nobody reads | Reader |
| Update `updated:` on every note that changed meaningfully, and set or refresh `next:` on any project or plan note whose next step changed | The dashboard and reviews read both | Reader |
| Run `/closeday` if it is the end of the working day | The daily scorecard is not written otherwise | Reader |
| Transient status never goes in [[AI_CONTEXT]]. The dashboard and the session log are the live continuity layer | AI_CONTEXT is read cold by every session and must stay true | Reader |
| Write what you opened and confirmed, and say so when a subagent result was not verified. Never log a claim from another agent as if it were checked | An unchecked claim in the log becomes a fact for the next session | Reader |
| Write the durable facts to the log and the notes before compacting a long session, and let the window forget the rest. Do not treat `/compress`, `/preserve`, `/resume` as working commands: [[CPR - Compress Preserve Resume]] records that they are not live | Context that was not written down is gone | Reader |
| The `jarvis-memory` index (`30_Order/System/jarvis-memory/`) is derived from the notes and is never the record. Raw conversation text stays in `60_Claude/05_Clippings/AI Conversations/`; the summary follows [[Conversations]] | The index can be deleted and rebuilt without loss | Reader |
## Example
- **Right:** `## [2026-11-05] system | System layer repair pass`
- **Wrong:** None seen.
## Done Conditions
- The session log has one heading-form entry for the session, or the session changed nothing.
- Every project or plan note touched has a current `next:`.
- Every open question is written somewhere findable, not left in the conversation.
- Nothing transient was added to `AI_CONTEXT.md`.
## Gold Standard Example
None. A policy has no instance. The entry `[2026-11-05] system | System layer repair pass` in `Session Logs/log.md` is the closest: it names verified changes and an item left open for the owner. It was not reviewed against the Done Conditions, so it is not named gold.
