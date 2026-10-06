---
type: class
input_kind: homework
status: active
created:
updated: 2026-10-05
area:
  - "[[CSCI 4521 Board]]"
deadline:
tags:
  - "#class"
  - "#Homework"
next: "Build the Windows Jupyter environment, run the notebook end to end on the supplied CSV, then replace all draft result placeholders with verified outputs."
---
# Homework - 1
## Overview
HW1 is a five-question applied classification assignment built around the supplied 777-row PhiUSIIL phishing-URL CSV. Questions 1–2 belong in a documented Jupyter notebook; Questions 3–5 belong in a concise PDF report. The exact Canvas due date and submission destination have not been verified here.
## Requirements
*Must submit*
- [ ] A Jupyter notebook (`.ipynb`) containing the work for Q1–Q2, with executed cells, readable figures, and enough Markdown to make the analysis reproducible.
- [ ] A PDF report answering Q3–Q5. It must interpret the actual notebook output rather than describe expected results.
- [ ] Use `PhiUSIIL_HW1_777.csv` as the assignment data. Do not replace it with the separate full dataset from `phiusiil+phishing+url+dataset.zip`.
*Must demonstrate*
- [ ] **Q1 — data audit:** load the CSV, inspect its structure and missing values, report the class balance, and explain why class balance changes the meaning of accuracy. Retain the original `Label`; use one documented binary target convention throughout. The planned convention is `phishing = 1` when `Label == 0`.
- [ ] **Q2 — feature exploration:** select four features from evidence in the data and show their pairwise relationship to the phishing label with a labeled pairplot or equivalent documented visualization.
- [ ] **Q3 — analysis:** explain what the selected-feature visualizations show, including overlap, separation, and any relationship that supports a concrete phishing-warning recommendation. Do not treat correlation as causation.
- [ ] **Q4 — model comparison:** use the same four features and one reproducible train/test split to compare a small-$k$ KNN classifier, a larger-$k$ KNN classifier, an always-phishing baseline, and a never-phishing baseline. Fit any scaler on training features only, apply it to both partitions, and state the split/seed and feature order.
- [ ] **Q4 — evaluation:** report precision, recall, accuracy, and F1 for phishing as the positive class on both training and held-out test data. Include tables/plots and test-set confusion matrices; explain generalization, the small-$k$/large-$k$ bias-variance contrast, and the cost of phishing false negatives before making a real-world recommendation.
- [ ] **Q5 — application:** state the expected label for the hypothetical page before modelling it, then transform its feature vector with the fitted training scaler and obtain the chosen KNN prediction. Explain whether the result agrees with the pre-model expectation. If completing extra credit, define “smallest change” before searching for one and state the distance/constraint used.
*Academic-integrity and presentation constraints*
- [ ] Use AI only within the course policy and cite its actual use prominently, as required by the syllabus. The disclosure must name the tool and describe the assistance truthfully; it must not claim that unreviewed AI output was personally derived.
- [ ] Personally inspect each result, source every number/claim from the executed notebook, and keep the report consistent with the final notebook.
- [ ] Confirm the Canvas deadline, filenames, upload locations, and any submission-specific instructions before submitting; none are asserted in this note.
## Work log
1. **2026-10-05 — prompt and course alignment recorded**
	The assignment is mapped to the course's early classification material: feature exploration, KNN, held-out evaluation, and classification metrics. The supplied 777-row CSV is the assignment source; the downloaded ZIP is a different, full dataset and is out of scope for the analysis unless the instructor explicitly says otherwise.
2. **2026-10-05 — draft deliverables generated, not validated**
	A draft notebook and report content have been generated for the Windows course workspace, but neither has been executed in a Windows Jupyter environment. There are no verified figures, counts, metric values, predictions, test results, or submission artifacts yet. *Diagnosis:* the Windows environment build and end-to-end execution are still pending. *Next action:* install/verify the kernel and dependencies, run the notebook from a clean kernel, then replace every draft result with captured output.
3. **2026-10-05 — evaluation design fixed before execution**
	The comparison will use one stratified, seeded train/test split; a scaler fit only on training features; and phishing as the positive class. This prevents feature-order drift, test-set leakage, and metric ambiguity across the four required models.
## Concepts used
- [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|Supervised binary classification]] — the `Label` response is predicted from URL/page features.
- [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|K-nearest neighbors]] — the two KNN models differ only in neighborhood size, exposing the flexibility trade-off.
- [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|Train/test generalization and the bias-variance trade-off]] — training scores alone cannot choose a model; the held-out set tests whether the selected $k$ transfers beyond the training rows.
- [[CSCI 4521 Board|Precision, recall, F1, and confusion matrices]] — phishing is the positive class, so a false negative has a materially different operational cost from a false positive.
## AI-use provenance
The course permits AI use, but the syllabus requires it to be cited prominently. This homework used **Codex (GPT-5)** to organize the assignment plan, draft notebook/report scaffolding, and explain code choices. Before submission, add a visible disclosure in both deliverables that accurately states the final tools and assistance actually used. The student remains responsible for running the code, checking every result, understanding the reasoning, and correcting any error.
## Submission checklist
- [ ] Start from a clean kernel and run every notebook cell in order without errors or hidden state.
- [ ] Verify row count, column names, label mapping, missing-value treatment, four selected features, feature order, split seed, and scaler fit scope.
- [ ] Check that every metric table, plot, confusion matrix, and Q5 prediction in the PDF matches the saved notebook output.
- [ ] Add the truthful, prominent AI-use disclosure to the notebook and PDF.
- [ ] Export the final report PDF; reopen both deliverables to confirm figures, labels, and text render correctly.
- [ ] Verify Canvas's exact due date, destination, and required filenames immediately before upload.
- [ ] Submit both files and record the receipt/time here.
## Submission
Not submitted. No Canvas receipt, timestamp, deadline, or final artifact filename has been verified.
## Post-submit reflection
Complete after grading or substantive feedback.
- What failed first?
- What pattern repeats?
