---
type: evergreen
status: tree
created: 2026-05-30
updated: 2026-10-15
tags:
  - evergreen
  - system
  - obsidian
  - architecture
notes:
  - "[[40_Resources/Obsidian/Vault Operating System]]"
  - "[[AGENTS]]"
  - "[[CLAUDE.md]]"
  - "[[AI_CONTEXT]]"
  - "[[HUMAN_WRITING]]"
  - "[[00_Dashboard]]"
---

# Jarvis Vault Architecture

This note defines what every folder in Jarvis is for, what goes in it, who may write to it, and how a note moves from raw capture to durable knowledge. It is the placement source of truth. When this note and the folder tree disagree, fix one of them on purpose. Never let an agent guess.

Read it before writing anything into the vault. An agent that does not know the architecture will invent a folder, and one bad guess at the root pollutes the whole system.

---

## The mental model: six layers

Jarvis is six layers, each answering one question. Every folder belongs to exactly one layer. If you can name the layer, you know where a note goes.

| Layer | Folder | The question it answers | Who owns it |
|---|---|---|---|
| **Identity** | `10_Areas/` | Who am I and what are my domains? | You. AI patches by heading only. |
| **Execution** | `20_Progress/` | What am I actively doing right now? | You + AI, working notes with next actions. |
| **Rules** | `30_Order/` | How are notes written and structured here? | You. AI reads this before writing; edits only when building tooling. |
| **Reference** | `40_Resources/` | What do I need to know or look up to do the work? | You curate. AI proposes, never bulk-dumps. |
| **AI workshop** | `60_Claude/` | Where does AI capture, draft, distill, and coordinate? | Every AI agent, freely. |
| **Dead** | `50_Archive/` | What is done and out of rotation? | Nobody touches it. AI never reads or writes. |

Two cross-cutting pieces sit inside these layers:

- **Visual**: `10_Areas/Excalidraw/` holds diagrams for any concept, project, or source. A diagram belongs to the domain it explains.
- **AI operating memory**: `60_Claude/07_AI_Information/` holds how any AI reads this vault, plus the session log and conversation record.

The most important relationship: **knowledge is born in `60_Claude`, matures there, and is promoted out to Identity, Execution, or Reference. `60_Claude` is a workshop, not a warehouse.**

---

## The Write Contract

Every agent follows this, regardless of which tool is driving (Claude Code, Cursor, Kiro, Codex, Cowork, or anything talking only through the Obsidian MCP server).

### Golden rules

1. **Never create a new top-level file or folder at the vault root.** The root holds exactly `00_Dashboard.md`, `AGENTS.md`, `CLAUDE.md`, `HUMAN_WRITING.md`, and the numbered folders `10_Areas` through `60_Claude`.
2. **When unsure where a note goes, write it to `60_Claude/00_Inbox/`.** A misfiled note in the Inbox is fixed in five seconds. A note in an invented folder is invisible until it causes damage.
3. **Read `30_Order/` before writing.** Its `Standards/`, `Templates/`, and `Workflows/` define how every note type is shaped and filed. No frontmatter or structure is used that a template does not define. If no template exists for the note type, say so and design one first (see [[30_Order/00_How This Folder Works|How This Folder Works]]).
4. **Search before creating.** Extend an existing canonical note. Most "new" notes should be edits.
5. **Preserve frontmatter and wikilinks. Patch by heading.**

### Where does this note go?

This table is mirrored in `AGENTS.md`. If the two ever differ, this one wins and `AGENTS.md` gets fixed.

| If the note is | Write it to |
| --- | --- |
| A raw clip, paste, web capture, video, or imported source | `60_Claude/05_Clippings/` |
| A quick AI output you are not sure how to file | `60_Claude/00_Inbox/` |
| A summary of one source | `60_Claude/10_Source_Summaries/` |
| Reusable distilled knowledge (a concept, not a source) | `60_Claude/20_Distilled_Notes/`, then promote to `40_Resources/` or `10_Areas/` once stable |
| Stable reference material (guide, cheat sheet, plugin doc, link) | `40_Resources/` + backlink to its `10_Areas/` domain |
| Work on an active project, internship, research, or mentorship | `20_Progress/` under the matching project folder |
| A canonical fact about a life domain | `10_Areas/`, patching an existing domain file by heading; no new top-level files without explicit instruction |
| A synthesized project brief | `60_Claude/40_Project_Briefs/` |
| A reusable deliverable (interview story, portfolio bullet, prompt) | `60_Claude/40_Project_Briefs/` with `source_concepts:` provenance. No dedicated Outputs folder exists today. |
| A daily, weekly, or monthly review | `10_Areas/Life/Enumerate/{Daily,Weekly,Monthly,Yearly}` (Periodic Notes) or `60_Claude/30_Reviews/` (AI, internship, ops, and synthesis reviews) |
| A dashboard or index | `60_Claude/44_Indexes/` |
| A session log entry | append to `60_Claude/07_AI_Information/Session Logs/log.md` |
| A new template, standard, workflow, or CLI tool | `30_Order/`, only when the task is explicitly building one |
| A visualization for a concept, project, PDF, source, or AI input | `10_Areas/Excalidraw/`, in an area or project subfolder |
| Information about the whole vault for any AI tool | `60_Claude/07_AI_Information/` |

### Never write to

- **The vault root.** No new files or folders directly inside it.
- **`50_Archive/`.** Never read, never write. Excluded from all AI context unless the task is explicitly archival.
- **`60_Claude/05_Clippings/`** after capture. Raw sources are read-only input.
- **`40_Resources/` in bulk.** It is a curated hub. Add a single backlinked entry when it is genuinely reference; never flush a batch of AI distillations into it.
- **`.obsidian/`, `.claude/`, `.cursor/`, `.kiro/`, `.codex`, `.git/`.** Settings and tooling only, never notes. (`.claude/` skills and agents may be edited only when the task is building tooling.)

---

## The 60_Claude flow model

Anything can be dumped into `60_Claude`. Value is created when a dump is distilled and routed to a concrete home.

```
capture        05_Clippings (raw source)   ·   00_Inbox (loose AI output)
   ↓ summarize one source
distill        10_Source_Summaries  →  20_Distilled_Notes (working concept drafts)
   ↓ when a concept is stable and reused
promote        10_Areas/ (canonical domain truth)   ·   40_Resources/ (curated reference)   ·   20_Progress/ (active work)
```

What legitimately stays in `60_Claude` long-term is the operating machinery, not the knowledge: clippings, source summaries, project briefs, reviews, indexes, and the `07_AI_Information` layer. A distilled concept is a guest in `20_Distilled_Notes`. Once it is trustworthy and reused, it belongs in `10_Areas` (identity-level truth) or `40_Resources` (lookup reference).

**The 40_Resources guardrail.** Promotion into `40_Resources` is curated, not automatic. AI proposes a promotion and backlinks it; you decide whether it earns a place. The workshop never empties itself into your library without review.

---

## Top-level folder contracts

### Root files

**Job:** the fixed entry points every tool and human starts from.
**Belongs:** `00_Dashboard.md`, `AGENTS.md`, `CLAUDE.md`, `HUMAN_WRITING.md`. Dotfolders (`.claude`, `.obsidian`, `.git`, `.cursor`, `.kiro`, `.codex`) are tooling, not vault content.
**Who writes:** you, and AI only when explicitly editing one of those four contract files.

### 10_Areas: identity layer

**Job:** the source of truth for who you are and what you are working toward. Small and link-dense: a hub per domain that points out to active work in `20_Progress` and reference in `40_Resources`.
**Belongs:** one or two canonical notes per domain. Current domains: `Career/`, `Trading/`, `Life/`, `AI/`, plus `Notes/` (coursework) and `Excalidraw/` (visual layer).
**Does not belong:** active build work (that is Execution) and raw AI output.
**Who writes:** you, freely. AI patches existing domain notes by heading and never adds new top-level files here without explicit instruction.
**Workflow:** each domain gets one canonical hub note (`type: evergreen`, `status: tree`) that states the durable truth of that domain and links to the live work and resources. Everything else in the domain folder is subordinate to that hub.

### 20_Progress: execution layer

**Job:** everything actively in motion. If you are pushing on it this term, it lives here with a next action.
**Belongs:** active projects, internship tracking, mentorship, research (UROP/BOOM), degree planning, AI tooling setups. Current shape: `AI/`, `Degree/`, `Internship/`, `Mentorship Program/`, `Projects/`.
**Does not belong:** finished work (`50_Archive`), pure reference (`40_Resources`), identity-level truth (`10_Areas`).
**Who writes:** AI writes concrete project notes here, drawn from `60_Claude/40_Project_Briefs/` and `20_Distilled_Notes/`. Every `type: project` note carries a `next:` so the dashboard can surface stalls.
**Workflow:** a project starts as a brief in `40_Project_Briefs/`, becomes a live project note here with a `next:`, accrues working notes, and ends archived. The test: can you name something you are working on that has no note here? If yes, that thread is invisible to the system.

### 30_Order: rules and machinery layer

**Job:** how the vault itself works. `HUMAN_WRITING` governs how prose sounds; `30_Order` governs how a note is shaped, structured, and filed. **Every AI agent must read the relevant part of this folder before writing a note.**
**Belongs:** `Standards/` (content contracts per note type), `Templates/` (empty scaffolds), `Workflows/` (the process around creating and updating each type), and `System/` (`jarvis-cli`, `jarvis-memory`, sync and Claude workflow tooling).
**Does not belong:** knowledge, course material, PDFs, attachments. If it is not a standard, template, workflow, or tool, it does not belong here.
**Who writes:** you. AI reads this folder as mandatory input and edits it only when the explicit task is building a standard, template, workflow, or tool.
**Workflow:** see [[30_Order/00_How This Folder Works|How This Folder Works]] for the Standard, Template, Workflow split and the rule for adding a new note type.

### 40_Resources: reference hub

**Job:** your private search engine. Guides, concepts, links, tools, and docs you reach for to do the work. `10_Areas` and `20_Progress` link into here for the resource they need.
**Belongs:** `CS/` (AI tooling notes, concepts, links, repos), `Obsidian/` (system docs including this note and the Vault Operating System), `Capability/`, and course reference under `UMN/`. Every entry backlinks to the `10_Areas` domain it serves.
**Does not belong:** raw captures (`05_Clippings`), one-off source summaries (`10_Source_Summaries`), active project notes. Not a dumping ground for AI distillations.
**Who writes:** you curate. AI may add a single backlinked reference entry when it is genuinely lookup material, and otherwise proposes promotions for your review.

### 50_Archive: dead-letter office

**Job:** historical material out of active rotation but not deleted. **AI never reads and never writes here.** The hard exclusion keeps stale content out of AI context.

### 60_Claude: AI workshop and orchestration layer

**Job:** where every AI agent captures, drafts, distills, and coordinates. The one place an agent can write without second-guessing. Home of the default landing zone (`00_Inbox`).
**Who writes:** every AI agent, freely.
**Numbering:** subfolder numbers are intentionally non-sequential to leave room for insertion. Keep them stable so links do not break.

| Subfolder | Holds | AI behavior |
|---|---|---|
| `00_Inbox/` | loose AI output awaiting filing; the default landing zone | write freely; review and route out regularly |
| `05_Clippings/` | raw clips, web captures, videos, PDFs, AI conversations (`Web/`, `Videos/`, `PDFs/`, `AI Conversations/`) | write on capture only; never rewrite in place |
| `07_AI_Information/` | the AI operating and memory layer (see below) | patch the docs, append the logs |
| `10_Source_Summaries/` | one summary per source (`Web Ingestion/`, `Video Ingestion/`, `PDF Ingestion/`, `Github Ingestion/`) | one source in, one summary out |
| `20_Distilled_Notes/` | working concept drafts, `Synthesis/` | write; promote stable concepts to `10_Areas` or `40_Resources` |
| `30_Reviews/` | `AI/`, `Internship Loop/`, `Monthly/`, `Weekly Synthesis/`, `Ops Reports/` | write on cadence |
| `40_Project_Briefs/` | synthesized project plans (`CausalOps/`, `Internship/`, `Portfolio/`, `TradingView/`) | write; feed `20_Progress` |
| `44_Indexes/` | dashboards, indexes, Field OS, `Bases/` | prefer Dataview and Bases over hand-maintained tables |

#### 07_AI_Information: the AI operating and memory layer

**Job:** the agent's map and memory. The **map** is [[AI_CONTEXT]] (orientation, cold-start read order, live state), `Jarvis Writing and Formatting.md`, and `Plugins.md`. The **memory** is `Session Logs/log.md` and `AI Conversation - Summaries/`.

**Relationship to `30_Order`:** rules and standards live in `30_Order`; orientation and history live in `07_AI_Information`. This layer points agents at `30_Order` when they need the writing procedure and does not restate it.

### Excalidraw: visual layer (under 10_Areas)

**Job:** diagrams and visual thinking for any concept, project, source, or AI input, organized by the area or project they explain. Link every drawing from the note it supports.

---

## Status as of 2026-10-15

Verified against the current folder tree, not carried over from the May 2026 version of this note.

**Resolved since 2026-05-31:**
- `30_Order/Workflows/` exists and is indexed in [[00_Workflows Index]].
- The orientation file exists. It is now merged into [[AI_CONTEXT]], which holds the single cold-start read order.
- The coursework-home question is settled: `10_Areas/UMN/` no longer exists; coursework lives in `10_Areas/Notes/` with reference under `40_Resources/UMN/`.
- `AGENTS.md` carries the Write Contract.
- The `60_Claude/35_Outputs/` and `60_Claude/50_Reviews/` folders no longer exist. Reviews live in `30_Reviews/`. Reusable deliverables have no dedicated folder; use `40_Project_Briefs/`.

**Still open:**
- `10_Areas` identity hubs. `Trading/` has a hub-shaped note (`Stocks Trading AI Hub.md`). `Career/` and `Life/` have no single canonical hub note yet.
- `Links.md` still exists in several places. One canonical links note per domain has not been chosen.
- Not re-verified in this pass: whether `00_Dashboard.md` Dataview blocks still query a dead coursework path.
- `60_Claude/Claude Board.md` sits loose at the `60_Claude/` root and has no routing rule.

---

## Relationship to the other contract docs

- **This note:** what each folder is for and where any note goes.
- [[40_Resources/Obsidian/Vault Operating System]]: the property and frontmatter schema only.
- [[HUMAN_WRITING]]: how prose must sound. `30_Order` is the structural half.
- [[AGENTS]]: root behavioral rules; mirrors this note's Write Contract.
- [[CLAUDE.md]]: Claude-specific workflow, skills, and agents.
- [[AI_CONTEXT]]: orientation and live-state manifest for every tool.
- [[Jarvis OS — North Star]]: strategy and the reasons behind this structure.
