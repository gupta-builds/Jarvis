---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: output
tier: 1
maps_to:
  - "[[Output Template]]"
  - "[[Output Bullet Template]]"
  - "[[Output One-Pager Template]]"
used_by:
  - "[[Output with Provenance]]"
gold_standard: "[[Observability Debugging Story]]"
notes:
  - "[[Evergreen Standard]]"
  - "[[HUMAN_WRITING]]"
---
# Output Standard
==An output is something you hand to another person or system, so every claim in it must trace back to a vault note.==
This is the standard for deliverables made from understanding: an interview story, a portfolio bullet, a one-page project brief. A distilled note teaches you ([[Evergreen Standard]]); an output is judged by an outsider. There is no Outputs folder. An output lives next to the project it serves, for example `20_Progress/Projects/Research/BOOM/`. Prompts, posts, and other kinds have no notes yet and get a Spec when the first one exists; resumes and cover letters are in the internship Standards.
## Spec
```json
{
  "family": "output-story",
  "tier": 1,
  "template": "Output Template",
  "match": {"type": "output", "kind": "story", "path": "^20_Progress/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "output_kind", "source_concepts"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "source_concepts": "list"},
  "headings": ["STAR Format", "Why This Story Works"],
  "optional_headings": [],
  "legacy_match": [{"type": "output", "where": {"output_kind": "interview-story"}}]
}
```
```json
{
  "family": "output-bullet",
  "tier": 1,
  "template": "Output Bullet Template",
  "match": {"type": "output", "kind": "bullet", "path": "^20_Progress/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "output_kind", "source_concepts"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "source_concepts": "list"},
  "headings": ["Portfolio Bullet", "Quantified Impact"],
  "optional_headings": [],
  "legacy_match": [{"type": "output", "where": {"output_kind": "portfolio-bullet"}}]
}
```
```json
{
  "family": "output-one-pager",
  "tier": 1,
  "template": "Output One-Pager Template",
  "match": {"type": "output", "kind": "one-pager", "path": "^20_Progress/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "output_kind", "source_concepts"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "source_concepts": "list"},
  "headings": ["Problem", "Scope", "Architecture", "Stack", "Success Criteria", "Timeline"],
  "optional_headings": ["Honest Assessment"],
  "legacy_match": [{"type": "output", "where": {"output_kind": "project-brief"}}]
}
```
## Headings
### Frontmatter
`type: output`, `output_kind` (`story`, `bullet`, or `one-pager`), `status: seed` until reviewed, and `source_concepts`, the list of vault notes every claim comes from. An output with empty `source_concepts` is a claim with no backing.
> [!WARNING]
> Links in `source_concepts` to notes that do not exist. Verify each one.
### Story
`STAR Format` holds `### Situation`, `### Task`, `### Action`, `### Result`, each concrete and specific to the project. `Why This Story Works` lists three or four reasons an interviewer would care.
### Bullet
`Portfolio Bullet` is the bold project line with one dense paragraph and a `**Stack**` line. `Quantified Impact` lists measurable facts, not adjectives.
### One-pager
`Problem`, `Scope`, `Architecture`, `Stack`, `Success Criteria`, and `Timeline`, plus `Honest Assessment` where the work is partial.
*Density:* short enough to read in a minute. No filler or inflation ([[HUMAN_WRITING]]).
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `output_kind: interview-story`, `portfolio-bullet`, `project-brief` | `story`, `bullet`, `one-pager` | mechanical |
| An output in `40_Resources/CS/Concepts` (`Kafka Pipeline Architecture Story`) | Move next to its project | judgment, needs a yes |
| `output_kind: project-brief` on a tool hub (`Stocks Trading AI Hub`) | Not an output; retype `reference` with `reference_kind: link-hub` | judgment |
| Outputs the Output Index was meant to list | The index never existed; use a Dataview over `type: output` | none |
| `track` as a list or empty | Keep optional | none |
## Done Conditions
- The kind's headings are all present and a stranger could read it cleanly.
- `source_concepts` lists real notes that support every claim.
- The note sits next to its project, not in a library.
- The note passes [[Vault Lint]] for its kind.
## Gold Standard Example
[[Observability Debugging Story]]: a full STAR account of the BOOM tracing work with a "why this story works" list. It still uses the legacy `interview-story` kind.
