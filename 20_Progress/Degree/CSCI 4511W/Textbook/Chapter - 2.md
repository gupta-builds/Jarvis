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
==An intelligent agent maps percept history to action, and rational agent design begins by specifying the performance measure, environment, actuators, and sensors that make that mapping meaningful.==
*Mechanism:* Rationality is conditional, not a personality trait. The right action depends on the success criterion, prior knowledge, available actions, and percept sequence. The environment then determines what the agent must remember and reason about: partial observability calls for internal state, goals call for lookahead, conflicting or uncertain outcomes call for utility, and unknown conditions call for learning.
## Key Concepts
- **Agent:** Anything that can be viewed as perceiving an environment through sensors and acting through actuators. The definition is an analysis tool, not a claim that every calculator or artifact is usefully an agent.
- **Percept:** The content currently received by the agent's sensors.
- **Percept sequence:** The complete history of an agent's percepts. The abstract agent function may depend on this entire history.
- **Agent function:** The mathematical mapping from every possible percept sequence to an action.
- **Agent program:** The concrete implementation that receives the current percept and returns an action. It must remember relevant history if behavior depends on more than the current percept.
- **Performance measure:** The external criterion used to evaluate the sequence of environment states produced by the agent. It should describe what should be achieved, not merely the designer's preferred procedure.
- **Rational agent:** For each percept sequence, an agent that selects the action expected to maximize the performance measure given its evidence, knowledge, and available actions.
- **Information gathering:** Acting to improve future percepts or knowledge, such as looking both ways before crossing or exploring an unknown building.
- **Autonomy:** The degree to which behavior is based on the agent's own experience and learning rather than only on the designer's initial assumptions.
- **PEAS:** A task-environment description consisting of **Performance**, **Environment**, **Actuators**, and **Sensors**. It is the first design artifact for a rational agent.
- **Fully observable vs. partially observable:** A fully observable environment exposes all action-relevant state; a partially observable one hides state through missing or noisy sensors.
- **Single-agent vs. multiagent:** An entity counts as another agent when modeling it as optimizing a performance measure that depends on the focal agent's behavior is useful.
- **Deterministic vs. nondeterministic:** In a deterministic environment, the current state and action determine the next state; otherwise multiple outcomes are possible. **Stochastic** means those possibilities are assigned probabilities.
- **Episodic vs. sequential:** In episodic tasks, each decision is independent of earlier actions; in sequential tasks, current actions change future decisions and outcomes.
- **Static, dynamic, and semidynamic:** A dynamic environment changes while the agent deliberates; a static one does not; a semidynamic one stays physically fixed while the score changes with time.
- **Discrete vs. continuous:** The distinction may apply to states, time, percepts, or actions. Chess is mostly discrete; taxi driving is continuous.
- **Known vs. unknown:** This describes the agent's knowledge of the environment's transition rules or outcome probabilities, not a property of the environment independent of the agent.
- **Agent architecture:** The hardware or platform that connects sensors to the program and the program to actuators.
- **Simple reflex agent:** Chooses from the current percept using condition–action rules and ignores history.
- **Model-based reflex agent:** Maintains internal state using a transition model of how the world changes and a sensor model of how the world appears.
- **Goal-based agent:** Uses explicit goal information and a model to choose actions that eventually reach desirable states. Search and planning support this design.
- **Utility-based agent:** Uses a utility function to rank outcomes and chooses actions that maximize expected utility, allowing explicit tradeoffs and uncertainty.
- **Learning agent:** Separates action selection from improvement. Its learning element changes the performance element using feedback from a critic, while a problem generator proposes informative exploration.
- **Atomic, factored, and structured representations:** Atomic states are indivisible; factored states use variables and values; structured states represent objects and relations. Greater expressiveness usually makes reasoning harder.
- **Localist vs. distributed representation:** A localist representation maps a concept to one location; a distributed representation spreads concepts across locations, improving robustness to partial noise and loss.
## Full Reading Notes
### 2.1 Agents and Environments
The agent abstraction has four moving parts:

- **Sensors** receive percepts.
- The **percept sequence** records everything received so far.
- The **agent function** maps that sequence to an action.
- **Actuators** change the environment.

The environment is not necessarily the whole universe. It is the portion whose state affects the agent's percepts or is affected by its actions. For a human, eyes and ears are sensors and limbs and speech are actuators. For a software agent, files, network packets, and keyboard input can be percepts; writing files, sending packets, or displaying output can be actions.

The agent function is an external, mathematical characterization. The agent program is an internal implementation. Keeping these separate matters: many different programs can implement the same function, and a useful program should compress a huge action table into a manageable mechanism.

The two-square **vacuum world** makes the abstraction concrete. The agent knows its location and whether the current square is dirty; it can move left or right, suck, or do nothing. A simple rule is: if the current square is dirty, suck; otherwise move to the other square. The example also shows why rationality cannot be discussed without specifying sensors, actions, world dynamics, and the scoring rule.
### 2.2 Good Behavior: The Concept of Rationality
#### 2.2.1 Performance measures
The book uses a consequentialist evaluation: judge behavior by the sequence of environment states it produces. A **performance measure** assigns desirability to those states.

The vacuum-world example exposes a design trap. If the score is “amount of dirt cleaned in eight hours,” a rational vacuum can repeatedly dump and re-clean the same dirt. A better measure rewards clean squares over time and can penalize electricity or noise. The rule is: score the desired state of the world, not the procedure the designer imagines the agent should follow.

Even a seemingly good measure leaves value questions. Two vacuums can produce the same average cleanliness, with one providing steady mediocre service and the other alternating intense cleaning with long breaks. The chapter leaves that tradeoff open because performance design contains a normative choice, not only a programming choice.
#### 2.2.2 Rationality
The rational action at a point depends on four things:

1. The **performance measure**.
2. The agent's **prior knowledge** of the environment.
3. The **actions** available to the agent.
4. The **percept sequence** observed so far.

The definition is: for each possible percept sequence, select the action expected to maximize the performance measure given the evidence in that sequence and the built-in knowledge.

The simple vacuum agent is rational only under stated assumptions: the score gives one point per clean square per time step over 1000 steps; geography is known; dirt placement and starting location are unknown; clean squares stay clean; suction works; movement is bounded by the two-square layout; and the sensors correctly report location and dirt. Change those assumptions and the same program may become irrational. If movement costs points, it should stop moving when all squares are clean. If dirt reappears, it should revisit. If the geography is unknown, it must explore.
#### 2.2.3 Omniscience, learning, and autonomy
**Rationality is not omniscience.** A rational agent maximizes expected performance using available evidence; it does not know the actual outcome in advance. Crossing a street can be rational even if an unforeseeable airplane part later causes an accident. Hindsight evaluates actual performance; rationality evaluates the decision under the information available at the time.

Information gathering is itself an action. Looking both ways before crossing changes the agent's future percepts and can improve expected performance. Exploration plays the same role for a vacuum agent in an unknown environment.

Learning lets the agent revise its initial model. The dung beetle and sphex wasp examples show the failure of rigid built-in behavior: when an assumption is violated, the animal repeats a plan instead of updating it. An autonomous agent uses its own percepts and learning to compensate for incomplete or incorrect designer knowledge. Complete autonomy from the first moment is not required; useful initial knowledge can bootstrap later learning.
### 2.3 The Nature of Environments
The task environment is the problem to which the agent is the solution. Its properties determine what the agent must observe, remember, predict, and optimize.
#### 2.3.1 Specifying the task environment
The **PEAS** description is the first design step:

- **Performance:** What counts as success?
- **Environment:** What external states and entities matter?
- **Actuators:** What can the agent change?
- **Sensors:** What can the agent observe?

For an automated taxi, performance may combine destination accuracy, fuel and wear, travel time and cost, law compliance, safety, passenger comfort, and profit. These objectives conflict, so the final design needs tradeoffs rather than a single naive target.

The taxi's environment includes roads, traffic, pedestrians, animals, construction, police, weather, passengers, and regional rules. Its actuators include throttle, steering, brakes, passenger communication, and possibly vehicle-to-vehicle communication. Its sensors include cameras, lidar, ultrasound, speed and acceleration sensors, vehicle-health sensors, GPS, and passenger touchscreen or voice input. The example generalizes to software agents: a Web-trading softbot may face millions of users and billions of objects even though its environment is virtual.
#### 2.3.2 Properties of task environments
The dimensions are independent; one environment can be easy along one axis and difficult along another.

- **Fully observable / partially observable:** Sensors expose all action-relevant state, or they do not. A local dirt sensor makes the vacuum world partially observable because the agent cannot see the other square. No sensors at all makes it unobservable.
- **Single-agent / multiagent:** A crossword is normally single-agent. Chess is competitive multiagent. Taxi driving is both cooperative and competitive: avoiding collisions helps everyone, but parking spaces can conflict.
- **Deterministic / nondeterministic:** The next state is fixed by the current state and action, or several outcomes are possible. Partial observability can make a deterministic world appear nondeterministic.
- **Stochastic / nondeterministic:** The book reserves “stochastic” for models that attach probabilities to outcomes; “nondeterministic” lists possible outcomes without quantifying them.
- **Episodic / sequential:** Defective-part classification is episodic when each decision is independent. Chess and taxi driving are sequential because current actions alter future choices.
- **Static / dynamic / semidynamic:** A crossword is static; taxi driving is dynamic; chess with a clock is semidynamic because the board may remain fixed while the score changes with time.
- **Discrete / continuous:** Chess has discrete states, actions, and time steps. Taxi driving involves continuous position, speed, steering, and time.
- **Known / unknown:** A known environment provides action outcomes or their probabilities. An unknown environment requires learning the rules. This axis is about the agent's knowledge, not an absolute label on the world.

The axes can combine into very difficult settings. Taxi driving is partially observable, multiagent, nondeterministic, sequential, dynamic, and continuous, while usually being mostly known. Diagnosis can be episodic or sequential and single-agent or partly multiagent depending on whether the task includes only selecting a diagnosis or also testing, treating, and negotiating with patients and staff.

Evaluation should use an **environment class**, not a single lucky run. A taxi agent should be tested across traffic, lighting, weather, and road conditions, then judged by average performance over those environments.
### 2.4 The Structure of Agents
The central engineering equation is:

$$
\text{agent} = \text{architecture} + \text{program}
$$

The architecture exposes sensor inputs, runs the program, and sends its action choices to actuators. The program must fit the architecture: a program that returns `Walk` is useless on hardware with no legs.
#### 2.4.1 Agent programs
The agent program receives the current percept, not the whole history. If the correct action depends on earlier percepts, the program must store the relevant history internally.

The table-driven agent makes this explicit by storing the entire percept sequence and looking up an action. It is conceptually correct but physically impossible. If $P$ is the set of possible percepts and $T$ is the agent's lifetime, the table contains approximately $\sum_{t=1}^{T}|P|^t$ entries. For an automated taxi, one camera can produce roughly 70 MB/s, producing a table with more than $10^{600,000,000,000}$ entries for one hour. Even chess has at least $10^{150}$ possible entries, compared with fewer than $10^{80}$ atoms in the observable universe.

The point is not that the table-driven agent is logically wrong. It implements the desired function if the table is filled correctly. The point is that AI must find compact programs that generate rational behavior instead of storing every possible history.
#### 2.4.2 Simple reflex agents
A **simple reflex agent** chooses an action from the current percept alone. Its rules have the form:

```text
if car-in-front-is-braking then initiate-braking
```

This is compact and fast when the current percept contains all relevant information. It breaks under partial observability. A single camera frame may not distinguish brake lights from taillights, and a vacuum agent without a location sensor may loop forever by always choosing the same direction after seeing `[Clean]`.

Randomization can sometimes rescue a simple reflex agent. If the location-blind vacuum flips a coin between Left and Right, it reaches the other square in an average of two steps. This is a useful escape from a deterministic loop, but it is usually a patch; a better agent maintains state.
#### 2.4.3 Model-based reflex agents
A model-based agent tracks hidden state. It needs:

- A **transition model** describing how the world changes because of actions and independent events.
- A **sensor model** describing how world states produce percepts.

The agent combines its old internal state with the new percept to update its best current description of the world. It may not know the exact state—such as what is hidden behind a truck—but it can maintain a best guess or a set of possibilities. This is the minimum architectural response to partial observability.
#### 2.4.4 Goal-based agents
State information alone may not determine an action. At a junction, left, right, and straight can all be physically possible; the destination determines which is useful. A **goal-based agent** combines the model of the world with explicit goal information.

Goal-based behavior looks ahead: “What happens if I do this?” and “Will that eventually reach the goal?” Search and planning are the AI subfields that find action sequences. Goal-based agents can be less efficient than reflex rules, but they are more flexible because changing the destination changes the goal rather than requiring every turning rule to be rewritten.
#### 2.4.5 Utility-based agents
Goals provide only a binary distinction between achieved and not achieved. A taxi may reach the destination by many routes, but the routes differ in speed, safety, reliability, and cost. A **utility function** ranks those outcomes and internalizes the external performance measure.

Utility is especially useful when goals conflict or success is uncertain. Speed and safety may not both be maximized, and a low-probability high-value outcome may need to be weighed against a likely but less valuable one. A rational utility-based agent chooses the action with the highest expected utility:

$$
EU(a) = \sum_{s'} P(s' \mid a)U(s')
$$

Here $P(s' \mid a)$ is the probability of outcome state $s'$ after action $a$, and $U(s')$ is the value assigned to that state. The formula turns the global idea of rational behavior into a local decision rule, but computing the probabilities, utilities, and best action can still be very difficult. Model-free agents can learn which actions work without explicitly learning how the world changes.
#### 2.4.6 Learning agents
Any architecture can be made into a learning agent. The four conceptual components are:

- **Performance element:** Chooses external actions. This is the part earlier diagrams treated as the whole agent.
- **Learning element:** Uses feedback to modify the performance element.
- **Critic:** Compares behavior with a fixed external performance standard. Percepts alone do not say whether checkmating an opponent is good; the performance standard supplies that judgment.
- **Problem generator:** Proposes exploratory actions that may be suboptimal now but informative for future improvement.

The design question is not “How do I make it learn?” first. It is “What performance element should exist after learning?” Once that is clear, learning mechanisms can improve its model, reflex rules, goals, or utility function.

Exploration creates an explore–exploit tradeoff. Galileo's falling-rock experiment was not valuable because breaking rocks was the goal; it was valuable because the observations improved the theory. Similarly, a taxi may test braking on different wet surfaces to improve its transition model. Feedback can be explicit, such as tips or penalties, or indirect, such as passengers covering their ears and disconnecting an unnecessarily loud horn.

The unifying definition is: learning modifies an agent's components so they agree more closely with available feedback and therefore improve performance.
#### 2.4.7 How the components of agent programs work
Agent components must represent states, transitions, objects, and preferences. The chapter introduces an expressiveness axis:

- **Atomic representation:** Each state is an indivisible black box. A route-planning state can be only the current city. Search, game playing, hidden Markov models, and Markov decision processes often use this level.
- **Factored representation:** Each state is a fixed set of variables with values, such as GPS coordinates, fuel, oil status, toll money, and radio station. Constraint satisfaction, propositional logic, planning, Bayesian networks, and many learning algorithms use this level.
- **Structured representation:** States contain objects, attributes, and relations, such as a truck backing into a farm driveway while a cow blocks its path. First-order logic, relational databases, and natural language understanding need this expressiveness.

More expressive representations can state more with fewer symbols, but reasoning and learning become harder. The book's chess comparison makes the tradeoff vivid: a structured representation can describe the rules compactly, while a factored or atomic representation may require vastly more space. Real systems may need several representation levels at once.

The second axis is **localist versus distributed representation**. Localist coding assigns one memory location to one concept; distributed coding spreads a concept across many locations and reuses each location across concepts. Distributed representations degrade more gracefully: noise moves a concept toward a nearby meaning rather than turning one arbitrary symbol into an unrelated one.
## Worked Example: Designing an Automated Taxi
Start with PEAS before choosing an algorithm. If the performance measure rewards only arrival speed, the resulting agent will likely violate safety and comfort. If the sensor list omits camera, lidar, speed, or vehicle-health information, no amount of search can recover state the architecture cannot observe.

Then classify the environment: it is partially observable because drivers and obstacles are hidden; multiagent because other drivers and passengers matter; nondeterministic because traffic and hardware can surprise the agent; sequential because a lane change affects future options; dynamic because the world changes while the agent computes; continuous because position and steering vary smoothly; and mostly known but never perfectly so.

That classification predicts the architecture. A simple reflex rule handles immediate braking, a model-based component tracks hidden traffic, a goal-based component plans a route, a utility-based component trades time against safety and comfort, and a learning element improves models from feedback. The design is layered because the environment is layered.
## Connections
- **Lecture:** The course schedule assigns Chapter 2.1–2.4 to the 9/14 lecture under **Intelligent Agents**; the full lecture note has not yet been captured in the vault, so no lecture details are invented here. See [[CSCI 4511W Board#Schedule|the dated course schedule]].
- **Previous lecture vocabulary:** [[20_Progress/Degree/CSCI 4511W/Weekly/Week - 1|Week - 1]] records Performance Measure, Environment, Actuators, Sensors, and Vacuum World; Chapter 2 supplies the formal definitions and design consequences.
- **Next course move:** Chapter 3 (to create) will use the goal-based agent idea to formulate and solve search problems.
- **Concept queue:** [[20_Progress/Degree/CSCI 4511W/Concepts/AI Concept Board|AI Concept Board]] and [[20_Progress/Degree/CSCI 4511W/Concepts/Definitions|Definitions]] are empty existing placeholders for future standalone notes on rationality, PEAS, environment properties, and agent architectures.
## Open Questions
- [ ] Write the PEAS description for a course-assignment assistant and identify at least two conflicting performance objectives.
- [ ] Classify the vacuum world, chess, a defective-part classifier, and an automated taxi on all seven environment dimensions.
- [ ] Explain why a known environment can still be partially observable and why an unknown environment can still be fully observable.
- [ ] Compare simple reflex, model-based, goal-based, and utility-based agents on the same taxi scenario.
- [ ] Explain why the table-driven agent is conceptually correct but physically unusable.
## Flashcards
What four factors determine whether an action is rational?::The performance measure, prior knowledge of the environment, available actions, and percept sequence so far. #cards/ai
What does PEAS stand for, and why is it written before choosing an algorithm?::Performance, Environment, Actuators, Sensors; it defines what success means, what the agent can observe, and what it can change. #cards/ai
What is the difference between fully observable and known?::Fully observable concerns whether the sensors reveal all action-relevant state; known concerns whether the agent knows the environment's rules or outcome probabilities. #cards/ai
Why does a model-based reflex agent need both a transition model and a sensor model?::The transition model predicts how the world changes, while the sensor model explains how world states appear in percepts; together they update hidden state. #cards/ai
Why are goals weaker than utilities?::Goals say whether a state is achieved, while utilities rank different achieved or partially achieved outcomes and express tradeoffs such as speed versus safety. #cards/ai
What are the four parts of a learning agent?::Performance element, learning element, critic, and problem generator. #cards/ai
What is the representation tradeoff between atomic, factored, and structured states?::Expressiveness and compactness increase from atomic to structured, but the complexity of reasoning and learning generally increases too. #cards/ai
