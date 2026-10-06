---
type: class
input_kind: book
status: needs-review
created: 2026-10-05
updated: 2026-10-05
area:
  - "[[CSCI 4521 Board]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/Textbook Map|Textbook Map]]"
tags:
  - "#class"
  - "#Textbook"
next: "Verify DLB §5.1–§5.2 against the local PDF in a text-accessible reader, then reconcile capacity and evaluation terminology with Week 2 capture."
---
# DLB Chapter 5 — Machine Learning Basics (§5.1–§5.2)
## Chapter Summary
==A learning algorithm improves on a specified task from specified experience under a specified performance measure, and it generalizes only when its capacity and inductive preferences match the available data.==
*Mechanism:* define task $T$, performance $P$, and experience $E$; fit a hypothesis using training examples; evaluate independent test examples; then control capacity so low training error does not become a large generalization gap. Regularization introduces a preference—such as small weights—to select among functions. The existing source-based coverage was consolidated; direct PDF text verification remains open.
## Key Concepts
### §5.1 Learning Algorithms
- **Task, performance, experience:** a program learns from experience $E$ on task class $T$ when its performance measure $P$ improves. This prevents an algorithm description from naming only a model while omitting what it must do or how success is measured.
- **Learning tasks:** classification maps features to a category; regression maps features to a real value. The chapter also distinguishes transcription, translation, structured output, anomaly detection, synthesis, imputation, denoising, and density estimation; these are different output or observation structures, not interchangeable labels.
- **Performance measure:** accuracy and $L_{0-1}(\hat y_i,y_i)=\mathbf{1}_{\hat y_i\ne y_i}$ suit classification; density estimation uses probability assigned to held-out examples. Evaluate on independently collected test examples to measure generalization rather than memorization.
- **Experience and design matrix:** supervised experience pairs $x$ with $y$; unsupervised experience supplies $x$ alone. Fixed-size examples can be arranged as $X\in\mathbb{R}^{m\times n}$ with examples in rows and features in columns.
- **Linear regression example:** with $\hat y=w^\top x$, the test loss is $\frac{1}{m_{test}}\|X_{test}w-y_{test}\|_2^2$. The normal-equation form $w=(X_{train}^\top X_{train})^{-1}X_{train}^\top y_{train}$ depends on the stated nonsingularity assumption.
### §5.2 Capacity, Overfitting and Underfitting
- **Generalization gap:** training error is measured on fitted data; generalization error is expected error on new data. Underfitting leaves training error too high, whereas overfitting leaves a large gap between training and test performance.
- **Capacity:** representational capacity is the family a model can express by changing parameters; effective capacity is what the optimization process actually reaches. More parameters alone do not prove more effective capacity.
- **i.i.d. assumption and Bayes error:** standard reasoning assumes examples are independent and the train/test sets have the same data-generating distribution. Bayes error is the oracle floor under the true distribution, not a score obtained by training harder.
- **Regularization:** a modification intended to reduce generalization error without reducing training error. Weight decay adds $\lambda w^\top w$ to the training objective; raising $\lambda$ favors smaller weights and reduces effective capacity.
## Examples Worth Keeping
- The Iris data example arranges 150 plants and four measurements as $X\in\mathbb{R}^{150\times4}$, making the row/example and column/feature convention tangible.
- A quadratic data-generating process illustrates capacity: degree one underfits, degree two can match the structure, and degree nine can interpolate training points while oscillating between them.
- Applying weight decay to the high-degree polynomial suppresses large coefficients; extreme regularization flattens the model, while too little permits the original overfit behavior.
## Connections
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 1|Week 1]] supplies a supervised Seeds classification example: features are `area` and `compactness`, and `wheat_type` is the label used by the nearest-neighbor routine.
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 2|Week 2]] implements held-out and leave-one-out accuracy estimates, which are the course’s concrete evidence for the train-versus-generalization distinction.
- [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]] supplies the complementary flexibility and bias–variance vocabulary.
## Open Questions
- [ ] Verify the exact DLB §5.1–§5.2 edition, section boundaries, and normal-equation assumptions in `DLB Textbook CSCI 4521.pdf` with a text-accessible reader.
- [ ] Check whether the live Week 2 lecture explicitly connects $K$ selection to capacity, effective capacity, or only empirical test accuracy.
## Flashcards
What must be specified to say that a program learns?::Its task $T$, performance measure $P$, and experience $E$, with improved $P$ on $T$ after $E$. #cards/csci4521
Why must a test set be separate from the training set?::Training performance can reflect memorization; independent test examples estimate generalization to unseen data. #cards/csci4521
What is the difference between representational and effective capacity?::Representational capacity is the function family the model can express; effective capacity is the portion reached in practice under its optimization procedure. #cards/csci4521
What does weight decay change in a learning objective?::It adds a penalty such as $\lambda w^\top w$ that favors smaller parameters and can reduce effective capacity. #cards/csci4521
