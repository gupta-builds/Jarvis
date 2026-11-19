---
type: system
status: sprout
created: 2026-09-20
updated: 2026-11-19
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
==A textbook note explains one assigned stretch of a book in plain words and tells you exactly where to look: which pages, which figure, which code, which question. It is a reading companion, not a raw export or a second copy of the book.==
This is the standard for a chapter or section note at `<Course>/Textbook/<Book>/Chapter - N.md`, produced from the NotebookLM prompt in [[Repetitive Things]] and then arranged and checked in Obsidian. The index of all chapters is the Textbook Map ([[Textbook Map Standard]]). NotebookLM is a transformation aid: never state an unverified NotebookLM claim as a textbook fact.
## Spec
```json
{
  "family": "course-textbook",
  "tier": 1,
  "match": {"type": "class", "kind": "textbook", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "class_kind", "status", "created", "updated", "tags", "area", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "area": "list"},
  "headings": ["Chapter Summary", "Key Concepts", "Full Reading Notes", "Worked Example", "Connections", "Open Questions"],
  "optional_headings": ["Reading Guide"],
  "max_words": 3000,
  "forbid_cards": true,
  "legacy_match": [
    {"type": "class", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/(?!.*Textbook Map)", "where": {"input_kind": "book"}, "absent": ["class_kind"]},
    {"type": "input", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/", "where": {"input_kind": "book"}}
  ]
}
```
## Headings
### Frontmatter and source header
`class_kind: textbook`, `status`, `area` linking the course Board and the Textbook Map, `tags: [class, textbook]`, and `next`. Path-qualify links so `Chapter - 1` never resolves to another course. Under the title, three bold lines: `**Source:**` (book, edition, chapter, pages), `**Read from:**` (the local file), `**Course role:**` (the week it supports).
### Chapter Summary
The central claim in one sentence with exactly one `==highlight==`, then `*Mechanism:*`: the problem, the entities and assumptions, the procedure, the result or limit.
> [!WARNING]
> Opening with praise for the book instead of the claim.
### Reading Guide
Direct instructions, one `- [ ]` task each, so progress can be checked: `Read pp. 41-44 (§3.1.1)`, `Study Figure 3.1`, `Run the listing on p. 52`, `Try Exercise 3`. Each line says why. New notes carry this section; older notes gain it under [[Conformance on Touch]].
### Key Concepts
Each concept defined in context, with its role and the condition that prevents misuse. Bold the first occurrence. Keep equations and code, and explain the notation.
> [!WARNING]
> An unconnected glossary.
### Full Reading Notes
The chapter section by section as `###` headings in the source's order, with page anchors. Keep the claims, equations and named examples, and drop repetition, since the note is not a transcript. Under every hard topic, add one callout: `> [!EXPLAIN] Explanation of the above topic: ...` in two to five plain sentences, with one number or snippet. Write it after the NotebookLM output lands, from the source.
> [!WARNING]
> A callout that restates the paragraph above it in the same words.
### Worked Example
A source-grounded example, number set or code trace, with why it matters and what changes under a different assumption. Never invent one and present it as the book's.
### Connections
Links to the real lecture week, the Map entry and concept notes: what the book adds to lecture, what lecture makes concrete, what an assignment tests.
### Open Questions
Unverified or missing material as `- [ ]` tasks. Uncertain NotebookLM output goes here.
### Length and splitting
Aim for 1,500 to 2,500 words. Above 3,000, split by section range into `Chapter - N (Part 2)`, which the Map lists separately. Shrink the prompt's scope, never its formatting rules.
### No flashcards
A textbook note carries none. Cards live on week, concept, project, exam and quiz notes, and only for something you missed or struggled with.
### Reconciliation
After lecture, add a dated correction with attribution. If the professor's convention differs from the book, state both.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `Examples Worth Keeping` | `Worked Example` | Mechanical rename |
| `Flashcards` section | Deleted | Judgment: move a card to a week or concept note only if it records a real miss |
| A note over 3,000 words | Split by section range | Judgment |
| Duplicated `Chapter Summary` (CSCI 4061 Chapter - 3) | One section each | Judgment |
| Overview, Core Definitions, Lecture Emphasis, Review Checklist (CSCI 4041 notes) | Chapter Summary, Key Concepts, Full Reading Notes, Worked Example, Connections | Judgment |
| `Summary Links`, `Links` | `Connections` | Mechanical rename |
| `input_kind: book` | `class_kind: textbook` | Mechanical |
| `tags: ["#class", "#Textbook"]` | `tags: [class, textbook]` | Mechanical |
## Done Conditions
- The source header and schedule mapping are recorded and NotebookLM output was checked, not pasted blind.
- One highlight, a real mechanism, a Reading Guide with page-level tasks, and an EXPLAIN callout under each hard topic.
- No flashcards, under 3,000 words, and unknowns are open questions.
## Gold Standard Example
[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]] for shape. It predates the length budget and the Reading Guide, so a CSCI 4521 note replaces it once one lands.
