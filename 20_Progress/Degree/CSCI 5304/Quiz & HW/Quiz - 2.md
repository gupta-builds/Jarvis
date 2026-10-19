---
type: evergreen
status: sprout
created: 2026-10-04
updated: 2026-10-04
tags:
  - evergreen
  - question-bank
  - CSCI5304
  - Quiz
track:
  - "[[CSCI 5304 Board]]"
  - "[[20_Progress/Degree/CSCI 5304/Weekly/Week - 4|Week - 4]]"
notes:
  - "[[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 4|Lecture - 4]]"
  - "[[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 5|Lecture - 5]]"
  - "[[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 2 & 3|Lecture - 2 & 3]]"
---
# Quiz - 2
Take-home quiz, SVD-focused (per [[20_Progress/Degree/CSCI 5304/Weekly/Week - 4|Week - 4]]'s schedule-anomaly note: announced 9/29, no in-class sitting). Source PDF: `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Midterm\Quiz - 2.pdf`. Single question, Exercise 4.4 from Trefethen & Bau - unitary equivalence and singular values. Every step below cites the exact theorem it uses, so you can write the citation on the paper too if there's room.

## Open Questions

## Misconceptions

## Oral Exam Prompts

## Debugging Drills

## Build Prompts

## Resolved Learnings
### Q1 (Exercise 4.4) - $A,B\in\mathbb{R}^{m\times m}$ unitarily equivalent if $A=QBQ^T$ for orthogonal $Q$.
#### (a) 4 pts - $A=QBQ^T\Rightarrow$ same singular values
Let $B=U\Sigma V^T$ be an SVD of $B$ ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 4|Lecture 4]], Thm 4.1 - every matrix has one).
$$A=QBQ^T=Q(U\Sigma V^T)Q^T=(QU)\,\Sigma\,(QV)^T$$
$Q,U,V$ orthogonal $\Rightarrow$ $QU$ and $QV$ are orthogonal too: $(QU)^T(QU)=U^TQ^TQU=U^TU=I$ (same for $QV$).
So $A=U'\Sigma V'^T$ with $U'=QU,\ V'=QV$ both orthogonal - **this is itself a valid SVD of $A$, with the same $\Sigma$**.
Singular values are unique (Thm 4.1) $\Rightarrow$ $A$ and $B$ have identical singular values. $\blacksquare$

#### (b) 4 pts - same singular values $\Rightarrow$ unitarily equivalent? **No.**
Counterexample. Let $Q=\begin{bmatrix}0&-1\\1&0\end{bmatrix}$ (90° rotation, orthogonal), $B=\begin{bmatrix}3&0\\0&2\end{bmatrix}$ (eigenvalues $3,2$).
Let $A=QB=\begin{bmatrix}0&-2\\3&0\end{bmatrix}$.
*Singular values of $A$:* $A^TA=\begin{bmatrix}9&0\\0&4\end{bmatrix}$ $\Rightarrow$ eigenvalues $9,4$ $\Rightarrow$ $\sigma(A)=\{3,2\}=\sigma(B)$. Same singular values. ✓
*Eigenvalues of $A$:* char. poly $\lambda^2+6=0\Rightarrow\lambda=\pm i\sqrt6$ - **complex**, while $B$'s eigenvalues are $3,2$ - real.
If $A=QBQ^T$ for some orthogonal $Q$, then $Q^T=Q^{-1}$ makes $A,B$ similar $\Rightarrow$ identical characteristic polynomials $\Rightarrow$ identical eigenvalues. They don't match (complex vs. real) - contradiction.
**So $A,B$ share singular values but are not unitarily equivalent. Same $\sigma$'s is strictly weaker than unitary equivalence** - (a) used one SVD with possibly *different* $U,V$ per side; equivalence here forces the *same* $Q$ on both sides.

#### (c) 2 pts - SVD of $A=\begin{bmatrix}2&0\\0&3\end{bmatrix}$ via part (a), target $\Sigma=\begin{bmatrix}3&0\\0&2\end{bmatrix}$
Use the swap matrix $P=\begin{bmatrix}0&1\\1&0\end{bmatrix}$ (orthogonal: $P^T=P$, $P^2=I$).
Check $A=P\Sigma P^T$: $P\Sigma=\begin{bmatrix}0&2\\3&0\end{bmatrix}$, then $(P\Sigma)P^T=\begin{bmatrix}0&2\\3&0\end{bmatrix}\begin{bmatrix}0&1\\1&0\end{bmatrix}=\begin{bmatrix}2&0\\0&3\end{bmatrix}=A$. ✓
So $A$ and $\Sigma$ are unitarily equivalent via $Q=P$. By part (a)'s own construction (with $B=\Sigma$, whose trivial SVD is $\Sigma=I\,\Sigma\,I^T$): $A=(PI)\,\Sigma\,(PI)^T=P\Sigma P^T$ **is itself an SVD of $A$**.
$$\boxed{A=U\Sigma V^T,\quad U=V=P=\begin{bmatrix}0&1\\1&0\end{bmatrix},\quad \Sigma=\begin{bmatrix}3&0\\0&2\end{bmatrix}}$$
No $AA^T$, $A^TA$, or eigenvalues computed - only $P$ as a known orthogonal reordering of $A$'s already-diagonal entries.
