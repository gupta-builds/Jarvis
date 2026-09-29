---
type: class
input_kind: board
status: sprout
created: 2026-09-07
updated: 2026-09-15
area:
  - "[[Fall'26 Syllabus]]"
  - "[[APAS]]"
tags:
  - "#class"
next: "Attend and live-capture Week 4's lectures (Tue 9/29, Thu 10/1) into [[Week - 4]], then finish Project 1 before its 10/2 deadline"
---
# CSCI 4061 — Introduction to Operating Systems
Fall'26, 4 credits, in person. Closes the Introduction to Operating Systems sub-requirement of the Computer Science Core — the last open CS Core sub-req per [[APAS]], so this class finishes CS Core outright. Real syllabus pasted in full by the user 2026-09-08, from the course's Canvas page.
## Current Grade
> [!DANGER] Estimated ceiling, not an earned grade — recompute once [[Hit or Miss - Miss]] gets the full Canvas pass
> Computed 2026-09-24 from [[Hit or Miss - Miss]] against this course's own weights and drop policy. This is the **maximum grade still reachable** if everything remaining is aced, degraded only by weight already lost to misses logged so far — not a real transcript grade, since most of the semester's weight hasn't happened yet.
- **Labs (10%, lowest 2 dropped):** Lab 1 and 2 both missed — exactly uses up both drops. 0% lost, but **zero buffer left**: the next missed lab costs real points.
- **Quizzes (10%, lowest 2 dropped):** Quiz 1 missed — 1 of 2 drops used. 0% lost, 1 buffer remaining.
- **Surveys (5%, 3 surveys, full credit for submitting, no drop):** Entrance Survey missed — 1 of 3 gone. **−1.67%.**
- **Project 1 Quiz missed** — required individual per-project spec quiz, exact point value not stated anywhere captured. Flagged unresolved, not counted below; confirm on Gradescope/Canvas whether this zeroes part of the Project 1 grade outright.
**Ceiling: ~98.3%**, plus one unresolved risk (Project 1 Quiz).
## Source of truth
> [!IMPORTANT] Read before trusting anything about this course
> Real source folder: `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061` — slides, PDFs, and any future Canvas exports land there first. This Board note is the readable distillation of the real syllabus (pasted in full 2026-09-08), not a replacement for checking Canvas directly when anything here seems stale, especially exam dates and project deadlines. Desktop shortcut: `CSCI 4061.lnk` in `D:\_Anant\`.
## What This Course Actually Covers
An introduction to modern computer systems and how operating systems support them. Starts with systems programming and OS primitives on Linux, moves into distributed systems. Taught first through C, then Python, then interop between the two — understanding both levels is the point, not just passing tests. Course catalog description: processes/threads, process coordination, interprocess communication, asynchronous events, memory management, file systems, systems programming projects using OS interfaces and dev tools.
**Real structure, per Lecture 1** (a genuinely new split this offering, not the traditional 4061 shape): **first ~65% of the class is traditional OS material** (with some new topics like C/Python interop), **last ~35% is new distributed systems material** - added because "this may be the last systems course you ever take." 10 major topics in order: (1) Processes/Process Creation, (2) Low-Level I/O, (3) Signals, (4) File Systems, (5) IPC, (6) Multi-Language Systems (C/Python interop), (7) Threads & Synchronization, (8) Network Communication & Protocols, (9) Distributed Systems Fundamentals, (10) Modern Topics (Large-Scale Systems, Virtualization).
CSCI 4061 contrasts with **CSCI 5103** (OS internals for their own sake, implementing OS features) and **CSCI 5105** (distributed systems internals in detail) - 4061 looks at both through the lens of systems programming and using existing tools, not building the internals itself.
## Instructor & TAs
Primary instructor: **Jack Kolb** (jhkolb@umn.edu, 300F Lind Hall). Office hours: **Wednesdays 2:00-3:00pm** (can always email to schedule an appointment) - per `Lec01.pdf`, 2026-09-15.

| TA             | Email            | Role        |
| -------------- | ---------------- | ----------- |
| Guangyan Sun   | sun01158@umn.edu | 50% Grad TA |
| Pengju Liu     | liu03486@umn.edu | 50% Grad TA |
| Zhipeng Lu     | lu000728@umn.edu | 50% Grad TA |
| Akul Mundada   | munda057@umn.edu | Ugrad TA    |
| Ben Mechels    | meche046@umn.edu | Ugrad TA    |
| Jason Jiang    | jian0905@umn.edu | Ugrad TA    |
| Ken Vang       | vang3832@umn.edu | Ugrad TA    |
| Krivan Semlani | semla014@umn.edu | Ugrad TA    |
## Meetings
Two sections run under this syllabus - confirm which one applies before trusting any date below.

| Section | Lecture                             | Lab                                                    |
| ------- | ------------------------------------ | ------------------------------------------------------ |
| 001     | TuTh 1:00–2:15pm, 101 Tate Hall     | Labs 002–005, Mondays 9:05am–1:10pm, 1-250 Keller Hall |
| 010     | TuTh 4:00–5:15pm, 3-210 Keller Hall | Labs 011–014, Mondays 1:25pm–5:30pm, 1-250 Keller Hall |
## Prerequisites
Grade of **C- or better in CSCI 2021 or EE 2361**, admission to CS Major/Minor or CompE Major. Beyond the formal requirement: solid C is essential, not optional - if rusty, review before week 1 using the C Programming Resources section below.
## Learning Objectives
By the end: understand core OS abstractions (processes, files, threads, synchronization, communication, local and networked) and why they enable security, integrity, flexibility, and efficiency; understand parallelism/concurrency tradeoffs and write real multi-process/multi-thread programs; reason about distributed systems (replication, partitioning, consistency, consensus) and their network protocols; do real systems programming with OS/networking primitives, low-level in C and higher-level in Python.
## Textbooks
Both required: *Advanced Programming in the UNIX Environment*, 3rd ed., Stevens & Rago, 2013 (via CourseWorks); *Designing Data-Intensive Applications*, 1st ed., Kleppmann, 2017 (via Library Course Materials).
## Computing Environment
> [!WARNING] Docker setup is not optional and not extendable
> Every assignment gets graded inside a standardized Docker Linux environment - this gets set up in the first lab (Mon 2026-09-14). Environment problems are explicitly **not** grounds for a deadline extension, and neither is data loss - back up work regularly. Setup guidance lives in the course's Programming Environment Guide on Canvas, not reproduced here yet.
## Important Dates
Start of semester / first lecture: **Tue 2026-09-08**. First lab meetings: **Mon 2026-09-14**. Midterm 1: **Thu 2026-10-08**, in class, 75 min. Midterm 2: **Thu 2026-11-12**, in class, 75 min. Final exam - Section 001: **Mon 2026-12-21, 8:00–10:00am**, location TBD. Final exam - Section 010: **Thu 2026-12-17, 4:00–6:00pm**, location TBD.
## Course Tools
Canvas is the primary information source - check it regularly. Piazza is the Q&A forum. Gradescope handles all programming-assignment and exam submission/grading, including regrade requests.
## Grading
| Component | Weight |
|---|---|
| Weekly Canvas Quizzes (lowest 2 dropped) | 10% |
| Laboratory Assignments (lowest 2 dropped) | 10% |
| Course Projects | 25% |
| Midterm Exam 1 | 15% |
| Midterm Exam 2 | 15% |
| Final Exam (cumulative) | 20% |
| Surveys | 5% |
No rounding on the scale below; a curve, if applied, only moves grades up, never down.

| %     | Grade | %     | Grade |
| ----- | ----- | ----- | ----- |
| 93+   | A     | 73–76 | C     |
| 90–92 | A-    | 70–72 | C-    |
| 87–89 | B+    | 65–69 | D+    |
| 83–86 | B     | 60–64 | D     |
| 80–82 | B-    | ≤59   | F     |
| 77–79 | C+    |       |       |
## Labs
Attendance at each week's lab is required to get credit for that week's assignment - labs solidify lecture material and are the natural place to find project teammates. Submitted on Gradescope, due **11:59pm the Wednesday following** each lab session. **No late work accepted** for labs; two lowest scores dropped to absorb unavoidable misses.
## Weekly Canvas Quizzes
**Released Monday, due the following Monday** (a full week window, not same-day) - per `Lec01.pdf`. Applies recent lecture/lab/reading material, auto-graded with **10 attempts allowed**. No late work accepted; two lowest dropped. Open-resource and open-collaboration explicitly encouraged ("as long as you understand your answers"), but the submitted answers must reflect real personal understanding - the academic integrity policy applies here too. First quiz released the first week, due 9/14.
## Projects
Four projects this semester (see Schedule below), **6.25% of course grade each** (25% total), each pairing a coding submission with an **individual oral exam** on its design and functionality - even if the project itself was done as a team of two. A per-project spec quiz must be completed individually. Teams of three+ are not allowed, and once a two-person team dissolves mid-project, the remaining partner finishes solo - no new partner until the next project. Grading has three real components: automated Gradescope test results (not exhaustive - passing tests isn't a completion guarantee), manual inspection of error-handling quality, and the oral exam. Project grade is your **latest submission**, not your best one. **The Gradescope score will not match the final Canvas score** - manual inspection and the oral exam adjust it afterward, per `Lec01.pdf`.
## Surveys
**5% of course grade, 3 surveys**: Entrance Survey (released week 1), Mid-Semester Survey, Exit Survey. Full credit awarded simply for submitting - not graded on content.
> [!WARNING] Late project penalty schedule
> On time: full credit. Up to 24h late: **90%** of earned credit. Up to 48h late: **80%**. Beyond 48h: **0%**. An 80-point submission becomes 72 at 24h late, 64 at 48h late, 0 after that.
## Exams
Two 75-minute midterms during normal lecture time, one 120-minute cumulative final at the university-assigned time. All graded and regrade-requested through Gradescope. **Collaboration in any form is prohibited on exams**, and the default assumption is that no resources (notes, electronics, textbooks) are allowed unless a specific exam's resource policy says otherwise - that policy gets announced well ahead of each exam.
## Extra Credit, Withdrawals, Incompletes
No extra credit opportunities exist in this course. Withdrawal without special approval is only guaranteed through the end of Week 4 - after that, only the college administration can approve one, and only in extraordinary circumstances. Incompletes are instructor-discretion only, and only with a substantial, timely portion of the work already done.
## Workload
Per university policy, ~3 hours/week per credit - this is a 4-credit course, so budget **~12 hours/week** against [[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan|Fall 2026 Plan]]'s 80/20 daily split. That is the heaviest single-class load among the six Fall'26 courses and should be weighted accordingly when the week's One Hard Thing competes with a project deadline.
## C Programming Resources
Prerequisite review material, ranked by the course itself: **Dive Into Systems** (first few chapters, free online) is the top recommendation. Others if more depth is needed: the C Programming Wikibook, Beej's Guide to C Programming (informal, complete, ad-free), the GNU C Programming Tutorial (Burgess & Hale-Evans, a bit scattered), Learn C from ProgramIz (ad-heavy but example-rich), Burgess's 1999 C tutorial (dated but complete, single page), and Modern C (long, comprehensive, reflects current idiom).
## Schedule
Readings: "Stevens" = *Advanced Programming in the UNIX Environment*; "Kleppmann" = *Designing Data-Intensive Applications*.

| Wk | Lecture Topics | Reading | Due This Week |
|---|---|---|---|
| 1 | 9/7 No class (Labor Day); 9/8 Course Introduction (first lecture); 9/10 System Calls, Process Management | Stevens Chs 1, 7, 8 | Quiz 1 & Entrance Survey released |
| 2 | Process Management, Intro Low-Level I/O; Advanced I/O, Redirection | Stevens Chs 7, 3 | Quiz 1 + Entrance Survey due; Lab 1; Project 1 released; Project 1 Quiz due |
| 3 | Signals; More Signals, Intro File Systems | Stevens Chs 10, 4 | Quiz 2 due; Lab 2 |
| 4 | File Systems; IPC: Pipes | Stevens Ch 4, 15.1–15.2 | Quiz 3 due; Lab 3; **Project 1 due (10/2)** |
| 5 | IPC: Pipes and Shared Memory; **Midterm 1 (10/8)** | Stevens 15.1, 15.2, 15.9 | Quiz 4 due; Lab 4 |
| 6 | Finish IPC, Multiplexed I/O; Systems Programming in Python, C/Python Interop | Stevens 15.9, 14.4 | Quiz 5 due; Lab 5; Project 2 released; Project 2 Quiz due |
| 7 | Intro to Threads; Threads and Basic Synchronization | Stevens Ch 11 | Quiz 6 released; Lab 6 |
| 8 | Advanced Synchronization; Finish Synchronization, Start Networking | Stevens Chs 11, 12, 16 | Quiz 6 due; Mid-Semester Survey released; Lab 7; **Project 2 due (10/30)** |
| 9 | Sockets and UDP/TCP; Finish TCP, HTTP 1/2 | Stevens Ch 16 | Quiz 7 due; Mid-Semester Survey due; Lab 8; Project 3 released; Project 3 Quiz due |
| 10 | Finish Protocols, Python Multithreading; **Midterm 2 (11/12)** | — | Quiz 8 due; Lab 9 |
| 11 | Data Serialization, Intro Distributed Systems; More Dist Sys, RPC | Kleppmann Chs 8, 4 | Quiz 9 due; Lab 10; **Project 3 due (11/20)** |
| 12 | Finish RPC; No class 11/26 (Thanksgiving) | Kleppmann Ch 4 | Quiz 10 released; Lab 11; Project 4 released |
| 13 | Replication and Partitioning; Consistency and Consensus | Kleppmann Chs 5, 6, 7, 9 | Quiz 10 due; Lab 12; Project 4 Quiz due |
| 14 | Example Large-Scale Systems, Microservices; Virtualization and Containers | — | Quiz 11 due; Lab 13; **Project 4 due (12/11)** |
| 15 | Looking Ahead: Web, OS, Embedded | — | Quiz 12 due |
Final exam per section is listed in Important Dates above, not repeated here.
## Standards Once Material Starts
Week-by-week notes follow [[Weekly Standard]] once lectures actually begin - this Board stays the single-class deep source for grading detail, policy, and the full schedule; the spreadsheet cross-class view is `Fall'26 Semester Calendar.xlsx` (`10_Areas/UMN/Plan/In Semester Review/`).
## Common Mistakes
None logged yet for this course specifically - add here the first time something costs real points, per the [[Fall'26 Syllabus]] convention.
## Verification Notes (2026-09-15 addendum)
`Lecture/Lec01.pdf` (Course Mechanics & Introduction, 2026-09-08) was read in full and used to add real detail not in the original pasted syllabus: office hours, the 65%/35% traditional-OS/distributed-systems split rationale, the exact weekly-quiz release/due window, project grading mechanics (Gradescope-vs-Canvas score mismatch), and the exact survey count/names. Both required textbooks and Lec01 slides are now present in the source folder - no longer waiting on Canvas exports for week 1.
