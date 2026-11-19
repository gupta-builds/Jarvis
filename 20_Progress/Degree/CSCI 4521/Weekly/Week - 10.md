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
  - "[[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5 (Part 2)|DLB Chapter 5 (Part 2)]]"
next: "Add protected Week 10 live capture and the ChimeIn results for the GMM size, threshold and accuracy. Check the sign of the gradient on slide 16 of LEC 4.2 against your own derivation."
---
# Week - 10
## What you must be able to do
- Compute AIC and BIC from the parameter count $k$, the data count $n$ and the likelihood, and say which model each prefers. See [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5|DLB Chapter 5]] §5.5 for the likelihood.
- Represent an image as a pixel vector and fit a GMM to digit images.
- Use a GMM's log-likelihood threshold to classify "nine or not" and explain why the threshold is arbitrary.
- Say why regression on 0/1 labels is a poor classifier.
- Write the logistic model $p(x)=\frac1{1+e^{-(w^\top x+b)}}$ and its likelihood and negative log-likelihood.
- Derive the gradient $\sum_i(y_i-p(x_i))\binom{x_i}{1}$ and say which sign belongs to the loss.
## Key ideas (short)
- **AIC** $=2k-\log L$ and **BIC** $=k\log n-\log L$ **penalize complexity**, and lower is better.
- **Image data** is a grid of pixel values from 0 to 255, so an image is a vector a GMM can model.
- A **GMM** can **generate** new digits and also **classify** by a likelihood threshold.
- Regression on 0/1 labels gives **unbounded** outputs, so **logistic regression** models a **probability** instead.
- Maximum likelihood becomes a **minimization** of the negative log-likelihood, solved by **gradient descent**.
## Concepts created today
None created in this build.
## Examples worth keeping
- **Two moons** with a 2-component GMM fails to separate the clusters, 16 components fit well, and BIC points to about 6 to 8 components and AIC to about 12.
- **Digits**: scikit-learn's 1,797 images of 64 pixels, PCA keeps 41 components for 99% of the variance, and AIC suggests about 140 GMM components (the notebook used 150).
- **MNIST nines**: a GMM trained on 9s gives high likelihood to 9s, much lower to 3s, and overlaps with sloppy 7s.
- The logistic function $p(x)=\frac{e^x}{1+e^x}$ above zero means "true".
## Lecture
### Pre-lecture source notes
No live lecture capture exists for this week yet. These notes come from `Lectures/Week - 9/4.1 gmm review, likelihood, information criteria, gmm on images.pptx.pdf` (15 slides, filed in Week - 9), `Lectures/Week - 10/4.2 logistic regression.pptx.pdf` (18 slides) and the notebooks `4.1 GMMs for generation`, `4.1 GMMs and images` and `4.2 gmm for digit classification`. Add live capture under a `Live lecture capture` heading.
### 1. LEC 4.1: GMM review and model criteria (Tue 11/10)
Unit 4 is advanced classification: image data, binary classification with logistic regression, implementing it by gradient descent, evaluating it, and imbalanced datasets. *GMM/EM:* choose $k$, randomly assign points, then repeat: fit a Gaussian (sample mean and covariance) to each cluster, and reassign each point to its most probable Gaussian by $c(x_0)=\arg\max_j x_0^\top Q_j^{-1}m_j-\frac12m_j^\top Q_j^{-1}m_j+\log p_j$. That comes from the Bayes classifier with Gaussian $P(X\mid Y=j)$. GMM is k-means plus a covariance estimate, and k-means cannot assign a "likelihood" to a point while GMM can.
*Model criteria.* The goal is the best-simplest model. A good fit is measured by likelihood, and complexity by information theory. $\text{AIC}=2k-\log L$ and $\text{BIC}=k\log n-\log L$ with $k$ the number of parameters, $n$ the number of data points and $L$ the data likelihood. Lower is better. (The notebook writes them as $2k-2\ln\hat L$ and $k\ln n-2\ln\hat L$.)
### 2. LEC 4.1: Image data and GMMs on images
An image is a rectangular grid of pixel values, for example brightness 0 to 255, and color images store RGB separately. File formats store values as ASCII (.ppm, .pgm), binary (.bmp), losslessly compressed (.png, .tiff, .gif) or lossily (.jpg). **MNIST**: handwritten digits released by NIST in 1994, greyscale 28x28, about 60k training and 10k test images, with 1,797 8x8 images built into scikit-learn.
*Notebook `4.1 GMMs for generation`.* Two moons (`make_moons(200, noise=.05)`): a 2-component GMM does not separate the clusters, a 16-component one fits and can be sampled to produce new points, so a GMM "compresses" the data. Negative log-likelihood always falls with more components, so it cannot choose the number. A penalty $0.5\log(\text{components})$ suggests 6 to 8. BIC suggests about 6 to 8 and AIC about 12.
*Notebook `4.1 GMMs and images`.* `load_digits` gives shape (1797, 64). `PCA(0.99, whiten=True)` gives 41 components. AIC over 50 to 200 components suggests about 140, a 150-component GMM converges, and `gmm.sample(100)` then `pca.inverse_transform` gives new digit-like images. The professor's point: there is no difference between the 2-D moons and the high-dimensional digits.
*Bias note.* Training labels come from humans, so their biases appear in the labels, and the main cause of model social bias is bias in the data itself. ChimeIn: a screenshot of the best and worst digit generated.
### 3. LEC 4.2: GMM for classification (Thu 11/12)
Slides on HW reminders (a standalone PDF report is required and AI use must be cited) and the **final project**: one neural network model and one other model on a problem or dataset of your choice, a proposal, then a report and conference-style poster on the final exam day, groups allowed through an interest form and shared spreadsheet.
*Notebook `4.2 gmm for digit classification` (MNIST).* The first 10,000 samples train and the rest test. PCA with 95% variance gives 150 components. A GMM on the 9s only: BIC suggests 1 component, the notebook tries 11. The 9s' scores are high on training data and much lower on test data, which is overfitting, and the notebook says one component overfits much less. A 3 scores much lower than a 9, and some 7s score above some 9s. A log-likelihood threshold turns this into a nine-vs-not classifier, and the reported "ratio classified as nines" was $0.4066$ in one run. ChimeIn: best GMM size, threshold, test accuracy, and the nines the model was least confident about.
### 4. LEC 4.2: Logistic regression
*Regression for binary classification.* Idea 1: label categories 0 or 1 and regress. "Can anyone think of issues?" Idea 2: model the probability of a 1 with the **logistic function** $p(x)=\frac{e^x}{1+e^x}=\frac1{1+e^{-x}}$. Above 0 means true and below means false. Use a linear score $w^\top x+b$: $p(x)=\frac1{1+e^{-(w^\top x+b)}}$. A Desmos plot lets you pick $w,b$ (ChimeIn).
*Likelihood.* For independent points, $L(w,b)=\prod_ip(x_i)^{y_i}(1-p(x_i))^{1-y_i}$. Products are expensive to differentiate, so take the log: $LL=\sum_iy_i\log p(x_i)+(1-y_i)\log(1-p(x_i))$, and the loss is $\ell=-LL=\sum_iy_i\log[1+e^{-(w^\top x_i+b)}]+(1-y_i)\log[1+e^{w^\top x_i+b}]$. The slide gives $\frac{\partial\ell}{\partial w_j}=\sum_i(y_i-p(x_i))x_{ij}$, $\frac{\partial\ell}{\partial b}=\sum_i(y_i-p(x_i))$ and $\nabla\ell=\sum_i(y_i-p(x_i))\binom{x_i}{1}$. Classify as 1 when $p(x_i)>0.5$.
*Source conflict to check.* For $\ell=-LL$ the chain rule gives $\sum_i(p(x_i)-y_i)x_{ij}$. The slide's $(y_i-p)$ is the gradient of $LL$, the quantity to ascend. Gradient descent on $\ell$ moves along $+\sum(y_i-p)x$, so the update is the same, but the slide labels it as the gradient of the loss. Confirm with your own derivation.
## Textbook integration
[[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 4 (Part 2)|ISL Chapter 4 (Part 2)]] adds what the slides leave out: the odds $\frac{p}{1-p}=e^{\beta_0+\beta_1X}$ and log odds linear in $X$ (so one unit of $X$ multiplies the odds by $e^{\beta_1}$), a $z$-statistic for each coefficient, and the confounding example where a student's coefficient flips sign once balance is in the model. The book fits by maximum likelihood with software, while the lecture derives the gradient and descends.
[[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5 (Part 2)|DLB Chapter 5 (Part 2)]] §5.7.1 explains logistic regression as the Bernoulli counterpart of the Gaussian linear model and why it has no closed form. [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 6|DLB Chapter 6]] §6.1 is the layering that LEC 4.3 builds on, and [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 8|DLB Chapter 8]] §8.3 is its optimizer. AIC and BIC appear in ISL §6.1.3 as $C_p$ and BIC for least squares, in [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 6|ISL Chapter 6]]. GMM still has no textbook coverage, as in Week 7.
## Takeaways (questions to resolve)
- [ ] Record the ChimeIn results: the best GMM size, the threshold and the test accuracy for the nine classifier.
- [ ] Derive $\partial\ell/\partial w_j$ for the negative log-likelihood and settle the sign on slide 16.
- [ ] Why does the BIC pick 1 component for the 9s while the in-class run used 11, and which generalizes better on the test 9s?
- [ ] Which ISL §4.3 numbers (for example $\hat p=0.586$ at \$2,000) can you reproduce from Eq. 4.2?
## Lecture-to-textbook synthesis
==Logistic regression turns classification into estimating a probability: a linear score is squashed by the sigmoid into $p(x)\in(0,1)$, and the weights are chosen to make the observed labels most likely.==
*Mechanism:* the likelihood $\prod p^{y}(1-p)^{1-y}$ scores the data, its negative log is the loss, and gradient descent minimizes it. GMM classification instead fits a density to one class and thresholds the log-likelihood, which has no principled cutoff and overfits when the model is too big. AIC and BIC choose the size by charging for parameters.
- Lecture example/scenario: the 9s GMM. Training 9s score high and test 9s much lower, so the complex model overfit, and a threshold that separates 9s from 3s still lets some sloppy 7s through.
- Textbook connection: [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 4 (Part 2)|ISL Chapter 4 (Part 2)]] (the logistic model and odds) and [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5 (Part 2)|DLB Chapter 5 (Part 2)]] (the same model as a Bernoulli likelihood).
- Concept links: None created in this build.
> [!WARNING]
> Reading the sigmoid output as a calibrated certainty, or reading a GMM threshold as a decision boundary the data chose. Both are modeling choices, and the 9s experiment shows the threshold moves with the model size.
> [!SUMMARY]
> Week 10 closes the GMM thread with model-selection criteria and image data, then replaces thresholding a density with a probability model fit by maximum likelihood.
## Flashcards
What do AIC and BIC add to the negative log-likelihood?::A penalty for model complexity, $2k$ for AIC and $k\log n$ for BIC, so lower is better and BIC punishes parameters more as $n$ grows. #cards/csci4521
Why take the log of the logistic likelihood?::It turns a product over data points into a sum, which is cheap to differentiate and has the same maximizer. #cards/csci4521
Why is regression on 0/1 labels a poor classifier?::Its outputs are not confined to $[0,1]$ so they are not probabilities, and it cannot handle more than two unordered classes. #cards/csci4521
