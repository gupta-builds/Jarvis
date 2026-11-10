---
type: class
class_kind: homework
status: sprout
created: 2026-11-09
updated: 2026-11-09
tags:
  - class
  - homework
area:
  - "[[CSCI 5304 Board]]"
next: "Hand-copy the two boxed answers below into the two printed boxes of Quiz - 4.pdf (one box per question), fill in Name and Section, and confirm the due date and submission method on Canvas"
---
# Quiz - 4
## Overview
CSCI-5304 Fall 2026, 10 points, 2 questions (one 5-point part each), written proofs, no coding. Source file: `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Midterm\Quiz - 4.pdf`, one large boxed answer space under each question (about 5.6 in wide by 6.2 in tall), filled in by hand. Content is Trefethen & Bau **Example 15.1** (inner product, backward stable) and **Example 15.2** (outer product, stable but not backward stable), Lectures 13 to 15.

The Nov 5 lecture announced it as a take-home quiz posted that evening and due "Monday night", which is 2026-11-09. That is the lecture's wording, not a Canvas date, so confirm the deadline on Canvas.
## Requirements
- [ ] **1. (Example 15.1, 5 pts)** $f(\vec x,\vec y)=\vec x^T\vec y$ on $\mathbb R^m$. Show $\tilde f=(x_1\otimes y_1)\oplus\cdots\oplus(x_m\otimes y_m)$ is **backward stable**, using axioms (13.5) and (13.7).
- [ ] **2. (Example 15.2, 5 pts)** $f(\vec x,\vec y)=\vec x\vec y^T$ on $\mathbb R^m$. Show $\tilde A_{ij}=x_i\otimes y_j$ is **not backward stable, but is stable**, using (13.5) and (13.7).
- [ ] Name and Section lines filled in.
- [ ] Confirm due date and submission method on Canvas.
## Work log
### 2026-11-09 - full written solve
Solved from the textbook extraction (`CSCI 5304 Textbook (MinerU full extraction).md`: Lecture 13 axioms, Lecture 14 definitions (14.3) to (14.5), Lecture 15 Examples 15.1 and 15.2, Lecture 17 proof pattern) and the Nov 3 and Nov 5 lecture transcripts. Every step is checked algebraically, and the Question 2 counterexample was also checked numerically (see Checks).

**What the lectures give for these two questions.** The transcripts never work Examples 15.1 or 15.2 directly. The textbook says of 15.1 only that it "can be shown ... implicitly in Lecture 17," and of 15.2 only an explanation in words. What the lectures do give is the method and the exact definitions the answers must use:
- Nov 3: backward stable means you get **exactly the right answer to a perturbed problem**, and the perturbation has relative size $O(\epsilon_{\text{machine}})$. Stability only asks for nearly the right answer to a nearly right problem.
- Nov 5: to prove backward stability you apply (13.7) to every floating point operation, then **move each error onto the input data** as a perturbation. This is the Lecture 17 back substitution proof (m = 1, then m = 2, then general m), and Question 1 is the same move for a sum of products.
- Nov 5: moving a small relative factor between numerator and denominator costs only $O(\epsilon^2)$ (Exercise 14.2). Backward stability is a property of the algorithm, and the constant in $O(\epsilon)$ may depend on the dimension $m$ but never on the data (Lecture 14, "Dependence on m and n").

**Definitions used (textbook, Lecture 14).**
- Stable (14.3), (14.4): $\dfrac{\|\tilde f(x)-f(\tilde x)\|}{\|f(\tilde x)\|}=O(\epsilon)$ for some $\tilde x$ with $\dfrac{\|\tilde x-x\|}{\|x\|}=O(\epsilon)$.
- Backward stable (14.5): $\tilde f(x)=f(\tilde x)$ **exactly**, for some $\tilde x$ with $\dfrac{\|\tilde x-x\|}{\|x\|}=O(\epsilon)$.
- Axiom (13.7): $a\circledast b=(a*b)(1+\epsilon)$, $|\epsilon|\le\epsilon_{\text{machine}}$. Axiom (13.5): $\mathrm{fl}(x)=x(1+\epsilon)$, $|\epsilon|\le\epsilon_{\text{machine}}$.
- Norm choice does not matter (Theorem 14.1), so any norm may be used.

### 1(a) - handwritten answer: inner product is backward stable
Write $\epsilon=\epsilon_{\text{machine}}$. Copy this into the box.

**Goal.** Find $\tilde x,\tilde y$ with $\tilde f(x,y)=\tilde x^T\tilde y$ **exactly** and $\|(\tilde x,\tilde y)-(x,y)\|/\|(x,y)\|=O(\epsilon)$ (14.5).

1. Each product, by (13.7): $x_i\otimes y_i=x_iy_i(1+\eta_i)$, $|\eta_i|\le\epsilon$.
2. Each sum, left to right: $s_1=x_1\otimes y_1$ and $s_k=s_{k-1}\oplus(x_k\otimes y_k)=\big(s_{k-1}+x_ky_k(1+\eta_k)\big)(1+\theta_k)$, with $|\theta_k|\le\epsilon$ for $k=2,\dots,m$.
3. Unroll to $s_m$:
$$\tilde f(x,y)=s_m=\sum_{i=1}^m x_iy_i\,(1+\eta_i)\prod_{k=\max(i,2)}^{m}(1+\theta_k).$$
4. Term $i$ carries at most $m$ factors of the form $(1+\text{error})$, each error at most $\epsilon$ in size. So $(1+\eta_i)\prod_k(1+\theta_k)=1+\gamma_i$ with
$$|\gamma_i|\le(1+\epsilon)^m-1=m\epsilon+O(\epsilon^2).$$
5. Move the errors onto $x$: $\tilde f(x,y)=\sum_i\big(x_i(1+\gamma_i)\big)y_i=\tilde x^T\tilde y$ **exactly**, with $\tilde x_i=x_i(1+\gamma_i)$ and $\tilde y=y$.
6. Size of the perturbation: $|\tilde x_i-x_i|=|\gamma_i||x_i|$, so
$$\frac{\|\tilde x-x\|}{\|x\|}\le m\epsilon+O(\epsilon^2)=O(\epsilon),\qquad \tilde y-y=0.$$

**Conclusion.** $\tilde f(x,y)=f(\tilde x,\tilde y)$ exactly, for data within $O(\epsilon)$ of $(x,y)$ (the constant $m$ depends on the dimension, not on the data). Exactly the right answer to a nearby problem, so the algorithm is **backward stable**. $\blacksquare$

*If room is left, add:* if the inputs are first rounded by (13.5), $\mathrm{fl}(x_i)=x_i(1+\alpha_i)$ and $\mathrm{fl}(y_i)=y_i(1+\beta_i)$ add two more factors per term, so $m\epsilon$ becomes $(m+2)\epsilon$, still $O(\epsilon)$. The same bound holds for any order of summation, since every term passes through at most $m-1$ additions and one multiplication.

### 2(a) - handwritten answer: outer product is stable, not backward stable
Write $\epsilon=\epsilon_{\text{machine}}$ and take $m\ge2$. Copy this into the box.

**Setup.** By (13.7): $\tilde A_{ij}=x_i\otimes y_j=x_iy_j(1+\epsilon_{ij})$, $|\epsilon_{ij}|\le\epsilon$, a separate error for each of the $m^2$ entries.

**Stable.** Take $\tilde x=x$ and $\tilde y=y$ (input perturbation $0=O(\epsilon)$, so (14.4) holds). Then $\tilde A-xy^T$ has entries $\epsilon_{ij}x_iy_j$, so in the Frobenius norm
$$\|\tilde A-xy^T\|_F=\Big(\sum_{i,j}\epsilon_{ij}^2x_i^2y_j^2\Big)^{1/2}\le\epsilon\Big(\sum_{i,j}x_i^2y_j^2\Big)^{1/2}=\epsilon\|x\|_2\|y\|_2=\epsilon\|xy^T\|_F.$$
So $\dfrac{\|\tilde f(x,y)-f(\tilde x,\tilde y)\|}{\|f(\tilde x,\tilde y)\|}\le\epsilon=O(\epsilon)$, which is (14.3). Hence $\tilde f$ is **stable** (it is even accurate, (14.2)). If $x,y$ must be rounded first, use $\tilde x=\mathrm{fl}(x)$ and $\tilde y=\mathrm{fl}(y)$ and the same bound holds.

**Not backward stable.** Backward stability would need $\tilde A=f(\tilde x,\tilde y)=\tilde x\tilde y^T$ for some $\tilde x,\tilde y$. Every such matrix has **rank at most 1**, so every $2\times2$ minor is $0$ (for example $\tilde x_1\tilde y_1\tilde x_2\tilde y_2-\tilde x_1\tilde y_2\tilde x_2\tilde y_1=0$). But the entries of $\tilde A$ carry independent rounding errors:
$$\det\begin{bmatrix}\tilde A_{11}&\tilde A_{12}\\\tilde A_{21}&\tilde A_{22}\end{bmatrix}=x_1x_2y_1y_2\big[(1+\epsilon_{11})(1+\epsilon_{22})-(1+\epsilon_{12})(1+\epsilon_{21})\big]=x_1x_2y_1y_2(\epsilon_{11}+\epsilon_{22}-\epsilon_{12}-\epsilon_{21})+O(\epsilon^2),$$
which is nonzero unless the four errors cancel, and (13.7) promises only $|\epsilon_{ij}|\le\epsilon$, not cancellation.

*Concrete check (3-digit decimal machine, $\epsilon=0.005$):* $x=y=(1.01,\,1.03)$ gives $\tilde A=\begin{bmatrix}1.02&1.04\\1.04&1.06\end{bmatrix}$, $\det\tilde A=1.02\cdot1.06-1.04^2=-0.0004\ne0$. So $\tilde A$ has rank 2, and **no** $(\tilde x,\tilde y)$, however close to $(x,y)$, satisfies $\tilde A=\tilde x\tilde y^T$. Hence $\tilde f$ is **not backward stable**.

**Why (one line).** The solution space is $m\times m$ matrices (dimension $m^2$), much larger than the data space (dimension $2m$), and rank-1 matrices are a thin subset. Rounding pushes $\tilde A$ off it. As a rule, backward stability is rare when $\dim Y>\dim X$ (Example 15.2). $\blacksquare$

### Checks run
- **Unrolled sum (1a).** Checked by hand for $m=3$: $s_3=(p_1+p_2)(1+\theta_2)(1+\theta_3)+p_3(1+\theta_3)$, which matches the product limits $k=\max(i,2),\dots,m$. Term count per entry: $i=1$ and $i=2$ have $\eta_i$ plus $\theta_2,\dots,\theta_m$, which is $m$ factors, and $i\ge3$ has fewer. So $m$ is the correct maximum.
- **Stable bound (2a).** $\|xy^T\|_F=\|x\|_2\|y\|_2$ because $\sum_{i,j}x_i^2y_j^2=(\sum x_i^2)(\sum y_j^2)$.
- **Decimal counterexample (2a).** $1.01^2=1.0201\to1.02$, $1.01\cdot1.03=1.0403\to1.04$, $1.03^2=1.0609\to1.06$, each rounding error well under $0.005$ relative, so the machine satisfies (13.7). $\det=1.0812-1.0816=-0.0004$.
- **IEEE double counterexample (2a).** In Node, $x=(0.1,0.3)$ and $y=(0.7,0.9)$ give a computed $2\times2$ outer product whose exact determinant (computed with BigInt on the stored doubles) is nonzero, so a real double precision machine also produces a rank-2 $\tilde A$.

### Before writing it on the paper
Quiz - 2 lost 1.5 points to a slip, so check these on the handwritten copy:
- Question 1 must end with the equality $\tilde f(x,y)=f(\tilde x,\tilde y)$ **exact**, not "approximately". That exactness is the whole difference between backward stable and stable.
- Question 2 has **two** claims, "stable" and "not backward stable". Both need their own labeled paragraph and conclusion.
- Count of factors: $m$ per term (one product, up to $m-1$ sums). Write $m\epsilon+O(\epsilon^2)$, not $2m\epsilon$ or $(m-1)\epsilon$.
- Say $m\ge2$ in 2(a), since for $m=1$ the outer product is one multiplication and is backward stable.
- For the "not backward stable" half, the minor argument must say that $\tilde x\tilde y^T$ has rank $\le1$, so **no** nearby $(\tilde x,\tilde y)$ works, not just that one choice fails.
## Concepts used
- **Floating point axioms (13.5), (13.7)** (textbook Lecture 13): the only facts used about the machine, one $(1+\epsilon)$ factor per operation.
- **Stable versus backward stable** (textbook Lecture 14, (14.3) to (14.5)): the two definitions being matched in 1(a) and separated in 2(a).
- **Backward error analysis by moving errors onto the data** (Nov 5 lecture, textbook Lecture 17): the technique in 1(a), same as the back substitution proof.
- **$O(\epsilon)$ with dimension-dependent constant, norm independence** (textbook Lecture 14, Theorem 14.1): why $m\epsilon$ is still $O(\epsilon)$ and why the Frobenius norm is allowed.
- **Rank-1 matrices and $2\times2$ minors** (earlier SVD lectures, Lecture 4): why $\tilde x\tilde y^T$ cannot match a generic $\tilde A$.
## Post-submit reflection
<!-- Optional until feedback: the first failure, the pattern, and what to change. -->
