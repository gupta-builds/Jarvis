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

## Examples Worth Keeping
<!-- Keep concrete examples, numbers, cases, or worked reasoning that makes the mechanism memorable. -->
- 
## Connections
<!-- Link the matching lecture/week, course map, and only concept notes that actually exist or were created. -->
- Lecture:
- Concept:
## Flashcards
<!-- Add 3–8 atomic cards testing mechanisms and contrasts to #cards/<course-slug>. -->
