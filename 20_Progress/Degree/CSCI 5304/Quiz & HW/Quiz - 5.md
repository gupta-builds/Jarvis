---
type: class
class_kind: homework
status: sprout
created: 2026-11-24
updated: 2026-11-24
tags:
  - class
  - homework
area:
  - "[[CSCI 5304 Board]]"
next: "Hand-copy the four boxed answers below into the four printed boxes of Quiz - 5.pdf (a on page 1, b, c, d on page 2), fill in Name and Section, and confirm the due date and submission method on Canvas"
---
# Quiz - 5
## Overview
CSCI-5304 Fall 2026, 10 points, 1 question with four parts (4 + 2 + 2 + 2), written, computed by hand, no coding. Source file: `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Midterm\Quiz - 5.pdf`, one boxed answer space per part, filled in by hand. Content is Trefethen & Bau **Exercise 18.1** (least squares conditioning, Lecture 18, Theorem 18.1), parts (a) to (d) only. Part (e) of the textbook exercise is not on the quiz.
The Nov 17 and Nov 19 transcripts say a take-home quiz would be posted on Nov 19. I found no due date in any transcript, so confirm it on Canvas.
The text extraction of the PDF reads part (c) as "$\eta'$". The page image shows plain $\eta$, the same $\eta$ as textbook (18.5). Treat it as $\eta$.
## Requirements
- [ ] **1. (Exercise 18.1)** $A=\begin{bmatrix}1&1\\1&1.0001\\1&1.0001\end{bmatrix}$, $\vec b=\begin{bmatrix}2\\0.0001\\4.0001\end{bmatrix}$.
  - [ ] (a, 4 pts) The matrices $A^\dagger$ and $P$, computed by hand, **exact** answers. Box is about 5.7 in wide by 6.2 in tall.
  - [ ] (b, 2 pts) The exact least squares solution $\vec x$ and $\vec y=A\vec x$. Box is about 5.7 in by 3.7 in.
  - [ ] (c, 2 pts) $\kappa(A)$, $\theta$, $\eta$. Numerical answers are accepted. Box is about 5.7 in by 2.1 in.
  - [ ] (d, 2 pts) The four condition numbers of Theorem 18.1. Box is about 5.7 in by 2.1 in.
- [ ] Name and Section lines filled in.
- [ ] Confirm due date and submission method on Canvas.
## Work log
### 2026-11-24 - full written solve
Solved from the textbook extraction (`CSCI 5304 Textbook (MinerU full extraction).md`): Lecture 18 with definitions (18.2) to (18.6), Theorem 18.1, and Exercise 18.1. The pseudoinverse and projector come from Lecture 11, and $\kappa(A)=\sigma_1/\sigma_n$ from (18.3).
**What the lectures give.** The Nov 10 lecture (the only one on this topic) states the same table as Theorem 18.1 and the two geometric facts the answers rely on. First, $\theta$ is the angle between $\vec b$ and range$(A)$, with $0\le\theta\le\pi/2$. Second, $\vec y=P\vec b$ is the projection of $\vec b$ onto range$(A)$ and $\vec x=A^\dagger\vec b$ is the least squares solution. The professor did not work Exercise 18.1 in class. The Oct 22 transcript, the day Lecture 18 was scheduled, only holds the pre-exam announcement and says nothing about this material.
**Definitions used (textbook, Lecture 18).** Write $d=10^{-4}$, so $A=\begin{bmatrix}1&1\\1&1+d\\1&1+d\end{bmatrix}$ and $\vec b=\begin{bmatrix}2\\d\\4+d\end{bmatrix}$.
- $A^\dagger=(A^TA)^{-1}A^T$ (full rank), $P=AA^\dagger$ is the orthogonal projector onto range$(A)$.
- $\vec x=A^\dagger\vec b$, $\vec y=P\vec b=A\vec x$.
- $\kappa(A)=\sigma_1/\sigma_n$ (18.3), $\theta=\cos^{-1}(\|\vec y\|/\|\vec b\|)$ (18.4), $\eta=\|A\|\|\vec x\|/\|\vec y\|$ (18.5). All norms are 2-norms.
- Theorem 18.1 table: $\vec b\to\vec y$ is $1/\cos\theta$. $\vec b\to\vec x$ is $\kappa/(\eta\cos\theta)$. $A\to\vec y$ is $\kappa/\cos\theta$. $A\to\vec x$ is $\kappa+\kappa^2\tan\theta/\eta$.
### 1(a) - handwritten answer: $A^\dagger$ and $P$
Copy this into the page 1 box. Set $d=10^{-4}$.
1. Columns of $A$ are independent (the $2\times2$ minor from rows 1 and 2 is $d\ne0$), so $A^\dagger=(A^TA)^{-1}A^T$.
2. $$A^TA=\begin{bmatrix}3&3+2d\\3+2d&3+4d+2d^2\end{bmatrix},\qquad\det(A^TA)=3(3+4d+2d^2)-(3+2d)^2=2d^2.$$
3. $$(A^TA)^{-1}=\frac{1}{2d^2}\begin{bmatrix}3+4d+2d^2&-(3+2d)\\-(3+2d)&3\end{bmatrix},\qquad A^T=\begin{bmatrix}1&1&1\\1&1+d&1+d\end{bmatrix}.$$
4. Row 1 of $A^\dagger$: $\frac1{2d^2}\big[(3+4d+2d^2)-(3+2d),\ (3+4d+2d^2)-(3+2d)(1+d),\ \text{same}\big]=\frac1{2d^2}[\,2d+2d^2,\ -d,\ -d\,]$.
5. Row 2 of $A^\dagger$: $\frac1{2d^2}\big[-(3+2d)+3,\ -(3+2d)+3(1+d),\ \text{same}\big]=\frac1{2d^2}[\,-2d,\ d,\ d\,]$.
$$\boxed{A^\dagger=\begin{bmatrix}\frac{1+d}{d}&-\frac1{2d}&-\frac1{2d}\\-\frac1d&\frac1{2d}&\frac1{2d}\end{bmatrix}=\begin{bmatrix}10001&-5000&-5000\\-10000&5000&5000\end{bmatrix}}$$
Check: $A^\dagger A=I$. Entry (1,1): $10001-5000-5000=1$. Entry (1,2): $10001-2(5000)(1.0001)=0$.
6. $P=AA^\dagger$. Row 1 of $A$ is $(1,1)$, giving $(1,0,0)$. Rows 2 and 3 are $(1,1.0001)$, giving $(0,\tfrac12,\tfrac12)$ each, since $10001-10000(1.0001)=0$ and $-5000+5000(1.0001)=\tfrac12$.
$$\boxed{P=\begin{bmatrix}1&0&0\\0&\tfrac12&\tfrac12\\0&\tfrac12&\tfrac12\end{bmatrix}}$$
Check: $P=P^T=P^2$, rank 2. Range$(A)=\text{span}\{(1,0,0),(0,1,1)\}$ because rows 2 and 3 of $A$ are equal.
### 1(b) - handwritten answer: exact $\vec x$ and $\vec y$
Copy this into the first page 2 box.
1. $\vec x=A^\dagger\vec b$. Entry 1: $10001(2)-5000(0.0001+4.0001)=20002-5000(4.0002)=20002-20001=1$.
2. Entry 2: $-10000(2)+5000(4.0002)=-20000+20001=1$.
$$\boxed{\vec x=\begin{bmatrix}1\\1\end{bmatrix}}$$
3. $\vec y=A\vec x=\begin{bmatrix}1+1\\1+1.0001\\1+1.0001\end{bmatrix}$.
$$\boxed{\vec y=\begin{bmatrix}2\\2.0001\\2.0001\end{bmatrix}}$$
Check with $P$: $P\vec b=\big(2,\ \tfrac{0.0001+4.0001}2,\ \tfrac{0.0001+4.0001}2\big)=(2,\,2.0001,\,2.0001)$. Residual $\vec r=\vec b-\vec y=(0,-2,2)^T$ and $A^T\vec r=(0-2+2,\ -2(1.0001)+2(1.0001))=(0,0)$, so $\vec r\perp$ range$(A)$, as least squares requires.
### 1(c) - handwritten answer: $\kappa(A)$, $\theta$, $\eta$
Copy this into the second page 2 box.
- $\|\vec y\|^2=4+2(2.0001)^2=12.00080002$, so $\|\vec y\|\approx3.46422$.
- $\|\vec b\|^2=4+10^{-8}+(4.0001)^2=20.00080002$, so $\|\vec b\|\approx4.47222$. (Check: $\|\vec y\|^2+\|\vec r\|^2=12.0008+8$.)
- $\theta=\cos^{-1}\dfrac{\|\vec y\|}{\|\vec b\|}=\cos^{-1}(0.77461)$, so $\boxed{\theta\approx0.6847\text{ rad}\approx39.2^\circ}$, with $\cos\theta=0.77461$, $\tan\theta=\|\vec r\|/\|\vec y\|=\dfrac{2\sqrt2}{3.46422}=0.81647$.
- $\sigma_1\sigma_2=\sqrt{\det A^TA}=\sqrt2\,d=1.41421\times10^{-4}$ and $\sigma_1^2\approx\operatorname{tr}(A^TA)=6.0004$, so $\sigma_1=2.44957$, $\sigma_2=5.7733\times10^{-5}$. $\boxed{\kappa(A)=\sigma_1/\sigma_2\approx4.243\times10^{4}}$.
- $\eta=\dfrac{\|A\|\,\|\vec x\|}{\|\vec y\|}=\dfrac{2.44957\cdot\sqrt2}{3.46422}$, so $\boxed{\eta\approx1.0000}$ (1.0000000006 to ten digits).
### 1(d) - handwritten answer: the four condition numbers
Copy this into the third page 2 box.
Use $\kappa=4.2429\times10^4$, $\cos\theta=0.77461$, $\tan\theta=0.81647$, $\eta=1.0000$ in Theorem 18.1.

| | $\vec y$ | $\vec x$ |
|---|---|---|
| $\vec b$ | $\dfrac1{\cos\theta}\approx1.291$ | $\dfrac{\kappa}{\eta\cos\theta}\approx5.478\times10^{4}$ |
| $A$ | $\dfrac{\kappa}{\cos\theta}\approx5.478\times10^{4}$ | $\kappa+\dfrac{\kappa^2\tan\theta}{\eta}\approx4.2\times10^{4}+1.470\times10^{9}\approx1.470\times10^{9}$ |
The $\vec b$ row is exact (attained by some $\delta\vec b$). The $A$ row gives upper bounds. The $A\to\vec x$ entry is by far the worst, and it is dominated by the $\kappa^2\tan\theta/\eta$ term: the residual is large ($\theta\approx39^\circ$) and $A$ is nearly rank deficient.
*If room is left in (d):* $\eta\approx1$ is the lowest value allowed by $1\le\eta\le\kappa$, so it gives the worst $\vec b\to\vec x$ sensitivity for this $\kappa$ and $\theta$.
### Checks run
- **Exact arithmetic.** In Python with `fractions` (exact rationals): $A^\dagger=(A^TA)^{-1}A^T$ gives $\begin{bmatrix}10001&-5000&-5000\\-10000&5000&5000\end{bmatrix}$, $P=AA^\dagger$ gives the matrix above, $\vec x=(1,1)$, $\vec y=(2,\tfrac{20001}{10000},\tfrac{20001}{10000})$, $\vec r=(0,-2,2)$, and $A^T\vec r=0$ exactly. $\det A^TA=\tfrac1{5\times10^7}=2d^2$.
- **Squared norms.** $\|\vec y\|^2=\tfrac{600040001}{5\times10^{7}}$, $\|\vec b\|^2=\tfrac{1000040001}{5\times10^{7}}$, and $\|\vec y\|^2+\|\vec r\|^2=\|\vec b\|^2$ exactly (Pythagoras for the projection).
- **Singular values and parameters.** From the eigenvalues of $A^TA$ at 40-digit precision: $\sigma_1=2.449571394$, $\sigma_2=5.773310243\times10^{-5}$, $\kappa=42429.2354$, $\cos\theta=0.7746069970$, $\theta=0.684703$ rad, $\tan\theta=0.8164693651$, $\eta=1.000000000556$.
- **Table.** $1.290977$, $54775.177$, $54775.177$, $1.46988\times10^{9}$. The two $54775$ entries agree to eight digits because $\eta=1$.
- **Hand shortcut for $\kappa$.** $6.0004/(\sqrt2\times10^{-4})=42429.2$, matching the 40-digit value to six digits.
### Before writing it on the paper
- Part (a) wants **exact** answers. Write $A^\dagger$ with the integer entries ($10001$, $-5000$, $-10000$), not decimals like $1.0001\times10^4$, and keep the $d=10^{-4}$ formula next to them.
- Give $\vec x=(1,1)^T$ and $\vec y=(2,2.0001,2.0001)^T$ as exact values, not rounded.
- Say that $\theta$ is in radians or degrees. Write both.
- Each of the four condition numbers needs its own labeled cell. Do not merge the $\vec b$ row.
- Parts (c) and (d) accept numerical answers. Four significant digits are enough.
## Concepts used
- **Pseudoinverse and orthogonal projector** ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 11|Lecture 11]]): $A^\dagger=(A^TA)^{-1}A^T$ and $P=AA^\dagger$ in 1(a), and $\vec x=A^\dagger\vec b$, $\vec y=P\vec b$ in 1(b).
- **Least squares geometry** (Lecture 11, Nov 10 lecture): $\vec r\perp$ range$(A)$ is the check on 1(b), and $\theta$ is the angle between $\vec b$ and range$(A)$ in 1(c).
- **Condition number of a rectangular matrix** ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 12|Lecture 12]], textbook (18.3)): $\kappa(A)=\sigma_1/\sigma_n$ in 1(c), built from $\sigma_1\sigma_2=\sqrt{\det A^TA}$ and $\sigma_1^2\approx\operatorname{tr}A^TA$.
- **Theorem 18.1** (textbook Lecture 18, Nov 10 lecture): the four condition numbers in 1(d). Textbook Lecture 18 has no vault note yet, so it is cited from the extraction.
## Post-submit reflection
<!-- Optional until feedback: the first failure, the pattern, and what to change. -->
