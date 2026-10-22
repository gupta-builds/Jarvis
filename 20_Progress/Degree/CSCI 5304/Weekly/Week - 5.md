---
type: class
input_kind: lecture
status: seed
created: 2026-10-22
updated: 2026-10-22
area:
  - "[[CSCI 5304 Board]]"
  - "[[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 10|Lecture - 10]]"
  - "[[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 11|Lecture - 11]]"
tags:
  - "#class"
  - "#Lecture"
next: "Build Week - 6 from the 10/13 transcript (Lecture 12, Conditioning) - already landed as a Textbook note, weekly synthesis still pending"
---
# Week - 5
## What you must be able to do
- Link [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 8|Lecture - 8]] first - Householder is this week's structural counterpart to Gram-Schmidt.
- Derive the Householder reflector $F=I-2vv^*/v^*v$ from the orthogonal projector, and state why the specific sign choice $v=\mathrm{sign}(x_1)\|x\|e_1+x$ avoids cancellation error.
- Explain why $Q$ is never explicitly formed, and state the asymptotic cost difference between applying $Q^*b$/$Qx$ implicitly ($O(mn)$) versus forming $Q$.
- State the least squares problem, derive the normal equations from the orthogonality condition $A^*r=0$, and name all three solution algorithms (normal equations, QR, SVD) with their relative speed/stability tradeoffs.
- Note explicitly: this week's content (Lectures 10-11) is exactly what the next quiz and the midterm are scoped to, per the professor's own 10/13 statement - see [[20_Progress/Degree/CSCI 5304/Weekly/Week - 6|Week - 6]].
## Key ideas (short)
- **Orthogonal triangularization** (Householder) is the structural mirror of Gram-Schmidt's **triangular orthogonalization** - orthogonal operations on the left vs. triangular operations on the right, same QR result.
- The **Householder reflector** is a projector doubled - $F=I-2vv^*/v^*v$ vs. the projector $P=I-vv^*/v^*v$ from [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 6|Lecture - 6]].
- **Sign choice matters for stability**: picking the reflection that moves $x$ *farther* avoids subtracting nearly-equal vectors.
- **Least squares reduces to one orthogonality condition**, $A^*r=0$, which three different factorizations (normal equations, QR, SVD) all solve, trading cost against numerical stability.
- The **pseudoinverse** $A^+=(A^*A)^{-1}A^*$ is the matrix that turns $b$ directly into the least squares solution $x$.
## Concepts created today
- None created yet, per this course's lean concept-note discipline. The strongest new candidate this week is the **Householder reflector / orthogonal triangularization** mechanism itself - arguably more load-bearing than either of [[20_Progress/Degree/CSCI 5304/Weekly/Week - 2|Week - 2]]'s still-uncreated SVD/Norms candidates, since it is the course's actual computational tool for QR going forward and is directly tested in [[20_Progress/Degree/CSCI 5304/Quiz & HW/Homework - 2|Homework - 2]] problem 7 and [[20_Progress/Degree/CSCI 5304/Quiz & HW/Quiz - 3|Quiz - 3]]. Not created this build, per the rule that concept notes are built only during actual studying, not automatically alongside the weekly/textbook build - flagged here as the leading candidate.
## Examples worth keeping
- The live board derivation of the reflector via a hand-drawn triangle, including a real self-correction: the professor first wrote $x+v=\|x\|e_1$, caught that it didn't hold, and re-derived the correct $x+v=-\mathrm{sign}(x_1)\|x\|e_1$ relation a second time from the same picture - a live demonstration of exactly the cancellation-error risk the book's own "Better of Two Reflectors" section warns about.
- The small $4\times2$ overdetermined example worked live ($A=\begin{bmatrix}1&0\\0&1\\0&0\\0&0\end{bmatrix}$, $b=(0,0,3,5)^T$): no linear combination of $A$'s columns can reach $b$'s nonzero bottom entries, making "not enough columns" concrete before any formal least squares definition.
- The direct live connection from the SVD-based least squares algorithm back to an already-assigned homework problem: "this is actually how you approach the homework problem that I asked you to solve for the SVD of the two-by-two matrix" - the $A^*A=V\Sigma^2V^*$ substitution used in [[20_Progress/Degree/CSCI 5304/Quiz & HW/Homework - 2|Homework - 2]] problem 1.
- A historical aside matching the textbook's own back-matter notes: the Gauss (1795)-vs-Legendre (1805) priority dispute over inventing least squares, tied to predicting planetary positions from telescope observations.
## Lecture
### 1. Lecture 10 — Householder Triangularization, start (Tue 10/6)
Opened by naming the real gap in the course's own numbering (skipped Lecture 9, MATLAB, with an aside on preferring Python/NumPy over MATLAB) before jumping to Lecture 10. Built the "triangular orthogonalization vs. orthogonal triangularization" naming distinction directly from the book's historical notes, then derived the Householder reflector from the orthogonal projector picture: project $x$ onto $v$, then go *twice* as far to reflect across the hyperplane orthogonal to $v$, landing on $F=I-2vv^*/v^*v$. Worked through solving for $v$ itself with a real live correction (see Examples above) before reaching the stable sign choice. Ran out of time before covering the implicit-application algorithms or the operation count - both explicitly deferred ("I feel like we should postpone talking about cost until later").
### 2. Lecture 10 — Householder Triangularization, finish (Thu 10/8)
Finished by deriving the implicit $Q^*b$ and $Qx$ algorithms directly from "we never explicitly form $Q$" - walked through why applying the stored reflection vectors costs only two inner products and a vector update per step, and showed the direct application to solving $Ax=b$ via $A=QR\Rightarrow Rx=Q^*b$, back substitution. The operation count was deferred a second time.
### 3. Lecture 11 — Least Squares Problems (Thu 10/8)
Immediately following Lecture 10 in the same session - the professor explicitly grouped Householder and least squares as "the big part of Part II" and said the next quiz would cover both. Derived the overdetermined-system setup with the small $4\times2$ example (see Examples above), the orthogonality argument for the closest point (right-triangle/Pythagorean reasoning), the normal equations $A^*Ax=A^*b$, and all three solution algorithms (normal equations, QR, SVD) - ending with the live connection back to the already-assigned SVD homework problem (see Examples above). Included the Gauss-vs-Legendre historical aside and a brief connective note that least squares, Kalman filtering, and PCA are related "filtering" ideas - flagged as color, not examinable content.
## Textbook integration
> [!IMPORTANT]
> Main chapters: [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 10|Lecture - 10]] (pp. 69-76), [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 11|Lecture - 11]] (pp. 77-85).

The book adds real depth beyond what landed live: the full geometric operation-count derivation for Householder (eq. 10.9, $\sim2mn^2-\tfrac23n^3$ flops) - deferred live twice, present in the textbook note only; the polynomial-interpolation-vs-least-squares-fit example (Examples 11.1-11.2, Fig. 11.1-11.2) illustrating *why* least squares is preferred over exact interpolation, not covered live at all; and the precise operation-count comparison across all three least squares algorithms (eq. 11.14, 11.18, 11.22), which the lecture named qualitatively ("normal equations fastest, SVD most stable") without reproducing the exact flop counts.
## Takeaways (questions to resolve)
- [ ] Confirm whether the full Householder operation-count derivation (eq. 10.9) gets covered live in a future floating-point-arithmetic session, or stays textbook-only for this course's pacing.
- [ ] Confirm whether the book's deferred explanation of *why* normal equations can be numerically unstable (promised for Lectures 18-19) actually lands, since this week's lecture named the fact without deriving it.
- [x] Homework #3's real scope was confirmed 10/13 (see [[20_Progress/Degree/CSCI 5304/Weekly/Week - 6|Week - 6]]) to stop at Lecture 11 - this week's material is the homework's actual endpoint, not a mid-assignment topic.
## Lecture-to-textbook synthesis
==Householder and least squares are presented back-to-back because together they are the complete, numerically responsible way to solve both square and overdetermined linear systems - the same QR factorization doing double duty.==
*Mechanism:* Householder's $A=QR$ (via reflectors, orthogonal triangularization) feeds directly into least squares Algorithm 11.2's $\hat Rx=\hat Q^*b$ - the "daily use" recommended route, chosen over the faster-but-less-stable normal equations and the slower-but-more-stable SVD route.
- Lecture example/scenario: the live derivation of $v$ with its real self-correction, immediately followed by the small $4\times2$ unsolvable-system example motivating least squares.
- Textbook connection: [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 10|Lecture - 10]]'s eq. 10.4 reflector formula and [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 11|Lecture - 11]]'s eq. 11.17 triangular system are the same QR factorization applied to two different problems.
- Concept links: Householder Reflector / Orthogonal Triangularization (strongest new candidate, not yet created - see Concepts created today above).
> [!WARNING]
> Assuming "covered in lecture" means "covered at book depth." Both the Householder operation count and the normal-equations instability explanation were explicitly deferred live - don't assume either is fair game for a quiz until confirmed covered.

> [!SUMMARY]
> This week is Part II's actual payoff: Householder gives a stable way to compute QR, and least squares gives the single most common reason to want one - the next quiz and the midterm are both scoped to stop exactly here.
## Flashcards
What's the one-sentence contrast between Gram-Schmidt and Householder?::Gram-Schmidt is triangular orthogonalization (triangular ops on the right make $A$ orthogonal); Householder is orthogonal triangularization (orthogonal ops on the left make $A$ triangular). #cards/5304
Why does the Householder algorithm choose a specific sign for $v$ instead of either sign working equally well in practice?::The chosen sign reflects $x$ to the farther of the two candidate images, avoiding a near-cancellation when computing $v=\|x\|e_1-x$ (or its sign-flipped form) - the other sign risks subtracting two nearly-equal vectors. #cards/5304
State the orthogonality condition that characterizes a least squares solution.::$A^*r=0$ - the residual $r=b-Ax$ must be orthogonal to range$(A)$; algebraically this is the normal equations $A^*Ax=A^*b$. #cards/5304
Rank the three least squares algorithms by speed and by stability.::Fastest to slowest: normal equations, QR, SVD. Least to most stable: normal equations, QR, SVD - the same order reversed. #cards/5304
What did the professor state on 10/13 about this week's content and the upcoming assessments?::That the midterm's scope is "the first two homework contents through chapter 11" - meaning Lectures 10-11 (this week) are the actual endpoint of both Homework #3 and the midterm's coverage. #cards/5304
