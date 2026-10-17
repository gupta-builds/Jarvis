---
type: system
status: sprout
created: 2026-09-15
updated: 2026-10-16
tags:
  - system
  - workflow
  - writing
system_kind: workflow
serves: "[[Decoration Standard]]"
trigger: A note's content is final and its markers have not been checked, or a rewrite just finished.
notes:
  - "[[Human Content Writer]]"
  - "[[Plugins Usage]]"
  - "[[Jarvis Writing and Formatting]]"
---
# Decoration
Add the markers to a finished note so each one carries a job, then remove the ones that do not.
## Use when
After the content is written and after any anti-slop pass. Never before: markers added to unsettled content get moved or deleted.
## Steps
1. Read [[Decoration Standard]] and open the note's own Standard for its heading names.
2. List the `##` sections. For each, pick the one definitional claim and wrap it in a single `==highlight==`. Remove any second highlight in the section, except card clozes under `## Flashcards`.
3. Bold each named concept, entity, or category label at its first introduction, and nowhere else.
4. Add `*Label:*` to each sub-group introduction.
5. Turn each real warning, caveat, or summary into the right callout type from the Standard. Merge callouts that touch, and map `INFO` to `NOTE` and `CAUTION` to `WARNING`.
6. Replace any hand-built table that a Dataview block could list ([[Plugins Usage]]), and put a text paragraph beside every embedded drawing.
7. Run points 8 to 12 of the Quality Gate in [[Jarvis Writing and Formatting]] and fix what fails.
## Do not
Do not add a marker to make a thin note look finished. Do not change a sentence's wording; if the wording is the problem, use [[Human Content Writer]].
## Done when
- Each `##` section outside `## Flashcards` has exactly one highlight.
- Every callout is a documented type and none touch.
- The Quality Gate points 8 to 12 pass.
