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
next: "Build the Word report by following the Word document steps below (about 20 minutes), export the PDF, confirm 2 pages, then upload the 4 files listed under Submit to Gradescope before 11 pm on 2026-10-27."
---
# Homework - 2
## Overview
Rover Rescue (CSCI 4521 HW2): build a terrain classifier from eight sensors (firm, rough, sand), compare scaling, PCA and k-means against 1-NN, deploy one fitted model on the practice and mission grids, and explain the evidence in a standalone report of at most two pages. The grade is the 100-point `rubric.md` in the course repo, not the 10, 20 and 10 points printed in the PDF. No extra credit is offered in the handout, the repo markdown or the rubric.
Deadline: 11 pm on 2026-10-27, as the user stated it. Confirm on the Gradescope assignment page: the Board's schedule listed HW2 for 10/20, the handout says "check Gradescope", and the repo folder was committed 2026-10-22.
Status 2026-10-27: the notebook, both report figures, `submission.csv` and the practice HTML are final and tested. The report text is locked (the user's own wording, see Report text). Left: build the Word report and its PDF, then upload.
## Requirements
### Report length: two pages, not more
The handout calls it "the two-page report" and says "full implementation details and extra plots belong in your code/evidence, not the two-page report". The rubric's report line (20 points) ends with "Maximum two pages." So do not extend to three or four pages and do not add diagrams. The example `HW2.pdf` is 8 pages because it answers an older assignment with no limit; use it for tone and layout only. If a longer report is wanted anyway, ask the instructor on Piazza first; the written rubric is what a grader follows.
### What the handout asks for
Three design parts and four deliverables. Nothing beyond this belongs in the notebook.
- Representation: examine sensor scales, run PCA, report the component count for 95% variance, plot components against explained variance, show the top 2 and top 3 components.
- Experiments: at least three configurations that together show the effect of normalization, a PCA representation, and cluster-based against kNN. Record dimensions, validation accuracy, macro F1, sand recall and the practice outcome for each. Use k-means with three clusters, justify the cluster count and the way clusters get terrain names, and explain why missing sand matters.
- Deployment: choose one fitted model, reuse it on the practice and mission grids, show a practice deployment, export `submission.csv`, explain the choice, and analyze one failure, surprise or limitation.
- NumPy by hand: normalization, nearest-centroid assignment, centroid update, kNN prediction, and your own k-means loop.
### Submit
Upload exactly these four, from `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\`:
- [ ] `CSCI4521_HW2.ipynb` (1.3 MB), saved with outputs
- [ ] `practice_run.html` (0.7 MB), the practice deployment animation, centered on the screen
- [ ] `submission.csv` (14 KB): 784 rows, student_id demo3
- [ ] the report PDF, exported from Word, two pages
Do not upload: the `rover-rescue-download/` folder (it holds the dataset and `practice_truth.bin`), the starter notebook `Homework2_RoverRescue_student.ipynb`, `figures/` files as separate items, or any HW1 file.
How: Gradescope, CSCI 4521, Homework 2, upload. Whether the page has one multi-file slot or four slots is unverified, so read the page first. After uploading, open each file in the Gradescope preview and keep the confirmation.
Ready to submit when: the PDF exists and is two pages, the four files above are the ones selected, and the due time on Gradescope is confirmed. Everything else is done and tested.
### Must not do
- Do not read `practice_truth.bin`; only `evaluate_practice` and `show_practice_run` touch it.
- Do not change `split_data` or its split.
- Do not use x, y as features.
- Do not fit normalization, PCA or k-means on validation rows, and never fit anything on mission data.
- Do not use validation labels to name clusters or train 1-NN.
- Do not replace the four required NumPy operations with library versions.
- Do not call the validation score an untouched test estimate, or the practice run an accuracy estimate.
### Report must state
- [ ] Question, the configurations compared and why.
- [ ] The component count for 95% variance.
- [ ] What scaling and PCA changed and what cluster versus kNN showed, tied to the metrics. A tie is reported as a tie.
- [ ] Why the deployed model was chosen, how a missed sand cell changes the route, and one failure, surprise, tie or limitation.
- [ ] Which rows were used for fitting, naming and validation, and how the fitted model was reused on mission.
- [ ] Observations kept apart from explanations.
### Rules
- Piazza, instructor Ebasa Temesgen (relayed by the user 2026-10-27): the dataset is the supplied `demo_data` folder, the starter notebook loads it, and `student_id` demo3 is copied into `submission.csv` and stays unchanged. This replaces the PDF's "personalized dataset" wording.
- Piazza, instructor Bernardo Bianco Prado: sklearn is fine for k-means computation. The handout still says to assemble your own k-means loop and the rubric awards 25 points for correct k-means, so the notebook uses its own loop and keeps `KMeans` only as a cross-check. That satisfies both readings.
- Piazza, a student: `save_submission(predictions, BUNDLE_DIR)` at the end of the notebook writes `submission.csv`.
- AI disclosure: the handout's Course policy says to follow the syllabus AI-use policy and disclose assistance as required, and the syllabus says to cite AI prominently. The user decided it appears in one place only: the final "AI" paragraph of the Word report. It is not in the notebook, the HTML or the CSV (checked).
- Late policy: 24-hour grace day, nothing after.
## Work log
### 2026-10-27 Report text
The text below is the user's own wording from a rewrite of my draft. It was checked sentence by sentence against the executed notebook, the notebook source and the simulator code, and corrected only where a statement did not match. Style, British spelling, section titles and sentence order are the user's.
Corrections made (14):
| Where | What did not match | Now |
| --- | --- | --- |
| Section 1 | "All the configurations include scaling and using all 8 sensors" was wrong for C5 and C6, which use PCA with 3 components. | The first 4 configurations use all 8 sensors; the final 2 use the 3 PCA components. |
| Section 1 | "objective 2652, 1238, 1086" did not say what was measured. | "within cluster sum of squares". |
| Section 1 | "The majority class from the 60 labelled points is assigned to the clusters" did not say per cluster. | Added "in each cluster is used to name it". |
| Section 2 | "The practice data was run to show how it would perform" could read as an accuracy estimate. | Added "which is a demonstration and not an accuracy estimate" (the handout asks for exactly this distinction). |
| Section 3 | "The PCA reduces the data to 3 components (95.5%) while keeping 95% variance" mixed two numbers. | 3 components keep 95.5% of the variance, so 3 are needed for 95%, and the variance plot is cited (Figure 1a). |
| Section 3 | "the k-means had an accuracy of only 5/10" was wrong: accuracy was 0.700 (21 of 30). 5 of 10 is the sand recall. | "the k-means found only 5 of the 10 sand cells in the validation data". |
| Section 3 | "the cluster for sand contained 12 sand, 11 rough and 4 firm" did not say what was counted, and "This meant" implied a cause. | "The cluster named sand contained 12 sand, 11 rough and 4 firm labelled training points." |
| Section 3 | "the raw data is split mainly on sensor_4": the data is not split, k-means splits it. | "the k-means on raw data splits mainly on sensor_4" (sensor_4 is 81.9% of the raw squared distance). |
| Table 1 caption | "accuracy" and "the predicted result for the rover" were unclear. | "validation accuracy" and "the result of the practice rover run". |
| Section 4 | "Only 1 cell was blocked by the raw k-means" is not true of any result in the notebook. | "The raw k-means shows this as it predicted 5 of the 10 validation sand cells as rough." |
| Section 4 | "1-NN also failed to detect 1 sand cell" did not say which 1-NN; only the raw 1-NN missed one. | "The raw 1-NN", plus "as that cell was not on its route" (the run succeeded, so no sand was on the route). |
| Section 4 | "the same as the other 3" did not say what the 3 were. | "the other 3 tied configurations". |
| Figure 2 caption | "Practice data map" did not say it is the model's prediction. | "Predicted practice map". |
| Section 5 | "Only 1 successful route was found on the practice data" implied a search over routes. | "The practice run only tests 1 route, so it is a demonstration and not proof." |
Fact-check: a script tests 49 statements of the final text, including protocol claims (validation rows never reach a fit, mission rows only reach predict, naming uses the 60 training labels, selection order) and simulator behavior (only predicted sand is blocked, the rover stops at the first true sand cell on its route). All 49 hold. Layout test of the final text: it is 991 words and, at Times 11 pt, ran to a third page. At Times 10.5 pt, 0.7 in margins, Figure 1 at 7.0 in and Figure 2 at 4.0 in it fits two pages, with page 2 ending at about 91% (a swing of 4 points from one margin change shows how sensitive it is). The fallback steps in the Word guide are ready if Word spills.
### 2026-10-27 Final state and tests
`Code\Homework\CSCI4521_HW2.ipynb` has 38 cells: the 8 starter cells unchanged, then eight short sections (setup, NumPy methods, checks, representation, experiments, selection, deployment, export) and a summary. About 370 words of prose in total, two report figures plus the practice animation, and nothing else drawn. The AI-use cell was removed at the user's request, so the notebook says nothing about AI. k-means follows ISL Algorithm 12.2 and lecture 2.3. Code style follows the CSCI 4041 projects: a docstring with time cost on every function, comments on each step, and assert-based checks.
Trimmed to what the handout asks for, after the user pointed out the notebook was doing too much:
- Six configurations instead of eleven: raw and z-score, k-means and 1-NN on all 8 sensors, then PCA at 95% on the standardized sensors for both models. Dropped: raw-data PCA configurations, PCA with 2 components, 3-NN.
- PCA is fitted on the standardized sensors only. Dropped: the raw PCA curve and count, the loadings table.
- Dropped: the 20-start stability test, the elbow plot (the four objective values stay as one line), the mission-shift table and shares, the timing columns, the kNN closure, the drawing function and its tests.
- Kept: everything the three parts and the rubric name, plus the checks.
Practice HTML: the simulator returns a bare fragment, which the browser put at the top left. The notebook now wraps it in a full page with the animation centered. Measured in headless Edge at four window sizes (800x700, 1280x900, 1366x768, 1920x1080): top and bottom margins equal, left and right margins within 2 px. The simulator's own frames leave more blank space on the left than the right, so the wrapper shifts them by half the gap; the simulator code is untouched. The animation still plays (55 embedded frames).
Tests run, all on the final file in the user's `csci-4521` env (Python 3.12.14, numpy 2.5.3, pandas 3.0.6, scikit-learn 1.9.1, matplotlib 3.11.2):
- The user re-ran an earlier version in that env and its outputs were byte-identical to my Python 3.14 runs, so results do not depend on the environment. The final file ran in that env in a clean directory and in place: no error or stderr output, execution counts 1 to 25 in order, byte-identical `submission.csv`, results table and figures between runs.
- Three check cells, all assert-based. A general block: fit and validation rows are disjoint, grid order is row-major, z-score has mean 0 and std 1, vectorized distances equal the lecture 1.1 loop and kNN for k = 1, 3, 5 equals a loop reference on raw and z-scored data, k-means clusters partition the data and converge with a non-increasing objective and centroids equal to member means, the best random start is kept, PCA components are orthonormal and its variance equals the squared singular values, and sklearn agrees (k-means objective 1237.50 in both, standardization, macro F1, accuracy). A unit block with a hand-worked case for every method (constant sensor, 3-4-5 triangle, empty-cluster re-seed, within-cluster sum, exact recovery of three blobs, the iteration cap, naming by majority and by the one-to-one fallback, the nearest-neighbor tie-break, and the lecture 1.4 COVID example: precision 0.5, recall 0.75, F1 0.6, accuracy 0.8). A pipeline block: stored z-score and PCA, repeatable fits, every table value against sklearn accuracy and a direct sand recall.
- Coverage (coverage.py on the executed notebook): the check cells alone run 207 of 207 lines and 22 of 22 branches of my code, with all 16 functions fully covered. The whole notebook runs 367 of 367 lines and 40 of 40 branches.
- Mutation test: 14 deliberate bugs (distance sign flipped, argmin to argmax, wrong centroid divisor, dropped square, convergence never detected, worst start kept, worst naming permutation, transposed table, neighbors ordered farthest first, F1 without the factor 2, sand recall read from the wrong class, and others). The checks caught all 14.
- Defect found by the checks while building them: ties in the empty-cluster re-seed were broken by an unstable sort. Fixed with a stable sort. No run ever had an empty cluster, so no result changed.
- pyflakes finds no unused names or imports in my cells, pycodestyle at 120 columns is clean, no stderr output anywhere, no em or en dashes.
What "100%" does and does not mean: the code is verified correct and reproducible, and the report statements are verified against the output. The grade itself cannot be verified. The validation score is 1.000 for four of six configurations on only 30 rows, which says nothing certain about the hidden mission labels, and the handout says no points depend on them.
Not tested: Word itself, the Gradescope upload, and a Colab run.
Evidence (demo bundle, the confirmed dataset):
- Split: fit 754, calibration-training 60 (20 per class), validation 30 (10 per class).
- Scales: std runs from 0.040 (sensor_6) to 52.4 (sensor_4), a ratio of 1,320. Sensors 4 and 2 supply 92.27% of raw squared distance; sensor_4 alone 81.9%.
- PCA on the standardized fit rows: 95% needs 3 components (cumulative 0.9546; PC1 64.1%, PC2 27.1%, first two 91.1%). Three separated groups show in PC1 and PC2.
- Raw k-means: validation accuracy 0.700, macro F1 0.704, sand recall 0.5 (5 of 10), rover stuck at step 20 at (y=13, x=4) where it predicted rough. The cluster named sand holds 12 sand, 11 rough and 4 firm training points. Raw 1-NN: 0.933, 0.935, sand recall 0.9, reaches the goal (cost 72.2).
- All four z-scored configurations (8 sensors and PCA 95%, k-means and 1-NN) score 1.000 on accuracy, macro F1 and sand recall and reach the goal in 54 steps at cost 70.8. Their clusters are pure on the 60 training labels (20, 20, 20).
- The pre-set rule (macro F1, then sand recall, then fewer dimensions, then table order) picked C5 (z-score, PCA 95%, k-means, 3 dimensions), tied with C6 on every metric.
- Elbow objective: k=2 2652, k=3 1238, k=4 1086, k=5 939. Mission route cost 52.0.
### Decisions
- Word, not LaTeX: two pages, one table, two figures, no equations, no bibliography. Switch only if the table cannot fit.
- Two pages, as the rubric says. A longer report was considered and rejected (see Report length).
- AI disclosure only in the Word report, not in the notebook (the user's decision).
- Figures are saved at print size (7.25 in and 5.34 in wide at 300 dpi). Figure 1 goes in at 7.0 in, so its text stays readable; Figure 2 goes in at 4.0 in, which is smaller than its natural size to make the two pages.
- Selection rule fixed before any result: macro F1, then sand recall, then fewer dimensions, then table order. The practice outcome is recorded, not used to select.
- The notebook stores a generic `python3` kernel name so any Jupyter or Colab opens it without a missing-kernel prompt.
### Rubric coverage
"Met" means the evidence exists in the executed notebook, not that points are guaranteed.
| Rubric line | Where | Evidence |
| --- | --- | --- |
| Learning system and method choices (25) | notebook 2 Methods, 5 Experiments | z-score, nearest-centroid, centroid update, own k-means loop, cluster naming from the 60 labels, kNN, all NumPy; initialization, stopping rule and empty clusters stated and counted |
| Sensor scales (4) | notebook 4, first table | std range 1,320x, share of raw squared distance per sensor |
| PCA and 95% count (6) | notebook 4, PCA cell | fitted on fit rows only, 3 components |
| PCA figure and reading (5) | `figures/fig1_pca.png`, report 3 | variance curve, top 2 and top 3 components |
| Three or more configurations (8) | notebook 5 | six configurations, one factor changed at a time |
| Common held-out evaluation, boundaries (9) | notebook 1 Setup, 5 | asserts, same 30 validation rows, labels only for naming and 1-NN |
| Dimensions, accuracy, macro F1, sand recall, practice (8) | notebook 5 table, `figures/hw2_configs.csv`, Table 1 | all five per configuration |
| Model choice, reuse, mission map, practice run (10) | notebook 6 and 7, `practice_run.html`, `figures/fig2_deploy.png` | rule fixed first, stored objects reused, mission map and route |
| Report (20) | Word report | steps below: question, table, figures, sand risk, evaluation, limitations, two pages |
| Reproducibility (5) | notebook header and Summary | dependencies, run steps, seed, versions, clean-directory run verified |
### Word document: copy-paste guide
Follow the steps in order. Every grey code block is plain text; use its copy button, then Paste Special, Unformatted Text, in Word. The text is final: paste it as it is. The example `HW2.pdf` has the same shape: a header line on every page, a centered title block, then numbered sections with their heading on its own line.
#### Step 0: page setup (once, before pasting anything)
- Paper: Letter. Margins: 0.7 in on all four sides. One column.
- Font: Times New Roman 10.5 pt. Single line spacing. Spacing after paragraph 3 pt, before 0 pt. Body text justified.
- Page header on every page, 9 pt, with a thin bottom border: `CSCI 4521`, Tab, `Anant Gupta`, Tab, `October 27, 2026` (put the two tab stops at the center and the right margin, like the example). Set Header from Top to 0.3 in (Layout, Margins, Custom Margins) so the header sits in the margin and does not push the body down.
- Do not add page numbers or anything else to the footer.
- Headings: bold, left aligned, 5 pt before, 2 pt after, Keep with next.
#### Step 1: title block
Three centered bold lines. Paste, then center and bold all three.
```
HW 2: Rover Rescue
Anant Gupta
October 2026
```
#### Step 2: section 1
Paste both lines. Make the first line (the heading) bold, left aligned, with Keep with next on; leave the paragraph normal.
```
1. Question and Configurations
How much change occurs when we scale the data and do PCA? Does a 3 cluster k-means using the names of the terrains from the 60 labels perform as well as 1-NN? Table 1 shows 6 configurations. The first 4 use all 8 sensors, either raw or z-scored, with k-means or 1-NN. The final 2 use the PCA version of the z-scored data, which reduces the 8 sensors to the 3 components that keep 95% of the variance, again with k-means or 1-NN. This means the neighbors only vary in 1 factor. I implemented k-means in NumPy using ISL Algorithm 12.2. Each point has a random cluster assigned. The centroids are calculated, and the points are assigned to the closest centroid. This is repeated until no labels have been changed (maximum of 300 iterations). This gives the best result from 10 random starts based on the within cluster sum of squares. If any clusters are empty they will be re-seeded with the farthest point, however, there were none. The majority class from the 60 labelled calibration training points in each cluster is used to name it. In every case, this was 1:1. The number of clusters is 3, meaning there are 3 clusters for the 3 terrains. The elbow matches (within cluster sum of squares 2652, 1238, 1086 for k = 2, 3, 4).
```
#### Step 3: section 2
Paste both lines. Make the first line (the heading) bold, left aligned, with Keep with next on; leave the paragraph normal.
```
2. Evaluation
The normalisation, PCA and k-means were fit on the 754 rows of fit data (all practice data excluding the 30 validation rows). The 60 labelled calibration training rows were used to label the clusters and train the 1-NN. The scoring of every configuration was performed on the same 30 validation rows (10 per terrain). These were used to choose the model, meaning this score represents the selection score rather than the test score. The practice data was run to show how the model would perform during deployment, which is a demonstration and not an accuracy estimate. The mission data was transformed using the saved mean, standard deviation and PCA but was not fit.
```
#### Step 4: section 3, first paragraph
Paste both lines. Make the first line (the heading) bold, left aligned, with Keep with next on; leave the paragraph normal.
```
3. Evidence
The standard deviations of the sensor data vary from 0.040 (sensor_6) to 52.4 (sensor_4). This is a large difference of a factor of 1320. Sensors 4 and 2 make up 92.3% of the squared distance in the raw data. The PCA reduces the z-scored fit data to 3 components, which keep 95.5% of the variance, so 3 components are needed for 95% (Figure 1a). PC1 and PC2 group the data into 3 groups corresponding to the labelled terrains (Figure 1b).
```
#### Step 5: IMAGE, Figure 1
- File: `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\figures\fig1_pca.png`
- Place: directly under step 4, on its own centered line. Insert, Pictures, This Device, then Layout Options, In Line with Text.
- Size: 7.0 in wide, aspect ratio locked (about 2.4 in tall).
- Caption: the line below, 10 pt, centered, directly under the image.
```
Figure 1: (a) Cumulative explained variance (b) PC1 and PC2 (c) PC1-PC3 of z-scored fit data. Fit data shown in grey. Labelled training data shown in colour.
```
#### Step 6: section 3, second paragraph
No heading. Paste the paragraph as normal text.
```
The scaling had the biggest impact. Using the same model and representation, the z-scored data increased the accuracy of the k-means model from 0.700 to 1.000. The 1-NN also increased from 0.933 to 1.000. Without the scaling, the k-means found only 5 of the 10 sand cells in the validation data. The cluster named sand contained 12 sand, 11 rough and 4 firm labelled training points. However, all the clusters were pure after the z-scoring (20, 20, 20). The PCA made no difference as both models achieved a score of 1.000 for the 3 component data, the same as with all 8 sensors. Both the cluster and 1-NN had a score of 1.000 for all the z-scored configurations. For the raw data, the 1-NN performed better than the k-means (0.933 vs 0.700). This may be because the k-means on raw data splits mainly on sensor_4.
```
#### Step 7: TABLE, Table 1
- Place: directly under step 6.
- Build: paste the tab-separated block below, select it, Insert, Table, Convert Text to Table, 8 columns, Separate text at Tabs, AutoFit to contents.
- Format: 9 pt, header row bold, a thin rule above and below the header row and below the last row, no vertical lines, text columns left, number columns centered, table centered on the page.
- Keep it whole: select every row of the table and the caption below it, Paragraph, Line and Page Breaks, tick Keep with next (and Keep lines together). Word then moves the whole table to the top of page 2 if it does not fit at the bottom of page 1. Do not insert a manual page break.
- Row check: 6 rows plus the header. C1 and C2 raw, C3 and C4 z-score on 8 sensors, C5 and C6 z-score with PCA 95%.
```
ID	Scaling	Representation (dims)	Model	Accuracy	Macro F1	Sand recall	Practice rover
C1	raw	8 sensors (8)	k-means	0.700	0.704	0.50	stuck, step 20
C2	raw	8 sensors (8)	1-NN	0.933	0.935	0.90	success, 54 steps
C3	z-score	8 sensors (8)	k-means	1.000	1.000	1.00	success, 54 steps
C4	z-score	8 sensors (8)	1-NN	1.000	1.000	1.00	success, 54 steps
C5	z-score	PCA 95% (3)	k-means	1.000	1.000	1.00	success, 54 steps
C6	z-score	PCA 95% (3)	1-NN	1.000	1.000	1.00	success, 54 steps
```
- Caption: under the table, 10 pt, centered.
```
Table 1: Number of dimensions, validation accuracy, macro F1 (average of the 3 class F1 scores), sand recall and the result of the practice rover run for each configuration.
```
#### Step 8: section 4
Paste both lines. Make the first line (the heading) bold, left aligned, with Keep with next on; leave the paragraph normal.
```
4. Conclusion and Risk of Sand
There are 4 tied configurations with an accuracy, macro F1 and sand recall of 1.000 (C3, C4, C5, C6). Therefore, these cannot be ordered based on the validation. My criteria were to select the model with the highest macro F1, then sand recall, then fewest dimensions and finally the order in the table. This meant C5 was the chosen model (z-score, 95% PCA, k-means, 3 dimensions). This only differs from C6 due to the order in the table, so there was a tie. The practice data performed well with a successful route in 54 steps. The predicted cost was 70.8 which was the same as the other 3 tied configurations (Figure 2). The sand cells that were not detected were predicted as firm or rough, meaning the planner thinks they can be passed through. The rover will stop the first time its route passes through one of these cells. The raw k-means shows this as it predicted 5 of the 10 validation sand cells as rough. The rover stopped on step 20 at (y=13, x=4). The model predicted rough but the simulator said it was sand. The raw 1-NN also failed to detect 1 sand cell out of the 10 validation sand cells but still achieved its goal, as that cell was not on its route.
```
#### Step 9: IMAGE, Figure 2
- File: `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\figures\fig2_deploy.png`
- Place: directly under step 8, on its own centered line, In Line with Text.
- Size: 4.0 in wide, aspect ratio locked (about 2.3 in tall). This is smaller than its natural 5.3 in on purpose; do not enlarge it unless the document ends with an inch to spare.
- Caption: 10 pt, centered, directly under the image.
```
Figure 2: Chosen model C5. Left: Predicted practice map with planned route (mission successful in 54 steps). Right: Predicted mission map with planned route.
```
#### Step 10: section 5
Paste both lines. Make the first line (the heading) bold, left aligned, with Keep with next on; leave the paragraph normal.
```
5. Limitations
The 30 validation rows were not enough to differentiate between the 4 perfect models. A perfect score on the validation data does not mean it is a perfect model. The practice run only tests 1 route, so it is a demonstration and not proof. There are no labels on the mission data meaning I cannot see how well the model generalises to the new area.
```
#### Step 11: AI paragraph, the last thing in the document
Paste both lines. Make the first line (the heading) bold, left aligned, with Keep with next on; leave the paragraph normal.
```
AI
AI was allowed in this course. I used AI extensively. Claude Code (Anthropic) was used to read the course material, write the code in the notebook, run the experiments and write this report. I supervised the work and ensured the results were correct.
```
#### Step 12: export and final check
- File, Save As, PDF (Standard, not minimum size). Name it `HW2_Anant_Gupta.pdf`.
- Open the PDF and check, in this order: exactly two pages; Table 1 is whole (not split between pages); Figure 1 and Figure 2 are sharp and their labels can be read; the AI paragraph is the last thing and sits above the bottom margin; the header appears on both pages. My layout estimate puts the end of page 2 at about 91%, which leaves about 0.8 in.
- Check every number once against `figures/hw2_configs.csv` (Table 1) and the notebook Summary cell (component count 3, selected C5).
- If it spills onto a third page, do these in order and stop when it fits: (1) body text to 10 pt; (2) Figure 2 to 3.8 in wide; (3) margins to 0.65 in; (4) only if still over, the user may drop one of these sentences, none of which a rubric line needs: the elbow values in brackets at the end of section 1; "This is a large difference of a factor of 1320." in section 3; "Both the cluster and 1-NN had a score of 1.000 for all the z-scored configurations." in section 3. Never cut the evaluation section, the sand-risk explanation, the limitations or Table 1.
### Submission
Not submitted yet.
## Concepts used
- [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 12|ISL Chapter 12]]: PCA (12.2) gave the 95% component count, the variance curve and the scaling argument; k-means (12.4, Algorithm 12.2) gave the algorithm, the local-optimum argument and the multiple random starts.
- [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]]: kNN and the bias-variance trade-off, behind the 1-NN comparison.
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 5|Week - 5]] and [[20_Progress/Degree/CSCI 4521/Weekly/Week - 6|Week - 6]]: PCA with kNN, the leakage rule (split first, then fit), k-means steps, initialization and stopping.
- [[20_Progress/Degree/CSCI 4521/Homework/Homework - 1|Homework - 1]]: z-score from training statistics, precision, recall and F1, and the Word report flow.
## Post-submit reflection
<!-- Optional until feedback: the first failure, the pattern, and what to change. -->
