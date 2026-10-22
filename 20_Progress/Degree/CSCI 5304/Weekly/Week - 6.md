---
type: class
input_kind: lecture
status: seed
created: 2026-10-22
updated: 2026-10-22
area:
  - "[[CSCI 5304 Board]]"
  - "[[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 12|Lecture - 12]]"
tags:
  - "#class"
  - "#Lecture"
next: "Build Week - 7 from the 10/20 transcript once its real content (an exam-review Q&A session, not new lecture material) is reconciled - and flag the live date conflict over the midterm, see Takeaways below"
---
# Week - 6
## What you must be able to do
- Link [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 12|Lecture - 12]] first.
- Define absolute and relative condition number, and state why relative condition numbers matter more in numerical analysis than absolute ones.
- Compute the condition number of a simple function (e.g. $f(x)=x/2$, $f(x_1,x_2)=x_1-x_2$) directly from its Jacobian.
- State the matrix condition number $\kappa(A)=\|A\|\|A^{-1}\|=\sigma_1/\sigma_m$ and explain what it predicts about digits of accuracy lost solving $Ax=b$.
- Note explicitly, per the professor's own 10/13 statement: this lecture's content is **not** in the midterm's stated scope ("the first two homework contents through chapter 11") even though it was taught before the exam - see Takeaways.
## Key ideas (short)
- A problem is **well-conditioned** if small input perturbations only cause small output changes; **ill-conditioned** if some small perturbation causes a large change - a property of the problem, not the algorithm solving it.
- The **relative condition number** matters more than the absolute one because floating-point arithmetic's errors are relative (a fixed number of significant bits), not absolute.
- **Cancellation error** ($x_1-x_2$ for $x_1\approx x_2$) is the condition-number formalization of "subtracting nearly-equal floating-point numbers is dangerous."
- The **matrix condition number** $\kappa(A)=\sigma_1/\sigma_m$ (largest over smallest singular value) governs how many digits of accuracy solving $Ax=b$ loses, independent of which algorithm is used.
- **This week's content is explicitly outside the midterm's stated scope** - the professor announced the exam's real boundary ("through chapter 11") on the same day this lecture was given.
## Concepts created today
- None created yet. Nothing in this week's single lecture was judged more load-bearing than [[20_Progress/Degree/CSCI 5304/Weekly/Week - 5|Week - 5]]'s already-flagged Householder Reflector candidate - the condition-number material is fully covered by this lecture's own Key Concepts and the worked examples below, with no additional reusable mechanism beyond what the Textbook note already holds.
## Examples worth keeping
- The live double worked numeric illustration of $f(x)=x/2$: perturbing $x=7$ by $\pm0.1$ versus perturbing $x=100$ by $\pm1$ - both "1% perturbations," but $\delta f$ is ten times larger in absolute terms for $x=100$, the live demonstration of why *relative* condition number (not raw $\delta f$) is the meaningful quantity.
- The live $f(x_1,x_2)=x_1-x_2$ example matching the book's Example 12.3 exactly: Jacobian $[1,-1]$, $\infty$-norm $=2$, $\kappa\to\infty$ as $x_1\to x_2$ - tied directly to "when you subtract two numbers that are very similar in floating-point arithmetic, the error can be almost unbounded."
- A real, ahead-of-schedule preview: machine epsilon and IEEE floating-point bit layout (mantissa/exponent), with the professor's own caveat "please don't quote me on those numbers" - used to motivate relative condition numbers before Lecture 13 formally covers floating point.
- The live numeric payoff: $\kappa\sim10^{10}$ and machine epsilon $\sim10^{-16}$ gives errors $\sim10^{-6}$, i.e. "only six digits of accuracy" - connecting the abstract condition-number definition to a concrete, alarming consequence before the Wilkinson-polynomial example (textbook-only this week) makes the same point more dramatically.
## Lecture
### 1. Lecture 12 — Conditioning and Condition Numbers (Tue 10/13)
Opened with a real schedule correction: the professor confirmed live that the printed calendar had been running behind by roughly a week since the start of the semester (today is genuinely the 13th, not "the 6th" as an earlier internal date had drifted to) - a real, user-facing instance of the same schedule-drift pattern already logged on [[CSCI 5304 Board]]. Confirmed a live, in-person exam for Thursday that week and stated the exam's real scope directly: "the first two homework contents through chapter 11" - explicitly excluding this lecture (Lecture 12) despite teaching it the same day. Built conditioning definitions bottom-up: problem as a function $f:X\to Y$, absolute condition number via the Jacobian, then the relative condition number (worked live for $f(x)=x/2$ and $f(x_1,x_2)=x_1-x_2$, see Examples above). Introduced machine epsilon and IEEE floating-point storage informally, ahead of Lecture 13, specifically to motivate why relative condition numbers are the ones that matter in practice. Closed by deriving the matrix condition number $\kappa(A)=\sigma_1/\sigma_m$ directly from the matrix-vector-product definition of $\kappa$, reusing the SVD.
## Textbook integration
> [!IMPORTANT]
> Main chapter: [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 12|Lecture - 12]] (pp. 89-96).

The book adds real depth beyond what landed live: Examples 12.4-12.6 (computing $\tan(10^{100})$, the Wilkinson polynomial's $\kappa\approx5.1\times10^{13}$, and nonsymmetric-matrix eigenvalue ill-conditioning) were not worked in lecture at all - textbook-only; the exact formal statement of Theorem 12.1 (condition numbers for computing $b$ from $x$ versus $x$ from $b$) and Theorem 12.2 (condition of the system itself under perturbations of $A$) were named qualitatively live but not derived with the same rigor as the book's proofs.
> [!WARNING] Real schedule anomaly, confirmed live on 10/13
> The professor stated directly that the semester's internal date tracking had drifted by about a week ("today is not the sixth, and a week is not two days... I believe these dates were correct and then for some reason I just stopped changing the dates"). This is a live, first-hand confirmation of the same kind of schedule drift [[CSCI 5304 Board]] already logs as three separate anomalies - update the Board's schedule-anomaly section with this explicit professor-confirmed cause the next time it's touched.
## Takeaways (questions to resolve)
- [x] Confirmed 10/13: the midterm's real scope is "the first two homework contents through chapter 11" - Lecture 12 (this week) is explicitly excluded despite being taught the same day.
- [ ] **Real, unresolved date conflict - do not silently pick a side.** [[CSCI 5304 Board]] was corrected 2026-10-21 to state the midterm "actually happened Tuesday, October 20th," per the user directly. But the 10/13 transcript has the professor confirming a live, *in-person* exam for "Thursday, this week" (i.e. 10/15, the Thursday immediately following 10/13) - not 10/20. Separately, the 10/20 transcript itself (see [[20_Progress/Degree/CSCI 5304/Weekly/Week - 7|Week - 7]]) is a pre-exam review/Q&A session explicitly anticipating an exam "Thursday, this week" (10/22), not a transcript of an exam that already happened on 10/20. Three different dates (10/15 stated 10/13, 10/20 per the Board's correction, 10/22 anticipated live on 10/20) now conflict. This needs a direct Canvas/instructor check, not another guess - flagged here rather than smoothed over.
- [ ] Confirm whether the live machine-epsilon preview gets formally revisited in Lecture 13, since the professor's own numbers here carried an explicit "don't quote me" caveat.
## Lecture-to-textbook synthesis
==Conditioning formalizes a worry every numerical method has to answer eventually: is the problem itself trustworthy, independent of how well any particular algorithm solves it?==
*Mechanism:* model the problem as $f:X\to Y$; the relative condition number $\kappa=\|J(x)\|/(\|f(x)\|/\|x\|)$ measures worst-case relative output sensitivity to input perturbation, and for matrices this collapses to $\kappa(A)=\sigma_1/\sigma_m$ - one number that predicts digits of accuracy lost regardless of algorithm.
- Lecture example/scenario: the live $x_1-x_2$ cancellation-error derivation, paired with the live $\kappa\sim10^{10}$, machine-epsilon-$\sim10^{-16}$ numeric payoff ("only six digits of accuracy").
- Textbook connection: [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 12|Lecture - 12]]'s eq. 12.16-12.17 ($\kappa(A)=\sigma_1/\sigma_m$ or $\sigma_1/\sigma_n$) directly reuses the SVD from Weeks 2-3.
- Concept links: none created this week - see Concepts created today above.
> [!WARNING]
> Assuming this lecture is midterm-relevant because it was taught before the exam. The professor stated the exam's scope stops at Lecture 11, explicitly excluding this week's material.

> [!SUMMARY]
> This week is the course's pivot from "how do we compute things" (Parts I-II) to "how trustworthy is the answer" (Part III) - and the professor drew a hard scope line for the midterm exactly at that pivot point.
## Flashcards
Why does the professor's own 10/13 statement matter for exam prep this week?::He stated the midterm covers "the first two homework contents through chapter 11" - Lecture 12 (conditioning), though taught that same day, is explicitly out of scope for that exam. #cards/5304
What is the formal name for the phenomenon behind "subtracting nearly-equal floating point numbers is dangerous"?::Cancellation error - formalized as the condition number of $f(x_1,x_2)=x_1-x_2$ blowing up as $x_1\to x_2$. #cards/5304
Give the matrix condition number formula in terms of singular values, and what it predicts.::$\kappa(A)=\sigma_1/\sigma_m$; it predicts that solving $Ax=b$ loses roughly $\log_{10}\kappa(A)$ digits of accuracy, regardless of the algorithm used. #cards/5304
What live, first-hand schedule correction did the professor make on 10/13?::Confirmed the semester's internal date tracking had drifted about a week behind since early in the term - a direct professor confirmation of the same pattern the Board's schedule-anomaly warnings already describe. #cards/5304
