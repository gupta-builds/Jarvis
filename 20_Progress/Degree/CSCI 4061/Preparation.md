---
type: class
input_kind: preparation
status: sprout
created: 2026-09-08
updated: 2026-09-08
area:
  - "[[CSCI 4061 Board]]"
tags:
  - "#class"
next: "Complete the Docker environment setup in Lab 1 (Mon 9/14) before Project 1 releases the same week"
---
# CSCI 4061 — Preparation
==Every project pairs a coding submission with an individual oral exam on its design - a team-built project with one partner who can't explain the design in their own oral exam still costs that partner real points.==
## Where the Points Actually Are
Projects (25%) plus the two Midterms (15% + 15%) plus the Final (20%) is **75% of the grade** in code-and-exam form - Weekly Quizzes (10%), Labs (10%), and Surveys (5%) are the remaining 25%, mostly low-effort-to-secure. The oral exam attached to every project is the real differentiator versus a normal coding-project course: passing the automated Gradescope tests isn't enough if the design can't be explained live, and a two-person team dissolving mid-project means finishing solo with no new partner allowed - pick a reliable partner from the start, not just a skilled one.
## Cheapest Points
Weekly Canvas Quizzes (10 attempts allowed, two lowest dropped) and Labs (two lowest dropped) are both built with real cushion - a single bad week doesn't cost anything if the drop absorbs it. Surveys (5%) are the closest thing to free points in this course.
## The Real Traps
- **Docker setup is mandatory and non-negotiable** - every assignment is graded inside a standardized Docker Linux environment, set up in Lab 1 (Mon 9/14). Environment problems are explicitly not grounds for a deadline extension, and neither is data loss - back up work regularly, per [[CSCI 4061 Board]]'s Computing Environment warning.
- **Late project penalty is steep and fast**: full credit on time, 90% up to 24h late, 80% up to 48h, **zero credit past 48h**. An 80-point submission is worth 0 two days late - there's no slow decay to lean on.
- **Project grade is your latest submission, not your best one** - a late "fix" that introduces a new bug can score worse than an earlier, imperfect on-time version. Don't resubmit casually once something already works.
- **No extra credit exists anywhere in this course** - unlike the now-archived [[20_Progress/Degree/CSCI 3081W/CSCI 3081W Board|CSCI 3081W]]'s Team Building bonus (dropped 2026-09-09, not part of the active Fall'26 schedule), there's no cushion beyond the built-in drops. Every quiz, lab, and project attempt matters from the start.
## Study Cadence
This is the heaviest Fall'26 course by workload (~12 hours/week, per [[CSCI 4061 Board]]'s Workload section) - budget accordingly against [[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan|Fall 2026 Plan]]'s daily split rather than treating it as one class among six equals. For each project, read the assigned Stevens/Kleppmann chapters (see [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]]) before the project releases, not after - the schedule in [[CSCI 4061 Board]] pairs specific readings with specific weeks for exactly this reason. Rebuild C fluency in week 1 if rusty, using the C Programming Resources list in the Board note - the prerequisite assumes it, the course doesn't re-teach it.
## Weekly Study Plan
**~12 hours/week**, per [[CSCI 4061 Board]]'s own Workload section (university policy: 3 hrs/credit x 4 credits) - the heaviest of the six Fall'26 courses. A reasonable split, not itself stated in the syllabus beyond the class/lab time: ~2.5 hrs in the two weekly lectures, ~1 hr in the weekly lab, ~3-4 hrs reading Stevens/Kleppmann plus quiz prep, ~5-6 hrs of project coding and debugging - heavier in weeks a project is due, lighter in weeks one just released.
Full week-by-week detail below, consolidated from [[CSCI 4061 Board]]'s Schedule and [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]] into one interlinked table.
| Wk | Lecture Topics | Reading | Due This Week |
|---|---|---|---|
| 1 | Course Intro; System Calls, Process Management | Stevens Ch 1, 7, 8 | Quiz 1 & Entrance Survey released |
| 2 | Process Management, Low-Level I/O; Advanced I/O, Redirection | Stevens Ch 7, 3 | Quiz 1 + Entrance Survey due; Lab 1; Project 1 released; Project 1 Quiz due |
| 3 | Signals; More Signals, Intro File Systems | Stevens Ch 10, 4 | Quiz 2 due; Lab 2 |
| 4 | File Systems; IPC: Pipes | Stevens Ch 4, 15.1-15.2 | Quiz 3 due; Lab 3; **Project 1 due (10/2)** |
| 5 | IPC: Pipes/Shared Memory; **Midterm 1 (10/8)** | Stevens 15.1, 15.2, 15.9 | Quiz 4 due; Lab 4 |
| 6 | Finish IPC, Multiplexed I/O; Python Systems Programming, C/Python Interop | Stevens 15.9, 14.4 | Quiz 5 due; Lab 5; Project 2 released; Project 2 Quiz due |
| 7 | Intro to Threads; Basic Synchronization | Stevens Ch 11 | Quiz 6 released; Lab 6 |
| 8 | Advanced Synchronization; Start Networking | Stevens Ch 11, 12, 16 | Quiz 6 due; Mid-Semester Survey released; Lab 7; **Project 2 due (10/30)** |
| 9 | Sockets/UDP/TCP; HTTP 1/2 | Stevens Ch 16 | Quiz 7 due; Mid-Semester Survey due; Lab 8; Project 3 released; Project 3 Quiz due |
| 10 | Finish Protocols, Python Multithreading; **Midterm 2 (11/12)** | — | Quiz 8 due; Lab 9 |
| 11 | Data Serialization, Intro Distributed Systems; RPC | Kleppmann Ch 8, 4 | Quiz 9 due; Lab 10; **Project 3 due (11/20)** |
| 12 | Finish RPC; no class 11/26 (Thanksgiving) | Kleppmann Ch 4 | Quiz 10 released; Lab 11; Project 4 released |
| 13 | Replication/Partitioning; Consistency/Consensus | Kleppmann Ch 5, 6, 7, 9 | Quiz 10 due; Lab 12; Project 4 Quiz due |
| 14 | Large-Scale Systems, Microservices; Virtualization, Containers | — | Quiz 11 due; Lab 13; **Project 4 due (12/11)** |
| 15 | Looking Ahead: Web, OS, Embedded | — | Quiz 12 due |
## Open Question
- [ ] Confirm which section (001 or 010) applies - final exam dates differ by a full four days between them.
