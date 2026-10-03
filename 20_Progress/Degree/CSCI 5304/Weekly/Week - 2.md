---
type: class
input_kind: lecture
status: seed
created: 2026-10-02
updated: 2026-10-02
area:
  - "[[CSCI 5304 Board]]"
  - "[[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 2 & 3|Lecture - 2 & 3]]"
  - "[[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 4|Lecture - 4]]"
tags:
  - "#class"
  - "#Lecture"
next: "[[20_Progress/Degree/CSCI 5304/Weekly/Week - 3|Week - 3]]"
---
# Week - 2
## What you must be able to do
- Link [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 2 & 3|Lecture - 2 & 3]] and [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 4|Lecture - 4]] first.
- Prove that multiplying by a unitary matrix preserves both length and angle, from $Q^*Q=I$ alone.
- Distinguish the 1-, 2-, and $\infty$-norms by their unit-ball shapes, and state why the $\infty$-norm is the $p\to\infty$ limit of the $p$-norm family.
- Prove the induced matrix 1-norm equals the max absolute column sum, and state (without proof) the analogous $\infty$-norm/max-row-sum result.
- State the SVD's existence/uniqueness theorem precisely, including what's uniquely determined and what isn't when singular values repeat.
- Explain, geometrically, why the SVD's hyperellipse picture generalizes the weighted-norm ellipse from Lecture 3.
- Name at least two real applications of the SVD (PCA, eigenfaces, low-rank approximation) and state which part of the SVD each one actually uses.
## Key ideas (short)
- **Orthogonality** ($x^*y=0$) and **unitary matrices** ($Q^*Q=I$) are the same idea at two scales - a unitary matrix's columns are a full orthonormal set.
- **Norms** generalize "length"; the **induced matrix norm** extends that to "how much can this matrix stretch something."
- The **SVD** states every matrix, no exceptions, decomposes as $A=U\Sigma V^*$ - existence is proved next week, but the geometric picture (hyperellipse) and the formal definitions land this week.
- SVD strictly generalizes eigendecomposition: no shape restriction, no linear-independence requirement, always real non-negative singular values.
## Concepts created today
- None created yet, per this course's lean concept-note discipline (at most two per week, created only during actual studying, see [[30_Order/Workflows/Courses/Per Class/CSCI 5304 Workflow|CSCI 5304 Workflow]]). Strongest candidates once studying begins: **Singular Value Decomposition** and **Norms and Induced Matrix Norms** - both already flagged in the course workflow note, not yet created.
## Examples worth keeping
- The $b=Ax$ worked numeric recap: $A=\begin{bmatrix}1&2\\2&1\end{bmatrix}$, $x=(3,1)$, giving $b=(5,7)$ after a live self-corrected arithmetic slip - kept because checking a linear-combination claim by hand is exactly the habit the professor was modeling.
- The unit-ball shape comparison across norms: diamond (1-norm), circle (2-norm), square ($\infty$-norm) - and the book's own real-world instances (airline suitcase sizing for the 1-norm; Sergels Torg plaza, Stockholm, for the 4-norm superellipse).
- The PCA/eigenfaces/low-rank-approximation trio as the SVD's motivating "why do I care" anchors.
## Lecture
### 1. Lecture 1 recap (Tue 9/15)
The professor re-derived Lecture 1's column interpretation with the concrete $b=Ax$ example above, bridging into why orthogonality and norms matter: the same vector $b$ has two representations (in $A$'s columns, and in the standard basis), and multiplying by $A$ or $A^{-1}$ converts between them - the conceptual seed for every later change-of-basis argument (similarity transforms, SVD, QR).
### 2. Lecture 2 — Orthogonality and Lecture 3 — Norms (Tue 9/15)
Lecture 2 in full: adjoint/transpose notation (this course reads $A^*$ as $A^T$ throughout, p. 11-12), the inner product $x^*y=\sum\bar x_iy_i$, the law-of-cosines derivation of $x^*y=\|x\|\|y\|\cos\alpha$, orthogonality ($x^*y=0$), unitary matrices ($Q^*Q=I$), and the proof that unitary multiplication preserves length and angle. Lecture 3 through vector norms only: the three norm axioms, the 1-/2-/$\infty$-/general $p$-norms, weighted norms $\|x\|_W=\|Wx\|$ - the lecture explicitly stopped here, before induced/operator matrix norms, which spilled into the next class.
### 3. Lecture 4 — The Singular Value Decomposition (Thu 9/17)
Opened by finishing Lecture 3's induced-norm material: the full proof that the matrix 1-norm equals the max absolute column sum, with the $\infty$-norm/max-row-sum case explicitly flagged as unproved in class (the book supplies it by an identical argument, see [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 2 & 3|Lecture - 2 & 3]]). **Quiz #1 did not happen in class** as printed on the schedule - the professor hadn't written it; it became an ungraded take-home, posted 9/22 and due the same day (see [[CSCI 5304 Board]]'s schedule-anomaly warnings). Then: the SVD's motivation (PCA, eigenfaces, low-rank approximation - "the most important thing in the whole course, maybe in linear algebra"), the hyperellipse geometric picture, formal definitions of $U$, $\Sigma$, $V$, left/right singular vectors, and the existence/uniqueness theorem's *statement* (proof deferred to next class).
## Textbook integration
> [!IMPORTANT]
> Main chapters: [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 2 & 3|Lecture - 2 & 3]] (pp. 11-24), [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 4|Lecture - 4]] (pp. 25-31).

Both landed textbook notes now carry real page citations and go well beyond what the lecture captured: the Cauchy-Schwarz/Hölder inequalities and the Frobenius-norm machinery (pp. 21-23) were never mentioned in lecture at all; the SVD's *existence proof* is actually written directly inside the book's own Lecture 4 text (pp. 29-31), one lecture earlier than where the professor placed it - a real pacing difference between source and lecture, not an error in either (see [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 4|Lecture - 4]]'s own note on this). The book's rectangular-orthonormal-matrix case of Theorem 3.1 also directly resolves an uncertainty the professor flagged live (whether angle-preservation holds for non-square orthonormal $Q$) - it does.
## Takeaways (questions to resolve)
- [ ] Resolve the professor's own flagged uncertainty about rectangular (non-square) orthonormal $Q$ and angle preservation - confirmed by [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 2 & 3|Lecture - 2 & 3]]'s Theorem 3.1 note, so this is really about understanding *why*, not *whether*.
- [ ] Work through the $\infty$-norm/max-row-sum proof by mirroring the 1-norm/max-column-sum argument.
- [ ] Why does the existence/uniqueness theorem matter practically before we know *how* to compute $U,\Sigma,V$? (Answered by Lecture 5's proof, taken up next week.)
- [ ] Why are singular values always real and non-negative even for a matrix with complex or negative entries, when the same matrix's eigenvalues might not be?
## Lecture-to-textbook synthesis
==Every matrix, with no restriction on shape, rank, or field, decomposes as $A=U\Sigma V^*$ - and this single fact is why the SVD generalizes past every place eigendecomposition simply doesn't apply.==
*Mechanism:* the hyperellipse picture (image of the unit sphere under $A$) is the geometric content; $U,\Sigma,V$ are the algebraic bookkeeping for which input directions stretch, by how much, and into which output directions.
- Lecture example/scenario: the eigenfaces/PCA motivating trio, and the "why SVD, not eigendecomposition" contrast - SVD needs no square, full-rank, or independent-eigenvector restriction.
- Textbook connection: [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 4|Lecture - 4]]'s formal definitions and existence theorem statement; the proof itself is next week's [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 5|Lecture - 5]].
- Concept links: candidates only, not yet created - Singular Value Decomposition, Norms and Induced Matrix Norms.
> [!WARNING]
> Mistaking singular values for eigenvalues, or forgetting that the SVD needs no square/full-rank restriction the eigendecomposition does - these are different objects that coincide only for hermitian matrices (Theorem 5.5, taken up next week).

> [!SUMMARY]
> Orthogonality and norms are the measuring tools; the SVD is the first and biggest payoff of having them - a factorization every matrix has, with no exceptions.
## Flashcards
What does it mean for a matrix $Q$ to be unitary?::$Q^*Q=I$ - its columns form an orthonormal set. #cards/5304
Why does multiplying by a unitary matrix preserve vector length?::$\|Qx\|^2=x^*Q^*Qx=x^*x=\|x\|^2$, using $Q^*Q=I$. #cards/5304
What shape is the unit ball for the 1-norm, the 2-norm, and the $\infty$-norm?::Diamond, circle, square respectively - because the 1-norm constrains the sum of coordinates, the 2-norm the Euclidean length, and the $\infty$-norm only the single largest coordinate. #cards/5304
What is the induced matrix norm, and what does $\|A\|_1$ equal in closed form?::$\|A\|=\sup_{x\neq0}\|Ax\|/\|x\|$; $\|A\|_1$ equals the max absolute column sum. #cards/5304
State the SVD's existence/uniqueness theorem precisely.::Every matrix has an SVD with no restriction on shape, rank, or field; singular values are always unique; if the matrix is square and no two singular values repeat, $U$ and $V$ are unique up to complex sign too. #cards/5304
What three things does the SVD guarantee that eigendecomposition does not?::It always exists, its singular values are always real and non-negative, and no linear-independence condition on any set of vectors is required. #cards/5304
Why does the book place the SVD's existence proof inside Lecture 4's own text, even though this course taught it a lecture later?::A real pacing difference - Trefethen & Bau's chapter doesn't separate statement from proof the way the professor's two-session pacing did. #cards/5304
