---
type: class
class_kind: exam-material
status: seed
created: 2026-11-19
updated: 2026-11-19
tags:
  - class
  - exam-material
area:
  - "[[CSCI 4521 Board]]"
  - "[[20_Progress/Degree/CSCI 4521/Quizzes/Quizzes Board|Quizzes Board]]"
  - "[[20_Progress/Degree/CSCI 4521/Quizzes/Quiz - 2|Quiz - 2]]"
next: "Check each block against the returned Quiz 2 and cut any block that was not tested."
---
# Quiz - 2 Cheatsheet
## Scope
A two-page notes sheet for Quiz 2 (Thu 10/8) on text vectors and PCA, from [[20_Progress/Degree/CSCI 4521/Weekly/Week - 4|Week 4]], [[20_Progress/Degree/CSCI 4521/Weekly/Week - 5|Week 5]] and the PCA lecture ([[20_Progress/Degree/CSCI 4521/Weekly/Week - 6|Week 6]] in the Board, taught earlier in practice). It was assembled after the quiz from the solution key, and the questions it answers are in [[20_Progress/Degree/CSCI 4521/Quizzes/Quiz - 2|Quiz - 2]]. It leaves out k-means and embeddings.
## Items
### Text vectors
Bag of words counts each vocabulary word. Euclidean distance is $\|q-a\|^2$. Cosine is $\cos=\frac{q\cdot a}{\|q\|\|a\|}$ and ignores length, so scaling all counts by a positive constant does not change it. See [[20_Progress/Degree/CSCI 4521/Weekly/Week - 4|Week 4]].
### TF-IDF
$\text{tfidf}(t,d)=\text{tf}(t,d)\cdot\log\frac{N}{\text{df}(t)}$. The course used $\log_2$ in the quiz. A word in every document has idf $0$. Rare words get big weights, including useless unique IDs, so remove those first.
### Stemming and n-grams
Stemming merges inflected forms (connect, connected, connecting) into one feature. Unigrams ignore order, so reordered messages can have identical vectors. Bigrams keep local order. Very long $n$-grams on short text are sparse and overfit.
### Leakage
Split first. Fit TF-IDF, scaling and PCA on the training set only, then transform the test set with the fitted objects. Using test data to choose a transform leaks even without labels. See [[20_Progress/Degree/CSCI 4521/Weekly/Week - 5|Week 5]].
### PCA
Center the data. A PC direction is a unit vector, $\|w\|=1$, that maximizes projected variance, and PC2 is perpendicular to PC1. Score $z=(x-\bar x)\cdot u$. Reconstruction $\hat x=\bar x+zu$. Error $\|x-\hat x\|^2$ is nonzero when components are dropped. A direction is defined up to sign. Cumulative explained variance chooses how many to keep. PCA is unsupervised and can discard the class-separating direction. See [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 12|ISL Chapter 12]] and [[20_Progress/Degree/CSCI 4521/Weekly/Week - 6|Week 6]].
