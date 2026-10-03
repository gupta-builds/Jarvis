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
next: "Read the drafts, adjust anything that doesn't sound like you, then paste each section into the matching [bracketed] blank of main.tex"
---
# Essay (Writing #1 draft)

Drafting space for [[Writing 1 - Learn the Tools]]. Source: [[Writing - 1 Video Transcript]], *Introducing Gemini Robotics 2* (Google for Developers), cite key `gemini_robotics_2`.

**Prompt (Discussion 3, 9/25):** Choose one video and reflect on a specific moment. Connect it to an AI concept and develop your own interpretation or a test you would propose.
**Target:** ~500 words total (it can be more). Current draft: ~600 words.

> [!NOTE] Drafts are LaTeX-ready
> Quotes use ``` ``...'' ``` and every quote carries `\cite{gemini_robotics_2}`, so each **Draft** block can be pasted straight into `main.tex`. In Obsidian the quote marks look odd; in the compiled PDF they render as proper curly quotes.

---

## 1. Introduction (~75 words)
Name the video and the one specific moment. End with a one-sentence thesis.

**Draft:**

In the Google DeepMind episode \emph{Introducing Gemini Robotics 2}, the host asks the robotics team whether anyone can claim general intelligence without a body. One researcher answers without hesitating: ``You cannot reach AGI until you solve physical AGI'' \cite{gemini_robotics_2}. That moment changed how I think about progress in AI. I will argue that physical intelligence is the real bottleneck on the road to general intelligence, and that the hardest part is not reasoning but acting reliably in places where no human can step in to help.

---

## 2. Body 1: Observation (~125 words)
Describe and quote the moment.

**Evidence (verified against transcript):**
- [00:24:44]–[00:24:55] The host asks whether general intelligence can be claimed without "this embodied characteristic."
- [00:25:01] "You cannot reach AGI until you solve physical AGI."
- [00:25:04]–[00:25:08] "if I walked up to a robot and say, do anything that I could do, I would expect it to be able to do it."
- [00:25:39]–[00:25:43] "I think that will land after the digital AGI thing has happened."

**Draft:**

The exchange happens about twenty-five minutes into the video. Just before it, one of the researchers explains how their estimate for general-purpose robots entering daily life has shrunk. Three years ago the answer would have been ``probably beyond my lifetime,'' two years ago ``maybe ten years,'' and now ``between five to ten years'' \cite{gemini_robotics_2}. The host then asks whether general intelligence can be claimed without ``this embodied characteristic'' \cite{gemini_robotics_2}. The answer is that if you asked a robot to ``do anything that I could do,'' you would expect it to do it, and that physical AGI ``will land after the digital AGI thing has happened'' \cite{gemini_robotics_2}. What stood out to me is that the team is not dismissing language models. They are saying the digital half of intelligence is arriving first, and the physical half is the harder test.

---

## 3. Body 2: AI concept (~125 words)
Connect the moment to perception, memory, planning, or learning.

**Evidence:**
- [00:25:13]–[00:25:26] "we call this the Moravec's paradox, where things that are really easy for humans are very difficult for robots. Like, the AI is-- it's passed the bar exam... but they cannot cook you eggs, or flip a burger."
- [00:20:07]–[00:20:13] "as the robots get bigger, get more capable, gain more degrees of freedom... it's harder and harder for somebody to jump in and help." (Context [00:19:50]–[00:20:05]: teleoperation as a human safety net, like a safety driver.)
- [00:20:27]–[00:20:28] "if it does get stuck, how do I both fix it quickly and learn from that moment?"

**Draft:**

The researcher names this idea directly as Moravec's paradox: ``things that are really easy for humans are very difficult for robots.'' An AI has ``passed the bar exam,'' yet it ``cannot cook you eggs, or flip a burger'' \cite{gemini_robotics_2}. In terms of this course, it is the gap between planning in a clean, symbolic state space and perceiving and learning in a noisy, continuous one. Earlier in the video, another speaker explains why the gap is so hard to close. When a small robot gets stuck, a human teleoperator can take over, but ``as the robots get bigger, get more capable, gain more degrees of freedom \ldots\ it's harder and harder for somebody to jump in and help'' \cite{gemini_robotics_2}. The training data has the same tradeoff: the most precise source, teleoperation, is also the least scalable (Figure~\ref{fig:datapyramid}). So the robot eventually has to learn from its own mistakes, which is the open question the team raises: ``how do I both fix it quickly and learn from that moment?'' \cite{gemini_robotics_2}.

---

## 4. Body 3: Reflection (~125 words)
Your own interpretation or a test you would propose.

**Evidence:**
- [00:24:16]–[00:24:33] Timeline shift: "beyond my lifetime" (three years ago), "maybe ten years" (two years ago), now "I think that it's between five to ten years."
- [00:24:36] "the speed of evolution of this technology is amazingly fast."

> [!WARNING] Mars is your extrapolation
> Nothing in the video mentions Mars. The draft below says so explicitly. Keep that sentence if you edit this paragraph.

**Draft:**

I want to push this argument further than the video does. The speakers never mention Mars, so this extension is my own. A robot on Mars is the extreme version of the teleoperation problem: a signal from Earth takes roughly three to twenty-two minutes to arrive, so no human can ``jump in and help'' in real time. If physical AGI really is five to ten years away, I would propose a delayed-intervention test. Give a robot a multi-step physical task, such as cooking a simple meal or assembling a shelf, and add a twenty-minute delay to every human correction. Then measure how often it recovers from mistakes on its own. A robot that passes this test would show the kind of physical intelligence the team describes. In my view, that would be a stronger sign of progress toward AGI, and eventually ASI, than another exam score.

---

## 5. Conclusion (~50 words)
One to two sentences.

**Draft:**

The most important claim in the video is that intelligence is not only something a system can say, but something it can do. Moravec's paradox suggests the last steps toward AGI will happen in the physical world, and I think the robots that can act without a human safety net will be the ones that get us there.

---

## Figure
Already built in `main.tex` (TikZ data pyramid, `fig:datapyramid`). Body 2 references it with `Figure~\ref{fig:datapyramid}`.

## AI-use disclosure
The assignment requires a disclosure if AI was used. Suggested line to add at the end of `main.tex`, before the bibliography (edit to match what you actually did):

```latex
\section*{AI Use Disclosure}
I used Claude (Anthropic) to draft this essay from my notes and verified quotes from the video transcript. I reviewed and edited the final text.
```

## Before pasting into main.tex
- [ ] Every quote has `\cite{gemini_robotics_2}` (key matches `citations.bib`, otherwise it renders `[?]`)
- [ ] ~500 words
- [ ] `\author{}` has your real name
- [ ] No claim attributed to the video that it does not make (Mars)
- [ ] AI-use disclosure added
