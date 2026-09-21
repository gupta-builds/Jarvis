---
type: evergreen
status: sprout
created: 2026-09-20
updated: 2026-09-20
tags:
  - system
  - standards
notes:
  - "[[Textbook Template]]"
  - "[[Textbook Map Template]]"
---
# Textbook Standard
==A textbook note turns a verified chapter or section into a navigable explanation of its central mechanism, examples, connections, and retrieval questions; it is not a raw export or a decorative summary.==
This standard governs `Textbook Template.md` and applies to textbook notes produced from the user's established repetitive NotebookLM prompt, then arranged in Obsidian.
## When to create it
Create the chapter note when the textbook PDF/source has landed in the course folder and the Textbook Map identifies the section as assigned or relevant. Do not wait until after lecture. The note should be available for pre-lecture concept preparation. If the NotebookLM output is not yet available, create only a clearly marked source/preparation stub; never fill missing chapter content from memory.
## Source pipeline
1. Confirm the textbook title/edition, chapter/section, assigned schedule row, and local source file.
2. Use the user's classic NotebookLM prompt to generate the chapter explanation from the permitted source. Keep the output's substantive coverage, caveats, definitions, examples, equations, and distinctions.
3. Check the output against the source or trusted source excerpts. Mark uncertain, missing, or potentially hallucinated material for review.
4. Arrange the landed text for Obsidian: headings that match the chapter's logic, wikilinks to real course notes, readable code/math fences, concise callouts, and consistent frontmatter. This is an editorial pass, not permission to add facts.
5. Update the Textbook Map, relevant weekly scaffold, concept queue, and `next` status.
NotebookLM is a transformation aid, not the source of truth. Do not cite an unverified NotebookLM assertion as a textbook fact. Do not expose prompts or private source content when the course workflow does not require it.
## Frontmatter
Keep `type: class`, `input_kind: book`, `status`, dates, course `area`, tags, and `next`. Link the course Board, textbook map, and assigned week/chapter. Use the actual edition and chapter identity; never let a generic `Chapter - 1` link resolve to another course.
## Chapter Summary
Write the chapter's central claim in one sentence and mark exactly one `==highlight==` anchor. Follow it with a mechanism explanation: what problem the chapter solves, what entities/assumptions it uses, what procedure or model follows, and what result/limitation emerges. Do not start with generic textbook praise.
## Key Concepts
For each concept, define it in context, explain its role in the chapter, and name the condition or contrast that prevents misuse. Bold the first occurrence of the concept. Preserve equations/pseudocode/code semantics and explain notation. Do not turn the section into an unconnected glossary.
## Examples Worth Keeping
Keep source-grounded worked examples, diagrams described in words, numbers, counterexamples, cases, or code traces that make the mechanism memorable. Explain why the example matters and what would change under a different assumption. Never invent an example and present it as the textbook's.
## Connections
Link the actual lecture/week, Textbook Map, and concept notes that exist or are created. State what the textbook adds to lecture, what lecture makes concrete, and what assignment/lab tests. Do not create a forest of speculative links.
## Flashcards
Create 3–8 atomic cards on `#cards/<course-slug>` when the chapter contains stable retrieval value. Test definitions in context, conditions, mechanisms, contrasts, equations, edge cases, and application—not only chapter headings. Later, add cards from lecture corrections and exam misses in the relevant concept notes.
## Quality and reconciliation
Before lecture, the note is a source-grounded preparation artifact. After lecture, do not overwrite the textbook account to match an ambiguous live note. Add a dated lecture connection or correction and preserve source attribution. If professor convention differs from the textbook, state both and explain which applies in this course.
## Done conditions
- Correct source/edition/section and schedule mapping are recorded.
- NotebookLM output has been source-checked and arranged, not blindly pasted.
- Exactly one summary highlight and a real mechanism are present.
- Key concepts include contextual definitions, contrasts, and examples.
- Links and cards point to real notes and the map/status are updated.
- Unknowns are marked rather than filled by memory.

