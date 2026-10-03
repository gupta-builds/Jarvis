---
type: class
input_kind: lecture
status: seed
created: 2026-09-28
updated: 2026-10-02
area:
  - "[[CSCI 4511W Board]]"
  - "[[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 3|Chapter - 3]]"
tags:
  - "#class"
  - "#Lecture"
next: "Create Week - 5.md once Ch 4 (Local Search) readings begin (Monday 10/5); reconcile PS2's AIMA-code search problems (route-finding, eight puzzle) against this week's heuristic material"
---
# Week - 4
## What you must be able to do
- [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 3|Chapter 3]] §3.5–3.6 — Derive Greedy Best-First and A\* from `BestFirstSearch(problem, f)` by changing only `f`; state what each `f` means in words.
- Trace Greedy (f = h) and A\* (f = g + h) on the 15-node tree from Lecture 06; explain step-by-step why A\* did not pop dead-end leaf O even though h(O) = 1.
- State the cost-optimality condition for A\* in tree search (admissibility: h(n) ≤ h\*(n)) and in graph search (consistency: h(n) ≤ c(n,a,n') + h(n')); explain why consistency implies admissibility and why consistency is sufficient for graph A\*.
- Reproduce the A\* optimality proof sketch: show that popping a suboptimal goal G2 before the optimal G1 leads to a contradiction when h is admissible.
- Apply Short Quiz 3 Q3: given h(n) = 0 everywhere, state which named algorithm A\* reduces to and why.
- Apply Short Quiz 3 Q2: given h = h\* (exact heuristic), state what Greedy does on the expansion order and why.
- (Wednesday, Lecture 07, 9/30) Derive Manhattan distance (h₂, "distance of wrong tiles") and misplaced tiles (h₁, "number of wrong tiles") from the 8-puzzle action schema by removing specific preconditions; state which precondition is removed to get each.
- (Wednesday, Lecture 07, 9/30) Reproduce the A\* cost-optimality proof using the lecture's own notation (g, g\*, h, h\*, C\*) and explain the admissibility step (h(x) ≤ h\*(x)) that the proof depends on.
- (Wednesday, Lecture 07, 9/30) State the landmark heuristic formula the lecture gave — h(n) = min_L [C\*(n,L) + C\*(L,goal)] — and explain why it is generally **not** admissible, in contrast to the textbook's differential heuristic h_DH(n) = max_L |C\*(n,L) − C\*(goal,L)|, which is.
- (Wednesday, Lecture 07, 9/30) Compute the effective branching factor b\* from a solution depth d and node count N, and explain what a lower b\* means about heuristic quality.
## Key ideas (short)
- **A\* adds sunk-cost accountability to Greedy**: f = h(n) ignores path cost already spent; f = g(n) + h(n) does not. The g(n) term is what prevented A\* from chasing the deceptively low-h dead-end O (h=1) on Lecture 06's tree.
- **Admissible ≠ consistent**: admissible means h ≤ h\* (tree search condition). Consistent additionally satisfies the triangle inequality h(n) ≤ c(n,a,n') + h(n'), making f non-decreasing along any path — states are expanded at their optimal cost on first visit, never re-opened (graph search condition).
- **h = 0 is A\*'s floor**: any admissible h > 0 strictly dominates it (fewer expansions, same optimality guarantee). A\* with h = 0 is exactly UCS — the informed and uninformed families merge at this boundary.
- **Wednesday's heuristic-construction methods (Lecture 07, 9/30)**: relaxed problems and subproblems both produce *admissible* heuristics by construction (removing constraints or restricting scope can only make the problem easier, never harder). The lecture's own landmark formula is the exception — it estimates by routing *through* a landmark, which can only add cost relative to the true shortest path, so it is generally **inadmissible**. "Admissible heuristic" is not one guaranteed property of every construction method; it has to be checked per method.
- **Completeness and admissibility, confirmed by lecture**: Lecture 07 directly answered the two discussion questions Lecture 06 left open — A\* is complete "as long as path costs are > 0," and cost-optimality "depends on h(n)," specifically admissibility ("never overestimates... always thinks we're closer than we are"). Note the lecture's completeness statement is a simplified version of the textbook's (which also requires finite branching factor b) — see Takeaways for the exam-risk flag.
- **Greedy says "probably"**: the lecture's own slide stated "if we have a good estimation function, this will probably work well." Not a guarantee — greedy is a practical speedup, not a correct algorithm by the course's cost-optimality definition.
## Concepts created today
- [[20_Progress/Degree/CSCI 4511W/Concepts/Concept - Informed Search|Concept - Informed Search]] — mechanism (greedy vs. A\*, admissibility vs. consistency), optimality proof, heuristic construction overview (§3.6 textbook-only), real contrasts, and failure modes: created this session once Lecture 06 and §3.5–3.6 landed.
## Examples worth keeping
- **15-node Greedy vs. A\* trace** (Lecture 06, 9/28): Greedy expanded dead-end leaf O (h=1) because it had the lowest h on the frontier — O has no successors, so this was wasted work. A\* never popped O: its f = g(O) + h(O) = 15 + 1 = 16, far larger than L's f = 11. Both algorithms returned the same optimal path A→C→F→L (cost 11). Key lesson: A\*'s g(n) component makes a low heuristic insufficient to justify expansion when the actual path to that node is expensive.
- **A\* degenerating to UCS** (Short Quiz Q3): h(n) = 0 for every node makes f(n) = g(n) + 0 = g(n) — the exact ordering Lecture 05 defined for UCS. h = 0 is trivially admissible (0 ≤ h\*(n) for all n). This is not a coincidence: UCS and A\* are the same algorithm at h = 0.
- **Greedy with exact heuristic h = h\*** (Short Quiz Q2): greedy orders by the true remaining cost at every step, so the frontier's minimum h node is always the next node on the optimal path. The path traced is optimal and no non-solution nodes are expanded ("only nodes on the optimal solution path will be explored"). This is the AIMA §3.5.1 result: greedy becomes A\* when h is perfect.
- **h(A) = 5 overestimates in Short Quiz Q4's diamond graph**: the optimal cost from A is 4 (A→B→D, costs 1+3). h(A) = 5 > 4 violates admissibility at A. Did not affect that quiz's trace (A is always expanded first regardless of its f-value), but the same heuristic applied differently could cause A\* to return the 7-cost path A→C→D instead of the 4-cost optimal.
## Lecture
### 1. Announcements and Uninformed Review (Lecture 06, 9/28)
Announcements: "Code reviews continue!" Short quiz today.

**Review slide — "Uninformed Search":** Listed BFS, Iterative-Deepening Depth-First Search, Uniform Cost Search, then posed: "Why 'uninformed'?" Answer from slide: "No information about how close to a solution we are."

### 2. Informed Search: Definitions (Lecture 06, 9/28)
Slide titled "Informed Search" — four defining bullets:
- **"Informed" because we have an estimate of a node's distance to goal**
- Specifically, we have some function h(n) that takes a node as input and returns a numeric value that is an estimate (called a "heuristic")
- **Can use h(n) to help order nodes!**
- Two algorithms introduced immediately:
  - **Greedy Best-First**: f(n) = h(n)
  - **A\* Search**: f(n) = g(n) + h(n) (where g(n) is path cost)

### 3. Example State Space: 15-Node Tree (Lecture 06, 9/28)
A binary/quaternary tree with 15 nodes (root A, leaves H–O) introduced as the running example for both Greedy and A\* traces. Slide shows the tree structure with edge costs and a separate h-value table:

Tree edges (cost labels):
- A → B: 2, A → C: 5
- B → D: 4, B → E: 5
- C → F: 1, C → G: 2
- D → H: 3, D → I: 1
- E → J: 2, E → K: 4
- F → L: 5, F → M: 7
- G → N: 1, G → O: 8

H-value table (goal = L, h(L) = 0):

| n | h(n) | n | h(n) |
|---|---|---|---|
| A | 10 | I | 4 |
| B | 6 | J | 3 |
| C | 5 | K | 4 |
| D | 5 | L | 0 |
| E | 5 | M | 2 |
| F | 4 | N | 4 |
| G | 3 | O | 1 |
| H | 4 | | |

> [!NOTE]
> Slides use a "Frontier: ..." display that keeps already-explored nodes visible for reference alongside unexpanded nodes. Text extraction cannot distinguish the two; the frontier described below tracks only the algorithmic priority queue (unexpanded nodes only). The "Reached" table shown on the slides grows monotonically and is reproduced as shown.

### 4. Greedy Best-First Trace on 15-Node Tree (Lecture 06, 9/28)
Slides show the expansion step by step. Greedy orders by f(n) = h(n) alone. Goal: L (h = 0).

| Step | Action | Frontier (f = h) | Reached |
|---|---|---|---|
| Init | — | A(h=10) | A:(A, g=0) |
| Explore A | Expand A | B(h=6), C(h=5) | adds B:(B,2); C:(C,5) |
| Pop C (h=5) | Expand C | B(h=6), **F(h=4), G(h=3)** | adds F:(F,6); G:(G,7) |
| Pop G (h=3) | Expand G | B(h=6), F(h=4), **N(h=4), O(h=1)** | adds N:(N,8); O:(O,15) |
| Pop O (h=1) | Expand O | B(h=6), F(h=4), N(h=4) | — (O is leaf, no children) |
| Pop F (h=4) | Expand F | B(h=6), N(h=4), **M(h=2), L(h=0)** | adds L:(L,11); M:(M,13) |
| Pop L (h=0) | **Goal!** | — | **Return A→C→F→L, cost 11** |

Dead end at O: O has h = 1 (the lowest on the frontier at that step) but no successors. Greedy wasted one expansion chasing a deceptive heuristic value. Path found: A → C → F → L, total cost 5 + 1 + 5 = 11.

**Discussion — Greedy slide** (verbatim): "Greedy uses estimate to order nodes on the frontier. If we have a good estimation function, this will probably work well!"

### 5. A\* Trace on 15-Node Tree (Lecture 06, 9/28)
A\* orders by f(n) = g(n) + h(n). Same 15-node tree, same goal L.

| Step | Action | Frontier (f = g + h) | Reached |
|---|---|---|---|
| Init | — | A(f=0+10=10) | A:(A, g=0) |
| Explore A | Expand A | **B(f=2+6=8), C(f=5+5=10)** | adds B:(B,2); C:(C,5) |
| Pop B (f=8) | Expand B | C(f=10), **D(f=6+5=11), E(f=7+5=12)** | adds D:(D,6); E:(E,7) |
| Pop C (f=10) | Expand C | D(f=11), E(f=12), **F(f=6+4=10), G(f=7+3=10)** | adds F:(F,6); G:(G,7) |
| Pop F (f=10) | Expand F | G(f=10), D(f=11), E(f=12), **L(f=11+0=11), M(f=13+2=15)** | adds L:(L,11); M:(M,13) |
| Explore G (f=10) | (slide ends here) | — | — |

The lecture trace stopped after showing G being explored, leaving the remaining A\* discussion as three questions (see §7). The full trace would continue: pop G → expand → N(f=12), O(f=16); pop D(f=11) → expand → H(f=13), I(f=11); pop L(f=11) → **goal**, return A→C→F→L, cost 11.

**Key contrast with Greedy:** O never gets popped by A\*. At the step where Greedy popped O (h=1), A\*'s f(O) = g(O) + h(O) = 15 + 1 = 16 — far below L's f = 11 in the priority queue. A\* expanded one more node than Greedy on this example (7 vs. 6), but A\* is provably correct; Greedy happened to find the same optimal path here because the heuristic was reasonably accurate along the solution route.

**Discussion — A\* slide** (verbatim): "A\* uses path cost and estimate to order nodes on the frontier."

### 6. Discussion Questions — A\* Properties (Lecture 06, 9/28)
Three questions posed to the class, not fully answered in the slides:
- **Is A\* complete? What condition(s) are necessary?** (Conditions from textbook: finite b and c ≥ ε > 0.)
- **Is A\* cost-optimal? What condition(s) are necessary?** (Conditions: admissible h for tree search; consistent h for graph search.)
- **Time and Space Complexity?** (Worst-case O(b^d) for both; practically much better with a good h.)

### 7. Another Example — Minnesota Cities Exercise (Lecture 06, 9/28)
A six-city Minnesota road-map problem introduced as a class exercise (diagram in slides). Goal state: Morris (h_SLD = 0). Cities and h_SLD values from the slide's table:

| City | h_SLD |
|---|---|
| Crookston | 140 |
| Duluth | 60 |
| Minneapolis | 230 |
| Morris (goal) | 0 |
| Rochester | 50 |
| St. Paul | (cut off in extraction) |

Partial edge structure from slide layout (exact diagram not fully recoverable from text extraction):
- Crookston connects with edges ~160 and ~280
- Morris → Minneapolis: 185
- Minneapolis → St. Paul: 12
- St. Paul → Rochester: 60
- Duluth connects with edges ~140 and ~130

Left as a student exercise to trace A\* and verify completeness, cost-optimality, and complexity against the discussion questions from §6 above.

### 8. Announcements and A\* Analysis: Completeness and Cost-Optimality (Lecture 07, 9/30)
Announcements: Short Quiz 3 scores posted ("doh!"); Problem Set 2 posted, using the AIMA code for uninformed and informed search on route-finding and the Eight Puzzle.

**A\* Analysis — Completeness** (verbatim): "Complete, as long as path costs are > 0."

**A\* Analysis — Cost-Optimality** (verbatim):
- "Depends on h(n)"
- "Important characteristic for h(n): Admissibility"
- "An admissible heuristic function never overestimates"
- "It will always think that we're closer than we are"

This directly answers the two discussion questions Lecture 06 left open (§6 above).

### 9. A\* Cost-Optimality Proof (Lecture 07, 9/30)
The lecture gave the same proof-by-contradiction structure as the textbook, using its own notation:

Definitions: \(C^*\) = optimal path cost; \(g(n)\) = path cost from initial state to \(n\); \(g^*(n)\) = optimal path cost from initial state to \(n\); \(h(n)\) = heuristic estimate from \(n\) to goal; \(h^*(n)\) = true optimal cost from \(n\) to goal.

Claim: A\* with an admissible heuristic is cost-optimal — it returns a solution with cost exactly \(C^*\).

Proof by contradiction, as given on the slide:
1. Assume A\* returns a solution with cost \(C > C^*\).
2. Then some node \(n'\) on the true optimal path was never expanded by A\*.
3. Since \(n'\) was never expanded, \(f(n') > C^*\) (otherwise it would have been popped).
4. By definition, \(f(n') = g(n') + h(n')\).
5. Since \(n'\) is on the optimal path, \(g(n') = g^*(n')\), so \(f(n') = g^*(n') + h(n')\).
6. Since \(h\) is admissible, \(h(n') \le h^*(n')\), so \(f(n') \le g^*(n') + h^*(n') = C^*\) (by definition of \(C^*\)).
7. Collapsing steps 3–6: \(f(n') \le C^*\) **and** \(f(n') > C^*\) — a direct contradiction.

**A\* Analysis — final summary slide:** Complete? Yes. Cost-Optimal? Yes, with admissible h(n). Time and Space Complexity? "Both depend on h(n), but will be some sort of exponential" — deferred until heuristic quality is covered later in the same lecture.

### 10. A\* Variations: Weighted A\*, IDA\*, and Others (Lecture 07, 9/30)
Motivation (verbatim): "The exponential space complexity of A\* is not ideal. Let's look at some approaches to ease this."

**Weighted A\*:** \(f(n) = g(n) + W \times h(n)\). The slide poses the behavior at the extremes as a question: how does search behave if \(W = 0\)? \(W = 1\)? \(W = 9999\)? May return a suboptimal solution, but bounded: no worse than \(W \times C^*\).

**IDA\* (Iterative-Deepening A\*):** "Let's try applying what worked for DFS: Iterative-Deepening. Instead of a depth limit, let's impose a limit on f(n) values. We will explore only nodes less than a certain cost. If solution not found, increase the limit and try again." The slide poses route-finding as a test case for how this would behave.

**"More in the book!" — named but not derived on slides:**
- **Recursive Best-First Search (RBFS):** "Like recursive DFS, but remembers the best f-cost alternative path available. If current node exceeds that, rewind and take the alternative path."
- **Simplified Memory-Bounded A\* (SMA\*):** "Hard limit on size of frontier. When limit is reached, nodes at the end (with worst f-cost) are removed, and their f-costs are backed up to their parents. 'Forgotten' subtrees can be regenerated if everything else gets explored."
- **Bidirectional Heuristic Search:** "Begin a search from initial state and goal state, work towards each other."

These three are named on slides but not derived in the depth Chapter 3 §3.5.5–3.5.6 gives them — the textbook remains the primary source for their full mechanism.

### 11. Heuristic Functions for the 8-Puzzle (Lecture 07, 9/30)
Framing question: "How can we come up with good heuristic functions? Consider the 8-puzzle. What is a good heuristic? Devise an estimate that is: Admissible (i.e. never overestimates); Faster to calculate than just searching."

Two ideas given, matching the textbook's h₁/h₂ exactly but in the lecture's own wording:
- **Number of wrong tiles** (h₁): "Given a state, count how many tiles are in the wrong location (where the goal state defined the 'right' location)."
- **Distance of wrong tiles to correct locations**, "aka 'Manhattan Distance'" (h₂): "For each tile in the wrong location, determine its orthogonal distance (sum of horizontal and vertical distances) to right location."

The slide poses three open questions for the class to work through, not answered on the slide itself: "Are these admissible? How much time does it take to calculate? Is one better than the other?"

### 12. Heuristic Functions in General: Relaxed Problems, Subproblems, Landmarks (Lecture 07, 9/30)
**Relaxed problems:** "Heuristic functions can often be built as solutions to 'relaxed problems.'" 8-puzzle rule given verbatim: "A tile can move from location X to location Y if X is adjacent to Y and Y is blank." The slide then walks the class through removing each restriction in turn ("Ignore these restrictions, what is our puzzle?") — the same derivation Chapter 3 §3.6.2 gives for h₁ and h₂, confirmed independently from the lecture's own slides, not just the textbook.

**Subproblems:** "Heuristic functions can be built as solutions to subproblems." Illustrated with an 8-puzzle configuration showing a partial initial/goal state (a subset of tiles placed, rest blank) — the same pattern-database idea as Chapter 3 §3.6.3, introduced here only at the concept level (no lookup-table construction mechanism shown); the textbook remains the primary source for the actual pattern-database construction and the disjoint-database admissibility argument.

**Landmarks:**
> [!WARNING]
> The lecture's landmark formula is different from — and generally **not admissible**, unlike — the textbook's. Precompute the optimal path cost \(C^*\) from each node to a small set of Landmarks. The lecture's heuristic: \(h(n) = \min_{L \in \text{Landmarks}} C^*(n, L) + C^*(L, \text{goal})\) — routing *through* the nearest landmark. The slide itself asks "Is it admissible?" as an open question; the honest answer is generally no, because forcing a path through a landmark can only add cost relative to the true shortest path (the reverse of the triangle inequality direction that admissibility needs). This contrasts with Chapter 3 §3.6.4's differential heuristic, \(h_{DH}(n) = \max_{L} |C^*(n,L) - C^*(\text{goal},L)|\), which **is** admissible by the triangle inequality used in the correct direction. Both are real, legitimate landmark-heuristic designs in the literature — they just answer "is it admissible?" differently. Know which formula a question is asking about.

### 13. Effective Branching Factor and Search Unit Summary (Lecture 07, 9/30)
Since exact time/space complexity for A\* "can only [be] determine[d] experimentally," the lecture introduces **effective branching factor** \(b^*\) as the practical measure: "If A\* finds a solution at depth d after expanding N nodes, then the effective branching factor b\* is the base that when raised to the power d will give N." Final complexity statement: \(O((b^*)^d)\), where \(b^*\) depends on heuristic quality.

The lecture then points directly at the textbook for the worked comparison: "From the textbook, pg. 98. Comparison of effective branching factors using Breadth-First Search, A\* with h1 (number of wrong tiles) and h2 (manhattan distance)" — this is the exact table already captured in Chapter 3 §3.6.1 (BFS b\*≈1.77, A\*(h₁) b\*≈1.47, A\*(h₂) b\*≈1.31 at depth 14), confirming the page citation independently from the lecture slide itself.

**Search unit closing summary** (verbatim, the lecture's own wrap-up of Weeks 2–4):
- "Problem definition is key!"
- "Uninformed search: If path-costs equal, IDDFS. If not, Uniform Cost."
- "Informed search: A\*, okay actually some variation on A\* that deals with memory more carefully"
- "Heuristic functions are crucial to having a good informed search."
## Short Quiz - 3
Uninformed and informed search review. Q1 sourced from `CSCI4511W Lecture 04` (Sep 21, "Search Algorithms" - Best-First Search framework, node/frontier/reached, expand()) and `CSCI4511W Lecture 05` (Sep 23, "Search Algorithms - DFS Variations" - the completed BFS/DFS/DLS/IDDFS analysis table). Q2-Q4 sourced from `CSCI4511W Lecture 06` (Sep 28, "Informed Search" - Greedy Best-First f(n)=h(n), A* f(n)=g(n)+h(n)) and AIMA §3.5; Q4's diagram and h-table came from the quiz's own attached image.

**Q1** - Uninformed search review. State space: the initial state has 4 unique successors, and each of those has 3 unique successors - a depth-2 tree, 1 + 4 + 12 = 17 total states, no further branching ("that is the entire state space").

**Q1.1** - Maximum frontier length during Breadth-First Search, assuming the solution state is the last one explored: **12**. BFS pops the root and adds its 4 children (frontier = 4), then pops and expands each of those 4 children in turn, adding 3 grandchildren per expansion - frontier grows 4 → 6 → 8 → 10 → 12 as all four depth-1 nodes are expanded. Once all four are expanded, the frontier holds all 12 depth-2 leaves at once (the maximum, since leaves have no successors per this state space); it only shrinks from there as leaves are popped one at a time until the last one - the solution - is explored.

**Q1.2** - Maximum frontier length during Depth-First Search, same assumption: **6**. DFS pops the root and pushes its 4 children (frontier = 4), then immediately dives into one child, pushing its 3 leaf-children (frontier = 3 waiting siblings + 3 new leaves = 6, the maximum) before exhausting that subtree's 3 leaves (frontier back down to 3) and moving to the next sibling. The same expand-one-subtree-while-three-wait pattern repeats for each of the 4 subtrees but never exceeds 6; the true last-explored node is the final leaf of the fourth and last subtree.

**Q2** - Greedy Search with an exactly correct h(n): **Choice 2 of 3 - "It will find a solution path quickly, but it might not be an optimal solution"** is the generic greedy-search caveat, not this case. The correct choice is **Choice 1 of 3 - "Only nodes on the optimal solution path will be explored."** A perfect heuristic obeys the shortest-path (Bellman) equation exactly, so at every expansion the true-optimal child always has the strictly smallest h(n) among the frontier - greedy pops it before any suboptimal sibling is ever expanded, walking straight down the solution path. This is the AIMA §3.5.1 result for h = h*.

**Q3** - A* Search with h(n) = 0 for every node: **Choice 5 of 5 - Uniform Cost Search.** f(n) = g(n) + h(n) collapses to f(n) = g(n) when h(n) = 0, which is exactly Lecture 05's own definition of Uniform-Cost Search's ordering function (`f(n) = n.path_cost`).

**Q4** - Tiny sample state space, initial state A, goal state D. Real diagram (image, pasted 2026-09-28): undirected diamond graph, edges A-B (cost 1), A-C (cost 3), B-D (cost 3), C-D (cost 4); h-table h(A)=5, h(B)=3, h(C)=2, h(D)=0.

**Q4.1** - Exploration order under Greedy search (f(n)=h(n)): **A, C, D**. Expand A → children B (h=3) and C (h=2) enter the frontier; greedy pops the lower h, C (h=2, not goal) → expand C → children A (already reached, no shorter path) and D (h=0) enter the frontier, which now holds B (h=3) and D (h=0) → greedy pops the lower h, D (h=0) → goal, stop. B is generated but never popped/explored.

**Q4.2** - Exploration order under A* search (f(n)=g(n)+h(n)): **A, B, D**. Expand A → B: g=1, h=3, f=4; C: g=3, h=2, f=5 → frontier holds B(f=4), C(f=5) → A* pops the lower f, B (f=4, not goal) → expand B → D: g=1+3=4, h=0, f=4 → frontier now holds C(f=5), D(f=4) → A* pops the lower f, D (f=4) → goal, stop. C is generated but never popped/explored. Cross-check: the path found, A-B-D, costs 1+3=4, cheaper than A-C-D's 3+4=7, confirming A* found the actual optimal path.

> [!NOTE]
> h(A)=5 technically overestimates the true cheapest A-to-D cost (4, via B), which makes this heuristic not strictly admissible at A. It doesn't affect this trace's correctness because A is the sole initial frontier node and is expanded regardless of its f-value, and h is accurate-or-under everywhere else (h(B)=3 = true remaining cost, h(C)=2 ≤ true remaining cost 4, h(D)=0) - but it's worth knowing this h-table isn't a clean admissible heuristic if the same numbers show up in a different question.
## Textbook integration
> [!IMPORTANT]
> Main chapter: [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 3|Chapter 3]] §3.5.1–3.6.6 (pp. 84–105). Lecture 06 (9/28) covered §3.5.1 (Greedy Best-First) and §3.5.2 (A\*) with the 15-node tree trace and the completeness/optimality discussion questions. Lecture 07 (9/30) answered those questions and covered §3.5.2's optimality proof, §3.5.4–3.5.6's variations (named, not all fully derived), and §3.6.1–3.6.4's heuristic-construction methods — see Lecture §§8–13 above.

**What §3.5.1–3.5.2 adds beyond Lecture 06:**

- **Greedy suboptimality concrete proof** (§3.5.1, p. 84–85): the textbook uses the Romania route-finding map to show greedy finds a 450-km path (Arad→Sibiu→Fagaras→Bucharest) while the optimal is 418 km (Arad→Sibiu→Rimnicu Vilcea→Pitesti→Bucharest). Lecture stated greedy is not cost-optimal but did not give a worked counterexample.
- **A\* completeness condition named explicitly** (§3.5.2, p. 86): the textbook states completeness requires finite b and c ≥ ε > 0. Lecture posed this as a discussion question without resolving it.
- **Optimality proof by contradiction** (§3.5.2, p. 86–87): textbook gives the full proof sketch. Lecture posed cost-optimality as a discussion question. Proof: assume A\* pops suboptimal G2 with cost C > C\*; any node n on the optimal path has f(n) ≤ C\* < C, so A\* must pop n before G2 — contradiction.
- **Consistency ↔ non-decreasing f** (§3.5.2, p. 87): the textbook explicitly connects the triangle inequality on h to the algebraic result f(n') ≥ f(n) along any path. Lecture did not state this connection; it is the key reason graph A\* with a consistent h never re-opens states.
- **Search contours** (§3.5.3, p. 87–88): A\* expands nodes in bands of equal f-cost. UCS forms circular bands (f = g, so bands = constant path cost). A good heuristic stretches bands toward the goal. Every node with f(n) < C\* is "surely expanded"; A\* with consistent h is optimally efficient — no algorithm using the same h information can expand fewer nodes and guarantee optimality.

**What §3.5.4–3.5.6 adds beyond Lecture 07's naming of these variations:**

- **Weighted A\*** (§3.5.4, p. 89–90): the lecture gave the formula and asked about the W=0/1/9999 extremes as an exercise; the textbook supplies the actual bounded-suboptimality guarantee C ≤ W·C\* that answers it.
- **Memory-bounded search** (§3.5.5, p. 91–93): the lecture named IDA\*, RBFS, and SMA\* in one sentence each ("more in the book!"). The textbook supplies the real mechanisms: IDA\* uses f-cost limits instead of depth limits (space O(bd)); RBFS uses recursion in O(bd) space but suffers regeneration thrashing; SMA\* uses all available memory M and is complete when goal depth ≤ M.
- **Bidirectional heuristic search** (§3.5.6, p. 93–95): named by the lecture only as "begin a search from initial state and goal state, work towards each other." The textbook supplies the actual lb(m,n) = max(g_F(m)+g_B(n), f_F(m), f_B(n)) lower bound and the f₂(n) = max(2g(n), g(n)+h(n)) evaluation function that make it work; the two frontiers meet near C\*/2.

**What §3.6 adds beyond Lecture 07's coverage:**

- **Effective branching factor b\*** (§3.6.1, p. 98): empirical quality metric for h. Defined as the branching factor a uniform tree of depth d would need to hold N+1 nodes: N+1 = 1 + b\* + (b\*)² + ... + (b\*)^d. Manhattan distance gets b\* ≈ 1.31 vs. BFS's b\* ≈ 1.77 at depth 26. Korf and Reid: a heuristic reducing effective depth by k_h gives O(b^(d-k_h)) — an exponential improvement.
- **Heuristic domination and composite heuristics** (§3.6.1, p. 99–101): h₂ dominates h₁ if h₂(n) ≥ h₁(n) everywhere and both are admissible. A\* with h₂ never expands more nodes than with h₁. Composite h = max(h₁, h₂, ..., h_m) dominates all components while remaining admissible — each function contributes its tightest bound at each state.
- **Relaxed problems** (§3.6.2, p. 100): the lecture's own slides walk the same removal-of-restrictions derivation ("ignore these restrictions, what is our puzzle?") using the identical 8-puzzle rule, confirming the textbook's account independently. The textbook adds the worked numbers: at Figure 3.25's instance, h₁ = 8 (all tiles displaced), h₂ = 18 (sum of Manhattan distances), true solution depth = 26 — both underestimate, and h₂ dominates h₁ here.
- **Pattern databases** (§3.6.3, p. 101–102): the lecture introduced the "subproblems" idea at the concept level only (a partial-tile 8-puzzle example, no construction mechanism). The textbook supplies the real mechanism: exact optimal costs for every configuration of a subproblem, built once by backward search from the goal, looked up at search time. Disjoint databases partition tiles into non-overlapping sets and SUM costs — valid because each physical move is counted by exactly one database. For the 24-puzzle, disjoint databases give ~1,000,000× speedup over Manhattan distance.
- **Landmark differential heuristic** (§3.6.4, p. 102–104): h_DH(n) = max over landmarks |C\*(n,L) - C\*(goal,L)|, admissible by the triangle inequality. **This is a different formula from the one Lecture 07 gave** (see Lecture §12's warning) — the lecture's min-sum "route through a landmark" version is generally not admissible, while the textbook's max-difference version is. Shortcuts (precomputed multi-hop paths as single edges) enable large-graph traversal.
- **Learned heuristics** (§3.6.5–3.6.6, p. 104–105): metalevel learning identifies which subtree expansions were wasted and builds avoidance rules. Inductive learning trains ĥ(n) = Σ w_i f_i(n) from solved (n, g\*(n)) pairs; may not be admissible but serves as a satisficing guide.

### Textbook additions easy to miss
- **Optimally efficient means no algorithm can do better**: §3.5.3 states A\* with a consistent heuristic expands every node with f < C\* and no node with f > C\*. This is the strongest possible performance claim — not just "good" but "optimal given the heuristic." Any improvement would require a better heuristic, not a better algorithm.
- **h₂ dominates h₁ strictly at most depths**: for the 8-puzzle at depth 14, A\*(h₂) generates 174 nodes vs. A\*(h₁)'s 678. At depth 26: 10,080 vs. 110,372. Domination is not a minor advantage — it is exponential in the effective depth difference.
- **Weighted A\* and Greedy are endpoints of the same spectrum**: W=1 → A\*; W=∞ → Greedy. Any W > 1 gives a tradeoff point: faster than A\*, bounded worse than C\*. Most production search uses W ≈ 1.5–3 rather than strict A\* or pure Greedy.
## Takeaways (questions to resolve)
- [ ] Lecture 07's completeness statement ("path costs > 0") omits the textbook's finite-branching-factor condition (finite b **and** c ≥ ε > 0). Confirm with a TA or on Long Quiz 1 review whether the simpler lecture phrasing is accepted as a full answer, or whether the finite-b condition is still expected.
- [ ] Confirm whether the course distinguishes tree-search (admissible h) from graph-search (consistent h) A\* cost-optimality conditions on exams, or treats "admissible" as the single stated condition for both — Lecture 07's proof uses admissibility only and does not mention consistency or graph search explicitly.
- [ ] Consistency vs. admissibility: verify whether the course distinguishes tree-search from graph-search A\* on exams, or uses "admissible" as the single stated condition for both. The textbook (§3.5.2 p. 87) distinguishes them explicitly.
- [ ] The lecture's 15-node tree A\* trace stopped after exploring G. Reconstruct the full completion (G → N, O; then D → H, I; then pop L as goal) and verify the final expansion count (7 total: A, B, C, F, G, D, L) matches the Chapter 3 Worked Example III.
- [ ] Discussion section 10/2: no specific reading named in the schedule. Determine whether Discussion 4 covered Writing #1 details, a search problem exercise, or open Q&A on Short Quiz 3. Nothing concrete to capture yet.
## Lecture-to-textbook synthesis
==A\* is the first algorithm in this course that is both complete and provably cost-optimal through design rather than by accident: f(n) = g(n) + h(n) combines sunk cost with an admissible estimate, and the optimality proof shows that any suboptimal goal must be preceded on the priority queue by a better alternative — as long as h never overestimates.==
*Mechanism:* Lecture 06 derived both algorithms from `BestFirstSearch(problem, f)` in one step: Greedy sets f = h, A\* sets f = g + h. The 15-node tree trace made the difference concrete — Greedy chased O (h=1) to a dead end while A\*'s g(O) = 15 made f(O) = 16, safely ranked below L's f = 11. The lecture then posed the completeness and optimality conditions as open discussion questions, setting up the textbook as the place they get answered. The textbook's optimality proof (§3.5.2, p. 86–87) closes the loop: admissibility makes f(n) ≤ C\* for every node on the optimal path, so A\* is structurally prevented from popping any suboptimal goal first. The consistency/graph-search extension (non-decreasing f along any path) shows why the same guarantee holds without ever re-opening states.
- Lecture example/scenario: 15-node tree, Lecture 06 (9/28). Greedy expansion order: A, C, G, O (dead end, h=1), F, L. A\* expansion order: A, B, C, F, G, D, L. Both return A→C→F→L (cost 11). Greedy gets the right answer because h is close to h\* throughout the solution path — but the lecture's word "probably" in the Greedy discussion slide captures exactly why that is not a proof.
- Textbook connection: [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 3|Chapter 3]] §3.5.1 gives the Romania greedy counterexample (450 km vs. 418 km optimal); §3.5.2 gives the admissibility/consistency proofs and the search contours picture; §3.6.1–3.6.6 shows that admissible heuristics can be constructed systematically from the action schema without solving the original problem.
- Concept links: [[20_Progress/Degree/CSCI 4511W/Concepts/Concept - Informed Search|Concept - Informed Search]], [[20_Progress/Degree/CSCI 4511W/Concepts/Concept - Uninformed Search|Concept - Uninformed Search]]
> [!WARNING]
> Admissibility and consistency are different conditions for different search variants. Admissible h (h ≤ h\*) is sufficient for tree-search A\* to be cost-optimal. Consistent h (triangle inequality: h(n) ≤ c(n,a,n') + h(n')) is required for graph-search A\* to avoid re-opening states. Every consistent h is admissible; the converse does not hold. Exam answers that say "admissible" without distinguishing tree vs. graph search are technically incomplete — know which one the question is testing.
> [!SUMMARY]
> Week 4 is the payoff for the whole `BestFirstSearch(problem, f)` framework from Weeks 2–3: changing f from 0 (BFS) to g(n) (UCS) to h(n) (Greedy) to g(n)+h(n) (A\*) is the same act each time, and A\* is where that one design decision produces a provably optimal, practically efficient algorithm. Wednesday's §3.6 material then answers where h comes from: relax a constraint, look up a subproblem, or — carefully, since not every construction method is automatically admissible — route through a landmark.
## Flashcards
#cards/csci4511w
How does **f(n) = h(n)** (Greedy) differ from **f(n) = g(n) + h(n)** (A\*) in practice, using the Lecture 06 tree?::Greedy popped dead-end leaf O (h=1) because h alone was lowest; O has no successors, so the expansion was wasted. A\* never popped O: g(O) = 15, so f(O) = 16 — far below L's f = 11. A\*'s g(n) penalizes expensive paths even when h looks good. Both found A→C→F→L (cost 11), but only A\* is provably optimal. #cards/csci4511w
State the **A\* cost-optimality condition** for tree search vs. graph search, and why they differ.::Tree search: h must be admissible — h(n) ≤ h\*(n) for all n. Graph search: h must be consistent — h(n) ≤ c(n,a,n') + h(n'). Consistency (triangle inequality on h) makes f non-decreasing along paths, so each state is expanded optimally on first visit and the reached table is never updated. Admissibility alone permits f to decrease, requiring state re-opening in graph search. #cards/csci4511w
What does **A\* with h(n) = 0** reduce to, and why?::f(n) = g(n) + 0 = g(n) — exactly UCS's ordering function (minimum path cost). A\* with h=0 IS UCS. h=0 is trivially admissible (0 ≤ h\*(n)). Any admissible h > 0 strictly dominates h=0 because it prunes more of the state space while preserving the same optimality guarantee. #cards/csci4511w
Why does **Greedy with h = h\*** explore only nodes on the optimal solution path?::Greedy orders by h alone. When h = h\* exactly, h(n) gives the true remaining cost, so the minimum-h frontier node is always the next node on the cheapest path to the goal. Greedy pops it before any sibling with higher true remaining cost. No non-solution node ever has a lower h than the solution-path successor. #cards/csci4511w
Give the **A\* optimality proof sketch** for admissible h.::Suppose A\* pops suboptimal goal G2 with cost C > C\*. Any node n on the optimal path has f(n) = g(n)+h(n) ≤ g(n)+h\*(n) = C\* < C. So A\* must pop n before G2 — n has lower f. But n is on the path to optimal G1, so A\* finds G1 first. Popping G2 before G1 is impossible. #cards/csci4511w
What is **heuristic domination** and why does the **composite heuristic** h = max(h₁, h₂) stay admissible?::h₂ dominates h₁ if h₂(n) ≥ h₁(n) everywhere (and both are admissible). A\* with h₂ never expands more nodes than with h₁. The composite h = max(h₁,...,h_m) dominates all components: at each node it picks the tightest lower bound available. It stays admissible because each h_i ≤ h\*, so max(h_i) ≤ h\* still holds. #cards/csci4511w
How does the **relaxed problem method** generate admissible heuristics, and what preconditions does removing produce for the 8-puzzle?::Removing preconditions adds edges to the state space (the relaxed supergraph contains all original paths), so the optimal relaxed solution ≤ true optimal → admissible. 8-puzzle original: tile at X, X adjacent to Y, Y blank. Remove "Y blank" → Manhattan distance (tile moves to any adjacent square). Remove both "adjacent" and "Y blank" → misplaced tiles (tile teleports to goal in one move). #cards/csci4511w
Why does **Greedy say "probably"** and not "guaranteed"?::Greedy is not cost-optimal by design: it ignores g(n) entirely. On the Romania map it finds a 450-km path when the optimal is 418 km (§3.5.1). The lecture's own slide says "if we have a good estimation function, this will probably work well" — the word "probably" means the algorithm's quality depends entirely on h, with no structural backstop. A\*'s g(n)+h(n) provides that backstop. #cards/csci4511w
What is the **effective branching factor b\*** and what does a lower value mean?::The base that, raised to the solution depth d, gives the number of nodes N generated (N+1 = 1 + b\* + ... + (b\*)^d). A lower b\* means the heuristic prunes more of the search space — e.g. at depth 14 on the 8-puzzle, BFS has b\*≈1.77, A\*(h₁) has b\*≈1.47, A\*(h₂, Manhattan) has b\*≈1.31 (textbook p. 98, confirmed independently by Lecture 07). #cards/csci4511w
Why is the **lecture's landmark heuristic** h(n) = min_L [C\*(n,L) + C\*(L,goal)] generally **not admissible**, unlike the textbook's differential heuristic?::It estimates cost by routing *through* a landmark, and forcing a path through an intermediate point can only add distance relative to the true shortest path — the opposite of what admissibility (never overestimate) requires. The textbook's h_DH(n) = max_L |C\*(n,L) − C\*(goal,L)| instead uses a triangle-inequality *difference*, which is provably admissible. #cards/csci4511w
