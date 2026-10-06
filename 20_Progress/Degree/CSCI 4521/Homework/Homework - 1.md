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
next: "Build the Word report from the Report Content section below (Word assembly steps at the bottom), export it to PDF, then submit the PDF and CSCI4521_HW1.ipynb on Canvas inside the 24-hour grace window."
---
# Homework - 1
## Overview
HW1 (KNN, classification, metrics) uses the supplied 777-row `PhiUSIIL_HW1_777.csv`. Two deliverables: the Jupyter notebook (Q1 and Q2 must run and produce the dataframe and the pairplot) and a PDF report answering Q3, Q4 and Q5, clearly split by question and backed by many figures.
> [!DANGER] Deadline
> The assignment PDF says **due Monday, Oct 05**. The syllabus gives an automatic 24-hour zero-penalty grace period, and nothing is accepted after it. The Board's schedule lists "HW1 due" on Tue 10/6. Check the exact cutoff time on Canvas before anything else.
## Files
| What | Where |
|---|---|
| Notebook (submit) | `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\CSCI4521_HW1.ipynb` |
| Report figures (Figure 1 to 8) | `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\figures\` |
| Dataset | `...\Code\Homework\PhiUSIIL_HW1_777.csv` (the full 235,795-row archive is not used) |
| Assignment and sample report | `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Homework\homework 1.docx.pdf`, `hw1ML.pdf` |
| Environment | conda env `csci-4521` from `...\Code\environment.yml`, kernel **Python (CSCI 4521)** |
The notebook is already executed with all outputs saved. It uses a fixed seed (`np.random.seed(4521)`), so Restart and Run All reproduces every number below exactly (about one minute).
## How the notebook is built (professor's methods)
- Loading and exploring with `pd.read_csv`, `df.head()`, `value_counts()`, `groupby().mean()` as in lecture 0.1 and the Week 1 pandas tutorial.
- `sns.pairplot(df, vars=..., hue="phishing")` exactly as in lecture 0.1.
- Hand-written `train_test_split(X, y, test_percent)` using `np.random.permutation`, the `knn_classifier(k)` closure around `KNeighborsClassifier`, and an `avg_metrics` loop over 100 random splits, all copied in structure from lecture 1.3 (`avg_accuracy`).
- z-score normalization `(x - mean) / std` from lecture 1.1, but computed from the training rows only.
- The train-vs-test-vs-k line plot uses `pd.melt` and `sns.lineplot(hue="variable")` as in lecture 1.3.
- Decision-region maps use the lecture 1.2 `graphClassifier2D` recipe (`np.meshgrid`, `pcolormesh`, `ListedColormap`).
- Precision, recall, accuracy and F1 are written by hand from TP/FP/FN/TN counts and checked once against scikit-learn.
## Report Content
Everything below is the text, tables and figures for the PDF, in order. All numbers come from the executed notebook. Bold labels like **Figure 3** say where an image goes. Copy the text as written.

### Header and title
- Page header: `CSCI 4521` (left), `Anant Gupta` (center), `October 6, 2026` (right)
- Title block (centered): **HW 1** / Anant Gupta / October 2026, then a horizontal line.

### 1. Data Preparation and 2. Data Visualization (summary)
The notebook loads `PhiUSIIL_HW1_777.csv` into one dataframe (777 rows, 18 columns, no missing values) and adds a `phishing` column equal to 1 when `Label = 0`. 333 of the 777 webpages (42.9%) are phishing and 444 (57.1%) are legitimate. This matters for Q4 because the classes are not balanced: a classifier that calls every page legitimate is already about 57% accurate while catching no phishing at all, so accuracy alone can hide a useless model. Precision, recall and F1 with phishing as the positive class are needed. For Q2, the four features with the strongest correlation to `phishing` were plotted: `HasSocialNet` (r = -0.78), `SpecialCharRatioInURL` (r = +0.62), `DomainTitleMatchScore` (r = -0.59) and `NoOfJS` (r = -0.57). They also describe four different parts of a page: its social links, its URL, its branding, and how much real code it has.

**Figure 1** `fig1_pairplot.png`. Caption: *Figure 1: Pairwise plots of the four chosen features, colored by phishing (orange = phishing).*

### 3. Data Analysis
From the pair plots in Figure 1, there are clear trends. The strongest is `HasSocialNet`: only 1.2% of phishing pages link to social networks, compared with 80% of legitimate pages, and of the 359 pages that do have social links only 1.1% are phishing (Figure 2). `DomainTitleMatchScore` is almost all-or-nothing: phishing pages pile up at 0 (mean 13.9) while legitimate pages pile up at 100 (mean 72.7), meaning a phishing page's title usually does not match its own domain. Phishing pages also load very few scripts (mean `NoOfJS` of 1.2 against 17.6) and have more special characters in the URL (mean ratio 0.090 against 0.047); in fact every one of the 34 pages with a special-character ratio of 0.14 or more is phishing. The pairs separate even better than single features: in the `SpecialCharRatioInURL` vs `DomainTitleMatchScore` panel, pages with a title mismatch *and* a high special-character ratio are almost all orange, while pages with a matching title and a clean URL are almost all blue. The classes still overlap (some legitimate pages also have no social links or a title score of 0), so no single feature is a reliable rule on its own, and these are correlations in this dataset, not causes. Figure 2 checks the other yes/no features: every one of the 138 pages without HTTPS is phishing, and pages without a favicon or without a responsive layout are phishing well above the 43% base rate.

**Figure 2** `fig2_warning_signs.png`. Caption: *Figure 2: Fraction of pages that are phishing when each yes/no feature is absent (0) or present (1); dashed line is the overall rate (43%).*

My recommendation for a company is to check these warning signs first, and to flag a page when several of them appear together rather than relying on one:
1. No links to social networks.
2. A page title that does not match the domain name (a score near 0).
3. A URL with an unusually high share of special characters (above roughly 0.10 to 0.14).
4. A "thin" page with almost no JavaScript or external references.
5. No HTTPS. In this data every non-HTTPS page was phishing, but HTTPS is *not* proof of safety: 58.6% of the phishing pages also used HTTPS.

Signals that are cheap for an attacker to fake (like adding social media links, see 5c) should be weighed less than signals that are hard to fake, like the URL structure and whether the title matches the domain.

### 4. Model Evaluation
**Setup.** The webpages were shuffled once and split into a training set of 520 pages (two thirds, 44.0% phishing) and a testing set of 257 pages (one third, 40.5% phishing). Both sets come from one shuffled ordering, so no page appears in both. Each KNN model z-score normalizes the features using the *training* mean and standard deviation, and applies the same values to the testing data, so no information from the test set leaks into the model. Normalizing is needed because `DomainTitleMatchScore` runs from 0 to 100 while `SpecialCharRatioInURL` only runs from 0 to 0.18; without it the title score would dominate every distance. The four classifiers are KNN with small k = 3, KNN with large k = 151, a classifier that says every page is phishing, and a classifier that says no page is phishing. Phishing is the positive class for every metric.

**(a) Features.** I used the same four features as Figure 1: `HasSocialNet`, `SpecialCharRatioInURL`, `DomainTitleMatchScore` and `NoOfJS`. They have the four strongest correlations with phishing, they visibly separate the two classes in the pair plots, and they cover four different kinds of evidence (social links, URL, branding, page code), so they do not repeat each other. Keeping the same features as Q2 and Q3 also means the model can be explained with the plots already shown. The values of k were chosen from Figure 3, which averages the F1-score over 100 random train/test splits: k = 3 is small and flexible, and k = 151 (about 30% of the training set) is large and smooth.

**Figure 3** `fig3_f1_vs_k.png`. Caption: *Figure 3: Average training and testing F1-score of KNN over 100 random splits for every odd k from 1 to 201.*

**Figure 4** `fig4_decision_regions.png`. Caption: *Figure 4: KNN decision regions for small and large k using two of the four features (red = predicted phishing, blue = predicted legitimate).*

**(b) Metrics.** Precision, recall, accuracy and F1 for all four classifiers (the KNN rows answer part b):

*Table 1: Training data (520 pages)*

| Classifier | Precision | Recall | Accuracy | F1 |
|---|---|---|---|---|
| KNN k = 3 | 0.957 | 0.969 | 0.967 | 0.963 |
| KNN k = 151 | 0.890 | 0.917 | 0.913 | 0.903 |
| All phishing | 0.440 | 1.000 | 0.440 | 0.611 |
| No phishing | 0.000* | 0.000 | 0.560 | 0.000 |

*Table 2: Testing data (257 pages)*

| Classifier | Precision | Recall | Accuracy | F1 |
|---|---|---|---|---|
| KNN k = 3 | 0.936 | 0.990 | 0.969 | 0.963 |
| KNN k = 151 | 0.887 | 0.904 | 0.914 | 0.895 |
| All phishing | 0.405 | 1.000 | 0.405 | 0.576 |
| No phishing | 0.000* | 0.000 | 0.595 | 0.000 |

\*The no-phishing classifier never predicts phishing, so its precision is 0/0 (undefined). It is reported as 0.

**Figure 5** `fig5_metrics.png`. Caption: *Figure 5: The four metrics for each classifier on the training and testing data.*

**Figure 6** `fig6_confusion_matrices.png`. Caption: *Figure 6: Confusion matrices of the four classifiers on the testing data.*

**(c) Training data: best and worst.**
- *Precision:* best KNN k = 3 (0.957), worst no-phishing (0, it never flags anything).
- *Recall:* best all-phishing (1.000, it flags every page so it cannot miss one), worst no-phishing (0).
- *Accuracy:* best KNN k = 3 (0.967), worst all-phishing (0.440, exactly the share of phishing pages in the training set).
- *F1:* best KNN k = 3 (0.963), worst no-phishing (0).

Why: KNN with k = 3 is the most flexible model. On training data each page is its own nearest neighbor, so it nearly memorizes the training set; Figure 3 shows the extreme case, k = 1, with an average training F1 of 0.995. KNN with k = 151 votes over 151 neighbors, so its boundary is smooth (Figure 4) and it misclassifies pages that sit close to the other class: it has higher bias. The two constant classifiers ignore the features entirely, so their scores only reflect the class balance: all-phishing gets perfect recall but precision and accuracy equal to the 44% phishing rate, and no-phishing gets 56% accuracy while catching nothing.

**(d) Testing data: best and worst.**
- *Precision:* best KNN k = 3 (0.936), worst no-phishing (0).
- *Recall:* best all-phishing (1.000), worst no-phishing (0). KNN k = 3 is close behind at 0.990: it missed only 1 of the 104 phishing pages (Figure 6).
- *Accuracy:* best KNN k = 3 (0.969), worst all-phishing (0.405).
- *F1:* best KNN k = 3 (0.963), worst no-phishing (0).

Why: the ranking is the same as on the training data, which shows the KNN models generalize to pages they never saw. The testing data is the honest measure. Figure 3 averages over 100 splits: k = 1 drops from 0.995 training F1 to 0.940 testing F1 (overfitting, high variance), k = 3 goes from 0.967 to 0.950, the best k = 7 reaches 0.955, and k = 151 scores about the same on both (0.904 and 0.905) but lower (underfitting, high bias). On this particular split KNN k = 3 even scored slightly higher on testing accuracy than training accuracy; that is luck of the split, since the testing set happens to have fewer phishing pages (40.5%). In the confusion matrices, k = 3 made 7 false alarms and 1 missed phishing page, while k = 151 made 12 false alarms and missed 10. Notice that the useless no-phishing classifier has a higher testing accuracy (0.595) than the all-phishing classifier (0.405), only because legitimate pages are the majority. This is why accuracy alone is misleading here.

**How to weigh the metrics.** For phishing detection a missed phishing page (false negative) can mean stolen passwords or money, while a false alarm (false positive) costs a user some inconvenience. So recall matters most. But recall alone is not enough: the all-phishing classifier has perfect recall and is useless, because if almost every warning is a false alarm users learn to ignore them, which is what precision measures. F1 balances the two, so it is the best single number for comparing these models. Accuracy is the least useful because it rewards simply guessing the majority class.

**(e) Recommendation.** I recommend KNN with the small k (k = 3). It has the best testing precision, accuracy and F1, and almost perfect recall (0.990) without the flood of false alarms of the all-phishing classifier. Figure 3 suggests k = 7 is even slightly better on average, so a small k between about 3 and 9 is the right range, and that is the model used in Q5.

### 5. Applying the Model
**(a) Expectation.** Before running any model I expect this webpage to be **phishing**. Compared with the class averages (Table 3), almost every strong signal points that way: it has no social network links (80% of legitimate pages do, only 1.2% of phishing pages do), a domain-title match score of 0, only 4 JavaScript references and 3 external references (phishing pages average 1.2 and 1.5; legitimate pages 17.6 and 83.8), a special-character ratio of 0.146 (higher than the phishing average, and every page in the data at 0.14 or above is phishing), a digit ratio of 0.122 and a non-responsive layout. The signs pointing the other way are HTTPS and a favicon, but 58.6% of phishing pages also use HTTPS, and a password field on a page that does not match its own domain is exactly what a credential-stealing page looks like.

*Table 3: The new webpage compared with the average legitimate and phishing page*

| Feature | New page | Legitimate mean | Phishing mean |
|---|---|---|---|
| HasSocialNet | 0 | 0.800 | 0.012 |
| SpecialCharRatioInURL | 0.146 | 0.047 | 0.090 |
| DomainTitleMatchScore | 0 | 72.685 | 13.880 |
| NoOfJS | 4 | 17.583 | 1.171 |
| NoOfExternalRef | 3 | 83.788 | 1.532 |
| DigitRatioInURL | 0.122 | 0.002 | 0.069 |
| IsResponsive | 0 | 0.824 | 0.360 |
| IsHTTPS | 1 | 1.000 | 0.586 |
| HasFavicon | 1 | 0.527 | 0.108 |
| HasPasswordField | 1 | 0.146 | 0.069 |
| LineOfCode | 550 | 1701.464 | 90.123 |

**(b) KNN prediction.** Yes. The KNN analysis predicts this webpage is **phishing (Label = 0)**.
- *k:* I used **k = 7** because it had the best average testing F1 (0.955) across 100 random train/test splits among every odd k from 1 to 201 (Figure 3). It is odd, so a vote can never tie. It is large enough not to overfit like k = 1 (0.995 training F1 against 0.940 testing F1) and small enough to follow the boundary, unlike k = 151.
- *Features:* the same four as Q4 (`HasSocialNet`, `SpecialCharRatioInURL`, `DomainTitleMatchScore`, `NoOfJS`).
- *Processing:* I entered all 17 given values as a one-row dataframe, selected the four features, and z-score normalized it with the mean and standard deviation of the 777 pages. Since k had already been chosen with the train/test splits, the final model was fit on all 777 pages.
- *Evidence:* all 7 nearest neighbors are phishing (Table 4). They all have no social links, a title score of 0, a special-character ratio between 0.139 and 0.150, and 1 to 4 scripts. Figure 7 shows the vote is not sensitive to k: the fraction of phishing neighbors is 1.00 at k = 7, still 0.99 at k = 101, and never drops below 0.87 even at k = 301. As a further check, the same KNN with all 17 features also predicts phishing.

*Table 4: The 7 nearest neighbors of the new webpage (normalized distance)*

| Row | Distance | HasSocialNet | SpecialCharRatio | DomainTitleMatch | NoOfJS | Phishing |
|---|---|---|---|---|---|---|
| 79 | 0.087 | 0 | 0.143 | 0 | 4 | 1 |
| 490 | 0.181 | 0 | 0.150 | 0 | 2 | 1 |
| 316 | 0.181 | 0 | 0.150 | 0 | 2 | 1 |
| 558 | 0.209 | 0 | 0.146 | 0 | 1 | 1 |
| 1 | 0.226 | 0 | 0.143 | 0 | 1 | 1 |
| 597 | 0.226 | 0 | 0.143 | 0 | 1 | 1 |
| 180 | 0.246 | 0 | 0.139 | 0 | 2 | 1 |

**Figure 7** `fig7_new_page_vote.png`. Caption: *Figure 7: Fraction of the new webpage's k nearest neighbors that are phishing, for k from 1 to 301.*

So the model agrees with my expectation from (a), and I am confident this page is phishing.

**(c) Extra credit: smallest change that flips the prediction.** I defined a small change as changing **only one feature**, measured in standard deviations of that feature. That is the same normalized distance the KNN uses, so it puts URL ratios, counts and yes/no features on the same scale. I tried every feature over its observed range (yes/no features can only be 0 or 1):

| Feature | Original | Flips at | Change (std) |
|---|---|---|---|
| HasSocialNet | 0 | 1 | 2.01 |
| NoOfJS | 4 | about 54 | 3.45 |
| SpecialCharRatioInURL | 0.146 | never | none |
| DomainTitleMatchScore | 0 | never | none |

The smallest change is **adding links to social networks** (`HasSocialNet` from 0 to 1): with that one change, none of the 7 nearest neighbors are phishing and the page is predicted legitimate. The only other single change that works is raising the JavaScript count from 4 to about 54. Changing the URL's special characters or the title score alone never flips it (Figure 8).

**Figure 8** `fig8_flip.png`. Caption: *Figure 8: Phishing vote of the k = 7 model as NoOfJS changes, with and without social network links.*

This exposes a weakness: adding a couple of social media links costs an attacker almost nothing, and the four-feature model depends on that feature heavily. When the same change is tested on a KNN that uses all 17 features, the page is still predicted phishing. So a real detector should use more, harder-to-fake features rather than only the four strongest ones.

### AI use (put at the end of the report)
AI assistants (OpenAI Codex and Anthropic Claude Code) were used to help organize the analysis, write plotting code, and draft parts of this report. I ran the notebook, checked every number and figure, and I am responsible for all submitted work.

## Word assembly
1. New blank Word document. Layout: Letter, 1-inch margins. Font: Cambria or Latin Modern 11 pt (closest to the sample's LaTeX look), line spacing 1.0 to 1.15.
2. Insert, Header, Blank (Three Columns): `CSCI 4521` | `Anant Gupta` | `October 6, 2026`. Add a bottom border to the header paragraph so it matches the sample's rule. Insert, Page Number, Bottom of Page, centered.
3. Title block centered: **HW 1** (14 pt), then name, then `October 2026`, then a horizontal line (type `---` and press Enter).
4. Add the section headings as a numbered list exactly as in Report Content: `1 and 2` summary, `3. Data Analysis`, `4. Model Evaluation`, `5. Applying the Model`. Use (a), (b), (c) sub-items for Q4 and Q5 like the sample.
5. Images: Insert, Pictures, This Device, from `Code\Homework\figures\`. Set each to *In Line with Text*. Widths: Figure 1 at 6.0 in; Figures 3, 7, 8 at 4.5 to 5.0 in; Figures 2, 4, 5, 6 at full text width (6.5 in). Center them.
6. Captions: right-click each image, *Insert Caption*, label `Figure`, position *Below selected item*, and paste the caption text. Word numbers them automatically, so insert them in order 1 to 8.
7. Tables: Insert, Table with the column counts shown, paste the values, style *Plain Table 1* or *Table Grid*, 10 pt, centered. Add the table caption above each table (*Insert Caption*, label `Table`, *Above selected item*).
8. Keep each figure next to the paragraph that cites it. Use Home, Paragraph, Line and Page Breaks, *Keep with next* on captions so a caption never splits from its image.
9. Proofread every number against the notebook's saved outputs, then File, Save As, PDF (`CSCI4521_HW1_Report.pdf`). Open the PDF and check every figure and table rendered.
Length: the assignment sets no word or page limit, and asks for many figures. Expect about 6 to 8 pages with all 8 figures and 4 tables.
## Work log
1. **2026-10-05 - prompt and course alignment recorded**
	The assignment maps to Unit 1 (CSV data, KNN, classification metrics). The supplied 777-row CSV is the data source; the full ZIP dataset is out of scope.
2. **2026-10-05 - Codex build (superseded)**
	Codex produced a notebook with sklearn Pipelines and DummyClassifier, an `Agg` backend that hid inline plots, and a matplotlib-generated `artifacts/HW1_Report.pdf` that did not resemble the sample report. Its environment work pinned numpy 1.26 and matplotlib 3.8 while chasing a crash whose real cause was MKL needing conda activation.
3. **2026-10-06 - rebuilt with Claude Code**
	Notebook rewritten in the professor's lecture style (see How the notebook is built), executed end to end through the registered `Python (CSCI 4521)` kernel with outputs saved, eight purposeful figures written to `figures/`, and Codex's `artifacts/` folder deleted. Environment fixed by switching the env's BLAS to OpenBLAS (`libblas=*=*openblas`) and removing the stale pins, so the kernel works with or without conda activation.
## Concepts used
- [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|K-nearest neighbors and the bias-variance trade-off]]: small k is flexible (low bias, high variance), large k is smooth (high bias, low variance), shown by Figures 3 and 4.
- [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|Training vs test error]]: training scores flatter flexible models; k is chosen from averaged held-out F1.
- [[CSCI 4521 Board|Precision, recall, F1, confusion matrix]]: phishing is the positive class; false negatives are the costly error.
## Submission checklist
- [ ] Confirm the Canvas cutoff (due Mon 10/5 plus 24-hour grace).
- [ ] Open `CSCI4521_HW1.ipynb` in VS Code, kernel **Python (CSCI 4521)**, Restart and Run All, confirm the numbers match this note, save.
- [ ] Build the Word report from Report Content, export `CSCI4521_HW1_Report.pdf`, reopen and check it.
- [ ] Upload both files to Canvas and record the submission time here.
## Submission
Not submitted yet.
## Post-submit reflection
Complete after grading or substantive feedback.
- What failed first?
- What pattern repeats?
