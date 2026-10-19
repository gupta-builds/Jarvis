---
type: class
class_kind: homework
status: sprout
created: 2026-10-18
updated: 2026-10-18
tags:
  - class
  - homework
area:
  - "[[CSCI 5304 Board]]"
next: "Hand-copy the solutions below into the boxes of the printed Homework - 2 PDF; confirm the real due date on Canvas/Gradescope before submitting — [[CSCI 5304 Board]] flags HW #2's date as unverified"
---
# Homework - 2
## Overview
CSCI-5304 Fall 2026, Homework 2, 80 points, 8 problems, all written/proof-based (no coding). Source file: `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Homework\Homework - 2.pdf`, printed as an A4 sheet with a boxed answer space under each sub-part, to be filled in by hand. Problems are Trefethen & Bau exercises 5.3, 6.1, 7.3, 8.1, 8.3, 10.1, 11.1 (two homework problems, 1 and 2, both pull from Exercise 5.3). Due date not verified — [[CSCI 5304 Board]] records the printed Wed 10/7 date as stale (HW #2 wasn't even assigned yet as of 10/1); confirm the real date before treating this as due-soon.
## Requirements
- [ ] **1. (Ex. 5.3) SVD of $A=\begin{bmatrix}-2&11\\-10&5\end{bmatrix}$**
  - [ ] (a, 3 pts) Real SVD $A=U\Sigma V^T$ by hand, minimal minus signs in $U,V$.
  - [ ] (b, 3 pts) List singular values, left singular vectors, right singular vectors.
  - [ ] (c, 4 pts) Labeled picture: unit ball in $\mathbb{R}^2$, its image under $A$, the singular vectors, vertex coordinates marked.
- [ ] **2. (Ex. 5.3 cont'd) Same $A$**
  - [ ] (a, 2 pts) 1-, 2-, $\infty$-, Frobenius norms of $A$.
  - [ ] (b, 2 pts) $A^{-1}$ via the SVD (not directly).
  - [ ] (c, 2 pts) Eigenvalues $\lambda_1,\lambda_2$ of $A$.
  - [ ] (d, 2 pts) Verify $\det(A)=\lambda_1\lambda_2$ and $|\det(A)|=\sigma_1\sigma_2$.
  - [ ] (e, 2 pts) Area of the ellipsoid $A$ maps the unit ball of $\mathbb{R}^2$ onto.
- [ ] **3. (Ex. 6.1) $P$ orthogonal projector $\Rightarrow I-2P$ unitary**
  - [ ] (a, 2 pts) Algebraic proof from the definitions.
  - [ ] (b, 4 pts) 2D picture: $\mathcal{R}(P)$ as a line, $\vec x$ arbitrary (cf. Fig. 6.2, p. 43).
  - [ ] (c, 4 pts) Geometric interpretation of $(I-2P)\vec x$.
- [ ] **4. (Ex. 7.3) Hadamard's inequality $|\det(A)|\le\prod_j\|\vec a_j\|_2$**
  - [ ] (a, 4 pts) Algebraic proof via QR factorization / Gram-Schmidt.
  - [ ] (b, 2 pts) Show equality when $A$ is unitary (orthonormal columns).
  - [ ] (c, 4 pts) Geometric interpretation (determinant = parallelepiped volume); draw both cases.
- [ ] **5. (Ex. 8.1) Flop count for $A=\hat Q\hat R$ by Algorithm 8.1**
  - [ ] (a, 10 pts) Exact counts of additions, subtractions, multiplications, divisions, for $m\times n$ $A$.
- [ ] **6. (Ex. 8.3) $R_i$ (p. 61) as diagonal $\times$ unit-upper-triangular**
  - [ ] (a, 2 pts) First diagonal matrix for $i=1$: $AR_1=[q_1\mid a_2\mid\cdots\mid a_n]$.
  - [ ] (b, 3 pts) The two matrices used on iteration $i=2$.
  - [ ] (c, 5 pts) General-step explanation + which lines of Algorithm 8.1 each factor corresponds to.
- [ ] **7. (Ex. 10.1) Householder reflector $H=I-2\vec v\vec v^T$**
  - [ ] (a, 2 pts) Eigenvalues of $H$, algebraically.
  - [ ] (b, 2 pts) $\det(H)$.
  - [ ] (c, 2 pts) Singular values of $H$.
  - [ ] (d, 4 pts) Geometric argument for both.
- [ ] **8. (Ex. 11.1) $A=\begin{bmatrix}A_1\\A_2\end{bmatrix}$, $A_1$ nonsingular $n\times n$, $A_2$ arbitrary $(m-n)\times n$**
  - [ ] (a, 2 pts) $\|A^+\|_2$ in terms of singular values of $A$.
  - [ ] (b, 4 pts) Prove $\|A\|_2\le\|A_1\|_2+\|A_2\|_2$ algebraically.
  - [ ] (c, 4 pts) Prove $\|A^+\|_2\le\|A_1^{-1}\|_2$.
- [ ] Name/section line filled in before submission.
- [ ] Submit via Gradescope through the Canvas assignment (per [[CSCI 5304 Board]] grading section) once the real due date is confirmed.
## Work log
### 2026-10-18 — full written solve
Worked all 8 problems directly from the SVD/norms/projector/QR/Householder/pseudoinverse mechanisms in [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 4|Lecture 4]], [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 5|Lecture 5]], [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 2 & 3|Lecture 2 & 3]], [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 6|Lecture 6]], [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 7|Lecture 7]], [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 8|Lecture 8]], and the MinerU textbook extraction (Algorithm 8.1 pseudocode, p. 58-62). Householder (Ex. 10.1, Lecture 10) and the pseudoinverse (Ex. 11.1, Lecture 11) aren't lectured yet in this vault, so those two are solved straight from the definitions given in the problem statements. Every numeric result below is cross-checked: the SVD is verified by recomputing $U\Sigma V^T$ and matching $A$ exactly; $\det(A)=\lambda_1\lambda_2=\sigma_1\sigma_2$ (up to sign) is checked three independent ways (direct $2\times2$ determinant, Vieta's formula, $\sigma_1\sigma_2$); the flop count is checked against Theorem 8.1's leading-order $\sim2mn^2$. Each box below is written short enough to hand-copy into the printed PDF's answer boxes.

### 1. SVD of $A$
**(a)** $A^TA=\begin{bmatrix}104&-72\\-72&146\end{bmatrix}$, trace $250$, det $10000$ $\Rightarrow\lambda=200,50\Rightarrow\sigma_1=10\sqrt2,\ \sigma_2=5\sqrt2$.
Eigenvectors of $A^TA$: $v_1=(-\tfrac35,\tfrac45)^T$ (for $200$), $v_2=(\tfrac45,\tfrac35)^T$ (for $50$) — orthonormal, only 1 minus sign between them.
$u_i=Av_i/\sigma_i$: $Av_1=(10,10)^T\Rightarrow u_1=(\tfrac1{\sqrt2},\tfrac1{\sqrt2})^T$; $Av_2=(5,-5)^T\Rightarrow u_2=(\tfrac1{\sqrt2},-\tfrac1{\sqrt2})^T$.
$$A=\underbrace{\begin{bmatrix}\tfrac{1}{\sqrt2}&\tfrac1{\sqrt2}\\\tfrac1{\sqrt2}&-\tfrac1{\sqrt2}\end{bmatrix}}_{U}\underbrace{\begin{bmatrix}10\sqrt2&0\\0&5\sqrt2\end{bmatrix}}_{\Sigma}\underbrace{\begin{bmatrix}-\tfrac35&\tfrac45\\\tfrac45&\tfrac35\end{bmatrix}}_{V^T}$$
(Check: $U\Sigma=\begin{bmatrix}10&5\\10&-5\end{bmatrix}$, times $V^T$ gives back $\begin{bmatrix}-2&11\\-10&5\end{bmatrix}=A$ exactly. Flipping either pair's sign only adds minus signs, so this is minimal.)

**(b)** $\sigma_1=10\sqrt2\approx14.14,\ \sigma_2=5\sqrt2\approx7.07$.
Left: $u_1=\tfrac1{\sqrt2}(1,1)^T,\ u_2=\tfrac1{\sqrt2}(1,-1)^T$. Right: $v_1=\tfrac15(-3,4)^T,\ v_2=\tfrac15(4,3)^T$.

**(c)** Unit circle, mark $v_1=(-0.6,0.8)$, $v_2=(0.8,0.6)$ on it (orthogonal radii). Image is an ellipse; its semi-axis endpoints are $\sigma_1u_1=(10,10)$ and $\sigma_2u_2=(5,-5)$ (and their negatives). Draw: circle with $v_1,v_2$ marked $\to$ arrow $\to$ ellipse through $(10,10),(-10,-10)$ (major axis, length $10\sqrt2$ each way) and $(5,-5),(-5,5)$ (minor axis, length $5\sqrt2$ each way), major axis along $u_1=(1,1)/\sqrt2$ direction, minor along $u_2=(1,-1)/\sqrt2$.

### 2. Norms, $A^{-1}$, eigenvalues, determinant identity, area
**(a)** Columns sums $|{-2}|+|{-10}|=12$, $|11|+|5|=16\Rightarrow\|A\|_1=16$. Row sums $13,15\Rightarrow\|A\|_\infty=15$. $\|A\|_2=\sigma_1=10\sqrt2$. $\|A\|_F=\sqrt{4+121+100+25}=\sqrt{250}=5\sqrt{10}$ (matches $\sqrt{\sigma_1^2+\sigma_2^2}=\sqrt{250}$).

**(b)** $A^{-1}=V\Sigma^{-1}U^T$. $\Sigma^{-1}=\mathrm{diag}(\tfrac1{10\sqrt2},\tfrac1{5\sqrt2})$.
$$A^{-1}=\frac1{100}\begin{bmatrix}5&-11\\10&-2\end{bmatrix}=\begin{bmatrix}0.05&-0.11\\0.10&-0.02\end{bmatrix}$$
(carried out: $V\Sigma^{-1}=\tfrac1{50\sqrt2}\begin{bmatrix}-3&8\\4&6\end{bmatrix}$, times $U^T=\tfrac1{\sqrt2}\begin{bmatrix}1&1\\1&-1\end{bmatrix}$ gives $\tfrac1{100}\begin{bmatrix}5&-11\\10&-2\end{bmatrix}$ — matches direct inverse $\tfrac1{\det A}\begin{bmatrix}d&-b\\-c&a\end{bmatrix}$.)

**(c)** trace $=3$, $\det=100$: $\lambda^2-3\lambda+100=0\Rightarrow\lambda_{1,2}=\dfrac{3\pm i\sqrt{391}}2$ (complex, $A$ not symmetric).

**(d)** $\lambda_1\lambda_2=\dfrac{9+391}4=100=\det(A)$ ✓. $\sigma_1\sigma_2=(10\sqrt2)(5\sqrt2)=100=|\det(A)|$ ✓.

**(e)** Area scales by $|\det A|=\sigma_1\sigma_2$; unit disk area $\pi$ $\Rightarrow$ image area $=\pi\sigma_1\sigma_2=100\pi$.

### 3. $I-2P$ is unitary
**(a)** $P$ orthogonal projector $\Rightarrow P^*=P,\ P^2=P$.
$$(I-2P)^*(I-2P)=(I-2P)(I-2P)=I-4P+4P^2=I-4P+4P=I.$$
So $(I-2P)^*(I-2P)=I$ — unitary. $\blacksquare$

**(b)/(c)** Draw a line through the origin for $\mathcal R(P)$. Arbitrary $\vec x$ off the line; drop $P\vec x$ = orthogonal projection of $\vec x$ onto the line; $(I-P)\vec x=\vec x-P\vec x$ = perpendicular component.
$(I-2P)\vec x=\vec x-2P\vec x=(I-P)\vec x-P\vec x$: the component **along** $\mathcal R(P)$ flips sign, the component **$\perp\mathcal R(P)$** is unchanged. Mark both $P\vec x$ and $-P\vec x$ on the picture, and $(I-2P)\vec x$ as the vector sum of $-P\vec x$ and $(I-P)\vec x$.
*Geometric interpretation:* $I-2P$ is the reflection of $\vec x$ across the line (hyperplane) **orthogonal to** $\mathcal R(P)$ — a mirror image through $\mathcal R(P)^\perp$.

### 4. Hadamard's inequality
**(a)** Full QR: $A=QR$, $Q$ unitary, $R$ upper triangular. Column $j$: $a_j=\sum_{i\le j}r_{ij}q_i$, and since the $q_i$ are orthonormal,
$$\|a_j\|_2^2=\sum_{i\le j}|r_{ij}|^2\ge|r_{jj}|^2\ \Rightarrow\ |r_{jj}|\le\|a_j\|_2.$$
$\det A=\det Q\det R$, $|\det Q|=1$ (unitary), $\det R=\prod_j r_{jj}$. So
$$|\det A|=\prod_j|r_{jj}|\le\prod_j\|a_j\|_2.\ \blacksquare$$

**(b)** $A$ unitary $\Rightarrow$ columns already orthonormal $\Rightarrow$ Gram-Schmidt needs no correction: $r_{ij}=0\ (i<j)$, $q_j=a_j$, $r_{jj}=\|a_j\|_2=1$. Then $|\det A|=\prod r_{jj}=\prod\|a_j\|_2=1$ — the bound in (a) is tight, equality holds.

**(c)** $|\det A|$ = volume of the parallelepiped spanned by the columns $a_j$. $\prod\|a_j\|_2$ = volume of the **rectangular box** with the same edge lengths but mutually orthogonal edges. A slanted (non-orthogonal) parallelepiped always encloses *less* volume than that box — draw a 2D parallelogram vs. a rectangle with the same two side lengths, area $=\|a_1\|\|a_2\|\sin\theta\le\|a_1\|\|a_2\|$. Equality (part b) is exactly the case $\theta=90°$: orthogonal columns, no "squashing," parallelepiped = box.

### 5. Flop count for Algorithm 8.1 ($A=\hat Q\hat R$, $m\times n$)
Per outer step $i$ ($i=1,\dots,n$): $r_{ii}=\|v_i\|$ costs $m$ mult $+(m-1)$ add $+1$ sqrt; $q_i=v_i/r_{ii}$ costs $m$ div.
Inner loop runs $(n-i)$ times; each $j$: $r_{ij}=q_i^*v_j$ costs $m$ mult $+(m-1)$ add; $v_j=v_j-r_{ij}q_i$ costs $m$ mult $+m$ sub.
$\sum_{i=1}^n(n-i)=\dfrac{n(n-1)}2$ total inner iterations.
**Multiplications:** $\underbrace{2m\cdot\tfrac{n(n-1)}2}_{\text{inner}}+\underbrace{2mn}_{\text{outer }(r_{ii}+\text{div})}=mn(n-1)+2mn=mn(n+1)$.
**Additions:** $\underbrace{(m-1)\tfrac{n(n-1)}2}_{\text{inner }r_{ij}}+\underbrace{n(m-1)}_{\text{outer }r_{ii}}=\dfrac{(m-1)n(n+1)}2$.
**Subtractions:** $m\cdot\dfrac{n(n-1)}2=\dfrac{mn(n-1)}2$ (only from $v_j=v_j-r_{ij}q_i$).
**Divisions:** $mn$ (only from $q_i=v_i/r_{ii}$, $m$ per $i$, $n$ values of $i$).
(Square roots: $n$, one per $i$ — not asked for but falls out of the same count.)
*Check:* leading terms $mn^2+\tfrac{mn^2}2+\tfrac{mn^2}2=2mn^2$, matching Theorem 8.1's $\sim2mn^2$ asymptotic flop count.

### 6. $R_i$ as diagonal $\times$ unit upper triangular
Each $R_i=D_iN_i$: $D_i$ scales column $i$ by $1/r_{ii}$ (line `q_i = v_i / r_ii`); $N_i$ is unit-upper-triangular, row $i$ entries $-r_{ij}$ for $j>i$, subtracting $r_{ij}q_i$ from column $j$ (lines `r_ij = q_i^* v_j` and `v_j = v_j - r_ij q_i`). $AD_i$ must happen before $N_i$ since the shear uses the already-normalized $q_i$.
**(a)** $i=1$: $D_1=\mathrm{diag}(1/r_{11},1,\dots,1)$. $AD_1=[a_1/r_{11}\mid a_2\mid\cdots\mid a_n]=[q_1\mid a_2\mid\cdots\mid a_n]$.
**(b)** $i=2$: $D_2=\mathrm{diag}(1,1/r_{22},1,\dots,1)$, scales column 2 ($v_2^{(2)}$) to $q_2$. $N_2=I$ except row 2: entries $-r_{2j}$ for $j>2$, subtracts $r_{2j}q_2$ from later columns. ($D_2N_2$ reproduces the text's combined $R_2=\begin{bmatrix}1&&\\&1/r_{22}&-r_{23}/r_{22}&\cdots\\&&1&\end{bmatrix}$.)
**(c)** General $i$: $D_i=I$ with $(i,i)$ entry $1/r_{ii}$ — the normalization line `q_i = v_i / r_ii`. $N_i=I$ with row-$i$ entries $(i,j)=-r_{ij}$, $j>i$ — the orthogonalization lines `r_ij = q_i^* v_j` (computes the shear coefficient) and `v_j = v_j - r_ij q_i` (applies it). $R_i=D_iN_i$: scale, then shear.

### 7. Householder reflector $H=I-2\vec v\vec v^T$, $\|\vec v\|_2=1$
**(a)** $Hv=v-2v(v^Tv)=v-2v=-v$ ($v^Tv=1$) $\Rightarrow\lambda=-1$ (eigenvector $v$). For $w\perp v$: $Hw=w-2v(v^Tw)=w\Rightarrow\lambda=+1$, multiplicity $m-1$.
Eigenvalues: $-1$ (×1), $+1$ (×$(m-1)$).

**(b)** $\det H=\prod\lambda_i=(-1)(1)^{m-1}=-1$.

**(c)** $H^TH=H^2=I-4vv^T+4v(v^Tv)v^T=I$ $\Rightarrow H$ unitary $\Rightarrow$ all $m$ singular values $=1$.

**(d)** $H$ is the reflection across the hyperplane $\perp v$: the component along $v$ flips (why $\lambda=-1$ there), the $(m-1)$-dim hyperplane $\perp v$ is fixed pointwise (why $\lambda=+1$ there). A reflection is an isometry — it preserves every vector's length, stretching nothing — so every singular value is exactly $1$.

### 8. Block matrix $A=\begin{bmatrix}A_1\\A_2\end{bmatrix}$
**(a)** $A$ has full column rank $n$ (since $A_1$ nonsingular forces rank $n$), so $A^+=(A^*A)^{-1}A^*$ has singular values $1/\sigma_i$ for each nonzero $\sigma_i(A)$. The 2-norm is the largest singular value, so
$$\|A^+\|_2=\frac1{\sigma_{\min}(A)}=\frac1{\sigma_n(A)}.$$

**(b)** For any $x$: $\|Ax\|_2^2=\|A_1x\|_2^2+\|A_2x\|_2^2\Rightarrow\|Ax\|_2=\sqrt{\|A_1x\|_2^2+\|A_2x\|_2^2}\le\|A_1x\|_2+\|A_2x\|_2$ (since $\sqrt{a^2+b^2}\le a+b$) $\le(\|A_1\|_2+\|A_2\|_2)\|x\|_2$. Taking $\sup_{\|x\|_2=1}$: $\|A\|_2\le\|A_1\|_2+\|A_2\|_2$. $\blacksquare$

**(c)** Let $L=[\,A_1^{-1}\ \ 0\,]$ ($n\times m$): $LA=A_1^{-1}A_1=I_n$, a left inverse, $\|L\|_2=\|A_1^{-1}\|_2$.
Any left inverse is $L=A^++N$ with $NA=0$ (rows of $N\perp\mathrm{range}(A)$), while rows of $A^+=(A^*A)^{-1}A^*$ lie *in* $\mathrm{range}(A)$ — so $A^+N^T=0$ and
$$LL^T=A^+(A^+)^T+NN^T\succeq A^+(A^+)^T,$$
PSD order, so $\|L\|_2\ge\|A^+\|_2$ for every left inverse. In particular
$$\|A^+\|_2\le\|L\|_2=\|A_1^{-1}\|_2.\ \blacksquare$$
## Concepts used
- **SVD** ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 4|Lecture 4]], [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 5|Lecture 5]]) — computed by hand via $A^TA$'s eigendecomposition for problem 1; used for $A^{-1}$, the 2-norm, and the ellipsoid-area identity in problem 2.
- **Matrix norms** ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 2 & 3|Lecture 2 & 3]]) — max-column-sum ($\|{\cdot}\|_1$) and max-row-sum ($\|{\cdot}\|_\infty$) formulas, Frobenius norm via entrywise sum, used directly in problem 2a.
- **Orthogonal projectors** ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 6|Lecture 6]]) — $P^*=P,\,P^2=P$ used algebraically in problem 3; the decomposition-into-parallel-and-perpendicular-component picture drives the geometric interpretation in 3(b)/(c).
- **QR factorization / Gram-Schmidt** ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 7|Lecture 7]], [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 8|Lecture 8]]) — full QR used for Hadamard's inequality (problem 4); Algorithm 8.1's exact pseudocode (modified Gram-Schmidt) drives the flop count (problem 5) and the $R_i=D_iN_i$ factorization (problem 6).
- **Householder reflectors** (problem statement only — Lecture 10 not yet taught/transcribed in this vault) — eigenvalue/determinant/singular-value facts for $H=I-2vv^T$ derived directly from the definition in problem 7.
- **Pseudoinverse / least squares** (problem statement only — Lecture 11 not yet written) — $A^+=(A^*A)^{-1}A^*$ and its minimum-2-norm-left-inverse property used in problem 8.
## Post-submit reflection
<!-- Optional until feedback: the first failure, the pattern, and what to change. -->
