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
Two files, both complete. Formatting: 12pt font, 1 inch margins on all sides, double-spaced text (`setspace`), the figure pinned in place after the Mars paragraph (`float`, `[H]`) so it can never split a paragraph across pages, and centered figure captions with an italic "Figure 1:" label (`caption`). No separate image file is needed: the figure is drawn directly in LaTeX (TikZ), so there's nothing extra to upload for it.

### `main.tex`
```latex
\documentclass{article}
\usepackage[utf8]{inputenc}
\usepackage{geometry}
\geometry{
 letterpaper,
 margin=1in,
}
\setlength{\headheight}{12.5pt}
\usepackage{titling}
\usepackage{xurl}
\usepackage{tikz}
\usepackage{setspace}
\doublespacing
\usepackage{caption}
\captionsetup{labelfont=it, justification=centering}

\title{Writing \#1}
\author{Anant Gupta}

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

In the Google DeepMind episode \emph{Introducing Gemini Robotics 2}, the host asks the robotics team if anyone can claim general intelligence without a body. One of the researchers responds, ``You cannot reach AGI until you solve physical AGI'' \cite{gemini_robotics_2}. I believe we will find that physical intelligence is the limiting factor on the road to AGI, and that this means the hardest problem is acting reliably where humans cannot jump in to assist.

Prior to this discussion, a researcher states that their estimates for general-purpose robots entering the world have shrunk from ``probably beyond my lifetime'' (three years ago), to ``maybe ten years'' (two years ago) and now ``between five to ten years'' \cite{gemini_robotics_2}. The host asks if general intelligence can be claimed without ``this embodied characteristic'' \cite{gemini_robotics_2}, and the response is that a robot asked to ``do anything that I could do'' should be able to do it, and that physical AGI ``will land after the digital AGI thing has happened'' \cite{gemini_robotics_2}. I would note that the researchers do not belittle language models; they are saying the digital half of intelligence is coming first, and the physical half is the bigger challenge. This problem is called Moravec's paradox: ``things that are really easy for humans are very difficult for robots'' \cite{gemini_robotics_2}. An AI has ``passed the bar exam,'' but ``cannot cook you eggs, or flip a burger'' \cite{gemini_robotics_2}.

In the context of this course, this observation is the distinction between planning in a clean symbolic state space and perceiving and learning in a noisy continuous state space. This is because manipulation is ``very contact-rich,'' requiring a hand with ``over twenty degrees of freedom'' to coordinate \cite{gemini_robotics_2}. In an earlier segment, another speaker notes the reason the gap is a challenge: while a human teleoperator can rescue a small robot, ``as the robots get bigger, get more capable, gain more degrees of freedom \ldots\ it's harder and harder for somebody to jump in and help'' \cite{gemini_robotics_2}. Teleoperation data is the most accurate but least scalable form (see Figure~\ref{fig:datapyramid}), so robots inevitably have to learn from their mistakes.

The video makes no mention of Mars, so this is an extrapolation on my part. A Mars rover is the ultimate expression of the teleoperation problem: since it takes three to twenty-two minutes for a signal to travel between the planets, no one on the ground can ``jump in and help'' \cite{gemini_robotics_2} in real time. If physical AGI is five to ten years away, I would offer a delayed intervention test: give a robot a multi-step task (such as cooking a simple recipe), add a twenty-minute delay to any human correction, and observe how often the robot can correct itself. A robot that passes this test would be able to perform the tasks described by the researchers at Google DeepMind. In my opinion, such a robot would be a more convincing step towards proving the capacity for AGI (and ultimately ASI) than another examination of a language model.

\begin{figure}[htbp]
    \centering
    \begin{tikzpicture}
        \draw[fill=blue!15] (0,0) rectangle (10,1);
        \node at (5,0.5) {\small Egocentric human video: most scalable, least precise};

        \draw[fill=blue!30] (0,1) rectangle (10,2);
        \node at (5,1.5) {\small Wearable-device data};

        \draw[fill=blue!50] (0,2) rectangle (10,3);
        \node at (5,2.5) {\small Teleoperation data: most precise, least scalable};
    \end{tikzpicture}
    \caption{The robot-training data sources described in the video \cite{gemini_robotics_2}, from most scalable but least precise (bottom) to most precise but least scalable (top). The data-pyramid framing is adapted from NVIDIA's GR00T N1 report \cite{nvidia_gr00t_n1}.}
    \label{fig:datapyramid}
\end{figure}

The video's thesis is that intelligence is not merely what a system can say, but what it can do. Moravec's paradox implies that the last leg of the journey towards AGI will be made not in the realm of language, but of motion, and I believe we will find that systems that can do things without requiring a human safety net will be the ones to arrive first.

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
      url = {https://youtu.be/-rYFDefcq3k?si=V_8kt7WwdQnjHR0w},
      abstract = {Enjoy the videos and music you love, upload original content, and share it all with friends, family, and the world on YouTube.},
      urldate = {2026-10-03},
      journal = {YouTube},
      author = {{Google for Developers}},
}

@misc{nvidia_gr00t_n1,
      title = {{GR00T} {N1}: An Open Foundation Model for Generalist Humanoid Robots},
      author = {{NVIDIA}},
      year = {2025},
      howpublished = {arXiv preprint arXiv:2503.14734},
      url = {https://arxiv.org/abs/2503.14734},
      urldate = {2026-10-03},
}
```
The second entry is the source for the figure's data-pyramid idea. The speaker at [00:12:21] says "people usually talk about this data pyramid" without naming a source. NVIDIA's GR00T N1 paper (arXiv:2503.14734, March 2025) is the published origin of that framing: web and human video at the base, synthetic data in the middle, real robot data at the top. The figure's three layers (egocentric video, wearable devices, teleoperation) follow the video, not the paper, which is why the caption says "adapted from."
This follows `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4511W\Homework\How to Cite in LaTeX (Citation Guide).pdf` exactly: `.bib` file named `citations.bib` (not Zotero's default), `\bibliographystyle{plainurl}` + `\nocite{*}` + `\bibliography{citations}` at the end of `main.tex` (already included above), and `\usepackage{xurl}` in the preamble so the URL renders cleanly (already included).

> [!WARNING] Not test-compiled
> No LaTeX engine (pdflatex/xelatex/tectonic) is installed on this machine, so this hasn't been compiled, only checked against standard, common patterns. Compile it in Overleaf; if anything errors, paste the error back.

## Essay
Finalized in [[Essay]] (the **Full Essay** section, ~537 words). That text is what sits in the body of `main.tex` above. If you change the essay, change it in both places.

Source: [[Writing - 1 Video Transcript]]. Every quote in the essay was checked word for word against the transcript, and every quote carries `\cite{gemini_robotics_2}` before the sentence's period, as the citation guide requires. The Mars paragraph is labeled in the essay itself as your own extension, since the video never mentions Mars.

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
