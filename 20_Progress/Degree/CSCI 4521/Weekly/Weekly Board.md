---
type: class
class_kind: subboard
status: sprout
created: 2026-09-15
updated: 2026-11-19
notes:
  - "[[CSCI 4521 Board]]"
tags:
  - class
  - subboard
next: "Add protected live capture for Weeks 1-11. Weeks 8-11 are written from decks and notebooks only. Open the PyTorch intro series once found on Canvas."
---
# CSCI 4521 — Weekly Board
## Purpose
Chronological index for the course's weekly synthesis notes. Detailed notebook/deck evidence, protected live capture, textbook delta, open questions, and cards live in each week; [[CSCI 4521 Board]] remains the schedule and policy source.
## Map
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 1|Week 1]] — pre-lecture source notes cover Wage-table inspection and a normalized one-nearest-neighbor Seeds classifier; source capture is present, but live capture and Week 1 deck verification are pending.
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 2|Week 2]] — pre-lecture source notes cover leave-one-out and shuffled-split accuracy plus a $K$ scan for Seeds; live capture and the 1.2/1.3 deck verification are pending.
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 3|Week 3]] — LEC 1.4 (confusion matrix, accuracy/precision/recall/F1, worked COVID-19 example) landed 2026-10-22 directly from the deck; Quiz 1 (Thu 9/24) is not yet captured. Live capture pending.
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 4|Week 4]] — LEC 1.5 (parametric/non-parametric models, KD-trees/LSH, the five named data-bias types) and LEC 2.1 (bag-of-words, tokenization, tf-idf, stemming, n-grams) landed 2026-10-22 from their decks. Live capture pending; the `2.1` companion notebook not yet opened.
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 5|Week 5]] — LEC 2.2 (NLP practice on the real 20-newsgroups/UseNet dataset) landed 2026-10-22 from the deck. This is a practice week with no new concept introduced; Quiz 2 (Thu 10/8) not yet captured; the `2.2` companion notebook's real predicted-topic output not yet opened.
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 6|Week 6]] — LEC 2.3 (k-means), LEC 2.4 (PCA, elbow test, data leakage), and LEC 2.5 (Word2Vec/GloVe/BERT) landed 2026-10-22 from their decks; this week also surfaced a real lead on the "Linear Algebra Notes" source gap (the k-means deck itself links to "linear algebra notes from 2033"). Four companion notebooks not yet opened. Live capture pending.
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 7|Week 7]] — LEC 3.1 (PCA/k-means shortcomings, LDA, QDA, Gaussian Mixture Models/EM) landed 2026-10-22 from the deck, including the lecture's own real citation to ISL §4.7.4's 60%-accuracy QDA stock-market example. Quiz 3 is today (Thu 10/22) — scope unconfirmed, not yet captured. GMM is confirmed to have no textbook backing in any of this course's three assigned books. Live capture pending; the `3.1` companion notebook not yet opened.
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 8|Week 8]] — LEC 3.2 (DBSCAN, intro to regression, calculus tools) and LEC 3.3 (gradient descent, learning rate, PyTorch autodiff) landed 2026-11-19 from the decks and the PyTorch notebook, with the real numbers (loss 51, gradients -44.5 and -13). No live capture. The PyTorch intro series is still not located.
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 9|Week 9]] — LEC 3.4 (backpropagation, multiple regression, multicollinearity, interaction terms, kNN regression, L1/L2 regularization, cross-validation) landed 2026-11-19 with the Advertising notebook's real weights. Quiz 4 (Thu 11/5) has no key in the source folder. HW3's due date differs between the Board and the Homework note.
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 10|Week 10]] — LEC 4.1 (GMM review, AIC and BIC, GMMs on digits) and LEC 4.2 (GMM classification, logistic regression, likelihood) landed 2026-11-19 from the decks and three notebooks. Flags a sign slip on slide 16 of LEC 4.2. No live capture.
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 11|Week 11]] — LEC 4.3 (layers, SGD, ROC and AUC, the nine-vs-not-nine notebook with 49.7% and 50.2% accuracy) landed 2026-11-19. The notebook's sigmoid-loss part is unfinished. Quiz 5 is today and has no key yet.
## Status
Weeks 1 to 11 all have a source-grounded note, but none has protected live capture, so the earliest incomplete item is still Week 1 live capture. Weeks 8 to 11 were built on 2026-11-19 from the decks and notebooks and carry the usual Pre-lecture source notes label. Quizzes now live in [[20_Progress/Degree/CSCI 4521/Quizzes/Quizzes Board|Quizzes Board]], and `course-status.js` reports the open Takeaways per week.
## Dataview
```dataview
TABLE status, next
FROM "20_Progress/Degree/CSCI 4521/Weekly"
WHERE class_kind = "week" OR input_kind = "lecture"
SORT file.name ASC
```
