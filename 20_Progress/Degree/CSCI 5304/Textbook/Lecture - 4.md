---
type: class
input_kind: book
status: sprout
created: 2026-09-28
updated: 2026-09-28
area:
  - "[[CSCI 5304 Board]]"
tags:
  - "#class"
  - "#Textbook"
next: "Run this Lecture through the Gemini Notebook prompt in [[20_Progress/Degree/CSCI 5304/Weekly/Week - 2 & 3 (Prompts)|Week - 2 & 3 (Prompts)]] to add real page/subsection citations from the actual PDF"
---
# Lecture 4 — The Singular Value Decomposition
> [!WARNING] Page/subsection numbers pending
> Built from the real, verified 2026-09-17 lecture transcript plus this book's well-established standard treatment of the SVD - not from a direct read of this course's local PDF copy (see [[Textbook Map]]'s Methodology note). No page numbers are cited below.

## Chapter Summary
==Every matrix, with no restriction whatsoever on shape, rank, or determinant, can be written as A = UΣVᵀ, where U and V are unitary and Σ is diagonal and non-negative - the single most useful fact in the book.== *Mechanism:* geometrically, the unit ball under any matrix's action becomes a hyperellipse; U's columns are the directions of that hyperellipse's axes, Σ's entries are how much each axis got stretched, and V's columns are the original, pre-image directions that map onto those axes - so the SVD is simply the algebraic bookkeeping for "which input directions get stretched, by how much, and into which output directions."

## Key Concepts
- **Hyperellipse**: the image of the unit ball (sphere) under the action of an m×n matrix - an n-dimensional "stretched sphere," the general shape that any matrix's action produces.
- **Left singular vectors (uᵢ)**: the columns of U; geometrically, the principal axis directions of the output hyperellipse.
- **Right singular vectors (vᵢ)**: the columns of V; the pre-image directions - the input directions that map onto the uᵢ axes.
- **Singular values (σᵢ)**: the diagonal entries of Σ, conventionally ordered σ₁ ≥ σ₂ ≥ ... ≥ 0; the length of each principal axis, i.e. how much that direction got stretched.
- **Pre-image relationship**: Avᵢ = σᵢuᵢ - each right singular vector, hit by A, produces exactly the scaled left singular vector.
- **Existence/uniqueness theorem** (stated, not yet proved in this lecture - the proof is [[Lecture - 5]]'s content): every matrix has an SVD, with no restriction on shape, rank, or field; the singular values are always uniquely determined; if the matrix is square and no two singular values repeat, U and V are unique as well.
- **Induced/operator matrix norm**: the matrix-level analogue of a vector norm, defined as ‖A‖ = sup(‖Ax‖/‖x‖) over all nonzero x (equivalently, the supremum of ‖Ax‖ over the unit ball ‖x‖=1) - "how big can the matrix make something get, relative to how big it started."

## Full Reading Notes

### Recap and completion: induced matrix norms (carried over from Lecture 3)
The 2026-09-17 session opened by finishing Lecture 3's unfinished business (see [[Lecture - 2 & 3]]'s Connections section) rather than starting fresh - **induced (operator) matrix norms**. The definition: ‖A‖ = sup_{x≠0} ‖Ax‖/‖x‖, equivalently the supremum of ‖Ax‖ restricted to the unit ball ‖x‖=1. The professor worked a full proof, algebraically, that **the matrix 1-norm equals the max absolute column sum**: writing Ax as Σxᵢaᵢ (columns aᵢ weighted by xᵢ, per Lecture 1's column interpretation), applying the triangle inequality and absolute-homogeneity norm properties reduces ‖Ax‖₁/‖x‖₁ to a sum bounded above by max_i‖aᵢ‖₁ (factoring every term up to the largest column norm), and then showing that bound is *achieved* by picking x = eⱼ where aⱼ is the column with the largest norm - a standard basis vector picks off exactly that one column. The professor explicitly flagged, but did not have time to prove in class, the parallel result that **the matrix ∞-norm equals the max absolute row sum** - noted here as a real, stated-but-unproven gap, not something to treat as already covered.

### Why the SVD matters (motivation)
The professor gave three concrete reasons the SVD is "the most important thing in the whole course, maybe in linear algebra": (1) it is simultaneously a theoretical and a computational tool used throughout the rest of the book; (2) it was independently rediscovered by roughly five different people working on unrelated problems, and keeps getting rediscovered in new applications; (3) real named applications: **eigenfaces** (early facial-recognition work - an SVD of a matrix of face images, where the resulting singular vectors turn out to be good predictors of face shape/orientation), **PCA (principal component analysis)** - described explicitly as "effectively just a singular value decomposition" - and **low-rank approximation** for compressing images, video, and audio (put the data into a matrix, compute the SVD, truncate at some rank, store only the truncated pieces). The professor also noted, as a personal research aside, that proving the SVD's existence/uniqueness rigorously is subtler than it first appears - something they had "taken for granted" as intuitive before working through it carefully.

### The geometric picture
For any m×n matrix A, the image of the unit ball (‖x‖₂=1, an n-dimensional sphere) under A's action is a **hyperellipse** - an n-dimensional "stretched sphere," like a loaf of bread or a football rather than a perfect ball. The hyperellipse has principal axis directions, called u₁, u₂, ... (the **left singular vectors**), each with a length σᵢ (the **singular values**), ordered so σ₁ is the longest axis. These axis directions must come from *somewhere* on the original unit sphere - the input directions that map onto them are called v₁, v₂, ... (the **right singular vectors**), satisfying **Avᵢ = σᵢuᵢ** for each i. If A is rank-deficient, some axes of the hyperellipse collapse to zero length - the hyperellipse's true dimension equals rank(A), not the full ambient dimension.

### Formal definitions
Given A of size m×n, writing A = UΣVᵀ: **U** is m×m and unitary, with columns u₁,...,u_m (the left singular vectors, the principal-axis directions, spanning the output/column space). **Σ** is m×n, diagonal in its upper n×n block (zero everywhere else if m≠n), with non-negative diagonal entries σ₁ ≥ σ₂ ≥ ... ≥ σ_n ≥ 0. **V** is n×n and unitary, with columns v₁,...,v_n (the right singular vectors, the pre-image directions, spanning the input/row space). The professor was explicit that this decomposition can always be written with singular values in descending order - this is a convention, not an accident, and it's what makes "σ₁" mean "the biggest stretch" unambiguously.

### Contrast with eigenvalue decomposition
The professor drew a direct, load-bearing contrast: eigenvalue decomposition (Ax = λx, or AX = XΛ for a full set of eigenvectors) requires the matrix to be **square**, and even then requires **m linearly independent eigenvectors** to exist - a condition that can fail (a "defective" matrix). Eigenvalues themselves can be complex, and are only even defined for square matrices - they say nothing about how to treat a generic rectangular dataset (e.g. a matrix of many tall/long feature vectors). **The SVD has none of these restrictions**: every matrix, square or rectangular, full-rank or not, real or complex, has an SVD, and the singular values are always real and non-negative (they are literally lengths of line segments to the edge of a sphere/hyperellipse, so negativity or complexity is geometrically meaningless for them). This unrestricted existence is precisely why the SVD generalizes past where eigenvalue decomposition simply doesn't apply.

### The existence/uniqueness theorem (stated, proof deferred to Lecture 5)
Three parts, stated by the professor but explicitly **not yet proved** in this lecture (the proof is next class's content, captured in [[Lecture - 5]]): (1) **every matrix has an SVD** - no restriction on shape, rank, determinant, or linear independence of columns; (2) **the singular values are uniquely determined** - not a mystery which one is "the" σ₁, even though computing them exactly in finite precision has its own separate challenges; (3) **if the matrix is square and no two singular values are equal (σᵢ ≠ σⱼ for all i≠j), then U and V are unique too.** The professor flagged explicitly that when singular values *do* repeat, or are theoretically distinct but numerically extremely close, the corresponding singular vectors become non-unique (any orthonormal basis of the tied subspace works equally well) or numerically unstable to compute (algorithms can "flip-flop" between which vector they call which) - a real forward-link to later stability lectures.

## Worked Example
The book's/professor's own geometric picture, made concrete: think of the unit sphere as a ball of dough. Applying A stretches it into a loaf of bread - the direction the loaf is longest in is u₁, its length is σ₁, and the original direction of dough that ended up stretched into that longest axis is v₁ (so Av₁ = σ₁u₁ exactly). Because computing this norm-maximizing direction is precisely the induced 2-norm supremum from the recap section, ‖A‖₂ = σ₁ falls directly out of this picture - the "biggest stretch" *is* the matrix's own 2-norm, and it's realized exactly at input direction v₁.

## Connections
- Lecture: this lecture's real motivating applications were PCA, eigenfaces, and low-rank approximation for storage compression - all real, named, and worth remembering as concrete "why do I care" anchors. The existence/uniqueness theorem was explicitly *stated only* - its proof was deferred to the next class session, so do not treat this note as covering a proof it doesn't contain.
- Textbook: connects back to [[Lecture - 2 & 3]] both through the induced-norm recap (this lecture completes Lecture 3's unfinished matrix-norm material) and through the weighted-norm/ellipse picture (Lecture 3's weighted-norm unit ball becoming an ellipse under a non-orthogonal W is the exact same geometric idea as this lecture's hyperellipse, generalized). Also connects back to Lecture 1's full-rank ⟺ one-to-one result, which the professor flagged as the reason singular vectors' pre-images are well-defined when the matrix has full rank.

## Open Questions
- [ ] Why does the existence/uniqueness theorem matter practically if we don't yet know *how* to compute U, Σ, V? (Answer should come from Lecture 5's proof.)
- [ ] Work out the deferred proof that the matrix ∞-norm equals the max absolute row sum, by analogy with the 1-norm/max-column-sum proof given in class.
- [ ] What breaks, geometrically, when two singular values are exactly equal? (Hint: the hyperellipse has a circular cross-section in that subspace.)
- [ ] Why are singular values always real and non-negative even for a matrix with complex or negative entries, when eigenvalues of the same matrix might not be?

## Flashcards
What three things does a matrix's SVD, A = UΣVᵀ, always guarantee that an eigendecomposition does not?::It always exists (no restriction on shape/rank/field), its singular values are always real and non-negative, and it requires no linear-independence condition on any set of vectors. #cards/5304
What is the geometric relationship Avᵢ = σᵢuᵢ actually saying?::The right singular vector vᵢ, an input direction on the unit sphere, maps under A to the left singular vector uᵢ scaled by σᵢ - vᵢ is the pre-image of the i-th stretched axis. #cards/5304
Why is PCA described as "effectively just a singular value decomposition"?::Because PCA finds the directions of greatest variance in data by computing singular vectors of the (mean-centered) data matrix - the same axis-finding mechanism the SVD provides generally. #cards/5304
What does the induced matrix 1-norm equal, and how is that proved?::The max absolute column sum; proved by writing Ax as a weighted sum of A's columns, bounding it above using the triangle inequality and factoring out the largest column norm, then showing a standard basis vector achieves that bound exactly. #cards/5304
Under what condition are U and V in a square matrix's SVD unique?::Only when no two singular values are equal (σᵢ ≠ σⱼ for all i ≠ j); repeated singular values make the corresponding singular vectors non-unique. #cards/5304
What happens to the hyperellipse when the matrix A is rank-deficient?::Some of its axes collapse to zero length - the hyperellipse's true dimension equals rank(A) rather than the full ambient output dimension. #cards/5304
