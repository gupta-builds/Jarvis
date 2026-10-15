---
type: evergreen
status: sprout
created: 2026-10-15
updated: 2026-10-15
tags:
  - system
  - standards
notes:
  - "[[Log Standard]]"
  - "[[AI_CONTEXT]]"
  - "[[Orchestration]]"
  - "[[CPR - Compress Preserve Resume]]"
---
# Memory Management
==Whatever is not written to the session log, a `next:` field, or the dashboard before a session ends is gone at the next context reset.==
This is the behavior standard for what an agent must persist, where, and when, so the next session starts from fact and not from guesses. It governs a different question than [[Log Standard]]: Log Standard says when a log file earns its existence and how its entries are formed, this Standard says what a session owes the logs it writes to. The ownership of each log file is a Log Standard question.
## What must survive a reset
- **Decisions and why:** goes in the session log entry.
- **Files created or changed:** goes in the session log entry, as wikilinks.
- **What was verified, not assumed:** goes in the session log entry, marked as verified.
- **Open questions:** goes in the log entry, and in the note's `Open Questions` heading if it has one.
- **The next concrete action:** goes in the project or plan note's `next:` field, so the dashboard can surface it.
- **Changes to focus or priorities:** go in `00_Dashboard.md` or the relevant board, not in the log alone.
Transient status never goes in [[AI_CONTEXT]]. The dashboard and the session log are the live continuity layer.
## Session end protocol
1. Append one entry to `60_Claude/07_AI_Information/Session Logs/log.md`. Newest entries go at the bottom of the file.
2. Update `updated:` on every note that changed meaningfully. Do not touch dashboards just to create activity.
3. Set or refresh `next:` on any project or plan note whose next step changed.
4. Run `/closeday` if it is the end of the working day.
Skip the entry for a session that changed nothing. A log with filler entries is a log nobody reads.
## Entry format
Heading `## [YYYY-MM-DD] tag | title` on one line, then four bullets: what was created or changed, why it matters, open questions, next action if one exists. Entries are append-only. A correction is a new dated entry that names the one it corrects.
> [!WARNING]
> Format drift. The log holds 126 entries in the heading form and, since October 2026, entries written as `2026-10-15 - one long paragraph`. The paragraphs are hard to scan and invisible to heading search. Old entries stay as written. New entries use the heading form.
## Compressing a long session
The CPR pattern (compress a long session into a structured summary, preserve it to a topic-named file, resume by searching it) fits one real problem: a session too long to carry in the window. Adopt the idea narrowly. Write the durable facts to the log and the notes before compacting, and let the window forget the rest. Do not treat `/compress`, `/preserve`, `/resume` as working commands: [[CPR - Compress Preserve Resume]] records that they are not live in `second-brain-claudekit` today. Check `.claude/commands/` before relying on them.
## Derived memory
The `jarvis-memory` index (`30_Order/System/jarvis-memory/`) is derived state built from the notes. It can be deleted and rebuilt without loss. It is a retrieval aid, never the record. Raw conversation text stays in `60_Claude/05_Clippings/AI Conversations/`, and the summary lives under [[Conversations]].
> [!WARNING]
> Logging a claim from another agent or tool as if it were checked. Write what you opened and confirmed. If a result came from a subagent and was not verified, say so in the entry.
## Done Conditions
- The session log has one heading-form entry for the session, or the session changed nothing.
- Every project or plan note touched has a current `next:`.
- Every open question is written somewhere findable, not left in the conversation.
- Nothing transient was added to `AI_CONTEXT.md`.
## Gold Standard Example
None yet reviewed against this Standard. A candidate is the `[2026-10-02] write | Cross-Laptop Sync Build 9` entry in `Session Logs/log.md`, which names a root cause and a changed cadence. Confirm it against these Done Conditions before treating it as the example.
