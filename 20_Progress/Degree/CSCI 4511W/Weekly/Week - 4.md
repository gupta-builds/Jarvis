---
type: class
input_kind: lecture
status: seed
created: 2026-09-28
updated: 2026-09-28
area:
  - "[[UMN Board]]"
tags:
  - "#class"
  - "#Lecture"
next: "Add live capture for Monday/Wednesday lecture, then fill Textbook integration once Chapter 3 (Parts 4-5) land"
---
# Week - 4
## What you must be able to do
<!-- Write four to eight testable abilities. Link the matching chapter first in the finished note. -->
-
-
## Key ideas (short)
<!-- Give three to six compressed claims; this is not the full lecture capture. -->
-
## Concepts created today
<!-- Add links only for concept notes created from this lecture. -->
-
## Examples worth keeping
<!-- Keep concrete lecture examples, cases, or numbers that made an idea click. -->
-
## Lecture
<!-- Reproduce the lecture's structure with one ### section per major part. Use tabs for nested content. -->
### 1. Section title
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
<!-- State what the textbook adds beyond lecture. Link the actual chapter and name the missing framework or test. -->
> [!IMPORTANT]
> Main chapters:
## Takeaways (questions to resolve)
<!-- Use real follow-up questions that can be answered by reading or drilling. -->
- [ ]
- [ ]
## Lecture-to-textbook synthesis
<!-- Use one highlighted definition, then mechanism, lecture example, textbook link, concept links, warning, and summary. -->
== ==
*Mechanism:*
- Lecture example/scenario:
- Textbook connection:
- Concept links:
> [!WARNING]
> Replace this with the common confusion or failure mode.

> [!SUMMARY]
> Replace this with what the week is really about in one sentence.
## Flashcards
<!-- Add 3–5+ cards to #cards/<course-slug>; test distinctions and mechanisms, not labels. -->
