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
next: "Run the NotebookLM prompt on PDF pp. 100-124 and compare. Chapter - 3 covers §3.1 and §3.2 once it lands."
---
# ISL Chapter 3 (Part 2) — Other Considerations, the Marketing Plan, Linear Regression vs KNN (§3.3 to §3.5)
**Source:** *An Introduction to Statistical Learning with Applications in Python* (James, Witten, Hastie, Tibshirani, Taylor), Chapter 3, §3.3 to §3.5, printed pp. 91-115 (PDF pp. 100-124).
**Read from:** `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Textbook & Resources\ISL Textbook CSCI 4521.pdf`, extracted with MinerU.
**Course role:** the reading for [[20_Progress/Degree/CSCI 4521/Weekly/Week - 8|Week 8]] (LEC 3.2 and 3.3) and [[20_Progress/Degree/CSCI 4521/Weekly/Week - 9|Week 9]] (LEC 3.4: multiple features, interactions, collinearity, KNN regression). The lecture's Advertising notebook is described on its slide as similar to [[20_Progress/Degree/CSCI 4521/Homework/Homework - 3|Homework - 3]].
## Chapter Summary
==The linear model is easy to read and easy to break: dummy variables, interaction terms and polynomial terms stretch it, six named problems (non-linearity, correlated errors, non-constant variance, outliers, high leverage, collinearity) check it, and KNN regression is the flexible but data-hungry alternative.==
*Mechanism:* categorical predictors enter as 0/1 dummies. An interaction term $X_1X_2$ lets one predictor's slope depend on another. A polynomial term keeps the model linear in its coefficients while bending the fit. Residual plots and statistics such as the leverage statistic $h_i$ and the variance inflation factor (VIF) diagnose where the model's assumptions fail. KNN regression predicts the average of the $K$ nearest responses and beats least squares only when the true relationship is far from linear and the number of predictors is small.
## Reading Guide
- [ ] Read pp. 91-94 (§3.3.1): dummy variables for two levels and for three or more, and Tables 3.7 and 3.8.
- [ ] Read pp. 95-98 (§3.3.2 interactions): Eq. 3.31 to 3.33 and Table 3.9, the TV×radio model. Rewrite Eq. 3.32 yourself.
- [ ] Study Figure 3.7 (p. 98): parallel lines without an interaction, different slopes with one.
- [ ] Read pp. 98-99 (polynomial regression) and look at Figure 3.8: the linear, quadratic and fifth-degree fits.
- [ ] Skim pp. 100-108 (§3.3.3): one paragraph per problem, and look at Figures 3.9, 3.11 and 3.14.
- [ ] Read pp. 107-109 (collinearity and VIF): Table 3.11 and the VIF values 160.67 and 160.59.
- [ ] Read pp. 111-115 (§3.5): KNN regression, and Figures 3.16 to 3.20.
## Key Concepts
- **Dummy variable (one-hot encoding):** $x_i=1$ if the $i$th observation is in a category, else 0. With $K$ levels use $K-1$ dummies, and the omitted level is the **baseline**.
- **Additive assumption and interaction term:** the plain model assumes each predictor's effect is independent of the others. $Y=\beta_0+\beta_1X_1+\beta_2X_2+\beta_3X_1X_2$ makes the slope of $X_1$ equal $\beta_1+\beta_3X_2$.
- **Hierarchical principle:** keep the main effects whenever the interaction is in the model, even if their own $p$-values are large.
- **Polynomial regression:** add $X^2,X^3,\dots$ as new predictors. It is still a linear model because it is linear in the $\beta$.
- **Residual plot:** residuals $e_i=y_i-\hat y_i$ against fitted values. A pattern means a violated assumption.
- **Outlier vs high leverage:** an outlier has an unusual $y$ for its $x$. A high-leverage point has an unusual $x$. $h_i=\frac1n+\frac{(x_i-\bar x)^2}{\sum(x_{i'}-\bar x)^2}$ (3.37).
- **Collinearity and VIF:** predictors closely related to each other. $\text{VIF}(\hat\beta_j)=\frac1{1-R^2_{X_j\mid X_{-j}}}$, and a large value means collinearity.
- **KNN regression:** $\hat f(x_0)=\frac1K\sum_{x_i\in\mathcal N_0}y_i$.
## Full Reading Notes
### §3.3.1 Qualitative predictors (pp. 91-94)
Own-a-house coded 1/0 gives $\beta_0=509.80$ (non-owners) and $\beta_1=19.73$ (the owner difference) with $p=0.669$, so no evidence of a difference. Coding $\pm1$ changes the interpretation but not the fit. Three regions use two dummies: East is the baseline, and the South and West coefficients are differences from it ($-12.50$ and $-18.69$, both non-significant). Footnote 10 notes that machine learning calls this one-hot encoding.
### §3.3.2 Removing the additive assumption (pp. 95-98)
Adding TV×radio to the Advertising model gives $\hat\beta_{TV\times radio}=0.0011$ with $p<0.0001$: radio spending makes TV spending more effective. The same logic works for a qualitative predictor: income and a student dummy with an interaction gives two lines with different intercepts and slopes. Without the interaction the two lines are parallel.
> [!EXPLAIN] Explanation of the above topic: Rewrite $Y=\beta_0+\beta_1X_1+\beta_2X_2+\beta_3X_1X_2$ as $\beta_0+(\beta_1+\beta_3X_2)X_1+\beta_2X_2$. The slope on $X_1$ now changes with $X_2$. With $\hat\beta_1=0.0191$ and $\hat\beta_3=0.0011$, one more TV dollar is worth $0.0191+0.0011\cdot\text{radio}$, so heavier radio spending makes each TV dollar worth more.
### Non-linear relationships (pp. 98-99)
For mpg against horsepower, adding horsepower$^2$ lifts $R^2$ from $0.606$ to $0.688$ (Table 3.10). A fifth-degree polynomial fits the data more wiggly than needed. It is still a multiple regression, so standard software fits it.
### §3.3.3 Potential problems (pp. 100-108)
Six problems. Non-linearity: a U-shaped residual plot (Figure 3.9), fixed with $\log X$, $\sqrt X$ or $X^2$. Correlated errors: common in time series, they make standard errors too small (doubling the data is the extreme case). Non-constant variance: a funnel in the residual plot, treated with a log of the response or weighted least squares. Outliers: judged by studentized residuals, with $|r|>3$ suspect. High leverage: unusual $x$, measured by $h_i$ whose average is $(p+1)/n$. Collinearity: contours of the RSS form a narrow valley, so many coefficient pairs fit equally well and the standard error of $\hat\beta_{limit}$ grows 12-fold (Table 3.11). A VIF of $160.67$ and $160.59$ for rating and limit, against $1.01$ for age, flags it. Fix by dropping one variable or combining the two into one.
> [!EXPLAIN] Explanation of the above topic: Collinearity does not hurt prediction much, it hurts interpretation. If two predictors move together, the data cannot say which one deserves the credit, so each coefficient becomes unstable and its $t$-statistic drops. Lecture 3.4 states the same idea as multicollinearity and uses a correlation of about 0.6 as a rule of thumb. The book's VIF is the more reliable check because it also catches collinearity among three or more predictors.
### §3.4 The marketing plan (pp. 109-111)
Answers seven questions on Advertising: an overall $F$-test, RSE of 1.69 (about 12% of the mean), only TV and radio significant, VIFs of 1.005, 1.145 and 1.145 for TV, radio, newspaper (so no collinearity), a prediction interval for an individual and a confidence interval for an average, evidence of non-linearity, and synergy from the interaction.
### §3.5 Linear regression vs KNN (pp. 111-115)
KNN with $K=1$ interpolates the training data as a step function, and $K=9$ is smooth. A parametric model wins when its form is near the truth (Figure 3.18, linear truth). As the truth gets more non-linear KNN pulls ahead (Figure 3.19). With extra noise predictors KNN deteriorates and linear regression does not (Figure 3.20, $p\ge4$): the curse of dimensionality. Linear regression is also easier to interpret.
## Worked Example
The Credit regression of balance on age and limit versus rating and limit (Table 3.11). Rating and limit are highly collinear, so the standard error of $\hat\beta_{limit}$ is 12 times larger, its $t$-statistic collapses, and a variable that was significant in the first model is no longer significant. The fitted values hardly change, which is the point: the damage is to the coefficients, not the predictions.
## Connections
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 8|Week 8]]: LEC 3.2 and 3.3 fit one-feature lines. The Advertising notebook then fits multiple features with gradient descent in PyTorch.
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 9|Week 9]]: LEC 3.4 uses the same Advertising data for interaction terms and multicollinearity, and states the KNN-regression formula from §3.5.
- [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 6|ISL Chapter 6]]: ridge and lasso address the variance problem that collinearity creates.
- [[20_Progress/Degree/CSCI 4521/Homework/Homework - 3|Homework - 3]] is the assignment this chapter's checks apply to.
## Open Questions
- [ ] Verify that printed page = PDF page minus 9 across these pages. It matches the printed numbers read inside this extraction.
- [ ] Compare with a NotebookLM run on PDF pp. 100-124 and note any disagreement here.
- [ ] Decide whether §3.4 deserves its own note or stays a paragraph. The lecture does not teach it.
