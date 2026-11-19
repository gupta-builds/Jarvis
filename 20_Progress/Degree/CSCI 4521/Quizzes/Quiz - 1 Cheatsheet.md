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
  - "[[20_Progress/Degree/CSCI 4521/Quizzes/Quiz - 1|Quiz - 1]]"
next: "Check each block against the returned Quiz 1 and cut any block that was not tested."
---
# Quiz - 1 Cheatsheet
## Scope
A two-page notes sheet for Quiz 1 (Thu 9/24), covering LEC 0.1 to 1.4 in [[20_Progress/Degree/CSCI 4521/Weekly/Week - 1|Week 1]], [[20_Progress/Degree/CSCI 4521/Weekly/Week - 2|Week 2]] and [[20_Progress/Degree/CSCI 4521/Weekly/Week - 3|Week 3]]. It was assembled after the quiz from those weeks and the solution key, so it shows what the quiz actually asked, not what a pre-quiz guess would have. The questions it answers are in [[20_Progress/Degree/CSCI 4521/Quizzes/Quiz - 1|Quiz - 1]]. It leaves out text data and PCA.
## Items
### kNN and distance
Squared Euclidean $d^2=\sum_j (x_j-x'_j)^2$. Compare $d^2$, no square root. Sort, take the $k$ smallest, vote. Small $k$: low bias, high variance. Large $k$: smooth boundary, can underfit. Scale matters: the feature with bigger numbers dominates, so standardize before distance. See [[20_Progress/Degree/CSCI 4521/Weekly/Week - 1|Week 1]] and [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]].
### Regression or classification
The prediction target decides it. A number on a continuous scale is regression. A category from a finite set is classification.
### Overfitting and generalization
High training accuracy with much lower test accuracy means high variance. Low accuracy on both means high bias. Never use the test set to choose the model. Fixes: train/test split, leave-one-out, cross-validation, fewer features, a larger $k$. See [[20_Progress/Degree/CSCI 4521/Weekly/Week - 2|Week 2]] and [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5|DLB Chapter 5]].
### Bayes classifier
Predict $\arg\max_j P(Y=j\mid x)$. The Bayes error at $x$ is $1-\max_j P(Y=j\mid x)$. It is the floor no classifier beats. kNN estimates the probability from neighbor labels.
### Confusion matrix and metrics
Accuracy $=\frac{TP+TN}{n}$. Precision $=\frac{TP}{TP+FP}$. Recall $=\frac{TP}{TP+FN}$. $F_1=\frac{2PR}{P+R}$. Costly misses mean favor recall. Costly false alarms mean favor precision. Accuracy misleads on imbalanced data. See [[20_Progress/Degree/CSCI 4521/Weekly/Week - 3|Week 3]].
### Deployment shift
Test performance can overstate real performance when deployment data comes from a different process. Check distributions of the features, then check the instrument.
