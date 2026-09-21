---
type: evergreen
status: sprout
created: 2026-09-20
updated: 2026-09-20
tags:
  - system
  - standards
notes:
  - "[[Textbook Map Template]]"
---
# Textbook Map Standard
==The textbook map is a navigation and coverage ledger, not a place to hide chapter summaries.==
This standard governs `Textbook Map Template.md`. It answers which source sections belong to the course, which chapter notes exist, what is next, and where the schedule or source corpus is incomplete.
## Frontmatter and scope
Keep `type: index`, `status`, dates, `tags`, `notes`, and `next`. State the course, textbook edition, and source location in `## Purpose`. If a course uses multiple books or a standalone paper, distinguish them explicitly.
## Purpose
Name the authoritative textbook/source and explain how to read the map. Record the mapping rule used: chapter/section, module, week, or assignment. Do not imply that a locally available PDF is assigned unless the Board or syllabus confirms it.
## Map
Use one row or bullet per assigned chapter/section/module. Each entry should include the source section, a path-qualified link to its chapter note, the course week/lecture it supports, the due/reading date if verified, and status (`not started`, `prepared`, `captured`, `reconciled`, or `needs review`). A chapter may map to multiple weeks; retain those links instead of duplicating chapter content.
When an assignment or lecture uses a section not on the published schedule, add it as `source-discovered` and flag it for user verification. When the source has gaps, preserve the gap.
## Status
Summarize coverage: notes created, notes awaiting NotebookLM output, notes awaiting Obsidian arrangement, notes awaiting lecture reconciliation, and unresolved source/schedule questions. The status section should make the next production step obvious.
## Relationship to textbook notes
Textbook notes are produced from the textbook source and the user's established NotebookLM prompt. The map must not reproduce their content. When a NotebookLM output arrives, first land it in the correct chapter note, then update this map's status and the weekly/concept queues.
## Dataview
Keep the query at the bottom. Replace the placeholder source path with the actual course folder and ensure the query's `input_kind: book` matches the textbook note frontmatter. Do not add a query that points at a guessed folder.
## Update triggers
Update when the syllabus/modules schedule changes, a chapter note lands, a source is found to be missing/duplicate, or lecture reveals that a different section was actually used. Do not reorder the map merely for aesthetic reasons if doing so obscures schedule order.
## Done conditions
- Every assigned source section has one clear map entry.
- Each chapter link is verified and path-qualified where needed.
- Reading dates/modules and unresolved gaps are visible.
- The map contains navigation/status only, not duplicated chapter prose.
- The Dataview path and `input_kind` are correct.

