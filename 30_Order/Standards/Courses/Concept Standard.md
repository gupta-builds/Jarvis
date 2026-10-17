---
type: system
status: sprout
created: 2026-06-01
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: course-concept
tier: 1
maps_to:
  - "[[Concept Template]]"
used_by:
  - "[[Concept Workflow]]"
gold_standard: "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Arrays and Strings|Arrays and Strings]]"
notes:
  - "[[Summary to Distilled]]"
  - "[[HUMAN_WRITING]]"
---
# Concept Standard
==A concept note answers four questions in order (what is it, how does it work, what is it not, where has it shown up) and earns its keep on the third and fourth.==
This is the standard for a course `concept` note: a definition that will return on an exam, in an interview, or in another course. A weekly or textbook note records what a source said; a concept note records what you understand and can use. A concept that belongs to a project or tool, not a course, is a different family in [[Note Type Registry]].
## Spec
```json
{
  "family": "course-concept",
  "tier": 1,
  "match": {"type": "concept", "kind": null, "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "course", "mastery_level", "prerequisites", "used_in", "evidence"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "course": "wikilink", "mastery_level": "number", "prerequisites": "list", "used_in": "list", "evidence": "list"},
  "headings": ["One-Line Answer", "Mechanism", "Contrast / What It Is Not", "Failure Modes / Misconceptions", "Evidence From This Vault", "Flashcards"],
  "optional_headings": ["Start Here"]
}
```
## Headings
### Frontmatter
`course` is a quoted wikilink to the course Board. `mastery_level` is a bare number from 0 to 10. `prerequisites`, `used_in`, and `evidence` are wikilink lists, `[]` until real. `tags: [concept]`. Optional: `track` (list), `notes`. Move `status` from `seed` to `sprout` once the mechanism is written, and to `tree` after it survives an exam or a project.
> [!WARNING]
> Filling `evidence:` with notes that do not exist. Leave it `[]` rather than fake it.
### One-Line Answer
The concept in one sentence you would say to a peer, wrapped in a single `==highlight==`. This is the anchor of the note.
*Density:* one sentence.
> [!WARNING]
> A textbook definition copied verbatim, or two sentences.
### Start Here
Optional. A tiny worked example (a snippet, numbers, a case) read before the mechanism.
### Mechanism
How it works, not what it is. State the inputs or state, the causal sequence, the invariants and assumptions, the output, complexity or limits where relevant, one source-grounded example, and where it stops working. Programming concepts add code shape, types, and test implications. Math and AI concepts add conditions, representation, and the decision procedure. Bold the named parts and use `$...$` for notation.
*Density:* the core of the note, enough to use the concept without reopening the source.
> [!WARNING]
> Listing features instead of the driving mechanism.
### Contrast / What It Is Not
The nearest concept it gets confused with and the line between them. Skip it only when nothing is genuinely confusable.
*Density:* one to three contrasts, each naming the pair.
> [!WARNING]
> Omitting this section because it is the hardest to write.
### Failure Modes / Misconceptions
Where the concept breaks or where people get it wrong. Name the wrong belief and the correction, and anchor it with a `> [!WARNING]` callout.
### Evidence From This Vault
Verified wikilinks to the lecture week, textbook chapter, lab, or homework where the concept actually appeared. Check each link before writing it.
> [!WARNING]
> An empty section, or links to notes that do not exist.
### Flashcards
Three to eight cards on `#cards/<course-slug>` that test the mechanism and the contrast, not the label.
### Provenance
Every claim traces to a real source. Label inference as `Inferred` and unresolved questions as open. NotebookLM output is an input to check, not an authority.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| Definition, 30-Second Explanation, Mental Model, Complexity, Contrast With, Where It Appears, Common Mistakes, Diagnostic Questions, Teach It To A Beginner, Mini-Test (about 24 notes in CSCI 2041, MGMT 3001, and others) | The six headings above | Judgment: Definition to One-Line Answer, Mental Model and Complexity to Mechanism, Contrast With to Contrast, Common Mistakes to Failure Modes, Where It Appears to Evidence, the rest to Flashcards |
| MOC, Definition, Core Ideas (Textbook), Core Ideas (Lecture), Proof / Reasoning Toolkit, Complexity + Tradeoffs, Canonical Examples, Practice Map (CSCI 4041 algorithm notes) | The six headings above | Judgment: Core Ideas and Proof to Mechanism, Practice Map to Evidence |
| `## ==Definition==` | `## One-Line Answer` with the highlight inside | Mechanical |
| `mastery (1/10): 0` or `mastery_level: "0"` | `mastery_level: 0` | Mechanical |
| `course: MGMT 3001` as plain text | Quoted wikilink to the Board | Mechanical |
| `related:`, `topics:` | `notes:`, `tags:` | Mechanical |
| `week:`, `chapters:`, `prev:`, `next:` | Remove; the links belong in `evidence:` | Mechanical |
| `status: complete` or `evergreen` | `tree` | Mechanical |
| A week summary typed `concept` (CSCI 2033 `Concepts_new/Week_N`) | A week note per [[Weekly Standard]] | Judgment |
## Done Conditions
- The note explains how the concept works and what it is not, not only what it is.
- One highlight (the One-Line Answer); the contrast and the failure modes are both specific.
- Every `evidence:` and Evidence link resolves to a real note.
- Three to eight mechanism or contrast cards sit on the right deck.
- The note passes [[Vault Lint]] for the `course-concept` family.
## Gold Standard Example
[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Arrays and Strings|Arrays and Strings]]: all six headings, a worked example in Start Here, and a mechanism that names its own failure boundary. It still carries a quoted `mastery_level` and a `related:` list, which the Legacy Shapes table rewrites.
