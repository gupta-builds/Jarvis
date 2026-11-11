---
type: class
class_kind: homework
status: sprout
created: 2026-11-10
updated: 2026-11-11
deadline: 2026-11-12
tags:
  - class
  - homework
area:
  - "[[CSCI 4521 Board]]"
next: "Build the Word report by following the guide below (steps 0 to 16), export the PDF, check it runs about 5 pages, then upload the notebook and the PDF by Thursday 2026-11-12 (24-hour grace day after that)."
---
# Homework - 3
## Overview
HW3 (Regression and PyTorch) on the 555-row `Students_HW3_555.csv`, a reduced copy of the UCI student performance data: predict the final grade `G3` from 12 school and survey features. Two deliverables: a notebook and a standalone PDF report that answers four questions (visualization, three parametric models, thresholded accuracy, repeated cross validation) plus one extra-credit KNN question. Only PyTorch, NumPy, Pandas and plotting libraries are allowed, except SKLearn on the extra credit.
Deadline: Thursday 2026-11-12 per the handout, where "Tuesday, Nov 10" is struck out and the PDF is the part still being written. The Board's schedule lists HW3 for 11/3 and is stale. The syllabus gives a 24-hour grace day with no penalty. Which site takes the upload (Canvas or Gradescope) is unverified, so check the course page.
Status 2026-11-11: the notebook is final, executed and checked, all seven figures are saved, and the report text below is drafted from the notebook output. Left: build the Word file and its PDF, then upload.
## Requirements
### Must submit
- [ ] `CSCI4521_HW3.ipynb`, saved with outputs, from `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\`
- [ ] The PDF report, exported from Word. It must work as a standalone document, so every figure and result sits in the PDF. The handout says the code itself is not graded.
### Must demonstrate (the rubric lines in the handout)
- [ ] Q1 (25): all three graph groups, readable and well coloured, and every sub-question answered with answers that make sense. 1a countplot of G3 (normality, most common grades, why, effect on metrics). 1b two histograms with kde plus a joint plot of Dalc and Walc (shape, relationship, why). 1c correlation heatmap of all columns (clusters and trends).
- [ ] Q2 (25): three separate models (linear with one input, multiple linear with at least three inputs, non-linear with interactions or non-linear terms). For each: why those inputs, whether inputs and output were normalized, the equation on unnormalized variables, numerical analysis, and a box or violin plot of predictions for each actual grade. Quantitative and qualitative analysis.
- [ ] Q3 (25): a thresholded accuracy function (correct when within T of the actual grade), all nine values at T = 0.5, 1, 2 on the training data, which model is best, and whether the difference is significant.
- [ ] Q4 (25): the same nine values from repeated cross validation, mean and variation between runs, comparison of the gap between models against the spread inside a model, and normalization done without data leakage.
- [ ] EC: KNN regression, how the hyperparameters were optimized, RMSE and thresholded accuracy, and a comparison with the authors' RMSE (mean predictor 3.23, neural network 2.79, SVM 2.76, random forest 2.67). SKLearn is allowed here.
### Must not do
- Do not use SKLearn anywhere except the extra credit. The notebook imports it in the extra-credit cell only.
- Do not fit normalization on held-out rows (the rubric names this leakage).
- Do not add G1 or G2 (the handout says they are left out on purpose).
### Rules
- Handout: "Try it by yourself first using resources provided in class and only use AI to support your work." The syllabus AI policy asks for prominent disclosure. The HW2 convention applies: one AI paragraph at the end of the Word report, nothing in the notebook. Edit that paragraph so it states what you actually did.
- Late policy: 24-hour grace day, nothing after.
## Work log
### 2026-11-10 and 11 Research
Read in full: the HW3 handout, the HW2 handout and the example report `HW2.pdf`, lectures 3.2 (intro to regression), 3.3 (gradient descent, PyTorch) and 3.4 (backpropagation, correlation, multicollinearity, interaction terms, KNN regression, regularization, cross validation), ISL 3.3.2 (interactions, polynomial terms), 3.5 (linear regression against KNN) and 5.1 (k-fold CV), DLB 5.1.4 (linear regression with MSE), 5.3 (hyperparameters, validation sets, Algorithm 5.1). The 4041 notebooks gave the code style: a docstring on every function, short comments on the steps, numbered section headers.
Facts found on the way:
- The 555 rows all appear in `student-por.csv` (the Portuguese course, 649 rows, inside `student.zip`). On the full file the mean predictor scores RMSE 3.233, which is the authors' 3.23. So the authors' numbers belong to the 649-row file, and on the 555 rows the mean predictor scores 3.316.
- The authors report only RMSE, so no thresholded accuracy exists to compare against.
- The lecture practice notebooks (Google Drive links) were not available, so the code follows the lecture slides: `loss.backward()`, `m -= m.grad * lr`, learning rate at most 1/L, stop when the loss stops changing.
### 2026-11-11 Notebook
`Code\Homework\CSCI4521_HW3.ipynb`: 26 cells, 15 code cells, executed top to bottom with no errors and no stderr output. About 3 minutes to run, almost all of it the nested KNN search. Seed 4521, so every run gives the same numbers (two full runs gave identical output). Code style: docstring on every function, comment lines 0.13 of the non-blank code lines (docstrings counted separately at 0.06), markdown limited to section headers. Figures are saved at print size into `figures\` as `hw3_*.png`.
Environment: the `csci-4521` env had no PyTorch. Installed `torch 2.15.0+cpu` with pip and added it to `Code\environment.yml` (pip section with the CPU index). Versions used: Python 3.12, numpy 2.5.3, pandas 3.0.6, seaborn 0.13.2, matplotlib 3.11.2, scikit-learn 1.9.1. Not tested: rebuilding the env from the changed `environment.yml`.
Checks in the last cell (all assert-based, all pass):
- Gradient descent agrees with closed-form least squares for all three models (coefficients within 0.00002).
- The unnormalized equation reproduces each model's predictions.
- Thresholded accuracy on a hand-worked case (errors 0.5, 1, 2, 2.5 give 0.25, 0.5, 0.75).
- Every cross validation run uses each student once for validation, training never contains validation rows, and the fitted normalization statistics are the training rows' own.
- The 555-row file is a subset of the full Portuguese file.
- `neighbor_means` equals `KNeighborsRegressor` (checked on tie-free copies of the data).
Problems met and fixed:
- `joblib` worker processes crashed in this env ("worker unexpectedly terminated"), even with the conda DLL path on `PATH`. A plain `GridSearchCV` was too slow sequentially (about 4 seconds per outer fold, 13 minutes per dataset). Fix: one neighbor search per fold gives every k and both weightings by cumulative sums (`neighbor_means`), so tuning takes about 20 seconds per dataset.
- Tuning and prediction first used different code (vectorized scores against `KNeighborsRegressor`), and their RMSE differed by up to 0.09 at small k. Cause: the inputs are small integers, so many neighbors tie in distance and the two paths break ties differently. On tie-free copies the two agree exactly. Fix: the tuner and the final predictor now share `neighbor_means`, and the check compares it with `KNeighborsRegressor` on tie-free copies.
- The countplot labels broke because seaborn draws no bar for a grade that never occurs (2, 3, 4). Labels now follow the grades that occur and the axis still spans 0 to 20.
### Decisions
- Gradient descent from the lectures, full batch, MSE loss, learning rate 1/L (L from the largest eigenvalue of the normalized design matrix), double precision. Inputs and the grade are z-scored with training statistics. Product and log columns are built from raw values and then z-scored.
- Linear model: `failures`, the strongest correlation with G3 (-0.40).
- Multiple linear model: features with correlation of at least 0.2 with G3 (failures, higher, studytime, Medu, Fedu, Dalc), with Fedu dropped for a correlation of 0.63 with Medu (lecture 3.4: multicollinearity above about 0.6). Result: failures, higher, studytime, Medu, Dalc.
- Non-linear model: the multiple linear inputs plus every product of two of them that correlates with G3 more than both parents (lecture 3.4 method): Medu × studytime, studytime × higher, Medu × higher. `failures` is replaced by `log(1 + failures)` (correlation -0.43 against -0.40, and 0.98 with failures, so both together would be collinear). Selection used all 555 rows, so the cross validated numbers carry a small optimism from the choice of terms (the handout asks to base the models on the Q1 analysis). Say so if asked; the normalization and fitting are leakage-free.
- Q3 significance: standard error of a proportion, since a single fit has no spread. Q4 significance: the gap between means against the spread across runs, the comparison the handout suggests, plus wins out of 20 on the same splits. The runs reuse the same students, so this is a yardstick and not a formal test; the report says that.
- Q4 protocol: 20 runs of 10-fold, the authors' protocol, with the same splits for every model and for the KNN.
- EC: nested cross validation (inner 5-fold on RMSE picks the features kept, distance, k and weighting inside every training fold; outer loop 20 × 10-fold). Run on three datasets: the 555 rows, the 649-row file with the same 12 inputs, and the 649-row file with all 39 inputs (one-hot encoded, G1 and G2 dropped). The last two use the full database as asked.
- Neighbor search ties: handled identically for tuning and prediction (see problems above).
### Results (copied from the executed notebook)
- G3: mean 11.88, median 12, std 3.31, skew -0.92, excess kurtosis 2.60. 75.9% within one std. Grades 10 to 13: 54.6%. Most common: 11 (95), 10 (80), 13 (70), 12 (58). 14 zeros carry 32.5% of the squared error of the mean predictor. 42 students scored 17 to 19.
- Dalc: 68.6% at level 1, skew 2.11. Walc: 36.9% at level 1, skew 0.60. Correlation 0.63. Mean Walc at Dalc 1 to 5: 1.78, 3.07, 3.95, 4.07, 4.73. Of 381 students at Dalc 1, 47.2% have Walc above 1. Of 174 at Dalc 2 or more, 4 have Walc 1.
- Strongest pairs: Medu with Fedu 0.63, Walc with Dalc 0.63, G3 with failures -0.40, Walc with goout 0.39, G3 with higher 0.33, failures with age 0.32, higher with failures -0.30. G3 with study time 0.25, Medu 0.23, Fedu 0.21, Dalc -0.20, Walc -0.18.
- Equations: linear `G3 = 12.400 - 2.109 × failures`. Multiple: `9.349 - 1.541 failures + 1.786 higher + 0.587 studytime + 0.377 Medu - 0.501 Dalc`. Non-linear: see report text. Epochs 3, 27, 2000.
- Training fit (RMSE, MAE, R²): linear 3.037, 2.247, 0.158. Multiple 2.835, 2.047, 0.267. Non-linear 2.802, 2.021, 0.284. Mean predictor 3.311, 2.459, 0.
- Training thresholded accuracy (T = 0.5, 1, 2): linear 0.150, 0.292, 0.566. Multiple 0.173, 0.330, 0.611. Non-linear 0.187, 0.344, 0.620. Mean predictor 0.105, 0.276, 0.546. Standard error 0.015 to 0.021. Non-linear minus linear is 1.7 to 1.9 standard errors.
- Cross validation (20 × 10-fold), mean ± std over runs: see Table 3 in the report text. Multiple against linear wins 20 of 20 runs at every T, with gaps 5.6 to 14.0 times the spread inside a model. Non-linear against multiple wins 17, 16, 13 of 20, gaps 0.6 to 1.3 times the spread.
- EC: tuned KNN RMSE 2.960 ± 0.032 on the 555 rows, 2.855 ± 0.020 on the 649 rows with 12 inputs, 2.845 ± 0.034 with all 39 inputs. Non-nested best on all 555 rows: 2.873 (12 features, Euclidean, k = 30, equal weights). KNN minus non-linear regression on the 555 rows: 0.110 ± 0.030, regression better in 20 of 20 runs.
### Rubric coverage
"Met" means the evidence exists in the executed notebook and the report text, not that points are guaranteed.

| Rubric line | Where | Evidence |
| --- | --- | --- |
| Q1 all graphs, readable, colours, answers | notebook section 2, Figures 1 to 4, report section 1 | countplot, two histplots with kde, jointplot, heatmap, colour-blind palette, print-size fonts |
| Q2 three separate model types, inputs justified | notebook section 3, report section 2 | one rule per model, written in the report |
| Q2 quantitative and qualitative, clear graphs | Table 1, Figure 5 | RMSE, MAE, R², prediction range, medians at the extremes, one box plot per model |
| Q3 correct accuracy, nine values | notebook section 4, Table 2 | function with a hand-worked assert, 3 × 3 table plus a reference row |
| Q4 correct accuracy, nine values, multiple runs | notebook section 5, Table 3 | 20 runs of 10-fold, same splits for every model |
| Q4 mean and variation, compared | Table 3, Figure 6, report text | mean ± std, paired gaps, wins out of 20 |
| Q4 no leakage | `fit_model` stores training statistics only; assert in the checks cell | stated in the report |
| EC process documented and justified | notebook section 6, Table 4, Figure 7 | nested CV, grid, tuning curve, most chosen settings |
| EC comparable with the authors | Table 4 and report text | 649-row mean predictor equals their 3.23; KNN 2.845 against their 2.79, 2.76, 2.67 |
### Word document: copy-paste guide
Follow the steps in order. Every grey code block is plain text: use its copy button, then Paste Special, Unformatted Text in Word. The text is a draft in your voice for you to read and adjust, and every number in it comes from the notebook output. Each IMAGE step gives the file, the width and the caption. The shape follows the HW2 report: a header on every page, a centered title block, numbered sections with the heading on its own line, captions under figures and tables.
#### Step 0: page setup (once, before pasting anything)
- Paper: Letter. Margins: 0.7 in on all four sides. One column. Font: Times New Roman 11 pt, single spacing, left aligned, 6 pt after paragraphs. No empty lines between sections.
- Header on every page: `CSCI 4521`, Tab, `A. Gupta`, Tab, `November 12th, 2026` (the `th` superscript), thin bottom border, centre and right tab stops. Change the date to the day you submit.
- Footer on every page: centered `Page X of Y` with live page fields.
- Headings: bold, left aligned, Keep with next. Captions: centered, 10 pt, only the label (`Figure 1`, `Table 1`) in italics.
- Tables: 9 pt, header row bold, thin rule above and below the header row and below the last row, no vertical lines, text columns left, number columns centered, table centered. Select the table and its caption and tick Keep with next so they stay together.
#### Step 1: title block
Three centered lines. Paste, then center all three.
```
HW 3: Regression and PyTorch
Anant Gupta
November 2026
```
#### Step 2: section 1, part (a)
Paste both parts. Make the first line (the heading) bold, left aligned, Keep with next; leave the paragraph normal.
```
1. Data Visualization and Analysis
(a) Figure 1 counts the students at each final grade. The grades are not normally distributed. The mean is 11.88 and the median is 12, but the distribution is left-skewed (skew -0.92) and more peaked than a normal curve (excess kurtosis 2.60, and 75.9% of grades fall within one standard deviation against 68.3% for a normal). The most common grades are 11 (95 students), 10 (80) and 13 (70), and 54.6% of the students scored between 10 and 13. Grades are limited to 0 to 20 and most students land in the middle, so few reach the top (42 students scored 17 to 19), while the 14 zeros form a separate bump far below the rest with nothing at 2 to 4. The data does not say why these students scored 0. This shape affects the metrics. A model that always predicts the mean grade is already within 2 grades for 54.6% of the students, so thresholded accuracy has to be judged against that baseline. The zeros are 2.5% of the students but make up 32.5% of the squared error of the mean predictor, so RMSE is driven by a few outliers, while thresholded accuracy counts every student once. A model that regresses toward the middle will also miss the extreme grades, which the box plots in Question 2 show.
```
#### Step 3: IMAGE, Figure 1
- File: `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\figures\hw3_q1a_grades.png`
- Place: directly under step 2, on its own centered line. Insert, Pictures, This Device, then Layout Options, In Line with Text.
- Size: 6.5 in wide, aspect ratio locked (about 2.6 in tall).
- Caption (10 pt, centered, directly under the image):
```
Figure 1: Number of students at each final grade (G3).
```
#### Step 4: section 1, part (b)
No heading. Paste the paragraph as normal text.
```
(b) Figure 2 shows that both alcohol variables are far from normal. Workday consumption (Dalc) is strongly right-skewed: 68.6% of the students are at level 1 and the counts fall quickly to level 5 (skew 2.11). Weekend consumption (Walc) is spread more evenly: 36.9% are at level 1 and the counts fall steadily to level 5 (skew 0.60). Both are whole numbers from 1 to 5 piled up at the low end, so neither can be normal, and the density curves are wavy because they are fitted to five bars. Figure 3 shows that the two are related (correlation 0.63). The mean Walc is 1.78 for students at Dalc 1 and rises to 3.07, 3.95, 4.07 and 4.73 at Dalc 2 to 5. The relationship goes one way. Of the 381 students at Dalc 1, 47.2% still drink more on weekends, but only 4 of the 174 students with Dalc 2 or higher have Walc 1. Students who drink on workdays nearly always drink on weekends too, so I read this as one drinking habit that shows up more on weekends. Going out with friends is also correlated with both (0.25 with Dalc and 0.39 with Walc, Figure 4), so a shared social setting is a plausible reason, which this data cannot confirm.
```
#### Step 5: IMAGE, Figure 2
- File: `...\Code\Homework\figures\hw3_q1b_hist.png`
- Place: directly under step 4, centered, In Line with Text.
- Size: 6.5 in wide (about 2.3 in tall).
- Caption:
```
Figure 2: Workday (Dalc) and weekend (Walc) alcohol consumption, with density curves.
```
#### Step 6: IMAGE, Figure 3
- File: `...\Code\Homework\figures\hw3_q1b_joint.png`
- Place: directly under Figure 2's caption, centered, In Line with Text.
- Size: 3.2 in wide, aspect ratio locked (about 3.3 in tall).
- Caption:
```
Figure 3: Joint plot of Dalc and Walc with their distributions. The dots are shifted by a small random amount so that tied points can be seen.
```
#### Step 7: section 1, part (c)
No heading. Paste the paragraph as normal text.
```
(c) Figure 4 shows the pairwise correlations. Only two pairs are above 0.6: mother's and father's education (Medu and Fedu, 0.63) and workday and weekend alcohol (Dalc and Walc, 0.63). I see three clusters. The parents' education pair also correlates with wanting higher education (0.23 and 0.20) and negatively with travel time (-0.26 and -0.21). Alcohol and going out form a second cluster (goout with Walc 0.39 and with Dalc 0.25). A third group links past failures with age (0.32) and with wanting higher education (-0.30). For the final grade, the strongest correlations are failures (-0.40), wanting higher education (0.33), study time (0.25), mother's education (0.23), father's education (0.21), Dalc (-0.20) and Walc (-0.18). Absences (-0.08), going out (-0.08) and school support (-0.07) are close to zero. No feature has a correlation above 0.40 with G3, so I expect only a modest R² from any model built on these inputs.
```
#### Step 8: IMAGE, Figure 4
- File: `...\Code\Homework\figures\hw3_q1c_heatmap.png`
- Place: directly under step 7, centered, In Line with Text.
- Size: 5.0 in wide, aspect ratio locked (about 4.0 in tall).
- Caption:
```
Figure 4: Pairwise correlations of all 13 columns (lower triangle).
```
#### Step 9: section 2, text
Paste. Make the first line (the heading) bold, left aligned, Keep with next; leave the paragraphs normal. The three equations are plain text in the paragraphs, so nothing needs the equation editor.
```
2. Parametric Modeling
All three models predict G3 and were trained with my own gradient descent in PyTorch on all 555 students. I z-scored every input column and the grade with the training mean and standard deviation, which puts the inputs on one scale so that a single learning rate works. The loss is the mean squared error and each update uses the autodiff gradient. The learning rate is 1/L, where L is the largest curvature of the loss, the bound for guaranteed convergence from lecture. Training stopped when the loss stopped changing (3, 27 and 2000 epochs), and the coefficients match the closed-form least squares solution to within 0.00002. Each equation below was converted back to predict the unnormalized G3 from the unnormalized inputs.
(a) Linear model, one input. I chose failures because it has the strongest correlation with G3 (-0.40, Figure 4). G3 = 12.400 - 2.109 × failures. A student with no failures (83% of the students) is predicted 12.40, and each failure takes off 2.1 grades.
(b) Multiple linear model, five inputs. I took the features with a correlation of at least 0.2 with G3 (failures, higher, studytime, Medu, Fedu and Dalc) and dropped Fedu because it correlates 0.63 with Medu, which would make the coefficients unstable. Walc (-0.18) is under 0.2 and correlates 0.63 with Dalc. G3 = 9.349 - 1.541 × failures + 1.786 × higher + 0.587 × studytime + 0.377 × Medu - 0.501 × Dalc.
(c) Non-linear model, eight inputs. I kept the inputs of (b) and checked every product of two of them to see whether it correlates with G3 more strongly than both of its inputs. Three products do (Medu × studytime 0.30, studytime × higher 0.36, Medu × higher 0.34), so these are the interaction terms. I also replaced failures with log(1 + failures), which correlates better with G3 (-0.43 against -0.40). I did not keep both because they correlate 0.98. G3 = 10.842 - 3.065 × log(1 + failures) - 0.033 × higher + 0.469 × studytime - 0.219 × Medu - 0.467 × Dalc - 0.048 × Medu × studytime + 0.268 × studytime × higher + 0.705 × Medu × higher. The interaction terms correlate with their own inputs, so single coefficients are hard to read. The Medu coefficient alone is negative, for example, but for students who want higher education the Medu × higher term makes the total effect of Medu positive.
```
#### Step 10: TABLE, Table 1, and section 2 analysis
- Place: directly under step 9.
- Build: paste the tab-separated block, select it, Insert, Table, Convert Text to Table, 5 columns, Separate text at Tabs, AutoFit to contents. Format as in step 0 (9 pt, header bold, thin rules, centered).
```
Model	Inputs	RMSE	MAE	R²
Mean predictor	0	3.311	2.459	0.000
Linear	1	3.037	2.247	0.158
Multiple linear	5	2.835	2.047	0.267
Non-linear	8	2.802	2.021	0.284
```
- Caption (10 pt, centered, under the table):
```
Table 1: Fit of each model on the training data. RMSE and MAE are in grade units.
```
- Then paste this paragraph as normal text under the caption:
```
Table 1 shows that every model beats the mean predictor, but not by much. The multiple linear model explains 26.7% of the variance, 10.9 points more than the linear model (15.8%), and the non-linear model adds only 1.7 points (28.4%). Figure 5 shows where the models fail. The linear model can only output four values (12.40, 10.29, 8.18 and 6.07 for 0 to 3 failures), so it gives most students the same prediction and its boxes are flat lines. The other two models spread their predictions from about 3.9 to 14.5, but all three shrink toward the middle. For students whose true grade is 17 or higher, the median prediction is only 12.40, 13.03 and 13.11, and for the 14 students with a 0 it is 10.29, 10.06 and 9.39. Grades near the mean (10 to 13) are predicted best.
```
#### Step 11: IMAGE, Figure 5
- File: `...\Code\Homework\figures\hw3_q2_boxplots.png`
- Place: directly under the paragraph from step 10, centered, In Line with Text.
- Size: 5.6 in wide, aspect ratio locked (about 4.8 in tall).
- Caption:
```
Figure 5: Predicted grade for each actual grade for the linear, multiple linear and non-linear models (training data). The dashed line is a perfect prediction.
```
#### Step 12: section 3 and Table 2
Paste. Make the first line (the heading) bold, left aligned, Keep with next; leave the paragraph normal.
```
3. Testing Accuracy
I wrote a function that counts a prediction as correct when it is within T grades of the actual grade, using the unrounded predictions. Table 2 gives the nine values on the training data, with the mean predictor as a reference. The non-linear model is the best at every threshold (0.187, 0.344 and 0.620), followed by the multiple linear model and then the linear model. The differences are small. With 555 students the standard error of an accuracy is about 0.015 to 0.021, and the gap between the non-linear and linear models (0.038, 0.052 and 0.054) is only 1.7 to 1.9 standard errors. The gap between the multiple linear and linear models is 1.1 to 1.5 standard errors, and the gap between the non-linear and multiple linear models is 0.3 to 0.6. So none of the differences is significant here. These are also training accuracies, which favour the model with the most parameters.
```
- Table 2 build: directly under that paragraph. Paste, Convert Text to Table, 4 columns, tabs, AutoFit, same format.
```
Model	T = 0.5	T = 1	T = 2
Linear (1 input)	0.150	0.292	0.566
Multiple linear (5 inputs)	0.173	0.330	0.611
Non-linear (8 inputs)	0.187	0.344	0.620
Mean predictor (reference)	0.105	0.276	0.546
```
- Caption:
```
Table 2: Thresholded accuracy on the training data (555 students).
```
#### Step 13: section 4, Table 3 and Figure 6
Paste. Make the first line (the heading) bold, left aligned, Keep with next; leave the paragraph normal.
```
4. Cross Validation
I repeated the whole procedure with 20 runs of 10-fold cross validation, using the same shuffled splits for all models. In every fold, the means and standard deviations used for normalization came only from the 9 training folds and were applied to the held-out fold, so nothing from the held-out students leaks into the fit. The accuracy of a run is measured on its 555 held-out predictions. Table 3 gives the mean and standard deviation over the 20 runs. The non-linear model has the highest mean at every threshold (0.177, 0.331 and 0.612), but it is not clearly better than the multiple linear model. The gap is 0.007, 0.005 and 0.003, which is 1.3, 0.9 and 0.6 times the standard deviation inside a model (0.004 to 0.007), and the non-linear model won in only 17, 16 and 13 of the 20 runs. The multiple linear model beats the linear model by 0.021, 0.034 and 0.047, which is 5.6 to 14.0 times the standard deviation inside a model, and it won in all 20 runs (the non-linear model also won all 20 runs against the linear one). So the multiple linear and non-linear models are significantly better than the linear model, and the difference between those two is not significant (Figure 6). The runs reuse the same 555 students, so I use the spread across runs as a yardstick and not as a formal test. Compared with the training accuracy in Table 2, the cross validated accuracy of the non-linear model is lower by 0.010 at T = 0.5 and 0.008 at T = 2, while the linear model barely changes (0.001 and 0.004): the model with the most parameters loses the most on unseen students. RMSE tells the same story (3.050, 2.869 and 2.850, against 3.316 for the mean predictor).
```
- Table 3 build: directly under that paragraph, 5 columns, same format.
```
Model	T = 0.5	T = 1	T = 2	RMSE
Linear (1 input)	0.149 ± 0.003	0.292 ± 0.001	0.562 ± 0.003	3.050 ± 0.005
Multiple linear (5 inputs)	0.170 ± 0.004	0.326 ± 0.005	0.608 ± 0.004	2.869 ± 0.006
Non-linear (8 inputs)	0.177 ± 0.006	0.331 ± 0.007	0.612 ± 0.006	2.850 ± 0.008
Mean predictor (reference)	0.105 ± 0.000	0.275 ± 0.003	0.545 ± 0.003	3.316 ± 0.002
```
- Caption:
```
Table 3: Thresholded accuracy and RMSE from 20 runs of 10-fold cross validation, mean ± standard deviation over the 20 runs.
```
- Figure 6 file: `...\Code\Homework\figures\hw3_q4_cv.png`. Place directly under the Table 3 caption, centered, In Line with Text, 6.5 in wide (about 2.3 in tall).
```
Figure 6: Thresholded accuracy of each model over the 20 cross validation runs, for T = 0.5, 1 and 2 (the vertical scales differ).
```
#### Step 14: extra credit text
Paste. Make the first line (the heading) bold, left aligned, Keep with next; leave the paragraph normal.
```
Extra Credit: KNN Regression
I predicted G3 with the mean grade of the k nearest neighbours, the lecture formula, using SKLearn for the scaling, the feature selection and the neighbour search. I tuned four hyperparameters: the number of features kept (3, 5, 8 or 12, chosen by SelectKBest on the training fold), the distance (Manhattan or Euclidean), k (5 to 80) and the weighting (equal or by inverse distance). The inputs are z-scored with the training fold. To avoid selection bias I used nested cross validation: inside every training fold a 5-fold search on RMSE picks the settings, and the outer loop is the authors' protocol of 20 runs of 10-fold cross validation, with the same splits as Question 4. I ran it on the 555 students and on the full 649-student Portuguese file (student-por.csv) that the 555 were taken from, with the same 12 inputs and with all 39 inputs of the full file (G1 and G2 left out). The mean predictor scores 3.233 on the 649 students, the same as the authors' 3.23, so this file is the data behind their numbers. Figure 7 shows the 10-fold RMSE on the 555 students: the error falls quickly until k = 15 to 30 and then rises slowly, and 8 or 12 features beat 3 or 5. The optimum is flat, since the most common setting (8 features, Euclidean, k = 30, equal weights) was chosen in only 18% of the folds. The best setting on all rows scores 2.873, lower than the nested 2.960, which is the optimism of picking the best of 128 settings on the same data.
```
- Table 4 build: directly under that paragraph, 6 columns, same format.
```
Data	Model	RMSE	T = 0.5	T = 1	T = 2
555 students	Mean predictor	3.316 ± 0.002	0.105 ± 0.000	0.275 ± 0.003	0.545 ± 0.003
555 students	KNN (tuned)	2.960 ± 0.032	0.162 ± 0.013	0.329 ± 0.011	0.588 ± 0.013
555 students	Non-linear regression	2.850 ± 0.008	0.177 ± 0.006	0.331 ± 0.007	0.612 ± 0.006
649 students, 12 inputs	Mean predictor	3.233 ± 0.002	0.111 ± 0.000	0.270 ± 0.004	0.546 ± 0.003
649 students, 12 inputs	KNN (tuned)	2.855 ± 0.020	0.159 ± 0.010	0.326 ± 0.009	0.593 ± 0.012
649 students, 39 inputs	KNN (tuned)	2.845 ± 0.034	0.166 ± 0.011	0.330 ± 0.016	0.601 ± 0.011
```
- Caption:
```
Table 4: RMSE and thresholded accuracy of the tuned KNN from nested cross validation (20 runs of 10-fold), mean ± standard deviation over the runs.
```
- Then paste this paragraph under the caption:
```
The KNN reaches an RMSE of 2.960 on the 555 students (the mean predictor is 3.316) and 2.855 on the 649 students (3.233). Using all 39 inputs gives 2.845, almost the same, so the extra attributes add little for KNN. Against the authors, the KNN is 12% better than the mean predictor but behind their neural network (2.79), SVM (2.76) and random forest (2.67), by 0.06, 0.09 and 0.18. The authors did not report thresholded accuracy, so I can only compare with the mean predictor, which the KNN beats at every threshold (0.593 against 0.546 at T = 2 on the 649 students). On the 555 students the non-linear regression is better than the KNN (RMSE 2.850 against 2.960, better in all 20 runs). This fits ISL section 3.5: with a nearly linear relationship and few inputs, the parametric model wins, and the KNN pays in variance and in distance noise from weak features.
```
- Figure 7 file: `...\Code\Homework\figures\hw3_ec_tuning.png`. Place directly under that paragraph, centered, In Line with Text, 4.2 in wide, aspect ratio locked (about 2.4 in tall).
```
Figure 7: KNN regression on the 555 students: 10-fold cross validation RMSE against k for each number of features kept (best distance and weighting at each point). The dashed line is the mean predictor.
```
#### Step 15: AI paragraph, the last thing in the document
Paste both lines. Make the first line (the heading) bold. Edit the second line so it says what you actually did.
```
AI
AI was allowed in this course. I used AI extensively. Claude Code (Anthropic) was used to read the course material, write the code in the notebook, run the experiments and write this report. I supervised the work and ensured the results were correct.
```
#### Step 16: export and final check
- File, Save As, PDF (Standard). Name it `HW3_Anant_Gupta.pdf`.
- Open the PDF and check, in this order: every figure number is referred to in the text and its caption is directly under it; each table sits whole on one page (not split); Figures 3, 4 and 5 are sharp and their labels can be read; the AI paragraph is the last thing and sits above the footer; header on every page and the footer says Page X of Y.
- Page count: the target is 5 pages. Word was not run on this text, so the count is an estimate: about 2,070 words of text, 7 figures (about 22 in of height in total) and 4 tables should come to 5 to 6 pages. If it runs past 5 pages, do these in order and stop when it fits: (1) body text to 10.5 pt; (2) Figure 5 to 5.0 in wide and Figure 4 to 4.4 in; (3) margins to 0.65 in; (4) only if still over, drop the two sentences "The data does not say why these students scored 0." and "The runs reuse the same 555 students, so I use the spread across runs as a yardstick and not as a formal test." Do not cut Tables 2 to 4, the equations, or the leakage sentence in section 4.
- Check every number once against the `## Results` list above and the notebook's printed tables.
### Submission
Not submitted yet.
## Concepts used
- [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]]: KNN and the bias-variance trade-off, behind the small-k and large-k reading of the tuning curve in the extra credit. The ISL 3.5 comparison of linear regression with KNN (not yet a chapter note) explains why regression beat KNN here.
- Lecture 3.3 (regression with PyTorch, gradient descent): the update `w -= lr * w.grad`, the learning-rate bound 1/L and the stopping rule, used in `gd_fit` and `fit_model`.
- Lecture 3.4 (correlation, multicollinearity, interaction terms, KNN regression, cross validation): the |r| of about 0.6 collinearity rule that dropped Fedu, the product-correlation test that chose the interaction terms, k-fold cross validation, and data leakage when normalizing.
- ISL 3.3.2 (interaction and non-linear terms, the hierarchical principle) and ISL 5.1.3 (k-fold CV): the main effects stay in the model next to their products, and 10 folds is the usual choice. DLB 5.3 (hyperparameters and validation sets, Algorithm 5.1): tuning inside the training data only, which is why the KNN search is nested.
- [[20_Progress/Degree/CSCI 4521/Homework/Homework - 1|Homework - 1]] and [[20_Progress/Degree/CSCI 4521/Homework/Homework - 2|Homework - 2]]: the z-score from training statistics, repeated random splits, the Word report flow and the AI paragraph.
## Post-submit reflection
<!-- Optional until feedback: the first failure, the pattern, and what to change. -->
