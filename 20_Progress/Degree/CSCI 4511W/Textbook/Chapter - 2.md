---
type: class
input_kind: book
status: seed
created: 2026-09-20
updated: 2026-09-20
area:
  - "[[CSCI 4511W Board]]"
  - "[[20_Progress/Degree/CSCI 4511W/Textbook/Textbook Map|Textbook Map]]"
tags:
  - "#class"
  - "#Textbook"
  - "#AI"
next: "Connect the Chapter 2 agent model to the captured 9/14 lecture, then continue to Chapter 3 search notes"
---
# Chapter - 2 — Intelligent Agents
**Source:** Stuart Russell and Peter Norvig, *Artificial Intelligence: A Modern Approach*, 4th ed. (Pearson, 2020), Chapter 2, pp. 36–63.
**Read from:** `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4511W\CSCI 4511W Textbook.pdf`
**Course role:** The formal starting point for CSCI 4511W's search units: define the agent's task, classify the environment, and choose the least fragile agent architecture that can make good decisions.
## Chapter Summary
A rational agent selects actions that maximize its expected performance measure based on its percept sequence and built-in knowledge, requiring agent designs to be tailored to specific task environment properties [8, 31, 36, 44, 50, 54, 58, 62, ==167==].
*Mechanism:* Sensory inputs generate a percept sequence that the agent program maps to actuator commands via internal mechanisms—ranging from simple reflex rules to internal world models, explicit goals, utility functions, and learning elements—which operate across atomic, factored, or structured state representations to manage environmental complexity, uncertainty, and partial observability (p. 36–58).
## Key Concepts
- **Agent**: Anything that perceives its environment through sensors and acts upon that environment through actuators (p. 36).
- **Sensors**: Passive or active input mechanisms through which an agent receives sensory inputs from its environment (p. 36).
- **Actuators**: Output mechanisms by which an agent executes actions upon its environment (p. 36).
- **Percept**: The specific sensory content an agent's sensors perceive at a single moment in time (p. 36).
- **Percept sequence**: The complete, cumulative history of everything the agent has ever perceived (p. 36).
- **Agent function**: An abstract mathematical mapping \\(f: \mathcal{P}^* \to \mathcal{A}\\) specifying the action for every possible percept sequence (p. 36).
- **Agent program**: The concrete computational implementation of an agent function running on an agent architecture (p. 37).
- **State**: A unique physical or conceptual configuration of the agent and its environment at a given point in time (Lecture 02).
- **Rational agent**: An agent that selects an action expected to maximize its performance measure given its percept sequence and prior knowledge (p. 39).
- **Consequentialism**: The evaluation of behavior strictly by the desirability of the sequence of environment states produced by actions (p. 38).
- **Performance measure**: An objective external criterion evaluating any given sequence of environment states (p. 38).
- **Omniscience**: Perfect knowledge of the actual outcome of actions in advance, which is impossible in realistic environments (p. 40).
- **Autonomy**: The property of an agent whose choices are guided by its own experience and learning rather than relying exclusively on designer prior knowledge (p. 42).
- **Task environment**: The formal problem specification to which a rational agent is the solution, specified via PEAS (p. 42).
- **PEAS**: The acronym defining Performance measure, Environment, Actuators, and Sensors (p. 42).
- **Fully observable** / **Partially observable**: Fully observable environments provide sensors complete state access, whereas partially observable environments lack complete state data due to noisy or missing inputs (p. 44–45).
- **Single-agent** / **Multiagent**: Single-agent environments involve one decision maker, whereas multiagent environments contain multiple entities whose decisions affect each other's performance (p. 45).
- **Competitive** / **Cooperative**: Dynamics where maximizing one agent's performance minimizes another's vs. agents sharing performance objectives (p. 45).
- **Deterministic** / **Nondeterministic** / **Stochastic**: Deterministic environments have next states completely determined by current state and action, whereas nondeterministic or stochastic environments involve outcome uncertainty or explicit probabilities (p. 45).
- **Episodic** / **Sequential**: Episodic environments divide experience into independent episodes, whereas sequential actions have long-term consequences across time (p. 45).
- **Static** / **Dynamic** / **Semidynamic**: Static environments do not change during deliberation; dynamic environments change continuously during deliberation; semidynamic environments decay score over time (p. 45).
- **Discrete** / **Continuous**: Environments with finite/countable distinct states/actions vs. variables varying smoothly over continuous domains (p. 45).
- **Known** / **Unknown**: Refers to the agent's knowledge of the environment's rules/physics rather than state observability (p. 45–46).
- **Agent architecture**: The physical computing device, sensors, and actuators hosting the agent program (p. 46).
- **Table-driven agent**: An agent program storing an explicit lookup table mapping percept sequences to actions (p. 47).
- **Simple reflex agent**: An agent program selecting actions based strictly on the current percept, ignoring percept history (p. 48).
- **Condition-action rules**: Explicit `if condition then action` mappings connecting state representations to actions (p. 48).
- **Model-based reflex agent**: An agent program maintaining internal state updated by transition and sensor models to track unobserved world aspects (p. 50).
- **Internal state**: Data structure stored within an agent representing unobserved aspects of the world based on percept history (p. 50).
- **Transition model**: Knowledge of how the world evolves independently and how agent actions affect the state (p. 51).
- **Sensor model**: Knowledge of how invisible physical world states are reflected in sensory percepts (p. 51).
- **Goal-based agent**: An agent combining state descriptions with explicit goal descriptions to select action sequences achieving desirable situations (p. 52).
- **Goal**: A formal description of desirable environment states or situations (p. 52).
- **Utility-based agent**: An agent using a utility function to evaluate state desirability, enabling rational decision-making under goal conflicts and uncertainty (p. 53–54).
- **Utility**: A real-valued measure indicating the degree of state desirability ("happiness") (p. 53).
- **Utility function**: An internal mathematical function \\(U(s)\\) mapping world states to real numbers, internalizing the performance measure (p. 53).
- **Expected utility**: The probability-weighted average utility of outcome states resulting from an action, maximized under uncertainty (p. 54).
- **Model-free agent**: An agent that learns optimal actions directly without constructing an explicit transition model (p. 54–55).
- **Learning agent**: An agent framework split into learning element, performance element, critic, and problem generator (p. 55).
- **Learning element**: The component responsible for making structural improvements to internal agent knowledge based on feedback (p. 55).
- **Performance element**: The decision-making component selecting external actions from percepts (p. 55).
- **Critic**: The component evaluating agent behavior against a fixed external performance standard to generate feedback (p. 55).
- **Problem generator**: The component suggesting exploratory actions yielding novel experiences (p. 55).
- **Reward** / **Penalty**: Scalar feedback signals provided by the external performance standard (p. 55).
- **Atomic representation**: State representation where each state is an indivisible black box identified only by its label (p. 56–57).
- **Factored representation**: State representation splitting each state into a fixed vector of attribute variables with values (p. 57).
- **Structured representation**: State representation explicitly encoding individual objects, attributes, and relationships among objects (p. 57–58).
- ==**Expressiveness**==: The formal power of a representation language to compactly and flexibly capture complex world states and transition rules (p. 58).
## Full Reading Notes
### 2.1 Agents and Environments
An **agent** is anything that can be viewed as perceiving its environment through **sensors** and acting upon that environment through **actuators** (p. 36). Human agents perceive via eyes, ears, and other organs, acting through hands, legs, and vocal tracts; robotic agents perceive via cameras and infrared range finders, acting through electric motors; softbots perceive via keystrokes, file contents, and network packets, acting by displaying text on screens, writing files, or sending network packets (p. 36). The environment encompasses that portion of the universe whose state affects what the agent perceives and is affected by the agent's actions (p. 36). A **percept** refers strictly to the content an agent's sensors are perceiving at a single moment in time (p. 36). A **percept sequence** is the complete history of everything the agent has ever perceived throughout its operational lifetime (p. 36). An agent's choice of action at any given instant depends on its built-in knowledge and its percept sequence observed to date, but never on unperceived aspects of the world (p. 36).
An **agent function** is an abstract mathematical mapping specifying the choice of action for every possible percept sequence:
$$f: \mathcal{P}^* \to \mathcal{A}$$
where $\mathcal{P}^*$ denotes the set of all possible percept sequences and $\mathcal{A}$ denotes the set of legal actions (p. 36). In contrast, an **agent program** is the concrete physical or computational implementation running on an underlying architecture that embodies the agent function (p. 37). While the agent function represents an external mathematical specification, the agent program is an internal physical mechanism (p. 37).
To illustrate these concepts, the textbook introduces the **vacuum-cleaner world** (p. 37):
- *Environment:* Consists of two locations, $A$ and $B$, each of which can be clean or dirty (p. 37).
- *Sensors:* The agent perceives its current location and whether that location contains dirt, yielding percepts such as $[A, Clean]$ or $[A, Dirty]$ (p. 37).
- *Actuators & Actions:* Available actions are $Right$, $Left$, $Suck$, and $NoOp$ (p. 37). Footnote 2 notes that physical robots use wheel motor commands, but abstract movement actions are chosen for page clarity (p. 37).
- *Simple Agent Rule:* If the current square is dirty, clean it by sucking; otherwise, move to the other square (p. 37).
- *Partial Agent Function Tabulation (p. 37):*
  - $[A, Clean] \to Right$
  - $[A, Dirty] \to Suck$
  - $[B, Clean] \to Left$
  - $[B, Dirty] \to Suck$
  - $[A, Clean], [A, Clean] \to Right$
  - $[A, Clean], [A, Dirty] \to Suck$
  - $[A, Clean], [A, Clean], [A, Clean] \to Right$
  - $[A, Clean], [A, Clean], [A, Dirty] \to Suck$
The notion of an agent serves as an analytical tool for system analysis rather than an absolute boundary dividing physical artifacts (p. 38). For example, a calculator maps input percept sequence "2 + 2 = " to action "4", but treating it as an agent provides little analytical utility; AI focuses on complex task environments requiring nontrivial decision-making with substantial computational resources (p. 38).
The lecture adds the definition of **state** as a unique configuration of the agent in its environment (Lecture 02, Sep 14, 2026).
> [!NOTE]
> State is lecture vocabulary defined on Sep 14, 2026 ("a unique configuration of agent in its environment") and does not appear as a formal named glossary entry in Section 2.1 of the textbook.
### 2.2 Good Behavior: The Concept of Rationality
A rational agent is one that "does the right thing" (p. 38). Doing the right thing is better than doing the wrong thing, but defining what constitutes right action requires an explicit performance criterion (p. 38).
### 2.2.1 Performance measures
AI evaluates agent behavior using **consequentialism**, a philosophical principle judging behavior strictly by the desirability of the sequence of environment states produced by the agent's actions (p. 38).
A **performance measure** is an objective external criterion that evaluates any given sequence of environment states (p. 38). Unlike humans who possess intrinsic desires and preferences, machines execute performance measures formulated by designers or users; these measures may be explicitly represented within the agent design or remain entirely implicit (p. 38).
*Formulation Warning:* Formulating performance measures is difficult. Norbert Wiener warned that we must "ensure that the purpose put into the machine is the purpose which we really desire" (Wiener, p. 33), preventing the King Midas problem where an agent optimizes a literal but unintended metric (p. 38–39).
- *Pitfall:* Measuring vacuum performance by the volume of dirt cleaned in an 8-hour shift causes a rational agent to suck up dirt, dump it back out, and suck it up repeatedly to maximize its score (p. 38–39).
- *Rule:* Design performance measures according to what one actually wants to be achieved in the environment, rather than according to how one thinks the agent should behave (p. 39).
- *Correct Metric:* Awarding 1 point per clean square at each time step, with explicit penalties for electricity consumed and noise generated (p. 39).
- *Philosophical Dilemmas:* Average cleanliness over time can be achieved by steady mediocre work or energetic work punctuated by long breaks; similarly, trade-offs exist between recklessness vs. humdrum existence, and moderate equality vs. extreme wealth/poverty (p. 39).
- *Uncertainty:* When individual user preferences cannot be anticipated in advance, agents must reflect initial uncertainty about the true performance measure and learn preferences through interaction (p. 39).
### 2.2.2 Rationality
What is rational at any given moment depends strictly on four factors (p. 39):
1. The performance measure defining the criterion of success.
2. The agent's prior knowledge of the environment.
3. The actions that the agent can perform.
4. The agent's percept sequence observed to date.
Formal definition of rational agent (p. 39):
==For each possible percept sequence, a rational agent should select an action that is expected to maximize its performance measure, given the evidence provided by the percept sequence and whatever built-in knowledge the agent has.==
*Vacuum Environment Rationality Case Study (p. 39–40):*
- *Assumptions:* Performance measure awards 1 point per clean square per time step over 1,000 steps; geography of locations $A$ and $B$ is known a priori, but initial dirt distribution and agent start location are unknown; clean squares stay clean; $Suck$ cleans the current square; $Right$ and $Left$ move 1 square (bumping walls results in $NoOp$); sensors correctly perceive current location and dirt status (p. 39–40).
- *Conclusion:* Under these exact assumptions, the simple reflex vacuum agent function is fully rational (p. 40).
- *Circumstance Shifts:* If actions cost 1 penalty point per movement, oscillating between clean squares becomes irrational (a rational agent must stop moving once confident all squares are clean) (p. 40). If clean squares can re-soil, the agent must periodically re-inspect squares (p. 40). If geography is unknown, the agent must explore rather than execute fixed movement rules (p. 40).
### 2.2.3 Omniscience, learning, and autonomy
Rationality must be distinguished from **omniscience** (p. 40). An omniscient agent knows the actual outcome of its actions and acts accordingly; omniscience is impossible in real physical environments (p. 40).
- *Example:* A person walking along the Champs Élysées sees a friend across the street; perceiving no traffic, crossing is rational (p. 40). If a cargo door falls off an airliner at 33,000 feet (Washington Post 1989 footnote 3) flattening the pedestrian, crossing was not irrational because rationality maximizes *expected* performance based on percept history to date, whereas perfection/omniscience maximizes *actual* post-hoc outcome (p. 40).
- *Information Gathering:* Rationality requires **information gathering**—performing actions specifically to modify future percepts (p. 40–41).
  - *Example 1:* Looking both ways before crossing a street prevents uninformative percept sequences and reduces risk (p. 40–41).
  - *Example 2:* Exploration undertaken by a vacuum agent in an initially unknown environment (p. 41).
- *Learning:* A rational agent must incorporate **learning** to modify and augment its initial prior knowledge through experience (p. 41). Completely predictable environments known a priori require no learning, but non-learning agents are fragile when assumptions are violated (p. 41).
  - *Dung Beetle Example:* Digs a nest, lays eggs, fetches a dung ball to plug the entrance; if the ball is removed en route, the beetle continues pantomiming plugging the nest with the non-existent ball because its hardwired programming lacks learning (p. 41).
  - *Sphex Wasp Example:* Digs a burrow, stings a caterpillar, drags it to the burrow edge, enters to inspect the burrow, then drags the caterpillar inside; if an entomologist moves the caterpillar a few inches away during inspection, the wasp drags it back to the edge and re-enters the burrow to inspect again, looping indefinitely through re-inspection without learning (p. 41–42).
  - *Learning Vacuum:* Predicts dirt appearance timing and location to outperform static variants (p. 42).
- *Autonomy:* An agent possesses **autonomy** to the extent that its choices are guided by its own percepts and learning rather than relying exclusively on the prior knowledge of its designer (p. 42).
  - *Lack of Autonomy:* Relying entirely on designer prior knowledge renders an agent non-autonomous and inflexible (p. 42).
  - *Initial Reflexes:* Complete initial autonomy is impractical; agents require initial built-in knowledge and reflexes (analogous to evolutionary instincts) to survive long enough to learn (p. 42).
  - *Experience Independence:* Over time, learning allows a rational agent's behavior to become effectively independent of its initial prior knowledge, enabling a single agent design to operate successfully across vast environment varieties (p. 42).
### 2.3 The Nature of Environments
Task environments are the formal problem specifications to which rational agents are the solutions (p. 42). The design of an agent program depends directly on the properties of its task environment (p. 42).
### 2.3.1 Specifying the task environment
A task environment is specified using the **PEAS** description: **P**erformance measure, **E**nvironment, **A**ctuators, and **S**ensors (p. 42). In designing any agent, specifying the task environment as fully as possible is always the first step (p. 42).
*Taxi Driver PEAS Example (p. 42–43):*
- *Performance Measure:* Safe, fast, legal, comfortable trip, profit maximization, wear/tear minimization, fuel minimization, and impact/disturbance minimization on other road users (p. 42). Objectives conflict and require trade-offs (p. 42).
- *Environment:* Roads, other traffic, police, pedestrians, customers, weather conditions, puddles, potholes (p. 42).
- *Actuators:* Steering wheel, accelerator, brake, signal indicators, horn, display screen, speech output (p. 42).
- *Sensors:* Cameras, radar, sonar/lidar, speedometer, GPS, accelerometer, engine sensors, microphones, passenger touchscreen (p. 42).
*Additional Agent PEAS Examples (p. 43–44):*
- *Medical Diagnosis System:* Healthy patient, reduced costs / Patient, hospital, staff / Display of questions, tests, diagnoses, treatments / Touchscreen or voice entry of symptoms and findings (p. 44).
- *Satellite Image Analysis System:* Correct categorization of objects and terrain / Orbiting satellite, downlink, weather / Display of scene categorization / High-resolution digital camera (p. 44).
- *Part-Picking Robot:* Percentage of parts in correct bins / Conveyor belt with parts, bins / Jointed arm and hand / Camera, tactile and joint angle sensors (p. 44).
- *Refinery Controller:* Purity, yield, safety / Refinery, raw materials, operators / Valves, pumps, heaters, stirrers, displays / Temperature, pressure, flow, chemical sensors (p. 44).
- *Interactive English Tutor:* Student's score on test / Set of students, testing agency / Display of exercises, feedback, speech / Keyboard entry, voice (p. 44).
Virtual task environments for software agents or **softbots** (e.g., website auction trading softbots handling millions of users and billions of objects) can be as complex and rich as physical environments (p. 43–44).
### 2.3.2 Properties of task environments
Task environments are categorized across seven fundamental dimensions (p. 44–46):
1. **Fully observable** vs. **partially observable** (vs. **unobservable**): Fully observable if sensors give access to the complete environment state at all times; partially observable if sensors are noisy, inaccurate, or missing state aspects; unobservable if the agent has no sensors (p. 44–45).
2. **Single-agent** vs. **multiagent**: Single-agent if one agent acts alone (crossword puzzle); multiagent if multiple entities' performance measures depend on each other (chess) (p. 45). Multiagent environments can be **competitive** (chess, zero-sum) or **cooperative** / partially cooperative (taxi driving) (p. 45).
3. **Deterministic** vs. **nondeterministic** (vs. **stochastic**): Deterministic if the next state is completely determined by current state and action; nondeterministic if not; stochastic if uncertainty is modeled with explicit probabilities (p. 45).
4. **Episodic** vs. **sequential**: Episodic divides experience into independent atomic episodes where choices do not affect future episodes (defect-spotting robot); sequential actions have long-term consequences across time (chess, driving) (p. 45).
5. **Static** vs. **dynamic** (vs. **semidynamic**): Static if environment does not change during deliberation (crossword); dynamic if environment changes while deliberating (driving); semidynamic if physical environment is static but performance score decays over time (chess with clock) (p. 45).
6. **Discrete** vs. **continuous**: Applies to state, time, percepts, or actions. Discrete if values are finite/countable (chess); continuous if variables vary smoothly over continuous domains (taxi driving) (p. 45).
7. **Known** vs. **unknown**: Refers to the agent's or designer's knowledge of the environmental laws/physics. In a known environment, outcomes/probabilities are given; in an unknown environment, the agent must explore to learn the physics (p. 45–46).
An **environment class** is a family of environment instances used in simulation to measure average agent performance (p. 46).
> [!NOTE]
> The Sep 14 lecture slide headlined only 5 environment property axes (Observability, Agent Number, Determinism, Static vs. Dynamic, Discrete vs. Continuous), omitting Episodic vs. Sequential and Known vs. Unknown from the textbook's 7 total axes.
### 2.4 The Structure of Agents
An agent program executes on a physical architecture (p. 46):
\\[\text{Agent} = \text{Architecture} + \text{Program}\\]
The **agent architecture** provides the physical computing device, sensors, and actuators that physically host and run the agent program (p. 46).
### 2.4.1 Agent programs
An agent program takes the current single percept as input from sensors and returns an action to actuators, whereas the abstract agent function takes the entire percept history \\(\mathcal{P}^*\\) (p. 47).
The **table-driven agent** (`TABLE-DRIVEN-AGENT`) maintains an explicit percept history list and indexes into a lookup table (p. 47). For percept set \\(\mathcal{P}\\) and agent lifetime \\(T\\), the lookup table requires \\(\sum_{t=1}^{T} |\mathcal{P}|^t\\) entries (p. 47).
*Table Lookup Failure (p. 47):*
- *Storage:* For visual driving (70 MB/sec for 1 hour), table size exceeds \\(10^{600,000,000,000}\\) entries, eclipsing the \\(10^{80}\\) atoms in the observable universe (p. 47).
- *Impossibility:* Fails due to astronomical space limits, designer construction time, and inability of an agent to learn all entries from experience (p. 47).
AI's core goal is writing compact programs that produce rational behavior from small code rather than massive lookup tables (p. 47).
### 2.4.2 Simple reflex agents
A **simple reflex agent** selects actions based strictly on the current percept, ignoring percept history (p. 48). It operates via **condition-action rules** (`if condition then action`) (p. 48).
*Pseudocode (p. 49):*
```

function SIMPLE-REFLEX-AGENT(percept) returns an action persistent: rules, a set of condition-action rules state <- INTERPRET-INPUT(percept) rule <- RULE-MATCH(state, rules) action <- rule.ACTION return action

```
*Vacuum Program (p. 48):* `function REFLEX-VACUUM-AGENT([location, status]) returns action`: `if status = Dirty then return Suck else if location = A then return Right else if location = B then return Left`.
*Box-and-Arrow Flow:*
Environment sends `Percept` \\(\to\\) `Sensors` \\(\to\\) passes current state to `"What action I should take"` (which receives rule match from `Condition-action rules`) \\(\to\\) passes action to `Actuators` \\(\to\\) executes in Environment.
*Limitation:* Simple reflex agents work strictly in fully observable environments; under partial observability, they frequently fall into unrecoverable infinite loops (p. 49–50). Randomization can break infinite loops, but deterministic model-based agents perform better (p. 50).
### 2.4.3 Model-based reflex agents
A **model-based reflex agent** handles partial observability by maintaining an **internal state** tracking unobserved aspects of the world (p. 50). Updating internal state requires two knowledge models (p. 51):
1. **Transition model**: Knowledge of "how the world evolves" independently and "what my actions do" (p. 51).
2. **Sensor model**: Knowledge of "how the state of the world is reflected in my percepts" (p. 51).
*Pseudocode (p. 51):*
```

function MODEL-BASED-REFLEX-AGENT(percept) returns an action persistent: state, current conception of world state transition_model, description of world evolution/action effects sensor_model, description of world state to percept mapping rules, set of condition-action rules action, most recent action state <- UPDATE-STATE(state, action, percept, transition_model, sensor_model) rule <- RULE-MATCH(state, rules) action <- rule.ACTION return action

```
*Box-and-Arrow Flow:*
Environment sends `Percept` \\(\to\\) `Sensors` \\(\to\\) updates `Model of World` (incorporating prior `State`, `"How the world evolves"`, and `"What agent actions do"`) \\(\to\\) passes state description to `"What action I should take"` (matched against `Condition-action rules`) \\(\to\\) passes action to `Actuators`.
Internal state represents the agent's "best guess" under state uncertainty (p. 52).
### 2.4.4 Goal-based agents
A **goal-based agent** combines state descriptions with explicit **goal** descriptions specifying desirable situations (p. 52). Decision making considers the future: "What will happen if I take action \\(A\\)?" and "Will that achieve my goal?" (p. 52–53). Search (Chapters 3–5) and planning (Chapter 11) find action sequences to achieve goals (p. 53).
*Box-and-Arrow Flow:*
Environment sends `Percept` \\(\to\\) `Sensors` \\(\to\\) updates `Model of World` (using `"How the world evolves"` and `"What agent actions do"`) \\(\to\\) predicts `"Model of world if I take certain actions"` \\(\to\\) passes candidate future states to `"What action I should take"` (evaluating against `Goals`) \\(\to\\) passes chosen action to `Actuators`.
*Flexibility:* Changing destinations requires updating only the goal string, whereas a reflex agent requires rewriting every condition-action rule (p. 53).
### 2.4.5 Utility-based agents
A **utility-based agent** uses an internal **utility function** \\(U(s)\\) mapping world states to real numbers to evaluate state desirability ("happiness") (p. 53–54).
> [!NOTE]
> The Sep 14 lecture slides stopped at Goal-Based agents; Utility-Based and Learning agents are covered from the textbook as lecture has not reached them yet.
Utility functions internalize the external performance measure, enabling rational decisions when goals conflict (speed vs. safety trade-offs) or when multiple goals cannot be achieved with certainty (p. 54).
Under uncertainty, rational utility-based agents choose actions that maximize **expected utility**:
\\[\text{Action} = \arg\max_{a} \sum_{s'} P(s' \mid s, a) U(s')\\]
where \\(P(s' \mid s, a)\\) is the probability of outcome state \\(s'\\) given action \\(a\\) in state \\(s\\) (p. 54).
A **model-free agent** learns optimal actions directly without constructing an explicit transition model (p. 54–55).
### 2.4.6 Learning agents
A **learning agent** framework divides architecture into four functional components (p. 55):
1. **Learning element**: Makes structural improvements to knowledge components based on feedback (p. 55).
2. **Performance element**: Selects external actions based on percepts (previously considered the entire agent program) (p. 55).
3. **Critic**: Evaluates agent behavior against a fixed external performance standard to generate learning feedback (p. 55).
4. **Problem generator**: Suggests exploratory actions that yield novel, informative experiences (p. 55).
Feedback is provided as scalar **reward** or **penalty** signals from the external performance standard, which must remain fixed outside the agent (p. 55).
### 2.4.7 How the components of agent programs work
Agent program components represent world states along an axis of increasing **expressiveness** (p. 56–58):
1. **Atomic representation**: Each state is an indivisible, structureless "black box" identified only by its identity (standard search, BFS, A*, HMMs, MDPs) (p. 56–57).
2. **Factored representation**: Splits each state into a fixed vector of **variables** or **attributes**, each taking a **value** (CSPs, propositional logic, planning, Bayesian networks) (p. 57).
3. **Structured representation**: Explicitly encodes individual objects, their attributes, and explicit relationships among objects (first-order logic, relational databases, NLP) (p. 57–58).
*Trade-off:* Expressive representations are far more compact (chess rules in 1 page vs. thousands in factored vs. \\(10^{38}\\) in atomic), but reasoning complexity increases (p. 58).
*Memory Mapping:* **Localist representation** (1-to-1 concept to memory location mapping) vs. **distributed representation** (concepts spread across multidimensional space, providing noise robustness) (p. 58).
## Worked Example
End-to-end trace of the automated taxi driver through Chapter 2 frameworks:
1. *PEAS Formulation (p. 42):*
   - Performance Measure: Safety, speed, legal compliance, passenger comfort, profit maximization, wear/fuel minimization.
   - Environment: City streets, traffic, pedestrians, weather, road hazards.
   - Actuators: Accelerator, brake, steering wheel, indicators, horn, display screen.
   - Sensors: Cameras, radar, lidar, GPS, speedometer, accelerometer, engine sensors.
2. *Environment Classification (p. 44–46):*
   - Observability: Partially observable (cannot see around obstructions or behind vehicles).
   - Agent Number: Multiagent (partially cooperative regarding collision avoidance, competitive for parking/lanes).
   - Determinism: Stochastic / Nondeterministic (traffic behavior and weather are uncertain).
   - Episodic vs. Sequential: Sequential (early driving choices affect downstream traffic states).
   - Static vs. Dynamic: Dynamic (traffic continues moving during deliberation).
   - Discrete vs. Continuous: Continuous (speed, position, and steering sweep over continuous domains).
   - ==*Known vs. Unknown:*== Known laws of physical movement, but unknown user destination preferences until instructed (p. 45–46).
3. *Agent Architecture Execution (p. 48–56):*
   - Simple Reflex Failure: Braking based strictly on a single video frame fails if brake lights are obscured or missing, causing infinite loops.
   - Model-Based Reflex: Tracks unobserved state via transition model (car momentum) and sensor model (interpreting camera glare).
   - Goal-Based Planning: Evaluates turn options at junctions to navigate to the passenger's destination.
   - Utility Maximization: Weighs conflicting trade-offs (driving faster vs. passenger comfort) by choosing actions maximizing expected utility.
   - Learning Integration: Uses critic feedback (passenger tips/complaints) and problem generator (exploring alternate routes) to refine driving models.
## Connections
- **Lecture (CSCI 4511W Sep 14, 2026):**
  - *Emphasized Definitions:* Defined Agent, Percept, Percept Sequence, and **State**. The term **State** ("a unique configuration of agent in its environment") is a professor-added term, not a named textbook glossary entry in 2.1.
  - *Environment Properties:* The lecture slide headlined only 5 properties (Observability, Agent Number, Determinism, Static vs. Dynamic, Discrete vs. Continuous), omitting Episodic vs. Sequential and Known vs. Unknown from the textbook's 7 axes.
  - *Architecture Diagrams:* Slides presented diagrams stopping at Goal-Based agents, reproducing exact labels: `Percept`, `Sensors`, `Condition-action rules`, `"What action I should take"`, `Actuators`, `Model of World`, `"How the world evolves"`, `"What agent actions do"`, `Goals`, `"Model of world if I take certain actions"`.
  - *Unreached Coverage:* The lecture has not yet reached Utility-Based or Learning agents.
- **Textbook:**
  - (pending Chapter 3 — search)
## Open Questions
- [ ] How does a model-based reflex agent update its internal state when its sensor model contains significant noise and the environment is nondeterministic?
- [ ] In what specific task environments would a randomized simple reflex agent outperform a deterministic model-based agent?
- [ ] Why is an explicit utility function necessary for rational decision-making when goals are strictly conflicting?
- [ ] How does the problem generator in a learning agent balance short-term performance penalties against long-term informational gain?
- [ ] ==What are the precise computational trade-offs== when implementing search algorithms using atomic vs. factored state representations?
## Flashcards
Why does a table-driven agent fail in realistic physical environments?::Because percept history lookup tables grow exponentially (\\(\sum_{t=1}^T |\mathcal{P}|^t\\)), requiring storage exceeding the number of atoms in the universe (\\(10^{80}\\)) for even one hour of video driving (p. 47). #cards/ai
What is the fundamental difference between an agent function and an agent program?::An agent function is an abstract mathematical mapping (\\(f: \mathcal{P}^* \to \mathcal{A}\\)) from percept histories to actions, whereas an agent program is a concrete implementation running on a physical architecture that processes only the current percept (p. 36–37, 47). #cards/ai
How does a model-based reflex agent overcome the core limitation of a simple reflex agent?::Simple reflex agents fail under partial observability due to infinite loops, whereas model-based reflex agents maintain internal state updated by transition and sensor models to track unobserved world aspects (p. 49–51). #cards/ai
Why are goal-based agents more flexible than reflex agents when task specifications change?::Reflex rules are hardcoded for specific actions and destinations, whereas goal-based agents combine explicit goal state descriptions with world models, allowing behavior changes simply by updating the goal string (p. 53). #cards/ai
What structural advantage does a utility-based agent have over a goal-based agent?::Goals provide only binary happy/unhappy targets, whereas a utility function assigns continuous real-valued scores to states, enabling rational trade-offs among conflicting goals and decision-making under uncertainty via Expected Utility Maximization (p. 53–54). #cards/ai
What is the operational role of the critic versus the performance element in a learning agent?::The performance element chooses external actions based on percepts, while the critic evaluates actions against a fixed external performance standard to provide learning feedback (p. 55). #cards/ai
How do atomic, factored, and structured representations contrast in expressive power?::Atomic representations treat states as indivisible black boxes; factored representations split states into attribute-value vectors; structured representations encode explicit objects and relationships (p. 56–58). #cards/ai
==Why must a learning agent's performance standard remain fixed outside the agent?==::Because if the agent could modify its performance standard, it could lower its standards to match poor behavior rather than learning to improve performance (p. 55). #cards/ai