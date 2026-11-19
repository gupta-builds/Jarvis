---
type: class
class_kind: textbook
status: sprout
created: 2026-11-19
updated: 2026-11-19
tags:
  - class
  - textbook
area:
  - "[[CSCI 4521 Board]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/Textbook Map|Textbook Map]]"
next: "Run the NotebookLM prompt on PDF pp. 185-198 and compare. Read §6.2.2.3 (softmax) on PDF pp. 199-201 for Week 13, which this note does not cover."
---
# DLB Chapter 6 — The XOR Network, Cost Functions and Sigmoid Output (§6.1, §6.2.1, §6.2.2.1 to §6.2.2.2)
**Source:** *Deep Learning* (Goodfellow, Bengio, Courville), Chapter 6 "Deep Feedforward Networks", §6.1 and the start of §6.2, printed pp. 170-182 (PDF pp. 185-197, printed page = PDF page minus 15).
**Read from:** `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Textbook & Resources\DLB Textbook CSCI 4521.pdf`, extracted with MinerU.
**Course role:** the reading for [[20_Progress/Degree/CSCI 4521/Weekly/Week - 10|Week 10]] and [[20_Progress/Degree/CSCI 4521/Weekly/Week - 11|Week 11]] (DLB 6.1 and 6.2). LEC 4.3's layering example is the XOR network from §6.1.
## Chapter Summary
==A linear model cannot represent XOR, so a feedforward network first applies a fixed nonlinearity to an affine map to build features in which the problem becomes linear, and it is then trained by gradient descent on a cost that is, in most cases, the negative log-likelihood.==
*Mechanism:* the network $f(x;W,c,w,b)=w^\top\max\{0,W^\top x+c\}+b$ has a hidden layer $h=g(W^\top x+c)$ and a linear output. With a rectified linear activation and the weights given in the book, the four XOR inputs map to the exact targets $0,1,1,0$. Training uses a cost $J(\theta)=-\mathbb E\log p_{\text{model}}(y\mid x)$, which becomes mean squared error for a Gaussian output and cross-entropy for a Bernoulli (sigmoid) output. Because the hidden nonlinearity makes the cost non-convex, no global-convergence guarantee exists.
## Reading Guide
- [ ] Read pp. 170-171 (§6.1): the XOR task, MSE cost (Eq. 6.1) and why the normal equations give $w=0$, $b=\tfrac12$.
- [ ] Study Figure 6.1 (p. 171): XOR in the original space and in the learned hidden space.
- [ ] Study Figure 6.2 and Eq. 6.3 (p. 172 to 173): the one-hidden-layer network and the ReLU.
- [ ] Work Eq. 6.7 to 6.11 (pp. 174-175) by hand: $XW$, add $c$, apply ReLU, multiply by $w$. Compare with the layering example in lecture 4.3.
- [ ] Read pp. 176-177 (start of §6.2): why a nonlinearity makes the loss non-convex.
- [ ] Read pp. 177-179 (§6.2.1): maximum likelihood cost, Eq. 6.12 and 6.13.
- [ ] Read pp. 180-182 (§6.2.2.1 to 6.2.2.2): the linear output unit and the sigmoid output $\hat y=\sigma(w^\top h+b)$, Eq. 6.18 to 6.21.
## Key Concepts
- **Feedforward network:** a function $f(x;\theta)$ with no feedback connections, learned from data.
- **Hidden layer and activation function:** $h=g(W^\top x+c)$ with a fixed nonlinear $g$. The rectified linear unit is $g(z)=\max\{0,z\}$.
- **Affine transformation:** $x\mapsto W^\top x+c$, a linear map plus a bias vector.
- **Why nonlinearity is required:** if $f^{(1)}$ were linear, the composite of two linear layers would be linear and could not solve XOR.
- **Negative log-likelihood = cross-entropy cost:** $J(\theta)=-\mathbb E_{x,y\sim\hat p_{\text{data}}}\log p_{\text{model}}(y\mid x)$ (6.12). A Gaussian $p(y\mid x)$ gives $\tfrac12\mathbb E\|y-f(x;\theta)\|^2+\text{const}$ (6.13).
- **Sigmoid output unit:** $\hat y=\sigma(z)$ with $z=w^\top h+b$ models $P(y=1\mid x)$. Clipping a linear unit to $[0,1]$ (6.18) gives zero gradient outside the interval, which stalls learning.
## Full Reading Notes
### §6.1 Learning XOR (pp. 170-175)
XOR on $\{[0,0],[0,1],[1,0],[1,1]\}$ returns 1 when exactly one input is 1. A linear model fit by MSE and the normal equations returns $w=0$ and $b=\tfrac12$, so it outputs 0.5 everywhere (Figure 6.1). Adding one hidden layer of two ReLU units fixes it. With $W=\begin{pmatrix}1&1\\1&1\end{pmatrix}$, $c=(0,-1)^\top$, $w=(1,-2)^\top$ and $b=0$: $XW$ gives rows $(0,0),(1,1),(1,1),(2,2)$, adding $c$ gives $(0,-1),(1,0),(1,0),(2,1)$, ReLU gives $(0,0),(1,0),(1,0),(2,1)$, and multiplying by $w$ gives $0,1,1,0$. The book specified this solution and showed zero error. Real networks find such weights by gradient descent.
> [!EXPLAIN] Explanation of the above topic: Before the hidden layer, the four points lie on one line, and the target goes 0, then 1, then 0 along it. No straight-line model fits that. The ReLU bends the line at the origin, so after it the points sit where one straight cut separates the 1s from the 0s. A nonlinearity is what lets later layers be simple.
### §6.2 Gradient-based learning (pp. 176-177)
Training a network is gradient descent on a cost, as for any model, with one difference: the nonlinearity makes most interesting losses non-convex. Gradient descent then has no global-convergence guarantee and is sensitive to initial values. It uses stochastic gradient descent variants from §5.9.
### §6.2.1 Cost functions (pp. 177-180)
Most networks define $p(y\mid x;\theta)$ and train by maximum likelihood, so the cost is the cross-entropy between the data and the model (6.12). The same recipe as DLB §5.10 removes the need to design a cost per model. The book stresses that the gradient of the cost must stay large and predictable enough to guide learning, and that functions that saturate (go flat) work against this.
### §6.2.2 Output units (pp. 180-182)
Linear units give the mean of a Gaussian, $p(y\mid x)=\mathcal N(y;\hat y,I)$ (6.17), and maximum likelihood then equals minimizing MSE. They do not saturate, so they are easy to optimize. For a binary $y$ a Bernoulli needs only $P(y=1\mid x)$ in $[0,1]$. A clipped linear unit has zero gradient whenever it leaves the interval, so the book uses the sigmoid output $\hat y=\sigma(w^\top h+b)$ with maximum likelihood, which always gives a strong gradient when the answer is wrong.
> [!EXPLAIN] Explanation of the above topic: A clipped linear output is flat outside $[0,1]$, and a flat function has zero gradient, so gradient descent cannot tell which way to move. The sigmoid is never exactly flat. Combined with the log in the likelihood, the loss for a confidently wrong answer is large with a large gradient, which is why logistic regression and neural classifiers train well with this pairing.
## Worked Example
The XOR forward pass for input $[1,1]$ (p. 174 to 175): $x^\top W=(2,2)$, plus $c$ gives $(2,1)$, ReLU leaves $(2,1)$, and $w^\top h=1\cdot2-2\cdot1=0$. XOR of $1,1$ is 0, so the network is right. Lecture 4.3 repeats the same weights with a sigmoid in place of ReLU, and its worked result is $\tfrac1{1+e^{-2}}-\tfrac2{1+e^{-1}}\approx-0.5813$.
## Connections
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 10|Week 10]] and [[20_Progress/Degree/CSCI 4521/Weekly/Week - 11|Week 11]]: LEC 4.3's "logistic function as nonlinearity" and layering example, $W_2^\top\sigma(W_1^\top x+b_1)+b_2$, are §6.1 with a sigmoid, and the lecture points to section 6.1 of this book.
- [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5 (Part 2)|DLB Chapter 5 (Part 2)]] §5.10 gives the recipe this chapter reuses.
- [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 4 (Part 2)|ISL Chapter 4 (Part 2)]]: the sigmoid output is logistic regression on the hidden features.
- [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 8|DLB Chapter 8]]: the optimizer that trains this network.
## Open Questions
- [ ] Verify printed pages 170-182 against the PDF viewer. The offset of 15 matches the printed numbers inside the Chapter 5 and 8 extractions.
- [ ] Compare with a NotebookLM run on PDF pp. 185-198 and note any disagreement here.
- [ ] Softmax output units (§6.2.2.3) are on PDF pp. 199-201 and belong to Week 13, so they are not covered here.
