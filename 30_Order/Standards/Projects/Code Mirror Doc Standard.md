---
type: system
status: sprout
created: 2026-10-16
updated: 2026-11-07
tags:
  - system
  - standards
system_kind: standard
family: code-mirror-doc
tier: 1
maps_to:
  - "[[Code File Mirror Template]]"
used_by: []
gold_standard: "[[60_Claude/40_Project_Briefs/CausalOps/Core Modules/schema|schema]]"
notes:
  - "[[Project Standard]]"
  - "[[Spec and Plan Standard]]"
---
# Code Mirror Doc Standard
==A code mirror doc explains one source file or subsystem in the vault, names the repo path it mirrors, and says when it was last checked, because the code can change and the note cannot tell.==
This is the Standard for notes that document code that lives in another repo, one note per source file or subsystem (the 28 CausalOps module, architecture, event-bus, and infrastructure docs). It covers explanation, not the code itself. It is not a spec of what the system should do ([[Spec and Plan Standard]]) and not a graphify node, which a tool writes ([[Generated Output Standard]]).
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

| Item | Rule |
|---|---|
| Allowed folders | `60_Claude/40_Project_Briefs/CausalOps/`, in the subfolder for its part (`Core Modules/`, `Architecture/`). |
| File name | The file or subsystem it explains (`schema`, `agents`, `LangGraph Pipeline`). Unique in the vault. |
| Kind | `type: project` with `project_kind: code-mirror`. |
| Status | `active` while the code exists and the note is maintained, `archived` when the code is removed. |
## Headings
### Frontmatter
- **Write:** `project_kind: code-mirror`, `source_path` (the file or folder in the repo, for example `src/engine.py`), `repo`, `status`, dates, `tags`. `verified_commit` is optional: the commit hash the note was last checked against. `aliases` may stay.
- **Length:** one line per key.
- **Never:** a second `---` frontmatter block pasted into the body with its own `tags` and `aliases`. 16 of the 28 notes have one, as `agents.md` does; merge its keys into the real frontmatter.
- **Right:** None yet.
- **Wrong:** `tags: [causalops, agents, langgraph, llm, orchestrator]`
### Title and lead
- **Write:** `# filename: role` for a file, a plain name for a subsystem. The first paragraph says what the file is for and the boundary it owns, and names the repo path.
- **Length:** one paragraph.
- **Never:** a lead that does not name the repo path.
- **Right:** `is the single source of truth for all Pydantic models and the`
- **Wrong:** None seen.
### Content sections
- **Write:** free `##` sections that follow the code's own parts. Use `Key Functions`, `Key Constants`, `Invariants` (what must stay true, and what breaks if it does not) when the content exists.
- **Length:** behavior and contracts, not whole files.
- **Never:** pasted files. A mirror restates code from memory if it was not read from the repo this session; say when it was last verified.
- **Right:** `## Three Separated Layers`
- **Wrong:** None seen.
### Related Notes
- **Write:** last. Verified wikilinks to the neighboring module docs and to the plan or spec, each with a clause.
- **Length:** three to eight links.
- **Never:** a link to a note that does not exist, or a section after it.
- **Right:** `- [[GraphState Contract]]`
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| `source_path`, `repo`, and `project_kind` are set | A mirror with no source path cannot be checked against the code | Lint, check 1 |
| Related Notes is the last heading | Readers expect the links at the end | Lint, check 2 (present only) and Reader (last) |
| One frontmatter block and no `---` in the body | A second block is read as a rule and breaks the parse | Lint, check 5 (`hr-in-body`) |
| A claim about behavior was checked against the repo, with `verified_commit` or a dated sentence saying when | The code can change and the note cannot tell | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| Body starts with a byte-order mark and a second `---` block | Merge `tags` and `aliases` into the frontmatter, delete the block and the mark | Mechanical |
| `status: sprout` (all 28) | `status: active` | Mechanical |
| No `source_path` or `repo` | Fill from the title and lead paragraph | Judgment |
| No `project_kind`, no `updated` | `project_kind: code-mirror`; add `updated` | Mechanical |
| Roadmap, Index, Memory Layer, and implementation plans in the same folder | Not mirrors: `project_kind: spec` or `plan` | Judgment |
## Done Conditions
- `source_path`, `repo`, and `project_kind` are set, and the lead names the repo path.
- One frontmatter block, no `---` in the body, and `Related Notes` is last.
- A claim about behavior was checked against the repo, with `verified_commit` or a dated sentence saying when.
- The note passes [[Vault Lint]] for `code-mirror-doc`.
## Gold Standard Example
[[60_Claude/40_Project_Briefs/CausalOps/Core Modules/schema|schema]]: one file, a plain lead, the models grouped by layer, and a closing Related Notes. It does not pass lint: `status: sprout`, no `updated`, `project_kind`, `source_path`, or `repo`, and 20 extra blank lines.
Measured 2026-11-07 with `--family code-mirror-doc`: 28 notes, 0 pass.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| schema (gold) | `60_Claude/40_Project_Briefs/CausalOps/Core Modules/` | Layered models, closing Related Notes | Five keys; a blank line after the frontmatter; 20 extra blank lines |
| agents | `60_Claude/40_Project_Briefs/CausalOps/Core Modules/` | A lead with the boundary it owns | Same keys; a second frontmatter block with its own `tags` |
