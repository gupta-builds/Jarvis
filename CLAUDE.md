---
type: ai
status: sprout
created: 2026-04-03
updated: 2026-10-15
tags:
  - evergreen
  - "#ai"
  - "#ai-infrastructure"
related_progress:
  - "[[AI_CONTEXT]]"
  - "[[AI Workflow]]"
  - "[[Claude Pro Workflow]]"
  - "[[40_Resources/CS/Links|Links]]"
  - "[[10_Areas/AI/Claude Code]]"
  - "[[What MCPs]]"
  - "[[Claude Board]]"
  - "[[HUMAN_WRITING]]"
---
# CLAUDE.md — Vault Operating Contract
This vault is a personal knowledge system. The assistant(you) reads, writes, and maintains notes directly in Obsidian. For *why Jarvis exists, why it underperforms today, and the target state*, read [[Jarvis OS — North Star]] — the strategy spine. This file owns only Claude-specific workflow (skills, commands, session protocol); it should not restate the system philosophy or the routing tables that live in the North Star and [[40_Resources/Obsidian/Jarvis Vault Architecture]]. Shared vault context lives in:
- [[Jarvis OS — North Star]]
- [[AI_CONTEXT]]
- [[AGENTS]]
- [[HUMAN_WRITING]]
Do not duplicate shared workspace rules here unless they are Claude-specific.
## Folder Roles
Full folder definitions: [[40_Resources/Obsidian/Jarvis Vault Architecture]]. Routing table for note placement: [[AGENTS.md]].

## Core Rules

### Editing Behavior

1. **Prefer patching by heading** — Add content under existing headings instead of rewriting entire files.
2. **Preserve frontmatter** — Never remove or rename frontmatter keys unless explicitly asked.
3. **Search before creating** — Use MCP search to check if a note already exists before creating a new one.
4. **Respect maturity** — Notes with `status: tree` are stable; propose changes before modifying.
5. **Follow `30_Order/` strictly before writing** — every note starts from a Template in `30_Order/Templates/`, is shaped by its Standard in `30_Order/Standards/`, and follows its Workflow in `30_Order/Workflows/`. No frontmatter or headings outside them. If the note type has no template, say so and design one first; see [[AGENTS.md]] → "The 30_Order rule". `HUMAN_WRITING` governs voice.
6. **Use [[AI_CONTEXT]] for continuity** — read its cold-start order, then the dashboard and session log tail, before assuming current project state.
7. **Use context packs, not vault dumps** — follow [[Claude Pro Workflow]]: read the manifest, dashboard, session log tail, and task-specific notes instead of scanning the whole vault.
8. **No personal-life content in Jarvis** — health, personal finance, relationships, and confessional journaling belong in The Plan (`00_Live/`), not here. `10_Areas/Life/Truths of Life/` is scoped narrowly to builder-identity evidence only. Full rule: [[AGENTS.md]] → Write Contract → Golden rules.
9. **PDF extraction**: use mineru parse, never pdftotext.

### Note Creation Conventions

Frontmatter comes from the template, never from memory. Find the note type in [[Note Type Registry]]; it names the Template, Standard, and Workflow. `type`, `status`, and every `*_kind` come only from [[Frontmatter Standard]] (17 types, 7 statuses); do not invent a value. The frontmatter-only starters in `30_Order/Templates/Frontmatter/` are for Inbox notes with no family. Property meanings beyond the vocabulary: [[40_Resources/Obsidian/Vault Operating System]]. Folder routing: the table in [[AGENTS.md]]. Check the finished note with [[Vault Lint]], and bring any older note you touch to its Standard ([[Conformance on Touch]]).

### Which tool for which task

| Task | Use |
| --- | --- |
| Open or close the day | `/startday`, `/closeday` |
| Ingest a clipping, PDF, link, or transcript | `/ingest-clipping`, `/transcript-to-brief`, agent `ingestion` or `research-distiller` |
| Distill a note, map next steps | `/distill-note`, `/note-to-actions` |
| Fix AI-sounding prose | `/remove-ai-slop`, agent `anti-slop-editor` |
| Review a week or vault health | `/weekly-review`, `/ops health-check`, agent `vault-curator` |
| Drill a concept | agent `learning-agent` |
| Decide something with real stakes | `/llm-council`, `/challenge`, `/strategy` |

Agent and tool selection rules: [[Orchestration]] and [[Tool Calls]].

### Output Destinations
See the routing table in [[AGENTS.md]] → Write Contract → "Where does this note go?".

### Ingestion Workflow (05_Clippings → 60_Claude)
Use `/ingest-clipping "filename.md"`. The full step-by-step workflow lives in `.claude/skills/ingesting-clipping/`.

### Query Behavior

When answering questions:

1. **Search the Claude layer first** — Read `60_Claude/44_Indexes/Claude Layer Index.md` for relevant distillations
2. **Then search the wider vault** — Use MCP search for broader context
3. **Cite sources** — Link to notes that informed your answer
4. **File useful outputs** — If an answer deserves preservation, save it to `60_Claude/`

### Session End Protocol

At the end of each working session:

1. Update `60_Claude/07_AI_Information/Session Logs/log.md` with what was done
2. Create or update a summary note if significant work occurred
3. List outcomes, open questions, and next steps
4. Optionally run `/closeday` for a daily summary

### Daily Operations Cadence

Run `/startday` to open the day: reads your plans, loads session history, and fills today's periodic note at `10_Areas/Life/Enumerate/Daily/`. Work through the day. Run `/closeday` to close: verifies completions and writes the scorecard into the same note. Run `/ops health-check` for vault maintenance (not daily planning). See `.claude/skills/ops.md` for vault health operations.

**Meta:** Keep this file under ~150 lines. Link to detailed notes instead of repeating information.

@AGENTS.md
