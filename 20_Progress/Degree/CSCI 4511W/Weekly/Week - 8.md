---
type: class
class_kind: week
status: seed
created: 2026-11-02
updated: 2026-11-02
tags:
  - class
  - lecture
area:
  - "[[CSCI 4511W Board]]"
next: "Week - 9: Ch 6.1 reading and Lecture 15 (11/2), then Ch 6.2-6.3 constraint propagation and backtracking (11/4)"
---
# Week - 8
## What you must be able to do
- [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 6|Chapter 6]] §6.1 (to create) - State a CSP as the triple $\langle X, D, C\rangle$ and say what each part holds.
- Write a binary constraint as $\langle scope, relation\rangle$ by enumerating only the value pairs that fit both domains (Short Quiz 7, Q1.1 to Q1.3).
- Distinguish a consistent, complete, and partial assignment, and say when an assignment is a solution.
- Draw the constraint graph for a binary CSP and count its nodes (variables) and edges (constrained pairs) (Short Quiz 7, Q1.4 and Q1.5).
- Explain why a CSP formulation shrinks the search space compared with atomic state-space search, using the map-coloring counts from Lecture 14.
- Contrast a relation written as an explicit set of tuples with one written as a function, and say which one `aima-python` uses.
## Key ideas (short)
- **A CSP opens the state's black box**: a state is a set of variables with values, so the algorithm can look inside it, unlike the **atomic** states of Chapters 3 and 4.
- **A constraint is a pair $\langle scope, relation\rangle$**: the scope is the tuple of variables involved, the relation is the set of value tuples they may take (or a function that tests a tuple).
- **An enumeration lists only legal pairs drawn from the domains**: a value outside a variable's domain can never appear in its relation.
- **Consistent is not complete**: a solution is an assignment that is both **consistent** (no violated constraint) and **complete** (every variable assigned).
- **The constraint graph has one node per variable and one edge per constrained pair**: it only draws binary constraints cleanly; higher-order constraints need a hypergraph.
- **Pruning is the payoff**: ruling out variable/value combinations early removes large parts of the state space at once.
## Concepts created today
- [[20_Progress/Degree/CSCI 4511W/Concepts/Concept - Constraint Satisfaction|Concept - Constraint Satisfaction]] (to create)
## Examples worth keeping
- **Lecture 14 slide 22**: $D_1 = \{3,4,5\}$, $D_2 = \{4,5\}$, constraint $X_1 < X_2$ is written $\langle (X_1,X_2), \{(3,4),(3,5),(4,5)\}\rangle$. Short Quiz 7 repeats this exact move on a four-variable problem.
- **Map coloring as plain search** (Lecture 14, slides 16 to 19): 7 regions and 3 colors give $3^7$ states; the naive `Actions` returns 21 region/color choices; after one assignment $3^6$ states remain, after two $3^5$. A legality-checked `Actions` shrinks it faster.
- **Australia map** (textbook §6.1.1): $SA \neq WA$ fully enumerated is $\{(red,green),(red,blue),(green,red),(green,blue),(blue,red),(blue,green)\}$, six pairs, not nine.
- **Pruning count** (textbook §6.1.1): after $SA = blue$, the five neighbors have $2^5 = 32$ assignments left instead of $3^5 = 243$, a reduction of 87%.
## Lecture
### Pre-lecture source notes
Source: `CSCI4511W Lecture 14.pdf` (Oct 28, 2026, "Adversarial Search, CSPs"), parsed with MinerU. No live capture was written for this week. Lecture 13 (Oct 26, Monte Carlo tree search) is not captured here yet (see Takeaways).
### 1. Announcements (Lecture 14, slide 2)
- Short Quiz review.
- PS2 grades posted; the long quiz should be posted by Friday.
- PS3 posted.
### 2. Adversarial search wrap-up (slides 3 to 15)
- **Partially observable, nondeterministic card games**: Bridge has about 10 million possible hands to consider (26 choose 13), so expectiminimax is not a good fit.
	- **Averaging over clairvoyance**: treat the shuffle as one random event at the root, then run minimax. The cost is that the agent never bluffs and never gathers or hides information (Chapter 17).
	- Other ideas: **abstraction** (treat similar hands as identical) and **forward pruning** (sample 100 to 1000 deals and compute their expectiminimax scores).
- **Three or more players**: nodes become A, B, C nodes, and utilities become a vector $(eval_a, eval_b, eval_c)$. A minimax-style backup where each player maximizes their own entry may work, but the slide asks whether that is a good assumption. This leads to non-cooperative game theory (Chapter 18).
- **Limits of game search**: the choice of algorithm depends on the branching factor and on having a good eval function. A bad eval function can mislead alpha-beta, and search wastes time when one move is obviously best.
- **Wrap-up list**: assume the opponent plays as well as possible; use pruning, depth cutoff, and evaluation functions; estimate utility by Monte Carlo simulation; use opening and endgame libraries; nondeterminism and partial observability add cost; more than two agents brings in game theory.
### 3. Chapter Six: back to puzzles (slides 16 to 19)
- Map-coloring problem: color each region so that no two bordering regions share a color, using 3 colors.
- The slide first asks it as classical search: what does a state look like, what does `Actions(s)` return, how big is the state space, what does `Is-Goal(s)` check.
- **Very naive formulation**: $3^7$ states from an empty coloring; `Actions(problem.initial)` returns 21 options (each region with each of three colors) and does no legality checking. After one assignment, $3^6$ states remain; after two, $3^5$.
- **Less naive formulation**: `Actions(s)` returns only assignments that leave a legal map. The slide gives the remaining space after coloring region A as $2^4 \cdot 3^2$ and after coloring region B as $2 \cdot 1 \cdot 2 \cdot 2 \cdot 2 = 2^4$. Both expressions are as the text extraction shows them (Unresolved: check against the slide image).
- The slide ends with "Could we do even better?", which sets up CSPs.
### 4. Constraint-satisfaction problems (slides 20 to 24)
- Earlier chapters treated the state space as a graph of atomic states ("black boxes") with heuristics on top. In a CSP the algorithm may use information inside the state.
- States are variables with values. Restrictions on values are constraints. A problem is solved when every variable has a value and no constraint is violated.
- **Big idea** (slide 21): eliminate large portions of the state space by finding variable/value combinations that violate constraints.
- **Definitions** (slides 22 and 24):
	- $X$: a set of variables $\{X_1,\ldots,X_n\}$.
	- $D$: a set of domains $\{D_1,\ldots,D_n\}$, one per variable; $D_i$ is the set of legal values for $X_i$.
	- $C$: a set of constraints. Each $C_j$ is a pair $\langle scope, relation\rangle$; the scope is the tuple of variables involved, and the relation is the set of values they can take (an enumeration or a function).
	- Slide 22 example: $D_1=\{3,4,5\}$, $D_2=\{4,5\}$, $X_1<X_2$ becomes $\langle (X_1,X_2), \{(3,4),(3,5),(4,5)\}\rangle$.
- **Assignment vocabulary** (slide 23): an assignment pairs values with variables; **consistent** means no constraint is violated; **complete** means every variable is assigned; a consistent, complete assignment is a **solution**; a **partial assignment** leaves variables unassigned; a consistent partial assignment is a **partial solution**. CSP algorithms build partial solutions as they search.
- Slide 24 closes with the exercise: what are $X$, $D$, and $C$ for map coloring?
## Short Quiz - 7
Constraint satisfaction formulation. Source: the quiz questions pasted on 2026-11-02, checked against Lecture 14 slide 22 and AIMA §6.1 (PDF p. 360, 362, 369). Answers were also recomputed by script from the domains. Not yet graded by Canvas.

**Q1** - CSP with $X=\{A,B,C,D\}$ and domains $D_A=D_B=D_C=\{1,2,3\}$, $D_D=\{3,4\}$. The answer grid for Q1.1 to Q1.3 is the 12 pairs $(1,1)$ through $(3,4)$, numbered row by row (Choice 1 = $(1,1)$, Choice 4 = $(1,4)$, Choice 5 = $(2,1)$, and so on). Each enumeration keeps only pairs whose first value is in the first variable's domain, whose second value is in the second variable's domain, and that satisfy the constraint.

**Q1.1** - $A < B$, encoded as $\langle (A,B), \{\ldots\}\rangle$: **$(1,2)$, $(1,3)$, $(2,3)$** (Choices 2, 3, 7). Both variables range over $\{1,2,3\}$, so $B=4$ is impossible and $(1,4)$, $(2,4)$, $(3,4)$ are out.

**Q1.2** - $B = 2C$, encoded as $\langle (B,C), \{\ldots\}\rangle$: **$(2,1)$ only** (Choice 5). $C=1$ gives $B=2$. $C=2$ would need $B=4$ and $C=3$ would need $B=6$, and neither is in $D_B=\{1,2,3\}$.

**Q1.3** - $B \le D$, encoded as $\langle (B,D), \{\ldots\}\rangle$: **$(1,3)$, $(1,4)$, $(2,3)$, $(2,4)$, $(3,3)$, $(3,4)$** (Choices 3, 4, 7, 8, 11, 12). $D \in \{3,4\}$ is at least every value of $B \in \{1,2,3\}$, so all six pairs hold. The equality case $(3,3)$ counts because the constraint is $\le$, not $<$.

**Q1.4** - Nodes in the constraint graph: **4**. One node per variable: $A$, $B$, $C$, $D$.

**Q1.5** - Edges in the constraint graph: **3**. One edge per constrained pair: $A$-$B$, $B$-$C$, $B$-$D$. $B$ is the hub with degree 3; $A$, $C$, and $D$ each touch only $B$.

> [!NOTE]
> Placement and numbering are Inferred. The Board lists Short Quiz 07 on 10/26 (Week 8) with Chapter 5 games reading, but this quiz tests CSP formulation, which Lecture 14 (10/28) introduces. The quiz's due date was not in the paste (Unresolved). Possibly Canvas numbering shifted because Lecture 10 said there was no short quiz on 10/12.
## Textbook integration
> [!IMPORTANT]
> Main chapter: [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 6|Chapter 6]] (to create), §6.1 "Defining Constraint Satisfaction Problems" (PDF pp. 360 to 370 in the local 2,145-page file). Lecture 14 covers the definitions only; everything below is the delta.

**What §6.1 adds beyond Lecture 14:**

- **Relations can be a set or a function** (p. 360): for $X_1,X_2$ both with domain $\{1,2,3\}$, "$X_1 > X_2$" is either $\{(3,1),(3,2),(2,1)\}$ or the expression $X_1>X_2$. This is the textbook's own example of the enumeration style the quiz uses.
- **Solving a CSP is NP-complete in general** (p. 360), though important subclasses solve efficiently.
- **Constraint graph defined** (p. 362): nodes are variables, and an edge connects any two variables that participate in a constraint. A binary CSP (only unary and binary constraints) can be drawn this way (p. 367).
- **Why formulate as a CSP** (p. 363): natural representation, mature solvers, and fast pruning. Once $SA=blue$ is chosen, an atomic searcher faces $3^5=243$ assignments of the five neighbors; constraints leave $2^5=32$.
- **Constraint types** (pp. 367 to 369): **unary** (one variable, such as $SA \neq green$), **binary**, **ternary** (such as $Between(X,Y,Z)$), and **global** (such as $Alldiff$, used in Sudoku and cryptarithmetic). Higher-order constraints need a **constraint hypergraph**, where hypernodes stand for $n$-ary constraints.
- **Every finite-domain constraint reduces to binary ones** with auxiliary variables (p. 369); the **dual graph** is the other conversion, with one variable per original constraint.
- **Preference constraints and COPs** (p. 370): soft preferences become costs, giving a constrained optimization problem.
- **Job-shop scheduling** (§6.1.2, pp. 363 to 365): tasks are variables, start times are values, and precedence constraints look like $T_1+d_1 \le T_2$. A deadline is just a finite domain.

**What the course code shows** (`aima-python/aima/csp.py`): the `CSP` class takes `variables`, `domains`, a `neighbors` dict, and one function `constraints(A, a, B, b)`. Its docstring says the textbook uses explicit pairs, but the function form is more compact (n-queens in $O(n)$ space instead of $O(n^4)$). For Q1 the `neighbors` dict would be `{A:[B], B:[A,C,D], C:[B], D:[B]}`, which is the constraint graph's adjacency list: 4 keys and 3 undirected edges. `NaryCSP` and `Constraint(scope, condition)` mirror $\langle scope, relation\rangle$ directly.
## Takeaways (questions to resolve)
- [ ] Lecture 13 (Oct 26, Monte Carlo tree search) and AIMA §5.3 to §5.6 are not captured in this note. Add them, since they belong to Week 8 by the Board's dates.
- [ ] Compare these Short Quiz 7 answers against the Canvas grade once it posts, and record any difference.
- [ ] Check Lecture 14 slide 19's state-space expressions ($2^4 \cdot 3^2$ and $2^4$) against the slide image, because the text extraction is garbled there.
- [ ] Write the Chapter 6 textbook note and a constraint-satisfaction concept note, then replace the "(to create)" links here.
- [ ] Confirm the quiz's due date and numbering in Canvas (the Board has Short Quiz 07 on 10/26).
## Lecture-to-textbook synthesis
==A CSP is a triple $\langle X, D, C\rangle$ in which each constraint pairs a scope of variables with a relation of allowed value tuples, and a solution is an assignment that is both complete and consistent.==

*Mechanism:* Lecture 14 starts from map coloring as ordinary search and shows the state space shrinking as legality checks move into `Actions`. The CSP definitions generalize that move: the constraints say which combinations are illegal, so the algorithm can discard them without visiting them. Writing a constraint as an enumeration is a mechanical filter: take every pair from the two domains, and keep the pairs that satisfy the condition. The constraint graph then records only which variables share a constraint, so each constrained pair is one edge regardless of how many tuples its relation holds.
- Lecture example: slide 22's $X_1<X_2$ over $\{3,4,5\}$ and $\{4,5\}$ gives $\{(3,4),(3,5),(4,5)\}$. Short Quiz 7 applies the same filter to $A<B$, $B=2C$, and $B\le D$.
- Textbook connection: [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 6|Chapter 6]] §6.1 (to create) gives the same filter with $X_1>X_2$ and defines the constraint graph, plus the unary, binary, ternary, and global constraint types the lecture skipped.
- Concept links: [[20_Progress/Degree/CSCI 4511W/Concepts/Concept - Constraint Satisfaction|Concept - Constraint Satisfaction]] (to create), [[20_Progress/Degree/CSCI 4511W/Concepts/Concept - Uninformed Search|Concept - Uninformed Search]]
> [!WARNING]
> Do not fill an enumeration from the whole answer grid. The quiz offers $(1,4)$ through $(3,4)$ as choices, but the value 4 exists only in $D_D$, so those pairs can be legal only in Q1.3. In Q1.1 and Q1.2 the second variable ($B$ or $C$) never takes 4. Also keep the two counts apart: nodes count variables (4), edges count constrained pairs (3), not tuples.
> [!SUMMARY]
> Week 8 closes adversarial search and opens Chapter 6: states stop being black boxes, and a problem becomes variables, domains, and constraints whose relations can be enumerated, drawn as a constraint graph, and used to prune the search.
## Flashcards
#cards/csci4511w
What are the three parts of a **CSP**, and what does each hold?::$X$ is the set of variables, $D$ is one domain (set of legal values) per variable, and $C$ is the set of constraints. Each constraint is a pair $\langle scope, relation\rangle$. #cards/csci4511w
How do you build the **enumeration** for a binary constraint such as $B \le D$ with $D_B=\{1,2,3\}$ and $D_D=\{3,4\}$?::List every pair with the first value from $D_B$ and the second from $D_D$, then keep those that satisfy the condition: $(1,3),(1,4),(2,3),(2,4),(3,3),(3,4)$. Values outside the domains never appear. #cards/csci4511w
Why is **$B = 2C$** with all of $B,C \in \{1,2,3\}$ enumerated as only $\{(2,1)\}$?::$C=2$ and $C=3$ would force $B=4$ and $B=6$, which are not in $D_B$. Only $C=1$, $B=2$ survives. #cards/csci4511w
In a **constraint graph**, what is a node and what is an edge?::A node is a variable. An edge joins two variables that appear together in a constraint. For $A<B$, $B=2C$, $B\le D$ that gives 4 nodes and 3 edges ($A$-$B$, $B$-$C$, $B$-$D$). #cards/csci4511w
Distinguish a **consistent** assignment from a **complete** one, and say what a solution is.::Consistent means no constraint is violated; complete means every variable has a value. A solution is an assignment that is both. A consistent but incomplete assignment is only a partial solution. #cards/csci4511w
How does `aima-python` represent a **constraint** compared with the textbook's enumeration?::The `CSP` class stores a function `constraints(A, a, B, b)` plus a `neighbors` dict instead of explicit pairs, which is more compact (n-queens takes $O(n)$ space instead of $O(n^4)$). #cards/csci4511w
