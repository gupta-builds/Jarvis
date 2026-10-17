---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: code-mirror-doc
tier: 1
maps_to:
  - "[[Code Mirror Template]]"
used_by: []
gold_standard: "[[60_Claude/40_Project_Briefs/CausalOps/Core Modules/schema|schema]]"
notes:
  - "[[Project Standard]]"
  - "[[Spec and Plan Standard]]"
---
# Code Mirror Doc Standard
==A code mirror doc explains one source file or subsystem in the vault, names the repo path it mirrors, and says when it was last checked, because the code can change and the note cannot tell.==
This is the standard for notes that document code that lives in another repo, one note per source file or subsystem (the 28 CausalOps module, architecture, event-bus, and infrastructure docs). It covers explanation, not the code itself. A spec of what the system should do is a [[Spec and Plan Standard]] note.
## Spec
```json
{
  "family": "code-mirror-doc",
  "tier": 1,
  "match": {"type": "project", "kind": "code-mirror", "path": "^60_Claude/40_Project_Briefs/CausalOps/", "where": {}, "where_not": {}},
  "legacy_match": [{"type": "project", "path": "^60_Claude/40_Project_Briefs/CausalOps/(Core Modules|Architecture|Event Bus & Coordinator|Infrastructure)/"}],
  "status": ["active", "paused", "complete", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "project_kind", "source_path", "repo"],
  "key_types": {"created": "date", "updated": "date", "tags": "list"},
  "headings": ["Related Notes"],
  "optional_headings": ["Key Functions", "Key Constants", "Invariants"]
}
```
## Headings
### Frontmatter
`project_kind: code-mirror`. `source_path` is the file or folder in the repo, for example `src/engine.py`. `repo` names the repo. `verified_commit` is optional: the commit hash the note was last checked against. `status` is `active` while the code exists and the note is maintained, `archived` when the code is removed. `aliases` may stay.
> [!WARNING]
> A second `---` frontmatter block pasted into the body, with its own `tags` and `aliases`. Eighteen CausalOps notes carry one. Merge its keys into the real frontmatter.
### Title and lead
`# filename: role` for a file, a plain name for a subsystem. The first paragraph says what the file is for and the boundary it owns. Name the repo path in it.
### Content sections
Free `##` sections that follow the code's own parts. Use these titles when the content exists: `Key Functions`, `Key Constants`, `Invariants` (what must stay true, and what breaks if it does not).
*Density:* explain behavior and contracts. Do not paste whole files.
### Related Notes
Last. Verified wikilinks to the neighboring module docs and to the plan or spec.
> [!WARNING]
> A mirror that restates code from memory. If it was not read from the repo this session, say when it was last verified.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| Body starts with a byte-order mark and a second `---` block | Merge `tags` and `aliases` into the frontmatter, delete the block and the mark | Mechanical |
| `status: sprout` | `status: active` | Mechanical |
| No `source_path` or `repo` | Fill from the title and lead paragraph | Judgment |
| No `project_kind` | `project_kind: code-mirror` | Mechanical |
| Roadmap, Index, Memory Layer, and implementation plans in the same folder | Not mirrors: `project_kind: spec` or `plan` | Judgment |
## Done Conditions
- `source_path`, `repo`, and `project_kind` are set, and the lead names the repo path.
- One frontmatter block, no `---` in the body, and `Related Notes` is last.
- A claim about behavior was checked against the repo, with `verified_commit` or a dated sentence saying when.
- The note passes [[Vault Lint]] for `code-mirror-doc`.
## Gold Standard Example
[[60_Claude/40_Project_Briefs/CausalOps/Core Modules/schema|schema]]: one file, a plain lead, the models grouped by layer, and a closing Related Notes. It still has the pasted second frontmatter block and no `source_path`, which Legacy Shapes fixes.
