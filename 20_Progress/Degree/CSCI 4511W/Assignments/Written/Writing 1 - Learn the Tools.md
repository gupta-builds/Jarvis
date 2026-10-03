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
next: "Copy main.tex and citations.bib into Overleaf, put your real name in \\author{}, compile, and submit the PDF"
---
# Writing 1 - Learn the Tools
## Overview
A reflection essay responding to the video *Introducing Gemini Robotics 2* (Google for Developers), written and compiled in LaTeX. Due date is **not confirmed anywhere I can source**. Verify it on Canvas before submitting.

### Resources
> Given by the TA: maryam kameli

For Writing 1 you can choose any of the videos we watched today or anything else you find relevant. 
I suggest these videos: 
https://youtu.be/-rYFDefcq3k?si=9hvLTgLMYXE0NnIL

https://youtu.be/FrGq8ltb-_E?si=rFSHUfEXVwh_OuzK

https://youtu.be/PDKhUknuQDg?si=HiaA0RjZ74UbcoxS

https://youtu.be/wYVHxw2-DP4?si=3GLDFncktNgPbKuF

https://youtu.be/Bj9BD2D3DzA?si=snY99z9Em6grBKT2

https://youtu.be/MxTWLm9vT_o?si=J8t4P-CeLPI0OaEE

https://youtu.be/a8Bo2DHrrow?si=RMWejTCypDBrWeaC

An example of overleaf document. 
https://www.overleaf.com/read/fvpwwtftyjhj#11eb9d

https://docs.google.com/document/d/1pnu_dtyPjDywA8JWnqg72TcjgnjqlMhrSW955oyR63Q/edit?tab=t.0#heading=h.r3iw8lcgnbqm

## Files to submit
Two files. The essay is filled in; the only field left is `\author{}`, which needs your real name. No separate image file is needed: the figure is drawn directly in LaTeX (TikZ), so there's nothing extra to upload for it.

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

In the Google DeepMind episode \emph{Introducing Gemini Robotics 2}, the host asks the robotics team whether anyone can claim general intelligence without a body. One researcher answers immediately: ``You cannot reach AGI until you solve physical AGI'' \cite{gemini_robotics_2}. I will argue that physical intelligence is the real bottleneck on the road to AGI, and that the hardest part is acting reliably where no human can step in to help.

Just before this exchange, a researcher describes how their estimate for general-purpose robots entering daily life has shrunk: ``probably beyond my lifetime'' three years ago, ``maybe ten years'' two years ago, and now ``between five to ten years'' \cite{gemini_robotics_2}. The host then asks whether general intelligence can be claimed without ``this embodied characteristic.'' The answer is that a robot asked to ``do anything that I could do'' should be able to do it, and that physical AGI ``will land after the digital AGI thing has happened'' \cite{gemini_robotics_2}. What stood out to me is that the team is not dismissing language models. They are saying the digital half of intelligence is arriving first, and the physical half is the harder test.

The researcher names this Moravec's paradox: ``things that are really easy for humans are very difficult for robots.'' An AI has ``passed the bar exam,'' yet it ``cannot cook you eggs, or flip a burger'' \cite{gemini_robotics_2}. In course terms, this is the gap between planning in a clean symbolic state space and perceiving and learning in a noisy, continuous world. Earlier, another speaker explains why the gap is hard to close: a human teleoperator can rescue a small robot, but ``as the robots get bigger, get more capable, gain more degrees of freedom \ldots\ it's harder and harder for somebody to jump in and help'' \cite{gemini_robotics_2}. Teleoperation data is the most precise but least scalable source (Figure~\ref{fig:datapyramid}), so robots must eventually learn from their own mistakes.

The speakers never mention Mars, so this extension is my own. A Mars robot is the extreme version of the teleoperation problem: signals from Earth take three to twenty-two minutes to arrive, so no one can ``jump in and help'' in real time. If physical AGI is five to ten years away, I would propose a delayed-intervention test. Give a robot a multi-step task, such as cooking a simple meal, add a twenty-minute delay to every human correction, and measure how often it recovers on its own. A robot that passes would show the physical intelligence the team describes. In my view, that is a stronger sign of progress toward AGI, and eventually ASI, than another exam score.

\begin{figure}[htbp]
    \centering
    \begin{tikzpicture}
        \draw[fill=blue!15] (0,0) rectangle (4,1);
        \node[right] at (4.2,0.5) {\small Egocentric human video: most scalable, least precise};

        \draw[fill=blue!30] (0,1) rectangle (4,2);
        \node[right] at (4.2,1.5) {\small Wearable-device data};

        \draw[fill=blue!50] (0,2) rectangle (4,3);
        \node[right] at (4.2,2.5) {\small Teleoperation data: most precise, least scalable};
    \end{tikzpicture}
    \caption{The robot-training data sources described in the video, from most scalable but least precise (bottom) to most precise but least scalable (top) \cite{gemini_robotics_2}.}
    \label{fig:datapyramid}
\end{figure}

The video's central claim is that intelligence is not only something a system can say, but something it can do. Moravec's paradox suggests the last steps toward AGI will happen in the physical world, and I think robots that can act without a human safety net will get us there.

\section*{AI Use Disclosure}
I used Claude (Anthropic) to draft this essay from my notes and verified quotes from the video transcript. I reviewed and edited the final text.

\nocite{*}
\bibliographystyle{plainurl}
\bibliography{citations}
\end{document}
```

### `citations.bib`
Create this as a **new file** in your Overleaf project (File menu → New File → name it exactly `citations.bib`), separate from `main.tex`. Your Zotero import is fixed below. Zotero couldn't read the real title or author from the tracking-parameter URL you had, so it output a placeholder `title = {- {YouTube}}` and an empty-author key `noauthor_-_nodate`. Both are corrected here using the real video metadata and the citation guide's own field format:
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
This follows `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4511W\Homework\How to Cite in LaTeX (Citation Guide).pdf` exactly: `.bib` file named `citations.bib` (not Zotero's default), `\bibliographystyle{plainurl}` + `\nocite{*}` + `\bibliography{citations}` at the end of `main.tex` (already included above), and `\usepackage{xurl}` in the preamble so the URL renders cleanly (already included).

> [!WARNING] Not test-compiled
> No LaTeX engine (pdflatex/xelatex/tectonic) is installed on this machine, so this hasn't been compiled, only checked against standard, common patterns. Compile it in Overleaf; if anything errors, paste the error back.

## Essay
Drafted and finalized in [[Essay]] (the **Full Essay** section, ~477 words). That text is what sits in the body of `main.tex` above. If you change the essay, change it in both places.

Source: [[Writing - 1 Video Transcript]]. Every quote in the essay was checked word for word against the transcript. The Mars paragraph is labeled in the essay itself as your own extension, since the video never mentions Mars.

## Requirements
**Must submit:** compiled PDF titled "Writing #1" (or "Writing #1: Feedback Requested"), built from the template above with your real name; intro/body/conclusion; at least one citation in a reasonable format; AI-use disclosure if applicable.
**Must not:** submit with a mismatched `\cite{}`/`.bib` key (renders as `[?]`, so check before submitting).

### Before submitting
- [ ] `\author{}` has your real name
- [ ] Compiles in Overleaf with no `[?]` citations or `??` figure references
- [ ] Title is "Writing #1" (or "Writing #1: Feedback Requested" if you want TA feedback)
- [ ] AI-use disclosure wording matches what you actually did

### Assignment prompt (verbatim)
For this assignment, consume the media (i.e. read an article, paper, or watch a video) provided by your TA. Then respond to it, using one of the prompts that you talked about in your discussion.

You should write using an essay format, meaning that your paper should have a distinct introduction, body and conclusion, and be approximately 500 words. (It can be more if you want.)

Use this provided template: `"D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4511W\Code\Homework\wa1_template.tex"` as a starting point.

Title your paper, "Writing #1"

You **must** write and compile your essay using a Latex editor, we recommend Overleaf, but you can use others if you want.

Your essay **must** also include at least one citation (the item of media that you are discussing,) and can include other citations if appropriate.

The paper will be graded mostly on proper Latex usage and proper citation format, with only 1 point reserved for paper structure.

You may request further feedback on your argumentative writing style. If you want this, set your paper's title to "Writing #1: Feedback Requested". The TAs will then give you _ungraded_ feedback on possible improvements in your writing.

#### Rubric

Proper Latex Usage: 3 points - You used the template and updated the appropriate fields for your name and paper's name

Citation Format: 1 point - You have an in-text citation and it uses a reasonable (APA, MLA, etc) format 

Paper structure/legibility: 1 point - The paper has multiple paragraphs and those paragraphs have multiple sentences with actual words. The paper includes an introduction, a body, and a conclusion.

## Background (resource-gathering notes, not needed to write the essay)
<details>
<summary>Video options, inaccessible-link details, and where the assignment prompt actually came from</summary>

**7 TA-suggested videos** (any is valid; you picked #1): #1 Introducing Gemini Robotics 2 (Google for Developers) · #2 Project Ace (Sony AI) · #3 Genie 3 (Google DeepMind, confirmed watched in Discussion 3) · #4 Gemini Robotics 2 dexterity showcase (Google DeepMind, confirmed watched in Discussion 3) · #5 Tracing the thoughts of a large language model (Anthropic) · #6 Reverse Turing Test Experiment with AIs (Tamulur) · #7 AI teaches itself to drive in Trackmania (Yosh).

**Overleaf example project / Google Doc:** both TA-linked resources were inaccessible to my tools (Overleaf's share link is a client-side-rendered viewer with no fetchable source; the Google Doc returns 401). You pasted the Overleaf project's real `main.tex`/`references.bib` directly, which resolved the LaTeX-mechanics question; the Google Doc's contents are still unseen by me.

**Why Discussion 3 got read:** it's the actual session (9/25) where TA Maryam Kameli assigned this homework. Its own closing slide states the real prompt ("Choose one video and reflect on a specific moment. Connect it to an AI concept and develop your own interpretation or a test you would propose.") and supplied the LaTeX teaching example, which filled the gap left by the two inaccessible links above. It's the assignment's actual source, not supplementary brainstorming material.

**Stray file:** `wa1_template.tex` also sits at the vault root (`D:\_Anant\20_Progress\Documents\Jarvis\wa1_template.tex`), duplicate of the real one in the course folder. Still there, not moved without confirmation.
</details>

## Work log
- 2026-10-03: Essay finalized in [[Essay]] (~477 words) and placed into the body of `main.tex`, with an AI-use disclosure section.
- 2026-10-03: Resolved a sync conflict on this note. The synced copy had reverted to the blank template; merged the worked version back in and kept the TA resource links and verbatim prompt from the template version.

## Concepts used
- Moravec's paradox
- Embodied (physical) AI vs. digital AI
- Teleoperation and learning from failure

## Post-submit reflection
- What failed first?
- What pattern repeats?
