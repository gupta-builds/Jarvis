---
type: class
class_kind: subboard
status: active
created: 2026-09-15
updated: 2026-10-22
notes:
  - "[[CSCI 4521 Board]]"
tags:
  - class
  - subboard
next: "Add protected Week 1-2 live capture and verify the unreadable Week 1-2 PDF decks (now confirmed readable via pdftotext, so this is mechanical); then open the Weeks 5-7 companion notebooks to capture their real computed output."
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
## Status
The weekly layer is behind reconciliation across all seven landed weeks: every week has source-grounded pre-lecture notes (now extending through Week 7, landed 2026-10-22), but none has confirmed live-lecture capture yet, and several companion notebooks (Weeks 2, 4-7) remain unopened for their real computed output. The earliest incomplete work is still Week 1's protected live capture and deck verification — unchanged in priority from before this build, since this pass focused on closing the Week 3-7 content gap, not on reconciling Weeks 1-2. The most time-sensitive open item is Quiz 3's real scope, since the quiz is today (2026-10-22) and this vault has no record yet of what it actually covered.
## Dataview
```dataview
TABLE status, next
FROM "20_Progress/Degree/CSCI 4521/Weekly"
WHERE class_kind = "week" OR input_kind = "lecture"
SORT file.name ASC
```
