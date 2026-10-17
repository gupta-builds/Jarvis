---
type: system
status: sprout
created: 2026-10-15
updated: 2026-10-16
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
  - "[[Log Standard]]"
  - "[[Logs]]"
  - "[[AI_CONTEXT]]"
  - "[[Orchestration]]"
  - "[[CPR - Compress Preserve Resume]]"
---
# Memory Management
==Whatever is not written to the session log, a `next:` field, or the dashboard before a session ends is gone at the next context reset.==
This is the behavior policy for what an agent must persist, where, and when, so the next session starts from fact. It says what a session owes the logs. Whether a log should exist is [[Log Standard]]; its shape and entry format are in [[Logs]].
## What must survive a reset
- **Decisions and why:** the session log entry.
- **Files created or changed:** the session log entry, as wikilinks.
- **What was verified, not assumed:** the session log entry, marked as verified.
- **Open questions:** the log entry, and the note's `Open Questions` heading if it has one.
- **The next concrete action:** the project or plan note's `next:` field, so the dashboard can surface it.
- **Changes to focus or priorities:** `00_Dashboard.md` or the relevant board, not the log alone.
Transient status never goes in [[AI_CONTEXT]]. The dashboard and the session log are the live continuity layer.
## Session end protocol
1. Append one entry to `60_Claude/07_AI_Information/Session Logs/log.md` in the narrative format of [[Logs]].
2. Update `updated:` on every note that changed meaningfully.
3. Set or refresh `next:` on any project or plan note whose next step changed.
4. Run `/closeday` if it is the end of the working day.
Skip the entry for a session that changed nothing. A log with filler entries is a log nobody reads.
## Compressing a long session
The CPR pattern (compress a long session into a structured summary, preserve it to a topic-named file, resume by searching it) fits one real problem: a session too long for the window. Write the durable facts to the log and the notes before compacting, and let the window forget the rest. Do not treat `/compress`, `/preserve`, `/resume` as working commands; [[CPR - Compress Preserve Resume]] records that they are not live today. Check `.claude/commands/` before relying on them.
## Derived memory
The `jarvis-memory` index (`30_Order/System/jarvis-memory/`) is derived from the notes. It can be deleted and rebuilt without loss and is never the record. Raw conversation text stays in `60_Claude/05_Clippings/AI Conversations/`; the summary follows [[Conversations]].
> [!WARNING]
> Logging a claim from another agent or tool as if it were checked. Write what you opened and confirmed, and say so when a subagent result was not verified.
## Done Conditions
- The session log has one heading-form entry for the session, or the session changed nothing.
- Every project or plan note touched has a current `next:`.
- Every open question is written somewhere findable, not left in the conversation.
- Nothing transient was added to `AI_CONTEXT.md`.
## Gold Standard Example
None reviewed against this policy. A candidate is the `[2026-10-02] write | Cross-Laptop Sync Build 9` entry in `Session Logs/log.md`, which names a root cause and a changed cadence. Confirm it against the Done Conditions before treating it as the example.
