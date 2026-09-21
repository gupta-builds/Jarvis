---
type: evergreen
status: sprout
created: 2026-09-20
updated: 2026-09-20
tags:
  - system
  - workflow
  - CSCI4511W
notes:
  - "[[Course Production Workflow]]"
  - "[[Weekly Workflow]]"
  - "[[Textbook Workflow]]"
  - "[[Homework Workflow]]"
  - "[[Exam Workflow]]"
  - "[[CSCI 4511W Board]]"
---
# CSCI 4511W Workflow
This is the course-specific routing contract for Introduction to Artificial Intelligence. It works with the course Board and the generic course standards/workflows. The Board remains the authority for changing dates, weights, policies, and unresolved facts; this note explains how to turn those facts into notes.
## Course shape
The course has two lecture meetings each week, a discussion layer, textbook reading, problem sets, writing assignments, short quizzes, long quizzes, and a final project. The current Board records the live syllabus/modules capture, Russell and Norvig's *Artificial Intelligence: A Modern Approach* as the textbook, and the current course schedule. Use the Board for the exact date and reading row instead of copying a second schedule here.
The known assessment routing is:

| Course work | Template/workflow | Note purpose |
|---|---|---|
| Weekly lecture | [[Week Template]] / [[Weekly Workflow]] | Pre-lecture preparation, protected live capture, and post-lecture synthesis |
| Textbook chapter/section | [[Textbook Template]] / [[Textbook Workflow]] | Source-checked chapter explanation produced from the landed source and established NotebookLM prompt |
| Concept or definition | [[Concept Template]] / [[Concept Workflow]] | Canonical mechanism, contrast, failure mode, evidence, and cards |
| Discussion/readings | [[Discussion Template]] / [[Discussion Workflow]] | Claims, evidence, objections, corrections, and follow-up |
| Problem set | [[Homework Template]] / [[Homework Workflow]] | Written and coding requirements, work log, tests, code review, and reflection |
| Writing assignment | [[Homework Template]] / [[Homework Workflow]] | Research question/thesis, evidence, structure, citations, feedback, and revision |
| Short quiz | [[Homework Template]] when a durable record is useful | Recent-material retrieval, allowed-resource rule, missed reasoning, and follow-up |
| Long quiz | [[Exam Sheet Template]] / [[Exam Workflow]] | Exact scope/rules, limited-resource preparation, and post-quiz diagnosis |
| Final project | [[Project Template]] / [[Projects Workflow]] | Options, chosen mechanism, implementation evidence, submission, and reflection |
| Course preparation | [[Preparation Template]] / [[Preparation Workflow]] | Weekly cadence, grading leverage, traps, and time budget |
## Source hierarchy and trust
1. Live syllabus/Canvas modules and instructor announcements control dates, requirements, grading, and permissions.
2. The local CSCI 4511W source folder controls textbook PDFs, discussion readings, lecture slides, notebooks, and other provided files once verified.
3. Textbook notes are derived from the actual textbook/source through the established NotebookLM prompt and then checked/arranged in Obsidian.
4. User live lecture capture records what was actually said/emphasized and must be preserved; it does not silently override the textbook or published policy.
5. Assignments, tests, discussion corrections, and grading feedback provide application evidence and may expose what the course expects.
6. Existing vault notes provide continuity and style, not authority when they conflict with a primary course source.
If a live source and an existing note disagree, update the note with the dated correction and keep the source distinction visible. If two primary sources disagree, stop and ask or verify; never smooth the conflict away.
## Weekly operating rhythm
### Before the lecture
1. Read the Board's current schedule row and identify the assigned AIMA section/module, date, quiz/assignment, and discussion connection.
2. Confirm the textbook source is in the course folder. Run the established NotebookLM textbook prompt on the correct section when output is needed; then follow [[Textbook Workflow]] to check and arrange it.
3. Create/update the week note before class. Put slide/PDF/source notes in `## Lecture` under a `Pre-lecture source notes` label. Do not make a separate temporary lecture note.
4. Create/update concept notes from the textbook, available lecture slides, PDFs, Python/notebook code, discussion reading, and existing course material. Keep predicted emphasis or uncertainty labeled.
5. Add the relevant textbook/weekly/concept links and a small set of questions the lecture should answer.
### During the lecture
The user works directly in the weekly note's `## Lecture` header. Preserve this live capture as human source material. Do not have an agent replace it with a polished invented transcript. If source notes already exist there, keep them visibly separate from `Live lecture capture`; additions may be timestamped or placed under the lecture's real section structure.
### After the lecture
1. Re-read the live capture while the context is fresh.
2. Reconcile it against the textbook note, slides/PDFs, code/notebooks, discussion reading, and assignment requirements.
3. Update `What you must be able to do`, short key ideas, examples, textbook integration, synthesis, questions, concept evidence, and flashcards.
4. Update concept notes with actual emphasis, corrections, implementation details, contrasts, and failure modes. Do not duplicate the whole lecture into every concept.
5. Route work to the correct assignment/discussion/project note and update the Board, Weekly Board, Textbook Map, and `next` only when the links/statuses are true.
## Textbook and concept production rule
Textbook content should be landed before the lecture whenever the source is available. The textbook note explains the chapter's mechanism and what it adds; the weekly note explains the teaching arc and lecture-to-textbook delta; the concept note preserves the reusable mechanism. These are three layers, not three copies of the same prose.
For AI topics, concept notes should capture representations, agent/environment assumptions, search states/actions/costs, algorithm steps, guarantees, complexity, heuristic/admissibility conditions, logical semantics, and failure cases when those are present in the source. Do not add standard AI knowledge merely because it sounds plausible; anchor it to the assigned source or label it as a question.
## Assignment workflows
### Problem sets
Use one Homework note per problem set. Split written and coding deliverables, record individual-work rules, tests, files, rubric constraints, and the submission destination. If coding requires a TA review, track the separate review deadline and completion within the course's stated window. The work log must record approaches, counterexamples, test output, and fixes. After feedback, turn recurring algorithm/reasoning mistakes into concept updates and exam practice.
### Writing assignments
Use the Homework template, but add sections for research question/thesis, evidence/source map, outline/draft decisions, computer-science citation/style requirements, feedback, and revision. Track the progressive academic-writing expectations across assignments. Do not represent a draft as submitted or a citation as verified without evidence.
### Short quizzes
Record the exact date/topic and any missed reasoning when a note will help retrieval. The Board currently records these as open-resource and open-collaboration, but still verify the live rule for the specific quiz. Do not carry short-quiz collaboration rules into long quizzes, problem sets, writing assignments, or the final project.
### Long quizzes
Use an Exam Sheet note. Build scope from the current Board/review announcement and prepare for the recorded individual, in-person, 45-minute format with the permitted personal-note limit. Treat these as exam-style practice: strengthen concepts, drill cards, solve timed questions, and record post-quiz causes of misses.
### Final project
Use the Project template from assignment release. Read the full prompt, rubric, options, starter files, and references; document every option before selecting one. Record the actual AI mechanism, data/representation, algorithm, parameters, tests, writing/citation requirements, and academic-integrity rule. The final project is not automatically governed by the collaboration rules for labs or short quizzes.
### Discussion
Use one Discussion note per reading/discussion when the discussion has substantive work. The current Board strongly supports a Friday discussion cadence but the exact meeting time remains an unresolved verification item. Record the reading, claims, objections, paper-writing practice, corrections, participation task, and follow-up without inventing attendance or consensus.
## Assessment-boundary rules
The Board records the course's current categories and weights: problem sets, writing assignments, short quizzes, long quizzes, final project, discussion participation, and ungraded recommended readings. Preserve the exact current percentages and counts in the Board and assessment notes rather than duplicating them here. Collaboration and tool permissions are assessment-specific. When uncertain, consult the live course source before writing or acting.
## Exam-period workflow
When a long quiz or other major assessment is nearby:
1. Confirm its scope and rules from the current Board/review source.
2. Identify every relevant weekly, textbook, concept, homework, discussion, and project note.
3. Deepen the main concept notes with exact mechanisms, comparisons, worked search/logic reasoning, edge cases, and course-specific examples.
4. Review flashcards for each relevant concept and add cards for recurring misses.
5. Solve the planned questions under the real collaboration/resource/time constraints.
6. Record the post-assessment diagnosis and feed the pattern into Preparation and the next Exam note.
## Status and handoff
Use `seed` for a newly created scaffold, `sprout` for a source-grounded working note, and the course's stable status convention only when the note has been reconciled and linked. Every active note should leave a concrete `next`: source to read, lecture capture to reconcile, assignment step, link to verify, or question to ask.
## Stop-and-ask conditions
Ask the user or verify the live source when the exact discussion time is needed, +/- grade cutoffs are assumed, a Canvas date conflicts with the Board, a source file is missing, a collaboration/AI rule is unclear, an assignment option is incomplete, a NotebookLM output is unsupported, or a lecture capture is too ambiguous to interpret safely.
## Done conditions for this course workflow
- The current Board is the authority for schedule, grading, and policy.
- Weekly notes are prepared before lecture, capture the user's live work, and are reconciled afterward.
- Textbook notes are source-checked NotebookLM-derived outputs arranged for Obsidian.
- Concepts are created early and enriched by actual lecture/assignment evidence.
- Every assessment type routes to the correct template and preserves its own rules.
- Exam preparation uses rich concepts, flashcards, and active questions, followed by honest diagnosis.
- Unknowns remain visible instead of being guessed.
