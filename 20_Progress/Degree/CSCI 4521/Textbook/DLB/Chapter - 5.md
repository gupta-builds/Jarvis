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
# Chapter - 5
## Chapter Summary
<!-- State the chapter's one-sentence claim and use exactly one ==highlight== anchor. -->
== ==
*Mechanism:*
<!-- Explain how the chapter's claim works. -->
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
## Full Reading Notes — §5.2

### 5.2 Capacity, Overfitting and Underfitting

The central challenge in machine learning is that a trained model must perform well on **new, previously unseen** inputs—a property known as **generalization**.

Distinction between error metrics:
*   **Training error**: The error measure computed directly on the training dataset (e.g., $\text{MSE}_{\text{train}}$).
*   **Generalization error** (or **test error**): The expected value of error on a new input sampled from the underlying distribution.

The Data-Generating Distribution and i.i.d. Assumption:
We assume that dataset examples are generated by an underlying **data-generating distribution** $p_{\text{data}}$. To make statistical guarantees, we rely on the **i.i.d. assumption**: the examples in each dataset are independent from each other, and the training set and test set are identically distributed, drawn from the exact same distribution $p_{\text{data}}$.

Two Primary Goals of a Learning Algorithm:
1. Make the training error as small as possible.
2. Make the gap between training error and generalization error—known as the **generalization gap**—as small as possible.

Pathologies in Model Training:
*   **Underfitting**: Occurs when the model is unable to obtain a sufficiently low error value on the training set.
*   **Overfitting**: Occurs when the generalization gap between training error and test error is excessively large.

Capacity and Hypothesis Space:
A model's **capacity** is its ability to fit a wide variety of functions. We control capacity by altering the **hypothesis space**—the set of functions that the learning algorithm is allowed to choose as its solution.
*   **Representational capacity**: The family of functions a model can represent purely by varying its parameters (e.g., linear regression has representational capacity limited to linear hyperplanes).
*   **Effective capacity**: The capacity realized in practice, which is often smaller than representational capacity because the optimization algorithm may fail to find parameter values that minimize training loss.

Quantifying Capacity via Statistical Learning Theory:
The **Vapnik-Chervonenkis dimension** (**VC dimension**) measures the capacity of a binary classifier, defined as the largest possible integer $m$ for which there exists a training set of $m$ different $x$ points that the classifier can label arbitrarily (shatter). Statistical learning theory proves that the gap between training error and generalization error is bounded from above by a quantity that grows with VC dimension and shrinks as the number of training examples $m$ increases.

Non-Parametric Models and Oracle Bounds:
*   To achieve arbitrarily high capacity, we use **non-parametric models**, whose capacity grows with dataset size rather than being fixed by a parameter count.
*   **Nearest-neighbor regression**: A classic non-parametric model that stores all training pairs $(x^{(i)}, y^{(i)})$ and predicts the target of the closest training point in feature space for any query $x$. It achieves zero training error when identical inputs map to identical outputs.
*   **Bayes error**: The lowest achievable generalization error by an optimal oracle predictor that knows the true data-generating distribution $p(x, y)$.

The Effect of Dataset Size on Capacity (Figure 5.4):
*   As the number of training examples $m \to \infty$, the training error of any fixed-capacity parametric model rises to at least the Bayes error because larger datasets are harder to memorize.
*   Simultaneously, the test error decreases toward the Bayes error as fewer incorrect hypotheses remain consistent with the data.
*   ==Increasing the training set size shifts the optimal model capacity higher, enabling complex models to generalize without overfitting [110–117].==

---

### 5.2.1 The No Free Lunch Theorem

Inductive reasoning—inferring general rules from a finite set of specific examples—is not logically valid. Machine learning circumvents this logical limitation by offering probabilistic rules that are *probably correct* for most novel inputs.

Formal Statement of the Theorem:
The **No Free Lunch theorem** (Wolpert 1996) states that, averaged over all possible data-generating distributions, every classification algorithm has the exact same expected error rate when predicting on previously unobserved points.

Operational Mechanics:
*   No machine learning algorithm is universally superior to all others across every conceivable task.
*   An advanced deep neural network and a random guessing algorithm achieve the exact same average performance when evaluated across the space of all mathematical distributions.
*   Machine learning algorithms succeed in practice because real-world tasks belong to specific, structured data distributions. We build preferences into our algorithms that align with these real-world distributions [116–117].

---

### 5.2.2 Regularization

To solve specific tasks effectively, we modify learning algorithms by introducing preferences into the hypothesis space.

Defining Regularization:
**Regularization** is any modification made to a learning algorithm that is intended to reduce its generalization error but not its training error.

Weight Decay:
One of the most common forms of regularization is **weight decay**, which adds a parameter norm penalty to the training cost function. For linear regression with parameters $w$, the regularized cost function $J(w)$ is:

$$J(w) = \text{MSE}_{\text{train}} + \lambda w^\top w \tag{5.18}$$

where scalar hyperparameter $\lambda \ge 0$ controls the strength of the preference for smaller weights.
*   $\lambda = 0$: Imposes no preference, leaving capacity unconstrained.
*   $\lambda > 0$: Penalizes large weights, forcing parameters to stay close to the origin and reducing effective model capacity [117–118].

Mechanistically, expressing preferences via penalty terms like $\lambda w^\top w$ is a continuous alternative to explicitly including or excluding functions from the hypothesis space, allowing fine-grained capacity control [118–119].

## Worked Example

Figure 5.2 (p. 113) and Figure 5.5 (p. 118) in the Deep Learning Book demonstrate how hypothesis space capacity and weight decay control underfitting and overfitting:

1. Polynomial Capacity Comparison (Figure 5.2, pp. 111–113):
   * Setup: Synthetic training data generated by randomly sampling $x$ values and evaluating a quadratic function $y = b + w_1 x + w_2 x^2$ with added noise [112–113].
   * Degree-1 Model (Underfitting): A linear predictor $\hat{y} = b + w_1 x$ lacks sufficient capacity to represent quadratic curvature. It yields high training error and high generalization error [112–113].
   * Degree-2 Model (Appropriate Capacity): A quadratic predictor $\hat{y} = b + w_1 x + w_2 x^2$ matches the true generating process, achieving low training error and low generalization error [112–113].
   * Degree-9 Model (Overfitting): A polynomial predictor $\hat{y} = b + \sum_{i=1}^9 w_i x^i$ solved via Moore-Penrose pseudoinverse passes through every training point perfectly ($\text{MSE}_{\text{train}} = 0$). However, its excessive capacity causes wild oscillations between training points, resulting in severe generalization error [112–113].

2. Regularization via Weight Decay (Figure 5.5, p. 118):
   * Setup: Fit the exact same degree-9 polynomial model to the quadratic training set, but modify the cost function using weight decay $J(w) = \text{MSE}_{\text{train}} + \lambda w^\top w$ [117–118].
   * Large $\lambda$ (Underfitting): Excessive weight decay forces $w \to 0$, reducing the model to a flat constant line.
   * Medium $\lambda$ (Appropriate Regularization): Moderate weight decay suppresses high-order polynomial coefficients $w_3, \dots, w_9$ while preserving low-order terms, successfully recovering a smooth quadratic curve despite using a degree-9 hypothesis space.
   * $\lambda \to 0$ (Overfitting): As weight decay vanishes, the degree-9 model reverts to overfitting the training noise.

==Figure 5.2 and Figure 5.5 prove that regularizing a high-capacity model via weight decay achieves the same generalization benefits as manually restricting the hypothesis space.==

## Connections

DLB §5.2 and ISL §2.2 cover the foundational principles of generalization, overfitting, and model capacity. While both texts describe the same underlying phenomena, their conceptual frameworks and vocabularies differ:

1. Vocabulary and Theoretical Framing Alignment:
   * **Capacity vs. Flexibility**: DLB quantifies model power using **capacity** (representational vs. effective capacity) and formal statistical learning theory bounds (**VC dimension**), whereas ISL uses **flexibility** and **degrees of freedom** [111–114].
   * **Generalization Gap vs. Bias-Variance Trade-off**: DLB decomposes generalization performance into two explicit objectives: making training error small AND making the generalization gap small. ISL decomposes expected test error using the **bias-variance decomposition**:
     $$E(y_0 - \hat{f}(x_0))^2 = \text{Var}(\hat{f}(x_0)) + [\text{Bias}(\hat{f}(x_0))]^2 + \text{Var}(\epsilon)$$
     where underfitting corresponds to high bias (insufficient capacity) and overfitting corresponds to high variance (excessive capacity) [111–114].
   * **Bayes Error**: Both books define Bayes error as the irreducible error floor achieved by an optimal oracle predictor.

2. Key Conceptual Divergences:
   * **The Necessity of Regularization**: DLB introduces Wolpert's **No Free Lunch theorem** (1996) to prove mathematically that no learning algorithm can generalize without inductive biases or regularization preferences [115–116]. ISL focuses on empirical model selection (cross-validation) without introducing the No Free Lunch theorem.
   * **Capacity Control Mechanisms**: DLB emphasizes controlling capacity in high-dimensional models via parameter norm penalties (**weight decay** $\lambda w^\top w$) and dataset size expansion [116–118]. ISL emphasizes structural selection (e.g., subset selection, Lasso, polynomial degrees) and nearest-neighbor $K$ tuning [114–115].

==DLB's generalization-gap framing and ISL's bias-variance decomposition provide complementary views of the U-shaped test error curve.==

## Open Questions

1. How can we estimate the effective capacity of deep neural networks when their non-convex loss surfaces cause optimization algorithms to realize only a fraction of their representational capacity [112–114]?
2. Why do statistical learning theory VC dimension bounds often yield excessively loose error estimates for modern deep learning architectures [114–115]?
3. How do implicit regularization properties in optimization algorithms (such as stochastic gradient descent) enable overparameterized neural networks to generalize without explicit weight decay penalties [117–118]?
4. In light of the No Free Lunch theorem, what specific structural assumptions about real-world visual and linguistic data allow deep learning models to generalize across diverse AI tasks [115–117]?

==These open questions highlight the theoretical challenges of quantifying capacity, optimization dynamics, and generalization in deep learning.==

## Flashcards

1. Q: How does DLB define the two primary goals of a machine learning algorithm?
   A: (1) Make the training error as small as possible; (2) make the generalization gap between training error and test error as small as possible.
2. Q: What is the difference between representational capacity and effective capacity?
   A: Representational capacity is the family of functions a model can represent by varying its parameters; effective capacity is the capacity realized in practice, limited by optimization algorithms.
3. Q: What is the definition of Vapnik-Chervonenkis (VC) dimension?
   A: The VC dimension of a binary classifier is the maximum number of training points $m$ that the classifier can label arbitrarily (shatter).
4. Q: What defines a non-parametric model in DLB §5.2?
   A: A model whose capacity grows with the size of the training dataset rather than being fixed by a parameter count (e.g., nearest-neighbor regression).
5. Q: What is the Bayes error?
   A: The minimum achievable generalization error by an optimal oracle predictor that knows the true data-generating distribution $p(x, y)$.
6. Q: What does Wolpert's No Free Lunch theorem state?
   A: Averaged over all possible data-generating distributions, every classification algorithm has the exact same expected error rate on unseen inputs.
7. Q: How does increasing dataset size affect training error, test error, and optimal capacity in parametric models?
   A: As dataset size grows, training error rises toward the Bayes error, test error decreases toward the Bayes error, and optimal model capacity increases.
8. Q: What is the formal definition of regularization in DLB §5.2.2?
   A: Any modification made to a learning algorithm that is intended to reduce its generalization error but not its training error.
9. Q: What is the formula for linear regression cost with weight decay regularization?
   A: $J(w) = \text{MSE}_{\text{train}} + \lambda w^\top w$, where $\lambda \ge 0$ penalizes large weight magnitudes.

==This flashcard deck reinforces capacity, VC dimension, No Free Lunch, and regularization from DLB §5.2.==
## Examples Worth Keeping
<!-- Keep concrete examples, numbers, cases, or worked reasoning that makes the mechanism memorable. -->
- 
## Connections
<!-- Link the matching lecture/week, course map, and only concept notes that actually exist or were created. -->
- Lecture:
- Concept:
## Flashcards
<!-- Add 3–8 atomic cards testing mechanisms and contrasts to #cards/<course-slug>. -->
