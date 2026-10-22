---
type: class
class_kind: homework
status: sprout
created: 2026-10-21
updated: 2026-10-21
tags:
  - class
  - homework
area:
  - "[[CSCI 5304 Board]]"
next: "Hand-copy the solutions below into the boxes of the printed Homework - 1 PDF; confirm the real due date on Canvas/Gradescope before submitting"
---
# Homework - 1
## Overview
CSCI-5304 Fall 2026, Homework 1, 80 points, 8 problems, all written/proof-based (no coding). Source file: `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Homework\Homework - 1.pdf`, printed as an A4 sheet with a boxed answer space under each sub-part, to be filled in by hand. Problems are Trefethen & Bau exercises 1.1 (with professor-customized operations, not the book's own list - see problem 1 below), 1.3, 2.2, 2.3-ish, 3.1, 3.3, 4.1, 4.2. Due date not verified - confirm on Canvas before treating this as due-soon, matching [[CSCI 5304 Board]]'s standing caution about unverified secondary dates for this course.
## Requirements
- [ ] **1. (Ex. 1.1, professor's own operation list) $B$ a $4\times4$ matrix: double col 3, halve row 2, add row 1 to row 2, swap cols 1 & 4, subtract row 2 from each other row, replace col 4 by col 1, delete col 2**
  - [ ] (a, 5 pts) Result as a product of eight matrices.
  - [ ] (b, 5 pts) Result again as a product $ABC$ (same $B$) of three matrices.
- [ ] **2. (Ex. 1.3) $R$ nonsingular $m\times m$ upper-triangular $\Rightarrow R^{-1}$ upper-triangular**
  - [ ] (a, 5 pts) Prove for $2\times2$ $R=\begin{bmatrix}r_{11}&r_{12}\\0&r_{22}\end{bmatrix}$ via $R\vec z_j=\vec e_j$.
  - [ ] (b, 5 pts) Inductive step: true for $k\times k$ $\Rightarrow$ true after adding one row/column on top of the triangle.
- [ ] **3. (Ex. 2.2) Pythagorean theorem for $n$ orthogonal vectors $\|\sum_i\vec x_i\|^2=\sum_i\|\vec x_i\|^2$**
  - [ ] (a, 2 pts) $n=2$, explicit computation of $\|\vec x_1+\vec x_2\|^2$.
  - [ ] (b, 3 pts) $n=3$.
  - [ ] (c, 5 pts) General argument for adding another vector/dimension.
- [ ] **4. (Ex. 2.3-ish) Real symmetric $A$, eigenvectors for distinct eigenvalues are orthogonal**
  - [ ] (a, 2 pts) Step 1: compute $\vec x_1^*(A\vec x_2)$ using $A\vec x_2=\lambda_2\vec x_2$.
  - [ ] (b, 2 pts) Step 2: rewrite the same product via $\vec x_1^*(A\vec x_2)=(A\vec x_1)^*\vec x_2$ and $A\vec x_1=\lambda_1\vec x_1$.
  - [ ] (c, 6 pts) Step 3: combine to show $\vec x_1^*\vec x_2=0$ when $\lambda_1\neq\lambda_2$.
- [ ] **5. (Ex. 3.1) $\|\cdot\|_W$ (W nonsingular) is a vector norm**
  - [ ] (a, 3 pts) $\|\vec x\|_W\geq0$, $=0$ only if $\vec x=0$.
  - [ ] (b, 3 pts) Triangle inequality.
  - [ ] (c, 4 pts) Absolute homogeneity.
- [ ] **6. (Ex. 3.3) Norm inequalities + equality examples, $\vec x\in\mathbb R^m$, $A\in\mathbb R^{m\times n}$**
  - [ ] (a, 2 pts) $\|\vec x\|_\infty\leq\|\vec x\|_2$.
  - [ ] (b, 2 pts) $\|\vec x\|_2\leq\sqrt m\|\vec x\|_\infty$.
  - [ ] (c, 3 pts) $\|A\|_\infty\leq\sqrt n\|A\|_2$.
  - [ ] (d, 3 pts) $\|A\|_2\leq\sqrt m\|A\|_\infty$.
- [ ] **7. (Ex. 4.1) SVDs by hand**
  - [ ] (a, 5 pts) $\begin{bmatrix}1&0\\0&-4\\0&0\end{bmatrix}$.
  - [ ] (b, 5 pts) $\begin{bmatrix}0&0&1\\0&-4&0\end{bmatrix}$.
- [ ] **8. (Ex. 4.2) $A$ ($m\times n$) vs. $B$, its 90°-clockwise-rotated matrix - same singular values?**
  - [ ] (a, 2 pts) Consider SVDs of $A$ and $A^T$.
  - [ ] (b, 3 pts) Difference between the rotated matrix and the transpose.
  - [ ] (c, 5 pts) Combine to answer the main question.
- [ ] Name/section line filled in before submission.
- [ ] Submit via Gradescope through the Canvas assignment (per [[CSCI 5304 Board]] grading section) once the real due date is confirmed.
## Work log
### 2026-10-21 — full written solve
Worked all 8 problems directly from [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 2 & 3|Lecture 2 & 3]], [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 4|Lecture 4]], and the MinerU textbook extraction's Lecture 1 (pp. 3-9 - no vault Lecture 1 note exists yet, Week 1 was skipped per [[CSCI 5304 Board]], so problems 1-2 are cited straight from the source text). Every result is cross-checked at least one independent way: problem 1's elementary-matrix product is re-derived by tracking rows/columns sequentially through the operations (not just trusted from the matrix algebra); problem 2's inductive step is verified by explicit block multiplication $R_{k+1}Z=I$; problems 7's two SVDs are both verified by reconstructing $U\Sigma V^T$ and matching the original matrix exactly; problem 8's general proof is checked against a concrete $2\times2$ numeric example reproducing Lecture 2 & 3's own $A=\begin{bmatrix}1&2\\0&2\end{bmatrix}$ ($\sigma_1\approx2.9208$).

### 1. Elementary matrix product (professor's operation list, not the book's)
**Note:** the printed PDF's operation list differs from the textbook's own Exercise 1.1 (different columns/rows named) - solved from the actual PDF text, reproduced in Requirements above.
Since row operations are left-multiplications and column operations are right-multiplications, and left/right multiplications always commute with each other ($L(BR)=(LB)R$), the row-transform and column-transform can be tracked independently by following what happens to $B$'s abstract rows $r_1,\ldots,r_4$ and columns $c_1,\ldots,c_4$ through the 7 steps in order.

**Row tracking** (ops 2, 3, 5 - the only row operations):
- Op 2 (halve row 2): rows become $r_1,\ \tfrac12r_2,\ r_3,\ r_4$.
- Op 3 (add row 1 to row 2): row 2 becomes $r_1+\tfrac12r_2$. Rows: $r_1,\ r_1+\tfrac12r_2,\ r_3,\ r_4$.
- Op 5 (subtract row 2 from each other row): row 1 $\to r_1-(r_1+\tfrac12r_2)=-\tfrac12r_2$; row 3 $\to r_3-(r_1+\tfrac12r_2)=-r_1-\tfrac12r_2+r_3$; row 4 $\to -r_1-\tfrac12r_2+r_4$; row 2 unchanged.

Final rows, as coefficients of $(r_1,r_2,r_3,r_4)$:
$$\text{row 1}=(0,-\tfrac12,0,0),\quad\text{row 2}=(1,\tfrac12,0,0),\quad\text{row 3}=(-1,-\tfrac12,1,0),\quad\text{row 4}=(-1,-\tfrac12,0,1)$$

**Column tracking** (ops 1, 4, 6, 7 - the only column operations), using original columns $c_1,c_2,c_3,c_4$:
- Op 1 (double column 3): columns $c_1,c_2,2c_3,c_4$.
- Op 4 (swap columns 1 and 4): positions become $(c_4,\,c_2,\,2c_3,\,c_1)$.
- Op 6 (replace column 4 by column 1): position 4 (currently $c_1$) is overwritten by the current column 1 ($c_4$): positions $(c_4,\,c_2,\,2c_3,\,c_4)$.
- Op 7 (delete column 2): remove position 2 ($c_2$): remaining columns, in order, $(c_4,\ 2c_3,\ c_4)$.

**(a) As a product of eight matrices.** Write each operation as its own elementary matrix and keep $B$ as the eighth factor. For left multipliers, "most recent operation leftmost" (op 5 outermost, op 2 innermost); for right multipliers, "most recent operation rightmost" (op 1 innermost, op 7 outermost):
$$\underbrace{(I-E_{12}-E_{32}-E_{42})}_{\text{op 5}}\ \underbrace{(I+E_{21})}_{\text{op 3}}\ \underbrace{\mathrm{diag}(1,\tfrac12,1,1)}_{\text{op 2}}\ \cdot\ B\ \cdot\ \underbrace{\mathrm{diag}(1,1,2,1)}_{\text{op 1}}\ \underbrace{\begin{bmatrix}0&0&0&1\\0&1&0&0\\0&0&1&0\\1&0&0&0\end{bmatrix}}_{\text{op 4 (swap 1,4)}}\ \underbrace{\begin{bmatrix}1&0&0&1\\0&1&0&0\\0&0&1&0\\0&0&0&0\end{bmatrix}}_{\text{op 6}}\ \underbrace{\begin{bmatrix}1&0&0\\0&0&0\\0&1&0\\0&0&1\end{bmatrix}}_{\text{op 7}}$$
Three row-op matrices + $B$ + four column-op matrices = eight matrices total, exactly matching the problem's count.

**(b) As $ABC$.** Multiply each side's chain into a single matrix. Multiplying out the three row matrices (verified against the sequential row-tracking above, which matches exactly):
$$A=\begin{bmatrix}0&-\tfrac12&0&0\\1&\tfrac12&0&0\\-1&-\tfrac12&1&0\\-1&-\tfrac12&0&1\end{bmatrix}$$
Multiplying out the four column matrices (verified against the sequential column-tracking above - final columns $(c_4,\,2c_3,\,c_4)$ means $C$'s three columns select $e_4$, $2e_3$, $e_4$ respectively):
$$C=\begin{bmatrix}0&0&0\\0&0&0\\0&2&0\\1&0&1\end{bmatrix}$$
$$\boxed{\text{Result}=A\,B\,C,\quad A\text{ as above (}4\times4\text{)},\ C\text{ as above (}4\times3\text{)}}$$
*Dimension check:* $A\,(4\times4)\cdot B\,(4\times4)\cdot C\,(4\times3)=4\times3$ - matches "delete column 2" reducing the column count from 4 to 3, rows unaffected.

### 2. Upper-triangular inverse is upper-triangular
**(a) $2\times2$ case.** $R=\begin{bmatrix}r_{11}&r_{12}\\0&r_{22}\end{bmatrix}$ nonsingular $\Rightarrow r_{11},r_{22}\neq0$ (triangular determinant $=r_{11}r_{22}\neq0$). Solve $R\vec z_j=\vec e_j$ for $\vec z_j=(z_{1j},z_{2j})^T$.
*$j=1$:* $r_{11}z_{11}+r_{12}z_{21}=1$, $r_{22}z_{21}=0\Rightarrow z_{21}=0$ (since $r_{22}\neq0$) $\Rightarrow z_{11}=1/r_{11}$.
*$j=2$:* $r_{11}z_{12}+r_{12}z_{22}=0$, $r_{22}z_{22}=1\Rightarrow z_{22}=1/r_{22}\Rightarrow z_{12}=-r_{12}/(r_{11}r_{22})$.
$$R^{-1}=\begin{bmatrix}1/r_{11}&-r_{12}/(r_{11}r_{22})\\0&1/r_{22}\end{bmatrix}$$
The $(2,1)$ entry comes out exactly $0$ - upper triangular, because solving for column 1 of $Z$ only involves back-substituting from the bottom row of the triangular system upward, and $\vec e_1$'s zero in the second slot forces $z_{21}=0$ before $z_{11}$ is even touched.

**(b) Inductive step.** Assume every nonsingular $k\times k$ upper-triangular matrix has an upper-triangular inverse. "Adding another row on top of the triangle" extends to a $(k+1)\times(k+1)$ upper-triangular matrix of the block form
$$R_{k+1}=\begin{bmatrix}r_{11}&\vec b^T\\\vec0&R_k\end{bmatrix}$$
where $R_k$ is the existing $k\times k$ upper-triangular block (now sitting bottom-right), $\vec b$ is the new row's remaining $k$ entries, and the new column's lower $k$ entries are forced to $0$ by the upper-triangular property. Nonsingularity forces $r_{11}\neq0$ (triangular determinant is the product of diagonal entries, and $\det R_{k+1}=r_{11}\det R_k\neq0$).
*Claim:* $R_{k+1}^{-1}=Z=\begin{bmatrix}1/r_{11}&\vec c^T\\\vec0&R_k^{-1}\end{bmatrix}$ for some row vector $\vec c$, which is upper-triangular (top-left scalar, zero block below it, and $R_k^{-1}$ upper-triangular by the induction hypothesis).
*Verify by direct block multiplication:*
$$R_{k+1}Z=\begin{bmatrix}r_{11}&\vec b^T\\\vec0&R_k\end{bmatrix}\begin{bmatrix}1/r_{11}&\vec c^T\\\vec0&R_k^{-1}\end{bmatrix}=\begin{bmatrix}1&r_{11}\vec c^T+\vec b^TR_k^{-1}\\\vec0&R_kR_k^{-1}\end{bmatrix}=\begin{bmatrix}1&r_{11}\vec c^T+\vec b^TR_k^{-1}\\\vec0&I_k\end{bmatrix}$$
Choosing $\vec c^T=-\tfrac1{r_{11}}\vec b^TR_k^{-1}$ (well-defined since $r_{11}\neq0$ and $R_k^{-1}$ exists by the induction hypothesis) makes the top-right block vanish, giving $R_{k+1}Z=I_{k+1}$ exactly. Since $Z$ is a right inverse of the square matrix $R_{k+1}$, it is *the* inverse, and it is upper-triangular by construction. $\blacksquare$
Combined with part (a) as the base case, induction gives the result for every $n\times n$ nonsingular upper-triangular matrix.

### 3. Pythagorean theorem for orthogonal vectors
**(a) $n=2$.** $\|\vec x_1+\vec x_2\|^2=(\vec x_1+\vec x_2)^*(\vec x_1+\vec x_2)=\vec x_1^*\vec x_1+\vec x_1^*\vec x_2+\vec x_2^*\vec x_1+\vec x_2^*\vec x_2=\|\vec x_1\|^2+\|\vec x_2\|^2+2\,\mathrm{Re}(\vec x_1^*\vec x_2)$ ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 2 & 3|Lecture 2 & 3]], eq. 2.1-2.2, bilinearity of the inner product). Orthogonality ($\vec x_1^*\vec x_2=0$, Lecture 2 & 3 p. 13) kills the cross term:
$$\boxed{\|\vec x_1+\vec x_2\|^2=\|\vec x_1\|^2+\|\vec x_2\|^2}$$
**(b) $n=3$.** Let $\vec y=\vec x_1+\vec x_2$. Since $\vec x_1,\vec x_2$ are both orthogonal to $\vec x_3$: $\vec y^*\vec x_3=\vec x_1^*\vec x_3+\vec x_2^*\vec x_3=0+0=0$, so $\vec y\perp\vec x_3$. Apply part (a) twice: once to $\vec x_1,\vec x_2$ to get $\|\vec y\|^2=\|\vec x_1\|^2+\|\vec x_2\|^2$, then to $\vec y,\vec x_3$:
$$\|\vec x_1+\vec x_2+\vec x_3\|^2=\|\vec y+\vec x_3\|^2=\|\vec y\|^2+\|\vec x_3\|^2=\|\vec x_1\|^2+\|\vec x_2\|^2+\|\vec x_3\|^2$$
**(c) General argument (induction on $n$).** Assume true for any $k$ pairwise-orthogonal vectors: $\|\sum_{i=1}^k\vec x_i\|^2=\sum_{i=1}^k\|\vec x_i\|^2$. Let $\vec y=\sum_{i=1}^k\vec x_i$. Then $\vec y^*\vec x_{k+1}=\sum_{i=1}^k\vec x_i^*\vec x_{k+1}=0$ (every $\vec x_i$, $i\leq k$, is orthogonal to $\vec x_{k+1}$ by hypothesis on the full set), so $\vec y\perp\vec x_{k+1}$. Applying the $n=2$ base case (part a) to the pair $(\vec y,\vec x_{k+1})$:
$$\left\|\sum_{i=1}^{k+1}\vec x_i\right\|^2=\|\vec y+\vec x_{k+1}\|^2=\|\vec y\|^2+\|\vec x_{k+1}\|^2=\sum_{i=1}^{k}\|\vec x_i\|^2+\|\vec x_{k+1}\|^2=\sum_{i=1}^{k+1}\|\vec x_i\|^2$$
By induction, the identity holds for every $n$. $\blacksquare$ This is exactly the collapsing-cross-terms mechanism [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 2 & 3|Lecture 2 & 3]]'s Theorem 2.1 proof uses to show an orthogonal set is linearly independent.

### 4. Eigenvectors of distinct eigenvalues are orthogonal (real symmetric $A$)
**(a) Step 1.** $\vec x_1^*(A\vec x_2)=\vec x_1^*(\lambda_2\vec x_2)=\lambda_2(\vec x_1^*\vec x_2)$, using $A\vec x_2=\lambda_2\vec x_2$ and linearity of the inner product in the second argument.
**(b) Step 2.** Given identity: $\vec x_1^*(A\vec x_2)=\vec x_1^*(A^*\vec x_2)=(\vec x_1^*A^*)\vec x_2=(A\vec x_1)^*\vec x_2$ - valid since $A$ is symmetric, $A^*=A^T=A$ (real matrix, [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 2 & 3|Lecture 2 & 3]]'s note that $A^*$ collapses to $A^T$ for real matrices). Substituting $A\vec x_1=\lambda_1\vec x_1$ and $\lambda_1$ real (a real symmetric matrix's eigenvalues are always real, so no conjugation issue):
$$\vec x_1^*(A\vec x_2)=(A\vec x_1)^*\vec x_2=(\lambda_1\vec x_1)^*\vec x_2=\lambda_1(\vec x_1^*\vec x_2)$$
**(c) Step 3.** From (a) and (b), the same quantity $\vec x_1^*(A\vec x_2)$ equals both $\lambda_2(\vec x_1^*\vec x_2)$ and $\lambda_1(\vec x_1^*\vec x_2)$:
$$\lambda_1(\vec x_1^*\vec x_2)=\lambda_2(\vec x_1^*\vec x_2)\ \Longrightarrow\ (\lambda_1-\lambda_2)(\vec x_1^*\vec x_2)=0$$
Since $\lambda_1\neq\lambda_2$ by hypothesis, $(\lambda_1-\lambda_2)\neq0$, forcing
$$\boxed{\vec x_1^*\vec x_2=0}$$
i.e. $\vec x_1\perp\vec x_2$. $\blacksquare$

### 5. $\|\vec x\|_W=\|W\vec x\|$ is a vector norm ($W$ nonsingular)
Uses the three axioms of the underlying norm $\|\cdot\|$ directly ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 2 & 3|Lecture 2 & 3]], eq. 3.1) plus $W$'s linearity and nonsingularity (MinerU Lecture 1, Theorem 1.3(d): nonsingular $\Leftrightarrow\mathrm{null}(W)=\{0\}$).
**(a)** $\|\vec x\|_W=\|W\vec x\|\geq0$ since $\|\cdot\|$ is itself a norm (always nonnegative). $\|\vec x\|_W=0\Leftrightarrow\|W\vec x\|=0\Leftrightarrow W\vec x=0$ (norm's own zero-iff-zero property) $\Leftrightarrow\vec x=0$ (since $W$ nonsingular means $\mathrm{null}(W)=\{\vec0\}$).
**(b)** $\|\vec x+\vec y\|_W=\|W(\vec x+\vec y)\|=\|W\vec x+W\vec y\|$ (linearity of $W$) $\leq\|W\vec x\|+\|W\vec y\|$ (triangle inequality of $\|\cdot\|$) $=\|\vec x\|_W+\|\vec y\|_W$.
**(c)** $\|\alpha\vec x\|_W=\|W(\alpha\vec x)\|=\|\alpha(W\vec x)\|$ (linearity) $=|\alpha|\,\|W\vec x\|$ (absolute homogeneity of $\|\cdot\|$) $=|\alpha|\,\|\vec x\|_W$.
All three vector-norm axioms hold, so $\|\cdot\|_W$ is a vector norm for any nonsingular $W$. $\blacksquare$

### 6. Norm inequalities and equality examples
**(a) $\|\vec x\|_\infty\leq\|\vec x\|_2$.** Let $|x_k|=\max_i|x_i|=\|\vec x\|_\infty$. Then $|x_k|^2\leq\sum_i|x_i|^2=\|\vec x\|_2^2$ (every other term is $\geq0$), so $\|\vec x\|_\infty=|x_k|\leq\|\vec x\|_2$. *Equality:* $\vec x=(1,0,\ldots,0)^T$ gives $\|\vec x\|_\infty=1=\|\vec x\|_2$.

**(b) $\|\vec x\|_2\leq\sqrt m\|\vec x\|_\infty$.** $\|\vec x\|_2^2=\sum_{i=1}^m|x_i|^2\leq\sum_{i=1}^m\|\vec x\|_\infty^2=m\|\vec x\|_\infty^2$ (each $|x_i|\leq\|\vec x\|_\infty$), so $\|\vec x\|_2\leq\sqrt m\,\|\vec x\|_\infty$. *Equality:* $\vec x=(1,1,\ldots,1)^T\in\mathbb R^m$ gives $\|\vec x\|_\infty=1$, $\|\vec x\|_2=\sqrt m=\sqrt m\cdot1$.

**(c) $\|A\|_\infty\leq\sqrt n\|A\|_2$** ($A$ is $m\times n$). For $\vec x$ with $\|\vec x\|_\infty=1$ (so $\vec x\in\mathbb R^n$), part (b) gives $\|\vec x\|_2\leq\sqrt n$. Then, using part (a) applied to the vector $A\vec x\in\mathbb R^m$ and the induced-norm definition (Lecture 2 & 3, eq. 3.6):
$$\|A\vec x\|_\infty\leq\|A\vec x\|_2\leq\|A\|_2\|\vec x\|_2\leq\sqrt n\,\|A\|_2$$
Taking the supremum over $\|\vec x\|_\infty=1$: $\|A\|_\infty\leq\sqrt n\,\|A\|_2$.
*Equality example:* $A=[1,1,\ldots,1]$ ($1\times n$ row of ones). $\|A\|_\infty=$ max row sum $=n$. $\|A\|_2=\sup_{\|x\|_2=1}|Ax|=\|A^T\|_2$ (as a vector) $=\sqrt n$ (2-norm of the all-ones $n$-vector). Check: $\sqrt n\cdot\|A\|_2=\sqrt n\cdot\sqrt n=n=\|A\|_\infty$ - equality holds exactly.

**(d) $\|A\|_2\leq\sqrt m\|A\|_\infty$.** For $\vec x$ with $\|\vec x\|_2=1$, apply part (b) to the vector $A\vec x\in\mathbb R^m$, then the induced $\infty$-norm definition, then part (a) to $\vec x$ itself:
$$\|A\vec x\|_2\leq\sqrt m\,\|A\vec x\|_\infty\leq\sqrt m\,\|A\|_\infty\|\vec x\|_\infty\leq\sqrt m\,\|A\|_\infty\|\vec x\|_2=\sqrt m\,\|A\|_\infty$$
Taking the supremum over $\|\vec x\|_2=1$: $\|A\|_2\leq\sqrt m\,\|A\|_\infty$.
*Equality example:* $A=[1;1;\ldots;1]$ ($m\times1$ column of ones). $\|A\|_\infty=$ max row sum $=1$ (each row has a single entry, $1$). $\|A\|_2=\sup_{|x|=1}\|Ax\|_2=\|A\|_2$(as a vector)$=\sqrt m$. Check: $\sqrt m\cdot\|A\|_\infty=\sqrt m\cdot1=\sqrt m=\|A\|_2$ - equality holds exactly.

### 7. SVDs by hand
**(a) $A=\begin{bmatrix}1&0\\0&-4\\0&0\end{bmatrix}$ ($3\times2$, $m>n$, use $A^TA$).**
$$A^TA=\begin{bmatrix}1&0&0\\0&-4&0\end{bmatrix}\begin{bmatrix}1&0\\0&-4\\0&0\end{bmatrix}=\begin{bmatrix}1&0\\0&16\end{bmatrix}$$
Already diagonal: eigenvalues $1,16$ with eigenvectors $e_1,e_2$. Descending singular values: $\sigma_1=\sqrt{16}=4$ (from $e_2$), $\sigma_2=\sqrt1=1$ (from $e_1$) $\Rightarrow\vec v_1=(0,1)^T,\ \vec v_2=(1,0)^T$.
$\vec u_1=A\vec v_1/\sigma_1=(0,-4,0)^T/4=(0,-1,0)^T$. $\vec u_2=A\vec v_2/\sigma_2=(1,0,0)^T$. Third left vector (needed since $m=3>n=2$) completing an orthonormal basis of $\mathbb R^3$: $\vec u_3=(0,0,1)^T$ (orthogonal to both, unit length).
$$A=\underbrace{\begin{bmatrix}0&1&0\\-1&0&0\\0&0&1\end{bmatrix}}_{U}\underbrace{\begin{bmatrix}4&0\\0&1\\0&0\end{bmatrix}}_{\Sigma}\underbrace{\begin{bmatrix}0&1\\1&0\end{bmatrix}}_{V^T}$$
*Check:* $U\Sigma=\begin{bmatrix}0&1\\-4&0\\0&0\end{bmatrix}$; $(U\Sigma)V^T=\begin{bmatrix}0&1\\-4&0\\0&0\end{bmatrix}\begin{bmatrix}0&1\\1&0\end{bmatrix}=\begin{bmatrix}1&0\\0&-4\\0&0\end{bmatrix}=A$ exactly. ✓

**(b) $B=\begin{bmatrix}0&0&1\\0&-4&0\end{bmatrix}$ ($2\times3$, $m<n$, use $BB^T$).**
$$BB^T=\begin{bmatrix}0&0&1\\0&-4&0\end{bmatrix}\begin{bmatrix}0&0\\0&-4\\1&0\end{bmatrix}=\begin{bmatrix}1&0\\0&16\end{bmatrix}$$
Same pattern: $\sigma_1=4$ (eigenvector $(0,1)^T$), $\sigma_2=1$ (eigenvector $(1,0)^T$) $\Rightarrow\vec u_1=(0,1)^T,\ \vec u_2=(1,0)^T$.
$\vec v_1=B^T\vec u_1/\sigma_1=(0,-4,0)^T/4=(0,-1,0)^T$. $\vec v_2=B^T\vec u_2/\sigma_2=(0,0,1)^T$. Third right vector (needed since $n=3>m=2$): $\vec v_3=(1,0,0)^T$ (orthogonal to both, unit length).
$$B=\underbrace{\begin{bmatrix}0&1\\1&0\end{bmatrix}}_{U}\underbrace{\begin{bmatrix}4&0&0\\0&1&0\end{bmatrix}}_{\Sigma}\underbrace{\begin{bmatrix}0&-1&0\\0&0&1\\1&0&0\end{bmatrix}}_{V^T}$$
*Check:* $U\Sigma=\begin{bmatrix}0&1&0\\4&0&0\end{bmatrix}$; $(U\Sigma)V^T=\begin{bmatrix}0&1&0\\4&0&0\end{bmatrix}\begin{bmatrix}0&-1&0\\0&0&1\\1&0&0\end{bmatrix}=\begin{bmatrix}0&0&1\\0&-4&0\end{bmatrix}=B$ exactly. ✓

### 8. $A$ vs. its 90°-clockwise rotation $B$ — same singular values?
**(a) SVDs of $A$ and $A^T$.** If $A=U\Sigma V^*$ (real case: $A=U\Sigma V^T$, $U,V$ orthogonal), then $A^T=V\Sigma^TU^T$ - since $U,V$ orthogonal, this is itself a valid SVD of $A^T$ (just with $U,V$'s roles swapped and $\Sigma$ transposed, same diagonal entries). **So $A$ and $A^T$ always have identical singular values.**

**(b) Rotated matrix vs. transpose - the real difference.** Rotating an $m\times n$ grid $90°$ clockwise does *not* equal transposing it - a $2\times2$ check makes the difference concrete: $\begin{bmatrix}a&b\\c&d\end{bmatrix}$ rotated $90°$ clockwise is $\begin{bmatrix}c&a\\d&b\end{bmatrix}$ (bottom-left becomes top-left), while its transpose is $\begin{bmatrix}a&c\\b&d\end{bmatrix}$ - different matrices. Comparing them: the rotated matrix is exactly the transpose with its **columns reversed** (column order flipped). In general, for $A$ ($m\times n$), the $90°$-clockwise rotation is
$$B=A^T J_m,\qquad J_m=\begin{bmatrix}&&1\\&\iddots&\\1&&\end{bmatrix}\ (m\times m\text{ reversal/permutation matrix})$$
*Verified on the $2\times2$ example:* $A^T=\begin{bmatrix}a&c\\b&d\end{bmatrix}$, $J_2=\begin{bmatrix}0&1\\1&0\end{bmatrix}$, $A^TJ_2=\begin{bmatrix}c&a\\d&b\end{bmatrix}=B$. ✓ $J_m$ is a permutation matrix, hence real orthogonal: $J_m^TJ_m=I$, $J_m^T=J_m$ (symmetric).

**(c) Combine: yes, same singular values.** From (a), $A^T=V\Sigma^TU^T$ is a valid SVD. Then
$$B=A^TJ_m=V\Sigma^TU^TJ_m=V\Sigma^T(J_m^TU)^T=V\Sigma^T(J_mU)^T$$
(using $U^TJ_m=(J_m^TU)^T=(J_mU)^T$ since $J_m^T=J_m$). Let $U'=J_mU$: since $J_m$ and $U$ are both orthogonal, their product $U'$ is orthogonal too. So $B=V\Sigma^T(U')^T$ is itself a valid SVD of $B$, with the **same diagonal $\Sigma^T$** (same singular values) as $A^T$ - and by part (a), the same singular values as $A$ itself.
$$\boxed{\text{Yes - }A\text{ and its }90°\text{ rotation }B\text{ always have identical singular values.}}$$
*Numeric check*, using Lecture 2 & 3's own Example 3.1 matrix $A=\begin{bmatrix}1&2\\0&2\end{bmatrix}$ (known $\sigma_1\approx2.9208$): rotating $90°$ clockwise gives $B=\begin{bmatrix}0&1\\2&2\end{bmatrix}$ (verified via $B=A^TJ_2$). $A^TA=\begin{bmatrix}1&2\\2&8\end{bmatrix}$, trace $9$, det $4$. $B^TB=\begin{bmatrix}4&4\\4&5\end{bmatrix}$, trace $9$, det $4$ - **identical trace and determinant**, hence identical eigenvalues, hence identical singular values ($\sigma_1\approx2.9208$, $\sigma_2\approx0.6848$ for both). ✓
## Concepts used
- **Elementary row/column operations as matrix multiplication** (MinerU Lecture 1, eq. 1.1-1.8) - the entire mechanism behind problem 1's eight-matrix and $ABC$ decompositions, including Theorem 1.3's nonsingularity-equivalence list used indirectly in problem 5.
- **Upper-triangular structure and back-substitution** (MinerU Lecture 1, Example 1.3 and Exercise 1.3's own statement) - drives problem 2's block-inverse induction.
- **Inner product, orthogonality, bilinearity** ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 2 & 3|Lecture 2 & 3]], eq. 2.1-2.3, Theorem 2.1) - problem 3's Pythagorean induction and problem 4's eigenvector-orthogonality proof both lean on the same cross-term-collapsing mechanism.
- **Vector and matrix norm axioms, $p$-norms, induced norms** ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 2 & 3|Lecture 2 & 3]], eq. 3.1-3.6) - used directly in problems 5 and 6.
- **SVD** ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 4|Lecture 4]]) - computed by hand via $A^TA$/$BB^T$ eigendecomposition in problem 7; unitary-invariance and transpose-SVD relationships used in problem 8.
- **Orthogonal/unitary matrices preserve singular values** ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 2 & 3|Lecture 2 & 3]], Theorem 3.1) - the exact fact problem 8(c) applies to the permutation matrix $J_m$.
## Post-submit reflection
<!-- Optional until feedback: the first failure, the pattern, and what to change. -->
