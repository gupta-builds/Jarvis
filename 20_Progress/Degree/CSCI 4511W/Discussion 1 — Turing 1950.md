---
type: class
input_kind: discussion
status: seed
created: 2026-09-11
updated: 2026-10-02
area:
  - "[[CSCI 4511W Board]]"
  - "[[20_Progress/Degree/CSCI 4511W/Weekly/Week - 1|Week - 1]]"
tags:
  - "#class"
  - "#Discussion"
next:
---
# Discussion 1 — Turing 1950
## Pre-work
**Reading:** A. M. Turing, "Computing Machinery and Intelligence," *Mind* 49 (1950): 433–460. Source file: `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4511W\Discussion\turing.pdf`
**Discussion date:** Friday, 9/11/2026 (Discussion Section 1 — first graded discussion participation)
**Live capture status:** None. This note records the paper's own claims, not the classroom session. The in-person discussion was not captured. All content below is sourced directly from the 1950 paper.
## Notes
### §1 The Imitation Game
Turing refuses to define "think" by common usage, arguing that approach leads to a Gallup poll rather than a clear answer. He substitutes a behavioral test: the **Imitation Game**.
- Three players: A (man, tries to deceive the interrogator), B (woman, gives truthful answers), C (interrogator).
- C asks written questions and tries to identify which respondent is the man and which is the woman.
- The machine replaces A. The question becomes: does C's error rate change when the machine plays A's role?
- Communication is typewritten only, removing voice, appearance, and physical cues.
- The test isolates intellectual from physical capacity. The interrogator cannot ask for physical demonstrations.
### §2 Critique of the New Problem
The test is deliberately restricted to outputs observable through a written channel. This makes irrelevant whether the machine is beautiful, fast, or dexterous. The game can cover "almost any one of the fields of human endeavour" through question-and-answer alone.
Turing's self-objection: maybe the best machine strategy in the game is *not* imitation of a man. He thinks this unlikely, but assumes the best strategy is to give human-like answers.
### §3 The Machine in the Game
Turing restricts "machine" to **digital computers** — not because biological machines are excluded in principle, but because digital computers are the relevant engineered class and can take part in the game.
The question is not whether *current* computers would pass, but whether *imaginable* computers with adequate storage and speed could.
### §4 Digital Computers
Three-part structure:
- **Store** — memory; corresponds to the human computer's paper
- **Executive unit** — carries out individual operations
- **Control** — ensures instructions are obeyed in order
**Programming** = constructing the instruction table that defines what the machine does. Conditional branching enables loops without repeating instructions.
Digital computers are **discrete-state machines**: they move between well-defined states, and small errors in input do not cascade into large output differences (unlike continuous systems).
### §5 Universality of Digital Computers
A digital computer is a **universal machine**: given sufficient storage and speed, it can mimic any discrete-state machine by simulating its state table. Consequence: the imitation question collapses to "Can one particular digital computer, suitably programmed with adequate storage, play A's role satisfactorily?"
### §6 Nine Objections — Turing's Own Pre-emptions
Turing raises and answers nine objections in §6. All nine are from the paper itself, not from classroom discussion.
1. **Theological objection**: Thinking requires an immortal soul; God gave souls only to humans. Turing: This places an arbitrary restriction on God's omnipotence. Machines could in principle be given souls; the argument is not more convincing than it would be for elephants.
2. **"Heads in the Sand" objection**: The consequences of machine thinking would be too dreadful. Turing: Wishful thinking disguised as an argument; dismisses without refutation.
3. **Mathematical objection** (Gödel 1931, Church, Turing 1937): Discrete-state machines have formal limitations — some questions they cannot answer correctly. Turing: It has not been proved that the human intellect lacks the same limitations. Humans give wrong answers too; the feeling of superiority over a machine that fails on one question is not well-founded.
4. **Argument from Consciousness** (Jefferson 1949 Lister Oration): A machine can only truly think if it feels its thoughts — grief, pleasure, intent. Turing: Accepting this standard leads to solipsism — the only way to know another *human* thinks is to be that person. In practice we extend the polite convention that everyone thinks. The Imitation Game replaces the unprovable subjective criterion with a behavioral one. Turing acknowledges the mystery of consciousness remains but argues it need not be resolved to answer the question.
5. **Arguments from Various Disabilities**: Machines can never be kind, learn from experience, use words properly, do something genuinely new, etc. Turing: These objections are mostly founded on induction from existing machines, which have very limited storage. Many claimed disabilities reduce to limited storage capacity. Turing specifically addresses "machines cannot make mistakes" by distinguishing **errors of functioning** (hardware faults) from **errors of conclusion** (false output) — machines can easily commit the latter.
6. **Lady Lovelace's Objection** (1842): The Analytical Engine "has no pretensions to originate anything; it can only do what we know how to order it to perform." Turing: Machines take him by surprise with high frequency, because he does not work out all consequences in advance. The ability to surprise does not require creative consciousness. Turing also invokes the "skin-of-an-onion" analogy: every mechanically explicable layer we strip away reveals another, and we may eventually find no non-mechanical residue.
7. **Argument from Continuity in the Nervous System**: The nervous system is continuous, not discrete. A discrete-state machine must be different from it. Turing: Under the Imitation Game conditions, a digital computer can approximate a continuous machine well enough that the interrogator cannot distinguish them — demonstrated with a differential analyser example.
8. **Argument from Informality of Behaviour**: No set of rules can describe what a human should do in every circumstance; humans are governed by "laws of behaviour" (physical laws), not "rules of conduct" (explicit precepts). Turing: The argument conflates the two. Machines need not have explicit rules of conduct; they are subject to laws of behaviour in the same sense humans are. The undistributed middle in the original argument is "if each man had a definite set of rules of conduct he would be no better than a machine — but there are no such rules — so men cannot be machines."
9. **Argument from Extrasensory Perception**: If telepathy is real, a human participant can detect the interrogator's intent and the machine cannot. Turing: Put the competitors in a "telepathy-proof room." If ESP is admitted the game conditions must be tightened, but the machine can still play.
### §7 Learning Machines
Turing's positive proposal: instead of programming adult intelligence, build a **child machine** (simple initial state, minimal mechanism) and educate it. The child brain is "like a notebook as one buys it from the stationer's — rather little mechanism, and lots of blank sheets."
Three components of the adult mind: (a) initial state at birth, (b) education, (c) other experience. Engineering the adult mind means engineering all three.
Learning maps onto an evolutionary analogy:
- Structure of child machine = hereditary material
- Changes to child machine = mutation
- Experimenter's judgment = natural selection
Turing argues the experimenter can speed this up compared to biological evolution because directed mutation is possible.
**Punishment and reward** are part of the teaching process but not sufficient alone. If no other communication channel exists, the information that reaches the machine is bounded by the number of rewards and punishments. "Unemotional" channels (e.g. language instruction) are also required.
Key insight on the "paradox" of learning machines: the machine's operating rules are time-invariant; only lower-level, ephemeral rules (the "contents" of the store) change during learning. Turing compares this to the U.S. Constitution.
Turing estimates 10^9 binary digits of storage would suffice for satisfactory Imitation Game performance; 10^7 is practically achievable even in 1950.
Final sentence of the paper: "We can only see a short distance ahead, but we can see plenty there that needs to be done."
## Action items
- [ ] Confirm what questions or prompts the TA used to anchor the 9/11 session — not available in this note; check course notes or Canvas discussion board.
- [ ] For exam preparation: be able to state all nine objections and Turing's response to each from memory, in the correct order.
- [ ] Reconcile Turing's "learning machine" with modern reinforcement learning — how closely does punishment/reward learning correspond to RL's reward signal?
