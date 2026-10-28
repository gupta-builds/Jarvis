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
next: "Build the 2-page Word report from the Report draft below (Table 1 from figures/hw2_configs.csv, Figure 1 and 2 from figures/), export PDF, check 2 pages, then upload the PDF, CSCI4521_HW2.ipynb, submission.csv and practice_run.html to Gradescope before 11 pm on 2026-10-27."
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
- Syllabus: cite AI assistants prominently and disclose assistance. Each assignment is supposed to carry a green, yellow or red AI level. The handout PDF and repo markdown print none. The user states AI use is allowed as much as possible on this course, so treat it as green but unverified. The disclosure, including how much AI was used, goes at the bottom of the report and of the notebook.
- Late policy: 24-hour grace day, nothing after.
## Work log
### 2026-10-27 Notebook rebuilt in course style and run
Rebuilt after reading the CSCI 4041 projects and the 4521 lectures, notebooks and ISL chapter 12 in depth. `Code\Homework\CSCI4521_HW2.ipynb` (40 cells) copies every starter cell unchanged, adds one marked `BUNDLE_OVERRIDE` cell, then holds: methods with time and memory cost in each docstring, a testing section, representation, 11 configurations, selection, deployment, export, a summary and an AI-use note. Executed top to bottom with nbconvert in a scratch Python 3.14 venv (numpy 2.5.4, pandas 3.1.0, scikit-learn 1.9.1, matplotlib 3.11.2): no errors, every assert passed. Written next to it: `submission.csv` (784 rows, student_id `demo3`), `practice_run.html`, `figures/fig1_pca.png`, `figures/fig2_deploy.png`, `figures/hw2_configs.csv`. Both figures were opened and read.
Changes from the first build, and why:
- k-means now follows ISL Algorithm 12.2 and lecture 2.3 slide 10 literally: a random cluster number for every point, then centroids and nearest-centroid reassignment until no label changes, best of 10 random starts. The first build used k-means++ seeds, which the handout allows but the course does not teach. No headline result changed with the switch.
- kNN distances use one matrix product (O(m n d) time, O(m n) memory) and `argpartition` for k above 1 instead of a full sort. 1-NN equals the lecture 1.1 loop on all 30 validation rows, raw and z-scored.
- Testing section asserts: the k-means objective never rises (ISL 12.18), final centroids are member means, clusters partition the data (lecture 2.3 slide 17), z-score gives mean 0 and std 1, PCA components are orthonormal, PCA variance equals the squared singular values (lecture 2.4). sklearn is only a cross-check: k-means objective 1237.50 in both, kNN agrees at k=1, 3 and 5.
- Added: stability over 20 single random starts, a cost check, and fit and predict times.
Evidence (demo bundle, the only data available):
- Split: fit 754, calibration-training 60 (20 per class), validation 30 (10 per class).
- Scales: std runs from 0.040 (sensor_6) to 52.4 (sensor_4), a ratio of 1,320. Sensors 4 and 2 supply 92.27% of raw squared distance (81.9% and 10.4%). After z-scoring each supplies 12.5%.
- PCA: 95% needs 3 components after z-scoring (cumulative 0.9546; PC1 64.1%, PC2 27.1%, PC3 4.3%) and 2 on raw data (0.9824; PC1 alone 88.4%). Fig 1b shows three separated groups in PC1 and PC2 that line up with firm, rough and sand.
- Experiments (validation accuracy, macro F1, sand recall, practice): raw 8 sensors k-means 0.700, 0.704, 0.5, stuck at step 20. Raw 8 sensors 1-NN 0.933, 0.935, 0.9, success (cost 72.2). Raw PCA 2 k-means 0.700, 0.704, 0.5, stuck at step 20. Raw PCA 2 1-NN 0.867, 0.868, 0.9, success (cost 76.4). Every z-score configuration (8 sensors, PCA 3, PCA 2, k-means, 1-NN, 3-NN) scored 1.000, 1.000, 1.0 and succeeded with 54 steps and cost 70.8.
- k-means: no empty clusters in any run, every run converged (5 to 10 iterations), majority naming was one-to-one everywhere. Z-score clusters are pure on the 60 training labels (20, 20, 20). Raw k-means mixes them: the cluster named sand holds 12 sand, 11 rough and 4 firm training points. Elbow objective: k=2 2652, k=3 1238, k=4 1086.
- Stability: with one random start, 15 of 20 starts reach the best objective on z-scored 8 sensors and only 2 of 20 on raw 8 sensors. That is why the best of 10 starts is kept. On z-scored data the 5 worse starts also change the validation predictions (15 of 20 identical); on raw data all 20 give identical validation predictions.
- Cost check (noisy, machine dependent): assign_nearest time grows 3.1x and 3.9x when n grows 4x (n 754, 3016, 12064) and about 10x at n 48256, which is a memory effect and not the linear growth the O(n k d) count predicts. A k-means start takes about 1 ms and shows no speedup from 8 to 3 to 2 dimensions at n 754, because call overhead dominates at this size. Do not claim PCA saves time on this dataset.
- Selection by the pre-set rule picked E1 (z-score, PCA 2, k-means). Seven configurations tie at the top (E1, E2, C7, C8, C3, C4, E3). Only the dimension count separated E1 from the rest of that group, and E1 ties E2 on every metric, so the choice between them came from table order.
- Failure: raw k-means (and raw PCA k-means) stopped at (y=13, x=4) after 20 steps where it predicted rough and the simulator reports sand. Validation confusion: 5 of 10 sand cells predicted rough.
- Mission: largest mean shift in fit-row standard deviations 0.243. Predicted shares firm 46.0%, rough 26.9%, sand 27.0% against 34.8%, 38.1% and 27.0% on the practice grid. Mission route cost 52.0.
### Dataset question
- The bundle is five files: `development.csv` (784 rows, a 28x28 grid: y, x and eight sensors), `calibration.csv` (90 labeled locations, 30 per terrain), `mission.csv` (784 unlabeled rows), `config.json` (grid, start and goal cells, student_id, assignment_version 2) and `practice_truth.bin` (simulator only).
- We do not create it. The instructor issues it. The PDF says "You will receive a personalized dataset", while the repo README and `assignment_student.md` say "Use demo_data/ ... you do not collect or generate your own data". The only bundle available is `demo_data` with student_id `demo3`. A search of this machine, Gmail and Drive on 2026-10-27 found no other bundle. Where a personalized one would come from is unknown: check the Gradescope assignment page and Canvas, then ask the instructor or a TA (private Piazza post or email).
- Nothing in the handout, rubric or repo says the data is tuned for a perfect score. What the demo bundle itself shows: sensor scales differ by 1,320x and the z-scored terrains separate cleanly, so it makes scaling matter and is solvable. The rubric says an imperfect classifier or a stuck rover can earn full credit, and no points depend on hidden mission success.
### 2026-10-27 Source reading and plan
All reading and planning, done before the notebook existed.
**Findings that change the plan**
- Dataset: the repo ships only `demo_data` (28x28 grid, 784 rows, `student_id: demo3`). The handout promises a personalized dataset. `save_submission` writes the config's `student_id` into every row, so a submission built on demo data carries the wrong id. Get the personalized bundle first. The starter output in the notebook came from demo data on Colab.
- Validation is only 30 rows (60 labeled training, stratified, `random_state=0`). One error moves accuracy by 3.3 points and sand recall by roughly 10 points, so ties are likely and the report should say so instead of inventing a winner.
- The planner blocks predicted sand, charges 1.0 for firm and 2.4 for rough, and the rover is stuck the first time its path crosses true sand. A missed sand cell (false negative) can end the run. A false sand cell only forces a detour, or NO ROUTE if enough of them wall off the goal. This asymmetry is the answer to "why missing sand matters".
- Lecture 2.3 gives the k-means wording the report must use: random or k-means++ initialization, stop when no label changes or at a maximum iteration count, run several starts and keep the lowest within-cluster variation (`inertia`). Empty-cluster handling is not covered in lecture or ISL, so it is my own choice and the report must say so.
- Lecture 2.4 gives the leakage rule (split first, fit PCA on training rows only), `explained_variance_ratio_`, and the elbow test. Lecture 1.1 gives z-score with training mean and standard deviation applied to new points.
- Macro F1 is not defined in the lectures (1.4 defines binary F1 only). Define it in the report as the unweighted mean of the three per-class F1 scores.
**Decision: Word, not LaTeX.** Two pages, one table, two composite figures, no equations that need typesetting and no bibliography (sources are the course lectures and the AI disclosure). Word reuses the HW1 flow (draft here, Paste Special as unformatted text, PDF export), which took one sitting. LaTeX (Overleaf, `hwTemplateML.tex`) would only help with float placement, and composite matplotlib figures remove that need. Switch to LaTeX only if the table cannot fit two pages in Word.
**Lessons carried from HW1** (Work log of [[20_Progress/Degree/CSCI 4521/Homework/Homework - 1|Homework - 1]]): the first AI-built version was replaced because it used hidden helper pipelines, plots nobody could trace and a report unlike the sample. This time: explicit NumPy loops in lecture style, every plot visible in the notebook, fixed seed, page count checked before polishing, and the environment settled before coding (the conda env `csci-4521` does not exist on this laptop, so Colab or `conda env create -f environment.yml`).
### Rubric coverage
Where each rubric line is met in `CSCI4521_HW2.ipynb`. "Met" means the evidence exists in the executed notebook, not that points are guaranteed.
| Rubric line | Notebook location | Evidence |
| --- | --- | --- |
| Learning system and method choices (25) | Part 1 methods, Part 4 | z-score, nearest-centroid, centroid update, k-means loop (ISL 12.2), cluster naming from the 60 labels, kNN, all in NumPy; initialization, stopping rule and empty-cluster handling written in the text and counted in the output |
| Sensor scales (4) | Part 3 first table | std range 1,320x, share of raw squared distance per sensor |
| PCA and 95% count (6) | Part 3 PCA cells | fitted on fit rows only, counts 3 (z-score) and 2 (raw), loadings, variance table |
| PCA figure and reading (5) | `figures/fig1_pca.png` | cumulative variance, top 2 and top 3 components, three groups visible |
| At least three configurations (8) | Part 4 | 11 configurations, full scaling by PCA by model grid plus extras |
| Common held-out evaluation and boundaries (9) | Setup cell, Part 4 | asserts for disjoint fit and validation rows, same 30 validation rows for every row of the table, labels used only for naming and 1-NN |
| Dimensions, accuracy, macro F1, sand recall, practice outcome (8) | Part 4 table, `figures/hw2_configs.csv` | all five recorded per configuration, plus timing |
| Model choice, reuse, mission map, practice run (10) | Parts 5 and 6, `practice_run.html`, `figures/fig2_deploy.png` | selection rule fixed first, stored objects reused, mission map and route, practice HTML |
| Report (20) | Word report, still a draft | Report draft below, max two pages, sand risk and limitations included |
| Reproducibility (5) | header cell, Summary cell | dependencies, run steps, fixed seed, versions printed, Restart and Run All verified once |
### Remaining steps to submit
Done already: notebook run with outputs, both figures, `submission.csv`, `practice_run.html`. Left, in order:
- Before anything is uploaded: check the Gradescope due date, and ask the instructor or a TA whether a personalized bundle exists (see Dataset question). The report and notebook both end with an AI-use disclosure; it is only true if you open the notebook and check the numbers yourself.
- 2 min: open `CSCI4521_HW2.ipynb`, confirm the outputs show and the tables match the Work log above. Do not re-run unless the dataset changes.
- 12 min: Word. Paste the Report draft as unformatted text, insert Figure 1 and Figure 2 from `Code\Homework\figures\`, build Table 1 from the rows below.
- 5 min: export PDF, reopen it, confirm two pages and that every number matches `figures/hw2_configs.csv`.
- 3 min: upload `CSCI4521_HW2.ipynb`, the PDF, `submission.csv`, `practice_run.html`. Do not upload `rover-rescue-download/` (it holds the dataset and the truth file). Record the time under `### Submission`.
### Report draft
HW 2: Rover Rescue
Anant Gupta
October 2026
1. Question and configurations. How much do scaling and PCA change a terrain map built from eight sensors, and does a 3-cluster k-means classifier that borrows terrain names from 60 labels match 1-NN? I compared eleven configurations (Table 1). Eight form a grid of scaling (raw or z-score), representation (all 8 sensors or the PCA components keeping 95% of the variance) and model (k-means or 1-NN), so neighbors in the grid differ in one factor. Three extras use PCA with 2 components and 3-NN. My k-means is a NumPy loop that follows ISL Algorithm 12.2: a random cluster number for every point, then centroids and nearest-centroid reassignment until no label changes (cap 300 iterations), keeping the best of 10 random starts by within-cluster sum of squares; an empty cluster would be re-seeded at the farthest point (it never happened). One start is not enough: on z-scored data 15 of 20 single starts reached the best objective, and on raw data only 2 of 20. Clusters take the majority label of the 60 calibration-training points, which was one-to-one in every case. Three clusters match the three terrains, and the elbow agrees: within-cluster sum of squares drops from 2652 at k=2 to 1238 at k=3 and only to 1086 at k=4.
2. Evaluation protocol. Normalization, PCA and k-means were fitted on the 754 fit rows (every practice row except the 30 validation rows, no labels used). The 60 calibration-training labels (20 per terrain) named clusters and trained 1-NN. All configurations were scored on the same 30 validation rows (10 per terrain), where one error is 3.3 points. I selected the deployed model on these rows, so its score is a selection score, not an untouched test score, and the practice rover run shows deployment rather than accuracy. The mission grid was transformed with the stored mean, standard deviation and PCA and then predicted, never fitted on.
3. Evidence. Sensor standard deviations range from 0.040 (sensor_6) to 52.4 (sensor_4), a factor of 1,320, and sensors 4 and 2 supply 92.3% of raw squared distance, so raw distances mostly measure two sensors. PCA keeps 95% of the variance with 3 components after z-scoring (95.5%) and with 2 on raw data (98.2%), but raw PC1 alone holds 88.4%, which restates the scale problem (Figure 1a). In PC1 and PC2 the data form three groups that line up with the labeled firm, rough and sand points (Figure 1b).
Scaling mattered most. Holding model and representation fixed, z-scoring raised k-means accuracy from 0.700 to 1.000 and 1-NN from 0.933 to 1.000 on 8 sensors. Raw k-means found 5 of 10 validation sand cells, and its cluster named sand held 12 sand, 11 rough and 4 firm training points; after z-scoring all three clusters were pure (20, 20, 20). PCA changed little: on z-scored data 8 sensors, 3 components and 2 components all scored 1.000, while on raw data it lowered 1-NN from 0.933 to 0.867 (two more errors). Cluster and 1-NN tied at 1.000 on every z-scored configuration; on raw data 1-NN beat k-means (0.933 against 0.700). A possible explanation, not tested here: with raw scales k-means partitions mostly along sensor_4, while 1-NN uses the 60 labels locally.
Table 1: dimensions, validation accuracy, macro F1, sand recall and practice rover outcome for each configuration (macro F1 is the unweighted mean of the three per-class F1 scores).
Figure 1: (a) cumulative explained variance, (b) PC1 and PC2, (c) PC1 to PC3 of the z-scored fit rows, labeled training points in color.
4. Decision and sand risk. Seven configurations tie at 1.000 accuracy, macro F1 and sand recall (C3, C4, C7, C8, E1, E2, E3), so validation cannot rank them. My rule, set before running, was highest macro F1, then sand recall, then fewer dimensions, then table order. It picked E1 (z-score, PCA with 2 components, k-means), which differs from E2 only by table order, so I report a tie and not a winner. E1 uses 2 dimensions and needs the labels only to name three clusters. Its practice route succeeded in 54 steps at predicted cost 70.8, the same as the other six (Figure 2). A missed sand cell is predicted firm or rough, so the planner treats it as passable and the rover stops the first time its route crosses it, while a false sand prediction only blocks a cell and adds a detour. Raw k-means shows the cost: it called 5 of 10 sand cells rough and its rover stopped at step 20, at (y=13, x=4), where it predicted rough and the simulator reported sand. Raw 1-NN also missed 1 of 10 validation sand cells yet reached the goal, so that cell was not on its route: a miss matters only when the path crosses it.
Figure 2: practice map with the planned route and predicted mission map with its planned route, from the selected model.
5. Limitations. Thirty validation rows cannot separate seven perfect models, and a perfect score on them does not mean the model is perfect; one successful practice route is a demonstration. The z-scored mission rows sit within 0.25 standard deviations of the fit-row mean on every sensor (standard deviations 0.91 to 1.08), so I saw no sensor drift. Even so the predicted mission mix differs (firm 46.0%, rough 26.9%, sand 27.0% against 34.8%, 38.1% and 27.0% on practice), and without mission labels I cannot say whether that is a real regional difference or a model error.
AI use: AI use is allowed in this course and I used it heavily. Anthropic Claude Code read the course materials, wrote the notebook code, ran the experiments and drafted this report. I directed the work, checked the results against the assignment, and am responsible for what I submit.
### Table 1 rows
| ID | Scaling | Representation (dims) | Model | Accuracy | Macro F1 | Sand recall | Practice rover |
| --- | --- | --- | --- | --- | --- | --- | --- |
| C1 | raw | 8 sensors (8) | k-means | 0.700 | 0.704 | 0.50 | stuck, step 20 |
| C2 | raw | 8 sensors (8) | 1-NN | 0.933 | 0.935 | 0.90 | success, 54 steps |
| C3 | z-score | 8 sensors (8) | k-means | 1.000 | 1.000 | 1.00 | success, 54 steps |
| C4 | z-score | 8 sensors (8) | 1-NN | 1.000 | 1.000 | 1.00 | success, 54 steps |
| C5 | raw | PCA 95% (2) | k-means | 0.700 | 0.704 | 0.50 | stuck, step 20 |
| C6 | raw | PCA 95% (2) | 1-NN | 0.867 | 0.868 | 0.90 | success, 54 steps |
| C7 | z-score | PCA 95% (3) | k-means | 1.000 | 1.000 | 1.00 | success, 54 steps |
| C8 | z-score | PCA 95% (3) | 1-NN | 1.000 | 1.000 | 1.00 | success, 54 steps |
| E1 | z-score | PCA 2 (2) | k-means | 1.000 | 1.000 | 1.00 | success, 54 steps |
| E2 | z-score | PCA 2 (2) | 1-NN | 1.000 | 1.000 | 1.00 | success, 54 steps |
| E3 | z-score | 8 sensors (8) | 3-NN | 1.000 | 1.000 | 1.00 | success, 54 steps |
### Word assembly
This report is longer than the two-page limit allows at HW1 settings, so use these from the start: Times New Roman 10.5 pt, Letter, 0.75 inch margins, single spacing, 3 pt after paragraphs. Figure 1 about 6.8 in wide, Figure 2 about 4.6 in wide, Table 1 at 9 pt. Page count is untested in Word, so check it. If it spills, shrink Figure 2 first, then cut sentence by sentence from section 3 (the explanation sentences), not the table or the protocol, because the rubric scores both. Copy from source mode, Paste Special as unformatted text, bold the section titles, center the three title lines, and put each figure directly above its caption.
### Blockers
> [!WARNING]
> Open before upload: the Gradescope due date, and whether the course issues a personalized bundle (see Dataset question). If one exists, set `BUNDLE_OVERRIDE`, run everything again, and refill every number in the Report draft and Table 1 from the new output. The Word report stays a draft until the code, dataset and images are final.

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
