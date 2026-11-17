---
type: class
class_kind: homework
status: sprout
created: 2026-11-16
updated: 2026-11-16
tags:
  - class
  - homework
area:
  - "[[CSCI 4511W Board]]"
next: "Check the boxes below in Canvas (Q1.1: choices 3 and 4, Q1.2: choice 3, Q2.1: choices 2 and 5, Q2.2: choices 2, 4 and 5), press Save Answer on each question, then Save All Answers."
---
# Short Quiz - 10
## Overview
A short Canvas quiz on propositional logic, 10 points: Q1 on entailment (6 points, two questions of 3) and Q2 on logical reasoning in the wumpus world (4 points, two questions of 2). Every question is a multiple-choice list of five options. No due date is verified, so `deadline` is left empty. The Board schedules Short Quiz 10 for 11/16 at 6pm with the Ch 7.1 to 7.2 reading, but the quiz here is called quiz 9 and the Board's numbering may be off by one, so confirm the date and time on Canvas.
## Requirements
### Must submit
- [ ] Q1.1 answer, then Save Answer.
- [ ] Q1.2 answer, then Save Answer.
- [ ] Q2.1 answer, then Save Answer.
- [ ] Q2.2 answer, then Save Answer.
- [ ] Save All Answers at the bottom of the page.
### Must demonstrate
- Q1.1 and Q1.2 apply the definition of entailment: $\alpha \models \beta$ if and only if $M(\alpha) \subseteq M(\beta)$.
- Q2.1 and Q2.2 use the wumpus world rules from the textbook: a square is breezy if and only if a directly adjacent square has a pit, a square is smelly if and only if a directly adjacent square has the wumpus, and [1,1] has no pit and no wumpus.
### Must not do
- The prompt states no collaboration or tool rule. The wording of the page ("Grading comment", "Save Answer") is a Canvas quiz, so treat it as individual work.
## Work log
### Source check
No lecture or discussion deck covers logic yet. Lecture 17 (Nov 9) is constraint satisfaction and Discussions 8 and 9 are earlier topics, so a search of every parsed lecture and discussion file for "wumpus", "entail" and "propositional" found nothing. The only class source is the textbook, Chapter 7 (PDF pages 410 to 441 of the local file): §7.2 The Wumpus World (pp. 416 to 420), §7.3 Logic (pp. 422 to 428) and §7.4.3 A simple knowledge base (pp. 435 to 436). Nothing below uses an outside source.
### Q1.1
**Answer: choices 3 and 4.**
- Choice 3, "In any possible world where α is true, β is also true", is the definition. The textbook says $\alpha \models \beta$ if and only if, in every model in which α is true, β is also true (p. 424).
- Choice 4, "the number of things in $M(\beta)$ is at least the number in $M(\alpha)$", follows from the same definition written as $M(\alpha) \subseteq M(\beta)$. A set cannot have more elements than a set that contains it. The textbook's note on the direction of ⊆ says the same thing: α is the stronger assertion, because it rules out more possible worlds.
- Choice 1 (α ∧ β must be true) and choice 5 (α ∨ β must be true) are wrong because entailment says nothing about α itself being true, only about β in the worlds where α is. For example, α = "pit in [2,2]" entails β = "pit in [2,2] or pit in [3,1]", and neither is true in every world.
- Choice 2 (some world has both true) fails when α is false in every world. Then $M(\alpha)$ is empty, so $M(\alpha) \subseteq M(\beta)$ holds for every β, but no world makes α true.
### Q1.2
**Answer: choice 3.**
- $\alpha \not\models \beta$ means $M(\alpha) \not\subseteq M(\beta)$, so at least one model makes α true and β false. That is all the definition gives. The textbook's example is KB against "no pit in [2,2]": in some models where KB is true the conclusion is false, "Hence, KB does not entail α2: the agent cannot conclude that there is no pit in [2,2]. (Nor can it conclude that there is a pit in [2,2].)" (p. 425). That is choice 3, we do not have enough to settle β from α.
- Choice 1 (α ∧ ¬β must be true) and choice 2 (α ∨ ¬β must be true) are wrong because non-entailment only says α ∧ ¬β is true in some model, not that it holds everywhere.
- Choice 4 (in any world where α is true, β is false) says $\alpha \models \neg\beta$, which is a different, stronger claim. A world where α and β are both true is still allowed.
- Choice 5 (|M(α)| ≥ |M(β)|) has no connection to non-entailment. α can have fewer models than β and still fail to entail it.
- Caution on choice 3: it is the only option that is true, but it is loose. If α happens to entail ¬β, then we do know something about β. The quiz most likely means "α alone does not let us conclude β", which matches the textbook.
### Q2.1
**Answer: choices 2 and 5.**
Assumption: "detects a breeze" means only a breeze, so no stench, as the textbook writes the percept "[None,Breeze,None,None,None]" for a breeze alone (p. 419). "All sensors are false" in [1,1] and [1,2] means no breeze and no stench there.
1. [1,1] has no breeze, so [1,2] and [2,1] have no pit. It also has no stench, so neither has the wumpus.
2. [1,2] has no breeze and no stench, so [1,3] and [2,2] have no pit and no wumpus.
3. [1,3] has a breeze. Its neighbors are [1,2], [1,4] and [2,3], and [1,2] has no pit, so there is a pit in [1,4] or [2,3] (or both).
4. [2,2] has a breeze. Its neighbors are [1,2], [2,1], [3,2] and [2,3], and [1,2] and [2,1] have no pit, so there is a pit in [3,2] or [2,3] (or both).
5. Neither [1,3] nor [2,2] has a stench, and [2,3] is adjacent to both, so there is no wumpus in [2,3].

| Choice | Verdict | Why |
|---|---|---|
| 1. Pit in [1,4] | not concluded | Step 3 allows the pit to be in [2,3] alone. |
| 2. No wumpus in [2,3] | **concluded** | Step 5. |
| 3. Pit in [2,3] | not concluded | It is tempting because [2,3] sits in both disjunctions, but pits in [1,4] and [3,2] together satisfy both breezes with no pit in [2,3]. |
| 4. Pit in [3,2] | not concluded | Step 4 allows the pit to be in [2,3] alone. |
| 5. No pit in [2,1] | **concluded** | Step 1, from the breezeless [1,1]. |
### Q2.2
**Answer: choices 2, 4 and 5.**
Same assumption as Q2.1.
1. [1,1] has no breeze and no stench, so [1,2] and [2,1] have no pit and no wumpus.
2. [1,2] has a breeze. Its neighbors are [1,1], [1,3] and [2,2], and [1,1] has no pit, so there is a pit in [1,3] or [2,2] (or both).
3. [2,1] has a breeze. Its neighbors are [1,1], [3,1] and [2,2], and [1,1] has no pit, so there is a pit in [2,2] or [3,1] (or both). This is the textbook's own situation in Figure 7.3(b) (p. 420).
4. [1,2] has no stench and [2,2] is adjacent to it, so there is no wumpus in [2,2]. The agent never stood in [2,2], but it did not need to.

| Choice | Verdict | Why |
|---|---|---|
| 1. Pit in [2,2] | not concluded | Pits in [1,3] and [3,1] together satisfy both breezes. |
| 2. No wumpus in [2,2] | **concluded** | Step 4. |
| 3. Pit in [1,3] | not concluded | Step 2 allows the pit to be in [2,2] alone. |
| 4. Pit in [2,2] or [1,3] or both | **concluded** | Step 2 is exactly this sentence. |
| 5. Pit in [2,2] or [3,1] or both | **concluded** | Step 3 is exactly this sentence. |
### Risk to check before submitting
Choices 2 in Q2.1 and Q2.2 depend on reading "detects a breeze" as "and nothing else". If the quiz meant that the stench sensor was not mentioned rather than false, those two options would not follow and the answers would drop to 5 for Q2.1 and 4 and 5 for Q2.2. The wording "all the sensors are false" for [1,1] against "detects a breeze" for the other squares favors the first reading, and it is the reading the textbook uses.
## Concepts used
- Entailment as $M(\alpha) \subseteq M(\beta)$: decides Q1.1 and Q1.2.
- Models and possible worlds: the vacuous-entailment case (no model for α) removes Q1.1 choice 2.
- Model checking over pit assignments: each Q2 conclusion holds only if it is true in every pit placement consistent with the percepts.
- Wumpus-world rules, breeze and stench only from directly adjacent squares: drive every step in Q2.1 and Q2.2.
- Disjunctive conclusions: "pit in X or Y" can be entailed when neither "pit in X" nor "pit in Y" is.
