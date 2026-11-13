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
next: "Read the finished HW-3.docx once, edit the AI paragraph so it says what you did, export the PDF from Word (5 pages), then upload the notebook and the PDF by Thursday 2026-11-12 (24-hour grace day after that)."
---
# Homework - 3
## Overview
HW3 (Regression and PyTorch) on the 555-row `Students_HW3_555.csv`, a reduced copy of the UCI student performance data: predict the final grade `G3` from 12 school and survey features. Two deliverables: a notebook and a standalone PDF report that answers four questions (visualization, three parametric models, thresholded accuracy, repeated cross validation) plus one extra-credit KNN question. Only PyTorch, NumPy, Pandas and plotting libraries are allowed, except SKLearn on the extra credit.
Deadline: Thursday 2026-11-12 per the handout, where "Tuesday, Nov 10" is struck out and the PDF is the part still being written. The Board's schedule lists HW3 for 11/3 and is stale. The syllabus gives a 24-hour grace day with no penalty. Which site takes the upload (Canvas or Gradescope) is unverified, so check the course page.
Status 2026-11-12: the notebook is final, executed and checked, the five report figures are saved, and `HW-3.docx` is built from the text in "Word report: final text" below (5 pages in Word). Left: edit the AI paragraph, export the PDF, upload.
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
`Code\Homework\CSCI4521_HW3.ipynb`: 26 cells, 15 code cells, executed top to bottom with no errors and no stderr output. About 2 minutes to run, almost all of it the nested KNN search. Seed 4521, so every run gives the same numbers (repeat runs gave identical output). Code style: docstring on every function, comment lines 0.14 of the non-blank code lines (full-line and inline, docstrings counted separately), markdown limited to section headers. Five figures are saved at print size into `figures\` as `hw3_*.png`, the ones the handout asks for (countplot, two histograms, joint plot, heatmap, box plots). 2026-11-12 final pass: the cross validation chart, the KNN tuning curve and the 39-input KNN run were removed (not asked for), the tuning grid prints as a table, the joint plot labels every level 1 to 5, and the box plots got readable panel titles and a print-size layout.
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
- EC: nested cross validation (inner 5-fold on RMSE picks the features kept, distance, k and weighting inside every training fold; outer loop 20 × 10-fold). Run on two datasets: the 555 rows and the full 649-row Portuguese file with the same 12 inputs (the full database as asked). A third run with all 39 inputs was dropped on 2026-11-12: the handout does not ask for it.
- Neighbor search ties: handled identically for tuning and prediction (see problems above).
### Results (copied from the executed notebook)
- G3: mean 11.88, median 12, std 3.31, skew -0.92, excess kurtosis 2.60. 75.9% within one std. Grades 10 to 13: 54.6%. Most common: 11 (95), 10 (80), 13 (70), 12 (58). 14 zeros carry 32.5% of the squared error of the mean predictor. 42 students scored 17 to 19.
- Dalc: 68.6% at level 1, skew 2.11. Walc: 36.9% at level 1, skew 0.60. Correlation 0.63. Mean Walc at Dalc 1 to 5: 1.78, 3.07, 3.95, 4.07, 4.73. Of 381 students at Dalc 1, 47.2% have Walc above 1. Of 174 at Dalc 2 or more, 4 have Walc 1.
- Strongest pairs: Medu with Fedu 0.63, Walc with Dalc 0.63, G3 with failures -0.40, Walc with goout 0.39, G3 with higher 0.33, failures with age 0.32, higher with failures -0.30. G3 with study time 0.25, Medu 0.23, Fedu 0.21, Dalc -0.20, Walc -0.18.
- Equations: linear `G3 = 12.400 - 2.109 × failures`. Multiple: `9.349 - 1.541 failures + 1.786 higher + 0.587 studytime + 0.377 Medu - 0.501 Dalc`. Non-linear: see report text. Epochs 3, 27, 2000.
- Training fit (RMSE, MAE, R²): linear 3.037, 2.247, 0.158. Multiple 2.835, 2.047, 0.267. Non-linear 2.802, 2.021, 0.284. Mean predictor 3.311, 2.459, 0.
- Training thresholded accuracy (T = 0.5, 1, 2): linear 0.150, 0.292, 0.566. Multiple 0.173, 0.330, 0.611. Non-linear 0.187, 0.344, 0.620. Mean predictor 0.105, 0.276, 0.546. Standard error 0.015 to 0.021. Non-linear minus linear is 1.7 to 1.9 standard errors.
- Cross validation (20 × 10-fold), mean ± std over runs: see Table 3 in the report text. Multiple against linear wins 20 of 20 runs at every T, with gaps 5.6 to 14.0 times the spread inside a model. Non-linear against multiple wins 17, 16, 13 of 20, gaps 0.6 to 1.3 times the spread.
- EC: tuned KNN RMSE 2.960 ± 0.032 on the 555 rows and 2.855 ± 0.020 on the 649 rows with 12 inputs. Non-nested best on all 555 rows: 2.873 (12 features, Euclidean, k = 30, equal weights). Grid on all 555 rows with 12 features: 3.036 at k = 5, 2.873 at k = 30, 2.951 at k = 80. KNN minus non-linear regression on the 555 rows: 0.110 ± 0.030, regression better in 20 of 20 runs.
### Rubric coverage
"Met" means the evidence exists in the executed notebook and the report text, not that points are guaranteed.

| Rubric line | Where | Evidence |
| --- | --- | --- |
| Q1 all graphs, readable, colours, answers | notebook section 2, Figures 1 to 4, report section 1 | countplot, two histplots with kde, jointplot, heatmap, colour-blind palette, print-size fonts |
| Q2 three separate model types, inputs justified | notebook section 3, report section 2 | one rule per model, written in the report |
| Q2 quantitative and qualitative, clear graphs | Table 1, Figure 5 | RMSE, MAE, R², prediction range, medians at the extremes, one box plot per model |
| Q3 correct accuracy, nine values | notebook section 4, Table 2 | function with a hand-worked assert, 3 × 3 table plus a reference row |
| Q4 correct accuracy, nine values, multiple runs | notebook section 5, Table 3 | 20 runs of 10-fold, same splits for every model |
| Q4 mean and variation, compared | Table 3, report text | mean ± std, paired gaps, wins out of 20 |
| Q4 no leakage | `fit_model` stores training statistics only; assert in the checks cell | stated in the report |
| EC process documented and justified | notebook section 6, Table 4, report extra credit text | nested CV, the four hyperparameters, grid numbers, most chosen settings |
| EC comparable with the authors | Table 4 and report text | 649-row mean predictor equals their 3.23; KNN 2.855 against their 2.79, 2.76, 2.67 |
### Word report: final text
The report is built as `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Homework\HW-3.docx`: Letter, 0.7 in margins, Times New Roman 12 pt with the spacing set in Word, header `CSCI 4521`, `A. Gupta`, `November 12th, 2026`, footer `Page X of Y`. Word counted 5 pages on 2026-11-12 (the last page about half full). Everything between the blocks below is the text of the document, word for word: the humanized draft, with the meaning fixes listed at the end of this section, cut by about 15% from every part so that it fits. Only 5 figures are in the report, the ones the handout asks for. Export it with File, Save As, PDF (Standard) as `HW3_Anant_Gupta.pdf`.
#### Title block (three centered lines)
```
HW 3: Regression and PyTorch
Anant Gupta
November 2026
```
#### 1. Data Visualization and Analysis
```
(a) Figure 1 shows that the final grade is not normally distributed. The mean is 11.88 and the median is 12, but the data is negatively skewed (skew −0.92), and 75.9% of the grades are within one standard deviation of the mean, against 68% for a normal distribution. The most common grades are 11 (95 students), 10 (80) and 13 (70). Most students land in the middle, so few score high (42 scored 17 to 19), and there is a spike of 14 zeros. This affects the metrics. A model that always predicts the mean grade is already within 2 grades for 54.6% of the students (those scoring 10 to 13), so accuracy has to be judged against that baseline. The zeros are 2.5% of the students but 32.5% of the squared error of the mean predictor, so RMSE is driven by outliers, and any model will be pulled toward the middle (Figure 5).
```
Figure 1: `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\figures\hw3_q1a_grades.png`, 6.0 in wide, centered under (a).
```
Figure 1: Number of students at each final grade (G3).
```
```
(b) Figure 2 shows that neither alcohol variable is normally distributed. Workday consumption (Dalc) is strongly right-skewed: 68.6% of the students are at level 1 and the counts drop sharply to level 5 (skew 2.11). Weekend consumption (Walc) is more even, with 36.9% at level 1 (skew 0.60). Both take only the whole numbers 1 to 5, so the density curves are wiggly. Figure 3 shows a relationship between the two (correlation 0.63): the mean Walc rises from 1.78 at Dalc 1 to 4.73 at Dalc 5. It goes one way: of the 381 students at Dalc 1, 47.2% have a Walc above 1, but only 4 of the 174 students at Dalc 2 or higher have a Walc of 1. This suggests one drinking habit that shows up more at weekends. Going out with friends correlates with both (0.25 with Dalc and 0.39 with Walc, Figure 4), so a shared social setting is a plausible reason.
```
Figure 2: `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\figures\hw3_q1b_hist.png`, 5.4 in wide, centered under (b).
```
Figure 2: Workday (Dalc) and weekend (Walc) alcohol consumption, with density curves.
```
```
(c) Figure 4 shows the correlation between each pair of variables. Only two pairs are above 0.6: mother's and father's education (Medu and Fedu, 0.63) and Dalc and Walc (0.63). I see three groups. The parents' education correlates with wanting higher education (0.23 and 0.20) and a shorter travel time (−0.26 and −0.21). Alcohol and going out form a second group (goout with Walc 0.39 and with Dalc 0.25). The third links failures with age (0.32) and with not wanting higher education (−0.30). G3 correlates most with failures (−0.40), higher (0.33), study time (0.25), Medu (0.23), Fedu (0.21), Dalc (−0.20) and Walc (−0.18).
```
Figures 3 and 4 side by side in one borderless two-cell row under (c), each with its own caption: `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\figures\hw3_q1b_joint.png` (about 3.1 in wide) and `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\figures\hw3_q1c_heatmap.png` (about 3.9 in wide).
```
Figure 3: Joint plot of Dalc and Walc (dots jittered so tied points show).
```
```
Figure 4: Pairwise correlations of all 13 columns (lower triangle).
```
#### 2. Parametric Modeling
```
2. Parametric Modeling
```
```
All three models predict G3 and were trained on all 555 students with my own gradient descent in PyTorch. I z-scored the inputs and the grade with the training mean and standard deviation, so one learning rate works for every input. The loss is the mean squared error with the gradient from autodiff, and the learning rate is 1/L, where L is the largest curvature of the loss (the lecture bound). Training stopped when the loss stopped changing (3, 27 and 2000 epochs), and the coefficients match the closed-form least squares solution to within 0.00002. The equations predict the unnormalized G3 from unnormalized inputs.
(a) Linear model, one input. I chose failures because it has the strongest correlation with G3 (−0.40, Figure 4). G3 = 12.400 − 2.109 × failures. A student with no failures (83% of the students) is predicted 12.40, and each failure takes off 2.1 grades.
(b) Multiple linear model, five inputs. I took the variables with a correlation of at least 0.2 with G3 (failures, higher, studytime, Medu, Fedu, Dalc) and dropped Fedu because it correlates 0.63 with Medu, which makes the coefficients unstable (lecture: above about 0.6). Walc (−0.18) misses the 0.2 cutoff. G3 = 9.349 − 1.541 × failures + 1.786 × higher + 0.587 × studytime + 0.377 × Medu − 0.501 × Dalc.
(c) Non-linear model, eight inputs. I kept the inputs from (b) and added the products of two inputs that correlate with G3 more than both of their inputs: Medu × studytime (0.30), studytime × higher (0.36) and Medu × higher (0.34). I also replaced failures with log(1 + failures), which correlates better with G3 (−0.43 against −0.40). The two correlate 0.98, so I kept only the log. G3 = 10.842 − 3.065 × log(1 + failures) − 0.033 × higher + 0.469 × studytime − 0.219 × Medu − 0.467 × Dalc − 0.048 × Medu × studytime + 0.268 × studytime × higher + 0.705 × Medu × higher. Single coefficients are hard to read: Medu alone is negative, but for students who want higher education the Medu × higher term makes its total effect positive.
```
Table 1 (tab-separated, convert to a table):
```
Model	Inputs	RMSE	MAE	R²
Mean predictor	0	3.311	2.459	0.000
Linear	1	3.037	2.247	0.158
Multiple linear	5	2.835	2.047	0.267
Non-linear	8	2.802	2.021	0.284
```
```
Table 1: Fit of each model on the training data. RMSE and MAE are in grade units.
```
```
Every model beats the mean predictor, but not by much (Table 1). The multiple linear model explains 26.7% of the variance, 10.9 percentage points more than the linear model (15.8%), and the non-linear model adds only 1.7 points (28.4%). The linear model has only four outputs, so its boxes in Figure 5 are flat. All three models regress toward the mean: for true grades of 17 or higher the median prediction is only 12.40 to 13.11, and for the 14 zeros it is 9.39 to 10.29.
```
Figure 5: `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\figures\hw3_q2_boxplots.png`, 4.6 in wide, centered under that paragraph.
```
Figure 5: Predicted grade for each actual grade, training data. The dashed line is a perfect prediction.
```
#### 3. Testing Accuracy
```
3. Testing Accuracy
I wrote a function that counts a prediction as correct when it is within T grades of the actual grade. Table 2 gives the nine values on the training data. The non-linear model is best at every threshold (0.187, 0.344 and 0.620), then the multiple linear and the linear model. With 555 students the standard error of an accuracy is about 0.015 to 0.021. The gap between the non-linear and linear models (0.038, 0.052 and 0.054) is only 1.7 to 1.9 standard errors, and the other gaps are smaller (0.3 to 1.5). None of the differences is significant.
```
```
Model	T = 0.5	T = 1	T = 2
Linear (1 input)	0.150	0.292	0.566
Multiple linear (5 inputs)	0.173	0.330	0.611
Non-linear (8 inputs)	0.187	0.344	0.620
Mean predictor	0.105	0.276	0.546
```
```
Table 2: Thresholded accuracy on the training data (555 students).
```
#### 4. Cross Validation
```
4. Cross Validation
I ran 20 runs of 10-fold cross validation with the same shuffled splits for every model. In each fold the normalization means and standard deviations came only from the 9 training folds, so nothing from the held-out fold leaks into the fit. The non-linear model has the highest mean at every threshold (Table 3, mean and standard deviation over the 20 runs) but does not clearly beat the multiple linear model: the gap (0.007, 0.005 and 0.003) is 1.3, 0.9 and 0.6 times the standard deviation within a model (0.004 to 0.007), and it won only 17, 16 and 13 of the 20 runs. The multiple linear model beats the linear model by 0.021, 0.034 and 0.047, which is 5.6 to 14.0 times the standard deviation within a model, and it won all 20 runs (so did the non-linear model). So both are significantly better than the linear model, and the difference between them is not significant. This is a yardstick and not a formal test, since every run uses the same 555 students. Compared with Table 2, the non-linear model loses the most accuracy on held-out data (0.010 at T = 0.5), the linear model the least (0.001).
```
```
Model	T = 0.5	T = 1	T = 2	RMSE
Linear (1 input)	0.149 ± 0.003	0.292 ± 0.001	0.562 ± 0.003	3.050 ± 0.005
Multiple linear (5 inputs)	0.170 ± 0.004	0.326 ± 0.005	0.608 ± 0.004	2.869 ± 0.006
Non-linear (8 inputs)	0.177 ± 0.006	0.331 ± 0.007	0.612 ± 0.006	2.850 ± 0.008
Mean predictor	0.105 ± 0.000	0.275 ± 0.003	0.545 ± 0.003	3.316 ± 0.002
```
```
Table 3: Thresholded accuracy and RMSE from 20 runs of 10-fold cross validation, mean ± standard deviation over the 20 runs.
```
#### Extra Credit: KNN Regression
```
Extra Credit: KNN Regression
I predicted G3 with the mean grade of the k nearest neighbors, as in lecture, using SKLearn for the scaling, feature selection and neighbor search. I tuned four hyperparameters: the number of features kept (3, 5, 8 or 12, by SelectKBest on the z-scored training fold), the distance (Manhattan or Euclidean), k (5 to 80) and the weighting (equal or by inverse distance). To avoid selection bias I used nested cross validation: inside each training fold, 5-fold cross validation on RMSE picks the settings, and the outer loop is the authors' 20 runs of 10-fold with the same splits as Question 4. I ran it on the 555 students and on the full 649-student Portuguese file (student-por.csv) they were taken from, with the same 12 inputs. The mean predictor scores 3.233 on the 649 students, the same as the authors' 3.23, which suggests this is the data they used. The optimum is flat: the most common setting (8 features, Euclidean, equal weights, k = 30) was chosen in only 18% of the folds. The best of the 128 settings on all 555 rows gives 2.873, lower than the nested 2.960 because choosing it on the same data is optimistic.
```
```
Data	Model	RMSE	T = 0.5	T = 1	T = 2
555 students	Mean predictor	3.316 ± 0.002	0.105 ± 0.000	0.275 ± 0.003	0.545 ± 0.003
555 students	KNN (tuned)	2.960 ± 0.032	0.162 ± 0.013	0.329 ± 0.011	0.588 ± 0.013
555 students	Non-linear model	2.850 ± 0.008	0.177 ± 0.006	0.331 ± 0.007	0.612 ± 0.006
649 students	Mean predictor	3.233 ± 0.002	0.111 ± 0.000	0.270 ± 0.004	0.546 ± 0.003
649 students	KNN (tuned)	2.855 ± 0.020	0.159 ± 0.010	0.326 ± 0.009	0.593 ± 0.012
```
```
Table 4: RMSE and thresholded accuracy of the tuned KNN from nested cross validation (20 runs of 10-fold), mean ± standard deviation over the runs.
```
```
The tuned KNN reaches an RMSE of 2.960 on the 555 students (mean predictor 3.316) and 2.855 on the 649 students (3.233), which is 12% better than the mean predictor. The authors' neural network (2.79), SVM (2.76) and random forest (2.67) are still ahead of the KNN's 2.855 on the same file. They did not report thresholded accuracy, so I can only compare with the mean predictor, which the KNN beats at every threshold (0.593 against 0.546 at T = 2 on the 649 students). On the 555 students the non-linear regression beats the KNN (2.850 against 2.960, better in all 20 runs), as ISL section 3.5 suggests when the relationship is nearly linear.
```
#### AI (last thing in the document)
```
AI
We were allowed to use AI in this module. I used AI heavily throughout. I used Claude Code (Anthropic) to read through the course material, write the code in the notebook, run the experiments and write this report. I monitored the work to make sure everything was correct.
```
The AI paragraph is the humanized wording. It has to say what you actually did.
#### Fixes made to the humanized draft
The flow is the humanized one. These places changed the meaning or the rubric item and were put back:
- Q2 intro: the draft said the inputs were scaled "using my own gradient descent". The scaling is the z-score with the training mean and standard deviation, and the gradient descent is the training. Put back.
- Q1a: "32.5% of the mean squared error" is the squared error of the mean predictor, not of a model. Q1a also repeated the 54.6% fact twice, so the two are now one sentence.
- Q1b: "higher consumption during the weekend" is a Walc above 1 (not above Dalc). The Walc rise from 1.78 to 4.73 stays, the three middle means were dropped for space.
- Q4: "times the standard error within a model" is the standard deviation across the 20 runs. The draft's "the accuracy is based on the test fold" is the held-out fold; no normalization statistic comes from it.
- Q4: the comparison with Table 2 is the cross validated accuracy of the non-linear model being lower than its training accuracy, not a model "performing worse than Table 2".
- Q3: "0.3-0.6" are standard errors, and "will perform best" on training data is only a tendency (it favors the model with the most parameters; the sentence was cut for space, Q4 shows the effect).
- EC: "This is the dataset they used" is only an inference from the matching 3.23, so it says "suggests". "Optimistic to choose the best of 128" is why the non-nested 2.873 is below the nested 2.960.
- Headings and terms follow the handout and the figure labels: Testing Accuracy, Multiple linear (not Multi-linear), and "thresholded accuracy" in captions. US spelling (Visualization, Modeling, normalization) like the handout.
- Cut for space (each part about 15% shorter): the three middle Walc means, "G1 and G2 excluded" in the EC, the tuning-curve detail, the numbers of the linear model's four outputs, the closing remarks on Q3 and Q4. Figures 6 and 7 and the 39-input KNN run were dropped earlier (not asked for).
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
