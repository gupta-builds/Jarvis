---
type: class
class_kind: homework
status: sprout
created: 2026-10-18
updated: 2026-10-18
tags:
  - class
  - homework
area:
  - "[[CSCI 5304 Board]]"
next: "Hand-copy the solutions and the 4 diagrams below (2 boxes each for 1a and 1b) into the boxes of the printed Quiz - 3 PDF; confirm the real quiz number/date on Canvas — the PDF's own header prints \"Quiz 2,\" see Overview"
---
# Quiz - 3
## Overview
CSCI-5304 Fall 2026, 10 points, 1 question (3 sub-parts), written/proof-based (no coding). Source file: `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Midterm\Quiz - 3.pdf`, printed A4, boxed answer space under each sub-part, filled in by hand. Content is Trefethen & Bau **Exercise 10.4** (Givens rotations vs. Householder reflectors, Lecture 10 material).
> [!WARNING] Source PDF's own header says "Quiz 2 (10 points total)," not Quiz 3
> The printed page itself is titled "Quiz 2," but this file is `Quiz - 3.pdf` in the course folder and its content (Givens rotations, Lecture 10) is later material than the real Quiz #2 (SVD/Exercise 4.4, already solved in [[20_Progress/Degree/CSCI 5304/Quiz & HW/Quiz - 2|Quiz - 2]]). Same pattern [[CSCI 5304 Board]] already flags for this course (stale template artifacts in printed/Canvas materials) — treat the filename (`Quiz - 3`) as correct and the in-document header as the stale one. Confirm with the professor/Canvas before writing the quiz number on the physical sheet.
## Requirements
- [ ] **1. (Exercise 10.4)** $F=\begin{bmatrix}-c&s\\s&c\end{bmatrix}$, $J=\begin{bmatrix}c&s\\-s&c\end{bmatrix}$, $c=\cos\theta,\ s=\sin\theta$. $\det F=-1$ (Householder reflector in $\mathbb R^2$), $\det J=1$ (Givens rotation).
  - [ ] (a, 3 pts) Draw $\vec e_1,\vec e_2$ and their images $F\vec e_1,F\vec e_2$; describe exactly what $F$ does to $\mathbb R^2$.
  - [ ] (b, 3 pts) Repeat for $J$: draw the images, describe the action.
  - [ ] (c, 4 pts) Generalized Givens rotation $G(i,k,\theta)$ = identity with the $2\times2$ block $J$ in rows/cols $i,k$ — $G(i,k,\theta)A$ changes only rows $i,k$. Using Eq. 10.1 (p. 70) as the reference, how can a sequence of $G(i,k,\theta)$'s do the same job as the Householder reflector $Q_1$: introduce zeros below the diagonal in column 1 of $A$?
- [ ] Name/section line filled in before submission.
- [ ] Confirm quiz # and submission mechanism on Canvas (see Overview warning above).
## Work log
### 2026-10-18 — full written solve
Solved directly from the MinerU textbook extraction (`D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Textbook & Resources\CSCI 5304 Textbook (MinerU full extraction).md`), Lecture 10 (pp. 69-76: Eq. 10.1 zero-introduction diagram, Eq. 10.3's reflection-to-$\|x\|e_1$ picture, Algorithm 10.1). No vault Lecture 10 note exists yet (not lectured as of the last Board update), so this is read straight from the source text, not from a distillation. Every claim below is checked algebraically (determinants, explicit matrix-vector products) rather than asserted from memory.

### 1(a) — $F$: reflection
![[Quiz 3 - 1a box1 - F reflects e1.excalidraw]]
![[Quiz 3 - 1a box2 - F reflects e2.excalidraw]]
$F\vec e_1=(-c,s)^T$, $F\vec e_2=(s,c)^T$.
*Picture (worked for the concrete case $\theta=60°$, $c=\tfrac12,\ s=\tfrac{\sqrt3}2$, general case identical in structure):* $\vec e_1=(1,0)$ at $0°$, $\vec e_2=(0,1)$ at $90°$; $F\vec e_1=(-\tfrac12,\tfrac{\sqrt3}2)$ at $120°$, $F\vec e_2=(\tfrac{\sqrt3}2,\tfrac12)$ at $30°$. Draw all four as unit vectors from the origin, plus the line through the origin at $60°$ (the common bisector) — $\vec e_1$ and $F\vec e_1$ sit mirror-symmetric across it, and so do $\vec e_2,F\vec e_2$.
*General description:* comparing $F$ to the standard reflection matrix $R(\alpha)=\begin{bmatrix}\cos2\alpha&\sin2\alpha\\\sin2\alpha&-\cos2\alpha\end{bmatrix}$ gives $\cos2\alpha=-\cos\theta,\ \sin2\alpha=\sin\theta\Rightarrow 2\alpha=\pi-\theta$. **$F$ reflects $\mathbb R^2$ across the line through the origin at angle $\alpha=\tfrac{\pi-\theta}2=\tfrac\pi2-\tfrac\theta2$** — equivalently, the angle bisector of $\vec e_1$ and $F\vec e_1$ (and of $\vec e_2,F\vec e_2$). ($\det F=-1$ confirms reflection, not rotation.)

### 1(b) — $J$: rotation
![[Quiz 3 - 1b box1 - J rotates e1.excalidraw]]
![[Quiz 3 - 1b box2 - J rotates e2.excalidraw]]
$J\vec e_1=(c,-s)^T$, $J\vec e_2=(s,c)^T$.
*Picture (same $\theta=60°$):* $J\vec e_1=(\tfrac12,-\tfrac{\sqrt3}2)$ at $-60°$, $J\vec e_2=(\tfrac{\sqrt3}2,\tfrac12)$ at $30°$ — both $\vec e_1,\vec e_2$ rotated by the same $-60°$.
*General description:* $J=\begin{bmatrix}\cos\theta&\sin\theta\\-\sin\theta&\cos\theta\end{bmatrix}$ is the standard CCW rotation matrix $R(\phi)=\begin{bmatrix}\cos\phi&-\sin\phi\\\sin\phi&\cos\phi\end{bmatrix}$ with $\phi=-\theta$. **$J$ rotates $\mathbb R^2$ clockwise by angle $\theta$** (rigid rotation, $\det J=1$, lengths and angles between vectors preserved — unlike $F$, nothing is mirrored).

### 1(c) — Givens rotations replacing $Q_1$
Eq. 10.1 shows $Q_1$ zeroing **all** of $a_{21},a_{31},\dots,a_{m1}$ (every subdiagonal entry of column 1) in **one** unitary left-multiplication, by reflecting the length-$m$ vector $x=A_{1:m,1}$ to $\|x\|e_1$.
A Givens rotation $G(i,k,\theta)$ only touches 2 rows, so it can only zero **one** entry at a time. To match $Q_1$'s effect, chain $m-1$ of them, each eliminating one subdiagonal entry while leaving previously-made zeros alone:
- Work from the **bottom up**: first $G(m-1,m,\theta_{m-1})$ acts on rows $m-1,m$ to zero $a_{m1}$; then $G(m-2,m-1,\theta_{m-2})$ acts on rows $m-2,m-1$ to zero $a_{m-1,1}$ (using the value just placed in row $m-1$ by the previous step); continue up to $G(1,2,\theta_1)$, which zeros $a_{21}$ last. Each step only ever touches a row pair below the last one it set, so no earlier zero is disturbed.
- **Choosing $\theta$ for each step:** to zero row $k$'s entry using rows $i,k$ (current column-1 values $a_i,a_k$), pick $c=a_i/r,\ s=a_k/r,\ r=\sqrt{a_i^2+a_k^2}$ — directly from $J$'s action $(a_i,a_k)\mapsto(ca_i+sa_k,\,-sa_i+ca_k)=(r,0)$, the same $2\times2$ map as part (b) applied to the pair $(a_i,a_k)$ instead of $(\vec e_1,\vec e_2)$.
- **Net effect:** $\underbrace{G(1,2,\theta_1)G(2,3,\theta_2)\cdots G(m-1,m,\theta_{m-1})}_{\text{plays the role of }Q_1}\,A$ has zeros below the diagonal in column 1, exactly like $Q_1A$ in Eq. 10.1 — just built from $m-1$ cheap $2\times2$ rotations instead of one $m\times m$ reflector.
- Repeating this on column 2 (rotating rows $2,\dots,m$, so $m-2$ rotations), then column 3, etc. gives the full **Givens QR algorithm**, structurally identical to Algorithm 10.1 but with every $Q_k$ replaced by a product of 2-row rotations — this is exactly the algorithm Exercise 10.4(b)/(c) (not asked here) shows costs 6 flops/entry instead of Householder's 4, i.e. 50% more work, for the same triangularization.
### 2026-10-18 — diagrams drawn for 1(a) and 1(b)
The printed sheet gives 2 boxes per sub-part, so 4 diagrams total, built on the live Excalidraw MCP canvas (concrete case θ=60°, matching the work above) and exported as native `.excalidraw` files in `10_Areas/Excalidraw/`:
- Box 1 of 1(a): $\vec e_1=(1,0)$ at $0°$ and $F\vec e_1=(-\tfrac12,\tfrac{\sqrt3}2)$ at $120°$, with the mirror line at $\alpha=60°$ shown as a dashed line through the origin.
- Box 2 of 1(a): $\vec e_2=(0,1)$ at $90°$ and $F\vec e_2=(\tfrac{\sqrt3}2,\tfrac12)$ at $30°$, same mirror line.
- Box 1 of 1(b): $\vec e_1$ at $0°$ and $J\vec e_1$ at $-60°$, with a clockwise rotation arc labeled $\theta=60°$.
- Box 2 of 1(b): $\vec e_2$ at $90°$ and $J\vec e_2$ at $30°$, same rotation arc.
Open each embed in Excalidraw view (not Markdown preview) to see the actual drawing, and hand-copy each one onto its matching box on the printed sheet — don't just copy the vector coordinates, the point is the picture (axes, both vectors, and the mirror line or rotation arc).

### 2026-10-18 — fixed rendering bugs (2 rounds)
Box 1's $F\vec e_1$ arrow (the only vector in all 4 diagrams with both a negative x- and y-offset) first mis-rendered because it was built with just `x,y,width,height` and no explicit `points` array. That fix held, but a second, deeper issue turned up while building Homework 2's diagrams: the `excalidraw` MCP's own element output is missing several fields real Excalidraw elements need (`id`, `seed`, text `width`/`height`, etc.), which can crash the Obsidian plugin's renderer outright. All 4 diagrams above were rebuilt a second time with the complete schema (geometry unchanged, re-verified algebraically: bisector angle, rotation angle, arc-sweep direction) — full root-cause writeup in [[20_Progress/Degree/CSCI 5304/Quiz & HW/Homework - 2|Homework - 2]]'s work log.
## Concepts used
- **Householder reflectors** ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 10|Lecture 10]], not yet written in this vault — read straight from the MinerU extraction) — $F$'s reflection-across-a-line structure (1a) and the Eq. 10.1 zero-introduction pattern $Q_1$ is compared against (1c).
- **Givens rotations** (same Lecture 10 source, Exercise 10.4) — $J$'s rigid-rotation structure (1b); the $2\times2$ zero-introducing map generalized to $G(i,k,\theta)$ for QR factorization (1c).
- **Unitary/orthogonal matrices** ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 2 & 3|Lecture 2 & 3]]) — $\det=\pm1$ distinguishing reflection ($F$) from rotation ($J$); both preserve length and angle.
## Post-submit reflection
<!-- Optional until feedback: the first failure, the pattern, and what to change. -->
