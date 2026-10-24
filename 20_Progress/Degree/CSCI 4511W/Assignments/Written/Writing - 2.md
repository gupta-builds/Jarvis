---
type: class
class_kind: homework
status: sprout
created: 2026-10-23
updated: 2026-10-23
tags:
  - class
  - homework
area:
  - "[[CSCI 4511W Board]]"
next: "Paste main.tex and citations.bib into a new Overleaf project, compile, run the pre-submit checks, submit the PDF on Canvas (Lectures 11 and 12 say due Friday 2026-10-23; confirm the time on Canvas)"
---
# Writing - 2
## Overview
A report of about 500 words, written in LaTeX on Overleaf and submitted as a PDF on Canvas, on one of four search papers. I chose [[#The paper|D\* Lite]] (Koenig and Likhachev, AAAI 2002) because it extends the A\* we studied and has both proofs and experiments to judge.
Due date: Lectures 11 and 12 both announce "Writing 2 due Friday". Lecture 12 is dated Oct 21, 2026, so that Friday is Oct 23, 2026, which is the day this note was written. The time and the Canvas due date are not verified, so `deadline` is left empty.
## Requirements
For this writing you will write a short report on *one* of several options.  All of these are computer science literature, they are extensions or different versions of various searches we've seen so far.
#### You may choose one of the following options:
- Finding Optimal Solutions to Rubik's Cube Using Pattern Databases - Richard E. Korf
- Online Graph Pruning for Pathfinding on Grid Maps - Daniel Harabor and Alban Grastien
- Boosting Combinatorial Search Through Randomization - Carla P. Gomes, Bart Selman, Henry Kautz
- D* Lite - Sven Koenig and Maxim Likhachev
These papers can be accessed online, but for some of them you may need to use the Library. Figuring out how to access and download them is part of the assignment.
Your writing should be approximately 500 words (not counting references), but it can be longer and has to be done in [Latex](https://www.overleaf.com/read/gspqjhghhhyg#f5635c).
[](https://canvas.umn.edu/courses/391207/files/38108172?wrap=1 "acmtemplate.tex")
1. When writing, avoid simply rehashing the abstract of the paper or paraphrasing the paper.  Use your own words and summarize the ideas presented in the paper and the major results obtained in a clear and concise way. 
2. Include at least three sections in your response.  The first section should be a summary of the paper you chose.  The second (or the rest) section will contain your responses to the following section.  The last section is the references section.
3. Here are suggestions for what to cover in your writing:
- What problems is the paper trying to solve?  For what types of problems are the proposed algorithms appropriate for?
- Is the approach validated experimentally or theoretically? If the validation is done experimentally, are the experimental results sufficient to demonstrate the power of the algorithms?
- Is the paper clearly written and easy to follow? Are the algorithms described clearly so it is possible to implement them and replicate the results?
- What did you find most interesting in the paper?  Do you find the paper useful?
4.  You need to include in your paper at least 4 bibliographical references, which could be of the following different types:
- a book  (which requires in bibtex  @book{..}),
- a conference paper (which requires @inproceedings{..}),
- a journal article (which requires @article{..}),
- material found on the web (which requires @misc{..}),
- instead of material found on the web, you may reference a patent (which requires @patent{..})
5. The references have to be cited in your writing.  You can use the class textbook for a book, the paper itself for a conference paper, or the patent you chose for the web material or patent material.  For this assignment, you do not need to read in full what you cite, you just need to know what it is about; you can get this from reading the abstract. You can look at the citations in the paper or patent itself, or at the Bibliographical and Historical Notes in Chapter 3 of the textbook and look in the citation index for the type of those references. When you look for references, make sure you check where the paper was published, so you include citations of all those different types. You have to format the references properly. Follow the style in our provided template.
6. As a footnote, include a brief description of how much you used Generative AI assistance on your paper.
7. Submit the .pdf of your paper on Canvas.
#### Grading criteria:
- 6 points for the completeness of your summary and response. Use the suggestions given above to address the many different aspects of the paper. You do not have to address all of them in the given order.  They are given as guidelines to help you structure your writing and help you understand what typically goes into a review.
    - 2 points for summary: Do you correctly identify the important parts of the paper and describe what they cover
    - 4 points for response: Did you respond to at least 3 of the 4 listed questions above?
- 2 points for using proper citations
- 2 points for the quality of writing (specifically including: spelling, grammar, clarity of expression, structure, proper formatting and characters)
    - 0.5 points for spelling and correct word usage
    - 0.5 points for grammar and clarity
    - 0.5 points for structure (summary, response, citations, in that order)
    - 0.5 points for proper formatting (spacing, characters, indentation, etc.)
#### Checklist (derived from the prompt above)
**Must submit**
- [ ] One PDF on Canvas, compiled from LaTeX (Overleaf).
- [ ] About 500 words of prose, references not counted. Longer is allowed.
- [ ] At least three sections in this order: summary, response, references.
- [ ] At least four references, each cited in the text, using proper BibTeX types (`@book`, `@inproceedings`, `@article`, `@misc` or `@patent`).
- [ ] A footnote that briefly states how much Generative AI was used.
**Must demonstrate**
- [ ] The summary is in my own words and is not the abstract paraphrased.
- [ ] The response answers at least 3 of the 4 questions: problem and fit, validation, clarity and reproducibility, most interesting and useful.
- [ ] Reference formatting follows the course example (`main.tex` and `rf1.bib`).
**Must not do**
- [ ] Leave a `[?]` in the PDF (a `\cite` key that does not match the `.bib`).
- [ ] List a reference that the text never cites.
**Rubric (10 points):** completeness 6 (summary 2, response 4), citations 2, writing quality 2 (spelling 0.5, grammar and clarity 0.5, structure 0.5, formatting 0.5).
**Template note:** the prompt links `acmtemplate.tex` (Canvas file 38108172) and an Overleaf project. Neither was readable by my tools, and neither is mentioned in Discussion 6, Discussion 7, Lecture 11 or Lecture 12. The three files below came from the course source folder and are my working template. This is an inference, not a confirmed match for `acmtemplate.tex`.
- `wa1_template.tex`: the page layout and header from Writing 1 (identical contents to the version used for Writing 1).
- `main.tex` and `rf1.bib`: the TA's LaTeX tutorial. It uses `\bibliographystyle{acm}` and shows one entry each of `@book`, `@article`, `@inproceedings` and `@misc`, which are the types this prompt lists.
## Work log
### The paper
| Field | Value |
| --- | --- |
| Authors | Sven Koenig (Georgia Institute of Technology), Maxim Likhachev (Carnegie Mellon University) |
| Venue | Proceedings of the Eighteenth National Conference on Artificial Intelligence (AAAI-02), Edmonton, Alberta, Canada, 2002 |
| Pages | 476 to 483 |
| Official page | [aaai.org/papers/00476-aaai02-072-d-lite](https://aaai.org/papers/00476-aaai02-072-d-lite/) |
| Official PDF | [cdn.aaai.org/AAAI/2002/AAAI02-072.pdf](https://cdn.aaai.org/AAAI/2002/AAAI02-072.pdf) |
| Recognition | 2019 AAAI Classic Paper Honorable Mention ([award page](https://aaai.org/about-aaai/aaai-awards/aaai-classic-paper-award/)) |
- *What it is:* ==D\* Lite== is an incremental replanning algorithm for a robot in unknown terrain. It reuses the previous search instead of rerunning A\*, and its first search is exactly A\*.
- *Verified:* the AAAI page and the award page were opened. The first page, 476, comes from the page URL. The PDF has 8 pages, which gives 483. Bibliographies in search results list the same range.
- *Not verified:* publisher and DOI. The CMU Robotics Institute and idm-lab record pages refused the fetch. Neither goes in the `.bib`.
- *Extraction:* the PDF text was read with `mineru parse`, after `pdftotext` returned garbled math. All claims below were checked against the clean extraction.
### Why this paper
- A\* from Chapter 3 ([[Concept - Informed Search]]) is the base, so the paper connects to lecture instead of starting from nothing.
- It has theorems and experiments, which matches the "Evidence in a search paper" frame from Discussion 6: problem and assumptions, guarantee, experiment, limits.
- The Rubik's Cube paper is the common pick. D\* Lite gave concrete numbers to critique (three measures, 50 terrains per size, ablations).
### Claim to location in the paper
| Claim in the draft | Where |
| --- | --- |
| Robot assumes unseen cells are free, replans on a blocked cell, sees its 8 neighbors | p. 1, Motivation |
| Conventional replanning can take minutes on large maps | p. 1, Introduction |
| Only a few goal distances change after one obstacle | p. 1 to 2, Figure 1 and text |
| `g`, `rhs`, locally consistent | p. 2, Equation 1 |
| Queue holds exactly the inconsistent cells, two-part key, first part matches A\* `f` | p. 2 to 3, Invariants 2 and 3 |
| First search expands exactly what A\* expands | p. 3, "The Algorithm" |
| Each cell expanded at most twice; same order as A\* with suitable tie-breaking | p. 3 to 4, Theorems 1 and 4; p. 6 for D\* Lite |
| Proofs are in a separate technical report | p. 3, "Analytical Results" |
| Backward search from the goal | p. 4 to 5, "Search Direction" |
| Offset `k_m`, recheck on pop, no heap reordering | p. 5, "Heap Reordering"; p. 4 and 5, Figures 3 and 4 |
| Heuristic must not overestimate and obey a triangle inequality; holds if derived by relaxation | p. 5, "Heap Reordering" |
| Simulation only; D\* already worked on real robots; three machine-independent measures | p. 6, "Experimental Results" |
| 50 random terrains per size, density 10 to 40 percent, 95 percent confidence intervals | p. 6, Figure 5 text |
| Ablations: more than a factor of seven in vertex expansions at best; two small-size exceptions in heap percolates | p. 6 to 7, Figure 6 text |
| Adaptive resolution: D\* Lite and the no-heuristic variant about equal | p. 7, Figure 7 text |
| D\* used on real robots including outdoor HMMWVs | p. 1, Introduction |
| Terrain generator and start and goal placement not described | absent from p. 6 to 8 |
- Page numbers are PDF pages of the 8-page AAAI PDF. Use the table to re-check any sentence in the draft.
### Reference plan
| Key | Type | Entry | Verified by |
| --- | --- | --- | --- |
| `koenig2002dstarlite` | `@inproceedings` | Koenig and Likhachev, D\* Lite, AAAI-02, pp. 476 to 483 | AAAI page and PDF |
| `hart1968astar` | `@article` | Hart, Nilsson, Raphael, "A Formal Basis for the Heuristic Determination of Minimum Cost Paths", IEEE Trans. Systems Science and Cybernetics 4(2), 100 to 107, 1968 | Cited in the Chapter 3 notes of the textbook; volume, pages and DOI 10.1109/TSSC.1968.300136 matched in a search |
| `stentz1995focussed` | `@inproceedings` | Stentz, The Focussed D\* Algorithm for Real-Time Replanning, IJCAI, pp. 1652 to 1659, 1995 | D\* Lite's reference list; CMU RI and mlanthology listings |
| `russell2020aima` | `@book` | Russell and Norvig, Artificial Intelligence: A Modern Approach, 4th ed., Pearson, 2020 | The course textbook |
| `aaaiclassic` | `@misc` | AAAI Classic Paper Award page, accessed 2026-10-23 | Opened the page |
- Five entries, one per type the prompt lists except `@patent`. Every key is cited at least once in `main.tex`.
### How to cite (rules for this document)
- Put `\cite{key}` after a space and before the period that ends the sentence: `...as shown \cite{key}.` (from the course citation guide).
- Two sources in one place: `\cite{key1,key2}` with no space after the comma.
- A key must match the first line of its `.bib` entry exactly, including case. A mismatch prints `[?]` in the PDF.
- Do not use `\nocite{*}` here. The prompt requires every listed reference to be cited, and an uncited entry would otherwise show up or be silently dropped.
- Put URLs inside `\url{...}` in `howpublished` (for `@misc`) or `note`. The `url` package breaks a long URL after a slash or a dot and handles `_` and `%` inside `\url{}`, so no manual backslashes are needed. `xurl` was dropped after the first compile because it split `cdn.aaai.org` in the middle of a word.
- `acm` is a classic BibTeX style, so it numbers references `[1]` to `[5]` and sorts them by author. The heading "References" is added automatically.
- If the course asks for `plainurl` instead, change the one line `\bibliographystyle{acm}` to `\bibliographystyle{plainurl}`. Nothing else changes.
- Fields the style needs: `@inproceedings` author, title, booktitle, year. `@article` author, title, journal, year. `@book` author, title, publisher, year. `@misc` has no required field.
### Draft report (main.tex)
Built from `wa1_template.tex`: the default 10pt article class as in Writing 1, 1 inch margins, single spacing, and the template's header with title on the left and author on the right, now on every page with a page number below. The changes after each compile are in the two layout reviews above.
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
\usepackage{url}

\title{Writing \#2: D* Lite}
\author{Anant Gupta}

\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\thetitle}
\fancyhead[R]{\theauthor}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\fancypagestyle{plain}{%
    \fancyhf{}
    \fancyhead[L]{\thetitle}
    \fancyhead[R]{\theauthor}
    \fancyfoot[C]{\thepage}
    \renewcommand{\headrulewidth}{0.4pt}
}
\renewcommand{\thesection}{\arabic{section}.}
\makeatletter
\renewcommand\section{\@startsection{section}{1}{\z@}%
  {-2.5ex \@plus -0.8ex \@minus -.2ex}%
  {1.2ex \@plus .2ex}%
  {\normalfont\large\bfseries}}
\def\@maketitle{%
  \newpage
  \null
  \vskip 1em%
    \begin{center}
    {\LARGE \@title \par}
    \vskip 1em
    {\large \@author \par}
    \vskip 0.3em
    {\normalsize CSCI 4511W \par}
    \end{center}
  \par
  \vskip 1em}
\makeatother

\begin{document}

\maketitle

\section{Summary}

This report covers ``D* Lite'' by Koenig and Likhachev \cite{koenig2002dstarlite}.\footnote{Generative AI use: I used Claude (Anthropic) to research the four paper options, extract and read the paper's text, and draft this report. I checked each claim against the paper and edited the final text myself.} A robot must reach a goal on a grid map, not knowing every wall in advance. It assumes that every unseen cell is free and plans a shortest path. When it observes a blocked cell, it replans. Rerunning a conventional graph search each time can take minutes on a large map, yet one new obstacle changes the goal distance of only a few cells \cite{koenig2002dstarlite}. D* Lite recomputes only the changed cells that matter for the path.

The method builds on Lifelong Planning A* (LPA*) \cite{koenig2002dstarlite}, an incremental version of the A* algorithm of Hart, Nilsson, and Raphael \cite{hart1968astar}. Every cell stores $g$, its current distance estimate, and $\mathit{rhs}$, a one-step lookahead based on its neighbors. If both match, the cell is consistent. Only inconsistent cells are kept in a priority queue, sorted by a key whose first part corresponds to the A* value $f = g + h$. When an edge cost changes, the affected cells are updated and the queue is processed until the robot's cell is consistent again. The very first search expands the same cells that A* would \cite{koenig2002dstarlite}.

Two changes transform LPA* into D* Lite. First, the search proceeds backward from the goal, so the stored values are distances to the goal and stay valid while the robot moves. Second, movement makes the heuristic stored in each queued key out of date. Rather than reordering the queue, D* Lite adds a running offset $k_m$ to each key and rechecks a cell when it is dequeued. The result behaves like Stentz's Focussed D* \cite{stentz1995focussed}, but it is shorter and easier to analyze \cite{koenig2002dstarlite}.

The authors state that a search terminates with a correct path and expands each cell at most twice, with proofs in a separate technical report. In a simulation over eight-connected random grids, D* Lite outperformed Focussed D* on vertex expansions, heap percolates, and vertex accesses. It also outperformed its variants that omit the incremental search (which is repeated A*) or the heuristic, on almost every comparison, by more than a factor of seven in the vertex expansions, at best \cite{koenig2002dstarlite}.

\section{Response}

The paper targets replanning on a graph where edge costs change over time, with navigation in unknown terrain as the main example. It handles any pattern of cost changes, but reuse should pay off most when few costs change at once and a good heuristic is available. The heuristic must never overestimate and must satisfy a triangle inequality, which the authors note holds when it comes from relaxing the problem \cite{koenig2002dstarlite}. The model is narrow: the robot observes which of its eight neighbors are blocked, and the paper does not address noisy sensors or actions that can fail.

The theorems support correctness, but the proofs are in a technical report, so I was unable to check them from the paper alone. The experiments are simulation-only, as D* had already been demonstrated on real robots. The authors report vertex expansions, heap percolates, and vertex accesses rather than run time. Counts do not depend on the machine, and 50 random terrains per size with 95 percent confidence intervals support the claim that D* Lite is at least as efficient as D* \cite{koenig2002dstarlite}. I would still want the wall-clock time, as a count does not say much about a single operation's cost. One result is easy to miss: on the adaptive-resolution grids, D* Lite and its variant without the heuristic ran about equally well, so the heuristic is not always beneficial.

The paper is easy to follow for a reader familiar with A*. The pseudocode has numbered lines, and the analysis repeatedly compares LPA* to A*, which anchors it in the textbook treatment of A* \cite{russell2020aima}. The $k_m$ argument is the hardest part to follow. Implementing the algorithm from the pseudocode looks feasible, but reproducing the exact numbers does not, since the paper does not describe how the random terrains were generated or where the start and goal cells were placed.

What I found most interesting is how little is added to A*. The first search is simply A*, and the incremental behavior comes from keeping $g$ between searches, adding $\mathit{rhs}$, and carrying one number, $k_m$. In the textbook, A* runs once on a fixed graph \cite{russell2020aima}; here, the question is what to keep as the graph changes. The paper also looks useful beyond theoretical interest: it mentions that D* has been used on real robots, including outdoor vehicles \cite{koenig2002dstarlite}, and AAAI gave it a Classic Paper Honorable Mention in 2019 \cite{aaaiclassic}. A follow-up I would test is how obstacle density affects the run-time gap between D* Lite and repeated A*.

\renewcommand{\refname}{3. References}
\bibliographystyle{acm}
\bibliography{citations}

\end{document}
```
### Reference file (citations.bib)
A separate file in the Overleaf project. The name must be exactly `citations.bib` because `main.tex` ends with `\bibliography{citations}` (no extension). The course example calls it `rf1.bib`; the name does not matter as long as the two agree.
```bibtex
@inproceedings{koenig2002dstarlite,
  author    = {Sven Koenig and Maxim Likhachev},
  title     = {{D*} {Lite}},
  booktitle = {Proceedings of the Eighteenth National Conference on Artificial Intelligence ({AAAI}-02)},
  pages     = {476--483},
  year      = {2002},
  address   = {Edmonton, Alberta, Canada},
  note      = {\url{https://cdn.aaai.org/AAAI/2002/AAAI02-072.pdf}}
}

@article{hart1968astar,
  author  = {Peter E. Hart and Nils J. Nilsson and Bertram Raphael},
  title   = {A Formal Basis for the Heuristic Determination of Minimum Cost Paths},
  journal = {{IEEE} Transactions on Systems Science and Cybernetics},
  volume  = {4},
  number  = {2},
  pages   = {100--107},
  year    = {1968}
}

@inproceedings{stentz1995focussed,
  author    = {Anthony Stentz},
  title     = {The {Focussed} {D*} Algorithm for Real-Time Replanning},
  booktitle = {Proceedings of the International Joint Conference on Artificial Intelligence ({IJCAI})},
  pages     = {1652--1659},
  year      = {1995}
}

@book{russell2020aima,
  author    = {Stuart Russell and Peter Norvig},
  title     = {Artificial Intelligence: A Modern Approach},
  edition   = {Fourth},
  publisher = {Pearson},
  year      = {2020}
}

@misc{aaaiclassic,
  author       = {{Association for the Advancement of Artificial Intelligence}},
  title        = {{AAAI} Classic Paper Award},
  howpublished = {\url{https://aaai.org/about-aaai/aaai-awards/aaai-classic-paper-award/}},
  note         = {Accessed October 23, 2026}
}
```
### Overleaf project: exact steps
1. Open overleaf.com and sign in. Click **New Project**, then **Blank Project**. Name it `Writing 2 - D Star Lite`. Click **Create**.
2. The file list on the left shows one file, `main.tex`, with sample text. Click it, press `Ctrl+A`, press `Delete`, then paste the full `main.tex` block above.
3. In the file list, click the **New File** icon (page with a plus). Type the name `citations.bib` exactly, leave the template choice on blank, click **Create**. Click the new file and paste the full `citations.bib` block above.
4. Click **Menu** (top left). Set **Compiler** to `pdfLaTeX`, **Main document** to `main.tex`. Close the menu.
5. Click **Recompile**. Overleaf runs BibTeX by itself. If the PDF shows `[?]` or no References, click the arrow beside Recompile and choose **Recompile from scratch**, then recompile once more.
6. Check the PDF against the pre-submit list below.
7. Click the **Download PDF** icon (download icon above the preview). Optionally also **Menu**, then **Download Source**, and keep the zip next to the other homework files.
8. Upload the PDF to the Writing 2 assignment on Canvas and confirm the upload before the due time.
### Revision: humanized text merged (2026-10-23)
The pasted rewrite had lost every asterisk ("D\* Lite" read "D Lite", "A\*" read "A", "LPA\*" read "LPA", "Focussed D\*" read "Focussed D") and the `\section{Summary}` line. All are restored. The `main.tex` body now holds 13 `D*`, 15 `A*` and 3 `LPA*`, and a scan finds no stripped ones.
Wording that changed the meaning against the paper was corrected. Tone and structure are kept.
- "changes the goal's distance by only a few cells" became "changes the goal distance of only a few cells". The paper says few cells have a changed goal distance (p. 1 to 2), not that the goal moves a little.
- "it replans, and may require minutes of rerunning..." was split into two sentences, because the subject of "may require" was wrong.
- "the edge cost of a cell" became "an edge cost", and "its adjacent cells" became "the affected cells". Costs belong to edges.
- "invalidates the heuristic" became "makes it out of date". The stored keys stay valid lower bounds on the true keys and are only stale (p. 5).
- "yields a similar performance to Focussed D\*" became "behaves like". The paper claims the same navigation behavior and efficiency at least as good (p. 1, p. 6), not similar performance.
- "appropriate when changes are local" became "handles any pattern of cost changes, but reuse should pay off most when few costs change at once". The paper says it assumes nothing about where or how costs change (p. 4). The "should" marks the payoff as my inference.
- "does not handle noisy sensors" became "does not address". The paper is silent on them.
- "justify" became "support" in two places, so the claims are not overstated.
- Grammar: "variant that omit" became "variant without"; "seems plausible, but reproducing... is not" became "looks feasible, but... does not"; and the list "maintaining g, rhs, and carrying" became "keeping g, adding rhs, and carrying".
### Layout review of the first compile (2026-10-23)
I read the compiled PDF (`CSCI_4511W_Writing___2.pdf`, 2 pages) with `mineru parse` for the text and `mineru read -f image` for the rendered pages. Content, citations, footnote and the final period were all correct. The layout was not.
- *Margins:* left about 0.8 in, right about 1.3 in, bottom about 1.9 in. The template sets only `left=20mm` and `top=20mm`, so geometry derives the rest. Fix: `margin=1in` on all sides, as in Writing 1.
- *Spacing:* single spaced with no paragraph gap, so the text looked packed. First fix: `\doublespacing`, which pushed the report to 3 pages. Replaced in the second review below.
- *Header on page 1 only:* page 2 had a bare page number and no header. Diagnosis (inferred from the output, not tested in isolation): the template redefines the `plain` page style, but article had already activated `plain` before that redefinition, so only page 1, which `\maketitle` forces to `plain`, picked it up. Fix: `\pagestyle{fancy}` plus the same definition for `plain`, so every page has the header.
- *Footer:* page 1 had no page number, because the template clears the footer. Fix: a centered `\thepage` in both styles. The header also gets a thin rule.
- *Header height:* raised to 14.5pt for 12pt text. Replaced in the second review below.
- *Headings:* `1 Summary` and `2 Response` should read `1. Summary` and `2. Response`, and the reference list `3. References` so the three required sections are numbered alike. The first version used `titlesec`, which broke the header; the second review has the final method.
- *Title block:* the title now has the author and `CSCI 4511W` underneath, so page 1 does not open with only a title that repeats the header. The name still comes from `\author`.
- *URL splitting:* `cdn.aa` and `ai.org` were split mid-word by `xurl`. Fix: the plain `url` package.
- *Reference title:* the Stentz title printed as "The focussed D\* algorithm". `{Focussed}` is now protected in the `.bib` so it keeps its capital.
- *Not changed:* the body text, the five references, the citation placement and the footnote.
- *Not verified:* this layout had not been compiled when written. See the second review for what happened when it was.
### Second compile review (2026-10-23)
I read `CSCI_4511W_Writing___2 (1).pdf` (3 pages) the same way, and the Writing 1 PDF for reference. Writing 1 is the default 10pt `article` class, double spaced, with 1 inch margins; its line pitch of about 19.8pt matches 10pt text at 1.66 spacing.
- *Length:* 3 pages, caused by my change to 12pt plus double spacing. Fix: back to the default 10pt `article` class and single spacing. The font is the same size as Writing 1, and `setspace` is gone.
- *Header bug I introduced:* the left header read `1`, `2`, `3` (the page number) instead of `Writing #2: D* Lite`. Cause: `titlesec`, which I added for the `1.` headings, defines its own `\thetitle`, and the template's header uses `\thetitle`. The first compile, without `titlesec`, had the correct title. Fix: `titlesec` removed, and the header keeps the template's `\thetitle` and `\theauthor`.
- *Headings without `titlesec`:* `\thesection` is redefined to `\arabic{section}.`, and `\section` is redefined with the standard `\@startsection` call at `\large\bfseries`. The unnumbered reference heading takes the same style, and `\refname` is `3. References`.
- *Header height:* back to the template's 12.5pt, which 10pt text fits.
- *Reference [5]:* the compiled PDF still printed "The focussed D\*". The Overleaf `citations.bib` did not have the `{Focussed}` brace yet. Paste the current `.bib` block too.
- *Page estimate:* a line-wrapping model, calibrated on the 12pt compile (55 body lines, which matches the printed pages), gives about 1.4 pages at 10pt single spaced. For comparison it gives about 1.6 at 11pt and about 1.9 at 12pt, which is too close to the limit. The model has some error, so 10pt is the safe choice. It is an estimate, not a compile.
- *Unchanged:* body text, citations, references, footnote.
### Pre-submit checks
- [ ] Header on every page, including page 2 onward: `Writing #2: D* Lite` on the left, `Anant Gupta` on the right, with a thin rule.
- [ ] A centered page number at the bottom of every page, including page 1.
- [ ] The left header reads `Writing #2: D* Lite`, not a page number.
- [ ] Margins look equal on all four sides, and the body is single spaced.
- [ ] The whole report, including references, fits on two pages.
- [ ] Headings read `1. Summary`, `2. Response` and `3. References`, in that order.
- [ ] References lists five entries, each with a number, and the text shows citations as `[1]` to `[5]` style numbers. No `[?]` anywhere.
- [ ] The footnote shows at the bottom of page 1 and states the real level of AI use. Edit the wording if it is not accurate.
- [ ] The Logs panel shows no `Citation ... undefined` and no `Undefined control sequence`. Overfull box warnings are fine.
- [ ] The prose is about 500 words or more (see the count below).
- [ ] I have read the report and every claim traces to the table above.
### Checks run in this vault (no LaTeX engine used)
A script read the two code blocks above on 2026-10-23, using the course environment's Python (`CSCI 4511W\Code\.venv`, nothing installed). 29 checks, all passed. This is a lint, not a compile.
- Every `\cite` key exists in `citations.bib`, and every `.bib` key is cited. Five entries: `@inproceedings` twice, `@article`, `@book`, `@misc`.
- Braces balance in both files, `\begin` and `\end` match, `$` signs are even, quotes use ` `` ` and `''`.
- Both files are plain ASCII (no pasted special characters), and there are no unescaped `&`, `_`, `#` or `%` in the prose.
- No citation sits after a period. Every `\cite` is followed by a period, comma or semicolon.
- Title, author, `\bibliographystyle{acm}` and `\bibliography{citations}` are present, and the template placeholders are gone.
- After the layout revisions, the lint has 43 checks in total (14 more than the first 29), and all pass. The added ones cover: default 10pt article, 1 inch margins on all sides, header height 12.5pt, no `setspace` or spacing commands, no `titlesec`, the header built from `\thetitle` and `\theauthor` in both page styles, a page number footer in both, `N.` section labels, the redefined `\section`, `3. References`, author and course in the title block, `\makeatletter` paired with `\makeatother`, `url` loaded without `xurl`, and `{Focussed}` protected in the `.bib`.
- Sections are in order: Summary, Response, then the generated References.
- The scan for lost asterisks and the 29 checks were re-run on the merged text and pass. Vault Lint reports the note at 100% fit.
- *Word count:* 771 words of prose, which excludes the footnote, section headings, citations and references. The prompt says about 500 and allows longer, so this is submittable as it stands.
- *Not checked:* anything that needs a real compile, such as the header look, page breaks, and BibTeX warnings. That happens in Overleaf, step 5.
### Open items
- `acmtemplate.tex` from Canvas was never seen. If it turns out to be `acmart` or another class, the preamble and bibliography style change; the reference entries and body text stay the same.
- The final layout (10pt, single spaced) has not been compiled. Two earlier compiles were read and drove the fixes. The next compile should show a correct header and two pages or fewer.
- Due time on Canvas is unconfirmed.
## Concepts used
- **A\* and consistent heuristics** ([[Concept - Informed Search]]): D\* Lite's first search is exactly A\*, and the paper requires a consistent heuristic for LPA\*. The response compares both with the textbook version.
- **Incremental search (LPA\*, D\* Lite)**: the new idea here. `g`, `rhs`, local consistency, and the offset `k_m`. No concept note exists yet; this paper exposes a reusable mechanism, so one is worth creating after submission.
- **Reading a search paper** (Discussion 6): the problem, guarantee, experiment and limits frame shaped the response section.
- **BibTeX and LaTeX citing**: `\cite` before the period, one entry per type, `\url{}` for URLs, from the course citation guide and the TA example.
## Post-submit reflection
<!-- Optional until feedback: the first failure, the pattern, and what to change. -->
