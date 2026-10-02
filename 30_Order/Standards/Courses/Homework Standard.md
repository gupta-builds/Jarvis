---
type: evergreen
status: sprout
created: 2026-09-20
updated: 2026-09-20
tags:
  - system
  - standards
notes:
  - "[[Homework Template]]"
---
# Homework Standard
==A homework note is a reproducible record of the task, the attempted reasoning, the evidence from tests or feedback, and the mistake pattern to carry forward.==
This standard governs problem sets, coding assignments, written exercises, quizzes treated as assignments, and writing assignments when they do not need the richer Project structure. For a multi-week artifact with alternatives, use [[Project Template]] instead. For a live discussion reading, use [[Discussion Template]].
## Frontmatter
Keep `type: class`, `input_kind: homework`, `status`, dates, course Board in `area`, verified `deadline`, tags, and `next`. Record a deadline only when sourced. Add related week/chapter/concept links after verifying them. Never mark an assignment complete merely because a file exists; completion means the required deliverables were submitted or the note explicitly records the remaining state.
## Overview
In one to three sentences state what must be produced, for whom, and why the task exists in the course. Include the due date and submission location only when verified. For CSCI 4511W-style problem sets, distinguish the written and coding portions and record the separate code-review window when required; a code review deadline is not the same as the submission deadline.
## Requirements
Translate the prompt and rubric into a checklist. Include every deliverable, file format, question, proof/derivation requirement, test requirement, citation/style constraint, collaboration rule, and submission step. Preserve the instructor's wording for requirements that affect grading. Split `Must submit`, `Must demonstrate`, and `Must not do` when that prevents confusion.
Do not turn an implied quality expectation into a published requirement. Label agent/user estimates as estimates.
## Work log
Record attempts in chronological order, but keep entries mechanism-rich rather than diary-like. Each meaningful entry should say what was tried, what happened, the evidence (test output, grader comment, counterexample, or error), the diagnosis, and the next action. For code, include the relevant function/interface and test case; for writing, include thesis/outline/citation decisions and the feedback that changed them.
Never claim a test passed without running it or seeing trustworthy output. Never paste a large source solution when a concise explanation and link are sufficient.
## Concepts used
Link only to concepts actually used or deliberately practiced. Add a short note after each link explaining the role: e.g. "A* uses this heuristic admissibility condition" or "this recursion pattern is the reason the parser terminates." Create/update the canonical concept note when the assignment exposes a reusable mechanism or failure mode.
## Submission record
The template has no dedicated heading, so add a short `### Submission` section when the work is submitted. Record submitted timestamp, destination, commit/file identifier if relevant, code-review completion, and any instructor/automated receipt. Do not store private credentials or sensitive submission tokens.
## Post-submit reflection
Complete after feedback or grading. Identify the first failure, the underlying pattern, the evidence that revealed it, and the one behavior or test to add next time. Distinguish knowledge gaps, misread requirements, implementation bugs, time-management failures, and submission/process failures. Link the corrected concept or checklist item.
## Update propagation
Before the lecture, use upcoming requirements to identify concepts to prepare. After the assignment, update the relevant weekly note, concept note, preparation note, and exam review queue. During exam preparation, mine work logs and grader feedback for rich concept explanations and flashcards; do not turn every procedural detail into a card.
## Academic-integrity boundary
Record the course's collaboration and tool rules in the note. For CSCI 4511W, separate allowed collaboration on short quizzes/labs from individual-only problem sets, writing assignments, long quizzes, and final-project work as verified by the Board. Never generate or represent a submission as the student's own work without the student's understanding and review.
## Assignment-type routing
Use this note for a bounded problem set, coding/written homework, short quiz record, or writing assignment. For a problem set, separate written reasoning from code and record any required TA/code review window. For a writing assignment, track prompt, thesis/question, evidence, outline/draft changes, citation format, feedback, and final submission; do not reduce it to a generic "essay complete" checklist. Use [[Discussion Template]] for discussion participation and [[Project Template]] for a multi-week project with choices or a substantial artifact.
## Done conditions
- Requirements are a complete, source-grounded checklist.
- Written, coding, review, citation, and submission constraints are separated.
- Work log entries include evidence, diagnosis, and fix/next step.
- Concepts link to real notes and reflect actual use.
- Submission and post-submit reflection are filled when applicable.
- No unsupported claim of passing tests, meeting a rubric, or receiving credit.
