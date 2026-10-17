---
type: system
status: sprout
created: 2026-09-20
updated: 2026-10-16
tags:
  - system
  - workflow
system_kind: workflow
serves: "[[Textbook Standard]]"
trigger: A textbook chapter or section is assigned and its source file has landed in the course folder.
notes:
  - "[[Textbook Template]]"
  - "[[Textbook Map Workflow]]"
  - "[[Repetitive Things]]"
  - "[[Course Production Workflow]]"
---
# Textbook Workflow
Land each assigned chapter as a source-checked note before the related lecture, so concept preparation can get ahead of class.
## Use when
The Textbook Map lists the section as assigned and the PDF or other authoritative source is available.
## Steps
1. Read [[Textbook Standard]], the course Board, and the Map entry. Confirm the title, edition, chapter or section, assigned date, and local source file.
2. If the source is missing, record a marked preparation task and ask for the file. Never write chapter content from memory.
3. Run the NotebookLM prompt from [[Repetitive Things]] on the landed source. Treat the output as draft material.
4. Check definitions, claims, equations, examples, and section boundaries against the source. Move anything uncertain to Open Questions; do not repair it with general knowledge.
5. Create the note from [[Textbook Template]]: fill the source header, one summary highlight, key concepts, reading notes in source order, a worked example, and mechanism and contrast cards.
6. Link the matching week and the Map entry. Create or update concepts only through [[Concept Workflow]].
7. Update the Map status and seed the week's pre-lecture note. After lecture, add a dated correction with attribution; do not overwrite the textbook account.
8. Run [[Vault Lint]] on the path and fix what it reports.
## Do not
Do not paste NotebookLM output blind, expose private source content the workflow does not need, or let a generic `Chapter - 1` link resolve to another course. Stop and ask when the schedule and syllabus disagree on the mapping.
## Done when
- The note is source-checked, readable, and mapped to the right week and section.
- Concepts, links, cards, Map status, and the pre-lecture queue are updated.
