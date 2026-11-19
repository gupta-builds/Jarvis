---
type: class
class_kind: textbook
status: sprout
created: 2026-11-19
updated: 2026-11-19
tags:
  - class
  - textbook
area:
  - "[[CSCI 4521 Board]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/Textbook Map|Textbook Map]]"
next: "Run the NotebookLM prompt on PDF pp. 239-260 and compare. Read the lasso-vs-ridge comparison on PDF pp. 255-260, which this note only summarizes."
---
# ISL Chapter 6 — Subset Selection and Shrinkage (§6.1 to §6.2)
**Source:** *An Introduction to Statistical Learning with Applications in Python* (James, Witten, Hastie, Tibshirani, Taylor), Chapter 6, §6.1 and §6.2, printed pp. 230-251 (PDF pp. 239-260).
**Read from:** `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Textbook & Resources\ISL Textbook CSCI 4521.pdf`, extracted with MinerU.
**Course role:** the reading for [[20_Progress/Degree/CSCI 4521/Weekly/Week - 8|Week 8]] and [[20_Progress/Degree/CSCI 4521/Weekly/Week - 9|Week 9]] (ISL 6.1, 6.2), behind LEC 3.4's regularization slides. §6.3 and §6.4 are in [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 6 (Part 2)|Chapter - 6 (Part 2)]].
## Chapter Summary
==When a linear model has too many predictors, least squares has high variance, and the fix is either to keep only some predictors (subset selection) or to fit all of them while shrinking the coefficients toward zero (ridge and lasso) at the price of some bias.==
*Mechanism:* training RSS always falls and $R^2$ always rises as predictors are added, so model size must be chosen with an estimate of test error, either an adjusted training error ($C_p$, AIC, BIC, adjusted $R^2$) or a direct one (validation or cross-validation). Ridge minimizes $\text{RSS}+\lambda\sum\beta_j^2$ and the lasso minimizes $\text{RSS}+\lambda\sum|\beta_j|$. A larger $\lambda$ lowers variance and raises bias. The $\ell_1$ penalty of the lasso drives some coefficients exactly to zero, so it selects variables. $\lambda$ is chosen by cross-validation.
## Reading Guide
- [ ] Read pp. 230-232 (§6.1.1 to 6.1.2): Algorithm 6.1 (best subset) and Algorithm 6.2 (forward stepwise). Count the models for $p=20$.
- [ ] Read pp. 234-238 (§6.1.3): $C_p$, AIC, BIC, adjusted $R^2$ (Eq. 6.2 to 6.4) and cross-validation. Study Figures 6.2 and 6.3.
- [ ] Read pp. 239-240 (§6.2.1): the ridge criterion (Eq. 6.5), the role of $\lambda$ and why the intercept is not penalized.
- [ ] Study Figure 6.4 (p. 240): ridge coefficient paths shrinking toward zero but never reaching it.
- [ ] Read p. 241 (standardization, Eq. 6.6) and Figure 6.5: variance falls and bias rises as $\lambda$ grows.
- [ ] Read pp. 243-245 (§6.2.2, Eq. 6.7 to 6.9): the lasso and its constraint form.
- [ ] Study Figures 6.6 and 6.7 (pp. 244-246): the diamond constraint touching the RSS ellipse on an axis.
## Key Concepts
- **Best subset selection:** fit all $\binom pk$ models of each size, keep the best of each size, then pick the size. It looks at $2^p$ models, which is 1,048,576 for $p=20$.
- **Forward and backward stepwise selection:** forward adds the predictor that helps most each step, about $1+p(p+1)/2$ models, 211 for $p=20$. Backward starts from the full model and needs $n>p$. Neither is guaranteed to find the best subset.
- **Adjusting for model size:** $C_p=\frac1n(\text{RSS}+2d\hat\sigma^2)$, $\text{BIC}=\frac1n(\text{RSS}+\log(n)d\hat\sigma^2)$ and adjusted $R^2=1-\frac{\text{RSS}/(n-d-1)}{\text{TSS}/(n-1)}$. Low $C_p$, AIC and BIC are good and high adjusted $R^2$ is good. BIC penalizes more, so it picks smaller models.
- **Ridge regression (§6.2.1):** minimize $\sum(y_i-\beta_0-\sum\beta_jx_{ij})^2+\lambda\sum\beta_j^2$ (6.5). $\lambda=0$ is least squares and $\lambda\to\infty$ shrinks every coefficient to zero. It keeps all $p$ predictors.
- **Lasso (§6.2.2):** replace $\beta_j^2$ by $|\beta_j|$ (6.7). Some coefficients become exactly zero, giving a sparse model.
- **Standardization:** ridge coefficients are not scale equivariant, so scale each predictor by its standard deviation first (6.6).
## Full Reading Notes
### §6.1 Subset selection (pp. 230-238)
Best subset selection reduces $2^p$ models to $p+1$ by taking the best model of each size on training RSS, then chooses the size with a test-error estimate, because RSS and $R^2$ always favor the biggest model. Stepwise methods search far fewer models and can be applied when $p$ is large, and forward selection works even for $n<p$. For choosing the final size, adjusted-error criteria rely on theory while cross-validation estimates test error directly. The test-error curves in Figure 6.3 are quite flat, so the book suggests the one-standard-error rule: take the smallest model within one standard error of the minimum.
> [!EXPLAIN] Explanation of the above topic: Adding a useless predictor always lowers training RSS a little, so training error cannot tell you to stop. $C_p$ and BIC add a charge per predictor, so a predictor must reduce RSS by more than its charge to be worth keeping. Cross-validation skips the charge idea and just measures error on held-out folds.
### §6.2.1 Ridge regression (pp. 239-242)
Ridge fits all coefficients but pays $\lambda$ per unit of squared coefficient. $\lambda$ is a tuning parameter. In the Credit data, the coefficient paths shrink smoothly as $\lambda$ grows. The advantage over least squares is the bias-variance trade-off: as $\lambda$ increases, flexibility and variance fall and bias rises, and test MSE is smallest at an intermediate $\lambda$. Ridge helps most when least squares has high variance, for example when $p$ is close to $n$, and it is much cheaper than a $2^p$ search.
> [!EXPLAIN] Explanation of the above topic: The penalty makes big coefficients expensive, so the fit prefers many small ones over a few huge ones. When two predictors are collinear, least squares can use huge opposite-signed coefficients to chase noise. Ridge refuses that, trading a little bias for a lot less variance. This is the book version of the lecture's "parameters are too free" argument for regularization.
### §6.2.2 The lasso (pp. 243-247)
The lasso uses the $\ell_1$ penalty, so some coefficients are exactly zero when $\lambda$ is large enough. Equivalent forms: minimize RSS subject to $\sum|\beta_j|\le s$ (lasso) or $\sum\beta_j^2\le s$ (ridge). For $p=2$ the lasso region is a diamond and the ridge region is a disk. The RSS ellipse first touches the diamond at a corner, where one coefficient is zero. It touches the disk at a smooth point, where none is. Neither method always wins: the lasso wins when only some predictors matter, and ridge wins when all matter. $\lambda$ is chosen by cross-validation.
> [!EXPLAIN] Explanation of the above topic: Picture the allowed region for $(\beta_1,\beta_2)$. A disk has no corners, so the best point on it almost never lies exactly on an axis. A diamond has corners on the axes, and the best point often lands on one. A coefficient on an axis is zero. That is how the lasso both shrinks and deletes predictors, and why lecture 3.4 calls the $\ell_1$ version harder for gradient descent: the absolute value has a corner at zero.
## Worked Example
Count the search sizes for $p=20$ (p. 232): best subset fits $2^{20}=1{,}048{,}576$ models, forward stepwise fits $1+\sum_{k=0}^{19}(20-k)=211$. Both give a size-$k$ model for each $k$, and the stepwise pick may differ from the best subset (Table 6.1 lists the first four models each method selects on Credit, and the book uses it to show the two need not agree). The saving is why stepwise methods are used when $p$ is large.
## Connections
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 8|Week 8]] and [[20_Progress/Degree/CSCI 4521/Weekly/Week - 9|Week 9]]: LEC 3.4 defines L2 (ridge) and L1 (lasso) penalized losses, notes that $\lambda$ is chosen by cross-validation, and warns about leakage. The book adds the geometry and the standardization rule.
- [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5 (Part 2)|DLB Chapter 5 (Part 2)]] §5.10: weight decay $\lambda\|w\|_2^2$ is the ridge penalty.
- [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 3 (Part 2)|ISL Chapter 3 (Part 2)]]: collinearity and VIF are the problems ridge addresses.
- [[20_Progress/Degree/CSCI 4521/Quizzes/Quiz - 3|Quiz - 3]] Problem 5: the elbow and the point that training error always falls with more parameters.
## Open Questions
- [ ] Verify that printed page = PDF page minus 9 on these pages. It was read off chapter 3 pages and assumed here.
- [ ] Read PDF pp. 255-260 for the lasso-vs-ridge comparison figures and add the conclusion.
- [ ] Compare with a NotebookLM run on PDF pp. 239-260 and note any disagreement here.
