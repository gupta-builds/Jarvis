---
type: system
status: sprout
created: 2026-09-20
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: course-board
tier: 1
maps_to:
  - "[[Board or Main Template]]"
used_by:
  - "[[Board Workflow]]"
gold_standard: "[[20_Progress/Degree/CSCI 4511W/CSCI 4511W Board|CSCI 4511W Board]]"
notes:
  - "[[Weekly Board Standard]]"
  - "[[Degree Control Standard]]"
---
# Board Standard
==The course Board is the verified control center: it tells an agent what the course is, where the truth lives, what is due, and what is still uncertain.==
This is the standard for the one Board of a course (`class_kind: board`), the note every other note of that course links back to. It is not a diary, a copied syllabus, or a substitute for weekly, textbook, concept, assignment, or exam notes. Boards of the term and of the degree are [[Degree Control Standard]]; the indexes under a course are [[Weekly Board Standard]].
## Spec
```json
{
  "family": "course-board",
  "tier": 1,
  "match": {"type": "class", "kind": "board", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "class_kind", "status", "created", "updated", "tags", "area", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "area": "list"},
  "headings": ["Source of Truth", "Instructor & Logistics", "Required Materials", "Course Description", "Learning Objectives", "Grading Breakdown", "Weekly Schedule", "Resources", "Verification Notes"],
  "optional_headings": ["Prerequisites", "Current State"],
  "legacy_match": [
    {"type": "class", "where": {"input_kind": "board"}, "absent": ["class_kind"]}
  ]
}
```
## Headings
### Frontmatter
`class_kind: board`, `status: seed` until the source, schedule, and course structure are checked, then `sprout`. `area` links the term syllabus and the degree audit. `next` holds the next unresolved verification or production action. `tags: [class, board]`.
### Source of Truth
Time-sensitive facts come from, in order: the live syllabus, the learning-management pages, instructor announcements, and the local course source folder. Older vault notes are context, not proof. Name each source, what it controls, the folder path, and the date checked. If two sources disagree, keep both claims with dates, mark the conflict, and ask which controls.
> [!WARNING]
> Silently choosing between conflicting deadlines, weights, or meeting times.
### Instructor & Logistics
Instructor, staff, meetings, locations, office hours, and channels, only when verified. Keep unknowns visible. A pattern in due dates is not a confirmed meeting time.
### Required Materials
Only what is required or clearly assigned, separated from recommended and locally available. Link the textbook map and local files that exist.
### Course Description
The catalog description in compact wording. Put stated prerequisites under the optional `Prerequisites` heading and label inferred ones.
### Learning Objectives
Testable abilities with verbs such as explain, implement, compare, derive.
### Grading Breakdown
Weights, counts, submission, collaboration, and late rules exact enough to drive preparation. Check that percentages and counts reconcile, and link out to the Homework, Project, and Exam notes for the detail.
### Weekly Schedule
Every known week and date mapped to reading, lecture, discussion, assignment, quiz, and exam. Never invent a missing date.
### Resources
Links to the textbook map, weekly board, preparation note, source folder, active assignments, and concept board. Check each link before writing it. Use path-qualified links where week or chapter names collide across courses.
### Verification Notes
What was checked, when, what is still uncertain, and what would resolve it. A Board that shows its unknowns is healthier than one that hides them.
### Current State
Optional. A short dated block of live status (current grade ceiling, next lab status). Replace it, never append; it is not a diary.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `input_kind: board` | `class_kind: board` | Mechanical |
| `tags: ["#class"]` | `tags: [class, board]` | Mechanical |
| `Instructor & TAs`, `Instructor & Course Staff`, `Instructor & TA` | `Instructor & Logistics` | Mechanical |
| `Textbook`, `Textbooks`, `Required Textbook` | `Required Materials` | Mechanical |
| `Grading`, `Grading Criteria` | `Grading Breakdown` | Mechanical |
| `Schedule`, `Important Dates` | `Weekly Schedule` | Judgment |
| `Catalog Info`, `What This Course Actually Covers`, `Course Goals` | `Course Description` | Judgment |
| `Lab 5 status`, `Current Grade` blocks | `Current State`, dated | Judgment |
| Short Dataview hub board of an archived course (Labs, Projects, Lectures, Exams queries plus a MOC) | Leave until the course archive is decided; rebuild with the nine headings if the course returns | Judgment |
| Term syllabus typed `board` (Fall'26 Syllabus, Spring'26 Syllabus) | `class_kind: control` | Judgment |
## Done Conditions
- The source hierarchy, source folder, and check date are explicit.
- Dates, weights, counts, and policies are source-grounded; unknowns and inferences are labeled.
- The schedule accounts for every known teaching and assessment event.
- Links to the course's note layers resolve and point to real notes.
- `next` names the next concrete verification or production action.
- The note passes [[Vault Lint]] for `course-board`.
## Gold Standard Example
[[20_Progress/Degree/CSCI 4511W/CSCI 4511W Board|CSCI 4511W Board]]: dated source updates, a catalog and objectives layer, a full grading and assessment breakdown, and Verification Notes. It still uses the older heading names and `input_kind`, which the Legacy Shapes table maps.
