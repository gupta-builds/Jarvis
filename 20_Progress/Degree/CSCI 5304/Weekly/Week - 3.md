---
type: class
input_kind: lecture
status: seed
created: 2026-10-02
updated: 2026-10-02
area:
  - "[[CSCI 5304 Board]]"
  - "[[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 5|Lecture - 5]]"
tags:
  - "#class"
  - "#Lecture"
next: "[[20_Progress/Degree/CSCI 5304/Weekly/Week - 4|Week - 4]]"
---
# Week - 3
## What you must be able to do
- Link [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 5|Lecture - 5]] first.
- Reproduce the SVD existence proof's inductive structure: define $\sigma_1$ via the induced 2-norm, extend to full unitary bases, show the off-diagonal block vanishes, induct on the smaller submatrix.
- Derive rank, range, null space, and row space of $A$ directly from its SVD.
- Derive $\|A\|_2=\sigma_1$ and $\|A\|_F=\sqrt{\sum\sigma_i^2}$ from the SVD, including the trace-based Frobenius derivation.
- State the $A^*A$/$AA^*$ eigenvalue relationship and explain precisely why computing the SVD that way is numerically bad practice.
- Note explicitly: Lectures 6-7 (Projection and QR), scheduled for Thu 9/24, are still pending as of this week - no transcript exists for that date.
## Key ideas (short)
- The existence proof is **inductive**: pick off the biggest stretch direction, prove the rest is a strictly smaller independent sub-problem, repeat.
- **Rank, range, null space, row space** all reduce to which singular values are zero vs. nonzero.
- **2-norm and Frobenius norm** both come directly from $\Sigma$ - the 2-norm from just $\sigma_1$, the Frobenius norm from all of them.
- Computing the SVD via $A^*A$/$AA^*$ eigenvectors is theoretically valid but **numerically bad** - squaring the matrix squares its condition number.
## Concepts created today
- None created yet, per this course's lean concept-note discipline - see [[20_Progress/Degree/CSCI 5304/Weekly/Week - 2|Week - 2]]'s identical note. Candidate strengthens this week: **Singular Value Decomposition** now has both the existence proof and the full property catalogue behind it.
## Examples worth keeping
- The block-decomposition worked example: $U_1^*AV_1 = \begin{bmatrix}\sigma_1 & w^*\\0&B\end{bmatrix}$, with the norm argument forcing $w=0$ - the exact mechanism both the lecture and the book use (see [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 5|Lecture - 5]]'s Full Reading Notes).
- The trace-based Frobenius norm derivation: $\|A\|_F^2=\operatorname{tr}(A^*A)=\operatorname{tr}(V\Sigma^2V^*)=\operatorname{tr}(\Sigma^2)=\sum\sigma_i^2$.
## Lecture
### 1. Lecture 5 — SVD Existence Proof (Tue 9/22)
Take-home Quiz #1 logistics opened the class (real, one line only, not lecture content - posted late 9/22, due the same day). Then: recap of SVD definitions and the existence/uniqueness theorem statement from last week, followed by the full inductive proof - define $\sigma_1=\|A\|_2$, find the unit vectors $v_1,u_1$ achieving it via $Av_1=\sigma_1u_1$, extend both to full unitary bases $U_1,V_1$, compute the block decomposition $U_1^*AV_1=\begin{bmatrix}\sigma_1&w^*\\0&B\end{bmatrix}$, force $w=0$ via a norm argument, then induct on the smaller matrix $B$ down to the 1×1 base case.
### 2. Lecture 5 — Properties, Norms, and Eigenvalue Connections (Tue 9/22)
From the same proof structure: rank$(A)=$ number of nonzero singular values; range$(A)=$ span of the $u_i$ for nonzero $\sigma_i$; null space $=$ span of the $v_j$ for zero $\sigma_j$; row space $=$ span of the $v_i$ for nonzero $\sigma_i$. $\|A\|_2=\sigma_1$ directly; $\|A\|_F=\sqrt{\sum\sigma_i^2}$ via the trace identity. $A^*A=V\Sigma^2V^*$ and $AA^*=U\Sigma^2U^*$ - so $V$'s columns are eigenvectors of $A^*A$, $U$'s of $AA^*$, both with eigenvalues $\sigma_i^2$ - flagged as numerically bad practice for actually *computing* the SVD, since squaring $A$ squares its condition number (a real, deliberate warning, not a passing aside, forward-linking to Part III's stability material).
### 3. Lectures 6, 7 — Projection and QR (no transcript for 9/24)
Thursday 9/24's transcript (Lectures 6-7, Projection and QR, per the printed schedule) does not exist anywhere in the source folder. This content was **not** invented from the schedule or textbook alone. It surfaced later instead: [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 6|Lecture 6]] (Projectors) was actually taught across the end of 2026-09-29 and start of 2026-10-01, folded into [[20_Progress/Degree/CSCI 5304/Weekly/Week - 4|Week - 4]] rather than here - genuinely out of its printed schedule slot, not a gap this note should paper over by guessing.
## Textbook integration
> [!IMPORTANT]
> Main chapter: [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 5|Lecture - 5]] (pp. 32-37).

The book adds the SVD-vs-eigendecomposition contrast with real application-level framing (p. 33: eigenvalues for iterated behavior like $A^k$, singular vectors for $A$ itself or its inverse) and Theorem 5.6 ($|\det A|=\prod\sigma_i$), neither emphasized live. The numerical-instability warning about $A^*A$/$AA^*$ *is* real lecture content, not textbook-only - both sources treat it as load-bearing, previewing Part III (Lectures 12-19).
## Takeaways (questions to resolve)
- [ ] Why is the existence proof structured inductively, rather than constructing all of $U,\Sigma,V$ at once?
- [ ] Derive precisely why squaring a matrix (forming $A^*A$) squares its condition number - asserted, not derived, in both lecture and book at this point.
- [ ] Fill in Theorem 5.8's full contradiction proof (the best-rank-$\nu$-approximation theorem) - deferred to [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 5|Lecture - 5]]'s own Open Questions since it's technically next week's lecture content taught a week early (2026-09-29).
- [ ] When does Lectures 6-7's Thu 9/24 slot content actually get caught up - track against [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 6|Lecture 6]] and [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 7|Lecture 7]]'s real landing dates.
## Lecture-to-textbook synthesis
==$A^*A=V\Sigma^2V^*$ and $AA^*=U\Sigma^2U^*$ turn every SVD fact about rank, range, and norms into an eigenvalue fact about two related symmetric matrices - but computing it that way is exactly the numerically unstable shortcut you should never actually take.==
*Mechanism:* the inductive existence proof produces $U,\Sigma,V$ directly; once they exist, substituting into $A^*A$ and $AA^*$ reveals the eigen-relationship as a corollary, not a separate construction.
- Lecture example/scenario: the live block-decomposition argument forcing $w=0$, reused identically from [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 2 & 3|Lecture - 2 & 3]]'s unitary length-preservation proof.
- Textbook connection: [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 5|Lecture - 5]]'s full theorem catalogue (5.1-5.6), citing real page numbers for the first time this course.
- Concept links: Singular Value Decomposition (candidate, not yet created).
> [!WARNING]
> Computing the SVD via $A^*A$/$AA^*$ eigenvectors is theoretically valid but numerically dangerous - squaring the matrix squares the condition number, roughly doubling the difficulty of an accurate answer.

> [!SUMMARY]
> This week proves what last week only stated: every matrix has an SVD, and once you have it, rank/range/null-space/norms are just bookkeeping on $\Sigma$.
## Flashcards
What is the very first step of the SVD's existence proof?::Define $\sigma_1$ as the matrix's own induced 2-norm, and find unit vectors $v_1,u_1$ achieving it, giving $Av_1=\sigma_1u_1$. #cards/5304
In the block decomposition $U_1^*AV_1=\begin{bmatrix}\sigma_1&w^*\\0&B\end{bmatrix}$, why must $w=0$?::Because $\|A\|_2=\|S\|_2=\sigma_1$ exactly, but the test vector $(\sigma_1,w)$ forces $\|S\|_2\geq(\sigma_1^2+w^*w)^{1/2}$, which can only stay $\leq\sigma_1$ if $w^*w=0$. #cards/5304
How is rank$(A)$ determined from its SVD?::Rank$(A)$ equals the number of nonzero singular values. #cards/5304
What is $\|A\|_F$ in terms of singular values, and what's the one-line derivation?::$\|A\|_F=\sqrt{\sum\sigma_i^2}$, from $\operatorname{tr}(A^*A)=\operatorname{tr}(V\Sigma^2V^*)=\operatorname{tr}(\Sigma^2)$. #cards/5304
Why is computing the SVD via eigenvectors of $A^*A$ or $AA^*$ numerically bad practice?::Forming $A^*A$ squares the matrix's condition number, roughly doubling the difficulty of getting an accurate numerical answer. #cards/5304
What happened to Thursday 9/24's scheduled Lectures 6-7 content, and why doesn't this week's note contain it?::No transcript exists for that date - the content wasn't invented from the schedule. Lecture 6 was actually taught later, across the end of 9/29 and start of 10/1, and is captured in Week - 4 instead. #cards/5304
