---
type: class
class_kind: week
status: seed
created: 2026-11-19
updated: 2026-11-19
tags:
  - class
  - lecture
area:
  - "[[CSCI 4521 Board]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/Textbook Map|Textbook Map]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 3 (Part 2)|ISL Chapter 3 (Part 2)]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 6|ISL Chapter 6]]"
next: "Add protected Week 9 live capture. Quiz 4 (Thu 11/5) has no solution file yet: drop it in Quizzes/ and build it with the Quiz Workflow."
---
# Week - 9
## What you must be able to do
- Explain backpropagation as the chain rule applied through a computation graph, forward pass then backward pass. See [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5 (Part 2)|DLB Chapter 5 (Part 2)]].
- Write multiple linear regression as $y\approx[X\ 1][w;b]^\top$ and say what each part is.
- Diagnose multicollinearity from a correlation matrix and name two fixes.
- Add an interaction term, and say why the main effects stay in the model.
- Predict with kNN regression and say how its variance compares with linear regression.
- State L1 and L2 penalized losses and what each does to the parameters.
- Name three ways to fight overfitting in regression: train/test split, cross-validation, regularization.
## Key ideas (short)
- **Backpropagation** is a **glorified chain rule**: forward pass evaluates, backward pass multiplies derivatives from the outside in.
- A **computation graph** records the order so PyTorch can differentiate any composition.
- **Multicollinearity** makes coefficients unstable, and a correlation of about 0.6 or more is the warning level.
- An **interaction term** $X_iX_j$ lets one feature's effect depend on another, as TV and radio do.
- **Regularization** restricts the parameters, trading **more bias for less variance**.
## Concepts created today
None created in this build.
## Examples worth keeping
- $l(m)=(3m-2)^2$ as $g(f(m))$ with $f(m)=3m-2$ and $g(y)=y^2$, so $l'(m)=g'(f(m))f'(m)$.
- The loss $\log(x_1x_2)\sin(x_2)$ drawn as a computation graph, with `x1 = 1.0` and `x2 = 5.0` as `requires_grad` tensors.
- The **Advertising** dataset: TV and radio spending have a strong correlation with sales, newspaper does not, and the TV x radio product also correlates strongly with sales.
- In the notebook's normalized multiple fit, the loss falls from about 0.85 to about 0.11 over 1,400 epochs and the newspaper weight ends near 0.017.
## Lecture
### Pre-lecture source notes
No live lecture capture exists for this week yet. These notes come from `Lectures/Week - 8/3.4 backpropagation, correlation, regularization.pptx.pdf` (37 slides, filed in the Week - 8 folder though scheduled Tue 11/3) and the companion notebook `3.3 regression with advertising dataset.ipynb`. Thu 11/5 was Quiz 4, whose key is not in the source folder. Add live capture under a `Live lecture capture` heading.
### 1. LEC 3.4: How PyTorch computes gradients (Tue 11/3)
*Chain rule.* $l(m)=g(f(m))$ gives $l'(m)=g'(f(m))f'(m)$. **Forward propagation** evaluates the composed functions at the current point ($y=f(m)$, then $g(y)$). **Backpropagation** differentiates backward ($g'(y)$ first, then $f'(m)$, then multiply). A **computation graph** tracks the composition. In the graph, circles are variables and rectangles are operations. Backprop multiplies derivatives from outer to inner functions, and when several arrows meet their contributions are added.
### 2. LEC 3.4: Multiple features, correlation and interactions
*Multiple regression.* $f(X_1,\dots,X_p)=w_1X_1+\dots+w_pX_p+b$. Stack the data: $y\approx[X\ 1][w;b]$, with $X$ the data matrix (rows are points) and $\mathbf1$ a column of ones.
*Multicollinearity.* High correlation between features makes coefficient estimates unstable and misleading. Fixes: drop one of the correlated features, or replace them by their average. Check with a correlation matrix, where about 0.6 or more in absolute value is "highly correlated". PCA or other dimensionality reduction may also help. On the sales data the features are not highly correlated.
*Interaction effects.* Even without correlation between features, there can be a synergy (marketing) or interaction (statistics): radio ads may make TV ads more effective. Add products: $f=\sum w_iX_i+\sum_{i<j}c_{ij}X_iX_j+b$, with $c_{ij}$ nonzero only when the data show correlation. In the Advertising data the product TV x radio correlates strongly with sales. If an interaction is in the model, keep the features themselves, and note that coefficients become harder to interpret and the units are not even the same.
*Other nonlinear terms.* Polynomials ($x_1^2$, $x_1x_4^2$), logs, trigonometric terms or any explicit function.
*kNN for regression.* $\hat f(x_0)=\frac1k\sum_{i\in N_0}y_i$, the average of the $k$ nearest neighbors' values. It has more variance than regression, fits complicated curves, overfits and is less interpretable.
*Measuring success.* For regression use the loss: mean squared error (L2) or mean absolute error (L1).
### 3. LEC 3.4: Bias, variance and regularization
Parametric models can overfit, especially complex ones, and too few parameters gives excess bias. Variance grows with more features, nonlinear terms and interaction effects. **Regularization** restricts parameters that are "too free". L2 (ridge): $\ell(w,b)=\|y-[X\ 1][w;b]\|_2^2+\lambda\|w\|_2^2$. L1 (LASSO): replace the penalty by $\lambda\|w\|_1$, which needs care with gradient descent because $|w|$ has a corner. Choose $\lambda$ by cross-validation on the training data, and avoid data leakage. PCA can also regularize. The deck promises more on regularization with neural networks.
*Cross-validation.* $k$-fold splits the data into $k$ parts, uses each as the test set once and averages the errors. Leave-one-out is $n$-fold, and Monte-Carlo CV repeats random splits. The deck links a paper on their drawbacks.
*Review answers on the slide.* The lowest-residual model is not always best (overfitting). Parametric models can overfit. kNN regression overfits more than parametric regression when $k$ is small. Combat overfitting with a test-train split, cross-validation and regularization. Practice questions on ChimeIn: tune the learning rate, improve gradient descent, parametric regression vs kNN. The deck also links a paper on L1 vs L2 "helpful for interview questions".
### 4. Notebook: `3.3 regression with advertising dataset.ipynb`
Loads `Advertising.csv` (200 rows: TV, radio, newspaper, sales). Training on raw TV with `lr = 3e-5` "breaks": loss near 31 and slow. After dividing TV by 300 and sales by 30, `lr = 0.5` reaches $m=0.4754$, $b=0.2344$ and loss $0.01168$. Then `linearModel(params, inputs)` and `gradDec(model, n_params, x, y, lr, n_epochs, print_rate)` structure the code. Multiple regression normalizes with $(x-\bar x)/\sigma$, trains with `lr = 0.001`, and gives weights $[0.7400, 0.5163, 0.0172, 0.0006]$, so newspaper is near 0. The model with TV x radio and no newspaper reaches weights $[0.7196, 0.5301, 0.2646, -0.0132]$ and a noticeably lower loss.
## Textbook integration
[[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 3 (Part 2)|ISL Chapter 3 (Part 2)]] §3.3 gives the same three ideas with numbers and tests. The interaction TV x radio has $\hat\beta=0.0011$ and $p<0.0001$ (Table 3.9), the hierarchical principle explains why main effects stay, and VIF is the more reliable collinearity check ($160.67$ against $1.01$ on the Credit data). §3.5 compares linear regression with KNN regression and says KNN wins only when the truth is very non-linear and $p$ is small.
[[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 6|ISL Chapter 6]] gives the geometry the lecture skips: ridge keeps every predictor, the lasso zeros some, the lasso's diamond constraint region touches the RSS ellipse on an axis, and predictors should be standardized first. [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5 (Part 2)|DLB Chapter 5 (Part 2)]] §5.10 writes weight decay as $\lambda\|w\|_2^2$ added to the cost. The book's formula for the intercept matches the slide: only the weights are penalized.
Reading ahead: [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 6 (Part 2)|ISL Chapter 6 (Part 2)]] on PCR and high dimensions, plus ISL 4.3 and DLB 5.5, are assigned this week and belong to Week 10.
## Takeaways (questions to resolve)
- [ ] Reproduce the normalized TV fit: why did the same code break on raw TV and work after dividing by 300?
- [ ] Which three terms are in the best Advertising model, and why does dropping newspaper help?
- [ ] Do the HW3 due dates agree? The Board says Tue 11/3, while the Homework - 3 note says upload by Thu 11/12.
- [ ] Fill in Quiz 4 once its solution key lands.
## Lecture-to-textbook synthesis
==Backpropagation is the chain rule run backward through a recorded computation graph, which is what lets gradient descent train any differentiable regression, and regularization is what keeps those extra parameters from fitting noise.==
*Mechanism:* the forward pass computes the loss and stores intermediate values. The backward pass multiplies local derivatives from the loss back to each parameter, adding where paths merge. More features, interaction terms and nonlinear terms add flexibility and variance. A penalty $\lambda\|w\|_2^2$ or $\lambda\|w\|_1$ shrinks the weights, raising bias and lowering variance, and $\lambda$ is picked by cross-validation on training data.
- Lecture example/scenario: Advertising. Newspaper's weight is about $0.017$ in the normalized multiple fit, and TV x radio brings the loss from about $0.11$ down to about $0.034$.
- Textbook connection: [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 3 (Part 2)|ISL Chapter 3 (Part 2)]] (interactions, VIF, KNN vs linear) and [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 6|ISL Chapter 6]] (ridge and lasso).
- Concept links: None created in this build.
> [!WARNING]
> Adding a feature or an interaction term because the training loss falls. Training loss always falls with more parameters, so only held-out error says whether the model improved.
> [!SUMMARY]
> Week 9 shows how PyTorch gets gradients for free, extends the line to many features and interactions, and starts the bias-variance defense of regularization.
## Flashcards
Why does the chain rule matter for PyTorch?::A loss is a composition of functions, and the chain rule multiplies the local derivatives backward through the computation graph, so `.backward()` gets every parameter's gradient in one pass. #cards/csci4521
Why keep $X_1$ and $X_2$ when $X_1X_2$ is in the model?::An interaction term only changes how one feature's effect depends on the other, so the main effects must remain unless there is a reason to drop them (the hierarchical principle). #cards/csci4521
What does adding $\lambda\|w\|_2^2$ do to bias and variance?::It restricts the weights, so bias rises and variance falls, and $\lambda$ is chosen by cross-validation. #cards/csci4521
