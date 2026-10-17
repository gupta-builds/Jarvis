---
type: ai
status: sprout
created: 2026-03-19
updated: 2026-10-15
tags:
  - "#ai"
  - "#evergreen"
  - "#ai-infrastructure"
related:
  - "[[CLAUDE]]"
  - "[[HUMAN_WRITING]]"
  - "[[AI_CONTEXT]]"
---
# Jarvis Agent Guide

This vault is an AI-assisted second brain built in Obsidian. Treat it as a knowledge system first and a file tree second. This file owns the write contract and the routing table. Everything else it points to owns its own job.

## Cold start

Follow the single read order in [[AI_CONTEXT]]. Do not read the full instruction stack. Load only what the task touches.

| Question | Owner |
| --- | --- |
| Why does Jarvis exist and where is it going? | [[Jarvis OS — North Star]] |
| Where does this note go? | [[40_Resources/Obsidian/Jarvis Vault Architecture]] |
| How is this note type shaped? | `30_Order/` (see the rule below) |
| What do the frontmatter properties mean? | [[40_Resources/Obsidian/Vault Operating System]] |
| How must the prose sound? | [[HUMAN_WRITING]] |
| How do I format it in Obsidian? | [[Jarvis Writing and Formatting]] |
| What is happening right now? | [[00_Dashboard]] and `Session Logs/log.md` |
| Which agent, skill, or tool do I use? | [[CLAUDE]] and `30_Order/Standards/AI Loop/` |

## The 30_Order rule

Every note written into this vault follows a Standard, a Template, and (where one exists) a Workflow from `30_Order/`. This is strict.

- Find the note type in [[Note Type Registry]]. It names the Template, Standard, and Workflow, and the folder.
- Start from the matching file in `30_Order/Templates/`. Do not write frontmatter or headings that no template defines. `type` and `status` come only from [[Frontmatter Standard]].
- Read the matching Standard in `30_Order/Standards/` for what each heading must contain.
- Follow the matching Workflow in `30_Order/Workflows/` for the process around it ([[00_Workflows Index]] lists them).
- Before saving, run [[Vault Lint]] on the note. When you open an older note for any reason, bring it to its Standard in the same edit ([[Conformance on Touch]]).
- If no template exists for the note type, do not improvise. Say so, and design the Standard, then the Template, then the Workflow, in that order ([[30_Order/00_How This Folder Works|How This Folder Works]]). Until then, write the note to `60_Claude/00_Inbox/`.

## Write Contract

Every agent follows this, regardless of which tool is driving. Full version: [[40_Resources/Obsidian/Jarvis Vault Architecture]].

### Golden rules

1. **Never create a new top-level file or folder at the vault root.** Root holds only `00_Dashboard.md`, `AGENTS.md`, `CLAUDE.md`, `HUMAN_WRITING.md`, and the numbered folders `10_Areas` through `60_Claude`. This is the single most damaging mistake an agent can make.
2. **When unsure where a note goes, write it to `60_Claude/00_Inbox/`.** Unsure is the trigger to use the Inbox, never to invent a location.
3. **Read `30_Order/` before writing.** Its Standards, Templates, and Workflows are the structural half of [[HUMAN_WRITING]].
4. **Search before creating.** Extend an existing canonical note instead of duplicating.
5. **Preserve frontmatter and wikilinks. Patch by heading.**
6. **No personal-life content in Jarvis.** Jarvis is the execution and technical workshop: course work, projects, career mechanics, business and project income. Health, personal finance, relationships, reflective or confessional journaling, and identity-as-a-person content live in The Plan (`00_Live/`). `10_Areas/Life/Truths of Life/` is the one exception, scoped narrowly to builder-identity evidence (what the work says about me as an engineer), never personal reflection.

### Where does this note go?

| If the note is | Write it to | Read first (30_Order) |
| --- | --- | --- |
| Raw clip, paste, web capture, video, imported source | `60_Claude/05_Clippings/` | [[Capture to Summary]] |
| Quick AI output you are unsure how to file | `60_Claude/00_Inbox/` | |
| Summary of one source | `60_Claude/10_Source_Summaries/` | [[Source Summary Standard]] |
| AI conversation summary | `60_Claude/07_AI_Information/AI Conversation - Summaries/` | [[Conversations]] |
| Reusable distilled knowledge (a concept, not a source) | `60_Claude/20_Distilled_Notes/`, then promote to `40_Resources/` or `10_Areas/` once stable | [[Evergreen Standard]] |
| Stable reference material (guide, cheat sheet, plugin doc, link) | `40_Resources/` + backlink to its `10_Areas/` domain | [[Reference Standard]] |
| Active project, internship, research, mentorship work | `20_Progress/` under the matching project | [[30_Order/Standards/Project Standard|Project Standard]] |
| Canonical fact about a life domain | `10_Areas/`, patching by heading; no new top-level files without instruction | |
| Summary of a meeting, call, or video (people talking) | `60_Claude/40_Project_Briefs/` or next to the project | [[Brief Standard]] |
| Project spec or plan | `20_Progress/` next to the project | [[Spec and Plan Standard]] |
| Map of next steps from a brief or note | next to the source note | [[Action Standard]] |
| Reusable deliverable (story, bullet, one-pager, prompt) | next to the project it serves, with `source_concepts:` provenance (there is no Outputs folder) | [[Output Standard]] |
| Daily note | `10_Areas/Life/Enumerate/Daily/` | [[Daily Note Standard]] |
| Weekly, monthly, or yearly note | `10_Areas/Life/Enumerate/` | [[Periodic Review Note Standard]] |
| AI tools review, capability review, audit report | `60_Claude/30_Reviews/` | [[Review Standard]], [[Capability Review Standard]], [[Audit Report Standard]] |
| Standing plan | `10_Areas/Life/Plans/` | [[Plan Standard]] |
| Map of a folder (MOC) | in the folder it maps | [[MOC Standard]] |
| Dashboard, board, or Field OS note | `60_Claude/44_Indexes/` | [[Dashboard Standard]] |
| Anything a tool wrote (graph export, mirror) | its generator's folder, marked `type: generated` | [[Generated Output Standard]] |
| Session log entry | append to `60_Claude/07_AI_Information/Session Logs/log.md` | [[Log Standard]] |
| New template, standard, workflow, or CLI tool | `30_Order/` (only when explicitly building one) | [[30_Order/00_How This Folder Works|How This Folder Works]] |
| Visualization for a concept, project, or source | `10_Areas/Excalidraw/` | |
| Information about the whole vault for any AI tool | `60_Claude/07_AI_Information/` | |

### Never write to

- The vault root. No new files or folders directly inside it.
- `50_Archive/`. Never read, never write.
- `60_Claude/05_Clippings/` after capture. Raw sources are read-only.
- `40_Resources/` in bulk. It is a curated hub; add one backlinked entry at a time, never a batch of AI distillations.
- `.obsidian/`, `.claude/`, `.cursor/`, `.kiro/`, `.codex`, `.git/`. Settings and tooling only, never notes.

## Working Rules

- **Codex model routing:** use the global `base` profile for bounded, routine work with explicit inputs and acceptance criteria. Use `deep` before consequential architecture, hard debugging, security or code review, cross-source synthesis, important decisions, or difficult coursework. If base work becomes cross-cutting or difficult to verify, stop and ask to continue in `deep`; do not silently change model behavior.
- **Codex output:** never use an em dash. Use complete sentences with proper grammar; do not omit words that carry meaning.
- Search before creating a note. Prefer extending an existing canonical note over making duplicates.
- Preserve frontmatter and use the vault schema fields consistently. Update `updated:` when a note changes meaningfully.
- Prefer Obsidian wikilinks for internal references.
- Use `next:` on project, plan, and active progress notes when a concrete next step exists.
- For continuity, read [[AI_CONTEXT]], `00_Dashboard.md`, and `Session Logs/log.md` before making assumptions about current state.
- Do not write AI slop. Follow [[HUMAN_WRITING]]: cut filler, prefer mechanism and contrast, use real examples from this vault, leave notes denser and more human than before.
- After meaningful vault changes, append a concise continuity entry to `60_Claude/07_AI_Information/Session Logs/log.md` ([[Memory Management]]).
- Formatting rules (blank lines, markers, frontmatter, quality gate, safety): [[Jarvis Writing and Formatting]].

## Retrieval Rules

- Prefer structured fields over ad hoc prose when the information should be queryable.
- Prefer backlinks and MOC or index notes over duplicate summaries.
- Use dashboards and indexes under `60_Claude/44_Indexes/` to find gaps before inventing new structure.
- Find the right few notes by metadata or meaning and read only those. Do not load the vault to understand the vault.

## Safety

- This vault contains local plugin configuration. Do not surface or copy secrets from plugin data files.
- Prefer env vars and ignored local config for credentials, never vault notes.
