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
# Chapter - 3 & 5
## Chapter Summary
<!-- State the chapter's one-sentence claim and use exactly one ==highlight== anchor. -->
== ==
*Mechanism:*
<!-- Explain how the chapter's claim works. -->
# DLB Chapter 3 — Probability and Information Theory (§3.1-3.3)

## Chapter Summary

This reading note covers Sections 3.1 through 3.3 of Chapter 3 ("Probability and Information Theory", pp. 54–58) in the Deep Learning Book (Goodfellow, Bengio, Courville). **Probability theory** is the formal mathematical framework for representing uncertain statements, reasoning under uncertainty, and analyzing algorithmic behavior. In machine learning, uncertainty stems from three distinct sources: **inherent stochasticity** in the physical process, **incomplete observability** in deterministic systems, and **incomplete modeling** caused by discretizing or discarding observed information [54–55]. We compare **frequentist probability**, defined by the long-run limiting ratio of repeated trials, against **Bayesian probability**, defined as a qualitative **degree of belief** or subjective certainty [55–56]. We introduce a **random variable** as a quantity taking on values randomly across a state space, classifying variables into a **discrete random variable** with finite or countably infinite states or a **continuous random variable** associated with real numbers. We define a **probability distribution** as a mapping describing state likelihoods, utilizing a **probability mass function** (PMF) for discrete variables and a **probability density function** (PDF) for continuous variables [56–58]. ==Understanding probability distributions and their normalization conditions allows machine learning models to reason rigorously under uncertainty.== We examine a **joint probability distribution** across multiple variables, enforce the **normalized** property requiring probabilities to sum or integrate to 1, and construct continuous interval distributions using a **uniform distribution** [56–58].

## Key Concepts

| Term / Mathematical Object | Notation / Equation | Core Definition & Mechanism | Real Book Page |
| :--- | :--- | :--- | :--- |
| Probability Theory | $P(A)$ | Formal mathematical framework for quantifying, combining, and deriving uncertain statements. | p. 54 |
| Information Theory | $H(x)$ | Mathematical field that quantifies the amount of uncertainty present in a probability distribution. | p. 54 |
| Inherent Stochasticity | $x \sim p(x)$ | Fundamental non-deterministic randomness built into the physical system being modeled. | p. 54 |
| Incomplete Observability | $P(\text{state} \mid \text{observed})$ | Apparent randomness in a deterministic system caused by unobserved governing variables. | p. 55 |
| Incomplete Modeling | $x_{\text{discrete}} \in \text{Cell}$ | Uncertainty produced when a model discards observed information to preserve simplicity. | p. 55 |
| Frequentist Probability | $\lim_{N \to \infty} \frac{n}{N}$ | Probability metric defined by event frequencies over infinitely repeated trials. | p. 55 |
| Bayesian Probability | $P(\theta \mid \text{data})$ | Probability metric representing a qualitative degree of belief given incomplete information. | p. 55 |
| Random Variable | $\text{x} \in \mathbb{R}$ or $\text{x} \in \mathcal{S}$ | Variable that takes on different values randomly across a defined state space. | p. 56 |
| Discrete Random Variable | $\text{x} \in \{x_1, x_2, \dots\}$ | Random variable with a finite or countably infinite set of distinct states. | p. 56 |
| Continuous Random Variable | $\text{x} \in \mathbb{R}$ | Random variable associated with a real-valued, continuous range of numbers. | p. 56 |
| Probability Mass Function | $P(\text{x} = x)$ | Function mapping discrete states to real probabilities in $$, summing to 1. | pp. 56–57 |
| Joint Probability Distribution | $P(\text{x} = x, \text{y} = y)$ | Probability distribution assigning likelihoods to multiple variables occurring simultaneously. | p. 57 |
| Probability Density Function | $p(x) \ge 0, \int p(x) dx = 1$ | Function mapping continuous values to probability densities, integrated to yield probabilities. | pp. 57–58 |
| Uniform Distribution | $u(x; a, b) = \frac{1}{b - a} \cdot \mathbf{1}_{x \in [a, b]}$ | Distribution placing equal probability mass or density across all valid states within an interval. | pp. 57–58 |

==The table above defines the foundational terms, notation, and exact page references for probability theory in Sections 3.1 through 3.3.==

## Full Reading Notes

### 3.1 Why Probability?

Computer science usually operates on deterministic systems where instructions execute predictably. Machine learning requires probability theory because AI algorithms must make decisions under uncertainty and handle stochastic data.

Three distinct sources of uncertainty in machine learning:
1. Inherent stochasticity: The underlying physical process being modeled is fundamentally non-deterministic. Quantum mechanical systems or card games with shuffled decks exhibit intrinsic randomness.
2. Incomplete observability: A system's underlying dynamics are fully deterministic, but an agent cannot observe all variables that drive its behavior. In the Monty Hall problem, the car's physical location behind one of three doors is fixed, but from the contestant's unobserved perspective, the outcome is uncertain.
3. Incomplete modeling: A system discards observed information to maintain a simple or computationally tractable rule. Discretizing continuous spatial coordinates into grid cells forces an agent to become uncertain about precise object positions within each cell.

Using simple, uncertain rules (e.g., "Most birds fly") is computationally preferable to complex, deterministic rules (e.g., listing every flightless, injured, or newborn bird species). Simple rules are cheaper to develop, store, and communicate, whereas hyper-specific deterministic rules are brittle and fail under novel conditions.

Two interpretations of probability:
*   Frequentist probability: Directly measures the long-run limiting frequency at which an event occurs over infinitely repeated trials (e.g., drawing card hands in poker).
*   Bayesian probability: Quantifies a qualitative degree of belief or level of certainty regarding a non-repeatable proposition (e.g., a doctor diagnosing a patient's flu probability based on symptoms).

Mechanism: Common-sense assumptions regarding uncertainty require Bayesian probabilities to satisfy the exact same mathematical axioms as frequentist probabilities. Probability theory acts as an extension of formal logic to handle uncertainty.

### 3.2 Random Variables

A random variable is a variable that can take on different values randomly across a sample space.
*   Notation: Plain lower-case italic letter $\text{x}$ denotes the random variable; lower-case script $x$ or indexed values $x_1, x_2$ denote specific values it can take on.
*   Vector-valued random variables: Written as bold plain lower-case $\mathbf{x}$, with specific values written as bold vector $\mathbf{x}$.

Categorization by state space:
*   A discrete random variable has a finite or countably infinite number of states. States need not be numerical (e.g., named categorical states).
*   A continuous random variable is associated with a real-valued numerical domain.

A random variable must be paired with a probability distribution that specifies the likelihood of each state.

### 3.3 Probability Distributions

A probability distribution describes how likely a random variable or set of random variables is to take on each possible state.

#### 3.3.1 Discrete Variables and Probability Mass Functions

A discrete distribution is described using a probability mass function (PMF), denoted by uppercase $P$.
*   Notation: $P(\text{x} = x)$ or $P(x)$ denotes the probability that random variable $\text{x}$ equals state $x$.
*   Distribution assignment: Written as $\text{x} \sim P(\text{x})$.
*   Joint probability distribution: $P(\text{x} = x, \text{y} = y)$ or $P(x, y)$ gives the probability that $\text{x} = x$ and $\text{y} = y$ occur simultaneously.

To be a valid PMF, function $P$ must satisfy three conditions:
1.  Domain matching: The domain of $P$ must cover all possible states of $\text{x}$.
2.  Bounded probabilities: $\forall x \in \text{x}, \quad 0 \le P(x) \le 1$.
3.  Normalization: $\sum_{x \in \text{x}} P(x) = 1$.

Example — Discrete Uniform Distribution: For a discrete random variable $\text{x}$ with $k$ distinct states, a uniform distribution assigns equal probability to every state:

$$P(\text{x} = x_i) = \frac{1}{k} \tag{3.1}$$

Verification of normalization:

$$\sum_{i=1}^{k} P(\text{x} = x_i) = \sum_{i=1}^{k} \frac{1}{k} = \frac{k}{k} = 1 \tag{3.2}$$

#### 3.3.2 Continuous Variables and Probability Density Functions

A continuous distribution is described using a probability density function (PDF), denoted by lowercase $p$.

To be a valid PDF, function $p$ must satisfy three conditions:
1.  Domain matching: The domain of $p$ must cover all possible states of $\text{x}$.
2.  Non-negativity: $\forall x \in \text{x}, \quad p(x) \ge 0$. (Note: $p(x)$ is a density, so $p(x) > 1$ is permitted).
3.  Normalization: $\int p(x) dx = 1$.

Mechanism: A PDF $p(x)$ does not yield the probability of a specific point directly (the probability of any exact point in a continuous space is 0). Instead, the probability of landing in an infinitesimal volume $\delta x$ surrounding $x$ is given by $p(x)\delta x$. Integrating $p(x)$ over interval $[a, b]$ yields the true probability mass:

$$P(\text{x} \in [a, b]) = \int_a^b p(x) dx \tag{3.3}$$

Example — Continuous Uniform Distribution: Consider a uniform PDF on interval $[a, b]$ with $b > a$, parameterized as $u(x; a, b)$:

$$u(x; a, b) = \frac{1}{b - a} \cdot \mathbf{1}_{x \in [a, b]} \tag{3.4}$$

where indicator function $\mathbf{1}_{x \in [a, b]}$ equals 1 if $x \in [a, b]$ and 0 otherwise. Expressed in distribution notation as $\text{x} \sim U(a, b)$.

Verification of normalization:

$$\int_{-\infty}^{\infty} u(x; a, b) dx = \int_a^b \frac{1}{b - a} dx = \left[ \frac{x}{b - a} \right]_a^b = \frac{b - a}{b - a} = 1 \tag{3.5}$$

==Sections 3.1 through 3.3 formalize probability theory, distinguishing discrete PMFs from continuous PDFs and defining valid normalization rules.==

## Worked Example

The Deep Learning Book highlights the Monty Hall problem (p. 55) to demonstrate how incomplete observability creates operational uncertainty in a deterministic system:

1.  Game Setup: A game show features three closed doors ($D_1, D_2, D_3$). One door conceals a sports car; the other two conceal goats.
2.  Deterministic Reality: The car placement is fixed before the game begins. Let $C \in \{1, 2, 3\}$ be the true door containing the car.
3.  Contestant Choice: The contestant picks a door, say $D_1$. The prior probability of winning is $P(C = 1) = \frac{1}{3}$.
4.  Host Action: Host Monty Hall—who knows where the car is located—opens one of the remaining doors ($D_2$ or $D_3$) that he knows contains a goat. Suppose he opens $D_3$.
5.  Incomplete Observability Mechanism:
    *   The underlying physical state $C$ has not changed; it remains entirely deterministic.
    *   However, the contestant cannot directly observe $C$. Monty's action reveals conditional information about the unobserved variables.
    *   Because Monty must avoid opening the door with the car ($C$) and cannot open the contestant's door ($D_1$), opening $D_3$ concentrates all remaining probability mass for the unchosen doors onto $D_2$.
6.  Updated Probability:
    $$P(C = 1 \mid \text{Monty opens } D_3) = \frac{1}{3}$$
    $$P(C = 2 \mid \text{Monty opens } D_3) = \frac{2}{3}$$
7.  Conclusion: Switching to $D_2$ doubles the contestant's probability of winning from $\frac{1}{3}$ to $\frac{2}{3}$. This demonstrates that probability measures an observer's state of knowledge given incomplete observability, rather than requiring dynamic randomness in the physical world.

==The Monty Hall problem proves that probability rigorously models an agent's incomplete observability within a deterministic environment.==

## Connections

*   Connection to ISL §2.2.3 (The Bayes Classifier): In Introduction to Statistical Learning, the Bayes classifier assigns an observation $x_0$ to the class $j$ that maximizes conditional probability $P(Y = j \mid X = x_0)$. This optimal classifier relies directly on DLB §3.3's concept of conditional PMFs over discrete targets.
*   Connection to ISL §4.4 (Generative Models for Classification): Methods like Linear Discriminant Analysis (LDA) use Bayes' theorem to invert class-conditional continuous PDFs $f_k(x) = p(X = x \mid Y = k)$ and class prior probabilities $\pi_k = P(Y = k)$ into posterior probabilities $P(Y = k \mid X = x)$, illustrating how discrete PMFs and continuous PDFs combine in statistical learning.

==Connecting DLB's probabilistic foundations to ISL highlights how probability distributions underpin optimal classification boundaries.==

## Open Questions

1.  How do we mathematically reconcile Bayesian degree-of-belief probabilities with frequentist long-run limits when designing learning algorithms?
2.  Why does calculating continuous PDF values at specific points $p(x)$ yield values greater than 1, while discrete PMF values $P(x)$ are strictly capped at 1?
3.  How does incomplete modeling differ from inherent stochasticity when calculating the total irreducible error of a predictive model?
4.  Why must an agent update its conditional probability estimates when observing actions from an actor whose decisions depend on unobserved variables?

==These questions encourage deeper reflection on probability metrics, continuous density bounds, and decision-making under uncertainty.==

## Flashcards

1.  Q: What are the three primary sources of uncertainty in machine learning?
    A: Inherent stochasticity in the physical system, incomplete observability of governing variables, and incomplete modeling due to information discretization.
2.  Q: How does frequentist probability differ from Bayesian probability?
    A: Frequentist probability measures long-run event frequencies over infinitely repeated trials, whereas Bayesian probability quantifies a qualitative degree of belief or subjective certainty.
3.  Q: What is the core mathematical distinction between a discrete and a continuous random variable?
    A: A discrete random variable has a finite or countably infinite state space, whereas a continuous random variable takes on values across a continuous real-valued domain.
4.  Q: What three conditions must a probability mass function (PMF) $P(x)$ satisfy?
    A: (1) Domain matches all states of $\text{x}$; (2) $0 \le P(x) \le 1$ for all $x$; (3) Normalization: $\sum_x P(x) = 1$.
5.  Q: Why can a probability density function (PDF) value $p(x)$ exceed 1, while a PMF value $P(x)$ cannot?
    A: A PDF $p(x)$ represents probability density per unit volume rather than direct probability mass; only its integral over a region is bounded by 1.
6.  Q: What three conditions must a probability density function (PDF) $p(x)$ satisfy?
    A: (1) Domain matches all states of $\text{x}$; (2) $p(x) \ge 0$ for all $x$; (3) Normalization: $\int p(x) dx = 1$.
7.  Q: What is the formula for a continuous uniform PDF $u(x; a, b)$ on interval $[a, b]$?
    A: $u(x; a, b) = \frac{1}{b - a} \cdot \mathbf{1}_{x \in [a, b]}$, where density is $\frac{1}{b - a}$ inside $[a, b]$ and 0 outside.

==This flashcard set reinforces the core concepts of uncertainty, random variables, PMFs, and PDFs from DLB §3.1–3.3.==

# DLB Chapter 5 — Machine Learning Basics (§5.1 — §5.2 arrives next week)

## Full Reading Notes

### 5.1.1 The Task, T

A machine learning algorithm is defined by Mitchell (1997): "A computer program is said to learn from experience $E$ with respect to some class of tasks $T$ and performance measure $P$, if its performance at tasks in $T$, as measured by $P$, improves with experience $E$."

Machine learning tasks are described in terms of how the system processes an example—a collection of features quantitative-measured from an entity. An example vector is denoted $x \in \mathbb{R}^n$, where $x_i$ represents feature $i$.

Common Machine Learning Tasks [99–103]:
*   Classification: The algorithm maps an input vector $x$ to a categorical code $y \in \{1, \dots, k\}$. Output function $f: \mathbb{R}^n \to \{1, \dots, k\}$. Example: Object recognition in images.
*   Classification with missing inputs: The algorithm classifies $x$ when arbitrary subsets of input features are unobserved. Rather than learning a single mapping $f$, the system learns $2^n$ distinct functions or models a joint probability distribution $p(x)$ to marginalize out missing features. Example: Medical diagnosis where invasive tests are omitted.
*   Regression: The algorithm predicts a continuous numerical value $y \in \mathbb{R}$ given input $x$. Output function $f: \mathbb{R}^n \to \mathbb{R}$. Example: Claim amount prediction in insurance or asset price forecasting.
*   Transcription: The algorithm converts unstructured data representations into discrete textual sequences. Example: Optical Character Recognition (OCR) transcribing Street View house numbers; Automatic Speech Recognition (ASR) converting audio waveforms into text string codes.
*   Machine translation: The algorithm converts a sequence of symbols in one language into a sequence of symbols in another language (e.g., English to French).
*   Structured output: The algorithm emits a vector or multi-element structure where output elements share strong structural dependencies. Example: Natural language sentence parsing trees, pixel-wise image segmentation maps, and image captioning.
*   Anomaly detection: The algorithm monitors a set of events or instances to flag unusual or invalid data points. Example: Credit card fraud detection.
*   Synthesis and sampling: The algorithm generates new synthetic instances similar to training data. Example: Generating realistic textures for video game environments or speech audio synthesis from text strings.
*   Imputation of missing values: The algorithm receives an incomplete example vector $x \in \mathbb{R}^n$ and predicts the values of missing entries $x_i$.
*   Denoising: The algorithm receives a corrupted example $\tilde{x} \in \mathbb{R}^n$ produced by an unknown corruption process acting on clean sample $x \in \mathbb{R}^n$. The learner predicts clean vector $x$ or estimates conditional distribution $p(x \mid \tilde{x})$.
*   Density estimation (or probability mass function estimation): The algorithm learns function $p_{\text{model}}: \mathbb{R}^n \to \mathbb{R}$, representing a valid PDF or PMF over the data-generating space.

### 5.1.2 The Performance Measure, P

To evaluate a machine learning algorithm, we define a quantitative performance metric $P$ specific to task $T$.

Evaluating Classifiers:
*   Accuracy: The proportion of examples for which the algorithm outputs the correct target category.
*   Error rate: The proportion of examples for which the output is incorrect, representing the expected 0-1 loss.

The 0-1 loss on example $i$ is defined as:

$$L_{0-1}(\hat{y}_i, y_i) = \mathbf{1}_{\hat{y}_i \neq y_i} \tag{5.1}$$

Evaluating Density Estimators: Metrics like 0-1 loss cannot evaluate continuous density estimators. Instead, performance metrics report the average log-probability assigned by $p_{\text{model}}$ to test examples.

Test Evaluation Requirement: Performance measure $P$ must be evaluated on a test set of unseen examples collected independently from training data to measure generalization rather than simple memorization.

### 5.1.3 The Experience, E

Learning algorithms are categorized by the experience $E$ they encounter during training:
*   Supervised learning: The algorithm encounters a dataset containing feature vectors $x$ paired with target labels $y$.
*   Unsupervised learning: The algorithm encounters a dataset containing feature vectors $x$ without explicit target labels $y$. The learner extracts structural properties, clusters, or probability distributions $p(x)$ across feature space.

The Design Matrix: A dataset is conventionally structured as a design matrix $X \in \mathbb{R}^{m \times n}$, containing $m$ distinct examples in its rows and $n$ input features in its columns.

The Iris Dataset Example [105–106]:
*   Origin: Classical dataset introduced by Ronald Fisher (1936) collecting measurements from 150 iris plants across 3 species (*Iris setosa*, *Iris versicolor*, *Iris virginica*).
*   Dataset Dimensions: $m = 150$ examples, $n = 4$ features per example (sepal length, sepal width, petal length, petal width).
*   Design Matrix Representation: Represented as $X \in \mathbb{R}^{150 \times 4}$, where entry $X_{i,1}$ is the sepal length of plant $i$, $X_{i,2}$ is sepal width, $X_{i,3}$ is petal length, and $X_{i,4}$ is petal width.

Heterogeneous Data Handling: When dataset examples have variable sizes (e.g., images with differing pixel dimensions), data cannot fit into a fixed matrix $X \in \mathbb{R}^{m \times n}$. In such settings, datasets are represented as unconstrained sets of vectors $\{x^{(1)}, x^{(2)}, \dots, x^{(m)}\}$.

### 5.1.4 Example: Linear Regression

We define linear regression as a concrete example of a machine learning algorithm combining task $T$, performance measure $P$, and experience $E$.
*   Task $T$: Regression mapping input vector $x \in \mathbb{R}^n$ to continuous prediction $\hat{y} \in \mathbb{R}$.
*   Model Parametrization: Linear combination of input features weighted by parameter vector $w \in \mathbb{R}^n$:

$$\hat{y} = w^\top x \tag{5.2}$$

*   Experience $E$: Design matrix $X^{(\text{train})} \in \mathbb{R}^{m^{(\text{train})} \times n}$ and target vector $y^{(\text{train})} \in \mathbb{R}^{m^{(\text{train})}}$.
*   Performance Measure $P$: Mean squared error evaluated on a separate test set $X^{(\text{test})}, y^{(\text{test})}$:

$$MSE_{\text{test}} = \frac{1}{m^{(\text{test})}} \|X^{(\text{test})}w - y^{(\text{test})}\|_2^2 = \frac{1}{m^{(\text{test})}} \sum_{i=1}^{m^{(\text{test})}} \left( \hat{y}^{(\text{test})}_i - y^{(\text{test})}_i \right)^2 \tag{5.3-5.4}$$

Minimizing Training Error via Normal Equations: To train parameter vector $w$, we minimize the training error $MSE_{\text{train}}$:

$$MSE_{\text{train}} = \frac{1}{m^{(\text{train})}} \|X^{(\text{train})}w - y^{(\text{train})}\|_2^2 \tag{5.5}$$

Expanding the squared $L_2$ norm using matrix vector transpose operations:

$$\|X^{(\text{train})}w - y^{(\text{train})}\|_2^2 = \left( X^{(\text{train})}w - y^{(\text{train})} \right)^\top \left( X^{(\text{train})}w - y^{(\text{train})} \right) \tag{5.6}$$
$$= w^\top X^{(\text{train})\top} X^{(\text{train})} w - 2 w^\top X^{(\text{train})\top} y^{(\text{train})} + y^{(\text{train})\top} y^{(\text{train})} \tag{5.7}$$

To find the optimal parameter weights $w$, compute the gradient with respect to $w$ and set it to 0:

$$\nabla_w MSE_{\text{train}} = 0 \tag{5.8}$$
$$\nabla_w \left( \frac{1}{m^{(\text{train})}} \left( w^\top X^{(\text{train})\top} X^{(\text{train})} w - 2 w^\top X^{(\text{train})\top} y^{(\text{train})} + y^{(\text{train})\top} y^{(\text{train})} \right) \right) = 0 \tag{5.9}$$
$$\frac{2}{m^{(\text{train})}} \left( X^{(\text{train})\top} X^{(\text{train})} w - X^{(\text{train})\top} y^{(\text{train})} \right) = 0 \tag{5.10}$$
$$X^{(\text{train})\top} X^{(\text{train})} w = X^{(\text{train})\top} y^{(\text{train})} \tag{5.11}$$
$$w = \left( X^{(\text{train})\top} X^{(\text{train})} \right)^{-1} X^{(\text{train})\top} y^{(\text{train})} \tag{5.12}$$

Equation 5.12 represents the normal equations, yielding the closed-form analytical solution for linear regression weights.

==Section 5.1 formalizes machine learning around task $T$, performance measure $P$, and experience $E$, deriving linear regression via the normal equations.==

## Worked Example

Below is the complete worked derivation for linear regression trained on a design matrix $X \in \mathbb{R}^{m \times n}$ with targets $y \in \mathbb{R}^m$, followed by its concrete formulation on the Iris dataset:

Part 1 — Full Derivation of Normal Equations:
1.  Objective: Find parameter vector $w \in \mathbb{R}^n$ that minimizes scalar training loss $J(w)$:
    $$J(w) = \frac{1}{m} \|Xw - y\|_2^2$$
2.  Expand loss function using matrix transpose identities:
    $$J(w) = \frac{1}{m} (Xw - y)^\top (Xw - y)$$
    $$J(w) = \frac{1}{m} \left( w^\top X^\top X w - w^\top X^\top y - y^\top X w + y^\top y \right)$$
3.  Combine scalar terms ($w^\top X^\top y = (w^\top X^\top y)^\top = y^\top X w$):
    $$J(w) = \frac{1}{m} \left( w^\top X^\top X w - 2 w^\top X^\top y + y^\top y \right)$$
4.  Apply matrix derivative identities ($\nabla_w (w^\top A w) = 2Aw$ for symmetric $A$; $\nabla_w (w^\top b) = b$):
    $$\nabla_w J(w) = \frac{2}{m} \left( X^\top X w - X^\top y \right)$$
5.  Set gradient equal to zero vector $\mathbf{0}$:
    $$\frac{2}{m} \left( X^\top X w - X^\top y \right) = \mathbf{0} \implies X^\top X w = X^\top y$$
6.  Left-multiply by $(X^\top X)^{-1}$ (assuming $X^\top X$ is non-singular):
    $$w = (X^\top X)^{-1} X^\top y$$

Part 2 — The Iris Dataset Design Matrix Application:
1.  Setup: Predict petal length ($y \in \mathbb{R}^{150}$) using sepal length, sepal width, and petal width as $n = 3$ features across $m = 150$ plants.
2.  Design Matrix Shape: $X \in \mathbb{R}^{150 \times 3}$.
3.  Matrix Product Shapes in Normal Equations:
    *   $X^\top \in \mathbb{R}^{3 \times 150}$
    *   $X^\top X \in \mathbb{R}^{3 \times 3}$
    *   $(X^\top X)^{-1} \in \mathbb{R}^{3 \times 3}$
    *   $X^\top y \in \mathbb{R}^{3 \times 1}$
    *   $w = (X^\top X)^{-1} X^\top y \in \mathbb{R}^{3 \times 1}$
4.  Result: The normal equations reduce a 150-example regression problem into inverting a compact $3 \times 3$ matrix, providing optimal weights $w$ analytically.

==The worked example confirms that the normal equations solve linear regression analytically by setting the MSE loss gradient to zero.==

## Connections

*   Connection to ISL Chapter 2 (Supervised vs. Unsupervised Learning): ISL §2.1 frames statistical learning around predicting response $Y$ from predictors $X$ (supervised) or discovering clusters among $X$ without $Y$ (unsupervised). DLB §5.1.3 adopts this exact framing, using the Iris dataset design matrix $X \in \mathbb{R}^{150 \times 4}$ to illustrate supervised classification when targets $y$ are provided and unsupervised clustering when $y$ is omitted.
*   Connection to ISL Chapter 3 (Linear Regression): ISL §3.1 derives simple and multiple linear regression using ordinary least squares (OLS) scalar summations. DLB §5.1.4 generalizes ISL's OLS equations into compact linear algebra notation $w = (X^\top X)^{-1} X^\top y$, establishing the matrix bridge between statistical learning and deep learning.

==Linking DLB §5.1 to ISL Chapters 2 and 3 highlights how matrix algebra unifies traditional statistical learning with modern machine learning algorithms.==

## Open Questions

1.  How does the computational complexity of solving normal equations $\mathcal{O}(n^3)$ compare to gradient descent optimization as feature dimension $n$ scales into millions?
2.  Under what exact conditions will the matrix $X^\top X$ become non-invertible (singular), and how does regularization resolve this singularity?
3.  Why does minimizing training error $MSE_{\text{train}}$ fail to guarantee low generalization error $MSE_{\text{test}}$ on novel inputs?
4.  How do structured output tasks differ fundamentally from standard multi-class classification tasks in terms of output dependencies?

==These open questions highlight key trade-offs between exact closed-form matrix solvers, iterative optimization, and generalization.==

## Flashcards

1.  Q: How does Tom Mitchell define a learning algorithm?
    A: A computer program learns from experience $E$ with respect to task class $T$ and performance measure $P$ if its performance at tasks in $T$, as measured by $P$, improves with experience $E$.
2.  Q: What is a design matrix $X$, and what do its rows and columns represent?
    A: A design matrix $X \in \mathbb{R}^{m \times n}$ represents a dataset where each row corresponds to a distinct example $i$ and each column corresponds to a feature $j$.
3.  Q: How is the Iris dataset structured as a design matrix in DLB §5.1.3?
    A: The Iris dataset contains $m = 150$ plant examples and $n = 4$ physical features, forming a design matrix $X \in \mathbb{R}^{150 \times 4}$.
4.  Q: What is the defining equation for 0-1 loss in classification performance evaluation?
    A: $L_{0-1}(\hat{y}, y) = \mathbf{1}_{\hat{y} \neq y}$, assigning a loss of 0 if prediction $\hat{y}$ matches target $y$ and 1 otherwise.
5.  Q: What is the main operational difference between supervised learning and unsupervised learning?
    A: Supervised learning receives feature vectors $x$ paired with target labels $y$; unsupervised learning receives feature vectors $x$ without targets $y$ to learn structural data properties.
6.  Q: What is the closed-form normal equations formula for linear regression weight vector $w$?
    A: $w = (X^{(\text{train})\top} X^{(\text{train})})^{-1} X^{(\text{train})\top} y^{(\text{train})}$.
7.  Q: How is test set Mean Squared Error ($MSE_{\text{test}}$) calculated for linear regression?
    A: $MSE_{\text{test}} = \frac{1}{m^{(\text{test})}} \|X^{(\text{test})}w - y^{(\text{test})}\|_2^2 = \frac{1}{m^{(\text{test})}} \sum_{i=1}^{m^{(\text{test})}} (\hat{y}^{(\text{test})}_i - y^{(\text{test})}_i)^2$.

==This flashcard set summarizes tasks, performance metrics, design matrices, and normal equations from DLB §5.1.==
## Examples Worth Keeping
<!-- Keep concrete examples, numbers, cases, or worked reasoning that makes the mechanism memorable. -->
- 
## Connections
<!-- Link the matching lecture/week, course map, and only concept notes that actually exist or were created. -->
- Lecture:
- Concept:
## Flashcards
<!-- Add 3–8 atomic cards testing mechanisms and contrasts to #cards/<course-slug>. -->
