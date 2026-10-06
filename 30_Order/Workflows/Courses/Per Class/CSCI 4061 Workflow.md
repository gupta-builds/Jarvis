---
type: evergreen
status: sprout
created: 2026-10-01
updated: 2026-10-05
tags:
  - system
  - workflow
  - CSCI4061
notes:
  - "[[Course Production Workflow]]"
  - "[[Weekly Workflow]]"
  - "[[Textbook Workflow]]"
  - "[[Lab Workflow]]"
  - "[[Projects Workflow]]"
  - "[[Concept Workflow]]"
  - "[[Preparation Workflow]]"
  - "[[CSCI 4061 Board]]"
---
# CSCI 4061 Workflow
This is the course-specific routing contract for Introduction to Operating Systems. It works with the course Board and the generic course standards/workflows. The Board remains the authority for changing dates, weights, policies, and unresolved facts; this note explains how to turn those facts into notes, week after week, without re-deriving the process each time.
## Course shape
The course runs lecture (TuTh) plus a Monday lab, graded on Weekly Canvas Quizzes (10%), Labs (10%), four Course Projects (25%, each pairing a coding submission with an individual oral exam), two Midterms (15% each), a cumulative Final (20%), and Surveys (5%). Two required textbooks split by subject half: Stevens & Rago's *Advanced Programming in the UNIX Environment* (APUE) covers Weeks 1-10's systems-programming core, Kleppmann's *Designing Data-Intensive Applications* covers Weeks 11-13's distributed-systems half. Every assignment is graded inside a standardized Docker dev container (`csci4061-fa26/`) set up in Lab 1 - environment problems are explicitly not grounds for an extension. The known assessment routing is:

| Course work | Template/workflow | Note purpose |
|---|---|---|
| Weekly lecture | [[Week Template]] / [[Weekly Workflow]] | Pre-lecture preparation, protected live capture, post-lecture reconciliation against the textbook |
| Textbook chapter | [[Textbook Template]] / [[Textbook Workflow]] | Source-checked chapter note built directly from the APUE/Kleppmann PDF, not NotebookLM-derived for this course |
| Concept or cross-cutting mechanism | [[Concept Template]] / [[Concept Workflow]] | Routed into one of four subfolders under `Concepts/` — `Lecture/` (cross-cutting OS mechanisms), `C Refresher/` (CSCI 2021 prerequisite, one-time build), `Code/` (lab/project implementation patterns), `Exams/` (exam-depth extension of an existing concept) — see Concept-note discipline below |
| Lab | [[Lab Template]] / [[Lab Workflow]] | Goal, procedure, real run output, and a Problem/Fix/Why error log - the lab's actual value, per [[Lab Standard]] |
| Course project | [[Project Template]] / [[Projects Workflow]] | Spec, concept links to the weeks/chapters it draws from, work log, post-submit reflection - plus a short status-tracker Board per project, since each is graded three ways (automated tests, manual error-checking review, individual oral exam) |
| Course preparation | [[Preparation Template]] / [[Preparation Workflow]] | Grading leverage, weekly time budget, must-do habits, and a week-by-week instructional map - this course's own [[20_Progress/Degree/CSCI 4061/Preparation|Preparation]] note is the working example |
## Source hierarchy and trust
1. Live Canvas, Gradescope, Piazza, and instructor announcements control dates, requirements, grading, and policy.
2. The local CSCI 4061 source folder (`D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\`) controls the two textbook PDFs, lecture slide PDFs, lab PDFs, and lecture transcripts once verified - desktop shortcut `CSCI 4061.lnk`.
3. Textbook notes are built directly from the actual APUE/Kleppmann PDF (read with the PDF tool, section by section), not from a NotebookLM intermediary - this course has no established NotebookLM prompt library the way CSCI 4511W/5304 do.
4. User live lecture capture in each week note's `## Lecture` section records what was actually said/emphasized and must be preserved; it does not silently override the textbook.
5. Lab/project starter code, `QUESTIONS.txt` files, and TA slide PDFs are primary sources for lab and project notes - read them directly rather than inferring their content from the week's lecture topic alone.
6. Existing vault notes provide continuity and style, not authority when they conflict with a primary source above.
If a live source and an existing note disagree, update the note with the dated correction and keep the source distinction visible - this course's own [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]] already does this for the lecture-vs-chapter-boundary corrections (permission bits taught during the "Chapter 3 week" are actually APUE §4.5-4.9; buffering taught the same week is APUE Chapter 5, never assigned as its own reading). Never silently choose between two disagreeing primary sources - mark the conflict and ask.
## Weekly operating rhythm
### Before the lecture
1. Read the Board's Schedule row for the week and the matching entry in [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]] - the map already states which chapter(s) are assigned and whether that chapter's note is landed and source-checked.
2. If the chapter note doesn't exist yet, that is the week's first production task: read the actual PDF section by section and build the note directly, following [[Textbook Standard]]'s shape (Chapter Summary, Key Concepts, Full Reading Notes, Worked Example, Connections, Flashcards) - this course's six landed chapters (1, 3, 4, 7, 8, 10) are the working examples.
3. Create/update the week note before class from the schedule, textbook note, and any already-available slide PDFs, under a pre-lecture scaffold - see [[20_Progress/Degree/CSCI 4061/Weekly/Week - 4|Week - 4]] for the live example of this state, including its own explicit warning that pre-lecture content is inferred, not lecture-verified.
### During the lecture
The user works directly in the week note's `## Lecture` header, organized by numbered topic with a `(LecNN, date)` tag per section - exactly the pattern [[20_Progress/Degree/CSCI 4061/Weekly/Week - 1|Week - 1]] through [[20_Progress/Degree/CSCI 4061/Weekly/Week - 3|Week - 3]] already establish. Preserve this live capture; do not have an agent replace it with a polished invented transcript.
### After the lecture
1. Reconcile the live capture against the textbook note(s) - name what lecture added beyond the book and what the book covers that lecture skipped, in a `## Textbook integration` section with an `[!IMPORTANT]` callout naming the main chapters and any coverage gaps.
2. Write the six-part `## Lecture-to-textbook synthesis` (highlight, mechanism, lecture example/scenario, textbook connection, concept links, a closing `[!WARNING]`/`[!SUMMARY]` pair) - this is the section that actually forces the week's material into one coherent claim instead of a list of topics.
3. Add `## Takeaways (questions to resolve)` as real open items to verify on the course Docker container, not rhetorical questions.
4. Update [[20_Progress/Degree/CSCI 4061/Weekly/Weekly Board|Weekly Board]]'s Map and Status sections once the week note is actually reconciled - not before, and not for every sentence added afterward.
## Lab and project workflows
### Labs
Read the lab's real source: the TA slide PDF under the source folder's `Labs/` directory, the lab's starter code and `QUESTIONS.txt` inside the dev container, and the week's own lecture/textbook material the lab builds on. Follow [[Lab Standard]] exactly - Goal in one sentence (not the assignment title), Procedure detailed enough to redo the lab from the note alone, Results stated plainly with real observed output (never claim a test passed without having seen it run), and an Errors + Fixes section with one Problem/Fix/Why entry per real error, since that log is the lab note's actual long-term value. [[20_Progress/Degree/CSCI 4061/Labs/Lab - 2|Lab - 2]] is this course's working example of the full shape, including a real scripted-test failure diagnosed down to its mechanism (orphaned-process-group signal discarding).
### Projects
Each of the four projects pairs a coding submission with an individual oral exam, so the project note needs both a `## Concept Links` section naming the specific weeks/chapters/labs the implementation actually draws from (per [[Project Standard]]) and a companion status-tracker Board (`Project - N Board.md`, `type: index`) that tracks per-task completion against the spec's own point breakdown - see [[20_Progress/Degree/CSCI 4061/Projects/Project - 1 Board|Project - 1 Board]] for the working shape. Record the late-penalty schedule and the "latest submission, not best" grading rule directly in the project note, since both are real, costly traps specific to this course.
## Concept-note discipline
Four concept layers exist in this course now, each a real subfolder under `Concepts/`, and they are not interchangeable - routing a note to the wrong one defeats the point of having four. A concept note is never a record of what a source said (that's the Weekly or Textbook note's job); it is a record of what can be explained and applied without reopening the source, held to [[Concept Standard]]'s full bar - no bland restated-fact header, no section kept just because the template has a slot for it. If a section would only repeat the Mechanism in different words, cut it.

**`Concepts/C Refresher/`** rebuilds the CSCI 2021 prerequisite this course assumes but never re-teaches - pointers, arrays/strings, structs, dynamic memory, linked structures, recursion, file I/O, compilation/linking, bitwise/integer representation, x86-64 memory layout. Landed as ten source-grounded notes plus the [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/C Language|C Language]] hub - this is the working gold example for this course's hub-note shape and is mostly a one-time build, revisited only when lab or project work exposes a real gap in it, never on a schedule.

**`Concepts/Lecture/`** is where a genuinely cross-cutting 4061 mechanism goes once it has recurred across three or more weeks of OS material - the process lifecycle (fork/exec/wait, zombie/orphan/daemon), the fd → system-file-table → inode chain, the signal-delivery/default-disposition/blocking model. Source priority is the lecture slide PDF first, reconciled against the matching textbook chapter and the week note's own live `## Lecture` capture - never the reverse. Empty as of 2026-10-05; populating it from Weeks 1-4 is the course's main open concept-layer gap right now.

**`Concepts/Code/`** holds concept notes that originate from a lab's or project's own implementation - a pattern worth carrying forward (the fork-exec-wait skeleton from Lab 1/2's `fork_exec.c`/`fork_wait.c`, a signal-masking trap from Lab 3's `wc_signal.c`, a piece of Project 1's own architecture) rather than a lecture topic treated in the abstract. These notes cite the actual starter code and `QUESTIONS.txt` from the dev container, never a paraphrase of the assignment's prompt. Empty as of 2026-10-05 - Labs 1 and 2 and Project 1 have not yet been pulled into this layer.

**`Concepts/Exams/`** is the narrowest layer and the easiest to get wrong: a note here is never a new explanation, only the exam-depth extension of a concept that already has a home in `Lecture/`, `C Refresher/`, `Code/`, a Weekly note, or a Textbook chapter. It exists because the exam will test a distinction the source-layer note only treats in passing - it interlinks back to that source note rather than re-deriving it, and earns its place by naming specifically what's confusing (a sequencing trap in fork/exec ordering, a signal-masking edge case, an off-by-one in the fd table after `dup2`) and drilling exactly that, not the surrounding topic. [[20_Progress/Degree/CSCI 4061/Concepts/Exams/Midterm - 1 MOC|Midterm - 1 MOC]] is this layer's hub per exam - its Map section should read as connected prose that walks the exam's actual scope and links out mid-sentence to every concept note it draws from, the same shape [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/C Language|C Language]] already demonstrates, never a bare bullet list of links.

**Writing standard across all four layers:** follow [[Concept Standard]]'s per-heading requirements exactly, and on top of that, write interlinks inline, inside the sentence that needs them (" - the same **fd table** `dup2` rewrites, see [[...|fd/inode chain]] - "), not as a trailing "Related:" dump; this is what actually makes the vault's graph useful mid-read, per [[HUMAN_WRITING]]. Never pad a section to look complete - a short Contrast naming the one real confusable pair beats a long one restating the Mechanism. Flashcards test the trap, never the label, and should be written only after the actual misconception is named in Failure Modes, so the card and the note test the same pain point from two angles.
## Exam-period workflow
When a midterm or the final is near:
1. Confirm its exact scope and resource policy from Canvas directly - the Board states that exam resource rules are announced per-exam and should not be assumed to default to closed-book.
2. Identify every relevant week, textbook chapter, lab, and project note the exam's stated scope touches.
3. Deepen the Concepts layer for anything genuinely load-bearing and not yet promoted out of a Weekly/Textbook note.
4. Drill the accumulated `#cards/csci4061` flashcard deck (and `#cards/csci2021` for anything the C Refresher layer should have already locked in) rather than re-reading week notes passively.
5. Record the post-exam diagnosis in [[20_Progress/Degree/CSCI 4061/Preparation|Preparation]]'s Common Mistakes / Traps section and feed any recurring pattern into the next exam's preparation.
## Status and handoff
Use `seed` for a newly created scaffold, `sprout` for a source-grounded working note, `tree` only once a note is stable and unlikely to need further structural change (most of this course's chapter notes are already there, having been through two source-checking passes). Every active note should leave a concrete `next`: source to read, lecture to live-capture, assignment step, or link to verify.
## Stop-and-ask conditions
Ask the user or verify the live source when: a Canvas/Gradescope date conflicts with the Board's own schedule table; a lab/project's starter code or `QUESTIONS.txt` isn't yet available in the dev container to ground a note from; a lecture's topic doesn't match its textbook-map-predicted chapter closely enough to reconcile confidently; an exam's resource policy hasn't been announced yet; or a C Refresher concept note would need content from CSCI 2021 material that was never actually covered in that course (don't fabricate coverage that doesn't exist - name the gap instead).
## Done conditions for this course workflow
- The current Board is the authority for schedule, grading, and policy.
- Weekly notes are prepared before lecture, capture the user's live work untouched, and are reconciled (textbook integration + synthesis) afterward.
- Textbook notes are built directly from the real APUE/Kleppmann PDF and source-checked, not invented.
- Lab notes carry real observed run output and a genuine Problem/Fix/Why error log.
- Project notes carry verified Concept Links and a companion status-tracker Board.
- Cross-cutting 4061 concepts and the one-time C Refresher layer stay in their separate folders and are not conflated.
- Unknowns (unverified exam policy, unconfirmed schedule changes, genuine CSCI 2021 coverage gaps) remain visible instead of being guessed past.
