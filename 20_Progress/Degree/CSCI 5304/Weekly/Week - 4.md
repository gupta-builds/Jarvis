---
type: class
input_kind: lecture
status: seed
created: 2026-10-02
updated: 2026-10-02
area:
  - "[[CSCI 5304 Board]]"
  - "[[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 6|Lecture - 6]]"
  - "[[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 7|Lecture - 7]]"
tags:
  - "#class"
  - "#Lecture"
next: "Build Week - 5 once Lecture 10 (Householder) actually lands a transcript - it hasn't as of 2026-10-01"
---
# Week - 4
## What you must be able to do
- Link [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 5|Lecture - 5]], [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 6|Lecture - 6]], and [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 7|Lecture - 7]] first.
- State the Eckart-Young theorem (best rank-$\nu$ approximation) and explain why it's the reason PCA is provably optimal, not just conventional.
- Define a projector ($P^2=P$), its complementary projector, and distinguish oblique from orthogonal projectors.
- Derive the generalized projector formula $P=A(A^*A)^{-1}A^*$ from the orthogonality condition directly.
- State what QR factorization is and derive classical Gram-Schmidt's equations column by column.
- Explain the core idea of modified Gram-Schmidt (sequential vs. combined projection application) - note this course has not yet covered its full algorithm or operation count.
- Note explicitly: as of 2026-10-01, no transcript exists for [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 10|Lecture 10]] (Householder Triangularization) - the professor ran out of time before reaching it.
## Key ideas (short)
- The **Eckart-Young theorem** (Theorem 5.8) proves the truncated SVD is the *best possible* rank-$\nu$ approximation, not merely a convenient one.
- A **projector** satisfies $P^2=P$; its complement $I-P$ is automatically a projector too, splitting the space into range and null space.
- **Orthogonal projectors** reduce to $P=\hat Q\hat Q^*$ for orthonormal $\hat Q$, or $P=A(A^*A)^{-1}A^*$ for an arbitrary full-rank basis.
- **QR factorization** builds an orthonormal basis for $A$'s successive column spaces; once you have it, $Ax=b$ collapses to a unitary step plus back substitution.
- **Classical vs. modified Gram-Schmidt**: same algebra, different floating-point stability - this course has the idea but not yet the full stability story.
- **Quiz #2 did not happen in class**, same real anomaly pattern as Quiz #1 - it became a take-home, SVD-focused, announced for Thursday 10/1.
## Concepts created today
- None created yet, per this course's lean concept-note discipline (see [[20_Progress/Degree/CSCI 5304/Weekly/Week - 2|Week - 2]]). Candidates now include **Singular Value Decomposition** (deepened again via low-rank approximation) and **Projectors**, not yet created.
## Examples worth keeping
- The rank-one matrix action worked live: $B=uv^*$ (unit $u,v$) sends $Bv=u$ exactly and $Bw=0$ for $w\perp v$ - the $\nu=1$ case of range/null-space-via-SVD made fully explicit.
- The storage/compute argument for a rank-3 truncation: $3(m+n)$ numbers plus 3 scalars instead of $mn$, and $A_3x$ computed via 3 inner products plus a 3-term linear combination instead of a full $O(mn)$ matrix-vector product.
- The "shine a light" projector metaphor, worked both as an oblique projection and, via the SVD characterization ($\sigma_i\in\{0,1\}$), as the orthogonal case - including a real moment where the professor briefly reversed which singular values meant "fixed" vs. "projected away" and self-corrected live.
- The commutativity worked example for $(I-q_2q_2^*)(I-q_1q_1^*)$: the cross term vanishes via $q_2^*q_1=0$, so the two projectors commute - the exact reason modified Gram-Schmidt can apply each new projector to all remaining columns immediately.
## Lecture
### 1. Lecture 5 continued — Low-Rank Approximation and PCA (Tue 9/29)
Opened with Theorem 5.7 (every matrix is a sum of $r$ rank-one matrices $\sum\sigma_iu_iv_i^*$) and Theorem 5.8 (the truncated sum $A_\nu$ is the *best possible* rank-$\nu$ approximation, with error exactly $\sigma_{\nu+1}$ - the Eckart-Young theorem, though not named that way in the book). Worked the storage/compute argument for why this matters practically, then the PCA connection directly: principal components are composite features built from the $u_i$ directions, and Theorem 5.8 is *why* PCA's dimensionality reduction is provably optimal, not just a reasonable heuristic.
### 2. Lecture 6 — Projectors (Tue 9/29 end, Thu 10/1 start)
Picked up as "Part Two... QR factorization and least squares" with the book's own definition ($P^2=P$, "idempotent"), the shine-a-light shadow metaphor, the proof that $P$ fixes vectors already in range$(P)$, and the complementary projector $I-P$. At the start of 10/1: the orthogonal-projector SVD characterization ($\sigma_i\in\{0,1\}$, with a real live self-correction on which value means what), collapsing to $P=\hat Q\hat Q^*$ for orthonormal $\hat Q$, then the generalized arbitrary-basis formula $P=A(A^*A)^{-1}A^*$ derived directly from the orthogonality condition $A^*(Ax-v)=0$ - named explicitly as containing the Moore-Penrose pseudoinverse and the normal-equations approach to least squares, ahead of where this course formally covers it.
### 3. Lecture 7 — QR Factorization (Thu 10/1)
The book's own "successive column spaces" framing, reduced vs. full QR (identical hatted-notation convention to the SVD), and the "why QR" motivation - solving $Ax=b$ via $Rx=Q^*b$ plus back substitution, explicitly previewing that Gaussian elimination's instability (not yet covered) is why the QR route matters once stability is studied. Then the live Gram-Schmidt derivation, column by column: $r_{11}=\|a_1\|_2$, $r_{12}=q_1^*a_2$ (derived from the orthogonality requirement, not just asserted), $r_{22}=\|a_2-r_{12}q_1\|_2$ - with the subtraction explicitly reframed as the complementary projector $(I-q_1q_1^*)a_2$ from [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 6|Lecture 6]].
### 4. Lecture 8 — Modified Gram-Schmidt (idea only, Thu 10/1)
With about five minutes left, the professor reached only the *core idea*: classical GS applies one combined projection $P_j$ per column; modified GS applies the same result as a sequence of rank-$(m-1)$ projectors $(I-q_iq_i^*)$, one at a time, proved to commute for already-orthogonal $q_i$'s (worked live, see Examples above) - and therefore free to apply as soon as each new $q_i$ is known, to all remaining columns. The full algorithm, its $\sim2mn^2$ operation count, and the triangular-orthogonalization framing are real but **not yet lectured** - see [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 8|Lecture - 8]]'s own warning on exactly this split. The session ended teasing Householder as "flip this around... apply Q's on the left instead of R's on the right" - not covered.
## Textbook integration
> [!IMPORTANT]
> Main chapters: [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 5|Lecture - 5]]'s low-rank section (pp. 35-37), [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 6|Lecture - 6]] (pp. 41-47), [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 7|Lecture - 7]] (pp. 48-55), [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 8|Lecture - 8]] (pp. 56-62, partially lectured only).

The book adds real depth beyond what landed live: the continuous-function QR factorization producing the Legendre polynomials (pp. 53-54) - a genuinely surprising extension of Gram-Schmidt to function spaces, not mentioned in lecture at all; the full $\sim2mn^2$ Gram-Schmidt flop count and its geometric-volume derivation (pp. 58-60); and the explicit "triangular orthogonalization vs. orthogonal triangularization" framing (p. 61-62) that sets up the contrast with Householder before this course has actually covered Householder.
> [!WARNING] Two real schedule anomalies confirmed this week, same pattern as Quiz #1
> **Quiz #2 did not happen in class** on Thursday 10/1 as the printed schedule shows - the professor said directly on 9/29 "I can make a take-home quiz for SVD by Thursday, and you can do it until Sunday... maybe Thursday to Monday instead." Treat it as take-home, SVD-focused, not an in-class event - update [[CSCI 5304 Board]]'s schedule-anomaly section to match.
> **Homework #2 has not been assigned as of 10/1**, despite the Board's printed schedule showing it due 10/7. The professor stated directly: "I realized the homework late due date passed, and I didn't create a second homework, so I owe you a homework, and you'll have two weeks to do it like the other one." Treat the printed 10/7 due date as stale until the professor actually posts it.
## Takeaways (questions to resolve)
- [ ] Work through Theorem 5.8's full contradiction proof by hand - the note in [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 5|Lecture - 5]] gives the sketch only.
- [ ] Exercise 6.3: prove $A^*A$ nonsingular $\iff$ $A$ full rank - used without proof in the generalized-projector derivation.
- [ ] Confirm from the professor directly whether the full modified Gram-Schmidt algorithm, its flop count, and the triangular-orthogonalization framing will actually be covered live in a future session, or stay textbook-only for this course's pacing.
- [ ] Track when the real Quiz #2 (take-home, SVD-focused) is actually posted and due - confirm against the professor's own "Thursday to Monday" framing once it lands.
## Lecture-to-textbook synthesis
==A projector is the algebraic object behind "best approximation" at every scale in this course - from a single rank-one truncation of the SVD, to QR factorization's successive orthogonalization, to (not yet covered) least squares' normal equations.==
*Mechanism:* $P^2=P$ forces every vector already in range$(P)$ to be a fixed point; the orthogonal case $P=\hat Q\hat Q^*$ or $P=A(A^*A)^{-1}A^*$ turns "best approximation within a subspace" into a single matrix formula, reused identically by Gram-Schmidt's own subtraction steps.
- Lecture example/scenario: the generalized-projector derivation worked live from the orthogonality condition $A^*(Ax-v)=0$, landing on exactly $A(A^*A)^{-1}A^*$.
- Textbook connection: [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 6|Lecture - 6]]'s eq. 6.13, explicitly flagged by the professor as containing the Moore-Penrose pseudoinverse ahead of this course's own least-squares coverage.
- Concept links: Singular Value Decomposition, Projectors (both candidates, not yet created).
> [!WARNING]
> Assuming Lecture 6-7's Thu 9/24 printed schedule slot means that content was actually taught then - it wasn't; it surfaced later, out of order, and [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 10|Lecture 10]] (Householder) has *still* not been taught as of 10/1 despite being this week's other scheduled topic.

> [!SUMMARY]
> This week is really two stories: the SVD's best-approximation property closing out Part I, and projectors opening Part II as the tool QR factorization (and eventually least squares) is built from.
## Flashcards
State the Eckart-Young theorem in one sentence.::The truncated SVD $A_\nu=\sum_{j\leq\nu}\sigma_ju_jv_j^*$ is the best possible rank-$\nu$ approximation to $A$ in the 2-norm, among all matrices of that rank, with error exactly $\sigma_{\nu+1}$. #cards/5304
What does $P^2=P$ mean geometrically, and what is $I-P$?::Once a vector is projected into range$(P)$, projecting again does nothing; $I-P$ is automatically a projector too, projecting onto null$(P)$. #cards/5304
Give the projector onto range($A$) for an arbitrary full-rank $A$, and name the pseudoinverse buried inside it.::$P=A(A^*A)^{-1}A^*$; $(A^*A)^{-1}A^*$ alone is the Moore-Penrose pseudoinverse (for full-rank, overdetermined $A$). #cards/5304
How does QR factorization turn solving $Ax=b$ into an easy problem?::$A=QR \Rightarrow Rx=Q^*b$, a triangular system solved by back substitution after one easy matrix-vector product. #cards/5304
What's the one-sentence difference between classical and modified Gram-Schmidt?::Both compute the same result via the same combined projector, but modified GS applies it as a sequence of smaller projectors one at a time instead of one combined operation - same algebra, better floating-point stability. #cards/5304
What happened to Quiz #2, and how is this the same pattern as Quiz #1?::It did not happen in class as printed - it became a take-home quiz on SVD, announced 9/29 for Thursday 10/1, following the identical real anomaly pattern Quiz #1 set on 9/17. #cards/5304
As of 2026-10-01, has Lecture 10 (Householder) been taught yet?::No - the professor explicitly ran out of time reaching it and deferred it to a future session; no transcript exists for it yet. #cards/5304
