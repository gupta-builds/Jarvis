---
type: evergreen
status: sprout
created: 2026-09-20
updated: 2026-09-20
tags:
  - system
  - standards
notes:
  - "[[Weekly Board Template]]"
---
# Weekly Board Standard
==The Weekly Board is the course's chronological index and freshness check; it points to weekly notes but never replaces them.==
This standard governs `Weekly Board Template.md`. Keep it separate from [[Weekly Standard]], which governs the content inside each week note.
## Frontmatter and purpose
Keep `type: index`, dates, `tags: [moc]`, `notes`, and `next`. State the course folder and explain that detailed lecture capture, textbook integration, concepts, and flashcards belong in weekly notes. Link the Weekly Board from the course Board and link each week back to this index when the course convention supports it.
## Map
Add one chronological entry per week. Each entry must link to the real week note and give a compact description of the teaching arc, source coverage, and connection to the prior/next week. Include whether the week is pre-lecture scaffold, live-capture pending, captured, reconciled, or review-ready. Do not write a second lecture summary here.
If the course has a week with no class, holiday, exam, or split schedule, record that explicitly rather than skipping the number. Preserve unusual names such as `Week - 1 & 2` when they match the course files.
## Status
State whether the weekly layer is ahead, current, behind, or blocked. Identify the earliest incomplete week and the exact missing source or action. A weekly board is `current` only when each recent week has lecture capture reconciled against the textbook/source materials—not merely because a stub exists.
## Lifecycle and live lecture rule
Create the week note before the lecture from the schedule, landed textbook note, slides/PDFs, code, and other available course files. During class the user's live notes belong in the week note's `## Lecture` header. After class, agents may add structure, links, and synthesis around that capture, but may not delete, overwrite, or silently rewrite the human capture. Update the board only after the week note's status accurately reflects this lifecycle.
## Dataview
Keep the query at the bottom and replace the placeholder path with the course's real `Weekly` folder or flat legacy course folder. The query must match `input_kind: lecture`. Verify it returns the intended notes before declaring the index working.
## Done conditions
- Every expected week is represented exactly once.
- Each entry links to a real weekly note and has a useful one-sentence map.
- Missing capture, source, reconciliation, and verification work are visible.
- The board does not duplicate detailed content from weekly notes.
- Its Dataview query points at the correct course folder.
