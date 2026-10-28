---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "Sonnet 5.5 prompt for CSCI 4521 practice"
started_at: 2026-10-08T12:14:04
ended_at: 2026-10-08T14:30:55
exported_at: 2026-10-28T16:15:33
duration_minutes: 136.8
project: Jarvis
cwd: 'D:\_Anant\20_Progress\Documents\Jarvis'
session_id: 89cb15f6-f87a-4305-92cc-0052096adb65
status: seed
review_state: raw
created: 2026-10-08
updated: 2026-10-28
turn_count: 5
tools_used:
  Agent: 1
  Bash: 19
  Glob: 2
  Grep: 2
  PowerShell: 1
  Read: 8
tokens:
  input: 38
  output: 29227
  cache_creation: 180174
  cache_read: 2512251
  total: 2721690
cost_usd: 1.264267
model:
  - "claude-sonnet-5-5"
files_touched:
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4521\\CSCI 4521 Board.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4521\\Homework\\Homework - 1.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4521\\Preparation.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4521\\Textbook\\Textbook Map.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4521\\Weekly\\Week - 1 (Prompts).md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4521\\Weekly\\Week - 1.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4521\\Weekly\\Week - 2.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4521\\Weekly\\Weekly Board.md"
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# Sonnet 5.5 prompt for CSCI 4521 practice

## You

<local-command-caveat>The command below was run directly in Claude Code, not sent to you as a request, and its output goes straight to the user. It's recorded here as context for later messages.</local-command-caveat>

## You

<command-name>/model</command-name>
            <command-message>model</command-message>
            <command-args></command-args>

## You

<local-command-stdout>Set model to `Sonnet 5.5` and saved as your default for new sessions[2m[22m
[2m     .claude\settings.json pins [22m`Sonnet 5`[2m — that applies on restart[22m</local-command-stdout>

## You

Provide me a prompt for sonnet 5.5 to solve some practice question on the latest course material provided. Based on this promting guide provided: "https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/[REDACTED]". The prompt should solve the questions for the course CSCI 4521 on all the weeks 1 - 5. Gather all the content for the required questions provided as images. Go through textbook, .ipynb files, notes, etc. for this specific task. Do the job correctly and provide me with the prompt here in the terminal.

## Claude

I'll start by locating the CSCI 4521 material in the vault and, in parallel, reading the prompting guide.

Found the source folder and the Weeks 1 to 5 material. I haven't found any practice-question images yet. Next I'm extracting text from the lecture decks into the scratchpad.

Text extracts fine. Reading all eight decks now.

Decks are in hand. The deck text drops math glyphs, so I'm now dumping the notebooks (code, markdown, text outputs) with jq to get the exact formulas and numbers the course uses.

The decks and notebooks are covered. Now the three textbooks: I'm extracting them to locate the exact page ranges for the Weeks 1 to 5 reading assignments.

Final step: I've read the decks, notebooks, textbook sections and the guide, and I'm writing the prompt now.

I found no practice-question images on disk or in this chat, so you attach them when you run the prompt. It stops and asks if none are attached.

```text
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
```

Notes on how to run it:
- **Effort:** use `/effort high`. The guide says "think less" instructions don't reliably work and that low effort can skip verification. Use `xhigh` only if answers come back wrong.
- **Images:** attach them in the same message as the prompt. For dense plots, the guide says crop and zoom tools improve accuracy a lot, so the prompt asks Sonnet to zoom.
- **Folder gaps:** there is no lecture 2.3 (k-means) deck locally, and the ENLP, DLB 5.4-5.6 and ISL 12.4 readings have no matching lecture. The prompt marks both as gaps and sends Sonnet to the textbook pages instead.
- **Deck error:** the PCA deck says to use X·Xᵀ when rows are data points. The prompt tells Sonnet to answer with XᵀX and note the deck's version.
- **Assumption:** I assumed the questions are Quiz 1 and 2 style. I couldn't see the images, so tell me if they cover something else.

I wrote no files, per your global rule.

### Tool Calls

- `Glob` -- pattern `**/*4521*` path ` `
- `Glob` -- pattern `**/*4521*/**` path ` `
- `Agent` -- `{"description":"Fetch Sonnet 5.5 prompting guide","subagent_type":"web-fetch","prompt":"Fetch https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/[REDACTED] and return a thorough, faithful digest of the guide: every concrete recommendation about how to write prompts for Claude Sonnet 5.5 (structure, tone, effort, thinking, verbosity, formatting, tool use, agentic behavior, literal instruction following, examples, XML tags, output format control, anything that is new or different versus earlier models). Quote key phrases verbatim where they matter and include any sample prompt snippets. Do not omit sections."}`
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 4521" && find . -type f | head -300 && echo ---- && du -sh .
```
```
./CSCI 4521 Board.md
./Homework/Homework - 1.md
./Preparation.md
./Textbook/DLB/Chapter - 2.md
./Textbook/DLB/Chapter - 3.md
./Textbook/DLB/Chapter - 5.md
./Textbook/ISL/Chapter - 2.md
./Textbook/Textbook Map.md
./Weekly/Week - 1 (Prompts).md
./Weekly/Week - 1.md
./Weekly/Week - 2.md
./Weekly/Weekly Board.md
----
120K	.
```
- `Grep` -- pattern `4521` path ` `
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4521\CSCI 4521 Board.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4521\Weekly\Week - 1 (Prompts).md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4521\Weekly\Week - 1.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4521\Weekly\Week - 2.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4521\Preparation.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4521\Homework\Homework - 1.md`
- `Bash`
```bash
cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521" 2>&1 && find . -type f -printf '%P\t%s\t%TY-%Tm-%Td\n' | sort
```
```
Code/.vscode/settings.json	130	2026-10-05
Code/Homework/CSCI4521_HW1.ipynb	268188	2026-10-06
Code/Homework/PhiUSIIL_HW1_777.csv	42284	2026-10-05
Code/Homework/PhiUSIIL_Phishing_URL_Dataset.csv	56854345	2026-10-05
Code/Homework/README.md	492	2026-10-06
Code/Homework/figures/fig1_pairplot.png	186035	2026-10-06
Code/Homework/figures/fig2_f1_vs_k.png	56659	2026-10-06
Code/Homework/figures/fig3_metrics.png	31551	2026-10-06
Code/Homework/homework 1.docx.pdf	97549	2026-10-05
Code/Homework/hwTemplateML.tex	4654	2026-10-05
Code/Lectures/Weeks 1 - 5/0.1 intro to colab, pandas, sns.ipynb	969012	2026-09-21
Code/Lectures/Weeks 1 - 5/1.1 Nearest Neighbor Classifier.ipynb	231764	2026-09-21
Code/Lectures/Weeks 1 - 5/1.2 NN Classifier.ipynb	392613	2026-09-21
Code/Lectures/Weeks 1 - 5/1.3 kNN Iris Classification.ipynb	804	2026-09-17
Code/Lectures/Weeks 1 - 5/1.3 kNN with SciKit-Learn.ipynb	172154	2026-09-21
Code/Lectures/Weeks 1 - 5/2.1 tf-idf vectorization, sklearn.ipynb	6753	2026-09-29
Code/Lectures/Weeks 1 - 5/2.2 text classification.ipynb	48566	2026-10-04
Code/Lectures/Weeks 1 - 5/2.4 PCA on iris data.ipynb	27639	2026-10-06
Code/Lectures/Weeks 1 - 5/2.4 PCA on newsgroups.ipynb	14970	2026-10-06
Code/Lectures/Weeks 1 - 5/Numpy Introduction	35790	2026-09-21
Code/Lectures/Weeks 1 - 5/Week 1 - practice - Pandas Tutorial (Dimorphism).ipynb	468449	2026-09-21
Code/Lectures/Weeks 1 - 5/download.png	66615	2026-09-17
Code/environment.yml	381	2026-10-05
Homework/HW-1.docx	341281	2026-10-06
Homework/HW-1.pdf	381137	2026-10-06
Homework/PhiUSIIL_HW1_777.csv	42284	2026-10-05
Homework/SAMPLE - HW1 Report (3 pages).docx	304974	2026-10-06
Homework/SAMPLE - HW1 Report Layout.docx	1033221	2026-10-06
Homework/homework 1.docx.pdf	97549	2026-10-05
Homework/hw1ML.pdf	338598	2026-10-05
Homework/hwTemplateML.tex	4654	2026-10-05
Lectures/Week - 1/0.1 course logistics, intro to ML.pptx.pdf	2655044	2026-09-21
Lectures/Week - 2/1.2 kNN, accuracy, overfitting.pptx.pdf	105905	2026-09-21
Lectures/Week - 2/1.3 bayes classification, kNN.pptx.pdf	618258	2026-09-21
Lectures/Week - 3/1.4 generalization, confusion matrix, accuracy, precision, recall, f1 score .pptx.pdf	562253	2026-09-24
Lectures/Week - 3/1.5 kNN wrap up, kd trees, lsh, complexity, bias.pptx.pdf	799621	2026-09-24
Lectures/Week - 4/2.1 text data, intro to nlp.pptx.pdf	277094	2026-09-29
Lectures/Week - 4/2.2 nlp practice.pptx.pdf	89735	2026-10-04
Lectures/Week - 5/2.4 pca.pptx.pdf	468661	2026-10-06
Textbook & Resources/DLB Textbook CSCI 4521.pdf	21873317	2026-09-27
Textbook & Resources/ENLP Textbook CSCI 4521.pdf	12646183	2026-09-17
Textbook & Resources/ISL Textbook CSCI 4521.pdf	20053984	2026-09-17
Textbook & Resources/Syllabus - CSCI 4521.pdf	185312	2026-09-17
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `PowerShell`
```powershell
$roots = @('D:\_Anant\Inbox','D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521','C:\Users\anant\Downloads','C:\Users\anant\Desktop','C:\Users\anant\Pictures','D:\_Anant\20_Progress\Documents\Jarvis\60_Claude\00_Inbox'); foreach($r in $roots){ if(Test-Path $r){ Write-Output "== $r"; Get-ChildItem $r -Recurse -File -ErrorAction SilentlyContinue | Where-Object { $_.Extension -match '\.(png|jpg|jpeg|webp|heic|gif)$' -and $_.LastWriteTime -gt (Get-Date).AddDays(-30) } | Select-Object -First 40 FullName,Length,LastWriteTime | Format-Table -AutoSize -Wrap | Out-String -Width 250 } }
```
```
== D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521

FullName                                                                              Length LastWriteTime
--------                                                                              ------ -------------
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\figures\fig1_pairplot.png 186035 10/6/2026 12:38:17 AM
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\figures\fig2_f1_vs_k.png   56659 10/6/2026 12:39:55 AM
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\figures\fig3_metrics.png   31551 10/6/2026 12:39:55 AM
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Lectures\Weeks 1 - 5\download.png   66615 9/17/2026 3:45:00 PM


== D:\_Anant\20_Progress\Documents\Jarvis\60_Claude\00_Inbox
```
- `Grep` -- pattern `practice (question|problem|quiz|exam)s?` path `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree`
- `Bash`
```bash
which python python3 pdftotext pdftoppm tesseract 2>&1; python --version 2>&1; python -c "import fitz; print('pymupdf', fitz.__doc__)" 2>&1 | head -2; python -c "import pypdf; print('pypdf', pypdf.__version__)" 2>&1 | head -2; python -c "import nbformat; print('nbformat ok')" 2>&1 | head -1
```
```
which: no pdftoppm in (/c/Users/anant/bin:/mingw64/bin:/usr/local/bin:/usr/bin:/bin:/mingw64/bin:/usr/bin:/c/Users/anant/bin:/c/WINDOWS/system32:/c/WINDOWS:/c/WINDOWS/System32/Wbem:/c/WINDOWS/System32/WindowsPowerShell/v1.0:/c/WINDOWS/System32/OpenSSH:/c/Program Files/NVIDIA Corporation/NVIDIA App/NvDLISR:/c/Program Files (x86)/NVIDIA Corporation/PhysX/Common:/c/Program Files/starship/bin:/c/Program Files/nodejs:/cmd:/c/Program Files/GitHub CLI:/c/Users/anant/.local/bin:/d/Apps/Hermes/bin:/c/Users/anant/AppData/Local/agy/bin:/c/Users/anant/AppData/Local/Programs/Jan/resources/bin:/c/Users/anant/AppData/Local/Microsoft/WindowsApps:/c/Users/anant/AppData/Local/PowerToys/DSCModules:/d/Apps/Microsoft VS Code/bin:/d/Apps/Cursor/resources/app/bin:/c/Users/anant/AppData/Local/Microsoft/WinGet/Packages/BurntSushi.ripgrep.MSVC_Microsoft.Winget.Source_8wekyb3d8bbwe/ripgrep-15.2.[REDACTED]:/c/Users/anant/AppData/Local/Microsoft/WinGet/Packages/Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe/ffmpeg-9.0.1-full_build/bin:/c/Users/anant/AppData/Local/Programs/Cua/cua-driver/bin:/c/Users/anant/AppData/Local/Programs/DockerDesktop/resources/bin:/c/Users/anant/AppData/Local/Programs/Ollama:/c/Users/anant/AppData/Local/Microsoft/WinGet/Links:/c/Users/anant/AppData/Roaming/npm:/d/Apps/Hermes/git/cmd:/d/Apps/Hermes/git/bin:/d/Apps/Hermes/git/usr/bin:/c/Users/anant/AppData/Local/Microsoft/WinGet/Packages/jqlang.jq_Microsoft.Winget.Source_8wekyb3d8bbwe:/d/AI/npm-global:/d/Apps/Obsidian:/usr/bin/vendor_perl:/usr/bin/core_perl)
which: no tesseract in (/c/Users/anant/bin:/mingw64/bin:/usr/local/bin:/usr/bin:/bin:/mingw64/bin:/usr/bin:/c/Users/anant/bin:/c/WINDOWS/system32:/c/WINDOWS:/c/WINDOWS/System32/Wbem:/c/WINDOWS/System32/WindowsPowerShell/v1.0:/c/WINDOWS/System32/OpenSSH:/c/Program Files/NVIDIA Corporation/NVIDIA App/NvDLISR:/c/Program Files (x86)/NVIDIA Corporation/PhysX/Common:/c/Program Files/starship/bin:/c/Program Files/nodejs:/cmd:/c/Program Files/GitHub CLI:/c/Users/anant/.local/bin:/d/Apps/Hermes/bin:/c/Users/anant/AppData/Local/agy/bin:/c/Users/anant/AppData/Local/Programs/Jan/resources/bin:/c/Users/anant/AppData/Local/Microsoft/WindowsApps:/c/Users/anant/AppData/Local/PowerToys/DSCModules:/d/Apps/Microsoft VS Code/bin:/d/Apps/Cursor/resources/app/bin:/c/Users/anant/AppData/Local/Microsoft/WinGet/Packages/BurntSushi.ripgrep.MSVC_Microsoft.Winget.Source_8wekyb3d8bbwe/ripgrep-15.2.[REDACTED]:/c/Users/anant/AppData/Local/Microsoft/WinGet/Packages/Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe/ffmpeg-9.0.1-full_build/bin:/c/Users/anant/AppData/Local/Programs/Cua/cua-driver/bin:/c/Users/anant/AppData/Local/Programs/DockerDesktop/resources/bin:/c/Users/anant/AppData/Local/Programs/Ollama:/c/Users/anant/AppData/Local/Microsoft/WinGet/Links:/c/Users/anant/AppData/Roaming/npm:/d/Apps/Hermes/git/cmd:/d/Apps/Hermes/git/bin:/d/Apps/Hermes/git/usr/bin:/c/Users/anant/AppData/Local/Microsoft/WinGet/Packages/jqlang.jq_Microsoft.Winget.Source_8wekyb3d8bbwe:/d/AI/npm-global:/d/Apps/Obsidian:/usr/bin/vendor_perl:/usr/bin/core_perl)
/c/Users/anant/AppData/Local/Microsoft/WindowsApps/python
/c/Users/anant/AppData/Local/Microsoft/WindowsApps/python3
/mingw64/bin/pdftotext
Python was not found; run without arguments to install from the Microsoft Store, or disable this shortcut from Settings > Apps > Advanced app settings > App execution aliases.
Python was not found; run without arguments to install from the Microsoft Store, or disable this shortcut from Settings > Apps > Advanced app settings > App execution aliases.
Python was not found; run without arguments to install from the Microsoft Store, or disable this shortcut from Settings > Apps > Advanced app settings > App execution aliases.
Python was not found; run without arguments to install from the Microsoft Store, or disable this shortcut from Settings > Apps > Advanced app settings > App execution aliases.
```
- `Bash`
```bash
S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad"; mkdir -p "$S/decks"; cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Lectures"; for f in Week*/*.pdf; do b=$(basename "$f" .pdf | tr ' ,' '__'); pdftotext -layout "$f" "$S/decks/$b.txt" 2>&1; echo "$f -> $(wc -c < "$S/decks/$b.txt") chars, $(pdfinfo "$f" 2>/dev/null | grep Pages)"; done
```
```
Week - 1/0.1 course logistics, intro to ML.pptx.pdf -> 16723 chars, 
Week - 2/1.2 kNN, accuracy, overfitting.pptx.pdf -> 5678 chars, 
Week - 2/1.3 bayes classification, kNN.pptx.pdf -> 11752 chars, 
Week - 3/1.4 generalization, confusion matrix, accuracy, precision, recall, f1 score .pptx.pdf -> 9114 chars, 
Week - 3/1.5 kNN wrap up, kd trees, lsh, complexity, bias.pptx.pdf -> 18175 chars, 
Week - 4/2.1 text data, intro to nlp.pptx.pdf -> 14696 chars, 
Week - 4/2.2 nlp practice.pptx.pdf -> 3047 chars, 
Week - 5/2.4 pca.pptx.pdf -> 12592 chars,
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash`
```bash
S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad/decks"; cd "$S"; for f in 0.1* 1.2* 1.3*; do echo "=================== $f"; sed 's/[[:space:]]\+/ /g' "$f" | grep -v '^ *$'; done
```
```
=================== 0.[REDACTED].pptx.txt
Welcome to CSCI 4521!
Bernardo Bianco Prado
Computer Science & Engineering
Slides adapted from Stephen Guy and Shelby Ziccardi
 About me
Bernardo (he/him)
Email: bianc072@umn.edu
Office: Lind Hall 300H
Teaching Specialist, Computer Science and Engineering.
Academic background:
 Math undergrad at UMN from 2017 to 2020.
 Applied math and electrical engineering masters
 degrees from University of Michigan.
 About me
Interests:
 Machine Learning
 Video Game
 Development
 Computer Graphics
 Music
 Tennis
 About the course
There will be 5 units:
1. ML Intro / Classification (and model accuracy in
 general)
2. Unsupervised Learning (clustering & dim. reduction)
3. Regression (focus on linear models)
4. Deeper classifiers (logistic regression, decision
 trees, SVM)
5. Neural networks (large, non-linear models)
 Assignments
Units 1 to 4 will have a homework assignment each.
Homework submissions will be a combination of
well-documented python code (via Jupyter notebooks)
and short written reports (as a PDF).
 Assignments
Every two weeks, we will have a quiz during the Thursday
class. The quizzes will be on paper and will cover the
material up to the previous week.
They will be focused primarily on interpreting results of
methods on new datasets - questions you may come across in
technical interviews or during research presentations.
You are welcome to use 2 pages of notes front and back to
the quizzes. They have to be on physical paper.
 Assignments
The last unit will have a final project instead of a
homework.
You will submit a short proposal and will perform a poster
presentation for the project in addition to the coding
work and will count approximately 2x a homework.
 Assignments
The last aspect of your grade is in-class participation.
These will be done in the form of ChimeIn questions.
To receive credit for your answers, you must demonstrate
that you were in class and attempted to solve the problem.
These activities must be done in-class and cannot be made
up.
The lowest 3 will be dropped from your final grade.
 Deadlines
For each assignment, you will get a grace day for
submission with no penalty. However, any later submissions
will not be accepted save for special circumstances.
The only exception is the final project report and
presentation. Due to how late this semester is ending, we
won't be able to offer grace days for them!
 Instruction team
Grad TAs:
Undergrad TAs:
 Communication
Piazza is the best and fastest method to communicate, ask
questions, etc.
 - Forum questions and answers can help everyone in the
 class understand the material better.
 - Help each other! Learning is best when we do it
 together and help each other, so try to contribute to
 Piazza.
 - Don't be afraid to post questions about the material.
 If you have questions, it's likely other people have
 the same questions!
 Communication
Email communication is reserved for personal questions,
concerns, etc. Such as accommodations, special
circumstances, etc.
Emails about course material, homeworks, grading, and any
other aspect that is not personal will not be answered.
 Textbooks
Main Textbook:
An Introduction to Statistical Learning, with applications in
Python
G. James, D. Witten, T. Hastie, R. Tibshirani, J. Taylor
Available online
Secondary Useful Resources:
Machine Learning System Design Interview
A. Aminian, A. Xu
Deep Learning Book
I. Goodfellow, Y. Bengio, A. Courville
Available online
 Special and life circumstances
If you have a special or life circumstance that may
prevent you from completing an assignment on time, you
must let me know within 72 hours of you being able to
contact me via email.
For example, if you lose your laptop, you must email me
within 72 hours of you realizing you lost it.
 Generative AI usage
Use the tools available to you ... BUT ...
GenAI works against the learning objectives for some assignments
This class AI usage rating system:
If you choose to use GenAI models, consider:
 - Output accuracy - YOU need to be able to tell if a AI output is
 correct or not, we will not help interpret or fix any GenAI
 outputs
 - Data security - the assignments are the teaching team intellectual
 property, pasting them in unprotected mediums is a violation of
 intellectual property
 - Environmental impact - GenAI uses a huge amount of water, and
 searches have a big environmental impact
 Sensitive topics
Our goal is not only to understand ML, but to use ML to
understand our world better
We'll use real-world datasets covering interesting topics
... but the results may be sometimes depressing or unsettling
Results cannot be fully understood without considering:
 - Systemic racism/sexing
 - Race & gender in society
 - Stereotypes & prejudice, etc.
Datasets we use may:
Include topics about health and disease
Capture and reinforce societal biases
Be unfiltered and contain "adult" language or imagery
 Sensitive topics
In short, we will use real data, and real data carries
with it the unfortunate realities of our world with it.
I hope that in this course we learn to always be aware of
the biases that may exist in data so we can use machine
learning responsibly for a better world.
 Expected background
Linear Algebra
 - Mentally convert between a 2D data table with e
 entries each with f features and an e x f matrix
 - Know matrix operations and their properties
 - E.g. the dimension of the output of a matrix-matrix
 product
Also: vector operations, norms, singular value
decomposition
 Expected background
Statistics
Line of best fit, residuals
Mean of a dataset
Also: median, standard deviation, gaussian distributions
Python
Jupyter notebooks & Google Colab
Also: reading/writing files, using libraries, lists,
dictionaries, defining functions
 Any questions?
 Activity 1: getting to know you
Please fill out the open ChimeIn questions.
 Intro to ML
Let's start with some material!
 By the end of today...
You will be able to:
 - Load CSV datasets for analysis
 - Use Google Colab to explore your data
You will know:
 - What is machine learning (in general terms)
 - The different types of ML problems
 - Course policies
You will learn the terms:
 - Datasets & Features
 - Classification & Regression
 - Supervised learning & Unsupervised learning
 AI vs ML
Artificial Intelligence (AI) is making decisions based on
information
Machine Learning (ML) is making decisions from examples
Generative AI is a subset of machine learning that focuses
on creating new information from examples
In this class we will focus on the parts of machine
learning that are not generative AI
 Example: predicting salaries
Let's say we have data describing different people and we
want to see if we can predict their salary from the data.
For example, what can we predict about someone's salary
from their age and level of education?
Questions like this can help us understand both the data
itself and certain structures that show up in our world.
For this, we will use the wage.csv dataset, which survey
of salaries, level of education, region, industry, health,
insurance, etc from men living in US Atlantic region from
2003-2009
 Example: predicting salaries
 Visualization of the
 wages.csv file. The
 first row names the
 different columns
 (features) of the
 data. Each subsequent
 row represents a
 person with the
 specific value for
 each feature.
 Example: predicting salaries
This data format is called csv (comma-separated values)
and it's a format used to store 2D tables of data with
values in each row separated by commas.
In this format, each row represents a data point and each
column represents a feature of the data.
 Example: predicting salaries
When investigating the dataset, we can try and plot
relationships between the different attributes of the
data.
Wage vs. Age graph Wage vs. Year graph Wage vs. Education graph
 Example: predicting salaries
Some of them can be easier to interpret than others. For example,
there seems to be a relationship between wage and education
level, whereas the wage and age relationship is a bit messier.
Wage vs. Age graph Wage vs. Year graph Wage vs. Education graph
 Key terms
Features: the different measured quantities of the data
Data point: a point holding specific values of the data
features
Dataset: a collection of data points
Linear relationship: when the relationship between two
features can be described by a line
 Data tools
Jupyter notebooks is an interactive Python text editor that
enables us to run snippets of code at a time
 - Great for prototyping, investigating, and performing
 numerical computations
Google colab is a online Python environment from Google that
uses jupyter notebooks
Pandas is a Python library for manipulating datasets
Seaborn is a Python library for data visualization
Let's practice using this jupyter notebook!
 Types of ML problems
Regression: predicting a continuous, numerical, or
quantitative aspect of the data
 - Example: knowing the past 5 days of stock prices, can
 we predict the price tomorrow?
Classification: predicting a discrete, categorical or
qualitative aspect of the data
 - Example: knowing the past 5 days of stock prices, can
 we predict if the price will go up or down?
Both of these require us to have examples of the
quantity/category we want to predict. This is called
supervised learning!
 Types of ML problems
Talk to the people around you to come up with
2 real-life applications where classification would be
useful
 - What are the input features?
 - What are the predicted output response types?
2 real-life applications where regression would be useful
 - What are the input features?
 - What are the predicted outputs?
SUBMIT YOUR ANSWERS ON CHIMEIN
 Types of ML problems
What if you don't have an explicit attribute you want to
predict, or maybe you don't even know the question you
want to ask from the data?
This is where unsupervised learning comes in!
Instead of predicting a specific quantity/categorical
value, we look for structure in the dataset.
It can help us visualize the data and analyze it better!
 Types of ML problems
Examples of unsupervised learning:
 - Grouping customers who have similar buying habits
 - Finding social media accounts who post on similar
 topics
 - Gathering together similar search results of news
 stories
 - Finding the most important features in a dataset
 - Transforming high-dimensional data (many features)
 into low-dimensional data (few features) while
 preserving as much information as possible
 Example: gene data
 Rows and columns of
 the Gene.csv file
 where each column is
 now a cell with 1000
 entries that
 represent the amount
 each gene is being
 expressed.
 From this we can
 start asking a few
 questions: are there
 cells that are more
 similar? Can we
 separate them into
 groups? Can we
 visualize data points
 with 1000 entries?
 Visualizing high dimensional data
In a screen or a piece of paper, we can only really
visualize data in two dimensions.
How can we turn high dimensional data into 2D data?
By projecting the data points in R1000 into R2. We do that
using a projection matrix PR2x1000. So for a cell data
point xR1000, we can multiply Px to get a vector in R2.
We can do this with all data at once by putting the data
points in the columns of a matrix XR1000x40 and multiplying
PXR2x40 to get a new matrix of 40 data points in R2.
 Visualizing high dimensional data
How do we choose a good projection matrix P?
It should preserve, as much as possible, structural
aspects of the data!
Example: preserve blobs of data points, preserve the shape
of the data, etc.
 PCA
One commonly used method for this is principal component
analysis (PCA) which is used to find the most important
directions that describe the collection of data points
(this is done using the singular value decomposition).
After finding the most important directions, you can
choose however many of them you like (the less the better)
and project the data onto the subspace generated by them.
 PCA
If we do this to the gene data using the 2 most important
directions, we get the following plot:
 Plot of the gene
 data after
 performing PCA to
 reduce it to 2D.
 Clustering
After visualizing the 2D projection of the data, we can
ask the question of whether we can reasonably separate it
into groups.
Any ideas? How many groups?
How do we choose the groups?
 Plot of the gene
 data after
 performing PCA to
 reduce it to 2D.
 Clustering Plots of the
 clustering of
Clustering is a way to group the the projected
data into groups according to a gene data
chosen metric. (top), and the
 true
In this example a clustering classifications
algorithm could be used to group of them into
the data into four clusters. cancer types
 (bottom).
In reality, the data corresponds
from cancer cell data of 14
different types of cancer. But from
our reduced dimensionality of the
data, we were only able to group
them into 4 different types!
 Clustering
Talk to the people around you to come up with
2 real-life applications where clustering would be useful
 - How might cluster analysis be useful for each example
SUBMIT YOUR ANSWERS ON CHIMEIN
 Summary
Supervised vs. Unsupervised Learning:
 - Supervised: Predicting a feature of data (from other
 features)
 - Unsupervised: Analyzing some structure about the data
Supervised Learning Tasks:
 - Regression: Predicting continuous features
 - Classification: Predicting discrete features
Unsupervised Learning Tasks:
 - Clustering: Finding groups of similar entries in a dataset
 - Feature selection: Remove unimportant features from dataset
 - Dimensionality reduction: Turn m features to n features, m<n
 - Principal Component Analysis (PCA)
 - MultiDimensional Scaling (MDS)
 Extra practice
You can use this colab notebook to get some extra practice
with Pandas.
=================== 1.[REDACTED].pptx.txt
CSCI 4521: kNN, accuracy,
overfitting
Bernardo Bianco Prado
Computer Science & Engineering
Fall 2025
Slides adapted from Stephen Guy and Shelby Ziccardi
 Last time
We saw how we can classify data using the nearest neighbor
algorithm.
We were able to classify types of wheat from seed
attributes.
We learned that measuring distance can give unexpected
results if the units or orders of magnitude of the
attributes are not the same.
 Today
 - Automating nearest neighbor classification.
 - Visualizing nearest neighbor classification.
 - Measuring model accuracy.
 - kNN classification.
 Automating and visualizing
nearest neighbor
We will use this jupyter notebook.
 Measuring our classification
results
Now that we are writing code for classification
algorithms, we need to be able to determine whether or not
our model is good.
One metric that is commonly used for classification
problems is called prediction accuracy.
 Accuracy
The prediction accuracy is the number of correctly
classified samples divided by the total number of samples.
It's commonly reported as a percentage. And very easy to
communicate and understand!
It has some limitations that we will explore later.
 Can we measure our model
accuracy?
It looks like our model
perfectly classifies our
data.
So we have 100% accuracy.
But... We kind of cheated. Why
is that?
Unless we test new samples outside Illustration of the classification map. The
of the dataset, we don't know how different regions correspond to how our model
our model will perform in the real would classify different data points.
world!
 Overfitting
Overfitting is a phenomenon that happens when our model
works really well on the training data, but does not
perform well on new data.
This means that the model is fitting our training data too
closely! It's even following the errors and/or noise that
should be ignored.
Activity: With your neighbors, brainstorm some situations
where you would not be concerned about overfitting your
model to your dataset.
SUBMIT YOUR ANSWERS ON CHIMEIN
 How to avoid overfitting
1. Simulate unseen data from the training data
 - Leave one out accuracy: compute accuracy using the
 rest of the data besides the point being tested.
 Let's practice a leave-one-out classifier using this
 jupyter notebook.
 - Test-train split: train on only some data, compute
 accuracy the rest of the data.
 - Cross-validation: train on many different test-train
 splits.
 How to avoid overfitting
2. Penalize "flexible" models
 - Less flexible models are models that have less degrees
 of freedom, can fit less types of functions, etc.
 - To do this, when computing model performance, give a
 bonus to models that have less degrees of freedom.
 Example: score = accuracy - log(num_parameters)
 - Explored more formally in the Akaike information
 criterion (AIC) or Bayesian information criterion
 (BIC) metrics.
 Train-Test Split
Break data into two sets:
 - Training Data: Data you use to fit/train your model
 - Testing Data: Data you use to assess/test your model
This helps the model prevent overfitting, since training
data is only a partial sample that may not reflect the
real-world perfectly.
Models that don't overfit are said to generalize well.
 Issues with overfitting
Factors that make a model prone to overfitting:
 - Small number data points
 - Models with too many degrees of freedom
Nearest neighbor classifiers are very prone to
overfitting!
 Improving nearest neighbor
How can we make the nearest neighbor less prone to
overfitting?
What part of it makes it sensitive to noise?
 kNN
k-Nearest Neighbors (kNN) is an extension of the nearest
neighbor algorithm that looks at the k closest training
data points to a test data point, and then classifies the
test point as the most common label of those k closest
points.
 kNN
How does the choice of k
affect the model?
Does using a larger k affect
accuracy/overfitting?
 Illustration of the classification map. The
 different regions correspond to how our model
 would classify different data points.
 A perfect classifier?
Is it possible (or even desirable) to obtain a perfect
classifier?
 A perfect classifier?
Let X be the training data with its attributes, and Y be
the prediction of the training data (i.e. classification
of the training data)
Under what conditions can we fully predict Y from X?
 - Only when there are no two equal data points in X with
 different labels in Y.
 Example: predicting height from first name is
 impossible (two people with same name will have
 different heights). This is called unavoidable error.
 Summary
Classification:
 - Nearest-Neighbor Classifier: Prediction is closest
 neighbor
 - kNN: Prediction is vote over several close by neighbors
 -
Model Evaluation
 - Accuracy: How many predictions were correct
 - Flexibility: How many different types of functions the
 model can approximate
 - Test-train split: Taking subset of data to test accuracy
 - Overfitting: Reducing training error too much
 - Generalization: Doing well on data not seen in training
=================== 1.[REDACTED].pptx.txt
CSCI 4521: bayes classification,
kNN
Bernardo Bianco Prado
Computer Science & Engineering
Slides adapted from Stephen Guy and Shelby Ziccardi
 Last time
We saw there were issues with the nearest neighbors algorithm.
In particular, there was the issue of overfitting.
We saw that we can avoid overfitting in a model by performing a
train-test split, or cross-validation.
Models that have too many degrees of freedom (i.e. are too
flexible) or have a small number of training data are prone to
overfitting.
In the case of nearest neighbors, we can avoid overfitting by
looking at more than one neighbor! How many neighbors to look at
depends on the data (more on this later).
 Last time
We learned how to measure a model accuracy to determine
how a model performs on data.
We talked about what it would mean to have a perfect
classifier, and when that could, theoretically, happen.
 Today
 - Understanding what is the best possible classifier
 from the point of view of statistics.
 - Bayes' classifier.
 - kNN as a "realistic" Bayes' classifier.
 - Implementing kNN and finding the best k.
 A perfect classifier?
Is it possible (or even desirable) to obtain a perfect
classifier?
Let X be the training data with its attributes, and Y be
the test data (i.e. classification of the training data)
Under what conditions can we fully predict Y from X?
 - Only when there are no two equal data points in X with
 different labels in Y.
 Example: predicting height from first name is
 impossible (two people with same name will have
 different heights). This is called unavoidable error.
 A perfect classifier statistically?
Many times, we have to treat data from the perspective of
probability since we can't know the exact deterministic
function that would map the feature data X to the label
data Y.
This is specially true since there is noise and errors in
real world data, so even a perfect deterministic map would
not be able to account for these random fluctuations.
 A perfect classifier statistically?
How can we use the language of probability to think about
a classifier?
We can think about the labeling of a data point as a
probability distribution, where some labels are more
probable than others. This would account for certain
probabilistic errors or noise.
Example: when labeling digits, we might not know for sure
when a digit is a 1 or a 7, so our "real" labeling would
have some uncertainty.
 A perfect classifier statistically?
In mathematical terms, if we think of the feature data X
and labels Y as random variables. In which case, for each
observed feature data point x0, we can have a series of
probabilities associated with it:
 P(Y = 1 | X = x0), P(Y = 2 | X = x0), ...
where P is the conditional probability distribution of Y
given X, the numbers 1, 2, ... are the possible
classification labels, and P(Y = j | X = x0) is the
probability of the label being j given that we observed
the feature data point x0.
 The Bayes classifier
The best classifier, statistically, would be the
classifier that would have the best expected (i.e.
average) accuracy.
In that case, the best possible classifier c would be a
pretty intuitive one:
 c(x0) = argmaxj=1,2,3,...P(Y = j | X = x0)
This means we give x0 the label with the highest
probability from the underlying probability distribution.
 The Bayes classifier
The statistical error for a Bayes classifier is given by
 Bayes Error Rate = 1 - maxj=1,2,3,...P(Y = j | X = x0)
which means lowest possible probability that we mislabel
the point x0.
 So are all classification problems
solved?
Well... Yes if we know the probability followed by the data!
Which, most of the time, we don't know!
One paradigm of machine learning is estimating that
probability distribution.
Sometimes, we can get good outcomes by assuming that the
probability distribution falls within a category or is a
specific type of function.
Example: gaussian, etc.
 kNN as an empirical Bayes
classifier
kNN is a way of estimating a probability distribution of
the data using empirical evidence.
We will estimate P(Y = j | X = x0) by looking at the k
closest neighbors of x0 and see what percentage of them
have label j. In mathematical terms:
 kNN as an empirical Bayes
classifier
Understanding the formula:
Here
 x0 is the point we are trying to label;
 k is the number of closest neighbors of x0 used;
 N0 is the indices of the k closest neighbors of x0;
 X represents the input data, and Y represents the
 label of that input data (test data or real input data);
 xi is the training data element with index i, and yi is
 the label of the training data with index i;
 I is the indicator function that is 1 when the inputs
 match and 0 otherwise.
 kNN practice
Use the formula to calculate
probabilities that the point x has
label 1 (yellow) and label 0 (purple)
using k = 3.
Using your answer predict the label of Image showing data with purple or
x. What is the Bayes error rate for yellow labels and an input data
this prediction? point x with a green circle
 showing its 3 closest neighbors.
SUBMIT YOUR ANSWER ON CHIMEIN
 How do we choose k?
What are the effects of large vs small k? What do you
observe?
 Two pictures showing the output of the kNN algorithm with
 k=1 and k=100. The black boundary is the output of the
 algorithm and the purple boundary is the true boundary of
 the data.
 How do we choose k?
Small k: Overly flexible models too sensitive to data (thinks
noise is real data)
Large k: Too inflexible model, unresponsive to data (thinks
real data is noise)
The ideal k: the value of k that minimizes the test error
(maximizes test accuracy)
Flexibility: How many different "shapes" a model can take, or
how many different types of functions from feature space to
label space it can approximate.
 Bias and variance
There are two fundamental types of model errors:
 - Bias: How much a model makes assumptions that don't
 necessarily represent the data
 - Variance: How much a model assumes that the data exactly
 capture the true distribution of the real world
Flexible models typically have more variance
Inflexible models typically have more bias
Examples: SVM, Neural Network are very flexible, linear
regression is not flexible
 Bias and variance
 Comic strip illustrating the bias-variance tradeoff. The
 first box introduces the example, the second box is an
 example of low bias, high variance since they are
 looking at the project too closely and missing the big
 picture. The third box illustrates the high bias, low
 variance example since it assumes this project is of a
 specific type without really looking at it.
 Juggling bias and variance in
kNN To find the model with the smallest
amount of bias and variance, we choose
the value of k that minimizes the
classification error (maximizes the
accuracy) of the test data.
 Illustration of the optimal k for the
 classification between yellow and
 purple data points. The optimal value
 of k is 10 and we see it approximates
 the true boundary reasonably well.
 Generalization and overfitting
To evaluate the model performance and find the best parameter
for it, we use a train-test split.
Training Data: Data you use to fit/train your model
Testing Data: Data you use to assess/test your model
The test and training data should not overlap!
 Generalization and overfitting
Imagine trying kNN for all values of k from 100 down to 1.
Make a prediction...
 - How do you expect kNN with small k's to do in terms of
 accuracy on the testing data? What about on the training
 data?
 - How do you expect kNN with large k's to do in terms of
 accuracy on the testing data? What about on the training
 data?
 - What value of k has to most risk of overfitting?
 Finding the best k
What is the best k to use in
this case?
Hint: smallest error rate is
better.
 (k=100) (k=1)
 Plot of error rate vs 1/k (for k from 1 to 100) for
 both the training and test data. Orange line
 represents test error and blue line represents
 training error. The dashed horizontal line represents
 the smallest test error.
 Now let's code...
We will use this jupyter notebook.
What we will learn:
 - Split test and train data
 - Compute accuracy
 - Use multiple features
 - SKLearn library
 Activity: kNN on Iris data
You can use use this jupyter notebook as a starting point.
Evaluate testing and training accuracy for every 2 K values
from 1 to 50.
Hints: ("Setosa",
 - You can reuse code!
 - You'll need to convert the labels from strings
 "Vericolor", "Virginica") to number (0,1,2).
 You can use np.unique and a for loop.
SUBMIT THE GRAPH OF THE DIFFERENT k ACCURACIES ON CHIMEIN
 Model complexity
Small k allows more complex model (flexible, high variance)
Large k models are simpler (inflexible, high bias)
Visually, small k will have complex boundary curves and large k will
have simpler boundary curves.
 Three plots showing the classification boundary for kNN with values of
 k equal to 1 (left) 5 (center), and 20 (right). We see that the
 boundary curve gets simpler as k increases.
 Interpreting k graphically
For what values of k are we
overfitting?
 Plot of k vs accuracy for
 both training (blue) and
 test (orange) data.
 Summary
Classification:
 - Nearest-Neighbor Classifier: Prediction is closest neighbor
 - kNN: Prediction is vote over several close by neighbors
 This is a Bayes classification with an empirically estimated
 probability distribution.
Model Evaluation
 - Accuracy: How many predictions were correct
 - Bias-Variance Tradeoff: Does the model lean more towards
 prior assumptions (bias) or the data itself (variance)
 - Flexibility: How many shapes the model can take
 - Test-train split: Taking subset of data to test accuracy
 - Overfitting: Reducing training error too much at the expense
 of the error on data outside of training
 - Generalization: Doing well on data not seen in training
```
- `Bash`
```bash
S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad/decks"; cd "$S"; for f in 1.4* 1.5*; do echo "=================== $f"; sed 's/[[:space:]]\+/ /g' "$f" | grep -v '^ *$'; done
```
```
=================== 1.[REDACTED].pptx.txt
CSCI 4521: generalization,
confusion matrix, accuracy,
precision, recall, f1 score
Bernardo Bianco Prado
Computer Science & Engineering
Slides adapted from Stephen Guy and Shelby Ziccardi
 Last time
We learned what it means to be a statistically perfect
classifier, i.e. Bayes classifier.
The issue with that is that we would need to know the probability
distribution followed by the data.
One way to go about this is try to empirically estimate this
probability distribution by making some assumptions about the
data.
kNN is essentially a way of doing that by estimating the
distribution using the labels of the nearest neighbors.
 Last time
We talked about the bias-variance trade-off.
Bias means how many assumptions a model makes about the data
(approximating the data distribution by a different type function
- usually simpler - than its true distribution).
Variance is how much the model assumes that the training data
represents the real data. Models with high variance would give
different results if they are trained on different data points
from the same data set (which is bad).
 Last time
Usually as a model flexibility increases, the more variance it
will have, making it prone to overfitting.
In practice, we want a model that generalizes well, that is it
performs well on unseen data. For this, we make sure that we have
the smallest combination of the variance and bias errors.
One way to do that is using a train-test split, which we can also
use to control the flexibility of the model by tuning the model
parameters (e.g. k in kNN).
 Today
 - More on overfitting vs generalizing
 - Binary classification
 - Confusion matrix
 - Accuracy, precision, and recall
 - F1 score
 Overfitting dos and don'ts
How to overfit - bad! How to generalize
Use overly flexible models Avoid overly flexible models
Use extra features to add Avoid unnecessary features
additional flexibility Try removing weak features
 Don't add features "just in
Use a small amount of data case"
points in training
 Gather lots of training data
Find model parameters using (and save some for testing)
testing data
 Train on training data, assess
 on testing data
 Types of kNN
Many practical choices to make when implementing kNN
Finding neighbors: value of k (e.g., 1,5,10) to choose
 - Option 1: Choose a fixed distance, and include any neighbors
 k nearest neighbors
 - Option 2: Choose a fixed
 within that distance
Weighing neighbors in voting:
 - Option 1: Each neighbor counts equally
 - Option 2: Closer neighbors count more
Speed: kNN is slow, we can use spatial data structures of
approximate neighborhood
 Binary Classification
These are classification
problems with only two
categories.
The two categories are commonly
referred to as positive and
negative.
 An image showing a robot representing a binary
 classifier between dogs and cats. Source:
 Towards Data Science
 Evaluating binary classifiers
The main quantities that are useful in evaluating a binary
classifier are whether positives or negatives are correctly or
incorrectly assigned.
There are four possible outcomes from a binary classification of
a data point:
True Positives (TP): Accurately predicting positive/true Predicts
False Positives (FP): Incorrectly predicting positive/true positive
True Negatives (TN): Accurately predicting negative/false Predicts
False Negatives (TN): Incorrectly predicting negative/false negative
 Confusion matrix
A way of visualizing the TP, FP, TN, FN rates.
Binary confusion matrix:
 Actually Positive Actual Negative
Predicted Positive True Positive False Positive
Predicted Negative Type I error - false
 alarm, overestimation
 False Negative True Negative
 Type II error - miss,
 underestimation
 Confusion matrix
There are many terms and useful quantities related to the
confusion matrix:
 Accuracy
How many data points were correctly labeled.
For multi-class classifiers:
For binary classifiers:
Issues with accuracy:
 - If data is unbalanced (high percentage have one label and
 small percentage has the other), then a bad model can have
 good accuracy by prioritizing the high percentage label.
 - Combines type I and type II errors that may have different
 importances. E.g. medical diagnosis.
 Precision (type I error)
Precision measures the accuracy of positive
predictions:
 - If a classifier says it's positive, is
 it really?
 - Useful if we don't want to misclassify
 negatives!
For binary classifiers:
Precision focuses on type I error. [Wikipedia]
Low precision means we have a high false Image illustrating the precision by
positive rate (FPR). highlighting the part of the data set it
 focuses on in green (true positives) and
 red (false positives)
 Recall (type II error)
Recall measures the accuracy of positive
samples:
 - If the data is positive, will the
 classifier say it's positive?
 - Useful if we don't want to misclassify
 positives!
For binary classifiers:
Recall focuses on type II error. [Wikipedia]
Low recall means we have a high false Image illustrating the recall by
negative rate (FNR). highlighting the part of the data set it
 focuses on in green (true positives) and
 darker green (false negatives)
 Example
Consider the task of predicting if a patient has COVID-19 based
on their chest x-ray. You test it on 100 patients, 20 of which
have COVID-19. The results correctly say 15 of the 20 subjects
with COVID-19 are COVID positive, and incorrectly says that 5 of
these 20 are negative. The results correctly say 65 of the 80
subjects without COVID-19 are COVID negative, and incorrectly say
that 15 of these 80 are positive.
Lets compute accuracy, precision, and recall!
Between precision and recall, which one is more important for
COVID-19 diagnosis?
SUBMIT YOUR ANSWERS ON CHIMEIN
 Optimizing a classifier
If I'm choosing a classifier, should I ...
a) ... maximize accuracy? SUBMIT YOUR EXAMPLES
b) ... maximize precision? FOR THE ANALYSIS
c) ... maximize recall? QUESTION ON CHIMEIN
Analysis activity:
 - A case where good accuracy but low precision is very bad?
 - A case where good accuracy but low recall is very bad?
What's the best single number to summarize classifier
performance?
 - Some combination of Precision and Recall?
 - Precision + Recall?
 - Precision * Recall?
 F1 score
The F1 score of a classifier is the harmonic mean of precision
and recall:
The F1 score weights both precision and recall equally.
It ranges from 0 to 1 (1 being a perfect classifier)
 F� score
The F� score of a classifier is a weighted harmonic mean of
precision and recall:
F� can weigh precision or recall more
 = 2 focuses more on Recall
 = 0.5 focuses more on precision
F� is common in document search and retrieval
 Example
Consider the task of predicting if a patient has COVID-19 based
on their chest x-ray. You test it on 100 patients, 20 of which
have COVID-19. The results correctly say 15 of the 20 subjects
with COVID-19 are COVID positive, and incorrectly says that 5 of
these 20 are negative. The results correctly say 65 of the 80
subjects without COVID-19 are COVID negative, and incorrectly say
that 15 of these 80 are positive.
Lets compute the F1 score!
SUBMIT YOUR ANSWERS ON CHIMEIN
 Other somewhat popular metrics
Fowlkes-Mallows Index (FMI)
Cohen's Kappa
Confusion Entropy
K measure
Informedness (TPR - TNR) and Markedness (PPR - TN/PN)
Matthews Correlation Coefficient (MCC)
 Summary
Classification:
 - Confusion Matrix: Prediction vs. Actual for each class
 - TP, FP, TN, FN: True/False Positives/Negatives
Error Types:
 - Type I Errors: False Positives
 - Type II Errors: False Negatives
Metrics:
 - Accuracy: Percent Correct
 - Precision (P): Measures False Positives: TP/(TP+FP)
 - Recall (R): Measures False Negatives: TP/(TP+FN)
 - F1 Score: Balances Precision & Recall: 2*(P*R)/(P+R)
=================== 1.[REDACTED].pptx.txt
CSCI 4521: kNN wrap up, kd trees,
lsh, complexity, bias
Bernardo Bianco Prado
Computer Science & Engineering
Slides adapted from Stephen Guy and Shelby Ziccardi
 Last time
We talked about certain metrics we can use in binary
classification problems.
These were accuracy, precision and recall.
We can visualize these using the confusion matrix, and we can
measure their success using a F1 or F� score.
 Today
 - Meaning of parametric and non-parametric models
 - Model complexity vs flexibility
 - Computational issues with kNN
 - Avoiding computational complexity of kNN by using spatial
 data structures such as KD-trees and Locality Sensitive
 Hashing (LSH)
 - Bias on data
 Parametric and non-parametric
models Non-parametric models
Parametric models
Assumes that some type of equation Makes no assumptions about the form
can fit the data. of f(x). Try to estimate the "shape"
Then fit/train the equation of f without having a function that
parameters to fit the data. is too "rough" shaped.
Example: linear regression, assumes Rely on large datasets plus
the data can be modeled by f(x)=ax + interpolation.
b and find the best constants a, b to
fit the data. In higher dimensional Example: kNN
data, this would become f(x) = ATx +
b where A is a matrix and b is a We can avoid overfitting by
vector. controlling how smooth the estimated
 function is. E.g. lower k in kNN.
We can avoid overfitting by choosing
simpler types of equations.
 Parametric and non-parametric
models Non-parametric models
Parametric models
Need fewer data for training Need a lot more data for
 training
Are more explainable
 Don't give us a explicit
Have the risk of modeling the function we can interpret
data with the wrong type of
function Can model essentially any type
 of function
 Model complexity vs flexibility
No common definition of complexity, but a common description is:
 - Model Complexity: How many parameters you can tune on your
 model
 - Model Flexibility: How many shapes can the approximated
 function take in your model
Model complexity makes more sense in parametric models.
Example: quadratic fit is more complex than linear fit
Model flexibility is a more general notion that can be applied to
both parametric and non-parametric models!
 Computational issues with kNN
To run 1-nearest neighbor, the computational complexity is O(dn):
have to loop through n training data points and compute the
distance between new data and each of the training data requires
a loop through the d features of the points.
What is the bottleneck of kNN? How can we accelerate it?
Issue: looping through data points is slow!
We can explore spatial data structures to exploit locality to
decrease computational complexity to O(d log n). We just need to
spend O(dn) sorting of the data first.
 Computational issues with kNN
To run kNN, run 1-nearest neighbor k times!
So for kNN, the computational complexity is O(kdn) without data
sorting, and O(kd log n) with data sorting.
With certain data structures, we may be able to exploit locality
to find all k neighbors at once!
 Approximate kNN
We can get an approximation of the kNN algorithm that is faster
to compute by:
1. Find m k close points quickly - O(d log n)
2. Then choose the k closest of them
This is fast but may miss a closer neighbor in the first stage!
 Finding neighbors quickly
How do we find these m neighbors quickly? Spatial data structures
KD-trees
Recursively break space up into two parts
Each split will be done with a different feature
Neighbor search takes O(d log n)
Locally sensitive hashing (LSH)
Split space with l random overlapping hyperplanes, generating 2l
regions
Only compare test point to training data in the same region
Neighbor search takes O(d log n) as long as l log n
 KD-trees
1. Start with the first feature (i.e. first entries of the
 training data xi vectors)
2. Find the point with the median of that feature over all data
3. Split data into two categories, one with first feature
 smaller than the median, and the other with first feature
 larger than the median.
4. Now move on to the second feature and repeat in each of the
 two categories.
5. Then move on to the third feature and repeat on each of the 4
 new categories, and so on...
 KD-trees
1. Start with the first feature (i.e. first entries of the
 training data vectors)
2. Find the point with the median of that feature over all data
 Source: Prof. Jenny Chen kd-trees notes
 KD-trees
3. Split data into two categories, one with first feature smaller
than the median, and the other with first feature larger than the
median.
 Source: Prof. Jenny Chen kd-trees notes
 KD-trees
4. Now move on to the second feature and repeat in each of the
two categories.
 Source: Prof. Jenny Chen kd-trees notes
 KD-trees visually
 Image showing the visualization of the kd node
 split in each stage
 Source: Prof. Jenny Chen kd-trees notes
 KD-trees
Searching for nearest neighbors in KD trees is similar to a
binary search with some extra steps because we are searching for
closest distance.
We just need to essentially insert the structure within a circle.
 Figure showing
 a kd-tree
 structure with
 a circle to
 incorporate
 distance.
 Locality Sensitive Hashing (LSH)
This is a randomized way of splitting space that works really
well for high dimensional data (many features).
It can get a bit complicated, but the idea is to split the data
using hash functions that will help compare data points.
These functions can be created by generating a number l log n
of random hyperplanes and then mapping a data point to a vector
that tells us which side of all the hyperplanes it is on.
Here are some papers for people who are curious about this. Paper
1, Paper 2, Paper 3.
 Locality Sensitive Hashing (LSH)
Searching is done by regions with the added metric of distance.
 Figure showing
 the LSH
 algorithm search
 with the
 distance metric.
 Locality Sensitive Hashing (LSH)
To check the region a point is in, we need to check which side
it's in in relation to the hyperplanes.
We can think of a hyperplane as being represented by a
perpendicular vector v = (v1, v2, ... , vd) and a constant b.
To determine whether a point x lies below or above the
hyperplane, we just need to see if
vTx b or vTx < b (1)
If we want to do that with many hyper planes given by
perpendicular vectors h1, h2,..., hl, we check equation (1) for
all hyperplanes.
 Locality Sensitive Hashing (LSH)
Using linear algebra, we can do this all at once using matrices:
 A = [[h T 1 , b1],
 [h T 2 , b2],
 ...
 [h T l , bl]]
Then, given a point x, we can create a vector p = [[xT, -1]]T and
check which entries of
 Ap
are positive and which ones are negative. We can use a function
s : Rl -> {0,1}l which outputs 0 or 1 for each entry depending on
whether it's positive or negative.
 Locality Sensitive Hashing (LSH)
This gives us our hash functions
 H : Rn -> Rl
defined by
 H(x) = s(Ap)
and whose output will look like [[0,1,0,0,...,1]]T. If two vectors
have the same output of this hash function, they live on the same
hyperplane region.
The computation of H(x) has complexity O(dl) = O(d log n) as long
as llog n.
 Tuning KD-trees and LSH
Both methods can miss neighbors and will have different ways of
dealing with that.
In practice, it's usually ok to miss neighbors as long as we get
a good representative sample of the closest neighbors.
If we don't find enough neighbors in our search, we can improve
that by doing the following:
 - Increase search radius in KD-trees
 - Rerun LSH with new random hyperplanes and take the union of
 all neighbors found across runs.
 KD-trees vs LSH
KD trees is very effective in lower dimensional data (small
number of features), but suffers in higher dimensional data.
This is because they end up dividing space into very small
buckets, which becomes harder to deal with with higher
dimensional spaces.
With LSH, we can control the number of hyperplanes and, therefore
control the size of the regions. LSH can be thought of as a way
of reducing the dimensionality of the data, by sacrificing a good
amount of information from that data.
Moral of the story: for low dim data (< few dozen features)
KD-trees outperforms LSH, for higher dim data (>~ 20 features)
LSH outperforms KD trees.
 Why is kNN so important to learn
We could have started with any algorithm. Why did we start with
kNN?
 - Simple to understand (and explain to your non-ml colleagues
 in a company)
 - Well motivated
 - Easy to implement
 - Can be accelerated with good choice of data structures
 - Can be very flexible
 - Can be adapted to almost any ML task!
 Why is kNN so important to learn
We can even adapt kNN for regression by choosing the output of
our regression function to be the average of the values of the k
closest training data.
Where
 x0 is the point we are trying to label;
 k is the number of closest neighbors of x0 used;
 N0 is the indices of the k closest neighbors of x0;
 yi is the value taken by the training data with index i;
 Why learn anything else?
Downsides to kNN
 kNN is slow at testing time
 Must carry around all data you've ever seen in training
kNN Costs:
 Runtime O(d log n)
 Memory O(dn)
Improving kNN
 Reduce d: Dimensionality reduction speeds up (and improves)
 kNN
 Not storing every training data (reduce memory storage)
 Parametric methods don't grow as you train on more data
 The rest of the semester
The rest of the course will be improving on KNN! 
Unit 2 - Dimensionality Reduction
Can help accelerate kNN (and similar algorithms)
Unit 3 - Regression & Unit 4 - Classification
Regression & Classification with Parametric models
We can already do both with kNN (non parametric)
Parametric models use less storage than kNN
Parametric models are faster to query than kNN
Unit 5 - Deep Neural Networks (DNN)
DNNs ... act a lot like a parametric summary of kNN
Many intuitions built on kNN carry over to DNN
 Unit 1 summary
kNN Model Selection and Evaluation Metrics
- How does kNN work? Eval - Classification vs.
 Regression
- What problems is kNN - What makes a model - Binary classifiers
for? flexible? - What is accuracy?
- Effect of different k - Ex. of more/less - What is a confusion
- Choosing the best k in flexible models matrix
kNN? - Need for test/train - False positives, false
- Parametric/ split negatives, true positives,
non-parametric models - What is overfitting? true negatives
 - What is Precision?
 - How to overfit / how to Recall? F1?
 - Precision/Recall vs.
 avoid? Accuracy?
 - Memorize equations for:
SUBMIT YOUR FAVORITE - Bias-Variance trade-off F1, Precision, Recall,
 Accuracy (!)
UNIT 1 TOPIC (AND - Working with imbalanced
 datasets
WHY) ON CHIMEIN, AND
ONE QUESTION YOU
STILL HAVE ABOUT THE
MATERIAL WE LEARNED
 Ethics in ML: data bias
Bias: Prejudice in favor of or against one thing, person, or
group compared with another
Ethics: Moral principles that govern behavior
Equity: Quality of being fair
Accountable: Explicable or required to justify actions
 Ethics in ML: data bias
Deception: Are we clear about limits of ML results
Fairness: Is ML being used to amplify injustices?
Alignment: Is the ML/AI system doing what you intended?
Control: Can you limit what an AI agent can do?
 Ethics in ML: data bias
The main source of ML model bias comes from the bias that exists
in data.
Example: if a non-representative dataset is used, it could
significantly affect the results of the model.
 Cherry!
 Figure illustrating the impact of data bias on kNN. If the sample of
 grapes taken is not representative, we would mislabel a grape for a
 cherry.
 Ethics in ML: data bias
The main source of ML model bias comes from the bias that exists
in data.
Example: if a non-representative dataset is used, it could
significantly affect the results of the model.
 Grape!
 Figure illustrating the impact of data bias on kNN. If the sample of
 grapes taken is not representative, we would mislabel a grape for a
 cherry.
 Types of bias
Confirmation Bias: gravitating towards data that confirms what
one already believes.
Historical Bias: when information found in specific time periods
appear in a dataset are no longer true.
Selection/Sampling Bias: when the sample collected is not
reflective of the target population.
Survivorship Bias: when the successful group of a dataset is
taken as a representative sample of the entire population,
ignoring the failure group.
Availability Bias: when only data of one specific part of the
population is available.
 Types of bias
Confirmation Bias: gravitating towards data that confirms what
one already believes.
Example: thinking that the nintendo switch is worse than a
playstation and only asking playstation users why it's better
than a switch.
 Types of bias
Historical Bias: when information found in specific time periods
appear in a dataset are no longer true.
Example: if people were trying to analyse how traffic in
Minneapolis and use data from the COVID period, which is not
representative of how people behave in traffic now. Plus roads
have changed, etc.
 Types of bias
Selection/Sampling Bias: when the sample collected is not reflective
of the target population.
Example: optional surveys usually are hard to analyze, since it could
be the people who have a good or bad experience with a service are
more likely to fill a survey.
 Cartoon explaining
 selection bias in the
 context of surveys.
 Types of bias
Survivorship Bias: when the successful group of a dataset is
taken as a representative sample of the entire population,
ignoring the failure group.
Example: WW1 planes that came back with holes in them were only
the surviving part of the sample of all planes.
 Cartoon explaining
 survivorship bias in
 the context of the
 plane from WW1. Showing
 a plane with the holes
 and two people making
 conclusions from that.
 Types of bias
Availability Bias: when only data of one specific part of the
population is available.
Example: a lot of studies are conducted on college students even
if the target population is much more broad.
 Types of bias
ON CHIMEIN, SUBMIT A REAL WORLD EXAMPLE FOR EACH TYPE OF BIAS
```
- `Bash`
```bash
S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad/decks"; cd "$S"; for f in 2.1* 2.2* 2.4*; do echo "=================== $f"; sed 's/[[:space:]]\+/ /g' "$f" | grep -v '^ *$'; done
```
```
=================== 2.[REDACTED].pptx.txt
CSCI 4521: unit 2 intro, text data,
intro to nlp
Bernardo Bianco Prado
Computer Science & Engineering
Slides adapted from Stephen Guy and Shelby Ziccardi
 HW 1 written report
 - Should have enough information so that a reader could replicate
 your report from just reading it.
 - You must justify all your choices made in the questions.
 - You should convince the reader that they should trust your
 results.
 - The target audience is someone who is at the same learning stage
 as classmates. Meaning you shouldn't use terms or concepts that
 were not covered in class yet.
 - Clarity is part of the grading rubric!
 - If writing on the jupyter notebook, your code and cell
 organization should be pristine.
These are all general science communication principles you should take
with you for the rest of your life. Here's an example of a
well-written report.
 Unit 2: Unsupervised Learning
Text Data
Representing text as vectors
Cosine Similarity
NLP basics (TF-IDF, Stemming, Stop Words, Bigrams)
Unsupervised Methods: Clustering
K-Means Clustering
Unsupervised Methods: Dimensionality Reduction
Principal Component Analysis (PCA)
Others:
KNN with text
KNN + Unsupervised methods
Leakage in training
 Today
 - How to represent text data
 - Comparing text data
 - Introducing distance into data
 - Informativeness
 - NLTK toolkit
 Natural Language Processing (NLP)
Natural Language Processing: Draws on ideas in Linguistics,
Computer Science, and Artificial Intelligence to understand,
represent, and reason about human language.
Common NLP Tasks: (NLI), Language Understanding
 - Speech Recognition
 - Natural Language Inference
 - Text Generation, Q&A
 - Machine Translation
 - Text Summarization
How can we apply our ML knowledge so far to NLP tasks?
E.g. Can we use kNN on text data?
 Text Data
Example: which of the three sentences are the most similar?
1. How do pokemon trainers catch pokemon?
2. What is the strongest Pokemon?
3. How do I restart my phone?
To be able to use ML, we need precise definitions. Intuitively,
how do we define similar?
Synonymity: same meaning in some or all contexts
Antonymy: opposites with respect to one feature of meaning
Similarity: sharing some element of meaning
 Bag-of-words text representation
One way to represent text as vectors is looking at it as a
collection of words independent from the order of the words.
Each feature of the data will be the number of times each word
shows up in the text.
Example:
Text: "How do pokemon trainers catch pokemon?"
Feature words: [how, do, pokemon, trainers, catch]
Feature counts: [1,1,2,1,1]
As new words show up, we can update the feature words and the
count vector.
 Bag-of-words text representation
Two sentence example:
Text data:
["How to catch pokemon?", "Which Pokemon in the hardest Pokemon
to catch?"]
Feature words:
[how, to, catch, pokemon, which, is, the, hardest]
Feature counts for each sentence:
[[1,1,1,1,0,0,0,0], [0,1,1,2,1,1,1,1]]
 Bag-of-words text representation
The set of all feature words in a text data is called the
vocabulary of that data.
What are some usefulness and shortcomings of the bag of words
approach?
SUBMIT AN ANSWER TO THIS QUESTION ON CHIMEIN
 Tokenization
Tokenization is the process of dividing natural text into
separate units called tokens.
Two common processes:
 - First splitting white spaces.
 - Then make all lowercase and strip punctuations.
Example:
"Oh, `hello' there world!" -> [`oh',`hello',`there',`world']
In Python code:
"Oh... hello there world!".replace(".","").replace("!","").lower().split()
Output: [`oh',`hello',`there',`world']
 Vectorization
Vectorization is the process of creating a numerical vector
representation of text data.
This is normally done based on the output of the tokenization of
the data.
Example:
"Oh, `hello' there world!" -> [`oh',`hello',`there',`world']
 -> [1,1,1,1]
In Python code: can be done in numpy using np.unique
 Measuring distances for text
After vectorizing text data, we can measure distances using
different distance functions in Rn.
Suppose we have two points u and v in Rn. We can measure the
distance between them in different ways.
Two common ways to do it are using the l1 and l2 distances:
l2 (Euclidean) distance -
 Measuring distances for text
After vectorizing text data, we can measure distances using
different distance functions in Rn.
Suppose we have two points u and v in Rn. We can measure the
distance between them in different ways.
Two common ways to do it are using the l1 and l2 distances:
l1 distance -
 Measuring distances for text
One common tool for dealing with vectors is normalizing them.
This means dividing the vector by its norm.
Note that the normalization is always done with whatever norm we
are using in the situation, e.g. l1 or l2.
The normalization of a vector u in Rn is defined as:
Why might we want to normalize vectors when dealing with text
data?
 Measuring distances for text
Why might we want to normalize vectors when dealing with text
data?
Here's a comparison of distances between vectors without and with
normalization:
 Two figures showing
 the effects of
 normalizing vectors
 before computing
 distances.The first
 and second figures
 plot the l2 distance
 without and with
 normalization,
 respectively. The
 colors range from
 dark blue (small
 distance) to white
 (large distance).
 Cosine similarity
Measuring the distance between unit (i.e. normalized) vectors, is
just measuring the angle difference between the vectors!
One way to do this is using the cosine function between vectors.
The cosine similarity between two vectors is a measure of how
much they point in the same direction (the cosine of the angle
between them):
Where 1 means vectors point in the same direction, 0 means they
are perpendicular, and -1 means they point in opposite
directions.
 Cosine distance
The cosine distance between two vectors is 1 - cos(u,v) and it
ranges from 0 to 2.
Cosine similarity and distance are very common in text-based
learning.
They also automatically ignore vector magnitude!
 Stop words
When gathering meaning and similarity from text data, there may
be some words that are more important than others.
Example: to figure out which of the sentences are more similar,
matching `how' and `do' as important as `Pokemon'? Why or why
not?
 - How do pokemon trainers catch pokemon?
 - What is the strongest Pokemon?
 - How do I restart my phone?
 Stop words
Stop words are common words that are filtered out before
vectorization of the text data.
Example: how, to, the, a, who
After tokenizing the sentences
 - How do pokemon trainers catch pokemon?
 - What is the strongest Pokemon?
 - How do I restart my phone?
 Stop words
Stop words are common words that are filtered out before
vectorization of the text data.
Example: If we eliminate stop words from the sentences
 - How do pokemon trainers catch pokemon? Which of the
 - What is the strongest Pokemon? tokenizations are the
 - How do I restart my phone? closest after
 removing stop words?
We get the tokenizations
 - (pokemon, trainers, catch, pokemon)
 - (strongest, pokemon)
 - (restart, phone)
 Stop words have limitations
The idea of eliminating stop words can help us get the theme of a
sentence, but they have their shortcomings.
Can you think of situations where removing stop words may cause
issues?
 "To be or not to be" just is a collection of
 stop words, but stop words alone don't do it
 any justice.
 John Muller, Feb 2021
 (Google Developer Relations)
 Measuring informativeness
Stop words gives us a binary way of measuring word
informativeness. There are ways to get a more gradual measure of
informativeness.
Useful definitions:
 - Term frequency: ft,d is how often term t occurs in document d.
 - Document frequency: df is how often all documents in a set D
 contain the term t.
 - Inverse document frequency: log (1/df) =
 Measuring informativeness
Note: if df is 1 (i.e. all documents have one occurrence of t),
then idf will be 0.
So idf measures the rarity of of a word, and therefore, its
importance.
 tf-idf
The tf-idf measurement multiplies term frequency and inverse
document frequency:
 Practice time
We will compute the tf-idf of a sentence and continue practicing
using this jupyter notebook.
SUBMIT THE ANSWERS TO THE QUESTIONS AT THE END OF THE NOTEBOOK ON
CHIMEIN
 Stemming
So far, in the way we represented text data, we would consider
the word care and cared as too completely unrelated tokens.
In practice, however, they have a relationship and carry similar
meaning.
Stemming is the process of taking a word down to its root.
Example: removing suffixes such as "ly", "ind", or "ed"
 "cared" -> "care" and "fairly" -> "fair"
Easy to explain but annoying to implement! There are many special
cases, order of rules matters, etc.
 Stemming
In practice, we use stemming libraries that can deal with the
laborious process of stemming for us.
A popular stemmer is called Snowball and it implements what is
called the Porter algorithm.
 Using the NLTK toolkit
NLTK (natural language toolkit) has stemming implementations.
It supports different NLP tasks such as
 - Classification
 - Tokenizing
 - Stemming
 - Parsing text trees
 - Tagging parts of speech
 - ... much more
 Using the NLTK toolkit
NLTK (natural language toolkit) has stemming implementations.
Example code:
 import nltk.stem
 english_stemmer = nltk.stem.SnowballStemmer('english')
 print(english_stemmer.stem("follow")) #follow
 print(english_stemmer.stem("followers")) #follow
 print(english_stemmer.stem("following")) #follow
 Finding context: n-grams
A bigram tokenization is a tokenization that takes into
consideration pairs of consecutive words.
Example: "to be or not to be" ->
 ["to be" (x2), "be or, "or not", "not to"]
A n-gram tokenization is a tokenization that takes into
consideration collections of n consecutive words.
Example: 4-gram: ["to be or not", "be or not to, "or not to be"]
 Finding context: n-grams
Advantages:
 - Some concepts are multiple words (e.g., "United Kingdom")
 - Can capture limited context (e.g., "not happy", "not like")
 - Clarifies homographs i.e. words that are spelled the same but
 have different meanings (e.g., "windy road" vs windy day")
Disadvantages:
 - Best n depends on dataset size
 - Large n can introduce variance in n-gram frequency estimation
Modern natural language processing takes into consideration many
different values of n when learning on text data.
 Limitations of the BOW approach
Consider these sentences: does Bag-of-words model say?
 - The big cheese
 - The small cheese
 - The tiny cheese
Which two are closest? What
BOW models ignore the meaning of words We'd like to turn words or
phrases to vectors but keep the meanings somehow!
This can be achieved with deep learning!
BOW is order independent
 - "Man bites dog" vs "Dog bites man"
 Summary
Natural Language Processing (NLP)
 - Long history and lots of applications
 - Want to compare sentences
Vectorization: Create vector of numbers
 - Methods are forms of tokenization
 - Bag-of-Word (BOW) Descriptor: frequency of each word stored in vector
 -
Similarity measures
 - L1 and L2 distance
 - Cosine similarity: angle is a measure of vector similarity
 -
Data augmentation
 - Stop words: common words without meaning (can be filtered out)
 - Term-frequency and inverse document frequency (tf-idf)
 - Stemming: reduce words to root
 - Bi-grams/n-grams: combine words for more meaning
=================== 2.2_nlp_practice.pptx.txt
CSCI 4521: nlp practice
Bernardo Bianco Prado
Computer Science & Engineering
Slides adapted from Stephen Guy and Shelby Ziccardi
 Last time
Natural Language Processing (NLP)
 - Long history and lots of applications
 - Want to compare sentences
Vectorization: Create vector of numbers
 - Methods are forms of tokenization
 - Bag-of-Word (BOW) Descriptor: frequency of each word stored in vector
 -
Similarity measures
 - L1 and L2 distance
 - Cosine similarity: angle is a measure of vector similarity
 -
Data augmentation
 - Stop words: common words without meaning (can be filtered out)
 - Term-frequency and inverse document frequency (tf-idf)
 - Stemming: reduce words to root
 - Bi-grams/n-grams: combine words for more meaning
 Today
Practice with NLP concepts using internet posts.
 UseNet data
UseNet is a web protocol that predates the world wide web.
It was a precursor to social media that allowed peer-to-peer,
asynchronous discussion via posts to a topic category.
It was created in 1979 and had the most popularity on the 1980s
and early 1990s.
 UseNet data
UseNet was divided into nine
hierarchies that had their own
guidelines. The hierarchies
essentially categorized the subject
of the posts.
Example: rec.sports.baseball,
comp.graphics,
humanities.design.misc, rec.music,
sci.research, soc.culture.peruvian
 Image showing the nine hierarchies of
 UseNet: comp.*, humanities.*, misc.*,
 news.*, rec.*, sci.*, soc.*, talk.*, and
 alt.*
 UseNet data
The UseNet dataset is a subset of topics with a subset of posts.
There are about 20,000 newsgroup posts from 20 newsgroups.
The topics are:
 - Computers: comp.graphics, comp.os.ms-windows.misc,
 comp.sys.ibm.pc.hardware, comp.sys.mac.hardware, comp.windows.x
 - Recreation activities: rec.autos, rec.motorcycles,
 rec.sport.baseball, rec.sport.hockey
 - Science: sci.crypt, sci.electronics, sci.med, sci.space
 - Politics: talk.politics.misc, talk.politics.guns,
 talk.politics.mideast
 - Religion: talk.religion.misc, alt.atheism, soc.religion.christian
 - Miscellaneous: misc.forsale
 Predicting the topic
Our goal is to predict a post topic from the post content.
We will use this jupyter notebook.
We will use:
 - SK-Learn's CountVectorizer
 - SK-Learn's TfidfVectorizer
 - Using stop words
 - Stemming with NLTK and SnowballStemmer
 - Computing normalized vector distance
 - Computing cosine vector similarity
SUBMIT BEST AND WORST EXAMPLES FOR CLOSEST STORY ON CHIMEIN
 Summary
Key Ideas:
 - KNN on Text Data
 - Bag of Word Descriptors
 - Vectorization
 - Distance Metrics: L1, L2, Cosine
 - Stopwords, TF-IDF, Stemming, Bigrams, n-grams
 - NLP limitations and challenges
Next time:
 - Unsupervised methods
 - Clustering and dimensionality reduction
=================== 2.4_pca.pptx.txt
CSCI 4521: PCA
Bernardo Bianco Prado
Computer Science & Engineering
Slides adapted from Stephen Guy and Shelby Ziccardi
 Last time
k-means clustering
 - k-means clustering is an iterative algorithm
 - Begin with random assignments find centroids reassign 
 repeat until convergence
 - Each run can be different
 - Can measure quality of a clustering using within-cluster
 variation
 - Sum of distances from points to centroid
 - Choosing how many clusters is a hard question!
 - See a method today :)
 Today
Principal Component Analysis
 Dimensionality reduction
Remember that we talked about the curse
of dimensionality!
As the dimension grows, the amount of
data needed to generalize well
increases exponentially!
One way to get around that is through
feature selection by observing plots of
pairs of features.
But what if all the features are
useful? Or maybe a certain combination
of them but no isolated ones?
 Plots comparing pairs of features
 from our plant variety data
 activity.
 Dimensionality reduction
Principal Component Analysis
(PCA) deals with that by
approximating the data with a
lower dimensional subspace of
the feature space.
 Plot illustrating how we can
 approximate 3D data by a 2D
 subspace.
 Dimensionality reduction
Looking at this plot, we have
two directions PC1 and PC2 that
define this plane.
Let's explore how to find PC1:
In this plot, the PC1 direction
is the direction in which the
data is most spread!
This means we are talking about Plot illustrating how we can
the direction with largest approximate 3D data by a 2D
sample variance. subspace.
 Direction of largest variance
Remember that variance of a random variable X is
 var(X) = E[(X-E[X])2]
If we think of each of the p features as a random variable X1,
X2,..., Xp, then we are interested in the linear combination of
them that has largest variance.
Assume we have centered the data so that all features have mean
0.
 Direction of largest variance
Then, we are looking for constants c1, c2,..., cp so that the
random variable
 Z = c1X1 + c2X2 + ... + cpXp
That has the largest possible variance:
var(Z) = E[(Z-E[Z])2] (but E[Z]=c1E[X1]+c2E[X2]+...+cpE[Xp]=0)
 = E[Z2]
We could just make all the ci as large as possible but we are
actually more interested in what direction increases the variance
the most (we will make c 2 1 + ... + c 2 p = 1
 Direction of largest variance
Then, we are looking for constants c1, c2,..., cp so that the
random variable
 Z = c1X1 + c2X2 + ... + cpXp
That has the largest possible variance:
var(Z) = E[(Z-E[Z])2] (but E[Z]=c1E[X1]+c2E[X2]+...+cpE[Xp]=0)
 = E[Z2]
How can we maximize this using the data we have?
 Direction of largest variance
How can we maximize var(Z) using the data we have?
We use the sample variance! That is, we estimate the variance
using the observations of each feature (the data points).
We can think about the data as a matrix X in Rn x p where each row
is an observation of all the random variables X1, X2,..., Xp. In
that case, each observation of Z will be a weighted sum of each
row of X.
We then get an observation vector z = c1v1 + c2v2 +...+ cpvp where
where vi is the i-th column of the matrix X. Because we only care
about a direction, we will require that z be a normalized
combination of the columns of X in the sense that c 2 1 +c 2 2 +...+c 2 p =1
 Direction of largest variance
We can then calculate the sample variance of Z using the
observation vector z:
 Here, xi are the
 row vectors of X
 (the observed data
 points), and c is
 the vectors of the
 coefficients in
 the combination of
 z.
 Direction of largest variance
So finding z means finding the coefficient vector c that solves
the maximization problem
 maxc ||Xc||2 with the constraint that ||c|| = 1
It turns out that this problem is related to the singular value
decomposition of the data matrix X!
We are, in fact, finding the first singular row vector of X.
 SVD and variance maximization
So the first singular row vector of
X represents the direction of
largest spread of the data points
(rows of X).
What about the second singular row
vector?
It will also be the direction of Plot illustrating how we can
largest spread but with the approximate 3D data by a 2D
restriction of only looking at subspace.
directions orthogonal to the first
singular vector. And similarly with
the third and so on...
 SVD and variance maximization
To find those singular row vectors, we just need to find the
eigenvectors of
 XXT
And order them by the eigenvalue size. We then grab as many of
them as we like (the least the better) to approximate the data by
a subspace of Rp.
This is called principal component analysis!
 PCA visually Put the data in
 the rows of a
 Y matrix X and find
 X the eigenvectors
 and eigenvalues
 of XXT.
 PCA visually New basis
 of first and
 Put the data in second
 the rows of a singular
 matrix X and find vectors
 the eigenvectors
 and eigenvalues Y
 of XXT.
 X
 The PCA algorithm
Goal: find the best subspace approximation of the data for any
dimension.
Statistical perspective algorithm:
 1. Center the data (shift it by its mean)
 2. Fit a multidimensional gaussian distribution to the data
 3. Pick the axis of largest variance for the first principal
 component
 4. Pick axis of largest variance perpendicular to the first
 principal component to be the second principal component
 5. etc...
 The PCA algorithm
Goal: find the best subspace approximation of the data for any
dimension.
Linear algebra perspective algorithm:
 1. Center the data (shift it by its mean)
 2. Compute the eigenvectors of XXT (assuming data points are in
 the rows of X, if they are in the columns, do the same with
 XTX instead)
 3. Order them by the size of the eigenvectors
 4. Pick the largest k of them
 Note: XXT is known as the covariance matrix of the data as long
 as the data is centered.
 PCA applications
Dimensionality reduction:
 - Helps filter out data noise
 - Helps decrease model variance
 - Better understanding of feature relationships
 - Reduces amount of data needed
 - Helps visualize the data
 - Especially if we reduce to 2 or 3 dimensions
 PCA practice
We'll use this jupyter notebook to pair PCA with kNN on the iris
dataset!
Submit a screenshot of the angles with least and most amount of
information on ChimeIn.
 PCA practice
We see that PCA is connected to finding the best view of the
data!
We saw:
 - Interactive plots with Plotly's scatter_matrix
 - Interactive plots with Plotly's scatter_3d
 - PCA with SKLearn's pca.fit_transform
 - kNN with PCA features
HW2 will build off these tools to classify text!
 Measuring PCA quality
We want to measure the amount of information preserved by
dimensionality reduction using PCA.
One way to measure that is by determining how much of the
variance is not contained in the used principal component
directions.
 Measuring PCA quality
The total variance present in a data set (assuming features are
centered), is the sum of the variances of each feature:
Where ||X||F is the Frobenius norm of the data matrix.
The variance explained by a principal component cm is
 Measuring PCA quality
The variance explained by a principal component can be then
measured as the ratio between the total variance and the specific
variance of the principal component.
This is called the proportion of variance explained by the m-th
principal component:
You can access this quantity in SKLearn using the command
 pca.explained_variance_ratio_
 Parameters in unsupervised learning
In unsupervised learning, it can be difficult to choose
parameters since we don't have training and test data.
In PCA and k-means, the quality measure we have will always
improve by adding more principal components or more clusters, so
they are not very helpful.
One (non-rigorous) way people deal with this is by observing the
improvement of the quality measure and figuring out at what point
it slows down.
 The elbow test
This is called the elbow test:
 Two plots illustrating the elbow test. On the left, we have principal
 component vs. the cumulative pve, and we see that it starts to slow
 down once the third principal component is added. On the right, we
 have number of clusters vs. within cluster variation, and we see that
 it starts decreasing more slowly once an 8th cluster is added.
 Data leakage
Leakage or data leakage describes a situation in which
information from the test data affects (leaks) into the training
data.
Examples:
 - If a dataset has multiple copies of the same point, the
 train-test split might put one on training and one on
 testing.
 - If z-score normalization happens before the train-test split
 (since we would be taking the distribution of the test set
 into account in training process)
 - If data comes from temporal events that impact each other.
 - Maybe some future data points made it to the training set
 Data leakage
When performing PCA, we need to make sure that we don't include
the test data in the PCA algorithm, otherwise it would be a leak
of the test information into the training set.
Always make sure to split first and then perform PCA on the
training data!
This is a common interview question!
 More PCA practice
Let's do an example using PCA on newsgroups.
We will use this jupyter notebook.
Topics included are:
 - Explained variance pca.explained_variance_ratio_
 - Timing with %%time, %timeit, ...
 - Reducing dimensionality to increase speed!
 - Reducing dimensionality to increase accuracy!
HW2 will build off these tools to classify text!
 Summary
Principal Component Analysis (PCA)
 - Find linear combinations of dimensions that maximize variance in that
 direction
 - Components are ordered so the most variance is first
 - Can keep only the most important components
 - Have to decide how many to keep
 - Math behind PCA
Applications
 - Nearest Neighbor Classifier in PCA space
 - PCA for data visualization (interactive)
Tools
 - Plotly for interactive visualization
 - Runtime timing
 - Elbow test
 - pca.explained_variance_ratio_
 - kmeans.inertia_
```
- `Bash`
```bash
S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad"; mkdir -p "$S/nb"; cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code/Lectures/Weeks 1 - 5"; for f in *.ipynb "Numpy Introduction"; do b=$(echo "$f" | tr ' ,' '__'); jq -r '.cells[] | "### [" + .cell_type + "]\n" + (.source|join("")) + "\n" + (if .outputs then ((.outputs[]? | if .output_type=="stream" then "-> " + (.text|join("")) elif (.data["text/plain"]? ) then "=> " + (.data["text/plain"]|join("")) elif .output_type=="error" then "ERR " + .ename else "" end) // "") else "" end)' "$f" > "$S/nb/$b.txt" 2>"$S/nb/$b.err"; echo "$f: $(wc -c < "$S/nb/$b.txt") chars; err=$(wc -c < "$S/nb/$b.err")"; done
```
```
0.1 intro to colab, pandas, sns.ipynb: 7493 chars; err=0
1.1 Nearest Neighbor Classifier.ipynb: 6906 chars; err=0
1.2 NN Classifier.ipynb: 11110 chars; err=0
1.3 kNN Iris Classification.ipynb: 232 chars; err=0
1.3 kNN with SciKit-Learn.ipynb: 7798 chars; err=0
2.1 tf-idf vectorization, sklearn.ipynb: 4363 chars; err=0
2.2 text classification.ipynb: 27891 chars; err=0
2.4 PCA on iris data.ipynb: 8590 chars; err=0
2.4 PCA on newsgroups.ipynb: 10584 chars; err=0
Week 1 - practice - Pandas Tutorial (Dimorphism).ipynb: 20890 chars; err=0
Numpy Introduction: 10244 chars; err=0
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash`
```bash
S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad/nb"; cd "$S"; for f in 1.1* 1.2*; do echo "=================== $f"; cat "$f"; done
```
```
=================== 1.[REDACTED].ipynb.err
=================== 1.[REDACTED].ipynb.txt
### [code]
import pandas as pd
import numpy as np
import seaborn as sns

### [markdown]
# Nearest neighbor classifier


### [code]
df = pd.read_csv("https://raw.githubusercontent.com/be-prado/csci4521/refs/heads/main/Seeds.csv")
df
=>       area  perimeter  compactness  kernel_length  kernel_width  asymmetry  \
0    15.26      14.84       0.8710          5.763         3.312      2.221   
1    14.88      14.57       0.8811          5.554         3.333      1.018   
2    14.29      14.09       0.9050          5.291         3.337      2.699   
3    13.84      13.94       0.8955          5.324         3.379      2.259   
4    16.14      14.99       0.9034          5.658         3.562      1.355   
..     ...        ...          ...            ...           ...        ...   
205  12.19      13.20       0.8783          5.137         2.981      3.631   
206  11.23      12.88       0.8511          5.140         2.795      4.325   
207  13.20      13.66       0.8883          5.236         3.232      8.315   
208  11.84      13.21       0.8521          5.175         2.836      3.598   
209  12.30      13.34       0.8684          5.243         2.974      5.637   

     groove_length  wheat_type  
0            5.220           1  
1            4.956           1  
2            4.825           1  
3            4.805           1  
4            5.175           1  
..             ...         ...  
205          4.870           3  
206          5.003           3  
207          5.056           3  
208          5.044           3  
209          5.063           3  

[210 rows x 8 columns]
### [markdown]
Select only the features compactness and area for now

### [code]
df = df[["area", "compactness", "wheat_type"]]
df
=>       area  compactness  wheat_type
0    15.26       0.8710           1
1    14.88       0.8811           1
2    14.29       0.9050           1
3    13.84       0.8955           1
4    16.14       0.9034           1
..     ...          ...         ...
205  12.19       0.8783           3
206  11.23       0.8511           3
207  13.20       0.8883           3
208  11.84       0.8521           3
209  12.30       0.8684           3

[210 rows x 3 columns]
### [code]
plt = sns.scatterplot(x = df["area"], y = df["compactness"], hue=df["wheat_type"])
=> <Figure size 640x480 with 1 Axes>
### [code]
def distance_sq(p0, p1):
  '''Computes squared Euclidean distance'''
  return np.sum( (p0-p1)**2 )


def nn_classify_sample(training_set, training_labels, new_example):
  dists = np.array([distance_sq(t,new_example) for t in training_set])
  nearest_idx = dists.argmin()
  return training_labels[nearest_idx]

### [code]
# split data into training set and labels
seeds_array = df.to_numpy()
training_set = seeds_array[:,:-1]
training_labels = seeds_array[:,-1]

### [code]
# classify example 1: Area: 18, Compactness: 0.90
ex1 = np.array([18, 0.9])
pred_type = nn_classify_sample(training_set, training_labels, ex1)
print(f"Predicted type for seed with area 18 and compactness 0.9: {int(pred_type)}")
-> Predicted type for seed with area 18 and compactness 0.9: 2

### [code]
# classify example 2: Area: 13, Compactness: 0.80
ex2 = np.array([13, 0.8])
pred_type2 = nn_classify_sample(training_set, training_labels, ex2)
print(f"Predicted type for seed with area 13 and compactness 0.80: {int(pred_type2)}")
-> Predicted type for seed with area 13 and compactness 0.80: 1

### [markdown]
### Understanding why the second classification turned that way

### [code]
import matplotlib.pyplot as plt
from matplotlib import cm
import matplotlib.cbook as cbook
import matplotlib.colors as colors

# visualizing distances

# point from which we are finding nearest neighbors
point = np.array([13, 0.8])

# make a grid of the distances in a similar range to the data in question
x = np.linspace(10, 22, 101)
y = np.linspace(0.78, 0.92, 101)
xx, yy = np.meshgrid(x, y)
zz = (xx - point[0])**2 + (yy - point[1])**2

### [code]
colormesh = plt.pcolor(x, y, zz, norm=colors.LogNorm(vmin=1e-5, vmax=zz.max()),
                   cmap='PuBu_r', shading='auto')
plt.colorbar(colormesh, label = "distance to point (13, 0.8)")
plt.xlabel("area")
plt.ylabel("compactness")
plt.show()
=> <Figure size 640x480 with 2 Axes>
### [markdown]
## Normalizing the data

### [code]
mean = training_set.mean(axis = 0) # read documentation
std = training_set.std(axis = 0)

print(f"Mean: {mean}")
print(f"Standard deviation: {std}")

# shift by the mean
training_set_normalized = training_set - training_set.mean(axis = 0)
# divide by standard deviation
training_set_normalized /= training_set.std(axis = 0)
-> Mean: [14.84752381  0.87099857]
Standard deviation: [2.90276331 0.02357309]

### [code]
# visualize the normalized data

sns.scatterplot(x = training_set_normalized[:,0], y = training_set_normalized[:,1], hue=df["wheat_type"])
=> <Axes: >
### [code]
# visualize the normalized data

sns.scatterplot(x = training_set_normalized[:,0], y = training_set_normalized[:,1], hue=df["wheat_type"])
=> <Figure size 640x480 with 1 Axes>
### [code]
# classify example 1: Area: 18, Compactness: 0.90
ex1 = (np.array([18, 0.9]) - mean) / std
print(f"Normalized area and compactness ex1: {ex1}")
pred_type = nn_classify_sample(training_set_normalized, training_labels, ex1)
print(f"Predicted type for seed with area 18 and compactness 0.9: {int(pred_type)}")
-> Normalized area and compactness ex1: [1.08602592 1.23027698]
Predicted type for seed with area 18 and compactness 0.9: 2

### [code]
# classify example 2: Area: 13, Compactness: 0.80
ex2 = (np.array([13, 0.8]) - mean) / std
print(f"Normalized area and compactness ex2: {ex2}")
pred_type2 = nn_classify_sample(training_set_normalized, training_labels, ex2)
print(f"Predicted type for seed with area 13 and compactness 0.80: {int(pred_type2)}")
-> Normalized area and compactness ex2: [-0.63647071 -3.01184845]
Predicted type for seed with area 13 and compactness 0.80: 3

### [markdown]
### Understanding why the second classification turned that way with normalized data

### [code]
# visualizing distances

# point from which we are finding nearest neighbors
point = (np.array([13, 0.8]) - mean) / std

print(point)

# make a grid of the distances in a similar range to the data in question
x = np.linspace(-2, 2, 101)
y = np.linspace(-4, 2, 101)
xx, yy = np.meshgrid(x, y)
zz = (xx - point[0])**2 + (yy - point[1])**2
-> [-0.63647071 -3.01184845]

### [code]
colormesh = plt.pcolor(x, y, zz, norm=colors.LogNorm(vmin=1e-5, vmax=zz.max()),
                   cmap='PuBu_r', shading='auto')
plt.colorbar(colormesh, label = "distance to point (13, 0.8)")
plt.xlabel("area")
plt.ylabel("compactness")
plt.show()
=> <Figure size 640x480 with 2 Axes>
### [code]


=================== 1.2_NN_Classifier.ipynb.err
=================== 1.2_NN_Classifier.ipynb.txt
### [markdown]
### Download & load seed dataset

### [code]
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.colors import ListedColormap
df = pd.read_csv("https://raw.githubusercontent.com/be-prado/csci4521/refs/heads/main/Seeds.csv")

### [code]
df.head()
=>     area  perimeter  compactness  kernel_length  kernel_width  asymmetry  \
0  15.26      14.84       0.8710          5.763         3.312      2.221   
1  14.88      14.57       0.8811          5.554         3.333      1.018   
2  14.29      14.09       0.9050          5.291         3.337      2.699   
3  13.84      13.94       0.8955          5.324         3.379      2.259   
4  16.14      14.99       0.9034          5.658         3.562      1.355   

   groove_length  wheat_type  
0          5.220           1  
1          4.956           1  
2          4.825           1  
3          4.805           1  
4          5.175           1  
### [markdown]
### Create features and label matricies

### [code]
# TODO: make a dataframe with only the selected features 'area' and 'compactness'
features = df[['area', 'compactness']]
features.head()
=>     area  compactness
0  15.26       0.8710
1  14.88       0.8811
2  14.29       0.9050
3  13.84       0.8955
4  16.14       0.9034
### [code]
# TODO: make a dataframe with only the labels
labels = df['wheat_type']
labels.head()
=> 0    1
1    1
2    1
3    1
4    1
Name: wheat_type, dtype: int64
### [code]
# TODO: move data from dataframes to numpy arrays
features = features.to_numpy()
labels = labels.to_numpy()

### [code]
features.shape
=> (210, 2)
### [markdown]
### Classifying new seeds

### [markdown]
What type would we expect a seed with an area of 12 cm^2 and a compactness/roundness of 0.9? Guesses?

### [code]
np.set_printoptions(suppress=True) #Set numpy to print not in scientific notation

### [code]
# functions from last time

def distance_sq(p0, p1):
  '''Computes squared Euclidean distance'''
  return np.sum( (p0-p1)**2 )


# nearest neighbor classifier for single sample
def nn_classify_sample(training_set, training_labels, new_example):
  dists = np.array([distance_sq(t,new_example) for t in training_set])
  nearest_idx = dists.argmin()
  return training_labels[nearest_idx]

### [markdown]
### Automating nearest neighbors classification:

### [code]
# TODO: practice using classification function
test_point = np.array([[12,0.9]])
nn_classify_sample(features, labels, test_point)
=> np.int64(3)
### [code]
# TODO: create helper function called nn_classify for classifying a set of example features (stored in numpy arrays!)
# new_data has each data point in a row
def nn_classify(training_set, training_labels, new_data):
  data_size = new_data.shape[0] # number of data points
  output = np.zeros(data_size)
  for i in range(0, data_size):
    output[i] = nn_classify_sample(training_set, training_labels, new_data[i])
  return output;



### [markdown]
### Drawing neighbor maps:

### [code]
#Test every possible feature pair between min and max feature values
n = 100  # step size in the mesh
x_min, x_max = features[:, 0].min() - 0.2, features[:, 0].max() + 0.2
y_min, y_max = features[:, 1].min() - 0.2, features[:, 1].max() + 0.2
xx, yy = np.meshgrid(np.linspace(x_min, x_max, n), np.linspace(y_min, y_max, n))
test_features = np.array([xx.ravel(), yy.ravel()]).transpose()
print("Array of grid data points that will be tested in our classification:")
print(test_features)
-> Array of grid data points that will be tested in our classification:
[[10.39       0.6081   ]
 [10.5010101  0.6081   ]
 [10.6120202  0.6081   ]
 ...
 [21.1579798  1.1183   ]
 [21.2689899  1.1183   ]
 [21.38       1.1183   ]]

### [code]
# classify all the grid data points
z = nn_classify(features, labels, test_features)
print("Classification of the artificial data points:")
print(z)
-> Classification of the artificial data points:
[3. 3. 3. ... 2. 2. 2.]

### [code]
z = z.reshape(xx.shape) # make classification array into a 2D array for plot
fig = plt.figure()
plt.pcolormesh(xx, yy, z)
=> <matplotlib.collections.QuadMesh at 0x791e561de510>
### [code]
z = z.reshape(xx.shape) # make classification array into a 2D array for plot
fig = plt.figure()
plt.pcolormesh(xx, yy, z)
=> <Figure size 640x480 with 1 Axes>
### [code]
plt.scatter(features[:, 0], features[:, 1], c=labels, edgecolor='k', s=60)
plt.xlim(xx.min(), xx.max())
plt.ylim(yy.min(), yy.max())
plt.title("Outcome classification")
plt.xlabel("Area")
plt.ylabel("Compactness")
plt.show()
=> <Figure size 640x480 with 1 Axes>
### [code]
#Color mesh of predictions
z = z.reshape(xx.shape)
fig = plt.figure()
plt.pcolormesh(xx, yy, z)

#Scatter Plot of actual samples:
plt.scatter(features[:, 0], features[:, 1], c=labels, edgecolor='k', s=20)
plt.xlim(xx.min(), xx.max())
plt.ylim(yy.min(), yy.max())
plt.title("Outcome classification (nearest neighbor)")
plt.show()
=> <Figure size 640x480 with 1 Axes>
### [code]
# Function that wraps up the classification and graphing with nicer colors

def graphClassifier2D(X,Y, classifier):
  # Create color maps
  cmap_light = ListedColormap(['#FFAAAA', '#AAAAFF', '#AAFFFF'])
  cmap_bold  = ListedColormap(['#FF0000', '#0000FF', '#00FFFF'])

  h = 0.1  # step size in the mesh
  x_min, x_max = X[:, 0].min() - 0.2, X[:, 0].max() + 0.2
  y_min, y_max = X[:, 1].min() - 0.2, X[:, 1].max() + 0.2
  xx, yy = np.meshgrid(np.arange(x_min, x_max, h), np.arange(y_min, y_max, h))
  test_features = np.array([xx.ravel(), yy.ravel()]).transpose()
  z = classifier(X, Y, test_features)

  z = z.reshape(xx.shape)
  fig = plt.figure()
  plt.pcolormesh(xx, yy, z, cmap=cmap_light)

  plt.scatter(X[:, 0], X[:, 1], c=Y, cmap=cmap_bold, edgecolor='k', s=20)
  plt.xlim(xx.min(), xx.max())
  plt.ylim(yy.min(), yy.max())
  plt.title("Outcome classification (nearest neighbor)")
  plt.xlabel("Area")
  plt.ylabel("Compactness")
  plt.show()

### [code]
graphClassifier2D(features, labels, nn_classify)
=> <Figure size 640x480 with 1 Axes>
### [markdown]
Units don't match (cm vs cm^2), and ranges are vastly different (12-20 vs 0.8-0.95).

How can we fix this?

### [code]
def graphClassifier2D(X,Y, classifier, normalize=False):
  # Create color maps
  cmap_light = ListedColormap(['#FFAAAA', '#AAAAFF', '#AAFFFF'])
  cmap_bold  = ListedColormap(['#FF0000', '#0000FF', '#00FFFF'])

  # z-score normalization!
  if normalize:
    ## TODO: add z-score normalization
    X -= X.mean(axis=0)
    X /= X.std(axis=0)


  h = 0.1  # step size in the mesh
  x_min, x_max = X[:, 0].min() - 0.2, X[:, 0].max() + 0.2
  y_min, y_max = X[:, 1].min() - 0.2, X[:, 1].max() + 0.2
  xx, yy = np.meshgrid(np.arange(x_min, x_max, h), np.arange(y_min, y_max, h))
  test_features = np.array([xx.ravel(), yy.ravel()]).transpose()
  z = classifier(X, Y, test_features)

  z = z.reshape(xx.shape)
  fig = plt.figure()
  plt.pcolormesh(xx, yy, z, cmap=cmap_light)

  plt.scatter(X[:, 0], X[:, 1], c=Y, cmap=cmap_bold, edgecolor='k', s=20)
  plt.xlim(xx.min(), xx.max())
  plt.ylim(yy.min(), yy.max())
  plt.title("Outcome classification (nearest neighbor)")
  plt.xlabel("Area")
  plt.ylabel("Compactness")
  plt.show()

### [code]
graphClassifier2D(features, labels, nn_classify, True)
=> <Figure size 640x480 with 1 Axes>
### [markdown]
## Avoiding overfitting

### [markdown]
### Leave one out accuracy

### [code]
# TODO: create helper function called nn_one_out_classify for classifying a set of example features (stored in numpy arrays!)
def nn_one_out_classify(training_set, training_labels):
  data_size = training_set.shape[0]
  output = np.ones(data_size)
  for i in range(0, data_size):
    # take out point at index i from the training set and labels
    one_out_train = np.concatenate([training_set[:i], training_set[i+1:]], axis=0)
    one_out_labels = np.concatenate([training_labels[:i], training_labels[i+1:]], axis=0)
    output[i] = nn_classify_sample(one_out_train, one_out_labels, training_set[i])
  return output


### [code]
# Function that wraps up the classification and graphing with nicer colors
# note the data set was implicitly normalized in the graphClassifier2D function
# this implicitly changes should often be avoided or at least be be noted
one_out_labels = nn_one_out_classify(features, labels)

one_out_accuracy = 100 * np.sum(one_out_labels == labels) / labels.shape[0]
print(f"Leave one out accuracy: {one_out_accuracy}")

plt.scatter(features[:,0], features[:,1], c=one_out_labels, cmap=ListedColormap(['#FF0000', '#0000FF', '#00FFFF']), edgecolor='k', s=20)
plt.xlim(features[:,0].min()-0.1, features[:,0].max()+0.1)
plt.ylim(features[:,1].min()-0.1, features[:,1].max()+0.1)
plt.title("Outcome classification (nearest neighbor with leave one out method)")
plt.xlabel("Area")
plt.ylabel("Compactness")
plt.show()
-> Leave one out accuracy: 81.42857142857143

### [code]
# Function that wraps up the classification and graphing with nicer colors
# note the data set was implicitly normalized in the graphClassifier2D function
# this implicitly changes should often be avoided or at least be be noted
one_out_labels = nn_one_out_classify(features, labels)

one_out_accuracy = 100 * np.sum(one_out_labels == labels) / labels.shape[0]
print(f"Leave one out accuracy: {one_out_accuracy}")

plt.scatter(features[:,0], features[:,1], c=one_out_labels, cmap=ListedColormap(['#FF0000', '#0000FF', '#00FFFF']), edgecolor='k', s=20)
plt.xlim(features[:,0].min()-0.1, features[:,0].max()+0.1)
plt.ylim(features[:,1].min()-0.1, features[:,1].max()+0.1)
plt.title("Outcome classification (nearest neighbor with leave one out method)")
plt.xlabel("Area")
plt.ylabel("Compactness")
plt.show()
=> <Figure size 640x480 with 1 Axes>
### [markdown]
### Train-test split

### [code]
# shuffle the data so the training, test split is not biased
def shuffle_data(X, Y):
  n = Y.shape[0]
  shuffled_idx = np.arange(n)
  np.random.shuffle(shuffled_idx)

  shuffled_X = X[shuffled_idx]
  shuffled_Y = Y[shuffled_idx]

  return shuffled_X, shuffled_Y

# split data
def train_test_split(X, Y, ratio = 0.9):
  n = Y.shape[0]

  X_train = X[:int(n*ratio)]
  y_train = Y[:int(n*ratio)]

  X_test = X[int(n*ratio):]
  y_test = Y[int(n*ratio):]

  return X_train, y_train, X_test, y_test

# classify test data based on training data
def train_test_classifier(X, Y):
  shuffled_X, shuffled_Y = shuffle_data(X, Y)
  X_train, y_train, X_test, y_test = train_test_split(shuffled_X, shuffled_Y)
  return nn_classify(X_train, y_train, X_test), y_test

### [code]
train_test_predictions, y_test = train_test_classifier(features, labels)
train_test_accuracy = 100 * np.sum(train_test_predictions == y_test) / y_test.shape[0]
print(f"Accuracy for train-test split: {train_test_accuracy}")
-> Accuracy for train-test split: 95.23809523809524

### [code]
```
- `Bash`
```bash
S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad/nb"; cd "$S"; for f in 1.3_kNN_with* 2.1*; do echo "=================== $f"; cat "$f"; done
```
```
=================== 1.3_kNN_with_SciKit-Learn.ipynb.err
=================== 1.3_kNN_with_SciKit-Learn.ipynb.txt
### [code]
import pandas as pd
import numpy as np

### [code]
# load your data
df = pd.read_csv("https://raw.githubusercontent.com/be-prado/csci4521/refs/heads/main/Seeds.csv")
names = list(df.columns) #Save column names

### [code]
#Choose which data is features (X) and labels (y)
X = df[ ['area','compactness'] ].to_numpy()
y = df['wheat_type'].to_numpy()

### [markdown]
Helper functions!

### [code]
def train_test_split(X,y,test_percent):
  numRows = y.size                     #number or rows in the entire dataset
  splitPoint = int((1-test_percent)*numRows)  #the row index test_size% of the way through
  p = np.random.permutation(numRows)   #array for shuffling data
  X = X[p]
  y = y[p]

  #Training data array
  X_train = X[:splitPoint]  # training features
  y_train = y[:splitPoint]  # training labels

  #Testing data array
  X_test = X[splitPoint:]  # testing features
  y_test = y[splitPoint:] # testing labels

  return X_train, X_test, y_train, y_test

### [code]
def nn_classify_sample(train_features, train_labels, new_feature):
  dists = np.array([np.sum( (t-new_feature)**2) for t in train_features])
  nearest = dists.argmin()
  return train_labels[nearest]

def nn_classify(train_features, train_labels, test_features):
  num_result = test_features[:,0].size
  result = np.ones(num_result)
  for i in range(0,num_result):
    result[i] = nn_classify_sample(train_features[:,0:2], train_labels, test_features[i])
  return result

### [code]
def accuracy(classify, X_train, y_train, X_test, y_test):
  pred = classify(X_train, y_train, X_test)
  correct_pred = (pred == y_test)
  total_preds = y_test.size
  return correct_pred.sum()/total_preds

### [code]
def avg_accuracy(classifier, X, y, count = 200, split=0.33):
  acc = 0
  for _ in range(0,count):
    X_train, X_test, y_train, y_test = train_test_split(X,y,split)
    acc += accuracy(classifier, X_train, y_train, X_test, y_test)
  return acc/count

### [markdown]
test our nearest neighbor with our train/test split

### [code]
# TODO: create a train/test split where 1/3 of the data is used for testing
x_train, x_test, y_train, y_test = train_test_split(X, y, 0.33)
print(x_train.shape)
print(x_test.shape)
-> (140, 2)
(70, 2)

### [code]
# TODO: use our helper functions to compute the accuracy of a NN model with the above split
accuracy(nn_classify, x_train, y_train, x_test, y_test)
=> np.float64(0.8142857142857143)
### [code]
# TODO: put both lines of code in the same block and run multiple times
# Q: Why does each run have different accuracies each run?
x_train, x_test, y_train, y_test = train_test_split(X, y, 0.33)
print(x_train.shape)
print(x_test.shape)
accuracy(nn_classify, x_train, y_train, x_test, y_test)
-> (140, 2)
(70, 2)

### [code]
# TODO: put both lines of code in the same block and run multiple times
# Q: Why does each run have different accuracies each run?
x_train, x_test, y_train, y_test = train_test_split(X, y, 0.33)
print(x_train.shape)
print(x_test.shape)
accuracy(nn_classify, x_train, y_train, x_test, y_test)
=> np.float64(0.8571428571428571)
### [markdown]
KNN implementation

### [code]
from sklearn import neighbors
from sklearn.neighbors import KNeighborsClassifier

### [code]
# TODO: write a function that will use KNN to classify a whole array of test features
# Hint: use a wrapper function so that it fits within our accuracy helper function!
def knn_classifier(k):
  def knn_classify(x_train, y_train, x_test):
    knn = KNeighborsClassifier(n_neighbors = k)
    knn.fit(x_train, y_train)

    pred = knn.predict(x_test)
    return pred
  return knn_classify


### [code]
# TODO: test it out with 2, 5, and 10 neighbors
x_train, x_test, y_train, y_test = train_test_split(X, y, 0.33)
knn = knn_classifier(2)
accuracy(knn, x_train, y_train, x_test, y_test)
=> np.float64(0.8)
### [code]
knn = knn_classifier(5)
accuracy(knn, x_train, y_train, x_test, y_test)
=> np.float64(0.8857142857142857)
### [code]
knn = knn_classifier(10)
accuracy(knn, x_train, y_train, x_test, y_test)
=> np.float64(0.8857142857142857)
### [code]
# TODO: test different amounts of neighbors with the cross-validation
knn = knn_classifier(2)
avg_accuracy(knn, X, y, split=0.33)
=> np.float64(0.7927857142857149)
### [markdown]
Finding the best K

### [code]
# TODO: find the best performing K testing every third value between 1 - 90
ks = np.arange(1, 91, 3)
acc_list = []
for k in ks:
  this_knn = knn_classifier(k)
  acc = avg_accuracy(this_knn, X, y)
  acc_list.append(acc)

print(acc_list[:5])
-> [np.float64(0.8345714285714293), np.float64(0.8108571428571432), np.float64(0.833714285714286), np.float64(0.8529285714285705), np.float64(0.8534999999999999)]

### [code]
import seaborn as sns

### [code]
# TODO: use seaborn to plot a graph of the accuracies vs. ks
# Hint: use sns.lineplot
sns.lineplot(x=ks, y=acc_list)
=> <Axes: >
### [code]
# TODO: use seaborn to plot a graph of the accuracies vs. ks
# Hint: use sns.lineplot
sns.lineplot(x=ks, y=acc_list)
=> <Figure size 640x480 with 1 Axes>
### [code]
# If you have named dataframes, seaborn labels them auotmatically
# .... but this can be a pain sometimes
# TODO: lets turn our lists into dataframes so seaborn will label them
ks_df = pd.DataFrame(ks, columns=["k"])
acc_df = pd.DataFrame(acc_list, columns=["Accuracy"])
sns.lineplot(x=ks_df.k, y=acc_df.Accuracy)
=> <Axes: xlabel='k', ylabel='Accuracy'>
### [code]
# If you have named dataframes, seaborn labels them auotmatically
# .... but this can be a pain sometimes
# TODO: lets turn our lists into dataframes so seaborn will label them
ks_df = pd.DataFrame(ks, columns=["k"])
acc_df = pd.DataFrame(acc_list, columns=["Accuracy"])
sns.lineplot(x=ks_df.k, y=acc_df.Accuracy)
=> <Figure size 640x480 with 1 Axes>
### [code]
# Or we can just use matplotlibs pyplot package to control the labels and titles
# TODO: try it now!
# Hint: functions like plt.xlabel, plt.ylabel, and plt.title will be useful
import matplotlib.pyplot as plt
fig = sns.lineplot(x = ks, y = acc_list)
plt.xlabel("k")
plt.ylabel("Avg Accuracy")
plt.title("Accuracy for kNN with different k values")
plt.show(fig)
=> <Figure size 640x480 with 1 Axes>
### [code]
# TODO: lets make another graph but this time lets compute the accuracy for both training and testing sets for different Ks
ks = np.arange(1, 91, 3)
train_acc_list = []
test_acc_list = []

for k in ks:
  this_knn = knn_classifier(k)
  test_acc = 0
  train_acc = 0
  for i in range(0,20):
    X_train, X_test, y_train, y_test = train_test_split(X,y,0.33)
    test_acc += accuracy(this_knn, X_train, y_train, X_test, y_test) / 20
    train_acc += accuracy(this_knn, X_train, y_train, X_train, y_train) / 20
  test_acc_list.append(test_acc)
  train_acc_list.append(train_acc)




### [code]
# helper for making a graph nicely
from pylab import rcParams
sns.set(font_scale=1.2)
sns.set_style("white") #whitegrid white dark darkgrid

rcParams['figure.figsize'] = 8, 6
result = pd.DataFrame( {"k":ks,"Train.Acc":train_acc_list,"Test.Acc":test_acc_list} )
pd.melt(result, ['k'])
sns.lineplot(x="k",y="value", hue='variable', data=pd.melt(result, ['k']))
=> <Axes: xlabel='k', ylabel='value'>
### [code]
# helper for making a graph nicely
from pylab import rcParams
sns.set(font_scale=1.2)
sns.set_style("white") #whitegrid white dark darkgrid

rcParams['figure.figsize'] = 8, 6
result = pd.DataFrame( {"k":ks,"Train.Acc":train_acc_list,"Test.Acc":test_acc_list} )
pd.melt(result, ['k'])
sns.lineplot(x="k",y="value", hue='variable', data=pd.melt(result, ['k']))
=> <Figure size 800x600 with 1 Axes>
### [code]


=================== 2.[REDACTED].ipynb.err
=================== 2.[REDACTED].ipynb.txt
### [markdown]
## A simple tf-idf implementation:

### [code]
import math
def tfidf(term, doc, doc_list):
  docs_with_term = [doc for doc in doc_list if term in doc]
  tf = doc.count(term) #term count
  df = len(docs_with_term)/len(doc_list) #document frequency
  idf = math.log(1/df)
  return tf * idf

### [code]
documents = ["the mouse", "the small cat", "the cheese", "the big cat"]

### [code]
# TODO: calculate the importance of each word in a document


### [code]
def getUniqueVocab(documents):
  #Find unique vocab words
  vocab = []
  for doc in documents:
    vocab.extend(doc.split())
  vocab = set(vocab)
  return vocab

def vectorize(phrase, documents):
  #Find unique vocab words
  vocab = getUniqueVocab(documents)

  #Build vector representation
  result = []
  for word in vocab:
    result.append(tfidf(word, phrase, documents))
  return result

### [code]
# TODO: lets vectorize some documents!


### [markdown]
----
## TF-IDF with SK-Learn

This is a pretty cude approach to tf-idf. In practice we often want to smooth out the tf-idf computation, and include extra normalization terms.

There are many corner cases to consider, and variations on how we can compute the `tf` term and the `idf` term.

Its often useful to use a library to compute tf-idf, and one is provided in `SK Learn`

### [code]
from sklearn.feature_extraction.text import TfidfVectorizer

### [code]
# TODO: create vectorizer and fit_transform our documents (training set)


### [code]
vectorized_docs = vectorizer.fit_transform(documents)

### [code]
vectorizer.get_feature_names_out()

### [code]
[print(train_vec.toarray()) for train_vec in vectorized_docs]

### [markdown]
Note that "the" (word #5) has a non-zero value even though it occurs in every document. "The" is still the smallest values (around 0.4), and "cheese"/"mouse" still the largest value (0.88).

**TODO: ANSWER ON CHIMEIN** For which examples does SK-Learn's TF-IDF formula give "the" the most weight? Why is that? Any advantages to this method?

### [markdown]
actual sklearn formulat : tfidf = log(N/df) * ln(1+M/T) where N is the number of occurrences of the word in the corpus, Df is the total number of documents in the collection, M is the number of times the word occurs in this document, and T is the total number of words in this particular document.

### [markdown]
We can use `vectorizer.transform` along with `toarray()` to get the vectorized result of a new document:

### [code]
# TODO: print the vector version of "the big cheese"


### [markdown]
----
## Your turn:

1. First, can you compute the distance between two vectors. My examples give the squared Euclidean distance, but you can use other distance terms (e.g. cosine distance).

Here is a stub of `my_dist` to get you started

### [code]
import numpy as np
def my_dist(v1, v2):
  return 0 # TODO: Update this to be the distance between v1 and v2

### [code]
print(my_dist(np.array([3]),np.array([4])))          #Squared L2 Dist is 1
print(my_dist(np.array([1,1]),np.array([2,2])))      #Squared L2 Dist is 2
print(my_dist(np.array([1,2,3]),np.array([1,-1,7]))) #Squared L2 Dist is 25

### [markdown]
If you above distance function works, you can now take the distance between every vector and an new document using code like this:

### [code]
new_post_vec = vectorizer.transform(["the big cheese"])
[my_dist(new_post_vec.toarray(),train_vec.toarray()) for train_vec in vectorized_docs] #I get [1.7, 1.7, 0.5, 0.7], your results may differ

### [markdown]
2. Now write a function called `findClosest` which takes as input a string, and returns a string of the document in `documents` which has the closest feature vector.

Again, we'll give you a stub of `findClosest` to help get you started:

### [code]
def findClosest(promt):
  closest_id = 0  # TODO: Fix this to be the actual closest index
  return documents[closest_id]

### [code]
findClosest("the big cheese") #Should probably return "the cheese"

### [markdown]
---
Thought Experiment - **ANSWER ON CHIME IN**
 - What would you want to happen when the input is `"a cheesy slice of pizza"`
 - What happens in reality?
 - How might we fix this?

### [code]
findClosest("a cheesy slice of pizza") #Should this stil return "the cheese"?
```
- `Bash`
```bash
S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad/nb"; cd "$S"; cat 2.2_text_classification.ipynb.txt | cut -c1-400
```
```
### [markdown]
## Download and extra the data
Data is in a zip file

### [code]
!wget "https://raw.githubusercontent.com/be-prado/csci4521/refs/heads/main/20news-bydate.tar.gz"
-> --2026-10-01 20:17:16--  https://raw.githubusercontent.com/be-prado/csci4521/refs/heads/main/20news-bydate.tar.gz
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 185.199.108.133, 185.199.109.133, 185.199.110.133, ...
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|185.199.108.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 14464277 (14M) [application/octet-stream]
Saving to: ‘20news-bydate.tar.gz’

20news-bydate.tar.g 100%[===================>]  13.79M  --.-KB/s    in 0.04s   

2026-10-01 20:17:17 (325 MB/s) - ‘20news-bydate.tar.gz’ saved [14464277/14464277]


### [code]
!tar -xf 20news-bydate.tar.gz

### [markdown]
## Using SciKit-Learn's CountVectorizer


### [code]
from sklearn.feature_extraction.text import CountVectorizer

### [markdown]
The parameter `min_df` controls effect words that are not used frequently (min_df = minimum document frequency).
 - If it is an integer, all words occurring less than that value will be dropped.
 - If it is a fraction, all words that occur less than that fraction of the overall dataset are be dropped.

`max_df` works in a similar manner

### [code]
vectorizer = CountVectorizer(min_df=1) #min_df=1 --> use all words

### [code]
CountVectorizer?

### [markdown]
Consider two sentences:

### [code]
content = ["How to catch pokemon pokemon", "Which Pokemon is the hardest to catch?"]

### [markdown]
How many uniuqe words between the two?
  - Is `catch` and `catch?` the same word?
  - Is `Pokemon` and `pokemon` the same word?
  - Would `catch` and `catching` be the same word?

### [code]
# TODO: fit_transform the sentences then print the vocab
X = vectorizer.fit_transform(content)
vectorizer.get_feature_names_out()
=> array(['catch', 'hardest', 'how', 'is', 'pokemon', 'the', 'to', 'which'],
      dtype=object)
### [markdown]
We can turn each sentence into a "bag of words" ... for each sentence:
 - 1 is word is present
 - 0 is word is absent

### [code]
print(X.toarray())
-> [[1 0 1 0 2 0 1 0]
 [1 1 0 1 1 1 1 1]]

### [markdown]
### CountVectorizer on UseNet posts

### [code]
import os
DIR = "/content/20news-bydate-train/rec.sport.hockey"

### [code]
posts = [open(os.path.join(DIR, filename)).read() for filename in os.listdir(DIR)]

### [code]
posts[50]
=> 'From: macro@cup.hp.com (Patrick MacRoberts)\nSubject: Re: Too Many Europeans in NHL\nIn-Reply-To: golchowy@alchemy.chem.utoronto.ca\'s message of Tue, 6 Apr 1993 14:20:37 GMT\nLines: 25\n\t<1993Apr6.142037.9246@alchemy.chem.utoronto.ca>\nNntp-Posting-Host: hpcobr30.cup.hp.com\nOrganization: Nazi Right-Wing Parenting Monthly\n\n\n%>I dunno, Lemieux?  Hmmm...sounds like he\n%>has *French* blood 
### [code]
# TODO: fit_transform the vectorizer with our new data
X_train = vectorizer.fit_transform(posts)

### [code]
len(posts)
=> 600
### [code]
X_train.shape
=> (600, 12914)
### [code]
print(vectorizer.get_feature_names_out())
print(len(vectorizer.get_feature_names_out()))
-> ['00' '000' '000256' ... 'zupancic' 'zurich' 'zzzzzz']
12914

### [code]
# TODO: vectorize the sentence "Should a team be added in Wisconsin?"
new_post = "Should a team be added in Wisconsin?"
new_post_vec = vectorizer.transform([new_post])

### [code]
# TODO: get the names of features present
print(new_post_vec)
-> <Compressed Sparse Row sparse matrix of dtype 'int64'
	with 6 stored elements and shape (1, 12914)>
  Coords	Values
  (0, 1900)	1
  (0, 2610)	1
  (0, 6536)	1
  (0, 10730)	1
  (0, 11577)	1
  (0, 12665)	1

### [code]
# "a" was not accounted for
vectorizer.get_feature_names_out()[12665]
=> 'wisconsin'
### [markdown]
### Finding Nearest Neighbors

`new_post_vec` is a feature vector, and we can try to find its nearest neighbors in the training set

### [code]
import numpy as np

### [code]
def dist_raw(v1, v2):
  delta = v1-v2
  return np.linalg.norm(delta)

### [code]
# TODO: find the distances between the new post and the vectors in our training set
distances = [dist_raw(new_post_vec.toarray(), train_vec.toarray()) for train_vec in X_train]
len(distances)
=> 600
### [code]
# TODO: which post is the closest?
best_match_ID = np.argmin(distances)
best_match_ID
=> np.int64(26)
### [code]
distances[best_match_ID]
=> np.float64(5.291502622129181)
### [code]
posts[best_match_ID]
=> 'From: khettry@r1w2.pub.utk.edu (23064RFL)\nSubject: Testing!!!\nOrganization: University of Tennessee Computing Center\n\tJust Testing!!\nDistribution: usa\nLines: 1\n\n\n'
### [markdown]
Hmm. The querry document was `"Should a new team be added to Wisconsin?"`.

Does this post seem related to our query feature? Let's check which elements of the feature vectors overlap.

### [code]
# TODO: print the query vector and the closest vector?
print(X_train[best_match_ID])
-> <Compressed Sparse Row sparse matrix of dtype 'int64'
	with 19 stored elements and shape (1, 12914)>
  Coords	Values
  (0, 5633)	1
  (0, 4851)	1
  (0, 11333)	1
  (0, 8805)	1
  (0, 12149)	1
  (0, 7497)	1
  (0, 12209)	1
  (0, 8685)	1
  (0, 6966)	1
  (0, 3371)	1
  (0, 4579)	1
  (0, 7085)	1
  (0, 9693)	1
  (0, 9607)	1
  (0, 12230)	1
  (0, 917)	1
  (0, 11651)	2
  (0, 11623)	1
  (0, 3789)	1

### [code]
print(new_post_vec)
-> <Compressed Sparse Row sparse matrix of dtype 'int64'
	with 6 stored elements and shape (1, 12914)>
  Coords	Values
  (0, 1900)	1
  (0, 2610)	1
  (0, 6536)	1
  (0, 10730)	1
  (0, 11577)	1
  (0, 12665)	1

### [markdown]
That worked poorly... There is no overlap in features. What happened?

### [markdown]
#### Normalized distance
Normalizing vectors before computing distance focuses on document content rather than length

### [code]
def dist_norm(v1, v2):
  v1_normalized = v1/np.linalg.norm(v1) #Normalize vectors to unit length
  v2_normalized = v2/np.linalg.norm(v2)
  delta = [REDACTED]   #Then take distance
  return np.linalg.norm(delta)

### [code]
# TODO: find the normalized distances between the new post and the vectors in our training set then find the new closest post
dists = [dist_norm(new_post_vec.toarray(), train_vec.toarray()) for train_vec in X_train]


### [code]
best_match_ID = np.argmin(dists)
print(best_match_ID)
-> 72

### [code]
posts[best_match_ID]
=> "From: jake@rambler.Eng.Sun.COM (Jason Cockroft)\nSubject: Re: Playoff predictions\nOrganization: Sun Microsystems, Inc.\nLines: 95\nDistribution: world\nReply-To: jake@rambler.Eng.Sun.COM\nNNTP-Posting-Host: rambler.eng.sun.com\n\n1st round: \n----------\n\nPITT vs NYI:  PITT in 4. \n\nIt looks like a safe bet.  NYI has been bagging it of late.\nNYI and NJD have a showdown Friday night for the
### [markdown]
## Stop Words, Stemming, and TF-IDF
Ignoring common words (stop words)

### [code]
vectorizer = CountVectorizer(min_df=1, stop_words='english')

### [markdown]
We'll lose some words now. The size of the feature vector should be smaller.

### [code]
X_train.shape #Old Vectorizations
=> (600, 12914)
### [code]
X_train = vectorizer.fit_transform(posts)

### [code]
X_train.shape #New Vectorizations
=> (600, 12633)
### [code]
print(len(vectorizer.get_stop_words()))
sorted(vectorizer.get_stop_words())
-> 318

### [code]
print(len(vectorizer.get_stop_words()))
sorted(vectorizer.get_stop_words())
=> ['a',
 'about',
 'above',
 'across',
 'after',
 'afterwards',
 'again',
 'against',
 'all',
 'almost',
 'alone',
 'along',
 'already',
 'also',
 'although',
 'always',
 'am',
 'among',
 'amongst',
 'amoungst',
 'amount',
 'an',
 'and',
 'another',
 'any',
 'anyhow',
 'anyone',
 'anything',
 'anyway',
 'anywhere',
 'are',
 'around',
 'as',
 'at',
 'back',
 'be',
 'became',
 'because',
 'become',
 'becomes',
 'becoming',
 'been',
 'before',
 'beforehand',
 'behind',
 'being',
 'below',
 'beside',
 'besides',
 'between',
 'beyond',
 'bill',
 'both',
 'bottom',
 'but',
 'by',
 'call',
 'can',
 'cannot',
 'cant',
 'co',
 'con',
 'could',
 'couldnt',
 'cry',
 'de',
 'describe',
 'detail',
 'do',
 'done',
 'down',
 'due',
 'during',
 'each',
 'eg',
 'eight',
 'either',
 'eleven',
 'else',
 'elsewhere',
 'empty',
 'enough',
 'etc',
 'even',
 'ever',
 'every',
 'everyone',
 'everything',
 'everywhere',
 'except',
 'few',
 'fifteen',
 'fifty',
 'fill',
 'find',
 'fire',
 'first',
 'five',
 'for',
 'former',
 'formerly',
 'forty',
 'found',
 'four',
 'from',
 'front',
 'full',
 'further',
 'get',
 'give',
 'go',
 'had',
 'has',
 'hasnt',
 'have',
 'he',
 'hence',
 'her',
 'here',
 'hereafter',
 'hereby',
 'herein',
 'hereupon',
 'hers',
 'herself',
 'him',
 'himself',
 'his',
 'how',
 'however',
 'hundred',
 'i',
 'ie',
 'if',
 'in',
 'inc',
 'indeed',
 'interest',
 'into',
 'is',
 'it',
 'its',
 'itself',
 'keep',
 'last',
 'latter',
 'latterly',
 'least',
 'less',
 'ltd',
 'made',
 'many',
 'may',
 'me',
 'meanwhile',
 'might',
 'mill',
 'mine',
 'more',
 'moreover',
 'most',
 'mostly',
 'move',
 'much',
 'must',
 'my',
 'myself',
 'name',
 'namely',
 'neither',
 'never',
 'nevertheless',
 'next',
 'nine',
 'no',
 'nobody',
 'none',
 'noone',
 'nor',
 'not',
 'nothing',
 'now',
 'nowhere',
 'of',
 'off',
 'often',
 'on',
 'once',
 'one',
 'only',
 'onto',
 'or',
 'other',
 'others',
 'otherwise',
 'our',
 'ours',
 'ourselves',
 'out',
 'over',
 'own',
 'part',
 'per',
 'perhaps',
 'please',
 'put',
 'rather',
 're',
 'same',
 'see',
 'seem',
 'seemed',
 'seeming',
 'seems',
 'serious',
 'several',
 'she',
 'should',
 'show',
 'side',
 'since',
 'sincere',
 'six',
 'sixty',
 'so',
 'some',
 'somehow',
 'someone',
 'something',
 'sometime',
 'sometimes',
 'somewhere',
 'still',
 'such',
 'system',
 'take',
 'ten',
 'than',
 'that',
 'the',
 'their',
 'them',
 'themselves',
 'then',
 'thence',
 'there',
 'thereafter',
 'thereby',
 'therefore',
 'therein',
 'thereupon',
 'these',
 'they',
 'thick',
 'thin',
 'third',
 'this',
 'those',
 'though',
 'three',
 'through',
 'throughout',
 'thru',
 'thus',
 'to',
 'together',
 'too',
 'top',
 'toward',
 'towards',
 'twelve',
 'twenty',
 'two',
 'un',
 'under',
 'until',
 'up',
 'upon',
 'us',
 'very',
 'via',
 'was',
 'we',
 'well',
 'were',
 'what',
 'whatever',
 'when',
 'whence',
 'whenever',
 'where',
 'whereafter',
 'whereas',
 'whereby',
 'wherein',
 'whereupon',
 'wherever',
 'whether',
 'which',
 'while',
 'whither',
 'who',
 'whoever',
 'whole',
 'whom',
 'whose',
 'why',
 'will',
 'with',
 'within',
 'without',
 'would',
 'yet',
 'you',
 'your',
 'yours',
 'yourself',
 'yourselves']
### [code]
# TODO: based on a new query post, which post in our dataset is closest?
new_post = "Would I get injured playing goalie?" # "Should a team be added in Wisconsin?"
new_post_vec = vectorizer.transform([new_post])
dists = [dist_norm(new_post_vec.toarray(), train_vec.toarray()) for train_vec in X_train]
closest_id = np.argmin(dists)
print(closest_id)
print(posts[closest_id])
-> 304
From: drozinst@db.erau.edu (Drozinski Tim)
Subject: Re: Ulf and all...
Organization: Embry-Riddle Aeronautical University, Daytona Beach, FL USA
Lines: 59
NNTP-Posting-Host: alpha.db.erau.edu

layfield@cpsc.ucalgary.ca (Colin Layfield) writes:

>In article <1pdlksINNmq7@GIRAFFE.ZOO.CS.YALE.EDU> wuziyun%suned@cs.yale.edu (You wanna know?) writes:
>>
>>
>>Let me give my two cents worth in this whole thing:
>>
>>  I am very sick of Pittsburg fans(and they are my second favorite team) 
>>talk about how " why can't Bruins forget about Ulf Samuelsson when we have
>>forgotten all about Adam Graves"  Beside the obvious fact that Lemeuix's career
>>was never endangered by Graves' slash while Neely is still bother by his injury,
>>I think the most important reason is:
>>
>>        ADAM GRAVES HAS PLAYED CLEAN HOCKEY EVER SINCE!  WHILE ULF SAMULESSON
>>        CONTINUES TO PLAY DIRTY(YES, TRYING TO HIT A PLAYER WHERE HE'S INJURED
>>        IS DIRTY).  FANS HAVE CAN FORGET ABOUT ONE DIRTY PLAY BUT HOW CAN YOU
>>        FORGET ABOUT ULF SAMULESSON WHEN EVERYNIGHT, WHEN I WATCH HOCKEY HIGH
>>        LIGHTS, I GET REMINDED OF HOW DIRTY HE IS.

>Hitting a player when he's injured is dirty?  Can you explain this statement?
>Do you mean a player who was just injured on the ice(?) or do you mean a player
>who is playing hurt.  If a player is hurt he should not bother playing because
>I don't belive ANY PLAYER should be let up on just because they are playing
>hurt.

>I'm not an Ulf fan but at least I can spot the fact he is like Calgary's
>Theoren Fleury in the respect that part of his game is to really piss other
>players off as that's part of his job (But he lacks Ulf's size!).

I AM an Ulf (and Pgh) fan, and what pisses me off about the whole Adam Graves/
Ulf Samuesson debate is that Ulf plays hard-hitting hockey (nothing wrong with 
that) while Graves does what he does when the only way to win a game is to 
intentionally hurt someone (which bites!).

>Players that REALLY piss me off are the ones who insist on hitting from behind
>or try to go for the knees to injure the players.  This kind of garbage has
>got to go (I would really like to see Muni get pasted as he is one of the
>worst offenders).

I thought they had instituted all kinds of new rules this season to stop crap 
like that?!?  Is it just me, or does the officiating just still stink to high
heaven?  IMHO, if they could get rid of the existing refs, and institute a new
system with more than one ref on the ice to keep an eye on the trouble-makers
then a lot of these things would stop, and then the game would be ruled by the
finnesse players:  Mario, Selanne, Bure, Messier, et.al...

>Just my $0.02.

> Colin Layfield            | "Religion and Sex are power plays,
>                           |  Manipulate the people for the money they pay,
> The University of Calgary |  Selling Skin, Selling God
> Computer Science          |  The numbers look the same on their CREDIT CARDS!"
> layfield@cpsc.ucalgary.ca |                          - Queensryche


Tim Drozinski
Embry-Riddle Aero. Univ.
drozinst@erau.db.erau.edu



### [markdown]
How did this do?

We can can also add stemming and tf-idf:

### [code]
import nltk.stem
english_stemmer = nltk.stem.SnowballStemmer('english')

### [code]
english_stemmer.stem("happily")
=> 'happili'
### [code]
class StemmedCountVectorizer(CountVectorizer):
   def build_analyzer(self):
     analyzer = super(StemmedCountVectorizer, self).build_analyzer()
     return lambda doc: (english_stemmer.stem(w) for w in analyzer(doc))

### [code]
vectorizer = StemmedCountVectorizer(min_df=1, stop_words='english')
X_train = vectorizer.fit_transform(posts)

### [code]
X_train.shape
=> (600, 10381)
### [code]
from sklearn.feature_extraction.text import TfidfVectorizer
class StemmedTfidfVectorizer(TfidfVectorizer):
  def build_analyzer(self):
    analyzer = super(TfidfVectorizer, self).build_analyzer()
    return lambda doc: (english_stemmer.stem(w) for w in analyzer(doc))

### [code]
vectorizer = StemmedTfidfVectorizer(min_df=1, stop_words='english')
X_train = vectorizer.fit_transform(posts)

### [code]
X_train.shape
=> (600, 10381)
### [code]
# TODO: with these new vectorizers, lets test that query post again
new_post = "Would I get injured playing goalie?"
new_post_vec = vectorizer.transform([new_post])
dists = [dist_norm(new_post_vec.toarray(), train_vec.toarray()) for train_vec in X_train]
closest_id = np.argmin(dists)
print(closest_id)
print(posts[closest_id])
-> 304
From: drozinst@db.erau.edu (Drozinski Tim)
Subject: Re: Ulf and all...
Organization: Embry-Riddle Aeronautical University, Daytona Beach, FL USA
Lines: 59
NNTP-Posting-Host: alpha.db.erau.edu

layfield@cpsc.ucalgary.ca (Colin Layfield) writes:

>In article <1pdlksINNmq7@GIRAFFE.ZOO.CS.YALE.EDU> wuziyun%suned@cs.yale.edu (You wanna know?) writes:
>>
>>
>>Let me give my two cents worth in this whole thing:
>>
>>  I am very sick of Pittsburg fans(and they are my second favorite team) 
>>talk about how " why can't Bruins forget about Ulf Samuelsson when we have
>>forgotten all about Adam Graves"  Beside the obvious fact that Lemeuix's career
>>was never endangered by Graves' slash while Neely is still bother by his injury,
>>I think the most important reason is:
>>
>>        ADAM GRAVES HAS PLAYED CLEAN HOCKEY EVER SINCE!  WHILE ULF SAMULESSON
>>        CONTINUES TO PLAY DIRTY(YES, TRYING TO HIT A PLAYER WHERE HE'S INJURED
>>        IS DIRTY).  FANS HAVE CAN FORGET ABOUT ONE DIRTY PLAY BUT HOW CAN YOU
>>        FORGET ABOUT ULF SAMULESSON WHEN EVERYNIGHT, WHEN I WATCH HOCKEY HIGH
>>        LIGHTS, I GET REMINDED OF HOW DIRTY HE IS.

>Hitting a player when he's injured is dirty?  Can you explain this statement?
>Do you mean a player who was just injured on the ice(?) or do you mean a player
>who is playing hurt.  If a player is hurt he should not bother playing because
>I don't belive ANY PLAYER should be let up on just because they are playing
>hurt.

>I'm not an Ulf fan but at least I can spot the fact he is like Calgary's
>Theoren Fleury in the respect that part of his game is to really piss other
>players off as that's part of his job (But he lacks Ulf's size!).

I AM an Ulf (and Pgh) fan, and what pisses me off about the whole Adam Graves/
Ulf Samuesson debate is that Ulf plays hard-hitting hockey (nothing wrong with 
that) while Graves does what he does when the only way to win a game is to 
intentionally hurt someone (which bites!).

>Players that REALLY piss me off are the ones who insist on hitting from behind
>or try to go for the knees to injure the players.  This kind of garbage has
>got to go (I would really like to see Muni get pasted as he is one of the
>worst offenders).

I thought they had instituted all kinds of new rules this season to stop crap 
like that?!?  Is it just me, or does the officiating just still stink to high
heaven?  IMHO, if they could get rid of the existing refs, and institute a new
system with more than one ref on the ice to keep an eye on the trouble-makers
then a lot of these things would stop, and then the game would be ruled by the
finnesse players:  Mario, Selanne, Bure, Messier, et.al...

>Just my $0.02.

> Colin Layfield            | "Religion and Sex are power plays,
>                           |  Manipulate the people for the money they pay,
> The University of Calgary |  Selling Skin, Selling God
> Computer Science          |  The numbers look the same on their CREDIT CARDS!"
> layfield@cpsc.ucalgary.ca |                          - Queensryche


Tim Drozinski
Embry-Riddle Aero. Univ.
drozinst@erau.db.erau.edu



### [markdown]
#### Cosine Similarity

We can use the cosine similarity instead of the normalized vector distance.

But remember to maximize similarity vs. minimize distance.

### [code]
def cos_similarity(v1, v2):
  return np.vdot(v1,v2) / (np.linalg.norm(v1) * np.linalg.norm(v2))

### [code]
# TODO: use cosine similarity as a distance metric and try the query post again
new_post = "Would I get injured playing goalie?"
new_post_vec = vectorizer.transform([new_post])
dists = [cos_similarity(new_post_vec.toarray(), train_vec.toarray()) for train_vec in X_train]
closest_id = np.argmax(dists)
print(closest_id)
print(posts[closest_id])
-> 304
From: drozinst@db.erau.edu (Drozinski Tim)
Subject: Re: Ulf and all...
Organization: Embry-Riddle Aeronautical University, Daytona Beach, FL USA
Lines: 59
NNTP-Posting-Host: alpha.db.erau.edu

layfield@cpsc.ucalgary.ca (Colin Layfield) writes:

>In article <1pdlksINNmq7@GIRAFFE.ZOO.CS.YALE.EDU> wuziyun%suned@cs.yale.edu (You wanna know?) writes:
>>
>>
>>Let me give my two cents worth in this whole thing:
>>
>>  I am very sick of Pittsburg fans(and they are my second favorite team) 
>>talk about how " why can't Bruins forget about Ulf Samuelsson when we have
>>forgotten all about Adam Graves"  Beside the obvious fact that Lemeuix's career
>>was never endangered by Graves' slash while Neely is still bother by his injury,
>>I think the most important reason is:
>>
>>        ADAM GRAVES HAS PLAYED CLEAN HOCKEY EVER SINCE!  WHILE ULF SAMULESSON
>>        CONTINUES TO PLAY DIRTY(YES, TRYING TO HIT A PLAYER WHERE HE'S INJURED
>>        IS DIRTY).  FANS HAVE CAN FORGET ABOUT ONE DIRTY PLAY BUT HOW CAN YOU
>>        FORGET ABOUT ULF SAMULESSON WHEN EVERYNIGHT, WHEN I WATCH HOCKEY HIGH
>>        LIGHTS, I GET REMINDED OF HOW DIRTY HE IS.

>Hitting a player when he's injured is dirty?  Can you explain this statement?
>Do you mean a player who was just injured on the ice(?) or do you mean a player
>who is playing hurt.  If a player is hurt he should not bother playing because
>I don't belive ANY PLAYER should be let up on just because they are playing
>hurt.

>I'm not an Ulf fan but at least I can spot the fact he is like Calgary's
>Theoren Fleury in the respect that part of his game is to really piss other
>players off as that's part of his job (But he lacks Ulf's size!).

I AM an Ulf (and Pgh) fan, and what pisses me off about the whole Adam Graves/
Ulf Samuesson debate is that Ulf plays hard-hitting hockey (nothing wrong with 
that) while Graves does what he does when the only way to win a game is to 
intentionally hurt someone (which bites!).

>Players that REALLY piss me off are the ones who insist on hitting from behind
>or try to go for the knees to injure the players.  This kind of garbage has
>got to go (I would really like to see Muni get pasted as he is one of the
>worst offenders).

I thought they had instituted all kinds of new rules this season to stop crap 
like that?!?  Is it just me, or does the officiating just still stink to high
heaven?  IMHO, if they could get rid of the existing refs, and institute a new
system with more than one ref on the ice to keep an eye on the trouble-makers
then a lot of these things would stop, and then the game would be ruled by the
finnesse players:  Mario, Selanne, Bure, Messier, et.al...

>Just my $0.02.

> Colin Layfield            | "Religion and Sex are power plays,
>                           |  Manipulate the people for the money they pay,
> The University of Calgary |  Selling Skin, Selling God
> Computer Science          |  The numbers look the same on their CREDIT CARDS!"
> layfield@cpsc.ucalgary.ca |                          - Queensryche


Tim Drozinski
Embry-Riddle Aero. Univ.
drozinst@erau.db.erau.edu



### [markdown]
## Closest Document Function

### [code]
# Helper function!
def findClosestStory(promt):
  new_post_vec = vectorizer.transform([promt])
  dists = [cos_similarity(new_post_vec.toarray(),train_vec.toarray()) for train_vec in X_train]
  closest_id = np.argmax(dists) #switch to arg max!
  return posts[closest_id]


### [code]
print(findClosestStory("where can I find cheap tickets?"))
-> From: gomer+@pitt.edu (Richard J Coyle)
Subject: Re: How difficult is it to get Penguin tickets?
Organization: University of Pittsburgh
Lines: 14

In article <1993Apr18.201811.28965@magnus.acs.ohio-state.edu> dmoney@magnus.acs.ohio-state.edu (Dean R Money) writes:
>The subject line says it all.  Is it terribly difficult to get tickets
>to Penguins games, especially now that they are in the playoffs?  Would
>it be easy to find scalpers outside of the Igloo selling tickets?

There are ALWAYS scalpers with tickets outside the Arena.  You might have
to pay a few bucks extra, but you can always find them.  Look on the
street under the message board, or out on the street in front of the Hyatt,
or even around Gate 1.  The later you buy them, the less money you'll pay,
and during the regular season you could usually find some for near face
value or below if you wait until game time.  Might be better to pick them
up earlier now, though.

rick


### [code]
```
- `Bash`
```bash
S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad/nb"; cd "$S"; for f in 2.4_PCA_on_iris* 2.4_PCA_on_news*; do echo "=================== $f"; cut -c1-400 "$f"; done
```
```
=================== 2.4_PCA_on_iris_data.ipynb.err
=================== 2.4_PCA_on_iris_data.ipynb.txt
### [markdown]
Going back to the iris dataset, let's pick 3 features so we have 3D data and look at the results.

### [code]
import plotly.express as px

iris_data = px.data.iris() # this dataset is so common, its built into libraries!
features = [ "sepal_length", "petal_width", "petal_length"] #"sepal_width",

### [markdown]
One way to visualize high-dimensional data is to plot pairs of features.

### [code]
fig = px.scatter_matrix(iris_data, dimensions=features, color="species")
fig.update_traces(diagonal_visible=False)
fig.show()

### [markdown]
Where we are using the Plotly visualization library (an alternative to Matplotlib or Seaborn). Plotly lets you interact with its graphs! Hover your mouse over each point to get additional information.

### [markdown]
Because we only have 3 features, we can also plot the data in 3D.

### [code]
fig = px.scatter_3d(iris_data, x = "petal_width", y="petal_length",  z = "sepal_length")
fig.show()

### [markdown]
Again, Plotly lets you interact with the 3D plot!

Imagine you are going to take a 2D screenshot to include in a written report. Zoom in to the graph so that the points fill up the entire width or height of the plot as much as possible.

Then answer the following questions as today's in-class activity:

1.   While staying zoomed in, rotate the graph to find the worst possible angle! That is, find the angle that preserves the *least* amount of information about the true 3D structure of the data.
2.   Find the angle that preserves the *most* amount of information about the true 3D structure of the data.

*(upload both of these images as today's in-class activity)*

What makes a good rotation?


### [markdown]
That's it, you now understand the key idea behind PCA. It's simply a matrix that rotates the data so you can still see as much of the original spread/variance as possible!


---

### [markdown]
Let's try SKLearn's PCA package and see how it compares to your rotation.

Here is how you compute the PCA components for each data sample.

### [code]
from sklearn.decomposition import PCA
import pandas as pd

### [code]
# TODO: perform PCA on iris data



### [markdown]
We can see each sample now as a new 3D point:

### [code]
print(components_df)

### [markdown]
We can plot these points to see the PCA projection. How does it compare to your rotation?

### [code]
fig = px.scatter(components_df, x="PC1", y="PC2")
fig.show()

### [markdown]
(Keep in mind, flipping the axis or rotating the graph around the centre all have the same "spread" - so there is a family of equally good PCA projections)

---

Here is the moment of truth! Our PCA projection never had access to the data labels. It's a completely unsupervised method. But, PCA captures some information about the structure of the underlying data by focusing us on the view of the data where there is the widest variety of features. This will often correlate with meaningful differences in the data, naturally separating different types of data 

Let's view the PCA rotation, but this time color by label.

### [code]
fig = px.scatter(components_df, x="PC1", y="PC2", color = iris_data["species"])
fig.show()

### [markdown]
Voilà! PCA left our datasets split into 3 pretty clean clusters *without ever knowing the labels*!

### [markdown]

---
It's worth remembering that our principal components are just linear combinations of the features (chosen to be orthogonal and maximize variance). Nothing more!

To help emphasize that point, we can look at `pca.components_` to see the actual components of the linear transformation and print out the equations for each principal component.

### [code]
# Create a list of equations for each principal component
for i in range(len(pca.components_)):
  equation = ''
  for j in range(len(features)):
    if j > 0:
      equation += ' + '
    equation += str(round(pca.components_[i][j], 2)) + '*' + features[j]
  print('PC' + str(i+1) + ' = ' + equation)

### [markdown]
---

So, how can we use PCA?

Firstly, PCA is a vital tool if you want to graph high-dimensional data. Even if you have a dataset with dozens or hundreds of features, using PCA to compute a 2D projection still often provides a meaningful way to visualize the dataset.

Secondly, working in the reduced dimension PCA space can be a good first step for other ML algorithms. For example, when implementing KNN, rather than measuring distances between two feature vectors directly, you can take the distance in PCA space. Often the first few PCA components contain most of the meaningful variation. In these cases, ignoring the less important PCA components removes noise f

### [markdown]
Let's use scikit-learn's built-in `train_test_split` function to build some training and testing data so we can see how well a classifier does using principal components rather than raw features.

### [code]
from sklearn.model_selection import train_test_split
import numpy as np
np.set_printoptions(suppress=True)

### [markdown]
First we'll try with the raw features:

### [code]
X_train, X_test, y_train, y_test = train_test_split(iris_data[features].to_numpy(),iris_data["species"].to_numpy(),test_size=0.33)

### [code]
#1-nn calssifier
pred = []
for test_feature in X_test:
  dist = [np.linalg.norm((test_feature - train_feature)) for train_feature in X_train]
  best_idx = np.argmin(dist)
  pred += [y_train[best_idx]]

(pred==y_test).sum()/y_test.size

### [markdown]
Next, let's try with PCA, but instead of using all three principal components, let's just use the first (most important) component.

### [code]
X_train, X_test, y_train, y_test = train_test_split(components_df["PC1"].to_numpy(),iris_data["species"].to_numpy(),test_size=0.33)

### [markdown]
Remember, our training data is just a single number for each entry (e.g., `0.36*sepal_length + 0.36*petal_width + 0.86*petal_length`):

### [code]
X_train #Only 1D features!

### [markdown]
How good of a classifier can we make knowing only a single number per entry?

### [code]
pred = []
for test_feature in X_test:
  dist = [np.linalg.norm((test_feature - train_feature)) for train_feature in X_train]
  best_idx = np.argmin(dist)
  pred += [y_train[best_idx]]

(pred==y_test).sum()/y_test.size
=> np.float64(0.88)
### [markdown]
We achieve between 85-95% accuracy using only a 1D, single number feature!

### [markdown]
Let'a ret kNN using the first 2 principal components

### [code]
from sklearn import neighbors
from sklearn.neighbors import KNeighborsClassifier

def knn_classifier(k):
    def knn_classify(x_train, y_train, x_test):
        knn = KNeighborsClassifier(n_neighbors=k)
        knn.fit(x_train, y_train)

        pred = knn.predict(x_test)
        return pred
    return knn_classify


def accuracy(classify, X_train, y_train, X_test, y_test):
  pred = classify(X_train, y_train, X_test)
  correct_pred = (pred == y_test)
  total_preds = y_test.size
  return correct_pred.sum()/total_preds

### [code]
X_train, X_test, y_train, y_test = train_test_split(components_df[["PC1", "PC2"]].to_numpy(),iris_data["species"].to_numpy(),test_size=0.33)

### [code]
knn = knn_classifier(7)
accuracy(knn, X_train, y_train, X_test, y_test)
=> np.float64(0.94)
### [markdown]
## Testing a new feature with PCA

### [markdown]
Let's check out the data a final time to remind us of the raw features:

### [code]
iris_data[features+["species"]]

### [markdown]
We can try to classify a new data point not seen in training. In theory, we can do this manually by computing the equations for the new principal components from the base features. However, SKLearn has a helpful function for us: we can use `pca.transform` to transform this new data into the PCA space fit earlier.

### [code]
#Add a new flower with sepal_length = 5.2, petal_width=0.3, and petal_length=1.4
#This should be a "setosa", but let's see what KNN on just a 1D space says
new_data = pd.DataFrame([[5.2,0.3,1.4]], columns = ["sepal_length", "petal_width", "petal_length"])
new_data_pc = pca.transform(new_data)
print(new_data.to_numpy())
print(new_data_pc)
-> [[5.2 0.3 1.4]]
[[-2.58363943  0.30461016  0.12964552]]

### [code]
dists = [np.linalg.norm(new_data_pc[:,[0]] - train_feature) for train_feature in X_train[:,[0]]]
best_idx = np.argmin(dists)
print(y_train[best_idx])
-> setosa

### [code]


=================== 2.4_PCA_on_newsgroups.ipynb.err
=================== 2.4_PCA_on_newsgroups.ipynb.txt
### [markdown]
## Download Newsgroup Dataset

### [code]
!wget "https://raw.githubusercontent.com/be-prado/csci4521/refs/heads/main/20news-bydate.tar.gz"
!tar -xf 20news-bydate.tar.gz
-> --2025-10-08 12:16:34--  https://raw.githubusercontent.com/be-prado/csci4521/refs/heads/main/20news-bydate.tar.gz
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 185.199.108.133, 185.199.109.133, 185.199.110.133, ...
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|185.199.108.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 14464277 (14M) [application/octet-stream]
Saving to: ‘20news-bydate.tar.gz’

20news-bydate.tar.g 100%[===================>]  13.79M  --.-KB/s    in 0.1s    

2025-10-08 12:16:34 (125 MB/s) - ‘20news-bydate.tar.gz’ saved [14464277/14464277]


### [markdown]
## Load the dataset

Import the Python libraries used for ML, NLP, and data processing. Also, load the data and store the labels (which newsgroup the data was from) and ID number (index we can use to look up a post).

### [code]
from sklearn.feature_extraction.text import CountVectorizer, TfidfVectorizer
from sklearn.model_selection import train_test_split
import seaborn as sns
import pandas as pd
import numpy as np
np.set_printoptions(suppress=True)
import os

### [code]
DIR = "/content/20news-bydate-train/"
catigories = ["comp.graphics","comp.sys.mac.hardware","talk.politics.misc","sci.space","misc.forsale"]

### [code]
posts = []
labels = []
ids = []
for c in catigories:
  posts += [open(os.path.join(DIR+c, f), encoding="latin-1").read() for f in os.listdir(DIR+c)]
  labels += [c for f in os.listdir(DIR+c)]
labels = np.array(labels)
ids = np.arange(0,len(labels))

### [markdown]
Next, we will use a stemmer on the words (to remove endings like "ing" and "ly") and apply TF-IDF to create a document vectorization (to give higher weight to rarer words).

### [code]
#A TF-IDF Vectorizer with Stemming
import nltk.stem
english_stemmer = nltk.stem.SnowballStemmer('english')
class StemmedTfidfVectorizer(TfidfVectorizer):
   def build_analyzer(self):
     analyzer = super(StemmedTfidfVectorizer, self).build_analyzer()
     return lambda doc: (english_stemmer.stem(w) for w in analyzer(doc))

vectorizer = StemmedTfidfVectorizer(min_df=1, stop_words='english')
doc_features = vectorizer.fit_transform(posts).toarray()

### [markdown]
## Nearest Neighbors Classification



### [markdown]
We have thousands of labels across the five newsgroups we loaded. Let's split them into testing and training data.

### [code]
labels.shape

### [code]
X_train, X_test, y_train, y_test = train_test_split(doc_features, labels, test_size=0.33)

### [code]
X_train.shape

### [markdown]
Ok, first, let's run a 1-nn classifier on the Newsgroup dataset to see how well it does.

### [markdown]
I've included a `%%time` directive, which will report how long the block takes to run. `%time` only times the next line, `%%time` times the entire block, and `%%timeit` and `%timeit` run the timing tests multiple times and average the results.

### [code]
%%time
pred = []
for test_feature in X_test:
  dist = [np.linalg.norm((test_feature - train_feature)) for train_feature in X_train]
  best_idx = np.argmin(dist)
  pred += [y_train[best_idx]]

acc = (pred==y_test).sum()/y_test.size
print("Classification accuracy is",acc,"\n")

### [markdown]
Take note of both the accuracy and the time it took to classify the testing data and compute an accuracy. Hopefully, PCA can help us with at least one (maybe both!).

### [markdown]
## Using PCA

We'll use the PCA library as implemented in Scikit-Learn, so we first need to import that.

### [code]
from sklearn.decomposition import PCA

### [markdown]
We can now invoke PCA. We provide PCA with a number of components to fit. By default, it will have as many components as the number of features or the number of data entries, whichever is smaller.

Here, we perform 2D PCA and then utilize `fit_transform` to calculate the new features and retrieve them.

### [code]
pca = PCA(n_components=2) # From 30,000 features down to two!
pc = pca.fit_transform(doc_features)

### [markdown]
Let's put the results in a dataframe along with the information about which cluster each data point came from.

### [code]
pc_df = pd.DataFrame(data = pc, columns = ['PC1', 'PC2'])
pc_df['Cluster'] = labels
pc_df['ID'] = ids
pc_df

### [markdown]
Because we chose a 2D PCA (i.e., a projection down to two features), we can directly plot what the features look like in the PCA space.

### [code]
sns.lmplot( x="PC1", y="PC2", fit_reg=False, data = pc_df, hue = 'Cluster')

### [markdown]
This highlights one of the key uses of PCA. It allows us to easily visualize high-dimensional datasets.

We can see some very natural clustering in the PCA space. Documents from misc.forsale, sci.space, and comp.graphics typically end up in very different parts of the 2D PCA space.

### [markdown]
### Interactive graphs with Plotly

I would like us to be able to interact with this visualization. The Plotly library (https://plotly.com/python/) gives a very easy way to make an interactive plot. Plotly has a lot of nice graphs that are useful in a variety of circumstances, so be sure to check it out.

Here is the interactive 2D scatterplot with Plotly. Note that I used `hover_data=["ID"]` to show the ID of a data point when you hover over it.

### [code]
import plotly.express as px

### [code]
fig = px.scatter(pc_df, x="PC1", y="PC2", color = 'Cluster',hover_data=["ID"])
fig.show()

### [markdown]
We can do the same thing to create an interactive 3D graph:

### [code]
pca = PCA(n_components=3)
pc = pca.fit_transform(doc_features)

### [code]
pc_df = pd.DataFrame(data = pc, columns = ['PC1', 'PC2', 'PC3'])
pc_df['Cluster'] = labels
pc_df['ID'] = ids
pc_df

fig = px.scatter_3d(pc_df, x="PC1", y="PC2", z="PC3", color = 'Cluster',hover_data=["ID"])
fig.show()

### [markdown]
Play around with the visualization and look for some interesting posts that are at the boundary between two clusters (or even posts that seem misplaced).

Let's look at these posts to see why they might have neighbors from different news groups:

### [code]
print(posts[63]) #A graphics post, sitting next to space posts

### [code]
print(posts[2078]) #A space post, sitting in the middle of politics posts

### [markdown]
## Building a classifier with PCA+KNN

### [markdown]
We can run a 1-NN classifier on the PCA space instead of on the features directly.

Remember we have a 30,000 dimensional feature space! KNN is really slow here. It turns out we can represent most of the variance in the data with ~400-600 PCA dimensions.

### [code]
pca = PCA(n_components=500)
X_train_pc = pca.fit_transform(X_train)
X_test_pc = pca.transform(X_test)
exp_var_cumul = np.cumsum(pca.explained_variance_ratio_)

px.area(
    x=range(1, exp_var_cumul.shape[0] + 1),
    y=exp_var_cumul,
    labels={"x": "# Components", "y": "Explained Variance"}
)

### [code]
dims = np.arange(1,502,100)
accuracy = []

for dim in dims:

  pred = []
  for test_feature in X_test_pc[:,0:dim]:
    dist = [np.linalg.norm((test_feature - train_feature)) for train_feature in X_train_pc[:,0:dim]]
    best_idx = np.argmin(dist)
    pred += [y_train[best_idx]]

  acc = (pred==y_test).sum()/y_test.size
  accuracy += [acc]
  print("With",dim,"PCs the accuracy is",acc)

### [markdown]
Interestingly, our accuracy peaks somewhere between 1 and 200 principal components. Let's run the analysis again, but focus in on that range:

### [code]
dims = np.arange(1,202,25)
accuracy = []

for dim in dims:

  pred = []
  for test_feature in X_test_pc[:,0:dim]:
    dist = [np.linalg.norm((test_feature - train_feature)) for train_feature in X_train_pc[:,0:dim]]
    best_idx = np.argmin(dist)
    pred += [y_train[best_idx]]

  acc = (pred==y_test).sum()/y_test.size
  accuracy += [acc]
  print("With",dim,"PCs the accuracy is",acc)

### [markdown]
Wow, it seems like a fairly small number of PCs works pretty well. Lets try focusing on even smaller number of components.

### [code]
dims = np.arange(1,51,5)
accuracy = []

for dim in dims:

  pred = []
  for test_feature in X_test_pc[:,0:dim]:
    dist = [np.linalg.norm((test_feature - train_feature)) for train_feature in X_train_pc[:,0:dim]]
    best_idx = np.argmin(dist)
    pred += [y_train[best_idx]]

  acc = (pred==y_test).sum()/y_test.size
  accuracy += [acc]
  print("With",dim,"PCs the accuracy is",acc)

### [markdown]
The results are getting a bit noisy, but it seems to me that about 15 principal components may be good for this dataset. You can likely make strong arguments for many other values as well.

---

Let's put it all together:

### [code]
%%time
#Split testing a training data
X_train, X_test, y_train, y_test = train_test_split(doc_features, labels, test_size=0.33)

#Fit PCA
n_components=15
pca = PCA(n_components=n_components)
X_train_pc = pca.fit_transform(X_train) #Avoiding leakage, only train PCA on training data!
X_test_pc = pca.transform(X_test)       #Transform the testing data based on the training data's PCA fit
exp_var_cumul = np.cumsum(pca.explained_variance_ratio_)
print("Variance explained by",n_components,"PCA components:", exp_var_cumul[-1])

#1-NN Classifier
pred = []
for test_feature in X_test_pc:
  dist = [np.linalg.norm((test_feature - train_feature)) for train_feature in X_train_pc]
  best_idx = np.argmin(dist)
  pred += [y_train[best_idx]]

#Compute Accuracy
acc = (pred==y_test).sum()/y_test.size
accuracy += [acc]
print("1-NN Classifier ("+str(n_components)+"PCs) -- Accuracy is:",acc)
print("")

### [markdown]
So we are using a very small numbr of PCA components. Our classification is about as good as before, and significantly faster.

### [markdown]
Why do we do well with so few PCA components? Using a small number of PCA components reduces variance in our datasets. Using KNN, especially with a small K (like 1), is very sensitive to overfitting (i.e., KNN with small K is a very flexible model with little bias, so it overfits to the variance in the training data).

Reducing variance in the dataset by using a small number of PCA components, then using KNN with small K is one of my personal go-to strategies for building classifiers on a wide variety of tasks.
```
- `Bash`
```bash
S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad"; mkdir -p "$S/books"; cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Textbook & Resources"; for b in ISL DLB ENLP; do pdftotext -layout "$b Textbook CSCI 4521.pdf" "$S/books/$b.txt" 2>&1 | head -3; echo "$b: $(wc -c < "$S/books/$b.txt") chars; pages=$(grep -c $'\f' "$S/books/$b.txt")"; pdfinfo "$b Textbook CSCI 4521.pdf" 2>/dev/null | grep -E "Title|Pages"; done
```
```
Exit code 1
Syntax Error: Missing CIDSystemInfo dictionary in Type 0 descendant font
Syntax Error: Failed to parse font object for 'AAAAAB+MyriadPro-Regular'
Syntax Error: Unknown font tag 'C1'
ISL: 1829329 chars; pages=613
DLB: 1980460 chars; pages=802
ENLP: 451249 chars; pages=171
```
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4521\Textbook\Textbook Map.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4521\Weekly\Weekly Board.md`
- `Bash`
```bash
S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad/books"; cd "$S"; 
echo "== ISL"; awk 'BEGIN{RS="\f"} /^[ \t]*(2\.1|2\.2|2\.3|12\.4)[ \t]+[A-Z]/ || /^[ \t]*2\.2\.[123][ \t]+[A-Z]/ || /^[ \t]*12\.4\.[123][ \t]+[A-Z]/ || /^[ \t]*2\.1\.[1-5][ \t]+[A-Z]/ {n=split($0,L,"\n"); for(i=1;i<=n;i++) if (L[i] ~ /^[ \t]*(2\.[123](\.[0-9])?|12\.4(\.[0-9])?)[ \t]+[A-Z][A-Za-z]/) print "p" NR ": " L[i]}' ISL.txt | head -60
```
```
== ISL
p27:             2.1 What Is Statistical Learning? 17
p27: 2.1.1 Why Estimate f ?
p29:                                                       2.1 What Is Statistical Learning? 19
p31:                               2.1 What Is Statistical Learning? 21
p35:                                                       2.1 What Is Statistical Learning? 25
p35: 2.1.4 Supervised Versus Unsupervised Learning                                               supervised
p37: 2.2 Assessing Model Accuracy 27
p37: 2.1.5 Regression Versus Classification Problems                                  quantitative
p37: 2.2 Assessing Model Accuracy
p39:                                        2.2 Assessing Model Accuracy 29
p41:                                        2.2 Assessing Model Accuracy 31
p41: 2.2.2 The Bias-Variance Trade-Off
p45:                       2.2 Assessing Model Accuracy 35
p47: 2.2 Assessing Model Accuracy 37
p49:                                                                        2.2 Assessing Model Accuracy 39
p51:                                                                   2.3 Lab: Introduction to Python 41
p53:                                       2.3 Lab: Introduction to Python 43
p55:                                         2.3 Lab: Introduction to Python 45
p57:                                                      2.3 Lab: Introduction to Python 47
p59:           2.3 Lab: Introduction to Python 49
p61:                                                                     2.3 Lab: Introduction to Python 51
p61:          2.3.5 Sequences and Slice Notation
p61:          2.3.6 Indexing Data
p63:                                                                     2.3 Lab: Introduction to Python 53
p65:                                                  2.3 Lab: Introduction to Python 55
p65:           2.3.7 Loading Data
p67:                                                       2.3 Lab: Introduction to Python 57
p69:                                            2.3 Lab: Introduction to Python 59
p69:           2.3.8 For Loops
p71:         2.3 Lab: Introduction to Python 61
p71:           2.3.9 Additional Graphical and Numerical Summaries
p527: 12.4 Clustering Methods 521
p529:                                       12.4 Clustering Methods 523
p531:                                 12.4 Clustering Methods 525
p531: 12.4.2 Hierarchical Clustering
p533:                                                                 12.4 Clustering Methods 527101010
p535:                                         12.4 Clustering Methods 529
p537:                                                                   12.4 Clustering Methods 531
```
- `Bash`
```bash
S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad/books"; cd "$S"; 
echo "== DLB"; awk 'BEGIN{RS="\f"} {n=split($0,L,"\n"); for(i=1;i<=n;i++) if (L[i] ~ /^[ \t]*(2\.[1-8]|3\.[1-3]|5\.[1-8](\.[1-3])?)[ \t]+[A-Z][A-Za-z]/ && length(L[i])<110) print "p" NR ": " L[i]}' DLB.txt | head -80
echo "== ENLP"; awk 'BEGIN{RS="\f"} {n=split($0,L,"\n"); for(i=1;i<=n;i++) if (L[i] ~ /^[ \t]*(1\.[1-3]|7\.1(\.[12])?)[ \t]+[A-Z][A-Za-z]/ && length(L[i])<110) print "p" NR ": " L[i]}' ENLP.txt | head -40; head -c 1500 ENLP.txt
```
```
== DLB
p2: 2.1 Scalars, Vectors, Matrices and Tensors . . . . . . . . . . . . . . . 31
p2: 2.2 Multiplying Matrices and Vectors . . . . . . . . . . . . . . . . . . 34
p2: 2.3 Identity and Inverse Matrices . . . . . . . . . . . . . . . . . . . . 36
p2: 2.4 Linear Dependence and Span . . . . . . . . . . . . . . . . . . . . 37
p2: 2.5 Norms . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 39
p2: 2.6 Special Kinds of Matrices and Vectors . . . . . . . . . . . . . . . 40
p2: 2.7 Eigendecomposition . . . . . . . . . . . . . . . . . . . . . . . . . . 42
p2: 2.8 Singular Value Decomposition . . . . . . . . . . . . . . . . . . . . 44
p2: 3.1 Why Probability? . . . . . . . . . . . . . . . . . . . . . . . . . . . 54
p3: 3.2 Random Variables . . . . . . . . . . . . . . . . . . . . . . . . . . 56
p3: 3.3 Probability Distributions . . . . . . . . . . . . . . . . . . . . . . . 56
p3: 5.1 Learning Algorithms . . . . . . . . . . . . . . . . . . . . . . . . . 99
p3: 5.2 Capacity, Overfitting and Underfitting . . . . . . . . . . . . . . . 110
p3: 5.3 Hyperparameters and Validation Sets . . . . . . . . . . . . . . . . 120
p3: 5.4 Estimators, Bias and Variance . . . . . . . . . . . . . . . . . . . . 122
p3: 5.5 Maximum Likelihood Estimation . . . . . . . . . . . . . . . . . . 131
p3: 5.6 Bayesian Statistics . . . . . . . . . . . . . . . . . . . . . . . . . . 135
p3: 5.7 Supervised Learning Algorithms . . . . . . . . . . . . . . . . . . . 139
p3: 5.8 Unsupervised Learning Algorithms . . . . . . . . . . . . . . . . . 145
p46: 2.1 Scalars, Vectors, Matrices and Tensors
p49: 2.2 Multiplying Matrices and Vectors
p51: 2.3 Identity and Inverse Matrices
p52: 2.4 Linear Dependence and Span
p54: 2.5 Norms
p55: 2.6 Special Kinds of Matrices and Vectors
p57: 2.7 Eigendecomposition
p59: 2.8 Singular Value Decomposition
p69: 3.1 Why Probability?
p71: 3.2 Random Variables
p71: 3.3 Probability Distributions
p114: 5.1 Learning Algorithms
p114: 5.1.1 The Task, T
p118: 5.1.2 The Performance Measure, P
p119: 5.1.3 The Experience, E
p125: 5.2 Capacity, Overfitting and Underfitting
p131: 5.2.1 The No Free Lunch Theorem
p133: 5.2.2 Regularization
p135: 5.3 Hyperparameters and Validation Sets
p136: 5.3.1 Cross-Validation
p137: 5.4 Estimators, Bias and Variance
p137: 5.4.1 Point Estimation
p139: 5.4.2 Bias
p142: 5.4.3 Variance and Standard Error
p146: 5.5 Maximum Likelihood Estimation
p148: 5.5.1 Conditional Log-Likelihood and Mean Squared Error
p149: 5.5.2 Properties of Maximum Likelihood
p150: 5.6 Bayesian Statistics
p153: 5.6.1 Maximum A Posteriori (MAP) Estimation
p154: 5.7 Supervised Learning Algorithms
p155: 5.7.1 Probabilistic Supervised Learning
p155: 5.7.2 Support Vector Machines
p158: 5.7.3 Other Simple Supervised Learning Algorithms
p160: 5.8 Unsupervised Learning Algorithms
p161: 5.8.1 Principal Components Analysis
== ENLP
p22:  1.1 SEMANTIC REPRESENTATION
p22:  1.2 VECTOR SPACE MODELS
p25: 1.3 THE EVOLUTION PATH OF REPRESENTATIONS
p115: 7.1 UNSUPERVISED SENTENCE EMBEDDINGS
p115: 7.1.1 BAG OF WORDS
p116:   7.1.2 SENTENCE-LEVEL TRAINING
Embeddings in Natural
Language Processing

Theory and Advances in
Vector Representations of Meaning
Synthesis Lectures on Human
    Language Technologies

Editor

Graeme Hirst, University of Toronto

Synthesis Lectures on Human Language Technologies is edited by Graeme Hirst of the University
of Toronto. The series consists of 50- to 150-page monographs on topics relating to natural
language processing, computational linguistics, information retrieval, and spoken language
understanding. Emphasis is on important new techniques, on new applications, and on topics that
combine two or more HLT subfields.

Embeddings in Natural Language Processing: Theory and Advances in Vector
Representations of Meaning

Mohammad Taher Pilehvar and Jose Camacho-Collados
2020

Conversational AI: Dialogue Systems, Conversational Agents, and Chatbots

Michael McTear
2020

Natural Language Processing for Social Media, Third Edition

Anna Atefeh Farzindar and Diana Inkpen
2020

Statistical Significance Testing for Natural Language Processing

Rotem Dror, Lotem Peled, Segev Shlomov, and Roi Reichart
2020

Deep Learning Approaches to Text Production

Shashi Narayan and Claire Gardent
2020

Linguistic Fundamentals for Natural Language Processing II: 100 Essentials from
Semantics and Pragmatics

Emily M. Bender and Alex Lascarides
2019
iv

  Cross-Lingual Word Embeddings

  Anders S�gaard, Ivan Vuli, Sebastian Ruder, Manaal Faruqui
  2019

  Bayes
```
- `Bash`
```bash
S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad/books"; cd "$S"; 
awk 'BEGIN{RS="\f"} {n=split($0,L,"\n"); for(i=1;i<=n;i++){ if (L[i] ~ /^[ \t]*(3 +Linear Regression|3\.1 +Simple Linear|12\.5 +Lab|12\.4\.1 +K-Means)/ ) print "ISL p" NR ": " L[i]}}' ISL.txt | head
awk 'BEGIN{RS="\f"} {n=split($0,L,"\n"); for(i=1;i<=n;i++){ if (L[i] ~ /^[ \t]*(5\.8\.2|5\.9|5\.10|5\.7\.3) +[A-Z]/ && length(L[i])<100) print "DLB p" NR ": " L[i]}}' DLB.txt | head
awk 'BEGIN{RS="\f"} {n=split($0,L,"\n"); for(i=1;i<=n;i++){ if (L[i] ~ /^[ \t]*(CHAPTER|Chapter) *[0-9]/ || L[i] ~ /^ *(2|7)\.[1-2] +[A-Z]/ ) print "ENLP p" NR ": " L[i]}}' ENLP.txt | head -20
echo; echo "ENLP page 22 head:"; awk 'BEGIN{RS="\f"} NR==22' ENLP.txt | head -12; echo ...; awk 'BEGIN{RS="\f"} NR==22' ENLP.txt | tail -5
echo "ENLP page 115 tail:"; awk 'BEGIN{RS="\f"} NR==115' ENLP.txt | tail -4
```
```
ISL p5: 3 Linear Regression                                       69
ISL p5: 3.1 Simple Linear Regression . . . . . . . . . . . . . . . . . . . 70
ISL p10: 12.4.1 K-Means Clustering . . . . . . . . . . . . . . . . . 521
ISL p10: 12.5 Lab: Unsupervised Learning . . . . . . . . . . . . . . . . . 535
ISL p79: 3.1 Simple Linear Regression
ISL p80:                                      3.1 Simple Linear Regression 71
ISL p82:                                                            3.1 Simple Linear Regression 73
ISL p84:                                            3.1 Simple Linear Regression 75
ISL p86:                         3.1 Simple Linear Regression 77
ISL p88:                    3.1 Simple Linear Regression 79
DLB p3: 5.9 Stochastic Gradient Descent . . . . . . . . . . . . . . . . . . . . . 150
DLB p3: 5.10 Building a Machine Learning Algorithm . . . . . . . . . . . . . . 152
DLB p158: 5.7.3 Other Simple Supervised Learning Algorithms
DLB p165: 5.9 Stochastic Gradient Descent
DLB p167: 5.10 Building a Machine Learning Algorithm
ENLP p11:         2.1 Natural Language Processing Fundamentals . . . . . . . . . . . . . . . . . . . . . . . . . . . . 9
ENLP p11:         2.2 Deep Learning for NLP . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 11
ENLP p13:         7.1 Unsupervised Sentence Embeddings . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 97
ENLP p13:         7.2 Supervised Sentence Embeddings . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 100
ENLP p19:                          CHAPTER 1
ENLP p27:                          CHAPTER 2
ENLP p27: 2.1 NATURAL LANGUAGE PROCESSING
ENLP p29: 2.2 DEEP LEARNING FOR NLP
ENLP p43:                          CHAPTER 3
ENLP p59:                          CHAPTER 4
ENLP p73:                          CHAPTER 5
ENLP p87:                          CHAPTER 6
ENLP p115:                          CHAPTER 7
ENLP p115: 7.1 UNSUPERVISED SENTENCE EMBEDDINGS
ENLP p118:  7.2 SUPERVISED SENTENCE EMBEDDINGS
ENLP p121:                          CHAPTER 8
ENLP p127:                          CHAPTER 9

ENLP page 22 head:
4 1. INTRODUCTION

  this limitation, we have also attempted to refer to other languages and their challenges in some
  chapters and sections, to help the reader assess the cross-lingual applicability of some of the
  concepts addressed in the book.

 1.1 SEMANTIC REPRESENTATION

  Imagine the word desk. When stored on a computer, this word is nothing but a sequence of four
  characters "d", "e", "s", and "k". But computers only understand zeros and ones. Hence, each
  character has to be stored as a pattern of bits. The number of bits depends on the encoding. For
  instance, the extended ASCII needs 8 bits for storing each character. Therefore, the word desk
...
     tinct fixed-sized patterns of zeros and ones. Assume we have 100 words in a vocabulary and

        6ASCII encoding for "desk": 01100100 01100101 01110011 01101011.
        7ASCII encoding for "table": 01110100 01100001 01100010 01101100 01100101.

ENLP page 115 tail:
//medium.com/huggingface/[REDACTED] (last visited on September 2020); and (2)
On sentence representations, pt. 1: what can you fit into a single #$!%&% blog post?--https://supernlp.github.io/2018/11/26/
sentreps/ (last visited on September 2020).
```
- `Bash`
```bash
S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad/books"; cd "$S"; grep -n -E "^ *(3\.4 +Marginal|5\.8\.2|3\.[0-9]+ +[A-Z][a-z]+)" DLB.txt | head -20; awk 'BEGIN{RS="\f"} NR>=158 && NR<=166 && /k-means|K-means/ {print "DLB p" NR " mentions k-means"}' DLB.txt; awk 'BEGIN{RS="\f"} NR>=160 && NR<=166 {n=split($0,L,"\n"); for(i=1;i<=n;i++) if (L[i] ~ /5\.8\.[0-9]|k-means clustering/) print "p" NR ": " L[i]}' DLB.txt | head
```
```
50:3.1 Why Probability? . . . . . . . . . . . . . . . . . . . . . . . . . . . 54
55:3.2 Random Variables . . . . . . . . . . . . . . . . . . . . . . . . . . 56
56:3.3 Probability Distributions . . . . . . . . . . . . . . . . . . . . . . . 56
57:3.4 Marginal Probability . . . . . . . . . . . . . . . . . . . . . . . . . 58
58:3.5 Conditional Probability . . . . . . . . . . . . . . . . . . . . . . . 59
59:3.6 The Chain Rule of Conditional Probabilities . . . . . . . . . . . . 59
60:3.7 Independence and Conditional Independence . . . . . . . . . . . . 60
61:3.8 Expectation, Variance and Covariance . . . . . . . . . . . . . . . 60
62:3.9 Common Probability Distributions . . . . . . . . . . . . . . . . . 62
63:3.10 Useful Properties of Common Functions . . . . . . . . . . . . . . 67
64:3.11 Bayes' Rule . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 70
65:3.12 Technical Details of Continuous Variables . . . . . . . . . . . . . 71
66:3.13 Information Theory . . . . . . . . . . . . . . . . . . . . . . . . . . 72
67:3.14 Structured Probabilistic Models . . . . . . . . . . . . . . . . . . . 75
2981:3.1 Why Probability?
3082:3.2 Random Variables
3099:3.3 Probability Distributions
3200:3.4 Marginal Probability
3230:3.5 Conditional Probability
3251:3.6 The Chain Rule of Conditional Probabilities
DLB p164 mentions k-means
p161: 5.8.1 Principal Components Analysis
p164: 5.8.2 k-means Clustering
p164: Another example of a simple representation learning algorithm is k-means clustering.
p164: The k-means clustering algorithm divides the training set into k different clusters
p164:     The one-hot code provided by k-means clustering is an example of a sparse
```
- `Bash`
```bash
S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad"; cut -c1-300 "$S/nb/0.1_intro_to_colab__pandas__sns.ipynb.txt" | head -150; echo =========== HW1; cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Homework"; pdftotext -layout "homework 1.docx.pdf" - | sed 's/[[:space:]]\+/ /g' | grep -v '^ *$' | head -120
```
```
### [code]
import pandas as pd

### [code]
wage_df = pd.read_csv("https://raw.githubusercontent.com/be-prado/csci4521/refs/heads/main/Wage.csv")

### [code]
wage_df.shape
=> (3000, 11)
### [code]
wage_df.head()
=>    year  age            maritl      race        education              region  \
0  2006   18  1. Never Married  1. White     1. < HS Grad  2. Middle Atlantic   
1  2004   24  1. Never Married  1. White  4. College Grad  2. Middle Atlantic   
2  2003   45        2. Married  1. White  3. Some College  2. Middle Atlantic   
3  2003   43        2. Married  3. Asian  4. College Grad  2. Middle Atlantic   
4  2005   50       4. Divorced  1. White       2. HS Grad  2. Middle Atlantic   

         jobclass          health health_ins   logwage        wage  
0   1. Industrial       1. <=Good      2. No  4.318063   75.043154  
1  2. Information  2. >=Very Good      2. No  4.255273   70.476020  
2   1. Industrial       1. <=Good     1. Yes  4.875061  130.982177  
3  2. Information  2. >=Very Good     1. Yes  5.041393  154.685293  
4  2. Information       1. <=Good     1. Yes  4.318063   75.043154  
### [code]
wage_df.columns
=> Index(['year', 'age', 'maritl', 'race', 'education', 'region', 'jobclass',
       'health', 'health_ins', 'logwage', 'wage'],
      dtype='object')
### [code]
wage_df.describe(include = 'all')
=>                year          age      maritl      race   education  \
count   3000.000000  3000.000000        3000      3000        3000   
unique          NaN          NaN           5         4           5   
top             NaN          NaN  2. Married  1. White  2. HS Grad   
freq            NaN          NaN        2074      2480         971   
mean    2005.791000    42.414667         NaN       NaN         NaN   
std        2.026167    11.542406         NaN       NaN         NaN   
min     2003.000000    18.000000         NaN       NaN         NaN   
25%     2004.000000    33.750000         NaN       NaN         NaN   
50%     2006.000000    42.000000         NaN       NaN         NaN   
75%     2008.000000    51.000000         NaN       NaN         NaN   
max     2009.000000    80.000000         NaN       NaN         NaN   

                    region       jobclass          health health_ins  \
count                 3000           3000            3000       3000   
unique                   1              2               2          2   
top     2. Middle Atlantic  1. Industrial  2. >=Very Good     1. Yes   
freq                  3000           1544            2142       2083   
mean                   NaN            NaN             NaN        NaN   
std                    NaN            NaN             NaN        NaN   
min                    NaN            NaN             NaN        NaN   
25%                    NaN            NaN             NaN        NaN   
50%                    NaN            NaN             NaN        NaN   
75%                    NaN            NaN             NaN        NaN   
max                    NaN            NaN             NaN        NaN   

            logwage         wage  
count   3000.000000  3000.000000  
unique          NaN          NaN  
top             NaN          NaN  
freq            NaN          NaN  
mean       4.653905   111.703608  
std        0.351753    41.728595  
min        3.000000    20.085537  
25%        4.447158    85.383940  
50%        4.653213   104.921507  
75%        4.857332   128.680488  
max        5.763128   318.342430  
### [code]
wage_df['maritl'].value_counts()
=> maritl
2. Married          2074
1. Never Married     648
4. Divorced          204
5. Separated          55
3. Widowed            19
Name: count, dtype: int64
### [code]
wage_df.dtypes
=> year            int64
age             int64
maritl         object
race           object
education      object
region         object
jobclass       object
health         object
health_ins     object
logwage       float64
wage          float64
dtype: object
### [code]
# using a mask to select parts of the data
mask = wage_df['maritl'] == "2. Married"
wage_df[mask]
=>       year  age      maritl      race        education              region  \
2     2003   45  2. Married  1. White  3. Some College  2. Middle Atlantic   
3     2003   43  2. Married  3. Asian  4. College Grad  2. Middle Atlantic   
5     2008   54  2. Married  1. White  4. College Grad  2. Middle Atlantic   
6     2009   44  2. Married  4. Other  3. Some College  2. Middle Atlantic   
9     2004   52  2. Married  1. White       2. HS Grad  2. Middle Atlantic   
...    ...  ...         ...       ...              ...                 ...   
2993  2006   31  2. Married  1. White       2. HS Grad  2. Middle Atlantic   
2994  2009   31  2. Married  1. White  4. College Grad  2. Middle Atlantic   
2995  2008   44  2. Married  1. White  3. Some College  2. Middle Atlantic   
2996  2007   30  2. Married  1. White       2. HS Grad  2. Middle Atlantic   
2997  2005   27  2. Married  2. Black     1. < HS Grad  2. Middle Atlantic   

            jobclass          health health_ins   logwage        wage  
2      1. Industrial       1. <=Good     1. Yes  4.875061  130.982177  
3     2. Information  2. >=Very Good     1. Yes  5.041393  154.685293  
5     2. Information  2. >=Very Good     1. Yes  4.845098  127.115744  
6      1. Industrial  2. >=Very Good     1. Yes  5.133021  169.528538  
9     2. Information  2. >=Very Good     1. Yes  4.857332  128.680488  
...              ...             ...        ...       ...         ...  
2993  2. Information  2. >=Very Good     1. Yes  4.633468  102.870247  
2994  2. Information  2. >=Very Good     1. Yes  4.893207  133.380608  
2995   1. Industrial  2. >=Very Good     1. Yes  5.041393  154.685293  
2996   1. Industrial  2. >=Very Good      2. No  4.602060   99.689464  
2997   1. Industrial       1. <=Good      2. No  4.193125   66.229408  

[2074 rows x 11 columns]
### [code]
import seaborn as sns
import matplotlib.pyplot as plt

### [code]
plt.figure()
sns.histplot(wage_df, x='wage')
plt.show()
=> <Figure size 640x480 with 1 Axes>
### [code]
plt.figure()
sns.histplot(wage_df, x='wage', kde=True)
plt.show()
=> <Figure size 640x480 with 1 Axes>
### [code]
plt.figure()
sns.histplot(wage_df, x='wage', hue='jobclass', kde=True)
plt.show()
=> <Figure size 640x480 with 1 Axes>
### [code]
plt.figure()
sns.scatterplot(wage_df, x='age', y='wage')
plt.show()
=> <Figure size 640x480 with 1 Axes>
### [code]
plt.figure()
sns.scatterplot(wage_df, x='age', y='wage', hue='education')
=========== HW1
CSCI 4521 Instr.: Bernardo
HW 1: Introduction (KNN, Classification, Regression, Metrics)
 Project Due: Monday, Oct 05
Overview. This HW consists of 5 problems, all from the same PhiUSIIL_HW1_777.csv
dataset. You can download the full PhiUSIIL Phishing URL dataset from the UCI data
archive.
This dataset contains the following features:
 URLLength: Number of characters in the URL
 DomainLength: Number of characters in the domain name
 IsDomainIP: Whether the domain is an IP address (1 = yes)
 TLDLength: Number of characters in the top-level domain
 NoOfSubDomain: Number of subdomains in the URL
 LetterRatioInURL: Proportion of URL characters that are letters
 DigitRatioInURL: Proportion of URL characters that are digits
 SpecialCharRatioInURL: Proportion of URL characters that are special
 IsHTTPS: Whether the webpage uses HTTPS (1 = yes)
 LineOfCode: Number of lines of webpage source code
 DomainTitleMatchScore: Domain name/page title match score (0-100)
 HasFavicon: Whether the webpage has a favicon (1 = yes)
 IsResponsive: Whether the webpage is responsive (1 = yes)
 HasSocialNet: Whether the webpage links to social networks (1 = yes)
 HasPasswordField: Whether the webpage has a password field (1 = yes)
 NoOfJS: Number of JavaScript references in the webpage
 NoOfExternalRef: Number of external references in the webpage
 Label: Ground truth: 0 = phishing, 1 = legitimate
1. Data Preparation [20 pts] Load the csv into a dataframe. Add a new column named
"phishing" to the data frame, so that phishing webpages (Label = 0) are coded as 1, the
positive class for precision and recall in Q4. Report what fraction of webpages are phishing
and explain why this matters for the classifiers in Q4.
2. Data Visualization [20 pts] Choose four features in the dataset (other than Label) that
you think may be most indicative of if a webpage is phishing. Use the Seaborn pairplot
function to make a collection of pairwise scatter plots for these four features. Color the
scatter plot points by the "phishing" criteria.
3. Data Analysis [20 pts] Based on your plot from Q2, write about a paragraph analyzing
the resulting graphs. Are there any clear trends or insights? What features or pairs of
 features are most correlated with being a phishing webpage? Based on these results, what
recommendations would you have for a company looking to improve how it detects
phishing webpages (e.g., what warning signs to check first)?
4. Model Evaluation [20 pts] Write and evaluate four classifiers that predicts if a webpage
is phishing given some of the features of your choice (other than Label): 1) using KNN with
a small K of your choice, 2) KNN with a large K of your choice, 3) a classifier that says all
webpages are phishing, and 4) a classifier which says no webpages are phishing. When
evaluating your models, make sure you normalize the input data, and split the data into
testing and training datasets.
Evaluate your model by answering the following:
 a. Which features did you decide to use and why?
 b. For both training and testing, what is the precession, recall, accuracy, and F1-score of
 your KNN classifier (treat phishing as the positive class)?
 c. For each metric (precession, recall, accuracy, and F1-score), which of the 4 classifiers
 did the best and which the worst on the training data? Why is this?
 d. For each metric (precession, recall, accuracy, and F1-score), which of the 4 classifiers
 did the best and which the worst on the testing data? Why is this?
 e. Which of the four classifiers would you most recommend for the real-world
 questions on this dataset?
5. Applying the Model [20 pts] Consider a hypothetical webpage from the same period as
the webpages in the PhiUSIIL_HW1_777.csv dataset, where the URL has 41 characters and
the domain name has 23 characters. The domain is not an IP address, the top-level domain
has 3 characters, and there is 1 subdomain. The URL has a letter ratio of 0.537, a digit ratio
of 0.122, and a special character ratio of 0.146. The webpage uses HTTPS, has 550 lines of
source code, and has a domain-title match score of 0. It has a favicon and a password field,
but it is not responsive and has no social network links. It has 4 JavaScript references and 3
external references.
 a. Do you expect this webpage to be phishing or legitimate? Why?
 b. Using a KNN analysis. From this analysis, would you predict this webpage to be
 phishing (e.g., Label = 0)? In your analysis, be sure to explain and justify what k you are
 using, why you are using this k, what features you are using, and how you processed the
 data.
 c. [Extra Credit] What is the smallest change to the webpage stats that would flip your
 prediction? (Use whatever definition of small change makes sense to you.)
[Footnote: the full PhiUSIIL dataset has 235,795 URLs (134,850 legitimate and 100,945
phishing) described by 54 features; this HW uses a 777-row subset with 17 of those
features.]
 Deliverables:
Submit both a Jupyter notebook .ipython file that you used to answer the questions, and a
report in the form of a PDF file. For Question 1 and Question 2, make sure your notebook
file, when run, generates a pandas dataframe (Q1) and a scatter plot (Q2) [it may also
generate other analysis]. Questions 3, 4, and 5 should be answered in a separate report in a
PDF format. This report should clearly delineate which parts respond to which Question.
For full points, the report should make use of many plots/figures to justify or support your
answers.
If you are interested in using LaTex to write your report but are not comfortable with it yet,
you can use this template to get you started.
Intention of the assignment:
- Question 1 is designed to make sure you understand the basics of loading and
manipulating datasets from raw CSV files.
- Question 2 asks you to extend this skill to graphing data, and in the process also requires
you to thoughtful consider what features are the most meaningful to graph.
- Question 3 exercises your ability to thoughtfully analyze data, and tie in concepts from
class like bias, variance, flexibility, and how to select good models.
- Question 4 focuses on your ability to create and tune classification models and checks to
make sure you can correctly compute classification metrics.
- Question 5 asks you to make predictions on a new data point and robustly justify this
prediction - this is the key skill we want you to take away from this class.
Grading Criteria:
 - Question 1: Does the python code correctly load the data into a single dataframe? Does
this one dataframe have both the original data and the derived "phishing" information?
 - Question 2: Do the four features chosen make sense and show some interesting
relationship to phishing? Do the pairplot results look correct? Is the plot easy to read?
 - Question 3: Is the argument backed-up with figures and plots? Do the arguments make
sense? Are you able to transition from looking at numbers to interesting real-world advice?
 - Question 4: Are the four classifiers implemented correctly? Are the four metrics
implemented correctly? Is there a clear understanding of the difference between testing
and training data? Is the testing training split correct (e.g., no overlapping data between
them) and reasonable (e.g., neither set too small or too big)? Does the analysis show how to
weigh the relative importance of precision vs recall vs accuracy vs F1-score for real-world
tasks.
 - Question 5: Does the example data get loaded correctly into Python for classification? Is
the choice of K and the manner of data preprocessing well justified with both charts and
clear explanation? Do I believe the student that this webpage is/isn't likely to be phishing?
[EC:] How convincing is the analysis that this would change the webpage's rating?
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash`
```bash
cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code"; cat environment.yml; echo ----; cat Homework/README.md; echo ----; (conda env list 2>&1 | head -8) ; ls "C:/Users/anant" | head -0; where.exe python 2>&1 | head -3
```
```
name: csci-4521
channels:
  - conda-forge
  - nodefaults
dependencies:
  - python=3.12
  # OpenBLAS instead of MKL: MKL only finds its DLLs when the env is activated,
  # so a Jupyter kernel launched straight from python.exe crashed on matrix math.
  - libblas=*=*openblas
  - numpy
  - pandas
  - matplotlib
  - seaborn
  - scikit-learn
  - jupyterlab
  - ipykernel
  - nbconvert
----
# CSCI 4521 Homework 1

- `CSCI4521_HW1.ipynb`: the notebook to submit. It answers Q1 and Q2 and computes every number and figure used in the Q3 to Q5 report.
- `PhiUSIIL_HW1_777.csv`: the assignment dataset.
- `figures/`: the three report figures, written by the notebook every time it runs.

Run it in VS Code with the **Python (CSCI 4521)** kernel (conda env `csci-4521`, built from `../environment.yml`) using Restart and Run All. The seed is fixed, so every run gives the same numbers.
----
/usr/bin/bash: line 1: conda: command not found
C:\Users\anant\AppData\Local\Microsoft\WindowsApps\python.exe
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```

## Actions Taken

**Files created:**
_None_

**Files modified:**
_None_

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
- `cd "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 4521" && find . -type f | head -300 && echo ---- && du -sh .`
- `cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521" 2>&1 && find . -type f -printf '%P\t%s\t%TY-%Tm-%Td\n' | sort`
- `which python python3 pdftotext pdftoppm tesseract 2>&1; python --version 2>&1; python -c "import fitz; print('pymupdf', fitz.__doc__)" 2>&1 | head -2; python -c "import pypdf; print('pypdf', pypdf.__version__)" 2>&1 | head -2; python -c "import nbformat; print('nbformat ok')" 2>&1 | head -1`
- `S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad"; mkdir -p "$S/decks"; cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Lectures"; for f in Week*/*.pdf; do b=$(basename "$f" .pdf | tr ' ,' '__'); pdftotext -layout "$f" "$S/decks/$b.txt" 2>&1; echo "$f -> $(wc -c < "$S/decks/$b.txt") chars, $(pdfinfo "$f" 2>/dev/null | grep Pages)"; done`
- `S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad/decks"; cd "$S"; for f in 0.1* 1.2* 1.3*; do echo "=================== $f"; sed 's/[[:space:]]\+/ /g' "$f" | grep -v '^ *$'; done`
- `S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad/decks"; cd "$S"; for f in 1.4* 1.5*; do echo "=================== $f"; sed 's/[[:space:]]\+/ /g' "$f" | grep -v '^ *$'; done`
- `S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad/decks"; cd "$S"; for f in 2.1* 2.2* 2.4*; do echo "=================== $f"; sed 's/[[:space:]]\+/ /g' "$f" | grep -v '^ *$'; done`
- `S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad"; mkdir -p "$S/nb"; cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code/Lectures/Weeks 1 - 5"; for f in *.ipynb "Numpy Introduction"; do b=$(echo "$f" | tr ' ,' '__'); jq -r '.cells[] | "### [" + .cell_type + "]\n" + (.source|join("")) + "\n" + (if .outputs then ((.outputs[]? | if .output_type=="stream" then "-> " + (.text|join("")) elif (.data["text/plain"]? ) then "=> " + (.data["text/plain"]|join("")) elif .output_type=="error" then "ERR " + .ename else "" end) // "") else "" end)' "$f" > "$S/nb/$b.txt" 2>"$S/nb/$b.err"; echo "$f: $(wc -c < "$S/nb/$b.txt") chars; err=$(wc -c < "$S/nb/$b.err")"; done`
- `S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad/nb"; cd "$S"; for f in 1.1* 1.2*; do echo "=================== $f"; cat "$f"; done`
- `S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad/nb"; cd "$S"; for f in 1.3_kNN_with* 2.1*; do echo "=================== $f"; cat "$f"; done`
- `S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad/nb"; cd "$S"; cat 2.2_text_classification.ipynb.txt | cut -c1-400`
- `S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad/nb"; cd "$S"; for f in 2.4_PCA_on_iris* 2.4_PCA_on_news*; do echo "=================== $f"; cut -c1-400 "$f"; done`
- `S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad"; mkdir -p "$S/books"; cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Textbook & Resources"; for b in ISL DLB ENLP; do pdftotext -layout "$b Textbook CSCI 4521.pdf" "$S/books/$b.txt" 2>&1 | head -3; echo "$b: $(wc -c < "$S/books/$b.txt") chars; pages=$(grep -c $'\f' "$S/books/$b.txt")"; pdfinfo "$b Textbook CSCI 4521.pdf" 2>/dev/null | grep -E "Title|Pages"; done`
- `S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad/books"; cd "$S";  echo "== ISL"; awk 'BEGIN{RS="\f"} /^[ \t]*(2\.1|2\.2|2\.3|12\.4)[ \t]+[A-Z]/ || /^[ \t]*2\.2\.[123][ \t]+[A-Z]/ || /^[ \t]*12\.4\.[123][ \t]+[A-Z]/ || /^[ \t]*2\.1\.[1-5][ \t]+[A-Z]/ {n=split($0,L,"\n"); for(i=1;i<=n;i++) if (L[i] ~ /^[ \t]*(2\.[123](\.[0-9])?|12\.4(\.[0-9])?)[ \t]+[A-Z][A-Za-z]/) print "p" NR ": " L[i]}' ISL.txt | head -60`
- `S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad/books"; cd "$S";  echo "== DLB"; awk 'BEGIN{RS="\f"} {n=split($0,L,"\n"); for(i=1;i<=n;i++) if (L[i] ~ /^[ \t]*(2\.[1-8]|3\.[1-3]|5\.[1-8](\.[1-3])?)[ \t]+[A-Z][A-Za-z]/ && length(L[i])<110) print "p" NR ": " L[i]}' DLB.txt | head -80 echo "== ENLP"; awk 'BEGIN{RS="\f"} {n=split($0,L,"\n"); for(i=1;i<=n;i++) if (L[i] ~ /^[ \t]*(1\.[1-3]|7\.1(\.[12])?)[ \t]+[A-Z][A-Za-z]/ && length(L[i])<110) print "p" NR ": " L[i]}' ENLP.txt | head -40; head -c 1500 ENLP.txt`
- `S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad/books"; cd "$S";  awk 'BEGIN{RS="\f"} {n=split($0,L,"\n"); for(i=1;i<=n;i++){ if (L[i] ~ /^[ \t]*(3 +Linear Regression|3\.1 +Simple Linear|12\.5 +Lab|12\.4\.1 +K-Means)/ ) print "ISL p" NR ": " L[i]}}' ISL.txt | head awk 'BEGIN{RS="\f"} {n=split($0,L,"\n"); for(i=1;i<=n;i++){ if (L[i] ~ /^[ \t]*(5\.8\.2|5\.9|5\.10|5\.7\.3) +[A-Z]/ && length(L[i])<100) print "DLB p" NR ": " L[i]}}' DLB.txt | head awk 'BEGIN{RS="\f"} {n=split($0,L,"\n"); for(i=1;i<=n;i++){ if (L[i] ~ /^[ \t]*(CHAPTER|Chapter) *[0-9]/ || L[i] ~ /^ *(2|7)\.[1-2] +[A-Z]/ ) print "ENLP p" NR ": " L[i]}}' ENLP.txt | head -20 echo; echo "ENLP page 22 head:"; awk 'BEGIN{RS="\f"} NR==22' ENLP.txt | head -12; echo ...; awk 'BEGIN{RS="\f"} NR==22' ENLP.txt | tail -5 echo "ENLP page 115 tail:"; awk 'BEGIN{RS="\f"} NR==115' ENLP.txt | tail -4`
- `S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad/books"; cd "$S"; grep -n -E "^ *(3\.4 +Marginal|5\.8\.2|3\.[0-9]+ +[A-Z][a-z]+)" DLB.txt | head -20; awk 'BEGIN{RS="\f"} NR>=158 && NR<=166 && /k-means|K-means/ {print "DLB p" NR " mentions k-means"}' DLB.txt; awk 'BEGIN{RS="\f"} NR>=160 && NR<=166 {n=split($0,L,"\n"); for(i=1;i<=n;i++) if (L[i] ~ /5\.8\.[0-9]|k-means clustering/) print "p" NR ": " L[i]}' DLB.txt | head`
- `S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/89cb15f6-f87a-4305-92cc-0052096adb65/scratchpad"; cut -c1-300 "$S/nb/0.1_intro_to_colab__pandas__sns.ipynb.txt" | head -150; echo =========== HW1; cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Homework"; pdftotext -layout "homework 1.docx.pdf" - | sed 's/[[:space:]]\+/ /g' | grep -v '^ *$' | head -120`
- `cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code"; cat environment.yml; echo ----; cat Homework/README.md; echo ----; (conda env list 2>&1 | head -8) ; ls "C:/Users/anant" | head -0; where.exe python 2>&1 | head -3`

