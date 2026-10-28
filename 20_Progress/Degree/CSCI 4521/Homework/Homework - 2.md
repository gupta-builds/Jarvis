---
type: class
class_kind: homework
status: sprout
created: 2026-10-26
updated: 2026-10-27
deadline: 2026-10-27
tags:
  - class
  - homework
area:
  - "[[CSCI 4521 Board]]"
next: "Build the Word report from the Report draft (page break before Table 1, figures from Code/Homework/figures), export the PDF, confirm 2 pages, then upload the 4 files listed under Submit to Gradescope before 11 pm on 2026-10-27."
---
# Homework - 2
## Overview
Rover Rescue (CSCI 4521 HW2): build a terrain classifier from eight sensors (firm, rough, sand), compare scaling, PCA and k-means against 1-NN, deploy one fitted model on the practice and mission grids, and explain the evidence in a standalone report of at most two pages. The grade is the 100-point `rubric.md` in the course repo, not the 10, 20 and 10 points printed in the PDF. No extra credit is offered in the handout, the repo markdown or the rubric.
Deadline: 11 pm on 2026-10-27, as the user stated it. Confirm on the Gradescope assignment page: the Board's schedule listed HW2 for 10/20, the handout says "check Gradescope", and the repo folder was committed 2026-10-22.
Status 2026-10-27: the notebook, both figures, `submission.csv` and the practice HTML are final and tested. Left: the Word report and its PDF, then the upload.
## Requirements
### Submit
The handout lists four deliverables. Upload exactly these four, from `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\`:
- [ ] `CSCI4521_HW2.ipynb`, saved with outputs (code and every figure used in the report)
- [ ] `practice_run.html`, the practice deployment animation (the same run appears as a static map in Figure 2 of the report)
- [ ] `submission.csv`, from `save_submission`, 784 rows in mission.csv order, `student_id` demo3 (the instructor says to leave it)
- [ ] the report PDF (export from Word, two pages at most)
Do not upload: the `rover-rescue-download/` folder (it holds the dataset and `practice_truth.bin`), the starter notebook `Homework2_RoverRescue_student.ipynb`, `figures/` files as separate items, or any HW1 file.
How: Gradescope, CSCI 4521, Homework 2, upload. Whether the page has one multi-file slot or four slots is unverified, so read the page first. After uploading, open each file in the Gradescope preview and keep the confirmation.
### Must not do
- Do not read `practice_truth.bin`; only `evaluate_practice` and `show_practice_run` touch it.
- Do not change `split_data` or its split.
- Do not use x, y as features.
- Do not fit normalization, PCA or k-means on validation rows, and never fit anything on mission data.
- Do not use validation labels to name clusters or train 1-NN.
- Do not replace the four required NumPy operations (normalization, nearest-centroid assignment, centroid update, kNN prediction) with library versions.
- Do not call the validation score an untouched test estimate, or the practice run an accuracy estimate.
### Report must state
- [ ] Question, the configurations compared and why.
- [ ] The component count for 95% variance.
- [ ] What scaling and PCA changed and what cluster versus kNN showed, tied to the metrics. A tie is reported as a tie.
- [ ] Why the deployed model was chosen, how a missed sand cell changes the route, and one failure, surprise, tie or limitation.
- [ ] Which rows were used for fitting, naming and validation, and how the fitted model was reused on mission.
- [ ] Observations kept apart from explanations. The AI-use note sits at the bottom.
### Rules
- Piazza, instructor Ebasa Temesgen (relayed by the user 2026-10-27): the dataset is the supplied `demo_data` folder, the starter notebook loads it, and `student_id` demo3 is copied into `submission.csv` and stays unchanged. This replaces the PDF's "personalized dataset" wording.
- Piazza, instructor Bernardo Bianco Prado: sklearn is fine for k-means computation. The handout still says to assemble your own k-means loop and the rubric awards 25 points for correct k-means, so the notebook uses its own loop and keeps `KMeans` only as a cross-check. That satisfies both readings.
- Piazza, a student: `save_submission(predictions, BUNDLE_DIR)` at the end of the notebook writes `submission.csv`.
- AI: the user states AI use is allowed as much as possible in this course, so treat it as green but unverified (the handout prints no level). The disclosure with how much AI was used sits at the bottom of the report and of the notebook.
- Late policy: 24-hour grace day, nothing after.
## Work log
### 2026-10-27 Final state and tests
`Code\Homework\CSCI4521_HW2.ipynb` has 46 cells: the starter cells unchanged, then eight short sections (setup, NumPy methods, checks, representation, experiments, selection, deployment, export), a summary and an AI-use note. About 425 words of prose in total. k-means follows ISL Algorithm 12.2 and lecture 2.3 (random cluster for every point, centroids and reassignment until nothing changes, best of 10 random starts). Code style follows the CSCI 4041 projects: a docstring with time cost on every function, comments on each step, and assert-based checks.
Tests run, all on the final file in the user's `csci-4521` env (Python 3.12.14, numpy 2.5.3, pandas 3.0.6, scikit-learn 1.9.1, matplotlib 3.11.2):
- The user re-ran the notebook in that env (Restart and Run All, execution counts 1 to 28 in order, no errors). Its `submission.csv`, results table and both figures were byte-identical to my earlier Python 3.14 runs, so the results do not depend on the environment. After that I added tests and ran the final file in the same env: execution counts 1 to 32 in order, no error or stderr output, outputs unchanged.
- Check cells, all assert-based. A general block: fit and validation rows are disjoint, grid order is row-major, z-score has mean 0 and std 1, vectorized distances and 1-NN equal the lecture 1.1 loop on raw and z-scored data, k-means clusters partition the data and converge, the objective never rises and centroids equal member means, PCA components are orthonormal and its variance equals the squared singular values, sklearn cross-checks. A unit block with a hand-worked case for every method: constant sensor, 3-4-5 triangle, empty-cluster re-seed, within-cluster sum, exact recovery of three blobs, the iteration cap, the best start being kept, naming by majority and by the one-to-one fallback. A reference block: kNN for k = 1, 3, 5, 7 on raw and z-scored data against a lecture-style loop, the nearest-neighbor tie-break, and metrics on the lecture 1.4 COVID example (precision 0.5, recall 0.75, F1 0.6, accuracy 0.8). A pipeline block: stored z-score and PCA, repeatable fits, every table value against sklearn accuracy and a direct sand recall. A drawing check for a stuck rover and a blocked goal.
- Coverage (coverage.py on the executed notebook): the check cells alone run 237 of 237 lines and 28 of 28 branches of my code, with all 18 functions fully covered. The whole notebook runs 470 of 470 lines and 58 of 58 branches.
- Mutation test: 14 deliberate bugs (distance sign flipped, argmin to argmax, wrong centroid divisor, dropped square, convergence never detected, worst start kept, worst naming permutation, transposed table, neighbors ordered farthest first, F1 without the factor 2, sand recall read from the wrong class, and others). The checks caught all 14. The first round caught 13; the survivor, "keep the worst random start", exposed a missing check, and the raw-features best-start check now covers it.
- Defect found by the new tests: ties in the empty-cluster re-seed were broken by an unstable sort. Fixed with a stable sort. No run ever produced an empty cluster, so no result changed.
- Clean-directory run (fresh clone, 14 seconds): byte-identical outputs. `practice_run.html` is identical apart from random element ids and holds 55 embedded frames.
- pyflakes finds no unused names or imports in my cells, pycodestyle at 120 columns is clean, no stderr output anywhere, no em or en dashes.
- Every number in the report draft was compared with the executed output. One wording fix came out of it (the mission standard deviation range).
- Layout estimate with PyMuPDF (Times 10.5 pt, 0.75 in margins, the real figure files, page break before Table 1): 2 pages, page 2 ends at about 89% of its height.
Not tested: Word itself, the Gradescope upload, and a Colab run.
Evidence (demo bundle, the confirmed dataset):
- Split: fit 754, calibration-training 60 (20 per class), validation 30 (10 per class).
- Scales: std runs from 0.040 (sensor_6) to 52.4 (sensor_4), a ratio of 1,320. Sensors 4 and 2 supply 92.27% of raw squared distance. After z-scoring each supplies 12.5%.
- PCA: 95% needs 3 components after z-scoring (cumulative 0.9546; PC1 64.1%, PC2 27.1%, PC3 4.3%) and 2 on raw data (0.9824; PC1 alone 88.4%). Three separated groups show in PC1 and PC2.
- Raw k-means and raw PCA k-means: validation accuracy 0.700, macro F1 0.704, sand recall 0.5 (5 of 10), rover stuck at step 20 at (y=13, x=4) where it predicted rough. The cluster named sand holds 12 sand, 11 rough and 4 firm training points.
- Raw 1-NN 0.933 and raw PCA 1-NN 0.867, both sand recall 0.9 and both reach the goal. Every z-score configuration scores 1.000 on accuracy, macro F1 and sand recall and reaches the goal in 54 steps at cost 70.8.
- Seven configurations tie at the top. The pre-set rule (macro F1, then sand recall, then fewer dimensions, then table order) picked E1 (z-score, PCA 2, k-means), tied with E2 on every metric.
- One random start is not enough: 15 of 20 single starts reach the best objective on z-scored data, 2 of 20 on raw data. Elbow objective: k=2 2652, k=3 1238, k=4 1086.
- Mission: largest mean shift 0.243 fit-row standard deviations. Predicted shares firm 46.0%, rough 26.9%, sand 27.0% against 34.8%, 38.1% and 27.0% on practice. Mission route cost 52.0.
- PCA does not save time here: a k-means start takes about 1 ms at 8, 3 and 2 dimensions. The report makes no speed claim.
### Decisions
- Word, not LaTeX: two pages, one table, two figures, no equations, no bibliography. Switch only if the table cannot fit.
- The deployment figure is a function so the checks can draw a stuck rover and a blocked goal. The notebook stores a generic `python3` kernel name so any Jupyter or Colab opens it without a missing-kernel prompt.
- Figures were regenerated at print size (7.25 in and 5.34 in wide at 300 dpi) so that text stays readable when inserted at full width. The first versions were 11 and 9 inches wide and would have shrunk to about 5 pt.
- The `BUNDLE_OVERRIDE` cell was removed after the Piazza answer, and the timing-scaling cell was dropped because its noisy ratios supported no claim.
- Selection rule fixed before any result: macro F1, then sand recall, then fewer dimensions, then table order. The practice outcome is recorded, not used to select.
### Rubric coverage
"Met" means the evidence exists in the executed notebook, not that points are guaranteed.
| Rubric line | Where | Evidence |
| --- | --- | --- |
| Learning system and method choices (25) | notebook 2 Methods, 5 Experiments | z-score, nearest-centroid, centroid update, own k-means loop, cluster naming from the 60 labels, kNN, all NumPy; initialization, stopping rule and empty clusters stated and counted |
| Sensor scales (4) | notebook 4, first table | std range 1,320x, share of raw squared distance per sensor |
| PCA and 95% count (6) | notebook 4, PCA table | fitted on fit rows only, 3 (z-score) and 2 (raw) |
| PCA figure and reading (5) | `figures/fig1_pca.png`, report 3 | variance curve, top 2 and top 3 components |
| Three or more configurations (8) | notebook 5 | 11 configurations, full grid plus extras |
| Common held-out evaluation, boundaries (9) | notebook 1 Setup, 5 | asserts, same 30 validation rows, labels only for naming and 1-NN |
| Dimensions, accuracy, macro F1, sand recall, practice (8) | notebook 5 table, `figures/hw2_configs.csv`, Table 1 | all five per configuration |
| Model choice, reuse, mission map, practice run (10) | notebook 6 and 7, `practice_run.html`, `figures/fig2_deploy.png` | rule fixed first, stored objects reused, mission map and route |
| Report (20) | Word report | draft below: question, table, figures, sand risk, protocol, limitations |
| Reproducibility (5) | notebook header and Summary | dependencies, run steps, seed, versions, clean-directory run verified |
### Word report layout
The two-page limit is the one rubric line that cannot be verified until Word runs, so follow these settings from the start.
- Page: Letter, 0.75 in margins, one column. Times New Roman 10.5 pt, single spacing, 3 pt after paragraphs, 0 before, body justified.
- Optional page header (HW1 used one): `CSCI 4521`, tab, `Anant Gupta`, tab, `October 27, 2026`, 9 pt, bottom border.
- Title block: three centered bold lines, `HW 2: Rover Rescue`, `Anant Gupta`, `October 2026`.
- Each numbered paragraph starts with its title in bold (`1. Question and configurations.`), then the text in normal weight.
- Order: title block, sections 1 and 2, section 3 first paragraph, Figure 1, section 3 second paragraph, a page break, Table 1, section 4, Figure 2, section 5, the AI-use line.
- Figure 1: `figures/fig1_pca.png`, Insert, Pictures, In Line with Text, centered, 7.0 in wide with the aspect ratio locked. Caption below, 9.5 pt, centered.
- Figure 2: `figures/fig2_deploy.png`, same way, 4.3 in wide.
- Table 1: paste the tab-separated block below, Insert, Table, Convert Text to Table with 8 columns. 8.5 pt, header row bold with a rule above and below, light rule under each row, text columns left, number columns centered, caption below.
- Copy the text from source mode (Ctrl+E in Obsidian) and use Paste Special, Unformatted Text. Remove the bracketed notes.
- Export: File, Save As, PDF (Standard). Reopen the PDF and check: two pages, page 2 ends with the AI-use line and about half an inch or more of space, text is selectable, both figures are sharp and their labels readable, Table 1 sits whole on page 2.
- If it spills past two pages, do these in order and stop when it fits: Figure 2 to 3.8 in, margins to 0.7 in, body to 10 pt, drop the elbow numbers from section 1. Never cut the protocol, the sand-risk paragraph, the limitations or Table 1; the rubric scores them.
- Before export, check each number against `figures/hw2_configs.csv` and the notebook Summary cell.
### Report draft
HW 2: Rover Rescue
Anant Gupta
October 2026
1. Question and configurations. How much do scaling and PCA change a terrain map built from eight sensors, and does a 3-cluster k-means classifier that borrows terrain names from 60 labels match 1-NN? Table 1 compares eleven configurations: a grid of scaling (raw or z-score), representation (all 8 sensors or the PCA components keeping 95% of the variance) and model (k-means or 1-NN), so neighbors differ in one factor, plus three extras (PCA with 2 components for both models, and 3-NN). My k-means follows ISL Algorithm 12.2 in NumPy: a random cluster for every point, then centroids and nearest-centroid reassignment until no label changes (cap 300 iterations), keeping the best of 10 random starts by within-cluster sum of squares. One start is not enough: 15 of 20 single starts reached the best objective on z-scored data, 2 of 20 on raw data. An empty cluster would be re-seeded at the farthest point; none occurred. Each cluster takes the majority label of the 60 calibration-training points, which was one-to-one every time. Three clusters match the three terrains and the elbow agrees (objective 2652, 1238, 1086 for k = 2, 3, 4).
2. Evaluation protocol. Normalization, PCA and k-means were fitted on the 754 fit rows (all practice rows except the 30 validation rows; no labels). The 60 calibration-training labels (20 per terrain) named clusters and trained 1-NN. Every configuration was scored on the same 30 validation rows (10 per terrain; one error is 3.3 points). I selected the model on these rows, so its score is a selection score, not a test score, and the practice run shows deployment, not accuracy. Mission rows were transformed with the stored mean, standard deviation and PCA and then predicted, never fitted on.
3. Evidence. Sensor standard deviations range from 0.040 (sensor_6) to 52.4 (sensor_4), a factor of 1,320, and sensors 4 and 2 supply 92.3% of raw squared distance, so raw distances mostly measure two sensors. PCA keeps 95% of the variance with 3 components after z-scoring (95.5%) and 2 on raw data (98.2%), but raw PC1 alone holds 88.4% (Figure 1a). In PC1 and PC2 the data form three groups matching the labeled terrains (Figure 1b).
[Insert Figure 1 here, 7.0 in wide]
Figure 1: (a) cumulative explained variance, (b) PC1 and PC2, (c) PC1 to PC3 of the z-scored fit rows. Gray: fit rows. Color: labeled training points.
Scaling mattered most. With model and representation fixed, z-scoring raised k-means accuracy from 0.700 to 1.000 and 1-NN from 0.933 to 1.000 on 8 sensors. Raw k-means found 5 of 10 validation sand cells; its cluster named sand held 12 sand, 11 rough and 4 firm training points, while every z-scored cluster was pure (20, 20, 20). PCA changed little: 8, 3 and 2 dimensions all scored 1.000 on z-scored data, while on raw data PCA lowered 1-NN from 0.933 to 0.867 (two more errors). Cluster and 1-NN tied at 1.000 on every z-scored configuration; on raw data 1-NN beat k-means (0.933 against 0.700). A possible explanation, untested: raw k-means splits mostly along sensor_4.
[Page break]
[Insert Table 1 here from the block below]
Table 1: dimensions, validation accuracy, macro F1 (unweighted mean of the three per-class F1 scores), sand recall and practice rover outcome for each configuration.
4. Decision and sand risk. Seven configurations tie at 1.000 accuracy, macro F1 and sand recall (C3, C4, C7, C8, E1, E2, E3), so validation cannot rank them. My rule, set before running, was highest macro F1, then sand recall, then fewer dimensions, then table order. It picked E1 (z-score, PCA 2, k-means), which differs from E2 only by table order, so this is a tie and not a win. E1 is the simplest of them (2 dimensions). Its practice route succeeded in 54 steps at predicted cost 70.8, like the other six (Figure 2). A missed sand cell is predicted firm or rough, so the planner treats it as passable and the rover stops the first time its route crosses it; a false sand prediction only blocks a cell and adds a detour. Raw k-means shows the cost: it called 5 of 10 sand cells rough and its rover stopped at step 20, at (y=13, x=4), where it predicted rough and the simulator reported sand. Raw 1-NN also missed 1 of 10 validation sand cells yet reached the goal, so that cell was not on its route.
[Insert Figure 2 here, 4.3 in wide]
Figure 2: selected model E1. Left: practice map with the planned route (mission success, 54 steps). Right: predicted mission map with its planned route.
5. Limitations. Thirty validation rows cannot separate seven perfect models, and a perfect score on them is not a perfect model; one successful practice route is a demonstration. Mission rows, z-scored with the fit statistics, sit within 0.25 standard deviations of the fit mean on every sensor, so I saw no sensor drift. The predicted mission mix still differs (firm 46.0%, rough 26.9%, sand 27.0% against 34.8%, 38.1% and 27.0% on practice), and without mission labels I cannot tell a real regional difference from a model error.
AI use: allowed in this course, and I used it heavily. Claude Code (Anthropic) read the course materials, wrote the notebook code, ran the experiments and drafted this report; I directed the work, checked the results and am responsible for what I submit.
### Table 1 rows
Markdown view:
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
Tab-separated, for Convert Text to Table in Word:
```
ID	Scaling	Representation (dims)	Model	Accuracy	Macro F1	Sand recall	Practice rover
C1	raw	8 sensors (8)	k-means	0.700	0.704	0.50	stuck, step 20
C2	raw	8 sensors (8)	1-NN	0.933	0.935	0.90	success, 54 steps
C3	z-score	8 sensors (8)	k-means	1.000	1.000	1.00	success, 54 steps
C4	z-score	8 sensors (8)	1-NN	1.000	1.000	1.00	success, 54 steps
C5	raw	PCA 95% (2)	k-means	0.700	0.704	0.50	stuck, step 20
C6	raw	PCA 95% (2)	1-NN	0.867	0.868	0.90	success, 54 steps
C7	z-score	PCA 95% (3)	k-means	1.000	1.000	1.00	success, 54 steps
C8	z-score	PCA 95% (3)	1-NN	1.000	1.000	1.00	success, 54 steps
E1	z-score	PCA 2 (2)	k-means	1.000	1.000	1.00	success, 54 steps
E2	z-score	PCA 2 (2)	1-NN	1.000	1.000	1.00	success, 54 steps
E3	z-score	8 sensors (8)	3-NN	1.000	1.000	1.00	success, 54 steps
```
### Submission
Not submitted yet.
## Concepts used
- [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 12|ISL Chapter 12]]: PCA (12.2) gave the 95% component count, the variance curve and the scaling argument; k-means (12.4, Algorithm 12.2) gave the algorithm, the local-optimum argument and the multiple random starts.
- [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]]: kNN and the bias-variance trade-off, behind the 1-NN comparison.
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 5|Week - 5]] and [[20_Progress/Degree/CSCI 4521/Weekly/Week - 6|Week - 6]]: PCA with kNN, the leakage rule (split first, then fit), k-means steps, initialization and stopping.
- [[20_Progress/Degree/CSCI 4521/Homework/Homework - 1|Homework - 1]]: z-score from training statistics, precision, recall and F1, and the Word report flow.
## Post-submit reflection
<!-- Optional until feedback: the first failure, the pattern, and what to change. -->
