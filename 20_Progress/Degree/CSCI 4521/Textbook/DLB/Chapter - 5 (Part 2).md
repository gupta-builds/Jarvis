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
next: "Run the NotebookLM prompt on PDF pp. 155 and 165-169 and compare. §5.7.2 (SVMs) and §5.7.3 are on the same pages and are not in the assigned reading."
---
# DLB Chapter 5 (Part 2) — Logistic Regression, SGD and the ML Recipe (§5.7.1, §5.9, §5.10)
**Source:** *Deep Learning* (Goodfellow, Bengio, Courville), Chapter 5 "Machine Learning Basics", §5.7.1 (p. 140), §5.9 (pp. 150-152) and §5.10 (pp. 152-154), PDF pages 155, 165-169 (printed page = PDF page minus 15).
**Read from:** `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Textbook & Resources\DLB Textbook CSCI 4521.pdf`, extracted with MinerU.
**Course role:** the reading for [[20_Progress/Degree/CSCI 4521/Weekly/Week - 8|Week 8]] (5.7.1, 5.9), [[20_Progress/Degree/CSCI 4521/Weekly/Week - 9|Week 9]] and [[20_Progress/Degree/CSCI 4521/Weekly/Week - 10|Week 10]] (5.5, 5.7.1, 5.10). §5.5 is in [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5|Chapter - 5]].
## Chapter Summary
==Nearly every learning algorithm is the same recipe of a dataset, a cost function (usually a negative log-likelihood), a model and an optimization procedure, so logistic regression is linear regression with a Bernoulli model in place of a Gaussian one, and stochastic gradient descent is how any of it is optimized at scale.==
*Mechanism:* choose a parametric family for $p(y\mid x;\theta)$, write the cost $J(\theta)=-\mathbb E\log p_{\text{model}}(y\mid x)$, and minimize it. Linear regression uses a Gaussian mean $\theta^\top x$ and has a closed form (the normal equations). Logistic regression uses $p(y=1\mid x)=\sigma(\theta^\top x)$ and has no closed form, so it is searched for by gradient descent. SGD replaces the full gradient (cost $O(m)$) by an average over a small minibatch and steps against it.
## Reading Guide
- [ ] Read p. 140 (§5.7.1): Eq. 5.80 and 5.81, and why logistic regression needs iterative search while linear regression does not.
- [ ] Read pp. 150-151 (§5.9): the full-gradient cost in Eq. 5.97 and the minibatch estimate in Eq. 5.98 and 5.99.
- [ ] Read p. 152 (end of §5.9): why SGD is the main way to train large linear models and why its cost per step does not depend on $m$.
- [ ] Read pp. 152-153 (§5.10): the four-part recipe, Eq. 5.100 and 5.101.
- [ ] Read p. 154 (end of §5.10): which algorithms need a special-case optimizer (decision trees, k-means).
- [ ] Optional: pp. 141-143 (§5.7.2 SVMs and the kernel trick) are on the same pages but are not assigned.
## Key Concepts
- **Logistic regression (§5.7.1):** $p(y=1\mid x;\theta)=\sigma(\theta^\top x)$ (5.81). The name is odd because the model classifies, not regresses. It generalizes linear regression's Gaussian $\mathcal N(y;\theta^\top x,I)$ (5.80) to a binary output, where the mean must stay in $[0,1]$.
- **No closed form:** the optimal weights are found by maximizing the log-likelihood with gradient descent, unlike the normal equations.
- **SGD (§5.9):** the gradient of an additive cost is an expectation, so estimate it on a minibatch $\mathbb B$ of $m'$ examples: $g=\frac1{m'}\nabla_\theta\sum_{i=1}^{m'}L(x^{(i)},y^{(i)},\theta)$ and update $\theta\leftarrow\theta-\epsilon g$.
- **Per-example loss:** $L(x,y,\theta)=-\log p(y\mid x;\theta)$, so $J(\theta)=\frac1m\sum_iL$ (5.96).
- **The recipe (§5.10):** dataset, cost function, optimization procedure, model, each replaceable mostly independently.
- **Weight decay:** adding $\lambda\|w\|_2^2$ to the cost (5.101), which keeps a closed form for linear regression.
## Full Reading Notes
### §5.7.1 Probabilistic supervised learning (p. 140)
Most supervised algorithms estimate $p(y\mid x)$ by maximum likelihood over a parametric family. For two classes only one probability needs specifying. A mean for a Gaussian can be any number, but a binary variable's mean must lie in $[0,1]$, so the linear score is passed through the logistic sigmoid $\sigma$. Linear regression solved by the normal equations has a direct answer. Logistic regression does not, so the weights are searched by maximizing the log-likelihood. The same strategy works for essentially any supervised problem: write a parametric family of conditional distributions of the right type.
> [!EXPLAIN] Explanation of the above topic: Both models say "the label is random around a prediction". For a real-valued label the randomness is Gaussian around $\theta^\top x$. For a 0/1 label the randomness is a coin flip with heads-probability $\sigma(\theta^\top x)$. The sigmoid is just the step that keeps the coin's probability between 0 and 1. Everything else, including maximizing the likelihood, is the same plan.
### §5.9 Stochastic gradient descent (pp. 150-152)
Large training sets generalize better but make every gradient step expensive. For an additive cost the gradient is $\nabla J=\frac1m\sum_i\nabla L_i$ (5.97), a sum of $m$ terms and so $O(m)$ per step. Because it is an expectation, a minibatch estimate (5.98) is unbiased and far cheaper, and the update is $\theta\leftarrow\theta-\epsilon g$ (5.99). For a fixed model size the cost per update does not depend on the training set size, so SGD can train on billions of examples. It was once thought unreliable on non-convex problems, and the text says it works well in practice for the models it describes. Before deep learning, nonlinear models mostly used the kernel trick, which needs an $m\times m$ matrix and so scales poorly.
> [!EXPLAIN] Explanation of the above topic: Think of an opinion poll. You do not ask everyone to learn the average opinion, you ask a random few. A minibatch gradient is that poll: noisy, but pointed roughly the right way, and much cheaper. One pass through all the batches is an epoch, which is how lecture 4.3's `for epoch in range(...)` loop is organized.
### §5.10 Building a machine learning algorithm (pp. 152-154)
Linear regression is a dataset ($X,y$), the cost $J(w,b)=-\mathbb E\log p_{\text{model}}(y\mid x)$ (5.100), the model $\mathcal N(y;x^\top w+b,1)$ and, usually, the normal equations. Swap any piece to get another algorithm. The cost often has a statistical-estimation term (negative log-likelihood) and may add regularization such as weight decay (5.101). A nonlinear model usually forces a numerical optimizer. Unsupervised learning fits the same recipe with a dataset of only $X$: the first PCA vector comes from the reconstruction loss $\|x-r(x;w)\|^2$ with $r(x)=w^\top xw$ and $\|w\|=1$ (5.102). Decision trees and k-means need special-case optimizers because their costs have flat regions.
## Worked Example
Weight decay on linear regression (Eq. 5.101). The cost is $\lambda\|w\|_2^2$ plus the negative log-likelihood. With a Gaussian model the likelihood term is the squared error, so the cost is exactly the ridge-regression loss in lecture 3.4 ($\sum(y_i-x_i^\top w-b)^2+\lambda\sum w_i^2$). The closed form survives, and a larger $\lambda$ shrinks $w$ toward zero (more bias, less variance).
## Connections
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 8|Week 8]]: LEC 3.3 derives gradient descent step by step on $(m-3)^2$ and runs it in PyTorch. The book's §5.9 is the minibatch version and says why it matters.
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 10|Week 10]] and [[20_Progress/Degree/CSCI 4521/Weekly/Week - 11|Week 11]]: LEC 4.2 and 4.3 are §5.7.1 in detail. The lecture writes $p(x)=\sigma(w^\top x+b)$, derives the gradient by hand, then codes SGD with `DataLoader` and `torch.optim.SGD`.
- [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 4 (Part 2)|ISL Chapter 4 (Part 2)]] covers the same model with odds and log odds.
- [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5|DLB Chapter 5]] §5.5 shows minimizing cross-entropy equals maximizing likelihood, which is why the lecture minimizes the negative log-likelihood.
## Open Questions
- [ ] Compare with a NotebookLM run on PDF pp. 155 and 165-169 and note any disagreement here.
- [ ] Confirm printed pages 150-154 against the PDF viewer. The offset of 15 matches the printed numbers inside this extraction.
- [ ] The book says gradient descent on non-convex problems was once seen as unprincipled and now works. Confirm what the lecture says about local minima in Week 8.
