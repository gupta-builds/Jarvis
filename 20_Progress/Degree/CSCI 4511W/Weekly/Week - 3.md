---
type: class
input_kind: lecture
status: seed
created: 2026-09-21
updated: 2026-10-02
area:
  - "[[CSCI 4511W Board]]"
  - "[[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 3|Chapter - 3]]"
tags:
  - "#class"
  - "#Lecture"
next: "[[20_Progress/Degree/CSCI 4511W/Weekly/Week - 4|Week - 4]]"
---
# Week - 3
## What you must be able to do
- [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 3|Chapter 3]] §3.3–3.4.4 — Read `BestFirstSearch(problem, f)` and derive BFS and DFS from it by changing only `f`; explain what "FIFO behavior" and "LIFO behavior" mean in terms of the `f` value each algorithm assigns.
- Read the `expand(problem, node)` generator function shown in Lecture 05 and trace what it yields for one step: given a node, state what `Actions(s)`, `Result(s, action)`, and `Action_Cost(s, action, s')` each produce and how they combine into the child node's four fields.
- Apply the four performance metrics (completeness, cost-optimality, time complexity, space complexity) to BFS, UCS, DFS, DLS, and IDDFS; state which metric is binding for each algorithm and under what conditions.
- Explain why BFS can use an early goal test while UCS must use a late goal test for correctness; state what breaks (and which specific path is returned incorrectly) when UCS tests on generation instead of pop.
- Trace DFS on a cyclic graph and identify the exact point where tree-like DFS loops; explain what adding the `reached` table (graph DFS) fixes and what it costs in space.
- Distinguish DLS's three return values — solution, `failure`, and `cutoff` — and state which one IDDFS is checking when it decides to continue to the next depth limit.
- Reproduce the IDDFS node-count argument: why does re-generating shallow nodes cost only ~11% overhead for $b=10, d=5$, and why is the asymptotic complexity $O(b^d)$ despite repeated regeneration?
- State the lecture's four-algorithm comparison table (BFS / DFS / DLS / IDDFS) with the exact footnote conditions from the slides (*= finite state space; **= constant positive costs; ***= no cycles and finite).
## Key ideas (short)
- **`BestFirstSearch(problem, f)` is the only algorithm** — BFS sets `f = 0` (FIFO), DFS sets `f = -path_cost` (LIFO); all uninformed algorithms are one framework parameterized, not five separate designs.
- **BFS and DFS are the two extremes**: BFS is complete and unit-cost-optimal but $O(b^d)$ space (10 TB at $b=10, d=10$); DFS is linear space $O(bm)$ but incomplete on infinite or cyclic graphs.
- **IDDFS synthesizes both**: DFS's $O(bd)$ space with BFS's completeness and unit-cost optimality, at ~11% re-generation overhead — the uninformed "winner" for large, unknown-depth, memory-constrained search.
- **UCS must test goal on pop, not generation**: testing on generation could accept a suboptimal goal before the cheaper path is found; the late goal test is a correctness requirement. BFS can use an early test because it is only optimal under uniform costs — the shallowest generated goal is always the cheapest.
- **DLS produces three distinct outcomes** — solution / `failure` / `cutoff` — and IDDFS depends on distinguishing `cutoff` from `failure`; confusing them terminates the search prematurely.
## Concepts created today
- [[20_Progress/Degree/CSCI 4511W/Concepts/Concept - Uninformed Search|Concept - Uninformed Search]] — mechanisms, completeness/optimality/space contrasts, and failure modes for BFS, UCS, DFS, DLS, IDDFS: created this session once Lectures 04–05 and §3.3–3.4.4 landed. The algorithm family has real contrasts (BFS vs. IDDFS space; early vs. late goal test; DLS cutoff/failure distinction) and real failure modes, clearing the Concept Standard's bar.
## Examples worth keeping
- **BFS and DFS as `f` specializations** (Lecture 04): the lecture derived both from `BestFirstSearch` by changing only `f` — BFS via `f(n) = 0` (FIFO, plus an early goal test added in the derivation), DFS via `f(n) = -n.path_cost` (LIFO). The algorithm body does not change; the expansion order and goal-check timing are entirely determined by `f` and the optional early test.
- **UCS Sibiu-to-Bucharest** (Textbook Figure 3.10, p. 82): Bucharest generated with cost 310 via Fagaras at iteration 3; UCS holds it because of the late goal test. At iteration 4 Pitesti expands and discovers Bucharest via the 278-cost path; reached entry updates. Bucharest pops at iteration 5 with cost 278 confirmed optimal. Early goal test would have returned 310.
- **IDDFS overhead argument** (Lecture 05, §3.4.4 p. 86): for $b=10, d=5$, BFS generates 111,110 nodes; IDDFS generates 123,450 — 11% more, but kilobytes of memory vs. gigabytes. The deepest level $b^d = 100{,}000$ nodes dominates both totals; re-generating shallower levels costs less than a rounding error at large $d$.
## Lecture
### 1. Setup — Node Class and BestFirstSearch Definitions (Lecture 04, 9/21)
Announcements: code review assignment posted (50% expected to sign up by Oct 3, check Canvas → People → Code Review 01); Discord weird-account issue noted; Short Quiz today.

Lecture opened with an explicit `Node` class before any algorithm code:

```python
class Node:
    def __init__(self, state):
        self.state = state
        self.action = None
        self.parent = None
        self.path_cost = 0
```

**Slide: "Best-First Search: Definitions"** — four terms defined precisely:
- **"Explore"** — Check that a node's state is a goal state
- **frontier** — Ordered collection of nodes that we know of but haven't explored yet
- **reached** — Collection that tracks states that are on the frontier, or we have explored them, and how we got there; specifically, a dictionary with (state, node) pairs
- **expand(node)** — Function that generates a collection of nodes that we can get to by taking actions from the given node

### 2. BestFirstSearch Framework (Lecture 04, 9/21)
Labeled "Book figure 3.7, python-ish." Shown as two slides (setup, then continued):

```python
def BestFirstSearch(problem, f):          # Controls how the algorithm works:
    node = Node(state=problem.initial)    # What nodes we still need to explore
    frontier = PriorityQueue(order=f)     # and in what order
    frontier.add(node)
    reached = {}                          # Tracks which nodes we have put
    reached[problem.initial] = node       # on the frontier or explored
    while not frontier.is_empty():        # As long as there are still nodes
        node = frontier.pop()             # in the frontier, remove the first
        if problem.is_goal(node.state): return node
        for child in expand(problem, node):   # expand uses Actions(s) and Result(s,a)
            s = child.state                   # to build successor nodes
            if s not in reached or child.path_cost < reached[s].path_cost:
                reached[s] = child            # State s: shorter path now known
                frontier.add(child)
    return failure
```

### 3. Performance Metrics (Lecture 04, 9/21)
Defined explicitly before deriving any specific algorithm:
- **Completeness** — Is the algorithm guaranteed to find a solution if there is one, or report failure if not?
- **Cost Optimality** — Does the algorithm find an optimal solution?
- **Time Complexity** — Big-O analysis of time complexity
- **Space Complexity** — Big-O analysis of memory usage

### 4. BFS Derivation (Lecture 04, 9/21)
Step-by-step transformation shown across multiple slides:
1. Rename to `BreadthFirstSearch`
2. Set `f(n) = 0` → slide comment: `# f(n) = 0; so PQ acts like Queue`
3. Add **early goal test** inside the child loop — added as a new line in the final BFS slide:

```python
for child in expand(problem, node):
    s = child.state
    if problem.is_goal(s.state): return node  # early goal test (see note)
    if s not in reached or child.path_cost < reached[s].path_cost:
        reached[s] = child
        frontier.add(child)
```

> **Code note**: The slide writes `problem.is_goal(s.state)` where `s = child.state`. If `state` is a plain value (tuple, integer), `s.state` does not exist — the intended expression is `problem.is_goal(s)`. The return value is also `node` (the parent) rather than `child`; semantically it should return `child`. Both look like typos in the slide. Treat the concept (check goal at *generation*, before adding to frontier) as correct; the code as illustrative only.

### 5. DFS Derivation and Conclusions (Lecture 04, 9/21)
Same step-by-step pattern:
1. Rename to `DepthFirstSearch`
2. Set `f(n) = -n.path_cost` → slide comment: `# f(n) = -n.path_cost, acts like a Stack`
3. No other changes — the deepest node always has the most negative `f`, always pops first

**"Conclusions?"** slide: "Given our analysis, which one is better? BFS? DFS? Depends?"

Lecture 04 closed by introducing DLS and IDDFS by name only:
- "What if we have a version of depth-first where depth is limited to l levels?" → **"Depth-limited search"** — analysis?
- "What if we have depth-limited search, but if we fail to find a solution, increase depth limit l by 1 and start over?" → **"Iterative-deepening depth-first search"** — analysis?

An empty four-column analysis table (BFS / DFS / DLS / IDDFS) was left for students to fill in — carried into Lecture 05.

### 6. BFS vs DFS Table — "We Have a Winner!" (Lecture 05, 9/23)
Announcements: code review sign-up (more slots added); Writing #1 posted (details in Discussion); short quiz review; Problem Set 1 review.

Lecture 05 opened by progressively filling in the BFS/DFS table from Lecture 04. The slide added one row at a time:

| | BFS | DFS |
|---|---|---|
| Complete? | yes\* | "eh...\*\*\*" |
| Cost-Optimal? | yes\*\* | no |
| Time | $O(b^d)$ | $O(b^m)$ |
| Space | $O(b^d)$ | $O(b \cdot m)$ |

Footnotes verbatim from slides:
- \* Assuming finite state space
- \*\* Action costs are constant and > 0
- \*\*\* Yes, if no cycles and finite state space

Variable legend from slides: `b` = average branching factor, `d` = depth of optimal solution, `m` = maximum length of any path.

The **"We have a winner!"** annotation appeared on the DFS space row — DFS wins on memory ($O(bm)$ linear vs. BFS's $O(b^d)$ exponential).

### 7. DLS and IDDFS Analysis (Lecture 05, 9/23)
DLS and IDDFS concepts (introduced at end of Lecture 04) now analyzed. A worked example was shown in class (diagram — not recoverable from text extraction).

Final four-algorithm table from slides:

| | BFS | DFS | DLS | IDDFS |
|---|---|---|---|---|
| Complete? | yes\* | "eh...\*\*\*" | no | yes\* |
| Cost-Optimal? | yes\*\* | no | no | yes\*\* |
| Time | $O(b^d)$ | $O(b^m)$ | $O(b^l)$ | $O(b^d)$ |
| Space | $O(b^d)$ | $O(b \cdot m)$ | $O(b \cdot l)$ | $O(b \cdot d)$ |

Additional legend: `l` = depth limit.

**Notation clarification**: slides write `O(bd)` for BFS (exponential $b^d$) and `O(db)` for IDDFS (linear $b \times d$). Same letters, different operations — in context: IDDFS stores one current path of depth $d$ with $b$ branches per level; BFS stores the entire frontier of $b^d$ nodes.

### 8. Uniform-Cost Search (Lecture 05, 9/23)
Introduced after the DLS/IDDFS analysis: "What if path costs are not constant?"
- **Definition from slide**: "Uniform cost search: Explore based on distance from initial node"
- **Assumption from slide**: "All action costs are greater than some positive value ε"
- Derived by setting `f(n) = n.path_cost` in `BestFirstSearch`:

```python
def UniformCostSearch(problem, f):
    node = Node(state=problem.initial)
    frontier = PriorityQueue(order=f)  # f(n) = n.path_cost
    ...  # remainder identical to BestFirstSearch
```

A UCS worked example on a graph was shown (numbers on edges = action costs; UCS orders by *accumulated path cost*, not action cost). The distinction: a node one step away with action cost 10 ranks lower priority than a node three steps away with total path cost 9.

### 9. expand() Function (Lecture 05, 9/23)
Shown verbatim (annotated as "technically a generator function — we don't actually return a collection of Node objects, we return a new Node object each time this function is called. See book Appendix B.2 for details"):

```python
def expand(problem, node):
    s = node.state
    for action in problem.Actions(s):                # iterate over all actions from s
        s_prime = problem.Result(s, action)          # what state does this action reach?
        cost = node.path_cost + problem.Action_Cost(s, action, s_prime)  # cumulative cost
        yield Node(state=s_prime, parent=node,       # create and yield child node
                   action=action, path_cost=cost)
```

Slide annotations: "Iterate over all possible actions from state s" / "For a given action, figure out what state s' we get to" / "Calculate total path cost from initial state to s'" / "Create and return Node object with state s', appropriate parent, action, and cost."

### 10. Exercises and Next Up (Lecture 05, 9/23)
Three design exercises posed — construct a state space satisfying the condition:
1. **BFS substantially better than UCS** — in time or space complexity
2. **DFS substantially better than BFS** — in time or space complexity
3. **IDDFS substantially worse than DFS** — when does re-generation overhead dominate?

**"Next Up"** close: "Suppose that we were able to estimate distance to a goal from any node — how would that change our approach?" — teaser for informed/heuristic search (Week 4).
## Short Quiz - 2
Sliding Tile Puzzle (8-puzzle) problem-formulation definitions. Sourced from `CSCI4511W Lecture 03` (Sep 16, 2026, "Problem-Solving Agents"), slides "Search Problem Definitions" / "Search Problem Definitions, continued" (`Actions(s)`, `Result(s,a)`, `Is-Goal(s)`, `Action-Cost(s,a,s')` definitions) and the same lecture's "Example Search Problem: Sliding Tile Puzzle" slide (3x3 grid, Start State / Goal State diagram). AIMA Ch. 3 ("Solving Problems by Searching") is the textbook source the lecture cites (Best-First Search pseudocode is labeled "Book figure 3.7"), but the local textbook PDF could not be opened in this session (exceeds the 20MB read limit and the PDF-page-render tool, poppler, is not installed on this machine) - answers below apply the lecture's own stated definitions to the puzzle's grid geometry, not a directly quoted textbook passage, and that gap is flagged per sub-answer below.

**Q1.1** - Max number of different actions `Actions(s)` could return for an 8-puzzle state: **4**. The lecture defines `Actions(s)` only abstractly ("actions available to the agent"); the number 4 is not stated verbatim in the slides. It follows from applying that definition to the puzzle's own 3x3 grid (shown in the same lecture's Sliding Tile Puzzle slide): moves are legal blank-tile shifts (up/down/left/right), and the max over all states occurs when the blank sits in the center square, which borders all four directions. Corner blank positions allow only 2, edge positions only 3 - the question asks for the maximum, so 4.

**Q1.2** - Max number of different states `Result(s,a)` could return for a specific state `s` and a specific legal action `a`: **1**. Lecture 03 defines `Result(s,a)` as the "description of what actions do" (the transition model) - for one fixed state and one fixed legal action, sliding a specific tile into the blank has exactly one outcome. The 8-puzzle as formulated in lecture is deterministic (not stated as a distinct axiom in the slides, but implied by `Result` being a single-valued function of `(s,a)` rather than a distribution).

**Q1.3** - Can the 8-puzzle have multiple solutions from a single initial state? **Yes.** Lecture 03 defines Solution as "path from initial state to a goal state" (not necessarily the optimal one). Since the blank can be moved back and forth (e.g., left then right returns to a visited state), many distinct action sequences reach the same goal state, so multiple solutions (and, in fact, multiple equal-length optimal ones via symmetric move orderings) exist. Not a number given verbatim in the lecture; this is a direct application of the lecture's own Solution definition to the reversibility of sliding-tile moves.

**Q1.4** - Changing `Action-Cost(s,a,s')` from 1 to 2 for every action: **(b) No effect on optimal solution path length or state space.** Doubling every action's cost is a uniform positive scalar multiple applied to every path, so it preserves the relative cost ordering between all paths - whichever action sequence was cheapest (shortest) before is still cheapest after, so the optimal solution's path length (number of actions) is unchanged, and the state space (the set of reachable states, defined independently of Action-Cost per Lecture 03's Search Problem Definitions) is unchanged. Only the numeric path cost of every solution doubles, which the quiz options don't list as a choice. (a), (c), (d) are not supported by the lecture's definitions of state space and optimal solution ("solution with lowest cost for all actions in its path").

**Q1.5** - Redefining `Is-Goal(s)` to accept any state where every tile is correctly adjacent (cyclically, mod the 1/8 endpoint exception) rather than one exact configuration: **(a) Optimal solution paths would be much shorter, in general.** Lecture 03 defines Is-Goal(s) as the goal test over the state space; broadening it to accept an entire equivalence class of configurations (all rotations/reflections preserving the correct relative tile ordering) means many more states in the same state space now satisfy Is-Goal, so the nearest accepted goal state from a given initial state is reachable in fewer moves on average. The state space itself is unchanged (b, c are not supported - state space is defined by states/actions, not by which states pass the goal test).

## Textbook integration
> [!IMPORTANT]
> Main chapter: [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 3|Chapter 3]] §3.3–3.4.4 (pp. 73–86). Lecture 04 (9/21) covered §3.3 (BestFirstSearch framework) and §3.4.1 (BFS derivation), introduced DLS and IDDFS by name at the close. Lecture 05 (9/23) filled in the BFS/DFS analysis table, completed DLS/IDDFS analysis, and added UCS (§3.4.2) — the schedule assigned §3.4.2 to Monday reading but the UCS slides landed Wednesday.

**What §3.3–3.4.4 adds beyond lecture:**

- **BFS memory cost made concrete** (§3.4.1, p. 80): for $b=10, d=10$, the frontier holds approximately $10^{10}$ nodes; at roughly 1 KB per node that is about 10 TB. The textbook names memory as the binding constraint explicitly — "memory is the real issue, not time." Lecture did not give this figure.
- **BFS early goal test — code vs. concept** (§3.4.1, p. 79): the lecture's BFS slide added an early goal test but contained two typos (`s.state` instead of `s`, and returns `node` instead of `child`). The textbook's `BREADTH-FIRST-SEARCH` pseudocode is the clean, runnable version — check it to confirm the correct form before implementing.
- **UCS time/space complexity and the +1** (§3.4.2, p. 81–83): the lecture showed UCS as `f(n) = n.path_cost` and asserted completeness/optimality with the $\epsilon > 0$ assumption, but did not derive the complexity. Textbook: $O(b^{1 + \lfloor C^*/\epsilon \rfloor})$; for uniform costs this gives $O(b^{d+1})$ — one full extra level compared to BFS's $O(b^d)$, directly caused by the late goal test. The proof of optimality (nodes pop in non-decreasing $g(n)$ order, so the first goal to pop is cheapest) is textbook-only.
- **DFS backtracking as $O(m)$ space** (§3.4.3, p. 84–85): the textbook presents backtracking search as a named variant that generates one child at a time and modifies state in-place, then reverses the modification on backtrack; space drops to $O(m)$ (one value per level). Lecture showed DFS's linear space advantage but did not name this variant.
- **DLS diameter bound** (§3.4.4, p. 85): the textbook defines the state space diameter — the maximum shortest path between any two states — as the tight depth limit for DLS that guarantees completeness without iterating unnecessarily deep. Lecture named the cutoff/failure/solution trichotomy but not the diameter.
- **IDDFS node count derivation** (§3.4.4, p. 86): the textbook gives the exact sum $N(\text{IDDFS}) = (d)b + (d-1)b^2 + \cdots + (1)b^d$ with the $b=10, d=5$ comparison (111,110 BFS vs. 123,450 IDDFS). Lecture named the conclusion ("overhead is negligible") but not the derivation.
- **Textbook Figure 3.15 vs. lecture table** (§3.4.6, p. 87): the textbook's comparison table has six rows (adds UCS and Bidirectional search); the lecture's table had four (BFS/DFS/DLS/IDDFS). The textbook table is also explicitly labeled as tree-like search, which the lecture implied but did not state.

### Textbook additions easy to miss
- **BFS $O(b^d)$ vs. $O(b^{d+1})$**: the lecture's BestFirstSearch derivation uses a late goal test (BFS inherits it), giving $O(b^{d+1})$. The textbook's dedicated BFS uses an early goal test, giving $O(b^d)$. When an exam asks "BFS time complexity," the expected answer is $O(b^d)$ — matching the textbook's BFS, not the lecture's derived version.
- **UCS late goal test is a correctness requirement, not a performance choice**: a goal generated early via an expensive edge has suboptimal path cost; the late test is what guarantees optimality. Lecture showed this in the UCS derivation but did not state it as a proof.
- **Lecture's DFS completeness is nuanced — "eh...***"**: slides used this exact language. Graph DFS (with `reached`) is complete on finite state spaces; tree-like DFS is not. The lecture table is for tree-like search. Figure 3.15 is also for tree-like search.
## Takeaways (questions to resolve)
- [ ] The lecture's BFS slide has two code typos: `problem.is_goal(s.state)` instead of `problem.is_goal(s)`, and returns `node` instead of `child`. Verify the textbook's `BREADTH-FIRST-SEARCH` pseudocode (Figure 3.6, p. 79) is the correct version before implementing or citing on an exam.
- [ ] The lecture's comparison table uses "eh...***" for DFS completeness — tree-like DFS is incomplete, graph DFS is complete on finite state spaces. Confirm which version the long quiz will test and whether answers should distinguish the two.
- [ ] IDDFS's $O(b \cdot d)$ space — this assumes tree-like DLS passes (no `reached` table). If the DLS calls used the `reached` table, each pass would re-use the same `reached` dictionary and the space would grow to $O(b^d)$, destroying the advantage. Verify this is the intended interpretation in the textbook (p. 86).
- [ ] Lecture 05's UCS analysis stopped at "explore based on distance from initial node" with the $\epsilon > 0$ assumption. The $O(b^{1 + \lfloor C^*/\epsilon \rfloor})$ bound and the optimality proof are textbook-only. Resolve: does the course expect students to derive the bound or just apply it?
- [ ] Lecture 05 exercises: (1) a state space where BFS beats UCS; (2) where DFS beats BFS; (3) where IDDFS beats DFS — construct concrete examples for each before Long Quiz 1 (Week 6).
- [ ] Discussion section 9/25: no specific reading named in the schedule. Determine whether Discussion 3 covered Writing #1 details, a search problem exercise, or open Q&A. Nothing concrete to capture yet.
## Lecture-to-textbook synthesis
==All five uninformed search algorithms collapse into a single design question — what is `f(n)`? — and IDDFS answers that question by combining DFS's linear space with BFS's completeness, making it the practical winner whenever the state space does not fit in memory.==
*Mechanism:* Lecture 04 showed the derivation: set `f = 0` (FIFO) to get BFS, set `f = -n.path_cost` (LIFO) to get DFS, and the BFS slide added an early goal test in the child loop. The algorithm body never changes — only `f` and the optional early test do. Lecture 05 completed the analysis: filled in the BFS/DFS performance table (BFS complete and unit-optimal but $O(b^d)$ space; DFS "eh...***" completeness but linear $O(bm)$ space — "We have a winner!"); then extended the table to DLS and IDDFS (IDDFS recovers BFS completeness and unit-cost optimality while keeping DFS's $O(b \cdot d)$ space); then added UCS (`f = n.path_cost`, requires strict $\epsilon > 0$ and late goal test for optimality). The "winner" label on IDDFS directly echoes Russell and Norvig p. 86.
- Lecture example/scenario: IDDFS node-count argument at $b=10, d=5$: BFS generates 111,110 nodes and needs gigabytes; IDDFS generates 123,450 and needs kilobytes — the ~11% overhead buys an orders-of-magnitude reduction in memory. For any real large-state-space problem, IDDFS is the default uninformed choice.
- Textbook connection: [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 3|Chapter 3]] §3.3.1 provides `BEST-FIRST-SEARCH` as the parent framework; §3.4.1–3.4.2 gives BFS and UCS derivations with performance proofs; §3.4.3–3.4.4 gives DFS, DLS, and IDDFS; §3.4.6 (Figure 3.15) is the comparison table with all footnote conditions.
- Concept links: [[20_Progress/Degree/CSCI 4511W/Concepts/Concept - Uninformed Search|Concept - Uninformed Search]]
> [!WARNING]
> BFS and IDDFS have the same $O(b^d)$ asymptotic time complexity. This does not make them equivalent. BFS stores the entire frontier — $O(b^d)$ nodes, roughly 10 TB at $b=10, d=10$. IDDFS stores only the current path — $O(bd)$ nodes, kilobytes. "Same big-O time" is frequently misread as "equivalent algorithms"; for memory-constrained search, they are not even close.
> [!SUMMARY]
> Week 3 is the moment the algorithm zoo becomes one algorithm: `BestFirstSearch(problem, f)` parameterized by `f`, with IDDFS as the answer to the question "which `f` wins for large, unknown-depth, memory-constrained search?"
## Flashcards
#cards/csci4511w
How does the **`f(n)` parameter** in `BestFirstSearch(problem, f)` produce BFS vs. DFS?::BFS sets `f(n) = 0` (constant) — the priority queue degenerates to FIFO, always expanding the shallowest node. DFS sets `f(n) = -path_cost` — the deepest node has the most negative value and always pops first (LIFO). The rest of the code is identical. #cards/csci4511w
Why does **UCS require a late goal test** while BFS can use an early goal test without breaking optimality?::BFS is optimal only under uniform costs, so the shallowest generated goal is guaranteed cheapest — testing on generation is safe. UCS must confirm optimality at pop time: a goal generated early via an expensive edge may be beaten by a cheaper path still on the frontier. Testing on generation would return the suboptimal path. #cards/csci4511w
What are **DLS's three return values**, and which one causes IDDFS to increase its depth limit?::`solution` = goal found within $l$; `failure` = goal confirmed absent within $l$ (safe to stop); `cutoff` = depth limit hit with unexplored branches remaining (goal may exist deeper). IDDFS increments the limit only on `cutoff` — confusing `cutoff` with `failure` would terminate search early. #cards/csci4511w
Why does **IDDFS have $O(b^d)$ time** despite regenerating nodes on every DLS call?::Total nodes: $(d)b + (d-1)b^2 + \cdots + (1)b^d$. The deepest level contributes $b^d$ nodes on every pass; re-generating shallower levels adds $(1/b + 1/b^2 + \cdots)$ fraction — negligible. For $b=10, d=5$: 123,450 vs. BFS's 111,110, roughly 11% more. #cards/csci4511w
What is the **space complexity** of BFS vs. IDDFS, and why does the difference matter in practice?::BFS: $O(b^d)$ — the entire frontier; for $b=10, d=10$ roughly 10 TB. IDDFS: $O(bd)$ — one DFS path at a time; kilobytes. Same asymptotic time, but BFS is often physically impossible before IDDFS is considered. #cards/csci4511w
Under what conditions is **BFS cost-optimal**, and what algorithm handles the case when those conditions fail?::BFS is cost-optimal only when every action costs the same (unit costs). It finds the shallowest goal, which is cheapest only under uniform costs. When action costs vary, UCS is required — it expands by minimum $g(n)$ and guarantees the first popped goal is cost-optimal. #cards/csci4511w
When does **graph DFS** (with `reached`) become complete while **tree-like DFS** is not?::Tree-like DFS has no cycle detection — it loops on cyclic graphs and never terminates. Graph DFS adds the `reached` table, detecting previously visited states; it is complete on finite state spaces. The cost: the `reached` table eliminates the $O(bm)$ space advantage — space is now $O(|V|)$ or worse. #cards/csci4511w
What is the **diameter** of a state space, and why does it give a tight depth limit for DLS?::The diameter is the maximum shortest path between any two states in the graph. Setting $l$ to the diameter guarantees that if a solution exists, it is at depth $\le$ diameter — completeness without iterating unnecessarily deep. Any $l <$ diameter risks returning `cutoff` for a solvable problem. #cards/csci4511w
