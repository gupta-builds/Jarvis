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
next: "Run the NotebookLM prompt on PDF pp. 261-274 and compare. Write Chapter - 6 for §6.1 and §6.2 (ridge and lasso) once pp. 239-260 extract."
---
# ISL Chapter 6 (Part 2) — Dimension Reduction and High Dimensions (§6.3 to §6.4)
**Source:** *An Introduction to Statistical Learning with Applications in Python* (James, Witten, Hastie, Tibshirani, Taylor), Chapter 6, §6.3 and §6.4, printed pp. 252-265 (PDF pp. 261-274).
**Read from:** `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Textbook & Resources\ISL Textbook CSCI 4521.pdf`, extracted with MinerU.
**Course role:** part of the [[20_Progress/Degree/CSCI 4521/Weekly/Week - 8|Week 8]] reading (ISL 6.2 to 6.4). It connects the PCA of Weeks 5 and 6 to regression and explains why regularization matters when features outnumber observations.
## Chapter Summary
==When a regression has too many predictors, fit it on $M<p$ linear combinations of them instead, and when $p$ reaches or passes $n$, ordinary least squares fits the noise perfectly and has to be replaced by a constrained method.==
*Mechanism:* dimension reduction builds $Z_m=\sum_j\phi_{jm}X_j$ and regresses $Y$ on $Z_1,\dots,Z_M$ (Eq. 6.16 and 6.17). Principal components regression (PCR) picks the $\phi$ by PCA, which ignores $Y$. Partial least squares (PLS) picks them using $Y$. The number $M$ is chosen by cross-validation. In high dimensions the training $R^2$ rises to 1 and the training MSE to 0 even for unrelated features, so selection and shrinkage methods, evaluated on held-out data, are the working tools.
## Reading Guide
- [ ] Read pp. 252-253 (§6.3 intro, Eq. 6.16 to 6.18): how a dimension-reduction fit is a constrained linear model.
- [ ] Study Figure 6.14 and 6.15 (pp. 254-255): the first principal component of population against ad spend.
- [ ] Read pp. 256-257 (PCR): the assumption that high-variance directions predict $Y$, and Figure 6.18.
- [ ] Read p. 259 (PLS, §6.3.2): how the first direction uses the response.
- [ ] Read pp. 262-263 (§6.4.2) and study Figures 6.22 and 6.23: $n=20$ observations, features unrelated to the response, $R^2\to1$.
- [ ] Read pp. 264-265 (§6.4.3 to 6.4.4): the lasso in high dimensions and the curse of dimensionality.
## Key Concepts
- **Dimension reduction:** estimate $M+1$ coefficients $\theta$ instead of $p+1$ coefficients $\beta$, with $\beta_j=\sum_m\theta_m\phi_{jm}$ (6.18). The constraint can lower variance.
- **Principal component loadings and scores:** for the advertising data $Z_1=0.839(\text{pop}-\overline{\text{pop}})+0.544(\text{ad}-\overline{\text{ad}})$ (6.19). The $\phi$ are loadings and the $z_{i1}$ values are scores. $Z_2$ is uncorrelated with $Z_1$ and has the most remaining variance.
- **PCR vs PLS:** PCR chooses directions without looking at $Y$ (unsupervised). PLS regresses $Y$ on each $X_j$ to set $\phi_{j1}$ (supervised).
- **Feature selection vs PCR:** each component mixes all $p$ original features, so PCR is not feature selection and is closer to ridge than to the lasso.
- **High-dimensional setting:** more features than observations, $p>n$ (and trouble already when $p$ is close to $n$).
- **Curse of dimensionality:** adding features not truly associated with the response worsens test error.
## Full Reading Notes
### §6.3 Dimension reduction methods (pp. 252-253)
Subset selection and shrinkage use the original predictors. Dimension reduction transforms them first. The $M$ new variables are fitted with least squares, and the result is a special case of the full linear model whose coefficients are forced into the form (6.18). All such methods have two steps: choose $Z_1,\dots,Z_M$, then fit.
### §6.3.1 Principal components regression (pp. 253-257)
The first principal component is the direction of greatest variance and also the line closest to the data in squared perpendicular distance. Its projection gives scores, a one-number summary of the pop and ad budgets of each location. With two predictors there are at most two components, and together they hold all the information. PCR fits least squares on the first $M$ components. It works when the first few components carry the relevant signal and does poorly when many are needed (Figure 6.18: $n=50$, $p=45$). Choose $M$ by cross-validation. **Standardize each predictor first**, or high-variance variables dominate the components.
> [!EXPLAIN] Explanation of the above topic: PCR is PCA from Week 6 with a regression glued on. PCA finds directions of high variance and knows nothing about $Y$. The bet is that high-variance directions are also the ones that predict $Y$. When that bet fails, the first components can be useless for prediction, the same warning as Quiz 2's PCA problem where max variance threw away class information.
### §6.3.2 Partial least squares (pp. 258-259)
PLS sets $\phi_{j1}$ to the simple-regression coefficient of $Y$ on $X_j$ (after standardizing), so features most related to $Y$ get the most weight. Later directions repeat this on residuals after regressing each variable on $Z_1$. In practice PLS often performs no better than ridge regression or PCR, because the supervised step can reduce bias but raises variance.
### §6.4 Considerations in high dimensions (pp. 261-265)
Classical regression assumes $n\gg p$. Modern data (half a million SNPs for a few hundred patients, or search terms as bag-of-words with $n\approx1{,}000$) has $p\gg n$. When $p\ge n$, least squares can reach zero residuals whether or not there is a relationship, as Figure 6.22 shows with 2 points and a line. In Figure 6.23 ($n=20$, unrelated features) $R^2$ climbs to 1 and training MSE falls to 0 as features are added. $C_p$, AIC and BIC fail here because they need a good estimate of $\sigma^2$. Forward selection, ridge, the lasso and PCR help. In Figure 6.24 the lasso with $p=2000$ and only 20 true features does badly unless the penalty is chosen well, and test error grows with $p$ when the extra features are noise.
> [!EXPLAIN] Explanation of the above topic: With $n=20$ points you can draw a curve through all of them using enough free parameters, so training error says nothing. Test error is the only honest score. This is why the lecture says to choose $\lambda$ by cross-validation and to avoid data leakage, and why high-dimensional results must be reported on held-out data.
## Worked Example
Figure 6.23: simulate $n=20$ observations and regress on 1 to 20 features that have nothing to do with the response. Training $R^2$ rises toward 1 and training MSE toward 0 as the features are added, while the test error rises. The only change between the first and the last model is more unrelated columns, which is the curse of dimensionality in one picture.
## Connections
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 8|Week 8]] and [[20_Progress/Degree/CSCI 4521/Weekly/Week - 9|Week 9]]: LEC 3.4 says PCA can reduce correlated features before regression and can have a regularizing effect.
- [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 12|ISL Chapter 12]] §12.2 is PCA itself, and [[20_Progress/Degree/CSCI 4521/Quizzes/Quiz - 2|Quiz - 2]] tests projection and reconstruction.
- [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5|DLB Chapter 5]] §5.11.1 gives the same curse-of-dimensionality warning for non-parametric methods.
- [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 3 (Part 2)|ISL Chapter 3 (Part 2)]]: collinearity is the problem that §6.3 reduces by combining predictors.
## Open Questions
- [ ] Verify that printed page = PDF page minus 9 on these pages. It was read off chapter 3 pages and assumed here.
- [ ] Compare with a NotebookLM run on PDF pp. 261-274 and note any disagreement here.
- [ ] Check whether the lecture's "regularization" slides use the book's Eq. 6.5 and 6.7, which are on the unextracted pp. 248-260.
