---
type: class
input_kind: homework
status: sprout
created: 2026-10-02
updated: 2026-10-02
area:
  - "[[CSCI 4511W Board]]"
deadline:
tags:
  - "#class"
  - "#Homework"
next: "Pick a video (see Resources), watch it, and write your own reflection before touching LaTeX — the template and citation are already set up below"
---
# Writing 1 - Learn the Tools
## Overview
A ~500-word reflection essay, written and compiled in LaTeX (Overleaf recommended), responding to one TA-suggested AI video. Assigned by TA Maryam Kameli in Discussion 3 (9/25), whose own closing slide frames it exactly: "For next week: 500-word reflection — Choose one video and reflect on a specific moment. Connect it to an AI concept and develop your own interpretation or a test you would propose. Use LaTeX and include a working media citation." Exact due date/time is **not confirmed** — "for next week" from a 9/25 discussion most plausibly means before Discussion 4 (10/2), but this is an inference, not a sourced date. Verify on Canvas/Discord before treating any date as real.

> [!IMPORTANT] Academic integrity — read before using any AI help on this assignment
> Discussion 2 (9/18) states the course's AI policy explicitly: **"Do not use AI to draft your essays or come up with the core ideas for your essays... Develop your own ideas and approach. No AI brainstorming, outlines, arguments, or essay drafts."** AI may only help with grammar/spelling/phrasing, or critique ideas you already wrote (and that critique must be cited). **Any AI use at any point must be disclosed**: which tool, what it helped with, and a submitted file with the exact prompts (including follow-ups) — undisclosed AI use is itself a policy violation, independent of whether the content was AI-written.
>
> What this means for how I (Claude) am helping with this assignment: I've set up the LaTeX template, the citation/bibliography mechanics, and this note's structure below — all mechanical scaffolding. I have **not** written and will **not** write your reflection, your chosen "specific moment," your AI-concept connection, or your interpretation/test proposal. That part is yours to write, by the course's own rule. If you want AI critique on a draft you've written yourself, I can do that — but it needs to go in your disclosure file either way.

## Resources
### The 7 TA-suggested videos
TA's framing (verbatim): "For Writing 1 you can choose any of the videos we watched today or anything else you find relevant." Titles/channels confirmed via YouTube's own metadata (not guessed):

| #   | Video                                                                                               | Channel               | Confirmed in Discussion 3?                                                              |
| --- | --------------------------------------------------------------------------------------------------- | --------------------- | --------------------------------------------------------------------------------------- |
| 1   | [Introducing Gemini Robotics 2](https://youtu.be/-rYFDefcq3k)                                       | Google for Developers | Not directly named, but same robotics line as #4                                        |
| 2   | [Project Ace](https://youtu.be/FrGq8ltb-_E)                                                         | Sony AI               | Not referenced in Discussion 3 — subject unconfirmed beyond title                       |
| 3   | [Genie 3: Creating dynamic worlds that you can navigate in real-time](https://youtu.be/PDKhUknuQDg) | Google DeepMind       | **Yes** — "Play Genie 3 (2:23)," and used as Discussion 3's own worked citation example |
| 4   | [Tough dexterity tasks with Gemini Robotics 2](https://youtu.be/wYVHxw2-DP4)                        | Google DeepMind       | **Yes** — "Play the dexterity showcase (2:19)"                                          |
| 5   | [Tracing the thoughts of a large language model](https://youtu.be/Bj9BD2D3DzA)                      | Anthropic             | Not referenced in Discussion 3                                                          |
| 6   | [Reverse Turing Test Experiment with AIs](https://youtu.be/MxTWLm9vT_o)                             | Tamulur               | Not referenced in Discussion 3                                                          |
| 7   | [AI teaches itself to drive in Trackmania](https://youtu.be/a8Bo2DHrrow)                            | Yosh                  | Not referenced in Discussion 3                                                          |

Only #3 (Genie 3) and #4 (dexterity showcase) are confirmed as videos actually watched in that day's discussion (Discussion 3 also played a third video, SIMA 2, which isn't on the TA's 7-link list — so "watched today" isn't identical to "on this list," and the TA's own wording allows "anything else you find relevant" beyond all of these). Pick whichever genuinely gives you something to say — that choice is yours, not something I should make for you.

### Overleaf example project — could not access
The TA-provided example (https://www.overleaf.com/read/fvpwwtftyjhj#11eb9d, "LaTeX Practice: Math, Figures, and References") is a read-only Overleaf share link. I tried four ways to read it — direct WebFetch, a dedicated web-fetch subagent, the Copilot Plus web-fetch skill (not licensed on this machine), and checking your connected Google Drive (irrelevant here, wrong platform) — and could not get past Overleaf's client-side-rendered project viewer; the static page returns no source content. **I cannot see what's actually in that project's main.tex/references.bib beyond what your screenshot already showed** (a "Citations and a bibliography" page citing 3 Overleaf help-doc sources).
This turned out not to matter: Discussion 3's own slides contain a complete, equivalent worked example (the exact citation/figure/math mechanics below), read directly from the local PDF. If you want the Overleaf example itself anyway, you'd need to open it in a browser and use its "Download project source" button, or tell me and I'll walk through it with you live.

### Google Doc — could not access
https://docs.google.com/document/d/1pnu_dtyPjDywA8JWnqg72TcjgnjqlMhrSW955oyR63Q — returns HTTP 401 (sign-in required) through WebFetch, the web-fetch subagent, and a direct lookup against your connected Google Drive account (file not found there, meaning it isn't shared with that account). **I have not seen this document's contents and am not guessing at them.** If it has something the resources below don't cover, open it yourself in a signed-in browser (you likely have course access even though my tools don't) and paste the relevant part here, or share it with the connected Google account.

### Discussion 3 (9/25) — the real primary source, read in full
`D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4511W\Discussion\Discussion 3.pdf`. This is the actual teaching session this assignment comes from. Full LaTeX mechanics confirmed from it (not reconstructed from memory):

**Document skeleton** (matches `wa1_template.tex` below):
```latex
\documentclass{article}
\usepackage[hidelinks]{hyperref}
\title{Discussion 3}
\author{Your Name}
\date{}
\begin{document}
\maketitle
Your paragraph goes here.
\end{document}
```

**Citation mechanics — the exact worked example from the slides**, using the Genie 3 video (reuse this pattern with your own chosen video's real details, not necessarily Genie 3 itself):

`references.bib`:
```bibtex
@misc{genie3,
   author = {{Google DeepMind}},
   title = {{Genie 3}: Creating Dynamic Worlds That You Can Navigate in Real-Time},
   year = {2025},
   howpublished = {YouTube. \url{https://youtu.be/PDKhUknuQDg}}
}
```
In `main.tex`: `This document cites the demo~\cite{genie3}.` then at the end:
```latex
\bibliographystyle{plain}
\bibliography{references}
```
Compiles to: "This document cites the demo [1]." plus a numbered References section. (The slide also flags the common failure mode: a typo like `\cite{genii3}` not matching the `.bib` key `genie3` shows as `[?]` in the compiled PDF — check the key spelling first if that happens.)

**Figures:**
```latex
\usepackage{graphicx} % in the preamble
\begin{figure}[ht]
   \centering
   \includegraphics[width=.6\linewidth]{example.png}
   \caption{Describe what the result shows.}
   \label{fig:result}
\end{figure}
See Figure~\ref{fig:result}.
```

**Math:**
```latex
Inline math belongs in a sentence. The agent runs for \(N\) trials.

Display math gets its own line.
\[
   \bar{R} = \frac{1}{N}\sum_{i=1}^{N} R_i
\]
```

**Quick fixes** (verbatim from the slide, worth checking before asking for help): braces — match every `{` with `}`; math — match `\(` with `\)`, or `\[` with `\]`; special characters — use `\%`, `\_`, `\&` in ordinary text (not raw `%`, `_`, `&`); references — check the citation key, the `.bib` filename, and the *first* compile error (later errors are often just fallout from the first one).

**The actual discussion-prompt framework** ("From observation to reflection," verbatim structure):
- **Observation** — one specific moment from the video (not a general summary).
- **AI concept** — connect that moment to perception, memory, planning, or learning.
- **Reflection** — explain what it means, or what you would test next.

This is "the prompt you talked about in discussion" that the assignment note refers to — it's the structure your 500 words should actually follow.

### `wa1_template.tex` — the required starting point
Source: `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4511W\Code\Homework\wa1_template.tex` (also present as an untracked file at the vault root — that's a stray duplicate from an earlier session, not meant to live there; flagging it, not moving it without you confirming it's safe to remove). Full content:
```latex
\documentclass{article}
\usepackage[utf8]{inputenc}
\usepackage{geometry}
 \geometry{
 letterpaper,
 left=20mm,
 top=20mm,
 }
\setlength{\headheight}{12.5pt}
 \usepackage{titling}

 \title{Paper Title Here}
\author{Your Name Here}
 
 \usepackage{fancyhdr}
\fancypagestyle{plain}{%  the preset of fancyhdr 
    \fancyhf{} % clear all header and footer fields
    \fancyhead[L]{\thetitle}
    \fancyhead[R]{\theauthor}
}
\makeatletter
\def\@maketitle{%
  \newpage
  \null
  \vskip 1em%
    \begin{center}
    {\LARGE \@title \par}
    \vskip 1em
    \end{center}
  \par
  \vskip 1em}
\makeatother

\begin{document}

\maketitle

Introduction first. Thesis statement, paragraph that explains and supports.

Multiple paragraphs in body, supporting arguments for main thesis.

Conclusion.

Don't forget citations!

\end{document}
```
This template does **not** include `\usepackage{graphicx}` or bibliography commands — add those yourself (shown above) if you use a figure or `\cite`/`\bibliography`.

## Requirements
**Must submit:**
- A LaTeX-compiled PDF (Overleaf or another LaTeX editor), titled exactly **"Writing #1"** — or **"Writing #1: Feedback Requested"** if you want ungraded writing-style feedback from the TAs.
- Built from `wa1_template.tex`, with your real name and the paper's title filled into the template's fields.
- Essay format: distinct introduction, body, conclusion. Approximately 500 words (more is fine).
- At least one citation — the video you're responding to — in a reasonable, consistent format (APA, MLA, etc.). Additional citations are allowed if relevant.
- If any AI was used at any point: a disclosure (tool, purpose, exact prompts including follow-ups) per the Academic Integrity note above.

**Must demonstrate (per the rubric):**
- Response to one of the 7 suggested videos (or another relevant one), following the Observation → AI concept → Reflection structure from Discussion 3.
- Your own interpretation or a test you would propose — not a summary of the video.

**Must not do:**
- Let AI draft, outline, or brainstorm the essay's ideas or arguments (course policy, see above).
- Submit without a working, correctly keyed citation (mismatched `\cite{}` / `.bib` keys render as `[?]` — verify before submitting).

### Rubric
- **Proper LaTeX usage — 3 points**: used the template, updated name/title fields correctly.
- **Citation format — 1 point**: real in-text citation in a reasonable format (APA/MLA/etc).
- **Paper structure/legibility — 1 point**: multiple paragraphs with real sentences; clear intro, body, conclusion.

## Work log
-

## Concepts used
-

## Post-submit reflection
- What failed first?
- What pattern repeats?
