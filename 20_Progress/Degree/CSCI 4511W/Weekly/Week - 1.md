---
type: class
input_kind: lecture
status: seed
created: 2026-09-09
updated: 2026-10-02
area:
  - "[[CSCI 4511W Board]]"
  - "[[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 1|Chapter - 1]]"
tags:
  - "#class"
  - "#Lecture"
next: "[[20_Progress/Degree/CSCI 4511W/Weekly/Week - 2|Week - 2]]"
---
# Week - 1
## What you must be able to do
- [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 1|Chapter 1]] — Explain why AI is organized around rational agents rather than human-like behavior; name the four historical AI definitions and say which the course targets.
- Define **agent**, **performance measure**, **environment**, **actuators**, and **sensors**; apply all five to the Vacuum World example without looking at notes.
- Distinguish what makes something an agent (perceives environment, acts on it) from what makes it *rational* (acts to maximize expected performance given available information).
- Explain Turing's reframing: why he replaces "Can machines think?" with the Imitation Game, and what behavioral criterion the game actually tests.
- Name and briefly characterize at least three of the nine objections Turing pre-empts in §6 of the 1950 paper, and Turing's response to each.
- Explain Turing's "child machine" proposal and why it maps onto modern machine learning framing.
## Key ideas (short)
- **Rational agent** vs. **human-like agent**: rationality is the engineering target because expected utility is mathematically expressible; acting humanly requires matching human behavior, which is inconsistent and has no clean criterion.
- **PEAS** gives the vocabulary for specifying what an agent *is* — formal treatment arrives in Ch 2, but the intro lecture introduced all four terms.
- **Vacuum World** is the course's canonical toy domain: two rooms, dirt states, three actions — concrete enough to trace every PEAS component without ambiguity.
- Turing's move: replace a philosophical question with a behavioral test, then pre-empt 9 classes of objection. The nine-objection structure is the real content of the 1950 paper.
- **Learning machines**: Turing's child machine proposal treats intelligence as a search problem — find the right initial structure and education process. Published in 1950, this is the conceptual ancestor of modern supervised learning.
## Concepts created today
No new concept note this week. The PEAS terms from the 9/9 lecture (Performance Measure, Environment, Actuators, Sensors) preview Chapter 2's formal agent-design framework, but a concept note now would be a stub with four definitions and no formal agent-type structure or rationality conditions — it would be superseded when Week 2 covers the full spec.
- (to create after Week 2 when Chapter 2 lands: `Concept - PEAS Framework`, `Concept - Rational Agent`)
## Examples worth keeping
- **Vacuum World**: Two rooms (A and B), each dirty or clean; agent at one position; actions are MoveLeft, MoveRight, Suck. Performance measure rewards clean rooms and penalizes excess moves. Every PEAS component is traceable on one line.
- **Autonomous taxi** (Ch 1 worked example): Optimized only for "arrive quickly," the taxi will speed, run red lights, and trade passenger safety for time. Illustrates that the performance measure IS the agent design — a bad specification produces harmful behavior regardless of agent capability.
## Lecture
### Lecture 9/9/2026 — Course Intro (live capture)
#### Definitions
1. **Performance Measure** — what the agent is evaluated on
2. **Environment** — full description of where the agent acts
3. **Actuators** — how the agent acts on the environment
4. **Sensors** — how the agent perceives the environment
#### Vacuum World
*(heading present in capture but content not recorded during lecture — see Examples worth keeping above for the full example from Chapter 1)*
### Discussion 9/11/2026 — Turing 1950
Reading: A. M. Turing, "Computing Machinery and Intelligence," *Mind* 49 (1950): 433–460 (`turing.pdf` in course source folder)
No live discussion-section capture exists for this session. Key claims from the paper are recorded in [[20_Progress/Degree/CSCI 4511W/Discussion/Discussion 1 — Turing 1950|Discussion 1 — Turing 1950]].
## Textbook integration
> [!IMPORTANT]
> Main chapters: [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 1|Chapter 1]] (background framing; not a dated Canvas reading — Chapter 2 begins the formal course sequence)
Chapter 1 is conceptual motivation, not the PEAS specification tutorial. What it adds beyond the bare intro-lecture definitions:
- **Why "rational" won**: §1.1 shows that acting humanly and thinking humanly both fail as engineering targets; only rational action gives a mathematically grounded criterion (expected utility). The intro lecture gave the four PEAS words; Chapter 1 explains why this target was chosen over alternatives that already failed.
- **Value alignment problem**: The performance measure must specify what we actually want, not a proxy. A more capable optimizer exploits any omissions in the specification more effectively. The lecture said "performance measure"; Chapter 1 explains why a misspecified one is dangerous.
- **Historical grounding**: AI winters, expert-system brittleness, the shift from symbolic to probabilistic reasoning. None of this appeared in the intro lecture, but it explains why the rational-agent framework was chosen.
### Textbook additions easy to miss
- **Limited rationality**: Acting rationally when exhaustive computation is too expensive. Not the same as irrationality — it is still the best action available given actual resources.
- The distinction between **limited rationality** and an agent that simply does not care about its objective: limited rationality is optimal relative to available resources; the former is an engineering constraint, the latter is a design failure.
## Takeaways (questions to resolve)
- [ ] Does "performance measure" as stated in the intro lecture match AIMA Ch 2's formal definition, or was the term used loosely? Resolve when the Chapter 2 note lands.
- [ ] What makes Vacuum World tractable when a real cleaning agent is not? Where does the analogy break down (continuous environments, noisy sensors, moving dirt)?
- [ ] Why does Turing restrict the Imitation Game to written exchange? What physical capacities does this exclude, and does that exclusion help or hurt his argument?
- [ ] Is the consciousness objection (Jefferson 1949) actually answered by the Imitation Game, or does Turing only show that accepting it leads to solipsism — which is a different argumentative move?
## Lecture-to-textbook synthesis
==Rational agents and PEAS are not a vocabulary to memorize but an engineering choice: the course is organized this way because "acting rationally" is the only AI target that gives mathematically grounded design criteria.==
*Mechanism:* Chapter 1 eliminates three of the four historical AI definitions as viable engineering targets. Acting humanly has no clean criterion — human behavior is inconsistent and contested. Thinking humanly requires a verified cognitive model that is never fully available. Thinking rationally (logicism) breaks down when knowledge is incomplete or inference does not automatically produce useful action. Acting rationally survives because expected utility is computable and gives a general criterion across search, probability, and learning. The intro lecture's PEAS vocabulary is where that target lands in practice: the Performance measure is the utility function; Environment is the state space the agent does not control; Actuators define the available action set; Sensors define the observation interface.
- Lecture example/scenario: Vacuum World — Performance = clean rooms minus excess moves; Environment = two rooms with independent dirt states; Actuators = MoveLeft, MoveRight, Suck; Sensors = current room + dirty/clean. The whole PEAS spec fits on one line.
- Textbook connection: [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 1|Chapter 1]] §1.1.4 explains why rational action beats logicism when knowledge is partial, and the worked taxi example shows why a badly specified performance measure produces instrumentally harmful behavior regardless of agent capability.
- Concept links: (pending Week 2) PEAS Framework, Rational Agent
> [!WARNING]
> The intro lecture's "Performance Measure" and Chapter 2's formal PEAS spec are at different precision levels. The lecture gave the vocabulary; Chapter 2 gives the checklist: task environment type (fully observable? deterministic? episodic? static?), time horizon, agent architecture. A student who memorizes only the four PEAS words will miss the actual design work Chapter 2 assigns.
> [!SUMMARY]
> Week 1 establishes the vocabulary (PEAS) and engineering philosophy (rational agents) that every later topic — search, logic, constraint satisfaction, learning — builds on. Turing 1950 shows the behavioral criterion that motivates why we care about agents that can act rationally at all; the nine-objection structure is how Turing clears the philosophical ground before the engineering begins.
## Flashcards
#cards/csci4511w
What is the **Vacuum World performance measure**?::Rewards clean rooms; penalizes excess moves. The exact tradeoff matters — a measure that only rewards "clean" without penalizing unnecessary suck calls produces wasteful behavior even in a simple two-room world. #cards/csci4511w
Why does the **rational-agent** approach win over the laws-of-thought approach?::Correct logical inference requires complete, certain knowledge — rare in practice. Rational action requires only choosing the action with the best expected outcome given available evidence, so it works under uncertainty and with incomplete information. #cards/csci4511w
What does Turing replace "Can machines think?" with, and why?::The **Imitation Game** — because "think" is too vague to define rigorously. The game tests whether a machine's written responses are indistinguishable from a person's, isolating intellectual from physical capacity. #cards/csci4511w
What is Turing's response to the **Argument from Consciousness** (Jefferson 1949)?::Insisting the machine must genuinely feel leads to solipsism — the only way to know a *human* thinks is to be that person. The Imitation Game replaces the unprovable subjective criterion with a behavioral one both sides can evaluate. #cards/csci4511w
What is Turing's **child machine** proposal?::Build a simple initial machine (child brain with few built-in mechanisms) and educate it, rather than programming adult intelligence directly. Structure maps onto modern ML: initial state = initial weights, education = training, experimenter judgment = loss function. #cards/csci4511w
Distinguish **performance measure** from **environment** in PEAS.::Performance measure is the evaluation criterion — what counts as success for the agent. Environment is the domain where the agent operates — what the agent does not control. The performance measure must be defined with the environment in mind; specifying one without the other is incomplete. #cards/csci4511w
What is **limited rationality** and how does it differ from irrationality?::Limited rationality is acting as well as possible given bounded computation — taking the best available action when exhaustive search is too costly. Irrationality is failing to pursue the objective at all. Limited rationality is still optimal relative to actual resources; irrationality is not. #cards/csci4511w
