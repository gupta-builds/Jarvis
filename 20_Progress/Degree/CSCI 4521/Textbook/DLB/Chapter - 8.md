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
next: "Run the NotebookLM prompt on PDF pp. 309-316 and compare. Read the Nesterov momentum passage on PDF pp. 314-316, which this note only names."
---
# DLB Chapter 8 — SGD and Momentum (§8.3.1 to §8.3.2)
**Source:** *Deep Learning* (Goodfellow, Bengio, Courville), Chapter 8 "Optimization for Training Deep Models", §8.3.1 and §8.3.2, printed pp. 294-298 (PDF pp. 309-313, printed page = PDF page minus 15). §8.3.3 (Nesterov) is on PDF pp. 314-316.
**Read from:** `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Textbook & Resources\DLB Textbook CSCI 4521.pdf`, extracted with MinerU.
**Course role:** the reading for [[20_Progress/Degree/CSCI 4521/Weekly/Week - 10|Week 10]] (DLB 8.3), behind LEC 4.3's stochastic gradient descent and "improving SGD" slides (momentum and Adam).
## Chapter Summary
==Stochastic gradient descent follows a minibatch estimate of the gradient, and because that estimate stays noisy even at a minimum the learning rate must shrink over time, while momentum accelerates learning by accumulating past gradients into a velocity.==
*Mechanism:* each step samples $m$ examples and sets $\theta\leftarrow\theta-\epsilon_k\hat g$ with $\hat g=\frac1m\nabla_\theta\sum_iL$. Convergence needs $\sum_k\epsilon_k=\infty$ and $\sum_k\epsilon_k^2<\infty$, in practice a linear decay to a floor. Momentum adds a velocity $v\leftarrow\alpha v-\epsilon\hat g$ and updates $\theta\leftarrow\theta+v$. Aligned successive gradients build speed up to $\frac{\epsilon\|g\|}{1-\alpha}$.
## Reading Guide
- [ ] Read p. 294 (§8.3 intro and §8.3.1 start): why SGD uses an unbiased minibatch gradient.
- [ ] Study Algorithm 8.1 (p. 294): minibatch sampling, gradient estimate, update. Compare with lecture 4.3's `for epoch` and `for x_batch` loops.
- [ ] Read pp. 294-295: Eq. 8.12 and 8.13 and the learning-rate decay in Eq. 8.14.
- [ ] Read p. 295 (end of §8.3.1): computation per update does not grow with the number of examples.
- [ ] Read pp. 296-298 (§8.3.2, Eq. 8.15 to 8.17) and study Figure 8.5: momentum on a badly conditioned quadratic.
## Key Concepts
- **SGD (§8.3.1):** the gradient of the full cost is an expectation, so a minibatch of $m$ examples gives an unbiased estimate $\hat g=\frac1m\nabla_\theta\sum_iL(f(x^{(i)};\theta),y^{(i)})$.
- **Learning rate schedule:** the estimator's noise does not vanish at a minimum, so $\epsilon_k$ must decay. Sufficient conditions: $\sum\epsilon_k=\infty$ and $\sum\epsilon_k^2<\infty$ (8.12, 8.13). In practice $\epsilon_k=(1-\alpha)\epsilon_0+\alpha\epsilon_\tau$ with $\alpha=k/\tau$ (8.14), then constant.
- **Excess error:** $J(\theta)-\min_\theta J(\theta)$, used to measure convergence rate. SGD gets $O(1/k)$ for convex problems.
- **Momentum (§8.3.2):** a velocity $v\leftarrow\alpha v-\epsilon\nabla_\theta\left(\frac1m\sum L\right)$ and $\theta\leftarrow\theta+v$ (8.15, 8.16). $\alpha\in[0,1)$ sets how fast old gradients decay.
- **Terminal speed:** with a constant gradient the step approaches $\frac{\epsilon\|g\|}{1-\alpha}$ (8.17), so $\alpha=0.9$ is about 10 times faster than plain SGD.
## Full Reading Notes
### §8.3.1 Stochastic gradient descent (pp. 294-296)
SGD and its variants are probably the most used optimizers in machine learning. A fixed learning rate is not enough in practice. The random sampling adds noise that does not vanish at a minimum, while the true gradient shrinks toward zero there, so the step must shrink too. The learning rate may be chosen by trial and error but is best chosen by monitoring learning curves of the objective over time, which the book calls more art than science. The key property is that computation per update does not grow with the number of training examples, so convergence is possible even with huge datasets. The book also notes that for learning tasks, optimizing faster than $O(1/k)$ may not be worthwhile because faster convergence presumably corresponds to overfitting.
> [!EXPLAIN] Explanation of the above topic: A full-data gradient is exact but slow. A minibatch gradient is a quick guess, accurate on average but jittery. Near a minimum the exact gradient is nearly zero, yet the guess still jitters, so with a big step you would keep bouncing around the minimum. Shrinking the learning rate damps the bounce. That is why a decay schedule is part of SGD and not an extra.
### §8.3.2 Momentum (pp. 296-298)
Learning with SGD can be slow, especially with high curvature, small but consistent gradients, or noisy gradients. Momentum keeps a velocity that is an exponentially decaying average of the negative gradient, so the step depends on how large and how aligned a sequence of gradients is, and is largest when many successive gradients point the same way. Common values of $\alpha$ are 0.5, 0.9 and 0.99, and it is often raised over training. Figure 8.5 shows momentum crossing a narrow valley without zig-zagging.
> [!EXPLAIN] Explanation of the above topic: Think of a ball rolling downhill instead of a hiker who stops and re-aims at every step. In a long narrow valley, plain gradient steps bounce between the walls and make slow progress along the floor. The ball keeps its along-the-valley speed while the side-to-side kicks cancel. A larger $\alpha$ remembers more of the past, which is faster on smooth slopes but slower to turn around.
## Worked Example
Terminal speed (Eq. 8.17). With a constant gradient of norm $\|g\|=1$, learning rate $\epsilon=0.01$ and $\alpha=0.9$, the velocity grows toward $\frac{0.01\cdot1}{1-0.9}=0.1$ per step, ten times the plain-SGD step of $0.01$. With $\alpha=0.99$ the limit is $1.0$, one hundred times larger, which is why $\alpha$ is often started small and raised.
## Connections
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 10|Week 10]]: LEC 4.3's "Improving SGD" slide lists per-parameter learning rates, momentum ("mix gradient from this batch with previous gradients") and Adam. This chapter gives the equation for momentum. Adam is not in the assigned pages.
- [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5 (Part 2)|DLB Chapter 5 (Part 2)]] §5.9 introduces SGD, and this chapter adds the learning-rate schedule.
- [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 6|DLB Chapter 6]]: the cost this optimizer minimizes.
## Open Questions
- [ ] Verify printed pages 294-298 against the PDF viewer. The offset of 15 matches the printed numbers inside this extraction.
- [ ] Compare with a NotebookLM run on PDF pp. 309-316 and note any disagreement here.
- [ ] Read §8.3.3 (Nesterov momentum) and decide whether it needs a Part 2 note.
