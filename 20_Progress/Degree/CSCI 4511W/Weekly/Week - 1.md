---
type: class
input_kind: lecture
status: seed
created: 2026-09-09
updated: 2026-10-13
area:
  - "[[CSCI 4511W Board]]"
  - "[[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 1|Chapter - 1]]"
tags:
  - "#class"
  - "#Lecture"
next: "[[20_Progress/Degree/CSCI 4511W/Weekly/Week - 2|Week - 2]]"
---
# Week - 1
## Source check for the quiz review
Checked 2026-10-13. Use this note for the September 9 introduction, [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 1|Chapter 1]] for background, and [[20_Progress/Degree/CSCI 4511W/Discussion/Discussion 1 — Turing 1950|Discussion 1]] for the paper. Material verification and personal mastery are separate: no closed-note recall results have been recorded yet.
| Item | Source and boundary | Review status |
|---|---|---|
| Lecture 01, September 9 | Protected live capture below; no Lecture 01 PDF found | Four PEAS definitions survive; the classroom Vacuum World board work is missing |
| AIMA Chapter 1 | Local textbook, PDF pp. 30-94; §1.1-1.5, summary, historical notes | Existing chapter note read and primary text checked; background, not a dated assigned reading |
| Turing 1950 | `Discussion/turing.pdf`, all 22 PDF pages, §1-7 | Paper checked; no TA prompts or live discussion capture available |
| Lecture 02, September 14 | `Lecture/CSCI4511W Lecture 02.pdf`, 11 slides | Read; this is Week 2, not the Week 1 introduction |
| Concept continuation | Existing PEAS and Rational Agent notes | Linked; formal specification belongs to Chapter 2 |
| Week 1 quiz/homework | Board schedule | No short quiz or dated textbook reading on September 9; PS1 is a subsequent assessment |
The two-room example below is an explanatory reconstruction from Chapter 2 and AIMA code, not a recovered transcript of the missing September 9 board work. Its exact reward rule must be specified before calculating a score.
## Week 1 exercise inventory
The fourth-edition preface states that exercises are online. The [author-linked Chapter 1 exercise bank](https://aimacode.github.io/aima-exercises/intro-exercises/) has 20 numbered entries. These are supplementary practice; no evidence assigns all 20 for this course. The site retains older wording and a near-duplicate pair, so use the local fourth edition for textbook claims.
| Exercise | Retrieval cue |
|---|---|
| 1.1 | Define intelligence, AI, agent, rationality, reasoning |
| 1.2 | Evaluate Turing's objections and prediction |
| 1.3 | Loebner Prize research |
| 1.4 | Reflex rationality |
| 1.5 | Intractability and undecidability |
| 1.6 | IQ score versus intelligence |
| 1.7 | Neural versus computer throughput |
| 1.8 | Introspection reliability |
| 1.9 | Classify AI systems |
| 1.10 | Similar classification question |
| 1.11 | Mathematical models of cognition |
| 1.12 | Perception versus higher cognition |
| 1.13 | Evolution and rational behavior |
| 1.14 | Science versus engineering |
| 1.15 | Programmer constraint objection |
| 1.16 | Genetic constraint objection |
| 1.17 | Physical-law constraint objection |
| 1.18 | Investigate task capabilities |
| 1.19 | Investigate remaining obstacles |
| 1.20 | Evaluate benchmark competitions |
For this review, start with [1.1](https://aimacode.github.io/aima-exercises/intro-exercises/ex_1/), [1.2](https://aimacode.github.io/aima-exercises/intro-exercises/ex_2/), 1.4, 1.5, and 1.15. Historical prompts asking for the latest result require current research if attempted; no current winner or capability claim is supplied here.
## What you must be able to do
- [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 1|Chapter 1]] — Explain why AI is organized around rational agents rather than human-like behavior; name the four historical AI definitions and say which the course targets.
- Define **agent**, **performance measure**, **environment**, **actuators**, and **sensors**; apply all five to the Vacuum World example without looking at notes.
- Distinguish what makes something an agent (perceives environment, acts on it) from what makes it *rational* (acts to maximize expected performance given available information).
- Explain Turing's reframing: why he replaces "Can machines think?" with the Imitation Game, and what behavioral criterion the game actually tests.
- Name and briefly characterize at least three of the nine objections Turing pre-empts in §6 of the 1950 paper, and Turing's response to each.
- Explain Turing's "child machine" proposal and why it maps onto modern machine learning framing.
## Key ideas (short)
- **Rational agent**: choose actions that maximize expected performance from available evidence. Human imitation is a different goal; the Turing test provides a behavioral criterion for it.
- **PEAS** gives the vocabulary for specifying what an agent *is* — formal treatment arrives in Ch 2, but the intro lecture introduced all four terms.
- **Vacuum World** starts with a two-room toy domain. PS1 and the sample quiz use different four-room versions; action sets, slip probabilities, and scoring must come from the specific prompt.
- Turing's move: replace a philosophical question with a behavioral test, then pre-empt 9 classes of objection. The nine-objection structure is the real content of the 1950 paper.
- **Learning machines**: Turing separates initial structure, education, and experience. His proposal includes reward and punishment, symbolic instruction, evolutionary variation, and random search; it is broader than supervised learning.
## Concepts created today
No concept note was created during the original Week 1 capture. These canonical notes now exist and supply the formal Week 2 continuation:
- [[20_Progress/Degree/CSCI 4511W/Concepts/Concept - PEAS Framework|PEAS Framework]]
- [[20_Progress/Degree/CSCI 4511W/Concepts/Concept - Rational Agent|Rational Agent]]
## Examples worth keeping
- **Vacuum World** (Chapter 2/AIMA reconstruction): two rooms, each dirty or clean; agent at one location; movement and suction actions. The local `TrivialVacuumEnvironment` uses `Left`, `Right`, and `Suck`, awarding 10 for cleaning dirt and charging 1 per move. The sample quiz instead awards clean-room points each step and charges each non-Nop action.
- **Autonomous taxi** (Ch 1 worked example): Optimized only for "arrive quickly," the taxi will speed, run red lights, and trade passenger safety for time. Illustrates that the performance measure IS the agent design — a bad specification produces harmful behavior regardless of agent capability.
## Lecture
### Lecture 9/9/2026 — Course Intro (live capture)
#### Definitions
1. **Performance Measure** — what the agent is evaluated on
2. **Environment** — full description of where the agent acts
3. **Actuators** — how the agent acts on the environment
4. **Sensors** — how the agent perceives the environment
#### Vacuum World
*(Heading present in capture but content not recorded during lecture. The Chapter 2/AIMA reconstruction above is separate from this protected capture.)*
### Discussion 9/11/2026 — Turing 1950
Reading: A. M. Turing, "Computing Machinery and Intelligence," *Mind* 59(236) (1950): 433-460 (`turing.pdf` in course source folder). The local reprint says volume 49; the [publisher record](https://doi.org/10.1093/mind/LIX.236.433) confirms volume 59.
No live discussion-section capture exists for this session. Key claims from the paper are recorded in [[20_Progress/Degree/CSCI 4511W/Discussion/Discussion 1 — Turing 1950|Discussion 1 — Turing 1950]].
## Textbook integration
> [!IMPORTANT]
> Main chapters: [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 1|Chapter 1]] (background framing; not a dated Canvas reading — Chapter 2 begins the formal course sequence)
Chapter 1 is conceptual motivation, not the PEAS specification tutorial. What it adds beyond the bare intro-lecture definitions:
- **Why rational action is the book's target**: §1.1.4 gives a general mathematical criterion for evaluating behavior. It includes inference, reflexes, and learned behavior. The other three approaches answer different questions; Chapter 1 does not dismiss them as failed disciplines.
- **Value alignment problem**: The performance measure must specify what we actually want, not a proxy. A more capable optimizer exploits any omissions in the specification more effectively. The lecture said "performance measure"; Chapter 1 explains why a misspecified one is dangerous.
- **Historical grounding**: AI winters, expert-system brittleness, the shift from symbolic to probabilistic reasoning. None of this appeared in the intro lecture, but it explains why the rational-agent framework was chosen.
### Textbook additions easy to miss
- **Limited rationality** (§1.1.4): act appropriately when computation is too expensive for perfect optimization. Resource limits explain the need for approximations; they do not make every approximate algorithm optimal.
- **Beneficial machines** (§1.1.5): a machine can optimize its specified objective while harming human interests. Objective uncertainty gives it a reason to learn preferences, act cautiously, and defer to human control.
## Takeaways (questions to resolve)
- [x] Reconcile the introductory performance measure with Chapter 2: the external measure evaluates success over environment-state sequences; it is distinct from an internal utility function.
- [ ] Explain from memory why the two-room toy world is easier than real cleaning: finite states/actions, simplified sensing and transitions, and no unmodeled changes.
- [x] Resolve the written-channel restriction: §1-2 excludes appearance, voice, and demanded physical demonstrations, isolating the tested intellectual behavior.
- [x] Resolve the consciousness argument: §6(4) challenges an inaccessible criterion and its solipsist consequences; it does not prove machines have subjective experience.
- [ ] Retrieve the actual September 9 Vacuum World board example and September 11 TA prompts if they exist on Canvas.
## Closed-note understanding check
Answer before rereading. Record which answer fails, then return to its source. No score is recorded until an actual attempt occurs.
1. Draw the human/rational by thought/behavior matrix. Give the criterion for all four cells. Source: Chapter 1 §1.1.
2. State PEAS for the two-room vacuum. Separate sensors from the percept they produce and actuators from the actions they execute. Source: Chapter 2 §2.1-2.3; AIMA `agents.py`.
3. Explain how a reflex can be rational without performing a logical proof. Source: Chapter 1 §1.1.4, hot-stove example.
4. Explain how an agent can pursue its objective successfully while harming the designer's interests. Source: Chapter 1 §1.1.5 and §1.5.
5. Describe Turing's original three-player game and the machine substitution. Distinguish the original setup from the textbook's simplified human-versus-machine formulation. Source: Turing §1; Chapter 1 §1.1.1.
6. State all nine objections and one response to each. Distinguish a rebuttal from a proof of machine intelligence. Source: Turing §6.
7. Explain what changes during learning while the machine's underlying operating rules remain fixed. Source: Turing §7.
8. Explain why a universal computer is not guaranteed a fast solution to every problem. Source: Turing §5; Chapter 1 §1.2.2 and §1.3.3.
## Lecture-to-textbook synthesis
==Week 1 connects an observable test of human-like behavior with the book's engineering target: choosing actions that maximize expected performance in a specified task environment.==

*Mechanism:* Chapter 1 distinguishes four research goals using human/rational and thought/behavior axes. The book chooses rational action because it is broader than correct inference and supports general mathematical analysis. Turing's imitation criterion addresses a different question: whether a machine's written behavior can be distinguished from a person's. PEAS specifies the task in which an agent acts. The performance measure evaluates success externally; an internal utility function may help an agent choose actions, but these are different objects. Computing a perfectly rational action can itself be intractable.
- Introductory example, reconstructed from Chapter 2: Vacuum World. Specify the cleaning objective and movement cost, two-room environment, movement/suction actuators, and location/dirt sensors. The original September 9 board example is missing, so its exact numeric scoring is unknown.
- Textbook connection: [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 1|Chapter 1]] §1.1.4 explains why rational action beats logicism when knowledge is partial, and the worked taxi example shows why a badly specified performance measure produces instrumentally harmful behavior regardless of agent capability.
- Concept links: [[20_Progress/Degree/CSCI 4511W/Concepts/Concept - PEAS Framework|PEAS Framework]] and [[20_Progress/Degree/CSCI 4511W/Concepts/Concept - Rational Agent|Rational Agent]].
> [!WARNING]
> The intro lecture's "Performance Measure" and Chapter 2's formal PEAS spec are at different precision levels. The lecture gave the vocabulary; Chapter 2 gives the checklist: task environment type (fully observable? deterministic? episodic? static?), time horizon, agent architecture. A student who memorizes only the four PEAS words will miss the actual design work Chapter 2 assigns.

> [!SUMMARY]
> Week 1 establishes task vocabulary, distinguishes human imitation from rational action, and introduces learning as an alternative to programming every intelligent response.
## Flashcards
#cards/csci4511w
Why must you check the **Vacuum World performance measure** in each prompt?::The textbook, AIMA implementation, PS1, and sample quiz use different reward and cost conventions. A score is meaningful only after specifying the time horizon, initial state, action costs, and whether scoring occurs before or after each action. #cards/csci4511w
Why is the **rational-agent** approach broader than the laws-of-thought approach?::Correct inference is one mechanism for good action. Reflexes and learned policies can also act rationally, and decisions under uncertainty require expected-outcome reasoning. #cards/csci4511w
What does Turing replace "Can machines think?" with, and why?::The **Imitation Game** — because "think" is too vague to define rigorously. The game tests whether a machine's written responses are indistinguishable from a person's, isolating intellectual from physical capacity. #cards/csci4511w
What is Turing's response to the **Argument from Consciousness** (Jefferson 1949)?::Insisting the machine must genuinely feel leads to solipsism — the only way to know a *human* thinks is to be that person. The Imitation Game replaces the unprovable subjective criterion with a behavioral one both sides can evaluate. #cards/csci4511w
What is Turing's **child machine** proposal?::Design an initial learning machine and an education process, then evaluate and revise them. He discusses rewards, punishments, symbolic instruction, variation, selection, and randomness; modern model training is an analogy rather than his exact terminology. #cards/csci4511w
Distinguish **performance measure** from **environment** in PEAS.::Performance measure is the evaluation criterion — what counts as success for the agent. Environment is the domain where the agent operates — what the agent does not control. The performance measure must be defined with the environment in mind; specifying one without the other is incomplete. #cards/csci4511w
Why does **limited rationality** matter?::Perfect action selection can require infeasible computation. An agent must act appropriately within its time and computing budget; a resource limit does not automatically prove an approximation optimal. #cards/csci4511w
