---
type: class
input_kind: book
status: seed
created:
updated:
area:
  - "[[UMN Board]]"
tags:
  - "#class"
  - "#Textbook"
next:
---
# Chapter - 3
## Chapter Summary
<!-- State the chapter's one-sentence claim and use exactly one ==highlight== anchor. -->
== ==
*Mechanism:*
<!-- Explain how the chapter's claim works. -->
# Chapter - 3 — Solving Problems by Searching (Part 1 of 5: Problem-Solving Agents & Example Problems)

## Chapter Summary
A problem-solving agent adopts a goal, formulates a search problem using an abstract atomic state space, and simulates action sequences offline to discover an optimal path before executing it in the real world (p. 63–65).
*Mechanism:* By operating under strict environmental assumptions—static, fully observable, known, discrete, and deterministic—the agent can formulate goals and problems by abstracting complex physical realities into formal mathematical components (initial state, action set, transition model via \\(\text{Result}(s, a)\\), goal test via \\(\text{Is-Goal}(s)\\), and action cost function via \\(c(s, a, s')\\)), enabling offline search algorithms to simulate deterministic transitions without real-world execution until a complete ==optimal solution== path is found (p. 63–68).

## Key Concepts
- **Problem-solving agent**: A goal-based agent that uses atomic state representations to plan ahead by finding sequences of actions that reach a goal state (p. 63).
- **Search**: The computational process of simulating sequences of actions in a state space model to discover a path from an initial state to a goal state (p. 63).
- **Goal formulation**: The first phase of problem solving where the agent adopts a clear goal target to organize behavior and restrict considered actions (p. 64).
- **Problem formulation**: The process of devising an abstract description of states, actions, transitions, and costs necessary to reach the goal (p. 64).
- **Solution**: A fixed sequence of actions that transforms the initial state into a state satisfying the goal test (p. 64).
- **Execution**: The phase where an agent carries out the sequence of actions in the solution one by one in the physical world (p. 64).
- **Search problem**: A formal mathematical specification consisting of five core components: state space, initial state, actions, transition model, goal test, and action cost function (p. 65).
- **State space**: The complete set of all possible environment states reachable from the initial state through any sequence of actions (p. 65).
- **Initial state**: The specific state in which the agent begins its problem-solving process (p. 65).
- **Goal test**: An explicit method or function (\\(\text{Is-Goal}(s)\\)) evaluating whether a given state satisfies the goal condition (p. 65).
- **Actions**: The finite set of applicable choices (\\(\text{Actions}(s)\\)) available to the agent when in a given state \\(s\\) (p. 65).
- **Transition model**: A function \\(\text{Result}(s, a)\\) returning the state that results from executing action \\(a\\) in state \\(s\\) (p. 65).
- **Action cost function**: A function \\(c(s, a, s')\\) returning the numeric cost of applying action \\(a\\) in state \\(s\\) to reach state \\(s'\\) (p. 65).
- **Path**: A sequence of states connected by applicable actions in the state space graph (p. 65).
- ==**Optimal solution**==: A path from the initial state to a goal state that achieves the lowest total path cost among all possible solutions (p. 65).
- **Graph**: A mathematical structure of vertices (states) and directed edges (actions) representing the state space (p. 67).
- **Abstraction**: The process of removing irrelevant real-world details to create a simple, valid, and computationally tractable state and action model (p. 67).
- **Valid abstraction**: An abstract problem formulation where any abstract solution path can be elaborated into a detailed real-world execution path (p. 67).
- **Useful abstraction**: An abstraction where executing each abstract action is easier for the agent than solving the original detailed physical problem (p. 67).
- **Standardized problem**: A benchmark problem with a concise, exact description intended to illustrate, exercise, and compare AI search algorithms (p. 68).
- **Real-world problem**: An idiosyncratic task environment whose solutions people actually use in practice, requiring custom sensors and non-standard formulations (p. 68).
- **Grid world**: A two-dimensional rectangular array of square cells wherein agents move between adjacent obstacle-free cells and interact with objects (p. 68).
- **Sliding-tile puzzle**: A grid-world benchmark (e.g., 8-puzzle, 15-puzzle) where numbered tiles slide into empty spaces to match a goal configuration (p. 68).
- **Sokoban puzzle**: A grid-world problem where an agent pushes boxes across cells into designated storage locations without pushing through walls or multiple boxes (p. 68).
- **Rush Hour puzzle**: A sliding-tile variant where cars and trucks slide horizontally or vertically on a \\(6 \times 6\\) grid to free a target vehicle (p. 68).
- **Knuth's 4-number problem**: An infinite-state-space puzzle demonstrating recursive operation generation via square root, floor, and factorial operators starting from 4 (p. 71).
- **Route-finding problem**: A real-world navigation task defining states as geographical locations and actions as transitions along transportation links (p. 71).
- **Touring problem**: A search problem requiring an agent to visit a specified set of locations rather than merely reaching a single goal destination (p. 71).
- **Traveling salesperson problem (TSP)**: An NP-hard touring problem aiming to find the lowest-cost tour that visits every city on a map exactly once (p. 71).
- **VLSI layout**: The real-world search task of positioning millions of transistors and routing connecting wires on a silicon chip without overlap (p. 72).
- **Robot navigation**: A continuous generalization of route-finding where a physical robot roams open spaces, navigating high-dimensional configuration spaces (p. 72).
- **Automatic assembly sequencing**: The industry problem of discovering a feasible, cost-optimal ordering to assemble complex mechanical parts without collision (p. 72).

## Full Reading Notes

### 3.1 Problem-Solving Agents
When the correct action is not immediately obvious, an agent must look ahead by simulating sequences of actions that form a path to a goal state (p. 63). This process is performed by a **problem-solving agent**, and the computational execution is called **search** (p. 63).
Problem-solving agents use **atomic representations** where each state of the world is treated as an indivisible black box with no internal structure visible to the search algorithm (p. 63).

#### The Four-Step Problem-Solving Process
1. **Goal Formulation:** The agent adopts a goal (e.g., reaching Bucharest from Arad). Goals organize behavior by limiting the objectives and actions under consideration (p. 64).
2. **Problem Formulation:** The agent devises a formal description of states and actions necessary to reach the goal—an abstract model of the relevant world (p. 64).
3. **Search:** The agent simulates action sequences in its model without acting in the physical world, searching until it discovers a sequence that reaches the goal (a **solution**) (p. 64).
4. **Execution:** The agent executes the actions of the solution sequence one at a time in the real environment (p. 64).

#### Environment Assumptions
Standard problem-solving agents operate under six strict environmental constraints (p. 63–65):
- *Episodic vs. Sequential:* The environment is **sequential**, as current choices affect future states (p. 63).
- *Single-Agent:* Only one decision maker exists (p. 63).
- *Fully Observable:* The agent always knows the current state (p. 64).
- *Deterministic:* Every action has a single, predictable outcome state (p. 64).
- *Static:* The environment does not change while the agent is deliberating (p. 64).
- *Discrete:* States and actions are distinct and countable (p. 64).
- *Known:* The laws and physics of the environment are fully known to the agent (p. 64).

Under fully observable, deterministic, and known conditions, the solution to any search problem is a fixed, open-loop sequence of actions (p. 64). If the environment were partially observable or nondeterministic, the solution would instead be a branching strategy or contingent plan (p. 64–65).

#### Formal Search Problem Definition
==A search problem is formally defined by five components: a state space, an initial state, available actions \\(\text{Actions}(s)\\), a transition model \\(\text{Result}(s, a)\\), a goal test \\(\text{Is-Goal}(s)\\), and an action cost function \\(c(s, a, s')\\).==

```

Problem Definition Components:

1. State Space: Set of all possible states S.
2. Initial State: Starting state s_0 in S (e.g., Arad).
3. Actions: Function Actions(s) returning applicable actions in state s.
4. Transition Model: Function Result(s, a) returning state s' from taking action a in s.
5. Goal Test: Method Is-Goal(s) returning True if s is a goal state.
6. Action Cost Function: Function c(s, a, s') returning numeric cost of action a from s to s'.

```

- **Path:** A sequence of states connected by valid actions (p. 65).
- **Additive Path Cost:** The total cost of a path is the sum of its individual action costs (p. 65). Action costs are assumed to be strictly positive (\\(c(s, a, s') \ge \epsilon > 0\\)) to avoid infinite loops caused by zero-cost or negative-cost cycles (p. 65).
- **Optimal Solution:** A solution path achieving the minimum path cost among all valid solution paths (p. 65).
- **State Space Graph:** A directed graph \\(G = (V, E)\\) where vertices \\(V\\) represent states and directed edges \\(E\\) represent applicable actions between states (p. 67).

#### Formulating Problems & Abstraction
Real-world physical environments contain overwhelming detail (e.g., tire pressure, radio stations, weather) (p. 67). Problem formulation requires **abstraction**—removing detail to construct a simplified mathematical model (p. 67).
- **Valid Abstraction:** An abstraction is valid if every abstract solution path can be elaborated into a detailed physical execution path in the real world (p. 67).
- **Useful Abstraction:** An abstraction is useful if carrying out each abstract action is significantly easier for the agent than solving the original unabstracted physical problem (p. 67).

### 3.2 Example Problems
Search task environments are divided into standardized benchmark problems and real-world application problems (p. 68).

#### 3.2.1 Standardized Problems
Standardized problems are benchmark problems with concise, exact mathematical descriptions used to compare algorithm performance (p. 68).

1. **Vacuum World (Grid World):**
   - *State Space:* A two-dimensional rectangular grid of cells. For \\(N\\) cells, there are \\(N \cdot 2^N\\) possible states (\\(N\\) possible agent locations \\(\times 2^N\\) dirt configurations) (p. 68).
   - *Initial State:* Any state designated as starting point (p. 68).
   - *Actions:* \\(Suck\\), \\(Left\\), \\(Right\\), \\(Up\\), \\(Down\\) (p. 68).
   - *Transition Model:* \\(Suck\\) cleans current cell; movement actions move agent to adjacent cell or result in \\(NoOp\\) if hitting a boundary (p. 68).
   - *Goal Test:* Checks if all cells are clean (p. 68).
   - *Action Cost:* 1 per action (p. 68).

2. **Sokoban Puzzle:**
   - *Description:* Agent pushes boxes across grid cells to storage locations (p. 68).
   - *State Space:* For \\(n\\) non-obstacle cells and \\(b\\) boxes, there are \\(n \times \frac{n!}{b!(n-b)!}\\) states (exceeding 200 trillion states for an \\(8 \times 8\\) grid with 12 boxes) (p. 68).

3. **Sliding-Tile Puzzles (8-Puzzle, 15-Puzzle, Rush Hour):**
   - *Description:* \\(3 \times 3\\) grid with 8 numbered tiles and 1 blank space (p. 68).
   - *State Space:* \\(9! = 362,880\\) total configurations (p. 68). Parity property partitions state space into two disconnected sets; any goal state is reachable from exactly half (\\(181,440\\)) of all possible initial states (p. 68).
   - *Actions:* Blank space moves \\(Left\\), \\(Right\\), \\(Up\\), or \\(Down\\) (p. 68).
   - *Transition Model:* Swaps the blank space with the adjacent tile in specified direction (p. 68).
   - *Goal Test:* Tiles arranged in numerical order (p. 70).
   - *Action Cost:* 1 per slide (p. 70).

4. **Knuth's 4-Number Problem:**
   - *States:* Positive real numbers (p. 71).
   - *Initial State:* 4 (p. 71).
   - *Actions:* Apply square root (\\(\sqrt{x}\\)), floor (\\(\lfloor x \rfloor\\)), or factorial (\\(x!\\), integers only) (p. 71).
   - *Goal Test:* Reaching a desired positive integer (e.g., 5) (p. 71).
   - *State Space:* Infinite space demonstrating recursive expression generation (p. 71).

#### 3.2.2 Real-World Problems
Real-world problems are idiosyncratic, practical tasks whose formulations depend on physical hardware and operational contexts (p. 71).

1. **Route-Finding Problems:**
   - *States:* Geographic locations or intersection junctions (p. 71).
   - *Actions:* Travel along road/rail/air segments (p. 71).
   - *Airline Travel Formulation:* States record current location, time, seat class, and flight history to track fare structures and connection requirements (p. 71).

2. **Touring Problems & Traveling Salesperson Problem (TSP):**
   - *Description:* Agent must visit a set of specified locations (p. 71).
   - *TSP Goal:* Find a tour visiting every city on a map exactly once with cost \\(< C\\) (or minimum total cost) (p. 71). TSP is NP-hard (p. 71–72).

3. **VLSI Layout Problems:**
   - *Cell Layout:* Positioning millions of components on a silicon chip to minimize area, circuit delay, and stray capacitance (p. 72).
   - *Channel Routing:* Finding specific wire routes through gaps between cells without overlap (p. 72).

4. **Robot Navigation:**
   - *Description:* Continuous generalization of route-finding where a physical robot moves through open space (p. 72).
   - *Configuration Space:* Robot joint angles and coordinates create multi-dimensional continuous search spaces (p. 72).

5. **Automatic Assembly Sequencing:**
   - *Description:* Finding a physical order to assemble mechanical parts (e.g., electric motors) without part collisions (p. 72).

## Worked Example

Formal specification and execution trace of the **8-Puzzle** benchmark:

1. **State Space (\\(S\\)):**
   - Formal state vector encoding tile positions: \\(s = [t_0, t_1, t_2, t_3, t_4, t_5, t_6, t_7, t_8]\\), where \\(t_i \in \{0, 1, 2, 3, 4, 5, 6, 7, 8\}\\) and \\(0\\) denotes the blank space.
   - Total state space size \\(|S| = 9! = 362,880\\). Reachable state space size \\(= \frac{9!}{2} = 181,440\\).

2. **Initial State (\\(s_0\\)):**
   - \\(s_0 =\\) (blank at index 4, center).

3. **Actions (\\(\text{Actions}(s)\\)):**
   - Blank space movement rules relative to index \\(i\\):
     - \\(Up\\) applicable if \\(i \ge 3\\)
     - \\(Down\\) applicable if \\(i \le 5\\)
     - \\(Left\\) applicable if \\(i \pmod 3 \ne 0\\)
     - \\(Right\\) applicable if \\(i \pmod 3 \ne 2\\)
   - For \\(s_0\\) (\\(i=4\\)): \\(\text{Actions}(s_0) = \{Up, Down, Left, Right\}\\).

4. **Transition Model (\\(\text{Result}(s, a)\\)):**
   - Executing \\(Left\\) on \\(s_0\\) swaps index 4 (\\(0\\)) with index 3 (\\(5\\)):
     \\[\text{Result}(s_0, Left) =\\]

5. **Goal Test (\\(\text{Is-Goal}(s)\\)):**
   - \\(\text{Is-Goal}(s) = \text{True}\\) if \\(s ==\\), otherwise \\(\text{False}\\).

6. ==**Action Cost Function**== (\\(c(s, a, s')\\)):
   - \\(c(s, a, s') = 1\\) for every tile slide action, making path cost \\(g(n)\\) equal to total solution step depth.

## Connections

- **Lecture (CSCI 4511W Sep 16, 2026):**
  - *4-Step Flow:* Lecture 03 explicitly frames problem-solving as Goal Formulation \\(\to\\) Problem Formulation \\(\to\\) Search \\(\to\\) Execution (noting execution is often omitted during theoretical search analysis).
  - *Running Example:* Lecture 03 uses the 8-puzzle sliding-tile puzzle as its primary running example, explicitly asking students how to represent states in code (e.g., 2D arrays vs 1D tuples).
  - *Implementation Details:* Lecture 03 introduces a concrete `Node` class storing `state`, `action`, `parent`, and `path_cost`, and defines `BestFirstSearch(problem, f)` using a priority queue.
  - ==Lecture 03 emphasizes state space graph vs. search tree data structures== and introduces priority queue mechanics for best-first search prior to algorithm details.
- **Textbook:**
  - (pending Chapter 3 — search)

## Open Questions

- [ ] ==How does the parity property in the 8-puzzle mathematically partition the state space== into two unconnectable halves, and why can't any legal action transition between them?
- [ ] Why does Knuth's 4-number problem generate an infinite state space despite having only three discrete operators?
- [ ] How does abstracting a physical action (like sliding an 8-puzzle tile) into a discrete state transition ensure both valid and useful problem formulations?
- [ ] Under what conditions does an incremental formulation of a constraint problem yield a smaller branching factor than a complete-state formulation?

## Flashcards

What are the four phases of the problem-solving agent process in order?::Goal formulation sets targets, problem formulation abstracts states and actions, search simulates paths offline, and execution carries out solution actions in the physical world (p. 64). #cards/csci4511w

What five environmental assumptions are required for standard offline search algorithms?::The environment must be static, fully observable, known, discrete, and deterministic (p. 63–65). #cards/csci4511w

What is the fundamental difference between a valid abstraction and a useful abstraction?::A valid abstraction ensures any abstract solution can be elaborated into a detailed physical path, while a useful abstraction ensures executing abstract actions is easier than solving the detailed physical problem (p. 67). #cards/csci4511w

Why does an \\(N\\)-cell vacuum world have \\(N \cdot 2^N\\) possible states?::Because the agent can be in any of the \\(N\\) locations, and each of the \\(N\\) cells can independently be clean or dirty (\\(2^N\\) dirt configurations) (p. 68). #cards/csci4511w

How does the parity property affect the state space of the 8-puzzle?::It partitions the \\(9!\\) state space into two disconnected sets of \\(9!/2 = 181,440\\) states, meaning a goal state can be reached from exactly half of all possible initial configurations (p. 68). #cards/csci4511w

Why is the Traveling Salesperson Problem (TSP) categorized as a touring problem rather than a standard route-finding problem?::Route-finding seeks a path to a single goal destination, whereas touring problems like TSP require visiting a specified set of locations before returning to the start (p. 71). #cards/csci4511w

==Why is airline ticket optimization formally undecidable?==::Because convoluted airline fare structures, restrictions, and combination rules can be reduced to Diophantine decision problems, making optimal ticket search undecidable in the worst case (p. 71–72). #cards/csci4511w

## Full Reading Notes (continued — ### 3.3, ### 3.4.1, ### 3.4.2)

### 3.3 Search Algorithms
Search algorithms construct a search tree superimposed over the underlying state space graph, beginning at a root node corresponding to the initial state (p. 73). Nodes are expanded by applying `Actions(s)` to generate child nodes via `Result(s, a)` (p. 73).

#### 3.3.1 Best-first search
**Best-first search** (Figure 3.7) is an instance of the general search framework where the node selected for expansion on each iteration is the one with the minimum value of an **evaluation function** \\(f(n)\\) (p. 73).

```

function BEST-FIRST-SEARCH(problem, f) returns a solution node or failure node <- NODE(STATE=problem.INITIAL) frontier <- a priority queue ordered by f, with node as an element reached <- a lookup table, with one entry with key problem.INITIAL and value node while not IS-EMPTY(frontier) do node <- POP(frontier) if problem.IS-GOAL(node.STATE) then return node for each child in EXPAND(problem, node) do s <- child.STATE if s is not in reached or child.PATH-COST < reached[s].PATH-COST then reached[s] <- child add child to frontier return failure

function EXPAND(problem, node) yields nodes s <- node.STATE for each action in problem.ACTIONS(s) do s' <- problem.RESULT(s, action) cost <- node.PATH-COST + problem.ACTION-COST(s, action, s') yield NODE(STATE=s', PARENT=node, ACTION=action, PATH-COST=cost)

```

#### 3.3.2 Search data structures
A **node** in the search tree is a concrete data structure containing four distinct fields (p. 75):
- `node.STATE`: The state in the state space to which the node corresponds (p. 75).
- `node.PARENT`: The parent node in the search tree that generated this node (p. 75).
- `node.ACTION`: The action applied to the parent's state to generate this node (p. 75).
- `node.PATH-COST`: The total path cost \\(g(n)\\) from the initial state to this node (p. 75).

The **frontier** stores reached nodes that have not yet been expanded, acting as a boundary separating two regions of the state space graph (p. 74):
- *Interior region:* States that have been expanded (p. 74).
- *Exterior region:* States that have not yet been reached (p. 74).

The frontier is implemented using queues supporting four operations: `Is-Empty(frontier)`, `Pop(frontier)`, `Top(frontier)`, and `Add(node, frontier)` (p. 75).
- **Priority queue:** Pops the node with the minimum cost according to \\(f(n)\\) (used in best-first search) (p. 75).
- **FIFO queue:** First-in-first-out queue popping the oldest generated node (used in breadth-first search) (p. 75).
- **LIFO queue (stack):** Last-in-first-out queue popping the most recently generated node (used in depth-first search) (p. 75).

The **reached** data structure is a lookup table (hash map) mapping state \\(s\\) to its corresponding node, enabling constant-time \\(O(1)\\) duplicate state detection (p. 75).

#### 3.3.3 Redundant paths
A **redundant path** occurs when the search algorithm reaches a state that has already been generated via an alternative path (p. 76).
- **Graph search:** Tracks reached states in the `reached` table to discard redundant paths or update existing entries if a strictly cheaper path is found (p. 76).
- **Tree-like search:** Ignores `reached` states to save memory space, risking exponential repeated work or infinite loops on cyclic graphs (p. 76).
- *Cycle checking:* A middle-ground memory optimization where an algorithm follows parent pointers backward to verify whether a candidate state already exists on its current ancestral path (p. 76).

#### 3.3.4 Measuring problem-solving performance
Search algorithms are evaluated across four fundamental metrics (p. 77–79):
- **Completeness:** Is the algorithm guaranteed to find a solution when one exists, and correctly report failure when no solution exists? (p. 77).
- **Cost optimality:** Does the algorithm return a solution path with the lowest possible path cost \\(C^*\\) among all valid solutions? (p. 77).
- **Time complexity:** How long (or how many generated/expanded nodes) does it take to find a solution? (p. 77).
- **Space complexity:** How much memory is required to maintain the frontier and reached data structures during search? (p. 77).

Complexity formulas rely on five key problem parameters (p. 77–79):
- \\(b\\): **Branching factor**, the maximum or average number of successors for any node (p. 78).
- \\(d\\): **Depth of shallowest goal**, the depth of the shallowest goal node in the search tree (p. 78).
- \\(m\\): **Maximum depth**, the maximum path length of any state in the state space (p. 78).
- \\(C^*\\): **Cost of optimal solution**, the numeric cost of the cheapest solution path (p. 79).
- \\(\epsilon\\): **Step cost lower bound**, a strictly positive lower bound on action costs (\\(\epsilon > 0\\)) (p. 79).

### 3.4.1 Breadth-first search
**Breadth-first search** expands the shallowest unexpanded node first, proceeding level by level through the search tree (p. 79). While it can be implemented as Best-First Search with \\(f(n) = \text{depth}(n)\\), two efficiency modifications yield a faster algorithm (p. 79–80):
1. Replacing the priority queue with a simple FIFO queue (p. 79).
2. Using a set for `reached` rather than a node-mapping lookup table, enabling an ==early goal test== that evaluates whether a node satisfies the goal condition as soon as it is generated in `EXPAND` rather than waiting until it is popped from the frontier (p. 79–80).

```

function BREADTH-FIRST-SEARCH(problem) returns a solution node or failure node <- NODE(problem.INITIAL) if problem.IS-GOAL(node.STATE) then return node frontier <- a FIFO queue, with node as an element reached <- {problem.INITIAL} while not IS-EMPTY(frontier) do node <- POP(frontier) for each child in EXPAND(problem, node) do s <- child.STATE if problem.IS-GOAL(s) then return child if s is not in reached then add s to reached add child to frontier return failure

```

#### Performance Analysis of Breadth-First Search
- **Completeness:** Complete on finite and infinite state spaces (provided the branching factor \\(b\\) is finite), because it systematically explores depth 0, depth 1, depth 2, ..., depth \\(d\\) without skipping levels (p. 80).
- **Cost Optimality:** Cost-optimal if and only if all action costs are equal (e.g., unit cost \\(c=1\\)). If action costs vary, BFS finds the solution with the minimum number of actions, which is not necessarily the path with the minimum total cost (p. 80).
- **Time Complexity:** \\(O(b^d)\\). The total number of nodes generated in a uniform tree of depth \\(d\\) is:
  \\[1 + b + b^2 + b^3 + \dots + b^d = O(b^d)\\]
- **Space Complexity:** \\(O(b^d)\\). Every generated node remains stored in either `reached` or `frontier`, making memory usage the main bottleneck (e.g., at \\(b=10\\) and \\(d=10\\), BFS requires 10 terabytes of memory) (p. 80).

### 3.4.2 Dijkstra’s algorithm or uniform-cost search
When actions have differing step costs, **uniform-cost search** (known as **Dijkstra's algorithm** in computer science) expands the node \\(n\\) with the lowest path cost \\(g(n) = \text{node.PATH-COST}\\) (p. 81). While BFS spreads out in waves of uniform depth, uniform-cost search spreads out in concentric waves of uniform path cost (p. 81).

```

function UNIFORM-COST-SEARCH(problem) returns a solution node, or failure return BEST-FIRST-SEARCH(problem, PATH-COST)

```

#### Critical Implementation Rule & Action Cost Constraint
- **Late Goal Test Requirement:** Uniform-cost search MUST apply its goal test when a node is **popped** for expansion, NOT when it is generated (p. 82). Testing goals upon generation could return a suboptimal path if a goal state is generated early via an expensive edge before a cheaper path to that same goal is explored (p. 82).
- **Strictly Positive Action Costs (\\(\epsilon > 0\\)):** Uniform-cost search requires that all action costs be bounded below by a positive constant \\(\epsilon > 0\\) (\\(c(s, a, s') \ge \epsilon > 0\\)) (p. 83). Without this lower bound, the algorithm could get trapped exploring an infinite sequence of zero-cost or infinitesimally small step costs without making progress toward \\(C^*\\) (p. 83).

#### Performance Analysis of Uniform-Cost Search
- **Completeness:** Complete provided all step costs satisfy \\(c(s, a, s') \ge \epsilon > 0\\) (p. 83).
- **Cost Optimality:** Cost-optimal because nodes are popped in strictly non-decreasing order of path cost \\(g(n)\\). When a goal node is popped, all other nodes on the frontier have path costs \\(\ge C^*\\), guaranteeing no cheaper solution exists (p. 83).
- **Time & Space Complexity:** \\(O(b^{1 + \lfloor C^* / \epsilon \rfloor})\\). In the worst case, the algorithm explores all paths with cost \\(\le C^*\\). When all step costs are equal (\\(c = \epsilon\\)), \\(\lfloor C^* / \epsilon \rfloor = d\\), and the complexity becomes \\(O(b^{d+1})\\) due to the late goal test (p. 83).

## Worked Example

End-to-end trace of **Uniform-Cost Search** on Figure 3.10 (getting from Sibiu to Bucharest) (p. 82):

1. **Initial Setup:**
   - Problem: Initial state = `Sibiu`, Goal = `Bucharest`.
   - Initialize: `node` = `Sibiu` (\\(g=0\\)), `frontier` = `[Sibiu: 0]`, `reached` = `{"Sibiu": Sibiu_node}`.

2. **Iteration 1:**
   - Pop `Sibiu` (\\(g=0\\)). Goal test `Is-Goal("Sibiu")` = `False`.
   - Expand `Sibiu`:
     - Child `Rimnicu Vilcea`: \\(g = 0 + 80 = 80\\). Add to `reached` and `frontier`.
     - Child `Fagaras`: \\(g = 0 + 99 = 99\\). Add to `reached` and `frontier`.
   - `frontier` = `[Rimnicu Vilcea: 80, Fagaras: 99]`.

3. **Iteration 2:**
   - Pop `Rimnicu Vilcea` (\\(g=80\\)). Goal test `Is-Goal("Rimnicu Vilcea")` = `False`.
   - Expand `Rimnicu Vilcea`:
     - Child `Pitesti`: \\(g = 80 + 97 = 177\\). Add to `reached` and `frontier`.
   - `frontier` = `[Fagaras: 99, Pitesti: 177]`.

4. **Iteration 3:**
   - Pop `Fagaras` (\\(g=99\\)). Goal test `Is-Goal("Fagaras")` = `False`.
   - Expand `Fagaras`:
     - Child `Bucharest`: \\(g = 99 + 211 = 310\\). Add to `reached` and `frontier`.
   - *Crucial Observation:* `Bucharest` is generated and added to `frontier` with cost 310. Because UCS uses a ==late goal test==, it does NOT return `Bucharest` yet!

5. **Iteration 4:**
   - Pop `Pitesti` (\\(g=177\\)). Goal test `Is-Goal("Pitesti")` = `False`.
   - Expand `Pitesti`:
     - Child `Bucharest`: \\(g = 177 + 101 = 278\\).
     - Compare with `reached["Bucharest"]` (cost 310): \\(278 < 310\\). Update `reached["Bucharest"]` to new node (\\(g=278\\)) and re-add/update `Bucharest` on `frontier`.
   - `frontier` = `[Bucharest: 278]`.

6. **Iteration 5:**
   - Pop `Bucharest` (\\(g=278\\)). Goal test `Is-Goal("Bucharest")` = `True`.
   - Return solution path: `Sibiu` \\(\to\\) `Rimnicu Vilcea` \\(\to\\) `Pitesti` \\(\to\\) `Bucharest` with optimal cost \\(C^* = 278\\).

## Connections

- **Lecture 04 (Sep 21, 2026):**
  - *Unified Framework:* Lecture 04 abstracts all search algorithms into a ==single unified framework== `BestFirstSearch(problem, f)` operating on a `PriorityQueue(order=f)` and a `reached` dictionary mapping states to nodes.
  - *Algorithm Derivation:* Lecture 04 derives Breadth-First Search by setting \\(f(n) = 0\\) (making the priority queue act like a FIFO queue) and Depth-First Search by setting \\(f(n) = -n.\text{path\_cost}\\) (making it act like a LIFO stack).
  - *Divergence from Book:* The book presents BFS separately from Best-First Search in Section 3.4.1 to incorporate the early goal test optimization (checking goals during generation) and set-based `reached` tracking, achieving \\(O(b^d)\\) time/space complexity. In contrast, Lecture 04's single-framework derivation with \\(f(n)=0\\) uses a late goal test, resulting in \\(O(b^{d+1})\\) node generations.
- **Textbook:**
  - (pending Chapter 3 — search)

## Open Questions

- [ ] ==Why does applying an early goal test== in uniform-cost search break cost optimality when action costs are non-uniform, whereas it preserves cost optimality in breadth-first search with unit action costs?
- [ ] How does the space complexity of graph-search BFS (\\(O(b^d)\\)) compare to tree-like search BFS on a state space containing high-density redundant cycles?
- [ ] Under what conditions does uniform-cost search exhibit a worst-case time complexity of \\(O(b^{1 + \lfloor C^* / \epsilon \rfloor})\\) that significantly exceeds BFS's \\(O(b^d)\\)?
- [ ] How can cycle-checking along parent pointers reduce memory overhead compared to maintaining a full `reached` lookup table in graph search?

## Flashcards

What are the four components stored within a search tree node data structure?::`node.STATE` (the state), `node.PARENT` (generating node), `node.ACTION` (applied action), and `node.PATH-COST` (\\(g(n)\\), cumulative cost from initial state) (p. 75). #cards/csci4511w

Why does graph search maintain a `reached` table while tree-like search does not?::Graph search tracks reached states in a lookup table to prune redundant paths and cycles, whereas tree-like search omits this table to save memory at the cost of duplicate expansions (p. 76). #cards/csci4511w

What two efficiency enhancements differentiate textbook Breadth-First Search from standard Best-First Search?::Textbook BFS uses a simple FIFO queue instead of a priority queue and performs an early goal test when nodes are generated rather than when popped (p. 79–80). #cards/csci4511w

Why is the early goal test valid for Breadth-First Search with unit action costs?::Because when all action costs are equal, the first time a goal state is generated, it is guaranteed to be on a path with the minimum number of actions (p. 79). #cards/csci4511w

Why must Uniform-Cost Search perform its goal test when a node is popped rather than generated?::Because a goal state might be generated early via a high-cost edge, but popping ensures all cheaper paths on the frontier have already been explored (p. 82). #cards/csci4511w

==Why does Uniform-Cost Search require all step costs to satisfy \\(c(s, a, s') \ge \epsilon > 0\\)?==::To prevent the search from getting trapped in infinite paths of zero-cost or infinitely small step costs that never reach the optimal path cost \\(C^*\\) (p. 83). #cards/csci4511w

What is the worst-case time and space complexity of Uniform-Cost Search?::\\(O(b^{1 + \lfloor C^* / \epsilon \rfloor})\\), where \\(C^*\\) is the optimal solution cost, \\(\epsilon\\) is the step cost lower bound, and \\(b\\) is the branching factor (p. 83). #cards/csci4511w

## Full Reading Notes (continued — ### 3.4.3, ### 3.4.4)

### 3.4.3 Depth-first search and the problem of memory
**Depth-first search** always expands the deepest node in the frontier first (p. 83). While it can be framed as Best-First Search with evaluation function \\(f(n) = -\text{depth}(n)\\) using a LIFO queue (stack) for the frontier, it is usually implemented as a **tree-like search** that does not maintain a lookup table of reached states (p. 83).

#### Algorithm Behavior & Failure Cases
- *Exploration Pattern:* Search proceeds immediately down a single branch to the deepest level of the search tree where nodes have no successors, then "backs up" (backtracks) to the next deepest node with unexpanded successors (p. 83–84).
- *Non-Cost-Optimality:* Depth-first search is not cost-optimal; it returns the first solution path it finds, even if that path is long and expensive while a shallow, cheap solution exists elsewhere in the tree (p. 83–84).
- *Incompleteness:* On state spaces with infinite depth or cyclic paths, tree-like depth-first search can get trapped exploring an infinite non-goal path indefinitely without ever recovering to explore alternative branches (p. 84). On finite state spaces with cycles, it will loop endlessly unless explicit cycle checking is performed (p. 84). Consequently, depth-first search is incomplete (p. 84).

#### Memory Advantage & Backtracking Variant
- *Linear Space Complexity:* For a finite tree with branching factor \\(b\\) and maximum depth \\(m\\), depth-first tree-like search requires only \\(O(bm)\\) space (p. 84). While breadth-first search stores an entire expanding frontier boundary (\\(O(b^d)\\) or \\(O(b^m)\\)), depth-first search stores only a single path from the root to the leaf along with unexpanded sibling nodes at each depth level (p. 84).
- *Time Complexity:* In the worst case, time complexity is \\(O(b^m)\\), as it may explore every state in a tree of depth \\(m\\) before finding a solution or exhausting the space (p. 84).
- **Backtracking search**: A specialized variant of depth-first search used in memory-constrained domains (such as constraint satisfaction and logic programming) that reduces memory usage even further (p. 84–85).
  - Generates only one child node at a time rather than all \\(b\\) successors simultaneously (p. 84).
  - Modifies state representations directly in-place and reverses actions upon backtracking, reducing space requirements to just \\(O(m)\\) state variables and \\(O(1)\\) auxiliary space per level (p. 84–85).

### 3.4.4 Depth-limited and iterative deepening search
To prevent depth-first search from getting trapped along infinite paths, **depth-limited search** imposes a fixed depth limit \\(l\\), treating all nodes at depth \\(l\\) as if they have no successors (p. 85).

```

function DEPTH-LIMITED-SEARCH(problem, l) returns a node or failure or cutoff frontier <- a LIFO queue (stack) with NODE(problem.INITIAL) as an element result <- failure while not IS-EMPTY(frontier) do node <- POP(frontier) if problem.IS-GOAL(node.STATE) then return node if DEPTH(node) > l then result <- cutoff else if not IS-CYCLE(node) do for each child in EXPAND(problem, node) do add child to frontier return result

```

#### Properties of Depth-Limited Search
- *Three Return Values:* Returns a solution `node`, `failure` (the entire state space was exhaustively explored within limit \\(l\\) without finding a solution), or `cutoff` (the depth limit \\(l\\) was reached with unexpanded branches remaining) (p. 85).
- *Complexity:* Time complexity is \\(O(b^l)\\) and space complexity is \\(O(bl)\\) (p. 85).
- *Incompleteness:* If the depth limit \\(l\\) is set smaller than the shallowest goal depth \\(d\\) (\\(l < d\\)), the algorithm fails to find a solution, making it incomplete (p. 85).
- **Diameter**: The maximum shortest path length between any pair of states in a state-space graph (p. 85). On the map of Romania (\\(N=20\\) cities), a naive limit is \\(l=19\\), but the true graph diameter is \\(l=9\\), providing a far more efficient complete depth bound if known in advance (p. 85).

#### Iterative Deepening Search
==Iterative deepening search combines the linear space complexity of depth-first search (\\(O(bd)\\)) with the completeness and cost-optimality of breadth-first search for uniform action costs== (p. 85–86). It solves the problem of choosing an unknown depth limit \\(l\\) by systematically testing all limits (\\(l = 0, 1, 2, 3, \dots\\)) until a solution is found or depth-limited search returns `failure` without a `cutoff` (p. 85–86).

```

function ITERATIVE-DEEPENING-SEARCH(problem) returns a solution node or failure for depth = 0 to ∞ do result <- DEPTH-LIMITED-SEARCH(problem, depth) if result ≠ cutoff then return result

```

#### Re-generation Proof and Complexity Analysis
While iterative deepening regenerates shallow nodes multiple times across iterations, the exponential growth of search trees ensures that bottom-level nodes dominate total time complexity (p. 86).
- *Node Generation Formula:* In an iterative deepening search to depth \\(d\\), nodes at depth \\(d\\) are generated once, nodes at depth \\(d-1\\) are generated twice, and nodes at depth 1 (children of the root) are generated \\(d\\) times (p. 86):
  \\[N(\text{IDDFS}) = (d)b^1 + (d-1)b^2 + (d-2)b^3 + \dots + (1)b^d = O(b^d)\\]
- *Comparison with BFS:* In Breadth-First Search, total node generations are:
  \\[N(\text{BFS}) = b^1 + b^2 + b^3 + \dots + b^d = O(b^d)\\]
  For \\(b = 10\\) and solution depth \\(d = 5\\):
  - \\(N(\text{BFS}) = 10 + 100 + 1,000 + 10,000 + 100,000 = 111,110\\)
  - \\(N(\text{IDDFS}) = 5(10) + 4(100) + 3(1,000) + 2(10,000) + 1(100,000) = 123,450\\)
  Iterative deepening generates only \\(\approx 11\%\\) more nodes than BFS while requiring only kilobytes of memory (\\(O(bd)\\)) instead of gigabytes or terabytes (\\(O(b^d)\\)) (p. 86).
- *Preferred Method:* Iterative deepening is the preferred uninformed search strategy when the state space exceeds available memory and solution depth is unknown (p. 86).

## Worked Example

Trace of **Iterative Deepening Search (IDDFS)** on a uniform binary tree (\\(b=2\\)) where the initial state is \\(A\\) and the goal state \\(G\\) is located at depth \\(d=2\\):

1. **Iteration \\(l = 0\\) (Depth Limit 0):**
   - Call `DEPTH-LIMITED-SEARCH(problem, 0)`.
   - Pop \\(A\\) (depth 0). Goal test `Is-Goal(A)` = `False`.
   - `DEPTH(A) = 0`, but candidate children would be at depth 1 (\\(> l=0\\)). Return `cutoff`.

2. **Iteration \\(l = 1\\) (Depth Limit 1):**
   - Call `DEPTH-LIMITED-SEARCH(problem, 1)`.
   - Pop \\(A\\) (depth 0). Expand to \$B, C\$ (depth 1).
   - Pop \\(C\\) (depth 1). Goal test `Is-Goal(C)` = `False`. Children at depth 2 (\\(> l=1\\)). Trigger `cutoff`.
   - Pop \\(B\\) (depth 1). Goal test `Is-Goal(B)` = `False`. Children at depth 2 (\\(> l=1\\)). Trigger `cutoff`.
   - Return `cutoff`.

3. **Iteration \\(l = 2\\) (Depth Limit 2):**
   - Call `DEPTH-LIMITED-SEARCH(problem, 2)`.
   - Pop \\(A\\) (depth 0). Expand to \$B, C\$ (depth 1).
   - Pop \\(C\\) (depth 1). Expand to \\(F, G\\) (depth 2).
   - Pop \\(G\\) (depth 2). Goal test `Is-Goal(G)` = `True`.
   - Return solution node \\(G\\) with path \\(A \to C \to G\\).

==Iterative deepening regenerates shallow nodes multiple times across iterations, but the exponential growth of the tree ensures that bottom-level nodes generated in the final iteration dominate total time complexity== (p. 86).

## Connections

- **Lecture 05 (Sep 23, 2026):**
  - ==Lecture 05's completed analysis table for uninformed search algorithms matches the textbook's proven theoretical bounds exactly== (p. 87):
    - *BFS:* Complete (Yes, for finite \\(b\\)), Cost-Optimal (Yes, for unit step costs), Time \\(O(b^d)\\), Space \\(O(b^d)\\).
    - *DFS:* Complete (No / Complete only if no cycles and finite state space), Cost-Optimal (No), Time \\(O(b^m)\\), Space \\(O(mb)\\).
    - *DLS:* Complete (No, fails when \\(l < d\\)), Cost-Optimal (No), Time \\(O(b^l)\\), Space \\(O(lb)\\).
    - *IDDFS:* Complete (Yes, for finite \\(b\\) and cycle-checked graphs), Cost-Optimal (Yes, for unit step costs), Time \\(O(b^d)\\), Space \\(O(db)\\).
  - *Algorithm Comparison:* Lecture 05 explicitly headlines IDDFS as "the winner" among uninformed search strategies for large memory-constrained spaces, directly echoing Russell & Norvig's recommendation on p. 86.
- **Textbook:**
  - (pending Chapter 3 — search)

## Open Questions

- [ ] ==Why does iterative deepening depth-first search exhibit an asymptotically identical time complexity to breadth-first search (\\(O(b^d)\\))== despite re-generating upper-level tree nodes on every iteration?
- [ ] In what specific state-space graph structures does a tree-like depth-first search fail due to infinite loops, and how does path cycle-checking restore completeness?
- [ ] How does knowledge of a state-space graph's diameter allow depth-limited search to guarantee completeness without resorting to iterative deepening?
- [ ] Why is backtracking search preferred over standard depth-first search in large-state domains like robotic assembly sequencing?

## Flashcards

Why does depth-first search have a linear space complexity of \\(O(bm)\\) compared to breadth-first search's exponential space complexity of \\(O(b^d)\\)?::Because depth-first search stores only a single path from the root to the current leaf along with unexpanded sibling nodes at each level, rather than storing the entire expanding frontier (p. 84). #cards/csci4511w

Under what conditions is depth-first tree-like search incomplete?::When the state space contains infinite-depth branches or cyclic paths, causing the algorithm to get trapped in an infinite non-goal branch (p. 84). #cards/csci4511w

How does backtracking search achieve an \\(O(m)\\) space complexity?::By generating only one successor node at a time and modifying state representations in-place (undoing actions upon backtracking) rather than allocating memory for all children simultaneously (p. 84–85). #cards/csci4511w

What is the diameter of a state-space graph, and how does it relate to depth-limited search?::The diameter is the maximum shortest path length between any two states; setting the depth limit \\(l\\) equal to the diameter guarantees depth-limited search completeness while minimizing depth (p. 85). #cards/csci4511w

How does Iterative Deepening Search combine the advantages of BFS and DFS?::It retains DFS's modest linear space complexity (\\(O(bd)\\)) while recovering BFS's completeness and cost-optimality for uniform action costs by systematically increasing depth limits (p. 85–86). #cards/csci4511w

==Why is the overhead of re-generating shallow nodes in Iterative Deepening Search computationally negligible in exponential trees?==::Because in exponential trees with branching factor \\(b\\), the vast majority of nodes reside in the deepest level (\\(b^d\\)), making the \\(O(b^d)\\) bottom level dominate total time complexity (p. 86). #cards/csci4511w

How do Breadth-First, Depth-First, Depth-Limited, and Iterative-Deepening Search compare across completeness, cost-optimality, time complexity, and space complexity?::BFS is complete and cost-optimal for unit costs with \\(O(b^d)\\) time and \\(O(b^d)\\) space; DFS is incomplete on infinite/cyclic graphs and not cost-optimal with \\(O(b^m)\\) time and \\(O(bm)\\) space; DLS is incomplete if depth limit \\(l < d\\) and not cost-optimal with \\(O(b^l)\\) time and \\(O(bl)\\) space; IDDFS is complete and cost-optimal for unit costs with \\(O(b^d)\\) time and linear \\(O(bd)\\) space (p. 80–87). #cards/csci4511w

## Full Reading Notes (continued — ### 3.5.1 through ### 3.5.6)

### 3.5.1 Greedy best-first search
**Greedy best-first search** is a form of best-first search that expands the node on the frontier that appears to be closest to the goal, evaluating nodes strictly by their heuristic value (p. 84):
\\[f(n) = h(n)\\]
where \\(h(n)\\) is a **heuristic function** estimating the cost of the cheapest path from the state at node \\(n\\) to a goal state (p. 84).

- *Mechanism:* By choosing the node with the lowest \\(h(n)\\) value, the algorithm tries to make rapid progress toward a goal on each iteration (p. 84). For route-finding, a common heuristic is the **straight-line distance** (\\(h_{\text{SLD}}\\)) between a city and the destination (p. 84).
- *Properties & Limitations:*
  - *Completeness:* Greedy graph search is complete in finite state spaces because `reached` prevents infinite loops, but it is incomplete in infinite state spaces or tree-like searches with cycles (p. 85).
  - *Cost-Optimality:* Not cost-optimal. It is easily misled by local heuristic dips into taking expensive detours (e.g., traveling via Sibiu and Fagaras to Bucharest rather than the cheaper route via Rimnicu Vilcea and Pitesti) (p. 84–85).
  - *Complexity:* Worst-case time and space complexity is \\(O(|V|)\\) for graph search and \\(O(b^m)\\) for tree search, where \\(m\\) is maximum depth (p. 85). However, a well-designed heuristic can dramatically reduce search effort, in some domains approaching \\(O(bm)\\) (p. 85).

### 3.5.2 A* search
**A* search** is the most widely used informed search algorithm, combining uniform-cost search and greedy best-first search (p. 85–86). It evaluates nodes by combining the path cost to reach the node \\(g(n)\\) with the estimated cost to reach the goal \\(h(n)\\) (p. 85–86):
\\[f(n) = g(n) + h(n)\\]
where \\(f(n)\\) represents the estimated total cost of the cheapest solution path passing through node \\(n\\) (p. 86).

#### Conditions for Cost Optimality
==A* search is cost-optimal if the heuristic is admissible for tree search or consistent for graph search== (p. 86–87).

1. **Admissible heuristic**: A heuristic \\(h(n)\\) is admissible if it never overestimates the cost to reach a goal state (i.e., \\(h(n) \le h^*(n)\\) for all \\(n\\), where \\(h^*(n)\\) is the true optimal cost from \\(n\\) to the nearest goal) (p. 86). Admissible heuristics are inherently optimistic (p. 86).
2. **Consistent heuristic** (or **monotonicity**): A heuristic \\(h(n)\\) is consistent if, for every node \\(n\\) and every successor \\(n'\\) generated by action \\(a\\), the heuristic estimate satisfies the **triangle inequality** (p. 87):
\\[h(n) \le c(n, a, n') + h(n')\\]
Every consistent heuristic is admissible, but not every admissible heuristic is consistent (p. 87).

#### Proof of A* Cost Optimality (by Contradiction)
Suppose the optimal solution path has cost \\(C^*\\), but A* returns a suboptimal goal node \\(G_2\\) with cost \\(C > C^*\\) (p. 86–87).
- Because \\(G_2\\) is selected for expansion, its evaluation function satisfies \\(f(G_2) = g(G_2) + h(G_2) = C + 0 = C > C^*\\) (p. 86–87).
- Consider an unexpanded node \\(n\\) located on the true optimal solution path that is currently on the frontier. By definition of path cost, \\(g(n) = g^*(n)\\) (p. 86–87).
- By the admissibility of \\(h\\), we have \\(h(n) \le h^*(n)\\) (p. 86–87).
- Thus, \\(f(n) = g(n) + h(n) \le g^*(n) + h^*(n) = C^*\\) (p. 86–87).
- Combining the inequalities yields \\(f(n) \le C^* < f(G_2)\\) (p. 86–87).
- Therefore, node \\(n\\) on the optimal path has a strictly smaller \\(f\\)-value than \\(G_2\\), meaning A* would expand \\(n\\) before \\(G_2\\) could ever be selected for expansion (p. 86–87). This contradicts the assumption that A* selects \\(G_2\\), proving that A* returns only cost-optimal paths (p. 86–87).

When \\(h(n)\\) is consistent, the values of \\(f(n)\\) along any path are non-decreasing, and the first time a state is expanded, A* has found its optimal path; no state ever needs to be re-added to `frontier` or updated in `reached` (p. 87).

### 3.5.3 Search contours
A* search can be visualized as adding nodes in concentric bands or **contours** of increasing \\(f\\)-cost across the state space (p. 87–88).
- Inside a contour labeled \\(C\\), all nodes satisfy \\(f(n) = g(n) + h(n) \le C\\) (p. 87–88).
- While uniform-cost search forms circular contours expanding equally in all directions, a good heuristic in A* stretches contours toward the goal state, focusing search narrowly around the optimal path (p. 88).
- **Surely expanded nodes**: A* with a consistent heuristic expands every node with \\(f(n) < C^*\\) (p. 88). Nodes on the boundary contour where \\(f(n) = C^*\\) may or may not be expanded before the goal is selected (p. 88).
- **Optimally efficient**: A* with a consistent heuristic is optimally efficient because any algorithm using the same heuristic information must expand at least all surely expanded nodes to guarantee finding an optimal path (p. 88).

### 3.5.4 Satisficing search: Inadmissible heuristics and weighted A*
When finding the absolute optimal path takes too much time or memory, agents can seek **satisficing solutions**—suboptimal paths that are "good enough" (p. 89).

- **Inadmissible heuristic**: A heuristic that may overestimate true costs, risking suboptimality but potentially offering far higher accuracy and speed by expanding fewer nodes (p. 89).
- **Weighted A* search**: Weighs the heuristic estimate more heavily using a weight \\(W > 1\\) (p. 89–90):
\\[f(n) = g(n) + W \times h(n)\\]
  - *Spectrum:* \\(W=0\\) corresponds to Uniform-Cost Search; \\(W=1\\) is standard A*; \\(1 < W < \infty\\) is Weighted A*; \\(W=\infty\\) degenerates to Greedy Best-First Search (p. 90).
  - **Bounded suboptimal search**: Guarantees that the returned solution cost \\(C\\) is bounded within a factor \\(W\\) of the optimal cost: \\(C^* \le C \le W \times C^*\\) (p. 90).
  - **Bounded-cost search**: Finds a solution with cost below a fixed constant \\(C\\) (p. 90).
  - **Unbounded-cost search**: Accepts any solution cost provided it is found quickly (p. 90).
  - **Speedy search**: An unbounded-cost variant of greedy best-first search that uses the estimated number of actions (step count) as its heuristic, ignoring action costs (p. 90).

### 3.5.5 Memory-bounded search
The primary practical bottleneck of A* is space complexity: because all generated nodes are retained in `frontier` and `reached`, A* frequently runs out of memory before running out of time (p. 91).

- **Beam search**: Keeps a fixed limit \\(k\\) of the best nodes on the frontier (or keeps nodes within \\(\delta\\) of the best \\(f\\)-score), discarding all others (p. 91). It is incomplete and suboptimal, but highly memory-efficient (p. 91).
- **Iterative-deepening A* search (IDA*)**: Adapts iterative deepening to heuristic search by using \\(f\\)-cost limits rather than depth limits (p. 91). Each iteration performs a depth-first search expanding nodes with \\(f(n) \le \text{limit}\\); if cutoff occurs, the next limit is set to the minimum \\(f\\)-value of all rejected nodes (p. 91). Space is linear \\(O(bd)\\), but on real-valued costs, every new contour may add only one node, causing exponential iteration overhead (p. 91).
- **Recursive best-first search (RBFS)**: Mimics best-first search in linear space \\(O(bd)\\) using recursion (p. 91–92). It uses a limit variable to track the best alternative \\(f\\)-value available among ancestors (p. 91–92). When unwinding recursion, it replaces each node's \\(f\\)-value with its **backed-up value**—the best \\(f\\)-value among its children—allowing it to remember the quality of forgotten subtrees (p. 92). Suffers from node regeneration thrashing when paths repeatedly trade places as best candidate (p. 92).
- **Memory-bounded A* (MA*)** / **Simplified MA* (SMA*)**: Utilizes all available memory \\(M\\) (p. 92–93). Operates like A* until memory is full, then drops the worst leaf node (highest \\(f\\)-value) and backs up its value to its parent (p. 92–93). SMA* is complete if the shallowest goal depth \\(d \le M\\) (in nodes) and optimal if an optimal solution is reachable (p. 93). On hard problems, it can suffer from **thrashing** by continually dropping and regenerating the same memory-evicted nodes (p. 93).

### 3.5.6 Bidirectional heuristic search
**Bidirectional heuristic search** simultaneously searches forward from the initial state and backward from the goal state using heuristic evaluation functions \\(f_F(n_F)\\) and \\(f_B(n_B)\\) (p. 93–95).
- Rather than individual nodes, pairs of nodes (one from each frontier) are evaluated (p. 94).
- Uses evaluation functions such as \\(f_2(n) = \max(2g(n), g(n) + h(n))\\) or lower bounds on pair cost \\(lb(n_F, n_B) = g_F(n_F) + g_B(n_B) + h(n_F, n_B)\\) to ensure the search "meets in the middle" without expanding nodes beyond \\(C^*/2\\) in path cost (p. 94–95).
- Uses **front-to-end** heuristics (estimating distance to goal/start) or **front-to-front** heuristics (estimating distance to the opposing frontier) (p. 95).
- Complete and cost-optimal with admissible heuristics under the \\(f_2\\) evaluation function (p. 95).

## Worked Example

Comparative step-by-step trace of **Greedy Best-First Search** vs. **A* Search** on Lecture 06's 15-node state space tree (Start = \\(A\\), Goal = \\(L\\)):

```

Tree Topology, Edge Costs c(u,v), and Heuristics h(n): A (h=10) /  
c=2 / \ c=5 B (h=6) C (h=5) / \ /  
c=4 / c=5 \ c=1/ c=2  
D(5) E(5) F(4) G(3) / \ / \ / \ /  
H I J K L M N O (4) (4)(3) (4)(0)(2)(4) (1) [Edge costs: D->H:3, D->I:1, E->J:2, E->K:4, F->L:5, F->M:7, G->N:1, G->O:8]

```

==Greedy search evaluates nodes using f(n) = h(n) while A* evaluates nodes using f(n) = g(n) + h(n)==, leading to distinct frontier orderings and expansion sequences:

| Step | Greedy Best-First Search (\\(f=h\\)) | A* Search (\\(f=g+h\\)) |
| :--- | :--- | :--- |
| **Start** | Pop \\(A(10)\\). Expand \\(A \to B(h=6), C(h=5)\\). | Pop \\(A(f=10)\\). Expand \\(A \to B(g=2,f=8), C(g=5,f=10)\\). |
| **Step 1** | Pop \\(C(h=5)\\). Expand \\(C \to F(h=4), G(h=3)\\). | Pop \\(B(f=8)\\). Expand \\(B \to D(g=6,f=11), E(g=7,f=12)\\). |
| **Step 2** | Pop \\(G(h=3)\\). Expand \\(G \to N(h=4), O(h=1)\\). | Pop \\(C(f=10)\\). Expand \\(C \to F(g=6,f=10), G(g=7,f=10)\\). |
| **Step 3** | Pop \\(O(h=1)\\). Goal test fails (not goal). No children. | Pop \\(F(f=10)\\). Expand \\(F \to L(g=11,f=11), M(g=13,f=15)\\). |
| **Step 4** | Pop \\(F(h=4)\\). Expand \\(F \to L(h=0), M(h=2)\\). | Pop \\(G(f=10)\\). Expand \\(G \to N(g=8,f=12), O(g=15,f=16)\\). |
| **Step 5** | Pop \\(L(h=0)\\). **Goal reached!** Path: \\(A \to C \to F \to L\\), Cost = 11. | Pop \\(D(f=11)\\). Expand \\(D \to H(g=9,f=13), I(g=7,f=11)\\). |
| **Step 6** | — | Pop \\(L(f=11)\\). **Goal reached!** Path: \\(A \to C \to F \to L\\), Cost = 11. |

*Divergence Analysis:*
Greedy best-first is lured into expanding leaf node \\(O\\) because of its deceivingly small heuristic value (\\(h(O)=1\\)). A* avoids this trap because path cost \\(g(O)=15\\) yields \\(f(O)=16\\), deferring \\(O\\) until after the optimal goal \\(L\\) (\\(f(L)=11\\)) is popped.

## Connections

- **Answers to Lecture 06 Open Questions:**
  - *Completeness of A*: ==A* is guaranteed to be complete on both finite and infinite graphs provided step costs satisfy c(s, a, s') >= epsilon > 0 and branching factor b is finite== (p. 86). This ensures no infinite path of zero-cost actions can trap the search, keeping the set of nodes with \\(f(n) \le C^*\\) finite.
  - *Cost Optimality of A*: A* is cost-optimal if \\(h(n)\\) is admissible for tree search or consistent for graph search (p. 86–87). The proof by contradiction shows that if a suboptimal goal \\(G_2\\) (cost \\(C > C^*\\)) were popped, any unexpanded node \\(n\\) on an optimal path would have \\(f(n) \le C^* < f(G_2)\\), forcing A* to expand \\(n\\) before \\(G_2\\) can ever be selected (p. 86–87).
  - *Complexity of A*: Time complexity is worst-case \\(O(b^d)\\) or \\(O(b^m)\\) because heuristic error \\(|h - h^*|\\) can accumulate, yielding exponential growth (p. 88–89). Space complexity is \\(O(b^d)\\) because A* keeps all generated nodes in `frontier` and `reached`, which is its primary practical limitation (p. 89).
- **Textbook:**
  - (pending Chapter 3 — search)

## Open Questions

- [ ] How does the consistency condition (triangle inequality \\(h(n) \le c(n,a,n') + h(n')\\)) guarantee that \\(f(n)\\) is non-decreasing along any path in A* graph search?
- [ ] In what problem domains does Weighted A* with weight \\(W > 1\\) fail to yield significant node-reduction benefits compared to standard A*?
- [ ] ==How does Simplified Memory-Bounded A* (SMA*) manage memory thrashing== when available memory is slightly smaller than the shallowest goal depth?
- [ ] Why does Recursive Best-First Search (RBFS) suffer from excessive node regeneration on problems with complex, continuous-valued heuristic functions?

## Flashcards

What is the fundamental difference in node evaluation between Greedy Best-First Search and A* Search?::Greedy search evaluates nodes strictly by estimated distance to goal (\\(f(n) = h(n)\\)), whereas A* combines path cost and estimated goal cost (\\(f(n) = g(n) + h(n)\\)) (p. 84, 86). #cards/csci4511w

What is an admissible heuristic, and why is it necessary for A* tree search cost-optimality?::An admissible heuristic never overestimates the true cost to reach a goal (\\(h(n) \le h^*(n)\\)), ensuring A* remains optimistic and never overlooks an optimal path (p. 86). #cards/csci4511w

What is the consistency condition for a heuristic function?::A heuristic is consistent if it satisfies the triangle inequality \\(h(n) \le c(n, a, n') + h(n')\\) for every node \\(n\\) and successor \\(n'\\), guaranteeing \\(f(n)\\) is non-decreasing along paths (p. 87). #cards/csci4511w

What guarantee does Weighted A* search provide for solution quality?::Weighted A* with \\(f(n) = g(n) + W \times h(n)\\) for \\(W > 1\\) guarantees bounded suboptimality, returning a solution cost \\(C\\) such that \\(C^* \le C \le W \times C^*\\) (p. 89–90). #cards/csci4511w

How does Recursive Best-First Search (RBFS) operate in linear space?::RBFS uses depth-first recursion with a limit tracking the best alternative ancestor path \\(f\\)-value, replacing nodes with backed-up child values when backtracking (p. 91–92). #cards/csci4511w

==Why is A* graph search guaranteed never to re-open or re-expand a state when using a consistent heuristic?==::Because consistency ensures the first time a state is expanded, it has been reached via an optimal path, making \\(f(n)\\) monotonically non-decreasing (p. 87). #cards/csci4511w

How does Simplified Memory-Bounded A* (SMA*) handle running out of memory?::SMA* drops the worst leaf node with the highest \\(f\\)-value and backs up that \\(f\\)-value to its parent, regenerating the subtree only if all alternative paths look worse (p. 92–93). #cards/csci4511w 

## Examples Worth Keeping
<!-- Keep concrete examples, numbers, cases, or worked reasoning that makes the mechanism memorable. -->
- 
## Connections
<!-- Link the matching lecture/week, course map, and only concept notes that actually exist or were created. -->
- Lecture:
- Concept:
## Flashcards
<!-- Add 3–8 atomic cards testing mechanisms and contrasts to #cards/<course-slug>. -->
