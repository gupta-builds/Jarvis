---
type: class
class_kind: homework
status: sprout
created: 2026-10-26
updated: 2026-10-27
tags:
  - class
  - homework
area:
  - "[[CSCI 4521 Board]]"
next: "Confirm the Gradescope due date and this assignment's AI-use level, get the personalized dataset (the repo only ships demo_data with student_id demo3), then build and run the notebook and fill the report draft below from its output."
---
# Homework - 2
## Overview
Rover Rescue: build a terrain classifier from eight sensor readings (firm, rough, sand), compare scaling, PCA and cluster-based versus 1-NN prediction, deploy one fitted model on a practice grid and a mission grid, and explain the evidence in a standalone report of at most two pages. The grade is the 100-point `rubric.md` in the course repo, not the 10, 20 and 10 points printed in the PDF. Submission is on Gradescope (HW1 was Canvas).
Due date is unverified. The handout says "check Gradescope". The Board's schedule lists HW2 for Tue 10/20, which has passed (the 24-hour grace day ended 10/21). The repo's only commit for this folder is dated 2026-10-22 and is titled "added dataset for hw 3 f26", and the Week 6 note describes an earlier text-clustering HW2. So this may be a replacement or renumbered assignment. Check Gradescope before anything else.
Extra credit: none in the handout, the repo markdown or the rubric. The rubric says extra experiments earn credit only through stronger evidence. The only way to score higher is a full rubric score.
Sources read: `Code\Homework\homework 2.pdf` (assignment), `HW2.pdf` (example, a spam-clustering report from Feb 2025, so a style example only), the starter notebook, and the repo `be-prado/csci4521`, `2026/homework-2/rover-rescue` (README, assignment_student.md, rubric.md, rover_starter.py, run_demo.py, demo_data). Course grounding: lectures 1.1, 1.4, 2.3, 2.4 and the 2.3 and 2.4 notebooks.
## Requirements
### Must submit (Gradescope)
- [ ] Notebook `.ipynb`, saved with outputs, containing all code and every figure used in the report. A fresh run on the assigned dataset must reproduce results and predictions.
- [ ] Practice deployment image or animation (locally: save `show_practice_run(...).data` to an HTML file).
- [ ] `submission.csv` from `save_submission`, one row per mission row in CSV order. The PDF lists it as a deliverable and `assignment_student.md` calls it optional, so produce it.
- [ ] Report PDF, standalone, two pages maximum, with a compact comparison table and at least one readable figure.
### Must demonstrate (rubric, 100 points)
- [ ] Learning system and method choices (25): z-score normalization, k-means (3 clusters), 1-NN and kNN written in NumPy, calibration-based cluster naming, choices explained (initialization, stopping rule, empty clusters).
- [ ] Representation (15): sensor-scale analysis (4), PCA fitted correctly with the 95% component count (6), a useful PCA figure with a supported reading (5).
- [ ] Experiments (25): at least three configurations covering scaling, PCA and cluster versus kNN (8), one common held-out evaluation with correct fit and label boundaries (9), dimensions, accuracy, macro F1, sand recall and practice outcome for every configuration (8).
- [ ] Deployment (10): evidence-based model choice (4), stored transforms and predictor reused on mission plus a predicted mission map (4), documented practice run (2).
- [ ] Report (20): focused question (4), table, figure and conclusions (8), diagnosis including sand risk (5), evaluation protocol (3).
- [ ] Reproducibility (5): dependencies, exact run instructions, fresh run reproduces everything.
### Must not do
- Do not read `practice_truth.bin`; only `evaluate_practice` and `show_practice_run` touch it.
- Do not change `split_data` or its split.
- Do not use x, y as features.
- Do not fit normalization, PCA or k-means on validation rows, and never fit anything on mission data.
- Do not use validation labels to name clusters or train 1-NN.
- Do not replace the four required NumPy operations (normalization, nearest-centroid assignment, centroid update, kNN prediction) with library versions. Allowed from libraries: PCA, k-means initialization, classification metrics, plotting. The rubric says library implementations are eligible, but the PDF is stricter, so follow the PDF.
- Do not call validation scores an untouched test estimate, and do not call the practice run an accuracy estimate.
- Do not submit the dataset or truth files.
### Report must state
- [ ] Question, configurations compared and why.
- [ ] Number of components for 95% variance.
- [ ] What scaling and PCA changed, what cluster versus kNN showed, tied to the metrics. If methods tie, say so.
- [ ] Why the deployed model was chosen, how a missed sand cell changes the route or outcome, one failure, surprise, tie or limitation.
- [ ] Which rows were used for fitting, naming and validation, and how the fitted model was reused on mission.
- [ ] Observations kept apart from explanations.
### Rules
- Syllabus: cite AI assistants prominently and disclose assistance. Each assignment is supposed to carry a green, yellow or red AI level. It is not printed on the handout PDF or in the repo markdown, so it is unconfirmed (check Gradescope or Canvas). HW1 ended with a one-line AI disclosure, reuse that shape.
- Late policy: 24-hour grace day, nothing after.
## Work log
### 2026-10-27 Source reading and plan (no code run yet)
Everything below is reading and planning. No notebook cell has been executed and no result exists.
**Findings that change the plan**
- Dataset: the repo ships only `demo_data` (28x28 grid, 784 rows, `student_id: demo3`). The handout promises a personalized dataset. `save_submission` writes the config's `student_id` into every row, so a submission built on demo data carries the wrong id. Get the personalized bundle first. The starter output in the notebook came from demo data on Colab.
- Validation is only 30 rows (60 labeled training, stratified, `random_state=0`). One error moves accuracy by 3.3 points and sand recall by roughly 10 points, so ties are likely and the report should say so instead of inventing a winner.
- The planner blocks predicted sand, charges 1.0 for firm and 2.4 for rough, and the rover is stuck the first time its path crosses true sand. A missed sand cell (false negative) can end the run. A false sand cell only forces a detour, or NO ROUTE if enough of them wall off the goal. This asymmetry is the answer to "why missing sand matters".
- Lecture 2.3 gives the k-means wording the report must use: random or k-means++ initialization, stop when no label changes or at a maximum iteration count, run several starts and keep the lowest within-cluster variation (`inertia`). Empty-cluster handling is not covered in lecture or ISL, so it is my own choice and the report must say so.
- Lecture 2.4 gives the leakage rule (split first, fit PCA on training rows only), `explained_variance_ratio_`, and the elbow test. Lecture 1.1 gives z-score with training mean and standard deviation applied to new points.
- Macro F1 is not defined in the lectures (1.4 defines binary F1 only). Define it in the report as the unweighted mean of the three per-class F1 scores.
**Decision: Word, not LaTeX.** Two pages, one table, two composite figures, no equations that need typesetting and no bibliography (sources are the course lectures and the AI disclosure). Word reuses the HW1 flow (draft here, Paste Special as unformatted text, PDF export), which took one sitting. LaTeX (Overleaf, `hwTemplateML.tex`) would only help with float placement, and composite matplotlib figures remove that need. Switch to LaTeX only if the table cannot fit two pages in Word.
**Lessons carried from HW1** (Work log of [[20_Progress/Degree/CSCI 4521/Homework/Homework - 1|Homework - 1]]): the first AI-built version was replaced because it used hidden helper pipelines, plots nobody could trace and a report unlike the sample. This time: explicit NumPy loops in lecture style, every plot visible in the notebook, fixed seed, page count checked before polishing, and the environment settled before coding (the conda env `csci-4521` does not exist on this laptop, so Colab or `conda env create -f environment.yml`).
### Notebook design
Build in the supplied `Homework2_RoverRescue_student.ipynb`, after the starter cells, with one `BUNDLE_DIR` variable so the personalized data drops in without code changes. Seed `np.random.default_rng(4521)`.
- Cell group 1, scales (rubric 4): per-sensor mean, std, min, max on fit rows, std ratio between the largest and smallest sensor, and each sensor's share of mean squared distance in raw space. Expected finding to verify, not assume: one or two large-scale sensors dominate raw distance.
- Cell group 2, NumPy core: `zscore_fit/apply` (guard std of 0), `assign(X, C)` by broadcasting squared Euclidean distance, `update(X, labels, C)` centroid means, `kmeans(X, k=3, n_init=10, max_iter=300)` with k-means++ start, stop on no label change, keep the lowest inertia, count empty-cluster events, `knn(Xtr, ytr, X, k)` with ties broken by the nearest neighbor.
- Cell group 3, cluster naming: count calibration-training labels per cluster (contingency table), name each cluster by majority, require one-to-one names, otherwise take the best of the 6 permutations using training labels only. Show the table in the notebook and a purity line in the report.
- Cell group 4, PCA (rubric 15): sklearn PCA fitted on fit rows, raw and standardized. Smallest m with cumulative ratio at least 0.95 for both, curve with a 95% line, PC1 versus PC2 (fit rows gray, calibration-training points colored by terrain, so no validation label is plotted), static 3D PC1 to PC3 for the PDF, and an interactive Plotly version in the notebook as in lecture 2.4. Report the 95% count for the standardized data as the headline and the raw count beside it.
- Cell group 5, experiments (rubric 25): full grid of scaling (raw, z-score) by representation (8 sensors, PCA at 95% components) by model (k-means with 3 clusters, 1-NN), which is 8 configurations and changes one factor at a time. Optional extras if time allows: PCA with 2 components, kNN with k=3 and k=5, an elbow plot of inertia for k=2 to 8 on standardized fit rows to support the 3-cluster choice. Per configuration record dimensions, validation accuracy, macro F1, sand recall and `evaluate_practice` outcome with steps and predicted cost, using predictions for all 784 practice cells from the same fitted pipeline.
- Cell group 6, selection and deployment: rule fixed before running, so it cannot be fitted to the scores: highest validation macro F1, ties broken by higher sand recall, then by fewer dimensions. Practice outcome is recorded, not used to select. Keep the selected fitted objects (mean, std, PCA, centroids, names or training set), predict mission by transform then predict only, check mission z-scores against the fit statistics as a shift diagnostic, draw the predicted mission map, save `submission.csv`, save `practice_run.html` and a static route figure.
- Figures saved to `Code\Homework\figures\`: `fig1_pca.png` (variance curves, PC1 versus PC2, optionally PC1 to PC3) and `fig2_deploy.png` (practice map with route, mission map).
### 30-minute plan
The clock starts after the dataset is in place and the notebook is built. Three of these steps are blockers for starting and are not on the clock.
- Before the clock: confirm the Gradescope due date, confirm the AI-use level, get the personalized dataset.
- 0 to 3 min: open the notebook, point `BUNDLE_DIR` at the personalized folder, check the printed shapes (fit 754 if the grid is 28x28, 60 training, 30 validation).
- 3 to 10 min: Restart and Run All. Fix any error before reading numbers. Confirm the 8-row table is complete and the selection rule picked a row.
- 10 to 14 min: copy the numbers into the report draft below. Cross-check each against the notebook output, never from memory.
- 14 to 24 min: Word. Paste Special as unformatted text, set the page, insert the two figures, build the table, check two pages. Export PDF and reopen it.
- 24 to 30 min: upload notebook (with outputs), PDF, `submission.csv`, practice HTML or PNG. Record the timestamp under `### Submission`.
### Report draft (fill every bracket from notebook output, nothing from memory)
HW 2: Rover Rescue
Anant Gupta
October 2026
1. Question and configurations. How much do scaling and PCA change a terrain map built from eight sensors, and does a cluster-based classifier trained with 60 labels match 1-NN? I compared [n] configurations: scaling (raw or z-score), representation (8 sensors or PCA with [m] components), and model (k-means with 3 clusters named from calibration labels, or 1-NN). Each changes one factor from another, so differences can be attributed.
2. Evaluation protocol. Normalization, PCA and k-means were fitted on the [754] fit rows (all practice rows except the 30 validation rows, no labels used). The 60 calibration-training labels named the clusters and trained 1-NN. The same 30 validation rows scored every configuration. I selected the deployed model on these 30 rows, so its score is a selection score, not an untouched test score. The practice rover run only demonstrates deployment. The mission data was transformed with the stored mean, standard deviation and PCA and then predicted, never fitted on.
3. Evidence. Sensor scales differ by [ratio] (sensor [a] std [x], sensor [b] std [y]) and sensor [a] supplies [p]% of raw squared distance, so raw distances mostly measure one sensor. PCA needs [m_std] components for 95% of the variance after z-scoring and [m_raw] on raw data (Figure 1a). Figure 1b shows [observation about class structure in PC1 and PC2]. Table 1 lists all configurations. [Two or three sentences: effect of scaling holding the rest fixed, effect of PCA holding the rest fixed, cluster versus 1-NN holding the rest fixed. Report ties as ties. With 30 validation rows one error is 3.3 points.]
Table 1: dimensions, validation accuracy, macro F1, sand recall and practice outcome for each configuration.
4. Decision and sand risk. I deployed [config] because [rule result]. [Number] of [number] validation sand cells were missed. A missed sand cell is predicted firm or rough, so the planner treats it as passable and the rover is stuck the first time its route crosses it, while a false sand prediction only adds a detour. [Practice outcome with steps and predicted cost, Figure 2.]
5. Failure and limitation. [One real observation from the run: a stuck cell and which sensor values it had, a tie, a cluster that mapped to two terrains, or mission sensor statistics that differ from the fit rows by [x] standard deviations.] Possible explanation, labeled as such: [...]. The 30-row validation set limits how finely models can be ranked.
AI use: [Claude Code (Anthropic) and the course repo's starter helped with the code and the draft. Fill in the actual tools used.] I ran the notebook, checked every number, and am responsible for this work.
### Word assembly
Same flow as HW1 (Times New Roman 12 pt, Letter, 1 inch margins) but check the page count first. If it spills past two pages, shrink Figure 1 and Figure 2 widths, then margins to 0.8 inch, then 11 pt, in that order. Copy the draft from source mode, Paste Special as unformatted text, bold the section titles, center the three title lines, build Table 1 as a real Word table at 9 to 10 pt.
### Blockers
> [!WARNING]
> Three facts only the user can confirm: the due date on Gradescope, the AI-use level for this assignment, and where the personalized dataset lives. Nothing should be built into the final submission until the dataset is found.

### Submission
Not submitted yet.
## Concepts used
Planned, not yet used. Roles are what each will do in this homework.
- [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 12|ISL Chapter 12]]: PCA (§12.2) gives the 95% component count and the variance curve, k-means (§12.4) gives the local-optimum and multiple-start argument.
- [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]]: kNN and the bias-variance trade-off, used to explain 1-NN on raw versus reduced features.
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 5|Week - 5]] and [[20_Progress/Degree/CSCI 4521/Weekly/Week - 6|Week - 6]]: PCA with kNN, the leakage rule, k-means initialization and stopping choices.
- [[20_Progress/Degree/CSCI 4521/Homework/Homework - 1|Homework - 1]]: z-score from training statistics, precision, recall and F1 definitions, and the report format.
## Post-submit reflection
<!-- Optional until feedback: the first failure, the pattern, and what to change. -->
