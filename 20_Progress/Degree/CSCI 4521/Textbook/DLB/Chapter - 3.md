---
type: class
input_kind: book
status: needs-review
created: 2026-10-05
updated: 2026-10-05
area:
  - "[[CSCI 4521 Board]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/Textbook Map|Textbook Map]]"
tags:
  - "#class"
  - "#Textbook"
next: "Verify DLB §3.1–§3.3 against the local PDF in a text-accessible reader, then connect the notation to the Week 2 Bayes-classification capture."
---
# DLB Chapter 3 — Probability and Information Theory (§3.1–§3.3)
## Chapter Summary
==Probability gives machine learning a precise way to represent uncertainty: define possible states, assign a normalized distribution, and distinguish probability mass from continuous density.==
*Mechanism:* uncertainty can come from a stochastic process, hidden state, or a deliberately incomplete model; a random variable names the uncertain quantity; and a PMF or PDF distributes mass across its state space. A valid distribution must cover the states, remain nonnegative, and normalize to one. The consolidated note retains the prior source material; direct PDF text verification remains open.
## Key Concepts
### §3.1 Why Probability?
- **Sources of uncertainty:** inherent stochasticity is randomness in the process; incomplete observability means a deterministic state is hidden; incomplete modeling discards available detail. They all justify uncertain predictions, but they are not the same failure mode.
- **Frequentist and Bayesian probability:** frequentist probability is a limiting frequency across repeated trials; Bayesian probability expresses degree of belief under information. The chapter treats their common probability rules as the usable formal system.
### §3.2 Random Variables
- **Random variable:** a variable with possible states under a distribution. A discrete variable has finitely or countably many states; a continuous variable ranges over real values. A symbol for the variable is not the same thing as one realized value.
### §3.3 Probability Distributions
- **Probability mass function:** for a discrete variable, $P(x)$ satisfies $0\le P(x)\le1$ and $\sum_xP(x)=1$. A joint PMF $P(x,y)$ assigns probability to paired states.
- **Probability density function:** for a continuous variable, $p(x)\ge0$ and $\int p(x)\,dx=1$. A density at a point is not probability mass, so it may exceed one; interval probability is $P(x\in[a,b])=\int_a^bp(x)\,dx$.
- **Uniform distribution:** a continuous uniform density on $[a,b]$ is $u(x;a,b)=\frac{1}{b-a}\mathbf{1}_{x\in[a,b]}$. The indicator is zero outside the interval, which is what makes the full integral normalize.
## Examples Worth Keeping
- The Monty Hall example separates hidden-state uncertainty from physical randomness: the car’s location is fixed, but the contestant’s observation is incomplete, so the host’s action changes the contestant’s conditional information.
- A discrete uniform variable with $k$ states assigns each state $1/k$; summing $k$ such terms checks normalization directly.
- For a continuous uniform distribution, probability belongs to an interval, not to any exact point; integrating the constant density over $[a,b]$ gives one.
## Connections
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 2|Week 2]] is scheduled for Bayes classification; its notebook-based notes should be read as an application target for conditional class probability, not evidence that this build captured a live derivation.
- [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]] introduces the Bayes classifier as the ideal rule that chooses the largest conditional class probability.
- [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5|DLB Chapter 5]] frames density estimation as a learning task, using distributions rather than a single class label.
## Open Questions
- [ ] Verify the exact DLB §3.1–§3.3 edition and page anchors in `DLB Textbook CSCI 4521.pdf` with a text-accessible reader.
- [ ] Revisit the Week 2 Bayes-classification source to identify which conditional-probability notation the instructor actually used.
## Flashcards
What are the three sources of uncertainty distinguished here?::Inherent stochasticity, incomplete observability, and incomplete modeling. #cards/csci4521
Why can a PDF value exceed one while a PMF value cannot?::A PDF is density, not point probability; only its integral over a region is probability and must be at most one. #cards/csci4521
What must a valid discrete PMF satisfy?::It covers the variable’s states, assigns each a value from zero to one, and sums to one. #cards/csci4521
What turns a uniform density on $[a,b]$ into a valid distribution?::The density is $1/(b-a)$ inside the interval and zero outside, so its integral over the real line is one. #cards/csci4521
