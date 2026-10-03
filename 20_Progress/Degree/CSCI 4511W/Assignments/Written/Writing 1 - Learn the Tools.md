---
type: class
input_kind: homework
status: sprout
created: 2026-10-02
updated: 2026-10-03
area:
  - "[[CSCI 4511W Board]]"
deadline:
tags:
  - "#class"
  - "#Homework"
next: "Fill in the four [bracketed] blanks in main.tex below in your own words, then compile in Overleaf"
---
# Writing 1 - Learn the Tools
## Overview
A reflection essay responding to the video *Introducing Gemini Robotics 2* (Google for Developers), written and compiled in LaTeX. Due date is **not confirmed anywhere I can source** — verify on Canvas before submitting.

## Files to submit
Two files, both complete except the four bracketed lines you fill in. No separate image file needed — the figure is drawn directly in LaTeX (TikZ), so there's nothing extra to upload for it.

### `main.tex`
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
\usepackage{xurl}
\usepackage{tikz}

\title{Writing \#1}
\author{[Your real name]}

\usepackage{fancyhdr}
\fancypagestyle{plain}{%
    \fancyhf{}
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

[Introduction: name the video and the one specific moment you're responding to. One-sentence thesis.]

[Body paragraph 1 -- Observation: describe and quote the specific moment, e.g. "...you cannot reach AGI until you solve physical AGI" \cite{gemini_robotics_2}.]

[Body paragraph 2 -- AI concept: connect that moment to perception, memory, planning, or learning, in your own words.]

[Body paragraph 3 -- Reflection: your own interpretation or test proposal.]

\begin{figure}[htbp]
    \centering
    \begin{tikzpicture}
        \draw[fill=blue!15] (0,0) rectangle (4,1);
        \node[right] at (4.2,0.5) {\small Egocentric human video --- most scalable, least precise};

        \draw[fill=blue!30] (0,1) rectangle (4,2);
        \node[right] at (4.2,1.5) {\small Wearable-device data};

        \draw[fill=blue!50] (0,2) rectangle (4,3);
        \node[right] at (4.2,2.5) {\small Teleoperation data --- most precise, least scalable};
    \end{tikzpicture}
    \caption{The robot-training data sources described in the video, from most scalable but least precise (bottom) to most precise but least scalable (top) \cite{gemini_robotics_2}.}
    \label{fig:datapyramid}
\end{figure}

[Conclusion: one to two sentences.]

\nocite{*}
\bibliographystyle{plainurl}
\bibliography{citations}
\end{document}
```

### `citations.bib`
Create this as a **new file** in your Overleaf project (File menu → New File → name it exactly `citations.bib`), separate from `main.tex`. Your Zotero import is fixed below — Zotero couldn't read the real title/author from the tracking-parameter URL you had, so it output a placeholder `title = {- {YouTube}}` and an empty-author key `noauthor_-_nodate`; both are corrected here using the real video metadata and the citation guide's own field format:
```bibtex
@misc{gemini_robotics_2,
      title = {Introducing {Gemini} {Robotics} 2},
      url = {https://www.youtube.com/watch?v=-rYFDefcq3k},
      abstract = {Enjoy the videos and music you love, upload original content, and share it all with friends, family, and the world on YouTube.},
      urldate = {2026-10-03},
      journal = {YouTube},
      author = {{Google for Developers}},
}
```
This follows `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4511W\Homework\How to Cite in LaTeX (Citation Guide).pdf` exactly: `.bib` file named `citations.bib` (not Zotero's default), `\bibliographystyle{plainurl}` + `\nocite{*}` + `\bibliography{citations}` at the end of `main.tex` (already in the skeleton above), and `\usepackage{xurl}` in the preamble so the URL renders cleanly (already included).

> [!WARNING] I could not test-compile this
> No LaTeX engine (pdflatex/xelatex/tectonic) is installed on this machine, so I haven't verified this actually compiles — only that the syntax follows standard, common patterns. Compile it in Overleaf; if anything errors, paste the error back and I'll fix it.

## Writing it
Four blanks, in your own words, from your own reactions (robotics scaling toward AGI/ASI, Mars, the 20:00–25:00 physical-AGI segment) and the real transcript quotes below:
- **[00:20:00]–[00:20:16]**: "as the robots get bigger, get more capable, gain more degrees of freedom... it's harder and harder for somebody to jump in and help" (teleoperation doesn't scale as a safety net).
- **[00:25:01]–[00:25:04]**: **"You cannot reach AGI until you solve physical AGI."**
- **[00:25:13]–[00:25:29]**: Moravec's paradox, named directly — "it's passed the bar exam... but they cannot cook you eggs, or flip a burger."
- **[00:24:16]–[00:24:36]**: "I think that it's between five to ten years" (daily-life robot timeline).
Full transcript: [[20_Progress/Degree/CSCI 4511W/Assignments/Written/Writing - 1 Video Transcript]]. Note: nothing in the video addresses Mars — that's your own extrapolation from the timeline/capability claims above, which is fine, just say so explicitly rather than implying the video claims it.

> [!NOTE] Length
> You said ~350 words; the assignment itself states "approximately 500 words (it can be more if you want)" with no stated minimum below that. 350 isn't necessarily wrong, but it's noticeably under the stated target and the rubric's "multiple paragraphs... multiple sentences" legibility point is easier to clearly hit with more room. Your call — flagging it so it's not a surprise.

Bring a draft back any time for a grammar pass or critique of what you've already written (both allowed, both need disclosure) — I won't rewrite sentences or strengthen the argument.

## Requirements
**Must submit:** compiled PDF titled "Writing #1" (or "Writing #1: Feedback Requested"), built from the template above with your real name; intro/body/conclusion; at least one citation in a reasonable format; AI-use disclosure if applicable.
**Must not:** submit with a mismatched `\cite{}`/`.bib` key (renders as `[?]` — check before submitting); 
### Rubric
- Proper LaTeX usage — 3 pts (template used, fields filled in correctly)
- Citation format — 1 pt (real in-text citation, reasonable format)
- Structure/legibility — 1 pt (real paragraphs, clear intro/body/conclusion)

## Background (resource-gathering notes, not needed to write the essay)
<details>
<summary>Video options, inaccessible-link details, and where the assignment prompt actually came from</summary>

**7 TA-suggested videos** (any is valid; you picked #1): #1 Introducing Gemini Robotics 2 (Google for Developers) · #2 Project Ace (Sony AI) · #3 Genie 3 (Google DeepMind, confirmed watched in Discussion 3) · #4 Gemini Robotics 2 dexterity showcase (Google DeepMind, confirmed watched in Discussion 3) · #5 Tracing the thoughts of a large language model (Anthropic) · #6 Reverse Turing Test Experiment with AIs (Tamulur) · #7 AI teaches itself to drive in Trackmania (Yosh).

**Overleaf example project / Google Doc:** both TA-linked resources were inaccessible to my tools (Overleaf's share link is a client-side-rendered viewer with no fetchable source; the Google Doc returns 401). You pasted the Overleaf project's real `main.tex`/`references.bib` directly, which resolved the LaTeX-mechanics question; the Google Doc's contents are still unseen by me.

**Why Discussion 3 got read:** it's the actual session (9/25) where TA Maryam Kameli assigned this homework — its own closing slide states the real prompt ("Choose one video and reflect on a specific moment. Connect it to an AI concept and develop your own interpretation or a test you would propose.") and supplied the LaTeX teaching example, which is what filled the gap left by the two inaccessible links above. It's the assignment's actual source, not supplementary brainstorming material.

**Stray file:** `wa1_template.tex` also sits at the vault root (`D:\_Anant\20_Progress\Documents\Jarvis\wa1_template.tex`), duplicate of the real one in the course folder — still there, not moved without confirmation.
</details>

## Work log
-

## Concepts used
-

## Post-submit reflection
- What failed first?
- What pattern repeats?
