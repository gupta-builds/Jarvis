---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: course-exam-material
tier: 1
maps_to:
  - "[[Exam Material Template]]"
used_by:
  - "[[Exam Workflow]]"
gold_standard: "[[40_Resources/UMN/Previous Classes/Lib Ed/BIOL 1012/Theme 4/Theme 4 Prediction Drill Bank|Theme 4 Prediction Drill Bank]]"
notes:
  - "[[Exam Standard]]"
  - "[[Homework Standard]]"
---
# Exam Material Standard
==Exam material tests you instead of holding what you read: every item has a source, an answer you can mark, and a place in the exam's real scope.==
This is the standard for study material built for an assessment: drill banks, practice sets with solutions, review maps, and print-notes sheets (`class_kind: exam-material`). The sheet for one exam is [[Exam Standard]]. Graded quiz copies and practice-quiz copies (MATH 2230 `Quiz - N`, `Practice Quiz - N`) are typed homework today and stay under [[Homework Standard]].
## Spec
```json
{
  "family": "course-exam-material",
  "tier": 1,
  "match": {"type": "class", "kind": "exam-material", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "class_kind", "status", "created", "updated", "tags", "area", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "area": "list"},
  "headings": ["Scope"],
  "optional_headings": ["Items", "Answer Key", "Flashcards"],
  "legacy_match": [
    {"type": "class", "where": {"input_kind": "exam-practice"}, "absent": ["class_kind"]},
    {"type": "class", "where": {"input_kind": "review"}, "absent": ["class_kind"]},
    {"type": "class", "path": "/Theme 4/", "where": {"input_kind": "exam"}},
    {"type": "class", "path": "CSCI 2041/Midterm\\.md$", "where": {"input_kind": "exam"}}
  ]
}
```
## Headings
### Frontmatter
`class_kind: exam-material`, `status: seed` until the items have been used once, then `sprout`. `area` links the course Board and the exam sheet it supports. `tags: [class, exam-material]`.
> [!WARNING]
> No link to the exam sheet or the weeks covered. The bank cannot then be checked against the real scope.
### Scope
One short paragraph: which exam or theme this prepares for, where the items came from (instructor practice set, textbook, past quiz, or self-written), and which weeks or chapters it covers, as links. State plainly what is not covered.
*Density:* three or four sentences.
> [!WARNING]
> Self-written items presented as instructor questions. Say which is which.
### Items
Optional. The questions, drills, or worked examples, grouped by topic, each numbered. A drill gives the situation and asks for a prediction or a mechanism, not a definition (the BIOL Theme 4 bank has 40 numbered drills in topic groups).
### Answer Key
Optional. Answers kept apart from items so the bank can be used cold. Each answer shows the reasoning, not only the result.
### Flashcards
Optional. Cards on `#cards/<course-slug>` for the gaps the bank exposed, not for every item.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `input_kind: exam-practice` or `review` | `class_kind: exam-material` | Mechanical |
| `input_kind: exam` on a drill bank, hub, or practice set (BIOL Theme 4) | `class_kind: exam-material` | Mechanical |
| Print-notes sheet (CSCI 2041 Midterm: topic reference, no Scope) | Add a Scope paragraph | Judgment |
| Solutions only (`Solution 1` to `Solution 5`) | Items and Answer Key headings around them | Judgment |
| `tags: ["#class", "#exam"]` | `tags: [class, exam-material]` | Mechanical |
| Quiz copy typed homework | Stays homework | None |
## Done Conditions
- A Scope paragraph names the exam, the source of the items, and the weeks covered.
- Items and answers are separate, and answers show reasoning.
- The note links to the exam sheet it supports.
- The note passes [[Vault Lint]] for `course-exam-material`.
## Gold Standard Example
[[40_Resources/UMN/Previous Classes/Lib Ed/BIOL 1012/Theme 4/Theme 4 Prediction Drill Bank|Theme 4 Prediction Drill Bank]]: 40 numbered drills in topic groups plus flashcards. It still carries `input_kind: exam` and has no Scope paragraph, which the Legacy Shapes table adds.
