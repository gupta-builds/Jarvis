---
type: system
system_kind: guide
status: sprout
created: 2026-10-21
updated: 2026-11-19
tags:
  - system
  - workflow
  - CSCI4521
notes:
  - "[[Course Production Workflow]]"
  - "[[Weekly Workflow]]"
  - "[[Textbook Workflow]]"
  - "[[Textbook Map Workflow]]"
  - "[[Concept Workflow]]"
  - "[[Homework Workflow]]"
  - "[[Exam Workflow]]"
  - "[[Quiz Workflow]]"
  - "[[CSCI 4521 Board]]"
---
# CSCI 4521 Workflow
This is the course-specific routing contract for Applied Machine Learning. It works with the course Board and the generic course standards/workflows. The Board remains the authority for dates, weights, and the Fall-2025-label/ENLP/Linear-Algebra-Notes/PyTorch-series open questions; this note explains how to turn those facts into notes, week after week, without re-deriving the process each time.
## Course shape
No midterm or final exam exists for this course - grading is Homework 1-4 (40%, each a Jupyter notebook paired with a short written PDF report), Quizzes 1-6 (30%, biweekly, in class on Thursdays, two pages of notes allowed), a student-led Final Project (20%, proposal + presentation + code, roughly 2x a single homework in effort), and Participation (10%, graded on completion/effort, lowest 3 chime-in activities dropped automatically, cannot be made up otherwise). The instructor teaches live by writing code in Google Colab rather than presenting pre-built slides for every minute - decks exist and are the primary record of what was *said*, but a non-trivial share of lectures (1.1 is the clearest example: no deck exists, the `.ipynb` notebook is the lecture) live only as a notebook. Three textbooks support the course: *An Introduction to Statistical Learning* (ISL, primary), *Deep Learning* (DLB, Goodfellow/Bengio/Courville, secondary), and *Elements of Natural Language Processing* (ENLP, assigned from Week 4 onward for the NLP unit). The known assessment routing is:

| Course work | Template/workflow | Note purpose |
|---|---|---|
| Weekly lecture | [[Week Template]] / [[Weekly Workflow]] | Pre-lecture source prep (deck + companion notebook), protected live capture, post-lecture reconciliation against the textbook |
| Textbook chapter | [[Textbook Template]] / [[Textbook Workflow]] | Short (under 3,000 words) NotebookLM-built note per section group, with a Reading Guide and EXPLAIN callouts and no flashcards. A long chapter becomes `Chapter - N (Part 2)` |
| Concept or cross-cutting mechanism | [[Concept Template]] / [[Concept Workflow]] | None exist yet for this course - see Concept-note discipline below before creating the first one |
| Homework | [[Homework Template]] / [[Homework Workflow]] | The notebook's real computed numbers/figures plus the written report's actual claims - never the assignment prompt restated |
| Quiz | [[Quiz Template]] / [[Quiz Workflow]], and [[Exam Material Template]] for the cheatsheet | Per quiz, under `20_Progress/Degree/CSCI 4521/Quizzes/`: `Quiz - N Cheatsheet` before it, `Quiz - N` (questions, worked solutions, sources, misses) after it. No scope-and-format exam day exists, so there is no `class_kind: exam` sheet |
| Final Project | [[Project Template]] / [[Projects Workflow]] | Proposal, concept links to the units it draws from, work log - no Project folder exists yet; create one once the interest-form/proposal step (Week 9+) actually starts |
| Course preparation | [[Preparation Template]] / [[Preparation Workflow]] | Grading leverage, weekly time budget, real traps - this course's own [[20_Progress/Degree/CSCI 4521/Preparation|Preparation]] note is the working example |
## Source hierarchy and trust
1. Live Canvas, Piazza, and instructor announcements control dates, requirements, and policy - but confirm the instructor identity, meeting time, and TA roster against Canvas before trusting them: the source syllabus PDF is dated "Fall 2025" and has never been separately checked against this semester's actual page, per [[CSCI 4521 Board]]'s standing warning.
2. The professor's own course-schedule spreadsheet (linked from [[CSCI 4521 Board]]'s Source of Truth section) is the real week-by-week calendar - the syllabus PDF itself has no dates, only five topic units. Trust the spreadsheet over any date inferred from the syllabus's unit list.
3. The local CSCI 4521 source folder (`D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\`) controls the three textbook PDFs, lecture slide decks, companion `.ipynb` notebooks, and homework files. **Correction made 2026-10-21 on the Board:** the ENLP PDF (`Textbook & Resources/ENLP Textbook CSCI 4521.pdf`) is already present locally - the Textbook Map already had this right, but the Board's Source of Truth paragraph still claimed it was missing until this pass fixed it. Don't let a stale "missing" label block building an ENLP chapter note.
4. Per lecture, a real deck outranks a companion notebook for the *concept* framing, but the notebook outranks the deck for *real computed numbers* (accuracy figures, predicted classes, plot behavior) - never invent a number the deck doesn't show when a notebook exists with the real one, and vice versa never flatten a notebook's real narrative arc (e.g. 1.1's normalization-changes-the-prediction finding) into a generic restatement of the deck's framing.
5. Textbook notes follow the NotebookLM route in [[Textbook Workflow]] and [[Repetitive Things]]: MinerU extracts the pages ([[PDF Extraction]], never `Read` on the PDF), one short prompt per section group runs in Notebook, and the output is checked against the extraction. Chapters written before 2026-11-19 (Weeks 1 to 7) were built directly from the PDF and are marked for a Notebook re-run when their Part is next touched. Weeks 8 to 11 were written from MinerU extractions on 2026-11-19 because Notebook was not available that session.
6. User live lecture capture in each week note's `## Lecture` section records what was actually said/emphasized in the live-coded Colab session and must be preserved; it does not silently override the textbook, and the textbook does not silently override it either when the two add different things.
7. Existing vault notes provide continuity and style, not authority, when they conflict with a primary source above.
If a live source and an existing note disagree, update the note with the dated correction and keep the source distinction visible, the way this section's ENLP correction is now logged. Never silently choose between two disagreeing primary sources; mark the conflict and ask.
## Weekly operating rhythm
### Before the lecture
1. Read the Board's Schedule row for the week and the matching entry in [[20_Progress/Degree/CSCI 4521/Textbook/Textbook Map|Textbook Map]] - the map states which book-and-section is assigned and whether that chapter's note is landed.
2. If the chapter note doesn't exist yet, that is the week's first production task: extract the pages with [[PDF Extraction]] (`-Pages`), run the Notebook prompt, and build the note to [[Textbook Standard]] (Chapter Summary, Reading Guide, Key Concepts, Full Reading Notes with EXPLAIN callouts, Worked Example, Connections, Open Questions). No flashcards.
3. Check the lecture source folder for that week's real deck(s) and companion notebook(s) before assuming only a deck exists - a lecture with no deck (the 1.1 pattern) is not a gap, the notebook is primary; verify this directly rather than concluding "no source" the way an earlier pass on this course once did.
4. Create/update the week note before class from the schedule, textbook note, and whatever source files already exist, under a pre-lecture scaffold labeled `Pre-lecture source notes` in the Lecture area, per [[Course Production Workflow]].
### During the lecture
The user works directly in the week note's `## Lecture` section, capturing what the professor actually writes/says live in Colab - not a polished rebuild of the deck's own slide text. Preserve this live capture exactly; do not have an agent replace it with an invented transcript, and do not assume the deck already covers everything said live, since live-coded sessions regularly add worked detail the deck doesn't show.
### After the lecture
1. Reconcile the live capture against the textbook note(s) and the lecture's own deck/notebook - name what lecture added beyond the source material and what the source covers that lecture skipped, in a `## Textbook integration` section.
2. Write the six-part `## Lecture-to-textbook synthesis` (one highlighted definition, `*Mechanism:*`, a real lecture example/scenario, textbook connection, concept links or `None created` if none exist yet, a closing `[!WARNING]`/`[!SUMMARY]` pair) - this is the section that forces the week's material into one coherent claim rather than a list of topics, per [[Weekly Standard]].
3. Add `## Takeaways (questions to resolve)` as real open items, not rhetorical questions.
4. Update [[20_Progress/Degree/CSCI 4521/Weekly/Weekly Board|Weekly Board]]'s Map and Status and [[20_Progress/Degree/CSCI 4521/Textbook/Textbook Map|Textbook Map]]'s Status once the week's notes actually land - not before, and not for every sentence added afterward.
## Homework and Final Project workflows
### Homework
Each of the four homeworks pairs a real, deterministic Jupyter notebook (fixed random seed - every run gives the same numbers, per the source folder's own `Homework/README.md`) with a short written report. Read the notebook's real computed figures and the report's real written claims directly - per [[Homework Standard]], a homework note records what the submission actually did and found, never a restatement of the assignment prompt. Regrade requests go to the TA who originally graded within 7 calendar days; escalation path is named graduate TAs, then the instructor.
### Final Project
Student-led, proposal + presentation + code, roughly 2x a single homework's weight/effort. No Project folder exists yet as of 2026-10-21 - create `20_Progress/Degree/CSCI 4521/Project/` once the group-interest-form step (Week 9, per the Board's schedule) actually starts, following [[Project Standard]] and [[Projects Workflow]], with a `## Concept Links` section naming the specific units/weeks the proposed project draws from.
## Concept-note discipline
Zero concept notes exist for this course as of 2026-10-21 - the Weekly and Textbook layers have carried the material so far. Create the first one only once a mechanism has recurred across multiple lectures/weeks and genuinely needs its own reusable, cross-referenced treatment beyond what a Weekly or Textbook note already gives it - the strongest early candidates, not yet created, are **bias-variance tradeoff** (the throughline of Lectures 1.2-1.5, directly tested by the kNN-k-sweep notebook) and **the five named bias types in ML data** (Lecture 1.5's ethics unit, which the Board flags as graded quiz material). Follow [[Concept Standard]]'s full bar exactly - no bland restated-fact header, no section kept just because the template has a slot for it; cut anything that would only repeat the Mechanism in different words.
## Quiz-period workflow
Quizzes are biweekly, in class, two pages of notes allowed, and framed as "interpret this method's results on a new dataset". Each quiz leaves two notes in `Quizzes/`, per [[Quiz Workflow]]:
1. Confirm the scope from the Board's schedule row (the lectures since the previous quiz). The five scheduled quizzes fall on weeks 3, 5, 7, 9 and 11 (9/24, 10/8, 10/22, 11/5, 11/19). The syllabus says six, and the sixth is not visible in the schedule.
2. Before the quiz, `Quiz - N Cheatsheet` ([[Exam Material Template]]): one block per topic with the formulas, the code shape and links to the week, textbook note and concept.
3. After the quiz, `Quiz - N` ([[Quiz Template]]): each question with its worked solution and a `*Sources:*` line linking the week, textbook note, slide, notebook, homework and concept.
4. Mistakes and Gaps feeds [[20_Progress/Degree/CSCI 4521/Preparation|Preparation]]'s traps and the next cheatsheet. Cards only for real misses.
## Study loop
Reading and testing are tracked, not assumed. Each textbook note's Reading Guide and each week's Takeaways are `- [ ]` tasks, cards live only on week, concept and quiz notes, and the `coach` agent ([[Orchestration]]) reads the checkbox counts, the spaced-repetition review data and the quiz Mistakes and Gaps sections to report what was read, what was drilled, and where the weak and strong topics are. It asks questions and grades them against the notes. It never marks something done on the student's behalf.
## Status and handoff
Use `seed` for a newly created scaffold, `sprout` for a source-grounded working note, `tree` only once a note is stable and unlikely to need further structural change. Every active note should leave a concrete `next`: source to read, lecture to live-capture, assignment step, or link to verify.
## Stop-and-ask conditions
Ask the user or verify the live source when: a Canvas date conflicts with the Board's own schedule-spreadsheet table; a lecture's real source folder has neither a deck nor a notebook for a scheduled topic (don't infer lecture content from the unit list alone); the ENLP, Linear Algebra Notes, or PyTorch-intro-series reading named in the schedule still isn't locatable once actually searched for; a quiz's real in-class scope doesn't match the two-week window the schedule implies; or a proof/result in a landed note conflicts between what a deck shows and what a companion notebook actually computes (state both, source-attributed, rather than picking one silently).
## Done conditions for this course workflow
- The Board is the authority for schedule, grading, and the open Fall-2025-label/ENLP/resource questions.
- A real deck or notebook always outranks inferred content for that lecture; a lecture with no deck is checked for a notebook before being logged as a gap.
- Textbook notes are built directly from the real ISL/DLB/ENLP PDF, section by section, never invented from the syllabus's unit list or a chapter title alone.
- No concept note exists without having earned its place across multiple weeks' worth of recurring use.
- Quiz prep is built as interpret-a-result drill material matching the real quiz format, not a textbook-recall review sheet.
- Unknowns (unconfirmed Fall'26 roster, un-located readings, quiz-scope ambiguity) remain visible instead of being guessed past.
