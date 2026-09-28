---
type: class
input_kind: book
status: seed
created:
updated:
area:
  - "[[UMN Board]]"
tags:
  - "#class"
  - "#Textbook"
next:
---
# Chapter - 2
## Chapter Summary
<!-- State the chapter's one-sentence claim and use exactly one ==highlight== anchor. -->
== ==
*Mechanism:*
<!-- Explain how the chapter's claim works. -->
# DLB Chapter 2 — Linear Algebra (§2.1-2.8)

## Chapter Summary

This reading note covers Sections 2.1 through 2.8 of Chapter 2 ("Linear Algebra", pp. 31–45) in the Deep Learning Book (Goodfellow, Bengio, Courville). **Linear algebra** is the continuous mathematical language of machine learning, providing structures and operations to represent multi-variable systems and transform high-dimensional data. We build foundational objects from a single **scalar** to a 1D **vector**, a 2D **matrix**, and an $n$-dimensional **tensor**. We examine array indexing, the **transpose** operator, and non-standard array arithmetic like **broadcasting** ($C = A + b$) [28–31]. We analyze operations including the **matrix product**, the **Hadamard product**, and the vector **dot product**, applying them to formulate a **system of linear equations** ($Ax = b$) [32–35]. We derive solutions via the **identity matrix** and **matrix inverse** ($x = A^{-1}b$) while noting floating-point precision caveats on digital computers. We examine geometric space through a **linear combination** of vectors, its **span**, the **column space** of $A$, and the conditions that cause a matrix to be a **singular matrix** [39–41]. We formalize vector length using a **norm** under the general **$L_p$ norm** family—satisfying strict positivity, the **triangle inequality**, and absolute homogeneity—comparing the **Euclidean norm**, **$L_1$ norm**, **$L_\infty$ norm**, and matrix **Frobenius norm** [42–46]. ==Eigendecomposition and singular value decomposition decompose matrices into fundamental scale and orientation components, exposing how linear operations distort space [50–58].== We study constrained structural matrices including a **diagonal matrix**, **symmetric matrix**, **unit vector**, **orthogonal** and **orthonormal** sets, and an **orthogonal matrix** [47–49]. Finally, we cover **eigendecomposition** ($Av = \lambda v$, $A = V \text{diag}(\lambda)V^{-1}$) for square matrices—classifying matrices as **positive definite** or **positive semidefinite**—and **singular value decomposition** ($A = U D V^\top$) to factorize arbitrary real matrices into a **singular value**, **left-singular vector**, and **right-singular vector** set [50–58].

## Key Concepts

| Term / Mathematical Object | Notation / Equation | Core Definition & Mechanism | Real Book Page |
| :--- | :--- | :--- | :--- |
| Scalar & Vector | $s \in \mathbb{R}$, $x \in \mathbb{R}^n$ | Single real number $s$; 1D array $x$ indexed by $x_i$. | pp. 31–32 |
| Matrix & Tensor | $A \in \mathbb{R}^{m \times n}$, $\mathbf{A} \in \mathbb{R}^{i \times j \times k}$ | 2D array $A$ indexed by $A_{i,j}$; multi-axis array $\mathbf{A}$. | pp. 31–32 |
| Transpose | $(A^\top)_{i,j} = A_{j,i}$ | Mirror image across the main diagonal running down and right. | pp. 32–33 |
| Broadcasting | $C = A + b \implies C_{i,j} = A_{i,j} + b_j$ | Implicit copying of vector $b$ across rows of matrix $A$ during addition. | p. 33 |
| Matrix Product | $C = AB \implies C_{i,j} = \sum_k A_{i,k} B_{k,j}$ | Multiplicative combination requiring inner dimension match ($m \times n \cdot n \times p$). | p. 34 |
| Hadamard Product | $A \odot B \implies (A \odot B)_{i,j} = A_{i,j} B_{i,j}$ | Element-wise matrix multiplication of identical dimensions. | p. 34 |
| Linear System | $Ax = b$ | Compact matrix formulation representing $m$ equations with $n$ unknown variables. | p. 35 |
| Identity & Inverse | $I_n x = x$, $A^{-1}A = I_n$ | $I_n$ preserves vectors; $A^{-1}$ satisfies $A^{-1}A = I_n$, yielding analytical solution $x = A^{-1}b$. | pp. 36–37 |
| Span & Column Space | $\text{span}(v^{(1)}, \dots, v^{(n)})$, $\text{col}(A)$ | Set of all points reached via linear combinations $\sum_i c_i v^{(i)}$; range of $A$'s columns. | p. 38 |
| Norm ($L_p$) | $\|x\|_p = \left( \sum_i \|x_i\|^p \right)^{1/p}$ | Measure of vector magnitude mapping to $\mathbb{R}_{\ge 0}$, satisfying triangle inequality. | p. 39 |
| Orthogonal Matrix | $A^\top A = A A^\top = I_n \implies A^{-1} = A^\top$ | Square matrix with mutually orthonormal rows and columns; inverse equals transpose. | p. 42 |
| Eigendecomposition | $Av = \lambda v \implies A = V \text{diag}(\lambda) V^{-1}$ | Factorization of square $A$ into eigenvector matrix $V$ and eigenvalue vector $\lambda$. | pp. 42–43 |
| Definiteness | $x^\top A x > 0 \quad (\text{positive definite})$ | Classification of symmetric matrix eigenvalues ($\lambda_i > 0 \implies$ positive definite). | p. 44 |
| Singular Value Decomposition | $A = U D V^\top$ | Factorization of any real $m \times n$ matrix $A$ into orthogonal $U, V$ and diagonal $D$. | pp. 44–45 |

==The table above outlines the foundational mathematical structures, equations, and exact textbook locations for Sections 2.1 through 2.8.==

## Full Reading Notes

### 2.1 Scalars, Vectors, Matrices and Tensors

The study of linear algebra involves four primary mathematical objects:
*   A scalar is a single real or natural number written in lower-case italics (e.g., $s \in \mathbb{R}$ or $n \in \mathbb{N}$).
*   A vector is a 1D array of numbers written in bold lower-case italics ($x \in \mathbb{R}^n$). An element at index $i$ is identified as $x_i$. The expression $x_{-i}$ represents all elements of $x$ except $x_i$.
*   A matrix is a 2D array of numbers written in bold upper-case italics ($A \in \mathbb{R}^{m \times n}$). An element is identified as $A_{i,j}$. The $i$-th row is sliced as $A_{i,:}$, and the $j$-th column is sliced as $A_{:,j}$.
*   A tensor is an array with more than two axes, arranged on a regular grid and written in bold sans-serif ($\mathbf{A}$). An element of a 3D tensor is written as $A_{i,j,k}$.

The **main diagonal** of a matrix runs down and to the right, starting from the upper left corner $A_{1,1}$. The transpose operator $A^\top$ creates a mirror image across this main diagonal:

$$(A^\top)_{i,j} = A_{j,i} \tag{2.3}$$

Inline vectors are written as row matrices with a transpose operator to represent standard column vectors: $x = [x_1, x_2, x_3]^\top$. A scalar is a $1 \times 1$ matrix, so it is its own transpose: $a = a^\top$.

Standard matrix addition requires identical shapes: $C = A + B$, where $C_{i,j} = A_{i,j} + B_{i,j}$. Scalar multiplication and addition operate element-wise: $D = a \cdot B + c$, where $D_{i,j} = a B_{i,j} + c$. In deep learning frameworks, addition of a matrix and a vector is permitted via broadcasting:

$$C = A + b \quad \text{where} \quad C_{i,j} = A_{i,j} + b_j \tag{31}$$

Mechanism: The vector $b$ is implicitly copied into every row of $A$ before element-wise addition, eliminating explicit memory allocation for duplicate rows.

### 2.2 Multiplying Matrices and Vectors

The matrix product of $A \in \mathbb{R}^{m \times n}$ and $B \in \mathbb{R}^{n \times p}$ yields a third matrix $C \in \mathbb{R}^{m \times p}$:

$$C = AB \quad \text{where} \quad C_{i,j} = \sum_{k} A_{i,k} B_{k,j} \tag{2.4-2.5}$$

Mechanism: Element $C_{i,j}$ is computed by taking the vector dot product of the $i$-th row of $A$ ($A_{i,:}$) and the $j$-th column of $B$ ($B_{:,j}$).

In contrast, the **element-wise product** (or Hadamard product) multiplies corresponding individual entries of identically shaped matrices and is written as $A \odot B$, where $(A \odot B)_{i,j} = A_{i,j} B_{i,j}$.

The dot product between two column vectors $x, y \in \mathbb{R}^n$ is the matrix product $x^\top y$:

$$x^\top y = \sum_{i} x_i y_i \tag{33}$$

Key algebraic properties of matrix multiplication:
*   Distributive property: $A(B + C) = AB + AC$
*   Associative property: $A(BC) = (AB)C$
*   Non-commutative property: $AB \neq BA$ in general
*   Dot product commutativity: $x^\top y = y^\top x$
*   Transpose of a product: $(AB)^\top = B^\top A^\top$

Proof of dot product commutativity via transpose: Because $x^\top y$ yields a scalar, it equals its own transpose. Applying the transpose product rule yields:

$$x^\top y = (x^\top y)^\top = y^\top (x^\top)^\top = y^\top x \tag{2.10}$$

Matrix multiplication allows compact formulation of a system of linear equations:

$$Ax = b \tag{2.11}$$

where $A \in \mathbb{R}^{m \times n}$ is a known matrix of coefficients, $b \in \mathbb{R}^m$ is a known vector of targets, and $x \in \mathbb{R}^n$ is a vector of unknown variables. Expanding $Ax = b$ row-by-row yields $m$ simultaneous linear equations:

$$A_{1,:} x = b_1 \implies A_{1,1} x_1 + A_{1,2} x_2 + \dots + A_{1,n} x_n = b_1 \tag{2.12, 2.17}$$
$$A_{2,:} x = b_2 \implies A_{2,1} x_1 + A_{2,2} x_2 + \dots + A_{2,n} x_n = b_2 \tag{2.13, 2.17}$$
$$\vdots$$
$$A_{m,:} x = b_m \implies A_{m,1} x_1 + A_{m,2} x_2 + \dots + A_{m,n} x_n = b_m \tag{2.15, 2.19}$$

### 2.3 Identity and Inverse Matrices

An identity matrix $I_n \in \mathbb{R}^{n \times n}$ is a square matrix that preserves any vector under multiplication:

$$\forall x \in \mathbb{R}^n, \quad I_n x = x \tag{2.20}$$

Structure: $I_n$ contains ones along its main diagonal and zeros everywhere else.

A matrix inverse of $A \in \mathbb{R}^{n \times n}$ is denoted $A^{-1}$ and satisfies:

$$A^{-1} A = I_n \quad \text{and} \quad A A^{-1} = I_n \tag{2.21, 2.29}$$

Step-by-step derivation solving $Ax = b$ analytically via $A^{-1}$:
1. Begin with the linear system: $Ax = b$
2. Left-multiply both sides by $A^{-1}$: $A^{-1} (Ax) = A^{-1} b$
3. Apply matrix product associativity: $(A^{-1} A) x = A^{-1} b$
4. Substitute $A^{-1} A = I_n$: $I_n x = A^{-1} b$
5. Apply the identity property $I_n x = x$: $x = A^{-1} b$

Practical Software Warning: $A^{-1}$ is an analytical tool and should rarely be computed in digital computer applications. Because floating-point numbers have limited numerical precision, explicitly calculating $A^{-1}$ and multiplying by $b$ introduces severe rounding errors. Direct linear solvers (e.g., LU decomposition or QR factorization) that operate on $b$ directly yield far more accurate numerical estimates of $x$.

### 2.4 Linear Dependence and Span

For $Ax = b$ to have a unique solution $x = A^{-1}b$, $A^{-1}$ must exist. Any linear system $Ax = b$ has either:
1. Exactly 0 solutions
2. Exactly 1 solution
3. Infinitely many solutions

Proof that a finite number of solutions greater than 1 cannot exist: If $x$ and $y$ are distinct solutions to $Ax = b$, then for any real scalar $\alpha$, $z = \alpha x + (1 - \alpha) y$ is also a solution:

$$Az = A(\alpha x + (1 - \alpha) y) = \alpha Ax + (1 - \alpha) Ay = \alpha b + (1 - \alpha) b = b \tag{2.26}$$

Geometric View: The operation $Ax$ computes a linear combination of the columns of $A$, weighted by the scalar elements of $x$:

$$Ax = \sum_{i} x_i A_{:,i} \tag{2.27}$$

A linear combination of a set of vectors $\{v^{(1)}, \dots, v^{(n)}\}$ with scalar coefficients $c_i$ is $\sum_i c_i v^{(i)}$. The span of a set of vectors is the set of all points reachable via their linear combinations. The column space (or **range**) of $A$ is the span of its column vectors. Solving $Ax = b$ requires testing whether $b$ lies within the column space of $A$.

Requirements for $A^{-1}$ existence:
1. To ensure $Ax = b$ has at least one solution for every $b \in \mathbb{R}^m$, the column space must span $\mathbb{R}^m$, requiring $n \ge m$.
2. To ensure $Ax = b$ has at most one solution for every $b \in \mathbb{R}^m$, columns must not be redundant, requiring $n \le m$.
3. Combining both requirements forces $m = n$ (a square matrix) with all columns linearly independent.

A square matrix with linearly dependent columns is called a singular matrix and cannot be inverted.

Book Examples [39–41]:
*   The $3 \times 2$ Matrix Example: A matrix with 3 rows and 2 columns maps $\mathbb{R}^2 \to \mathbb{R}^3$. Its column space forms at most a 2D plane in 3D space. If $b$ lies off this plane, $Ax = b$ has 0 solutions.
*   Identical Columns Example: If a $3 \times 3$ matrix has two identical column vectors, those columns are linearly dependent. The column space collapses to at most a 1D line or 2D plane in $\mathbb{R}^3$, making the matrix singular.

### 2.5 Norms

In machine learning, we measure vector size using functions called norms. Formally, the $L_p$ norm is:

$$\|x\|_p = \left( \sum_{i} |x_i|^p \right)^{\frac{1}{p}} \quad \text{for} \quad p \in \mathbb{R}, p \ge 1 \tag{2.30}$$

A norm is any function $f(x)$ satisfying three rigorous mathematical properties:
1. Strict Positivity: $f(x) = 0 \implies x = 0$
2. Triangle Inequality: $f(x + y) \le f(x) + f(y)$
3. Absolute Homogeneity: $\forall \alpha \in \mathbb{R}, \quad f(\alpha x) = |\alpha| f(x)$

Specific Norm Types [43–47]:
*   **Euclidean norm** ($L_2$ norm): $\|x\|_2 = \sqrt{\sum_i x_i^2}$, representing Euclidean distance from the origin. Often written simply as $\|x\|$.
*   Squared $L_2$ norm: $x^\top x = \sum_i x_i^2$. Preferred mathematically and computationally because its partial derivatives depend solely on the corresponding element $x_i$ ($\frac{\partial}{\partial x_i} x^\top x = 2 x_i$), whereas $L_2$ derivatives depend on the entire vector. Caveat: Squared $L_2$ increases very slowly near the origin, making it inefficient when discriminating between exactly zero and small non-zero values.
*   **$L_1$ norm**: $\|x\|_1 = \sum_i |x_i|$. Used when distinguishing between exact zeros and small non-zero values is critical (inducing sparsity). Moving away from 0 by $\epsilon$ increases the $L_1$ norm by $\epsilon$ everywhere.
*   $L_0$ "norm": Counts non-zero elements in $x$. Incorrect terminology: it is NOT a true norm because scaling $x$ by $\alpha$ does not scale the count by $|\alpha|$. $L_1$ serves as a mathematical substitute for $L_0$.
*   **$L_\infty$ norm** (or **max norm**): $\|x\|_\infty = \max_i |x_i|$, taking the absolute value of the entry with the largest magnitude.
*   **Frobenius norm**: $\|A\|_F = \sqrt{\sum_{i,j} A_{i,j}^2}$, measuring matrix size analogous to the $L_2$ norm of a vector.

Vector dot products can be expressed via $L_2$ norms and the angle $\theta$ between vectors:

$$x^\top y = \|x\|_2 \|y\|_2 \cos \theta \tag{2.34}$$

### 2.6 Special Kinds of Matrices and Vectors

Special matrix structures simplify computation in machine learning [47–49]:
*   Diagonal matrix: $D$ has non-zero entries only along the main diagonal ($D_{i,j} = 0$ for $i \neq j$). Written as $\text{diag}(v)$. Multiplying $\text{diag}(v)x$ scales each $x_i$ by $v_i$, matching the Hadamard product $\text{diag}(v)x = v \odot x$. The inverse is $\text{diag}(v)^{-1} = \text{diag}([1/v_1, \dots, 1/v_n]^\top)$, existing iff every $v_i \neq 0$.
*   Symmetric matrix: A matrix equal to its own transpose:

$$A = A^\top \tag{2.35}$$

    Real Book Distance-Matrix Example: Let $A$ be a spatial distance matrix where $A_{i,j}$ gives the distance from point $i$ to point $j$. Because distance functions are order-independent ($d(i,j) = d(j,i)$), $A_{i,j} = A_{j,i}$ for all $i,j$, guaranteeing symmetry.
*   Unit vector: A vector with unit norm $\|x\|_2 = 1$.
*   Orthogonal vectors: Vectors where $x^\top y = 0$. Non-zero orthogonal vectors sit at a $90^\circ$ angle. In $\mathbb{R}^n$, at most $n$ non-zero vectors can be mutually orthogonal.
*   Orthonormal vectors: Vectors that are mutually orthogonal AND have unit norm.
*   Orthogonal matrix: A square matrix whose rows are mutually orthonormal AND whose columns are mutually orthonormal:

$$A^\top A = A A^\top = I \implies A^{-1} = A^\top \tag{2.37-2.38}$$

    Mechanism: Computing $A^{-1}$ for an orthogonal matrix requires zero division or elimination—simply transposing $A$ yields its exact inverse $A^\top$. Terminology caveat: An orthogonal matrix requires fully orthonormal rows and columns.

### 2.7 Eigendecomposition

Analogy: Just as integers decompose into prime factors to reveal arithmetic properties, matrices decompose into eigenvectors and eigenvalues to reveal functional properties.

An eigenvector of a square matrix $A$ is a non-zero vector $v$ that changes only in scale when multiplied by $A$:

$$Av = \lambda v \tag{2.39}$$

where scalar $\lambda$ is the corresponding eigenvalue. Any rescaled vector $s v$ ($s \neq 0$) is also an eigenvector with the same $\lambda$, so we conventionally restrict search to unit eigenvectors ($\|v\|_2 = 1$).

If $A \in \mathbb{R}^{n \times n}$ has $n$ linearly independent eigenvectors, concatenate them into matrix columns $V = [v^{(1)}, \dots, v^{(n)}]$ and eigenvalues into $\lambda = [\lambda_1, \dots, \lambda_n]^\top$:

$$A = V \text{diag}(\lambda) V^{-1} \tag{2.40}$$

Every real symmetric matrix can be decomposed using real-valued orthonormal eigenvectors $Q$ and real eigenvalues $\Lambda = \text{diag}(\lambda)$:

$$A = Q \Lambda Q^\top \tag{2.41}$$

Classifications by eigenvalue signs:
*   Positive definite: All $\lambda_i > 0 \implies \forall x \neq 0, \quad x^\top A x > 0$.
*   **Positive semidefinite**: All $\lambda_i \ge 0 \implies \forall x, \quad x^\top A x \ge 0$.
*   **Negative definite**: All $\lambda_i < 0 \implies \forall x \neq 0, \quad x^\top A x < 0$.
*   **Negative semidefinite**: All $\lambda_i \le 0 \implies \forall x, \quad x^\top A x \le 0$.

### 2.8 Singular Value Decomposition

Motivation: Eigendecomposition requires square matrices and may produce complex numbers. Singular value decomposition factorizes EVERY real matrix $A \in \mathbb{R}^{m \times n}$ regardless of shape.

The SVD equation factorizes $A$ into three matrices:

$$A = U D V^\top \tag{2.43}$$

*   $U \in \mathbb{R}^{m \times m}$: Orthogonal matrix containing left-singular vectors of $A$.
*   $D \in \mathbb{R}^{m \times n}$: Diagonal matrix (not necessarily square) containing singular values along its diagonal.
*   $V \in \mathbb{R}^{n \times n}$: Orthogonal matrix containing right-singular vectors of $A$.

Relationships to Eigendecomposition:
*   Left-singular vectors ($U$'s columns) = eigenvectors of $A A^\top$.
*   Right-singular vectors ($V$'s columns) = eigenvectors of $A^\top A$.
*   Non-zero singular values ($D$'s diagonal) = square roots of the non-zero eigenvalues of $A^\top A$ (and $A A^\top$).

==Sections 2.1 through 2.8 establish the foundational objects, arithmetic rules, vector spaces, norms, matrix types, and factorizations of linear algebra.==

## Worked Example

Figure 2.3 (p. 43) in the Deep Learning Book demonstrates the geometric distortion caused by matrix multiplication using eigendecomposition:

1.  Setup: Consider a $2 \times 2$ real symmetric matrix $A$ with orthonormal eigenvectors $v^{(1)}$ and $v^{(2)}$ having corresponding eigenvalues $\lambda_1$ and $\lambda_2$.
2.  Left Panel (Unit Circle): Plot the set of all 2D unit vectors $u \in \mathbb{R}^2$ satisfying $\|u\|_2 = 1$. This forms a perfect unit circle centered at the origin. The orthonormal eigenvectors $v^{(1)}$ and $v^{(2)}$ lie on this circle at $90^\circ$ to each other.
3.  Right Panel (Distorted Ellipse): Plot the set of transformed vectors $Au$. Matrix $A$ distorts the unit circle into an ellipse.
4.  Geometric Mechanism: The principal axes of the resulting ellipse align exactly with the eigenvector directions $v^{(1)}$ and $v^{(2)}$. The radius of the ellipse along direction $v^{(i)}$ is scaled precisely by the magnitude of eigenvalue $\lambda_i$.
5.  Prime-Factorization Link: Just as factoring $120 = 2^3 \cdot 3 \cdot 5$ reveals divisibility properties, decomposing $A = Q \Lambda Q^\top$ exposes spatial transformation steps:
    *   $Q^\top u$: Rotates space to align coordinate axes with eigenvectors $Q$.
    *   $\Lambda (Q^\top u)$: Stretches or shrinks space along those axes by factor $\lambda_i$.
    *   $Q (\Lambda Q^\top u)$: Rotates space back to the original coordinate system.

==Figure 2.3 visually proves that eigendecomposition uncouples a matrix transformation into orthogonal rotation and coordinate-wise scaling.==

## Connections

*   Connection to ISL Chapter 1 & 2: An ISL dataset is structured as an $n \times p$ **design matrix** $X$, where rows $x_i^\top$ represent $n$ individual observations and columns represent $p$ predictor variables. The unscaled sample covariance matrix is formed via matrix multiplication $X^\top X$. In ISL linear regression, $L_2$ vector norms compute residual sums of squares $\|y - X\beta\|_2^2$, while $L_1$ norms penalize parameter magnitude in Lasso regression.
*   Connection to UMN CSCI 4521 Lecture Preview (**principal components analysis**): PCA seeks orthogonal directions that maximize data variance. Section 2.8's SVD directly solves PCA: performing SVD on a centered design matrix $X = U D V^\top$ reveals that the right-singular vectors $V$ are the principal component loading vectors, $U D$ gives the principal component scores, and the squared singular values $D_{i,i}^2 / (n-1)$ equal the variances explained by each principal component.

==Understanding SVD bridges fundamental matrix algebra directly to PCA and low-rank approximation algorithms used in statistical learning.==

## Open Questions

1.  Why does $L_1$ regularization induce sparse parameters (driving weights to exact zeros) while $L_2$ regularization shrinks weights toward zero without setting them exactly to zero?
2.  Under what exact conditions regarding matrix rank and dimension ($m$ vs $n$) will a system $Ax = b$ have zero solutions, one unique solution, or infinitely many solutions?
3.  How do the singular values in $D$ from SVD relate mathematically to the eigenvalues in $\Lambda$ from eigendecomposition when $A$ is a real symmetric matrix?
4.  Why is explicitly computing $A^{-1}$ numerically unstable on digital computers, and how do direct factorizations avoid this instability?

==These open questions prompt deeper analysis of numerical stability, geometric projections, and optimization behavior in machine learning.==

## Flashcards

1.  Q: What is the fundamental shape requirement for the matrix product $C = AB$?
    A: Matrix $A$ must have dimensions $m \times n$ and $B$ must have dimensions $n \times p$, yielding $C \in \mathbb{R}^{m \times p}$.
2.  Q: How does broadcasting operate when computing $C = A + b$?
    A: Vector $b \in \mathbb{R}^n$ is implicitly copied and added to every row of matrix $A \in \mathbb{R}^{m \times n}$, yielding $C_{i,j} = A_{i,j} + b_j$.
3.  Q: What is the difference between the matrix product $AB$ and the Hadamard product $A \odot B$?
    A: The matrix product computes row-column dot products ($C_{i,j} = \sum_k A_{i,k}B_{k,j}$), whereas the Hadamard product computes element-wise multiplication ($(A \odot B)_{i,j} = A_{i,j} B_{i,j}$).
4.  Q: What three mathematical properties must every norm function $f(x)$ satisfy?
    A: Strict positivity ($f(x)=0 \implies x=0$), triangle inequality ($f(x+y) \le f(x)+f(y)$), and absolute homogeneity ($f(\alpha x) = |\alpha|f(x)$).
5.  Q: Why is the squared $L_2$ norm preferred over the standard $L_2$ norm in gradient optimization?
    A: Partial derivatives of the squared $L_2$ norm with respect to $x_i$ depend solely on $x_i$ ($2x_i$), making computation simpler than $L_2$ derivatives which depend on the whole vector.
6.  Q: What defines an orthogonal matrix $A$, and why is its inverse computationally efficient?
    A: An orthogonal matrix is square with mutually orthonormal rows and columns ($A^\top A = A A^\top = I$), meaning its inverse equals its transpose ($A^{-1} = A^\top$).
7.  Q: What is the defining equation for an eigenvector $v$ and eigenvalue $\lambda$ of a square matrix $A$?
    A: $Av = \lambda v$, where $v \neq 0$.
8.  Q: How is a real symmetric matrix $A$ classified based on its eigenvalues?
    A: Positive definite if all $\lambda_i > 0$; positive semidefinite if all $\lambda_i \ge 0$; negative definite if all $\lambda_i < 0$; negative semidefinite if all $\lambda_i \le 0$.
9.  Q: What is the Singular Value Decomposition (SVD) formula and the dimensions of its matrices for $A \in \mathbb{R}^{m \times n}$?
    A: $A = U D V^\top$, where $U \in \mathbb{R}^{m \times m}$ (orthogonal), $D \in \mathbb{R}^{m \times n}$ (diagonal), and $V \in \mathbb{R}^{n \times n}$ (orthogonal).
10. Q: How do SVD components relate to eigendecomposition?
    A: $U$'s columns are eigenvectors of $A A^\top$, $V$'s columns are eigenvectors of $A^\top A$, and non-zero diagonal entries of $D$ are square roots of $A^\top A$'s eigenvalues.

==This flashcard deck summarizes key definitions, algebraic properties, and factorizations from DLB Chapter 2 (§2.1–2.8).==
## Examples Worth Keeping
<!-- Keep concrete examples, numbers, cases, or worked reasoning that makes the mechanism memorable. -->
- 
## Connections
<!-- Link the matching lecture/week, course map, and only concept notes that actually exist or were created. -->
- Lecture:
- Concept:
## Flashcards
<!-- Add 3–8 atomic cards testing mechanisms and contrasts to #cards/<course-slug>. -->
