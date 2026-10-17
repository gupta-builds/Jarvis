---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: technical-concept
tier: 1
maps_to:
  - "[[Technical Concept Template]]"
used_by: []
gold_standard: none
notes:
  - "[[Concept Standard]]"
  - "[[Evergreen Standard]]"
---
# Technical Concept Standard
==A concept that belongs to a tool, project, or resource instead of a course gets the same four answers as a course concept: what it is, how it works, what it is not, where it appeared.==
This is the standard for `concept` notes outside the course folders: tool and technique explainers in `20_Progress/Projects/`, and the SAO training notes in `40_Resources/UMN/SAO/`. The mechanism, contrast, and provenance rules are in [[Concept Standard]] and are not repeated here. What changes is the frontmatter: no `course`, no `mastery_level`. Product design docs and machine runbooks that were typed `concept` are other families.
## Spec
```json
{
  "family": "technical-concept",
  "tier": 1,
  "match": {"type": "concept", "kind": null, "path": "^(20_Progress/Projects/(?!CS/Portfolio)|20_Progress/Internship/|40_Resources/CS/(?!Concepts/New Laptop)|40_Resources/UMN/SAO/)", "strict_path": true, "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "track", "used_in", "evidence"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "track": "list", "used_in": "list", "evidence": "list"},
  "headings": ["One-Line Answer", "Mechanism", "Contrast / What It Is Not", "Failure Modes / Misconceptions", "Evidence From This Vault"],
  "optional_headings": ["Start Here", "Flashcards"]
}
```
## Headings
### Frontmatter
`type: concept`. `track` is the domain list (`ai`, `systems`, `trading`, `career`). `used_in` links the projects that apply it and `evidence` links notes that prove it, both `[]` until real. Optional: `notes`, `source_url`. Flashcards are optional here because a tool explainer is often looked up, not studied.
> [!WARNING]
> Course-template leftovers: `course:`, `mastery (1/10)`, `topics`, and placeholder links such as `[[HW__ - ...]]`. Jan still carries all three.
### One-Line Answer
One sentence, wrapped in a single `==highlight==`: what the thing is and when you reach for it.
### Mechanism
How it works: inputs, the sequence, the limits, and one real example from a project here. For a tool, include the install or run state you actually verified.
*Density:* enough to use the tool without reopening the docs.
### Contrast / What It Is Not
The nearest tool or idea it is confused with, and the line between them. A pair and a boundary, not a feature list.
### Failure Modes / Misconceptions
A real way it fails or is misused, anchored with a `> [!WARNING]`.
### Evidence From This Vault
Verified links to the project note, run, or session where it was used.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| MOC, Definition, Resources, AI Summary, Common mistakes, Mini-test (Jan, Ollama, Cursor AI, Gen AI days) | One-Line Answer, Mechanism, Contrast, Failure Modes, Evidence | Judgment |
| `course:`, `mastery (1/10)`, `topics`, `related` | Remove; `related` becomes `notes` | Mechanical |
| Blank `course:` and `mastery_level: 0` on the SAO training notes | Remove both; keep their One-Line Answer | Mechanical |
| SAO notes that copy a training page under one heading | Add Mechanism and Evidence, or retype `reference` | Judgment |
| TradingView research notes typed `concept` (Core Conclusion, Data Principle) | `type: reference`, `reference_kind: research` | Judgment |
## Done Conditions
- No course keys; `track`, `used_in`, and `evidence` are lists.
- The five headings are present and specific, and the contrast names a real pair.
- Every `evidence` link resolves.
- The note passes [[Vault Lint]] for `technical-concept`.
## Gold Standard Example
None yet. No note outside the courses follows this shape; the 26 SAO training notes come closest, with a One-Line Answer and source text but no Mechanism, Contrast, or Evidence.
