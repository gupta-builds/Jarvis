---
type: evergreen
status: sprout
created: 2026-09-20
updated: 2026-09-20
tags:
  - system
  - workflow
notes:
  - "[[Textbook Standard]]"
  - "[[Textbook Template]]"
  - "[[Textbook Map Workflow]]"
  - "[[Course Production Workflow]]"
---
# Textbook Workflow
Use this when a textbook chapter/section is assigned and its source PDF or other authoritative material is available. The note must land before the related lecture whenever possible so concept preparation can get ahead of class.
## Steps
1. Read [[Textbook Standard]], [[Textbook Template]], the course Board, and the Textbook Map entry.
2. Confirm the book title/edition, chapter/section, assigned date, local source file, and source hierarchy. If the source is missing, create only a marked preparation task and ask for the source; do not write from memory.
3. Use the user's established repetitive NotebookLM prompt on the correct landed source. Preserve the prompt's substantive coverage, but treat its output as draft source material requiring checking.
4. Check definitions, claims, equations, examples, caveats, and section boundaries against the textbook/source. Mark uncertain or missing material; never silently repair with general knowledge.
5. Arrange the result in Obsidian: valid frontmatter, useful headings, exactly one chapter-summary highlight, readable code/math, deliberate callouts, concise paragraphs, real wikilinks, and no duplicated generic prose.
6. Fill Key Concepts, Examples Worth Keeping, Connections, and mechanism/contrast flashcards. Link the matching week and create/update concepts only through [[Concept Workflow]].
7. Update the Textbook Map status and seed the weekly pre-lecture note. After lecture, add only the actual lecture delta/correction; do not overwrite textbook source content to match an ambiguous capture.
## Failure checks
Stop and ask for clarification when the assignment mapping conflicts with the syllabus, the NotebookLM output contains unsupported claims, the chapter identity is ambiguous, or a link would resolve to another course.
## Done when
- The note is source-checked, readable, and mapped to the correct week/section.
- NotebookLM output has been transformed rather than blindly pasted.
- Concepts, links, cards, map status, and the pre-lecture queue are updated.

