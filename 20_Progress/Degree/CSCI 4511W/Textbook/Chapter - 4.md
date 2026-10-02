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
# Chapter - 4
## Chapter Summary
<!-- State the chapter's one-sentence claim and use exactly one ==highlight== anchor. -->
== ==
*Mechanism:*
<!-- Explain how the chapter's claim works. -->
# Chapter - 4 — Search in Complex Environments (Part 1 of 2: Local Search & Optimization)

## Chapter Summary
Local search algorithms evaluate and modify one or more current states using objective functions rather than maintaining search trees, trading path-tracking memory for the ability to find optimal or near-optimal solutions in vast state spaces (p. 110–111).
*Mechanism:* By operating on complete-state formulations, local search algorithms navigate a state-space landscape using local gradient or objective evaluations—employing strategies like steepest-ascent hill climbing, stochastic temperature-controlled state acceptance in simulated annealing, multi-state parallel information sharing in local beam search, or population-based crossover and mutation in genetic algorithms—and can be extended to continuous domains via gradient calculus, line search, and Newton-Raphson optimization under optional convex or linear constraints [8, 31, 36, 44, 50, 54, 58, 62, ==167==] (p. 111–124).

## Key Concepts
- **Local search**: Algorithms that operate using only the current state(s) and move to neighboring states without retaining search trees or path histories (p. 110).
- **Optimization problem**: A problem where the objective is to find the best state according to an objective function, regardless of the path taken (p. 110).
- **Objective function**: A real-valued function \\(f(s)\\) evaluating the quality or fitness of a state \\(s\\) in an optimization problem (p. 110).
- **State-space landscape**: A topographical mapping of states to their objective function values, characterized by peaks, valleys, ridges, and plateaus (p. 110).
- **Global maximum**: The highest peak in a state-space landscape corresponding to the state with the absolute highest objective function score (p. 111).
- **Global minimum**: The lowest valley in a state-space landscape corresponding to the state with the absolute lowest cost (p. 111).
- **Hill-climbing search**: A local search algorithm that continually moves in the direction of increasing objective value (steepest ascent) until no neighbor is higher (p. 111).
- **Complete-state formulation**: A problem representation where every state contains all problem components, though some may violate constraints (p. 111).
- **Local maximum**: A peak in the state-space landscape higher than all its neighboring states but lower than the global maximum (p. 113).
- **Ridge**: A sequence of local maxima joined together in a landscape where available single-action moves lead downhill off the ridge (p. 113).
- **Plateau**: A flat region of the state-space landscape where neighboring states have identical objective function values (p. 113).
- **Shoulder**: A flat region of a state-space landscape from which an uphill exit exists (p. 113).
- **Sideways move**: An action that transitions to a neighboring state with an equal objective value to navigate plateaus and shoulders (p. 113).
- **Stochastic hill climbing**: A variant of hill climbing that selects randomly from among uphill moves, with probabilities proportional to steepness (p. 114).
- **First-choice hill climbing**: A stochastic hill-climbing variant that generates successors randomly until one is found that is better than the current state (p. 114).
- **Random-restart hill climbing**: A meta-algorithm that conducts a series of independent hill-climbing searches from randomly generated initial states until a goal is found (p. 114).
- **Simulated annealing**: A local search algorithm combining hill climbing with a random walk, accepting downhill moves with a probability \\(e^{-\Delta E / T}\\) that decays with temperature \\(T\\) (p. 115).
- **Cooling schedule**: A time-dependent function \\(T(t)\\) controlling the rate at which temperature decreases toward zero in simulated annealing (p. 115).
- **Local beam search**: A local search algorithm that maintains \\(k\\) states, generating all successors of all \\(k\\) states and selecting the best \\(k\\) successors at each step (p. 116).
- **Stochastic beam search**: A variant of local beam search that selects \\(k\\) successors with probability proportional to their objective values, maintaining population diversity (p. 117).
- **Evolutionary algorithm**: A population-based local search method inspired by natural selection where fitter states produce offspring via recombination and mutation (p. 117).
- **Genetic algorithm**: An evolutionary algorithm where states are represented as fixed-length strings over a finite alphabet (p. 117).
- ==**Fitness function**==: A real-valued objective function \\(f(s)\\) measuring the quality or reproductive suitability of an individual in a genetic algorithm (p. 118).
- **Recombination**: The process of combining parts of two or more parent state representations to form child offspring (p. 117).
- **Crossover point**: A randomly selected position in parent strings where representations are split and swapped to produce offspring (p. 118).
- **Mutation rate**: The independent probability with which each component or bit of a newly generated offspring string is randomly altered (p. 118).
- **Elitism**: The practice of automatically preserving a small number of the highest-fitness individuals unchanged into the next generation (p. 118).
- **Culling**: The practice of discarding all population individuals whose fitness falls below a fixed threshold (p. 118).
- **Schema**: A substring pattern with wildcard asterisks representing a subset of states sharing specific component values (p. 119).
- **Empirical gradient**: An approximation of a continuous objective function's gradient computed by evaluating fitness differences between nearby sampled points (p. 121).
- **Step size**: A scalar parameter \\(\alpha\\) determining the distance moved along the gradient vector in continuous local search (p. 122).
- **Line search**: An optimization technique that extends search along a gradient direction by repeatedly doubling \\(\alpha\\) until the objective value decreases (p. 122).
- **Newton-Raphson method**: A second-order continuous optimization technique using the inverse Hessian matrix \\(\mathbf{H}_f^{-1}\\) to fit quadratic surfaces and step directly to local extrema (p. 122).
- **Hessian matrix**: A matrix \\(\mathbf{H}_f\\) containing all second-order partial derivatives \\(\frac{\partial^2 f}{\partial x_i \partial x_j}\\) of a continuous objective function (p. 122).
- **Constrained optimization**: The problem of maximizing or minimizing an objective function subject to hard inequality or equality constraints on variables (p. 123).
- **Linear programming**: A constrained optimization problem with linear constraints forming a convex set and a linear objective function, solvable in polynomial time (p. 123).
- **Convex set**: A set of points \\(S\\) where the line segment joining any two points in \\(S\\) lies entirely within \\(S\\) (p. 123).
- **Convex optimization**: An optimization problem over a convex constraint set with a convex objective function, guaranteeing that any local minimum is a global minimum (p. 123).

## Full Reading Notes

### 4.1.1 Hill-climbing search
The **hill-climbing search** algorithm (Figure 4.2) keeps track of a single current state and continually moves to the neighboring state with the highest value—heading in the direction of steepest ascent (p. 111). It terminates when it reaches a peak where no neighbor has a higher value (p. 111). It uses no memory of past states and does not look ahead beyond immediate neighbors (p. 111).

```

function HILL-CLIMBING(problem) returns a state that is a local maximum current <- problem.INITIAL while true do neighbor <- a highest-valued successor state of current if VALUE(neighbor) <= VALUE(current) then return current current <- neighbor

```

Hill climbing uses a **complete-state formulation** where every state has all problem components present (e.g., 8 queens on an \\(8 \times 8\\) board, one per column), and successors are generated by modifying one component (e.g., moving a single queen to another square in its column, yielding \\(8 \times 7 = 56\\) successors) (p. 111). The objective function \\(h\\) is defined as the number of attacking pairs of queens (where \\(h=0\\) for a solution) (p. 111).

#### Failure Modes of Hill-Climbing Search
1. **Local Maxima:** A peak higher than all neighboring states but lower than the global maximum (p. 113). The algorithm gets trapped because every move decreases the objective score (p. 113). In 8-queens, an \\(h=1\\) state where every single queen move increases attacking pairs is a local maximum (p. 113).
2. **Ridges:** A sequence of local maxima where available single-component actions point downhill off the ridge, even though the ridge itself rises toward a peak (p. 113). Navigating ridges requires combining multiple actions simultaneously (p. 113).
3. **Plateaus:** A flat area of the landscape where neighboring states have equal objective values (p. 113). It can be a flat local maximum (no uphill exit) or a **shoulder** (from which an uphill exit exists) (p. 113).

#### Empirical Performance & Variants (8-Queens Benchmark)
- *Steepest-Ascent (No Sideways Moves):* On an 8-queens state space of \\(8^8 \approx 17\text{ million}\\) states, steepest ascent gets stuck 86% of the time, solving only 14% of instances (p. 113). When it succeeds, it averages 4 steps; when stuck, it averages 3 steps (p. 113).
- *Sideways Moves:* Allowing up to 100 consecutive **sideways moves** raises the success rate on 8-queens from 14% to 94% (p. 113–114). Successful runs average 21 steps; failures average 64 steps (p. 114).
- **Stochastic hill climbing**: Selects at random from among uphill moves, with probability proportional to steepness (p. 114).
- **First-choice hill climbing**: Generates successors randomly until one is found that is better than the current state (useful when states have thousands of successors) (p. 114).
- **Random-restart hill climbing**: Conducts a series of independent hill-climbing searches from randomly generated initial states until a goal is found (p. 114).
  - It is complete with probability 1 (p. 114).
  - If each search has success probability \\(p\\), expected restarts = \\(1/p\\) (p. 114).
  - For 8-queens without sideways moves (\\(p \approx 0.14\\)), expected restarts = \\(1/0.14 \approx 7\\), requiring roughly 22 total steps (p. 114).
  - For 8-queens with sideways moves (\\(p \approx 0.94\\)), expected restarts = \\(1/0.94 \approx 1.06\\), requiring roughly 25 total steps (p. 114).

### 4.1.2 Simulated annealing
**Simulated annealing** combines hill climbing with a random walk to yield both efficiency and completeness (p. 115). Derived from metallurgy (cooling molten metal into low-energy crystalline states), it minimizes cost by allowing "bad" (downhill/cost-worsening) moves with a probability that decreases over time (p. 115).

```

function SIMULATED-ANNEALING(problem, schedule) returns a solution state current <- problem.INITIAL for t = 1 to ∞ do T <- schedule(t) if T = 0 then return current next <- a randomly selected successor of current ΔE <- VALUE(current) - VALUE(next) if ΔE > 0 then current <- next else current <- next only with probability e^(ΔE / T)

```

#### Acceptance Probability & Boltzmann Distribution
- If a randomly selected successor improves the objective (\\(\Delta E > 0\\)), it is always accepted (p. 115).
- If the move worsens the objective (\\(\Delta E \le 0\\)), it is accepted with probability:
  \\[P(\text{accept}) = e^{\Delta E / T}\\]
  where \\(\Delta E\\) is negative (measuring evaluation worsening) and \\(T > 0\\) is the current temperature (p. 115).
- *Properties:*
  1. As badness \\(|\Delta E|\\) increases, acceptance probability drops (p. 115).
  2. As temperature \\(T\\) drops toward 0, bad moves become increasingly unlikely (p. 115).
  3. If the **cooling schedule** \\(T(t)\\) lowers \\(T\\) to 0 slowly enough, the algorithm finds a global optimum with probability approaching 1 by the properties of the Boltzmann distribution \\(e^{\Delta E / T}\\) (p. 115).

### 4.1.3 Local beam search
**Local beam search** keeps track of \\(k\\) states rather than just one (p. 116).
- *Algorithm Flow:* Begins with \\(k\\) randomly generated states (p. 116). At each step, all successors of all \\(k\\) states are generated (p. 116). If any successor is a goal, the algorithm halts (p. 116). Otherwise, it selects the \\(k\\) best successors from the complete list and repeats (p. 116).
- *Beam Search vs. Parallel Random Restarts:* Unlike \\(k\\) independent random restarts, local beam search passes information among search threads: states with good successors recruit resources ("come over here, the grass is greener!"), abandoning unpromising paths (p. 116).
- **Stochastic beam search**: Alleviates lack of diversity (where \\(k\\) states cluster in one region) by selecting \\(k\\) successors with probability proportional to their objective values, analogous to natural selection (p. 117).

### 4.1.4 Evolutionary algorithms
**Evolutionary algorithms** are variants of stochastic beam search motivated by natural selection, where a population of individuals (states) produces offspring (successor states) via **recombination** and mutation (p. 117).

#### Genetic Algorithm Components
1. **Population & Representation:** A set of \\(k\\) individuals. In **genetic algorithms**, each individual is a string over a finite alphabet (e.g., Boolean or digit strings) (p. 117). In **evolution strategies**, individuals are real vectors; in **genetic programming**, individuals are executable computer programs (p. 117).
2. **Fitness Function:** Evaluates individual state quality (e.g., non-attacking pairs of queens, maximum \\(8 \times 7 / 2 = 28\\)) (p. 118).
3. **Selection:** Parents are selected for mating with probability proportional to their fitness scores (roulette-wheel selection) or via tournament selection (randomly picking \\(n\\) individuals and selecting the most fit) (p. 118).
4. **Recombination & Crossover:** Pairs of parents (mixing number \\(\rho = 2\\)) swap string segments at a randomly chosen **crossover point** to produce two children (p. 118).
5. **Mutation:** Each position in an offspring string is randomly altered with an independent probability equal to the **mutation rate** (p. 118).
6. ==**Elitism & Culling**==: Elitism preserves the top-scoring parents into the next generation so maximum fitness never decreases; culling discards individuals below a fixed fitness threshold (p. 118).

```

function GENETIC-ALGORITHM(population, fitness) returns an individual repeat weights <- WEIGHTED-BY(population, fitness) population2 <- empty list for i = 1 to SIZE(population) do parent1, parent2 <- WEIGHTED-RANDOM-CHOICES(population, weights, 2) child <- REPRODUCE(parent1, parent2) if (small random probability) then child <- MUTATE(child) add child to population2 population <- population2 until some individual is fit enough, or time elapsed return best individual in population

function REPRODUCE(parent1, parent2) returns an individual n <- LENGTH(parent1) c <- random number from 1 to n return APPEND(SUBSTRING(parent1, 1, c), SUBSTRING(parent2, c + 1, n))

```

- **Schema Theory:** Explains crossover efficacy using a **schema** (a string pattern with wildcards, e.g., \$246*****\$). If schema instances have above-average fitness, the number of schema instances grows exponentially over generations (p. 119).

### 4.2 Local search in continuous spaces
Continuous action spaces have an infinite branching factor, requiring continuous local search techniques (p. 121).

#### Discretization & Empirical Gradients
- **Discretization:** Limits continuous variables to a grid with spacing \\(\delta\\), turning an infinite space into a discrete space with \\(2n\\) neighbors for \\(n\\) variables (p. 121–122).
- **Empirical gradient**: Measures progress by evaluating objective function differences between nearby sampled points (\\(\pm \delta\\)), equivalent to steepest ascent on a discretized grid (p. 122).

#### Calculus-Based Gradient Search
For a differentiable continuous objective function \\(f(\mathbf{x})\\), the **gradient** vector \\(\nabla f(\mathbf{x})\\) gives the direction of steepest ascent (p. 122). Steepest-ascent updates follow:
\\[\mathbf{x} \leftarrow \mathbf{x} + \alpha \nabla f(\mathbf{x})\\]
where \\(\alpha > 0\\) is the **step size** (p. 122).
- If \\(\alpha\\) is too small, search converges too slowly; if \\(\alpha\\) is too large, search overshoots local maxima (p. 122).
- **Line search**: Overcomes step-size choice by repeatedly doubling \\(\alpha\\) along the gradient direction until \\(f\\) begins to decrease, using that peak as the new state (p. 122).

#### Newton-Raphson Optimization
The **Newton-Raphson method** finds roots \\(g(x) = 0\\) via \\(x \leftarrow x - g(x)/g'(x)\\) (p. 122). To find local extrema where \\(\nabla f(\mathbf{x}) = \mathbf{0}\\), it uses second derivatives via the **Hessian matrix** \\(\mathbf{H}_f(\mathbf{x})\\) (where \\(H_{ij} = \frac{\partial^2 f}{\partial x_i \partial x_j}\\)):
\\[\mathbf{x} \leftarrow \mathbf{x} - \mathbf{H}_f^{-1}(\mathbf{x}) \nabla f(\mathbf{x})\\]
Newton-Raphson fits a local quadratic surface at \\(\mathbf{x}\\) and jumps directly to its minimum in one step (p. 122). However, computing and inverting the \\(n \times n\\) Hessian matrix takes \\(O(n^3)\\) operations per step (p. 122).

#### Constrained Optimization & Convexity
- **Constrained optimization**: Optimization subject to hard variable constraints (p. 123).
- **Linear programming**: Constrained optimization where constraints are linear inequalities forming a **convex set** and the objective function is linear, solvable in polynomial time (p. 123).
- **Convex set & Convex function:** A set \\(S\\) is convex if line segments between any two points in \\(S\\) lie inside \\(S\\) (p. 123). A **convex optimization** problem optimizes a convex function over a convex region, guaranteeing that any local minimum is a global minimum (p. 123).

## Worked Example

Trace of the 8-Queens **Genetic Algorithm** execution from Figure 4.6 (p. 118):

1. **State Representation:** An 8-digit string where the \\(c\\)-th digit represents the row position of the queen in column \\(c\\) (p. 118).
2. **Initial Population & Fitness Evaluation (Non-attacking pairs, max \\(= 28\\)):**
   - String 1: `24748552` \\(\to\\) Fitness \\(= 24 \implies P(\text{select}) = 24 / 78 \approx 31\%\\)
   - String 2: `32752411` \\(\to\\) Fitness \\(= 23 \implies P(\text{select}) = 23 / 78 \approx 29\%\\)
   - String 3: `24415124` \\(\to\\) Fitness \\(= 20 \implies P(\text{select}) = 20 / 78 \approx 26\%\\)
   - String 4: `32543213` \\(\to\\) Fitness \\(= 11 \implies P(\text{select}) = 11 / 78 \approx 14\%\\)
   - Total sum of fitness scores \\(= 24 + 23 + 20 + 11 = 78\\) (p. 118).

3. ==**Selection & Crossover Recombination Step**==:
   - Pair 1 selected: `32752411` and `24748552`. Crossover point chosen after 3rd digit:
     - Parent 1 (`327 | 52411`) + Parent 2 (`247 | 48552`)
     - Child 1: `327` + `48552` \\(= \mathtt{32748552}\\)
     - Child 2: `247` + `52411` \\(= \mathtt{24752411}\\)
   - Pair 2 selected: `32752411` and `24415124`. Crossover point chosen after 5th digit:
     - Parent 1 (`32752 | 411`) + Parent 2 (`24415 | 124`)
     - Child 3: `32752` + `124` \\(= \mathtt{32752124}\\)
     - Child 4: `24415` + `411` \\(= \mathtt{24415411}\\)

4. **Random Mutation Step:**
   - Child 1: 6th digit mutates \\(5 \to 1 \implies \mathtt{32748152}\\)
   - Child 2: No digits mutate \\(\implies \mathtt{24752411}\\)
   - Child 3: 3rd digit mutates \\(7 \to 2 \implies \mathtt{32252124}\\)
   - Child 4: 8th digit mutates \\(1 \to 7 \implies \mathtt{24415417}\\)

This yields the next generation of four modified state strings (p. 118).

## Connections

- ==This section covers Week 5 reading; lecture coverage is pending insertion upon availability== (pending — re-run once Week 5's lecture PDF lands).

## Open Questions

- [ ] How does simulated annealing's acceptance probability \\(e^{\Delta E / T}\\) guarantee convergence to a global optimum as \\(T \to 0\\), and why do steep cooling schedules cause convergence to local extrema?
- [ ] In what structural landscapes does local beam search degrade into \\(k\\) parallel executions of slow hill climbing, and how does stochastic beam search prevent this collapse?
- [ ] ==Why does the schema theorem require building block components to be contiguous== in genetic algorithm bit strings to avoid destructive crossover disruption?
- [ ] What are the exact trade-offs in time complexity between computing empirical gradients versus inverting the Hessian matrix in high-dimensional continuous local search?

## Flashcards

How does steepest-ascent hill climbing differ from first-choice hill climbing?::Steepest-ascent evaluates all neighbors to pick the best move, whereas first-choice generates neighbors randomly and accepts the first one that improves on the current state (p. 111, 114). #cards/csci4511w

What is the mathematical condition for accepting a bad move in simulated annealing?::A bad move worsening the objective score by \\(\Delta E \le 0\\) is accepted with probability \\(P = e^{\Delta E / T}\\), where \\(T\\) is the current temperature (p. 115). #cards/csci4511w

Why is local beam search more effective than running \\(k\\) independent random restarts in parallel?::Local beam search passes information across threads by selecting the \\(k\\) best successors from the combined pool of all successors, allocating search effort to the most promising regions (p. 116). #cards/csci4511w

How do crossover and mutation operate in a genetic algorithm?::Crossover splits two parent strings at a random crossover point and recombines their halves to form children; mutation independently alters individual string digits with a small probability (p. 118). #cards/csci4511w

What is elitism in evolutionary algorithms, and why is it used?::Elitism preserves a small set of the top-performing individuals unchanged into the next generation, ensuring the maximum population fitness never decreases over time (p. 118). #cards/csci4511w

==How does the Newton-Raphson method optimize continuous functions using second derivatives?==::It updates continuous states via \\(\mathbf{x} \leftarrow \mathbf{x} - \mathbf{H}_f^{-1}(\mathbf{x}) \nabla f(\mathbf{x})\\), fitting a local quadratic surface using the Hessian matrix \\(\mathbf{H}_f\\) and jumping directly to its minimum (p. 122). #cards/csci4511w

Why does convex optimization guarantee that any local minimum found is also a global minimum?::Because convex functions defined over convex sets have no local minima distinct from global minima, ensuring local search methods cannot get trapped in suboptimal local extrema (p. 123). #cards/csci4511w 
## Full Reading Notes (continued — ### 4.3.1 through 4.3.3, 4.4.1 through 4.4.4)

### 4.3.1 The erratic vacuum world
When actions are nondeterministic, an agent can no longer rely on single deterministic state outcomes (p. 122). In the **erratic vacuum world**, the `Suck` action behaves nondeterministically (p. 122–123):
- When applied to a dirty square, it cleans the square and sometimes cleans an adjacent dirty square as well (p. 122).
- When applied to a clean square, it sometimes deposits dirt onto the floor (p. 122–123).

To model nondeterminism formally, the single-outcome transition function `RESULT(s, a)` is generalized to a set-valued transition function `RESULTS(s, a)` returning the set of all possible outcome states (p. 123). For example, in state 1 (agent in \\(A\\), \\(A\\) dirty, \\(B\\) dirty), executing `Suck` yields:
\\[\text{RESULTS}(1, Suck) = \{5, 7\}\\]
where state 5 is \\([A, \text{Clean}; B, \text{Dirty}]\\) and state 7 is \\([A, \text{Clean}; B, \text{Clean}]\\) (p. 123).

Because single action sequences cannot guarantee reaching a goal state under nondeterminism, a solution takes the form of a **conditional plan** (also called a **contingency plan** or **strategy**) containing `if-then-else` conditional branches (p. 123). For example, starting in state 1, the conditional plan is:
\\[[Suck, \text{\textbf{if} } State = 5 \text{ \textbf{then} } [Right, Suck] \text{ \textbf{else} } []]\\]
which branches dynamically based on runtime state observations (p. 123).

### 4.3.2 AND–OR search trees
Contingent solutions for nondeterministic problems are constructed using **AND–OR search trees** (p. 123–124).
- **OR nodes**: Correspond to state nodes where the agent chooses an action (e.g., choosing between `Left`, `Right`, or `Suck`) (p. 123).
- **AND nodes**: Correspond to action outcome nodes where the environment nondeterministically selects an outcome state from `RESULTS(s, a)` (p. 123). At an AND node, every possible outcome branch must be solved by the agent (p. 123).

==A solution for an AND–OR search problem is a subtree of the complete search tree that specifies one action at each OR node and includes every outcome branch at each AND node, ending in goal nodes at every leaf== (p. 124).

```

function AND-OR-SEARCH(problem) returns a conditional plan, or failure return OR-SEARCH(problem, problem.INITIAL, [])

function OR-SEARCH(problem, state, path) returns a conditional plan, or failure if problem.IS-GOAL(state) then return the empty plan if IS-CYCLE(path) then return failure for each action in problem.ACTIONS(state) do plan <- AND-SEARCH(problem, RESULTS(state, action), [state] + path) if plan ≠ failure then return [action] + plan return failure

function AND-SEARCH(problem, states, path) returns a conditional plan, or failure for each s_i in states do plan_i <- OR-SEARCH(problem, s_i, path) if plan_i = failure then return failure return [if s_1 then plan_1 else if s_2 then plan_2 ... else plan_n]

```

Cycle handling in `OR-SEARCH` checks whether the current state appears on the path from the root; if a cycle is detected, that branch returns `failure` (p. 124). This guarantees termination in finite state spaces because every path must eventually hit a goal, a dead end, or a repeated state (p. 124–125).

### 4.3.3 Try, try again
In the **slippery vacuum world**, movement actions nondeterministically fail, leaving the agent in its current location (e.g., `Right` in state 1 leads to \\(\text{RESULTS}(1, Right) = \{1, 2\}\\)) (p. 125). Because movement can fail repeatedly, no acyclic solution exists (p. 125).

To solve slippery environments, agents require a **cyclic solution** (a plan containing loops) (p. 125–126):
\\[[Suck, \text{\textbf{while} } State = 5 \text{ \textbf{do} } Right, Suck]\\]
or equivalently using labeled loop targets:
\\[[Suck, L_1: Right, \text{\textbf{if} } State = 5 \text{ \textbf{then} } L_1 \text{ \textbf{else} } Suck]\\]

A cyclic plan is a valid solution if every leaf node is a goal state and a goal leaf is reachable from every state in the plan (p. 125–126). Under the assumption that action failures occur independently at random, repeating an action sufficient times guarantees eventual success with probability 1 (p. 126).

### 4.4.1 Searching with no observation
When an agent has no sensors or receives no sensory information, it faces a **sensorless problem** (or **conformant problem**) (p. 126–127). The agent searches over a space of **belief states**—where a belief state \\(b\\) represents the set of all physical states the agent believes it could currently be in (p. 127).

For an underlying problem \\(P\\) with \\(N\\) physical states, the belief-state space contains \\(2^N\\) possible belief states (p. 127).

#### Conformant Search Formulation
- **States**: The set of all subsets of physical states in \\(P\\) (size \\(2^N\\)) (p. 127).
- **Initial State**: The set of all physical states in \\(P\\) (representing complete initial ignorance, e.g., \\(\{1, 2, 3, 4, 5, 6, 7, 8\}\\)) (p. 127).
- **Actions**: \\(\text{ACTIONS}(b) = \bigcup_{s \in b} \text{ACTIONS}_P(s)\\) (assuming illegal actions have no effect; or intersection if illegal actions are dangerous) (p. 127).
- **Transition Model**: For deterministic actions, \\(b' = \text{RESULT}(b, a) = \{s' : s' = \text{RESULT}_P(s, a) \text{ and } s \in b\}\\); for nondeterministic actions, \\(b' = \text{RESULT}(b, a) = \bigcup_{s \in b} \text{RESULTS}_P(s, a)\\) (p. 128).
- **Goal Test**: \\(\text{Is-Goal}(b)\\) returns true if *every* physical state \\(s \in b\\) satisfies \\(\text{Is-Goal}_P(s)\\) (necessarily achieving the goal) (p. 128).

**Coercion**: A sensorless agent can coerce the world into a goal state without perceiving anything by executing an action sequence that collapses the belief state down to goal states (p. 127). In the deterministic vacuum world starting from complete ignorance \\(\{1..8\}\\), `Right` yields \\(\{2, 4, 6, 8\}\\), `[Right, Suck]` yields \\(\{4, 8\}\\), and `[Right, Suck, Left, Suck]` coerces the world to goal state \\(7\\) regardless of initial state (p. 127).

*Pruning Rule:* If belief state \\(b_1 \subseteq b_2\\), the superset \\(b_2\\) can be pruned because any plan solving \\(b_2\\) also solves \\(b_1\\); solving the smaller set \\(b_1\\) is strictly easier (p. 128).

### 4.4.2 Searching in partially observable environments
In partially observable environments, the problem specification includes a `PERCEPT(s)` function (or `PERCEPTS(s)` for nondeterministic sensing) returning the sensory observation received in physical state \\(s\\) (p. 128–129).

Transitions between belief states in partially observable environments proceed through three stages (p. 129):
1. **Prediction stage**: Computes the predicted belief state \\(\hat{b}\\) resulting from action \\(a\\):
   \\[\hat{b} = \text{PREDICT}(b, a) = \text{RESULT}(b, a) = \bigcup_{s \in b} \text{RESULTS}_P(s, a)\\]
2. **Possible percepts stage**: Computes the set of all possible observations \\(o\\) that could be received in \\(\hat{b}\\):
   \\[\text{POSSIBLE-PERCEPTS}(\hat{b}) = \{o : o = \text{PERCEPT}(s) \text{ and } s \in \hat{b}\}\\]
3. **Update stage**: Filters \\(\hat{b}\\) for each possible percept \\(o\\) to keep only physical states consistent with observation \\(o\\):
   \\[b_o = \text{UPDATE}(\hat{b}, o) = \{s : o = \text{PERCEPT}(s) \text{ and } s \in \hat{b}\}\\]

Combining all three stages yields the nondeterministic belief-state transition function:
\\[\text{RESULTS}(b, a) = \{b_o : b_o = \text{UPDATE}(\text{PREDICT}(b, a), o) \text{ and } o \in \text{POSSIBLE-PERCEPTS}(\text{PREDICT}(b, a))\}\\] (p. 129–130).

Nondeterminism in physical actions expands the belief state during prediction, while observations shrink the belief state during update (p. 129).

### 4.4.3 Solving partially observable problems
By supplying the belief-state transition model \\(\text{RESULTS}(b, a)\\) to `AND-OR-SEARCH`, an agent solves partially observable problems directly (p. 130).

Because search operates over belief states, `AND-OR-SEARCH` returns a conditional plan that tests belief states rather than unobservable physical states (p. 130–131). For example, in the local-sensing vacuum world starting with initial percept \\([A, \text{Dirty}]\\) (initial belief state \\(\{1, 3\}\\)), `AND-OR-SEARCH` returns:
\\[[Suck, Right, \text{\textbf{if} } Bstate = \{6\} \text{ \textbf{then} } Suck \text{ \textbf{else} } []]\\] (p. 130).

### 4.4.4 An agent for partially observable environments
An agent in a partially observable environment executes its conditional plan while maintaining its belief state online as new percepts arrive (p. 131–132). This process is called **monitoring**, **filtering**, or **state estimation** (p. 132).

Given current belief state \\(b\\), executed action \\(a\\), and received percept \\(o\\), the new belief state \\(b'\\) is updated online using a **recursive state estimator**:
\\[b' = \text{UPDATE}(\text{PREDICT}(b, a), o)\\] (p. 131–132).

#### Robot Localization Example
In robot **localization** (Figure 4.18), a robot with a map navigates a maze using 4-bit sonar distance sensors \\([N, E, S, W]\\) (where \\(1\\) indicates an obstacle) (p. 132–133):
1. Initial belief state \\(b\\) contains all map locations (complete location ignorance) (p. 133).
2. Percept \\(E_1 = 1011\\) arrives \\(\implies \text{UPDATE}(b, 1011)\\) narrows candidate locations down to 4 matching maze squares (p. 133).
3. Nondeterministic move \\(a = Right \implies \text{PREDICT}(b, Right)\\) expands belief state \\(b_a\\) to all adjacent locations one step away (p. 133).
4. Second percept \\(E_2 = 1010\\) arrives \\(\implies \text{UPDATE}(b_a, 1010)\\) collapses the belief state down to a single unique square (p. 133).

## Worked Example

Trace of the **Erratic Vacuum World AND–OR Search Tree** starting from state 1 (\\([A, \text{Dirty}; B, \text{Dirty}]\\)) (Figure 4.10) (p. 123–124):

1. **Root (OR Node: State 1):**
   - Agent evaluates actions \\(\{Suck, Right, Left\}\\) (p. 123–124).
   - Candidate Choice: Action \\(Suck\\) (p. 124).

2. **AND Node: \\(\text{RESULTS}(1, Suck)\\):**
   - Environmental outcomes branch into two possible states: \\(\{5, 7\}\\) (p. 123–124).
   - ==At an OR node the agent chooses a single action, while at an AND node every outcome branch must lead to a valid solution subtree== (p. 123–124).
   - *Branch 1 (State 7: \\([A, \text{Clean}; B, \text{Clean}]\\)):*
     - Goal test \\(\text{Is-Goal}(7) = \text{True} \implies\\) Leaf node! Empty plan \\([]\\) returned (p. 124).
   - *Branch 2 (State 5: \\([A, \text{Clean}; B, \text{Dirty}]\\)):*
     - Goal test \\(\text{Is-Goal}(5) = \text{False} \implies\\) OR Node (State 5) (p. 124).

3. **OR Node (State 5):**
   - Agent evaluates actions \\(\{Suck, Right\}\\) (p. 124).
   - Action \\(Suck \implies \text{RESULTS}(5, Suck) = \{5, 1\}\\). State 5 and State 1 both exist on current ancestral path \\(\implies \text{IS-CYCLE}\\) triggers `failure` (p. 124).
   - Action \\(Right \implies \text{RESULTS}(5, Right) = \{6\}\\) (State 6: \\([B, \text{Clean}; B, \text{Dirty}]\\)) (p. 124).

4. **OR Node (State 6):**
   - Action \\(Left \implies \text{RESULTS}(6, Left) = \{5\}\\). State 5 exists on current path \\(\implies \text{IS-CYCLE}\\) triggers `failure` (p. 124).
   - Action \\(Suck \implies \text{RESULTS}(6, Suck) = \{8\}\\) (State 8: \\([B, \text{Clean}; B, \text{Clean}]\\)) (p. 124).
   - Goal test \\(\text{Is-Goal}(8) = \text{True} \implies\\) Leaf node! Empty plan \\([]\\) returned (p. 124).

5. **Constructed Conditional Solution Subtree:**
   - Assembles into Equation (4.3): \\([Suck, \text{\textbf{if} } State = 5 \text{ \textbf{then} } [Right, Suck] \text{ \textbf{else} } []]\\) (p. 123–124).

## Connections

- **Lecture (CSCI 4511W Week 6):**
  - This section covers Week 6 Monday reading (10/12); lecture coverage is pending insertion upon availability (pending — re-run once Week 6's lecture PDF lands).
  - ==AND–OR search over physical states under nondeterminism directly generalizes to belief-state search under partial observability==, where AND branches correspond to possible percept observations rather than environmental action outcomes (p. 123–131).
- **Textbook:**
  - (pending Chapter 5 — adversarial search and games)

## Open Questions

- [ ] How does cycle checking along parent pointers in `AND-OR-SEARCH` guarantee termination in finite state spaces without pruning valid non-cyclic solutions?
- [ ] ==Why does the size of the reachable belief-state space grow as \\(2^N\\) for \\(N\\) physical states==, and how do subset/superset pruning techniques reduce this complexity during search?
- [ ] In what ways does sensorless coercion allow an agent to guarantee reaching a goal state without receiving any perceptual feedback?
- [ ] How does a recursive state estimator update its belief state in real time using the prediction–observation–update cycle without needing the full history of past percepts?

## Flashcards

What is the key difference between an OR node and an AND node in an AND–OR search tree?::An OR node represents the agent's decision among available actions, whereas an AND node represents the environment's nondeterministic outcomes for a chosen action (p. 123–124). #cards/csci4511w

What defines a valid solution subtree for an AND–OR search problem?::A subtree that specifies exactly one action at each OR node, includes every outcome branch at each AND node, and has goal states at every leaf (p. 124). #cards/csci4511w

Why is the solution to a sensorless (conformant) problem an action sequence rather than a conditional plan?::Because the agent receives no observations or percepts at runtime, making future percept-based branching impossible and contingencies unobservable (p. 126–127). #cards/csci4511w

How does coercion allow a sensorless agent to solve problems from an unknown initial state?::Coercion uses a deterministic action sequence to force the environment into a known target state regardless of which physical state the agent started in (p. 127). #cards/csci4511w

What three stages comprise a belief-state transition update in a partially observable environment?::The predict stage calculates the predicted belief state \\(\hat{b}\\), the possible-percepts stage finds candidate observations \\(o\\), and the update stage filters \\(\hat{b}\\) to states consistent with \\(o\\) (p. 128–129). #cards/csci4511w

How does a recursive state estimator compute the new belief state \\(b'\\) without re-examining past percept history?::By applying \\(b' = \text{UPDATE}(\text{PREDICT}(b, a), o)\\) directly using only the current belief state \\(b\\), executed action \\(a\\), and newly received percept \\(o\\) (p. 131–132). #cards/csci4511w

==Why does belief-state search treat observations as AND-node branches during contingent planning?==::Because at planning time the agent does not know which percept will actually be observed, requiring a contingent plan for every possible observation returned by the sensors (p. 130–131). #cards/csci4511w
## Examples Worth Keeping
<!-- Keep concrete examples, numbers, cases, or worked reasoning that makes the mechanism memorable. -->
- 
## Connections
<!-- Link the matching lecture/week, course map, and only concept notes that actually exist or were created. -->
- Lecture:
- Concept:
## Flashcards
<!-- Add 3–8 atomic cards testing mechanisms and contrasts to #cards/<course-slug>. -->
