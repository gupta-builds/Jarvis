---
type: system
status: sprout
created: 2026-10-16
updated: 2026-11-07
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
This is the Standard for `concept` notes outside the course folders: tool and technique explainers in `20_Progress/Projects/`, and the SAO training notes in `40_Resources/UMN/SAO/`. The mechanism, contrast, and provenance rules are in [[Concept Standard]] and are not repeated here. It is not a product design doc, a machine runbook, or a distilled note ([[Evergreen Standard]]); those that were typed `concept` are other families.
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

| Item | Rule |
|---|---|
| Allowed folders | `20_Progress/Projects/` (not `CS/Portfolio`), `20_Progress/Internship/`, `40_Resources/CS/` (not `Concepts/New Laptop`), or `40_Resources/UMN/SAO/`. |
| File name | The tool or technique (`Ollama`). Unique in the vault. |
| Kind | `type: concept`, no kind key. |
| Status | `seed` on first write, `sprout` once Mechanism is verified on this machine, `tree` once it has been reused. |
## Headings
### Frontmatter
- **Write:** `type: concept`, `track` (the domain list: `ai`, `systems`, `trading`, `career`), `used_in` (the projects that apply it) and `evidence` (notes that prove it), both `[]` until real. Optional: `notes`, `source_url`.
- **Length:** one line per key.
- **Never:** course-template leftovers: `course:`, `mastery_level`, `topics`, placeholder links such as `[[HW__ - ...]]`. `track:` left blank is also wrong; it is a list.
- **Right:** None yet.
- **Wrong:** `course:`
### One-Line Answer
- **Write:** what the thing is and when you reach for it, wrapped in a single `==highlight==`.
- **Length:** one sentence.
- **Never:** a definition heading ("Definition") in its place.
- **Right:** `Complete the ==event proposal and budget proposal together== for each event you're requesting funding for`
- **Wrong:** `## Definition`
### Mechanism
- **Write:** how it works: inputs, the sequence, the limits, and one real example from a project here. For a tool, include the install or run state you verified.
- **Length:** enough to use the tool without reopening the docs.
- **Never:** a list of resources in its place.
- **Right:** None yet.
- **Wrong:** `## Resources`
### Contrast / What It Is Not
- **Write:** the nearest tool or idea it is confused with, and the line between them. A pair and a boundary, not a feature list.
- **Length:** one to three sentences.
- **Never:** a feature list.
- **Right:** None yet.
- **Wrong:** None seen.
### Failure Modes / Misconceptions
- **Write:** a real way it fails or is misused, anchored with a `> [!WARNING]`.
- **Length:** one to three modes.
- **Never:** "Common mistakes" with no mistake named.
- **Right:** None yet.
- **Wrong:** `## Common mistakes`
### Evidence From This Vault
- **Write:** verified links to the project note, run, or session where it was used.
- **Length:** one to five links, each with a clause.
- **Never:** a link to a note that does not exist, or a `## MOC` section in its place.
- **Right:** None yet.
- **Wrong:** `## MOC`
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| The five headings appear in order and none is empty | A reader and a skill find sections by name | Lint, check 2 |
| `track`, `used_in`, and `evidence` are lists | The capability queries read them as lists | Lint, check 1 |
| No course keys: `course`, `mastery_level`, `topics` | A tool explainer is not a course concept | Reader |
| Every `evidence` link resolves | A dead link is an unproven claim | Lint, check 3 |
| Flashcards are optional | A tool explainer is often looked up, not studied | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| MOC, Definition, Resources, AI Summary, Common mistakes, Mini-test (Jan, Ollama, Cursor AI, Gen AI days, ABB Interview Prep) | One-Line Answer, Mechanism, Contrast, Failure Modes, Evidence | Judgment |
| `course:`, `mastery (1/10)`, `topics`, `related` | Remove; `related` becomes `notes` | Mechanical |
| Blank `course:` and `mastery_level: 0` on the SAO training notes (26) | Remove both; keep their One-Line Answer | Mechanical |
| `track:` blank, not a list (26 SAO notes) | A list: `track: [career]` | Mechanical |
| SAO notes that copy a training page under one heading | Add Mechanism and Evidence, or retype `reference` | Judgment |
| TradingView research notes typed `concept` (Core Conclusion, Data Principle) | `type: reference`, `reference_kind: research` | Judgment |
## Done Conditions
- No course keys; `track`, `used_in`, and `evidence` are lists.
- The five headings are present and specific, and the contrast names a real pair.
- Every `evidence` link resolves.
- The note passes [[Vault Lint]] for `technical-concept`.
## Gold Standard Example
None yet. No note outside the courses follows this shape. 25 of the 26 SAO training notes have a One-Line Answer and source text but no Mechanism, Contrast, Failure Modes, or Evidence.
Measured 2026-11-07 with `--family technical-concept`: 43 notes, 0 pass.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| Application Process | `40_Resources/UMN/SAO/Training Course/` | A One-Line Answer with a highlight | Four headings; course keys; `track` is not a list |
| Ollama | `20_Progress/Projects/AI Use/` | A tool explainer | Not read in full; typed `concept` |
