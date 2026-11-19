---
type: system
status: sprout
created: 2026-09-20
updated: 2026-11-19
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
Land each assigned chapter as a short, source-checked note before the related lecture, so concept preparation can get ahead of class.
## Use when
The Textbook Map lists the section as assigned and the PDF or other authoritative source is available.
## Steps
1. Read [[Textbook Standard]], the course Board and the Map entry. Confirm the edition, section range, week and local source file. If the source is missing, record a task and ask. Never write from memory.
2. Extract the pages with [[PDF Extraction]] (`mineru-pdf.ps1 -Pages`) and read that Markdown, never the PDF. Note the page of every figure, listing and exercise.
3. Size the scope. One prompt covers about 10 book pages or one section group, never a whole chapter. A chapter that would pass 3,000 words becomes parts, each with its own prompt and note.
4. Run the prompt from [[Repetitive Things]], one Notebook chat per chapter. Treat the output as draft, and use what lands instead of rewriting it from the model's own knowledge.
5. Check definitions, equations, examples and pages against the extraction. Move anything uncertain to Open Questions.
6. Create the note from [[Textbook Template]]: source header, Reading Guide of page-level `- [ ]` tasks, summary, concepts, reading notes in source order and a worked example. Add a `> [!EXPLAIN]` callout under each hard topic and no flashcards.
7. Link the week and the Map entry, and update the Map status. Create concepts only through [[Concept Workflow]].
8. After lecture, add a dated correction with attribution. Then run [[Vault Lint]], which warns on cards, over 3,000 words and missing headings.
## Do not
Do not paste NotebookLM output blind, add flashcards, or pass the word budget. Stop and ask when the schedule and syllabus disagree.
## Done when
- The note is source-checked, under budget, and tells the reader what to read, look at and try.
- Links and Map status are updated.
