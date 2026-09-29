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
# Lecture 2 & 3 — Orthogonal Vectors and Matrices; Norms
> [!WARNING] Page/subsection numbers pending
> This note is built from the real, verified 2026-09-15 lecture transcript plus this book's well-established standard treatment of orthogonality and norms - not from a direct read of this course's local PDF copy (see [[Textbook Map]]'s Methodology note for why). No page numbers are cited below. Once the Notebook prompt runs, fold its real page/subsection numbers in here rather than guessing them.

## Chapter Summary
==A matrix is unitary exactly when its columns are an orthonormal set, and multiplying by a unitary matrix never changes length or angle - it only rotates or reflects.== *Mechanism:* the inner product x*y is the algebraic quantity behind both length (‖x‖² = x*x) and angle (cos θ = x*y / ‖x‖‖y‖); a unitary Q satisfies Q*Q = I, so (Qx)*(Qy) = x*Q*Qy = x*y exactly - the inner product, and therefore every length and angle built from it, survives the transformation untouched.

## Key Concepts
- **Adjoint (x\*)**: the conjugate transpose in general, but the professor's own framing for this course - which stays in real numbers throughout - collapses this to the ordinary **transpose**; read "adjoint" as "transpose" everywhere in this book unless working with genuinely complex matrices.
- **Inner product (x\*y)**: for real vectors, the sum Σxᵢyᵢ; it is simultaneously an algebraic quantity and, geometrically, a length-and-angle measurement.
- **Length (‖x‖)**: defined via the inner product as √(x\*x) - the Pythagorean-theorem sum of squares with the square root taken (no separate definition needed once the inner product exists).
- **Orthogonality**: two vectors x, y are orthogonal exactly when x\*y = 0, i.e. when the angle between them is 90°.
- **Unitary matrix (Q)**: a square matrix whose columns are unit-length and mutually orthogonal, equivalently Q\*Q = I. The real-matrix name for the same object is **orthogonal matrix**.
- **Norm**: a real-valued function on a vector space satisfying positivity (‖x‖ ≥ 0, with equality only at x = 0), the triangle inequality (‖x+y‖ ≤ ‖x‖+‖y‖), and absolute homogeneity (‖αx‖ = |α|‖x‖). "The norm" without qualification means the 2-norm/Euclidean norm.
- **p-norm**: ‖x‖ₚ = (Σ|xᵢ|ᵖ)^(1/p), generalizing the 1-norm (p=1), 2-norm (p=2), and, in the limit p→∞, the **∞-norm** (the max of |xᵢ|).
- **Weighted norm**: ‖x‖_W = ‖Wx‖ for some full-rank weight matrix W - measures length with respect to a different, possibly skewed, basis; if W is orthogonal the weighted norm equals the plain norm, so weighted norms only matter when W is *not* orthogonal.
- **Unit ball**: the shape traced by {x : ‖x‖ = 1} under a given norm - a circle for the 2-norm, a diamond for the 1-norm, a square for the ∞-norm; the p-norm's unit ball interpolates between these, widening toward a square as p → ∞.

## Full Reading Notes

### Recap of Lecture 1's column interpretation
The professor opened by re-deriving Lecture 1's central fact with a concrete numeric example, to set up why orthogonality/norms matter: for Ax = b, b is literally an expansion of itself in terms of A's columns, with the entries of x as the weights. Worked live: A = [[1,2],[2,1]], x = (3,1). The professor's first arithmetic pass was wrong (said 3+2=6), self-corrected on the board to the real result **b = (5,7)** - a genuine live-classroom error, kept here rather than silently smoothed over, since checking a linear-combination claim by hand is exactly the kind of self-verification habit the professor was modeling. The same b can also be written in the *standard basis* as 5·e₁ + 7·e₂, giving two representations of the same vector - one in A's columns, one in the identity's columns - and multiplying by A or A⁻¹ is precisely what converts between the two representations. This is the conceptual bridge into Lecture 2: many of the course's later algorithms (similarity transformations, orthogonal transformations, factorizations) are exactly this idea generalized - changing representation to reveal something (a triangular form, eigenvalues, singular values) that was hidden in the standard basis.

### Adjoint, transpose, and the inner product
The book's own notation writes the adjoint of A as A*; for complex matrices this is the conjugate transpose, but the professor was explicit that this course avoids complex arithmetic almost entirely (the course reasons: symmetric/Hermitian matrices, which dominate the semester, have real eigenvalues, so complex numbers rarely surface) - so **read A\* as Aᵀ throughout**. The inner product in this notation is x\*y = Σxᵢyᵢ. For a complex vector, x\*x automatically produces a real, non-negative number because each term becomes xᵢ times its own conjugate - the professor's point in raising this was that inner-product machinery is built specifically so lengths stay real-valued even when the underlying field is complex; in the real case this subtlety simply doesn't arise.

### The geometric meaning of the inner product (law of cosines)
Starting from a triangle with sides x, y, and y−x, the professor derived the geometric fact behind the inner product via the law of cosines: expanding ‖y−x‖² and comparing to the law of cosines' cos(θ) term shows that **x\*y = ‖x‖‖y‖cos θ**, where θ is the angle between x and y. Consequences drawn directly from this: if x and y are unit vectors, x\*y literally *is* cos θ; x\*y = 0 exactly at θ = 90° (orthogonality); x\*y > 0 when the vectors point in "similar" directions (θ < 90°) and x\*y < 0 when they point in "opposing" directions (θ > 90°). The professor tied this explicitly to machine learning practice: nearest-neighbor-style algorithms that compare vectors via inner products or cosine similarity are measuring exactly this angular closeness, not just raw distance.

### Orthogonality and unitary (orthogonal) matrices
A matrix Q is unitary when Q\*Q = I. Interpreting Q by its columns q₁,...,qₙ, the product Q\*Q written out column-by-column gives qᵢ\*qᵢ = 1 for every i (each column is unit length) and qᵢ\*qⱼ = 0 for i ≠ j (every pair of distinct columns is orthogonal) - so "unitary matrix" is exactly the algebraic statement "the columns form an orthonormal set." Geometrically, a unitary matrix can only rotate and/or reflect - it cannot stretch or skew, because every one of its columns already has length exactly 1 and all columns stay mutually perpendicular. Historical/terminology note straight from the professor: some books call these "orthogonal matrices" (the real-matrix case) and reserve "unitary" for the complex case, but usage varies across sources - both terms appear for the same real-matrix object.

### Proof: unitary transformations preserve length and preserve angle
*Length:* for any x, ‖Qx‖² = (Qx)\*(Qx) = x\*Q\*Qx = x\*x = ‖x‖² (using Q\*Q = I), so ‖Qx‖ = ‖x‖ exactly - multiplying by Q never changes a vector's length.
*Angle:* for any x, y, (Qx)\*(Qy) = x\*Q\*Qy = x\*y (same substitution), so the inner product - and therefore the angle, per the law-of-cosines relationship above - is identical before and after multiplying by Q.
*A caveat the professor flagged live and was not fully certain about*: both proofs go through cleanly when Q is a full m×m unitary matrix; if Q is not square (only some of its columns are given, i.e. it's a partial/rectangular orthonormal set), angle-preservation may fail for vectors outside the span of Q's columns, because the transformation effectively projects rather than only rotates. Treat this as a flagged open point, not a fully resolved result, since the professor themselves said "I'm not super certain on that result right now."
*Uniqueness note connecting back to Lecture 1's full-rank argument*: an orthogonal set of vectors is automatically linearly independent (mutually perpendicular vectors can't be combined to cancel out), so a unitary matrix Q is automatically full rank - Lecture 1's full-rank ⟺ one-to-one theorem therefore applies directly to every unitary matrix.

### Norm axioms and the vector p-norms
A norm must satisfy: (1) positivity - the norm is non-negative and equals zero if and only if the vector itself is zero; (2) the triangle inequality - ‖x+y‖ ≤ ‖x‖+‖y‖; (3) absolute homogeneity - scaling the vector by α scales the norm by |α|. Named examples, all satisfying these three rules: the **1-norm** ‖x‖₁ = Σ|xᵢ| (sum of absolute values); the **2-norm** ‖x‖₂ = √(Σxᵢ²) (the familiar Euclidean length, the "norm" people mean by default); the **∞-norm** ‖x‖_∞ = maxᵢ|xᵢ| (the largest single component in absolute value) - derived intuitively as the limit of the p-norm as p → ∞, since raising every component to an increasingly large power makes the largest one dominate the sum, and the 1/p-th root then collapses back to just that largest term. The general **p-norm** ‖x‖ₚ = (Σ|xᵢ|ᵖ)^(1/p) unifies all three as special/limiting cases. The professor noted that in practice almost nobody uses p-norms besides p = 1, 2, and ∞.

### Weighted norms and unit-ball geometry
A **weighted norm** plugs a full-rank weight matrix W into the definition: ‖x‖_W = ‖Wx‖, measuring length with respect to a differently-scaled or differently-oriented basis. If W happens to be orthogonal, the weighted norm equals the ordinary norm (orthogonal transformations preserve length, per the proof above) - so weighted norms are only interesting when W is *not* orthogonal. Geometrically, applying a non-orthogonal W to the 2-norm's unit circle produces an **ellipse** rather than a circle - this is the direct forward-link to Lecture 4's SVD picture, where the hyperellipse produced by a general matrix A is exactly this same weighted-norm/weighted-unit-ball idea taken to its full generality. Comparing unit-ball shapes across norms: the 1-norm's unit ball is a diamond (the four points (±1,0) and (0,±1) connected by straight edges, since the sum of absolute values is held constant); the 2-norm's is the familiar circle; the ∞-norm's is a square (since only the *largest* coordinate is constrained, both coordinates can simultaneously sit at their max). *A real classroom imprecision, kept rather than silently corrected*: the professor described the ∞-norm informally as "the Manhattan distance of sorts," but hedged immediately ("I think... it's related to that"). Standard terminology actually ties **Manhattan/city-block distance** to the **1-norm** (moving along grid lines, summing absolute displacements), while the ∞-norm corresponds to **Chebyshev/chessboard distance** (a king's single-move cost, dominated by the largest single-axis displacement) - worth knowing precisely for an exam even though the lecture's own phrasing blurred the two.

## Worked Example
Take the unitary-matrix length/angle preservation proof itself as the worked example, since it is the section's real payoff: given any unitary Q and any vectors x, y, ‖Qx‖ = ‖x‖ and the angle between Qx and Qy equals the angle between x and y, both following from the single algebraic fact Q\*Q = I substituted into the inner-product definitions of length and angle. This is why the professor calls unitary matrices "just rotations and flips" - they are precisely the transformations that leave every length and every angle exactly where it started.

## Connections
- Lecture: the 2026-09-15 session taught Lecture 2 (orthogonality) in full and started Lecture 3 (norms) through vector p-norms and weighted norms - it explicitly ran out of time before covering **induced/operator matrix norms**, which the professor picked back up at the start of the next class (2026-09-17). That recap-and-continuation is captured in [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 4]] rather than here, matching where it was actually taught.
- Textbook: (pending a Notebook pass - see the Methodology warning above).

## Open Questions
- [ ] Resolve the professor's own flagged uncertainty: does angle-preservation under Q hold for *every* pair of vectors when Q is a non-square (rectangular) orthonormal matrix, or only for vectors inside its column span?
- [ ] Work through why an orthogonal set of vectors is automatically linearly independent - state the short proof, not just the claim.
- [ ] Sketch the unit ball for a p-norm with, say, p = 4, and confirm it sits strictly between the 2-norm's circle and the ∞-norm's square.
- [ ] Precisely distinguish Manhattan/city-block distance (1-norm) from Chebyshev/chessboard distance (∞-norm) - the lecture's own phrasing blurred these.

## Flashcards
What does it mean for a matrix Q to be unitary?::Q\*Q = I - equivalently, Q's columns form an orthonormal set (unit length, mutually orthogonal). #cards/5304
Why does multiplying by a unitary matrix preserve vector length?::Because ‖Qx‖² = x\*Q\*Qx = x\*x = ‖x‖², using Q\*Q = I. #cards/5304
What is the geometric meaning of x\*y = 0?::The vectors x and y are orthogonal - the angle between them is 90°. #cards/5304
How is the ∞-norm defined, and why does it emerge as p → ∞ in the p-norm family?::‖x‖_∞ = maxᵢ|xᵢ|; as p grows, raising each component to a large power makes the largest one dominate the sum, and the 1/p-th root collapses the result back down to just that largest term. #cards/5304
What shape is the unit ball for the 1-norm, and why?::A diamond - because the sum of absolute values (not any single coordinate) is held fixed at 1, so trading magnitude between coordinates traces straight edges between the axis points. #cards/5304
When does a weighted norm ‖x‖_W = ‖Wx‖ reduce to the ordinary norm?::Exactly when W is orthogonal, since orthogonal transformations preserve length. #cards/5304
Manhattan distance vs. Chebyshev distance - which norm is which?::Manhattan/city-block distance is the 1-norm (sum of absolute per-axis displacements); Chebyshev/chessboard distance is the ∞-norm (the single largest per-axis displacement). #cards/5304
Why does the professor say to read "adjoint" as "transpose" in this course?::Because A\* is the conjugate transpose in general, but this course stays in real numbers almost entirely, where conjugation does nothing - so A\* and Aᵀ coincide. #cards/5304
