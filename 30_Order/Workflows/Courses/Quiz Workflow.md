---
type: system
status: sprout
created: 2026-11-19
updated: 2026-11-19
tags:
  - system
  - workflow
system_kind: workflow
serves: "[[Quiz Standard]]"
trigger: A quiz is announced, and again when its solutions or graded copy land.
notes:
  - "[[Quiz Template]]"
  - "[[Exam Material Template]]"
  - "[[Exam Workflow]]"
  - "[[Weekly Board Workflow]]"
---
# Quiz Workflow
Make each quiz leave two notes: a cheatsheet built before it and a solutions note built after it, so the next quiz starts from this one's misses.
## Use when
A quiz is announced (cheatsheet), and again when its questions and solutions are available (solutions note).
## Steps
1. Confirm the scope from the course Board's schedule row: the lectures and readings since the previous quiz. Mark anything unverified.
2. Before the quiz, build `Quiz - N Cheatsheet` from [[Exam Material Template]]. Scope names the quiz and its weeks. Items hold one block per topic: a short summary, the formulas or code shape, and links to the week, textbook note and concept. Keep it near the paper limit the syllabus allows.
3. After the quiz, read the solution file with [[PDF Extraction]], never the PDF directly. Build `Quiz - N` from [[Quiz Template]].
4. For each question write the stem, the worked solution and a `*Sources:*` line. Search the course for the week, textbook note, slide, notebook, homework and concept that teach it, and link only notes that exist.
5. Fill Mistakes and Gaps from the user's own answers. If they were not supplied, list the uncertain questions as `- [ ]` tasks. Add a card only for a real miss.
6. Link the pair from the Quizzes board and the course Board. Set `quiz_n` and `score` when known.
7. Carry each recurring miss into the next cheatsheet and into the course Preparation traps.
8. Run [[Vault Lint]] on the path.
## Do not
Do not invent a question, an answer or a score. Do not write one note per question, and do not fill a quiz note from the textbook alone.
## Done when
- Each quiz has both notes, linked to each other and to the board.
- Every solution shows its reasoning and links its sources.
- Misses are linked to the concepts that repair them.
