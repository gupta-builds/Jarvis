---
type: class
class_kind: quiz
status: seed
created: 2026-11-19
updated: 2026-11-19
tags:
  - class
  - quiz
area:
  - "[[CSCI 4521 Board]]"
  - "[[20_Progress/Degree/CSCI 4521/Quizzes/Quizzes Board|Quizzes Board]]"
  - "[[20_Progress/Degree/CSCI 4521/Quizzes/Quiz - 1 Cheatsheet|Quiz - 1 Cheatsheet]]"
quiz_n: 1
next: "Fill Mistakes and Gaps from the returned Quiz 1 (the key has no record of your answers), then repair the weakest concept first."
---
# Quiz - 1
## Scope
Quiz 1, Thu 9/24, covering LEC 0.1 to 1.4 ([[20_Progress/Degree/CSCI 4521/Weekly/Week - 1|Week 1]], [[20_Progress/Degree/CSCI 4521/Weekly/Week - 2|Week 2]], [[20_Progress/Degree/CSCI 4521/Weekly/Week - 3|Week 3]]) and ISL §2.1 to 2.2. The source is the instructor's `quiz 1 solution.pdf` (9 problems, with grading points). The key does not print the question stems, figures or tables, so each stem below is rebuilt from the key's own sub-parts and says so where the original data is missing. It does not cover text data or PCA.
## Questions and Solutions
### Problem 1: Multiple choice (5 x 1 point)
Stems are not in the key. The key answers are B, A, A, C, A.
1. **B, the model is overfitting.** A model that fits training data far better than unseen data has memorized noise.
2. **A, the test set is being used to help choose the model.** Once the test set picks hyperparameters it stops being an independent estimate of generalization.
3. **A, increase $k$ from 1 to 5.** $k=1$ follows single points (low bias, high variance), so a larger $k$ smooths the boundary.
4. **C, accuracy about 99% while detecting no sick patients.** On heavily imbalanced data, predicting "healthy" for everyone scores high accuracy and zero recall.
5. **A, $TP=18,\ FP=7,\ FN=2,\ TN=73$.** The four cells sum to 100 patients, and the key reads them straight from the confusion matrix.
> [!EXPLAIN] Explanation of the above topic: Items 1 to 3 are one idea seen from three sides. Training error alone cannot tell you whether a model generalizes, so you hold data out. $k$ in kNN is the dial: small $k$ fits the training points almost exactly, large $k$ averages over many neighbors. Item 4 is why Week 3 insists on precision and recall next to accuracy.
*Sources:* [[20_Progress/Degree/CSCI 4521/Weekly/Week - 2|Week 2]] (overfitting, train/test split, choosing $k$), [[20_Progress/Degree/CSCI 4521/Weekly/Week - 3|Week 3]] (confusion matrix, accuracy limits), [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5|DLB Chapter 5]] §5.2.
### Problem 2: Classification or regression? (5 points)
(a) Exact waiting time in minutes: **regression**, because the target is a continuous number (a prediction such as 6.73 minutes). (b) Short, Medium or Long wait: **classification**, because the target is one of a finite set of categories. (c) What decides it: **B, the prediction target**, not the features and not the algorithm.
*Sources:* [[20_Progress/Degree/CSCI 4521/Weekly/Week - 1|Week 1]] (regression vs classification from the 0.1 deck), [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]] §2.1.
### Problem 3: k-nearest neighbors (5 points)
The test point is $(2.5,1.5)$ and there are six labeled observations.
(a) Observation 2 at $(2,2)$: $d=\sqrt{0.5^2+(-0.5)^2}=\sqrt{0.5}\approx0.707$.
(b) Observation 4 at $(4,1)$: $d=\sqrt{(-1.5)^2+0.5^2}=\sqrt{2.5}\approx1.581$.
(c) The squared distances to observations 1 to 6 are $3.25,\ 0.50,\ 4.50,\ 2.50,\ 1.25,\ 8.50$, so the closest is **observation 2**.
(d) The order from closest to farthest is 2, 5, 4, 1, 3, 6, so the three closest are **2, 5, 4**.
(e) With $k=3$ the neighbors are Snack, Not Snack, Not Snack. The majority is **Not Snack**.
> [!EXPLAIN] Explanation of the above topic: Compare squared distances. The square root never changes the order, so skipping it saves work and avoids rounding. Write all six $d^2$ values in a column, circle the three smallest, then count labels. A tie cannot happen with three neighbors and two classes.
*Sources:* [[20_Progress/Degree/CSCI 4521/Weekly/Week - 1|Week 1]] (squared Euclidean `distance_sq` and `nn_classify_sample` on the Seeds data), [[20_Progress/Degree/CSCI 4521/Weekly/Week - 2|Week 2]] (kNN with scikit-learn).
### Problem 4: Test performance vs rover performance (5 points)
The stem describes a seed classifier that scored well on its test set but worse on the rover that collected new seeds. (a) Two valid explanations earn 1.5 points each: **distribution shift** (rover seeds differ in length, width or mass from the training and test seeds) and **a different data-collection process** (sensor calibration, noise, equipment). The key also accepts different species proportions, unseen variants, a brand new species, or a train/test split that did not represent deployment. (b) Investigate each: compare histograms, ranges, means and variances of rover vs original data for shift, and measure the same seeds with both instruments for the sensor explanation.
> [!EXPLAIN] Explanation of the above topic: A test set is only as good as its match to the real world. If deployment data comes from a different process, test accuracy overstates real accuracy. The fix is to check the data first and the model second.
*Sources:* [[20_Progress/Degree/CSCI 4521/Weekly/Week - 4|Week 4]] (LEC 1.5 data bias: selection, historical and availability bias), [[20_Progress/Degree/CSCI 4521/Weekly/Week - 3|Week 3]] (generalization), [[20_Progress/Degree/CSCI 4521/Homework/Homework - 2|Homework - 2]] (the Rover Rescue assignment).
### Problem 5: Bias and variance (5 points)
Model A has 99% training and 74% test accuracy. Model B has 84% training and 82% test accuracy. (a) Evidence of high variance: **Model A**, a 25-point train-test gap. (b) Higher bias: **Model B**, the lower training accuracy. (c) Better generalization: **Model B**, higher test accuracy and a small gap. (d) Flexible models fit sample-specific noise, so a different training sample yields a very different fitted model, and that sensitivity is variance. Saying only "they overfit" earns at most 1 of 2 points.
*Sources:* [[20_Progress/Degree/CSCI 4521/Weekly/Week - 2|Week 2]] (LEC 1.3 bias-variance and the training-vs-test accuracy sweep over $k$), [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]] §2.2.
### Problem 6: Confusion matrix and metrics (8 points)
Defective is positive. $TP=36,\ FP=24,\ FN=4,\ TN=136$, so $n=200$.
$\text{Accuracy}=\frac{36+136}{200}=0.86$. $\text{Precision}=\frac{36}{36+24}=0.60$. $\text{Recall}=\frac{36}{36+4}=0.90$. $F_1=2\cdot\frac{0.60\cdot0.90}{0.60+0.90}=0.72$. When a missed defect is costly, use **recall**.
> [!EXPLAIN] Explanation of the above topic: Precision asks "of everything I flagged, how much was truly defective", so false positives hurt it. Recall asks "of everything truly defective, how much did I catch", so false negatives hurt it. $F_1$ is the harmonic mean, which stays low unless both are decent.
*Sources:* [[20_Progress/Degree/CSCI 4521/Weekly/Week - 3|Week 3]] (LEC 1.4 formulas and the COVID-19 worked example), [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]] §2.2.
### Problem 7: Bayes classification (6 points)
The table gives $P(Y=\text{Red}\mid x)$ and $P(Y=\text{Blue}\mid x)$: $x_A$ is $0.90/0.10$ and $x_B$ is $0.55/0.45$. The Bayes classifier picks the larger probability, so both predictions are **Red**. The error probability is one minus the winning probability: $P(\text{error}\mid x_A)=0.10$ and $P(\text{error}\mid x_B)=0.45$, so **$x_B$** is more likely to be misclassified.
*Sources:* [[20_Progress/Degree/CSCI 4521/Weekly/Week - 2|Week 2]] (LEC 1.3 Bayes classifier and Bayes error rate), [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]] §2.2.
### Problem 8: Feature scaling in kNN (8 points)
A is $(2.0,100)$, B is $(4.0,103)$ and the test point is $(2.1,103)$. (a) $d_A^2=0.1^2+3^2=9.01$. (b) $d_B^2=1.9^2+0^2=3.61$. (c) $3.61<9.01$ so B is nearest, and with $k=1$ the prediction is **Blue**. (d) **Mass** has the larger influence because its numbers are far bigger than width. (e) **Yes**, rescaling can change the nearest neighbor.
> [!EXPLAIN] Explanation of the above topic: The mass difference of 3 is squared to 9, while the width difference of 1.9 is squared to 3.61, so width barely votes even though it separates A from B better. Standardizing both features gives each a comparable say, and the nearest neighbor can flip. This is the same finding as Week 1's normalization demo.
*Sources:* [[20_Progress/Degree/CSCI 4521/Weekly/Week - 1|Week 1]] (LEC 1.1 normalization changes the prediction), [[20_Progress/Degree/CSCI 4521/Weekly/Week - 2|Week 2]].
### Problem 9: Precision, recall and $F_1$ (6 points)
Model A: accuracy 96%, precision 90%, recall 45%. Model B: accuracy 91%, precision 62%, recall 92%. (a) A misses more positives (45% < 92% recall). (b) A has fewer false alarms (90% > 62% precision). (c) $F_1(A)=2\cdot\frac{0.90\cdot0.45}{0.90+0.45}=0.60$. (d) If a missed positive is costly, choose **Model B** because 92% recall misses far fewer true positives than 45%.
*Sources:* [[20_Progress/Degree/CSCI 4521/Weekly/Week - 3|Week 3]] (precision, recall, $F_1$ and $F_\beta$).
## Mistakes and Gaps
Your own answers were not supplied, so none of the causes below is confirmed. Mark which questions you missed in the returned quiz, then fill in the cause and next action for each.
- [ ] Problem 8 and Problem 3: could you do squared distances and see why scale changes the answer without the key?
- [ ] Problem 4: could you name two deployment-shift explanations and one check for each?
- [ ] Problem 6 and 9: could you derive $F_1$ and pick recall or precision from a cost statement?
- [ ] Problem 5(d): could you explain flexibility to variance in two sentences, not just say "overfit"?
- [ ] The returned score, once known, goes in the `score:` key above.
