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
  - "[[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 3|ISL Chapter 3]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5 (Part 2)|DLB Chapter 5 (Part 2)]]"
next: "Add protected Week 8 live capture, open the PyTorch intro series once it is found on Canvas, and note the largest learning rate that made gradient descent diverge in the 3.3 notebook."
---
# Week - 8
## What you must be able to do
- Choose between k-means, GMM and DBSCAN for a dataset from its cluster shapes, and say what $\epsilon$ and `minPts` control. See [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 3|ISL Chapter 3]] for the regression half of the week.
- Define core, neighborhood and noise points and run DBSCAN by hand on a small plot.
- Write the least squares loss $\|Y-(mX+b)\|_2^2$ and say why the squared form is used.
- Run gradient descent by hand on $l(m)=(m-3)^2$ with $\tau=0.8$ and $m_0=10$.
- State the learning-rate bound $\tau\le1/L$ and recognize a diverging run.
- Use `requires_grad`, `.backward()`, `.grad` and `torch.no_grad()` to fit a line in PyTorch.
## Key ideas (short)
- **DBSCAN** clusters by **density**: points with at least `minPts` neighbors inside $\epsilon$ are core points, and points near no core point are **noise**.
- k-means and GMM describe clusters by a center, so they fail on **two moons** and **concentric circles**, while DBSCAN does not.
- **Regression** predicts a value, so correctness is **how close**, not yes or no.
- The best line is found by **minimizing a loss**, and calculus says to look where the **gradient is zero**.
- **Gradient descent** steps **opposite** the gradient, and the **learning rate** decides whether it converges.
## Concepts created today
None created in this build.
## Examples worth keeping
- The **DBSCAN activity** on the naftaliharris visualizer: find a shape where $\epsilon$ is too big, too small and just right. The slide asks for pictures of the final clustering on ChimeIn.
- The **TV budget** fit from the slides: $\text{sales}=0.048\cdot\text{TV}+7.03$.
- **Gradient descent on $l(m)=(m-3)^2$**: $\nabla l=2m-6$, start $m_0=10$, $\nabla l(10)=14$, $\tau=0.8$ gives $m=10-0.8\cdot14=-1.2$. This overshoots the minimum at 3.
- The 4-point line fit in the notebook: $(1,5),(2,8),(3,11),(5,17)$ and the true line $y=3x+2$. At $m=b=1$ the predictions are $2,3,4,6$, the squared errors $9,25,49,121$ and the mean loss $51$.
## Lecture
### Pre-lecture source notes
No live lecture capture exists for this week yet. These notes come from `Lectures/Week - 7/3.2 DBSCAN, intro to regression.pptx.pdf` (47 slides, filed in the Week - 7 folder although the Board schedules it for Tue 10/27), `Lectures/Week - 8/3.3 regression with pytorch, gradient descent.pptx.pdf` (26 slides) and the notebook `3.3 regression with pytorch.ipynb`. Add what the professor said live under a `Live lecture capture` heading and do not overwrite it.
### 1. LEC 3.2: DBSCAN (Tue 10/27)
*Why not k-means or GMM.* Both define a cluster by a center and spread, so they cannot cluster two moons. The deck's reframing: a cluster is a region of high **point density**. DBSCAN (1996) separates core points, neighborhood points and noise.
*Algorithm.* 1. Pick `minPts`. 2. Pick $\epsilon$. 3. For every point: points within $\epsilon$ of each other are neighbors. A point with at least `minPts` neighbors is a core point. Points in a core point's neighborhood join its cluster. Points in no core point's neighborhood are noise. The slides step through `minPts = 3` with an $\epsilon$ circle.
*Parameters.* `minPts` $\ge$ dims+1 and about 2 x dims. $\epsilon$ is harder: graph the sorted distance of every point to its `minPts`-th neighbor and read the elbow, and "usually smallest is better".
*Comparison slide.* k-means: parameter $k$, linear boundaries, isotropic, hard partitions, fixed number of clusters, use when speed or memory is the bottleneck. GMM: parameter $k$, covariance-aware, anisotropic, soft and overlapping, $k$ typically fixed. DBSCAN: parameters $\epsilon$ and `minPts`, arbitrary boundaries, connected non-overlapping clusters, number of clusters depends on the data, some points left as noise, and choosing $\epsilon$ needs domain understanding.
*ChimeIn.* For concentric circles, two moons, anisotropic, 3 blobs, mixed variance and unstructured data, pick k-means, GMM or DBSCAN and say why.
### 2. LEC 3.2: Intro to regression (Tue 10/27, continued)
*Unit 3.* A regression model predicts a value, so correctness is closeness. The deck separates statistical learning (GMM, linear regression: Gaussians, likelihood, line fitting, correlation, hypothesis tests) from non-statistical learning (kNN, DBSCAN), and notes the textbook is mostly statistical. **Parameters** are estimated from data ($m,b$ in $f(x)=mx+b$), while **hyperparameters** are set before training (the $k$ in kNN) and chosen by cross-validation or a test split.
*The fit.* Predict sales from TV, radio and newspaper budgets. For TV alone, $Y\approx mX+b$ and we want $\|Y-(mX+b)\|_2$ small. The $\ell_1$ distance is an alternative. The deck gives the fitted line $\text{sales}=0.048\cdot\text{TV}+7.03$, then minimizes $l(m,b)=\|Y-(mX+b)\|_2^2$ so no square root is needed.
*Calculus.* A local minimum has derivative zero. At a point on the left of the minimum the derivative is negative and on the right positive, so moving opposite the gradient goes toward a minimum. A partial derivative holds the other variables fixed: $\partial f/\partial x_i=\lim_{h\to0}\frac{f(x+he_i)-f(x)}{h}$. The **gradient** stacks them, has the dimension of the input and points toward fastest increase. ChimeIn: find $\partial l/\partial m$ and $\partial l/\partial b$ for $l(m,b)=(2m+b-1)^2$.
### 3. LEC 3.3: Gradient descent (Thu 10/29)
*Algorithm.* Start at a random point, compute the gradient, move opposite to it, and repeat until the next point is within a threshold of the previous one. The deck calls it essentially the only generic numerical optimizer, with all others upgrades of it. Update: $x\leftarrow x-t\nabla f(x)$ with step size $t$ (learning rate $\tau$), stopping when $\frac{|f(x_{k})-f(x_{k-1})|}{|f(x_{k-1})|}<\epsilon$.
*Worked example.* $l(m)=(m-3)^2$, $\nabla l=2m-6$, $m_0=10$, $\nabla l(10)=14$, $\tau=0.8$: $m=10-0.8\cdot14=-1.2$. Repeat on your own on ChimeIn.
*Learning rate.* If $\|\nabla l(m_1)-\nabla l(m_2)\|\le L\|m_1-m_2\|$ then convergence is guaranteed for $\tau\le1/L$. Here $L=2$, so $\tau\le0.5$. Too small converges slowly, near $1/L$ fastest, above $1/L$ erratic or divergent. Larger rates can still converge, and the bound is often hard to find, so people use trial and error.
*Efficient computation.* Parallelism: SIMD and MapReduce (map turns a vector into a vector, reduce turns a vector into a scalar), well suited to GPUs. PyTorch supplies efficient implementations.
*PyTorch.* A **tensor** is a multi-dimensional array of one data type that integrates with autodiff. `x = torch.tensor([[1,2,3]])`. Set `x.requires_grad = True`. Then `l = 10 * x.sum(); l.backward(); x.grad` gives `[[10,10,10]]`.
*Notebook, `3.3 regression with pytorch.ipynb`.* `l = 10*m` with `m=1` gives `m.grad = 10`. The sum `3*m + 2*n + val*q + offset` has gradients $3,2,6,5,1$ and value $41.1$. Line fit on $(1,5),(2,8),(3,11),(5,17)$ with $m=b=1$: loss $51$, `m.grad = -44.5`, `b.grad = -13`. One step with `lr = 0.001` under `torch.no_grad()` moves to $m=1.0445$, $b=1.013$ and loss $48.87$. Then `.grad.zero_()`. A loop with `lr = 0.0948` and 1000 epochs reaches `m*x+b = [5, 8, 11, 17]`. The notebook's TODO: find the smallest learning rate that makes the gradient explode (ChimeIn). One complete iteration over the data is an **epoch**.
*Real data.* The next notebook fits sales from TV, radio and newspaper (the slide says it is similar to HW3). See Week 9.
## Textbook integration
The book's route to the same line is a closed form, $\hat\beta_1=\frac{\sum(x_i-\bar x)(y_i-\bar y)}{\sum(x_i-\bar x)^2}$ and $\hat\beta_0=\bar y-\hat\beta_1\bar x$, in [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 3|ISL Chapter 3]] §3.1.1, and the same fitted line $\hat y=7.03+0.0475x$. The lecture finds it by gradient descent. The book also adds what the lecture skips: standard errors, confidence intervals, RSE and $R^2$ (§3.1.2 to 3.1.3).
[[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5 (Part 2)|DLB Chapter 5 (Part 2)]] §5.9 explains why gradient descent becomes stochastic on large data, which Week 10 uses, and §5.7.1 shows linear regression has a closed form while logistic regression does not.
[[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 6|ISL Chapter 6]] (§6.2) and [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 6 (Part 2)|Chapter 6 (Part 2)]] are assigned this week but do not appear until LEC 3.4 (Week 9), so they are reading ahead. The PyTorch intro series named in the Board is still not found locally.
## Takeaways (questions to resolve)
- [ ] What was the smallest learning rate that made the 3.3 notebook diverge, and does it match $1/L$ for that loss?
- [ ] Pick the right method for each dataset in the 3.2 ChimeIn (circles, moons, anisotropic, blobs, mixed variance, unstructured) and write the one-sentence reason.
- [ ] Do the closed-form and gradient-descent lines agree on the TV data ($0.048,\ 7.03$)?
- [ ] Locate the PyTorch intro series on Canvas and save it locally.
## Lecture-to-textbook synthesis
==Fitting a regression line is an optimization problem: define a loss for how far predictions are from data, then move the parameters opposite the loss gradient until it stops changing, and the learning rate decides whether that walk converges.==
*Mechanism:* the loss $\|Y-(mX+b)\|_2^2$ is smooth, so its gradient points toward steeper loss and the update $x\leftarrow x-t\nabla f(x)$ descends. PyTorch builds the gradient by autodiff so the same loop trains any differentiable model. The book's normal equations solve the least squares case directly, and gradient descent is the method that also works when no closed form exists.
- Lecture example/scenario: $l(m)=(m-3)^2$ from $m_0=10$ with $\tau=0.8$ overshoots to $m=-1.2$ because the bound for this loss is $\tau\le0.5$.
- Textbook connection: [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 3|ISL Chapter 3]] (the closed-form fit and its error measures) and [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5 (Part 2)|DLB Chapter 5 (Part 2)]] (why SGD).
- Concept links: None created in this build.
> [!WARNING]
> Treating a bigger learning rate as always faster. Above $1/L$ the steps overshoot and the loss can grow, and unnormalized features make the safe rate tiny, which Week 9's Advertising notebook shows.
> [!SUMMARY]
> Week 8 turns "draw a line through the data" into "minimize a loss with gradient descent", after widening clustering to density-based DBSCAN.
## Flashcards
Why does gradient descent step opposite the gradient?::The gradient points toward the fastest increase of the loss, so the negative gradient is the local direction of fastest decrease. #cards/csci4521
When does gradient descent on $l(m)=(m-3)^2$ stop being guaranteed to converge?::Here the gradient is $2$-Lipschitz ($L=2$), so $\tau\le0.5$ is guaranteed. Larger rates may still converge but can overshoot or diverge. #cards/csci4521
What do `minPts` and $\epsilon$ decide in DBSCAN?::A point is a core point if at least `minPts` points lie within $\epsilon$ of it, and clusters grow through core points. A point near no core point is noise. #cards/csci4521
