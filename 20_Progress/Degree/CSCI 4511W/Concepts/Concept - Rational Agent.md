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
# Concept - Rational Agent
## One-Line Answer
==A rational agent selects, for each possible percept sequence, the action expected to maximize its performance measure given what it has perceived and what it already knows.==
## Mechanism
Rationality is defined by four factors (Ch 2.2.2). An action is rational *at a given moment* if it maximizes the performance measure given:
1. **Performance measure** defining the criterion of success
2. **Prior knowledge of the environment** the agent was built with
3. **Available actions** the agent can perform
4. **Percept sequence observed to date**

The decisive word is *expected* — rationality optimizes expected performance, not actual post-hoc outcome. The agent cannot know outcomes it has not yet observed. Therefore:
- **Information gathering** is rational: acting specifically to learn something that will improve future decisions (looking both ways before crossing, exploring an unknown room before choosing a cleaning path)
- **Learning** is rational in any environment where initial prior knowledge may be incomplete or wrong — a purely static prior-knowledge agent is fragile when assumptions fail (dung beetle / Sphex wasp examples: hardwired behavior loops when a single assumption is violated)
- **Autonomy** increases with experience: over time, a learning agent's behavior becomes independent of its initial prior knowledge, enabling a single design to work across many environment varieties
## Contrast / What It Is Not
- **Rational vs. omniscient**: an omniscient agent knows the actual outcome of its actions before acting — impossible. A rational agent takes the best action given available evidence; if bad outcomes follow from a genuinely good decision, the decision was still rational. The Champs Élysées crossing example: crossing is rational if sensors show no traffic; a cargo door falling from 33,000 feet does not retroactively make it irrational.
- **Rational vs. human-like**: human behavior is inconsistent, emotionally driven, and has no clean engineering criterion. Rationality is the engineering target precisely because expected utility is mathematically expressible and computable (even under the limits of bounded rationality).
- **Rational vs. correct**: rationality is a property of the *decision process* given available information. Correctness is a property of the *outcome*. A rational decision can produce a bad outcome; an incorrect decision process can get lucky. These are orthogonal.
- **Rational vs. omniscient (bounded rationality)**: when exhaustive computation is too expensive, *limited rationality* takes the best available action within computational bounds. This is still rational relative to actual resources — it is not irrationality.
## Failure Modes / Misconceptions
> [!WARNING]
> **Blaming the agent for bad outcomes**: if the agent observed what was available, applied correct inference, and chose the highest-expected-value action, it acted rationally regardless of what happened. Judging rationality by outcomes confuses rationality with omniscience.

> [!WARNING]
> **Thinking rationality implies a fixed, complete prior**: a rational agent should gather information and learn. An agent that relies entirely on its designer's prior knowledge without updating on percepts is less autonomous and more brittle — it is rational only in environments that perfectly match the designer's assumptions.

> [!WARNING]
> **Confusing the performance measure with the utility function**: the performance measure is an external criterion defined by the designer. The utility function is the agent's internalized approximation of it. A utility-based agent that poorly approximates the performance measure is still technically "rational" relative to its utility function — but the design is bad.
## Evidence From This Vault
- [[20_Progress/Degree/CSCI 4511W/Weekly/Week - 2|Week - 2]] — Lecture 02 (9/14) introduced the rational agent concept formally for the first time; the four rationality factors and rationality-vs-omniscience distinction come from Ch 2.2.2-2.2.3.
- [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 2|Chapter - 2]] §2.2.2-2.2.3 — formal definition plus rationality case study in the Vacuum World (conditions under which the simple reflex agent is or is not rational).
## Flashcards
#cards/csci4511w
What are the **four factors** that determine what is rational for an agent at any moment?::1. The performance measure (success criterion), 2. Prior knowledge of the environment, 3. Available actions, 4. Percept sequence observed to date. All four must be specified to evaluate whether an action is rational. #cards/csci4511w
How does **rationality differ from omniscience**?::Rationality maximizes expected performance given available evidence; omniscience requires knowing actual outcomes in advance. A rational agent can take the correct decision and still get a bad outcome — bad outcomes do not retroactively make decisions irrational when they were based on the best available information. #cards/csci4511w
Why is **information gathering** a rational action even though it delays acting on the primary goal?::Because it modifies future percepts in ways that improve expected performance over the agent's full horizon. An agent that acts without gathering available information will systematically underperform relative to one that does — the information-gathering cost is worth the expected performance gain. #cards/csci4511w
