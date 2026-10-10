---
type: index
status: sprout
created: 2025-12-25
updated: 2026-10-09
tags:
  - moc
notes:
  - "[[Fall'26 Syllabus]]"
  - "[[APAS]]"
  - "[[Every Week]]"
  - "[[CSCI 4511W Board]]"
  - "[[CSCI 4061 Board]]"
  - "[[CSCI 5304 Board]]"
  - "[[MGMT 3015 Board]]"
  - "[[CSCI 4521 Board]]"
  - "[[CSCI 4041 Board]]"
  - "[[CSCI 2033 Board]]"
next: "Reconcile APAS, then compare and allocate courses for Spring 2027, Fall 2027, and Spring 2028 in Fall'26 Syllabus."
---
# Degree — How This Folder Works
This is the one note that governs everything created under `20_Progress/Degree/`. Every class folder here carries its own `<Course> Board` note; this note is the layer above those, tying the semester's coursework back to [[APAS]] — the actual degree-completion tracker — instead of treating each class as an island.
## Map
[[APAS]] owns degree-audit facts, credits, and verification gaps. [[Fall'26 Syllabus#Path to Graduation]] owns course decisions and semester allocation through **May 2028**. Four semesters remain including Fall'26; Spring'27, Fall'27, and Spring'28 are the three future planning terms.
The active Fall'26 roster is five courses: [[CSCI 4511W Board]], [[CSCI 4061 Board]], [[CSCI 5304 Board]], [[MGMT 3015 Board]], and [[CSCI 4521 Board]]. ENGL 1004 was dropped, confirmed on 2026-10-09. [[ENGL 1004 Board]] retains its inactive record; one Literature/liberal education course remains.
Each class folder holds its Board and preparation/source notes. [[Fall'26 Syllabus]] lists active courses and grading criteria; [[Every Week]] is the active calendar. Update the existing planning workspace as decisions happen.
## Standards this folder follows
New class material should not invent its own shape. [[Weekly Standard]] governs weekly lecture-synthesis notes once a course starts meeting. `30_Order/Templates/Classes/` holds templates for homework, labs, discussions, projects, and exam sheets. A course Board note is not a Dataview shell — it states, in prose, what's known and what's still missing, per [[MOC Standard]]'s same "map, not index" logic even though Boards use `type: class` rather than `type: index`.
## Status
As of 2026-10-09, five Fall'26 weeks have been completed; Week 6 starts Monday, 2026-10-12. All five retained courses are in progress. The existing Board/Preparation/Textbook Map layer is available; lecture-note coverage was not re-audited in this session.
Projected active load: 18 credits, pending confirmation of CSCI 4511W's credit value. The latest recorded official APAS audit is 2026-09-10. [[APAS#Planning reconciliation before course selection]] records allocation discrepancies to settle before course choices.
[[Every Week]] excludes ENGL 1004 from active scheduling. The previously referenced external semester spreadsheet was not located or updated in this session; a surviving copy may retain the old roster.
## Dataview
```dataview
TABLE status, input_kind, updated
FROM "20_Progress/Degree"
WHERE type = "class"
SORT status ASC, file.name ASC
```
