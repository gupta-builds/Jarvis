---
type: system
status: sprout
created: 2026-09-08
updated: 2026-10-16
tags:
  - system
  - workflow
system_kind: workflow
serves: "[[Weekly Standard]]"
trigger: A course week appears on the verified schedule, and again after its lecture.
notes:
  - "[[Week Template]]"
  - "[[Weekly Board Workflow]]"
  - "[[Textbook Workflow]]"
  - "[[Concept Workflow]]"
---
# Weekly Workflow
Keep a course's `Weekly/` folder ahead of the lecture, with the live capture protected and reconciled afterward.
## Use when
A week is scheduled and its textbook note has landed, and again right after the lecture while the material is fresh.
## Steps
1. Read [[Weekly Standard]] and the Board's schedule row. Build a source map: textbook chapter, slides or PDFs, notebooks, labs, assignments, and prior concepts.
2. Before lecture, create `Week - N` in `Weekly/` from [[Week Template]]. Put pre-lecture slide and source notes under `Lecture`, labeled `Pre-lecture source notes`.
3. During lecture, the user's live capture goes in the same section, labeled `Live lecture capture`. Agents may structure and link it afterward but never delete, overwrite, or replace it.
4. After lecture, reconcile the capture with the textbook, slides, code, and assignments. Keep disagreements as source-attributed conflicts until verified.
5. Write `Textbook integration` as the delta and `Lecture-to-textbook synthesis`. This is the step most likely to be skipped; do not skip it.
6. Add one Map sentence to the course sub-board in the same session ([[Weekly Board Workflow]]).
7. Spawn concept notes through [[Concept Workflow]], and update the Board's `next:` if the next step changed.
8. Run [[Vault Lint]] on the path and fix what it reports.
## Do not
Do not create a parallel temporary lecture note that can drift from the week note. Do not turn the week note into a cram dump near an exam; make the concept layer rich instead.
## Done when
- The note has all nine headings with real content and a synthesis section.
- The sub-board has a new Map sentence.
- Every concept the week spawned exists, not only as a stub link.
