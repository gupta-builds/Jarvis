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
next: "Run the NotebookLM prompt on these pages and compare, since this note was written from the MinerU extraction on 2026-11-19. Verify the printed-page offset on a chapter 4 page."
---
# ISL Chapter 4 (Part 2) — Logistic Regression (§4.3)
**Source:** *An Introduction to Statistical Learning with Applications in Python* (James, Witten, Hastie, Tibshirani, Taylor), Chapter 4, §4.3 with the end of §4.2, printed pp. 138-145 (PDF pp. 147-154).
**Read from:** `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Textbook & Resources\ISL Textbook CSCI 4521.pdf`, extracted with MinerU.
**Course role:** the reading for [[20_Progress/Degree/CSCI 4521/Weekly/Week - 10|Week 10]] and [[20_Progress/Degree/CSCI 4521/Weekly/Week - 11|Week 11]] (LEC 4.2 and 4.3). §4.4 is in [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 4|Chapter - 4]].
## Chapter Summary
==Logistic regression models the probability that a response is in a class by passing a linear score through the logistic function, so the log odds are linear in the predictors and every output stays between 0 and 1.==
*Mechanism:* a binary response coded 0/1 is predicted by $p(X)=\frac{e^{\beta_0+\beta_1X}}{1+e^{\beta_0+\beta_1X}}$. The coefficients are chosen by maximum likelihood, which picks the $\beta$ that make the observed labels most probable. A point is labeled 1 when $p(X)$ passes a threshold, 0.5 by default. The limit is that coefficients describe log odds, not probability changes, and a one-predictor fit can mislead when predictors are correlated.
## Reading Guide
- [ ] Read pp. 138-139 (end of §4.2 and the start of §4.3): why a regression on a 0/1 label is unsound for more than two classes and gives meaningless probabilities even for two.
- [ ] Study Figure 4.2 (p. 139): the linear fit dips below 0 and exceeds 1, the logistic fit stays inside.
- [ ] Read p. 140 (§4.3.1, Eqs. 4.2 to 4.4): derive odds and log odds from the logistic function yourself.
- [ ] Read pp. 141-142 (§4.3.2 to 4.3.3, Eq. 4.5, Tables 4.1 and 4.2): recompute $\hat p=0.00576$ at \$1,000 and $0.586$ at \$2,000.
- [ ] Study Table 4.3 and Figure 4.3 (pp. 143-144): why the student coefficient flips sign in the multiple model.
- [ ] Read p. 145 (§4.3.5, Eqs. 4.10 to 4.13): multinomial logistic regression and softmax.
## Key Concepts
- **Logistic function:** $p(X)=\frac{e^{\beta_0+\beta_1X}}{1+e^{\beta_0+\beta_1X}}$ (4.2). It always gives an S-shaped curve inside $(0,1)$, which a straight-line fit to a 0/1 label cannot guarantee.
- **Odds and log odds (logit):** odds $=\frac{p}{1-p}=e^{\beta_0+\beta_1X}$ and log odds $=\beta_0+\beta_1X$ (4.3, 4.4). A one-unit rise in $X$ adds $\beta_1$ to the log odds and multiplies the odds by $e^{\beta_1}$, but the change in $p$ itself depends on where $X$ is.
- **Maximum likelihood:** choose $\beta_0,\beta_1$ to maximize $\ell=\prod_{y_i=1}p(x_i)\prod_{y_{i'}=0}(1-p(x_{i'}))$ (4.5). Least squares is a special case of it.
- **z-statistic:** the role the $t$-statistic plays for linear regression, the estimate divided by its standard error.
- **Confounding:** a predictor's effect looks different alone than alongside a correlated predictor.
- **Multinomial logistic regression and softmax:** for $K>2$ classes, one baseline class and $K-1$ linear log-odds (4.12), or the symmetric softmax $\frac{e^{\beta_{k0}+\cdots}}{\sum_l e^{\beta_{l0}+\cdots}}$ (4.13).
## Full Reading Notes
### Why not regression for a class label (pp. 138-139)
Coding classes 0/1 and fitting least squares can be defended for two classes, because $X\hat\beta$ then estimates $\Pr(Y=1\mid X)$, and flipping the coding gives the same predictions. Two reasons still rule it out: it cannot handle more than two unordered classes, and its estimates can leave $[0,1]$, so they are not probabilities.
### §4.3.1 The logistic model (pp. 139-140)
Rather than model $Y$, model $p(X)=\Pr(Y=1\mid X)$. The Default example predicts default from balance, and a conservative lender may lower the cutoff from 0.5 to 0.1. Rearranging (4.2) gives odds $=e^{\beta_0+\beta_1X}$ and taking logs gives a logit linear in $X$.
> [!EXPLAIN] Explanation of the above topic: Odds of $1/4$ means 1 default for every 4 non-defaults, which is $p=0.2$. The model is a straight line in log-odds space. The logistic function bends that line back into probabilities, so the curve is steep in the middle and flat near 0 and 1. That bend is why $\beta_1$ is not "the change in probability per unit".
### §4.3.2 Estimating the coefficients (pp. 141-142)
Least squares on the logit would work in principle, but maximum likelihood has better statistical properties and fits many models in the book. The likelihood (4.5) multiplies $p(x_i)$ over the defaulters and $1-p(x_{i'})$ over the rest, and the estimates maximize it. For Default on balance, $\hat\beta_1=0.0055$: each extra dollar of balance raises the log odds of default by 0.0055.
> [!EXPLAIN] Explanation of the above topic: Read the likelihood as a score for the whole dataset. A defaulter contributes $p$, so a high predicted probability helps. A non-defaulter contributes $1-p$, so a low one helps. Maximizing the product pushes the curve up for defaulters and down for the rest. Lecture 4.2 turns the same product into a sum with a log so it can be differentiated.
### §4.3.3 Making predictions (p. 142)
With $\hat\beta_0=-10.6513$ and $\hat\beta_1=0.0055$ the predicted default probability is $0.00576$ at a \$1,000 balance and $0.586$ at \$2,000. A student dummy alone gives $0.0431$ for students and $0.0292$ for non-students.
### §4.3.4 Multiple logistic regression (pp. 143-144)
The logit becomes $\beta_0+\beta_1X_1+\cdots+\beta_pX_p$ (4.6). In Table 4.3 the student coefficient is negative ($-0.6468$) although student status alone looks riskier. Students carry higher balances (Figure 4.3), and balance drives default, so for a fixed balance a student is less risky. At \$1,500 balance and \$40,000 income the model gives $0.058$ for a student and $0.105$ for a non-student.
> [!EXPLAIN] Explanation of the above topic: This is confounding. The raw student-versus-default comparison mixes two effects, being a student and carrying more debt. Fitting both predictors separates them. The lesson is to be suspicious of any one-predictor conclusion when predictors are correlated, the same warning as collinearity in linear regression.
### §4.3.5 Multinomial logistic regression (p. 145)
Pick class $K$ as the baseline. Then $\log\frac{\Pr(Y=k\mid X)}{\Pr(Y=K\mid X)}$ is linear in the features, so the log odds between any two classes stay linear. The fitted probabilities do not depend on the baseline, but coefficient interpretation does. Softmax (4.13) is an equivalent symmetric coding that is common in machine learning.
## Worked Example
Default data, one predictor. With $\hat\beta_0=-10.6513$, $\hat\beta_1=0.0055$ and balance $=2000$: the score is $-10.6513+0.0055\cdot2000=0.3487$, so $\hat p=\frac{e^{0.3487}}{1+e^{0.3487}}=0.586$, and at the 0.5 cutoff the label is Yes. Moving the lender's cutoff to 0.1 labels more people Yes, which is how a cost-sensitive rule is set. The multiple model's student sign flip (Table 4.3) shows what changes when a correlated predictor enters.
## Connections
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 10|Week 10]]: LEC 4.2 writes the same model as $p(x)=\frac1{1+e^{-(w^\top x+b)}}$, builds the same likelihood, takes its log, and fits by gradient descent. The book states the coefficients come from maximum likelihood and leaves the algorithm to software.
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 11|Week 11]]: LEC 4.3 implements it in PyTorch, adds SGD and the ROC curve. The book's cutoff discussion (0.5 vs 0.1) is the idea behind the ROC threshold sweep.
- [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5 (Part 2)|DLB Chapter 5 (Part 2)]] §5.7.1 reaches the same model through probabilistic supervised learning.
- [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 4|ISL Chapter 4]] §4.4: LDA, a generative alternative that models $\Pr(X\mid Y)$ instead.
## Open Questions
- [ ] Verify that printed page = PDF page minus 9 on a chapter 4 page. It was read off chapter 3 pages and assumed here.
- [ ] Compare this note with a NotebookLM run on PDF pp. 147-154 and move any disagreement here.
- [ ] Confirm whether the course's quizzes use the book's likelihood form (4.5) or the lecture's $y\log p+(1-y)\log(1-p)$ form.
