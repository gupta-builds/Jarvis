---
type: class
input_kind: board
status: sprout
created: 2026-09-07
updated: 2026-09-15
area:
  - "[[Fall'26 Syllabus]]"
  - "[[APAS]]"
tags:
  - "#class"
next: "Source the real Deep Learning Book PDF before 2026-09-29 (Week 4) - the local 'Secondary Textbook.pdf' is actually ENLP, not DLB, see the correction below. Separately confirm on Canvas that the instructor, TAs, meeting time, and location below are actually current for Fall'26 - the source PDF is dated Fall 2025."
---
# CSCI 4521 — Applied Machine Learning
Fall'26, 3 credits. CSCI-designated Technical Elective. Per [[APAS]] this is the class that closes Upper-Division Major Credits exactly at 19/19 - nothing else in the current plan does that on its own. Syllabus read in full from the source folder, 2026-09-10.
## Source of Truth
`D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521` is the real folder for this course - it holds `Textbook & Resources/` (the syllabus PDF plus two large book PDFs) and `Lectures/` (now full of real decks and Colab notebooks for Weeks 1-3, see [[20_Progress/Degree/Repetitive Things|Repetitive Things]]). Desktop shortcut: `CSCI 4521.lnk` in `D:\_Anant\Inbox\`.
> [!DANGER] Correction, 2026-09-27 — the local "Secondary Textbook.pdf" is not the Deep Learning Book
> Opened directly and searched with `pdftotext` this session: zero matches for "Capacity, Overfitting" or "Goodfellow," 125 matches for "word embedding," 38 for "Pilehvar." The file is actually ***Embeddings in Natural Language Processing*** (Pilehvar & Camacho-Collados) — this course's real **ENLP** reading, which the Textbook Map used to say had "no local copy." **The real Deep Learning Book (DLB) has no local copy anywhere in this folder.** Every DLB-sourced reading (weeks 1, 2, and every week after) is blocked until the real file is sourced from deeplearningbook.org or Canvas. Full writeup: [[20_Progress/Degree/CSCI 4521/Textbook/Textbook Map|Textbook Map]].
The real week-by-week schedule (below) does **not** come from the syllabus PDF - the syllabus itself has no calendar (see Topics section). It comes from the professor's own course schedule spreadsheet, pasted directly by the user 2026-09-15: [Course Schedule Sheet](https://docs.google.com/spreadsheets/d/1ykQFKSr-Afr5yO9nzXc8Xy9lBETWd8qw5iHGGMoErrk/edit?gid=0#gid=0). Three resources that spreadsheet names are not in the local source folder yet: an **ENLP** reading (exact title unconfirmed - referenced only as "ENLP" in the sheet, likely a third course text beyond ISL/DLB, not yet identified), a **"Linear Algebra Notes"** handout, and a **"PyTorch intro series"** (tensors/autograd/building-models tutorial). Save these locally once found on Canvas.
> [!DANGER] The source syllabus PDF is dated "Fall 2025" - not confirmed current for this semester
> `Syllabus - CSCI 4521.pdf` states "Fall 2025" at the top, with instructor Bernardo Bianco Prado, meeting time Tue/Thu 2:30-3:45pm in Amundson Hall B75, and a named TA roster. None of this has been cross-checked against an actual Fall'26 Canvas page - it may be an intentionally-reused syllabus template (grading structure and topics carried forward unchanged year to year, which is common) or it may be genuinely last year's document. **Confirm the instructor, meeting time/location, and TA names on Canvas before trusting any of them** - the policies, grading breakdown, and topic list are lower-risk to reuse since that content tends to be stable across offerings, but still unconfirmed for this exact semester.
## Catalog Info (As Captured - Fall 2025 Label, Unconfirmed for Fall'26)
**Bernardo Bianco Prado** (he/him) - bianc072@umn.edu - Office Lind Hall 300H (office hours or by appointment only) - Office Hours **MWTh 1:00-2:00pm**. Meeting time as printed: **Tue/Thu 2:30-3:45pm, Amundson Hall B75.**
*Graduate TAs:* Ebasa Temesgen (temes021@umn.edu), Zhongxing Zhang (zhan8889@umn.edu).
*Undergraduate TAs:* Eddie Jang (zhan8168@umn.edu - note: this TA's listed email uses the "zhan" prefix, identical in form to Zhongxing Zhang's - possibly a copy-paste error in the source document, not something to silently correct), John Palmer (palm0545@umn.edu), Harini Kuchibhotla (kuchi027@umn.edu), Alistair White (whit3491@umn.edu), Ethan Phua (phua0003@umn.edu).
## Course Objective
An introduction to solving problems with machine learning: classifying data, supervised vs. unsupervised learning, numerical optimization, linear/non-linear regression, neural networks/deep learning - plus the practical surrounding skills (loading/cleaning datasets, visualization, model interpretation, ethics in ML). Mix of in-class discussion, hands-on coding, projects, and quizzes. Explicitly "Applied" - uses modern frameworks (PyTorch) to handle the underlying math, contrasted against CSCI 5521/5525 (which build the algorithmic/mathematical foundations directly) and CSCI 5523/5527/5541/5561 (which go deep on one specialized application area this course only introduces).
## Course Materials
**Primary, free online text:** *An Introduction to Statistical Learning, with Applications in Python* (James, Witten, Hastie, Tibshirani, Taylor) - a local copy exists at `Textbook & Resources/Primary Textbook CSCI 4521.pdf`.
**Optional, not required:** *Machine Learning System Design Interview* (Aminian & Xu) - useful for industry interview prep, no local copy; *Deep Learning Book* (Goodfellow, Bengio, Courville), free online, local copy at `Textbook & Resources/Secondary Textbook.pdf`. Neither optional book is required.
Piazza is the class discussion platform, monitored daily by staff - collaboration on questions is encouraged, but any post containing an actual homework/quiz answer gets deleted.
## Prerequisites
Comfortable Python (functions, packages, debugging) is the most important one. Also expected: intro calculus (slopes/derivatives), basic probability/stats (probabilities, multivariate Gaussians, standard deviations), basic linear algebra (vectors, basis, vector spaces). Pandas and Matplotlib get a brief in-class introduction early on, but you're expected to have the "software development maturity" to self-teach the rest from documentation.
## Class Participation & In-Class Materials
Questions are explicitly expected, including on very recent work the instructor may not have clean answers for. In-class activities (chime-in responses) are graded on completion/demonstrated effort, done in-class only, cannot be made up - **lowest 3 dropped**. Bring pen/pencil and paper daily; bring a laptop when activities involve coding (phone/tablet or teaming with a neighbor are stated fallbacks if no laptop is available).
## Programming Language & Tools
Python throughout - "the de facto accepted standard for ML." Libraries used across the semester: Jupyter notebooks, Pandas, Matplotlib, Seaborn, Scikit-Learn, PyTorch.
## Grading (Approximate, Per the Syllabus's Own Label)
| Component | Weight |
|---|---|
| Homework 1-4 | 40% |
| Quizzes 1-6 | 30% |
| Final Project | 20% |
| Participation Activities | 10% |
The syllabus itself calls this breakdown "approximate," unlike every other Fall'26 course's grading table - worth remembering if the real weights shift slightly once graded.
## Homework
4 assignments total, each a combination of a well-documented Jupyter notebook (Python code) and a short written report (PDF). Regrade requests go to the TA who originally graded, escalate to named graduate TAs then the instructor if needed, and must be submitted **within 7 calendar days** of the grade being released.
## Quizzes
6 total, **biweekly, in class on Thursdays**, taken at the end of class. Focused on interpreting method results on new datasets - explicitly framed as similar to technical-interview or research-presentation questions, not textbook recall. **Two pages of notes allowed** (front and back, printed or handwritten, must be on paper).
## Final Project
Student-led: a short proposal, a presentation, and the coding work - **counts approximately 2x a single homework** in effort/weight.
## Late Policy
> [!TIP] The most forgiving late policy of any Fall'26 course
> Every assignment gets an automatic **24-hour grace period with zero penalty** - not a reduced-credit late window like [[20_Progress/Degree/CSCI 4061/CSCI 4061 Board|CSCI 4061]]'s tiered penalties, a full no-penalty grace day. Nothing is accepted after that 24-hour window closes, though - it's forgiving, not unlimited.
For a genuine special/life circumstance beyond the grace day, the instructor must be contacted **within 72 hours** of being able to do so (the syllabus's own example: losing a laptop means emailing within 72 hours of realizing it's lost, not 72 hours from the original deadline).
## Extra Credit
Some assignments/activities offer small extra-credit opportunities, aimed at students who want to go deeper on a topic they're personally interested in - not a fixed, guaranteed category.
## Topics (5 Units, Per the Syllabus's Own Framing)
The syllabus itself gives no dates against these five units - the real dated schedule that maps onto them is in the Schedule section below, sourced from the professor's own schedule spreadsheet, not this list.
1. **ML Overview** - problem types (supervised/unsupervised, regression/classification), core tools (NumPy, Pandas, Scikit-Learn); topics include CSV/tabular data, KNN, classification metrics.
2. **Unsupervised Learning** - finding structure in observed data (e.g., clustering customers by purchase pattern); topics include text data, K-Means, PCA, Gaussian Mixture Models.
3. **Regression** - fitting models to predict/interpolate/extrapolate; topics include error/residual measurement, numerical optimization with PyTorch.
4. **Classification** - assigning data to categories; topics include image data, Logistic Regression, ROC/AUC, model selection.
5. **Neural Networks / Deep Learning** - non-linear models for complex, large-scale data; topics include Multi-Layer Perceptrons, loss functions (Cross Entropy, L1/L2), Convolutional Networks, and RNNs "if time permits."
Every unit also touches ethics in ML, visualizing results, and ML in the news - and, depending on pacing/interest, may extend into generative AI models, pre-trained models, zero-shot learning, and LLMs.
Loose mapping onto the Schedule's lecture numbers below (not stated explicitly anywhere, inferred only from topic match, safe to treat as approximate): Unit 1 ≈ lectures 0.1-1.5, Unit 2 ≈ 2.1-2.5 and 3.1-3.2 (clustering), Unit 3 ≈ 3.3-3.4 (regression/backprop), Unit 4 ≈ 4.1-4.4 (classification), Unit 5 ≈ 4.5-5.4 (neural nets/CNNs).
## Schedule
> [!TIP] Real, dated, sourced from the professor's own course schedule spreadsheet (link above), pasted directly by the user 2026-09-15 - not inferred, not from the Fall-2025-dated syllabus PDF.
> Meeting days are **Tuesday and Thursday**, per the syllabus's stated meeting time (2:30-3:45pm, Amundson Hall B75 - itself still unconfirmed for Fall'26, see the warning above). `LEC` = lecture number per the professor's own numbering; `QUIZ` = the six biweekly Thursday quizzes; readings are listed as they were given, by textbook.

| Week | Dates | Reading | Tuesday | Thursday |
|---|---|---|---|---|
| 1 | Tue 9/8, Thu 9/10 | ISL 2.1, 2.3; DLB 2.1-2.8, 3.1-3.3, 5.1 | LEC 0.1 - syllabus, intro to ML; class Colab notebook; extra Pandas resource | LEC 1.1 - intro to classification, nearest neighbor, normalization |
| 2 | Tue 9/15, Thu 9/17 | ISL 2.1, 2.2; DLB 5.1, 5.2 | LEC 1.2 - kNN, accuracy, overfitting | LEC 1.3 - Bayes classification, kNN |
| 3 | Tue 9/22, Thu 9/24 | ISL 2.2 | LEC 1.4 - generalization, confusion matrix, accuracy/precision/recall/F1 score; HW1 released | QUIZ 1 |
| 4 | Tue 9/29, Thu 10/1 | DLB 5.4-5.6; ENLP 1.1-1.3, 7.1.1-7.1.2 | LEC 1.5 - kNN wrap-up, KD-trees, LSH, complexity, bias | LEC 2.1 - text data, intro to NLP |
| 5 | Tue 10/6, Thu 10/8 | ISL 12.4; DLB 5.8 intro, 5.8.2; ENLP 1.1-1.3, 7.1.1-7.1.2 | LEC 2.2 - NLP practice; HW1 due | QUIZ 2 |
| 6 | Tue 10/13, Thu 10/15 | Linear Algebra Notes; ISL 12.2; DLB 2.7, 2.8, 5.8 intro, 5.8.1; ENLP 3.2, 6.4 | LEC 2.3 - unsupervised learning, K-means clustering; LEC 2.4 - PCA | LEC 2.5 - modern text embedding |
| 7 | Tue 10/20, Thu 10/22 | ISL 4.4; DLB 5.4.2, 5.11.1 | LEC 3.1 - advanced clustering, LDA, GMM; HW2 due | QUIZ 3 |
| 8 | Tue 10/27, Thu 10/29 | PyTorch intro series (tensors, autograd, building models); ISL 3.1-3.3, 3.5, 6.2-6.4; DLB 5.7.1, 5.9 | LEC 3.2 - DBSCAN, intro to regression | LEC 3.3 - regression with PyTorch, gradient descent |
| 9 | Tue 11/3, Thu 11/5 | ISL 4.3, 6.1, 6.2; DLB 5.5, 5.7.1, 5.10 | LEC 3.4 - backpropagation, correlation, regularization; HW3 due | QUIZ 4; final project group interest form + contact spreadsheet released |
| 10 | Tue 11/10, Thu 11/12 | ISL 4.3, 6.1, 6.2, p.154-156, 11.7.1; DLB 5.5, 5.7.1, 5.10, 6.1, 8.3 | LEC 4.1 - GMM review, likelihood, information criteria, GMM on images | LEC 4.2 - GMM for classification, logistic regression |
| 11 | Tue 11/17, Thu 11/19 | ISL 4.3.5; DLB 5.5, 6.1, 6.2 | LEC 4.3 - implementing logistic regression | QUIZ 5 |
| 12 | Tue 11/24, Thu 11/26 | ISL 10.1-10.4; DLB 6.1, 6.3, 6.4, 6.6, 7.1, 7.2, 7.4, 7.8, 9.2, 9.3, 9.7 (+9.10, 9.11 optional) | LEC 4.4 - imbalanced datasets, precision-recall curves; HW4 due | NO CLASS (Thanksgiving) |
| 13 | Tue 12/1, Thu 12/3 | Same DLB block as week 12 (carried forward - the Thanksgiving Thursday it was originally due for was cancelled) | LEC 4.5 - one-hot encoding, cross-entropy loss, multi-class classification | LEC 4.6 - NN training steps, review; Project Proposal due |
| 14 | Tue 12/8, Thu 12/10 | ISL 10.5; DLB Ch. 10-12 | LEC 5.1 - artificial neurons, networks, multilayer perceptrons, 3-way data split | LEC 5.2 - convolutions, CNNs, pooling |
| 15 | Tue 12/15 only | none listed | LEC 5.3 - CNN hyperparameters, CNNs with RGB images; LEC 5.4 - multi-layer CNNs, tuning tips, transfer learning | No class - see warning below |
| 16 | Finals period 12/17-12/24 | none | No final exam - grading is HW/quiz/project/participation only, per Grading section above | none |

> [!WARNING] Week 15's Tuesday/Thursday split is inferred, not stated explicitly in the source
> The professor's schedule sheet lists both "5.3" and "5.4" under a single Dec 14 week entry with no Tuesday/Thursday column split (unlike every other week). The vault's own Fall'26 calendar (used consistently across CSCI 4061, 5304, MGMT 3015, ENGL 1004) has **Wednesday 12/16 as the last day of instruction**, which would put Thursday 12/17 inside finals period, not instruction - meaning a TTh course's real last class is Tuesday 12/15, with both 5.3 and 5.4 covered that single day. This is a reasonable inference from a confirmed calendar fact, not the source's own explicit statement - confirm against CSCI 4521's actual Canvas calendar if there's any doubt, since TTh sections occasionally run one session later than the generic boundary.
> Also worth confirming separately: the previous version of `Fall'26 Semester Calendar.xlsx` had this course's Tuesday/Thursday content sitting in the **Monday/Wednesday columns** for the three weeks that were filled in (13-15) - a real placement error, now corrected when this schedule was written back into that file.
## Verification Notes
Full syllabus text extracted from `Syllabus - CSCI 4521.pdf` (9 pages), 2026-09-10 - materials, prerequisites, participation policy, grading, homework/quiz/project/late/extra-credit policy, the full AI policy, and the topic list are all captured from that document, not inferred. **Not captured, and possibly not current:** the semester label itself reads "Fall 2025" (see the warning above) - instructor identity, meeting time/location, and TA roster are all unconfirmed for the actual Fall'26 offering. **Schedule status, updated 2026-09-15:** the real week-by-week schedule (all 16 weeks) was pasted directly by the user from the professor's own course schedule spreadsheet - see the Schedule section above and its source link. This is a different, more current document than the syllabus PDF and should be trusted for dates/topics over anything the syllabus itself implies. Week 15's Tuesday/Thursday split is an inference from the vault's confirmed calendar, flagged explicitly in that section's warning - not itself pasted from the source.
