---
type: index
status: sprout
created: 2025-12-25
updated: 2026-09-15
tags:
  - moc
notes:
  - "[[Fall'26 Syllabus]]"
  - "[[APAS]]"
  - "[[Every Week]]"
  - "[[ENGL 1004 Board]]"
  - "[[CSCI 4511W Board]]"
  - "[[CSCI 4061 Board]]"
  - "[[CSCI 5304 Board]]"
  - "[[MGMT 3015 Board]]"
  - "[[CSCI 4521 Board]]"
  - "[[CSCI 4041 Board]]"
  - "[[CSCI 2033 Board]]"
next: Fill Week/Lecture-N synthesis notes as each real session happens - the Board/Preparation/Textbook Map layer is complete for all six Fall'26 classes as of 2026-09-15; the weekly lecture-capture layer is what's now behind
---
# Degree — How This Folder Works
This is the one note that governs everything created under `20_Progress/Degree/`. Every class folder here carries its own `<Course> Board` note; this note is the layer above those, tying the semester's coursework back to [[APAS]] — the actual degree-completion tracker — instead of treating each class as an island.
## Map
Each class folder holds one `<Course Code> Board` note as its single point of truth for that course: source-of-truth path into `10_Areas/UMN/Classes/`, syllabus status, grading breakdown, and the full dated schedule. [[Fall'26 Syllabus]] is the semester-level board — it lists all six Fall'26 classes with credits and which requirement bucket each one closes, and is the `area:` anchor every Fall'26 course Board links back to.
Fall'26 is six classes — [[ENGL 1004 Board]], [[CSCI 4511W Board]] (replaced CSCI 3081W 2026-09-09), [[CSCI 4061 Board]], [[CSCI 5304 Board]], [[MGMT 3015 Board]], and [[CSCI 4521 Board]]. As of 2026-09-15 all six have a real, dated, syllabus/Canvas-sourced Schedule section and a `[!IMPORTANT]` Source of Truth callout naming the exact `10_Areas/UMN/Classes/` folder to check when anything here seems stale - none are placeholder `seed` notes anymore. [[CSCI 4041 Board]] and [[CSCI 2033 Board]] are `archived` — both completed with an A, both already hold weekly synthesis notes, and both got the same source-of-truth treatment so a future session can find their original course material without guessing.
[[APAS]] is the actual plan. It carries the full credit ledger, the Lib Ed and Major requirement buckets, and exactly which class closes which gap. Every Fall'26 Board note states in its opening line which APAS bucket that specific class closes — that sentence is the reason the class exists in this semester's schedule, not filler. [[Fall'26 Syllabus]]'s own "Path to Graduation" section extends this past F26 into the Fall'27 target.
## Standards this folder follows
New class material should not invent its own shape. [[Weekly Standard]] governs weekly lecture-synthesis notes once a course starts meeting. `30_Order/Templates/Classes/` holds templates for homework, labs, discussions, projects, and exam sheets. A course Board note is not a Dataview shell — it states, in prose, what's known and what's still missing, per [[MOC Standard]]'s same "map, not index" logic even though Boards use `type: class` rather than `type: index`.
## Status
As of 2026-09-15: **the Board/Preparation/Textbook Map layer is complete and real for all six Fall'26 classes** - full grading breakdowns, full dated schedules (including CSCI 4511W's complete syllabus+Modules pull and CSCI 4521's real professor-provided schedule, both closed 2026-09-15), and every course's real source folder path. **The weekly lecture-capture layer is what's behind**: Weekly/Lecture Board index notes now exist for all five courses that use one (ENGL 1004 has no weekly layer by design, tracked instead via its 12 journal entries), but the individual `Week - N.md`/`Lecture - N.md` files themselves are still empty or minimally started - see each course's own Weekly Board `## Status` line for the exact count. 2 folders (`CSCI 4041`, `CSCI 2033`) are `archived` — course complete, grade posted, source-of-truth path recorded for future review.
The Fall'26 semester-wide schedule lives in `Fall'26 Semester Calendar.xlsx` at `10_Areas/UMN/Plan/In Semester Review/` — fully populated for all six courses as of 2026-09-15, cross-verified against each course's Board note. The same calendar also lives natively in Obsidian at [[Every Week]] — a single merged, chronological, linkable view across all six courses (recurring items collapsed to one pattern row, one-off due dates listed individually with real dates/times).
## Dataview
```dataview
TABLE status, input_kind, updated
FROM "20_Progress/Degree"
WHERE type = "class"
SORT status ASC, file.name ASC
```
