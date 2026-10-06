---
type: class
input_kind: lecture
status: seed
created: 2026-09-08
updated: 2026-10-05
area:
  - "[[CSCI 4521 Board]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/Textbook Map|Textbook Map]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 2|DLB Chapter 2]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 3|DLB Chapter 3]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5|DLB Chapter 5]]"
tags:
  - "#class"
  - "#Lecture"
next: "Add protected Week 1 live capture if available and verify the unreadable Week 1 PDF deck in a text-accessible reader."
---
# CSCI 4521 — Week 1
## What you must be able to do
- Use [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]] to distinguish predictors, responses, supervised learning, and classification.
- Inspect a pandas table's shape, columns, types, summaries, and category counts before modeling it.
- Select rows with a Boolean mask and make distribution or relationship plots from the Wage data.
- Explain how squared Euclidean distance selects the nearest labeled Seeds point.
- Normalize `area` and `compactness` with feature-wise mean and standard deviation before comparing their distances.
- State why a nearest-neighbor prediction is only as meaningful as its feature representation and scale.
## Key ideas (short)
- **Classification** assigns a class from feature values; the Week 1 Seeds routine returns the label of the **nearest** labeled feature vector.
- **Squared Euclidean distance** preserves nearest-neighbor ordering relative to Euclidean distance while avoiding the square root.
- **Normalization** changes the geometry of distance when features have very different units or ranges.
- **Exploratory data analysis** turns a CSV into inspectable structure before a learning rule is applied.
## Concepts created today
None created in this build.
## Examples worth keeping
- The 0.1 notebook loads `Wage.csv`, inspects `shape`, `head`, `columns`, `describe`, `value_counts`, and `dtypes`, then filters rows whose `maritl` value is `"2. Married"`.
- The same notebook plots wage histograms, age–wage scatterplots with education hue, and linear versus quadratic regression fits.
- The 1.1 notebook represents Seeds examples with `area`, `compactness`, and `wheat_type`; it queries points $(18,0.90)$ and $(13,0.80)$ without recording a fabricated output.
- Its distance map colors squared distance from $(13,0.8)$ before and after normalization, making the scale effect visible.
## Lecture
### Pre-lecture source notes
No protected human live capture is present in this file. The notes below are from the local Week 1 notebooks; the Week 1 PDF deck exists but could not be text-extracted in this environment.
### 1. LEC 0.1 — Colab, pandas, and visual inspection
	`0.1 intro to colab, pandas, sns.ipynb` loads the Wage CSV with pandas and asks the reader to inspect the table before modeling.
	A Boolean mask selects married rows; Seaborn and Matplotlib draw histograms, KDE overlays, scatterplots, a linear regression fit, a quadratic regression fit, and a pairplot.
### 2. LEC 1.1 — Nearest-neighbor classification
	`1.1 Nearest Neighbor Classifier.ipynb` restricts Seeds data to `area`, `compactness`, and `wheat_type`, then plots the first two features colored by label.
	`distance_sq(p0,p1)` returns `np.sum((p0-p1)**2)`; `nn_classify_sample` computes that quantity for every training row and returns the label at `argmin()`.
	The notebook standardizes each feature by subtracting its feature mean and dividing by its feature standard deviation, then repeats the query and distance visualization in normalized coordinates.
## Textbook integration
[[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]] adds the vocabulary the notebooks assume: a supervised classifier learns from feature–label pairs, and its success must be evaluated on data beyond the points it searches. [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 2|DLB Chapter 2]] adds the array shapes, norms, and vector operations behind the distance calculation. [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5|DLB Chapter 5]] frames this concrete routine as a task, a performance measure, and labeled experience. The notebooks do not provide a live lecture transcript or claim a measured accuracy.
## Takeaways (questions to resolve)
- [ ] Verify the Week 1 PDF deck’s text and add only source-supported additions to the pre-lecture notes.
- [ ] Add any protected Week 1 live capture without rewriting it as a transcript.
- [ ] Determine from later evaluation whether the Seeds feature pair is adequate after normalization.
## Lecture-to-textbook synthesis
==Nearest-neighbor classification predicts a label by transferring the label of the training example closest to the query under the chosen feature representation and distance scale.==
*Mechanism:* the Week 1 code computes one squared distance per labeled Seeds point, selects the smallest, and returns that point’s `wheat_type`; z-score normalization rescales `area` and `compactness` before that comparison so one feature’s raw magnitude does not dominate merely because of units.
- Lecture example/scenario: the source notebook queries Seeds points $(18,0.90)$ and $(13,0.80)$ and visualizes distance from $(13,0.8)$ before and after standardization.
- Textbook connection: [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]] distinguishes classification from regression and explains why flexible nearest-neighbor rules require test-error checks; [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 2|DLB Chapter 2]] supplies the vector and squared-distance language.
- Concept links: None created in this build.
> [!WARNING]
> A nearest point in unnormalized coordinates can be “nearest” mainly because one feature has a larger numerical range; that is a representation decision, not evidence about the label.

> [!SUMMARY]
> Week 1 moves from inspecting tabular data to a concrete distance-based classifier, with normalization as part of the model rather than cosmetic preprocessing.
## Flashcards
Why does the Week 1 classifier use squared Euclidean distance?::It ranks candidate neighbors the same way as Euclidean distance while avoiding the square-root calculation. #cards/csci4521
What does `nn_classify_sample` return in the Week 1 notebook?::The training label at the index whose feature vector has the smallest squared distance to the query. #cards/csci4521
Why does normalizing `area` and `compactness` matter for nearest neighbors?::Distance combines coordinate differences, so raw units and ranges can make one feature dominate the comparison. #cards/csci4521
What separates the Week 1 notebook notes from a live lecture capture?::They record notebook code and comments; no transcript, quiz content, or unrecorded instructor emphasis is inferred. #cards/csci4521
