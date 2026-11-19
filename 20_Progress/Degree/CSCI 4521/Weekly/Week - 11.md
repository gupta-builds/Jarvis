---
type: class
class_kind: week
status: seed
created: 2026-11-19
updated: 2026-11-19
tags:
  - class
  - lecture
area:
  - "[[CSCI 4521 Board]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/Textbook Map|Textbook Map]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 4 (Part 2)|ISL Chapter 4 (Part 2)]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 6|DLB Chapter 6]]"
next: "Add protected Week 11 live capture and finish the 4.3 notebook (sigmoid loss, precision/recall per class, the imbalance fix). Quiz 5 is today (Thu 11/19): save its key in Quizzes/ and build the pair with the Quiz Workflow."
---
# Week - 11
## What you must be able to do
- Write a logistic model as a linear map followed by a sigmoid, and stack layers as $W_2^\top\sigma(W_1^\top x+b_1)+b_2$. See [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 6|DLB Chapter 6]].
- Compute the output of a two-layer model by hand for a given $x$, $W$ and $b$.
- Explain stochastic gradient descent with batches and epochs and write the PyTorch loop.
- Name the roles of `Dataset`, `DataLoader`, `nn.Module`, `nn.Linear` and `torch.optim.SGD`.
- Compute precision, recall, TPR and FPR, and relate them to each other for a given class balance.
- Draw a ROC curve from a threshold sweep and say what AUC measures.
## Key ideas (short)
- A logistic model is a **linear map** followed by a **sigmoid**, and layering repeats that.
- **SGD** takes the gradient on a **batch**, and one pass over all batches is an **epoch**.
- Per-parameter learning rates, **momentum** and **Adam** improve SGD.
- **TPR** equals recall, and **FPR** $=\frac{FP}{FP+TN}$ is its negative-class counterpart.
- A **ROC curve** plots TPR against FPR as the threshold sweeps, and **AUC** summarizes it.
## Concepts created today
None created in this build.
## Examples worth keeping
- The two-layer hand example with $x=(1,1)$, $W_1=\begin{pmatrix}1&1\\1&1\end{pmatrix}$, $b_1=(0,-1)$, $W_2=(1,-2)$, $b_2=0$ gives $\frac1{1+e^{-2}}-\frac2{1+e^{-1}}\approx-0.5813$.
- Linear regression as a nine detector: train accuracy $49.7\%$, test accuracy $50.2\%$, AUC $0.5318$, though training loss fell from $716$ to under $75$.
- The ChimeIn: precision and recall for TPR $=0.8$ and FPR $=0.2$ on a dataset with $20$ positives and $10$ negatives.
## Lecture
### Pre-lecture source notes
No live lecture capture exists for this week yet. These notes come from `Lectures/Week - 10/4.3 implementing logistic regression, stochastic gradient descent, roc curves.pptx.pdf` (35 slides, filed in the Week - 10 folder though scheduled Tue 11/17) and `Code/Lectures/Weeks 10 - 13/4.3 logistic regression on digits, sgd, roc curves.ipynb`. Thu 11/19 is Quiz 5, which has no key in the source folder yet. Add live capture under a `Live lecture capture` heading.
### 1. LEC 4.3: The logistic function as a layer (Tue 11/17)
The probability of a positive is $p(x)=\sigma(f(x))$ with $f(x)=w^\top x+b$ and $\sigma(x)=\frac1{1+e^{-x}}$. Let $f$ output a vector: $f(x)=W_1^\top x+b_1$ with $W_1$ of size $d\times p$ and $b_1$ of size $d\times1$, an **affine transformation**. Apply $\sigma$ to each entry and apply another affine map: $\text{out}=W_2^\top\sigma(W_1^\top x+b_1)+b_2$. The model becomes modular **layers** of a sigmoid composed with an affine map. The worked example gives $\approx-0.5813$ as above. ChimeIn: $x=(2,1)$, $W_1=\begin{pmatrix}1&-1&1\\1&1&-1\end{pmatrix}$, $b_1=(0,-1,0)$, $W_2=(1,-2,-1)^\top$, $b_2=1$. The deck points to section 6.1 of the Deep Learning book.
### 2. LEC 4.3: Stochastic gradient descent
Full gradient descent touches every data point at every step, which is expensive. Divide the data into **batches**, take a step on each, and one full pass is an **epoch**. Batches are usually random, hence stochastic gradient descent. It speeds the decay of the loss and the computation per step, and PyTorch parallelizes within a batch.
*Code.* Full GD: `for epoch in range(2000): y_pred = model(params, x); loss = ((y_pred - y)**2).mean(); loss.backward(); with torch.no_grad(): params -= params.grad*lr; params.grad.zero_()`. SGD adds an inner loop `for x_batch, y_batch in dataset`.
*Improving SGD.* Per-parameter learning rates (adaptive per parameter and iteration), **momentum** (mix this batch's gradient with previous ones to reduce noise and avoid small local minima), and **Adam**, which combines several of these.
*PyTorch pieces.* `utils.data.Dataset` and `DataLoader` bundle features and labels and split into batches. `nn.Module` tracks the computation and parameters, `nn.Linear` is a matrix multiply, and `torch.optim.SGD` applies the update. The `train` function zeroes the optimizer, predicts, computes the loss, calls `loss.backward()` and `optimizer.step()`, and averages the loss. Homework for next class: do the notebook up to model evaluation.
### 3. LEC 4.3: Notebook, nine versus not nine
`fetch_openml(data_id=554)` loads MNIST with 784 features per image. The task labels 9 as 1 and 0 to 8 as 0. The first 60,000 images train and the remaining 10,000 test (the notebook's prose says the reverse, the code is as stated). Labels are expanded from shape `(60000,)` to `(60000, 1)` with `np.expand_dims`. A `NumpyDataset` returns float tensors, and `LinearClassifier` is one `nn.Linear` on the flattened image. First attempt: mean squared error on the raw output, `lr = 1e-8`, 30 epochs, batch size 100. Train loss falls from $716.07$ and test loss from $416.21$ to well under 100, yet the accuracy is $49.7\%$ on train and $50.2\%$ on test. The AUC is $0.5318$, precision per class is $[0.907,\ 0.109]$, recall $[0.496,\ 0.547]$, F1 $[0.642,\ 0.181]$ and the class counts $[8991,\ 1009]$.
*The fix.* Raw outputs leave $[0,1]$, so compute the loss on `torch.sigmoid(output)` (`SigmoidLoss`), which is logistic regression with a squared loss. The notebook then asks: retrain with the sigmoid loss and compare accuracy, look at the predictions, compute precision, recall and F1 for both classes, say what about the problem makes both hard, and fix it. ChimeIn: train and test accuracy, F1 and AUC using the sigmoid loss.
### 4. LEC 4.3: ROC curves
Default classification is $p(x)>0.5$, but is 0.5 best? Plot true positives against false positives over thresholds. Precision $=\frac{TP}{TP+FP}$ focuses on type I error. Recall $=\frac{TP}{TP+FN}$ focuses on type II error and equals TPR. $\text{FPR}=\frac{FP}{FP+TN}$ is the recall-like rate for negatives.
*ChimeIn.* Find precision and recall from TPR and FPR for 20 positives and 10 negatives, say how balance changes the relation, and (challenge) write accuracy in terms of TPR, FPR, $P$ and $N$. Then compute precision and recall for TPR $=0.8$, FPR $=0.2$ with those counts.
*The curve.* A threshold of 0 labels everything positive, so TPR $=1$ and FPR $=1$ (top right). The slide for a threshold of 1 says "classify everything as positive" but gives the correct point TPR $=0$, FPR $=0$ (bottom left), where everything is negative, so that wording is a slide slip. With equal costs, pick the threshold closest to $(0,1)$. The curve never decreases, and the **area under it** is the AUC, common in diagnostic and medical work.
## Textbook integration
[[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 4 (Part 2)|ISL Chapter 4 (Part 2)]] §4.3.5 extends the two-class model to $K$ classes with a baseline class or the softmax form, which Week 13 reaches in the lecture. The book's cutoff example (predict default when $p>0.5$ but a lender may pick 0.1) is the idea behind the ROC threshold sweep, though the book does not draw the curve in these pages.
[[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 6|DLB Chapter 6]] §6.1 is the full XOR example that LEC 4.3's layering example follows, and §6.2.2.2 gives the sigmoid output unit and why clipping a linear output stalls the gradient, the same failure the notebook shows with its raw linear output. [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5 (Part 2)|DLB Chapter 5 (Part 2)]] §5.9 and [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 8|DLB Chapter 8]] §8.3 give the SGD update, the learning-rate decay and the momentum equation behind the slide's "improving SGD" list. Adam is not in the assigned pages.
## Takeaways (questions to resolve)
- [ ] Finish the notebook: what are the sigmoid-loss accuracy, F1 and AUC, and what fixes the class imbalance (1,009 nines in 10,000)?
- [ ] Compute the two ChimeIn layer outputs by hand and check them in code.
- [ ] Derive FPR and TPR from precision, recall and the class counts.
- [ ] Quiz 5 is today. Save its key in `Quizzes/` and fill its Mistakes and Gaps.
## Lecture-to-textbook synthesis
==A neural network layer is an affine map followed by a sigmoid, so logistic regression is a one-layer network, and training it with batches (SGD) and evaluating it by sweeping the threshold (ROC) are the same tools every deeper model will use.==
*Mechanism:* a layer computes $\sigma(W^\top x+b)$, layers compose, and the loss on the final output is minimized by stepping against its batch gradient. A threshold on the output turns probabilities into labels, and the ROC curve shows TPR against FPR over every threshold, so AUC compares models without fixing one.
- Lecture example/scenario: the nine detector. Squared error on the raw output gave $50\%$ accuracy and AUC $0.53$ although the loss fell, because outputs escaped $[0,1]$. Passing them through a sigmoid is the fix. The 1,009-of-10,000 imbalance also makes per-class F1 uneven.
- Textbook connection: [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 6|DLB Chapter 6]] (XOR layers and the sigmoid output unit) and [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 4 (Part 2)|ISL Chapter 4 (Part 2)]] (logistic model and cutoffs).
- Concept links: None created in this build.
> [!WARNING]
> Trusting a falling training loss or a high accuracy. The nine detector's loss fell while accuracy stayed at chance, and with 11% positives a classifier that says "not nine" always scores about 90% accuracy.
> [!SUMMARY]
> Week 11 builds logistic regression in PyTorch as a layer trained by SGD and evaluates it with precision, recall and the ROC curve.
## Flashcards
Why did the raw-output MSE classifier score about 50% on nines?::Its raw outputs are unbounded and not probabilities, so thresholding them at 0 ignores the 0/1 structure. Passing the output through a sigmoid before the loss fixes this. #cards/csci4521
How are TPR and FPR different?::TPR is $TP/(TP+FN)$, the share of positives found, and equals recall. FPR is $FP/(FP+TN)$, the share of negatives wrongly flagged. #cards/csci4521
What does AUC summarize?::The ROC curve over every threshold, as the area under TPR against FPR, so a model can be compared without choosing a cutoff. #cards/csci4521
