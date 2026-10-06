---
type: class
input_kind: lecture
status: seed
created: 2026-09-15
updated: 2026-10-05
area:
  - "[[CSCI 4521 Board]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/Textbook Map|Textbook Map]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5|DLB Chapter 5]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 3|DLB Chapter 3]]"
tags:
  - "#class"
  - "#Lecture"
next: "Add protected Week 2 live capture and verify the 1.2/1.3 PDF decks in a text-accessible reader before calling this week reconciled."
---
# CSCI 4521 — Week 2
## What you must be able to do
- Use [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]] to distinguish training performance from an estimate of unseen-data performance.
- Implement one-nearest-neighbor prediction for a batch of Seeds feature vectors.
- Explain why a shuffled train/test split can return a different accuracy on different runs.
- Calculate leave-one-out predictions by removing the queried row from its own training set.
- Use `KNeighborsClassifier(n_neighbors=k)` to compare candidate $k$ values without treating one split as a final result.
- Explain how repeated randomized splits average an unstable evaluation procedure.
## Key ideas (short)
- **Leave-one-out accuracy** prevents a point from classifying itself, unlike evaluating one-nearest-neighbor directly on its training rows.
- **Train/test splitting** estimates performance on withheld examples, but one random split can vary with the sampled rows.
- **$K$ in $K$NN** is a model choice whose effect should be evaluated across splits, not picked from training accuracy alone.
- **Normalization** must be visible in the pipeline; the 1.2 source itself warns that implicit changes should be noted.
## Concepts created today
None created in this build.
## Examples worth keeping
- The 1.2 notebook asks for a prediction for a seed with area $12\,\mathrm{cm}^2$ and compactness $0.9$, then uses its nearest-neighbor helper rather than recording an invented class.
- It plots a mesh of artificial feature pairs and colors it with nearest-neighbor labels to show the induced decision regions.
- Its leave-one-out routine removes row $i$ from both features and labels before classifying that row.
- The 1.3 scikit-learn notebook repeatedly shuffles Seeds data, holds out one third for testing, tries $k=2,5,10$, and plots average accuracy across $k$ values.
## Lecture
### Pre-lecture source notes
No protected human live capture is present. These notes come from `1.2 NN Classifier.ipynb`, `1.3 kNN Iris Classification.ipynb`, and `1.3 kNN with SciKit-Learn.ipynb`; the local 1.2 and 1.3 PDF decks were found but could not be text-extracted in this environment.
### 1. LEC 1.2 — Nearest neighbors, accuracy, and overfitting
	`1.2 NN Classifier.ipynb` separates Seeds features (`area`, `compactness`) from `wheat_type` labels, builds a batch classifier around the Week 1 single-sample function, and visualizes predictions over a mesh.
	The source explicitly notes incompatible units and widely different ranges, then adds optional z-score normalization inside the graph helper.
	For evaluation, it constructs leave-one-out predictions and a shuffled 90/10 train/test split, computing accuracy as the percentage of predicted labels equal to withheld labels.
### 2. LEC 1.3 — $K$NN and repeated evaluation
	`1.3 kNN with SciKit-Learn.ipynb` shuffles rows with `np.random.permutation`, holds out a chosen percentage, and defines accuracy as the fraction of correct test predictions.
	A closure around `KNeighborsClassifier(n_neighbors=k)` fits on training rows and predicts test rows. The notebook tries $k=2$, $5$, and $10$, then averages accuracy over repeated splits while scanning $k=1,4,\ldots,88$.
	The local Iris notebook only loads and displays `iris.csv`; it contains no classifier implementation or recorded conclusion.
## Textbook integration
[[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]] supplies the formal test-MSE, classification-error, Bayes-rule, and bias–variance frame that the notebooks operationalize with accuracy and repeated splits. [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5|DLB Chapter 5]] calls the same problem a generalization gap and treats $K$ as capacity control; [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 3|DLB Chapter 3]] supplies the probability language relevant to the scheduled Bayes-classification topic. The available notebooks do not capture a Bayes derivation, deck wording, quiz, or live emphasis.
## Takeaways (questions to resolve)
- [ ] Verify the 1.2 and 1.3 PDF decks and record only their source-supported additions.
- [ ] Add protected Week 2 live capture, especially any Bayes-classification derivation or instructor convention.
- [ ] Check whether the notebook normalizes before splitting; if not, identify the course-approved evaluation pipeline before reusing it.
## Lecture-to-textbook synthesis
==A $K$NN model is chosen by estimated generalization performance: split or leave out labeled examples, predict them without letting them serve as their own neighbors, and compare candidate $K$ values across repeated samples.==
*Mechanism:* the Week 2 code withholds labels through a shuffled split or a one-row exclusion, fits or searches only the remaining data, scores predictions against the held-out labels, and averages repeated random-split accuracy because the split itself changes the estimate.
- Lecture example/scenario: `nn_one_out_classify` removes each Seeds row before predicting it; the scikit-learn notebook then scans odd-spaced $K$ values from 1 through 88 and plots average accuracy.
- Textbook connection: [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]] explains why training fit is not test performance and why flexibility affects variance; [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5|DLB Chapter 5]] names the training/test difference the generalization gap.
- Concept links: None created in this build.
> [!WARNING]
> A favorable training score—or a favorable single random split—is not evidence that a $K$ value generalizes; the held-out procedure and preprocessing choices are part of the claim.

> [!SUMMARY]
> Week 2 turns nearest-neighbor classification into an evaluation problem: choose $K$ from withheld-data behavior, not from how completely a model remembers its training rows.
## Flashcards
Why does leave-one-out evaluation remove the queried row first?::Otherwise a one-nearest-neighbor classifier can select that identical training row and inflate apparent accuracy. #cards/csci4521
Why can train/test accuracy change when the Week 2 code is rerun?::The notebook shuffles rows before splitting, so different observations enter the training and test sets. #cards/csci4521
What does repeated split accuracy estimate better than one split?::The average performance over different sampled train/test partitions, reducing dependence on one lucky or unlucky split. #cards/csci4521
Why is a scan over $K$ not a license to pick the highest training score?::$K$ controls neighborhood smoothness; its value should be compared with withheld-data performance to estimate generalization. #cards/csci4521
