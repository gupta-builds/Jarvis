---
type: class
input_kind: textbook
status: sprout
created: 2026-09-08
updated: 2026-09-28
area:
  - "[[CSCI 5304 Board]]"
tags:
  - "#class"
  - "#Textbook"
next: "Run the Notebook prompts in [[20_Progress/Degree/CSCI 5304/Weekly/Week - 2 & 3 (Prompts)|Week - 2 & 3 (Prompts)]] to get Notebook's own page/subsection citations for Lectures 2-5, then fold them into the three landed Lecture notes"
---
# CSCI 5304 — Textbook Map
==Trefethen & Bau call their own chapters "Lectures," and this course's lecture numbering reuses that numbering directly - Lecture 24 in the schedule is Lecture 24 in the book, not a coincidence.== The course covers **Parts I-V (Lectures 1-31)** only, in that exact order, with no gaps and no reordering - every single Lecture the book has in that range gets a scheduled day (confirmed by lining up every schedule row below against the book's real 31-lecture structure; zero lectures were skipped or reordered). The one lecture the course explicitly skips is **Lecture 9, MATLAB** - the schedule jumps Lecture 8 (Tue, Week 4) straight to Lecture 10 (Thu, Week 4) because this course uses Python/numpy instead, per [[CSCI 5304 Board]]'s Environment Setup section.

## Methodology and a real limitation, logged 2026-09-28
This map's Lecture titles come from Trefethen & Bau's own well-established, unchanged-across-editions table of contents (confirmed internally-consistent by cross-checking every title below against the real schedule table pulled from Canvas - `.firecrawl/schedule.md` in the source folder - which names most lectures explicitly, e.g. "Lecture 4 Singular Value Decomposition," "Lecture 23 Cholesky Factorization"). **What this map does NOT have**: page numbers or exact subsection numbering pulled from this course's actual local PDF copy. Three local extraction attempts failed on `Textbook & Resources/CSCI 5304 Textbook.pdf` - the Read tool's page-render (no `pdftoppm`/poppler-render available in this environment) and two `pdftotext` passes (`-layout` and `-raw`), both of which returned corrupted glyph garbage rather than real text, meaning this specific PDF's embedded fonts lack a usable character encoding for local tools. Gemini Notebook does not have this problem - it reads the PDF directly - so exact page/subsection citations should come from running the Notebook prompts in [[20_Progress/Degree/CSCI 5304/Weekly/Week - 2 & 3 (Prompts)|Week - 2 & 3 (Prompts)]], not from this map or from asking a chat model to recall them from general knowledge.

## Part I: Fundamentals (Lectures 1-5)
- **Lecture 1 - Matrix "Action"** - Thu 9/10, Week 1. Matrix-vector multiplication as linear combination of columns; range/rank; full-rank ⟺ one-to-one; constructive existence proof of the matrix inverse. Real transcript exists (`Lecture/Transcripts/Week 2 & 3/en-CSCI 5304 September 10 Lecture (multi-source).txt`) but no chapter note or weekly note is being built for it yet - Week 1 is being skipped per direct instruction (nothing else was captured for that week).
- **Lecture 2 - Orthogonal Vectors and Matrices** - Tue 9/15, Week 2 (taught combined with Lecture 3). Inner products, the law-of-cosines angle derivation, orthogonality, unitary/orthogonal matrices, length/angle preservation. **Landed:** [[Lecture - 2 & 3]].
- **Lecture 3 - Norms** - Tue 9/15, Week 2 (same session as Lecture 2). Norm axioms, 1-/2-/∞-/p-norms, unit-ball shapes, weighted norms; the course's own lecture ran out of time before induced/operator matrix norms, which spilled into the next class - **Landed:** [[Lecture - 2 & 3]] (vector-norm portion only; induced norms are captured in [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 4]]'s recap section instead, matching where the professor actually covered them).
- **Lecture 4 - The Singular Value Decomposition** - Thu 9/17, Week 2. Motivation (PCA/eigenfaces/low-rank approximation), the induced/operator matrix norm proof carried over from Lecture 3, the geometric hyperellipse picture, formal U/Σ/V definitions, existence/uniqueness theorem statement (proof deferred). **Landed:** [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 4]].
- **Lecture 5 - More on the SVD** - Tue 9/22, Week 3. Full inductive existence proof, the diagonal argument, rank/range/null-space/row-space via U and V, 2-norm and Frobenius norm in terms of singular values, the A^TA/AA^T eigenvector relationship and the real warning that computing SVD that way is numerically bad practice. **Landed:** [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 5]].

## Part II: QR Factorization and Least Squares (Lectures 6-11)
- **Lecture 6 - Projectors** - Thu 9/24, Week 3 (paired with Lecture 7). No transcript exists yet as of 2026-09-28.
- **Lecture 7 - QR Factorization** - taught across Thu 9/24 (Week 3, with Lecture 6) and Tue 9/29/10/1 (Week 4, revisited with Lecture 8 per the schedule's "Lectures 7,8: QR and Gram-Schmidt" row) - the schedule itself treats Lecture 7 as spanning two sessions, not a one-day topic. No transcript exists yet.
- **Lecture 8 - Gram-Schmidt Orthogonalization** - Tue, Week 4. No transcript yet.
- *(Lecture 9, MATLAB, intentionally skipped - see note above.)*
- **Lecture 10 - Householder Triangularization** - Thu, Week 4 (Quiz #2 day per schedule). No transcript yet.
- **Lecture 11 - Least-Squares Problems** - Tue, Week 5. No transcript yet.

## Part III: Conditioning and Stability (Lectures 12-19)
- **Lecture 12 - Conditioning and Condition Numbers** - Thu, Week 5.
- **Lecture 13 - Floating Point Arithmetic** - Tue, Week 6 (paired with Lecture 14 per schedule).
- **Lecture 14 - Stability** - Tue, Week 6 (same session as Lecture 13).
- **Lecture 15 - More on Stability** - Thu, Week 6 (Quiz #3 day).
- **Lecture 16 - Stability of Householder Triangularization** - Tue, Week 7.
- **Lecture 17 - Stability of Back Substitution** - Tue, Week 8.
- **Lecture 18 - Conditioning of Least Squares Problems** - Thu, Week 8.
- **Lecture 19 - Stability of Least Squares Algorithms** - Tue, Week 9.
*(None of Lectures 12-19 have transcripts yet - too far ahead of 2026-09-28's real class progress.)*

## Part IV: Systems of Equations (Lectures 20-23)
- **Lecture 20 - Gaussian Elimination** - Thu, Week 9 (Quiz #4 day).
- **Lecture 21 - Pivoting** - Tue, Week 10 (paired with Lecture 22 per schedule's "Lectures 21,22: Pivoting & Stability of GE" row).
- **Lecture 22 - Stability of Gaussian Elimination** - Tue, Week 10 (same session as Lecture 21).
- **Lecture 23 - Cholesky Factorization** - Thu, Week 10.

## Part V: Eigenvalues (Lectures 24-31)
- **Lecture 24 - Eigenvalue Problems** - Tue, Week 11.
- **Lecture 25 - Overview of Eigenvalue Algorithms** - Thu, Week 11 (Quiz #5 day).
- **Lecture 26 - Reduction to Hessenberg or Tridiagonal Form** - Tue, Week 12.
- **Lecture 27 - Rayleigh Quotient, Inverse Iteration** - Tue, Week 13.
- **Lecture 28 - QR Algorithm without Shifts (Pure QR)** - Thu, Week 13 (lands on actual UMN Thanksgiving per the Board's schedule-anomaly warning).
- **Lecture 29 - QR Algorithm with Shifts** - Tue, Week 14.
- **Lecture 30 - Other Eigenvalue Algorithms** - Thu, Week 14 (Quiz #6 day).
- **Lecture 31 - Computing the SVD** - Tue, Week 15 (the book's own return to the SVD, now with a real algorithm - the natural closing bookend to Lecture 4/5's existence-only treatment).
*(None of Lectures 24-31 have transcripts yet.)*

## Standard
Each Lecture note, once created, follows [[Textbook Template]] at the depth set by [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|CSCI 4061's Chapter - 1]] - full subsection-by-subsection reading notes, every named concept bolded and defined, a worked example, a connection back to the matching week, and flashcards. Filed as `Lecture - N.md` (or `Lecture - N & M.md` when two lectures were taught in one session), never `Chapter - N.md`, matching the book's own terminology.

## Status
Three Lecture notes landed as of 2026-09-28 - [[Lecture - 2 & 3]], [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 4]], [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 5]] - built from the real, verified lecture transcripts plus this book's well-established standard treatment of orthogonality/norms/SVD, pending a Notebook pass for exact page citations (see Methodology above). Lecture 1 is intentionally not landed (Week 1 skipped). Lectures 6-31 have no transcript yet and are not started - each gets landed only once that lecture is actually covered in class, per [[Weekly Standard]], using the same manifest-then-prompts pattern as [[20_Progress/Degree/CSCI 5304/Weekly/Week - 2 & 3 (Prompts)|Week - 2 & 3 (Prompts)]].
