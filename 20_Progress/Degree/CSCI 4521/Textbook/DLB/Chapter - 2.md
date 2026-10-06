---
type: class
input_kind: book
status: sprout
created: 2026-10-05
updated: 2026-10-05
area:
  - "[[CSCI 4521 Board]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/Textbook Map|Textbook Map]]"
tags:
  - "#class"
  - "#Textbook"
next: "Verify DLB §2.1–§2.8 against the local PDF in a text-accessible reader, then use the matrix examples while reviewing Week 1 data representations."
---
# DLB Chapter 2 — Linear Algebra (§2.1–§2.8)
## Chapter Summary
==Linear algebra represents data and transformations with arrays, then uses products, norms, and decompositions to state what a model computes and how that computation changes space.==
*Mechanism:* scalars, vectors, matrices, and tensors carry values with explicit shapes; multiplication composes compatible transformations; span and rank determine which targets a system can reach; and eigendecomposition or SVD exposes preferred directions and scaling. Matrix inverses are useful algebraically but should not be treated as the default numerical procedure. The existing source-grounded material was consolidated; direct PDF text verification remains open in this environment.
## Key Concepts
### §2.1–§2.3 Arrays, products, and linear systems
- **Vector, matrix, and tensor:** a vector $x\in\mathbb{R}^n$ is a one-axis array, $A\in\mathbb{R}^{m\times n}$ is a two-axis array, and a tensor has more axes. Shapes control which operations are defined.
- **Transpose and broadcasting:** $(A^\top)_{i,j}=A_{j,i}$ exchanges rows and columns. Framework broadcasting permits $C=A+b$ with $C_{i,j}=A_{i,j}+b_j$; it is element-wise expansion, not matrix multiplication.
- **Matrix versus Hadamard product:** $C=AB$ requires matching inner dimensions and gives $C_{i,j}=\sum_kA_{i,k}B_{k,j}$; $A\odot B$ multiplies corresponding entries of same-shaped arrays. Confusing them changes the computation.
- **Linear system and inverse:** $Ax=b$ encodes simultaneous equations. If a square $A$ is invertible, $x=A^{-1}b$ follows algebraically; numerical software should solve the system directly rather than form an inverse unnecessarily.
### §2.4–§2.6 Geometry and norms
- **Span and column space:** $Ax$ is a linear combination of $A$'s columns. A target $b$ is reachable exactly when it lies in that column space; linearly dependent columns make a square matrix singular.
- **Norms:** $\|x\|_p=(\sum_i|x_i|^p)^{1/p}$ measures magnitude and must satisfy positivity, triangle inequality, and absolute homogeneity. $L_1$ measures absolute coordinates, $L_2$ Euclidean length, $L_\infty$ the largest magnitude, and $\|A\|_F$ the matrix analogue of $L_2$.
- **Orthogonality:** $x^\top y=0$ means nonzero vectors are perpendicular; orthonormal vectors are also unit length. For an orthogonal matrix, $A^\top A=I$ and $A^{-1}=A^\top$.
### §2.7–§2.8 Decompositions
- **Eigendecomposition:** an eigenvector satisfies $Av=\lambda v$. When a square matrix has enough independent eigenvectors, $A=V\operatorname{diag}(\lambda)V^{-1}$; for real symmetric matrices, the eigenvectors may be chosen orthonormal.
- **Singular value decomposition:** $A=UDV^\top$ works for any real $m\times n$ matrix. $U$ and $V$ are orthogonal and $D$ contains singular values; unlike eigendecomposition, it does not require $A$ to be square.
## Examples Worth Keeping
- A $3\times2$ matrix maps vectors from a two-dimensional input space into at most a plane in three dimensions. A target off that plane cannot satisfy $Ax=b$.
- A diagonal matrix $\operatorname{diag}(v)$ scales each coordinate of $x$ and therefore behaves like $v\odot x$; this is a structural shortcut, not a general matrix product rule.
- The chapter's unit-circle picture explains a symmetric matrix geometrically: after applying $A$, the circle becomes an ellipse whose principal directions are eigenvectors and whose axis scaling is set by eigenvalues.
## Connections
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 1|Week 1]] stores Seeds features in an array and computes squared Euclidean distances; the dimensions and dot-like sum in that code depend on these array rules.
- [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5|DLB Chapter 5]] uses a design matrix $X$ and $L_2$ loss for learning tasks.
- SVD is a later bridge to PCA, but no Week 1–2 lecture source in this build demonstrates that application.
## Open Questions
- [ ] Verify the exact edition, section page anchors, and numerical-computation caveat in `DLB Textbook CSCI 4521.pdf` with a text-accessible reader.
- [ ] Work one concrete $Ax=b$ example and identify whether the target is inside the column space before using an inverse formula.
## Flashcards
Why is $AB$ different from $A\odot B$?::$AB$ sums row–column products and requires compatible inner dimensions; $A\odot B$ multiplies matching entries of same-shaped arrays. #cards/csci4521
What does the column space decide in $Ax=b$?::It is the set of reachable outputs; a solution exists only if $b$ lies in the span of $A$'s columns. #cards/csci4521
Why is $x=A^{-1}b$ not the default numerical recipe?::It is an algebraic identity when the inverse exists, but forming an inverse can amplify floating-point error; direct solvers are preferred. #cards/csci4521
How does SVD differ from eigendecomposition?::SVD factorizes any real rectangular matrix as $UDV^\top$; eigendecomposition concerns square matrices and their eigenvectors. #cards/csci4521
