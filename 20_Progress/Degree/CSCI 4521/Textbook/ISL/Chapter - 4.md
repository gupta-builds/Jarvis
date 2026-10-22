---
type: class
class_kind: textbook
status: sprout
created: 2026-10-22
updated: 2026-10-22
area:
  - "[[CSCI 4521 Board]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/Textbook Map|Textbook Map]]"
tags:
  - class
  - textbook
next: "Verify §4.4 page numbers against the rendered PDF (currently taken from pdftotext -layout output); reconcile with Week 7 live capture once LEC 3.1 (LDA/GMM) lands."
---
# ISL Chapter 4 — Classification, §4.4 Generative Models for Classification
**Source:** *An Introduction to Statistical Learning, with Applications in Python* (James, Witten, Hastie, Tibshirani, Taylor), Chapter 4, §4.4, pp. 146-161.
**Read from:** `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Textbook & Resources\ISL Textbook CSCI 4521.pdf`.
**Course role:** Week 7's assigned reading (ISL 4.4), supporting LEC 3.1 "advanced clustering, LDA, GMM" — this section is the textbook's own derivation of LDA from first principles, the piece LEC 3.1 builds the GMM framing on top of.
## Chapter Summary
==Generative classifiers model each class's own distribution of the predictors, $f_k(X)$, and flip that around with Bayes' theorem to get $\Pr(Y=k\mid X=x)$ — the alternative to logistic regression's direct modeling of that same posterior.==
*Mechanism:* assume a form for $f_k(x)$ (Gaussian, shared or per-class covariance, or independent per-feature), estimate its parameters from each class's training examples, then plug into Bayes' theorem $\Pr(Y=k\mid X=x)=\frac{\pi_k f_k(x)}{\sum_l \pi_l f_l(x)}$ to approximate the Bayes classifier. LDA assumes one shared covariance matrix across classes (linear decision boundary, fewer parameters, lower variance); QDA assumes a separate covariance per class (quadratic boundary, more parameters, lower bias but higher variance); Naive Bayes assumes the predictors are independent within each class (sidesteps estimating any covariance structure at all). The right choice is a bias-variance trade-off driven by how much data you have and whether the classes really do share a covariance shape.
## Key Concepts
- **Prior and density function:** $\pi_k=\Pr(Y=k)$ is the prior probability of class $k$; $f_k(x)\equiv\Pr(X\mid Y=k)$ is the class-conditional density. Estimating $\pi_k$ is easy (just the class proportion in training data); estimating $f_k(x)$ is the hard part each method below handles differently.
- **Why not just use logistic regression:** generative models are more stable when classes are well-separated (logistic regression's coefficient estimates get unstable there), can be more accurate than logistic regression when $X$ really is near-Gaussian within each class and $n$ is small, and extend naturally to $K>2$ classes.
- **LDA ($p=1$, §4.4.1):** assumes $f_k(x)=\mathcal N(\mu_k,\sigma^2)$ with a *shared* variance $\sigma^2$ across classes. The Bayes classifier reduces to assigning $x$ to the class maximizing $\delta_k(x)=x\cdot\frac{\mu_k}{\sigma^2}-\frac{\mu_k^2}{2\sigma^2}+\log(\pi_k)$ — linear in $x$, hence "linear" discriminant analysis. With equal priors and two classes, the decision boundary sits exactly at the midpoint $(\mu_1+\mu_2)/2$.
- **LDA ($p>1$, §4.4.2):** extends to $X\sim\mathcal N(\mu_k,\Sigma)$, a multivariate Gaussian with class-specific mean vector but one *shared* covariance matrix $\Sigma$ across all $K$ classes. The discriminant functions stay linear in $x$.
- **QDA (§4.4.3):** relaxes LDA's shared-covariance assumption — each class gets its own $\Sigma_k$. The discriminant function $\delta_k(x)=-\frac12(x-\mu_k)^\top\Sigma_k^{-1}(x-\mu_k)-\frac12\log|\Sigma_k|+\log\pi_k$ is now quadratic in $x$ (hence the name). More flexible, but estimating $K$ separate $p\times p$ covariance matrices costs $K\cdot p(p+1)/2$ parameters versus LDA's shared-$\Sigma$ cost of $p(p+1)/2$ — real variance cost for real flexibility gain, the textbook's own direct statement of the bias-variance trade-off between the two methods.
- **Naive Bayes (§4.4.4):** assumes the $p$ predictors are *independent within each class*, so $f_k(x)=f_{k1}(x_1)\cdot f_{k2}(x_2)\cdots f_{kp}(x_p)$ — each 1-D density is far easier to estimate than one joint $p$-dimensional density. The assumption is almost always literally false, but it trades a little bias for a lot of variance reduction, which is why it still performs well when $n$ is small relative to $p$.
## Full Reading Notes
### Bayes' theorem setup (p. 146)
$\Pr(Y=k\mid X=x)=\frac{\pi_k f_k(x)}{\sum_{l=1}^K \pi_l f_l(x)}$ (Eq. 4.15) is the hinge the whole section turns on: the Bayes classifier (lowest possible error rate, from Chapter 2) assigns $x$ to the class maximizing this posterior, so approximating $f_k(x)$ well is equivalent to approximating the Bayes classifier.
### §4.4.1 LDA for $p=1$ (p. 147)
Assumes $f_k(x)=\frac{1}{\sqrt{2\pi}\sigma_k}\exp\!\left(-\frac{1}{2\sigma_k^2}(x-\mu_k)^2\right)$, then further assumes $\sigma_1=\cdots=\sigma_K=\sigma$ (shared variance). Plugging into Eq. 4.15 and taking logs collapses the comparison to the linear discriminant $\delta_k(x)=x\cdot\mu_k/\sigma^2-\mu_k^2/2\sigma^2+\log\pi_k$ (Eq. 4.18). The worked numeric example (p. 148, Fig. 4.4): $\mu_1=-1.25$, $\mu_2=1.25$, $\sigma_1^2=\sigma_2^2=1$, equal priors — the true Bayes error rate is 10.6%, the LDA classifier (estimated from 20 samples per class) achieves 11.1% — only 0.5 points above the theoretical floor.
### §4.4.2 LDA for $p>1$ (p. 150)
The multivariate Gaussian density is $f(x)=\frac{1}{(2\pi)^{p/2}|\Sigma|^{1/2}}\exp\!\left(-\frac12(x-\mu)^\top\Sigma^{-1}(x-\mu)\right)$ (Eq. 4.23). LDA assumes each class is $\mathcal N(\mu_k,\Sigma)$ with the *same* $\Sigma$ across classes — the decision boundary stays linear in $p>1$ dimensions for the same algebraic reason it did at $p=1$.
### §4.4.3 QDA (p. 156)
Drops the shared-$\Sigma$ assumption: $X\mid Y=k \sim \mathcal N(\mu_k,\Sigma_k)$. Fig. 4.9's two panels make the trade-off visible directly: when the true classes really do share a correlation structure, LDA's lower-variance linear boundary tracks the true (linear) Bayes boundary better than QDA; when the two classes have genuinely different correlation structures, the true Bayes boundary is quadratic and QDA's extra flexibility wins.
### §4.4.4 Naive Bayes (p. 158)
Builds on the same Eq. 4.15 but factorizes $f_k(x)$ across coordinates instead of assuming a shared or per-class Gaussian form. Three options for estimating each 1-D $f_{kj}$: assume $X_j\mid Y=k\sim\mathcal N(\mu_{jk},\sigma_{jk}^2)$ (this is QDA with the extra constraint of a *diagonal* covariance — the key technical distinction from QDA), use a histogram/kernel density estimate, or (for qualitative $X_j$) just count class-conditional proportions.
## Worked Example
- The $p=1$ worked example's exact numbers ($\mu_1=-1.25,\mu_2=1.25,\sigma^2=1$, Bayes error 10.6% vs. LDA 11.1%) is the textbook's own demonstration that LDA, despite being an *approximation* to the Bayes classifier, can get extremely close to the theoretical best-possible error when its Gaussian/shared-variance assumptions genuinely hold.
- The QDA-vs-LDA figure's two scenarios (correlation 0.7 shared across classes vs. correlation $+0.7$/$-0.7$ split by class) is the cleanest textbook illustration of when each method's assumption is or isn't appropriate — worth being able to redraw from memory for a quiz that tests "interpret results on a new dataset."
- The parameter-count comparison (QDA: $K\cdot p(p+1)/2$; LDA: shared $p(p+1)/2$ plus $Kp$ linear coefficients) is a direct, quotable number for "with 50 predictors, QDA needs some multiple of 1,275 parameters" — exactly the kind of curse-of-dimensionality cost [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5|DLB Chapter 5's §5.11.1]] names in the abstract.
## Connections
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 7|Week 7]] is the week this section supports directly (LEC 3.1, advanced clustering/LDA/GMM).
- [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]] supplies the Bayes classifier and bias-variance vocabulary this section's LDA-vs-QDA trade-off directly reuses.
- [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5|DLB Chapter 5]]'s §5.11.1 curse-of-dimensionality framing is the general case of this section's specific QDA-parameter-count argument.
- [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 12|ISL Chapter 12]] covers Gaussian Mixture Models' close cousin (k-means/clustering) from the unsupervised side — LEC 3.1's "GMM" extends LDA/QDA's per-class Gaussian idea to an *unsupervised* setting where class labels aren't observed at all, worth drawing that contrast explicitly once the live lecture lands.
## Open Questions
- [ ] Verify the §4.4 page numbers above against the actual rendered PDF (taken from `pdftotext -layout`, which can misorder multi-column figure captions).
- [ ] Confirm whether LEC 3.1's "GMM" treatment follows this section's generative-classifier framing (supervised, known labels) or jumps straight to the unsupervised Gaussian Mixture Model setting — these use the same Gaussian-density machinery but solve different problems (known vs. latent class labels), and conflating them would be a real error to catch once the live capture lands.
- [ ] No local lecture deck or notebook has been checked yet for whether the course's own LEC 3.1 treatment matches this textbook's LDA→QDA→Naive-Bayes progression or jumps straight to GMM — check `Lectures/Week - 6/3.1 advanced clustering, lda, gmm.pptx.pdf` and `Code/Lectures/Week 6 - 10/3.1 gaussian mixture models.ipynb` directly.
## Flashcards
What does a generative classifier model that a discriminative one (like logistic regression) does not?::It models each class's own distribution of the predictors, $f_k(X)=\Pr(X\mid Y=k)$, then uses Bayes' theorem to get $\Pr(Y=k\mid X)$ — rather than modeling that posterior directly. #cards/csci4521
Why is LDA's decision boundary linear but QDA's is quadratic?::LDA assumes one shared covariance matrix across classes, which cancels the quadratic $x^\top\Sigma^{-1}x$ term when comparing two classes' discriminants; QDA's per-class $\Sigma_k$ leaves that quadratic term in, since it doesn't cancel across classes. #cards/csci4521
When should you prefer LDA over QDA, and why?::When there isn't much training data, since LDA's shared-covariance assumption costs far fewer parameters ($p(p+1)/2$ vs. $K\cdot p(p+1)/2$) and therefore has much lower variance, even if it introduces some bias if the classes' true covariances differ. #cards/csci4521
What specific extra assumption turns QDA into Naive Bayes?::Naive Bayes further assumes each class's covariance matrix is diagonal (predictors independent within class) — it's QDA with all off-diagonal covariance terms forced to zero. #cards/csci4521
Why can naive Bayes still perform well even though real predictors are rarely independent?::The independence assumption introduces bias but sharply reduces variance, since it replaces estimating one full joint density with estimating several easy 1-D densities — a good trade when $n$ is small relative to $p$. #cards/csci4521
