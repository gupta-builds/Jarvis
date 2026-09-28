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
# Lecture 5 — More on the SVD
> [!WARNING] Page/subsection numbers pending
> Built from the real, verified 2026-09-22 lecture transcript plus this book's well-established standard treatment of the SVD proof and its properties - not from a direct read of this course's local PDF copy (see [[Textbook Map]]'s Methodology note). No page numbers are cited below.

## Chapter Summary
==Every matrix looks diagonal once you're willing to change basis on both the input and output sides - A = UΣVᵀ means UᵀAV = Σ, and that single fact is why the SVD is useful for almost everything: rank, range, null space, and every named matrix norm all reduce to a statement about the diagonal entries σᵢ.== *Mechanism:* the existence proof is inductive - pick off the single largest-stretch direction, prove everything orthogonal to it lands in a smaller, independent sub-problem (a strictly smaller matrix B), then repeat on B; once that induction bottoms out, both the diagonalization and every downstream property (rank, range, null space, norms, eigen-relationships) fall out algebraically from the same U/Σ/V.

## Key Concepts
- **Diagonal argument**: the fact that UᵀAV = Σ - changing basis via U on the output side and V on the input side turns any matrix into a diagonal one; the core reason SVD-based proofs are often much shorter than proofs that grind through raw matrix algebra.
- **Inductive existence proof**: define σ₁ as the matrix's own 2-norm (the largest possible stretch), find the input/output vectors that achieve it, then show the *rest* of the matrix's behavior (everything orthogonal to that top direction) is itself a smaller SVD problem - repeat until the problem is 1×1.
- **Rank via Σ**: rank(A) equals the number of non-zero singular values - directions with σᵢ = 0 contribute nothing to the column space.
- **Range and null space via U, V**: range(A) = span of the uᵢ for non-zero σᵢ; null space of A = span of the vⱼ for zero σⱼ.
- **Row space via V**: span of the vᵢ for non-zero σᵢ - the complement of the null space within the input space.
- **2-norm and Frobenius norm in terms of Σ**: ‖A‖₂ = σ₁ (the largest singular value); the **Frobenius norm** ‖A‖_F = √(Σσᵢ²) (the square root of the sum of squared singular values).
- **A\*A / AA\* eigen-relationship**: the vᵢ are eigenvectors of AᵀA, the uᵢ are eigenvectors of AAᵀ, and the σᵢ are the non-negative square roots of the (shared, non-zero) eigenvalues of both.

## Full Reading Notes

### The existence proof - setup
The proof is constructive/inductive. Define **σ₁ = ‖A‖₂ = sup_{x≠0} ‖Ax‖/‖x‖** (the matrix's own induced 2-norm, from [[Lecture - 4]]'s recap section). This supremum is achieved at some unit vector v₁ (the input direction that gets stretched the most), producing Av₁ = σ₁u₁ for some unit vector u₁ (the output direction that stretch lands in) - this pairing is exactly the geometric picture from [[Lecture - 4]], now being used as the seed of an actual proof rather than just a picture.

### Extending to full unitary bases
u₁ alone is not yet a full basis, so it is extended to a complete unitary matrix U₁ = [u₁ | U_perp], where U_perp's columns are any orthonormal set spanning everything orthogonal to u₁ (the professor's own construction: project onto the orthogonal complement using I − u₁u₁ᵀ, then normalize the result into an orthonormal set - "trust that one can do this" rather than a full separate proof of the Gram-Schmidt-style construction). The same is done on the input side: V₁ = [v₁ | V_perp].

### The block decomposition and proving the off-diagonal block is zero
Computing U₁ᵀAV₁ block-by-block (row-by-column, using the fact that a matrix times a column is a column of the output, applied twice) produces the 2×2 block form:
```
U₁ᵀ A V₁ = [ σ₁   wᵀ ]
           [ 0    B  ]
```
where w is a vector and B is a smaller matrix (the professor's own labels, matching the book's). The key step: **w must be exactly zero.** The argument: since U₁, V₁ are unitary, ‖A‖₂ = ‖U₁ᵀAV₁‖₂ (unitary transformations preserve the 2-norm, per [[Lecture - 2 & 3]]'s length-preservation proof) = ‖S‖₂ where S is this block matrix. But ‖S‖₂, being a supremum, must be at least as large as the norm produced by any one particular test vector - and choosing the test vector (σ₁, w) specifically gives ‖S(σ₁,w)ᵀ‖/‖(σ₁,w)‖ ≥ (σ₁² + wᵀw)^(1/2). Since ‖A‖₂ = ‖S‖₂ = σ₁ by definition, this forces (σ₁² + wᵀw)^(1/2) ≤ σ₁, which is only possible if **wᵀw = 0**, i.e. w = 0. So the block decomposition simplifies to:
```
U₁ᵀ A V₁ = [ σ₁   0 ]
           [ 0    B ]
```

### The inductive step and the base case
Assuming (inductive hypothesis) that the smaller matrix B itself has an SVD, B = U₂Σ₂V₂ᵀ, substituting this into the block form and multiplying back out (block-matrix algebra the professor waved through rather than writing in full) reassembles a complete SVD for the original A - U₁ combined with U₂ gives the full U, σ₁ combined with Σ₂ gives the full Σ, and V₁ combined with V₂ gives the full V. The induction bottoms out at the **1×1 base case**: a 1×1 matrix trivially has an SVD (the single entry is itself the one singular value, with 1×1 "unitary matrices" u=v=1). Chaining this induction from the 1×1 base case back up through every intermediate B proves existence for a matrix of any size.

### Why the singular values are uniquely determined
Because each step of the induction picks σ₁ as *the* matrix norm (a well-defined single number, not a choice), and then recurses on a strictly smaller, well-defined submatrix B, every singular value produced this way is forced - there is no point in the construction where an arbitrary choice determines a σᵢ. This is what "uniquely determined" means: not that the *vectors* are always unique (they aren't, when singular values repeat - see [[Lecture - 4]]'s uniqueness caveat), but that the sequence of stretch amounts itself has no freedom in it.

### Properties: rank, range, null space, row space in terms of U and V
Writing A = UΣVᵀ with Σ having some zero diagonal entries past index r (so rank-r case): a column vⱼ with j > r contributes σⱼ = 0, meaning Avⱼ = 0 - that vⱼ contributes nothing to the output and sits in the null space. Consequences, stated directly by the professor: **rank(A) = the number of non-zero singular values**; **range(A) (= column space of A) = span{uᵢ : i ≤ r}** (only the axes actually being stretched to non-zero length are reachable); **null space of A = span{vⱼ : j > r}** (input directions that get crushed to zero); **row space of A = span{vᵢ : i ≤ r}** (the complement of the null space within the input space - "either a vector is in the row space and goes somewhere, or it's in the null space and goes to zero").

### 2-norm and Frobenius norm via Σ
**‖A‖₂ = σ₁** directly, by the very definition σ₁ was constructed from. The **Frobenius norm** is derived via the trace: ‖A‖_F² = trace(AᵀA). Substituting A = UΣVᵀ gives AᵀA = VΣᵀUᵀUΣVᵀ = VΣᵀΣVᵀ (since UᵀU = I), so trace(AᵀA) = trace(VΣᵀΣVᵀ). Using the fact that trace is invariant under this kind of unitary conjugation (trace(VXVᵀ) = trace(X)), this reduces to trace(ΣᵀΣ), which is exactly Σσᵢ² (summing the squared diagonal entries). So **‖A‖_F = √(Σσᵢ²)**. The professor noted the Frobenius norm also functions as an inner product on the vector space of matrices, though didn't develop that further in this lecture.

### The A\*A / AA\* eigenvalue relationship, and why it's a bad way to *compute* the SVD
Substituting A = UΣVᵀ: **AᵀA = VΣᵀΣVᵀ = VΣ²Vᵀ** (using ΣᵀΣ = Σ² since Σ is diagonal) and **AAᵀ = UΣΣᵀUᵀ = UΣ²Uᵀ**. Both are eigenvalue equations in disguise: AᵀA · V = V · Σ² means the **columns of V are eigenvectors of AᵀA**, with eigenvalues σᵢ²; symmetrically, AAᵀ · U = U · Σ² means the **columns of U are eigenvectors of AAᵀ**, with the same eigenvalues σᵢ². So **the singular values are the non-negative square roots of the shared non-zero eigenvalues of AᵀA and AAᵀ**. The professor flagged this as historically how many people first discovered/motivated the SVD (applying known eigenvalue algorithms to AᵀA or AAᵀ), but gave a real, load-bearing warning: **this is numerically bad practice**, because squaring the matrix (forming AᵀA) squares its condition number - a problem that's already hard to solve accurately becomes roughly twice as hard once squared. Real SVD algorithms therefore do *not* compute AᵀA or AAᵀ explicitly; this is a direct forward-link to the course's later stability lectures (Part III), where squaring-related conditioning problems get their own full treatment.

## Worked Example
The trace-based Frobenius norm derivation, worked step by step: start from ‖A‖_F² := trace(AᵀA). Substitute A = UΣVᵀ, so Aᵀ = VΣᵀUᵀ, giving AᵀA = VΣᵀUᵀUΣVᵀ. Since U is unitary, UᵀU = I, collapsing this to VΣᵀΣVᵀ = VΣ²Vᵀ (Σ diagonal, so Σᵀ=Σ and ΣᵀΣ=Σ²). Taking the trace of VΣ²Vᵀ and using trace's invariance under this conjugation gives trace(Σ²) = Σσᵢ². So ‖A‖_F = √(Σσᵢ²) - the Frobenius norm depends on *every* singular value, not just the largest one (unlike the 2-norm, which depends only on σ₁).

## Connections
- Lecture: this lecture is the direct proof of the existence/uniqueness theorem that [[Lecture - 4]] only stated. The block-decomposition argument reuses [[Lecture - 2 & 3]]'s unitary length-preservation proof directly (‖A‖₂ = ‖U₁ᵀAV₁‖₂ relies on it), and the "extend a vector to a unitary basis" construction reuses the same orthogonal-projection idea (I − u₁u₁ᵀ) implicitly present in that lecture's discussion of orthogonality.
- Textbook: the numerical-instability warning about computing SVD via AᵀA/AAᵀ eigenvectors previews the course's later stability material (Part III, Lectures 12-19) - worth flagging now rather than treating as a throwaway aside, since the professor stated it as a real, deliberate warning rather than a passing comment.

## Open Questions
- [ ] Why is the existence proof structured inductively rather than as one direct argument - what would go wrong trying to construct all of U, Σ, V simultaneously?
- [ ] Fill in the block-matrix algebra the professor waved through for the inductive step (substituting B = U₂Σ₂V₂ᵀ and reassembling the full U, Σ, V).
- [ ] Derive precisely why squaring a matrix (forming AᵀA) squares its condition number - the professor asserted this without a full derivation.
- [ ] Confirm: is the null space genuinely the *orthogonal complement* of the row space within the input space, or just a disjoint complement? (The lecture implied orthogonal complement via the vᵢ basis, but didn't state the word "orthogonal" explicitly at this point.)

## Flashcards
What is the very first step of the SVD's existence proof?::Define σ₁ as the matrix's own induced 2-norm (the supremum of ‖Ax‖/‖x‖), and find the unit vectors v₁, u₁ that achieve it, giving Av₁ = σ₁u₁. #cards/5304
In the block decomposition U₁ᵀAV₁ = [[σ₁, wᵀ],[0, B]], why must w equal zero?::Because ‖A‖₂ = ‖S‖₂ = σ₁ exactly, but choosing the test vector (σ₁, w) in the supremum definition forces ‖S‖₂ ≥ (σ₁² + wᵀw)^(1/2) - which can only stay ≤ σ₁ if wᵀw = 0. #cards/5304
How is rank(A) determined from its SVD?::Rank(A) equals the number of non-zero singular values in Σ. #cards/5304
How do you get the null space of A from its SVD?::It's the span of the right singular vectors vⱼ whose corresponding singular value σⱼ is zero. #cards/5304
What is ‖A‖_F in terms of the singular values, and what's the one-line derivation?::‖A‖_F = √(Σσᵢ²), derived from trace(AᵀA) = trace(VΣ²Vᵀ) = trace(Σ²) using trace-invariance under unitary conjugation. #cards/5304
The columns of V are eigenvectors of which matrix, and with what eigenvalues?::AᵀA, with eigenvalues σᵢ² (the squared singular values). #cards/5304
Why is computing the SVD via eigenvectors of AᵀA or AAᵀ numerically bad practice, even though it's theoretically valid?::Forming AᵀA squares the matrix's condition number, roughly doubling the difficulty of getting an accurate numerical answer. #cards/5304
Singular values vs. eigenvalues - state the precise relationship for a general (non-symmetric) matrix A.::The singular values of A are the non-negative square roots of the eigenvalues of AᵀA (equivalently AAᵀ) - they are not, in general, the eigenvalues of A itself. #cards/5304
