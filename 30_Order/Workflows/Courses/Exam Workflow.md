---
type: evergreen
status: sprout
created: 2026-09-08
updated: 2026-09-08
tags:
  - system
  - workflow
notes:
  - "[[Exam Standard]]"
  - "[[00_Workflows Index]]"
---
# Exam Workflow
Two separate passes on the same note, at two different times — build the study half before the exam, and do not consider the note finished until the reflection half is filled in after grades come back.
**Use when:** an exam is announced (create the note, start the study half) and again when results are returned (finish the note, write the reflection half).
**Moves:** syllabus exam-scope info + the course's own week/chapter notes → `<Course>/Exam/` (or wherever the course files exams), one note per exam.
**Template:** [[Exam Sheet Template]]
## Steps
1. Read [[Exam Standard]] before writing — it governs the note this workflow creates.
2. As soon as an exam is announced, create the note from [[Exam Sheet Template]] and fill in Topics Covered and Format & Resources Allowed straight from the syllabus or the professor's review announcement — do not guess scope.
3. Build the Study Plan working backward from the exam date, hardest topics first.
4. Sit the exam.
5. The same day results come back, fill in Post-Exam Reflection — what was actually missed and why, not a general impression.
6. If a pattern emerges (a topic type that keeps costing points, a time-management issue), carry that forward explicitly into the next exam note's Study Plan rather than leaving it buried in this one's reflection.
## Frontmatter to set
```yaml
type: class
input_kind: exam
status: seed
```
## Done when
- Topics Covered and Format & Resources Allowed were filled in before the exam, not reconstructed after.
- Post-Exam Reflection is filled in within a day or two of grades posting.
- `status` moved to `sprout` once the reflection half exists.
