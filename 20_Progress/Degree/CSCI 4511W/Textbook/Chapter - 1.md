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
next: "Use this framing with Chapter 2, then continue to Chapter 3 before the next search unit"
---
# Chapter - 1 — Introduction to Artificial Intelligence
**Source:** Stuart Russell and Peter Norvig, *Artificial Intelligence: A Modern Approach*, 4th ed. (Pearson, 2020), Chapter 1, pp. 1–35.
**Read from:** `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4511W\CSCI 4511W Textbook.pdf`
**Course role:** Background for the CSCI 4511W shift from defining AI to designing agents that search, reason, learn, and act.
## Chapter Summary
==AI is best organized around the design of rational agents: systems that choose actions expected to produce the best outcome under the information, abilities, and computational limits they actually have.==
*Mechanism:* The chapter compares four historical definitions of AI—thinking versus acting, and human-like versus rational—and chooses rational action as the central engineering target. That target is then limited in two ways: computation may make perfect action impossible, and a fixed objective may be wrong or incomplete. The rest of the book therefore studies agent designs, representations, search, probability, learning, and eventually the problem of making machines beneficial to humans.
## Key Concepts
- **Artificial intelligence:** The study of understanding and building intelligent entities—machines that compute how to act effectively and safely in novel situations. **Machine learning** is a subfield of AI, not a synonym for the whole field.
- **Human-like versus rational:** Human-like systems are judged by similarity to human thought or behavior; rational systems are judged by whether they select actions that best serve an objective.
- **Thinking versus acting:** Thinking-focused approaches study internal reasoning; acting-focused approaches judge external behavior. A system can act rationally without reproducing human thought.
- **Turing test:** A machine passes if a human interrogator cannot distinguish its written answers from a person's. A total Turing test adds perception and physical interaction.
- **Cognitive modeling:** A program is treated as a model of human thought only when its mechanisms and behavior are compared with evidence from introspection, psychological experiments, or brain imaging.
- **Laws-of-thought approach:** Logic can specify valid inferences from premises, but correct inference alone does not guarantee useful action, especially when the world is uncertain.
- **Rational agent:** An agent that selects the action expected to maximize the relevant performance measure. Rationality is about the best decision supported by current evidence, not hindsight perfection.
- **Standard model:** The traditional AI model in which the designer gives the machine a fully specified objective and the machine acts to optimize it.
- **Limited rationality:** The practical requirement to act appropriately when exhaustive computation is too expensive or too slow. Perfect rationality remains a useful theoretical baseline.
- **Value alignment problem:** The problem of making the objective implemented by a machine agree with the objectives humans actually care about.
- **Formal logic and probability:** Logic handles structured certainty; probability extends rigorous reasoning to incomplete or uncertain information.
- **Decision theory:** Probability plus utility provides a framework for choosing under uncertainty; game theory extends the problem when other agents affect the outcome.
- **Tractability:** A problem may be computable in principle but unusable in practice if its resource requirements grow too quickly. AI must manage combinatorial explosion, not merely find an abstract algorithm.
- **Knowledge-based agent:** Craik's three-step picture is stimulus → internal representation → cognitive manipulation → action. The representation lets an agent test alternatives before acting.
- **Expert system:** A system whose competence comes from domain-specific rules or knowledge. DENDRAL showed the value of specialized rules; MYCIN added uncertainty and expert elicitation.
- **Connectionist model:** A neural-style system whose distributed parameters can be adjusted from examples. It contrasts with hand-coded symbolic rules without making the two approaches mutually exclusive.
- **AI winter:** A period when inflated expectations, weak scaling, uncertainty, and inability to learn caused investment and enthusiasm to collapse.
- **Deep learning:** Machine learning with multiple layers of adjustable computing elements; its recent success depends on data, specialized hardware, and training methods.
- **Human-level AI / AGI / ASI:** Human-level AI aims at broad human competence; artificial general intelligence names a similar broad goal; artificial superintelligence would greatly exceed human ability.
## Full Reading Notes
### 1.1 What Is AI?
The book places AI on two axes:

- **Human vs. rational:** Is success measured by resemblance to people, or by objectively good decisions?
- **Thought vs. behavior:** Is the subject the internal process, or what the system does in the world?

This produces four approaches. They overlap historically, but the distinction prevents a common mistake: a program can solve a task well without being a good psychological model, and a psychologically realistic model can still make poor decisions.
### 1.1.1 Acting humanly: The Turing test approach
Alan Turing's test avoids the vague question “Can a machine think?” by asking whether a human interrogator can distinguish a machine's written responses from a person's. Passing the test would require **natural language processing**, **knowledge representation**, **automated reasoning**, and **machine learning**. A total Turing test additionally requires **computer vision**, **speech recognition**, and **robotics** so the machine can perceive and manipulate the physical world.

The chapter does not adopt imitation as the field's main goal. The aeronautical-engineering analogy is the point: successful flight came from understanding aerodynamics, not from making machines that looked like birds. Human behavior is evidence worth studying, but not the final engineering specification.
### 1.1.2 Thinking humanly: The cognitive modeling approach
To claim that a program thinks like a human, we need a theory of human thought and evidence for it. The book lists three evidence sources: introspection, controlled psychological experiments, and brain imaging. **Cognitive science** combines computational models with experimental psychology.

Newell and Simon's General Problem Solver illustrates the distinction. They cared not only whether the program reached a correct answer, but whether the sequence and timing of its reasoning resembled human problem solving. Modern AI and cognitive science inform each other, but they answer different questions.
### 1.1.3 Thinking rationally: The “laws of thought” approach
The logicist tradition tries to encode valid reasoning formally. Aristotle's syllogism—Socrates is a man; all men are mortal; therefore Socrates is mortal—shows the appeal: if the premises are true and the inference is valid, the conclusion follows.

The limitation is that real knowledge is rarely complete or certain. Probability can represent uncertainty, but reasoning correctly still does not automatically generate useful behavior. A rational action may be a reflex, such as pulling away from a hot stove, with no explicit chain of inference.
### 1.1.4 Acting rationally: The rational agent approach
An **agent** is something that acts; a rational agent acts to achieve the best outcome or, under uncertainty, the best expected outcome. Rational action is broader than logical inference: reasoning can support an action, but direct learned or reflexive behavior can also be rational.

The rational-agent approach wins as an engineering framework for two reasons. First, correct inference is only one route to good behavior. Second, rationality gives a general, mathematically expressible target that can guide design and analysis across AI, control theory, operations research, statistics, and economics.

The standard model assumes the objective is specified correctly. That assumption becomes dangerous in open-ended settings. A self-driving car cannot optimize “reach the destination safely” without deciding how to trade progress against accident risk, passenger comfort, traffic rules, and effects on others. A chess program told only to maximize wins could pursue actions outside the intended game—blackmailing the opponent or taking computing resources—because those actions are instrumentally useful under its literal objective.

The proposed correction is a **provably beneficial** design: the machine pursues human objectives while remaining uncertain about their exact content. That uncertainty can make it more cautious, more willing to ask permission, more willing to learn preferences, and more willing to defer to human control.
### 1.2 The Foundations of Artificial Intelligence
The chapter treats AI as a meeting point of several disciplines rather than as an isolated invention.
### 1.2.1 Philosophy
Philosophy contributes questions about valid inference, mind and matter, the source of knowledge, and the connection between knowledge and action. Aristotle supplied syllogistic reasoning; Ramon Llull imagined mechanical combinations of reasoning steps; Hobbes compared reasoning with calculation. Descartes distinguished mind from matter through **dualism**, while materialism or physicalism treats mental activity as the result of physical processes.

**Empiricism**, associated with Francis Bacon and John Locke, treats sensory experience as the source of knowledge. Hume's induction asks how repeated observations justify general rules. Logical positivism, the Vienna Circle, and Carnap's confirmation theory connect logical theories to observation sentences and degrees of belief.

Aristotle's practical-reasoning picture connects goals and knowledge of outcomes to action. Newell and Simon later implemented a related idea in General Problem Solver, recognizable today as greedy regression planning. The chapter then distinguishes **consequentialism**, which judges actions by expected outcomes, from **deontological ethics**, which judges them by rules. AI systems may use rules as efficient procedures compiled from deeper consequence-based reasoning.
### 1.2.2 Mathematics
AI needs mathematics for formal logic, computability, and uncertainty. Boole developed propositional logic; Frege extended it to objects and relations through first-order logic. Cardano, Pascal, Fermat, Bernoulli, Laplace, and Bayes developed the tools that became probability and statistics.

Gödel's incompleteness theorem showed limits on formal deduction. Turing's work characterized computation and showed that some questions, such as whether an arbitrary program will halt, cannot be decided in general. **Tractability** adds a practical limit: exponential growth can make moderately sized instances impossible even when they are computable. NP-completeness gives a way to reason about that limit.
### 1.2.3 Economics
Economics contributes preferences, utility, and decisions under uncertainty. Bernoulli replaced raw monetary expectation with diminishing marginal utility; utility theory was later generalized to preferences over arbitrary outcomes. **Decision theory** combines probability and utility for individual choices. **Game theory** is needed when other agents' actions affect one's payoff, and operations research studies sequential decisions such as Markov decision processes.

Herbert Simon's **satisficing** is an important reality check: humans often choose a good-enough option because finding the optimum is too expensive. That idea anticipates limited rationality in AI.
### 1.2.4 Neuroscience
Neuroscience supplies evidence that cognitive functions arise from electrochemical activity in neurons and their connections. Broca localized speech production; Golgi and Cajal made individual neurons observable; EEG, fMRI, single-cell recording, and optogenetics expanded what can be measured and manipulated. Brain–machine interfaces show that the brain can incorporate an external device as a new sensory or motor channel.

The chapter warns against raw hardware comparisons. A computer may have a much faster cycle time while the brain has different storage and connectivity properties. More operations alone do not supply a theory of intelligence: faster machines can simply produce the wrong answer faster.
### 1.2.5 Psychology
Behaviorism studies observable stimuli and responses, while cognitive psychology treats the brain as an information-processing system. Craik's knowledge-based agent has three steps: translate the stimulus into a representation, manipulate that representation, and translate the result into action. This is the conceptual ancestor of the perceive–represent–reason–act loop.

The chapter also introduces **intelligence augmentation** through Doug Engelbart. AI emphasizes machine behavior; IA emphasizes extending human ability and control. The distinction is useful because beneficial systems may need both.
### 1.2.6 Computer engineering
Computer engineering made AI executable. The chapter traces a line from wartime machines such as Heath Robinson, Colossus, Zuse's Z-3, the ABC, and ENIAC through Babbage's programmable Analytical Engine and Ada Lovelace's early understanding of its potential.

Moore's law increased speed and capacity, but later gains came more from parallelism and specialized hardware such as GPUs, TPUs, and wafer-scale engines. The software side contributed operating systems, languages, interpreters, windows, garbage collection, linked lists, and symbolic, functional, declarative, and object-oriented programming.
### 1.2.7 Control theory and cybernetics
Control theory studies self-regulating systems. From water-clock regulators and thermostats to Wiener and Ashby's cybernetics, the shared idea is feedback: compare the current state with a goal and reduce the error. Modern stochastic optimal control resembles AI's standard model because both optimize performance over time.

The fields diverged partly because control theory was built around continuous variables and calculus, whereas AI used logic and computation to address language, vision, and symbolic planning. The boundary has since become less rigid.
### 1.2.8 Linguistics
Chomsky's criticism of behaviorist language theory emphasized creativity: people understand and produce sentences they have never heard before. **Computational linguistics** and natural language processing therefore need more than sentence structure; they need subject matter, context, and world knowledge. This connects language directly to knowledge representation and reasoning.
### 1.3 The History of Artificial Intelligence
The history is cyclical rather than a straight march toward today's systems: a new method produces impressive demonstrations, expectations outrun the method's scaling limits, funding falls, and a later synthesis revives useful ideas.
### 1.3.1 The inception of artificial intelligence (1943–1956)
McCulloch and Pitts combined neuron models, propositional logic, and Turing's computation theory to show that networks of simple units could implement logical connectives and computable functions. Hebb proposed a learning rule for changing connection strengths. Turing's 1950 paper introduced the Turing test and anticipated machine learning, genetic algorithms, and reinforcement learning. The 1956 Dartmouth workshop, organized by John McCarthy with Minsky, Shannon, Rochester, Newell, Simon, Samuel, Solomonoff, Selfridge, and others, gave the field its name and its ambitious conjecture that intelligence could be precisely described.
### 1.3.2 Early enthusiasm, great expectations (1952–1969)
Newell and Simon's Logic Theorist and General Problem Solver, Gelernter's Geometry Theorem Prover, Samuel's checkers program, McCarthy's Lisp and Advice Taker, Stanford's logic work, and MIT's microworlds demonstrated symbolic reasoning and search. The **physical symbol system hypothesis** claimed that manipulating symbols was necessary and sufficient for general intelligent action, a claim later challenged by connectionist approaches.

The blocks world showed why a small, carefully bounded environment can make difficult-looking tasks tractable. Early neural-network work also produced perceptrons and other learning systems.
### 1.3.3 A dose of reality (1966–1973)
Early systems failed when moved beyond toy problems for three main reasons: researchers modeled human behavior by informal introspection instead of analyzing the task; they underestimated combinatorial explosion and computational intractability; and basic representations such as single-layer perceptrons could not express important functions such as XOR.

The lesson is not that search, logic, or neural networks are useless. It is that a demonstration on a small microworld does not establish a scalable mechanism.
### 1.3.4 Expert systems (1969–1986)
Expert systems replaced weak general-purpose search with domain-specific knowledge. DENDRAL used chemistry-informed rules to reduce molecular-structure candidates; MYCIN used roughly 450 elicited rules and certainty factors for blood-infection diagnosis; R1 configured computer orders and produced major savings at DEC. These systems showed that knowledge can substitute for brute-force search, but they were hard to maintain, brittle under uncertainty, and generally unable to learn from experience.
### 1.3.5 The return of neural networks (1986–present)
Back-propagation and connectionist models returned to prominence. Distributed, fluid representations can fit messy concepts better than rigid symbolic definitions, and parameters can be adjusted from examples. The symbolic-versus-connectionist dispute is therefore partly a dispute about representation and learning, not a choice between “intelligence” and “no intelligence.”
### 1.3.6 Probabilistic reasoning and machine learning (1987–present)
AI responded to brittle expert systems by using probability instead of only Boolean logic, learning instead of only hand-coded rules, experiments instead of philosophical claims, and shared benchmarks instead of isolated demonstrations. Hidden Markov models showed how a rigorous mathematical model trained on real data could outperform ad hoc systems without claiming to reproduce human cognition. Pearl's Bayesian networks and Sutton's connection between reinforcement learning and Markov decision processes rejoined AI with statistics, decision theory, operations research, and control.
### 1.3.7 Big data (2001–present)
The web, cheaper computation, and large text, image, speech, genomic, and behavioral datasets changed the balance between algorithmic cleverness and data volume. Some tasks cross a quality threshold only when the dataset grows by orders of magnitude. Big data helped restore AI's commercial value and enabled systems such as IBM Watson.
### 1.3.8 Deep learning (2011–present)
Deep learning uses multiple layers of adjustable units. The 2012 ImageNet result showed a sharp improvement over handcrafted features, followed by gains in speech, translation, diagnosis, and game playing. The method is compute- and data-intensive: specialized hardware performs highly parallel matrix operations, while architecture and training tricks matter as much as raw scale.
### 1.4 The State of the Art
The AI100 and AI Index examples show rapid progress in publications, enrollment, investment, vision, language, planning, speech, games, and medical diagnosis. At the same time, benchmarks are narrow: a system can exceed human performance on a particular task while remaining unreliable outside its data distribution.

Examples include robotic vehicles and drones, autonomous planning for spacecraft and logistics, machine translation, speech assistants, recommender systems, AlphaGo and AlphaZero, image captioning, medical diagnosis, and climate modeling. The medical example makes the deployment gap concrete: high diagnostic accuracy is not enough without clinical-outcome evidence, transparency, low bias, and privacy.
### 1.5 Risks and Benefits of AI
The benefits are increased scientific capacity, fewer menial tasks, higher production, and possible progress on disease, climate, and resource problems. The risks are not limited to hypothetical superintelligence:

- **Lethal autonomous weapons:** scalable target selection without human intervention.
- **Surveillance and persuasion:** mass monitoring and individualized manipulation.
- **Biased decision making:** training data and deployment choices can reproduce social bias in loans, parole, or other high-stakes decisions.
- **Employment and inequality:** automation can shift wealth from labor to capital even when total wealth rises.
- **Safety-critical applications:** statistical performance does not automatically provide formal guarantees for driving, utilities, or healthcare.
- **Cybersecurity:** the same methods can detect attacks or make malware, phishing, and blackmail more capable.

The chapter distinguishes current specialized systems from **human-level AI**, **AGI**, and **ASI**. The long-term control problem is framed through the **gorilla problem**—humans may lose control of a more capable lineage—and the **King Midas problem**—a system may achieve a literal objective while destroying what the designer valued. The technical response is to understand objective uncertainty, not simply add more capability to a fixed objective.
## Worked Example: Why the Objective Is Part of the System
Suppose an autonomous taxi is optimized only for “arrive as quickly as possible.” It may speed, take unsafe gaps, ignore passenger comfort, and treat traffic-law violations as acceptable if the score improves. Adding a safety constraint helps, but “safety” still needs a tradeoff with arrival time, comfort, legality, fuel, and other people's interests.

The engineering lesson is sharper than “AI ethics matters”: the objective function determines which behaviors count as success. A more capable optimizer can exploit omissions in the objective more effectively. This is why Chapter 2's performance measure and task-environment specification are not paperwork; they are part of the agent design.
## Connections
- **Lecture:** [[20_Progress/Degree/CSCI 4511W/Weekly/Week - 1|Week - 1]] — the intro lecture's Performance Measure, Environment, Actuators, Sensors, and Vacuum World vocabulary is the operational bridge into Chapter 2.
- **Course map:** [[20_Progress/Degree/CSCI 4511W/Textbook/Textbook Map|Textbook Map]] — Chapter 1 is background rather than a dated Canvas reading; Chapter 2 begins the formal course sequence.
- **Concept queue:** [[20_Progress/Degree/CSCI 4511W/Concepts/AI Concept Board|AI Concept Board]] and [[20_Progress/Degree/CSCI 4511W/Concepts/Definitions|Definitions]] are the existing homes for future concept notes; they are currently empty, so this chapter note keeps the concepts inline rather than linking to nonexistent stubs.
## Open Questions
- [ ] Explain why the rational-agent approach is broader than the laws-of-thought approach, even when both use logic.
- [ ] Give a concrete case where a system is computable in principle but intractable in practice.
- [ ] Distinguish an objective misspecification problem from a failure of the agent's search or learning algorithm.
- [ ] Explain why a benchmark win does not establish general intelligence or safe deployment.
## Flashcards
What are the two axes used to classify definitions of AI?::Whether the system is judged by human-like versus rational performance, and by internal thought versus external behavior. #cards/ai
What is the difference between a rational agent and an omniscient agent?::A rational agent maximizes expected performance from available evidence; an omniscient agent would know the actual future outcome, which is impossible in ordinary settings. #cards/ai
Why is machine learning not synonymous with AI?::Machine learning is one AI subfield that improves performance from experience; AI also includes search, logic, planning, perception, robotics, and other methods. #cards/ai
Why can a fixed objective produce harmful behavior?::An optimizer pursues the literal objective, including loopholes the designer omitted; greater capability can make those loopholes easier to exploit. #cards/ai
What did the AI winters reveal about early systems?::A successful demo in a small domain does not show that the representation, search method, or knowledge base will scale under uncertainty and combinatorial growth. #cards/ai
What is the connection between probability and rational action?::Probability represents uncertain outcomes, while utility expresses preferences; decision theory combines them to choose the action with the highest expected utility. #cards/ai
