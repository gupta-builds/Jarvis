---
type: system
status: sprout
created: 2026-09-08
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: guide
notes:
  - "[[60_Claude/07_AI_Information/How to Write in This Vault|How to Write in This Vault]]"
  - "[[MOC Standard]]"
  - "[[Note Type Registry]]"
  - "[[Note Kit Standard]]"
---
# 00 — How This Folder Works
==Every note starts from a Template, follows its Standard, and runs through its Workflow. The registry says which three, and the linter says whether the note ended up right.==
This is the map for `30_Order`. For voice see [[HUMAN_WRITING]]; for where a note goes see [[40_Resources/Obsidian/Jarvis Vault Architecture]]. This folder holds the shape of every note and nothing else: no knowledge, no course material, no attachments.
## The parts
- **[[Note Type Registry]]** lists every note family with its tier, folder, and kit. Start here.
- **`Standards/`** are the rules for a family: the machine-readable Spec (keys, values, headings, folder), what each heading holds, how older shapes upgrade (Legacy Shapes), and a real Gold Standard Example. [[Frontmatter Standard]] is the one vocabulary for `type` and `status`.
- **`Templates/`** are the empty scaffold: the Spec's keys and headings with one comment line each, no example prose, and the title and dates from Templater.
- **`Workflows/`** are the repeated process around a note: when it is made, what updates it, what it links to next. A family without a repeated process has no Workflow.
- **`System/`** documents the tooling that runs the vault, one record per component ([[System Component Standard]]). [[Vault Lint]] lives here.
## Writing a note
1. Find the family in the registry. No row means no kit: write the note to `60_Claude/00_Inbox/`, or build the kit first ([[Building a Note Kit]]).
2. Copy the Template, read the Standard, follow the Workflow.
3. Before saving, run [[Vault Lint]] on the path. A new note must fit.
## Touching an old note
Most notes predate their Standard. Whenever a session opens one, it brings the note to its Standard in the same edit ([[Conformance on Touch]], [[Editing Standard]]). That is how the vault reaches the 90% fit target of [[Conformance Standard]] without a bulk rewrite.
## Folders
- **`Standards/`**: the foundation policies and cross-cutting Standards sit at the root. `Courses/` holds UMN class note types. `Internship/` holds the career and application pipeline. `Enrich/` holds deepening and reference notes. `Ingestion/` turns raw capture into briefs and actions. `AI Loop/` holds how AI agents operate in the vault: tool selection ([[Tool Calls]]), coordination ([[Orchestration]]), memory ([[Memory Management]]), conversation capture ([[Conversations]]), the raw-to-knowledge decision ([[Knowledge Noting]]), review layers ([[Review System]], [[Per Project Review]]), logs ([[Logs]]), and Graphify mirrors ([[Graphify Notes]]). `Operations/` (daily, periodic, plan, dashboard) and `Projects/` are created when their first Standard is written.
- **`Templates/`**: `Classes/`, `Career/`, `AI Toolkit/`, `Capability/`, `Enumerate/`, `Frontmatter/`, `System/`. `Projects/` and `Knowledge/` are created when needed.
- **`Workflows/`**: `Courses/`, `Internship/`, `Enrichment/`, `Ingestion/`, `Toolkit/`, `System/`. `Operations/` is created when needed. [[00_Workflows Index]] lists them.
## Naming
`X Standard` pairs with `X Template` and `X Workflow`, using the same X where practical. No two files here share a name, because wikilinks resolve by name. Never leave a file created and empty; an empty file with a real name looks finished in a directory listing.
## Adding a note type
Follow [[Building a Note Kit]]: Standard first, then Template, then a Workflow only if the process repeats. Register the family, lint it, and create one real note from the Template.
