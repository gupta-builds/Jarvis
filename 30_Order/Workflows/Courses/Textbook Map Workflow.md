---
type: system
status: sprout
created: 2026-09-20
updated: 2026-10-16
tags:
  - system
  - workflow
system_kind: workflow
serves: "[[Textbook Map Standard]]"
trigger: A course starts, the schedule changes, a source lands, or a chapter note is produced.
notes:
  - "[[Textbook Map Template]]"
  - "[[Textbook Workflow]]"
  - "[[Course Production Workflow]]"
---
# Textbook Map Workflow
Keep one map per course that shows what to read, what exists, and what is still unverified.
## Use when
A course starts, the syllabus or modules schedule changes, a new textbook lands, or a chapter note is produced.
## Steps
1. Read [[Textbook Map Standard]], the Board schedule, and the course's source inventory.
2. Create the map from [[Textbook Map Template]] if none exists. In Purpose, record the edition and the mapping rule.
3. List every assigned chapter, section, or module in course order, each with a path-qualified link to its chapter note, the matching week, and the verified reading date.
4. Set each entry to `not started`, `prepared`, `captured`, `reconciled`, or `needs review`. Add sections found only in lecture or assignments as `source-discovered`.
5. When a chapter note lands, update its entry and queue the concept and weekly preparation. When lecture reveals a changed section, keep the old mapping and record the correction in Status.
6. Run [[Vault Lint]] on the path and fix what it reports.
## Do not
Do not copy chapter prose into the map, reorder it in a way that hides schedule order, or point the Dataview at a guessed folder.
## Done when
- Assigned sections and gaps are visible and every link resolves to the right course.
- The map tells the next session what to read, create, or verify.
