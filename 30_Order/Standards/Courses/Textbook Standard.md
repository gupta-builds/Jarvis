---
type: system
status: sprout
created: 2026-09-20
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: course-textbook
tier: 1
maps_to:
  - "[[Textbook Template]]"
used_by:
  - "[[Textbook Workflow]]"
gold_standard: "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]]"
notes:
  - "[[Textbook Map Standard]]"
  - "[[Weekly Standard]]"
---
# Textbook Standard
==A textbook note turns a verified chapter or section into a navigable explanation of its mechanism, examples, connections, and retrieval questions. It is not a raw export or a decorative summary.==
This is the standard for a chapter or section note at `<Course>/Textbook/Chapter - N.md`, usually produced from the repeated NotebookLM prompt in [[Repetitive Things]] and then arranged and checked in Obsidian. The index of all chapters is the Textbook Map, covered by [[Textbook Map Standard]]. NotebookLM is a transformation aid, not the source of truth: never state an unverified NotebookLM claim as a textbook fact.
## Spec
```json
{
  "family": "course-textbook",
  "tier": 1,
  "match": {"type": "class", "kind": "textbook", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "class_kind", "status", "created", "updated", "tags", "area", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "area": "list"},
  "headings": ["Chapter Summary", "Key Concepts", "Full Reading Notes", "Worked Example", "Connections", "Open Questions", "Flashcards"],
  "optional_headings": [],
  "legacy_match": [
    {"type": "class", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/(?!.*Textbook Map)", "where": {"input_kind": "book"}, "absent": ["class_kind"]},
    {"type": "input", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/", "where": {"input_kind": "book"}}
  ]
}
```
## Headings
### Frontmatter and source header
`class_kind: textbook`, `status`, `area` linking the course Board and the Textbook Map, `tags: [class, textbook]`, and `next`. Use the real edition and chapter identity, and path-qualify links so `Chapter - 1` never resolves to another course. Directly under the title, three bold lines: `**Source:**` (book, edition, chapter, pages), `**Read from:**` (the local file), `**Course role:**` (the week it supports and what lecture uses it for).
### Chapter Summary
The chapter's central claim in one sentence with exactly one `==highlight==`, then `*Mechanism:*`: what problem the chapter solves, the entities and assumptions, the procedure or model, and the result or limit.
> [!WARNING]
> Opening with generic praise for the book instead of the claim.
### Key Concepts
Each concept defined in context, its role in the chapter, and the condition or contrast that prevents misuse. Bold the first occurrence. Keep equations and code semantics and explain the notation.
> [!WARNING]
> An unconnected glossary.
### Full Reading Notes
The chapter section by section as `###` headings that follow the source's own order, with page anchors where known. This is where the detail lives.
### Worked Example
Source-grounded worked examples, numbers, counterexamples, or code traces that make the mechanism stick, with why each matters and what changes under a different assumption. Never invent an example and present it as the book's.
### Connections
Links to the real lecture week, the Textbook Map entry, and concept notes. State what the textbook adds to lecture, what lecture makes concrete, and what a lab or assignment tests.
### Open Questions
Unverified or missing material as `- [ ]` tasks. Mark uncertain NotebookLM output here instead of repairing it from memory.
### Flashcards
Three to eight atomic cards on `#cards/<course-slug>` testing definitions in context, conditions, mechanisms, and contrasts.
### Reconciliation
Before lecture the note is a source-grounded preparation artifact. After lecture, add a dated correction with attribution; do not rewrite the textbook account to fit an ambiguous capture. If the professor's convention differs from the book, state both and which applies.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `Examples Worth Keeping` | `Worked Example` | Mechanical rename |
| A second `Chapter Summary` or duplicated sections (CSCI 4061 Chapter - 3) | Merge into one section each | Judgment |
| Overview, Core Definitions, Main Algorithms, Correctness Ideas, Complexity, Lecture Emphasis, Examples, Common Pitfalls, Review Checklist (about 14 CSCI 4041-style notes) | Chapter Summary and Key Concepts, Full Reading Notes, Worked Example, Connections | Judgment |
| `Summary Links`, `Links` | `Connections` | Mechanical rename |
| `input_kind: book` | `class_kind: textbook` | Mechanical |
| `type: input`, `input_kind: book` (F'25 CSAPP notes) | `type: class`, `class_kind: textbook` | Judgment |
| `tags: ["#class", "#Textbook"]` | `tags: [class, textbook]` | Mechanical |
## Done Conditions
- Edition, chapter, pages, and schedule mapping are recorded in the source header.
- NotebookLM output was checked against the source and arranged, not pasted blind.
- One summary highlight, a real mechanism, and contextual key concepts are present.
- Links and cards point to real notes, and unknowns are open questions.
## Gold Standard Example
[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]]: the source header, all seven headings, page-anchored concepts, and a lecture connection.
