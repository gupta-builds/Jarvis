---
type: class
input_kind: lecture
status: seed
created: 2026-10-22
updated: 2026-10-22
area:
  - "[[CSCI 5304 Board]]"
  - "[[20_Progress/Degree/CSCI 5304/Quiz & HW/Homework - 2|Homework - 2]]"
tags:
  - "#class"
  - "#Lecture"
next: "Resolve the real midterm-date conflict directly with the instructor/Canvas before treating any of 10/15, 10/20, or 10/22 as settled - see the WARNING below"
---
# Week - 7
## What you must be able to do
- This week introduced no new lecture content - it is an exam-review Q&A session. There is nothing new to be tested on from this week itself; use it to locate the exam's real scope and format instead.
- State the midterm's format as announced live: 5 questions, answer 4 of 5, 75 minutes, one page of notes (printed or handwritten), no calculator, real numbers only.
- Be able to reproduce the two by-hand SVD methods the professor reviewed live (simple-matrix inspection; eigendecomposition of whichever of $AA^T$/$A^TA$ is smaller), since both are directly homework/quiz-tested.
## Key ideas (short)
- **No new lecture material this week** - this was an exam-review session, not a new Lecture number.
- The midterm's **real content boundary is Lecture 11** (confirmed again this week, consistent with [[20_Progress/Degree/CSCI 5304/Weekly/Week - 6|Week - 6]]'s 10/13 statement): two homeworks, three quizzes, through least squares.
- **Format**: 5 questions, choose 4, 75 minutes total, one page of notes, no calculator, real numbers only (complex numbers explicitly out of scope).
- A **real, unresolved date conflict** exists across this week's own transcript and the Board's user-confirmed correction - see the WARNING in Textbook integration below. Do not assume either date is settled.
## Concepts created today
- None. A review session is not a source for new concept material - any concept worth creating belongs to the lecture that actually introduced it ([[20_Progress/Degree/CSCI 5304/Weekly/Week - 5|Week - 5]]'s Householder candidate remains the leading one).
## Examples worth keeping
- **SVD by hand, method 1 (simple matrix, inspection):** when a matrix's columns are visibly scaled multiples of an orthonormal basis, you can read off $U$, $\Sigma$, $V$ directly by matching scale factors to singular values - the professor explicitly tied this to [[20_Progress/Degree/CSCI 5304/Quiz & HW/Homework - 2|Homework - 2]]'s own SVD problem.
- **SVD by hand, method 2 (eigendecomposition):** compute eigenvalues/eigenvectors of whichever of $AA^T$ or $A^TA$ is smaller (one is always $\le$ the matrix's own smaller dimension), use $Av=\sigma u$ or $U^TA=\Sigma V^T$ to recover the other side's vectors once one side is known.
- **Gram-Schmidt $R_i=D_iN_i$ clarification, worked live a second time:** the professor re-derived [[20_Progress/Degree/CSCI 5304/Quiz & HW/Homework - 2|Homework - 2]] problem 6 live in response to a student question, confirming the diagonal-times-unit-upper-triangular factorization applies to classical Gram-Schmidt (Algorithm 7.1) and that modified Gram-Schmidt (Algorithm 8.1) has "a different answer" for the same question, though graders were instructed to accept either reading - directly useful cross-check for that homework's problem 6 answer.
- **A live, partially-resolved re-derivation of Homework 2 problem 8(c)'s inequality** ($\|A^+\|_2\le\|A_1^{-1}\|_2$): the professor worked through an induction-style argument about singular values only increasing as rows are appended, self-corrected once mid-derivation ("I did tell you this wrong... I'm not sure if that's right"), and ultimately declared the question "not on the exam" after running out of time rather than finishing cleanly. **Flag for the Homework - 2 citation-fix task:** this live attempt is a different, more geometric argument than the one already written up in that note's problem 8(c) (which uses an explicit left-inverse $L$) - worth cross-checking against, not a replacement.
## Lecture
### 1. Exam-review Q&A (Tue 10/20)
Opened with class-cancellation logistics (a specialist appointment) and confirmed the in-person exam would proceed "as planned" for Thursday that week, referencing an announcement sent 10/18. Spent the full session on format Q&A and worked review: format (5 questions, choose 4, 75 minutes, no calculator, one page of notes, real numbers only); study guidance ("I write down all the problems and examples... up to this lecture, which was these two homeworks and these three quizzes"); and then open floor for specific worked questions, covering the two by-hand SVD methods, the Gram-Schmidt $R_i$ factorization clarification, and the partially-resolved pseudoinverse-bound re-derivation (see Examples above). No new Lecture number or textbook section was introduced.
## Textbook integration
> [!IMPORTANT]
> No new textbook section this week - this was a review day over [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 10|Lecture - 10]] and [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 11|Lecture - 11]], confirmed again as the exam's real content boundary.

> [!WARNING] Real, unresolved three-way date conflict - do not pick a side silently
> Three sources now disagree about when the midterm actually happened or will happen:
> 1. [[CSCI 5304 Board]] was corrected 2026-10-21, per a direct statement from the user, to say the midterm "actually happened Tuesday, October 20th."
> 2. The 10/13 transcript (this week's predecessor, see [[20_Progress/Degree/CSCI 5304/Weekly/Week - 6|Week - 6]]) has the professor confirming a live, in-person exam for "Thursday, this week" - i.e., **Thursday 10/15**.
> 3. **This week's own 10/20 transcript is itself a pre-exam review/Q&A session** - the professor opens by confirming "I do want to do an in-person exam... Exam, in class, Thursday, this week" (i.e. **Thursday 10/22**) and spends the entire session coaching students on format and reviewing material *for* that still-upcoming exam. Nothing in this transcript describes an exam that already happened on 10/20 itself.
>
> These three dates (10/15, 10/20, 10/22) cannot all be correct, and the primary source available to this build (the 10/20 transcript) directly contradicts the Board's current correction. This is logged here rather than resolved one way or the other - confirm the real date directly with the instructor or Canvas before treating any of the three as settled, and correct whichever note(s) turn out to be wrong once confirmed.
## Takeaways (questions to resolve)
- [ ] **Resolve the three-way midterm-date conflict above before building any exam-specific practice material** - this is the single most important open item from this week.
- [ ] Confirm whether Homework 2 problem 8(c)'s live re-derivation (self-corrected, declared "not on the exam" before finishing) should be incorporated as an alternate proof in that note, or left as review-session color.
- [ ] Confirm the Gram-Schmidt $R_i=D_iN_i$ question's "accept either answer" grading note is reflected in Homework - 2's own problem 6 writeup.
## Lecture-to-textbook synthesis
==A review session's real value isn't new content - it's the professor telling you, in their own words, exactly what the exam will and won't ask, which this session did twice (format, and the explicit Lecture-11 scope boundary) while leaving the actual exam date itself contradicted across sources.==
*Mechanism:* no new mechanism this week; the session's function was to compress "two homeworks and three quizzes" into a 75-minute, 4-of-5-question format and to re-surface two homework mechanisms (SVD by hand, Gram-Schmidt's $R_i$ factorization) that were judged worth a second pass.
- Lecture example/scenario: the two by-hand SVD methods, reviewed live specifically because "no one really does this by hand" outside of toy problems like the one already assigned.
- Textbook connection: none new - review of [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 10|Lecture - 10]]/[[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 11|Lecture - 11]] only.
- Concept links: none created this week.
> [!WARNING]
> Treating this week's transcript as evidence the midterm already happened on 10/20. Read literally, it is the opposite: a review session anticipating an exam two days later.

> [!SUMMARY]
> This week has no new material to learn - its value is entirely in exam logistics (format, scope boundary at Lecture 11) and a live date conflict that needs resolving before trusting any single source about when the midterm actually occurred.
## Flashcards
What exam format did the professor announce live this week?::5 questions, answer any 4 of 5, 75 minutes total, one page of notes (printed or handwritten), no calculator, real numbers only. #cards/5304
What does this week's transcript itself say about when the midterm would happen, and why does that matter?::It anticipates the exam for "Thursday, this week" (10/22) and reviews material *for* it - meaning the transcript is evidence against, not for, the exam having already happened on 10/20 as a separate note currently claims. #cards/5304
Name the two by-hand SVD methods reviewed this week.::(1) Inspect a simple matrix whose columns are visibly scaled orthonormal vectors and read off $U,\Sigma,V$ directly; (2) eigendecompose whichever of $AA^T$ or $A^TA$ is smaller, then recover the other side via $Av=\sigma u$ or $U^TA=\Sigma V^T$. #cards/5304
