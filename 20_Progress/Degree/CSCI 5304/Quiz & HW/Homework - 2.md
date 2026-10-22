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
next: "Hand-copy the solutions and the diagrams for 1c, 3b, 3c, 4c below into the boxes of the printed Homework - 2 PDF; confirm the real due date on Canvas/Gradescope before submitting — [[CSCI 5304 Board]] flags HW #2's date as unverified"
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
Worked all 8 problems directly from the SVD/norms/projector/QR/Householder/pseudoinverse mechanisms in [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 4|Lecture 4]], [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 5|Lecture 5]], [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 2 & 3|Lecture 2 & 3]], [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 6|Lecture 6]], [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 7|Lecture 7]], [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 8|Lecture 8]], and the MinerU textbook extraction (Algorithm 8.1 pseudocode, p. 58-62). Householder (Ex. 10.1) and the pseudoinverse (Ex. 11.1) were solved directly from the problem statements' own definitions at the time of this 2026-10-18 solve, since [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 10|Lecture 10]] and [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 11|Lecture 11]] had not yet landed as notes - both are now landed (2026-10-22) and cited directly below.

> [!NOTE] Cross-check found 2026-10-21 for problem 8(c)
> A live exam-review session (10/20) had the professor re-derive this same inequality ($\|A^+\|_2\le\|A_1^{-1}\|_2$) on the board via a different, more geometric induction-style argument about singular values only increasing as rows are appended - self-corrected once mid-derivation and ultimately left unfinished ("not on the exam"). See [[20_Progress/Degree/CSCI 5304/Weekly/Week - 7|Week - 7]]'s Examples section for the full account. The proof below (via an explicit left inverse $L$) stands as written; the live attempt is noted here as a different valid angle, not a replacement. Every numeric result below is cross-checked: the SVD is verified by recomputing $U\Sigma V^T$ and matching $A$ exactly; $\det(A)=\lambda_1\lambda_2=\sigma_1\sigma_2$ (up to sign) is checked three independent ways (direct $2\times2$ determinant, Vieta's formula, $\sigma_1\sigma_2$); the flop count is checked against Theorem 8.1's leading-order $\sim2mn^2$. Each box below is written short enough to hand-copy into the printed PDF's answer boxes.

### 1. SVD of $A$
**(a)** $A^TA=\begin{bmatrix}104&-72\\-72&146\end{bmatrix}$, trace $250$, det $10000$ $\Rightarrow\lambda=200,50\Rightarrow\sigma_1=10\sqrt2,\ \sigma_2=5\sqrt2$.
Eigenvectors of $A^TA$: $v_1=(-\tfrac35,\tfrac45)^T$ (for $200$), $v_2=(\tfrac45,\tfrac35)^T$ (for $50$) — orthonormal, only 1 minus sign between them.
$u_i=Av_i/\sigma_i$: $Av_1=(10,10)^T\Rightarrow u_1=(\tfrac1{\sqrt2},\tfrac1{\sqrt2})^T$; $Av_2=(5,-5)^T\Rightarrow u_2=(\tfrac1{\sqrt2},-\tfrac1{\sqrt2})^T$.
$$A=\underbrace{\begin{bmatrix}\tfrac{1}{\sqrt2}&\tfrac1{\sqrt2}\\\tfrac1{\sqrt2}&-\tfrac1{\sqrt2}\end{bmatrix}}_{U}\underbrace{\begin{bmatrix}10\sqrt2&0\\0&5\sqrt2\end{bmatrix}}_{\Sigma}\underbrace{\begin{bmatrix}-\tfrac35&\tfrac45\\\tfrac45&\tfrac35\end{bmatrix}}_{V^T}$$
(Check: $U\Sigma=\begin{bmatrix}10&5\\10&-5\end{bmatrix}$, times $V^T$ gives back $\begin{bmatrix}-2&11\\-10&5\end{bmatrix}=A$ exactly. Flipping either pair's sign only adds minus signs, so this is minimal.)

**(b)** $\sigma_1=10\sqrt2\approx14.14,\ \sigma_2=5\sqrt2\approx7.07$.
Left: $u_1=\tfrac1{\sqrt2}(1,1)^T,\ u_2=\tfrac1{\sqrt2}(1,-1)^T$. Right: $v_1=\tfrac15(-3,4)^T,\ v_2=\tfrac15(4,3)^T$.

**(c)** Two side-by-side panels, connected by an arrow for "apply $A$."
![[Homework 2 - 1c - SVD unit ball to image ellipse.excalidraw]]

**Panel 1 — the unit ball (domain), left side of the box:**
1. Draw $x$- and $y$-axes, and a circle of radius $1$ centered at the origin.
2. Mark the point $v_1=(-0.6,\,0.8)$ on the circle. This sits at angle $126.87°$ from the positive $x$-axis (in the second quadrant, closer to the $y$-axis than the $x$-axis). Draw the radius arrow from the origin to this point and label it $\vec v_1$.
3. Mark the point $v_2=(0.8,\,0.6)$ on the circle, angle $36.87°$ (first quadrant, closer to the $x$-axis). Draw the radius arrow and label it $\vec v_2$.
4. Check your drawing: the angle between $\vec v_1$ and $\vec v_2$ must look like exactly $90°$ ($126.87°-36.87°=90°$) — they are perpendicular radii of the circle.

**Panel 2 — the image ellipse (codomain), right side of the box, bigger scale (axes from about $-15$ to $15$):**
1. Draw $x$- and $y$-axes at this larger scale.
2. Lightly draw two dashed guide lines through the origin: one along $y=x$ (the $45°$ diagonal) and one along $y=-x$ (the $-45°$ diagonal). These are the ellipse's major and minor axes.
3. On the $y=x$ line, mark the points $(10,10)$ and $(-10,-10)$ — these are the ends of the **major axis**, at distance $\sigma_1=10\sqrt2\approx14.14$ from the origin each way.
4. On the $y=-x$ line, mark the points $(5,-5)$ and $(-5,5)$ — the ends of the **minor axis**, at distance $\sigma_2=5\sqrt2\approx7.07$ from the origin each way.
5. Draw a smooth ellipse through all four marked points, tangent to the picture so that $(10,10)/(-10,-10)$ are its far (long) tips and $(5,-5)/(-5,5)$ are its near (short) tips.
6. Draw the arrow from the origin to $(10,10)$ and label it $\sigma_1\vec u_1$; draw the arrow to $(5,-5)$ and label it $\sigma_2\vec u_2$.

**Connecting the two panels:** draw a curved arrow from $\vec v_1$ (panel 1) to the $(10,10)$ tip (panel 2) labeled "$A\vec v_1=\sigma_1\vec u_1$," and a second arrow from $\vec v_2$ to $(5,-5)$ labeled "$A\vec v_2=\sigma_2\vec u_2$" — this is the one fact the whole picture is illustrating: $A$ takes the orthogonal unit vectors $\vec v_1,\vec v_2$ to the orthogonal ellipse-axis vectors $\sigma_1\vec u_1,\sigma_2\vec u_2$.

### 2. Norms, $A^{-1}$, eigenvalues, determinant identity, area
**(a)** Columns sums $|{-2}|+|{-10}|=12$, $|11|+|5|=16\Rightarrow\|A\|_1=16$. Row sums $13,15\Rightarrow\|A\|_\infty=15$. $\|A\|_2=\sigma_1=10\sqrt2$. $\|A\|_F=\sqrt{4+121+100+25}=\sqrt{250}=5\sqrt{10}$ (matches $\sqrt{\sigma_1^2+\sigma_2^2}=\sqrt{250}$).

**(b)** Formula: $A^{-1}=V\Sigma^{-1}U^T$, with $\Sigma^{-1}=\mathrm{diag}\!\left(\tfrac1{10\sqrt2},\tfrac1{5\sqrt2}\right)$.

Step 1 — $V\Sigma^{-1}$ (scale each column of $V$ by the matching entry of $\Sigma^{-1}$):
$$V\Sigma^{-1}=\begin{bmatrix}-\tfrac35&\tfrac45\\[2pt]\tfrac45&\tfrac35\end{bmatrix}\begin{bmatrix}\tfrac1{10\sqrt2}&0\\[2pt]0&\tfrac1{5\sqrt2}\end{bmatrix}=\frac1{50\sqrt2}\begin{bmatrix}-3&8\\4&6\end{bmatrix}$$

Step 2 — multiply by $U^T=\dfrac1{\sqrt2}\begin{bmatrix}1&1\\1&-1\end{bmatrix}$:
$$A^{-1}=\frac1{50\sqrt2}\begin{bmatrix}-3&8\\4&6\end{bmatrix}\cdot\frac1{\sqrt2}\begin{bmatrix}1&1\\1&-1\end{bmatrix}=\frac1{100}\begin{bmatrix}-3+8&-3-8\\4+6&4-6\end{bmatrix}=\frac1{100}\begin{bmatrix}5&-11\\10&-2\end{bmatrix}$$

$$\boxed{A^{-1}=\begin{bmatrix}0.05&-0.11\\0.10&-0.02\end{bmatrix}}$$

*Check against the direct formula* $A^{-1}=\dfrac1{\det A}\begin{bmatrix}d&-b\\-c&a\end{bmatrix}=\dfrac1{100}\begin{bmatrix}5&-11\\10&-2\end{bmatrix}$ — matches exactly.

**(c)** trace $=3$, $\det=100$: $\lambda^2-3\lambda+100=0\Rightarrow\lambda_{1,2}=\dfrac{3\pm i\sqrt{391}}2$ (complex, $A$ not symmetric).

**(d)** $\lambda_1\lambda_2=\dfrac{9+391}4=100=\det(A)$ ✓. $\sigma_1\sigma_2=(10\sqrt2)(5\sqrt2)=100=|\det(A)|$ ✓.

**(e)** Area scales by $|\det A|=\sigma_1\sigma_2$; unit disk area $\pi$ $\Rightarrow$ image area $=\pi\sigma_1\sigma_2=100\pi$.

### 3. $I-2P$ is unitary
**(a)** $P$ orthogonal projector $\Rightarrow P^*=P,\ P^2=P$.
$$(I-2P)^*(I-2P)=(I-2P)(I-2P)=I-4P+4P^2=I-4P+4P=I.$$
So $(I-2P)^*(I-2P)=I$ — unitary. $\blacksquare$

**(b)/(c)** One picture does both parts — build it in layers. A concrete worked example is given alongside the generic steps so you can plot it precisely on graph paper; the construction is the same for any line/vector choice.
![[Homework 2 - 3b - projection of x onto R(P).excalidraw]]
![[Homework 2 - 3c - I minus 2P reflects x across R(P) perp.excalidraw]]

*Concrete numbers to plot:* line $\mathcal R(P)$ at $30°$ above horizontal; $\vec x=(0,2)$ (straight up, length $2$). Then $P\vec x=\left(\tfrac{\sqrt3}2,\tfrac12\right)\approx(0.87,0.5)$, $(I-P)\vec x=\left(-\tfrac{\sqrt3}2,\tfrac32\right)\approx(-0.87,1.5)$, and $(I-2P)\vec x=(-\sqrt3,1)\approx(-1.73,1)$.

**Layer 1 — the two lines:**
1. Draw $x,y$-axes lightly for reference.
2. Draw a **solid** line through the origin at $30°$ above horizontal, extending both directions. Label it $\mathcal R(P)$.
3. Draw a **dashed** line through the origin, perpendicular to the first (at $120°$, i.e. $30°+90°$). Label it $\mathcal R(P)^\perp$ — this dashed line is the mirror axis part (c) needs, so get it in now even though part (b) alone doesn't ask for it.

**Layer 2 — $\vec x$ and its projection (part b):**
4. Draw the arrow from the origin straight up to $(0,2)$, length $2$. Label it $\vec x$.
5. From the tip of $\vec x$, drop a perpendicular down onto the solid $\mathcal R(P)$ line; the foot lands at $\approx(0.87,0.5)$. Draw the arrow from the origin to that foot and label it $P\vec x$ — this is $\vec x$'s orthogonal projection onto $\mathcal R(P)$.
6. Draw the short connecting segment from the tip of $P\vec x$ up to the tip of $\vec x$ (from $(0.87,0.5)$ to $(0,2)$); mark the right angle where it meets the solid line. Label this segment $(I-P)\vec x$ — it is parallel to the dashed line, i.e. perpendicular to $\mathcal R(P)$.
7. You now have a right triangle: origin $\to P\vec x \to \vec x \to$ back to origin, right angle at $P\vec x$, hypotenuse $\vec x$, legs $P\vec x$ (along the solid line) and $(I-P)\vec x$ (along the dashed direction). **This triangle is the complete answer to part (b).**

**Layer 3 — building $(I-2P)\vec x$ (part c):**
8. Mark the point $-P\vec x\approx(-0.87,-0.5)$: the mirror image of $P\vec x$ straight through the origin, same distance on the opposite side of the solid line. Draw a short dashed arrow from the origin to it.
9. From $-P\vec x$, draw a segment parallel to, and the same length as, the $(I-P)\vec x$ segment from Layer 2 (i.e. shift that segment so it starts at $-P\vec x$ instead of $P\vec x$). Its far end lands at $(-\sqrt3,1)\approx(-1.73,1)$.
10. Draw the arrow from the origin to $(-1.73,1)$ and label it $(I-2P)\vec x$.
11. **Check your drawing:** $(I-2P)\vec x$ should be the exact mirror image of $\vec x$ reflected across the **dashed** line $\mathcal R(P)^\perp$ — fold the page along the dashed line and $\vec x$'s arrow should land exactly on $(I-2P)\vec x$'s arrow. Both have the same length ($2$), confirming nothing is stretched, only reflected.

*Geometric interpretation (what to write for part c):* $I-2P$ reflects $\vec x$ across the line **orthogonal to $\mathcal R(P)$** (the dashed line) — equivalently, the component of $\vec x$ **along** $\mathcal R(P)$ (i.e. $P\vec x$) gets flipped in sign, while the component **perpendicular to** $\mathcal R(P)$ (i.e. $(I-P)\vec x$) is left unchanged. Note carefully: the mirror is $\mathcal R(P)^\perp$, *not* $\mathcal R(P)$ itself.

### 4. Hadamard's inequality
**(a)** Full QR: $A=QR$, $Q$ unitary, $R$ upper triangular. Column $j$: $a_j=\sum_{i\le j}r_{ij}q_i$, and since the $q_i$ are orthonormal,
$$\|a_j\|_2^2=\sum_{i\le j}|r_{ij}|^2\ge|r_{jj}|^2\ \Rightarrow\ |r_{jj}|\le\|a_j\|_2.$$
$\det A=\det Q\det R$, $|\det Q|=1$ (unitary), $\det R=\prod_j r_{jj}$. So
$$|\det A|=\prod_j|r_{jj}|\le\prod_j\|a_j\|_2.\ \blacksquare$$

**(b)** $A$ unitary $\Rightarrow$ columns already orthonormal $\Rightarrow$ Gram-Schmidt needs no correction: $r_{ij}=0\ (i<j)$, $q_j=a_j$, $r_{jj}=\|a_j\|_2=1$. Then $|\det A|=\prod r_{jj}=\prod\|a_j\|_2=1$ — the bound in (a) is tight, equality holds.

**(c)** Two side-by-side panels (2D, since that's the easy case to actually draw — note underneath that the same idea extends to a 3D parallelepiped vs. a box).
![[Homework 2 - 4c - parallelepiped vs box Hadamard.excalidraw]]

**Panel 1 — general $A$, the inequality is strict ($\theta\ne90°$):**
1. Draw $x,y$-axes. Draw $\vec a_1=(3,0)$ — an arrow along the $x$-axis, length $3$.
2. Draw $\vec a_2$ at $60°$ above $\vec a_1$, length $2$: that's the point $(1,\,1.73)$ since $2\cos60°=1,\ 2\sin60°=1.73$.
3. Complete the parallelogram: from the tip of $\vec a_1$ at $(3,0)$, draw a segment parallel to $\vec a_2$ reaching $(4,\,1.73)$; from the tip of $\vec a_2$ at $(1,1.73)$, draw a segment parallel to $\vec a_1$ to the same point $(4,1.73)$. Shade this slanted parallelogram — its area is $|\det A|=\|\vec a_1\|\|\vec a_2\|\sin60°=3\times2\times0.866\approx5.2$.
4. Now draw a **dashed rectangle** with the same two side lengths ($3$ and $2$) but with $\vec a_2$ rotated up to a true $90°$ — corners at $(0,0),(3,0),(3,2),(0,2)$. Its area is $\|\vec a_1\|\|\vec a_2\|=3\times2=6$.
5. Label the shaded parallelogram "$|\det A|\approx5.2$" and the dashed rectangle "$\prod\|\vec a_j\|_2=6$" — visually, the slanted shape sits *inside* what the rectangle's area would be: the same two side lengths enclose less area once you lean them together at an angle other than $90°$.

**Panel 2 — $A$ unitary (orthonormal columns), equality:**
1. Draw $x,y$-axes. Draw $\vec a_1=(3,0)$ and $\vec a_2=(0,2)$ — a true right angle between them (columns orthogonal).
2. Complete the shape: it is already a plain rectangle, corners $(0,0),(3,0),(3,2),(0,2)$ — the "parallelogram" and the "box" are literally the same shape here.
3. Label it "$|\det A|=\|\vec a_1\|\|\vec a_2\|=6$ — equality" — there is no slant left to lose area to.

*What the two panels show together:* $|\det A|$ is always the actual enclosed area (2D) / volume (3D, extend the same picture to three mutually-skewed edges vs. a rectangular box) of the shape the columns span; $\prod\|\vec a_j\|_2$ is the area/volume of the "unfolded" box with the same edge lengths but everything forced perpendicular. Leaning the edges together (any angle $\ne90°$) can only shrink the enclosed area/volume relative to that box, never grow it — hence $\le$, with equality exactly when there's no leaning left to do, i.e. the columns are already orthogonal.

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
**Setup.** Every $R_i$ splits as $R_i=D_iN_i$: $D_i$ is a diagonal matrix that does the *normalizing* division (`q_i = v_i / r_ii`), applied first; $N_i$ is a unit-upper-triangular matrix (1's on the diagonal) that does the *orthogonalizing* subtraction (`r_ij = q_i^* v_j` then `v_j = v_j - r_ij q_i`), applied second — scale column $i$ to a unit vector, *then* shear it out of the later columns. Below, $n=4$ is used as a concrete, fully-written-out example; the pattern is the same for any $n$.

**(a) $i=1$:**
$$D_1=\begin{bmatrix}\tfrac1{r_{11}}&0&0&0\\0&1&0&0\\0&0&1&0\\0&0&0&1\end{bmatrix}=\mathrm{diag}\!\left(\tfrac1{r_{11}},1,\dots,1\right)$$
$$A\,D_1=[\,a_1/r_{11}\mid a_2\mid a_3\mid a_4\,]=[\,q_1\mid a_2\mid a_3\mid a_4\,]$$
— only column 1 is touched, turned into $q_1$; columns $2,\dots,n$ are untouched (matches the problem statement exactly).

**(b) $i=2$, the two matrices:**
$$D_2=\begin{bmatrix}1&0&0&0\\0&\tfrac1{r_{22}}&0&0\\0&0&1&0\\0&0&0&1\end{bmatrix},\qquad N_2=\begin{bmatrix}1&0&0&0\\0&1&-r_{23}&-r_{24}\\0&0&1&0\\0&0&0&1\end{bmatrix}$$
$D_2$ scales column 2 (currently $v_2^{(2)}$) down to $q_2$; $N_2$ then subtracts $r_{2j}\,q_2$ from columns $j=3,4,\dots$. Multiplying them out reproduces the textbook's combined $R_2$ (p. 61) directly, since $D_2$ is diagonal so it just scales $N_2$'s second row:
$$R_2=D_2N_2=\begin{bmatrix}1&0&0&0\\0&\tfrac1{r_{22}}&-\tfrac{r_{23}}{r_{22}}&-\tfrac{r_{24}}{r_{22}}\\0&0&1&0\\0&0&0&1\end{bmatrix}$$

**(c) General step $i$:**
$$D_i=I\text{ with }(i,i)\text{ entry }\tfrac1{r_{ii}}\qquad\longleftrightarrow\qquad\text{line \texttt{q\_i = v\_i / r\_ii}}$$
$$N_i=I\text{ with row-}i\text{ entries }(i,j)=-r_{ij}\text{ for }j>i\qquad\longleftrightarrow\qquad\text{lines \texttt{r\_ij = q\_i* v\_j} and \texttt{v\_j = v\_j - r\_ij q\_i}}$$
$D_i$ is the division/normalization line; $N_i$ is the inner-loop pair that computes each shear coefficient $r_{ij}$ and applies it. $R_i=D_iN_i$: normalize column $i$, then shear it out of every later column — exactly the two things the $i$-th outer step of Algorithm 8.1 does.

### 7. Householder reflector $H=I-2\vec v\vec v^T$, $\|\vec v\|_2=1$
**(a) Eigenvalues.** Apply $H$ to $v$ itself ($v^Tv=1$):
$$Hv=v-2v(v^Tv)=v-2v=-v\ \Rightarrow\ \lambda=-1,\text{ eigenvector }v.$$
Apply $H$ to any $w$ with $w\perp v$ (so $v^Tw=0$):
$$Hw=w-2v(v^Tw)=w\ \Rightarrow\ \lambda=+1,\text{ for every }w\text{ in the }(m-1)\text{-dim space }v^\perp.$$
$$\boxed{\lambda=-1\ (\text{multiplicity }1),\qquad \lambda=+1\ (\text{multiplicity }m-1)}$$

**(b) Determinant.**
$$\det H=\prod_i\lambda_i=(-1)\cdot(+1)^{m-1}=-1$$

**(c) Singular values.** First check $H$ is unitary:
$$H^2=(I-2vv^T)(I-2vv^T)=I-4vv^T+4v(v^Tv)v^T=I-4vv^T+4vv^T=I.$$
$H^T=H$ (symmetric) and $H^2=I$ $\Rightarrow H^TH=I\Rightarrow H$ is unitary $\Rightarrow$ every singular value is $1$:
$$\sigma_1=\sigma_2=\cdots=\sigma_m=1$$

**(d) Geometric argument.** $H$ reflects $\mathbb R^m$ across the hyperplane orthogonal to $v$:
- the component of a vector **along $v$** gets flipped — exactly why $v$ has eigenvalue $-1$;
- the component **in the hyperplane $v^\perp$** ($\dim=m-1$) is left fixed — eigenvalue $+1$ there;
- a reflection is a rigid motion (isometry): it preserves every vector's length, stretching nothing in any direction — so every singular value (which measures exactly how much a direction gets stretched) equals $1$.

### 8. Block matrix $A=\begin{bmatrix}A_1\\A_2\end{bmatrix}$, $A_1$ nonsingular $n\times n$, $A_2$ arbitrary $(m-n)\times n$
**(a) $\|A^+\|_2$ via singular values.** $A_1$ nonsingular $\Rightarrow A$ has full column rank $n$ $\Rightarrow$ all $n$ singular values $\sigma_1\ge\cdots\ge\sigma_n$ of $A$ are nonzero. From $A=U\Sigma V^T$, $A^+=V\Sigma^{-1}U^T$, so $A^+$'s singular values are $1/\sigma_1,\dots,1/\sigma_n$. The 2-norm is the *largest* singular value:
$$\boxed{\|A^+\|_2=\frac1{\sigma_n(A)}}\qquad(\sigma_n=\text{smallest singular value of }A)$$

**(b) $\|A\|_2\le\|A_1\|_2+\|A_2\|_2$.** For any $x$:
$$\|Ax\|_2^2=\left\|\begin{bmatrix}A_1x\\A_2x\end{bmatrix}\right\|_2^2=\|A_1x\|_2^2+\|A_2x\|_2^2$$
Since $\sqrt{a^2+b^2}\le a+b$ for $a,b\ge0$:
$$\|Ax\|_2=\sqrt{\|A_1x\|_2^2+\|A_2x\|_2^2}\ \le\ \|A_1x\|_2+\|A_2x\|_2\ \le\ \big(\|A_1\|_2+\|A_2\|_2\big)\|x\|_2$$
Take $\sup$ over $\|x\|_2=1$:
$$\boxed{\|A\|_2\le\|A_1\|_2+\|A_2\|_2}\ \blacksquare$$

**(c) $\|A^+\|_2\le\|A_1^{-1}\|_2$.** Let $L=\begin{bmatrix}A_1^{-1}&0\end{bmatrix}$ ($n\times m$, split to match $A$'s row blocks). Then
$$LA=A_1^{-1}A_1=I_n$$
so $L$ is *a* left inverse of $A$, with $\|L\|_2=\|A_1^{-1}\|_2$.
Any left inverse can be written $L=A^++N$ with $NA=0$ (rows of $N$ orthogonal to $\mathrm{range}(A)$), while the rows of $A^+=(A^*A)^{-1}A^*$ lie *in* $\mathrm{range}(A)$ — so these row spaces are orthogonal, $A^+N^T=0$, and
$$LL^T=A^+(A^+)^T+NN^T\ \succeq\ A^+(A^+)^T\qquad(\text{PSD order, since }NN^T\succeq0)$$
This means $\|L\|_2\ge\|A^+\|_2$ for *every* left inverse $L$ (the pseudoinverse has the smallest 2-norm of any left inverse). Using our explicit $L$:
$$\boxed{\|A^+\|_2\le\|L\|_2=\|A_1^{-1}\|_2}\ \blacksquare$$
### 2026-10-18 — diagrams drawn for 1(c), 3(b)/(c), 4(c)
4 diagrams built on the live Excalidraw MCP canvas and exported as native `.excalidraw` files in `10_Areas/Excalidraw/`, each numerically verified against the worked values above (exact assertion checks, not just visual eyeballing) before being written:
- **1(c)**: two panels — the unit circle with $\vec v_1=(-0.6,0.8)$ at $126.87°$ and $\vec v_2=(0.8,0.6)$ at $36.87°$ (checked perpendicular and unit-length), connected by curved arrows to the image ellipse (semi-axes $\sigma_1=10\sqrt2,\sigma_2=5\sqrt2$, rotated $45°$ so its major axis sits on $y=x$) showing $\sigma_1\vec u_1=(10,10)$ and $\sigma_2\vec u_2=(5,-5)$.
- **3(b)**: $\vec x=(0,2)$, its projection $P\vec x\approx(0.87,0.5)$ onto the $\mathcal R(P)$ line at $30°$, and the perpendicular leg $(I-P)\vec x$ — checked $(I-P)\vec x\perp\mathcal R(P)$ by dot product.
- **3(c)**: same picture plus $-P\vec x$ and $(I-2P)\vec x\approx(-1.73,1)$, built by shifting the $(I-P)\vec x$ segment to start at $-P\vec x$ — checked the shift is a pure translation (equal vector) and that $\|\vec x\|=\|(I-2P)\vec x\|=2$.
- **4(c)**: two panels — the general-$A$ parallelogram (shaded, area $3\times2\times\sin60°\approx5.2$, checked via cross product) overlaid with the dashed $3\times2$ comparison box (area $6$), vs. the unitary case where $\vec a_1\perp\vec a_2$ and the parallelogram *is* the box (area $6$, equality).
All 4 were also round-tripped through the MCP canvas (`import_scene` + `describe_scene`) to catch any schema issues before writing to the vault.
> [!WARNING] Excalidraw MCP build had 3 rounds of rendering bugs — root cause and final fix
> This was the vault's first real use of the `excalidraw` MCP server for diagrams meant to open in actual Obsidian, and it took 3 rounds to get right:
> 1. Box 1 of [[20_Progress/Degree/CSCI 5304/Quiz & HW/Quiz - 3|Quiz - 3]] 1(a) mis-rendered — the one vector with a negative offset in *both* x and y, because the first pass (built via `batch_create_elements`) had no explicit `points` array.
> 2. 1(c) here crashed the whole file ("Excalidraw ran into an unknown problem!") — a 51-point hand-drawn polyline approximating a rotated ellipse.
> 3. **Real root cause for both, confirmed on inspection:** the `excalidraw` MCP's own `batch_create_elements`/`export_scene` round-trip is *not* a genuine Excalidraw element — it drops `points`, `seed`, `versionNonce`, `isDeleted`, `groupIds`, `roundness`, `angle`, `opacity`, `backgroundColor`, `fillStyle`, `roughness`, and gives text elements no `width`/`height` at all. That reduced shape renders fine on the MCP's own live canvas but is not what Obsidian's real `@excalidraw/excalidraw`-backed plugin expects.
> **Fix:** all 8 diagrams (4 here, 4 in Quiz 3) were rebuilt with a hand-authored element generator that fills in the complete real schema — unique `id`, `seed`, `versionNonce`, full `points` arrays (direction always explicit, never implied by width/height sign), real estimated `width`/`height` on every text element, native `ellipse`+`angle` instead of hand-drawn curves, and every other standard field — then re-verified both numerically (the same assertion checks as before, unchanged) and structurally (`import_scene`+`describe_scene`). This gotcha is saved in Claude's own memory (not a vault note) so future sessions don't repeat it.
## Concepts used
- **SVD** ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 4|Lecture 4]], [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 5|Lecture 5]]) — computed by hand via $A^TA$'s eigendecomposition for problem 1; used for $A^{-1}$, the 2-norm, and the ellipsoid-area identity in problem 2.
- **Matrix norms** ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 2 & 3|Lecture 2 & 3]]) — max-column-sum ($\|{\cdot}\|_1$) and max-row-sum ($\|{\cdot}\|_\infty$) formulas, Frobenius norm via entrywise sum, used directly in problem 2a.
- **Orthogonal projectors** ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 6|Lecture 6]]) — $P^*=P,\,P^2=P$ used algebraically in problem 3; the decomposition-into-parallel-and-perpendicular-component picture drives the geometric interpretation in 3(b)/(c).
- **QR factorization / Gram-Schmidt** ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 7|Lecture 7]], [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 8|Lecture 8]]) — full QR used for Hadamard's inequality (problem 4); Algorithm 8.1's exact pseudocode (modified Gram-Schmidt) drives the flop count (problem 5) and the $R_i=D_iN_i$ factorization (problem 6).
- **Householder reflectors** ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 10|Lecture 10]]) — eigenvalue/determinant/singular-value facts for $H=I-2vv^T$ derived directly from the definition in problem 7; solved before the Lecture 10 note landed, now cross-linked.
- **Pseudoinverse / least squares** ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 11|Lecture 11]]) — $A^+=(A^*A)^{-1}A^*$ and its minimum-2-norm-left-inverse property used in problem 8; solved before the Lecture 11 note landed, now cross-linked. See also [[20_Progress/Degree/CSCI 5304/Weekly/Week - 7|Week - 7]] for a live alternate re-derivation of problem 8(c)'s inequality.
## Post-submit reflection
<!-- Optional until feedback: the first failure, the pattern, and what to change. -->
