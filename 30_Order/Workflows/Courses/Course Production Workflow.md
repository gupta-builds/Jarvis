---
type: evergreen
status: sprout
created: 2026-09-20
updated: 2026-09-20
tags:
  - system
  - workflow
notes:
  - "[[Board Standard]]"
  - "[[Weekly Standard]]"
  - "[[Textbook Standard]]"
  - "[[Concept Standard]]"
  - "[[Homework Standard]]"
  - "[[00_Workflows Index]]"
---
# Course Production Workflow
This is the orchestration workflow for building a course knowledge system. Read it first, then read the workflow for the note type being created. Standards define what good content contains; this workflow defines the order in which source material becomes connected notes.
## The production loop
```text
Board/source inventory
  -> textbook map and schedule
  -> textbook note from landed source / NotebookLM output
  -> pre-lecture weekly scaffold
  -> concept notes from the week's available sources
  -> live lecture capture in the weekly Lecture section
  -> post-lecture reconciliation
  -> assignments, discussion, lab, and project notes
  -> concept/flashcard enrichment
  -> exam practice and reflection
```
Do not skip backward links: a new note must connect to its source, its week, and the assessment or concept layer it serves.
## Start-of-course or course-reset pass
1. Read the course Board, Preparation note, local source-folder instructions, relevant templates, and course standards.
2. Confirm the source hierarchy, textbook/edition, schedule, grading, assessment rules, and destination folder from authoritative sources.
3. Create or repair the Textbook Map and Weekly Board before producing large note batches.
4. Inventory missing source files, empty course folders, and unresolved questions. Do not fill gaps from memory.
5. Set `next` to the earliest concrete production or verification action.
## Weekly production pass
1. Read the schedule row for the target week and identify all assigned textbook sections, slides/PDFs, notebooks/code, discussions, labs, and deadlines.
2. Land or verify the textbook note before lecture. Use the established NotebookLM prompt for textbook extraction, then perform the source-check and Obsidian arrangement required by [[Textbook Workflow]].
3. Create the weekly note before lecture. Put prepared slide/source notes in its `## Lecture` area and label them `Pre-lecture source notes`.
4. Create/update concept notes for the scheduled material before lecture. Link them from the week and mark anything that must be verified in class.
5. During lecture, the user writes live capture in that same `## Lecture` area. Preserve the capture; do not replace it with an agent-generated transcript.
6. After lecture, reconcile the live capture with textbook, slides/PDFs, code, assignments, and concept notes. Update only the notes affected by actual emphasis, correction, or evidence.
7. Process that week's discussion, lab, homework, project, or quiz notes using their specific workflows.
8. Update the Weekly Board, Textbook Map, course Board, concept evidence, flashcards, and `next` only after links and statuses are accurate.
## Assessment and exam pass
Create assessment notes when assigned, not after submission. Track requirements, collaboration, hidden secondary deadlines, actual work, evidence, feedback, and reflection. When an exam is near, strengthen the canonical concept notes first, then drill flashcards and solve format-matched questions. Do not turn every course note into a cram note.
## Source and uncertainty gate
Every factual claim must be grounded in a real course source or labeled `Inferred`/`Unresolved`. If sources conflict, preserve the conflict and ask the user or check the live authoritative source. Never invent a date, policy, code result, chapter coverage, discussion statement, or missing link to make the graph look complete.
## Completion gate
A production pass is complete only when the note is source-grounded, linked both ways, correctly filed, honest about uncertainty, and leaves a concrete `next` action when work remains.

