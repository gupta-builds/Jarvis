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
  - "[[20_Progress/Degree/CSCI 4521/Quizzes/Quiz - 2 Cheatsheet|Quiz - 2 Cheatsheet]]"
quiz_n: 2
next: "Fill Mistakes and Gaps from the returned Quiz 2, then redo Problems 4 and 6 from a blank page."
---
# Quiz - 2
## Scope
Quiz 2, Thu 10/8, covering text vectors and PCA. The source is the TA copy `quiz 2 solution.pdf` (9 problems). Its stems, tables and plots are not printed, so each stem is rebuilt from the key's sub-parts. Source conflict: this quiz tests PCA, but the Board's schedule puts LEC 2.4 (PCA) on Tue 10/13 in [[20_Progress/Degree/CSCI 4521/Weekly/Week - 6|Week 6]]. The lecture deck for 2.4 sits in the Week - 5 source folder, so PCA was taught before 10/8 and the Board table is off. The text material is in [[20_Progress/Degree/CSCI 4521/Weekly/Week - 4|Week 4]] and [[20_Progress/Degree/CSCI 4521/Weekly/Week - 5|Week 5]]. It does not cover k-means or embeddings.
## Questions and Solutions
### Problem 1: Multiple choice (5 items)
The key lists answers only: B, C, D, A, B. Stems are not in the key.
*Sources:* [[20_Progress/Degree/CSCI 4521/Weekly/Week - 4|Week 4]] and [[20_Progress/Degree/CSCI 4521/Weekly/Week - 5|Week 5]]. Match each item to its topic once you have the returned quiz.
### Problem 2: Comparing text vectors (5 points)
The query is $q=(1,1)$, with $a=(3,3)$ and $b=(1,0)$ as word-count vectors.
(a) $\|q-a\|^2=(1-3)^2+(1-3)^2=8$ and $\|q-b\|^2=0+1=1$, so **$b$ is closer** by Euclidean distance.
(b) $\cos(q,a)=\frac{6}{\sqrt2\cdot3\sqrt2}=1$ and $\cos(q,b)=\frac1{\sqrt2}\approx0.707$, so **$a$ is more similar** by cosine.
(c) Multiplying every count by the same positive constant leaves **cosine similarity** unchanged, because it changes only length.
> [!EXPLAIN] Explanation of the above topic: Euclidean distance sees $a$ as far because $a$ is long. Cosine ignores length and compares direction, and $a$ points exactly the way $q$ does. That is why Week 4 calls cosine standard for text, where a longer document has bigger counts but the same topic.
*Sources:* [[20_Progress/Degree/CSCI 4521/Weekly/Week - 4|Week 4]] (LEC 2.1 $L_1$/$L_2$ distance, normalization, cosine), [[20_Progress/Degree/CSCI 4521/Textbook/ENLP/Chapter - 1|ENLP Chapter 1]] §1.2.
### Problem 3: PCA, variance versus class information (5 points)
Two classes sit at the same $x_1$ positions and differ in $x_2$.
(a) $x_1$ has the larger spread, so **PC1 is horizontal**. (b) With $c_1=(1,0)$: $z_P=(6,1)\cdot(1,0)=6$ and $z_Q=(6,-1)\cdot(1,0)=6$, the **same** score (both $-6$ if the sign is flipped). (c) **No**: points from the two classes get identical PC1 scores, so the $x_2$ information that separates them is thrown away.
> [!EXPLAIN] Explanation of the above topic: PCA is unsupervised. It keeps the direction of most variance and never looks at labels. When the signal lives in a low-variance direction, projecting onto PC1 deletes it, which is why Week 7 contrasts PCA with LDA.
*Sources:* [[20_Progress/Degree/CSCI 4521/Weekly/Week - 6|Week 6]] (LEC 2.4), [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 12|ISL Chapter 12]] §12.2, [[20_Progress/Degree/CSCI 4521/Weekly/Week - 7|Week 7]].
### Problem 4: TF-IDF and train/test leakage (5 points)
(a) $\text{tfidf}(\text{coffee},d)=3\log_2\frac44=0$ and $\text{tfidf}(\text{robot},d)=2\log_2\frac41=4$, so **robot** gets the larger weight: it is rare across documents while coffee appears in all four.
(b)(i) **Yes**, there is leakage: TF-IDF and PCA were fitted before the split, so the test documents influenced the learned preprocessing even though their labels were unused. (ii) Fit TF-IDF and PCA on the **training set only**, then transform the test documents with those fitted objects. Never refit on the test set.
> [!EXPLAIN] Explanation of the above topic: A word in every document carries no information about which document it is, so its idf is $\log 1=0$. Leakage is any use of test data to decide how to transform data, labels or not. Fit on train, transform test.
*Sources:* [[20_Progress/Degree/CSCI 4521/Weekly/Week - 4|Week 4]] (tf-idf), [[20_Progress/Degree/CSCI 4521/Weekly/Week - 5|Week 5]] (data leakage), [[20_Progress/Degree/CSCI 4521/Homework/Homework - 2|Homework - 2]].
### Problem 5: Same words, different meaning (6 points)
Two messages use the same words in a different order.
(a) Over the vocabulary [robots, help, students], both messages are $(1,1,1)$. (b) The bigrams differ: A has (robots help), (help students) and B has (students help), (help robots), so the **bigram vectors are different**. (c) **No**: both share one unigram vector, so a deterministic classifier gives them the same prediction. With opposite labels equally often, the best possible accuracy is **50%**.
*Sources:* [[20_Progress/Degree/CSCI 4521/Weekly/Week - 4|Week 4]] (bag of words, $n$-grams).
### Problem 6: Centering, projection and reconstruction (6 points)
The mean is $(2,1)$, $x=(4,1)$ and $u=\frac1{\sqrt2}(1,1)$.
(a) $x_c=x-\text{mean}=(2,0)$. (b) $z=x_c\cdot u=\frac{2}{\sqrt2}=\sqrt2$. (c) $\hat x=\text{mean}+zu=(2,1)+(1,1)=(3,2)$. (d) Error $\|x-\hat x\|^2=1+1=2$, nonzero because keeping only PC1 discards information.
> [!EXPLAIN] Explanation of the above topic: Always do the three steps in this order: subtract the mean, project onto the unit direction, then add the mean back. Skipping the mean in step (c) is the common slip.
*Sources:* [[20_Progress/Degree/CSCI 4521/Weekly/Week - 6|Week 6]], [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5|DLB Chapter 5]] §5.8.1, [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 2|DLB Chapter 2]] §2.7 to 2.8.
### Problem 7: Reading an explained-variance plot (6 points)
(a) PC1 plus PC2 retain $50\%+30\%=80\%$ and discard $20\%$. (b) Three components retain $50+30+15=95\%$, so the smallest number reaching 95% is **3**. (c) Fewer components cut storage and computation, ease visualization and can drop low-variance noise, at the cost of discarding some variance.
*Sources:* [[20_Progress/Degree/CSCI 4521/Weekly/Week - 5|Week 5]] (elbow and variance explained), [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 12|ISL Chapter 12]] §12.2.
### Problem 8: Which PCA directions are valid? (6 points)
(a) $w=(2,0)$ has length 2, so it is **not** an allowed direction. Without the unit-length constraint you could scale $w$ to make the projected variance grow without bound, so no finite maximizer exists. (b) **PC1 is $u=(1,0)$**, the largest-variance valid unit direction, and **PC2 is $v=(0,1)$**, perpendicular to PC1. (c) Neither sign is wrong: a direction is defined only up to sign, and flipping it turns every score $z$ into $-z$ with the same explained variance.
*Sources:* [[20_Progress/Degree/CSCI 4521/Weekly/Week - 6|Week 6]], [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 12|ISL Chapter 12]] §12.2.
### Problem 9: Choosing text preprocessing (6 points)
(a) **Stemming** maps "connect, connected, connecting" to one feature "connect", merging their counts. (b) Using only 4-grams on short messages makes features extremely sparse and rare, so the model memorizes training patterns: high training accuracy, poor generalization. Use shorter $n$-grams (unigrams or bigrams) or combine lengths. (c) A high idf only means a feature is rare. Unique random ticket IDs never repeat, so they carry no topic signal. Remove them or replace them with a common placeholder before TF-IDF.
*Sources:* [[20_Progress/Degree/CSCI 4521/Weekly/Week - 4|Week 4]] (stemming, $n$-grams, tf-idf), [[20_Progress/Degree/CSCI 4521/Weekly/Week - 5|Week 5]] (the newsgroups practice).
## Mistakes and Gaps
Your own answers were not supplied, so no cause below is confirmed. Mark the misses from the returned quiz and fill in cause and next action.
- [ ] Problem 4: could you compute tf-idf with the course's $\log_2$ and explain leakage with the right fix?
- [ ] Problem 6: could you run centering, projection and reconstruction without the key?
- [ ] Problem 3 and 8: could you say why max variance is not max class information, and why $\|w\|=1$ is required?
- [ ] Problem 5: could you explain why identical unigram vectors cap accuracy at 50%?
- [ ] The returned score goes in the `score:` key above.
