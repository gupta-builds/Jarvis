---
type: class
class_kind: subboard
status: sprout
created: 2026-11-19
updated: 2026-11-19
notes:
  - "[[CSCI 4521 Board]]"
  - "[[20_Progress/Degree/CSCI 4521/Preparation|Preparation]]"
tags:
  - class
  - subboard
next: "Quiz 4 (Thu 11/5) and Quiz 5 (Thu 11/19) have no solution file in the source folder yet. Drop them in Quizzes/ and build each pair with the Quiz Workflow."
---
# CSCI 4521 — Quizzes Board
## Purpose
Index of the quiz layer for [[CSCI 4521 Board]]. Each quiz leaves a cheatsheet built for the notes-allowed sheet and a solutions note with the worked questions and the links that teach them. Weights, dates and the two-pages-of-notes rule stay on the Board. Misses feed [[20_Progress/Degree/CSCI 4521/Preparation|Preparation]].
## Map
- [[20_Progress/Degree/CSCI 4521/Quizzes/Quiz - 1|Quiz 1]] with its [[20_Progress/Degree/CSCI 4521/Quizzes/Quiz - 1 Cheatsheet|Cheatsheet]] (Thu 9/24): kNN distance, bias and variance, confusion-matrix metrics, Bayes error, feature scaling.
- [[20_Progress/Degree/CSCI 4521/Quizzes/Quiz - 2|Quiz 2]] with its [[20_Progress/Degree/CSCI 4521/Quizzes/Quiz - 2 Cheatsheet|Cheatsheet]] (Thu 10/8): cosine vs Euclidean, tf-idf and leakage, $n$-grams, PCA projection and reconstruction. It tests PCA earlier than the Board's schedule says.
- [[20_Progress/Degree/CSCI 4521/Quizzes/Quiz - 3|Quiz 3]] with its [[20_Progress/Degree/CSCI 4521/Quizzes/Quiz - 3 Cheatsheet|Cheatsheet]] (Thu 10/22): k-means by hand, elbow, covariance, GMM vs k-means, LDA scores, embeddings.
## Status
Behind. Quizzes 1 to 3 are written from the instructor solution keys, but the keys do not carry the stems or your answers, so every Mistakes and Gaps section is still a checklist and every note is `seed`. Quiz 4 (11/5, Week 9) and Quiz 5 (11/19, Week 11) have no source file yet. The syllabus says six quizzes and the schedule shows five.
## Dataview
```dataview
TABLE status, quiz_n, score, next
FROM "20_Progress/Degree/CSCI 4521/Quizzes"
WHERE class_kind = "quiz"
SORT quiz_n ASC
```
