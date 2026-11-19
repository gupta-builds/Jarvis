---
type: system
status: sprout
created: 2026-11-19
updated: 2026-11-19
tags:
  - system
  - standards
system_kind: standard
family: course-quiz
tier: 1
maps_to:
  - "[[Quiz Template]]"
used_by:
  - "[[Quiz Workflow]]"
gold_standard: none
notes:
  - "[[Exam Material Standard]]"
  - "[[Homework Standard]]"
  - "[[Concept Standard]]"
---
# Quiz Standard
==A quiz note keeps the real questions with worked solutions and ties each one to the notes that teach it, so a miss becomes a link to follow, not a grade to forget.==
This is the standard for one graded quiz that has already happened (`class_kind: quiz`), at `<Course>/Quizzes/Quiz - N.md`. Its companion is the quiz cheatsheet at `Quiz - N Cheatsheet.md`, an `exam-material` note ([[Exam Material Standard]]) written before the quiz and kept after it. A graded quiz copy in a course with a scope-and-format exam day stays under [[Homework Standard]]. No gold standard exists yet. The first CSCI 4521 note that passes review becomes it.
## Spec
```json
{
  "family": "course-quiz",
  "tier": 1,
  "match": {"type": "class", "kind": "quiz", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "class_kind", "status", "created", "updated", "tags", "area", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "area": "list"},
  "headings": ["Scope", "Questions and Solutions", "Mistakes and Gaps"],
  "optional_headings": ["Flashcards"],
  "legacy_match": []
}
```
## Headings
### Frontmatter
`class_kind: quiz`, `status: seed` until the solutions are checked, `sprout` once Mistakes and Gaps is filled. `area` links the course Board, the Quizzes board and the cheatsheet. `tags: [class, quiz]`. Optional keys `quiz_n` (number) and `score` (`earned/total`) feed the study tracker.
### Scope
Three or four sentences: quiz number and date, the lectures and readings it covered as links, where the questions came from (the returned quiz or the instructor solution file, named), and what it did not cover.
> [!WARNING]
> Questions paraphrased so loosely that they could not be re-asked. Quote the stem, and say when a figure or table is omitted.
### Questions and Solutions
One `###` per question, numbered as printed. Each has the question, the solution with its reasoning step by step, and a `*Sources:*` line linking the week, textbook note, lecture slide or notebook, homework and concept that teach it, with a section or page where known. Add a `> [!EXPLAIN]` callout under any step that needs one.
*Density:* the solution a student could redo cold, not only the answer.
> [!WARNING]
> An answer with no reasoning, or a source link to a note that does not exist.
### Mistakes and Gaps
Per miss: the cause (content, reasoning, misreading, timing or confidence), the correction, the concept to repair as a link, and the next action. If your answers were not recorded, list the questions you were unsure of as `- [ ]` tasks and say the answers were not supplied. This section drives the study tracker.
### Flashcards
Optional. One card on `#cards/<course-slug>` per real miss or struggle, never one per question.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| Graded quiz copy typed homework in a course with a Quizzes folder | `class_kind: quiz` | Judgment |
| Solutions only, with no Scope | Add Scope and Mistakes and Gaps around them | Judgment |
## Done Conditions
- Scope names the quiz, the weeks it covered and the source of the questions.
- Every question has a worked solution and at least one real source link.
- Mistakes and Gaps exists and each concept to repair is a link.
- The note passes [[Vault Lint]] for `course-quiz`.
## Gold Standard Example
None yet.
