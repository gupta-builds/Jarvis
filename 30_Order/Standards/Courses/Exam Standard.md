---
type: system
status: sprout
created: 2026-09-08
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: course-exam
tier: 1
maps_to:
  - "[[Exam Sheet Template]]"
used_by:
  - "[[Exam Workflow]]"
gold_standard: none
notes:
  - "[[Exam Material Standard]]"
  - "[[Homework Standard]]"
---
# Exam Standard
==An exam sheet is worth less for the cramming it holds than for the reflection it holds after: the post-exam section is what improves the next exam.==
This is the standard for the sheet of one midterm, final, or long quiz (`class_kind: exam`). It does two jobs at two times: before the exam it fixes the real scope and format, and after results it records exactly what was missed and why. Study banks, drill sets, and review maps are a different family ([[Exam Material Standard]]); graded quiz copies stay under [[Homework Standard]].
## Spec
```json
{
  "family": "course-exam",
  "tier": 1,
  "match": {"type": "class", "kind": "exam", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "class_kind", "status", "created", "updated", "tags", "area", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "area": "list", "deadline": "date"},
  "headings": ["Topics Covered", "Format & Resources Allowed", "Study Plan"],
  "optional_headings": ["Post-Exam Reflection"],
  "legacy_match": [
    {"type": "class", "where": {"input_kind": "exam"}, "absent": ["class_kind"]}
  ]
}
```
## Headings
### Frontmatter
`class_kind: exam`, `status: seed` while studying and `sprout` once the Post-Exam Reflection is written. `area` lists the course Board and the week and chapter notes the exam covers. Add `deadline` (the exam date) only when a source gives it. `tags: [class, exam]`.
> [!WARNING]
> An empty `area`. The sheet loses its link to the weeks it is meant to review.
### Topics Covered
The exam's scope from the syllabus, the instructor's announcement, or the review sheet, never a guess. Link each topic to its week or chapter note. Separate confirmed, unconfirmed, and out-of-scope material.
*Density:* every named topic, each with a real link.
> [!WARNING]
> "Everything so far." A midterm rarely covers all of it.
### Format & Resources Allowed
Exam type, time limit, collaboration, permitted notes and tools, page limits, submission method, and late or makeup rules. Write `Unverified` and name the source to check when a rule is unknown. Rules do not transfer between assessments: CSCI 4511W short quizzes are open-resource and open-collaboration, while long quizzes are individual, 45 minutes, and limited to two pages of personal notes.
*Density:* short and factual, taken from the course Board.
### Study Plan
Worked backward from the date: scope check, concept-note strengthening, flashcards, active problem solving, timed format-matched practice, final error review. Real days, real tasks, hardest topics first.
> [!WARNING]
> "Review everything the night before."
### Post-Exam Reflection
Optional until results return. For each meaningful miss: the question or topic, the attempted approach, the cause (content gap, misreading, timing, confidence, or process), the correction, and the next action. Link the correction to the concept or homework note, and add a card only when the gap is reusable.
*Density:* one entry per meaningful miss, or the pattern when no breakdown exists.
> [!WARNING]
> Leaving it as a placeholder because the exam is over.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `input_kind: exam` | `class_kind: exam` | Mechanical |
| `tags: ["#class", "#Exam"]` | `tags: [class, exam]` | Mechanical |
| Print-notes sheet or theme hub (CSCI 2041 Midterm, BIOL Theme 4 notes) | `class_kind: exam-material` with a Scope line | Judgment |
| Policy page (HIST 1103 Exams: format, timing, penalties) | Format & Resources Allowed, plus Topics Covered from the syllabus | Judgment |
| Midterm or Final with no `input_kind` and no headings (CSCI 2021, CSCI 2033) | Leave under the course archive decision | Judgment |
| Empty `Midterm - 1` | Fill from the Template once the scope is announced | Judgment |
## Done Conditions
- Topics Covered and Format & Resources Allowed were filled in before the exam, not reconstructed after.
- Every unknown rule says `Unverified` and names its source.
- The Study Plan has a day-by-day shape.
- Post-Exam Reflection is written within a day or two of results, and only then is `status` `sprout`.
- The note passes [[Vault Lint]] for `course-exam`.
## Gold Standard Example
None yet. No exam sheet in the vault has both halves filled in under this shape. Name the first one here.
