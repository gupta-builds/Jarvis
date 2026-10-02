<!-- page 1 of 371 -->

# NUMERICAL LINEAR ALGEBRA

Lloyd N. Trefethen David Bau, III

<!-- page 2 of 371 -->

<!-- page 3 of 371 -->

To our parents

Florence and Lloyd MacG. Trefethen

and

Rachel and Paul Bau

<!-- page 4 of 371 -->

## Notation

For square or rectangular matrices $A \in \mathbb{C}^{m \times n}$, $m \geq n$:

QR factorization: $A = QR$

Reduced QR factorization:  $A = \hat{Q}\hat{R}$

SVD: $A = U\Sigma V^{*}$

Reduced SVD: $A = \hat{U}\hat{\Sigma} V^{*}$

For square matrices $A \in \mathbb{C}^{m \times m}$:

LU factorization: $PA = LU$

Cholesky factorization: $A = R^{*}R$

Eigenvalue decomposition: $A = X\Lambda X^{-1}$

Schur factorization: $A = UTU^{*}$

Orthogonal projector: $P = \hat{Q}\hat{Q}^{*}$

Householder reflector: $F = I - 2\frac{vv^*}{v^*v}$

$\mathrm{QR}$ algorithm: $A^{k} = \underline{Q}^{(k)}\underline{R}^{(k)}, A^{(k)} = (\underline{Q}^{(k)})^{T}A\underline{Q}^{(k)}$

Arnoldi iteration: $AQ_{n} = Q_{n + 1}\tilde{H}_{n}$, $H_{n} = Q_{n}^{*}AQ_{n}$

Lanczos iteration: $AQ_{n} = Q_{n + 1}\tilde{T}_{n}$, $T_{n} = Q_{n}^{T}AQ_{n}$

<!-- page 5 of 371 -->

## Contents

## Preface ix

## Acknowledgments xi

## I Fundamentals 1

Lecture 1 Matrix-Vector Multiplication 3

Lecture 2 Orthogonal Vectors and Matrices . . . . . . . . . . . 11

Lecture 3 Norms 17

Lecture 4 The Singular Value Decomposition ..... 25

Lecture 5 More on the SVD 32

## II QR Factorization and Least Squares 39

Lecture 6 Projectors 41

Lecture 7 QR Factorization 48

Lecture 8 Gram–Schmidt Orthogonalization . . . . . . . . . . . 56

Lecture 9 MATLAB 63

Lecture 10 Householder Triangularization . . . . . . . . . . . . 69

Lecture 11 Least Squares Problems . . . . . . . . . . . . . . . . . 77

## III Conditioning and Stability 87

Lecture 12 Conditioning and Condition Numbers . . . . . . . . 89

Lecture 13 Floating Point Arithmetic ..... 97

Lecture 14 Stability 102

Lecture 15 More on Stability . . . . . . . . . . . . . . . . . . . 108

Lecture 16 Stability of Householder Triangularization . . . . . . 114

Lecture 17 Stability of Back Substitution . . . . . . . . . . . . 121

Lecture 18 Conditioning of Least Squares Problems . . . . . . . 129

Lecture 19 Stability of Least Squares Algorithms . . . . . . . . 137

vii

<!-- page 6 of 371 -->

viii

CONTENTS

## IV Systems of Equations 145

Lecture 20 Gaussian Elimination . . . . . . . . . . . . . . . . . . 147

Lecture 21 Pivoting 155

Lecture 22 Stability of Gaussian Elimination . . . . . . . . . . 163

Lecture 23 Cholesky Factorization 172

## V Eigenvalues 179

Lecture 24 Eigenvalue Problems 181

Lecture 25 Overview of Eigenvalue Algorithms . . . . . . . . . 190

Lecture 26 Reduction to Hessenberg or Tridiagonal Form . . . . . 196

Lecture 27 Rayleigh Quotient, Inverse Iteration . . . . . . . . 202

Lecture 28 QR Algorithm without Shifts . . . . . . . . . . . . 211

Lecture 29 QR Algorithm with Shifts . . . . . . . . . . . . . . . 219

Lecture 30 Other Eigenvalue Algorithms . . . . . . . . . . . . . 225

Lecture 31 Computing the SVD . . . . . . . . . . . . . . . . . . 234

## VI Iterative Methods 241

Lecture 32 Overview of Iterative Methods . . . . . . . . . . . . 243

Lecture 33 The Arnoldi Iteration . . . . . . . . . . . . . . . . . . 250

Lecture 34 How Arnoldi Locates Eigenvalues . . . . . . . . . . 257

Lecture 35 GMRES 266

Lecture 36 The Lanczos Iteration . . . . . . . . . . . . . . . . . 276

Lecture 37 From Lanczos to Gauss Quadrature . . . . . . . . . 285

Lecture 38 Conjugate Gradients . . . . . . . . . . . . . . . . . 293

Lecture 39 Biorthogonalization Methods . . . . . . . . . . . . . 303

Lecture 40 Preconditioning 313

## Appendix The Definition of Numerical Analysis 321

## Notes 329

## Bibliography 343

## Index 353

<!-- page 7 of 371 -->

## Preface

Since the early 1980s, the first author has taught a graduate course in numerical linear algebra at MIT and Cornell. The alumni of this course, now numbering in the hundreds, have been graduate students in all fields of engineering and the physical sciences. This book is an attempt to put this course on paper.

In the field of numerical linear algebra, there is already an encyclopedic treatment on the market: Matrix Computations, by Golub and Van Loan, now in its third edition. This book is in no way an attempt to duplicate that one. It is small, scaled to the size of one university semester. Its aim is to present fundamental ideas in as elegant a fashion as possible. We hope that every reader of this book will have access also to Golub and Van Loan for the pursuit of further details and additional topics, and for its extensive references to the research literature. Two other important recent books are those of Higham and Demmel, described in the Notes at the end (p. 329).

The field of numerical linear algebra is more beautiful, and more fundamental, than its rather dull name may suggest. More beautiful, because it is full of powerful ideas that are quite unlike those normally emphasized in a linear algebra course in a mathematics department. (At the end of the semester, students invariably comment that there is more to this subject than they ever imagined.) More fundamental, because, thanks to a trick of history, “numerical” linear algebra is really applied linear algebra. It is here that one finds the essential ideas that every mathematical scientist needs to work effectively with vectors and matrices. In fact, our subject is more than just

ix

<!-- page 8 of 371 -->

X

PREFACE

vectors and matrices, for virtually everything we do carries over to functions and operators. Numerical linear algebra is really functional analysis, but with the emphasis always on practical algorithmic ideas rather than mathematical technicalities.

The book is divided into forty lectures. We have tried to build each lecture around one or two central ideas, emphasizing the unity between topics and never getting lost in details. In many places our treatment is nonstandard. This is not the place to list all of these points (see the Notes), but we will mention one unusual aspect of this book. We have departed from the customary practice by not starting with Gaussian elimination. That algorithm is atypical of numerical linear algebra, exceptionally difficult to analyze, yet at the same time tediously familiar to every student entering a course like this. Instead, we begin with the QR factorization, which is more important, less complicated, and a fresher idea to most students. The QR factorization is the thread that connects most of the algorithms of numerical linear algebra, including methods for least squares, eigenvalue, and singular value problems, as well as iterative methods for all of these and also for systems of equations. Since the 1970s, iterative methods have moved to center stage in scientific computing, and to them we devote the last part of the book.

We hope the reader will come to share our view that if any other mathematical topic is as fundamental to the mathematical sciences as calculus and differential equations, it is numerical linear algebra.

<!-- page 9 of 371 -->

## Acknowledgments

We could not have written this book without help from many people. We must begin by thanking the hundreds of graduate students at MIT (Math 335) and Cornell (CS 621) whose enthusiasm and advice over a period of ten years guided the choice of topics and the style of presentation. About seventy of these students at Cornell worked from drafts of the book itself and contributed numerous suggestions. The number of typos caught by Keith Sollers alone was astonishing.

Most of Trefethen's own graduate students during the period of writing read the text from beginning to end—sometimes on short notice and under a gun. Thanks for numerous constructive suggestions go to Jeff Baggett, Toby Driscoll, Vicki Howle, Gudbjorn Jonsson, Kim Toh, and Divakar Viswanath. It is a privilege to have students, then colleagues, like these.

Working with the publications staff at SIAM has been a pleasure; there can be few organizations that match SIAM's combination of flexibility and professionalism. We are grateful to the half-dozen SIAM editorial, production, and design staff whose combined efforts have made this book attractive, and in particular, to Beth Gallagher, whose contributions begin with first-rate copy editing but go a long way beyond.

No institution on earth is more supportive of numerical linear algebra—or produces more books on the subject!—than the Computer Science Department at Cornell. The other three department faculty members with interests in this area are Tom Coleman, Charlie Van Loan, and Steve Vavasis, and we would like to thank them for making Cornell such an attractive center of scientific

xi

<!-- page 10 of 371 -->

xii

ACKNOWLEDGMENTS

computing. Vavasis read a draft of the book in its entirety and made many valuable suggestions, and Van Loan was the one who brought Trefethen to Cornell in the first place. Among our non-numerical colleagues, we thank Dexter Kozen for providing the model on which this book was based: The Design and Analysis of Algorithms, also in the form of forty brief lectures. Among the department's support staff, we have depended especially on the professionalism, hard work, and good spirits of Rebekah Personius.

Outside Cornell, though a frequent and welcome visitor, another colleague who provided extensive suggestions on the text was Anne Greenbaum, one of the deepest thinkers about numerical linear algebra whom we know.

From September 1995 to December 1996, a number of our colleagues taught courses from drafts of this book and contributed their own and their students' suggestions. Among these were Gene Golub (Stanford), Bob Lynch (Purdue), Suely Oliveira (Texas A & M), Michael Overton (New York University), Haesun Park and Ahmed Sameh (University of Minnesota), Irwin Pressmann (Carleton University), Bob Russell and Manfred Trummer (Simon Fraser University), Peter Schmid (University of Washington), Daniel Szyld (Temple University), and Hong Zhang and Bill Moss (Clemson University). The record-breakers in the group were Lynch and Overton, each of whom provided long lists of detailed suggestions. Though eager to dot the last i, we found these contributions too sensible to ignore, and there are now hundreds of places in the book where the exposition is better because of Lynch or Overton.

Most important of all, when it comes to substantive help in making this a better book, we owe a debt that cannot be repaid (he refuses to consider it) to Nick Higham of the University of Manchester, whose creativity and scholarly attention to detail have inspired numerical analysts from half his age to twice it. At short notice and with characteristic good will, Higham read a draft of this book carefully and contributed many pages of technical suggestions, some of which changed the book significantly.

For decades, numerical linear algebra has been a model of a friendly and socially cohesive field. Trefethen would like in particular to acknowledge the three “father figures” whose classroom lectures first attracted him to the subject: Gene Golub, Cleve Moler, and Jim Wilkinson.

Still, it takes more than numerical linear algebra to make life worth living. For this, the first author thanks Anne, Emma (5), and Jacob (3) Trefethen, and the second thanks Heidi Yeh.

<!-- page 11 of 371 -->

## Part I

## Fundamentals

<!-- page 12 of 371 -->

<!-- page 13 of 371 -->

## Lecture 1. Matrix-Vector Multiplication

You already know the formula for matrix-vector multiplication. Nevertheless, the purpose of this first lecture is to describe a way of interpreting such products that may be less familiar. If $b = Ax$, then $b$ is a linear combination of the columns of $A$.

## Familiar Definitions

Let $x$ be an $n$-dimensional column vector and let $A$ be an $m \times n$ matrix ($m$ rows, $n$ columns). Then the matrix-vector product $b = Ax$ is the $m$-dimensional column vector defined as follows:

$$
b _ {i} = \sum_ {j = 1} ^ {n} a _ {i j} x _ {j}, \quad i = 1, \dots , m. \tag {1.1}
$$

Here $b_i$ denotes the $i$th entry of $b$, $a_{ij}$ denotes the $i, j$ entry of $A$ (ith row, $j$th column), and $x_j$ denotes the $j$th entry of $x$. For simplicity, we assume in all but a few lectures of this book that quantities such as these belong to $\mathbb{C}$, the field of complex numbers. The space of $m$-vectors is $\mathbb{C}^m$, and the space of $m \times n$ matrices is $\mathbb{C}^{m \times n}$.

The map $x\mapsto Ax$ is linear, which means that, for any $x,y\in \mathbb{C}^n$ and any $\alpha \in \mathbb{C}$,

$$
A (x + y) = A x + A y,
$$

$$
A (\alpha x) = \alpha A x.
$$

3

<!-- page 14 of 371 -->

4

PART I. FUNDAMENTALS

Conversely, every linear map from  $C^{n}$  to  $C^{m}$  can be expressed as multiplication by an  $m \times n$  matrix.

## A Matrix Times a Vector

Let $a_{j}$ denote the $j$th column of $A$, an $m$-vector. Then (1.1) can be rewritten

$$
b = A x = \sum_ {j = 1} ^ {n} x _ {j} a _ {j}. \tag {1.2}
$$

This equation can be displayed schematically as follows:

$$
\left[ \begin{array}{c} b \\ \hline \end{array} \right] = \left[ \begin{array}{c|c|c|c} a _ {1} & a _ {2} & \dots & a _ {n} \\ \end{array} \right] \left[ \begin{array}{c} x _ {1} \\ x _ {2} \\ \vdots \\ x _ {n} \end{array} \right] = x _ {1} \left[ \begin{array}{c} a _ {1} \\ \end{array} \right] + x _ {2} \left[ \begin{array}{c} a _ {2} \\ \end{array} \right] + \dots + x _ {n} \left[ \begin{array}{c} a _ {n} \\ \end{array} \right].
$$

In (1.2), $b$ is expressed as a linear combination of the columns $a_j$. Nothing but a slight change of notation has occurred in going from (1.1) to (1.2). Yet thinking of $Ax$ in terms of the form (1.2) is essential for a proper understanding of the algorithms of numerical linear algebra.

We can summarize these different descriptions of matrix-vector products in the following way. As mathematicians, we are used to viewing the formula $Ax = b$ as a statement that $A$ acts on $x$ to produce $b$. The formula (1.2), by contrast, suggests the interpretation that $x$ acts on $A$ to produce $b$.

Example 1.1. Vandermonde Matrix. Fix a sequence of numbers $\{x_1, x_2, \ldots, x_m\}$. If $p$ and $q$ are polynomials of degree $< n$ and $\alpha$ is a scalar, then $p + q$ and $\alpha p$ are also polynomials of degree $< n$. Moreover, the values of these polynomials at the points $x_i$ satisfy the following linearity properties:

$$
(p + q) (x _ {i}) = p (x _ {i}) + q (x _ {i}),
$$

$$
(\alpha p) (x _ {i}) = \alpha (p (x _ {i})).
$$

Thus the map from vectors of coefficients of polynomials p of degree < n to vectors  $(p(x_{1}), p(x_{2}), \ldots, p(x_{m}))$  of sampled polynomial values is linear. Any linear map can be expressed as multiplication by a matrix; this is an example. In fact, it is expressed by an  $m \times n$  Vandermonde matrix

$$
A = \left[ \begin{array}{c c c c c} 1 & x _ {1} & x _ {1} ^ {2} & \dots & x _ {1} ^ {n - 1} \\ 1 & x _ {2} & x _ {2} ^ {2} & \dots & x _ {2} ^ {n - 1} \\ \vdots & \vdots & \vdots & & \vdots \\ 1 & x _ {m} & x _ {m} ^ {2} & \dots & x _ {m} ^ {n - 1} \end{array} \right].
$$

<!-- page 15 of 371 -->

LECTURE 1. MATRIX-VECTOR MULTIPLICATION

5

If $c$ is the column vector of coefficients of $p$,

$$
c = \left[ \begin{array}{c} c _ {0} \\ c _ {1} \\ c _ {2} \\ \vdots \\ c _ {n - 1} \end{array} \right], \qquad p (x) = c _ {0} + c _ {1} x + c _ {2} x ^ {2} + \dots + c _ {n - 1} x ^ {n - 1},
$$

then the product $Ac$ gives the sampled polynomial values. That is, for each $i$ from 1 to $m$, we have

$$
(A c) _ {i} = c _ {0} + c _ {1} x _ {i} + c _ {2} x _ {i} ^ {2} + \dots + c _ {n - 1} x _ {i} ^ {n - 1} = p (x _ {i}). \tag {1.3}
$$

In this example, it is clear that the matrix-vector product $Ac$ need not be thought of as $m$ distinct scalar summations, each giving a different linear combination of the entries of $c$, as (1.1) might suggest. Instead, $A$ can be viewed as a matrix of columns, each giving sampled values of a monomial,

$$
A = \left[ \begin{array}{c c c c c} 1 & x & x ^ {2} & \dots & x ^ {n - 1} \end{array} \right], \tag {1.4}
$$

and the product $Ac$ should be understood as a single vector summation in the form of (1.2) that at once gives a linear combination of these monomials,

$$
A c = c _ {0} + c _ {1} x + c _ {2} x ^ {2} + \dots + c _ {n - 1} x ^ {n - 1} = p (x).
$$

The remainder of this lecture will review some fundamental concepts in linear algebra from the point of view of (1.2).

## A Matrix Times a Matrix

For the matrix-matrix product $B = AC$, each column of $B$ is a linear combination of the columns of $A$. To derive this fact, we begin with the usual formula for matrix products. If $A$ is $\ell \times m$ and $C$ is $m \times n$, then $B$ is $\ell \times n$, with entries defined by

$$
\left| b _ {i j} = \sum_ {k = 1} ^ {m} a _ {i k} c _ {k j}. \right. \tag {1.5}
$$

Here $b_{ij}$, $a_{ik}$, and $c_{kj}$ are entries of $B$, $A$, and $C$, respectively. Written in terms of columns, the product is

$$
\left[ \begin{array}{c|c|c|c} b _ {1} & b _ {2} & \dots & b _ {n} \\ \end{array} \right] = \left[ \begin{array}{c|c|c|c} a _ {1} & a _ {2} & \dots & a _ {m} \\ \end{array} \right] \left[ \begin{array}{c|c|c|c} c _ {1} & c _ {2} & \dots & c _ {n} \\  &  &  &  \\ \end{array} \right],
$$

<!-- page 16 of 371 -->

6

PART I. FUNDAMENTALS

and (1.5) becomes

$$
b _ {j} = A c _ {j} = \sum_ {k = 1} ^ {m} c _ {k j} a _ {k}. \tag {1.6}
$$

Thus $b_{j}$ is a linear combination of the columns $a_{k}$ with coefficients $c_{kj}$.

Example 1.2. Outer Product. A simple example of a matrix-matrix product is the outer product. This is the product of an $m$-dimensional column vector $u$ with an $n$-dimensional row vector $v$; the result is an $m \times n$ matrix of rank 1. The outer product can be written

$$
\left[ \begin{array}{l} u \end{array} \right] \left[ \begin{array}{cccc} v _ {1} & v _ {2} & \dots & v _ {n} \end{array} \right] = \left[ \begin{array}{c|c|c|c} v _ {1} u & v _ {2} u & \dots & v _ {n} u \end{array} \right] = \left[ \begin{array}{cccc} v _ {1} u _ {1} & \dots & v _ {n} u _ {1} \\ \vdots & & \vdots \\ v _ {1} u _ {m} & \dots & v _ {n} u _ {m} \end{array} \right].
$$

The columns are all multiples of the same vector $u$, and similarly, the rows are all multiples of the same vector $v$.

Example 1.3. As a second illustration, consider $B = AR$, where $R$ is the upper-triangular $n \times n$ matrix with entries $r_{ij} = 1$ for $i \leq j$ and $r_{ij} = 0$ for $i > j$. This product can be written

$$
\left[ \begin{array}{c c c} & & \\ b _ {1} & \dots & b _ {n} \\ \end{array} \right] = \left[ \begin{array}{c c c} & & \\ a _ {1} & \dots & a _ {n} \\ \end{array} \right] \left[ \begin{array}{cccc} 1 & \dots & 1 \\ & \ddots & \vdots \\ & & 1 \end{array} \right].
$$

The column formula (1.6) now gives

$$
b _ {j} = A r _ {j} = \sum_ {k = 1} ^ {j} a _ {k}. \tag {1.7}
$$

That is, the jth column of B is the sum of the first j columns of A. The matrix R is a discrete analogue of an indefinite integral operator. □

## Range and Nullspace

The range of a matrix $A$, written range(A), is the set of vectors that can be expressed as $Ax$ for some $x$. The formula (1.2) leads naturally to the following characterization of range(A).

Theorem 1.1. range $(A)$ is the space spanned by the columns of $A$.

<!-- page 17 of 371 -->

LECTURE 1. MATRIX-VECTOR MULTIPLICATION

7

Proof. By (1.2), any Ax is a linear combination of the columns of A. Conversely, any vector y in the space spanned by the columns of A can be written as a linear combination of the columns,  $y = \sum_{j=1}^{n} x_{j} a_{j}$ . Forming a vector x out of the coefficients  $x_{j}$ , we have y = Ax, and thus y is in the range of A. ☐

In view of Theorem 1.1, the range of a matrix $A$ is also called the column space of $A$.

The nullspace of  $A \in C^{m \times n}$ , written  $\text{null}(A)$ , is the set of vectors x that satisfy Ax = 0, where 0 is the 0-vector in  $C^{m}$ . The entries of each vector  $x \in \text{null}(A)$  give the coefficients of an expansion of zero as a linear combination of columns of A:  $0 = x_{1}a_{1} + x_{2}a_{2} + \cdots + x_{n}a_{n}$ .

## Rank

The column rank of a matrix is the dimension of its column space. Similarly, the row rank of a matrix is the dimension of the space spanned by its rows. Row rank always equals column rank (among other proofs, this is a corollary of the singular value decomposition, discussed in Lectures 4 and 5), so we refer to this number simply as the rank of a matrix.

An  $m \times n$  matrix of full rank is one that has the maximal possible rank (the lesser of m and n). This means that a matrix of full rank with  $m \geq n$  must have n linearly independent columns. Such a matrix can also be characterized by the property that the map it defines is one-to-one.

Theorem 1.2. A matrix $A \in \mathbb{C}^{m \times n}$ with $m \geq n$ has full rank if and only if it maps no two distinct vectors to the same vector.

Proof. ( $\Longrightarrow$ ) If A is of full rank, its columns are linearly independent, so they form a basis for range(A). This means that every  $b \in \text{range}(A)$  has a unique linear expansion in terms of the columns of A, and therefore, by (1.2), every  $b \in \text{range}(A)$  has a unique x such that b = Ax. ( $\Longleftarrow$ ) Conversely, if A is not of full rank, its columns  $a_j$  are dependent, and there is a nontrivial linear combination such that  $\sum_{j=1}^{n} c_j a_j = 0$ . The nonzero vector c formed from the coefficients  $c_j$  satisfies Ac = 0. But then A maps distinct vectors to the same vector since, for any x,  $Ax = A(x + c)$ . ☐

## Inverse

A nonsingular or invertible matrix is a square matrix of full rank. Note that the $m$ columns of a nonsingular $m \times m$ matrix $A$ form a basis for the whole space $\mathbb{C}^m$. Therefore, we can uniquely express any vector as a linear combination of them. In particular, the canonical unit vector with 1 in the $j$th entry and zeros elsewhere, written $e_j$, can be expanded:

<!-- page 18 of 371 -->

8

PART I. FUNDAMENTALS

$$
e _ {j} = \sum_ {i = 1} ^ {m} z _ {i j} a _ {i}. \tag {1.8}
$$

Let $Z$ be the matrix with entries $z_{ij}$, and let $z_{j}$ denote the $j$th column of $Z$. Then (1.8) can be written $e_j = Az_j$. This equation has the form (1.6); it can be written again, most concisely, as

$$
\left[ \begin{array}{c|c|c}  &  &  \\ e _ {1} & \dots & e _ {m} \\  &  &  \\ \end{array} \right] = I = A Z,
$$

where $I$ is the $m \times m$ matrix known as the identity. The matrix $Z$ is the inverse of $A$. Any square nonsingular matrix $A$ has a unique inverse, written $A^{-1}$, that satisfies $AA^{-1} = A^{-1}A = I$.

The following theorem records a number of equivalent conditions that hold when a square matrix is nonsingular. These conditions appear in linear algebra texts, and we shall not give a proof here. Concerning (f), see Lecture 5.

Theorem 1.3. For $A \in \mathbb{C}^{m \times m}$, the following conditions are equivalent:

(a) $A$ has an inverse $A^{-1}$,
(b) $\mathrm{rank}(A) = m,$
(c) range(A) = $\mathbb{C}^m$,
(d) null(A) = {0},
(e) 0 is not an eigenvalue of $A$,
(f) 0 is not a singular value of $A$,
(g) $\det (A)\neq 0.$

Concerning (g), we mention that the determinant, though a convenient notion theoretically, rarely finds a useful role in numerical algorithms.

## A Matrix Inverse Times a Vector

When writing the product $x = A^{-1}b$, it is important not to let the inverse-matrix notation obscure what is really going on! Rather than thinking of $x$ as the result of applying $A^{-1}$ to $b$, we should understand it as the unique vector that satisfies the equation $Ax = b$. By (1.2), this means that $x$ is the vector of coefficients of the unique linear expansion of $b$ in the basis of columns of $A$.

This point cannot be emphasized too much, so we repeat:

$A^{-1}b$  is the vector of coefficients of the expansion of b in the basis of columns of A.

Multiplication by $A^{-1}$ is a change of basis operation:

<!-- page 19 of 371 -->

LECTURE 1. MATRIX-VECTOR MULTIPLICATION

9

![Image block](doc:25e5516/tier:advanced/page:19/block:3)

<details>
<summary>flowchart</summary>

```mermaid
graph LR
  A["b: coefficients of the expansion of b in {e₁, ..., eₘ}"] -->|"Multiplication by A⁻¹"| B["A⁻¹b: coefficients of the expansion of b in {a₁, ..., aₘ}"]
  B -->|"Multiplication by A"| A
```
</details>

In this description we are being casual with terminology, using “b” in one instance to denote an m-tuple of numbers, and in another, as a point in an abstract vector space. The reader should think about these matters until he or she is comfortable with the distinction.

## A Note on $m$ and $n$

Throughout numerical linear algebra, it is customary to take a rectangular matrix to have dimensions $m \times n$. We follow this convention in this book.

What if the matrix is square? The usual convention is to give it dimensions $n \times n$, but in this book we shall generally take the other choice, $m \times m$. Many of our algorithms require us to look at rectangular submatrices formed by taking a subset of the columns of a square matrix. If the submatrix is to be $m \times n$, the original matrix had better be $m \times m$.

## Exercises

1.1. Let $B$ be a $4 \times 4$ matrix to which we apply the following operations:

1. double column 1,
2. halve row 3,
3. add row 3 to row 1,
4. interchange columns 1 and 4,
5. subtract row 2 from each of the other rows,
6. replace column 4 by column 3,
7. delete column 1 (so that the column dimension is reduced by 1).

(a) Write the result as a product of eight matrices.

(b) Write it again as a product $ABC$ (same $B$) of three matrices.

1.2. Suppose masses  $m_{1}, m_{2}, m_{3}, m_{4}$  are located at positions  $x_{1}, x_{2}, x_{3}, x_{4}$  in a line and connected by springs with spring constants  $k_{12}, k_{23}, k_{34}$  whose natural lengths of extension are  $\ell_{12}, \ell_{23}, \ell_{34}$ . Let  $f_{1}, f_{2}, f_{3}, f_{4}$  denote the rightward forces on the masses, e.g.,  $f_{1} = k_{12}(x_{2} - x_{1} - \ell_{12})$ .

<!-- page 20 of 371 -->

10

PART I. FUNDAMENTALS

(a) Write the $4 \times 4$ matrix equation relating the column vectors $f$ and $x$. Let $K$ denote the matrix in this equation.
(b) What are the dimensions of the entries of $K$ in the physics sense (e.g., mass times time, distance divided by mass, etc.)?
(c) What are the dimensions of $\det(K)$, again in the physics sense?
(d) Suppose K is given numerical values based on the units meters, kilograms, and seconds. Now the system is rewritten with a matrix  $K'$  based on centimeters, grams, and seconds. What is the relationship of  $K'$  to K? What is the relationship of  $\det(K')$  to  $\det(K)$ ?

1.3. Generalizing Example 1.3, we say that a square or rectangular matrix $R$ with entries $r_{ij}$ is upper-triangular if $r_{ij} = 0$ for $i > j$. By considering what space is spanned by the first $n$ columns of $R$ and using (1.8), show that if $R$ is a nonsingular $m \times m$ upper-triangular matrix, then $R^{-1}$ is also upper-triangular. (The analogous result also holds for lower-triangular matrices.)

1.4. Let $f_{1}, \ldots, f_{8}$ be a set of functions defined on the interval [1, 8] with the property that for any numbers $d_{1}, \ldots, d_{8}$, there exists a set of coefficients $c_{1}, \ldots, c_{8}$ such that

$$
\sum_ {j = 1} ^ {8} c _ {j} f _ {j} (i) = d _ {i}, \qquad i = 1, \dots , 8.
$$

(a) Show by appealing to the theorems of this lecture that $d_1, \ldots, d_8$ determine $c_1, \ldots, c_8$ uniquely.
(b) Let $A$ be the $8 \times 8$ matrix representing the linear mapping from data $d_1, \ldots, d_8$ to coefficients $c_1, \ldots, c_8$. What is the $i, j$ entry of $A^{-1}$?

<!-- page 21 of 371 -->

# Lecture 2. Orthogonal Vectors and Matrices

Since the 1960s, many of the best algorithms of numerical linear algebra have been based in one way or another on orthogonality. In this lecture we present the ingredients: orthogonal vectors and orthogonal (unitary) matrices.

## Adjoint

The complex conjugate of a scalar $z$, written $\overline{z}$ or $z^{*}$, is obtained by negating its imaginary part. For real $z$, $\overline{z} = z$.

The hermitian conjugate or adjoint of an $m \times n$ matrix $A$, written $A^*$, is the $n \times m$ matrix whose $i, j$ entry is the complex conjugate of the $j, i$ entry of $A$. For example,

$$
A = \left[ \begin{array}{l l} a _ {1 1} & a _ {1 2} \\ a _ {2 1} & a _ {2 2} \\ a _ {3 1} & a _ {3 2} \end{array} \right] \quad \Longrightarrow \quad A ^ {*} = \left[ \begin{array}{l l l} \overline {{a}} _ {1 1} & \overline {{a}} _ {2 1} & \overline {{a}} _ {3 1} \\ \overline {{a}} _ {1 2} & \overline {{a}} _ {2 2} & \overline {{a}} _ {3 2} \end{array} \right].
$$

If $A = A^{*}$, $A$ is hermitian. By definition, a hermitian matrix must be square. For real $A$, the adjoint simply interchanges the rows and columns of $A$. In this case, the adjoint is also known as the transpose, and is written $A^T$. If a real matrix is hermitian, that is, $A = A^T$, then it is also said to be symmetric.

Most textbooks of numerical linear algebra assume that the matrices under discussion are real and thus principally use $^{T}$ instead of $^{*}$. Since most of the ideas to be dealt with are not intrinsically restricted to the reals, however, we have followed the other course. Thus, for example, in this book a row vector

11

<!-- page 22 of 371 -->

12

PART I. FUNDAMENTALS

will usually be denoted by, say, $a^*$ rather than $a^T$. The reader who prefers to imagine that all quantities are real and that $*$ is a synonym for $^T$ will rarely get into trouble.

## Inner Product

The inner product of two column vectors $x, y \in \mathbb{C}^m$ is the product of the adjoint of $x$ by $y$:

$$
x ^ {*} y = \sum_ {i = 1} ^ {m} \overline {{x}} _ {i} y _ {i}. \tag {2.1}
$$

The Euclidean length of $x$ may be written $\| x \|$ (vector norms such as this are discussed systematically in the next lecture), and can be defined as the square root of the inner product of $x$ with itself:

$$
\| x \| = \sqrt {x ^ {*} x} = \left(\sum_ {i = 1} ^ {m} \left| x _ {i} \right| ^ {2}\right) ^ {1 / 2}. \tag {2.2}
$$

The cosine of the angle $\alpha$ between $x$ and $y$ can also be expressed in terms of the inner product:

$$
\cos \alpha = \frac {x ^ {*} y}{\| x \| \| y \|}. \tag {2.3}
$$

At various points of this book, as here, we mention geometric interpretations of algebraic formulas. For these geometric interpretations, the reader should think of the vectors as real rather than complex, although usually the interpretations can be carried over in one way or another to the complex case too.

The inner product is bilinear, which means that it is linear in each vector separately:

$$
(x _ {1} + x _ {2}) ^ {*} y = x _ {1} ^ {*} y + x _ {2} ^ {*} y,
$$

$$
x ^ {*} (y _ {1} + y _ {2}) = x ^ {*} y _ {1} + x ^ {*} y _ {2},
$$

$$
(\alpha x) ^ {*} (\beta y) = \overline {{\alpha}} \beta x ^ {*} y.
$$

We shall also frequently use the easily proved property that for any matrices or vectors $A$ and $B$ of compatible dimensions,

$$
(A B) ^ {*} = B ^ {*} A ^ {*}. \tag {2.4}
$$

This is analogous to the equally important formula for products of invertible square matrices,

$$
(A B) ^ {- 1} = B ^ {- 1} A ^ {- 1}. \tag {2.5}
$$

The notation $A^{-*}$ is a shorthand for $(A^{*})^{-1}$ or $(A^{-1})^{*}$; these two are equal, as can be verified by applying (2.4) with $B = A^{-1}$.

<!-- page 23 of 371 -->

LECTURE 2. ORTHOGONAL VECTORS AND MATRICES

13

## Orthogonal Vectors

A pair of vectors x and y are orthogonal if  $x^{*}y = 0$ . If x and y are real, this means they lie at right angles to each other in  $R^{m}$ . Two sets of vectors X and Y are orthogonal (also stated “X is orthogonal to Y”) if every  $x \in X$  is orthogonal to every  $y \in Y$ .

A set of nonzero vectors $S$ is orthogonal if its elements are pairwise orthogonal, i.e., if for $x, y \in S$, $x \neq y \Rightarrow x^{*}y = 0$. A set of vectors is orthonormal if it is orthogonal and, in addition, every $x \in S$ has $\| x \| = 1$.

Theorem 2.1. The vectors in an orthogonal set $S$ are linearly independent.

Proof. If the vectors in $S$ are not independent, then some $v_{k} \in S$ can be expressed as a linear combination of other members $v_{1}, \ldots, v_{n} \in S$,

$$
v_{k} = \sum_{\substack{i = 1\\ i\neq k}}^{n}c_{i}v_{i}.
$$

Since $v_{k} \neq 0$, $v_{k}^{*}v_{k} = \| v_{k}\|^{2} > 0$. Using the bilinearity of inner products and the orthogonality of $S$, we calculate

$$
v_{k}^{*}v_{k} = \sum_{\substack{i = 1\\ i\neq k}}^{n}c_{i}v_{k}^{*}v_{i} = 0,
$$

which contradicts the assumption that the vectors in $S$ are nonzero.

![Image block](doc:25e5516/tier:advanced/page:23/block:12)

As a corollary of Theorem 2.1 it follows that if an orthogonal set $S \subseteq \mathbb{C}^m$ contains $m$ vectors, then it is a basis for $\mathbb{C}^m$.

## Components of a Vector

The most important idea to draw from the concepts of inner products and orthogonality is this: inner products can be used to decompose arbitrary vectors into orthogonal components.

For example, suppose that $\{q_1, q_2, \ldots, q_n\}$ is an orthonormal set, and let $v$ be an arbitrary vector. The quantity $q_j^* v$ is a scalar. Utilizing these scalars as coordinates in an expansion, we find that the vector

$$
r = v - \left(q _ {1} ^ {*} v\right) q _ {1} - \left(q _ {2} ^ {*} v\right) q _ {2} - \dots - \left(q _ {n} ^ {*} v\right) q _ {n} \tag {2.6}
$$

is orthogonal to $\{q_1, q_2, \ldots, q_n\}$. This can be verified by computing $q_i^* r$:

$$
q _ {i} ^ {*} r = q _ {i} ^ {*} v - (q _ {1} ^ {*} v) (q _ {i} ^ {*} q _ {1}) - \dots - (q _ {n} ^ {*} v) (q _ {i} ^ {*} q _ {n}).
$$

This sum collapses, since $q_{i}^{*}q_{j} = 0$ for $i \neq j$:

$$
q _ {i} ^ {*} r = q _ {i} ^ {*} v - (q _ {i} ^ {*} v) (q _ {i} ^ {*} q _ {i}) = 0.
$$

<!-- page 24 of 371 -->

14

PART I. FUNDAMENTALS

Thus we see that $v$ can be decomposed into $n + 1$ orthogonal components:

$$
v = r + \sum_ {i = 1} ^ {n} \left(q _ {i} ^ {*} v\right) q _ {i} = r + \sum_ {i = 1} ^ {n} \left(q _ {i} q _ {i} ^ {*}\right) v. \tag {2.7}
$$

In this decomposition, $r$ is the part of $v$ orthogonal to the set of vectors $\{q_1, q_2, \ldots, q_n\}$, or, equivalently, to the subspace spanned by this set of vectors, and $(q_i^* v)q_i$ is the part of $v$ in the direction of $q_i$.

If $\{q_i\}$ is a basis for $\mathbb{C}^m$, then $n$ must be equal to $m$ and $r$ must be the zero vector, so $v$ is completely decomposed into $m$ orthogonal components in the directions of the $q_i$:

$$
v = \sum_ {i = 1} ^ {m} \left(q _ {i} ^ {*} v\right) q _ {i} = \sum_ {i = 1} ^ {m} \left(q _ {i} q _ {i} ^ {*}\right) v. \tag {2.8}
$$

In both (2.7) and (2.8) we have written the formula in two different ways, once with $(q_i^* v)q_i$ and again with $(q_i q_i^*)v$. These expressions are equal, but they have different interpretations. In the first case, we view $v$ as a sum of coefficients $q_i^* v$ times vectors $q_i$. In the second, we view $v$ as a sum of orthogonal projections of $v$ onto the various directions $q_i$. The $i$th projection operation is achieved by the very special rank-one matrix $q_i q_i^*$. We shall discuss this and other projection processes in Lecture 6.

## Unitary Matrices

A square matrix $Q \in \mathbb{C}^{m \times m}$ is unitary (in the real case, we also say orthogonal) if $Q^{*} = Q^{-1}$, i.e., if $Q^{*}Q = I$. In terms of the columns of $Q$, this product can be written

$$
\left[ \begin{array}{cc}  & q _ {1} ^ {*} \\ \hline  & q _ {2} ^ {*} \\ \hline  & \vdots \\ \hline  & q _ {m} ^ {*} \end{array} \right]\left[ \begin{array}{c|c|c|c}  &  &  &  \\ q _ {1} & q _ {2} & \dots & q _ {m} \\  &  &  &  \\ \end{array} \right] = \left[ \begin{array}{cccc} 1 &  &  &  \\  & 1 &  &  \\  &  & \ddots &  \\  &  &  & 1 \end{array} \right].
$$

In other words, $q_{i}^{*}q_{j} = \delta_{ij}$, and the columns of a unitary matrix $Q$ form an orthonormal basis of $\mathbb{C}^m$. The symbol $\delta_{ij}$ is the Kronecker delta, equal to 1 if $i = j$ and 0 if $i \neq j$.

## Multiplication by a Unitary Matrix

In the last lecture we discussed the interpretation of matrix-vector products $Ax$ and $A^{-1}b$. If $A$ is a unitary matrix $Q$, these products become $Qx$ and $Q^{*}b$, and the same interpretations are of course still valid. As before, $Qx$ is the linear combination of the columns of $Q$ with coefficients $x$. Conversely,

<!-- page 25 of 371 -->

LECTURE 2. ORTHOGONAL VECTORS AND MATRICES

15

## $Q^{*}b$ is the vector of coefficients of the expansion of $b$ in the basis of columns of $Q$.

Schematically, the situation looks like this:

![Image block](doc:25e5516/tier:advanced/page:25/block:5)

<details>
<summary>flowchart</summary>

```mermaid
graph LR
  A["b: coefficients of the expansion of b in {e1, ..., em}"] -->|"Multiplication by Q*"| B["Q*b: coefficients of the expansion of b in {q1, ..., qm}"]
  B -->|"Multiplication by Q"| A
```
</details>

These processes of multiplication by a unitary matrix or its adjoint preserve geometric structure in the Euclidean sense, because inner products are preserved. That is, for unitary $Q$,

$$
(Q x) ^ {*} (Q y) = x ^ {*} y, \tag {2.9}
$$

as is readily verified by (2.4). The invariance of inner products means that angles between vectors are preserved, and so are their lengths:

$$
\| Q x \| = \| x \|. \tag {2.10}
$$

In the real case, multiplication by an orthogonal matrix Q corresponds to a rigid rotation (if  $\det Q = 1$ ) or reflection (if  $\det Q = -1$ ) of the vector space.

## Exercises

2.1. Show that if a matrix $A$ is both triangular and unitary, then it is diagonal.
2.2. The Pythagorean theorem asserts that for a set of $n$ orthogonal vectors $\{x_i\}$,

$$
\left\| \sum_ {i = 1} ^ {n} x _ {i} \right\| ^ {2} = \sum_ {i = 1} ^ {n} \| x _ {i} \| ^ {2}.
$$

(a) Prove this in the case $n = 2$ by an explicit computation of $\| x_1 + x_2\|^2$.
(b) Show that this computation also establishes the general case, by induction.

2.3. Let $A \in \mathbb{C}^{m \times m}$ be hermitian. An eigenvector of $A$ is a nonzero vector $x \in \mathbb{C}^m$ such that $Ax = \lambda x$ for some $\lambda \in \mathbb{C}$, the corresponding eigenvalue.

(a) Prove that all eigenvalues of $A$ are real.