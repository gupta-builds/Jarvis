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
  - "[[20_Progress/Degree/CSCI 4521/Quizzes/Quiz - 3|Quiz - 3]]"
next: "Check each block against the returned Quiz 3 and cut any block that was not tested."
---
# Quiz - 3 Cheatsheet
## Scope
A two-page notes sheet for Quiz 3 (Thu 10/22) on k-means, cluster quality, covariance, GMM, LDA and embeddings, from [[20_Progress/Degree/CSCI 4521/Weekly/Week - 6|Week 6]] and [[20_Progress/Degree/CSCI 4521/Weekly/Week - 7|Week 7]]. It was assembled after the quiz from the solution key, and the questions it answers are in [[20_Progress/Degree/CSCI 4521/Quizzes/Quiz - 3|Quiz - 3]]. It leaves out regression and logistic regression.
## Items
### k-means
Assign each point to the nearest centroid by squared distance, then set each centroid to its group's mean, and repeat until no label changes. The objective is within-cluster variation $W=\sum_k \frac{1}{|C_k|}\sum_{i,j\in C_k}\|x_i-x_j\|^2$. It reaches only a **local** minimum, so rerun with several initializations (k-means++). See [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 12|ISL Chapter 12]] §12.4.
### Choosing k
$W$ always falls as $k$ grows, reaching 0 at $k=n$. Read the **elbow**: the $k$ after which each added cluster helps little. There is no test accuracy because there are no labels.
### k-means vs kNN
kNN is supervised and its $k$ is neighbors. k-means is unsupervised and its $k$ is clusters. Cluster-then-kNN cuts $100{,}000$ distances to about $700$ but can miss true neighbors across a boundary.
### Covariance
$Q=\frac1{n-1}\sum (x-m)(x-m)^\top$. It is $p\times p$ and symmetric, with variances on the diagonal and possibly negative off-diagonals. Changing units changes the diagonal, so standardize before PCA or k-means.
### GMM and EM
Fit a mean and covariance per cluster, then assign by likelihood. It gives **soft** probabilities $P(A\mid x)=\frac{f_A}{f_A+f_B}$ and handles unequal spread, where k-means treats every cluster as the same round shape. Gaussian density in 1-D: $f(x)=\frac1{\sqrt{2\pi\sigma^2}}e^{-(x-\mu)^2/(2\sigma^2)}$. See [[20_Progress/Degree/CSCI 4521/Weekly/Week - 7|Week 7]].
### LDA vs QDA
Needs labels. $\delta_j(x)=x^\top Q^{-1}m_j-\frac12 m_j^\top Q^{-1}m_j+\ln p_j$, classify to the largest. One shared $Q$ gives a **linear** boundary. A separate $Q_j$ per class (QDA) gives a quadratic one with more parameters and more variance. See [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 4|ISL Chapter 4]] §4.4.
### Embeddings
Word2Vec's CBOW averages the context to predict the middle word and skip-gram does the reverse. Embedding arithmetic: $\text{slower}-\text{slow}$ is a constant direction. Bag of words treats synonyms as unrelated and cannot handle unknown words. See [[20_Progress/Degree/CSCI 4521/Textbook/ENLP/Chapter - 3|ENLP Chapter 3]].
