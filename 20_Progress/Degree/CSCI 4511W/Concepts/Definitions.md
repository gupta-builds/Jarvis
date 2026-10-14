---
type: class
input_kind: concept
status: seed
created: 2026-10-13
updated: 2026-10-13
area:
  - "[[CSCI 4511W Board]]"
  - "[[20_Progress/Degree/CSCI 4511W/Weekly/Week - 1|Week 1]]"
tags:
  - class
  - AI
next: "Explain the Week 1 distinctions without looking, then extend the glossary from Week 2"
---
# CSCI 4511W Definitions
## Week 1 vocabulary and Week 2 bridge
Source: [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 1|Chapter 1]] §1.1-1.3; [[20_Progress/Degree/CSCI 4511W/Discussion/Discussion 1 — Turing 1950|Turing]] §1-7; [[20_Progress/Degree/CSCI 4511W/Weekly/Week - 1|Week 1]] live PEAS capture. Percept, percept sequence, state, and the formal agent function below are Week 2 continuations from Lecture 02 slides 3-5 and [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 2|Chapter 2]]. This glossary does not turn them into recorded Week 1 lecture content.
| Term | Meaning and distinction |
|---|---|
| Agent | A system that perceives through sensors and acts through actuators in an environment |
| Rational agent | Chooses an action expected to maximize its performance measure given the percept sequence, prior knowledge, and available actions |
| Performance measure | External criterion for success over the task's specified horizon; different from the agent's internal utility function |
| Environment | The world in which the agent operates; a state is one configuration of that world |
| Sensors | Mechanisms supplying observations; a percept is the information received |
| Actuators | Mechanisms executing actions; `Suck` is an action, not a physical motor |
| Percept | Sensor information at one moment |
| Percept sequence | Complete history of percepts available to the agent function |
| State | A configuration of the agent and environment; it may contain information the sensors do not reveal |
| Agent function | Abstract mapping from percept sequences to actions; an implementation must retain relevant history internally |
| Utility function | Internal representation of preferences among outcomes; maximizing it only serves the intended task when it matches the external criterion |
| Omniscience | Knowledge of actual future outcomes; rationality does not require this |
| Limited rationality | Appropriate action under computational limits; an approximation still needs evaluation |
| Machine learning | Improvement from experience, one part of AI rather than a synonym for the whole field |
| Cognitive modeling | A testable account of human thought processes, requiring evidence about humans |
| Logical reasoning | Deriving conclusions through valid inference; useful inference and useful action are separate questions |
| Computability | Whether an effective procedure can solve a problem in principle |
| Tractability | Whether solving instances requires feasible time/resources; computability alone does not establish this |
| Value alignment | Agreement between the specified machine objective and the human preferences the system should serve |
| Imitation Game | Turing's written interaction criterion; the original paper starts with a man/woman identification game and replaces one participant with a machine |
| Universal digital computer | Can simulate discrete-state computation with adequate program, storage, and speed; this is not a promise of efficient intelligence |
| Child machine | An initial learning system educated through experience instead of a fully hand-programmed adult mind |
## Four AI approaches
| | Human criterion | Rational criterion |
|---|---|---|
| Thought | Thinking humanly: match human cognitive mechanisms | Thinking rationally: use valid reasoning |
| Behavior | Acting humanly: match human behavior | Acting rationally: maximize expected task performance |
Chapter 1 organizes the book around rational action while retaining the other approaches as distinct research goals. Turing's behavioral test can be precise without becoming the book's optimization objective.
## Apply the vocabulary
In the two-room vacuum, the physical state includes location and both dirt statuses. The local percept contains only current location and that room's status, so the agent does not observe every component of the physical state. A simple reflex policy reacts to the current percept; a model-based policy can remember previously cleaned rooms. The local AIMA simulator and the sample long quiz use different scoring rules, so their totals cannot be compared without restating the performance measure.
## Flashcards
#cards/csci4511w
How do **sensor and percept** differ?::The sensor is the input mechanism; the percept is the information it supplies at one moment. #cards/csci4511w
How do **state and percept** differ in the two-room vacuum?::The state includes both rooms' dirt and the agent location; the percept reveals only location and current-room dirt. #cards/csci4511w
Why does **computable** not imply tractable?::An algorithm may exist while its time or memory grows beyond feasible resources on the relevant instances. #cards/csci4511w
