---
type: class
input_kind: homework
status: sprout
created: 2026-09-20
updated: 2026-09-20
area:
  - "[[CSCI 4511W Board]]"
deadline: 2026-09-18
tags:
  - "#class"
  - "#Homework"
next: "Submit the Problems 1-3 PDF (check the late-policy window against the passed 9/18 due date first), then start the ps1.py code portion (Problems 4-5)"
---
# Problem Set 1 — Written Solutions
**Source:** AIMA (Russell & Norvig, 4th ed.) Ch. 2 — Intelligent Agents, pp. 36–63, per [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 2|Chapter - 2]]; cross-checked against the 9/14 (Lecture 02: Definitions, Agent Structure) and 9/16 (Lecture 03: Problem-Solving Agents) slide decks.
## Overview
Problems 1–3 are the written portion of PS1: classify a stochastic, partially observable variant of vacuum-world along four environment axes, then design and score the best possible Simple Reflex Agent and Model-Based Agent for it. Problems 4–5 are the coding portion, tracked separately in [[20_Progress/Degree/CSCI 4511W/Assignments/Code/ps1|Assignments/Code/ps1.py]]. Stated due date is 9/18; today is 9/20, so check the Board's late-work window before submitting — [[CSCI 4511W Board]] confirms up to one day late gets a penalty and anything later needs contacting course staff directly.
## Requirements
- [ ] Problem 1 (16 pts) — classify the environment on Fully/Partially Observable, Deterministic/Nondeterministic, Static/Dynamic, Discrete/Continuous, each with a 1-sentence justification.
- [ ] Problem 2 (4 pts) — design the best possible Simple Reflex Agent; state its approximate score and explain in 2-3 sentences.
- [ ] Problem 3 (4 pts) — design the best possible Model-Based Agent's plan; state its approximate score and explain in 2-3 sentences.
- Must submit: answers to 1-3 as a single PDF (any tool; LaTeX not required, but illegible handwriting can lose points).
- Must not do: collaborate with others, look up answers online, or post the problem/solution anywhere — this problem set is individual-only per the syllabus's collaboration policy.
## Solutions
### Problem 1 — Task-environment classification (16 pts)
Setup: 4 rooms in a 2×2 grid, each independently clean or dirty; agent senses only its own current room and that room's status; actions are Up, Down, Left, Right, Suck, Nop; any movement action has a 25% chance of not actually moving; scored +2/clean room/time-step, −1/non-Nop action, over 100 steps.

- **Partially observable.** The full state is the clean/dirty status of all four rooms, but a single percept only reveals the agent's current room and that one room's status — the other three rooms stay hidden until visited.
- **Nondeterministic (stochastic, specifically).** The same action in the same state doesn't have one guaranteed outcome: a movement action fails to move 25% of the time. AIMA reserves "stochastic" for exactly this — a nondeterministic outcome with a known, quantified probability attached, rather than just an unquantified list of possibilities.
- **Static.** "Rooms maintain their status unless acted on by the agent," so nothing in the world changes on its own between actions — only the agent's own Suck or movement changes the state, meaning the environment can't shift while the agent is deciding what to do next.
- **Discrete.** Rooms (4), room states (2 each), actions (6), and time (100 fixed steps) are all finite and enumerable — no continuous quantity appears anywhere in the setup.
### Problem 2 — Best Simple Reflex Agent (4 pts)
A simple reflex agent sees only (current room, dirty/clean) with no memory of past percepts, so it can never know from a single percept that the *other* three rooms are already clean. The best available rule is a condition–action table keyed on that same (room, status) pair: **if the current room is dirty, Suck; if it's clean, move to the next room in a fixed cycle** (e.g., a fixed Right → Down → Left → Up loop touching all four rooms). Because "rooms maintain their status unless acted on," this rule clears whatever's dirty within the first several steps and then every room stays clean permanently — but the rule has no way to detect that the job is done, so it keeps cycling (and paying −1 per move) for the remaining ~90+ steps instead of switching to the free Nop. Net result: nearly all 100 steps collect close to the full +8/step clean bonus (4 rooms × 2 pts) but lose −1 to an unnecessary action on almost every one of them, landing the score around **+700**, well under the +800 ceiling.
### Problem 3 — Best Model-Based Agent (4 pts)
A model-based agent adds a transition model (how each action changes the world, including the 25% slip chance) and internal state tracking which rooms it has already confirmed clean. It runs the same cyclic sweep — Suck when dirty, otherwise advance to the next unconfirmed room — but its memory lets it notice once *all four* rooms are marked clean, and only then switch permanently to **Nop**, which costs 0 versus −1 for every other action. The one-time cleanup phase costs at most a handful of −1 actions (worst case: up to 4 Sucks plus a few moves to visit every room), after which the agent banks the full +8/step clean bonus at zero further cost for the rest of the run. That puts its score close to the theoretical ceiling — approximately **+750 to +780** out of a maximum of +800 — clearly ahead of the simple reflex agent because internal state is what lets it recognize "finished" and stop paying the movement penalty.
## Concepts used
- [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 2|Chapter 2 — Intelligent Agents]] — PEAS/environment-property axes (fully/partially observable, deterministic/stochastic, static/dynamic, discrete/continuous) drive Problem 1; simple-reflex vs. model-based agent architecture drives Problems 2-3.
## Post-submit reflection
- What failed first?
- What pattern repeats?
