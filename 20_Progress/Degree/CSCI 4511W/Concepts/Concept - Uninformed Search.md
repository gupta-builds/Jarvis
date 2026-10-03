---
type: concept
status: sprout
created: 2026-10-02
updated: 2026-10-02
course: "[[CSCI 4511W Board]]"
track: ai
mastery_level: 0
prerequisites:
  - "[[20_Progress/Degree/CSCI 4511W/Concepts/Concept - PEAS Framework|Concept - PEAS Framework]]"
used_in: []
evidence:
  - "[[20_Progress/Degree/CSCI 4511W/Weekly/Week - 3|Week - 3]]"
  - "[[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 3|Chapter - 3]]"
tags:
  - concept
---
# Concept - Uninformed Search
## One-Line Answer
==Uninformed (blind) search is the family of algorithms that explore a state-space graph using only structure the problem provides — no estimate of remaining cost — and they trade memory for completeness along a spectrum anchored by BFS and DFS, with IDDFS as the synthesis that wins on both.==
## Mechanism
All five algorithms are specializations of `BestFirstSearch(problem, f)`. Setting `f` determines expansion order; nothing else changes:

- **BFS**: `f(n) = 0` (constant) → `PriorityQueue` degenerates to FIFO → shallowest node always first. Complete for finite $b$; cost-optimal for unit costs only; $O(b^d)$ time and space. Early goal test (check on generation) gives the textbook's version; late goal test gives $O(b^{d+1})$.
- **UCS**: `f(n) = g(n)` → minimum path-cost node first. Spreads in concentric cost waves, not depth rings. Complete and cost-optimal for any $c \ge \epsilon > 0$; requires late goal test. Time and space $O(b^{1 + \lfloor C^*/\epsilon \rfloor})$.
- **DFS**: `f(n) = -g(n)` (negative path cost) → deepest node always pops first. Not cost-optimal; incomplete on infinite/cyclic graphs without the `reached` table. Linear space $O(bm)$ — the main practical advantage.
- **DLS**: DFS capped at depth limit $l$. Returns one of three values: **solution** (found within $l$), **`failure`** (goal does not exist within $l$), or **`cutoff`** (limit hit with unexplored branches; goal may exist deeper). Complete only if $l \ge d$; the state space diameter gives a tight, safe $l$.
- **IDDFS**: calls DLS with $l = 0, 1, 2, \ldots$ until result $\ne$ `cutoff`. Recovers BFS completeness and unit-cost optimality; space stays $O(bd)$ because each DLS call is a DFS. Re-generation overhead is $O(b^d)$ asymptotically — the deepest level dominates, so the cost of re-generating shallower levels is a negligible fraction (~11% for $b=10, d=5$).

Performance table (tree-like search; graph search versions differ for DFS):

| Algorithm | Complete? | Cost-optimal? | Time | Space |
|---|---|---|---|---|
| BFS | Yes ($b$ finite) | Unit costs only | $O(b^d)$ | $O(b^d)$ |
| UCS | Yes ($c \ge \epsilon > 0$) | Yes | $O(b^{1+\lfloor C^*/\epsilon \rfloor})$ | $O(b^{1+\lfloor C^*/\epsilon \rfloor})$ |
| DFS | No | No | $O(b^m)$ | $O(bm)$ |
| DLS | No ($l < d$) | No | $O(b^l)$ | $O(bl)$ |
| IDDFS | Yes ($b$ finite) | Unit costs only | $O(b^d)$ | $O(bd)$ |
## Contrast / What It Is Not
- **Uninformed vs. informed search**: uninformed algorithms know only problem structure (state space, transitions, costs); informed algorithms additionally use a heuristic $h(n)$ estimating remaining cost. Setting $h(n) = 0$ in A* recovers UCS — the two families merge at $h=0$.
- **BFS vs. IDDFS**: same $O(b^d)$ time, same completeness, same unit-cost optimality. Not equivalent — BFS stores the entire frontier ($O(b^d)$; ~10 TB at $b=10, d=10$); IDDFS stores only the current path ($O(bd)$; kilobytes). "Same asymptotic time" does not mean interchangeable on real hardware.
- **UCS vs. BFS**: BFS finds the shallowest goal, which is cheapest only under uniform costs. UCS finds the minimum-cost goal under any positive costs. For uniform-cost problems BFS is simpler; for variable costs UCS is required.
- **DFS vs. backtracking search**: same expansion order, different state management. DFS copies state at each node ($O(bm)$ space); backtracking modifies in-place and reverses on backtrack ($O(m)$ space). Backtracking is the memory-optimal DFS variant.
- **DLS `failure` vs. `cutoff`**: `failure` means the goal is confirmed absent within the limit (safe to stop for this problem); `cutoff` means the limit was the constraint, not the absence of a solution. IDDFS acts only on `cutoff` — it would halt prematurely if it confused them.
## Failure Modes / Misconceptions
> [!WARNING]
> **DFS on cyclic graphs without `reached`**: tree-like DFS follows one branch indefinitely on a cycle, never returning. The `reached` table fixes this but destroys the space advantage — graph DFS is $O(|V|)$ in the worst case, not $O(bm)$.

> [!WARNING]
> **BFS memory explosion at depth**: BFS is complete, which misleads students into treating it as the default. For $b=10, d=10$, the frontier holds $10^{10}$ nodes — roughly 10 TB. BFS is often impractical before IDDFS is considered.

> [!WARNING]
> **UCS with an early goal test**: if you check the goal when a node is *generated*, you may return a goal state discovered via an expensive edge before the cheaper path has been found. The late goal test is a correctness requirement, not a micro-optimization.

> [!WARNING]
> **IDDFS as "slow because it re-does work"**: the node-count argument shows otherwise. The deepest level $b^d$ dominates — re-generating the $b^{d-1}$ nodes at depth $d-1$ adds only $1/b$ overhead. For $b=10$, re-generating all shallower levels adds ~11% total. The space savings (kilobytes vs. gigabytes) almost always outweigh this.

> [!WARNING]
> **DLS `cutoff` as a complete search result**: `cutoff` does not confirm the goal's absence — it only confirms the limit was hit. Treating it like `failure` causes IDDFS to terminate early and miss goals deeper than the current limit.
## Evidence From This Vault
- [[20_Progress/Degree/CSCI 4511W/Weekly/Week - 3|Week - 3]] — Lecture 04 (9/21) derived BFS and DFS from `BestFirstSearch(problem, f)` by changing only `f`; Lecture 05 (9/23) completed the comparison table and named IDDFS "the winner" for large, memory-constrained, unknown-depth spaces.
- [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 3|Chapter - 3]] §3.3–3.4.4 — full pseudocode, performance proofs, and the node-count derivation for IDDFS (p. 85–86).
## Flashcards
#cards/csci4511w
How does changing **`f(n)`** in `BestFirstSearch(problem, f)` produce BFS vs. DFS?::BFS sets `f(n) = 0` (constant), making the priority queue behave as FIFO — shallowest node always pops. DFS sets `f(n) = -path_cost`, making the deepest (most recently generated) node always have the smallest (most negative) value and pop first. The rest of the code is identical. #cards/csci4511w
Why is **BFS not cost-optimal** for non-uniform action costs?::BFS finds the shallowest goal, which is cheapest only when every action costs the same. Under variable costs a shallow goal may be more expensive than a deeper one. UCS, which expands by minimum $g(n)$, is required for optimality. #cards/csci4511w
What are **DLS's three return values**, and why does the distinction between `failure` and `cutoff` matter?::`solution` = goal found; `failure` = goal confirmed absent within the limit; `cutoff` = depth limit was the stopping criterion, goal may still exist deeper. IDDFS iterates only on `cutoff` — if it treated `cutoff` as `failure`, it would terminate early and miss deeper solutions. #cards/csci4511w
Why does **IDDFS have $O(b^d)$ time** even though it re-generates nodes on every iteration?::Total nodes: $(d)b + (d-1)b^2 + \cdots + (1)b^d$. The deepest level contributes $b^d$ nodes on every DLS call; shallower levels are a shrinking fraction. The sum is $O(b^d)$, the same as BFS. For $b=10, d=5$: 123,450 vs. BFS's 111,110 — 11% overhead for kilobytes of memory instead of gigabytes. #cards/csci4511w
What is the **space complexity** of BFS vs. IDDFS, and why does it matter?::BFS stores the entire frontier: $O(b^d)$. For $b=10, d=10$ that is roughly $10^{10}$ nodes (~10 TB). IDDFS stores only the current DFS path: $O(bd)$ — kilobytes. Same time complexity, but BFS is often physically impractical before IDDFS is considered. #cards/csci4511w
Why must **UCS use a late goal test** while BFS can use an early goal test?::BFS is optimal only under uniform costs, so the shallowest generated goal is also cheapest — early test is safe. UCS must confirm a node is optimal *when it pops*, because a goal generated early via an expensive edge may be beaten by a cheaper path still on the frontier. Testing on generation would return the suboptimal goal first. #cards/csci4511w
