---
type: plan
status: active
created: 2026-09-15
updated: 2026-09-15
tags:
  - plan
  - fall2026
  - leetcode
  - codepath
  - interviews
notes:
  - "[[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan|Fall 2026 Plan]]"
  - "[[20_Progress/Degree/_Courses/Technical Interview/Technical Interview|Technical Interview]]"
  - "[[10_Areas/Life/Plans/Summer 2026/LeetCode & CSCI 4041|LeetCode & CSCI 4041 (closed)]]"
next: "[[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan|Fall 2026 Plan]]"
---
# LeetCode & CodePath — Fall 2026

==The daily engine for the track that converts an application into an offer.== This is the tracker `Technical Interview.md`'s own Cadence section names as a real open task: "no Fall daily-log tracker exists yet... building a new tracker with a different accountability hook is a real open task." This is that tracker.

## Why this file has a different accountability hook than Summer's

[[10_Areas/Life/Plans/Summer 2026/LeetCode & CSCI 4041|Summer's version]] had the same daily-log design and zero rows filled in across the entire summer, per its own `[!WARNING]`. The design wasn't the problem; nothing checked it. This file is wired into two things that actually run without being remembered: `/closeday`'s Fall Ops Scorecard (the `leetcode-codepath` row is one of four things scored every day, GREEN requires ≥5), and `/weekly-review`'s Step 2, which reads this file's daily log every Sunday and flags it explicitly if the count is short. The log only works if both commands actually run — see [[10_Areas/Life/Plans/Fall 2026/Anti-Drift Rules|Anti-Drift Rules]] for what happens if they don't.

## 1. What this covers

Two tracks, one daily floor:
1. **CodePath TIP103** — the real 12-week cohort, Tue/Thu 7-9pm, starting the week of 2026-09-14. Grading is HackerRank-only: pass ≥30/60 per unit, complete ≥6 of 12 units, up to 2 attempts each. Full syllabus: [[20_Progress/Degree/_Courses/Technical Interview/Technical Interview|Technical Interview]].
2. **LeetCode, daily** — ≥5/day, no fixed weekly target confirmed by CodePath itself, but ≥35/week matches the old Summer floor and stays the working number until told otherwise.

## 2. TIP103 unit tracker

Pass = ≥30/60 on the HackerRank assessment. Course completion needs 6 of the first 10 (11-12 are optional stretch units).

| Unit | HackerRank Topic | Attempts used (0-2) | Status | Date passed |
|---|---|:---:|---|---|
| 1 | Strings and arrays | 0 | not started | |
| 2 | Dictionaries | 0 | not started | |
| 3 | Stacks, queues, two pointer | 0 | not started | |
| 4 | Review of units 1-3 | 0 | not started | |
| 5 | Linked lists I, OOP | 0 | not started | |
| 6 | Linked lists II, Recursion I | 0 | not started | |
| 7 | Recursion II | 0 | not started | |
| 8 | Binary trees I | 0 | not started | |
| 9 | Binary trees II | 0 | not started | |
| 10 | Graphs | 0 | not started | |
| 11 | Matrices (stretch) | 0 | not started | |
| 12 | Dynamic Programming (stretch) | 0 | not started | |

## 3. Company rotation

Same mechanism as Summer, not Summer-specific content: rotate Google → Amazon → Meta weekly for tagged practice, sourced from `leetcode-companywise-interview-questions` and `interview-company-wise-problems` (catalogued in [[Repos]]). This only covers FAANG-style tagging — the real dossier targets in `10_Areas/Career/Internships/Tracker/` skew forward-deployed/quant (Palantir, HRT, Virtu, Chicago Trading, Marshall Wace), which lean on live coding and math/probability more than tagged sets. That gap isn't covered here; it's a System Design / case-prep gap, tracked separately once System Design starts.

## 4. Daily Log

Append one row per day. Redo date schedules spaced repetition for anything that needed a hint or felt shaky.

| Date | Count | Topics | Problem IDs | TIP103 unit | Company | Difficulty | Redo date |
| ---- | :---: | ------ | ----------- | ------------ | ------- | ---------- | --------- |
| | | | | | | | |

### Weekly totals (target ≥35/week)

| Week of | Total solved | TIP103 unit(s) worked | Company drilled |
|---|:---:|---|---|
| 2026-09-14 | | | Google |
| 2026-09-21 | | | Amazon |
| 2026-09-28 | | | Meta |

## 5. Pre-interview cram list

Once an interview is scheduled, fill this 48h before: every TIP103 unit not yet passed, plus any LeetCode pattern below comfortable recall, ordered by the target company's tag.

- [ ]

## 6. Wiring

- `/startday` reads this file's current weekly count to fill the Fall Daily Floor's LeetCode/CodePath row topic.
- `/closeday` writes `lc_count` into the daily note and expects a same-day row appended here — if the row's missing, the count is unverified.
- `/weekly-review` (Step 2) reads the Weekly totals table every Sunday and flags this file if it's still empty.
