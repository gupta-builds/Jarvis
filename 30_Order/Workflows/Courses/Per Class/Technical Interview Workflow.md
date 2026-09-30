---
type: evergreen
status: sprout
created: 2026-09-29
tags:
  - system
  - workflow
  - technical-interview
notes:
  - "[[Course Production Workflow]]"
  - "[[Preparation Workflow]]"
  - "[[CSCI 4511W Workflow]]"
  - "[[20_Progress/Degree/_Courses/Technical Interview/Technical Interview|Technical Interview]]"
  - "[[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation|CSCI 4041 Relation]]"
  - "[[20_Progress/Degree/_Courses/Technical Interview/Problems Solver|Problems Solver]]"
---
# Technical Interview Workflow
This is the course-specific routing contract for CodePath TIP103, run through the [[20_Progress/Degree/_Courses/Technical Interview/Technical Interview|Technical Interview]] Board. It differs from every other per-class workflow in this vault in one structural way: there is no live lecture to capture. TIP103's own sessions are adaptive-paced HackerRank practice; the actual conceptual material this workflow revises is a different, already-finished course ([[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/CSCI 4041 Board|CSCI 4041]], completed Spring'26). The whole point of this workflow is to stay one topic-block ahead of the live cohort using that finished material, so every live session gets solved unaided rather than learned for the first time in it.
## Course shape
[[20_Progress/Degree/_Courses/Technical Interview/Technical Interview|Technical Interview]] is the authority for TIP103's own schedule, grading (HackerRank units, 30/60 to pass, 2 attempts, pass 6 of 12 to complete), and policy — never duplicate its schedule table here. [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation|CSCI 4041 Relation]] is the authority for which finished CSCI 4041 week/textbook/concept/project notes map to which TIP103 topic, including the three topics with no matching note (UMPIRE, Union-Find, backtracking-DP). [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/CSCI 4041 Board|CSCI 4041 Board]] is the authority for that borrowed material's own scope and source.
## Source hierarchy and trust
1. CodePath Course Portal / University LMS — the real live unit number, actual assessment content, and real dates. [[20_Progress/Degree/_Courses/Technical Interview/Technical Interview|Technical Interview]]'s own two internal schedule tables number units differently from each other and from the portal — never trust either table's numbering over a live portal check.
2. [[20_Progress/Degree/_Courses/Technical Interview/Technical Interview|Technical Interview]] — the captured syllabus, schedule, and grading rules.
3. [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation|CSCI 4041 Relation]] — the topic-to-material map and the live ahead/behind status.
4. [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/CSCI 4041 Board|CSCI 4041 Board]] and its Weekly/Textbook/Concepts notes — the borrowed conceptual material. This layer is static and finished; it does not get new lecture capture, only enrichment from the original source PDFs at `D:\Users\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4041`.
5. [[20_Progress/Degree/_Courses/Technical Interview/Problems Solver|Problems Solver]], [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Problems/Weekly Set|Weekly Set]], and [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Problems/How to Solve Problems|How to Solve Problems]] — the practice layer.
## The weekly operating rhythm
This replaces the before/during/after-lecture pattern other course workflows use, since there is no lecture here to sit inside.
1. Confirm the live unit number against the CodePath portal/University LMS — never assume [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation|CSCI 4041 Relation]]'s last-recorded guess is still current.
2. From that live unit, identify the one-ahead topic-block using [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation|CSCI 4041 Relation]]'s nine topic sections.
3. Revise that block: (re)read its mapped [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/CSCI 4041 Board|CSCI 4041]] week, textbook chapter, and concept notes before touching a single problem.
4. Rewrite [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Problems/Weekly Set|Weekly Set]] for that block, pulling problems from [[20_Progress/Degree/_Courses/Technical Interview/Problems Solver|Problems Solver]]'s resources.
5. Run the daily-7 rule every day of that week, solving under [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Problems/How to Solve Problems|How to Solve Problems]]'s three rules without exception.
6. When the live session for that topic-block actually happens, solve every session question and the graded HackerRank assessment unaided — this step is the entire reason the prior five exist. If a question can't be solved unaided, that is a real signal the prior week's revision was thin, not a one-off.
7. After the live session, update [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation|CSCI 4041 Relation]]'s Status table with the real ahead/behind state and any topic that turned out weaker than its mapped material suggested.
## Assignment handling
The two outstanding assignments (and every assignment after them) are solved entirely by hand, no AI-written code, per [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Problems/How to Solve Problems|How to Solve Problems]]'s Rule 3. Treat an assignment exactly like a Weekly Set problem for research and UMPIRE purposes, just with a real due date attached.
## Textbook enrichment rule
The CSCI 4041 textbook chapter notes are a first-class, ongoing resource, not a historical artifact — widen them from the original PDFs (`Introduction to Algorithms - DSA.pdf`, `ITA Part 1.pdf` in the UMN source folder above) when a topic-block's revision pass finds a chapter note thinner than the material actually supports. Do this chapter-by-chapter, the same discipline [[Weekly Workflow]] and [[Textbook Workflow]] use elsewhere in this vault, not as one bulk pass.
## Status and handoff
Use `seed` for a newly created scaffold (a just-created Problems note before any real content), `sprout` for a working note with real content, and `tree` only once a note has survived real use (a Weekly Set that has actually run a week, a How to Solve Problems rule that has survived real problems). Every active note in this course leaves a concrete `next`.
## Stop-and-ask conditions
Ask or verify before acting when: the live unit number can't be confirmed from the portal, a topic-block has no mapped CSCI 4041 material (the three flagged gaps: UMPIRE, Union-Find, backtracking-DP — these need a decision on whether to build a new note or stay LeetCode-only), the portal's real grading/policy conflicts with [[20_Progress/Degree/_Courses/Technical Interview/Technical Interview|Technical Interview]]'s captured syllabus, or a daily-7 target is clearly incompatible with the current week's UMN course load.
## Done conditions for this course workflow
- [[20_Progress/Degree/_Courses/Technical Interview/Technical Interview|Technical Interview]] remains the authority for TIP103's own schedule and grading; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation|CSCI 4041 Relation]] remains the authority for the topic map and live ahead/behind status.
- The one-unit-ahead target is checked against the live portal every week, not assumed.
- Every live session question and HackerRank assessment gets solved unaided because the prior week's revision actually happened.
- Assignments and Weekly Set problems are solved entirely by hand under [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Problems/How to Solve Problems|How to Solve Problems]].
- Textbook notes get widened from the real source PDFs when a revision pass finds them thin, one chapter at a time.
- Unknowns (live unit number, gap topics, portal-vs-syllabus conflicts) stay visible instead of being guessed.
