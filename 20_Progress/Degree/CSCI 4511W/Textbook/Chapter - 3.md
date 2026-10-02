---
type: class
input_kind: book
status: seed
created: 2026-09-28
updated: 2026-10-02
area:
  - "[[CSCI 4511W Board]]"
  - "[[20_Progress/Degree/CSCI 4511W/Textbook/Textbook Map|Textbook Map]]"
tags:
  - "#class"
  - "#Textbook"
  - "#AI"
next: "Connect to Week 3–4 lecture captures once Lectures 05–07 land"
---
# Chapter - 3 — Solving Problems by Searching
**Source:** Stuart Russell and Peter Norvig, *Artificial Intelligence: A Modern Approach*, 4th ed. (Pearson, 2020), Chapter 3, pp. 63–105.
**Read from:** `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4511W\CSCI 4511W Textbook.pdf`
**Course role:** Core search unit for CSCI 4511W Weeks 2–4. Formalizes problem solving as state-space search, introduces uninformed and informed algorithms, and teaches systematic heuristic construction.
## Chapter Summary
==Search algorithm choice and heuristic quality jointly determine whether the returned solution is complete, cost-optimal, or merely satisficing.==
*Mechanism:* The chapter formalizes problem solving as defining a state space, initial state, action set, transition model, goal test, and cost function—then abstracting physical detail down to a tractable model. Uninformed algorithms (BFS, UCS, DFS, DLS, IDDFS) know only the state-space structure and must explore blindly. Informed algorithms (greedy best-first, A*, weighted A*, memory-bounded variants) use a heuristic estimate h(n) of remaining cost to focus expansion toward the goal. The chapter closes by showing how to construct admissible heuristics systematically: relax the problem, precompute pattern databases, place landmark points, or learn from solved instances.
## Key Concepts
### Problem Formulation
- **Problem-solving agent**: A goal-based agent that uses atomic state representations to plan ahead by finding sequences of actions that reach a goal state (p. 63).
- **Search**: The computational process of simulating action sequences in a state-space model to discover a path from an initial state to a goal state (p. 63).
- **Goal formulation**: Adopting a clear goal target to organize behavior and restrict considered actions (p. 64).
- **Problem formulation**: Devising an abstract description of states, actions, transitions, and costs necessary to reach the goal (p. 64).
- **Solution**: A fixed sequence of actions that transforms the initial state into a state satisfying the goal test (p. 64).
- **State space**: The complete set of all states reachable from the initial state through any sequence of actions (p. 65).
- **Initial state**: The state in which the agent begins (p. 65).
- **Goal test**: A function \\(\text{Is-Goal}(s)\\) evaluating whether state \\(s\\) satisfies the goal condition (p. 65).
- **Actions**: The set of applicable choices \\(\text{Actions}(s)\\) available in state \\(s\\) (p. 65).
- **Transition model**: Function \\(\text{Result}(s, a)\\) returning the state produced by executing action \\(a\\) in state \\(s\\) (p. 65).
- **Action cost function**: Function \\(c(s, a, s')\\) returning the numeric cost of applying action \\(a\\) from \\(s\\) to \\(s'\\) (p. 65). Costs must satisfy \\(c \ge \epsilon > 0\\) to prevent infinite zero-cost loops.
- **Optimal solution**: A path from initial state to goal state with the lowest total path cost among all valid solutions (p. 65).
- **Abstraction**: Removing irrelevant real-world detail to create a tractable state and action model (p. 67).
- **Valid abstraction**: Every abstract solution path can be elaborated into a real-world execution path (p. 67).
- **Useful abstraction**: Executing each abstract action is easier than solving the unabstracted problem (p. 67).
- **Standardized problem**: A benchmark problem with a concise description intended to exercise and compare search algorithms (p. 68).
- **Grid world / sliding-tile puzzle**: A 2-D rectangular grid; benchmark problems include the 8-puzzle (\\(9! = 362{,}880\\) states, \\(181{,}440\\) reachable), Sokoban, and Rush Hour (p. 68–70).
- **Knuth's 4-number problem**: Infinite-state-space benchmark demonstrating recursive expression generation via \\(\sqrt{x}\\), \\(\lfloor x \rfloor\\), and \\(x!\\) starting from 4 (p. 71).
- **Route-finding problem**: States are geographic locations; actions are travel along road/rail/air links (p. 71).
- **Traveling salesperson problem (TSP)**: NP-hard touring problem seeking a minimum-cost tour visiting every city once (p. 71–72).
### Search Infrastructure
- **Best-first search**: General algorithm that always expands the frontier node with the minimum value of an evaluation function \\(f(n)\\). Choosing different \\(f(n)\\) produces BFS, UCS, greedy, or A* (p. 73).
- **Evaluation function f(n)**: A real-valued function ranking nodes; determines which node is expanded next (p. 73).
- **Search node**: Data structure with four fields: `STATE`, `PARENT`, `ACTION`, and `PATH-COST` \\(g(n)\\) (p. 75).
- **Frontier**: The set of reached-but-unexpanded nodes, implemented as a priority queue (best-first), FIFO queue (BFS), or LIFO stack (DFS) (p. 74–75).
- **Reached table**: A hash map from state to node enabling \\(O(1)\\) duplicate detection and storing the cheapest known path to each state (p. 75).
- **Graph search**: Uses the reached table to discard or update redundant paths (p. 76).
- **Tree-like search**: Omits the reached table to save memory; risks exponential repeated work or infinite loops on cyclic graphs (p. 76).
- **Completeness**: The algorithm is guaranteed to find a solution when one exists and report failure correctly when none exists (p. 77).
- **Cost optimality**: The algorithm returns a solution with the lowest path cost \\(C^*\\) among all valid solutions (p. 77).
- **Branching factor b**: Maximum or average number of successors per node (p. 78).
- **Solution depth d**: Depth of the shallowest goal node in the search tree (p. 78).
### Uninformed Search Algorithms
- **Breadth-first search (BFS)**: Expands the shallowest unexpanded node first using a FIFO queue and an early goal test (check goal on generation, not on pop). Complete for finite \\(b\\); cost-optimal only for unit-cost actions. Time and space \\(O(b^d)\\) (p. 79–80).
- **Uniform-cost search / Dijkstra's algorithm**: Expands the node with minimum path cost \\(g(n)\\). Must use a late goal test (check goal on pop) to guarantee optimality. Complete and cost-optimal when \\(c \ge \epsilon > 0\\). Time and space \\(O(b^{1 + \lfloor C^*/\epsilon \rfloor})\\) (p. 81–83).
- **Depth-first search (DFS)**: Expands the deepest node first via a LIFO stack. Not cost-optimal. Incomplete on infinite or cyclic state spaces. Linear space \\(O(bm)\\) vs. exponential time \\(O(b^m)\\) (p. 83–84).
- **Backtracking search**: DFS variant that generates one child at a time and modifies state in-place, cutting space to \\(O(m)\\) (p. 84–85).
- **Depth-limited search (DLS)**: DFS capped at depth limit \\(l\\). Returns a solution, `failure` (space exhausted), or `cutoff` (limit hit). Incomplete if \\(l < d\\). Time \\(O(b^l)\\), space \\(O(bl)\\) (p. 85).
- **Diameter**: Maximum shortest path between any two states in the graph; used to set a good depth limit for DLS (p. 85).
- **Iterative deepening search (IDDFS)**: Calls DLS with limits \\(l = 0, 1, 2, \ldots\\) until a solution is found. Combines DFS's linear space \\(O(bd)\\) with BFS's completeness and unit-cost optimality. Total time \\(O(b^d)\\) because the deepest level dominates (p. 85–86).
- **Bidirectional search**: Simultaneously searches forward from the initial state and backward from the goal; solution found when the two frontiers meet. Reduces work from \\(b^d\\) to \\(2 \cdot b^{d/2}\\), a factor of 50,000 for \\(b = d = 10\\). Complete and cost-optimal when both directions use breadth-first or uniform-cost (p. 86–87).
### Informed (Heuristic) Search
- **Heuristic function h(n)**: Estimates the cost of the cheapest path from node \\(n\\) to the nearest goal state. By convention \\(h(\text{goal}) = 0\\) (p. 84).
- **Greedy best-first search**: Sets \\(f(n) = h(n)\\). Expands whichever state looks closest to the goal. Not cost-optimal; easily misled by heuristic minima far from the optimal path (p. 84–85).
- **A* search**: Sets \\(f(n) = g(n) + h(n)\\), combining actual path cost with estimated remaining cost. Cost-optimal when \\(h\\) is admissible (tree search) or consistent (graph search). Most widely used informed search algorithm (p. 85–87).
- **Admissible heuristic**: \\(h(n) \le h^*(n)\\) for all \\(n\\), where \\(h^*(n)\\) is the true optimal cost from \\(n\\) to the goal. Never overestimates; optimistic (p. 86).
- **Consistent heuristic (monotonicity)**: \\(h(n) \le c(n, a, n') + h(n')\\) for every node \\(n\\) and successor \\(n'\\). Satisfies the triangle inequality. Every consistent heuristic is admissible, but not vice versa (p. 87).
- **Search contours**: A* expands nodes in bands of equal \\(f\\)-cost, stretching toward the goal with a good heuristic. A consistent heuristic makes \\(f(n)\\) non-decreasing along any path, so each state is expanded at most once (p. 87–88).
- **Satisficing search**: Accepts a solution that is good enough rather than optimal. Justified when optimal search is too expensive (p. 89).
- **Weighted A* search**: Sets \\(f(n) = g(n) + W \cdot h(n)\\) with \\(W > 1\\). Guarantees bounded suboptimality: returned cost \\(C \le W \cdot C^*\\) (p. 89–90).
- **Beam search**: Keeps only the best \\(k\\) nodes on the frontier. Incomplete and suboptimal, but highly memory-efficient (p. 91).
- **IDA\***: Iterative deepening A* using \\(f\\)-cost limits instead of depth limits. Linear space \\(O(bd)\\) (p. 91).
- **SMA\* (Simplified Memory-Bounded A\*)**: A* with a fixed memory bound \\(M\\). Drops the worst leaf and backs up its \\(f\\)-value to its parent when memory is full. Complete if goal depth \\(d \le M\\) (p. 92–93).
- **Bidirectional heuristic search**: Bidirectional best-first with admissible heuristics using the \\(lb(m,n) = \max(g_F(m)+g_B(n), f_F(m), f_B(n))\\) lower bound and the \\(f_2(n) = \max(2g(n), g(n)+h(n))\\) evaluation function. The frontiers meet near \\(C^*/2\\). Complete and cost-optimal; in practice fewer expansions than A* with medium-quality heuristics (p. 93–95).
### Heuristic Construction
- **Effective branching factor b\***: Empirical heuristic quality metric. \\(b^*\\) satisfies \\(N + 1 = 1 + b^* + (b^*)^2 + \cdots + (b^*)^d\\) where \\(N\\) is total nodes generated (p. 98).
- **Heuristic domination**: \\(h_2\\) dominates \\(h_1\\) if \\(h_2(n) \ge h_1(n)\\) everywhere and both are consistent. A* with \\(h_2\\) never expands more nodes than with \\(h_1\\) (p. 99–100).
- **Composite heuristic**: \\(h(n) = \max\{h_1(n), \ldots, h_m(n)\}\\) over admissible heuristics; dominates all components while preserving admissibility (p. 101).
- **Relaxed problem**: Remove preconditions from actions to create a supergraph of the state space. The optimal solution cost to the relaxed problem is an admissible, consistent heuristic for the original (p. 100).
- **Manhattan distance (h₂)**: Heuristic for the 8-puzzle derived by removing the "destination blank" precondition. Sum of horizontal + vertical distances of each tile from its goal (p. 100).
- **Misplaced tiles (h₁)**: Heuristic for the 8-puzzle derived by also removing the "adjacency" precondition. Count of tiles not in their goal position (p. 100).
- **Pattern database**: Lookup table storing exact optimal costs for all configurations of a subproblem. Constructed once by backward search from the goal (p. 101–102).
- **Disjoint pattern database**: Pattern databases over non-overlapping tile subsets whose costs can be summed without violating admissibility, because each move is counted by exactly one pattern's database (p. 102).
- **Landmark differential heuristic**: Precomputes exact distances from all states to a set of landmark vertices; applies the triangle inequality to produce admissible estimates for large graphs (p. 102–104).
## Full Reading Notes
### 3.1 Problem-Solving Agents
When the right action is not immediately obvious, an agent must look ahead by simulating sequences of actions (p. 63). This is **search**. Search agents use **atomic representations**: each state is a black box with no internal structure visible to the algorithm (p. 63).

**The four-step problem-solving process (p. 64):**
1. **Goal formulation**: Adopt a goal to organize behavior and limit considered actions (e.g., reach Bucharest from Arad).
2. **Problem formulation**: Build an abstract model of states, actions, transitions, and costs.
3. **Search**: Simulate action sequences in the model until a solution path is found.
4. **Execution**: Carry out the solution actions in the real world one by one.

**Environment assumptions required for standard offline search (p. 63–65):**
- Sequential, single-agent, fully observable, deterministic, static, discrete, known.

Under fully observable, deterministic, known conditions the solution is a fixed open-loop action sequence (p. 64). Partial observability or nondeterminism would require a conditional plan instead (p. 64–65).

**Formal search problem (p. 65):**

| Component | Definition |
|---|---|
| State space | Set of all reachable states \\(S\\) |
| Initial state | \\(s_0 \in S\\) |
| Actions | \\(\text{Actions}(s)\\): applicable actions in state \\(s\\) |
| Transition model | \\(\text{Result}(s, a)\\): successor state |
| Goal test | \\(\text{Is-Goal}(s)\\): returns True if \\(s\\) is a goal |
| Action cost | \\(c(s, a, s') \ge \epsilon > 0\\): numeric cost of each action |

**Abstraction (p. 67):** Real environments have overwhelming physical detail (tire pressure, weather). Abstraction strips this to a tractable model. An abstraction is *valid* if every abstract solution path can be expanded into a real execution; *useful* if each abstract action is easier than solving the original problem.
### 3.2 Example Problems
Search environments divide into standardized benchmarks and real-world applications (p. 68).
### 3.2.1 Standardized Problems
1. **Vacuum World**: \\(N\\) cells × \\(2^N\\) dirt configurations = \\(N \cdot 2^N\\) states. Actions: Suck, Left, Right, Up, Down. Cost: 1 per action (p. 68).
2. **Sliding-Tile Puzzles**: 8-puzzle has \\(9! = 362{,}880\\) total configurations, only \\(181{,}440\\) reachable (parity partitions the space into two disconnected halves). Actions: move blank Left, Right, Up, Down. Cost: 1 per slide (p. 68–70).
3. **Sokoban**: Agent pushes boxes to storage locations. An \\(8 \times 8\\) grid with 12 boxes has over 200 trillion states (p. 68).
4. **Knuth's 4-number problem**: Infinite state space. States are positive reals. Actions: \\(\sqrt{x}\\), \\(\lfloor x \rfloor\\), \\(x!\\) (integers only). Goal: reach a target integer starting from 4 (p. 71).
### 3.2.2 Real-World Problems
1. **Route-finding**: States = locations; actions = traversing links. Airline ticketing states also record time, class, and flight history to handle fare structures (p. 71).
2. **TSP**: Find a minimum-cost tour visiting every city exactly once. NP-hard (p. 71–72).
3. **VLSI layout**: Position millions of components on a chip to minimize area, delay, and stray capacitance (p. 72).
4. **Robot navigation**: Continuous generalization of route-finding over multi-dimensional configuration spaces (p. 72).
5. **Automatic assembly sequencing**: Find a collision-free ordering for assembling mechanical parts (p. 72).
### 3.3 Search Algorithms
A search algorithm constructs a **search tree** superimposed on the state-space graph, starting from a root node for the initial state and expanding nodes by applying `Actions(s)` to generate children via `Result(s, a)` (p. 73).
### 3.3.1 Best-First Search
Best-first search always pops the frontier node with the minimum evaluation function value \\(f(n)\\) (p. 73). Choosing \\(f(n)\\) differently produces all the algorithms in §3.4–3.5.

```
function BEST-FIRST-SEARCH(problem, f) returns a solution node or failure
  node <- NODE(STATE=problem.INITIAL)
  frontier <- priority queue ordered by f, with node as element
  reached <- lookup table with entry problem.INITIAL -> node
  while not IS-EMPTY(frontier) do
    node <- POP(frontier)
    if problem.IS-GOAL(node.STATE) then return node
    for each child in EXPAND(problem, node) do
      s <- child.STATE
      if s not in reached or child.PATH-COST < reached[s].PATH-COST then
        reached[s] <- child
        add child to frontier
  return failure
```
### 3.3.2 Search Data Structures
A **node** stores `STATE`, `PARENT`, `ACTION`, and `PATH-COST` \\(g(n)\\) (p. 75).

The **frontier** acts as the boundary between explored and unexplored state space:
- **Priority queue**: Pops minimum \\(f(n)\\) node — used in best-first search (p. 75).
- **FIFO queue**: Pops oldest node — used in BFS (p. 75).
- **LIFO stack**: Pops newest node — used in DFS (p. 75).

The **reached table** maps each reached state to its cheapest known node; \\(O(1)\\) duplicate detection (p. 75).
### 3.3.3 Redundant Paths
A **redundant path** reaches a state already in `reached` via a more expensive route (p. 76).
- **Graph search**: Tracks `reached`; discards or updates redundant paths.
- **Tree-like search**: Omits `reached`; saves memory but risks exponential repeated work and infinite loops.
- **Cycle checking**: A middle ground — follow parent pointers to check only the current path for cycles (p. 76).
### 3.3.4 Measuring Performance
Four metrics (p. 77–79):
- **Completeness**: Does it find a solution when one exists?
- **Cost optimality**: Does it return minimum-cost solution?
- **Time complexity**: Nodes generated or expanded.
- **Space complexity**: Memory for frontier and reached.

Key problem parameters: branching factor \\(b\\), shallowest goal depth \\(d\\), max depth \\(m\\), optimal cost \\(C^*\\), step cost lower bound \\(\epsilon > 0\\).
### 3.4.1 Breadth-First Search
BFS expands the shallowest unexpanded node first using a FIFO queue (p. 79). Two key differences from generic best-first:
1. Uses a FIFO queue instead of a priority queue.
2. Uses an **early goal test**: checks whether a node is a goal as soon as it is *generated*, not when it is popped.

```
function BREADTH-FIRST-SEARCH(problem) returns solution or failure
  node <- NODE(problem.INITIAL)
  if problem.IS-GOAL(node.STATE) then return node
  frontier <- FIFO queue with node as element
  reached <- {problem.INITIAL}
  while not IS-EMPTY(frontier) do
    node <- POP(frontier)
    for each child in EXPAND(problem, node) do
      s <- child.STATE
      if problem.IS-GOAL(s) then return child
      if s not in reached then
        add s to reached; add child to frontier
  return failure
```

**Performance:**
- **Complete**: Yes, for finite \\(b\\).
- **Cost-optimal**: Only for unit-cost actions.
- **Time and space**: \\(O(b^d)\\). Memory is the binding constraint (\\(b=10, d=10\\) requires ~10 TB).
### 3.4.2 Uniform-Cost Search (Dijkstra's Algorithm)
UCS expands the node with the lowest path cost \\(g(n)\\), spreading in concentric waves of equal cost rather than equal depth (p. 81).

```
function UNIFORM-COST-SEARCH(problem) returns solution or failure
  return BEST-FIRST-SEARCH(problem, PATH-COST)
```

Two critical rules:
1. **Late goal test**: The goal check happens when a node is *popped*, not generated. Testing on generation could return a suboptimal path if a cheaper route to the goal exists but hasn't been expanded yet (p. 82).
2. **Strict positive costs** \\(c \ge \epsilon > 0\\): Without this, zero-cost cycles could trap the search indefinitely (p. 83).

**Performance:**
- **Complete**: Yes, when \\(c \ge \epsilon > 0\\).
- **Cost-optimal**: Yes — nodes are popped in non-decreasing \\(g(n)\\) order; when a goal pops, all cheaper paths have been explored.
- **Time and space**: \\(O(b^{1 + \lfloor C^*/\epsilon \rfloor})\\). For uniform costs this equals \\(O(b^{d+1})\\) due to the late goal test.
### 3.4.3 Depth-First Search
DFS always expands the deepest node first via a LIFO stack (p. 83).

**Properties:**
- Not cost-optimal: returns the first path found, even if long and expensive.
- Incomplete: on state spaces with infinite branches or cycles, tree-like DFS gets trapped indefinitely.
- **Linear space**: \\(O(bm)\\). Stores only the current path plus unexpanded siblings at each level — far less than BFS's \\(O(b^d)\\).
- **Time**: \\(O(b^m)\\) worst case.

**Backtracking search (p. 84–85):** A memory-optimized DFS variant that generates one child at a time and modifies state in-place, then reverses the modification on backtrack. Space drops to \\(O(m)\\).
### 3.4.4 Depth-Limited and Iterative Deepening Search
**Depth-limited search** imposes a fixed limit \\(l\\), treating nodes at depth \\(l\\) as having no successors (p. 85). Returns one of three things: a solution node, `failure` (space exhausted within limit without finding goal), or `cutoff` (limit was the stopping point with unexplored branches remaining).

The **diameter** of the state space — the maximum shortest path between any two states — provides a tight limit that guarantees completeness without iterating more than necessary (p. 85).

**Iterative deepening search (IDDFS)** solves the problem of not knowing a good depth limit by testing \\(l = 0, 1, 2, \ldots\\) in sequence (p. 85–86):

```
function ITERATIVE-DEEPENING-SEARCH(problem) returns solution or failure
  for depth = 0 to ∞ do
    result <- DEPTH-LIMITED-SEARCH(problem, depth)
    if result ≠ cutoff then return result
```

**Why re-generation overhead is negligible (p. 86):** In a tree of branching factor \\(b\\) and goal depth \\(d\\), nodes at the deepest level \\(b^d\\) dominate. The total nodes generated:
\\[N(\text{IDDFS}) = (d)b + (d-1)b^2 + \cdots + (1)b^d = O(b^d)\\]
compared to BFS's \\(N(\text{BFS}) = b + b^2 + \cdots + b^d = O(b^d)\\).

For \\(b = 10, d = 5\\): BFS generates 111,110 nodes; IDDFS generates 123,450 — about 11% more, while using kilobytes instead of gigabytes of memory.

**Performance:**
- **Complete**: Yes, for finite \\(b\\) and cycle-checked graphs.
- **Cost-optimal**: Yes, for unit-cost actions.
- **Time**: \\(O(b^d)\\).
- **Space**: \\(O(bd)\\) — the main practical advantage over BFS.

IDDFS is the preferred uninformed strategy when the state space is too large to fit in memory and solution depth is unknown.

### 3.4.5 Bidirectional Search
Simultaneously searches forward from the initial state and backward from the goal state(s), with the two frontiers meeting in the middle (p. 86–87). The motivation is that \\(b^{d/2} + b^{d/2} \ll b^d\\): for \\(b = d = 10\\), bidirectional is about 50,000× cheaper than unidirectional.

Two frontiers and two reached tables are maintained. Reasoning backward requires knowing that if \\(s'\\) is a successor of \\(s\\) forward, then \\(s\\) is a successor of \\(s'\\) backward. A solution is found when the two frontiers collide in the reached tables.

**Bidirectional best-first search**: The node expanded is always the minimum-\\(f(n)\\) node across either frontier. When the evaluation function is path cost, this gives **bidirectional uniform-cost search**: the first solution found is cost-optimal.

**Performance:**
- **Complete**: Yes, for finite \\(b\\) with appropriate evaluation functions.
- **Cost-optimal**: Yes, when both directions use breadth-first or uniform-cost.
- **Time and space**: \\(O(b^{d/2})\\).
### 3.4.6 Comparing Uninformed Search Algorithms
Figure 3.15 (p. 87) compares the four performance criteria across uninformed algorithms. The table is for tree-like search (no repeated-state checking). For graph search versions: DFS becomes complete on finite state spaces, and time/space are bounded by \\(|V| + |E|\\).

| Algorithm | Complete? | Cost-optimal? | Time | Space |
|---|---|---|---|---|
| BFS | Yes¹ | Unit costs only³ | \\(O(b^d)\\) | \\(O(b^d)\\) |
| UCS | Yes² | Yes | \\(O(b^{1+\lfloor C^*/\epsilon \rfloor})\\) | \\(O(b^{1+\lfloor C^*/\epsilon \rfloor})\\) |
| DFS | No | No | \\(O(b^m)\\) | \\(O(bm)\\) |
| DLS | No (\\(l < d\\)) | No | \\(O(b^l)\\) | \\(O(bl)\\) |
| IDDFS | Yes¹ | Unit costs only³ | \\(O(b^d)\\) | \\(O(bd)\\) |
| Bidirectional | Yes¹ | Unit costs only⁴ | \\(O(b^{d/2})\\) | \\(O(b^{d/2})\\) |

¹ Complete if \\(b\\) is finite and the state space has a solution or is finite. ² Complete if all action costs \\(\ge \epsilon > 0\\). ³ Cost-optimal if action costs are all identical. ⁴ If both directions are breadth-first or uniform-cost.
### 3.5.1 Greedy Best-First Search
Greedy best-first sets \\(f(n) = h(n)\\), where \\(h(n)\\) estimates the remaining distance to the goal (p. 84). It always expands whichever state looks closest to the goal.

For route-finding, a common heuristic is **straight-line distance** \\(h_\text{SLD}\\) between a city and the destination.

**Properties:**
- **Complete**: Yes in finite state spaces (graph search prevents loops). Incomplete in infinite spaces or tree-like search.
- **Cost-optimal**: No. Greedy ignores path cost already spent, so a low \\(h\\) value can lure search into expensive detours. In Romania, greedy via Sibiu-Fagaras finds a 450-km path when the optimal is 418 km.
- **Time/space**: \\(O(|V|)\\) graph search; \\(O(b^m)\\) tree search. A well-designed heuristic can approach \\(O(bm)\\) in practice.
### 3.5.2 A* Search
A* sets \\(f(n) = g(n) + h(n)\\): actual path cost to \\(n\\) plus estimated remaining cost (p. 85–86). It balances "how far have I come?" against "how far must I go?"

**Cost-optimality conditions (p. 86–87):**
- **Tree search**: \\(h\\) must be *admissible* — \\(h(n) \le h^*(n)\\) always.
- **Graph search**: \\(h\\) must be *consistent* — \\(h(n) \le c(n,a,n') + h(n')\\) for every successor \\(n'\\).

Consistency implies admissibility. A consistent heuristic makes \\(f\\) non-decreasing along any path, so each state is expanded at most once and the `reached` table never needs updating.

**Proof sketch (p. 86–87):** Suppose A* pops suboptimal goal \\(G_2\\) with cost \\(C > C^*\\). Any node \\(n\\) on the optimal path has \\(f(n) = g(n) + h(n) \le C^* < C = f(G_2)\\), so A* would expand \\(n\\) before \\(G_2\\). Contradiction.

**Completeness**: Yes, for finite \\(b\\) and \\(c \ge \epsilon > 0\\).
**Time/space**: Worst-case \\(O(b^d)\\) — A* keeps all generated nodes in memory, which is its main practical limit.
### 3.5.3 Search Contours
A* expands nodes in concentric bands of equal \\(f\\)-cost (p. 87–88). UCS forms circular bands; a good heuristic stretches bands toward the goal, focusing search on the optimal path. Every node with \\(f(n) < C^*\\) is **surely expanded**; A* with a consistent heuristic is **optimally efficient** — no algorithm using the same heuristic can expand fewer nodes and still guarantee optimality.
### 3.5.4 Satisficing Search: Inadmissible Heuristics and Weighted A*
When optimal search is too slow, **satisficing** solutions that are "good enough" are acceptable (p. 89).

**Weighted A\*** sets \\(f(n) = g(n) + W \cdot h(n)\\) for \\(W > 1\\) (p. 89–90):
- \\(W = 1\\): Standard A*.
- \\(W > 1\\): Bounded suboptimal — returned solution cost \\(C \le W \cdot C^*\\).
- \\(W = \infty\\): Degenerates to greedy best-first.

Other satisficing variants: **beam search** (keep only \\(k\\) best frontier nodes; incomplete), **bounded-cost search** (find any solution below cost \\(C\\)), **speedy search** (minimize step count rather than cost).
### 3.5.5 Memory-Bounded Search
A*'s main bottleneck is memory: it keeps every generated node in `reached` and `frontier` (p. 91).

- **IDA\***: Iterative deepening with \\(f\\)-cost limits instead of depth limits. Linear space \\(O(bd)\\). On real-valued costs each new iteration may add only one node, causing excessive regeneration.
- **RBFS (Recursive Best-First Search)**: Best-first in \\(O(bd)\\) space using recursion. When backtracking, replaces each node's \\(f\\)-value with its best child's \\(f\\)-value (backed-up value) so the quality of the forgotten subtree is remembered. Suffers from regeneration thrashing when paths repeatedly exchange rank (p. 91–92).
- **SMA\***: Uses all available memory \\(M\\). When full, drops the worst leaf (highest \\(f\\)) and backs its value to the parent. Complete if goal depth \\(\le M\\). Can thrash when memory is only slightly smaller than needed (p. 92–93).
### 3.5.6 Bidirectional Heuristic Search
Applies informed search in both directions simultaneously (p. 93–95). Using \\(f(n) = g(n) + h(n)\\) alone does not guarantee optimality for bidirectional search, because correctness must be proved over *pairs* of nodes — one from each frontier — not individual nodes.

For a forward node \\(m\\) and a backward node \\(n\\), define the lower bound on any solution passing through both:
\\[lb(m, n) = \max\bigl(g_F(m) + g_B(n),\ f_F(m),\ f_B(n)\bigr)\\]
The sum \\(g_F(m) + g_B(n)\\) lower-bounds the cost via both paths (the gap between \\(m\\) and \\(n\\) has non-negative cost); \\(f_F(m)\\) and \\(f_B(n)\\) provide individual optimistic estimates. Any pair with \\(lb(m,n) < C^*\\) must have at least one member expanded, but the algorithm cannot know which one. Eckerle et al. (2017) proved no bidirectional algorithm can guarantee expanding fewer than twice the minimum nodes.

In practice, the \\(f_2\\) evaluation function is used:
\\[f_2(n) = \max\bigl(2g(n),\ g(n) + h(n)\bigr)\\]
This prevents expanding any node with \\(g(n) > C^*/2\\), so the two frontiers meet in the middle. Bidirectional search with \\(f_2\\) and an admissible heuristic is complete and cost-optimal.
### 3.6.1 The Effect of Heuristic Accuracy on Performance
**Effective branching factor \\(b^*\\)** measures heuristic quality: it is the branching factor a uniform tree of depth \\(d\\) would need to hold \\(N+1\\) nodes (p. 98):
\\[N + 1 = 1 + b^* + (b^*)^2 + \cdots + (b^*)^d\\]

From 8-puzzle experiments (p. 99):

| Depth | BFS nodes | \\(b^*\\) | A\*(h₁ misplaced) nodes | \\(b^*\\) | A\*(h₂ Manhattan) nodes | \\(b^*\\) |
|---|---|---|---|---|---|---|
| 14 | 6,783 | 1.77 | 678 | 1.47 | 174 | 1.31 |
| 26 | 395,355 | 1.58 | 110,372 | 1.50 | 10,080 | 1.35 |

Korf and Reid (1998) showed that a heuristic \\(h\\) reduces effective depth by a constant \\(k_h\\), yielding \\(O(b^{d - k_h})\\) instead of \\(O(b^d)\\) — an exponential improvement (p. 98–99).

**Domination**: \\(h_2\\) dominates \\(h_1\\) if \\(h_2(n) \ge h_1(n)\\) everywhere. A* with \\(h_2\\) never expands more nodes than with \\(h_1\\) (p. 99–100). **Composite heuristic**: \\(h = \max(h_1, \ldots, h_m)\\) dominates all components while remaining admissible (p. 101).
### 3.6.2 Generating Heuristics from Relaxed Problems
A **relaxed problem** removes one or more action preconditions, adding edges to the state-space graph (p. 100). The optimal solution to the relaxed problem never exceeds the true optimal, so it is an admissible, consistent heuristic for the original.

For the 8-puzzle, the original action requires: tile at \\(X\\), \\(X\\) adjacent to \\(Y\\), \\(Y\\) blank.
- Remove "\\(Y\\) blank": tile can move to any adjacent square → **Manhattan distance** \\(h_2\\) (p. 100).
- Remove both "adjacent" and "\\(Y\\) blank": tile can move anywhere in one action → **misplaced tiles** \\(h_1\\) (p. 100).

For the specific start state in Figure 3.25 (a "typical instance" with a 26-move solution): all 8 tiles are displaced, so \\(h_1 = 8\\). The per-tile Manhattan distances sum to \\(h_2 = 3 + 1 + 2 + 2 + 2 + 3 + 3 + 2 = 18\\). The true solution depth is 26, so neither overestimates (p. 100).

Relaxed problems must be solvable without significant search so \\(h(n)\\) can be computed quickly (p. 100–101).
### 3.6.3 Generating Heuristics from Subproblems: Pattern Databases
A **pattern database** stores the exact optimal solution cost for every configuration of a subproblem (p. 101). It is built once by a backward search from the goal state (dynamic programming). During search, \\(h(n)\\) is simply a table lookup.

- 8-puzzle: storing costs for tiles 1–4 and the blank requires \\(9 \times 8 \times 7 \times 6 \times 5 = 15{,}120\\) entries.
- 15-puzzle: a pattern database reduces node expansions by 1,000× vs. Manhattan distance (p. 102).

**Disjoint pattern databases** partition tiles into non-overlapping groups (e.g., tiles 1–4 and tiles 5–8) and *sum* their costs. This is valid because each physical move is counted by exactly one group, preventing double-counting (p. 102). For 24-puzzles, disjoint databases produce a 1,000,000× speedup over Manhattan distance.
### 3.6.4 Generating Heuristics with Landmarks
**Landmark differential heuristic**: Select a set of reference vertices \\(L\\). Precompute exact distances from all states to each landmark. Then (p. 102–104):
\\[h_\text{DH}(n) = \max_{L \in \text{Landmarks}} |C^*(n, L) - C^*(\text{goal}, L)|\\]
This is admissible by the triangle inequality. Landmarks are placed at the graph perimeter to maximize bound accuracy. **Shortcuts** (artificial direct edges representing precomputed multi-hop paths) let long-distance traversal happen in a single action.
### 3.6.5 Learning to Search Better
A **metalevel state space** represents the internal computational state of a search program (p. 104). **Metalevel learning** trains on search trees to identify which subtree expansions were wasted and builds rules to avoid them, balancing computation cost against solution quality (p. 104–105).
### 3.6.6 Learning Heuristics from Experience
Train an inductive model on pairs \\((n, g^*(n))\\) from many solved problem instances (p. 105). Map state representations to features (e.g., misplaced tiles, out-of-order pairs) and fit a function \\(\hat{h}(n) = \sum w_i f_i(n)\\) to predict remaining cost. The learned \\(\hat{h}\\) may not be admissible but can serve as an excellent satisficing guide.
## Worked Example
### I. 8-Puzzle Formal Specification (p. 68–70)
The 8-puzzle is the running benchmark for problem formulation. State vector \\(s = [t_0, \ldots, t_8]\\) where \\(t_i \in \{0\ldots8\}\\) and 0 denotes the blank.

| Component | Value |
|---|---|
| \\(|S|\\) | \\(9! = 362{,}880\\); only \\(181{,}440\\) reachable (parity) |
| Initial state | Any designated configuration |
| Actions | Blank can move Up/Down/Left/Right subject to grid boundaries |
| Transition | Swaps blank with the adjacent tile in the specified direction |
| Goal test | \\(\text{Is-Goal}(s)\\) = True iff tiles in numerical order with blank at index 0 |
| Action cost | \\(c(s, a, s') = 1\\) for every slide; path cost = solution depth |

Action feasibility from index \\(i\\): Up if \\(i \ge 3\\); Down if \\(i \le 5\\); Left if \\(i \bmod 3 \ne 0\\); Right if \\(i \bmod 3 \ne 2\\).
### II. Uniform-Cost Search Trace: Sibiu to Bucharest (Figure 3.10, p. 82)
UCS with initial state Sibiu, goal Bucharest. Demonstrates why the late goal test is necessary.

| Iteration | Pop | g | Expand → children | Frontier |
|---|---|---|---|---|
| 1 | Sibiu | 0 | Rimnicu Vilcea (g=80), Fagaras (g=99) | [RV:80, Fa:99] |
| 2 | Rimnicu Vilcea | 80 | Pitesti (g=177) | [Fa:99, Pi:177] |
| 3 | Fagaras | 99 | Bucharest (g=310) | [Pi:177, Bu:310] |
| 4 | Pitesti | 177 | Bucharest (g=278) — cheaper than existing 310, update reached | [Bu:278] |
| 5 | Bucharest | 278 | **Goal test passes.** Return path Sibiu→RV→Pitesti→Bucharest, cost 278. | — |

**Key lesson**: At iteration 3, Bucharest was generated with cost 310. UCS did not return it then because of the late goal test. At iteration 4, a cheaper path via Pitesti (278) was found and the reached entry updated. When Bucharest finally popped at iteration 5, the 278-cost path was confirmed optimal.
### III. Greedy Best-First vs. A* on a 15-Node Tree (Lecture 06)
Tree from Start A (h=10) to Goal L (h=0). Demonstrates why A*'s g(n)+h(n) avoids the trap that greedy falls into.

| Step | Greedy (f = h) | A* (f = g + h) |
|---|---|---|
| Start | Pop A(h=10). Children: B(h=6), C(h=5). | Pop A(f=10). Children: B(f=8), C(f=10). |
| 1 | Pop C(h=5). Children: F(h=4), G(h=3). | Pop B(f=8). Children: D(f=11), E(f=12). |
| 2 | Pop G(h=3). Children: N(h=4), O(h=1). | Pop C(f=10). Children: F(f=10), G(f=10). |
| 3 | Pop O(h=1). Not goal; no children. | Pop F(f=10). Children: L(f=11), M(f=15). |
| 4 | Pop F(h=4). Children: L(h=0), M(h=2). | Pop G(f=10). Children: N(f=12), O(f=16). |
| 5 | Pop L(h=0). **Goal.** Path A→C→F→L, cost 11. | Pop D(f=11). Children: H(f=13), I(f=11). |
| 6 | — | Pop L(f=11). **Goal.** Path A→C→F→L, cost 11. |

Greedy expanded leaf O (h=1) because its heuristic looked promising, even though O has no children. A* avoided this because O's full f-value is g(O)+h(O) = 15+1 = 16, much larger than L's f=11.
## Connections
- **Lecture 03 (Sep 16, 2026):** Framed problem-solving as the four-step Goal→Formulation→Search→Execution flow. Used the 8-puzzle as running example, asking students about state representations (2D array vs 1D tuple). Introduced a concrete `Node` class and `BestFirstSearch(problem, f)` using a priority queue. ==Emphasized state-space graph vs. search tree data structures== as a precursor to algorithm details.
- **Lecture 04 (Sep 21, 2026):** Abstracted all algorithms into ==a single unified framework `BestFirstSearch(problem, f)` on a `PriorityQueue(order=f)` and a `reached` dictionary==. Derived BFS as \\(f(n)=0\\) (FIFO behavior) and DFS as \\(f(n) = -\text{path\_cost}\\) (LIFO behavior). Note: the book's BFS (§3.4.1) uses an early goal test for \\(O(b^d)\\) efficiency; the lecture's single-framework derivation uses a late goal test, giving \\(O(b^{d+1})\\).
- **Lecture 05 (Sep 23, 2026):** Completed the uninformed search analysis table matching the textbook's theoretical bounds exactly (p. 87). ==Headlined IDDFS as "the winner" for large memory-constrained spaces==, directly echoing Russell & Norvig p. 86.
- **Lecture 06:** Worked through the Greedy vs. A* comparison on the 15-node tree. A* completeness and cost-optimality proofs via admissibility/consistency.
- **Lecture 07:** Pending — covers §3.6 heuristic construction methods. Re-run this note once it lands.
- **Course map:** [[20_Progress/Degree/CSCI 4511W/Textbook/Textbook Map|Textbook Map]] — §3.1–3.4.4 due Weeks 2–3; §3.5–3.6 due Week 4.
## Open Questions
- [ ] How does the parity property in the 8-puzzle mathematically partition the state space into two disconnected halves, and why can no legal action transition between them?
- [ ] Why does an early goal test preserve cost-optimality in BFS (unit costs) but break it in UCS (variable costs)?
- [ ] Why does iterative deepening have the same asymptotic time complexity \\(O(b^d)\\) as BFS despite re-generating shallow nodes on every iteration?
- [ ] How does the consistency condition \\(h(n) \le c(n,a,n') + h(n')\\) guarantee that \\(f(n)\\) is non-decreasing along any path, making it unnecessary to re-open expanded states?
- [ ] Why do disjoint pattern databases allow costs to be summed while standard pattern databases for the same tiles would violate admissibility?
- [ ] How does Korf and Reid's effective depth reduction formula \\(O(b^{d-k_h})\\) explain why Manhattan distance achieves exponentially fewer expansions than misplaced tiles?
- [ ] In what state-space structures does SMA* thrash by repeatedly dropping and regenerating the same nodes, and how can this be mitigated?
## Flashcards
What are the four phases of the problem-solving agent process in order?::Goal formulation sets targets, problem formulation abstracts states and actions, search simulates paths offline, and execution carries out solution actions in the real world (p. 64). #cards/ai
What environmental conditions are required for standard offline search?::The environment must be static, fully observable, known, discrete, and deterministic; without these, the solution must be a conditional plan rather than a fixed action sequence (p. 63–65). #cards/ai
What is the difference between a valid abstraction and a useful abstraction?::A valid abstraction ensures every abstract solution can be elaborated into a real execution path; a useful abstraction ensures executing each abstract action is easier than solving the original problem (p. 67). #cards/ai
Why must Uniform-Cost Search perform its goal test when a node is popped rather than generated?::A goal state might be generated early via an expensive edge; only when a node is popped does its path cost \\(g(n)\\) represent the cheapest possible route to that state (p. 82). #cards/ai
How does Iterative Deepening Search combine the advantages of BFS and DFS?::It keeps DFS's linear space \\(O(bd)\\) while recovering BFS's completeness and unit-cost optimality by systematically increasing depth limits; the extra regeneration cost is only ~11% for typical branching factors (p. 85–86). #cards/ai
What is the difference between an admissible and a consistent heuristic?::Admissible means \\(h(n) \le h^*(n)\\) (never overestimates). Consistent additionally satisfies the triangle inequality \\(h(n) \le c(n,a,n') + h(n')\\); every consistent heuristic is admissible, but not vice versa (p. 86–87). #cards/ai
Why is greedy best-first search not cost-optimal while A* is?::Greedy sets \\(f(n) = h(n)\\) and ignores path cost already spent, so a low heuristic can lure search into expensive routes. A* sets \\(f(n) = g(n) + h(n)\\), ensuring high path cost prevents expansion even when the heuristic looks good (p. 84–86). #cards/ai
What bounded suboptimality guarantee does Weighted A* provide?::With weight \\(W > 1\\), the returned solution cost \\(C\\) satisfies \\(C^* \le C \le W \cdot C^*\\), trading optimality for faster search by biasing expansion toward the goal (p. 89–90). #cards/ai
How does the relaxed problem method generate admissible heuristics?::Removing action preconditions adds edges to the state-space graph, so the optimal relaxed solution never exceeds the true optimal cost, guaranteeing admissibility (p. 100). #cards/ai
Why do disjoint pattern databases preserve admissibility while summing standard pattern databases does not?::Disjoint databases partition tiles so each physical move is counted by exactly one database, preventing double-counting of the same action's cost across subproblems (p. 102). #cards/ai
How do BFS, DFS, DLS, and IDDFS compare on completeness, cost-optimality, time, and space?::BFS: complete/unit-optimal/O(b^d)/O(b^d). DFS: incomplete/no/O(b^m)/O(bm). DLS: incomplete if l<d/no/O(b^l)/O(bl). IDDFS: complete/unit-optimal/O(b^d)/O(bd) — IDDFS dominates on large memory-constrained problems (p. 80–87). #cards/ai
