---
type: class
input_kind: preparation
status: sprout
created: 2026-09-08
updated: 2026-10-01
area:
  - "[[CSCI 4061 Board]]"
tags:
  - "#class"
next: "Finish Project 1 (due 2026-10-02) using the Week 1-3 instructional map below, then read Chapter - 4's back half ahead of Week 4's live lectures"
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
## Must-Do Habits
- **Before each lecture:** skim the week's assigned Stevens chapter(s) from [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]] and check whether that chapter's note already exists under `Textbook/` - if it does, read its Chapter Summary and Key Concepts before class; if not, that is the week's first production task. Done when: the chapter's one-sentence Chapter Summary can be restated without looking.
- **During lecture:** write live capture directly into that week's note under `## Lecture`, per [[Weekly Standard]]'s lifecycle rule - never postpone capture to "clean up later," and never let an agent silently rewrite that live capture afterward. Done when: every numbered lecture topic for the day has at least one real sentence, not a placeholder.
- **After lecture, same day if possible:** reconcile the week's live capture against the matching textbook chapter(s) - note what lecture added beyond the book, what the book covers that lecture skipped, and file that under the week's own Textbook integration section. Done when: the week note's `## Connections`/Textbook integration section names at least one real gap in each direction.
- **Before touching a project task:** check this Preparation note's Week-by-Week Instructions below for which week's material that task actually draws from, then re-read that week's `## Key ideas` before writing code - most of this course's point deductions are error-handling omissions (`-1 point per missed check, -1 per missed cleanup step`, per Lec01), not conceptual misunderstanding. Done when: every system call used in the task has a matching `if (x == -1) { perror(...); ...}` or equivalent in the code.
- **After every lab or project submission:** record the actual Gradescope/test result and at least one reusable Problem/Fix/Why entry in that lab's or project's own note, per [[Lab Standard]] and [[Project Standard]] - never leave Results as an unfilled template after a real run has happened.
- **Before each exam:** build out rich concept notes in [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/C Language|C Refresher]] and this course's own Concepts layer for anything that recurred across three or more weeks, then drill the accumulated `#cards/csci4061` flashcard deck rather than re-reading week notes passively.
## Common Mistakes / Traps
- **Treating `fork()` order as predictable.** Every week-1-through-3 note repeats this warning because it is the single most common wrong assumption in this course's own material: code that only works if the parent happens to run first will pass locally and fail on Gradescope's scheduler.
- **Skipping error checks to save time.** This course grades error handling directly and separately from correctness (-1 per missed check, -1 per missed cleanup, confirmed in Lec01 and baked into every project's Error Checking Criteria) - an otherwise-correct `swish` implementation that skips a `perror` on a failed `open()` loses real points even if every test passes.
- **Confusing `wait()`'s raw `status` with the actual exit code.** [[20_Progress/Degree/CSCI 4061/Weekly/Week - 1|Week - 1]] and [[20_Progress/Degree/CSCI 4061/Labs/Lab - 2|Lab - 2]] both hit this directly - the real exit code only exists after `WIFEXITED(status)` confirms normal exit, then `WEXITSTATUS(status)` extracts it.
- **Assuming two independent `open()` calls on the same file share an offset.** They don't - only a `fork()`-inherited fd shares the system-file-table entry (and therefore the offset) with its parent's copy; two unrelated `open()` calls on an identical path get two independent offsets. See [[20_Progress/Degree/CSCI 4061/Weekly/Week - 2|Week - 2]]'s own warning on this.
- **Calling `pause()` right after unblocking a signal.** The classic race this course builds an entire Week 3 exercise around: a signal delivered in the gap between unblock and `pause()` is lost, and the process can wait forever. `sigsuspend()` exists specifically to close this gap.
## Professor-Specific Notes
- **Verified (Lec01, 9/8):** error handling is graded as its own rubric line on every project, not folded into correctness - "-1 point per missed error check, -1 point per missed cleanup step," starting with Project 1.
- **Verified (Lec01, 9/8):** the Gradescope score and the final Canvas score will not match - manual inspection and the individual oral exam adjust the automated score afterward. Passing every automated test is not a completion guarantee.
- **Verified ([[CSCI 4061 Board]], Projects section):** project grade is the **latest** submission, not the best one - a late "fix" that introduces a new bug can score worse than an earlier, working, on-time version.
- **Observed repeatedly (Lec01-06):** the course's own slide material routinely diverges from the textbook's chapter boundaries - permission bits taught during the "Chapter 3 week" are actually APUE §4.5-4.9, and buffering taught the same week is actually APUE Chapter 5 (never assigned as its own reading). Don't assume a lecture's topic matches its paired textbook chapter number exactly; check [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]]'s own correction note before trusting the week-to-chapter mapping blindly.
- **Ask/confirm:** whether Project 1's spec quiz is genuinely scoped to Weeks 1-3 content only, or draws on Week 4's pipe material too - flagged as an open question in [[20_Progress/Degree/CSCI 4061/Weekly/Week - 4|Week - 4]] and still unresolved as of 2026-10-01.
## Week-by-Week Instructions
Weeks 1-3 below are fully captured and reconciled; each entry names the concrete study action, not just what happened. Week 4 is intentionally lighter, since its own note is still a pre-lecture scaffold - see [[20_Progress/Degree/CSCI 4061/Weekly/Week - 4|Week - 4]]'s own warning before treating anything there as lecture-verified.
### Week 1 — System calls, `fork`/`exec`/`wait`, memory layout
Read [[20_Progress/Degree/CSCI 4061/Weekly/Week - 1|Week - 1]] start to finish once, then drill its own `#cards/csci4061` flashcards until the `fork()` "called once, returns twice" framing and the five memory segments (text/data/bss/heap/stack) can be explained without the note open. Cross-reference [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]] for the referee/illusionist/glue vocabulary and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]] for `_start()`/memory-layout mechanism, and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8|Chapter - 8]] for the full `fork`/`exec`/`wait` API. Run the three `fork()` "brain melting" loop variants from the week note's Takeaways section by hand before trusting your own prediction of their process trees.
### Week 2 — Low-level I/O, file descriptors, `dup2`, buffering
Read [[20_Progress/Degree/CSCI 4061/Weekly/Week - 2|Week - 2]], then [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter - 3]] for the full file-descriptor/system-file-table/inode chain `dup2` exploits. This week is the direct prerequisite for Project 1's Task 3 (redirection) - work [[20_Progress/Degree/CSCI 4061/Labs/Lab - 2|Lab - 2]]'s `redirect_child.c` by hand first, since it is a smaller, already-solved version of exactly that task. Memorize the open-flag combinations (`O_CREAT|O_WRONLY|O_TRUNC` for `>`, add `O_APPEND` instead of `O_TRUNC` for `>>`) rather than re-deriving them each time.
### Week 3 — Signals, `sigaction`, intro file systems
Read [[20_Progress/Degree/CSCI 4061/Weekly/Week - 3|Week - 3]], then [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]] for the full signal lifecycle and the three "tricky items" (interrupted system calls, `errno` corruption, reentrancy), and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]] for the i-node/path-resolution mechanism. Complete [[20_Progress/Degree/CSCI 4061/Labs/Lab - 3|Lab - 3]]'s `sigaction()`/`SA_RESTART`/`volatile sig_atomic_t` pattern directly inside the dev container - this is the same mechanism Project 1's Task 4 needs for `SIGTTOU`/`SIGTTIN` handling, just applied to a different signal.
### Week 4 — File systems continued, IPC pipes (in progress)
[[20_Progress/Degree/CSCI 4061/Weekly/Week - 4|Week - 4]] is a scaffold, not a captured week - its `## Lecture` section is explicitly inferred from the syllabus and not yet lecture-verified. Live-capture the real 9/29 and 10/1 lectures into that note directly, then reconcile against [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]]'s un-lectured sections (hard/symbolic links, `mkdir`/directory reading) once Build 2's source-check pass is confirmed against what was actually taught. Project 1 is due 10/2, right after Thursday's lecture - per the week note's own open question, confirm whether the project actually depends on this week's pipe material before assuming it does.
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
