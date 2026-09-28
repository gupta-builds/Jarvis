---
type: class
input_kind: board
status: sprout
created: 2026-09-07
updated: 2026-09-28
area:
  - "[[Fall'26 Syllabus]]"
  - "[[APAS]]"
tags:
  - "#class"
next: "Confirm the exact discussion-section meeting time on Canvas, and what (if anything) is covered in the Wed 11/25 no-reading session"
---
# CSCI 4511W — Introduction to Artificial Intelligence
Fall'26, replaces the dropped [[20_Progress/Degree/CSCI 3081W/CSCI 3081W Board|CSCI 3081W]] as of 2026-09-09. Full syllabus text pasted directly from Canvas, 2026-09-09. Degree-requirement impact of this swap - what's confirmed closed vs. now genuinely uncertain - is tracked in [[Fall'26 Syllabus]]'s Path to Graduation section, not repeated here.
## Source of Truth
> [!IMPORTANT] Read before trusting anything about this course
> Real source folder: `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4511W` (corrected 2026-09-28 - earlier text had a stale `D:\Users\_Anant\...` path that never existed on this machine). As of 2026-09-28 it holds the textbook PDF, `Discussion/turing.pdf` and `Discussion/Discussion 2.pdf`, `Lecture/CSCI4511W Lecture 02.pdf` through `Lecture 06.pdf` (Lecture 06, "Informed Search," landed 2026-09-28), and `Pratice Problems/` with `ps1.py`/`ps1.pdf` and the `aima-python` reference repo. This Board note is the readable distillation of the real syllabus and Canvas Modules page (both pasted in full 2026-09-15) - not a replacement for checking Canvas directly when anything here seems stale. Save the actual syllabus PDF and future slides here as they arrive; nothing here should be trusted over a live Canvas check for anything time-sensitive.
## Catalog Info
Course number CSCI 4511W, **Introduction to Artificial Intelligence**, Fall 2026, two sections (001 and 010) sharing one Canvas site. Catalog description: "Agents. Problem-solving using search algorithms. Knowledge representation and inference using formal logic. Knowledge graphs. Planning. Introduction to machine learning."
## Learning Objectives
By the end: deep understanding of classical search algorithms (both analysis and implementation); know when to apply uninformed vs. informed search strategies; apply search strategies to constraint problems and adversarial environments; understand how computer systems represent knowledge; know how to write academic papers.
## Instructor & Course Staff
**Dr. Andy Exley** - exle0002@umn.edu.
*Graduate TAs (Discussion Section leads):* Maryam Kameli (kamel026@umn.edu), London Lowmanstone (lowma016@umn.edu), Zephaniah Johnson (joh15514@umn.edu).
*Undergraduate TAs (Grading):* Banu Arunachalm (aruna019@umn.edu), NZ Gorham (gorha079@umn.edu).
## Meetings
| Section | Lecture | Location |
|---|---|---|
| 001 | MW 4:00–5:15pm | Bruininks Hall 220 |
| 010 | MW 1:00–2:15pm | Vincent Hall 16 |
Discussion sections (led by the Grad TAs) run separately from lecture - exact meeting time still not stated anywhere in the syllabus text. Strong inferred pattern from the Modules page (2026-09-15 pull): every "Discussion Participation" item, and the opening "Discussion: Turing 1950," is due by 11:59pm on a **Friday**, weekly, which is consistent with a Friday discussion-section meeting - treat the day as a real, well-evidenced inference, and the exact time as still genuinely unconfirmed.
## Textbook
**Stuart Russell & Peter Norvig**, *Artificial Intelligence: A Modern Approach*, 4th ed., Pearson 2020 - Chapters 1–12.
## Grading
| Component | Weight |
|---|---|
| Problem Sets (4) | 36% |
| Writing Assignments (4, 3% each) | 12% |
| Short Quizzes (12–14, ~1% each) | 12% |
| Long Quizzes (3, 8% each) | 24% |
| Final Project | 10% |
| Discussion Attendance & Participation | 6% |
| Recommended Readings | 0% (ungraded, tracked as a category anyway) |
Scale as stated: 90%+ for some level of A, 80%+ for some level of B, 70%+ for some level of C, 60%+ for some level of D - no finer +/- breakdown given in the pasted text.
## Problem Sets
5–6 written or coding problems each, completed and submitted individually online. Coding portions may require meeting a TA for a code review, which **must happen within 10 days of the assignment due date**.
## Writing Assignments
Build toward writing in academic style, as though for publication as research - a specific format and citation conventions unique to Computer Science, taught progressively across the four assignments.
## Discussion Section Attendance and Participation
Required and graded, not optional. Discussion sections focus on reading, discussing, and writing research papers - this is where the "know how to write academic papers" learning objective actually gets practiced.
## Short Quizzes
Via Gradescope, covering recent material. **Open-collaboration and open-resource** - classmates, textbook, and notes are all fair game. Due 6:00pm the day assigned; recommended to complete them in class.
## Long Quizzes
In person, individual effort only - **no collaboration allowed**. Up to 2 pages of personal notes permitted. **45-minute time limit.**
## Schedule
> [!TIP] Complete, real, resolved 2026-09-15
> The full syllabus and the complete Modules page were pasted directly by the user 2026-09-15, closing the gap that existed from 2026-09-09 through mid-September. This replaces the earlier partial (Nov 16-Dec 14 only) table. Every reading below is a real AIMA (Russell & Norvig) chapter, mapped one-to-one onto the course's own named Canvas modules - the earlier "second uncited textbook for Ch7.3-7.6" concern is **resolved and dropped**: it was a scrambled-paste artifact from a partial copy, not a real second source. AIMA covers everything through Chapter 9; the single Dec 14 "Vector Semantics" reading is the only genuinely separate item, standalone, no chapter number, not part of AIMA at all.
Course meets **Monday and Wednesday** (lecture) per the Meetings table above; **Friday** carries the discussion section (inferred day, see Meetings note). Reading due "by 1pm" precedes that day's lecture; Short Quizzes are due 6pm the same day. Module name in parentheses.

| Week | Monday | Wednesday | Friday (Discussion) |
|---|---|---|---|
| 1 (9/7-9/13) | Labor Day - no class | **9/9** - Course intro/syllabus day, no reading assigned | **9/11** - Discussion 1: Turing 1950 (Turing's 1950 paper, `turing.pdf` in source folder) |
| 2 (9/14-9/20) | **9/14** - Ch 2.1-2.4 (Intelligent Agents); SHORT QUIZ 01 | **9/16** - Ch 3.1-3.2 (Uninformed Search) | **9/18** - Discussion Participation |
| 3 (9/21-9/27) | **9/21** - Ch 3.3-3.4.2 (Uninformed Search); SHORT QUIZ 02 | **9/23** - Ch 3.4.3-3.4.4 (Uninformed Search) | **9/25** - Discussion Participation |
| 4 (9/28-10/4) | **9/28** - Ch 3.5 (Informed Search); SHORT QUIZ 03 | **9/30** - Ch 3.6 (Informed Search) | **10/2** - Discussion Participation |
| 5 (10/5-10/11) | **10/5** - Ch 4.1.1-4.1.3 (Local Search); SHORT QUIZ 04 | **10/7** - Ch 4.1.4-4.2 (Local Search) | **10/9** - Discussion Participation |
| 6 (10/12-10/18) | **10/12** - Ch 4.3-4.4 (Search in Complex Environments); SHORT QUIZ 05 | **10/14** - LONG QUIZ 01, in class, 45 min, individual, 2-page note limit | **10/16** - Discussion Participation |
| 7 (10/19-10/25) | **10/19** - Ch 5.1 (Games); SHORT QUIZ 06 | **10/21** - Ch 5.2 (Games) | **10/23** - Discussion Participation |
| 8 (10/26-11/1) | **10/26** - Ch 5.3-5.4 (Games); SHORT QUIZ 07 | **10/28** - Ch 5.5-5.6 (Games) | **10/30** - Discussion Participation |
| 9 (11/2-11/8) | **11/2** - Ch 6.1 (Constraint Satisfaction); SHORT QUIZ 08 | **11/4** - Ch 6.2-6.3 (Constraint Satisfaction) | **11/6** - Discussion Participation |
| 10 (11/9-11/15) | **11/9** - Ch 6.4 (Constraint Satisfaction); SHORT QUIZ 09 | **11/11** - Ch 6.5 (Constraint Satisfaction); LONG QUIZ 02 | **11/13** - Discussion Participation |
| 11 (11/16-11/22) | **11/16** - Ch 7.1-7.2 (Propositional Logic); SHORT QUIZ 10 | **11/18** - Ch 7.3-7.4 (Propositional Logic) | **11/20** - Discussion Participation |
| 12 (11/23-11/29, Thanksgiving Thu 11/26-Fri 11/27) | **11/23** - Ch 7.5-7.6 (Propositional Logic); SHORT QUIZ 11 | **11/25** - no new reading; Writing 4 (Literature Review) due 11:59pm, day before Thanksgiving | No discussion (Thanksgiving) |
| 13 (11/30-12/6) | **11/30** - Ch 8.1-8.2 (First-Order Logic); SHORT QUIZ 12 | **12/2** - Ch 8.3 (First-Order Logic) | **12/4** - Discussion Participation (last one on the calendar) |
| 14 (12/7-12/13) | **12/7** - Ch 9.1-9.2 (First-Order Logic); SHORT QUIZ 13 | **12/9** - Ch 9.3 (First-Order Logic); LONG QUIZ 03 | No discussion listed |
| 15 (12/14) | **12/14** - Reading: Vector Semantics (standalone, not AIMA - last class this course lists; no Wed 12/16 session appears anywhere in this course's own calendar, unlike the university-wide pattern used by other Fall'26 courses) | none | none |
| Finals | — | — | **Final Project due Fri 12/18, 11:59pm** (this course has no final exam - the Final Project, 10%, is the terminal assessment) |

**All 13 Short Quizzes, all 3 Long Quizzes, all 4 Problem Sets (Code+Written), all 4 Writing Assignments, and all 12 Discussion Participation grades are now dated and accounted for** - matching the grading table's stated counts exactly (12-14 short quizzes → confirmed 13; 3 long quizzes → confirmed; 4 problem sets → confirmed; 4 writing assignments → confirmed).
## Late Policy
Resolved 2026-09-15 against the full syllabus text (the earlier capture had cut off mid-sentence). Short quizzes, problem sets, and writing assignments turned in up to one day late get a penalty (usually 10%, or a fixed amount for in-class exercises). Anything later than one day late is **not accepted by Gradescope** - the student has to contact course staff directly to turn it in and discuss whether any credit will be given at all (not guaranteed). No finer detail than that exists in the syllabus - there's no separate published grace-period table the way [[20_Progress/Degree/CSCI 4061/CSCI 4061 Board|CSCI 4061]] has one.
## Make-Up Work & Withdrawal
Exceptions to grading/deadlines are **not** given for: minor illness without documentation, job interviews, vacation travel, CSE Labs/local setup technical difficulties, or failure to use Gradescope correctly. Exceptions **are** possible, at instructor discretion with documentation, for significant health issues or life/family events - email the instructor as soon as possible. Withdrawal without special approval is only guaranteed through the end of Week 4; after that, only college administration can approve one, in extraordinary circumstances. Incompletes are instructor-discretion only, requiring a substantial, timely portion of work already done.
## Verification Notes
Grading structure, catalog description, learning objectives, staff, meeting times, textbook, and the per-category assessment descriptions were pasted directly from Canvas 2026-09-09. **2026-09-15 update:** the user pasted the complete syllabus page and the complete Modules page (all module names, all reading/quiz/assignment due dates, all point values) - the full Schedule section above is built entirely from that, not reconstructed or inferred, except where a specific cell says otherwise (Week 12's Wednesday, the discussion-day inference). This also resolved the Late Policy cutoff, confirmed the discussion-section day pattern (Friday, inferred from due-date clustering, not explicitly stated), and closed the "second uncited textbook" concern in [[20_Progress/Degree/CSCI 4511W/Textbook/Textbook Map|Textbook Map]]. **Still not captured, genuinely open:** the exact discussion-section meeting time, the specific +/- grade cutoffs beyond the stated 90/80/70/60 bands, and confirmation of what (if anything) happens in the Wed 11/25 session with no assigned reading.
