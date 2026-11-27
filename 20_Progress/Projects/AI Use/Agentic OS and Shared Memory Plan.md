---
type: project
status: active
created: 2026-11-26
updated: 2026-11-26
tags:
  - ai
  - memory
  - agentic-os
project_kind: plan
next: Wire Hermes capture so a second platform logs to Jarvis, then count the days of unbroken capture.
related_progress:
  - "[[Hermes System]]"
notes:
  - "[[Jarvis OS — North Star]]"
  - "[[Jarvis Memory]]"
  - "[[Platform Coverage]]"
  - "[[Per-Prompt Record]]"
  - "[[Hermes Conversation Tracking Plan]]"
  - "[[00_Execution]]"
---
# Agentic OS and Shared Memory Plan
## Goal
==Every AI platform on this machine works the same loop (log the conversation, review it, promote what matters to Jarvis) and shares one memory, first as notes in Obsidian and later through a database built from those notes, with Obsidian staying the source of truth.== The order is fixed: prove the loops with real data, then add the database. A database built before the data exists would be designed on guesses.
## Sequence
1. Log every platform to Jarvis in the same shape. Claude Code is live; Hermes is next ([[Hermes Conversation Tracking Plan]]); [[Platform Coverage]] shows Codex, Cursor and the rest as source data with no exporter. Done when three platforms have exports that pass [[Vault Lint]].
2. Make the per-prompt record platform-neutral so one review loop reads all of them ([[Per-Prompt Record]]). Done when a Hermes tool call and a Claude Code tool call appear as the same record shape.
3. Prove the loops. Proposed gate, to be agreed: 30 consecutive days with no capture gap on at least three platforms, the weekly review reading those exports, and a count of notes promoted from them. Done when the gate is met and written down with its numbers.
4. Decide the memory stack in writing. Candidates already in the vault: the `jarvis-memory` SQLite registry, which holds chunks, links and conversations tables and is rebuilt from the notes ([[Jarvis Memory]], not yet registered as an MCP server), and gbrain with gstack, chosen in [[00_Execution]] as the memory pair. For Hermes alone, the plugin providers (Hindsight, Honcho) are a third option. Done when one is chosen and the others are named as rejected, with reasons.
5. Build the database as a derived index. The rule that keeps Obsidian central: the vault is written by agents through the Write Contract, the database is filled by indexing the vault and the capture folders, and deleting the database loses nothing because it rebuilds. Done when a full rebuild from the vault reproduces the same search answers.
6. Serve it to every agent through one MCP interface, read first, then writes only to the inbox folder. Done when Claude Code and Hermes answer the same question from the same index and cite the same notes.
*Not now:* embeddings, graph databases and any agent writing straight into the database. Each waits for step 3.
## Open Questions
- [ ] Is 30 days across three platforms the right gate, or should the number of reviewed sessions count too?
- [ ] Does `second-brain-claudekit` become the shared tool and skill source for all platforms, or stay Claude Code only? It is still a future build, so decide when step 1 is done.
- [ ] Which two platforms join Claude Code and Hermes first, given that Codex has the most unexported data?
- [ ] Does Hermes memory (two small files) stay separate from the shared memory, or does it become one reader of it?
