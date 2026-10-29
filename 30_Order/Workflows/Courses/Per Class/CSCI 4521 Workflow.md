---
type: system
system_kind: guide
status: sprout
created: 2026-10-21
updated: 2026-10-21
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
  - "[[CSCI 4521 Board]]"
---
# CSCI 4521 Workflow
This is the course-specific routing contract for Applied Machine Learning. It works with the course Board and the generic course standards/workflows. The Board remains the authority for dates, weights, and the Fall-2025-label/ENLP/Linear-Algebra-Notes/PyTorch-series open questions; this note explains how to turn those facts into notes, week after week, without re-deriving the process each time.
## Course shape
No midterm or final exam exists for this course - grading is Homework 1-4 (40%, each a Jupyter notebook paired with a short written PDF report), Quizzes 1-6 (30%, biweekly, in class on Thursdays, two pages of notes allowed), a student-led Final Project (20%, proposal + presentation + code, roughly 2x a single homework in effort), and Participation (10%, graded on completion/effort, lowest 3 chime-in activities dropped automatically, cannot be made up otherwise). The instructor teaches live by writing code in Google Colab rather than presenting pre-built slides for every minute - decks exist and are the primary record of what was *said*, but a non-trivial share of lectures (1.1 is the clearest example: no deck exists, the `.ipynb` notebook is the lecture) live only as a notebook. Three textbooks support the course: *An Introduction to Statistical Learning* (ISL, primary), *Deep Learning* (DLB, Goodfellow/Bengio/Courville, secondary), and *Elements of Natural Language Processing* (ENLP, assigned from Week 4 onward for the NLP unit). The known assessment routing is:

| Course work | Template/workflow | Note purpose |
|---|---|---|
| Weekly lecture | [[Week Template]] / [[Weekly Workflow]] | Pre-lecture source prep (deck + companion notebook), protected live capture, post-lecture reconciliation against the textbook |
| Textbook chapter | [[Textbook Template]] / [[Textbook Workflow]] | Source-checked chapter note built directly from the real ISL/DLB/ENLP PDF, one canonical note per book-and-chapter even when a chapter spans weeks |
| Concept or cross-cutting mechanism | [[Concept Template]] / [[Concept Workflow]] | None exist yet for this course - see Concept-note discipline below before creating the first one |
| Homework | [[Homework Template]] / [[Homework Workflow]] | The notebook's real computed numbers/figures plus the written report's actual claims - never the assignment prompt restated |
| Quiz practice | [[Exam Material Template]] / [[Exam Workflow]] | A drill bank of interpret-the-result questions on an unfamiliar dataset, matching the quiz's real format (see Quiz-period workflow below) - quizzes themselves are not a `class_kind: exam` sheet, since there is no scope-and-format exam day to track, just a recurring graded checkpoint |
| Final Project | [[Project Template]] / [[Projects Workflow]] | Proposal, concept links to the units it draws from, work log - no Project folder exists yet; create one once the interest-form/proposal step (Week 9+) actually starts |
| Course preparation | [[Preparation Template]] / [[Preparation Workflow]] | Grading leverage, weekly time budget, real traps - this course's own [[20_Progress/Degree/CSCI 4521/Preparation|Preparation]] note is the working example |
## Source hierarchy and trust
1. Live Canvas, Piazza, and instructor announcements control dates, requirements, and policy - but confirm the instructor identity, meeting time, and TA roster against Canvas before trusting them: the source syllabus PDF is dated "Fall 2025" and has never been separately checked against this semester's actual page, per [[CSCI 4521 Board]]'s standing warning.
2. The professor's own course-schedule spreadsheet (linked from [[CSCI 4521 Board]]'s Source of Truth section) is the real week-by-week calendar - the syllabus PDF itself has no dates, only five topic units. Trust the spreadsheet over any date inferred from the syllabus's unit list.
3. The local CSCI 4521 source folder (`D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\`) controls the three textbook PDFs, lecture slide decks, companion `.ipynb` notebooks, and homework files. **Correction made 2026-10-21 on the Board:** the ENLP PDF (`Textbook & Resources/ENLP Textbook CSCI 4521.pdf`) is already present locally - the Textbook Map already had this right, but the Board's Source of Truth paragraph still claimed it was missing until this pass fixed it. Don't let a stale "missing" label block building an ENLP chapter note.
4. Per lecture, a real deck outranks a companion notebook for the *concept* framing, but the notebook outranks the deck for *real computed numbers* (accuracy figures, predicted classes, plot behavior) - never invent a number the deck doesn't show when a notebook exists with the real one, and vice versa never flatten a notebook's real narrative arc (e.g. 1.1's normalization-changes-the-prediction finding) into a generic restatement of the deck's framing.
5. Textbook notes are built directly from the real ISL/DLB/ENLP PDF, section by section, with the text extracted by MinerU per [[PDF Extraction]] (never `Read` on the PDF) - this course has no established NotebookLM prompt library the way CSCI 4511W/5304 do, and no local PDF-text-extraction blocker either (confirmed working as of the 2026-10-21 build pass, superseding the Textbook Map's older "needs review - PDF text check pending" status on the four Week 1-2 chapter notes).
6. User live lecture capture in each week note's `## Lecture` section records what was actually said/emphasized in the live-coded Colab session and must be preserved; it does not silently override the textbook, and the textbook does not silently override it either when the two add different things.
7. Existing vault notes provide continuity and style, not authority, when they conflict with a primary source above.
If a live source and an existing note disagree, update the note with the dated correction and keep the source distinction visible, the way this section's ENLP correction is now logged. Never silently choose between two disagreeing primary sources; mark the conflict and ask.
## Weekly operating rhythm
### Before the lecture
1. Read the Board's Schedule row for the week and the matching entry in [[20_Progress/Degree/CSCI 4521/Textbook/Textbook Map|Textbook Map]] - the map states which book-and-section is assigned and whether that chapter's note is landed.
2. If the chapter note doesn't exist yet, that's the week's first production task: parse the chapter's pages from the actual ISL/DLB/ENLP PDF with [[PDF Extraction]] (`-Pages`), read it section by section, and build the note directly, following [[Textbook Standard]]'s shape (Chapter Summary, Key Concepts, Examples Worth Keeping, Connections, Open Questions, Flashcards).
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
Quizzes are biweekly, in class, two pages of notes allowed, and explicitly framed by the syllabus as "interpret this method's results on a new dataset" rather than textbook recall - this changes what counts as useful prep. When a quiz is announced or its date is close:
1. Confirm its real scope from the Board's Schedule row (which lecture range falls in the two-week window since the last quiz) rather than assuming "everything so far."
2. Build the quiz's study material as an [[Exam Material Template]] note (`class_kind: exam-material`) under `20_Progress/Degree/CSCI 4521/Quiz/` (create this folder on first use) - a short Scope paragraph naming the quiz, the weeks it covers, and where the items came from, then numbered interpret-a-result drills grouped by topic (never a plain fact-recall quiz, matching the real format), with an Answer Key kept separate so the bank can be used cold.
3. Deepen any Concepts-layer note that's genuinely load-bearing for that window before drilling - don't turn every Weekly note into a cram note.
4. After the quiz, log what actually tripped you up in [[20_Progress/Degree/CSCI 4521/Preparation|Preparation]]'s traps section, and feed any recurring pattern into the next quiz's drill bank.
5. If a graded quiz copy itself gets filed (not a drill bank, the actual submitted/returned quiz), it stays under [[Homework Standard]] per [[Exam Material Standard]]'s own legacy-shape note - do not create a `class_kind: exam` sheet for it, since there is no single exam-day scope-and-format record to build; that family is reserved for the midterm/final shape this course doesn't have.
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
