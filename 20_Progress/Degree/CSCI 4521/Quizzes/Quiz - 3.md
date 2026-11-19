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
  - "[[20_Progress/Degree/CSCI 4521/Quizzes/Quiz - 3 Cheatsheet|Quiz - 3 Cheatsheet]]"
quiz_n: 3
next: "Fill Mistakes and Gaps from the returned Quiz 3, then redo Problems 7 and 8 from a blank page."
---
# Quiz - 3
## Scope
Quiz 3, Thu 10/22 (50 points, 75 minutes), covering k-means, covariance, GMM, LDA and word embeddings from [[20_Progress/Degree/CSCI 4521/Weekly/Week - 6|Week 6]] and [[20_Progress/Degree/CSCI 4521/Weekly/Week - 7|Week 7]]. The source is `quiz 3 solution.pdf` (9 problems). Stems, plots and the point tables are not printed in the key, so each stem is rebuilt from its sub-parts. The earlier Week 6 note guessed Quiz 3 was 10/15, which this quiz and the Board both contradict. It does not cover logistic regression or regression.
## Questions and Solutions
### Problem 1: Multiple choice (5 x 1 point)
1. **C**: LDA is fitted from class means, class proportions and a shared covariance, so it needs labels. PCA, k-means and GMM clustering are unsupervised.
2. **A**: k-means lowers within-cluster variation at every iteration but reaches only a local minimum, so initializations can end in different ones.
3. **D**: CBOW averages the context word vectors to predict the middle word. A describes skip-gram. B is one of BERT's training tasks.
4. **B**: the covariance matrix is $p\times p$ and symmetric. Covariances can be negative, so D is false.
5. **C**: a GMM gives the relative probability a point came from each Gaussian (soft assignment). Both methods usually fix the number of clusters and converge only locally.
*Sources:* [[20_Progress/Degree/CSCI 4521/Weekly/Week - 6|Week 6]] (k-means, PCA, Word2Vec/BERT), [[20_Progress/Degree/CSCI 4521/Weekly/Week - 7|Week 7]] (LDA, GMM), [[20_Progress/Degree/CSCI 4521/Textbook/ENLP/Chapter - 3|ENLP Chapter 3]] and [[20_Progress/Degree/CSCI 4521/Textbook/ENLP/Chapter - 6|Chapter 6]].
### Problem 2: Running k-means by hand (5 points)
Six points $P_1$ to $P_6$ with a given initial assignment.
(a) Initial centroids are the means of the starting groups: $c_1=\frac13((1,1)+(3,1)+(8,7))=(4,3)$ and $c_2=\frac13((2,4)+(10,7)+(9,10))=(7,7)$.
(b) Assign each point to the nearer centroid by squared distance. $P_3=(2,4)$: $5$ vs $34$, cluster 1. $P_4=(8,7)$: $32$ vs $1$, cluster 2. $P_1$ and $P_2$ go to cluster 1, $P_5$ and $P_6$ to cluster 2. New clusters: $\{P_1,P_2,P_3\}$ and $\{P_4,P_5,P_6\}$.
(c) New centroids $c_1=(2,2)$ and $c_2=(9,8)$. Every point is already nearest its own centroid, so nothing changes next round: **converged**.
> [!EXPLAIN] Explanation of the above topic: One k-means round is assign, then update. If the update step moves no point to a different cluster, the next assignment is identical, so you stop. Write squared distances in a small table for each point to each centroid.
*Sources:* [[20_Progress/Degree/CSCI 4521/Weekly/Week - 6|Week 6]] (LEC 2.3), [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 12|ISL Chapter 12]] §12.4.1, [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5|DLB Chapter 5]] §5.8.2.
### Problem 3: Measuring cluster quality (5 points)
(a) Clustering X is invalid because index 3 is in both clusters, which breaks $C_1\cap C_2=\emptyset$. Y is invalid because index 3 is in none, which breaks $C_1\cup C_2=\{1,\dots,5\}$.
(b) For $\{1,3,5\}$ the unordered pair squares are $4,16,4$, total $24$. Counting each pair twice, $W=\frac{2(24)}{3}=16$.
(c) A: $16+\frac{2(4)}{2}=20$. B: $\frac{2(4)}{2}+\frac{2(25+49+4)}{3}=4+52=56$. The objective prefers **A**, the smaller total within-cluster variation.
*Sources:* [[20_Progress/Degree/CSCI 4521/Weekly/Week - 6|Week 6]], [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 12|ISL Chapter 12]] §12.4.
### Problem 4: k-means meets kNN (5 points)
(a) kNN needs labels (supervised), its $k$ counts neighbors consulted, and it outputs the predicted label from the $k$ nearest labeled training points. k-means needs no labels (unsupervised), its $k$ counts clusters, and it outputs the index of the nearest centroid.
(b) Cluster first, then kNN inside one cluster: $200+\frac{100{,}000}{200}=200+500=700$ distance computations. Brute force is $100{,}000$, about 143 times as many.
(c) Query $q$ is closer to $c_1$ ($2.6$ vs $3.4$), so it is assigned to cluster 1, but its true nearest training point sits just across the boundary in cluster 2 and is never examined. Near a boundary the restricted search can return worse neighbors than brute force: speed is bought with accuracy.
> [!EXPLAIN] Explanation of the above topic: Clustering first is a speed trick. It prunes the search to one cluster, which is only correct when the true neighbors live in the same cluster as the query. Points near a boundary are exactly where that fails.
*Sources:* [[20_Progress/Degree/CSCI 4521/Weekly/Week - 4|Week 4]] (kNN cost, KD-trees, LSH), [[20_Progress/Degree/CSCI 4521/Weekly/Week - 6|Week 6]].
### Problem 5: Reading an elbow plot (6 points)
(a) The decreases are $120-64=56$, $64-30=34$, $30-24=6$. The elbow is at **$k=3$**, since each added cluster helps a lot up to $3$ and barely after.
(b) The smallest within-cluster variation is not the goal because adding clusters always lowers it, down to $0$ at $k=n$ where each point is its own cluster. Clustering has no labels, so there is no test accuracy to pick $k$ with.
(c) A worse result at $k=5$ than at $k=4$ is not necessarily a bug. k-means reaches only a local minimum and depends on the random start. The best 5-cluster solution cannot be worse than the best 4-cluster solution, so rerun with different initializations (a larger `n_init` or k-means++) and keep the lowest variation per $k$.
*Sources:* [[20_Progress/Degree/CSCI 4521/Weekly/Week - 5|Week 5]] (the elbow heuristic), [[20_Progress/Degree/CSCI 4521/Weekly/Week - 6|Week 6]].
### Problem 6: Building a covariance matrix (6 points)
Five 2-D points with column sums $15$ and $10$.
(a) Mean $m=(\frac{15}5,\frac{10}5)=(3,2)$. (b) Centered points $(-2,-2),(-2,0),(0,0),(2,0),(2,2)$ with $n-1=4$ give $q_{11}=\frac{16}{4}=4$, $q_{22}=\frac84=2$, $q_{12}=\frac84=2$, so $Q=\begin{pmatrix}4&2\\2&2\end{pmatrix}$. (c) Sketch **III**: $q_{12}>0$ means $x_1$ and $x_2$ rise together (contours tilt up and right), and $q_{11}>q_{22}$ means a wider spread along $x_1$. (d) Multiplying $x_1$ by 10 gives $q_{11}\to400$, $q_{12}\to20$, $q_{22}=2$ unchanged. Feature 1 now has 200 times the variance only because of units, so PCA tilts to the $x_1$ axis and k-means distances are dominated by $x_1$. Standardize.
> [!EXPLAIN] Explanation of the above topic: Covariance is $\frac1{n-1}\sum (x-m)(x-m)^\top$. Diagonal entries are variances and off-diagonal entries say whether features move together. Units control the diagonal, which is the whole point of part (d).
*Sources:* [[20_Progress/Degree/CSCI 4521/Weekly/Week - 6|Week 6]] (LEC 2.4), [[20_Progress/Degree/CSCI 4521/Weekly/Week - 7|Week 7]], [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 4|ISL Chapter 4]] §4.4 (multivariate Gaussian).
### Problem 7: When distance is not enough (6 points)
A trip of $x=12.5$ minutes, route A with mean $10$ and $\sigma_A=2$, route B with mean $14$ and $\sigma_B=0.5$.
(a) $|12.5-10|=2.5$ and $|12.5-14|=1.5$, so by distance alone it joins **B**.
(b) $f_A(12.5)=\frac1{\sqrt{8\pi}}e^{-2.5^2/8}\approx0.0913$ and $f_B(12.5)=\frac1{\sqrt{0.5\pi}}e^{-1.5^2/0.5}\approx0.00886$, so $f_A$ is about ten times larger and A is more likely.
(c) $P(A\mid x)=\frac{0.0913}{0.0913+0.00886}\approx0.91$.
(d) They disagree because k-means uses only distance to centers and ignores spread. The trip is $1.25\sigma$ from A but $3\sigma$ from B, which is very unusual for the tight route. GMM accounts for variances, so this shows k-means failing when clusters differ in spread.
*Sources:* [[20_Progress/Degree/CSCI 4521/Weekly/Week - 7|Week 7]] (LEC 3.1, GMM and EM with k-means shortcomings), [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 4|ISL Chapter 4]] §4.4.
### Problem 8: Classifying with LDA (6 points)
With $Q=I$ the discriminant is $\delta_j(x_0)=x_0^\top m_j-\frac12\|m_j\|^2+\ln p_j$, with $x_0^\top m_2=12$ and $\|m_2\|^2=20$, and $m_1=0$.
(a) Equal priors: $\delta_1=\ln0.5\approx-0.693$ and $\delta_2=12-10+\ln0.5\approx1.307$, so **class 2**.
(b) Priors $0.9$ and $0.1$: $\delta_1=\ln0.9\approx-0.105$ and $\delta_2=2+\ln0.1\approx-0.303$, so **class 1**. The $\ln p_j$ term favors common classes, and a rare class needs stronger feature evidence.
(c) Equal priors cancel: $0=x^\top m_2-10$ gives **$4x_1+2x_2=10$**, a line through $(2.5,0)$, $(2,1)$ (the midpoint of the means) and $(1.5,2)$, perpendicular to $m_2-m_1$. It is straight because one shared covariance makes each score linear in $x$. In QDA each class has its own covariance, so quadratic terms stay and the boundary can curve.
> [!EXPLAIN] Explanation of the above topic: Evaluate $\delta_j$ for each class and take the larger. The prior only shifts each score by a constant, so a lopsided prior can flip the answer even when the features are the same. That is the intuition for imbalanced data in Week 11.
*Sources:* [[20_Progress/Degree/CSCI 4521/Weekly/Week - 7|Week 7]] (LDA vs QDA), [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 4|ISL Chapter 4]] §4.4.1 to 4.4.2.
### Problem 9: Beyond word counts (6 points)
(a) Embedding arithmetic: $\text{slower}-\text{slow}=(3,1)$, so $\text{short}+(3,1)=(5,1)$. Squared distances: shorter $0+1=1$, shortest $9+1=10$, tall $9+9=18$, so the closest is **shorter**. The embedding encodes "base word to comparative" as a roughly constant direction.
(b) With vocabulary [the, movie, was, great, film, excellent, terrible], $\cos(S_1,S_2)=\frac{2}{2\cdot2}=0.5$ and $\cos(S_1,S_3)=\frac{3}{2\cdot2}=0.75$. Bag of words rates S3 more similar to S1 although S2 has the same meaning and S3 the opposite. It ignores meaning: movie/film and great/excellent are unrelated coordinates, whereas an embedding would put the synonyms close.
(c) Word2Vec inputs are one-hot vectors over a fixed training vocabulary, so a new word has no index and no learned vector. Skipping it misrepresents the message when that word carries the key meaning, can give two different messages the same vector, and gives a message of only unknown words no vector.
*Sources:* [[20_Progress/Degree/CSCI 4521/Weekly/Week - 6|Week 6]] (LEC 2.5), [[20_Progress/Degree/CSCI 4521/Textbook/ENLP/Chapter - 3|ENLP Chapter 3]] §3.2, [[20_Progress/Degree/CSCI 4521/Textbook/ENLP/Chapter - 1|ENLP Chapter 1]] §1.2.
## Mistakes and Gaps
Your own answers were not supplied, so no cause below is confirmed. Mark the misses from the returned quiz and fill in cause and next action.
- [ ] Problem 7 and 8: could you compute a Gaussian density and an LDA score $\delta_j$ from the formulas alone?
- [ ] Problem 2 and 3: could you run a k-means round and compute $W$ by hand?
- [ ] Problem 4: could you explain the boundary drawback of cluster-then-kNN?
- [ ] Problem 6(d): could you say what a unit change does to the covariance matrix and to PCA?
- [ ] The returned score goes in the `score:` key above.
