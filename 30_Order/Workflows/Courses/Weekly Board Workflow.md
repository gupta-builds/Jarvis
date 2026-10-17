---
type: system
status: sprout
created: 2026-09-20
updated: 2026-10-16
tags:
  - system
  - workflow
system_kind: workflow
serves: "[[Weekly Board Standard]]"
trigger: A week is scheduled, a layer's note is created or updated, or a course layer needs an honest freshness check.
notes:
  - "[[Weekly Board Template]]"
  - "[[Course Production Workflow]]"
---
# Weekly Board Workflow
Keep a course layer's index honest about what exists, what is current, and what is missing.
## Use when
A week is scheduled, a weekly, concept, project, or reading note is created or updated, or the layer's coverage needs a freshness check.
## Steps
1. Read [[Weekly Board Standard]] and find the course's real folder for the layer, including a flat legacy layout.
2. Create the board from [[Weekly Board Template]] if it is missing, with `class_kind: subboard` and the course Board first in `notes`.
3. Add one entry per expected item in order. For weeks, include holidays, exams, split weeks, and weeks awaiting capture.
4. Link the real note and write one sentence on what it covers and how it connects to the neighbor.
5. Set each week's state only from its own lifecycle: pre-lecture scaffold, live capture pending, captured, reconciled, or review-ready.
6. Write Status: ahead, current, behind, or blocked, with the earliest incomplete item in `next`.
7. Check the Dataview query against the real folder, and filter on both `class_kind` and the legacy `input_kind` until the notes are migrated.
8. Run [[Vault Lint]] on the path.
## Do not
Do not call the layer current because empty stubs exist, and do not write a second lecture summary here.
## Done when
- Every expected item appears once with a real link.
- Missing capture, sources, and reconciliation are visible.
- The query returns the intended notes.
