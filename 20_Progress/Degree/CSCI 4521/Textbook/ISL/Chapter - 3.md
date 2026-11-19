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
next: "Run the NotebookLM prompt on PDF pp. 79-99 and compare. Read pp. 91-98 of the extraction closely: the F-statistic, variable selection and prediction passages were skimmed for this note."
---
# ISL Chapter 3 — Simple and Multiple Linear Regression (§3.1 to §3.2)
**Source:** *An Introduction to Statistical Learning with Applications in Python* (James, Witten, Hastie, Tibshirani, Taylor), Chapter 3, §3.1 and §3.2, printed pp. 70-90 (PDF pp. 79-99).
**Read from:** `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Textbook & Resources\ISL Textbook CSCI 4521.pdf`, extracted with MinerU.
**Course role:** the reading for [[20_Progress/Degree/CSCI 4521/Weekly/Week - 8|Week 8]] (LEC 3.2 intro to regression, LEC 3.3 gradient descent). §3.3 to §3.5 are in [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 3 (Part 2)|Chapter - 3 (Part 2)]].
## Chapter Summary
==Linear regression fits $Y\approx\beta_0+\beta_1X_1+\dots+\beta_pX_p$ by choosing the coefficients that minimize the residual sum of squares, and its value is not only the fit but the tools for asking how far the coefficients and the fit can be trusted.==
*Mechanism:* given $n$ observations, least squares picks the $\hat\beta$ that minimize $\text{RSS}=\sum(y_i-\hat y_i)^2$. Standard errors turn the estimates into confidence intervals and $t$-tests of $H_0:\beta_j=0$. The residual standard error (RSE) and $R^2$ measure fit. With several predictors the coefficients are partial effects, so a variable that looks related alone can look unrelated once correlated variables are included.
## Reading Guide
- [ ] Read pp. 70-72 (§3.1 to 3.1.1, Eq. 3.1 to 3.4): the model, RSS and the closed-form least squares estimates. Work Eq. 3.4 on three points.
- [ ] Study Figure 3.1 (p. 72): the fitted line $\hat\beta_0=7.03$, $\hat\beta_1=0.0475$ on Advertising.
- [ ] Read pp. 72-76 (§3.1.2): population line vs least squares line, standard errors (Eq. 3.8), confidence intervals (Eq. 3.9 and 3.10) and the $t$-statistic (Eq. 3.14).
- [ ] Read pp. 77-79 (§3.1.3): RSE (Eq. 3.15) and $R^2$ (Eq. 3.17), and Table 3.2.
- [ ] Read pp. 80-83 (§3.2 to 3.2.1, Eq. 3.19 to 3.22): why one multiple regression beats three simple ones.
- [ ] Study Table 3.4 and Table 3.5 (p. 83): the newspaper coefficient vanishes in the multiple fit.
- [ ] Skim pp. 83-90 (§3.2.2): the $F$-statistic, variable selection, model fit and prediction intervals.
## Key Concepts
- **Residual sum of squares (RSS):** $\sum_i(y_i-\hat\beta_0-\hat\beta_1x_i)^2$. Least squares minimizes it, giving $\hat\beta_1=\frac{\sum(x_i-\bar x)(y_i-\bar y)}{\sum(x_i-\bar x)^2}$ and $\hat\beta_0=\bar y-\hat\beta_1\bar x$ (3.4).
- **Population regression line vs least squares line:** the first is the true best linear approximation (unknown). The second is estimated from one sample, and averaged over many samples the estimates are unbiased.
- **Standard error and confidence interval:** $\text{SE}(\hat\beta_1)^2=\sigma^2/\sum(x_i-\bar x)^2$ and an approximate 95% interval is $\hat\beta_1\pm2\,\text{SE}(\hat\beta_1)$.
- **$t$-statistic:** $t=\hat\beta_1/\text{SE}(\hat\beta_1)$, the number of standard errors the estimate is from zero. A tiny $p$-value rejects $H_0:\beta_1=0$.
- **RSE and $R^2$:** $\text{RSE}=\sqrt{\text{RSS}/(n-2)}$ is lack of fit in the units of $Y$. $R^2=1-\text{RSS}/\text{TSS}$ is the proportion of variance explained, and in simple regression $R^2=r^2$.
- **Multiple regression:** $\beta_j$ is the average effect of a one-unit rise in $X_j$ holding the other predictors fixed.
## Full Reading Notes
### §3.1.1 Estimating the coefficients (pp. 71-72)
With $n=200$ Advertising markets, the fitted line is $\hat y=7.03+0.0475x$: an extra \$1,000 of TV budget goes with about 47.5 extra units sold. Each residual is $e_i=y_i-\hat y_i$ and the line minimizes the sum of their squares.
### §3.1.2 Accuracy of the coefficient estimates (pp. 72-77)
The model is $Y=\beta_0+\beta_1X+\epsilon$ with a mean-zero error. The sample mean estimates a population mean unbiasedly and $\text{Var}(\hat\mu)=\sigma^2/n$. The coefficient standard errors have the same flavor. They assume errors with common variance and no correlation, and $\sigma^2$ is estimated by the RSE. For Advertising the 95% intervals are $[6.130,7.935]$ for $\beta_0$ and $[0.042,0.053]$ for $\beta_1$.
> [!EXPLAIN] Explanation of the above topic: There is one true line and many possible samples. Each sample gives a slightly different fitted line. The standard error says how much the slope typically moves from sample to sample, so "slope $\pm2$ SE" is a range that would catch the true slope about 95% of the time. If that range excludes zero, a real relationship is plausible.
### §3.1.3 Accuracy of the model (pp. 77-79)
RSE for Advertising is $3.26$, meaning actual sales deviate from the regression line by about 3,260 units on average. $R^2$ is unit-free and between 0 and 1, but what counts as good depends on the problem.
> [!EXPLAIN] Explanation of the above topic: TSS is how much $Y$ varies around its own mean. RSS is how much is left after the line. So $R^2$ is the share of that variation the line removed. An $R^2$ of 0.6 means the line explains 60% of the spread of $Y$. It can only rise when predictors are added, so it cannot by itself say whether a bigger model is better.
### §3.2 Multiple linear regression (pp. 80-90)
Three separate simple regressions cannot give one prediction and ignore that the media budgets are correlated. The multiple model $\text{sales}=\beta_0+\beta_1\text{TV}+\beta_2\text{radio}+\beta_3\text{newspaper}+\epsilon$ (3.20) is fit by minimizing the same RSS across all coefficients (3.22). In the multiple fit the newspaper coefficient is near zero even though simple regression shows a relationship. Radio and newspaper are correlated at 0.35, so newspaper was getting credit that belongs to radio. The book compares this to shark attacks and ice cream sales, both driven by heat. §3.2.2 then asks four questions: whether any predictor matters (the $F$-statistic), which matter (forward, backward or mixed selection), how well the model fits, and how to predict.
> [!EXPLAIN] Explanation of the above topic: A coefficient in a multiple regression answers "what does this variable add once the others are already in". A simple regression answers "what does it predict alone", which includes everything it is correlated with. That gap is why Lecture 3.4 checks correlations first and why Week 9's multicollinearity slide matters.
## Worked Example
Advertising, simple regression of sales on TV: $\hat\beta_0=7.03$ and $\hat\beta_1=0.0475$. The lecture writes the same fit as $\text{sales}=0.048\cdot\text{TV}+7.03$. At a TV budget of 100 (in thousands) the prediction is $7.03+0.0475\cdot100=11.78$. A 95% interval for the slope, $[0.042,0.053]$, excludes zero, so the relationship is not due to chance. RSE of 3.26 warns that individual markets still scatter widely around the line.
## Connections
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 8|Week 8]]: LEC 3.2 frames the fit as minimizing $\|Y-(mX+b)\|_2^2$ and finds it by gradient descent instead of the closed form (3.4). The two reach the same line.
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 9|Week 9]]: LEC 3.4 writes the multiple model in matrix form $y\approx[X\;1][w;b]^\top$ and asks for correlations between features.
- [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 3 (Part 2)|ISL Chapter 3 (Part 2)]] for interactions, collinearity and KNN regression.
- [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]] §2.2 for the MSE and bias-variance frame these statistics sit in.
## Open Questions
- [ ] Verify that printed page = PDF page minus 9 on these pages. It matches the printed numbers inside the §3.3 extraction.
- [ ] Read PDF pp. 91-99 fully and add the $F$-statistic formula and the selection methods, which this note only names.
- [ ] Compare with a NotebookLM run on PDF pp. 79-99 and note any disagreement here.
