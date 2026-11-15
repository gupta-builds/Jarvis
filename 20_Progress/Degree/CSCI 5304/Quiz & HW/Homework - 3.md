---
type: class
class_kind: homework
status: sprout
created: 2026-11-14
updated: 2026-11-14
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

Notation in the boxes: `s` is $\sigma$, `e` is $\epsilon$, `eps` is $\epsilon_{machine}$, `(+) (-) (x) (/)` are $\oplus\ \ominus\ \otimes\ \oslash$, a tilde `~` is a computed or perturbed quantity. Write the real symbols by hand; the plain text is only there to keep line lengths honest.

### 1. (Ex. 12.1) Lower bound on $\kappa(A)$
**Box 1(a)** (22 lines max)
```text
Goal: sharpest lower bound on kappa(A) = s1 / s202
(s_i = singular values of A. Ref: T&B L12, (12.16))

Known:  ||A||_2 = s1 = 100,   ||A||_F^2 = sum s_i^2
So  s1^2 + s2^2 + ... + s202^2 = 101^2 = 10201
    s2^2 + ... + s202^2 = 10201 - 10000 = 201

These are 201 numbers, each >= s202^2, so
    201 * s202^2  <=  201   =>   s202 <= 1.
Therefore
    kappa(A) = s1 / s202  >=  100 / 1 = 100.
(If s202 = 0, kappa = infinity, still >= 100.)

Sharp, equality attained: take
    A = diag(100, 1, 1, ..., 1),  202 x 202.
  ||A||_2 = 100
  ||A||_F = sqrt(10000 + 201) = 101
  kappa(A) = 100 / 1 = 100.

Answer:  kappa(A) >= 100, and 100 is attained.
```
Why it works: in the 2-norm $\kappa(A)=\sigma_1/\sigma_m$ (12.16), and $\|A\|_F=\sqrt{\sum\sigma_i^2}$ (9/22 lecture). The Frobenius norm pins the sum of the squares of the 201 small singular values at 201, so the smallest one cannot exceed the root-mean-square value 1. The diagonal matrix shows nothing sharper is possible.

### 2. (Ex. 13.2) Integers missing from $\mathbf F$
**Box 2(a)** (11 lines max)
```text
F = {0} U {+-(m/b^t) b^e : 1<=m<=b^t, e integer}
(b = base, t = precision; T&B (13.2))
Integers 1..b^t are in F: take m = n, e = t.
Claim: n = b^t + 1 is NOT in F.
Suppose b^t+1 = m*b^k, 1<=m<=b^t (k = e-t).
 k <= 0: m*b^k <= b^t < b^t + 1.  No.
 k >= 1: b | n, but n = b^t + 1 = 1 (mod b). No.
So the smallest positive integer not in F is
        n = b^t + 1.
For b = 2:   n = 2^t + 1.
```
**Box 2(b)** (11 lines max)
```text
From (a): N = 2^t + 1  (b = 2, t = precision).
T&B p. 98: t = 24 for single, t = 53 for double.

Single:  N = 2^24 + 1 = 16,777,217
Double:  N = 2^53 + 1 = 9,007,199,254,740,993

Why: on [2^t, 2^(t+1)] the gap between floats is 2,
so only even integers are in F there. 2^t+1 is odd.
(2^t itself is in F: m = 2^t, e = t.)
Check in Python: float(2**53+1) == 2**53+1 is False;
2**53-1, 2**53, 2**53+2 are all exactly in F.
```
Evidence (run here): $2^{53}+1$ and $2^{53}+3$ do not survive `float(...)`, while $2^{53}-3,\dots,2^{53}$, $2^{53}+2$ and $2^{53}+4$ do. The same pattern in single precision (emulated with `struct`) around $2^{24}+1=16777217$.

### 3. (Ex. 13.2) Experiments with $2^n-1+0.5$ and $2^n+0.5$
**Box 3(a)** (3 lines max)
```text
n = 53: first n with x == y (they stop differing).
y-x: n=51 -> 1;  n=52 -> 0.5 (wrong);  n=53 -> 0
n=53: both = 9007199254740992.0 (Python float).
```
**Box 3(b)** (7 lines max)
```text
IEEE double: 53-bit significand, round to nearest.
Gaps: 0.5 on [2^51,2^52), 1 on [2^52,2^53), 2 above.
n=52: y=2^52+.5 is a tie, rounds to even 2^52;
  x=2^52-.5 is exact, so y-x = 0.5 instead of 1.
n=53: x=2^53-.5 ties to 2^53 and y rounds to 2^53,
  so x == y. Error (13.5) <= eps*|v| is ~1 at 2^53,
  as big as the difference being measured.
```
**Box 3(c)** (7 lines max)
```text
Python int: x = 2**n+1 and y = 2**n differ for every
 n tried: 10,52,53,64,100,1000,10**5 (x-y = 1).
No max integer: Python ints are multi-precision
 (any length, no overflow); the limit is memory.
 sys.maxsize = 2^63-1 is only a size limit.
Floats differ: float(2**53+1) == float(2**53), so
 doubles keep 2^n+1 and 2^n apart only up to n = 52.
```
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
**Box 4(a)** (6 lines max; sketch, 5.7 in by 2.2 in)
```text
Axes: x 1.92 to 2.08; y about -1.4e-10 to +1.4e-10.
Ends match (b): -1.35e-10 at 1.92, +1.1e-10 at 2.08.
For 1.94 < x < 2.06: jagged zig-zag, height ~1e-11,
 crossing 0 often (wrong sign at 56 of 161 pts).
No smooth S-shape, no clean zero at x = 2.
Code: sum(C[i]*x**(9-i) for i in range(10))
```
**Box 4(b)** (6 lines max; sketch, same axes)
```text
Same axes. Smooth increasing S-curve (x-2)^9:
 (1.92, -1.34e-10)  (1.96, -2.6e-13)  (2.00, 0)
 (2.04, +2.6e-13)  (2.08, +1.34e-10)
Looks flat on the axis for 1.96 < x < 2.04
 (|p| < 3e-13 there). No noise, one zero at 2.
Code: (x - 2)**9
```
**Box 4(c)** (6 lines max)
```text
Coeff. form: terms up to 6.5e4 at x=2, alternating
 signs, cancel to ~0 (cancellation, Ex. 12.3).
 Rel. error ~1.1e-16 per op (13.7) gives abs error
 ~1e-16*6.5e4 ~ 1e-11 > |true p| when |x-2|<0.06.
(x-2)^9: no cancellation, rel. error ~9*eps: smooth.
Same cause as Wilkinson's polynomial (Ex. 12.5).
```
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
**Box 5(a)** (12 lines max)
```text
Meaning (T&B (14.7)): let |g1(e)| <= C1 e and
|g2(e)| <= C2 e for all small e (e = eps -> 0). Then
 (1+g1)(1+g2) = 1 + g,   g = g1 + g2 + g1*g2.
For e <= 1:
 |g| <= |g1| + |g2| + |g1||g2|
     <= C1 e + C2 e + C1 C2 e^2
     <= (C1 + C2 + C1 C2) e.
So g = O(e), with one constant C = C1 + C2 + C1 C2
that does not depend on the data. That is
 (1+O(e))(1+O(e)) = 1 + O(e).   QED
```
**Box 5(b)** (12 lines max)
```text
Let |g(e)| <= C e for all small e. Take e <= 1/(2C),
so |g| <= 1/2 and 1 + g >= 1/2. Then
 1/(1+g) - 1 = (1 - (1+g)) / (1+g) = -g / (1+g)
 |-g/(1+g)| <= |g| / (1 - |g|) <= 2|g| <= 2C e.
So (1+g)^(-1) = 1 + h with |h| <= 2C e, that is
 (1 + O(e))^(-1) = 1 + O(e).   QED
```

### 6. (Ex. 15.1 a, b) Backward stability of $x\oplus x$ and $x\otimes x$
Convention (T&B p. 103 and Lecture 15): the data are first rounded, $\tilde f(x)=\mathrm{fl}(x)\circledast\mathrm{fl}(x)$, with (13.5) $\mathrm{fl}(x)=x(1+\epsilon_1)$ and (13.7) for the operation.

**Box 6(a)** (12 lines max)
```text
f(x) = 2x. Algorithm: f~(x) = fl(x) (+) fl(x).
(13.5): fl(x) = x(1+e1), |e1| <= eps.
(13.7): u (+) u = (u+u)(1+e2), |e2| <= eps.
So f~(x) = 2x(1+e1)(1+e2).
Define x~ = x(1+e1)(1+e2). Then
 f(x~) = 2x~ = 2x(1+e1)(1+e2) = f~(x)   (exactly).
Data change:
 |x~ - x|/|x| = |e1 + e2 + e1 e2| <= 2 eps + eps^2
 = O(eps).
By (14.5): f~(x) = f(x~) with x~ near x, so the
algorithm is backward stable.   QED
```
**Box 6(b)** (12 lines max)
```text
f(x) = x^2. Algorithm: f~(x) = fl(x) (x) fl(x).
fl(x) = x(1+e1);  u (x) u = u^2 (1+e2) by (13.7).
So f~(x) = x^2 (1+e1)^2 (1+e2).
Let s = sqrt(1+e2) (real, since |e2| < 1) and
 x~ = x(1+e1)s.  Then f(x~) = x~^2 = f~(x) exactly.
Data change: |x~ - x|/|x| = |(s-1) + e1 s|.
 s - 1 = e2/(s+1), so |s-1| <= |e2| <= eps;
 s <= 1 + |e2|.  So the change is at most
 eps + eps(1+eps) = 2 eps + eps^2 = O(eps).
f~(x) = f(x~) with x~ near x: backward stable.  QED
```

### 7. (Ex. 15.1 c, d) Classify $x\oslash x$ and $x\ominus x$
Symbols checked against the page image: MinerU printed both operations as $\odot$, but 7(a) is the division circle (textbook 15.1(c), "computed as $x\oslash x$") and 7(b) is the subtraction circle (15.1(d)).

**Box 7(a)** (11 lines max)
```text
f(x) = 1 (constant). f~(x) = fl(x) (/) fl(x).
(13.7): f~(x) = (fl(x)/fl(x))(1+e) = 1+e, |e|<=eps
 (e != 0 is allowed by (13.7), e.g. e = eps).
NOT backward stable: needs f~(x) = f(x~) = 1 for
 some x~, but f(x~) = 1 for every x~ (f constant)
 while f~(x) = 1 + e can differ from 1.
STABLE: take x~ = x (change 0 = O(eps)):
 |f~(x) - f(x~)| / |f(x~)| = |e| <= eps = O(eps),
 so (14.3) holds.
Answer: stable but not backward stable.
```
**Box 7(b)** (11 lines max)
```text
f(x) = 0. f~(x) = fl(x) (-) fl(x).
(13.7): f~(x) = (fl(x) - fl(x))(1+e) = 0 * (1+e) = 0
 exactly, for every x and every |e| <= eps.
Take x~ = x (change 0). Then f(x~) = 0 = f~(x),
 exact equality, so (14.5) holds with x~ near x.
Answer: backward stable (so also stable).
(Equality is exact, so f = 0 causes no relative
 error issue.)
```

### 8. (Ex. 15.2) A backward stable SVD would have to be exact
**Box 8(a)** (6 lines max)
```text
Data A; answer = explicit matrices (U, S, V).
Backward stable (14.5): computed (U~, S~, V~) is the
EXACT SVD of a nearby matrix: some A~ = A + dA with
 ||dA|| / ||A|| = O(eps)  and
 A~ = U~ S~ V~^T (U~,V~ exactly unitary, S~ diag).
```
**Box 8(b)** (7 lines max)
```text
Output: three matrices stored in floating point.
U~ and V~ are almost never EXACTLY unitary:
 U~^T U~ = I + E with E ~ eps, not E = 0.
(e.g. rotation [c -s; s c]: fl(c)^2+fl(s)^2 != 1)
Backward stable needs the output to be the exact SVD
of some A~; an exact SVD has exactly unitary U, V.
So f~(A) can never equal f(A~): impossible.
```
**Box 8(c)** (6 lines max)
```text
Stable (14.3, 14.4): there is A~ with
 ||A~ - A|| / ||A|| = O(eps), and the computed
 (U~, S~, V~) is within O(eps) of the exact SVD
 (U, S, V) of A~. Nearly the right answer to
 nearly the right question (SVD of A~, not of A).
So U~, V~ are unitary only up to O(eps).
```

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
