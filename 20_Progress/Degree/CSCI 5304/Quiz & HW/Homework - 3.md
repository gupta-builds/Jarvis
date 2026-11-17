---
type: class
class_kind: homework
status: sprout
created: 2026-11-14
updated: 2026-11-16
tags:
  - class
  - homework
area:
  - "[[CSCI 5304 Board]]"
next: "Hand-copy each box text below into the Gradescope PDF template; decide how to handle the 3(a) wording flag (see Open flags); confirm the real due date on Canvas or Gradescope before submitting"
---
# Homework - 3
## Overview
CSCI-5304 Fall 2026, Homework 3, 80 points, 8 problems. They are Trefethen and Bau exercises 12.1, 13.2 (twice), 13.3, 14.2, 15.1 (twice) and 15.2, so the content is Lectures 12 to 15: condition numbers, floating point, stability and backward stability. Problems 3 and 4 need Python; the rest are written proofs and explanations. Source file: `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Homework\Homework - 3.pdf` (8 pages, one boxed answer area per sub-part, filled in by hand and uploaded to Gradescope). Due date not verified: the Board's printed "Wed 10/21" is stale, because the professor was still calling HW3 upcoming in the 11/12 lecture. Confirm the real date before treating it as due.
## Requirements
**Must submit**
- [ ] Fill the boxes of the Gradescope PDF template (print, write, scan, upload; or digital edit). Leave work and final results inside the boxes.
- [ ] Name and Section line on page 1.
- [ ] 1(a) lower bound on $\kappa_2(A)$ (10 pts).
- [ ] 2(a) exact formula for the smallest positive integer not in $\mathbf F$ (5); 2(b) its value for IEEE single and double, from a formula (5).
- [ ] 3(a) smallest $n$ where $x=2^n-1+0.5$ and $y=2^n+0.5$ differ on this machine (2); 3(b) IEEE explanation (3); 3(c) Python `int` version (5).
- [ ] 4(a) plot of $p(x)$ via coefficients (3); 4(b) plot via $(x-2)^9$ (3); 4(c) comment on the difference (4).
- [ ] 5(a) $(1+O(\epsilon))(1+O(\epsilon))=1+O(\epsilon)$ (5); 5(b) $(1+O(\epsilon))^{-1}=1+O(\epsilon)$ (5).
- [ ] 6(a) $x\oplus x$ and 6(b) $x\otimes x$ are backward stable (5 each).
- [ ] 7(a) $x\oslash x$ for $x\ne0$ and 7(b) $x\ominus x$: classify and prove (5 each).
- [ ] 8(a) to 8(c) backward stability and stability of an SVD algorithm (3, 4, 3).

**Must not do**
- Do not skip the box format: one warning, then later submissions in the wrong format are not accepted.
- Do not forget to cite any source beyond the course (website, book, video). Everything below uses only the textbook (T&B), the lectures and the professor's Wilkinson notebook.

**Own constraint:** the text is handwritten, so every answer below is sized to its box (see the budget table).
## Work log
### 2026-11-14: full solve
Solved all 8 problems from T&B Lectures 12 to 15 (MinerU extraction, lines 3246 to 4066), the 10/27 lecture (floating point, accuracy, stability, backward stability), the 10/29 lecture (Wilkinson polynomial, why coefficients are a bad way to evaluate), the 9/22 lecture ($\|A\|_F^2=\sum\sigma_i^2$), and the 11/12 exercise review (which says 3(a) is a small positive integer and that Exercise 15.1 parts are in HW3). The Python results come from this laptop (Python 3.12.14, doubles). Each box text was written to a line budget, then the budgets were checked by script.

**How the boxes were sized.** Measured from the rendered pages (200 dpi): every box is 5.7 in wide. Budget = floor(height / 0.3 in) minus 1 spare line, at most 52 characters per line.

| Box | Height (in) | Max lines |
|---|---|---|
| 1(a) | 6.9 | 22 |
| 2(a), 2(b) | 3.6 | 11 |
| 3(a) | 1.4 | 3 |
| 3(b), 3(c) | 2.5 | 7 |
| 4(a), 4(b), 4(c) | 2.2 | 6 |
| 5(a), 5(b), 6(a), 6(b) | 3.9 | 12 |
| 7(a), 7(b) | 3.6 | 11 |
| 8(a), 8(c) | 2.1 | 6 |
| 8(b) | 2.5 | 7 |

How to read a box: each rendered box is one callout, and each source line is one handwritten line, so copy the lines in order. Lines in a box stay under about 52 handwritten characters; the script check counts a longer line as two. $\epsilon_m$ is $\epsilon_{machine}$, $\oplus\ \ominus\ \otimes\ \oslash$ are the floating point operations, and a tilde marks a computed or perturbed quantity.

### 1. (Ex. 12.1) Lower bound on $\kappa(A)$

> [!example] Box 1(a) (22 lines max)
> Use $\kappa(A)=\sigma_1/\sigma_{202}$ (12.16) and $\|A\|_F^2=\sum_i\sigma_i^2$. \
> Given $\sigma_1=\|A\|_2=100$ and $\|A\|_F=101$: \
> $\sigma_1^2+\sigma_2^2+\cdots+\sigma_{202}^2=101^2=10201$ \
> $\sigma_2^2+\cdots+\sigma_{202}^2=10201-10000=201$ \
> These are 201 terms, each $\ge\sigma_{202}^2$, so \
> $201\,\sigma_{202}^2\le201\ \Rightarrow\ \sigma_{202}\le1$ \
> Hence $\kappa(A)=\sigma_1/\sigma_{202}\ge100/1=100$. \
> (If $\sigma_{202}=0$ then $\kappa=\infty\ge100$.) \
> Sharp: take $A=\mathrm{diag}(100,1,\dots,1)$, $202\times202$. \
> $\|A\|_2=100$, $\|A\|_F=\sqrt{10000+201}=101$, \
> $\kappa(A)=100/1=100$. \
> **Answer: $\kappa(A)\ge100$, and 100 is attained.**

Why it works: in the 2-norm $\kappa(A)=\sigma_1/\sigma_m$ (12.16), and $\|A\|_F=\sqrt{\sum\sigma_i^2}$ (9/22 lecture). The Frobenius norm pins the sum of the squares of the 201 small singular values at 201, so the smallest one cannot exceed the root-mean-square value 1. The diagonal matrix shows nothing sharper is possible.

### 2. (Ex. 13.2) Integers missing from $\mathbf F$

> [!example] Box 2(a) (11 lines max)
> $\mathbf F=\{0\}\cup\{\pm(m/\beta^t)\beta^e:\ 1\le m\le\beta^t,\ e\in\mathbb Z\}$ \
> Integers $1,\dots,\beta^t$ are in $\mathbf F$: take $m=n$, $e=t$. \
> Claim: $n=\beta^t+1\notin\mathbf F$. \
> Suppose $\beta^t+1=m\beta^k$ with $1\le m\le\beta^t$, $k=e-t$. \
> $k\le0$: $m\beta^k\le\beta^t<\beta^t+1$. Impossible. \
> $k\ge1$: $\beta\mid m\beta^k$, but $\beta^t+1\equiv1\pmod\beta$. Impossible. \
> So the smallest positive integer not in $\mathbf F$ is \
> **$n=\beta^t+1$** ($=2^t+1$ when $\beta=2$).

> [!example] Box 2(b) (11 lines max)
> From (a) with $\beta=2$: $N=2^t+1$. \
> $t=24$ (single), $t=53$ (double) (T&B p. 98). \
> Single: $N=2^{24}+1=16{,}777{,}217$ \
> Double: $N=2^{53}+1=9{,}007{,}199{,}254{,}740{,}993$ \
> Why: for $2^t\le n\le2^{t+1}$ the gap is 2 ($k=1$), \
> so only even integers are in $\mathbf F$ there. \
> $2^t+1$ is odd. ($2^t\in\mathbf F$: $m=2^t$, $e=t$.) \
> Python check: `float(2**53+1) == 2**53+1` is False.

Evidence (run here): $2^{53}+1$ and $2^{53}+3$ do not survive `float(...)`, while $2^{53}-3,\dots,2^{53}$, $2^{53}+2$ and $2^{53}+4$ do. The same pattern in single precision (emulated with `struct`) around $2^{24}+1=16777217$.

### 3. (Ex. 13.2) Experiments with $2^n-1+0.5$ and $2^n+0.5$

> [!example] Box 3(a) (3 lines max)
> **$n=53$**: first $n$ with $x=y$ (they stop differing). \
> $y-x$: $n=51\to1$; $n=52\to0.5$ (already wrong); $n=53\to0$ \
> At $n=53$ both are stored as $9007199254740992.0=2^{53}$.

> [!example] Box 3(b) (7 lines max)
> IEEE double: 53-bit significand, round to nearest. \
> Gaps: $0.5$ on $[2^{51},2^{52})$, $1$ on $[2^{52},2^{53})$, $2$ above. \
> $n=52$: $y=2^{52}+0.5$ is a tie, rounds to even $2^{52}$; \
> $x=2^{52}-0.5$ is exact, so $y-x=0.5\ne1$. \
> $n=53$: $x=2^{53}-0.5$ and $y=2^{53}+0.5$ both tie to $2^{53}$. \
> So $x=y$: the (13.5) error $\le\epsilon_m|v|$ is about 1 \
> at $2^{53}$, as large as the difference measured.

> [!example] Box 3(c) (7 lines max)
> Python `int`: $x=2^n+1$ and $y=2^n$ differ for every $n$ tried \
> ($n=10,52,53,64,100,1000,10^5$; $x-y=1$). \
> **No max integer**: Python ints are multi-precision (any \
> length, no overflow); only memory limits them. \
> `sys.maxsize`$=2^{63}-1$ is an index size, not a cap. \
> Floats: `float(2**53+1)==float(2**53)`, so doubles keep \
> $2^n+1$ and $2^n$ apart only for $n\le52$.

Evidence (run here, `exp3.py` in the session scratchpad):

| n | $x=2^n-1+0.5$ | $y=2^n+0.5$ | $y-x$ |
|---|---|---|---|
| 51 | 2251799813685247.5 | 2251799813685248.5 | 1.0 |
| 52 | 4503599627370495.5 | 4503599627370496.0 | 0.5 |
| 53 | 9007199254740992.0 | 9007199254740992.0 | 0.0 |

Python evaluates `2.0**n - 1 + 0.5` left to right: $2^{53}-1$ is exact, then the $+0.5$ is the rounded step. For Python `int`, `2**1024` is fine (bit length 1025) while `float(2**1024)` raises `OverflowError`, so the float limit is about $1.8\times10^{308}$ while the int limit is memory.

### 4. (Ex. 13.3) $p(x)=(x-2)^9$ two ways
Code (same style as the professor's `wP` in the Wilkinson notebook):
```python
C = [1, -18, 144, -672, 2016, -4032, 5376, -4608, 2304, -512]
def p_coef(x):  return sum(C[i]*x**(9-i) for i in range(10))
def p_exact(x): return (x - 2)**9
X = [round(1.920 + 0.001*k, 3) for k in range(161)]   # 1.920, ..., 2.080
```

> [!example] Box 4(a) (6 lines max)
> Axes: $x\in[1.92,\,2.08]$, $y\approx\pm1.4\times10^{-10}$. \
> Ends as (b): $-1.35\times10^{-10}$ (1.92), $+1.1\times10^{-10}$ (2.08). \
> For $1.94<x<2.06$: jagged zig-zag, height $\sim10^{-11}$, \
> crossing 0 often (wrong sign at 56 of 161 points). \
> No smooth S-shape, no clean zero at $x=2$. \
> Code: `sum(C[i]*x**(9-i) for i in range(10))`

> [!example] Box 4(b) (6 lines max)
> Same axes. Smooth increasing S-curve $(x-2)^9$: \
> $(1.92,-1.34\times10^{-10})$, $(1.96,-2.6\times10^{-13})$, $(2,0)$, \
> $(2.04,+2.6\times10^{-13})$, $(2.08,+1.34\times10^{-10})$. \
> Flat on the axis for $1.96<x<2.04$ ($|p|<3\times10^{-13}$). \
> No noise, one zero at $x=2$. \
> Code: `(x - 2)**9`

> [!example] Box 4(c) (6 lines max)
> Terms reach $6.5\times10^4$ at $x=2$, alternate in sign, \
> and cancel to about 0: cancellation (Ex. 12.3). \
> Rounding (13.7) error $\approx10^{-16}\cdot6.5\times10^4\approx10^{-11}$ \
> exceeds $|p(x)|$ for $|x-2|<0.06$: that is the noise. \
> $(x-2)^9$: no cancellation, error about $9\epsilon_m$: smooth. \
> Same cause as Wilkinson's polynomial (Ex. 12.5).

Evidence (run here): coefficient form range $[-1.345\times10^{-10},\,1.120\times10^{-10}]$, $(x-2)^9$ range $\pm1.342\times10^{-10}$, max $|p_{coef}-p_{exact}|=2.2\times10^{-11}$, error larger than the true value for $x\in[1.939,\,2.062]$, 56 of 161 sign mismatches. Largest term at $x=2$ is $6.45\times10^4$ (the terms $\pm18432,\,43008,\,64512,\dots$), times $\epsilon\approx2.2\times10^{-16}$ gives $1.4\times10^{-11}$, the size of the noise.

Hand-sketch table (every 0.01; the true curve is almost zero in the middle, the coefficient curve is not):

| $x$ | 1.92 | 1.93 | 1.94 | 1.95 | 1.96 | 1.97 | 1.98 | 1.99 | 2.00 |
|---|---|---|---|---|---|---|---|---|---|
| coefficients | -1.35e-10 | -4.5e-11 | -1.0e-11 | -4.4e-12 | -5.7e-14 | 1.8e-12 | -3.9e-12 | 2.5e-12 | 0 |
| $(x-2)^9$ | -1.34e-10 | -4.0e-11 | -1.0e-11 | -2.0e-12 | -2.6e-13 | -2.0e-14 | -5.1e-16 | -1e-18 | 0 |

| $x$ | 2.01 | 2.02 | 2.03 | 2.04 | 2.05 | 2.06 | 2.07 | 2.08 |
|---|---|---|---|---|---|---|---|---|
| coefficients | -7.8e-12 | -1.9e-12 | 1.2e-11 | -4.4e-12 | -1.4e-12 | 4.0e-12 | 3.5e-11 | 1.1e-10 |
| $(x-2)^9$ | 1e-18 | 5.1e-16 | 2.0e-14 | 2.6e-13 | 2.0e-12 | 1.0e-11 | 4.0e-11 | 1.3e-10 |

The exact noise pattern depends on the evaluation order and machine, so the sketch only needs the amplitude (about $10^{-11}$) and the region ($1.94<x<2.06$). The images were not generated: the course conda env's `numpy` fails to import here, so `matplotlib` was not tried.

### 5. (Ex. 14.2) Algebra of $O(\epsilon_{machine})$

> [!example] Box 5(a) (12 lines max)
> $O(\epsilon)$ means (14.7): $|g(\epsilon)|\le C\epsilon$ for all small $\epsilon$. \
> Let $|g_1|\le C_1\epsilon$, $|g_2|\le C_2\epsilon$ for $\epsilon\le\epsilon_0\le1$. \
> $(1+g_1)(1+g_2)=1+g$, where $g=g_1+g_2+g_1g_2$. \
> $|g|\le|g_1|+|g_2|+|g_1||g_2|$ \
> $\le C_1\epsilon+C_2\epsilon+C_1C_2\epsilon^2$ \
> $\le(C_1+C_2+C_1C_2)\,\epsilon$  (since $\epsilon^2\le\epsilon$). \
> So $g=O(\epsilon)$, $C=C_1+C_2+C_1C_2$ independent of data. \
> Therefore $(1+O(\epsilon))(1+O(\epsilon))=1+O(\epsilon)$. QED

> [!example] Box 5(b) (12 lines max)
> Let $|g(\epsilon)|\le C\epsilon$ for $\epsilon\le\epsilon_0$, with $C>0$. \
> Shrink $\epsilon_0\le1/(2C)$, so $|g|\le1/2$ and $1+g\ge1/2$. \
> Then $(1+g)^{-1}-1=-g/(1+g)$, and \
> $|g|/|1+g|\le|g|/(1-|g|)\le2|g|\le2C\epsilon$. \
> So $(1+g)^{-1}=1+h$ with $|h|\le2C\epsilon$, i.e. $h=O(\epsilon)$. \
> Therefore $(1+O(\epsilon))^{-1}=1+O(\epsilon)$. QED

### 6. (Ex. 15.1 a, b) Backward stability of $x\oplus x$ and $x\otimes x$
Convention (T&B p. 103 and Lecture 15): the data are first rounded, $\tilde f(x)=\mathrm{fl}(x)\circledast\mathrm{fl}(x)$, with (13.5) $\mathrm{fl}(x)=x(1+\epsilon_1)$ and (13.7) for the operation.

> [!example] Box 6(a) (12 lines max)
> $f(x)=2x$, $\tilde f(x)=\mathrm{fl}(x)\oplus\mathrm{fl}(x)$. \
> (13.5): $\mathrm{fl}(x)=x(1+\epsilon_1)$, $|\epsilon_1|\le\epsilon_m$. \
> (13.7): $u\oplus u=(u+u)(1+\epsilon_2)$, $|\epsilon_2|\le\epsilon_m$. \
> So $\tilde f(x)=2x(1+\epsilon_1)(1+\epsilon_2)$. \
> Define $\tilde x=x(1+\epsilon_1)(1+\epsilon_2)$. Then \
> $f(\tilde x)=2\tilde x=\tilde f(x)$ exactly. \
> $|\tilde x-x|/|x|=|\epsilon_1+\epsilon_2+\epsilon_1\epsilon_2|\le2\epsilon_m+\epsilon_m^2$ \
> $=O(\epsilon_m)$. \
> So $\tilde f(x)=f(\tilde x)$ with $\tilde x$ near $x$ (14.5): \
> the algorithm is **backward stable**. QED

> [!example] Box 6(b) (12 lines max)
> $f(x)=x^2$, $\tilde f(x)=\mathrm{fl}(x)\otimes\mathrm{fl}(x)$. \
> $\mathrm{fl}(x)=x(1+\epsilon_1)$; $u\otimes u=u^2(1+\epsilon_2)$ (13.7). \
> So $\tilde f(x)=x^2(1+\epsilon_1)^2(1+\epsilon_2)$. \
> Let $s=\sqrt{1+\epsilon_2}$ (real, $|\epsilon_2|<1$), $\tilde x=x(1+\epsilon_1)s$. \
> Then $f(\tilde x)=\tilde x^2=\tilde f(x)$ exactly. \
> $|\tilde x-x|/|x|=|(s-1)+\epsilon_1s|$. \
> $s-1=\epsilon_2/(s+1)$, so $|s-1|\le|\epsilon_2|\le\epsilon_m$, $s\le1+\epsilon_m$. \
> Change $\le\epsilon_m+\epsilon_m(1+\epsilon_m)=2\epsilon_m+\epsilon_m^2=O(\epsilon_m)$. \
> So $\tilde f(x)=f(\tilde x)$: **backward stable**. QED

### 7. (Ex. 15.1 c, d) Classify $x\oslash x$ and $x\ominus x$
Symbols checked against the page image: MinerU printed both operations as $\odot$, but 7(a) is the division circle (textbook 15.1(c), "computed as $x\oslash x$") and 7(b) is the subtraction circle (15.1(d)).

> [!example] Box 7(a) (11 lines max)
> $f(x)=1$ (constant). $\tilde f(x)=\mathrm{fl}(x)\oslash\mathrm{fl}(x)$. \
> (13.7): $\tilde f(x)=\big(\mathrm{fl}(x)/\mathrm{fl}(x)\big)(1+\epsilon)=1+\epsilon$, $|\epsilon|\le\epsilon_m$. \
> ($\epsilon\ne0$ is allowed by the axiom, e.g. $\epsilon=\epsilon_m$.) \
> **Not backward stable**: need $\tilde f(x)=f(\tilde x)$, some $\tilde x$. \
> But $f(\tilde x)=1$ always, while $\tilde f(x)=1+\epsilon$ may be $\ne1$. \
> **Stable**: take $\tilde x=x$ (change 0). Then \
> $|\tilde f(x)-f(\tilde x)|/|f(\tilde x)|=|\epsilon|\le\epsilon_m=O(\epsilon_m)$ (14.3). \
> **Answer: stable but not backward stable.**

> [!example] Box 7(b) (11 lines max)
> $f(x)=0$. $\tilde f(x)=\mathrm{fl}(x)\ominus\mathrm{fl}(x)$. \
> (13.7): $\tilde f(x)=\big(\mathrm{fl}(x)-\mathrm{fl}(x)\big)(1+\epsilon)=0\cdot(1+\epsilon)=0$ \
> exactly, for every $x$ and every $|\epsilon|\le\epsilon_m$. \
> Take $\tilde x=x$ (change 0). Then $f(\tilde x)=0=\tilde f(x)$, \
> so (14.5) holds with equality. \
> **Answer: backward stable** (hence also stable).

### 8. (Ex. 15.2) A backward stable SVD would have to be exact

> [!example] Box 8(a) (6 lines max)
> Data $A$; answer = the triple $(U,\Sigma,V)$. \
> Backward stable (14.5): the computed $(\tilde U,\tilde\Sigma,\tilde V)$ is the \
> **exact** SVD of a nearby matrix: some $\tilde A=A+\delta A$, \
> $\|\delta A\|/\|A\|=O(\epsilon_m)$, with $\tilde A=\tilde U\tilde\Sigma\tilde V^T$, \
> $\tilde U,\tilde V$ exactly unitary, $\tilde\Sigma$ diagonal.

> [!example] Box 8(b) (7 lines max)
> Output: three matrices stored in floating point. \
> $\tilde U,\tilde V$ are almost never **exactly** unitary: \
> $\tilde U^T\tilde U=I+E$, $\|E\|\approx\epsilon_m$, not $E=0$ \
> (e.g. $\mathrm{fl}(\cos\theta)^2+\mathrm{fl}(\sin\theta)^2\ne1$). \
> Backward stable needs $\tilde f(A)=f(\tilde A)$, an exact SVD, \
> whose $U,V$ are exactly unitary. Impossible: \
> the algorithm cannot be backward stable.

> [!example] Box 8(c) (6 lines max)
> Stable (14.3, 14.4): there is $\tilde A$ with \
> $\|\tilde A-A\|/\|A\|=O(\epsilon_m)$ such that the computed \
> $(\tilde U,\tilde\Sigma,\tilde V)$ is within $O(\epsilon_m)$ of the exact \
> SVD $(U,\Sigma,V)$ of $\tilde A$: nearly the right answer \
> to nearly the right question. So $\tilde U,\tilde V$ are \
> unitary only up to $O(\epsilon_m)$.

### Open flags
- **3(a) is worded ambiguously.** Read literally, "$x$ and $y$ differ" is true for every $n$ (they are exactly 1 apart), so the smallest such $n$ would be a trivial 0 or 1. The 11/12 remark ("a small-ish positive integer", not a negative or $0.0000\ldots$) and parts (b) and (c) point to the first $n$ where the stored values stop behaving: $n=53$ for $x==y$, with $n=52$ the first where $y-x\ne1$. The box says both facts. If a TA clarifies it, change the first line only.
- **1(a) does not need $A$ to be nonsingular.** If $\sigma_{202}=0$ then $\kappa=\infty\ge100$, so the bound still holds.
- **Problem 8 uses $V^T$ and real unitary language** as printed ($A=U\Sigma V^T$); the proof is the same with $V^*$.
- **Due date and Gradescope link** are not verified.
- **Plot and code check:** `numpy` in `.conda/csci-5304` raises `AttributeError: module 'numpy' has no attribute '__version__'`, so all experiments here ran in plain Python. Test your own notebook before relying on `matplotlib` there.
## Concepts used
- **Condition number in the 2-norm, $\kappa(A)=\sigma_1/\sigma_m$** ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 12|Lecture - 12]]): turns problem 1 into a statement about singular values.
- **Singular values and the Frobenius norm** ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 4|Lecture - 4]], [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 5|Lecture - 5]]): $\|A\|_F^2=\sum\sigma_i^2$ gives the budget of 201 for the small singular values in problem 1.
- **Floating point system $\mathbf F$, machine epsilon, round to nearest** (T&B Lecture 13, 10/27 lecture): problems 2 and 3, the gap sizes in $[2^k,2^{k+1}]$ and the tie to even rule.
- **Cancellation and ill-conditioning of polynomial rootfinding** ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 12|Lecture - 12]], Examples 12.3 and 12.5, and the 10/29 Wilkinson lecture): problem 4.
- **$O(\epsilon_{machine})$ as a uniform constant** (T&B Lecture 14, (14.6) to (14.8)): problem 5, and the bookkeeping behind every $(1+\epsilon_1)(1+\epsilon_2)$ in problems 6 and 7.
- **Stable versus backward stable, backward error analysis** (T&B Lectures 14 and 15, 10/27 lecture and 11/12 review): problems 6 to 8; a constant function ($x\oslash x$) is stable but not backward stable, and an output with a built-in constraint (exactly unitary $U,V$) cannot be backward stable.
## Post-submit reflection
<!-- Optional until feedback: the first failure, the pattern, and what to change. -->
