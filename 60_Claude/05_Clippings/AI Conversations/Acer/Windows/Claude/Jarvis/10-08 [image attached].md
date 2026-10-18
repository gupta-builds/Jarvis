---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "[image attached]"
started_at: 2026-10-08T18:24:21
ended_at: 2026-10-08T18:28:41
exported_at: 2026-10-17T21:06:44
duration_minutes: 4.3
project: Jarvis
cwd: 'D:\_Anant\20_Progress\Documents\Jarvis'
session_id: 35bcc4be-017b-5152-afe4-ed0683f13ba4
status: raw
turn_count: 4
tools_used:
  Monitor: 1
  PowerShell: 8
  Read: 4
  ToolSearch: 1
tokens:
  input: 58
  output: 38696
  cache_creation: 469125
  cache_read: 2672665
  total: 3180544
cost_usd: null
model:
  - "claude-sonnet-5-5"
files_touched:
  - "C:\\Users\\anant\\AppData\\Local\\Temp\\claude\\D---Anant-20-Progress-Documents-Jarvis\\35bcc4be-017b-5152-afe4-ed0683f13ba4\\tasks\\b0i6be7d8.output"
  - "D:\\_Anant\\10_Areas\\UMN\\Classes\\CSCI\\CSCI 4521\\Lectures\\Week - 5\\2.4 pca.pptx.pdf"
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# [image attached]

## You

[image attached]

[image attached]

[image attached]

[image attached]

[image attached]

[image attached]

[image attached]

[image attached]

[image attached]

[image attached]

<role>
You are a teaching assistant for UMN CSCI 4521 (Applied Machine Learning, Fall 2026, instructor Bernardo Bianco Prado). You are solving practice questions for me, a student preparing for the biweekly paper quizzes. Quizzes are mostly about interpreting results of methods on new datasets, like technical-interview questions, and they allow two pages of notes. Answer the way this course expects, not the way a generic ML textbook would.
</role>

<task>
The practice questions are in the image(s) attached to this message. Solve every question in every attached image, covering course Weeks 1-5. If no image is attached, or an image is unreadable, say so in one sentence and stop. Do not invent questions.
</task>

<course_root>
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\
If that path does not exist, search for a folder named "CSCI 4521". All paths below are relative to it.

Lecture decks (PDF, text-extractable):
- Lectures\Week - 1\0.1 course logistics, intro to ML.pptx.pdf
- Lectures\Week - 2\1.2 kNN, accuracy, overfitting.pptx.pdf
- Lectures\Week - 2\1.3 bayes classification, kNN.pptx.pdf
- Lectures\Week - 3\1.4 generalization, confusion matrix, accuracy, precision, recall, f1 score .pptx.pdf
- Lectures\Week - 3\1.5 kNN wrap up, kd trees, lsh, complexity, bias.pptx.pdf
- Lectures\Week - 4\2.1 text data, intro to nlp.pptx.pdf
- Lectures\Week - 4\2.2 nlp practice.pptx.pdf
- Lectures\Week - 5\2.4 pca.pptx.pdf

Lecture notebooks (in Code\Lectures\Weeks 1 - 5\): 0.1 intro to colab, pandas, sns.ipynb; Numpy Introduction (no file extension, it is a notebook); Week 1 - practice - Pandas Tutorial (Dimorphism).ipynb; 1.1 Nearest Neighbor Classifier.ipynb; 1.2 NN Classifier.ipynb; 1.3 kNN with SciKit-Learn.ipynb; 1.3 kNN Iris Classification.ipynb (a two-cell stub, ignore); 2.1 tf-idf vectorization, sklearn.ipynb; 2.2 text classification.ipynb; 2.4 PCA on iris data.ipynb; 2.4 PCA on newsgroups.ipynb.

Homework 1 (shows the instructor's grading style and what "justify your answer" means): Homework\homework 1.docx.pdf

Textbooks, in "Textbook & Resources\". Page numbers below are PDF page indices, not printed page numbers; read with the PDF page-range option, at most 20 pages per read:
- ISL Textbook CSCI 4521.pdf (main text): 2.1 pp.27-36; 2.2 (accuracy, bias-variance, Bayes classifier, KNN) pp.37-50; 2.3 Python lab pp.51-78; 12.4 clustering, k-means and hierarchical, pp.527-544. Optional deeper PCA reference: ISL 12.2.
- DLB Textbook CSCI 4521.pdf (Goodfellow et al.): 2.1-2.8 pp.46-63; 3.1-3.3 pp.69-73; 5.1 pp.114-124; 5.2 pp.125-134; 5.4 pp.137-145; 5.5 pp.146-149; 5.6 pp.150-153; 5.8 intro and 5.8.1 PCA pp.160-163; 5.8.2 k-means p.164.
- ENLP Textbook CSCI 4521.pdf (Pilehvar and Camacho-Collados): 1.1-1.3 pp.22-26; 7.1.1-7.1.2 pp.115-117.
</course_root>

<known_gaps>
- There is no local deck or notebook for lecture 2.3 (k-means). Use the 2.4 deck's recap, ISL 12.4.1 and DLB 5.8.2 for k-means.
- The schedule lists 2.4 PCA in Week 6, but its deck and notebooks are in the Weeks 1-5 folder, so treat PCA as in scope.
- Weeks 4-5 also assign ENLP and DLB 5.4-5.6, which have no lecture counterpart. Use the textbook pages above only when a question needs them.
- The decks lost some math glyphs in text extraction. The forms in <course_canon> are the standard ones consistent with the decks. If a question depends on a glyph you cannot verify, read the deck page as an image.
</known_gaps>

<course_canon>
Use these as the course's conventions. Where a question's wording matches one of them, follow it. Where the textbook differs from the deck, answer in the deck's terms and add one line noting the difference.

Week 1
- AI = decisions from information. ML = decisions from examples. Generative AI is a subset of ML (the course focuses on the non-generative part).
- CSV: row = data point, column = feature. Regression predicts a continuous/quantitative target. Classification predicts a discrete/categorical target. Both are supervised (labeled examples). Unsupervised learning finds structure without a target. Its tasks are clustering, feature selection and dimensionality reduction (PCA, MDS).
- Projection: P in R^(2x1000), data X in R^(1000x40), so PX in R^(2x40). Gene example: 1000 dims, 40 cells, 2D PCA plot, clustering found 4 groups while the truth was 14 cancer types.
- Wage.csv: 3000 rows, 11 columns. Wage vs education looks monotonic. Wage vs age is messy.
- 1.1 nearest neighbor: distance_sq = sum((p0-p1)^2). The classifier returns the label at argmin of the distances. Seeds.csv: 210 rows, 3 wheat types, features area and compactness. Normalization is z = (x - mean)/std with numpy's default population std. mean = [14.8475, 0.8710], std = [2.9028, 0.02357]. Query (18, 0.9) gives type 2 raw and normalized. Query (13, 0.8) gives type 1 raw but type 3 normalized (normalized point [-0.636, -3.012]). Lesson: unnormalized distance is dominated by the larger-range feature, and units differ (cm vs cm^2).

Week 2
- Accuracy = correct / total. 1-NN scored on its own training set gets 100% only because each point is its own neighbor. That is "cheating". Overfitting = great training performance, poor performance on new data. Generalization = doing well on unseen data.
- Defenses: leave-one-out, train/test split (the sets must not overlap), cross-validation, and penalizing flexible models (for example score = accuracy - log(num_parameters), formalized by AIC/BIC). Overfitting risk grows with few data points and too many degrees of freedom. Unavoidable error: identical x with different labels (height from first name).
- kNN: majority vote of the k nearest training points.
- Bayes classifier: c(x0) = argmax_j P(Y=j | X=x0). Bayes error rate = 1 - max_j P(Y=j | X=x0), the floor no classifier can beat. kNN estimates the probability as P(Y=j | x0) ~ (1/k) * (number of the k nearest neighbors with label j). For a prediction, the Bayes error at that point is 1 minus the winning fraction.
- Choosing k: small k = flexible, low bias, high variance, jagged boundary, training accuracy near 100% at k=1. Large k = inflexible, high bias, low variance, smooth boundary. The best k minimizes test error. Test error vs k (or 1/k) is U-shaped. Training error is lowest at k=1.
- Bias = how many assumptions that may not represent the data the model makes. Variance = how much the fitted model changes if trained on a different sample (it treats the training data as the truth). Flexible models (SVM, neural nets) have more variance. Linear regression is not flexible and has more bias.
- Notebook numbers (single random runs, so illustrative only): NN leave-one-out accuracy on normalized Seeds 81.43%. A 90/10 split gave 95.24% once. A 33% test split gave 0.8143 for NN. The same split gave 0.80 (k=2) and 0.8857 (k=5 and k=10). Averaging 200 splits at k=2 gave 0.7928. Accuracy differs per run because the shuffle puts different rows in train and test.

Week 3
- Overfit by: overly flexible models, extra features "just in case", few training points, tuning parameters on test data. Generalize by: simpler models, dropping weak features, lots of training data with some held out, train on train and assess on test.
- kNN variants: fixed k vs fixed radius; equal votes vs distance-weighted votes; speed via spatial data structures.
- Confusion matrix: TP, FP, TN, FN. Type I error = FP (false alarm, overestimation). Type II error = FN (miss, underestimation).
- Accuracy = (TP+TN)/(TP+TN+FP+FN). Weaknesses: misleading on unbalanced data, and it merges Type I and II errors that can matter unequally.
- Precision = TP/(TP+FP) (focus: Type I). Recall = TP/(TP+FN) (focus: Type II). F1 = 2PR/(P+R), the harmonic mean, range 0 to 1. F_beta = (1+beta^2)PR/(beta^2 P + R). beta=2 weights recall more. beta=0.5 weights precision more.
- Worked example in the deck (COVID, 100 patients, 20 positive): TP=15, FN=5, TN=65, FP=15. Accuracy 0.80, precision 0.50, recall 0.75, F1 0.60. Recall matters more for diagnosis.
- Other metrics named: Fowlkes-Mallows, Cohen's kappa, confusion entropy, K measure, informedness, markedness, MCC.
- Parametric models assume a functional form (for example f(x)=Ax+b), need less data, are explainable, risk a wrong form, and do not grow with training data. Non-parametric models (kNN) assume no form, need lots of data, can fit almost any function, and must store all data. Complexity = number of tunable parameters (more natural for parametric models). Flexibility = how many shapes the function can take (applies to both).
- kNN cost: 1-NN is O(dn), kNN is O(kdn) brute force. With a spatial structure, search is about O(d log n) for 1-NN and O(kd log n) for kNN, after an O(dn) build. Memory is O(dn). Approximate kNN: quickly find m >= k candidates, then keep the k closest (may miss a true neighbor).
- KD-tree: split on one feature at a time at the median, cycling features. Good in low dimensions, degrades in high dimensions. LSH: l (about log n) random hyperplanes give 2^l regions, hash H(x)=s(Ap), with rows of A = [h_i^T, b_i] and p = [x; -1]. Cost O(dl) = O(d log n). The deck says KD-trees win below roughly a few dozen features and LSH wins above about 20 features (its own wording is loose, so quote it as is). To find more neighbors: enlarge the KD search radius, or rerun LSH with new hyperplanes and take the union.
- kNN regression: predict the average of the k nearest neighbors' values. Reducing d (dimensionality reduction) speeds up and can improve kNN.
- Data bias types (with the deck's examples): Confirmation (asking only PlayStation users why PlayStation beats Switch); Historical (Minneapolis traffic modeled on COVID-era data); Selection/Sampling (optional surveys draw extreme experiences); Survivorship (WW1 planes with bullet holes that returned); Availability (studies run only on college students). Ethics themes: deception, fairness, alignment, control. Non-representative data gives biased models (the cherry/grape kNN figure).

Week 4
- Bag of words (BOW): vector of word counts over a vocabulary. Tokenization: split on whitespace, lowercase, strip punctuation. Vectorization: tokens to numeric vector. BOW ignores word meaning (big/small/tiny cheese) and word order ("Man bites dog" = "Dog bites man").
- l2 distance is the Euclidean norm of u-v. l1 is the sum of absolute differences. Normalizing a vector divides by its norm, using the same norm as the distance. Raw distance favors short documents (notebook: a one-line "Just testing!!" post was nearest to a hockey query at distance 5.2915). Normalizing fixes that. For unit vectors, ||u-v||^2 = 2 - 2cos(u,v).
- Cosine similarity = u.v / (||u|| ||v||), in [-1,1]. Cosine distance = 1 - cos, in [0,2]. It ignores magnitude. Maximize similarity (argmax) or minimize distance (argmin), never mix them up.
- Stop words are removed before vectorizing (sklearn's English list has 318). They can hurt ("To be or not to be").
- tf-idf as taught: tf = count of the term in the document. df (notebook) = fraction of documents containing the term. idf = log(1/df), natural log. tf-idf = tf * idf. If every document contains the term, idf = 0. sklearn's TfidfVectorizer differs: idf = ln((1+n)/(1+df_count)) + 1, then each row is L2-normalized, so "the" still gets a small nonzero weight (about 0.46 vs 0.89 for "cheese" in "the cheese" over the 4-document toy corpus). The notebook's own markdown formula for sklearn is garbled, so use this one and say so if relevant.
- Stemming reduces words to roots (Snowball/Porter via NLTK): follow, followers, following become "follow". It can produce non-words ("happily" becomes "happili"). n-grams: a bigram uses consecutive pairs ("to be or not to be" has 5 bigrams, 4 distinct). Pros: multiword concepts, limited context, homographs. Cons: best n depends on data size, large n adds variance.
- sklearn: CountVectorizer(min_df, stop_words='english'), TfidfVectorizer, fit_transform on train, transform on new text. UseNet 20 newsgroups: about 20,000 posts. The hockey subset had 600 posts: vocabulary 12914, then 12633 with stop words, then 10381 with stemming.

Week 5
- k-means: random initial assignment, compute centroids, reassign points, repeat to convergence. Each run can differ (random start, local optimum). Quality = within-cluster variation (sum of distances to centroids; sklearn kmeans.inertia_ is the sum of squared distances). It always improves with more clusters, so use the elbow test. Choosing the number of clusters is hard.
- PCA: finds the direction of largest sample variance for centered data. Maximize ||Xc||^2 subject to ||c|| = 1. The solution is the first right singular vector of X. PC2 is the best direction orthogonal to PC1, and so on. PCs are linear combinations of features (iris example: PC1 ~ 0.36*sepal_length + 0.36*petal_width + 0.86*petal_length). Data centered, covariance matrix = X^T X/(n-1) when rows are observations. The deck says X X^T for rows-as-points, which is reversed for that layout (X^T X is p x p). Answer with X^T X and add one line noting the deck's version if a question uses it.
- Total variance = sum of the feature variances (Frobenius norm of the centered matrix, scaled). Proportion of variance explained (PVE) of PC m = variance of PC m / total variance (sklearn pca.explained_variance_ratio_). The cumulative PVE curve plus the elbow test picks how many PCs to keep. Both PCA quality and k-means quality always improve with more components or clusters, so the elbow is the non-rigorous fix.
- PCA is unsupervised (it never sees labels) yet iris separated into 3 clean groups. Uses: visualization (2D/3D), noise filtering, lower model variance, less data needed, speed. Iris results (single runs): 1-NN on PC1 alone ~0.85-0.95 (one run 0.88), kNN k=7 on PC1-PC2 0.94. Newsgroups: tf-idf with about 30,000 features, 400-600 PCs capture most variance, accuracy peaked between 1 and 200 PCs, 15 PCs was used. Rationale: small k kNN is very flexible and overfits, and few PCs cut variance. Default n_components = min(n_samples, n_features).
- pca.transform maps new points into the PCA space fit earlier. Example: [5.2, 0.3, 1.4] maps to [-2.584, 0.305, 0.130] and 1-NN on PC1 returned setosa.
- Data leakage: test information influencing training. Examples: duplicate rows split across train and test, z-score normalization done before the split, temporal data leaking future points. For PCA and any normalization: split first, fit on the training set only, then transform the test set. This is a common interview question.
</course_canon>

<method>
Work in this order. Do not skip step 1.
1. Transcribe. For each image, write down every question verbatim with its number and every given value, table cell, axis label and legend entry. For dense plots or tables, zoom or crop the image with a tool or code before reading values. If a value is illegible, say which value and what you assumed. Never silently guess.
2. Locate. For each question, identify the week/lecture it tests and read the relevant deck pages, notebook cells or textbook pages listed above. Read the source rather than relying on <course_canon> or your general ML knowledge when the question goes beyond the canon. Do not read the whole textbook.
3. Solve. Use the course's definitions and notation. Show the formula, substitute the given numbers, and give the final value with units or a plain-language reading. For interpretation questions (what does this curve, matrix or table tell you, which model would you recommend, is this overfitting) answer the way a strong quiz or interview answer would: name the concept, point to the specific evidence in the figure or numbers, and say what you would do next.
4. Verify. When a question needs a number, check it with a real computation (run a short Python snippet with numpy/pandas/scikit-learn using inline commands, for example python -c, or by hand-recomputing a second way). The course environment is conda env csci-4521 (Python 3.12, numpy, pandas, matplotlib, seaborn, scikit-learn). A syntax-only check, or a command that failed to start, does not count. If only declared packages are missing, install them with the environment's own package manager and never with sudo or the system package manager. If no real check can run, say which numbers are hand-checked only and why.
5. Re-check for the standard traps: swapped precision/recall; Type I vs Type II; argmin vs argmax for distance vs similarity; normalizing or fitting PCA on the test set; confusing k in kNN with k in k-means; bias/variance direction as k changes; training accuracy being 100% at k=1.
</method>

<answer_format>
Respond in chat only. Create, edit or write no files anywhere, and do not touch the vault. Use inline commands or the session scratchpad for calculations.
Use this structure for each question:
Q<number> (Week/lecture it tests)
Answer: the final answer in one or two lines.
Work: the formula, the substituted numbers, and a short justification of why (3 to 8 lines, not an essay).
Source: the deck page, notebook cell or textbook pages the answer rests on.
Confidence: high, medium or low, with the reason if not high.
End with one short list titled "Flags" covering any illegible image values, any place where the deck and textbook disagree, and any question that needs material not available locally. Write plain sentences. Do not use em dashes. Do not reproduce your internal reasoning in the reply; give the answer, the arithmetic and a short justification.
</answer_format>

<scope_and_stopping>
Keep working until every question in every image is answered, and only stop to ask when you cannot go on without me. When the work is done and checked, stop and report. Do not add extra practice questions, summaries of the course, notes files or study plans that I did not ask for. If you think one would help, mention it in a single line at the end instead.
Before your first tool call, say in one sentence which images and sources you are about to read. Then give a one-line recap at the end.
Ground answers in the files above, not in training knowledge. If a question cannot be answered from the course material, say so rather than filling the gap.
Think the problem through before you answer.
</scope_and_stopping>

Notes on how to run it:
- Effort: use /effort high. The guide says "think less" instructions don't reliably work and that low effort can skip verification. Use xhigh only if answers come back wrong.
- Images: attach them in the same message as the prompt. For dense plots, the guide says crop and zoom tools improve accuracy a lot, so the prompt asks Sonnet to zoom.
- Folder gaps: there is no lecture 2.3 (k-means) deck locally, and the ENLP, DLB 5.4-5.6 and ISL 12.4 readings have no matching lecture. The prompt marks both as gaps and sends Sonnet to the textbook pages instead.
- Deck error: the PCA deck says to use X·Xᵀ when rows are data points. The prompt tells Sonnet to answer with XᵀX and note the deck's version.
- Assumption: I assumed the questions are Quiz 1 and 2 style. I couldn't see the images, so tell me if they cover something else.



## Claude

I'm reading all 10 attached images (Problems 1 to 9), then checking the PCA and text-vectorization lecture decks in the CSCI 4521 folder and running the numeric checks in Python.

I'm waiting on the Python check of all the numbers. The decks can't be read here because no PDF reader is installed.

I read all 10 images, which cover Problems 1 to 9. I could not open the lecture decks: the Read tool needs poppler, and the course Python env has no PDF library. Every "Source" line below names the course-canon topic and has not been checked against a deck page. The numbers in Problems 2, 3, 4, 6, 7 and 8 were checked with numpy in `csci-4521`.

## Problem 1 (Multiple Choice)

**Q1.1 (Week 4, bag of words)**
Answer: B, the order of the words.
Work: A unigram BOW keeps which words occur, how often, and the total token count (the sum of the counts). Only order is lost, so "Man bites dog" and "Dog bites man" get the same vector.
Source: Week 4 canon on BOW (2.1 deck).
Confidence: high.

**Q1.2 (Week 4, stop words)**
Answer: C, they can become identical vectors despite different meanings.
Work: Removing "not" turns "not helpful" into "helpful", so the two vectors match even though the sentiment is opposite. Option D has it backwards, and A and B do not happen automatically.
Source: Week 4 canon on stop words, which says they can hurt.
Confidence: high.

**Q1.3 (Week 4, TF-IDF)**
Answer: D, the word that occurs in fewer documents.
Work: With tf equal, tf-idf = tf * log(N/n_t) (in the deck, log(1/df)). A smaller n_t gives a larger idf and so a larger weight.
Source: Week 4 canon on tf-idf.
Confidence: high.

**Q1.4 (Week 5, PCA)**
Answer: A, the variance of the projected data.
Work: PC1 maximizes ||Xc||² (the variance of the projected data) over unit vectors c.
Source: Week 5 canon on PCA (2.4 deck).
Confidence: high.

**Q1.5 (Week 5, PCA)**
Answer: B, maximize the remaining variance, perpendicular to PC1.
Work: PC2 is the best direction orthogonal to PC1. Option C is wrong because PCs are orthogonal, not parallel.
Source: Week 5 canon on PCA.
Confidence: high.

## Problem 2 (Comparing Text Vectors)

**Q2(a) (Week 4, l2 distance)**
Answer: ||q−a||² = 8 and ||q−b||² = 1, so b is closer.
Work: (1−3)² + (1−3)² = 8. (1−1)² + (1−0)² = 1. Take the argmin of distance.
Source: Week 4 canon on l2 distance.
Confidence: high (numpy check matches).

**Q2(b) (Week 4, cosine similarity)**
Answer: cos(q,a) = 1 and cos(q,b) ≈ 0.707, so a is more similar.
Work: q·a = 6, ||q|| = √2, ||a|| = 3√2, so cos = 6/6 = 1. q·b = 1, ||b|| = 1, so cos = 1/√2 ≈ 0.7071. Take the argmax of similarity.
Source: Week 4 canon on cosine similarity.
Confidence: high.

**Q2(c) (Week 4)**
Answer: Cosine similarity.
Work: Repeating a message multiplies its vector by a constant, which changes its length but not its direction. Cosine ignores magnitude (cos(q, 3b) = cos(q, b)). Euclidean distance changes with scale. That is why a is far from q in distance (8) but identical in direction.
Source: Week 4 canon on magnitude and normalization.
Confidence: high.

## Problem 3 (PCA: Variance vs. Class Information)

**Q3(a) (Week 5, PCA)**
Answer: Horizontal. x1 has the larger spread, so PC1 is the x1 direction.
Work: x1 takes the values {−6, −2, 2, 6} in both classes. Its variance is 20 (population, n = 8) or 22.86 (sample, n−1). x2 = ±1 has variance 1 (or 1.14 sample). The covariance is 0, because each class has Σx1 = 0 and x2 is constant within a class. So the covariance matrix is diagonal, and PC1 = (1, 0).
Source: Week 5 canon on PCA.
Confidence: high.

**Q3(b) (Week 5, projection)**
Answer: z_P = 6 and z_Q = 6. The two scores are identical (with the other sign, both are −6).
Work: z_P = (6, 1)·(1, 0) = 6, and z_Q = (6, −1)·(1, 0) = 6. The paired points P and Q land on the same coordinate.
Source: Week 5 canon on projection and scores.
Confidence: high.

**Q3(c) (Week 5, unsupervised PCA)**
Answer: No. Maximum variance does not guarantee that class-separating information is preserved.
Work: Class A and Class B differ only in x2 (+1 vs −1). PC1 keeps x1 and discards x2. Every vertically paired A/B point collapses to the same score, so the classes overlap completely along PC1. PCA never sees the labels (it is unsupervised). The directions that separate classes can be low-variance, as here.
Source: Week 5 canon on PCA being unsupervised.
Confidence: high.

## Problem 4 (TF-IDF and Train/Test Leakage)

**Q4(a) (Week 4, tf-idf)**
Answer: coffee = 0 and robot = 4, so robot gets the larger weight.
Work: With N = 4, coffee appears in n_t = 4 documents, so idf = log₂(4/4) = 0 and tfidf = 3 · 0 = 0. Robot appears in n_t = 1 document, so idf = log₂(4) = 2 and tfidf = 2 · 2 = 4. A term in every document carries no discriminating information.
Source: Week 4 canon (idf = 0 when every document contains the term). This problem uses log₂, not the deck's natural log.
Confidence: high.

**Q4(b)(i) (Week 5, data leakage)**
Answer: Yes, it causes data leakage.
Work: TF-IDF (its document frequencies) and PCA (its directions) were fit on all documents, including the test ones. Test-set information shaped the representation the model trains on. Never touching the test labels is not enough. Leakage means any test information influencing training.
Source: Week 5 canon on data leakage (normalization before the split).
Confidence: high.

**Q4(b)(ii) (Week 5, data leakage)**
Answer: Split first, fit on the training set only, then transform the test set with the already-fit objects.
Work: Fit TF-IDF on the training documents, then apply `transform` to the test documents (no refit). Fit PCA on the TF-IDF training matrix, then apply `pca.transform` to the transformed test documents. This avoids leakage because the test set contributes nothing to idf or to the PCA directions. It also mimics deployment, where new documents arrive after fitting.
Source: Week 5 canon on leakage and `pca.transform`.
Confidence: high.

## Problem 5 (Same Words, Different Meaning)

**Q5(a) (Week 4, BOW)**
Answer: A = [1, 1, 1] and B = [1, 1, 1] over [robots, help, students]. The vectors are identical.
Work: Each message contains each word once, and order is ignored.
Source: Week 4 canon on BOW ignoring order.
Confidence: high.

**Q5(b) (Week 4, n-grams)**
Answer: Yes, the bigram count vectors differ.
Work: Message A has the bigrams "robots help" and "help students". Message B has "students help" and "help robots". Over the shared vocabulary [robots help, help students, students help, help robots], A = [1, 1, 0, 0] and B = [0, 0, 1, 1]. Bigrams keep local order.
Source: Week 4 canon on n-grams (limited context). Hand-checked only, because the sklearn check did not finish.
Confidence: high.

**Q5(c) (Week 4, accuracy)**
Answer: No. Its maximum accuracy is exactly 50%, so it cannot exceed 50%.
Work: Identical input vectors give identical predictions. The two message types are equally frequent and have different correct labels, so the classifier gets exactly one type right (50%). Any such classifier, even a randomized one, averages at most 50% here. Different outputs would need a feature that differs, such as bigrams.
Source: Week 4 canon on BOW ignoring order, plus Week 2 on unavoidable error (identical x, different labels).
Confidence: high.

## Problem 6 (Centering, Projection, Reconstruction)

**Q6(a) (Week 5, centering)**
Answer: x_c = (2, 0).
Work: x_c = x − μ = (4, 1) − (2, 1).
Source: Week 5 canon on centering.
Confidence: high.

**Q6(b) (Week 5, projection)**
Answer: z = √2 ≈ 1.414.
Work: z = x_cᵀc₁ = (2, 0)·(1/√2)(1, 1) = 2/√2 = √2.
Source: Week 5 canon on PCA scores.
Confidence: high.

**Q6(c) (Week 5, reconstruction)**
Answer: x̂ = (3, 2).
Work: x̂ = μ + z·c₁ = (2, 1) + √2 · (1/√2)(1, 1) = (2, 1) + (1, 1) = (3, 2).
Source: Week 5 canon on reconstruction.
Confidence: high.

**Q6(d) (Week 5, reconstruction error)**
Answer: ||x − x̂||² = 2.
Work: x − x̂ = (4, 1) − (3, 2) = (1, −1), so the squared norm is 1 + 1 = 2. Check: ||x_c||² = 4 = z² + error = 2 + 2. One sentence for the quiz: a nonzero error means the observation has a component orthogonal to PC1 (here along (1, −1)), and that component is the information lost by dropping the other PCs.
Source: Week 5 canon on PCA.
Confidence: high.

## Problem 7 (Explained-Variance Plot)

**Q7(a) (Week 5, PVE)**
Answer: 80% is retained and 20% is discarded.
Work: Individual PVEs are PC1 = 50%, PC2 = 30%, PC3 = 15%, PC4 = 5%. PC1 + PC2 = 50 + 30 = 80%, so the discarded part is 100 − 80 = 20% (PC3 + PC4).
Source: Week 5 canon on PVE (`explained_variance_ratio_`).
Confidence: high.

**Q7(b) (Week 5, cumulative PVE)**
Answer: 3 components.
Work: The cumulative percentages are 50, 80, 95, 100. Two components give 80%, which is below 90%. Three give 95%, which is at least 90%. The plot bars are individual, not cumulative.
Source: Week 5 canon on the cumulative PVE curve.
Confidence: high.

**Q7(c) (Week 5, tradeoff)**
Answer: Fewer components reduce noise and cost, at the price of losing some variance.
Work: Practical reasons to drop components include 2D/3D visualization, noise filtering, lower model variance (less overfitting for a flexible model like small-k kNN), less data needed, and speed. Here, dropping PC4 gives up only 5% of the variance. The tradeoff is that the dropped variance may contain useful signal, so you choose the number of components with the elbow or cumulative PVE.
Source: Week 5 canon on uses of PCA and the elbow test.
Confidence: high.

## Problem 8 (Which PCA Directions Are Valid?)

**Q8(a) (Week 5, unit-norm constraint)**
Answer: No. w = (2, 0) has ||w|| = 2, so it violates ||c|| = 1. Without the constraint the maximization has no solution.
Work: Variance of Xc is cᵀSc, which scales with ||c||². Here wᵀSw = 4 · 4 = 16, and w = 2u, so the variance is 4 × u's variance (4). Scaling c by t multiplies the variance by t², which grows without bound. The unit constraint is what makes "the direction of largest variance" well defined. Among unit vectors the maximum is 4, at u.
Source: Week 5 canon (PCA requires ||c|| = 1). Check: cᵀSc gives 4, 1, 2.5, 16 for u, v, r, w.
Confidence: high.

**Q8(b) (Week 5, PC1 and PC2)**
Answer: PC1 = u = (1, 0) with variance 4. PC2 = v = (0, 1) with variance 1.
Work: Among unit candidates, u has the largest variance (4), versus 1 for v and 2.5 for r, so u is PC1. PC2 must be orthogonal to PC1 with the largest remaining variance. u·v = 0, so v qualifies. r is unit norm, but r·u = 1/√2 ≠ 0, so it is not orthogonal and is not PC2. Also, S is diagonal, so its eigenvectors are the axes, and r mixes them (variance 2.5 sits between the eigenvalues 1 and 4).
Source: Week 5 canon on PCA and PC2 orthogonality.
Confidence: high.

**Q8(c) (Week 5, sign of a PC)**
Answer: Not wrong. The sign does not affect the projected variance, and reconstruction is unchanged.
Work: (−1, 0)ᵀS(−1, 0) = 4, the same as for (1, 0). Flipping c negates every score z, and variance is invariant under negation. Reconstruction μ + z·c also does not change, since z and c both flip. An eigenvector is only defined up to sign, so implementations may return either.
Source: Week 5 canon on PCA directions.
Confidence: high.

## Problem 9 (Choosing Text Preprocessing)

**Q9(a) (Week 4, stemming)**
Answer: Stemming (reduce words to roots, for example with Snowball/Porter).
Work: Stemming maps "connect", "connected" and "connecting" to the single stem "connect". The vocabulary shrinks by 2 (three terms become one feature). Their counts are summed into one feature, so documents using different forms now match.
Source: Week 4 canon on stemming (NLTK; the hockey subset's vocabulary went 12633 to 10381 with stemming). A lemmatizer would also work.
Confidence: high.

**Q9(b) (Week 4, n-grams)**
Answer: 4-grams alone on a small collection give sparse, mostly non-overlapping features, so test messages share few features with the training data. Adjustment: use a mixed n-gram range of unigrams plus bigrams (1 to 2), optionally with a `min_df` cutoff.
Work: A 4-gram has to match exactly. In a small corpus most appear once, and a new message rarely repeats one. Its vectors then overlap very little with the training vectors (high variance, overfitting). Messages shorter than 4 words get no 4-grams at all, so the zero vector. Lower-order n-grams recur often enough to generalize and still keep some local context.
Source: Week 4 canon: "best n depends on data size, large n adds variance".
Confidence: medium. The course gives the principle, not this exact scenario.

**Q9(c) (Week 4, tf-idf)**
Answer: A high IDF only means the term is rare. A ticket ID that occurs in exactly one ticket cannot predict the topic of any new ticket. Change: strip or mask ticket IDs before tokenizing, or set a `min_df` threshold (for example, min_df of 2 or more) so terms in too few documents are dropped.
Work: IDF = log(N/n_t) is maximal when n_t = 1, which is exactly an ID. A model learns "this ID means this ticket", which memorizes the training set (overfitting) and never reappears at test time. Useful features recur across several documents with a consistent relation to the label, like the topic words that occur in several tickets.
Source: Week 4 canon on tf-idf and `CountVectorizer(min_df=...)`.
Confidence: high.

## Flags

- No lecture deck or textbook page was read, because there is no PDF reader in this environment (poppler is missing and the course env has no PDF library). Every answer rests on the course canon in the prompt and on direct calculation. Page-level citations are missing.
- The numpy checks for Problems 2, 3, 4, 6, 7 and 8 ran with exit code 0. The sklearn CountVectorizer check for Problem 5 hung and was never run, so the BOW and bigram vectors in Problem 5 are hand-checked only.
- Problem 3 uses population variance (20 and 1) and sample variance (22.86 and 1.14). Either way x1 wins, so the answer does not change.
- Problem 4(a) uses log base 2 as given on the page. The deck's own idf uses the natural log, but the answer (0 and 4) follows the page.
- Image text was legible. Problems 3, 7 and 8 were read from rotated photos. I assumed the Problem 3 plot shows x1 ∈ {−6, −2, 2, 6} for each class, as the problem text states.
- The deck's X·Xᵀ covariance form was not needed here.

Recap: Problems 1 to 9 are answered, with the numeric answers verified in Python and the text answers resting on course-canon concepts. I wrote no files. A short quiz-style drill on the leakage and sign-ambiguity traps could help, if you want one.

### Tool Calls

- `PowerShell` -- `{"command":"$r=\u0027D:\\_Anant\\10_Areas\\UMN\\Classes\\CSCI\\CSCI 4521\u0027; Test-Path $r; Get-ChildItem \"$r\\Lectures\\Week - 4\",\"$r\\Lectures\\Week - 5\" -Name -ErrorAction SilentlyContinue; Get-Command python,conda -ErrorAction SilentlyContinue | Select-Object Name,Source","description":"Check course folder and python availability"}`
- `PowerShell` -- `{"command":"@\u0027\nimport numpy as np\nq=np.array([1,1]);a=np.array([3,3]);b=np.array([1,0])\nprint(\"d2\",((q-a)**2).sum(),((q-b)**2).sum())\ncos=lambda u,v:u@v/np.linalg.norm(u)/np.linalg.norm(v)\nprint(\"cos\",cos(q,a),cos(q,b))\nx1=np.array([-6,-2,2,6]*2);x2=np.array([1]*4+[-1]*4)\nX=np.c_[x1,x2]\nprint(\"var\",X.var(0),X.var(0,ddof=1),\"cov\",np.cov(X.T))\nw,v=np.linalg.eigh(np.cov(X.T));print(w,v)\nc=np.array([1,0]);print(\"zP,zQ\",np.array([6,1])@c,np.array([6,-1])@c)\nprint(\"tfidf\",3*np.log2(4/4),2*np.log2(4/1))\nmu=np.array([2,1]);c1=np.array([1,1])/np.sqrt(2);x=np.array([4,1])\nxc=x-mu;z=xc@c1;xh=mu+z*c1;print(xc,z,xh,((x-xh)**2).sum(),(x-xh)@c1)\nS=np.diag([4,1])\nfor c in [(1,0),(0,1),(1/np.sqrt(2),1/np.sqrt(2)),(2,0)]:\n    c=np.array(c);print(c,c@S@c)\nprint(\"neg\",np.array([-1,0])@S@np.array([-1,0]))\nprint(np.cumsum([50,30,15,5]))\nfrom sklearn.feature_extraction.text import CountVectorizer\nm=[\"robots help students\",\"students help robots\"]\nprint(CountVectorizer().fit(m).get_feature_names_out(),CountVectorizer().fit_transform(m).toarray())\ncv=CountVectorizer(ngram_range=(2,2));print(cv.fit_transform(m).toarray(),cv.get_feature_names_out())\n\u0027@ | python -I -","description":"Verify all numeric answers in Python"}`
- `PowerShell` -- `{"command":"$c=@(\"$env:USERPROFILE\\anaconda3\",\"$env:USERPROFILE\\miniconda3\",\"C:\\ProgramData\\anaconda3\",\"C:\\ProgramData\\miniconda3\",\"$env:USERPROFILE\\.conda\"); foreach($p in $c){ Get-ChildItem \"$p\\envs\\csci-4521\\python.exe\" -ErrorAction SilentlyContinue | ForEach-Object FullName }; Get-ChildItem \"$env:USERPROFILE\\.conda\\environments.txt\" -ErrorAction SilentlyContinue | Get-Content","description":"Locate the csci-4521 conda python"}`
- `PowerShell` -- `{"command":"$py=\u0027D:\\Apps\\Miniconda\\envs\\csci-4521\\python.exe\u0027\n@\u0027\nimport numpy as np\nq=np.array([1,1]);a=np.array([3,3]);b=np.array([1,0])\nprint(\"d2\",((q-a)**2).sum(),((q-b)**2).sum())\ncos=lambda u,v:u@v/np.linalg.norm(u)/np.linalg.norm(v)\nprint(\"cos\",cos(q,a),cos(q,b))\nx1=np.array([-6,-2,2,6]*2);x2=np.array([1]*4+[-1]*4)\nX=np.c_[x1,x2]\nprint(\"var pop\",X.var(0),\"sample\",X.var(0,ddof=1));print(np.cov(X.T))\nprint(\"eig\",np.linalg.eigh(np.cov(X.T)))\nc=np.array([1,0]);print(\"zP,zQ\",np.array([6,1])@c,np.array([6,-1])@c)\nprint(\"tfidf coffee,robot\",3*np.log2(4/4),2*np.log2(4/1))\nmu=np.array([2,1]);c1=np.array([1,1])/np.sqrt(2);x=np.array([4,1])\nxc=x-mu;z=xc@c1;xh=mu+z*c1;print(xc,z,xh,((x-xh)**2).sum(),(x-xh)@c1,xc@xc,z*z)\nS=np.diag([4,1])\nfor c in [(1,0),(0,1),(1/np.sqrt(2),1/np.sqrt(2)),(2,0),(-1,0)]:\n    c=np.array(c);print(c,c@S@c)\nprint(np.cumsum([50,30,15,5]))\nfrom sklearn.feature_extraction.text import CountVectorizer\nm=[\"robots help students\",\"students help robots\"]\nv=CountVectorizer();print(v.fit_transform(m).toarray(),v.get_feature_names_out())\nv=CountVectorizer(ngram_range=(2,2));print(v.fit_transform(m).toarray(),v.get_feature_names_out())\n\u0027@ | \u0026 $py -I -","description":"Verify numeric answers in csci-4521 env"}`
- `PowerShell` -- `{"command":"$py=\u0027D:\\Apps\\Miniconda\\envs\\csci-4521\\python.exe\u0027\n$r=\u0027D:\\_Anant\\10_Areas\\UMN\\Classes\\CSCI\\CSCI 4521\\Lectures\u0027\n@\u0027\nimport sys\ntry:\n    import pypdf\nexcept ImportError:\n    print(\"nopypdf\");sys.exit()\nfor f in sys.argv[1:]:\n    t=pypdf.PdfReader(f)\n    print(\"=====\",f,len(t.pages))\n    for i,p in enumerate(t.pages):\n        s=(p.extract_text() or \"\").strip()\n        if any(k in s.lower() for k in [\"leak\",\"unit\",\"variance\",\"orthogonal\",\"stem\",\"n-gram\",\"bigram\",\"idf\"]): print(\"--- p\",i+1);print(s[:700])\n\u0027@ | \u0026 $py -I - \"$r\\Week - 5\\2.4 pca.pptx.pdf\" \"$r\\Week - 4\\2.1 text data, intro to nlp.pptx.pdf\" \"$r\\Week - 4\\2.2 nlp practice.pptx.pdf\"","description":"Extract relevant deck pages text"}`
- `Read` -- `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Lectures\Week - 5\2.4 pca.pptx.pdf`
- `Read` -- `C:\Users\anant\AppData\Local\Temp\claude\D---Anant-20-Progress-Documents-Jarvis\35bcc4be-017b-5152-afe4-ed0683f13ba4\tasks\b0i6be7d8.output`
- `PowerShell` -- `{"command":"$py=\u0027D:\\Apps\\Miniconda\\envs\\csci-4521\\python.exe\u0027; \u0026 $py -I -c \"import importlib.util as u;print({m:bool(u.find_spec(m)) for m in [\u0027fitz\u0027,\u0027pdfplumber\u0027,\u0027PyPDF2\u0027,\u0027pdfminer\u0027]})\"; Get-Content \u0027C:\\Users\\anant\\AppData\\Local\\Temp\\claude\\[REDACTED]\\[REDACTED]\\tasks\\b0i6be7d8.output\u0027","description":"Check PDF libs and numeric job output","timeout":60000}`
- `PowerShell` -- `{"command":"Start-Sleep 60; Get-Content \u0027C:\\Users\\anant\\AppData\\Local\\Temp\\claude\\[REDACTED]\\[REDACTED]\\tasks\\b0i6be7d8.output\u0027","description":"Check numeric verification output","timeout":90000}`
- `Monitor` -- `{"command":"f=\u0027/c/Users/anant/AppData/Local/Temp/claude/[REDACTED]/[REDACTED]/tasks/b0i6be7d8.output\u0027; until [ -s \"$f\" ]; do sleep 3; done; cat \"$f\"","description":"Wait for numeric verification output","timeout_ms":180000,"persistent":"false"}`
- `ToolSearch` -- `{"query":"select:Monitor","max_results":1}`
- `Read` -- `C:\Users\anant\AppData\Local\Temp\claude\D---Anant-20-Progress-Documents-Jarvis\35bcc4be-017b-5152-afe4-ed0683f13ba4\tasks\b0i6be7d8.output`
- `PowerShell` -- `{"command":"$py=\u0027D:\\Apps\\Miniconda\\envs\\csci-4521\\python.exe\u0027\n$code=@\u0027\nimport numpy as np\nq=np.array([1,1]);a=np.array([3,3]);b=np.array([1,0])\nprint(\"d2\",((q-a)**2).sum(),((q-b)**2).sum())\ncos=lambda u,v:u@v/np.linalg.norm(u)/np.linalg.norm(v)\nprint(\"cos\",cos(q,a),cos(q,b))\nx1=np.array([-6,-2,2,6]*2);x2=np.array([1]*4+[-1]*4);X=np.c_[x1,x2]\nprint(\"var pop\",X.var(0),\"sample\",X.var(0,ddof=1));print(np.cov(X.T))\nprint(\"zP,zQ\",np.array([6,1])@[1,0],np.array([6,-1])@[1,0])\nprint(\"tfidf\",3*np.log2(4/4),2*np.log2(4/1))\nmu=np.array([2,1]);c1=np.array([1,1])/np.sqrt(2);x=np.array([4,1])\nxc=x-mu;z=xc@c1;xh=mu+z*c1;print(xc,z,xh,((x-xh)**2).sum(),(x-xh)@c1,xc@xc,z*z)\nS=np.diag([4,1])\nfor c in [(1,0),(0,1),(1/np.sqrt(2),1/np.sqrt(2)),(2,0),(-1,0)]:\n    c=np.array(c);print(c,c@S@c)\nprint(np.cumsum([50,30,15,5]))\n\u0027@\n\u0026 $py -I -c $code","description":"Run numpy-only numeric verification","timeout":90000}`

## You

<task-notification>
<task-id>b0i6be7d8</task-id>
<tool-use-id>[REDACTED]</tool-use-id>
<output-file>C:\Users\anant\AppData\Local\Temp\claude\[REDACTED]\[REDACTED]\tasks\b0i6be7d8.output</output-file>
<status>completed</status>
<summary>Background command "Verify numeric answers in csci-4521 env" completed (exit code 0)</summary>
</task-notification>

## Claude

The first Python job did finish after all, so I can correct one flag from my earlier answer. The earlier flag said the sklearn check for Problem 5 never ran, and that was wrong.

- **Problem 5(a):** sklearn gives identical count vectors `[1 1 1]` for both messages over `[help, robots, students]`.
- **Problem 5(b):** the bigram vectors differ. Message A is `[0 1 1 0]` and message B is `[1 0 0 1]` over `[help robots, help students, robots help, students help]`. This matches my hand answer (two disjoint bigram sets).
- **Problem 3(a):** the eigendecomposition of the covariance gives eigenvalue 22.86 along the x1 axis and 1.14 along x2, so PC1 is horizontal, as I said.

The other numbers are unchanged. The Problem 5 results are now verified by computation, not hand-checked only. No answers change. The Flags about the unread decks still apply.

### Tool Calls

- `Read` -- `C:\Users\anant\AppData\Local\Temp\claude\D---Anant-20-Progress-Documents-Jarvis\35bcc4be-017b-5152-afe4-ed0683f13ba4\tasks\b0i6be7d8.output`

## Actions Taken

**Files created:**
_None_

**Files modified:**
_None_

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
_None_


