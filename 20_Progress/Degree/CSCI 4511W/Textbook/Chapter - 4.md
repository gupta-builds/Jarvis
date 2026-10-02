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
next: "Connect to Week 5–6 lecture captures once lectures land"
---
# Chapter - 4 — Search in Complex Environments
**Source:** Stuart Russell and Peter Norvig, *Artificial Intelligence: A Modern Approach*, 4th ed. (Pearson, 2020), Chapter 4, pp. 110–134.
**Read from:** `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4511W\CSCI 4511W Textbook.pdf`
**Course role:** Weeks 5–6. Extends search to environments where standard offline search fails: state spaces too large to enumerate (local search), actions with uncertain outcomes (nondeterministic search), and sensors that don't show the full state (partial observability).
## Chapter Summary
==Standard offline search assumes fully observable, deterministic environments; when those assumptions break, agents need local search for optimization, AND-OR contingency plans for nondeterministic actions, or belief-state search for partial observability.==
*Mechanism:* Local search algorithms keep only the current state and its neighborhood in memory, trading completeness and optimality for the ability to search billion-state landscapes via hill climbing, simulated annealing, local beam search, and evolutionary algorithms. For nondeterministic environments, the transition function returns a *set* of possible outcomes; AND-OR search builds conditional plans whose AND nodes require solutions for every possible outcome. For partial observability, agents maintain a belief state — the set of physical states they might currently occupy — and update it online after each action and percept using a predict-then-update cycle.
## Key Concepts
### Local Search and Optimization
- **Local search**: Algorithms that maintain only the current state and move to neighboring states, without retaining a search tree or path history (p. 110).
- **Optimization problem**: Goal is to find the best state according to an objective function, regardless of the path taken (p. 110).
- **Objective function f(s)**: Real-valued function evaluating state quality in an optimization problem (p. 110).
- **State-space landscape**: Topographical mapping of states to objective values, featuring peaks, valleys, ridges, and plateaus (p. 110).
- **Global maximum / Global minimum**: The absolute highest peak or lowest valley in the landscape (p. 111).
- **Complete-state formulation**: Every state contains all problem components (e.g., all 8 queens placed), though some may violate constraints (p. 111).
- **Hill-climbing search**: Moves continually to the highest-valued neighbor until no neighbor is higher. No memory of past states; terminates at local maxima (p. 111).
- **Local maximum**: A peak higher than all neighbors but not the global maximum; hill climbing gets stuck here (p. 113).
- **Ridge**: A sequence of local maxima; available single-move neighbors all lead downhill even though the ridge rises toward a global peak (p. 113).
- **Plateau / Shoulder**: A flat region of equal-valued neighbors. A plateau has no uphill exit; a shoulder does (p. 113).
- **Sideways move**: Moving to a neighbor with equal objective value to escape a plateau or shoulder (p. 113).
- **Stochastic hill climbing**: Selects randomly from uphill moves with probability proportional to steepness (p. 114).
- **First-choice hill climbing**: Generates neighbors randomly until one is better than the current state; useful when the branching factor is large (p. 114).
- **Random-restart hill climbing**: Meta-algorithm running independent hill-climbing searches from random initial states until a goal is found. Complete with probability 1; expected restarts = \\(1/p\\) where \\(p\\) is per-run success probability (p. 114).
- **Simulated annealing**: Combines hill climbing with a random walk by accepting bad moves with probability \\(e^{\Delta E / T}\\), where \\(T\\) is a temperature that decreases over time according to a cooling schedule (p. 115).
- **Cooling schedule**: Time-dependent function \\(T(t)\\) controlling the rate of temperature decrease. A slow-enough schedule guarantees finding the global optimum with probability approaching 1 (p. 115).
- **Local beam search**: Maintains \\(k\\) states simultaneously. At each step, generates all successors of all \\(k\\) states and selects the best \\(k\\) overall. Information flows across threads, unlike parallel random restarts (p. 116).
- **Stochastic beam search**: Selects \\(k\\) successors with probability proportional to objective values, maintaining population diversity and avoiding premature clustering (p. 117).
- **Evolutionary algorithm**: Population-based local search where fitter individuals produce offspring via recombination and mutation (p. 117).
- **Genetic algorithm**: Evolutionary algorithm where individuals are fixed-length strings over a finite alphabet; includes selection, crossover, mutation, and optional elitism (p. 117).
- ==**Fitness function**==: Objective function measuring individual quality in a genetic algorithm; selection probability is proportional to fitness (p. 118).
- **Crossover**: Two parent strings split at a random crossover point and their halves are swapped to produce offspring (p. 118).
- **Mutation**: Each position in an offspring string is independently altered with a small probability (the mutation rate) (p. 118).
- **Elitism**: Preserving the top-scoring individuals unchanged into the next generation, ensuring maximum fitness never decreases (p. 118).
- **Schema**: A string pattern with wildcard positions representing a family of states. Above-average schema instances grow exponentially over generations if not disrupted by crossover (p. 119).
### Continuous Local Search
- **Empirical gradient**: Approximates the gradient by evaluating objective differences at nearby sampled points \\(\pm\delta\\) (p. 122).
- **Gradient ascent step**: \\(\mathbf{x} \leftarrow \mathbf{x} + \alpha \nabla f(\mathbf{x})\\), where \\(\alpha\\) is the step size (p. 122).
- **Line search**: Repeatedly doubles \\(\alpha\\) along the gradient direction until \\(f\\) begins to decrease; uses the peak as the new state (p. 122).
- **Newton-Raphson method**: Second-order optimization using the Hessian \\(\mathbf{H}_f\\): \\(\mathbf{x} \leftarrow \mathbf{x} - \mathbf{H}_f^{-1}(\mathbf{x}) \nabla f(\mathbf{x})\\). Fits a local quadratic surface and jumps directly to its minimum. \\(O(n^3)\\) cost to invert the \\(n \times n\\) Hessian (p. 122).
- **Constrained optimization**: Maximize or minimize an objective subject to hard inequality or equality constraints (p. 123).
- **Linear programming**: Constrained optimization with linear constraints (forming a convex feasible region) and a linear objective; solvable in polynomial time (p. 123).
- **Convex optimization**: Optimizes a convex function over a convex region. Any local minimum is a global minimum — gradient methods cannot get stuck (p. 123).
### Nondeterministic and Partially Observable Search
- **Nondeterministic action**: An action with more than one possible outcome state (p. 122).
- **RESULTS(s, a)**: Set-valued transition function returning all possible outcome states for action \\(a\\) in state \\(s\\) (p. 123).
- **Conditional plan / contingency plan**: A plan containing if-then-else branches, chosen based on runtime observations; needed when single action sequences cannot guarantee reaching a goal under nondeterminism (p. 123).
- **AND-OR search tree**: Search structure for nondeterministic problems. OR nodes are agent choices (one action is selected); AND nodes are environment outcomes (all outcomes must be solved) (p. 123–124).
- **OR node**: An agent decision point; the agent selects exactly one action to pursue (p. 123).
- **AND node**: An environment outcome point; the plan must provide a solution for *every* possible outcome (p. 123).
- **Cyclic solution**: A plan containing loops for environments where an action may fail and must be retried. Valid if every leaf is a goal and every node can reach a goal leaf (p. 125–126).
- **Sensorless problem / conformant problem**: The agent has no sensors; it searches over belief states to find an action sequence that reaches the goal from any possible initial state (p. 126–127).
- **Belief state**: The set of physical states the agent believes it might currently occupy (p. 127).
- **Coercion**: Using a deterministic action sequence to force the world into a known target state regardless of initial physical state, without any sensing (p. 127).
- **Predict stage**: Computes the predicted belief state \\(\hat{b}\\) after executing action \\(a\\): \\(\hat{b} = \bigcup_{s \in b} \text{RESULTS}(s, a)\\) (p. 129).
- **Update stage**: Filters the predicted belief state to states consistent with received observation \\(o\\): \\(b_o = \{s : \text{PERCEPT}(s) = o, s \in \hat{b}\}\\) (p. 129).
- **Monitoring / filtering / state estimation**: The online process of maintaining the current belief state as actions are executed and percepts arrive (p. 132).
- **Recursive state estimator**: \\(b' = \text{UPDATE}(\text{PREDICT}(b, a), o)\\); updates belief state using only the current belief state, last action, and new percept — no history required (p. 131–132).
- **Localization**: Robot problem of determining current position; belief state starts as all map locations and collapses as percepts arrive (p. 132–133).
## Full Reading Notes
### 4.1.1 Hill-Climbing Search
Hill climbing keeps a single current state and moves to the neighbor with the highest objective value (steepest ascent), stopping when no neighbor is better (p. 111).

```
function HILL-CLIMBING(problem) returns a local maximum state
  current <- problem.INITIAL
  while true do
    neighbor <- highest-valued successor of current
    if VALUE(neighbor) <= VALUE(current) then return current
    current <- neighbor
```

Uses a **complete-state formulation**: every state places all 8 queens on the board (one per column), and the objective \\(h\\) = number of attacking pairs (goal: \\(h = 0\\)). Each state has \\(8 \times 7 = 56\\) successors (p. 111).

**Failure modes (p. 113):**
1. **Local maximum**: Every neighbor has worse \\(h\\). No escape without restarting.
2. **Ridge**: Ridge rises toward the global peak but each single-column move goes downhill.
3. **Plateau**: All neighbors equal. A shoulder has an uphill exit; a flat maximum does not.

**Empirical results on 8-queens (p. 113–114):**
- Steepest-ascent without sideways moves: 86% failure rate, 14% success (avg. 4 steps when successful, 3 steps when stuck).
- Allowing up to 100 sideways moves: 94% success (avg. 21 steps success, 64 steps failure).
- **Random-restart**: With \\(p \approx 0.14\\), expected restarts = \\(1/0.14 \approx 7\\), total ≈ 22 steps. With sideways moves (\\(p \approx 0.94\\)), expected restarts ≈ 1.06, total ≈ 25 steps.
### 4.1.2 Simulated Annealing
Simulated annealing escapes local maxima by accepting bad moves with decreasing probability (p. 115). Inspired by the physical process of cooling molten metal into low-energy crystal states.

```
function SIMULATED-ANNEALING(problem, schedule) returns a solution state
  current <- problem.INITIAL
  for t = 1 to ∞ do
    T <- schedule(t)
    if T = 0 then return current
    next <- a randomly selected successor of current
    ΔE <- VALUE(next) - VALUE(current)
    if ΔE > 0 then current <- next
    else current <- next with probability e^(ΔE / T)
```

Acceptance probability \\(P = e^{\Delta E / T}\\) for bad moves (\\(\Delta E < 0\\)):
- As \\(|\Delta E|\\) grows, probability drops (worse moves are less likely to be accepted).
- As \\(T \to 0\\), bad moves become vanishingly unlikely.
- If \\(T(t)\\) decreases slowly enough (Boltzmann schedule), the algorithm finds the global optimum with probability approaching 1 (p. 115).
### 4.1.3 Local Beam Search
Local beam search maintains \\(k\\) states rather than one (p. 116).
1. Start with \\(k\\) randomly generated states.
2. Generate all successors of all \\(k\\) states.
3. If any successor is a goal, halt.
4. Otherwise, select the best \\(k\\) successors from the combined pool and repeat.

The key advantage over \\(k\\) independent restarts: states with good successors recruit other states' search effort — information flows across threads. The risk: \\(k\\) states can cluster in one region (lack of diversity). **Stochastic beam search** fixes this by selecting \\(k\\) successors proportionally to fitness, analogous to natural selection (p. 117).
### 4.1.4 Evolutionary Algorithms
Evolutionary algorithms treat local beam search as a population of individuals and add **recombination** as a source of new variations (p. 117).

**Genetic algorithm components (p. 117–119):**
1. **Population**: \\(k\\) individuals, each a string over a finite alphabet.
2. **Fitness function**: Evaluates individual quality; selection probability proportional to fitness.
3. **Selection**: Parents chosen proportionally to fitness (roulette-wheel) or via tournament selection.
4. **Crossover**: Two parents split at a random crossover point; halves swapped to produce two children.
5. **Mutation**: Each offspring position independently altered with the mutation rate.
6. **Elitism/culling**: Top individuals survive unchanged; below-threshold individuals are discarded.

```
function GENETIC-ALGORITHM(population, fitness) returns an individual
  repeat
    weights <- WEIGHTED-BY(population, fitness)
    population2 <- empty list
    for i = 1 to SIZE(population) do
      parent1, parent2 <- WEIGHTED-RANDOM-CHOICES(population, weights, 2)
      child <- REPRODUCE(parent1, parent2)
      if (small random probability) then child <- MUTATE(child)
      add child to population2
    population <- population2
  until some individual is fit enough, or time elapsed
  return best individual in population

function REPRODUCE(parent1, parent2) returns an individual
  c <- random position in parent
  return APPEND(parent1[1..c], parent2[c+1..n])
```

**Schema theory (p. 119):** A **schema** is a string pattern with wildcard positions (e.g., `246*****`). If instances of a schema have above-average fitness, the number of schema instances grows exponentially across generations, provided crossover does not break them up. This explains why GAs work well when good partial solutions ("building blocks") can combine without destructive interference.
### 4.2 Local Search in Continuous Spaces
Continuous action spaces have infinite branching, so discrete neighbor enumeration is infeasible (p. 121).

**Gradient ascent** uses calculus instead of enumeration (p. 122):
\\[\mathbf{x} \leftarrow \mathbf{x} + \alpha \nabla f(\mathbf{x})\\]
- If \\(\alpha\\) is too small: slow convergence. If too large: overshoots.
- **Line search** overcomes step-size choice by doubling \\(\alpha\\) until \\(f\\) decreases, using the peak as the new state.

**Newton-Raphson method (p. 122):** To find where \\(\nabla f(\mathbf{x}) = \mathbf{0}\\), apply:
\\[\mathbf{x} \leftarrow \mathbf{x} - \mathbf{H}_f^{-1}(\mathbf{x}) \nabla f(\mathbf{x})\\]
where \\(\mathbf{H}_f\\) is the Hessian matrix of second partial derivatives. This fits a local quadratic surface and jumps to its minimum in one step. However, inverting the \\(n \times n\\) Hessian costs \\(O(n^3)\\) — prohibitive for high-dimensional problems.

**Constrained optimization (p. 123):**
- **Linear programming**: Linear constraints + linear objective → convex feasible region; polynomial-time solvable.
- **Convex optimization**: Convex objective on a convex region; every local minimum is global — local search methods find the global optimum.
### 4.3.1 The Erratic Vacuum World
When actions are nondeterministic, single action sequences cannot guarantee reaching the goal (p. 122). In the **erratic vacuum world**, `Suck` in a dirty square sometimes also cleans an adjacent square; in a clean square, it sometimes deposits dirt (p. 122–123).

The transition function becomes set-valued: \\(\text{RESULTS}(s, a)\\) returns all possible outcomes. For state 1 ([A dirty, B dirty]):
\\[\text{RESULTS}(1, Suck) = \{5, 7\}\\]
where state 5 = [A clean, B dirty] and state 7 = [A clean, B clean].

Because the outcome is unknown, the solution must be a **conditional plan** that branches based on what actually happens:
\\[[Suck,\ \textbf{if}\ \text{state} = 5\ \textbf{then}\ [Right, Suck]\ \textbf{else}\ []]\\]
This plan covers both outcomes: if the environment lands in state 7, the empty branch applies; if state 5, move and suck again.
### 4.3.2 AND-OR Search Trees
Contingent plans are built by searching an **AND-OR tree** (p. 123–124):
- **OR nodes** represent agent choices: the agent picks one action to pursue.
- **AND nodes** represent environment outcomes: *every* outcome branch must be solved.

A **solution subtree** specifies one action at each OR node, includes all outcome branches at each AND node, and ends in goal nodes at every leaf (p. 124).

```
function AND-OR-SEARCH(problem) returns plan or failure
  return OR-SEARCH(problem, problem.INITIAL, [])

function OR-SEARCH(problem, state, path) returns plan or failure
  if problem.IS-GOAL(state) then return []
  if IS-CYCLE(path) then return failure
  for each action in problem.ACTIONS(state) do
    plan <- AND-SEARCH(problem, RESULTS(state, action), [state] + path)
    if plan ≠ failure then return [action] + plan
  return failure

function AND-SEARCH(problem, states, path) returns plan or failure
  for each s_i in states do
    plan_i <- OR-SEARCH(problem, s_i, path)
    if plan_i = failure then return failure
  return [if s_1 then plan_1 else if s_2 then plan_2 ... else plan_n]
```

Cycle checking in `OR-SEARCH` detects repeated states on the current path and returns `failure` for that branch. This guarantees termination in finite state spaces: every path must eventually hit a goal, a dead end, or a cycle (p. 124–125).
### 4.3.3 Try, Try Again: Cyclic Solutions
In the **slippery vacuum world**, movement can fail: \\(\text{RESULTS}(1, Right) = \{1, 2\}\\). Because failure can repeat, no acyclic solution exists (p. 125).

The fix is a **cyclic plan** with a loop:
\\[[Suck,\ \textbf{while}\ \text{state} = 5\ \textbf{do}\ Right,\ Suck]\\]

A cyclic plan is valid if: (1) every leaf is a goal state, and (2) from every state in the plan, a goal leaf is reachable. If action failures occur independently at random, repeating the action enough times guarantees eventual success with probability 1 (p. 125–126).
### 4.4.1 Searching with No Observation: Sensorless Problems
A **sensorless** (conformant) agent has no sensors and searches over **belief states** — sets of possible physical states — rather than individual states (p. 126–127).

For an underlying problem \\(P\\) with \\(N\\) physical states, the belief-state space contains \\(2^N\\) possible belief states.

**Conformant search formulation (p. 127–128):**
- **States**: Subsets of physical states (size \\(2^N\\)).
- **Initial state**: The full set of all physical states (complete ignorance).
- **Actions**: \\(\text{ACTIONS}(b) = \bigcup_{s \in b} \text{ACTIONS}_P(s)\\).
- **Transition**: \\(b' = \{s' : s' = \text{RESULT}_P(s, a),\ s \in b\}\\) for deterministic actions.
- **Goal test**: Every physical state in \\(b\\) satisfies the original goal.

**Coercion**: By executing a carefully chosen action sequence, a sensorless agent can force the belief state to collapse to a single goal state regardless of which physical state it started in (p. 127). In the deterministic vacuum world: `[Right, Suck, Left, Suck]` coerces the world to a fully clean state from any of the 8 possible initial states.

**Pruning rule**: If \\(b_1 \subseteq b_2\\), any plan solving \\(b_2\\) also solves \\(b_1\\), so the larger belief state \\(b_2\\) can be pruned (p. 128).
### 4.4.2 Searching in Partially Observable Environments
With sensors, the agent knows its percept but not necessarily its physical state. The problem specification gains a `PERCEPT(s)` function (p. 128–129).

Belief-state transitions proceed in three stages (p. 129):
1. **Predict**: \\(\hat{b} = \text{PREDICT}(b, a) = \bigcup_{s \in b} \text{RESULTS}_P(s, a)\\)
2. **Possible percepts**: \\(\{o : o = \text{PERCEPT}(s),\ s \in \hat{b}\}\\)
3. **Update**: \\(b_o = \{s : \text{PERCEPT}(s) = o,\ s \in \hat{b}\}\\)

Combining all three:
\\[\text{RESULTS}(b, a) = \{b_o : b_o = \text{UPDATE}(\text{PREDICT}(b, a), o),\ o \in \text{POSSIBLE-PERCEPTS}(\text{PREDICT}(b, a))\}\\]

Nondeterministic actions *expand* the belief state (predict stage); observations *shrink* it (update stage) (p. 129).
### 4.4.3 Solving Partially Observable Problems
By supplying the belief-state transition model \\(\text{RESULTS}(b, a)\\) to `AND-OR-SEARCH`, the agent directly solves partially observable problems (p. 130).

The search now operates over belief states. AND nodes correspond to different possible percepts (rather than different physical outcomes). For example, in the local-sensing vacuum world with initial percept [L, Dirty] (L = Left; belief state \\(\{1, 3\}\\)):
\\[[Suck,\ Right,\ \textbf{if}\ Bstate = \{6\}\ \textbf{then}\ Suck\ \textbf{else}\ []]\\]
The conditional tests the *belief state* at runtime, not the unobservable physical state (p. 130).
### 4.4.4 An Agent for Partially Observable Environments
In execution, the agent maintains its belief state online as percepts arrive (p. 131–132). This is called **monitoring**, **filtering**, or **state estimation**.

Given current belief state \\(b\\), executed action \\(a\\), and received percept \\(o\\), the **recursive state estimator** computes the new belief state:
\\[b' = \text{UPDATE}(\text{PREDICT}(b, a), o)\\]

No history of past percepts is needed — the current belief state summarizes all relevant past information.

**Robot localization example (Figure 4.18, p. 132–133):** A robot with a map uses 4-bit sonar readings \\([N, E, S, W]\\) where 1 = obstacle:
1. Initial belief state: all map locations (complete ignorance).
2. Percept \\(E_1 = 1011\\) → `UPDATE` narrows to 4 candidate locations.
3. Move Right → `PREDICT` expands belief state to adjacent locations.
4. Percept \\(E_2 = 1010\\) → `UPDATE` collapses belief state to a *single unique location*.

This is the predict-update cycle running in real time, not as a planning step.
## Worked Example
### I. 8-Queens Genetic Algorithm Trace (Figure 4.6, p. 118)
State representation: 8-digit string, \\(c\\)th digit = row of queen in column \\(c\\). Fitness = non-attacking pairs (max = 28).

**Initial population and selection probabilities:**

| String | Fitness | P(select) |
|---|---|---|
| `24748552` | 24 | 24/78 ≈ 31% |
| `32752411` | 23 | 23/78 ≈ 29% |
| `24415124` | 20 | 20/78 ≈ 26% |
| `32543213` | 11 | 11/78 ≈ 14% |

**Crossover (crossover point after position \\(c\\)):**
- Pair 1 (`32752411`, `24748552`), \\(c=3\\): Child 1 = `327`+`48552` = `32748552`; Child 2 = `247`+`52411` = `24752411`
- Pair 2 (`32752411`, `24415124`), \\(c=5\\): Child 3 = `32752`+`124` = `32752124`; Child 4 = `24415`+`411` = `24415411`

**Mutation (small random probability per digit):**
- Child 1: position 6 mutates 5→1 → `32748152`
- Child 2: no mutation → `24752411`
- Child 3: position 3 mutates 7→2 → `32252124`
- Child 4: position 8 mutates 1→7 → `24415417`

The key observation: even Child 4 (`24415417`), produced from parents of fitness 23 and 20, has inherited partial solutions from both. Crossover at the right position can combine two good partial configurations faster than any hill-climbing variant could find them from scratch.
### II. Erratic Vacuum World AND-OR Search Trace (Figure 4.10, p. 123–124)
Start: state 1 = [A dirty, B dirty]. Goal: all squares clean.

```
OR node — State 1:
  Agent tries action Suck
  → AND node: RESULTS(1, Suck) = {5, 7}
      Branch 1 — State 7 = [A clean, B clean]: IS-GOAL = True → []
      Branch 2 — State 5 = [A clean, B dirty]:
        OR node — State 5:
          Action Suck → RESULTS(5, Suck) = {5, 1}
            State 5 on current path → IS-CYCLE → failure
            State 1 on current path → IS-CYCLE → failure
          Action Right → RESULTS(5, Right) = {6}
            OR node — State 6 = [B, A dirty]:
              Action Suck → RESULTS(6, Suck) = {8}
                State 8 = [B clean, A clean]: IS-GOAL = True → []
              ← plan: [Suck]
            ← plan: [Right, Suck]
          ← plan for State 5: [Right, Suck]
      ← AND plan: if state=5 then [Right, Suck] else []
  ← solution: [Suck, if state=5 then [Right, Suck] else []]
```

Key insight: at the AND node for `Suck` in state 1, *both* outcome branches must be solved. The plan for branch 7 is trivially the empty plan; the plan for branch 5 requires two more actions. The final conditional plan is assembled by the `AND-SEARCH` function combining both branch plans.
## Connections
- **Week 5 (10/5, 10/7):** §4.1.1–4.2 (local search and optimization). Lecture coverage pending — re-run this note once Week 5 lectures land.
- **Week 6 (10/12):** §4.3–4.4 (nondeterministic and partially observable search). Lecture coverage pending.
- ==AND-OR search over physical states under nondeterminism directly generalizes to belief-state search under partial observability==: AND branches that represent environment action outcomes (§4.3) become AND branches representing possible percept observations (§4.4) (p. 123–131).
- **Textbook continuation:** [[20_Progress/Degree/CSCI 4511W/Textbook/Textbook Map|Textbook Map]] — Chapter 5 covers adversarial search.
## Open Questions
- [ ] How does simulated annealing's acceptance probability \\(e^{\Delta E / T}\\) guarantee convergence to a global optimum as \\(T \to 0\\), and why do steep cooling schedules cause the algorithm to get trapped in local extrema?
- [ ] In what landscape structures does local beam search degrade into \\(k\\) parallel slow hill climbs, and how does stochastic beam search prevent this collapse?
- [ ] Why does the size of the reachable belief-state space grow as \\(2^N\\) for \\(N\\) physical states, and how do subset/superset pruning techniques reduce this during conformant search?
- [ ] How does cycle checking along parent pointers in `AND-OR-SEARCH` guarantee termination in finite state spaces without cutting off valid non-cyclic solutions?
- [ ] In what ways does sensorless coercion allow an agent to guarantee reaching a goal state without receiving any perceptual feedback?
- [ ] How does a recursive state estimator update its belief state in real time using only the current belief state and the most recent action-percept pair, with no stored history?
## Flashcards
How does steepest-ascent hill climbing differ from first-choice hill climbing?::Steepest-ascent evaluates all neighbors to pick the best; first-choice generates neighbors randomly and accepts the first that improves on the current state — useful when branching factor is large (p. 111, 114). #cards/ai
What is the mathematical condition for accepting a bad move in simulated annealing, and what two factors affect it?::A bad move (\\(\Delta E < 0\\)) is accepted with probability \\(e^{\Delta E / T}\\); probability drops as badness \\(|\Delta E|\\) increases and as temperature \\(T\\) decreases (p. 115). #cards/ai
Why is local beam search more effective than \\(k\\) independent random restarts?::Local beam search selects the best \\(k\\) successors from the combined pool of all \\(k\\) states' successors, so promising threads recruit search effort away from dead ends; independent restarts share no information (p. 116). #cards/ai
What is the difference between an OR node and an AND node in an AND-OR search tree?::An OR node represents the agent's choice of one action; an AND node represents the environment's nondeterministic outcomes — the plan must solve *every* branch at an AND node (p. 123–124). #cards/ai
Why is the solution to a sensorless conformant problem an action sequence rather than a conditional plan?::The agent receives no observations at runtime, so it cannot branch on percepts; the solution must work regardless of which physical state the agent actually started in (p. 126–127). #cards/ai
How does coercion allow a sensorless agent to solve a problem from an unknown initial state?::A carefully chosen action sequence forces the belief state to collapse to a single goal state by taking actions whose effects are useful in all possible physical starting states (p. 127). #cards/ai
What three stages comprise a belief-state transition in a partially observable environment?::Predict computes the belief state after action \\(a\\); possible-percepts enumerates candidate observations; update filters the predicted belief state to states consistent with the received observation (p. 128–129). #cards/ai
How does a recursive state estimator compute \\(b'\\) without examining past percept history?::It applies \\(b' = \text{UPDATE}(\text{PREDICT}(b, a), o)\\) using only the current belief state \\(b\\), the last action \\(a\\), and the new percept \\(o\\) — the current belief state summarizes all relevant history (p. 131–132). #cards/ai
==Why does belief-state search treat observations as AND-node branches during contingent planning?==::At planning time the agent does not know which percept will be received, so the plan must handle every possible observation — each one becomes a branch at an AND node (p. 130–131). #cards/ai
What structural advantage does convex optimization have over general local search?::A convex objective on a convex feasible region guarantees that any local minimum is also the global minimum, so gradient descent methods cannot get trapped (p. 123). #cards/ai
