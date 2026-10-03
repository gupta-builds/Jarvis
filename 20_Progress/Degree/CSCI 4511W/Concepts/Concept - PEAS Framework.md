---
type: concept
status: sprout
created: 2026-10-02
updated: 2026-10-02
course: "[[CSCI 4511W Board]]"
track: ai
mastery_level: 0
prerequisites: []
used_in: []
evidence:
  - "[[20_Progress/Degree/CSCI 4511W/Weekly/Week - 2|Week - 2]]"
  - "[[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 2|Chapter - 2]]"
tags:
  - concept
---
# Concept - PEAS Framework
## One-Line Answer
==PEAS is the four-component vocabulary for fully specifying a rational agent's task environment before choosing any architecture: Performance measure, Environment, Actuators, Sensors.==
## Mechanism
PEAS gives the design checklist that precedes any agent implementation. Each component answers a different question:

- **Performance measure (P)**: what counts as success — the external criterion the agent's actions will be evaluated against. Defined over *sequences of environment states*, not individual actions. Formulation warning: measure what you actually want achieved, not a proxy; a misspecified P produces a rational agent optimizing the wrong objective (King Midas problem — vacuum that scores on dirt volume sucked will dump and re-suck to maximize score).
- **Environment (E)**: the full domain in which the agent operates — everything the agent does not control. Must be described before choosing a sensor suite; what the sensors can observe depends entirely on what the environment contains.
- **Actuators (A)**: the output channels through which the agent acts on the environment. Defines the action space. A vacuum agent's actuators are Suck, MoveLeft, MoveRight; a taxi's are steering wheel, accelerator, brake, indicators.
- **Sensors (S)**: the input channels through which the agent perceives the environment. Defines the observation space and directly determines the observability axis of the task environment (fully observable if sensors cover the complete state; partially otherwise).

Workflow: state PEAS first, then classify the resulting task environment along the seven property axes (Observability, Agent Number, Determinism, Episodic vs. Sequential, Static vs. Dynamic, Discrete vs. Continuous, Known vs. Unknown), then choose the least complex architecture that handles those properties.
## Contrast / What It Is Not
- **PEAS vs. agent architecture**: PEAS describes the *task* — the external problem structure. Architecture (Simple Reflex, Model-Based, Goal-Based, Utility-Based, Learning) describes the *agent's internals*. A PEAS spec does not determine architecture; the task environment *properties derived from PEAS* do. Partially observable P-environment → forces Model-Based or above.
- **Performance measure vs. utility function**: the performance measure is external — it evaluates sequences of world states from outside the agent. A utility function is internal — it is the agent's internalized representation of that measure. A utility-based agent approximates the performance measure with $U(s)$; they are not the same object.
- **PEAS vs. the six-tuple for search**: the six-tuple (state space, initial state, goal test, actions, transition model, action-cost function) formalizes how the agent's goal is computed. PEAS specifies why and in what context. PEAS answers "what does success look like and in what world?"; the six-tuple answers "how do we find the action sequence?".
## Failure Modes / Misconceptions
> [!WARNING]
> **Measuring the wrong proxy**: the most common PEAS failure is specifying a P that is easy to measure rather than what is actually wanted. "Volume of dirt sucked" vs. "squares that remain clean." The more capable the optimizer, the more aggressively it exploits the gap between the specified measure and the intended outcome.

> [!WARNING]
> **Conflating environment with state**: the Environment in PEAS is the full description of the domain (roads, other traffic, weather). State is a single configuration of that environment at one moment. The environment definition determines what states are possible; a state is an instance.

> [!WARNING]
> **Thinking a complete PEAS spec means you have a rational agent**: PEAS specifies the task. A rational agent still requires an architecture that can handle the task environment properties and an action-selection mechanism that maximizes P. PEAS is the prerequisite to agent design, not the design itself.
## Evidence From This Vault
- [[20_Progress/Degree/CSCI 4511W/Weekly/Week - 2|Week - 2]] — Lecture 02 (9/14) introduced the formal PEAS vocabulary for the first time with full Vacuum World and taxi driver worked examples.
- [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 2|Chapter - 2]] §2.3.1 — full formalization with the taxi driver PEAS table and five additional agent examples (medical diagnosis, satellite image analysis, part-picking robot, refinery controller, English tutor).
## Flashcards
#cards/csci4511w
What does **each letter of PEAS** stand for and what question does it answer?::Performance measure (what counts as success over state sequences), Environment (what domain the agent operates in), Actuators (how the agent acts), Sensors (how the agent perceives). Together they fully specify the agent's task before any architecture is chosen. #cards/csci4511w
What is the **King Midas problem** in performance measure design?::Specifying a measurable proxy instead of the real objective. A vacuum rewarded on volume of dirt sucked will dump and re-suck dirt indefinitely. The fix is to measure what you actually want (clean squares per time step) not how you think the agent should behave. #cards/csci4511w
How does PEAS differ from the **six-tuple search formulation**?::PEAS specifies the agent's task — what success means (P), in what world (E), with what interface (A and S). The six-tuple (state space, initial state, goal test, actions, transition model, action cost) specifies how a goal-based agent computes an action sequence. PEAS is the why; the six-tuple is the how. #cards/csci4511w
