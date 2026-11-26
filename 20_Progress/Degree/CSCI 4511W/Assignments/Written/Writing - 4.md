---
type: class
class_kind: homework
status: sprout
created: 2026-11-25
updated: 2026-11-25
deadline: 2026-11-25
tags:
  - class
  - homework
area:
  - "[[CSCI 4511W Board]]"
next: "Paste main.tex and citations.bib into a new Overleaf project, compile, confirm 0 errors and that the body ends on page 3 or earlier, edit the AI-use footnote so it states what you really did, then submit the PDF on Canvas before 11:59 PM tonight (Nov 25)"
---
# Writing - 4
## Overview
The literature review, the second written part of the final project: one author, 2 to 3 pages of body text plus references, written in LaTeX on Overleaf and submitted as a PDF on Canvas. It reviews the work behind the project from [[20_Progress/Degree/CSCI 4511W/Assignments/Written/Writing - 3|Writing - 3]], a mini-AlphaZero for 6x6 Othello compared with hand-crafted evaluation functions.
Due Wed Nov 25, 11:59 PM. Sources: Discussion 11 slide 2 ("Wed, Nov 25: Writing 4: Literature review (11:59 PM)"), Lecture 20 slide 2 ("Literature Review (Due Nov 25)"), and the Board schedule. Late policy from the Board: up to one day late takes a penalty, later is not accepted by Gradescope.
## Requirements
Source: the Canvas prompt for Writing 4 and the "Final Project Information" page, pasted 2026-11-25, plus the course citation guide (`How to Cite in LaTeX (Citation Guide).pdf`, updated for Fall 2026) and Discussion 10 (literature review).
### Writing 4 prompt (key points, close to verbatim)
> This writing will be part of your final project report, where you'll have to include 2-3 pages (not including references) of a literature review of publications that are relevant to your project. You will receive feedback on this writing.
> A literature review is a thorough summary and synthesis of the work that has gone on in a particular field. It gives the reader a clear, concise overview of the work that has already been done on a certain problem. [...] This requires good organization, concise writing, and a solid understanding of what is most important about the field.
> Your literature review should include 8-10 relevant references with their full bibliographic citations. References should be from reputable sources, such as journals, books, or refereed conference proceedings. Cite manuscripts, technical reports, and other non refereed material only if relevant to your work (for instance, they provide the main idea you use in your project).
> What is important is to show mastery of the relevant work done by others on the topic of your project. [...] Make sure that some of your references are recent, since you need to be on top of what is the state of the art in the area of your project.
> If there is more than one student in the team, submit a single paper and specify each member's contribution. [...] 12 or more references for a group of two.
### Rubric
10% organization (structure of the document), 60% coverage of the literature (coverage of the topic, sufficient number of citations, relevance, good understanding), 10% writing style (flow, clarity, grammar, no spelling errors), 20% use of LaTeX with complete citations.
### Final project rules that shape this review
- Individual or pair. I am working alone, so the "contribution of each team member" line does not apply.
- The final project needs a literature search of 6 to 8 papers, a program, an original experiment with analysis, and a written report. About 50 hours per student.
- The parts are the proposal (Writing 3), this review (Writing 4), the final report (Fri Dec 18, 11:59 PM), and for pairs only a contribution report.
- The review is reused in the final report, so it should survive being pasted there.
### Citation rules (course guide, read through MinerU)
- The file must be named `citations.bib`; the document ends with `\bibliographystyle{plainurl}` and `\bibliography{citations}` before `\end{document}`; load `xurl` for URLs.
- Cite with `\cite{key}` before the period that ends the sentence. Several keys: `\cite{a,b}` with a comma and no space.
- Sources never cited in the text do not print. `\nocite{}` forces one in.
- To cite an AI conversation as a source, share it and cite the public link. This review does not cite AI output as a source. The AI use goes in a footnote, as in Writing 2 and 3.
### Discussion 10: what the TA said a review is
- "It's not a list of summaries." It says what is known, how the pieces fit, and what is missing: "a map of the area, with a pin where your project goes."
- Write by theme, not paper by paper. Suggested shape: intro with scope, theme 1, theme 2, the gap and your project.
- Use and cite peer-reviewed papers, surveys, and the textbook. Use arXiv preprints with care ("check if it was published later"). "Open every paper you cite and check that it's real."
### Checklist
**Must submit**
- [ ] One PDF on Canvas, compiled from LaTeX on Overleaf, by 11:59 PM Nov 25.
- [ ] 2 to 3 pages of body text, references not counted.
- [ ] 8 to 10 references, each cited in the text, as proper BibTeX entries in `citations.bib` with full bibliographic data.
- [ ] A footnote that states how much generative AI was used.
**Must demonstrate**
- [ ] Organization by theme, ending with the gap and where the project fits.
- [ ] Some references are recent (state of the art).
- [ ] Every reference is from a reputable venue, or is a preprint that is flagged and relevant.
**Must not do**
- [ ] Leave a `[?]` in the PDF (a `\cite` key that does not match the `.bib`).
- [ ] List a reference that the text never cites.
- [ ] State a result that no source supports.
## Work log
### What I read
- The Canvas prompts above, the course citation guide (MinerU, 8 pages), and Discussion 10 and 11 (MinerU).
- [[20_Progress/Degree/CSCI 4511W/Assignments/Written/Writing - 3|Writing - 3]] (the note, and the submitted PDF `CSCI_4511W_Writing___3.pdf`), [[20_Progress/Degree/CSCI 4511W/Assignments/Written/Writing - 2|Writing - 2]], and the TA's `main.tex` and `rf1.bib`. The preamble below is the Writing 2 and 3 preamble.
- Lectures 12, 13, 14 and 20, for the course's own treatment of the topic. Lecture 12 (Oct 21) covers evaluation functions as weighted linear sums, depth cutoff, the horizon effect, and MCTS. Lecture 13 has the MCTS caveats. Lecture 14 slides 12 to 14 are "Limitations of Game Search Algorithms", including the slide asking what happens if the evaluation function "was written by your final project partner when they were having a really bad day". Lecture 20 announces the due date.
- Textbook (AIMA 4th ed.), Chapter 5, PDF pages 296 to 358, through MinerU: Section 5.3.1 (evaluation functions), 5.3.2 and 5.3.3 (cutoff, forward pruning with ProbCut), 5.4 (MCTS, UCB1), 5.7 (limitations, "a fourth issue is the ability to incorporate machine learning"), and the Bibliographical and Historical Notes (Othello, Kocsis and Szepesvari, Silver et al., Buro).
- The four Writing 3 references again, plus the new ones below. The paper-search tool returned the passages most relevant to specific questions. I did not read every page or any appendix in full.
- Weekly notes for the same material: [[20_Progress/Degree/CSCI 4511W/Weekly/Week - 7|Week - 7]] and [[20_Progress/Degree/CSCI 4511W/Weekly/Week - 8|Week - 8]].
### Tool limits today (so the verification below is honest)
Firecrawl scraping had 0 credits (they reset 2026-11-27), and the IEEE, Springer, ScienceDirect, Science and OpenReview pages refused the fetch agent (403, login redirects, or empty pages). Bibliographic data was therefore checked against Crossref's public API (the DOI registry, which carries the publisher's own volume, issue, pages and date), arXiv pages, and the paper-search tool's full-text passages. Where only an abstract-level summary was available, the table says so.
### Thesis and outline
The review answers one question: what does the literature say about replacing a hand-crafted evaluation function with a learned one, and what is still missing for a small-budget 6x6 Othello study?
1. Introduction and scope (project, four themes).
2. Hand-crafted evaluation and alpha-beta search (textbook, Buro, Norelli and Panconesi's description of strong engines).
3. From Monte Carlo search to self-play learning (UCT, AlphaZero).
4. Self-play on a small budget (Olivaw, Scheiermann and Konen, MiniZero, Tsai et al., Boige et al.).
5. Small boards and exact values (6x6 Othello is solved).
6. The gap and my project.
7. References.
### Finding that changes the project framing
6x6 Othello is solved. Feinstein reported in 1993 that the second player wins 20 to 16, and Takeshita, Sakamoto, Ito and Ikeda (2016) confirmed his sequence is one of the perfect plays. Norelli and Panconesi also say 6x6 reproductions exist "for which perfect strategies are known". Writing 3 did not mention this. It does not contradict the proposal (win rates and Elo are still the main measure), but it opens an optional extension: exact values could measure value-function error, as Boige et al. do on Connect Four and Hex. I did not check whether a solver or a published solution can be obtained, so the review says "optional" and "not checked".
You said you had left the solved status out of the proposal as unnecessary. In a literature review it is needed, because the review is about what is known on small Othello boards and where the project sits. It now appears in four places, each with a job: Section 5 (the 32-move game and the Feinstein and Takeshita result, with Norelli and Panconesi's remark), the third gap in Section 6 (strength is measured through matches although the board is solved), the color-swapping rationale in Section 6 (perfect play favors the second player, so every opening is played with colors swapped, as the proposal already says), and the closing optional extension. If you would rather keep the review strictly to the proposal, delete only the last two sentences of the Section 6 paragraph that mention exact values ("Because the 6x6 game has a known value ... optional extension"); the rest follows from facts already in the proposal.
### Reference selection
Ten references, all cited. The prompt says 8 to 10 for one author. Papers considered and left out, with the reason:
- Browne et al. (2012), the MCTS survey, IEEE Trans. Computational Intelligence and AI in Games 4(1), 1 to 43. Verified by Crossref and recommended in Discussion 10, but the textbook and Kocsis and Szepesvari already carry the MCTS theme. First one to add if you want an 11th.
- Rosenbloom (1982) and Lee and Mahajan (1990), the early Othello programs. Crossref confirms both (Artificial Intelligence 19(3) 279 to 320, and 43(1) 21 to 36), but I only had one-sentence summaries, so Buro and the textbook carry that theme.
- Takizawa, "Othello is Solved" (arXiv 2310.19387) and "Semi-Strongly Solved" (arXiv 2411.01029). Both are arXiv-only. The first solves 8x8 (draw). The second reports a semi-strong solution of 6x6, but the passages I read did not state the starting value, so I used the peer-reviewed Takeshita et al. chapter instead.
- Danihelka et al., Gumbel AlphaZero (ICLR 2022). The ICLR listing exists, but OpenReview was blocked, and MiniZero already reports the Gumbel result.
- Pgx (Koyamada et al., arXiv 2303.17503). The abstract does not mention Othello (Writing 3 said it does), and I could not confirm the venue line, so it is out.
- The 6x6 "Big Win Strategy" workshop paper cited by Olivaw, not verified.
### Verification record
Bibliographic data and what was read. `Key` is the BibTeX key.

| Key | Entry | Bibliographic data checked against | Content claims checked against |
| --- | --- | --- | --- |
| `boige2026surprisingeffectivenessapproximatevalue` | Boige, Boumaza, Scherrer, AVI in self-play, arXiv:2609.09094, Sept 2026 | arXiv abstract page (v1 only, 8 Sep 2026, no journal reference, no comments) | Passages from Sections 4.1 to 4.4, 5.2, 5.3 and 6 |
| `buro2002improving` | Buro, Artificial Intelligence 134(1-2), 85 to 99, 2002, doi 10.1016/S0004-3702(01)00093-5 | Crossref (all fields) | **The full abstract**, from the ScienceDirect BibTeX export you downloaded (`S0004370201000935.bib`): Logistello, GLEM with least-squares weight fitting, ProbCut with tournament results, an opening-book framework, and the 6 to 0 win over the human world champion in 1997. The article itself was not read. The export lists `number = {1}`; the issue is 134(1-2), which is what Crossref and the `.bib` use. |
| `kocsis2006bandit` | Kocsis and Szepesvari, Bandit based Monte-Carlo planning, ECML 2006, pp. 282 to 293, Springer | Crossref (pages, publisher, series, year, doi 10.1007/11871842_29) | **Abstract-level only.** Semantic Scholar summary (UCT, consistency, finite-sample bounds) plus textbook Section 5.4 and its notes. The Springer page redirected to login. The LNCS volume number was not verified, so it is left out of the `.bib`. |
| `norelli2023olivaw` | Norelli and Panconesi, Olivaw, IEEE Transactions on Games 15(2), 285 to 291, June 2023, doi 10.1109/TG.2022.3157345 | Crossref (volume, issue, pages, date) and the arXiv comment "Accepted for publication in IEEE Transactions on Games" | Full text of arXiv v4, through the paper-search tool (abstract, introduction, related work, training process, Table II, conclusion) |
| `russell2020aima` | Russell and Norvig, AIMA, 4th ed., Pearson, 2020 | The course textbook | Chapter 5, PDF pages 296 to 358, MinerU |
| `9893320` | Scheiermann and Konen, IEEE Transactions on Games 15(4), 637 to 647, Dec 2023, doi 10.1109/TG.2022.3206733 | Crossref matches the IEEE export pasted for Writing 3 | arXiv v3 passages (abstract, introduction, results, Section V-C, conclusion) |
| `silver2018general` | Silver et al., Science 362(6419), 1140 to 1144, 7 Dec 2018, doi 10.1126/science.aar6404 | Crossref (13 authors in order, all fields) | **Not read.** Claims come from the textbook (Sections 5.4 and 5.7, notes) and the Discussion 10 slide. The Science page returned 403. |
| `takeshita2016perfect` | Takeshita, Sakamoto, Ito, Ikeda, Perfect Play in Miniature Othello, in Genetic and Evolutionary Computing, Advances in Intelligent Systems and Computing, pp. 281 to 290, Springer, 2016, doi 10.1007/978-3-319-23207-2_28 | Crossref (authors, pages, series, publisher, online 4 Sep 2015, print 2016). Crossref has no volume; "Vol. 388" comes from the reference list of Takizawa's arXiv 2411.01029. | **Abstract only**, read on the Springer Professional page: "J. Feinstein reported a 16-20 win for the second player on 6x6 in 1993", and the paper confirms the sequence is one of the perfect plays. Full text is paywalled. |
| `tsai2026regretguided` | Tsai, Chen, Ju, Chang, Wu, ICLR 2026 | ICLR 2026 poster page found by search (`iclr.cc/virtual/2026/poster/10010645`), arXiv 2602.20809 with the same authors in the same order, and the OpenReview forum checked on 2026-11-16 (see Writing 3). OpenReview refused the fetch today. | arXiv passages (introduction, Section 4.2 with Figure 4 and Table 1, appendix A.1 to A.3, discussion) |
| `10510513` | Wu et al., MiniZero, IEEE Transactions on Games 17(1), 125 to 137, March 2025, doi 10.1109/TG.2024.3394900 | Crossref matches the IEEE export pasted for Writing 3 | arXiv v3 passages (Sections IV-A to IV-F, V) |
- Rosenbloom's DOI is `10.1016/0004-3702(82)90003-0`. My first recollection ended in `-5` and returned 404, which is why every DOI was run through Crossref before it went into the `.bib`.
- Recent references: five of ten are from 2023 to 2026 (Olivaw 2023, Scheiermann and Konen 2023, MiniZero 2025, Tsai et al. 2026, Boige et al. 2026). The rest are 2002, 2006, 2016, 2018, and the 2020 textbook. Boige et al. is the only preprint, and the review labels it as one.
### Claim to source
Page and section references are to the sources in the verification record.

| Claim in the draft | Where it comes from |
| --- | --- |
| Alpha-beta stops at a depth limit and scores with an evaluation function; usual form is a weighted sum of features from human experience; weights can be learned | Textbook Sections 5.3 and 5.3.1; Lecture 12 slide 4 |
| Disc count is a poor guide and mobility matters more in Othello; programs superhuman since 1997 | Textbook notes: "defining an evaluation function is difficult, because material advantage is not as important as mobility. Programs have been at superhuman level since 1997 (Buro, 2002)" |
| ProbCut prunes moves that are probably outside the window; a Logistello version with it beat the regular version 64% of the time even with half the time | Textbook Section 5.3.3 |
| Generalized linear evaluation model: conjunctions of Boolean features combined linearly, data picks features and weights | Semantic Scholar summary of Buro (2002), abstract level |
| Strong engines pair optimized minimax with hand-crafted evaluation, opening catalogs, brute-force endgames | Olivaw, Related work |
| Alpha-beta is vulnerable to evaluation errors; one wrong estimate can flip a choice; correlated errors make it worse | Textbook Section 5.7 (the Figure 5.16 discussion: errors with a standard deviation of 5 make the left branch better 71% of the time); Lecture 14 slide 13 |
| MCTS averages the results of simulated games, needs only the rules; UCB1 is "one very effective selection policy"; it can miss a single decisive move | Textbook Section 5.4 (and Lecture 12 slides on MCTS) |
| A playout can be cut short and scored with an evaluation function, as AlphaGo did | Textbook Section 5.4 ("truncating the playout and applying an evaluation function") and the Chapter 5 notes ("ALPHAGO terminated playouts and applied an evaluation function") |
| UCT uses bandit ideas, is consistent, has finite-sample bounds on sampling error | Semantic Scholar summary of Kocsis and Szepesvari (2006), abstract level |
| AlphaZero: network gives a move prior and a value inside MCTS, trained on self-play from the rules; won 155 and lost 6 of 1000 games against Stockfish; humans supply architecture and rules | Textbook Section 5.4, Section 5.7 and the Chapter 5 notes; title of the Science paper |
| Original projects used thousands of GPUs and hundreds of TPUs | Olivaw, Introduction |
| Olivaw: free cloud notebooks, doubles positions per game with explored but unplayed positions, about 30 days and 50,000 games, 19 people generating games, beat a national champion, lost to a former world champion, not superhuman | Olivaw abstract, Section V (19 people), Section VI (30 days, 20 generations, about 50,000 games), Conclusion |
| Scheiermann and Konen: TD n-tuple agents, MCTS only at test time, CPU, under 2 hours, beat Edax up to level 7 where most learning-from-scratch methods reached level 2; Olivaw reaches level 10 with far more compute | S&K abstract, introduction, Section V-C |
| MCTS inside the training loop added much computation for no or small gains with n-tuple networks | S&K conclusion ("large increases in computation time are accompanied by no or only small increases in performance") |
| MiniZero: 9x9 Go and 8x8 Othello, 3 residual blocks, four GTX 1080 Ti; more simulations help at equal steps; Gumbel AlphaZero with 2 simulations reaches "similar playing strength" to AlphaZero with 200 at equal time on Othello; fewer legal moves than Go as the suggested reason; progressive simulation | MiniZero Sections IV-A, IV-B, IV-C, IV-F and Conclusion |
| Tsai et al.: regret network, restart self-play from high-regret states; 10x10 Othello 70 Elo above AlphaZero; 57.8% against the Ludii alpha-beta program vs 51.7% for AlphaZero; about 150 A6000 GPU hours per run | Tsai et al., Section 4.2 (Figure 4 text and Table 1), appendix A.1 |
| Boige et al.: AVI, no tree search in training, more accurate values than AlphaZero on Connect Four and Hex 7x7, greedy play weaker than MiniZero on Othello and Go 9x9, cross-inference improves MiniZero, oracles limit studies to small games | Boige et al., abstract, Sections 4.3, 5.2, 5.3, 6 |
| 6x6 Othello: Feinstein 1993, second player wins 20 to 16, sequence confirmed as perfect play | Takeshita et al., abstract (Springer Professional page) |
| Earlier low-cost AlphaGo Zero reproductions only on Connect Four and 6x6 Othello, "for which perfect strategies are known" | Olivaw, Related work |
| Boige et al. use exact solvers for value error and regret | Boige et al., Section 4.2 |
| Three levers on cost: more from each game (Olivaw, Tsai), fewer simulations per move (MiniZero), less search in training (S&K, Boige) | My synthesis of the rows above; each paper's part is a row above |
| Win rates with 95% intervals and Elo | MiniZero Figures 3 and 4 text; Tsai et al., Figure 4 |
| Optional extension: exact values for value error on 6x6, availability not checked | My inference from the two rows above; marked "optional" and "not checked" in the text |
| Gap statements ("the studies I read", "in the papers I read") | My synthesis of the rows above. The wording is hedged on purpose, because I did not read every page of every paper. |
### Humanized text review (2026-11-25)
You pasted a reworded version of Sections 1 to 6. I compared it with the sources sentence by sentence. Your voice and structure are kept where the meaning held ("covers the work leading to", "I ask whether", "reduced the need"). These rewrites changed the facts or broke the LaTeX, so the checked wording was restored:
- **Section 4, Tsai et al.:** "exposes positions that had similar value estimates to the game result" says the opposite of the paper. The regret network finds positions where the value estimate was far from the outcome (Tsai et al., abstract and Section 1).
- **Section 4, Boige et al.:** "outperforms a version of Alpha Zero that has perfect information about the game states" is wrong. The AlphaZero baseline has no extra information. The exact solver is only the yardstick, and AVI learned more accurate values, not better play (Boige et al., abstract and the contributions list in Section 1). Also "transfer learning test" is wrong: cross-inference keeps the search fixed and swaps only the value function (Section 4.3).
- **Section 4, Olivaw:** "recording the positions reached even when the search failed to reach the end of the game" is wrong. The extra positions are ones the search explored heavily but the game never played (Olivaw abstract).
- **Section 4, Scheiermann and Konen:** the citations became "(Konen & Scheiermann, 2020)". That is the wrong author order, the wrong year (the paper is 2023) and not a `\cite`, so BibTeX would print nothing and the paper would be missing from the references. Also "it did not outperform Olivaw at level 10" garbled the finding: Olivaw reaches Edax level 10, this agent reaches level 7.
- **Section 3:** "the two projects were built on thousands of GPUs and hundreds of TPUs respectively" is not in Olivaw; it says the original projects used thousands of GPUs and hundreds of TPUs. "The review states" should be "the textbook reports". "155-6" reads as a score; it is 155 wins and 6 losses of 1000 games. "backpropagate" and "the search can end here" were added and are not in the textbook.
- **Section 2:** "end-of-othello", "Prob Cut", and "stops at depth" were restored to "the end of an Othello game", "ProbCut", and "depth limit".
- **Section 5:** "were all successful only on very simple games" and "limitations of exact oracles for small games" were garbled; the sources say earlier reproductions succeeded only on very simple games, and that exact oracles limit studies to small games.
- **Section 6:** "my budgets" should be "the reported budgets" (they are other papers' budgets). The Edax citation `\cite{9893320}` was attached to both Edax and Ludii, but Ludii comes from Tsai et al., so each now has its own cite. "My project bridges that gap" overclaims, so it stays "works in that gap". Tsai et al. does not keep simulations small, so that point is credited to Wu et al. only.
- **Section 1 and the footnote:** "1:" was pasted inline instead of `\footnote{}`, which would print a stray "1:" and drop the footnote. "minimum allotted time per move" changed the design (it is the same time per move). "small Alpha Zero" is "mini-AlphaZero" as in Writing 3.
- **Typography:** "Alpha Zero" and "Mini Zero" are `AlphaZero` and `MiniZero` (the same names as in the reference titles), "programme" is "program", "learnt" is "learned", Unicode `×` is `$\times$`, "winrates" is "win rates", `$95\%$` is "95 percent", and "connect 4" and "hex" keep their capitals.
### Draft main.tex
The preamble is the Writing 2 and 3 preamble (10pt article class, 1 inch margins, header with title left and author right on every page, centered page number, `N.` headings), with `hyperref` and `xurl` as the citation guide requires. Section headings are numbered 1 to 6 and the reference list is `7. References`.
```latex
\documentclass{article}
\usepackage[utf8]{inputenc}
\usepackage{geometry}
\geometry{
 letterpaper,
 margin=1in,
}
\setlength{\headheight}{12.5pt}
\setlength{\emergencystretch}{3em}
\usepackage{titling}
\usepackage[hidelinks]{hyperref}
\usepackage{xurl}
\usepackage{needspace}

\title{Writing \#4: Literature Review}
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

\section{Introduction}

This review covers the work leading to my final project, a mini-AlphaZero for 6$\times$6 Othello.\footnote{Generative AI use: I used Claude (Anthropic) to find and verify references and to draft this review. I chose the project and edited the text myself.} A small value network, trained by self-play inside Monte Carlo tree search (MCTS), will be compared with depth-limited alpha-beta search that uses hand-crafted evaluation functions, with every agent given the same time per move. I ask whether a laptop-sized budget is enough for the learned evaluation to outperform the hand-coded ones. The sources fall into four themes: how Othello programs were built with hand-crafted and then statistically fitted evaluation functions (Section 2); how Monte Carlo search, and then self-play learning, reduced the need to write the evaluation by hand (Section 3); what recent work reports when AlphaZero-style training is run on a small budget (Section 4); and what is known exactly about small Othello boards (Section 5). Section 6 states the gap and where my project fits.

\section{Hand-Crafted Evaluation and Alpha-Beta Search}

Alpha-beta search cannot reach the end of an Othello game, so it stops at a depth limit and scores the position with an evaluation function. The textbook describes the usual form, a weighted sum of features, and notes that the features and weights come from human experience; where that experience is missing, the weights can be estimated by machine learning \cite[Sec.~5.3.1]{russell2020aima}. Othello is a hard case for a hand-built function, because material is a poor guide and mobility matters more, yet programs have played at a superhuman level since 1997 \cite{russell2020aima}. The textbook also warns that alpha-beta search is vulnerable to errors in the evaluation function, because one wrong estimate can flip a choice and errors that are correlated across sibling positions make this worse \cite[Sec.~5.7]{russell2020aima}. A fixed depth limit also brings the horizon effect, in which a program pushes an unavoidable loss beyond its search depth and so misjudges the position; the textbook's remedies include extending the search for moves that are clearly better than the rest \cite[Sec.~5.3.2]{russell2020aima}.

The clearest example of how that level was reached is Buro's program Logistello, which dominated computer Othello for several years and beat the human world champion by a score of 6 to 0 in 1997 \cite{buro2002improving}. Buro's survey of its techniques covers three ideas. A generalized linear evaluation model combines conjunctions of Boolean features linearly and fits the weights by least squares, so the data, not the programmer, picks and weights the features. ProbCut prunes moves that are probably, not provably, outside the search window, and tournament results indicate a considerable gain over full-width alpha-beta search. An opening-book framework lets a program improve on its previous play and explore new lines by searching a tree built from the evaluations of games already played \cite{buro2002improving}. The textbook adds a number for ProbCut: a version of Logistello that used it beat the standard version 64 percent of the time even when the standard version had twice as much time \cite[Sec.~5.3.3]{russell2020aima}.

Norelli and Panconesi describe what the strongest engines still look like: optimized minimax search, evaluation functions built on knowledge that human players accumulated, such as the importance of certain patterns at the edges and corners of the board, large opening catalogs, and brute-force endgame search that expands the whole tree for roughly the last 20 to 30 moves \cite{norelli2023olivaw}. The textbook describes the same split between lookup and search: tables replace search at the start and end of a game, and search covers the middle \cite[Sec.~5.3.4]{russell2020aima}. My hand-crafted baselines belong to this family, and the project asks whether a learned evaluation can replace them at small scale.

\section{From Monte Carlo Search to Self-Play Learning}

MCTS avoids the evaluation function. Each iteration has four steps: selection walks down the tree using a selection policy, expansion adds a new node, simulation plays the game out to the end, and back-propagation updates the statistics of the nodes on the path. The move with the most playouts is returned, because a move with many playouts is less uncertain than one that looks good after only a handful \cite[Sec.~5.4]{russell2020aima}. Since the result of a playout comes from the rules, no evaluation function is needed, but the playouts still need a policy: random playouts only show which move is best if both sides play randomly, so the textbook suggests biasing them with simple game knowledge, such as taking the corner square in Othello \cite[Sec.~5.4]{russell2020aima}.

Kocsis and Szepesv\'ari's UCT rule uses ideas from bandit problems to decide where to spend simulations, and comes with a consistency result and finite-sample bounds on the sampling error \cite{kocsis2006bandit}. The textbook presents its UCB1 formula as one very effective selection policy: it adds to a move's average result an exploration term that is large for moves with few playouts \cite[Sec.~5.4]{russell2020aima}. It also warns that, because MCTS samples, it can miss a single move that changes the course of the game, and it notes that a playout can be cut short and scored with an evaluation function, which is what AlphaGo did \cite{russell2020aima}.

Which family suits a game depends on the evaluation. The textbook says Monte Carlo search is preferred when the branching factor is high or a good evaluation function is hard to write, while alpha-beta search was long held to suit games with a low branching factor and a good evaluation function \cite[Sec.~5.4]{russell2020aima}. A typical Othello game lasts about 60 moves with an average branching factor of about 10 \cite{norelli2023olivaw}, so both families are plausible, which is why my project compares them.

AlphaZero combined the two lines of work. A deep network gives MCTS a move prior and a position value, and the network is trained only on self-play games, starting from nothing but the rules of chess, shogi, and Go \cite{silver2018general}. In the selection step, the textbook notes, AlphaZero adds a term for the move probability computed by the network to the UCB1 formula \cite[Sec.~5.4]{russell2020aima}. The textbook reports that it won 155 games and lost 6 of a 1000-game match against Stockfish, and adds that humans still supply the architecture and the rules \cite{russell2020aima}. The cost was the obstacle: Norelli and Panconesi note that the original projects used thousands of GPUs and hundreds of TPUs, which put them out of reach of most labs \cite{norelli2023olivaw}.

\section{Self-Play on a Small Budget}

Several recent papers ask how cheaply the AlphaZero recipe can run, and Othello is a common test game. Norelli and Panconesi's Olivaw applies the AlphaGo Zero recipe to 8$\times$8 Othello on free cloud notebooks, with a residual network of 10 blocks (the strongest AlphaGo Zero used 39) and separate value and policy outputs \cite{norelli2023olivaw}. It doubles the training data per game by also storing positions that the search explored but the game never reached. One training run took about 30 days and 50,000 self-play games, with 19 people helping to generate games, and a single self-play game took 6 to 30 seconds on a free K80 GPU, depending on the number of simulations. The agent beat a national champion and lost to a former world champion, and the authors do not call it superhuman. It also won games against Edax while searching a couple of thousand positions, where Edax explores tens of millions \cite{norelli2023olivaw}.

Scheiermann and Konen take the opposite route. They drop the deep network and train temporal-difference n-tuple agents from scratch on a standard CPU in under two hours, using 250,000 training episodes for Othello, then add MCTS only at test time \cite{9893320}. Each result averages 20 agents trained with different random n-tuple configurations, and every agent plays Edax as both first and second player, which gives 40 games per setting. Plain MCTS with 10,000 iterations and the n-tuple agent without MCTS both fell below a 50 percent win rate against Edax from level 2 on. With the MCTS wrapper, the agent beat the Othello program Edax up to level 7, where most earlier learning-from-scratch methods stopped at level 2, although it falls short of Olivaw's level 10 \cite{9893320}. They also found that putting MCTS inside the training loop added a lot of computation for little or no gain with n-tuple networks \cite{9893320}.

MiniZero compares AlphaZero, MuZero, and their Gumbel variants on 9$\times$9 Go and 8$\times$8 Othello, using three-block residual networks on one machine with four GTX 1080 Ti GPUs \cite{10510513}. Each model trains on about 600,000 self-play games, and each checkpoint is rated by Elo from 200 games against a fixed baseline model, always at 400 simulations per move no matter how many were used in training. At equal training steps, more simulations per move helped. At equal training time, however, Gumbel AlphaZero with two simulations reached similar strength to AlphaZero with 200 on Othello, which the authors suggest is because Othello often has fewer legal moves than Go. MuZero is not told the rules and must learn a model of the game \cite{russell2020aima}, and on Othello AlphaZero beat it by a clear Elo margin; the authors suspect that frequent disc flipping makes that learned transition model hard to fit \cite{10510513}. They also propose progressive simulation, which starts with few simulations and raises the number later in training \cite{10510513}.

Tsai et al.~add regret-guided search control: a regret network finds positions where the value estimate was far from the game outcome, and self-play restarts from them, whereas the earlier Go-Exploit method restarts from past states sampled uniformly \cite{tsai2026regretguided}. Their networks have three residual blocks and use 200 simulations per move, and the extra regret outputs made an iteration on Go about 1.25 times slower than plain AlphaZero. On 10$\times$10 Othello, rated against a fixed 150-iteration AlphaZero model with 200 games per evaluation, the final checkpoint was 70 Elo above AlphaZero, and against an alpha-beta program in the Ludii system it won 57.8 percent of games, compared with 51.7 percent for plain AlphaZero. Each run still needed about 150 GPU hours \cite{tsai2026regretguided}.

Boige et al.~ask whether tree search is needed during training at all. In their preprint, which is not peer reviewed, approximate value iteration (AVI) learns from one-step lookahead with no tree search, using one-step backups where AlphaZero uses complete game outcomes, and to compare the two fairly they count compute in forward-pass equivalents of the network. On Connect Four and 7$\times$7 Hex, where exact solvers exist, it learned more accurate values than AlphaZero, which the authors measure as value error, as the regret of the chosen moves, and as the error rate in complete games against a perfect solver \cite{boige2026surprisingeffectivenessapproximatevalue}. On Othello and 9$\times$9 Go, no such oracle exists, so AVI is tested against MiniZero. Its greedy play stayed weaker than MiniZero's search-based agent, but inserting AVI's value into MiniZero's search improved MiniZero under the same budget. For Othello they play all 54 positions reachable after three plies, each from both sides, which is the same color-swapping idea I use \cite{boige2026surprisingeffectivenessapproximatevalue}. This cross-inference test separates the value function from the search, and I borrow it.

Read together, these papers pull three levers on cost. Olivaw and Tsai et al.~get more out of each game by training on extra or better-chosen positions, MiniZero spends fewer simulations per move, and Scheiermann and Konen and Boige et al.~cut the amount of search used in training. All of them still learn a value estimate, which is the part my hand-crafted baselines supply by hand.

\section{Small Boards and Exact Values}

Board size changes what can be known. The 6$\times$6 board has 32 empty squares at the start, so a game has at most 32 moves, compared with up to 60 on the standard 8$\times$8 board \cite{boige2026surprisingeffectivenessapproximatevalue}. Feinstein reported in 1993 that on 6$\times$6 Othello the second player wins by 20 discs to 16, and Takeshita et al.~confirmed that his sequence is one of the perfect plays \cite{takeshita2016perfect}. Norelli and Panconesi make the same point from the learning side: earlier low-cost reproductions of AlphaGo Zero succeeded only on very simple games such as Connect Four and 6$\times$6 Othello, ``for which perfect strategies are known'' \cite{norelli2023olivaw}. Exact solutions let a study measure value error and regret directly instead of through matches, which is what Boige et al.~do on Connect Four and Hex; they also note that exact oracles limit such studies to small games \cite{boige2026surprisingeffectivenessapproximatevalue}. The Othello results in the learning studies above are all measured through matches against other programs. Boige et al.~make this caveat about themselves: their Othello and 9$\times$9 Go runs cannot show how far either agent is from optimal play \cite{boige2026surprisingeffectivenessapproximatevalue}.

\section{The Gap and My Project}

Three gaps follow from this literature. First, the Othello studies compare AlphaZero variants with each other or with strong engines such as Edax \cite{9893320} and the alpha-beta search in Ludii \cite{tsai2026regretguided}, not with a few hand-crafted evaluation functions whose contents are known, so they say little about what a learned evaluation adds over features a student could write. Second, the budgets range from under two hours on a CPU \cite{9893320} to about 30 days on free cloud hardware \cite{norelli2023olivaw} and 150 GPU hours per run \cite{tsai2026regretguided}, and in the papers I read none trains a small network on laptop-scale compute and then tests it against hand-crafted evaluations under an equal time budget. Third, strength is measured through matches only, even though 6$\times$6 Othello is small enough to be solved.

My project works in that gap. On 6$\times$6 Othello, a small convolutional network with value and policy heads guides MCTS, and it plays random, greedy, plain MCTS, and alpha-beta agents with three hand-crafted evaluations (disc difference, square weights, and mobility with corner control), all under the same time per move. I fix the time rather than the depth because a network evaluation costs more than a hand-crafted one, so equal depth would hand the network more computation. Each pairing plays 200 games from random four-move openings, and every opening is played twice with the colors swapped. This matters on this board, because perfect play favors the second player \cite{takeshita2016perfect}, so swapping colors keeps either side's advantage from biasing a comparison. Following Wu et al.~\cite{10510513}, I keep the number of simulations per move small, and following Wu et al.~and Tsai et al.~\cite{tsai2026regretguided}, I report win rates with 95 percent confidence intervals and Elo ratings. Success means the learned agent beats the strongest hand-crafted agent with an interval that excludes 50 percent, but a loss would still be informative: following Boige et al.~\cite{boige2026surprisingeffectivenessapproximatevalue}, I use cross-inference and ablations (value only, policy only, both, and more simulations) to show which part of the system a small budget cannot reproduce. Because the 6$\times$6 game has a known value \cite{takeshita2016perfect}, exact values could also measure value error as Boige et al.~do, but I have not checked whether a solver or a published solution is available, so I treat this as an optional extension. Whether a laptop-sized run matches the larger studies is what the experiments will show.

\needspace{0.7\textheight}
\renewcommand{\refname}{7.\quad References}
\bibliographystyle{plainurl}
\bibliography{citations}

\end{document}
```
### Reference file (citations.bib)
Create it as a new file in Overleaf named exactly `citations.bib`. The four entries for Writing 3's papers (`boige...`, `9893320`, `tsai2026regretguided`, `10510513`) are the same entries as in Writing 3, which came from the publishers' own exports. The other six were built from the Crossref records in the verification record. `plainurl` prints them in alphabetical order by first author: [1] Boige, [2] Buro, [3] Kocsis, [4] Norelli, [5] Russell, [6] Scheiermann, [7] Silver, [8] Takeshita, [9] Tsai, [10] Wu.
```bibtex
@misc{boige2026surprisingeffectivenessapproximatevalue,
      title={The Surprising Effectiveness of Approximate Value Iteration in Self-Play},
      author={Raphael Boige and Amine Boumaza and Bruno Scherrer},
      year={2026},
      eprint={2609.09094},
      archivePrefix={arXiv},
      primaryClass={cs.AI},
      url={https://arxiv.org/abs/2609.09094},
}

@article{buro2002improving,
  author  = {Michael Buro},
  title   = {Improving heuristic mini-max search by supervised learning},
  journal = {Artificial Intelligence},
  volume  = {134},
  number  = {1--2},
  pages   = {85--99},
  year    = {2002},
  doi     = {10.1016/S0004-3702(01)00093-5}
}

@inproceedings{kocsis2006bandit,
  author    = {Levente Kocsis and Csaba Szepesv{\'a}ri},
  title     = {Bandit Based {Monte-Carlo} Planning},
  booktitle = {Machine Learning: {ECML} 2006},
  series    = {Lecture Notes in Computer Science},
  pages     = {282--293},
  publisher = {Springer Berlin Heidelberg},
  year      = {2006},
  doi       = {10.1007/11871842_29}
}

@article{norelli2023olivaw,
  author  = {Antonio Norelli and Alessandro Panconesi},
  title   = {{Olivaw}: Mastering {Othello} Without Human Knowledge, nor a Fortune},
  journal = {IEEE Transactions on Games},
  volume  = {15},
  number  = {2},
  pages   = {285--291},
  year    = {2023},
  doi     = {10.1109/TG.2022.3157345}
}

@book{russell2020aima,
  author    = {Stuart Russell and Peter Norvig},
  title     = {Artificial Intelligence: A Modern Approach},
  edition   = {Fourth},
  publisher = {Pearson},
  year      = {2020},
  url       = {https://aima.cs.berkeley.edu/}
}

@ARTICLE{9893320,
  author={Scheiermann, Johannes and Konen, Wolfgang},
  journal={IEEE Transactions on Games},
  title={{AlphaZero}-Inspired Game Learning: Faster Training by Using {MCTS} Only at Test Time},
  year={2023},
  volume={15},
  number={4},
  pages={637-647},
  keywords={Games;Training;Planning;Prediction algorithms;Silver;Wrapping;Task analysis;Board games;MCTS;Monte Carlo methods;N-tuple systems;othello;reinforcement learning;temporal difference learning},
  doi={10.1109/TG.2022.3206733}}

@article{silver2018general,
  author  = {David Silver and Thomas Hubert and Julian Schrittwieser and Ioannis Antonoglou and Matthew Lai and Arthur Guez and Marc Lanctot and Laurent Sifre and Dharshan Kumaran and Thore Graepel and Timothy Lillicrap and Karen Simonyan and Demis Hassabis},
  title   = {A general reinforcement learning algorithm that masters chess, shogi, and {Go} through self-play},
  journal = {Science},
  volume  = {362},
  number  = {6419},
  pages   = {1140--1144},
  year    = {2018},
  doi     = {10.1126/science.aar6404}
}

@incollection{takeshita2016perfect,
  author    = {Yuki Takeshita and Makoto Sakamoto and Takao Ito and Satoshi Ikeda},
  title     = {Perfect Play in Miniature {Othello}},
  booktitle = {Genetic and Evolutionary Computing},
  series    = {Advances in Intelligent Systems and Computing},
  volume    = {388},
  pages     = {281--290},
  publisher = {Springer International Publishing},
  year      = {2016},
  doi       = {10.1007/978-3-319-23207-2_28}
}

@inproceedings{tsai2026regretguided,
title={Regret-Guided Search Control for Efficient Learning in {AlphaZero}},
author={Yun-Jui Tsai and Wei-Yu Chen and Yan-Ru Ju and Yu-Hung Chang and Ti-Rong Wu},
booktitle={The Fourteenth International Conference on Learning Representations},
year={2026},
url={https://openreview.net/forum?id=Eoiu5iJD71}
}

@ARTICLE{10510513,
  author={Wu, Ti-Rong and Guei, Hung and Peng, Pei-Chiun and Huang, Po-Wei and Wei, Ting Han and Shih, Chung-Chin and Tsai, Yun-Jui},
  journal={IEEE Transactions on Games},
  title={{MiniZero}: Comparative Analysis of {AlphaZero} and {MuZero} on {Go}, {Othello}, and {Atari} Games},
  year={2025},
  volume={17},
  number={1},
  pages={125-137},
  keywords={Games;Training;Computational modeling;Optimization;Servers;Task analysis;Planning;AlphaZero;Atari games;deep reinforcement learning;Go;Gumbel AlphaZero;Gumbel MuZero;MuZero},
  doi={10.1109/TG.2024.3394900}}
```
### Overleaf steps
1. On overleaf.com choose **New Project**, then **Blank Project**, and name it `Writing 4 - Othello Literature Review`.
2. Open `main.tex`, press `Ctrl+A`, `Delete`, and paste the `main.tex` block.
3. Add a **New File** named `citations.bib` and paste the `.bib` block.
4. Under **Menu**, set the compiler to `pdfLaTeX` and the main document to `main.tex`.
5. Click **Recompile**. If the PDF shows `[?]`, use **Recompile from scratch** once.
6. Check the page count and the pre-submit list below, download the PDF, and upload it on Canvas.
### Checks run in this vault (no LaTeX engine used)
No TeX engine is installed here, so nothing below is a compile. A script (the course environment's Python, run with `-I`, reading the two blocks above on 2026-11-25) lint-checked the text. This is a lint, not a compile.
- Passed: every `\cite` key is in the `.bib` and every one of the 10 `.bib` keys is cited; braces balance in both files; `\begin` and `\end` match; `\makeatletter` is paired; both files are plain ASCII; dollar signs are even; no bare `%`, `&`, `_` or `#` in the prose; no `--` in the prose; `plainurl`, `citations` and `\end{document}` are in the right order; `hyperref` is loaded before `xurl`; `\emergencystretch` is set; the title, author and `7. References` heading are present; each entry has its required fields and a DOI or URL (the book excepted); no em or en dash anywhere in the note.
- Two script flags are false alarms. `et al.~\cite{...}` is the abbreviation case that Writing 3 also uses. Three cites sit mid-sentence (`\cite{9893320} to about 30 days ...`), which the citation guide allows.
- *Word count (after the humanized-text review):* about 1,510 words of prose in the six sections (Introduction 142, Section 2 253, Section 3 218, Section 4 497, Section 5 130, Section 6 271), plus a 26-word footnote. The count strips citations, commands and the footnote.
- *Page estimate:* 2.2 pages at 750 words per page and 2.8 at 590. Writing 3's layout (about 520 words filling its first page, with five headings, a title block and a footnote) suggests the truth is in that range. It is an estimate, not a compile. The requirement is 2 to 3 pages of body text, so the estimate fits, with 0.2 to 0.8 page before the limit.
- The script's "programme" flag is a false alarm: it matches inside "programmer" in the Buro sentence.
- Vault Lint on this note: fit 1 of 1 (100%).
- *Not checked:* anything that needs a real compile (header look, page breaks, BibTeX warnings, the underscore in two DOIs).
### Pre-submit checks
- [ ] The PDF is uploaded before 11:59 PM tonight (Nov 25).
- [ ] The body text (everything before `7. References`) ends on page 3 or earlier. I estimated 2.2 to 2.8 pages from the Writing 3 layout, but this is an estimate. If it runs over, cut in this order: the last sentence of Section 5, then the MiniZero progressive-simulation sentence, then the Scheiermann and Konen sentence about Olivaw's level 10.
- [ ] Header on every page, with `Writing #4: Literature Review` on the left and `Anant Gupta` on the right.
- [ ] Headings read `1. Introduction` through `6. The Gap and My Project`, then `7. References`.
- [ ] References lists ten numbered entries in the order Boige, Buro, Kocsis, Norelli, Russell, Scheiermann, Silver, Takeshita, Tsai, Wu, and no `[?]` appears.
- [ ] The Kocsis and Takeshita DOIs contain an underscore. If the Logs show "Missing $ inserted" near them, change `_` to `\_` inside those two `doi` fields only.
- [ ] Names keep their capitals in titles: AlphaZero, MCTS, MiniZero, Olivaw, Othello, Go, Monte-Carlo, ECML.
- [ ] Click each DOI and URL link in the PDF and confirm it opens the right paper.
- [ ] The Logs panel shows 0 errors, no `Citation ... undefined`, no `Undefined control sequence`, no `\href` message. Underfull or Overfull `\hbox` warnings are acceptable.
- [ ] The AI-use footnote states what really happened. Edit it. The draft says Claude was used to find and verify references and to draft the review, and that you chose the project and edited the text. If that is not what happened, change it.
- [ ] You can defend every sentence. Open at least the Olivaw, MiniZero and Tsai papers and re-check the numbers in Section 4, as Discussion 10 asks ("open every paper you cite").
### Open items and risks
- The page count is unverified (no TeX engine here). The estimate is 2.2 to 2.8 pages. See the pre-submit list for what to cut if it runs over.
- Buro (2002), Kocsis and Szepesvari (2006) and Silver et al. (2018) were checked for bibliographic data only. Their content claims rest on a summary and on the textbook, not on the papers. All three claims are ones the textbook states or implies, but you have not seen the originals through me. If your library gives you the PDFs, skim the abstracts.
- Boige et al. is a preprint from September 2026 with no peer review. The text says so. The prompt allows it only if relevant, which it is (it is the source of the cross-inference test in the proposal). To make the list fully peer reviewed, drop it and the three sentences that cite it, and add Browne et al. (2012).
- The prompt says 8 to 10 references. This has exactly 10. Nothing needs cutting.
- The "gap" claims are my synthesis, hedged to "the papers I read". They are the part most open to a grader's challenge, so be ready to say which papers you read for each.
- The optional 6x6 oracle idea is new relative to Writing 3. Keep it or delete it, as described under "Finding that changes the project framing".
- Writing 3's note says Pgx covers 8x8 Othello; its abstract does not mention Othello, so Pgx stays out.
## Concepts used
- **Evaluation functions and depth cutoff** (Lecture 12, textbook Sections 5.3.1 and 5.3.2, [[20_Progress/Degree/CSCI 4511W/Concepts/Concept - Informed Search|Concept - Informed Search]]): Section 2 of the review is about how hand-built and learned evaluation functions have been produced for Othello.
- **Alpha-beta search and forward pruning** (Lectures 11 and 12, textbook Sections 5.2.3 and 5.3.3): the baseline family, and ProbCut as the example of statistical pruning.
- **Monte Carlo tree search and UCB1** (Lectures 12 and 13, textbook Section 5.4): the search the network will guide, and the algorithm in Kocsis and Szepesvari.
- **Learning in game search** (Lecture 14 slides 12 to 14, textbook Section 5.7): the textbook's "fourth issue", which is the whole literature in Sections 3 and 4 of the review.
- **Reading and writing a literature review by theme** (Discussion 10): themes instead of paper-by-paper summaries, and a closing gap and project paragraph.
- **BibTeX and LaTeX citing** (course citation guide, Writing 2 and 3): `plainurl`, `citations.bib`, `\cite` before the period, one entry per source with its DOI or URL.
## Post-submit reflection
<!-- Optional until feedback: the first failure, the pattern, and what to change. -->
