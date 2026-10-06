---
type: class
input_kind: homework
status: active
created: 2026-10-05
updated: 2026-10-06
area:
  - "[[CSCI 4521 Board]]"
deadline: 2026-10-05
tags:
  - "#class"
  - "#Homework"
next: "Restart and Run All in the notebook, build the 3 page Word report from the Report Content section, export to PDF, then submit the PDF and the notebook on Canvas inside the 24-hour grace window."
---
# Homework - 1
## Overview
HW1 (KNN, classification, metrics) on the supplied 777-row `PhiUSIIL_HW1_777.csv`. Two deliverables: the notebook (Q1 dataframe and Q2 pairplot must run) and a PDF report answering Q3, Q4 and Q5 with figures. The assignment PDF says due Monday Oct 05. The syllabus gives an automatic 24-hour zero-penalty grace period and nothing after it, so confirm the exact cutoff on Canvas.
## Files
- Notebook (submit): `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\CSCI4521_HW1.ipynb` (about 0.25 MB, kernel Python (CSCI 4521))
- Report figures: `...\Code\Homework\figures\` (`fig1_pairplot.png`, `fig2_f1_vs_k.png`, `fig3_metrics.png`)
- Assignment and sample report: `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Homework\homework 1.docx.pdf` and `hw1ML.pdf`
## Report Content
HW 1
Anant Gupta
October 2026

Figure 1: Pairwise scatter plots of the four chosen features, colored by phishing (orange = phishing, blue = legitimate).

1-2. Data Preparation and Visualization
The notebook loads PhiUSIIL_HW1_777.csv and adds a phishing column (1 when Label = 0). 333 of 777 pages (42.9%) are phishing, so always guessing legitimate is already 57.1% accurate while catching no phishing; Q4 therefore also uses precision, recall and F1. Figure 1 plots the four features most correlated with phishing (HasSocialNet r = -0.78, SpecialCharRatioInURL r = 0.62, DomainTitleMatchScore r = -0.59, NoOfJS r = -0.57).

3. Data Analysis
Figure 1 shows clear trends. HasSocialNet separates the classes best: 80.0% of legitimate pages link to social networks but only 1.2% of phishing pages do. DomainTitleMatchScore is nearly all or nothing (phishing mean 13.9, legitimate mean 72.7), phishing pages load far fewer scripts (NoOfJS mean 1.2 vs 17.6), and they have a higher special character ratio (0.090 vs 0.047). The classes still overlap and these are correlations, not causes, so no single feature is a perfect rule; a rigid rule would have high bias, so a flexible but smooth model such as KNN with a middle k is a good choice. A company should check first whether a page links to social networks, whether its title matches its domain, and whether its URL has an unusually high share of special characters, and flag pages with several of these together. HTTPS alone should not be trusted: every legitimate page uses it, but so do 58.6% of phishing pages.

4. Model Evaluation
I shuffled the data once into 520 training pages (two thirds) and 257 testing pages (one third) with no overlap, and z-score normalized the features using the training mean and standard deviation (also applied to the test pages), since DomainTitleMatchScore (0 to 100) would otherwise dominate SpecialCharRatioInURL (0 to 0.18). Phishing is the positive class.

(a) I used the same four features as Figure 1: they have the strongest correlation with phishing and measure different parts of a page. Figure 2 averages F1 over 100 random splits for each odd k; I chose small k = 3 and large k = 151.

Figure 2: Average training and testing F1-score of KNN over 100 random splits for each odd k.

(b) KNN with k = 3 scored (precision, recall, accuracy, F1) 0.957, 0.969, 0.967, 0.963 on training and 0.936, 0.990, 0.969, 0.963 on testing. KNN with k = 151 scored 0.890, 0.917, 0.913, 0.903 on training and 0.887, 0.904, 0.914, 0.895 on testing. All phishing scored 0.440, 1.000, 0.440, 0.611 on training and 0.405, 1.000, 0.405, 0.576 on testing. No phishing scored 0, 0, 0.560, 0 on training and 0, 0, 0.595, 0 on testing (precision is 0/0, reported as 0).

Figure 3: Precision, recall, accuracy and F1 of the four classifiers (phishing is the positive class).

(c) On training data, KNN k = 3 is best on precision (0.957), accuracy (0.967) and F1 (0.963), all phishing is best on recall (1.000), no phishing is worst on precision, recall and F1 (0), and all phishing is worst on accuracy (0.440). Every training page is its own nearest neighbor, so small k nearly memorizes the data (k = 1 reaches a training F1 of 0.995) while k = 151 smooths over the class boundary. The constant classifiers ignore the features: all phishing flags everything (perfect recall, but precision and accuracy equal the 44% phishing share) and no phishing flags nothing.

(d) On testing data the ranking is the same: KNN k = 3 is best on precision (0.936), accuracy (0.969) and F1 (0.963), all phishing is best on recall (1.000, with k = 3 close at 0.990), no phishing is worst on precision, recall and F1, and all phishing is worst on accuracy (0.405). Averaged over 100 splits (Figure 2), k = 3 falls from a training F1 of 0.967 to a testing F1 of 0.950 and k = 1 from 0.995 to 0.940 (the variance of a flexible model), while k = 151 scores about the same on both (0.904 and 0.905) but lower (the bias of a smooth model).

(e) I recommend KNN with a small k. A missed phishing page (false negative) is the costly error, so recall matters most, but all phishing has perfect recall and is useless (precision 0.405), and accuracy is misleading (no phishing scores 0.595 while catching nothing). KNN k = 3 has the best F1 and on the test data missed 1 of 104 phishing pages with 7 false alarms among 153 legitimate pages.

5. Applying the Model
(a) I expect phishing. The page has no social network links, a title match score of 0 and only 4 scripts, which fit the phishing means (0.012, 13.9, 1.2) far better than the legitimate means (0.800, 72.7, 17.6), and its special character ratio of 0.146 is well above the legitimate mean of 0.047. HTTPS and a favicon point to legitimate, but 58.6% of phishing pages also use HTTPS.

(b) Yes, KNN predicts phishing (Label = 0). I used k = 7, the odd k with the best average testing F1 (0.955) over 100 random splits (Figure 2): big enough to avoid the overfitting of k = 1 (test F1 0.940) and small enough to avoid the underfitting of k = 151 (0.905). I used the same four features as Q4, z-score normalized with the mean and standard deviation of all 777 pages (the final model uses every page since k was already chosen), and normalized the new page the same way. All 7 nearest neighbors are phishing, so I believe this page is phishing.

(c) Extra credit: I define a small change as changing one feature, measured in standard deviations of that feature (the distance KNN uses after normalization). Searching each feature over its observed range, the smallest flip is adding social network links (HasSocialNet 0 to 1, 2.01 standard deviations), which makes the prediction legitimate. The only other flip is raising NoOfJS from 4 to about 54 (3.45 standard deviations). Social links are cheap to add, so a real detector should not rely on this feature alone.

AI use: OpenAI Codex and Anthropic Claude Code helped with the analysis and code. I ran the notebook, checked every result, and am responsible for this work.
## Word Assembly
Copy `## Report Content` from source mode (Ctrl+E in Obsidian), because reading mode strips list-looking numbers like "3.". In Word use Paste Special, Unformatted Text. The report has no math markup, so nothing needs LaTeX.
1. Whole document: Times New Roman 12 pt, Letter, 1-inch margins, single line spacing, 6 pt after paragraphs, body justified.
2. Header: `CSCI 4521`, Tab, `Anant Gupta`, Tab, `October 6, 2026` (same font), with a bottom border like the sample.
3. First three lines (`HW 1`, name, `October 2026`) centered, with a bottom border under the last one.
4. Section titles (`1-2.`, `3.`, `4.`, `5.`) in bold.
5. Insert each image from `Code\Homework\figures\` directly above its caption line, centered, In Line with Text. Widths: Figure 1 5.0 in, Figure 2 3.4 in, Figure 3 5.4 in. Center the caption lines.
6. Check the page count is 3 (tested in Word with these settings, last page about half an inch from full). If it spills, set space after to 0 pt or shrink Figure 2 and Figure 3 slightly. Then File, Save As, PDF.
## Notebook
Follows the lecture style: `train_test_split` with `np.random.permutation`, the `knn_classifier(k)` closure and the 100-split averaging loop from lecture 1.3, z-score normalization from lecture 1.1 (training data only), `sns.pairplot` and `pd.melt` plus `sns.lineplot` from lectures 0.1 and 1.3. Seed is fixed (`np.random.seed(4521)`), so Restart and Run All reproduces every number above (about 1 minute).
## Submission checklist
- [ ] Confirm the Canvas cutoff
- [ ] Notebook: Restart and Run All, confirm the numbers match this note, save
- [ ] Word report: build, check 3 pages, export PDF, reopen to check
- [ ] Upload the PDF and `CSCI4521_HW1.ipynb`, record the time below
## Submission
Not submitted yet.
## Work log
- 2026-10-05: Codex build replaced (sklearn pipelines, hidden plots, report PDF unlike the sample, MKL crash misdiagnosed as a package pin problem).
- 2026-10-06: Notebook rebuilt in the lecture style and trimmed to 3 report figures. Environment fixed by switching the conda BLAS from MKL to OpenBLAS. Report cut to 3 pages. Codex `artifacts/` deleted.
## Concepts used
[[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|KNN, train/test error and the bias-variance trade-off]], and [[CSCI 4521 Board|precision, recall and F1]] with phishing as the positive class.
## Post-submit reflection
- What failed first?
- What pattern repeats?
