---
type: class
class_kind: week
status: seed
created: 2026-10-22
updated: 2026-10-22
area:
  - "[[CSCI 4521 Board]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/Textbook Map|Textbook Map]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]]"
tags:
  - class
  - lecture
next: "Add protected Week 3 live capture (especially the ChimeIn COVID example's actual computed numbers and the class's own precision/recall discussion) and confirm Quiz 1's real content once reviewed."
---
# CSCI 4521 — Week 3
## What you must be able to do
- Use [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]]'s bias-variance frame together with LEC 1.4's "overfitting dos and don'ts" to state concretely how to avoid overfitting a kNN model.
- Build a binary confusion matrix (TP/FP/TN/FN) from raw classification counts and name which cell corresponds to Type I vs. Type II error.
- Compute accuracy, precision, recall, and F1 from a confusion matrix, and state which metric to prioritize when false positives and false negatives have different real-world costs.
- Explain why accuracy alone is misleading on unbalanced data.
- State Quiz 1's actual scope once reviewed (not yet captured in this note).
## Key ideas (short)
- **Type I vs. Type II error:** a false positive is Type I (false alarm); a false negative is Type II (miss) — precision targets Type I, recall targets Type II.
- **Accuracy's two named failure modes:** unbalanced data (a trivial majority-class predictor can score high) and blending Type I/II errors that may have very different real costs.
- **F1 as harmonic mean:** balances precision and recall equally; **F$\beta$** reweights the balance ($\beta=2$ favors recall, $\beta=0.5$ favors precision), useful when one error type matters more.
- **Overfitting dos and don'ts (LEC 1.4):** the deck's own two-column list — avoid overly flexible models, avoid unnecessary/"just in case" features, gather lots of training data and hold some out for testing — versus the matching don'ts (small training sets, extra features for flexibility, tuning parameters on the test set itself).
## Concepts created today
None created in this build.
## Examples worth keeping
- LEC 1.4's worked COVID-19 example: 100 patients, 20 with COVID-19; the test correctly flags 15/20 positive (5 false negatives) and correctly clears 65/80 negative (15 false positives) — the deck leaves the actual accuracy/precision/recall arithmetic as a live in-class ChimeIn exercise rather than stating the answer on the slide.
- The deck's own closing "Summary" slide gives the four metric formulas in one place: Precision $=TP/(TP+FP)$, Recall $=TP/(TP+FN)$, F1 $=2(PR)/(P+R)$ — worth memorizing exactly as printed, per the deck's own emphasis ("Memorize equations for: F1, Precision, Recall, Accuracy (!)" on the Unit 1 summary slide).
- The deck's own ChimeIn framing ("Between precision and recall, which one is more important for COVID-19 diagnosis?") is the course's recurring quiz style — interpret a method's result on a concrete scenario, not recall a definition in the abstract.
## Lecture
### Pre-lecture source notes
No protected human live capture is present yet. These notes come directly from `Lectures/Week - 3/1.4 generalization, confusion matrix, accuracy, precision, recall, f1 score .pptx.pdf` (21 slides, read in full via text extraction) — no companion notebook exists for LEC 1.4, confirmed by checking `Code/Lectures/Weeks 1 - 5/` directly. Quiz 1 happens Thursday this week (9/24); no quiz content has been captured in this vault yet.
### 1. LEC 1.4 — Generalization, Confusion Matrix, Accuracy, Precision, Recall, F1 Score (Tue 9/22)
	The deck opens with three "Last time" recap slides restating LEC 1.3's Bayes-classifier/bias-variance content verbatim, then states today's agenda: more on overfitting vs. generalizing, binary classification, the confusion matrix, accuracy/precision/recall, and F1 score.
	"Overfitting dos and don'ts" is given as a direct two-column list: avoid overly flexible models, avoid adding features just for flexibility or "just in case," gather lots of training data and hold some out for testing, and tune model parameters using testing data rather than training data alone — contrasted directly against the matching bad practices.
	"Types of kNN" previews LEC 1.5's material explicitly: fixed-$k$ vs. fixed-radius neighbor selection, equal vs. distance-weighted voting, and the note that kNN is slow enough to motivate spatial data structures — the deck itself flags this as setup for next time, not content to dwell on here.
	Binary classification is introduced as exactly-two-category classification (positive/negative), then the four outcomes (TP/FP/TN/FN) are defined, followed immediately by the confusion matrix table pairing TP/FP (Type I error) against FN (Type II error)/TN.
	Accuracy, precision, and recall are each given with their formula and a plain-language framing ("if a classifier says positive, is it really?" for precision; "if the data is positive, will the classifier say so?" for recall), each illustrated with a Venn-diagram-style figure (source: Wikipedia) highlighting which part of the confusion matrix each metric focuses on.
	The COVID-19 worked example (100 patients, 20 positive, 15 TP/5 FN/65 TN/15 FP) is posed as a live ChimeIn computation, immediately followed by a second ChimeIn activity asking which single metric (accuracy, precision, or recall) should be optimized and why — with two analysis prompts (a case where good accuracy but low precision is very bad; a case where good accuracy but low recall is very bad).
	F1 and F$\beta$ are introduced as harmonic-mean combinations of precision and recall, with F$\beta$'s $\beta=2$ (recall-weighted) vs. $\beta=0.5$ (precision-weighted) framing and a note that F$\beta$ is common in document search/retrieval. The same COVID example is reused to compute F1 live. The deck closes by naming further metrics (Fowlkes-Mallows Index, Cohen's Kappa, Confusion Entropy, K measure, Informedness, Markedness, MCC) without deriving them, then a summary slide with all four core formulas.
## Textbook integration
[[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]]'s §2.2 bias-variance decomposition and test-MSE framing is the formal backing for LEC 1.4's "overfitting dos and don'ts" — the deck's practical advice (hold out test data, avoid overly flexible models) is exactly what the textbook's bias-variance trade-off predicts will reduce test error. The textbook does not cover the confusion-matrix/precision/recall/F1 material directly in the assigned §2.1-2.3 range — that material is lecture-original for this course, grounded in the deck itself rather than this week's textbook reading (which, per the Board, is ISL §2.2 only — a continuation of Weeks 1-2's reading, not new material).
## Takeaways (questions to resolve)
- [ ] Add protected Week 3 live capture — in particular, the actual computed accuracy/precision/recall/F1 numbers for the COVID-19 example and whatever the class concluded about which metric matters most for medical diagnosis.
- [ ] Capture Quiz 1's real content once reviewed or returned — this vault has no record of it yet, and the Board itself logs a pattern of printed quiz-cadence anomalies in this course's sibling course ([[20_Progress/Degree/CSCI 5304/CSCI 5304 Board|CSCI 5304]]), so confirm Quiz 1 happened in class as scheduled rather than assuming it.
- [ ] Confirm whether the deck's listed "other metrics" (Fowlkes-Mallows, Cohen's Kappa, MCC, etc.) are quiz-testable or purely enrichment — the deck itself doesn't derive them, which may mean they're out of scope.
## Lecture-to-textbook synthesis
==A confusion matrix's four cells are not symmetric in cost — precision and recall each isolate a different one of the two error types, and the "right" metric to optimize depends on which error type is actually expensive in the task at hand.==
*Mechanism:* classify the result against ground truth into TP/FP/TN/FN; precision $=TP/(TP+FP)$ asks "of what I called positive, how much was right" (penalizes Type I/false-alarm error); recall $=TP/(TP+FN)$ asks "of what was actually positive, how much did I catch" (penalizes Type II/miss error); accuracy collapses both error types into one number and can look good on unbalanced data even when one error type is happening constantly.
- Lecture example/scenario: the COVID-19 100-patient example (15 TP, 5 FN, 65 TN, 15 FP) — a classifier can simultaneously have decent accuracy while being genuinely bad at the error type that matters medically (missing a true case, i.e. low recall), which is exactly why the deck frames the "which metric matters" question as a judgment call, not a formula lookup.
- Textbook connection: [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]]'s warning that "low training MSE is not enough" generalizes directly — low error on one axis (training fit, or one confusion-matrix metric) is never sufficient evidence of good real-world performance by itself.
- Concept links: None created in this build.
> [!WARNING]
> Reporting only accuracy on an unbalanced dataset, or picking F1 by default without asking whether a false positive or a false negative is actually worse in the specific task — the deck's own COVID example is built exactly to make students notice recall matters more than precision there, not to teach "always use F1."

> [!SUMMARY]
> Week 3 turns "is this classifier good" into a question with more than one right answer depending on which of the two error types the task actually penalizes — accuracy, precision, recall, and F1 each answer a different version of that question.
## Flashcards
What is the difference between a Type I and a Type II error in binary classification?::Type I is a false positive (false alarm); Type II is a false negative (a miss). Precision focuses on Type I error, recall focuses on Type II error. #cards/csci4521
Why can a classifier have good accuracy but still be bad for a task like medical diagnosis?::Accuracy blends both error types into one number and can look good on unbalanced data even if the classifier is specifically bad at catching true positives (low recall) — the error type that matters most in diagnosis. #cards/csci4521
What does the F-beta score let you do that F1 cannot?::It lets you weight precision or recall unequally — beta=2 weights recall more, beta=0.5 weights precision more — rather than treating both errors as equally costly. #cards/csci4521
What two problems does the LEC 1.4 deck name as making accuracy alone misleading?::Unbalanced data (a majority-class predictor can score high) and that accuracy combines Type I and Type II errors that may carry very different real costs. #cards/csci4521
