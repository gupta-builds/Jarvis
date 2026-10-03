---
type: concept
status: sprout
created: 2026-10-02
updated: 2026-10-02
course: "[[CSCI 4511W Board]]"
track: ai
mastery_level: 0
prerequisites:
  - "[[20_Progress/Degree/CSCI 4511W/Concepts/Concept - Uninformed Search|Concept - Uninformed Search]]"
used_in: []
evidence:
  - "[[20_Progress/Degree/CSCI 4511W/Weekly/Week - 4|Week - 4]]"
  - "[[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 3|Chapter - 3]]"
tags:
  - concept
---
# Concept - Informed Search
## One-Line Answer
==Informed (heuristic) search adds a function h(n) estimating remaining cost to goal; A* achieves cost-optimality by setting f(n) = g(n) + h(n) with an admissible heuristic for tree search or a consistent heuristic for graph search, while greedy best-first sets f(n) = h(n) and trades the optimality guarantee for speed.==
## Mechanism
Both algorithms are specializations of `BestFirstSearch(problem, f)`, differing from uninformed search only in how `f` incorporates h(n):

**h(n) — the heuristic function:**
- Estimates the cost of the cheapest path from node n to the nearest goal state.
- By convention h(goal) = 0 and h(n) ≥ 0 always.
- Not computed by the search algorithm — supplied by the problem designer.
- Quality is what separates efficient informed search from expensive informed search.

**Greedy Best-First Search: `f(n) = h(n)`**
Ignores all path cost already spent; always expands whichever frontier node looks closest to the goal by heuristic estimate alone.
- Complete on finite state spaces with graph search (reached table prevents loops). Incomplete in infinite spaces or tree-like search.
- Not cost-optimal: g(n) is absent from f, so low h can lure search into expensive routes or dead-end leaves with no successors.
- Time/space: O(|V|) graph search; O(b^m) tree search.

**A\* Search: `f(n) = g(n) + h(n)`**
Combines actual path cost g(n) with estimated remaining cost h(n). A node with high sunk cost is penalized even if its heuristic value looks attractive.

*Cost-optimality conditions:*
- **Tree search** (no reached table): h must be **admissible** — h(n) ≤ h\*(n) for all n, where h\*(n) is the true optimal remaining cost. Admissible means optimistic: never overestimates.
- **Graph search** (with reached table): h must be **consistent** (monotone) — h(n) ≤ c(n, a, n') + h(n') for every node n and every successor n' via action a. This is the triangle inequality applied to h on the cost graph. Consistency implies admissibility; the converse does not hold.

*Why consistency matters for graph search:* consistency makes f(n) non-decreasing along any path. Proof: f(n') = g(n') + h(n') = g(n) + c(n,a,n') + h(n') ≥ g(n) + h(n) = f(n). Non-decreasing f means every state is expanded at its optimal g-cost on first expansion — no state ever needs to be re-opened. An admissible but inconsistent h can decrease f along a path, meaning a state already in `reached` might later be reached via a cheaper route, requiring re-opening.

*Optimality proof sketch (§3.5.2, p. 86–87):* Suppose A\* pops a suboptimal goal G2 with cost C > C\*. Any node n on the optimal path satisfies f(n) = g(n) + h(n) ≤ g(n) + h\*(n) = C\* (by admissibility), so f(n) ≤ C\* < C. A\* would therefore pop n before G2. But n lies on the path to the optimal goal G1, so A\* would find G1 first. Contradiction — A\* cannot pop a suboptimal goal when h is admissible.

*Complexity:* worst-case O(b^d) time and space — A\* retains all generated nodes in memory. A good heuristic exponentially reduces this: Korf and Reid showed a heuristic that reduces effective depth by a constant $k_h$ yields $O(b^{d - k_h})$ instead of $O(b^d)$. Manhattan distance achieves roughly 10–100× fewer node expansions than BFS for the 8-puzzle at depth 26 (§3.6.1).

*Heuristic construction methods (§3.6; lecture coverage pending Lecture 07):*
- **Relaxed problem**: remove one or more action preconditions, creating a supergraph where the optimal solution cost ≤ the original optimal → admissible heuristic. Manhattan distance (h₂) removes "destination must be blank"; misplaced tiles (h₁) additionally removes "tile must be adjacent." Both are derived automatically from the action schema.
- **Pattern database**: exact optimal costs for all configurations of a subproblem, precomputed by backward search from the goal. Runtime cost is a table lookup. Disjoint pattern databases (non-overlapping tile subsets) can be summed — each physical move is counted by exactly one database, preserving admissibility.
- **Landmark differential heuristic**: select reference vertices L; precompute exact distances from all states to each landmark; apply the triangle inequality: $h_\text{DH}(n) = \max_{L} |C^*(n, L) - C^*(\text{goal}, L)|$. Admissible and effective for large road networks.
## Contrast / What It Is Not
- **Greedy vs. A\***: Greedy sets f = h, A\* sets f = g + h. On Lecture 06's 15-node tree, Greedy expanded the dead-end leaf O (h=1) because it looked close to goal; A\* avoided this because O's full f = g(O) + h(O) = 15 + 1 = 16, far larger than the goal node L's f = 11. Both found the same path A→C→F→L (cost 11) on this example, but only A\* is provably optimal — Greedy got lucky because the heuristic was reasonably accurate throughout the relevant path.
- **Admissible vs. consistent**: admissible means h ≤ h\* everywhere (tree search condition). Consistent additionally satisfies the triangle inequality on the cost graph (graph search condition). Every consistent h is admissible; the converse does not hold. For graph A\*, using only an admissible h requires detecting and re-opening states when cheaper paths are found, adding implementation complexity and cost.
- **A\* vs. UCS**: h(n) = 0 everywhere is always admissible (0 ≤ h\*(n)) and consistent (0 ≤ c(n,a,n') + 0). Setting h = 0 in A\* produces f(n) = g(n) + 0 = g(n) — exactly UCS's ordering function. A\* with h=0 IS UCS. Any h that is strictly positive for non-goal states strictly dominates h=0 in terms of nodes expanded, while preserving the optimality guarantee.
- **A\* vs. IDA\***: A\* stores all generated nodes in memory — O(b^d). IDA\* applies iterative deepening on f-cost limits instead of depth limits, cutting space to O(bd) at the cost of node regeneration. The uninformed IDDFS vs. BFS tradeoff reproduced at the informed level.
## Failure Modes / Misconceptions
> [!WARNING]
> **Inadmissible h breaks A\* cost-optimality silently.** If h(n) > h\*(n) for even one node on the path to an optimal goal, A\* may pop a suboptimal goal before the optimal one and return without detecting the error. The optimality proof breaks at exactly that node. Always verify admissibility (h ≤ h\*) before trusting A\*'s output.

> [!WARNING]
> **An admissible but inconsistent h requires re-opening states in graph search.** Consistency guarantees f is non-decreasing, so the first expansion of any state is at its optimal cost — the reached table is final. An admissible but inconsistent h can decrease f along a path, meaning `reached[s]` may hold a suboptimal node that must be replaced when a cheaper path arrives. In practice most construction methods produce consistent heuristics; the distinction matters when using learned or approximate h.

> [!WARNING]
> **Greedy is incomplete in infinite state spaces even with graph search.** On an infinite tree, the reached table prevents re-visiting but cannot prevent following a heuristic gradient down an unbounded branch that never reaches the goal. Completeness of greedy requires the state space to be finite.

> [!WARNING]
> **"h is admissible at the initial state" is not enough.** Admissibility must hold at every node n in the search space, not just the start. Short Quiz 3's diamond graph has h(A)=5 while h\*(A)=4 — technically violating admissibility at A. It did not affect that particular trace because A is always the first node expanded, but the same violation at a non-root node would allow A\* to skip the optimal path.
## Evidence From This Vault
- [[20_Progress/Degree/CSCI 4511W/Weekly/Week - 4|Week - 4]] — Lecture 06 (9/28): full Greedy Best-First and A\* traces on the 15-node tree; A\* completeness and cost-optimality discussion questions. Short Quiz 3 Q2–Q4 applied Greedy and A\* to the diamond graph and established that A\* with h=0 reduces to UCS.
- [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 3|Chapter - 3]] §3.5.1–3.6.6 — admissibility/consistency proofs, search contours, weighted A\*, IDA\*, RBFS, SMA\*, bidirectional heuristic search, and all heuristic construction methods.
## Flashcards
#cards/csci4511w
What does **admissibility** require of h(n), and when is it sufficient for A\* cost-optimality?::h(n) ≤ h\*(n) for all n — h never overestimates the true remaining cost. Admissibility is sufficient for A\* on *tree search* (no reached table). In graph search, admissibility alone may require re-opening already-expanded states when cheaper paths arrive; consistency is the stronger condition needed there. #cards/csci4511w
What does **consistency** require of h(n), and why does it additionally guarantee graph search A\* optimality?::h(n) ≤ c(n, a, n') + h(n') for every node n and successor n' — the triangle inequality on h. Consistency makes f(n) non-decreasing along any path (f(n') ≥ f(n) always), so the first expansion of any state is at its optimal cost and no state ever needs to be re-opened. Graph A\* is then correct without the re-opening logic. #cards/csci4511w
Why does **A\* with h(n) = 0** reduce to UCS, and what does this tell you about the two algorithm families?::f(n) = g(n) + 0 = g(n), exactly UCS's ordering function. The uninformed and informed families are the same framework — h=0 makes informed search blind. Any admissible h > 0 strictly dominates h=0 (fewer expansions, same optimality guarantee); UCS is the worst-case informed search. #cards/csci4511w
Why did **Greedy expand dead-end leaf O** (h=1) on the 15-node tree while A\* avoided it?::Greedy orders by f = h alone, so O(h=1) looks more promising than L(h=0) before L is on the frontier. A\* orders by f = g + h; O has g = 7+8 = 15, so f(O) = 16. L has f(L) = 6+5+0 = 11. A\*'s g(n) term penalizes the expensive A→C→G→O path before O is ever popped. #cards/csci4511w
State the **A\* optimality proof sketch**: why can A\* not return a suboptimal goal with an admissible h?::Suppose A\* pops suboptimal G2 with cost C > C\*. Any node n on the optimal path has f(n) = g(n)+h(n) ≤ g(n)+h\*(n) = C\* < C. So A\* pops n before G2. But n is on the path to optimal G1, so A\* finds G1 first. Contradiction. #cards/csci4511w
How does the **relaxed problem method** produce admissible heuristics?::Remove one or more action preconditions, adding edges to the state space (a supergraph of the original). The optimal relaxed solution never exceeds the original optimal because every original path is valid in the relaxed space. So h_relaxed ≤ h\*: admissible by construction. Manhattan distance removes the "destination blank" precondition from the 8-puzzle; misplaced tiles additionally removes "adjacent." #cards/csci4511w
Why can **disjoint pattern databases** be summed while overlapping databases cannot?::Disjoint databases partition tiles into non-overlapping groups. Each physical move is counted by exactly one group's database — no double-counting. Summing costs over disjoint groups gives a valid lower bound. If two databases share a tile, a move of that tile is counted twice in the sum, potentially making the heuristic overestimate the true cost and violate admissibility. #cards/csci4511w
