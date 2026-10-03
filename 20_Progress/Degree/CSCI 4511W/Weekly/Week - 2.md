---
type: class
input_kind: lecture
status: seed
created: 2026-09-14
updated: 2026-10-02
area:
  - "[[CSCI 4511W Board]]"
  - "[[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 2|Chapter - 2]]"
  - "[[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 3|Chapter - 3]]"
tags:
  - "#class"
  - "#Lecture"
next: "[[20_Progress/Degree/CSCI 4511W/Weekly/Week - 3|Week - 3]]"
---
# Week - 2
## What you must be able to do
- [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 2|Chapter 2]], [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 3|Chapter 3]] §3.1-3.2 — Apply PEAS to formalize a new agent from scratch; the four terms alone are not enough, the specification process is the skill.
- Classify any given task environment across all five lecture axes (Observability, Agent Number, Determinism, Static vs. Dynamic, Discrete vs. Continuous) and the two textbook-only axes (Episodic vs. Sequential, Known vs. Unknown) — say which axis you are on and why.
- Distinguish the four agent architectures (Simple Reflex, Model-Based Reflex, Goal-Based, Utility-Based) and identify which is forced by a partially observable or sequential environment and why.
- Trace the four steps of the problem-solving process (Goal Formulation, Problem Formulation, Search, Execution) and formalize each as a function or data structure.
- Write out all six components of a search problem from scratch: state space, initial state, goal test, actions, transition model, action-cost function; include the positivity constraint on costs.
- Read the `BestFirstSearch(problem, f)` code and explain what `PriorityQueue(order=f)`, the `reached` dictionary, and `expand(problem, node)` each do and why they are there.
- For the 8-puzzle: state the total and reachable configuration counts, say which representation the lecture asked about and why parity matters for solvability.
## Key ideas (short)
- **Agent architecture** is the answer to "what is inside the function?" — the four types progressively add world model, goal description, and utility scoring; each addition fixes a specific failure of the prior type.
- **Task environment classification** is not just vocabulary: partial observability forces model-based or better; sequential structure forces goal-based or better; stochasticity forces utility or learning agents.
- **Search problem = six-tuple**: state space, initial state, goal test, actions, transition model, action-cost function. PEAS specifies *what* the agent optimizes; the six-tuple specifies *how* the computation is set up.
- **BestFirstSearch(problem, f)** is a single framework covering BFS, DFS, UCS, greedy, A* — the only difference between them is the evaluation function `f`.
- **State-space graph vs. search tree**: the graph is a fixed property of the problem; the tree is the data structure the algorithm constructs and traverses during search. Same state can appear at multiple nodes.
## Concepts created today
- [[20_Progress/Degree/CSCI 4511W/Concepts/Concept - PEAS Framework|Concept - PEAS Framework]] — PEAS Framework (Performance, Environment, Actuators, Sensors): created this session once Ch 2 landed; deferred from Week 1 because it would have been four definitions with no formal structure behind them.
- [[20_Progress/Degree/CSCI 4511W/Concepts/Concept - Rational Agent|Concept - Rational Agent]] — the four-factor formal definition and the contrast with omniscience: created this session.
## Examples worth keeping
- **8-puzzle** (Lecture 03): asked "what are the states and how do we represent them in code?" — 9! = 362,880 total configurations, only 181,440 reachable because parity partitions the space into two disconnected halves; no legal sliding action crosses the parity boundary. Start state [7,2,4,5,_,6,8,3,1] → goal [_,1,2,3,4,5,6,7,8]. A problem in the wrong parity half has no solution even though the goal state exists.
- **Vacuum World** (Lecture 02 board): Professor traced all four PEAS components and all three lecture-covered architectures on this one example. Simple reflex vacuum agent is fully rational under the textbook's standard assumptions (fixed geography, binary dirt, no action costs, sensors never lie).
- **Autonomous taxi** (Ch 2 PEAS worked example): nine conflicting performance objectives — the point is not to memorize the list but that optimizing any single one without the others produces harmful behavior (optimize speed alone → run red lights; optimize profit alone → skip stops).
## Lecture
### 1. Definitions (Lecture 02, 9/14)
- **Agent**: anything that can perceive (via sensors) and act (via actuators) in an environment
- **Percept**: the content that an agent's sensors are perceiving at a single moment in time
- **Percept Sequence**: complete history of an agent's percepts
- **State**: unique configuration of agent in its environment (professor-added term; not a named textbook entry in §2.1)
- Vacuum World examples traced on the board: states, percepts, action outcomes
### 2. Properties of Task Environments (Lecture 02, 9/14)
Five axes on slides (textbook has 7 — see Textbook integration):
1. **Observability**: fully observable (sensors see complete state) vs. partially observable (noisy, missing) vs. unobservable (no sensors)
2. **Agent Number**: single-agent vs. multiagent — multiagent splits into competitive (chess, zero-sum) or cooperative (taxi/collision avoidance)
3. **Determinism**: deterministic (same state + same action → same result) vs. nondeterministic vs. stochastic (explicit probabilities over outcomes)
4. **Static vs. Dynamic** (vs. semidynamic): static = environment frozen during deliberation; dynamic = it keeps changing; semidynamic = static environment but score decays over time (chess with clock)
5. **Discrete vs. Continuous**: discrete = finite/countable states and actions (chess); continuous = smooth domains (driving speed, position)
- Examples of environments discussed in class and their properties classified
### 3. Agent Structure — What Is the Function? (Lecture 02, 9/14)
- High-level view: an agent is a function from percept sequence to action
- Question posed: "what could the inside of that function look like?"
### 4. Simple Reflex Agent (Lecture 02, 9/14)
- Exactly a lookup table: a sequence of if-then statements that react to the current percept only
- Diagram: `Percept` ← `Sensors` ← `Environment`; `Percept` + `Condition-action rules` → `"What action I should take"` → `Actuators` → `Environment`
- Works only in fully observable environments; falls into unrecoverable infinite loops under partial observability
### 5. Model-Based Reflex Agent (Lecture 02, 9/14)
- Agent maintains a model of the world; model can represent information not currently detectable by sensors
- Model is used as a lookup into a table to choose action
- Diagram: adds `"How the world evolves"` and `"What agent actions do"` → `Model of World`; `Model of World` + `Percept` → state used for rule lookup
### 6. Goal-Based Agent (Lecture 02, 9/14)
- Maintains model + is aware of how its actions affect the world
- Has a "goal" — a set of information describing desirable situations
- Chooses actions that will move it closer to the goal
- Diagram: adds `Goals` ellipse and `"Model of world if I take certain actions"` block between the world model and the action selection step
- **Lecture stopped here** — Utility-Based and Learning agents were not reached; those come from the textbook
### 7. Agent Structure Review and Short Quiz 01 (Lecture 03, 9/16, opening)
- Announcements: Problem Set 1 active; Code Reviews details coming to Canvas; Short Quiz 01 Brief Review
- Lecture 03 slides 3–9 repeat the three architecture slides from Lecture 02 verbatim as a review opener; no new content in this section
- Short Quiz 01 review occurred verbally — no slide content captured; see Takeaways
### 8. Problem-Solving Process for Agents (Lecture 03, 9/16)
Four steps, in order:
1. **Goal Formulation**: adopt a goal to organize behavior and restrict considered actions (e.g., "reach Bucharest")
2. **Problem Formulation**: build an abstract model of states, actions, transitions, and costs to reach the goal
3. **Search**: simulate action sequences in the model offline until a solution path is found
4. **Execution**: carry out the solution actions one at a time in the real world (*this step is often ignored in this course*)
### 9. Search Problem Definitions (Lecture 03, 9/16)
Six components, defined precisely:
1. **State space**: set of all possible states
   - *Set of all possible states*
2. **Initial state**: the state the agent starts in
   - *State that the agent starts in*
3. **Goal test**: `Is-Goal(s)` function — returns true if state `s` satisfies the goal condition
4. **Actions**: actions available to the agent, `Actions(s)` function
   - *Actions available to the agent*
5. **Transition model**: description of what actions do, `Result(s,a)` function
   - *Description of what actions do*
6. **Action-cost function**: numeric cost of actions, `Action-Cost(s,a,s')` function
   - *Numeric cost of actions*

Path/solution vocabulary:
- **Path**: sequence of actions
- **Solution**: path from initial state to a goal state
- **Optimal solution**: solution with lowest total cost for all actions in its path
### 10. Sliding Tile Puzzle as Example (Lecture 03, 9/16)
- Slide showed start state (7,2,4 / 5,_,6 / 8,3,1) and goal state (_,1,2 / 3,4,5 / 6,7,8)
- Question posed to class: "What are the states in this problem? How could we represent them in code?"
- Discussion: 2D array or 1D tuple of 9 integers; blank = 0; actions = blank moves Up/Down/Left/Right
### 11. BestFirstSearch Framework (Lecture 03, 9/16)
Introduced as a single generalized framework parameterized by evaluation function `f`:

```python
def BestFirstSearch(problem, f):
    node = Node(state=problem.initial)
    frontier = PriorityQueue(order=f)   # controls expansion order
    frontier.add(node)
    reached = {}                         # tracks states on frontier or expanded
    reached[problem.initial] = node
    while not frontier.is_empty():
        node = frontier.pop()
        if problem.is_goal(node.state): return node
        for child in expand(problem, node):
            s = child.state
            if s not in reached or child.path_cost < reached[s].path_cost:
                reached[s] = child
                frontier.add(child)
    return failure
```

- `PriorityQueue(order=f)`: controls which nodes we still need to explore and in what order — changing `f` changes the algorithm
- `reached = {}`: tracks which nodes have been put on the frontier or explored; enables redundant path detection in $O(1)$
- `expand(problem, node)`: uses `Actions(s)` and `Result(s,a)` to build a collection of successor nodes
## Textbook integration
> [!IMPORTANT]
> Main chapters: [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 2|Chapter 2]] (§2.1-2.4 fully), [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 3|Chapter 3]] §3.1-3.2 only (§3.3 onward belongs to Weeks 3-4)

**What Ch 2 adds beyond lecture:**
- The lecture presented **5 environment property axes**; the textbook has **7**. The two omitted: **Episodic vs. Sequential** (episodic = independent episodes, past choices don't affect future ones; sequential = long-term consequences across time; the taxi is sequential, a defect-spotting robot is episodic) and **Known vs. Unknown** (refers to the agent's knowledge of the environment's *physics/rules*, not state visibility — a fully observable environment can still be unknown if you don't know what your actions do). Both axes are exam-testable and were not mentioned in either lecture.
- **Utility-based agents** (§2.4.5) and **Learning agents** (§2.4.6) were not reached in lecture. Utility-based: uses internal utility function $U(s)$ mapping states to real numbers, enabling rational trade-offs when goals conflict or multiple goals can't all be achieved. Under uncertainty: $\text{Action} = \arg\max_a \sum_{s'} P(s' \mid s,a) \cdot U(s')$. Learning agents split into four components: **learning element** (makes structural improvements from feedback), **performance element** (selects actions), **critic** (evaluates against fixed external standard), **problem generator** (suggests exploratory actions). The critic's performance standard must stay fixed *outside* the agent — if the agent could lower its own standard it would always succeed trivially.
- **The four rationality factors** (§2.2.2): performance measure, prior knowledge of the environment, available actions, percept sequence to date. Lecture named "rational agent" but did not enumerate all four conditions.
- **Omniscience vs. rationality** (§2.2.3): rationality maximizes *expected* performance given available evidence; omniscience would require knowing actual outcomes in advance. The Champs Élysées crossing example: crossing is rational if you look and see no traffic; a random cargo door falling and killing you does not retroactively make crossing irrational. This distinction matters — students frequently conflate "the agent did the right thing" with "the agent got a good outcome."
- **Representation types** (§2.4.7): atomic (state as indivisible black box — what search algorithms use this week), factored (state as attribute-value vector — CSPs, Bayesian networks), structured (objects and explicit relationships — first-order logic). The Lecture 03 "2D array vs. 1D tuple" question is asking about concrete *implementation* of an atomic state. The algorithm treats either as an opaque label — it doesn't inspect the internals.

### Textbook additions easy to miss
- **Known vs. Unknown** is about the environment's rules, not state visibility. You can have a fully observable unknown environment (you see every state but don't know what your actions do). Lecture never drew this distinction and it is frequently missed.
- **Formal action-cost positivity constraint**: $c(s,a,s') \ge \epsilon > 0$. Costs must be strictly positive to prevent infinite zero-cost loops. Lecture defined "action-cost function" but did not state this constraint.
- **Why 181,440 and not 362,880** for the 8-puzzle (§3.2.1): parity of any legal sliding action is fixed, so the state space partitions into two disconnected halves. A start state in one half has no solution if the goal is in the other — the search will exhaust the 181,440-state half and report failure. This is the algorithmic significance of the number, not a trivia fact.
- **Environment assumptions for offline search** (§3.1): the textbook explicitly lists these: sequential, single-agent, fully observable, deterministic, static, discrete, known. When any of these fail, a fixed-sequence solution no longer works — you need a conditional plan (covered later). Lecture implied some of these but never listed them as a gate.

**What Ch 3 §3.1-3.2 adds beyond lecture:**
- **Abstraction** (§3.1): removing irrelevant real-world detail to create a tractable model. An abstraction is *valid* if every abstract solution expands to a real execution; *useful* if each abstract action is easier than solving the original. Lecture showed search problem definitions but did not name or discuss the abstraction property.
- **Standardized vs. real-world problems** (§3.2): beyond the 8-puzzle, the textbook lists Sokoban (8×8 grid, 12 boxes, 200+ trillion states), Knuth's 4-number (infinite state space), and real-world categories: route-finding, TSP (NP-hard), VLSI layout, robot navigation, automatic assembly sequencing. Lecture used only the sliding puzzle.
## Takeaways (questions to resolve)
- [ ] Lecture 02 called the simple reflex agent "exactly a lookup table" — but the textbook distinguishes the table-driven agent (explicit $|\mathcal{P}|^T$-entry table) from the simple reflex agent (compact condition-action rules). Are these the same? What is the storage difference?
- [ ] Lecture 03 asked "2D array or 1D tuple?" for 8-puzzle states and never resolved it. Which representation makes `Actions(s)`, `Result(s,a)`, and `Is-Goal(s)` easiest to implement correctly in Python?
- [ ] Two environment property axes (Episodic vs. Sequential, Known vs. Unknown) were omitted from lecture. Which distinction is most commonly confused on exams — and what is the one-sentence contrast that resolves each?
- [ ] What does `expand(problem, node)` return exactly — a list, a generator? What fields does each returned node carry (STATE, PARENT, ACTION, PATH-COST)?
- [ ] Short Quiz 01 was reviewed verbally at the start of Lecture 03 — no slide content captured. Find what was actually tested (Canvas quiz PDF or Discord). No vault capture exists currently.
## Lecture-to-textbook synthesis
==The agent architecture hierarchy and the search problem formalism are two halves of the same design question: what is inside the agent's function, and how does that function find the action that achieves its goal.==
*Mechanism:* Lecture 02 opens the black box of the agent function by progressively adding capability: condition-action rules (Simple Reflex) handle fully observable environments but fail under partial observability because they have no memory of what they can't see; adding a world model (Model-Based) fixes the memory problem but the agent still only reacts; adding a goal description (Goal-Based) lets the agent plan ahead by predicting future states and choosing actions that lead toward the goal. Lecture 03 then formalizes what "plan ahead" means computationally: adopt a goal, formulate the problem as a six-tuple (state space, initial state, goal test, actions, transition model, action-cost function), then run `BestFirstSearch(problem, f)` over the state space. The evaluation function `f` is the only variable between all search algorithms the course will cover — BFS, DFS, UCS, greedy, A* are all specializations of this one framework.
- Lecture example/scenario: Sliding Tile Puzzle — students specified states (1D tuple of 9 integers), actions (blank moves Up/Down/Left/Right), and goal test; `BestFirstSearch` code shown in full with `PriorityQueue(order=f)` and `reached` dictionary annotations. 8-puzzle has 362,880 total states but only 181,440 reachable; the parity partition determines whether any given start/goal pair has a solution at all.
- Textbook connection: [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 2|Chapter 2]] §2.4 provides the four agent architecture diagrams the lecture reproduced exactly (including exact label text: `"What agent actions do"`, `"Model of world if I take certain actions"`). [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 3|Chapter 3]] §3.1-3.2 formalizes the six-tuple and provides the `BEST-FIRST-SEARCH` pseudocode (Figure 3.7) that Lecture 03 translated to Python-ish form.
- Concept links: [[20_Progress/Degree/CSCI 4511W/Concepts/Concept - PEAS Framework|Concept - PEAS Framework]], [[20_Progress/Degree/CSCI 4511W/Concepts/Concept - Rational Agent|Concept - Rational Agent]]
> [!WARNING]
> The agent function and the search algorithm are not the same object. The agent function maps percept sequences to actions — it is the specification. `BestFirstSearch` is the internal mechanism a goal-based agent uses to *find* which action sequence achieves its goal. Simple reflex agents do not search at all — they look up. Conflating "agent function" with "search algorithm" is the most common Week 2 conceptual error.
> [!SUMMARY]
> Week 2 opens the black box from Week 1 twice: once to reveal four progressively capable architectures for what is inside the agent, and once to formalize the computational structure any goal-based agent must work through before it can act.
## Flashcards
#cards/csci4511w
Why does a **simple reflex agent** fail under partial observability?::It reacts only to the current percept with no memory of past states. When the current percept does not determine which action to take (because relevant state is hidden), the agent cycles indefinitely through the same percept-action mapping. #cards/csci4511w
What does a **model-based reflex agent** add over a simple reflex agent, and what does it still lack?::It adds an internal state updated by a transition model and sensor model, enabling decisions when the current percept is insufficient. It still lacks explicit goal descriptions and future-state prediction — it reacts based on its current state estimate rather than reasoning about what will happen next. #cards/csci4511w
Why is a **goal-based agent** more flexible than a model-based reflex agent when the destination changes?::Reflex rules are hardcoded — changing destinations requires rewriting every condition-action rule. A goal-based agent separates the world model from the goal, so changing destinations only requires updating the goal string. The action selection mechanism stays the same. #cards/csci4511w
What are the **two environment axes** the lecture omitted and why do they matter?::Episodic vs. Sequential (past actions affect future episodes vs. not) and Known vs. Unknown (agent knows the physics/rules vs. must learn them). Episodic environments can use simpler agents because there is no need to plan across episodes; unknown environments require exploration before a reliable plan is possible. #cards/csci4511w
Name the **six components of a formal search problem** and the positivity constraint on costs.::(1) State space, (2) Initial state, (3) Goal test `Is-Goal(s)`, (4) Actions `Actions(s)`, (5) Transition model `Result(s,a)`, (6) Action-cost function `Action-Cost(s,a,s') ≥ ε > 0`. The strict positivity constraint prevents infinite zero-cost cycles that would trap any search. #cards/csci4511w
What does the **`f` parameter** in `BestFirstSearch(problem, f)` control, and how does changing it produce different algorithms?::It is the evaluation function that orders nodes in the priority queue. Setting `f(n) = depth` gives BFS behavior; `f(n) = path_cost` gives UCS; `f(n) = h(n)` gives greedy best-first; `f(n) = g(n) + h(n)` gives A*. The rest of the code is identical. #cards/csci4511w
Why does the **8-puzzle** have only 181,440 reachable states out of 362,880 total?::Any legal sliding action preserves the permutation parity of the tile arrangement. The 9! configurations split into two disconnected parity classes; no sequence of legal slides can cross from one class to the other. A start state in one class has no solution if the goal is in the other — confirming solvability before searching is critical. #cards/csci4511w
What is the difference between **omniscience** and **rationality**?::An omniscient agent knows actual outcomes of its actions in advance — impossible in real environments. A rational agent selects the action with maximum expected performance given its percept sequence and prior knowledge. A rational agent can take the best available action and still get a bad outcome; that does not make the decision irrational. #cards/csci4511w
