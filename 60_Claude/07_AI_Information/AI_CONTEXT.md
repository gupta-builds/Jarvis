---
type: evergreen
status: tree
created: 2026-05-31
updated: 2026-10-15
tags:
  - system
  - ai-agents
  - vault-map
notes:
  - "[[Jarvis OS — North Star]]"
  - "[[40_Resources/Obsidian/Jarvis Vault Architecture]]"
  - "[[HUMAN_WRITING]]"
  - "[[30_Order/Standards/AI Loop/Orchestration|Orchestration]]"
  - "[[30_Order/Standards/AI Loop/Memory Management|Memory Management]]"
---
# AI Context Manifest: Orientation and Live State

If you are an AI tool working in Jarvis, start here. This is the five-minute orientation and the live-state manifest in one file. It keeps Claude, Cursor, Kiro, Codex, and other tools aligned without copying instructions into multiple files. Do not duplicate this file's contents into tool-specific docs; they point here instead.

Jarvis is a personal knowledge operating system in Obsidian: live dashboards, metadata, backlinks, source layers, and AI-generated synthesis. Work with that system, not around it.

## Cold-start read order

1. **This file.** Orientation and live state.
2. [[Jarvis OS — North Star]]: strategy, diagnosis, build standard. Why Jarvis exists and what it is building toward.
3. [[AGENTS.md]]: Write Contract and routing table. Read before creating any file.
4. [[40_Resources/Obsidian/Jarvis Vault Architecture]]: where every note goes (placement source of truth).
5. `30_Order/` ([[30_Order/00_How This Folder Works|How This Folder Works]], then [[00_Workflows Index]]): the standard, template, and workflow for the note type you are writing. This is mandatory before any write.
6. [[HUMAN_WRITING]] for voice, [[Jarvis Writing and Formatting]] for Obsidian formatting mechanics.
7. [[00_Dashboard]] and the tail of `60_Claude/07_AI_Information/Session Logs/log.md`: what is happening right now.

There is exactly one read order. If another file states a different one, that file is wrong and should point here instead.

## The six layers

Every folder answers one question. Every note belongs to exactly one layer.

| Folder | Layer | Question |
|---|---|---|
| `10_Areas/` | Identity | Who am I, what are my domains? (canonical hubs; holds `Excalidraw/`) |
| `20_Progress/` | Execution | What am I actively doing? (each note has a `next:`) |
| `30_Order/` | Rules | How are notes written and structured? (standards, templates, workflows, CLI) |
| `40_Resources/` | Reference | What do I look up to do the work? (curated hub) |
| `60_Claude/` | AI workshop | Where does AI capture, draft, distill, coordinate? |
| `50_Archive/` | Dead | What is done? (never read, never write) |

Inside `60_Claude/`: `00_Inbox/` (default landing zone), `05_Clippings/` (raw), `07_AI_Information/` (this layer: agent map and memory), `10_Source_Summaries/`, `20_Distilled_Notes/`, `30_Reviews/`, `40_Project_Briefs/`, `44_Indexes/`.

The core motion: **knowledge is born in `60_Claude`, matures, and is promoted out to Identity, Execution, or Reference. The workshop is not a warehouse.**

## How to write a note

Every note goes through `30_Order`. No frontmatter or structure is invented outside the templates and standards there. If no template exists for the note type you need, stop and say so, so one can be designed (Standard first, then Template, then Workflow, per [[30_Order/00_How This Folder Works|How This Folder Works]]).

1. Decide the layer, then check the routing table in [[40_Resources/Obsidian/Jarvis Vault Architecture]] for the exact folder.
2. Open the matching Standard in `30_Order/Standards/` (content contract) and Workflow in `30_Order/Workflows/` (process).
3. Start from the matching Template in `30_Order/Templates/`. Property meanings live in [[40_Resources/Obsidian/Vault Operating System]].
4. Write in the voice of [[HUMAN_WRITING]]; format per [[Jarvis Writing and Formatting]].
5. Wikilink sources, neighbors, and the project or domain it serves.
6. Append one line to `60_Claude/07_AI_Information/Session Logs/log.md`.

`HUMAN_WRITING` is the voice. `30_Order` is the structure.

## Conventions in one place

- **Wikilinks, not plain mentions.** Link when the target note helps future retrieval. Use aliases (`[[Long Note|short]]`) when prose reads better.
- **Frontmatter is the query surface.** Always set `type`, `status`, `created`, `tags`. Add `track`, `source_status`, `enrichment_status`, `next` where the note type calls for it. Do not hide queryable facts only in prose.
- **Maturity:** `seed`, then `sprout`, then `tree`. Be conservative editing `tree` notes; propose big restructures first.
- **Honesty:** mark claims source-grounded, inferred, or uncertain. Never fake a finished note.

## What 07_AI_Information is

The AI operating and memory layer: how agents read this vault and what has happened before. The **map** is this file, [[Jarvis Writing and Formatting]], and [[60_Claude/07_AI_Information/Plugins|Plugins]]. The **memory** is `Session Logs/log.md` and `AI Conversation - Summaries/`. It points at `30_Order` for the writing rules and does not duplicate them.

## Workflow Chooser (which plugin fits the job)

Use the smallest mechanism that fits. For agent, skill, and subagent coordination (a different question from plugin choice), see [[30_Order/Standards/AI Loop/Orchestration|Orchestration]].

**Use Dataview when** a list should stay current from frontmatter metadata: dashboards querying active projects, missing next actions, stale notes, or task queues. Do not use for one-off explanations.

**Use Tasks when** there is a concrete action that should appear in task queries, with a due date, scheduled date, priority, or completion state. Write action tasks, not vague intentions.

**Use Kanban when** the work has lanes or stages: habit tracking, project triage, execution status. Use notes for knowledge; use boards for flow.

**Use Excalidraw when** the concept is easier as a map, graph, feedback loop, or system diagram. Keep searchable text near visual work, because future agents need text to find things.

**Use Spaced Repetition when** the concept is already understood and the card tests one atomic idea. Do not make flashcards from raw source before distillation.

**Use Templater when** creating notes in folders with configured folder templates. If writing outside Obsidian, manually follow the same template fields.

## Never do this

- Create a new file or folder at the vault root.
- Invent a folder when unsure. Write to `60_Claude/00_Inbox/` instead.
- Read or write `50_Archive/`.
- Rewrite a raw clipping in `60_Claude/05_Clippings/`.
- Bulk-dump AI output into `40_Resources/` (curated; one backlinked entry at a time).
- Touch `.obsidian/`, `.claude/`, `.cursor/`, `.kiro/`, `.codex`, `.git/`, or copy any plugin secret into a note.
- Restructure a `status: tree` note, modify `.obsidian` settings, change a template schema, or convert task formats vault-wide without proposing it first.
- Write a note with frontmatter or headings that no template in `30_Order/Templates/` defines.

## Live State Sources

These tell you what is happening right now. Read them instead of relying on stale summaries.

- `00_Dashboard.md`: current control panel; active projects, open tasks, inbox and cleanup queues.
- `60_Claude/07_AI_Information/Session Logs/log.md`: recent AI-assisted work, system changes, previous sessions.
- `60_Claude/44_Indexes/Vault Health Dashboard.md`: metadata drift, orphan notes, stale inbox items, projects missing next actions.
- `60_Claude/44_Indexes/Claude Layer Index.md`: current Claude-layer outputs.

## Domain Entry Points

Read these when the task is domain-specific.

- **System and vault work:** `40_Resources/Obsidian/Vault Operating System.md` (property schema), `AGENTS.md`, `CLAUDE.md`.
- **Active projects and career:** `20_Progress/Projects/Projects Board.md`, then relevant notes under `20_Progress/Career/` and `20_Progress/Mentorship Program/`.
- **AI, agents, workflows:** `40_Resources/CS/AI/Token Optimization/Claude Pro Workflow.md`, notes under `40_Resources/CS/AI/`, and relevant `60_Claude/10_Source_Summaries/` and `20_Distilled_Notes/`.
- **Coursework (feeder layer):** relevant notes under `10_Areas/Notes/`. Enrich only flagship notes or create durable mirror notes elsewhere.

## Shared Rules

- Prefer enriching existing notes over creating duplicates.
- Prefer backlinks and canonical notes over repeated summaries.
- Preserve frontmatter.
- Use [[HUMAN_WRITING]] to avoid AI slop.

## Continuity Protocol

Session-to-session memory practice (what must survive a context reset, when to log, when to compress) lives in [[30_Order/Standards/AI Loop/Memory Management|Memory Management]]. The one rule that belongs here: do not store transient status in this file. `00_Dashboard.md` and the session log are the live continuity layer.

## Tool-Specific Notes

- `CLAUDE.md`: Claude-specific workflow details, skills, and agents.
- `40_Resources/CS/AI/Token Optimization/Claude Pro Workflow.md`: Claude Pro usage, context-pack, MCP, Desktop, and mobile rules.
- `.kiro/steering/`: Kiro loading rules.
- `.cursor/rules/`: Cursor rule wrappers.
- `.claude/agents/` and `.claude/skills/`: Claude-specific operational helpers.
