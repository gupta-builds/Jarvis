---
type: system
system_kind: guide
status: sprout
created: 2026-11-19
updated: 2026-11-19
tags:
  - system
  - tooling
notes:
  - "[[Vault Lint]]"
  - "[[Textbook Standard]]"
  - "[[Quiz Standard]]"
---
# Course Status
A read-only script that reports a course's study state from its notes, so an agent never opens the notes to find out what is missing. Run `node 30_Order/System/course-tools/course-status.js "CSCI 4521"` (add `--week N` to override the calendar week, `--json` for machine output). It writes nothing.
## What it reports
- Weeks written against the calendar week, the weeks still missing, whether any `Live lecture capture` exists, and the `Takeaways` tasks done out of total.
- Textbook notes over the 3,000-word budget, how many have a Reading Guide and EXPLAIN callouts, the Reading Guide tasks done out of total, and any cards in a textbook note (should be zero).
- Each quiz's status, score and `Mistakes and Gaps` tasks done out of total.
- Cards on week, concept and quiz notes, and how many carry a spaced-repetition review marker (`<!--SR:`). A card with no marker has never been reviewed.
- The [[Vault Lint]] fit for the course folder.
## What it cannot know
It counts ticked boxes and review markers. It cannot tell whether a note was understood, so the `coach` agent tests that by asking questions. Calendar week assumes Week 1 starts 2026-09-07.
## Who uses it
The `coach` agent runs it first in `/study-check`, and `professor` runs it before routing course work.
