---
type: class
input_kind: homework
status: sprout
created: 2026-10-02
updated: 2026-10-03
area:
  - "[[CSCI 4511W Board]]"
tags:
  - "#class"
  - "#Homework"
next: Final essay is in main.tex in [[Writing 1 - Learn the Tools]]; keep both
  in sync if you edit
---
# Essay (Writing #1 draft)

Drafting space for [[Writing 1 - Learn the Tools]]. Source: [[Writing - 1 Video Transcript]], *Introducing Gemini Robotics 2* (Google for Developers), cite key `gemini_robotics_2`.

**Prompt (Discussion 3, 9/25):** Choose one video and reflect on a specific moment. Connect it to an AI concept and develop your own interpretation or a test you would propose.
**Target:** ~500 words total (it can be more). Current draft: ~477 words (prose only, not counting `\cite{}` commands).

> [!NOTE] Source of truth
> **Full Essay** (below the section drafts) is the complete essay. Each section's **Draft** block mirrors the matching paragraph of it word for word. 

---

## 1. Introduction (~75 words)
Name the video and the one specific moment. End with a one-sentence thesis.

---

## 2. Body 1: Observation (~125 words)
Describe and quote the moment.

**Evidence (verified against transcript):**
- [00:24:16]–[00:24:33] Timeline shift: "beyond my lifetime" (three years ago), "maybe ten years" (two years ago), now "I think that it's between five to ten years."
- [00:24:44]–[00:24:55] The host asks whether general intelligence can be claimed without "this embodied characteristic."
- [00:25:01] "You cannot reach AGI until you solve physical AGI."
- [00:25:04]–[00:25:08] "if I walked up to a robot and say, do anything that I could do, I would expect it to be able to do it."
- [00:25:39]–[00:25:43] "I think that will land after the digital AGI thing has happened."

---

## 3. Body 2: AI concept (~125 words)
Connect the moment to perception, memory, planning, or learning.

**Evidence:**
- [00:25:13]–[00:25:26] "we call this the Moravec's paradox, where things that are really easy for humans are very difficult for robots. Like, the AI is-- it's passed the bar exam... but they cannot cook you eggs, or flip a burger."
- [00:20:07]–[00:20:13] "as the robots get bigger, get more capable, gain more degrees of freedom... it's harder and harder for somebody to jump in and help." (Context [00:19:50]–[00:20:05]: teleoperation as a human safety net, like a safety driver.)

---

## 4. Body 3: Reflection (~125 words)
Your own interpretation or a test you would propose.

**Evidence:**
- [00:24:16]–[00:24:33] Five to ten year timeline (see Body 1).
- [00:20:07]–[00:20:13] "harder and harder for somebody to jump in and help" (see Body 2).

> [!WARNING] Mars is your extrapolation
> Nothing in the video mentions Mars. The paragraph's first sentence says so explicitly. Keep it if you edit this paragraph.
---

## 5. Conclusion (~50 words)
One to two sentences.

---

## Figure
Already built in `main.tex` (TikZ data pyramid, `fig:datapyramid`). Body 2 references it with `Figure~\ref{fig:datapyramid}`.

# Full Essay
```
In the Google DeepMind episode \emph{Introducing Gemini Robotics 2}, the host asks the robotics team if anyone can claim general intelligence without a body. One of the researchers responds, ``You cannot reach AGI until you solve physical AGI'' \cite{gemini_robotics_2} (emphasis added). I believe we will find that physical intelligence is the limiting factor on the road to AGI, and that this means the hardest problem is acting reliably where humans cannot jump in to assist.

Prior to this discussion, a researcher states that their estimates for general-purpose robots entering the world have shrunk from ``probably beyond my lifetime'' (three years ago), to ``maybe ten years'' (two years ago) and now ``between five to ten years'' \cite{gemini_robotics_2}. The host asks if general intelligence can be claimed without ``this embodied characteristic,'' and the response is that a robot asked to ``do anything that I could do'' should be able to do it, and that physical AGI ``will land after the digital AGI thing has happened'' \cite{gemini_robotics_2}. I would note that the researchers do not belittle language models; they are saying the digital half of intelligence is coming first, and the physical half is the bigger challenge. This problem is called Moravec's paradox: ``things that are really easy for humans are very difficult for robots'' \cite{gemini_robotics_2}. An AI can ``pass the bar exam,'' but ``cannot cook you eggs, or flip a burger.''

In the context of courses, this observation is the distinction between planning in a clean symbolic state space and perceiving and learning in a noisy continuous state space. In an earlier segment, another speaker notes the reason the gap is a challenge: while a human teleoperator can rescue a small robot, ``as the robots get bigger, get more capable, gain more degrees of freedom \ldots\ it's harder and harder for somebody to jump in and help'' \cite{gemini_robotics_2}. Teleoperation data is the most accurate but least scalable form (see Figure~\ref{fig:datapyramid}), so robots inevitably have to learn from their mistakes.

The video makes no mention of Mars, so this is an extrapolation on my part. A Mars rover is the ultimate expression of the teleoperation problem: since it takes three to twenty-two minutes for a signal to travel between the planets, no one on the ground can ``jump in and help'' in real-time. If physical AGI is five to ten years away, I would offer a delayed intervention test: give a robot a multi-step task (such as cooking a simple recipe), add a twenty-minute delay to any human correction, and observe how often the robot can correct itself. A robot that passes this test would be able to perform the tasks described by the researchers at Google DeepMind. In my opinion, such a robot would be a more convincing step towards proving the capacity for AGI (and ultimately ASI) than another examination of a language model.

The video's thesis is that intelligence is not merely what a system can say, but what it can do. Moravec's paradox implies that the last leg of the journey towards AGI will be made not in the realm of language, but of motion, and I believe we will find that systems that can do things without requiring a human safety net will be the ones to arrive first.
```

## Before pasting into main.tex
- [x] Every quote has `\cite{gemini_robotics_2}` (key matches `citations.bib`)
- [x] ~500 words (~477)
- [x] No claim attributed to the video that it does not make (Mars)
- [x] AI-use disclosure added to `main.tex`
- [x] Pasted into `main.tex` in [[Writing 1 - Learn the Tools]]
- [ ] `\author{}` has your real name (tracked in [[Writing 1 - Learn the Tools]])
