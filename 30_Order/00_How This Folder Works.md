---
type: evergreen
status: sprout
created: 2026-09-08
updated: 2026-09-08
tags:
  - system
  - standards
notes:
  - "[[60_Claude/07_AI_Information/How to Write in This Vault|How to Write in This Vault]]"
  - "[[MOC Standard]]"
---
# 00 — How This Folder Works
This is the map for `30_Order` itself, not a tutorial on writing — see [[60_Claude/07_AI_Information/How to Write in This Vault|How to Write in This Vault]] for that.
## The Three-Way Split
- **`Standards/`** — content contracts. What must be inside a note of a given type, in what order, with what density. A Standard names its Gold Standard Example, a real note in the vault that meets the bar.
- **`Templates/`** — the empty scaffold a Standard maps to. A template has the right frontmatter and headings but no real content — filling one in and stopping there does not satisfy its Standard.
- **`Workflows/`** — the process layer. When, in a real sequence of events, a note gets created from its template, what triggers updating it later, and what it connects to next. Not every note type needs one — a Standard can exist without a matching Workflow if creation is a one-off, not a repeated process.
A Standard should always name its Template under `## Maps To` and its Workflow (if one exists) under `## Used By Workflow`. A Workflow should always name the Standard it serves. If either link is missing, that's a bug in the doc, not a stylistic choice.
## Standards Subfolders
`Standards/Courses/` — UMN class note types (concept, week, project, exam, lab). `Standards/Enrich/` — deepening existing notes (evergreen maturity, human writing, review cadence, source summaries). `Standards/Ingestion/` — turning raw capture into structured notes (briefs, actions). `Standards/Internship/` — the career/application pipeline. General, cross-cutting standards (`MOC Standard`, `Log Standard`, `Project Standard`) stay at `Standards/` root rather than a subfolder, since they apply outside any one domain.
## Naming Convention
`X Standard.md` pairs with `X Template.md` (in the matching `Templates/` subfolder) and, where a real process exists, `X Workflow.md` (in the matching `Workflows/` subfolder). The three should use the same `X` where practical — a mismatch (like the general vs. course-specific `Project Standard` that used to collide in this folder) is worth fixing the moment it's noticed, not living with.
## Adding a New Note-Type System
1. Write the Standard first — what must be in the note, per heading, with a real or explicitly-absent Gold Standard Example.
2. Write the Template — the empty scaffold the Standard maps to.
3. Write the Workflow only if there's a real repeated process around creating/updating this note type — skip it for one-off note types.
4. Cross-link all three: Standard → Template and Workflow; Workflow → Standard.
5. Never leave a Standard, Template, or Workflow file created but empty — an empty file with a real name is worse than no file, since it looks finished from a directory listing.
