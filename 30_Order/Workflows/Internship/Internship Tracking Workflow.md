---
type: system
status: sprout
created: 2026-09-04
updated: 2026-10-16
tags:
  - system
  - workflow
  - internship
  - tracking
system_kind: workflow
serves: "[[Internship Tracker Standard]]"
trigger: A deadline changes, preparation starts, an application is submitted, or an outcome lands.
notes:
  - "[[Internship Pipeline]]"
  - "[[Internship Loop Review Standard]]"
  - "[[Applying Standard]]"
---
# Internship Tracking Workflow
Keep a Tracker note true after it is created, using four events that already happen in the pipeline instead of a cadence of its own.
## Use when
One of the four events below happens, or on the Friday pass over `Applying/_This Week.md`.
## Steps
1. **Deadline changes.** When the Program note's `deadline_posted` or `deadline_real` changes, copy it to the Tracker's `deadline` in the same sitting.
2. **Tailor starts.** The Tracker stays in `Current/`. Rewrite `Next Action` to the next real move in the Tailor sequence.
3. **Submission.** Move `Current/` to `Applied/` and set `date_applied` in the same sitting that the Applying note's `stage` becomes `Applied`.
4. **Outcome lands.** Move `Applied/` to `Result/`, set `date_result` and `result` to the word on the Applying note (`Offer`, `Rejected`, `Withdrawn`, or `Missed`), and set `status: complete`.
5. **Friday pass.** For each `Current/` Tracker with a near deadline, confirm `Next Action` is still true and its date has not passed.
6. **Monthly cross-check.** When the Monthly Promotion Review's Per-Program Trace finds a stalled Tracker, name it as a missed Friday check, not just a fix.
## Do not
Do not open a Tracker without a trigger. Do not create trackers here; that is Pipeline step 3. Do not edit the Dashboard from here.
## Done when
- Every `Current/` Tracker has been touched at a trigger since its last real state change.
- No Tracker's folder disagrees with its Applying note's `stage` beyond the sitting in which the change happened.
