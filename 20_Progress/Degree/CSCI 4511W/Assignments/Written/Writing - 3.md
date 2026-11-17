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
next: "Confirm the Writing 3 due date on Canvas, create the Overleaf project from main.tex and citations.bib below, compile and check the pre-submit list, fix the AI-use footnote so it states what you really did, then submit the PDF"
---
# Writing - 3
## Overview
The project proposal, which is the first of the final project's written parts: one author, under 650 words by my own limit (the prompt says 600 to 700), written in LaTeX on Overleaf and submitted as a PDF on Canvas. The project is a mini-AlphaZero for 6x6 Othello: a small value network trained by self-play inside MCTS, compared with hand-crafted evaluation functions.
The due date is not verified. Lecture 15 (Nov 2) only says "Proposal will be due soon", and no local source gives a date, so `deadline` is left empty. The Board puts Writing 4 (the literature review) at Nov 25 and the final project at Dec 18.
## Requirements
Source: the Canvas prompt for Writing 3, the Canvas "Final Project Information" page, and the professor's Discord answers, all pasted 2026-11-16, plus two instructions from the student the same day: under 650 words, and references that are recent and officially published.
### Writing 3 prompt (verbatim)
> This writing assignment is the first part of your project. Write a short proposal for your project reporting on any initial work you might have done. The report should include: team members (a pair submits one paper and says which parts each wrote); a brief description of the problem and why it is interesting; the approach; the software you'll write or use; preliminary work or results (if any); how you will evaluate your solution; a time frame; bibliographic references to a few relevant papers (3 or 4). The expected length is around 600-700 words. For a group of 2, 800-900. If you use generative AI to assist with your work, we expect you to acknowledge that.
### Rubric
40% problem description and justification, 30% description of approach, 20% writing style (clarity, spelling, grammar, LaTeX correctness), 10% other required information (references, time frame).
### Final project rules that shape the proposal
- The project may be individual or in a pair. The professor confirmed in Discord that a partner is not required. I am working alone.
- It needs a program (own code or open source) to solve a problem of interest, a literature search of 6 to 8 papers, an original experiment on a new problem of my choice with analysis, and a written report. It is a research project, not a programming assignment.
- The parts are: the proposal (Writing 3), the literature review (Writing 4), the final report, and, for pairs only, an individual contribution report.
- Budget about 50 hours per student, and the scope should match that.
- "Preliminary work or results" means my own work, "if you've already started" (the professor, Discord, 11/13). It does not mean published research.
### Checklist
**Must submit**
- [ ] One PDF on Canvas, compiled from LaTeX on Overleaf.
- [ ] Under 650 words in total by an Overleaf-style count (headings and footnote included), and about 600 words of prose so the professor's range still holds.
- [ ] Team members, problem and why it is interesting, approach, software, preliminary work, evaluation, time frame, references.
- [ ] 3 or 4 references, each cited in the text, as proper BibTeX entries in `citations.bib`.
- [ ] A footnote that states how much generative AI was used.
**Must demonstrate**
- [ ] The problem is justified, not only named (40% of the grade).
- [ ] The approach is specific enough to follow (30%).
- [ ] The evaluation says what is measured and what counts as success.
- [ ] The references are recent, officially published, and actually read.
**Must not do**
- [ ] Leave a `[?]` in the PDF (a `\cite` key that does not match the `.bib`).
- [ ] State a result that does not exist. No Othello result exists yet, and the draft says so.
- [ ] List a reference that the text never cites.
## Work log
### What I read
- Canvas prompts and Discord answers above (pasted by the user).
- Lectures 14 to 17 and Discussions 7, 8 and 9 (MinerU). The project appears only in Lecture 15 slide 4, Discussion 7 slide 23 (problem and motivation, AI approach and baseline, evaluation, next step) and Discussion 8 slide 17 (goal, method and baseline, evaluation, plan, and "Game project? Test your agent against a random player and report win rates").
- [[20_Progress/Degree/CSCI 4511W/Assignments/Written/Writing - 2|Writing - 2]] and the compiled Writing 2 PDF for the layout and workflow, and [[20_Progress/Degree/CSCI 4511W/Assignments/Written/Problem Set - 3|Problem Set - 3]] for the preliminary numbers.
- `aima-python/aima/games.py`: it has the `Game` class, `alpha_beta_cutoff_search`, `monte_carlo_tree_search` and `mcts_player`, plus `TicTacToe`, `ConnectFour`, `Gomoku` and `Backgammon`. There is no Othello, so the project writes its own game class.
- The four papers below, and the course's LaTeX material (see "Format and template check").
### Project decision
The user wanted a project that is interesting and teaches a lot, not a standard pathfinding or TSP task, and picked the mini-AlphaZero option out of three.

| Option | Why not (or why) |
| --- | --- |
| Mini-AlphaZero on 6x6 Othello (chosen) | Extends Chapter 5 (evaluation functions, MCTS), keeps evaluation objective through win rates, reuses the PS3 match-playing idea, and teaches self-play RL and PyTorch, which fits the ML engineer track and CSCI 4521. |
| Search over LLM reasoning | Needs API budget, gives noisy results, and the algorithm is less my own code. |
| LLM plus a classical planner | Planning is the least covered topic in lecture. |

Why Othello and not Connect 4 or Gomoku: PS3 already used them, and the proposal needs an original experiment on a new problem. Discussion 8 slides 12 and 13 already pose the Othello evaluation design question, so the baselines come from class.
### Reference selection (redone 2026-11-16)
The first draft cited four papers from 2006 to 2018 (Kocsis and Szepesvári, Browne et al., two Silver et al. papers). They were checked against publisher pages but not read, and they are old. They were dropped. The new set is from 2023 to 2026, found with a paper-search tool (arXiv-indexed corpus, papers from 2022 on, queries about AlphaZero-style training on Othello and small boards under limited compute), and each venue was then confirmed on an official page.

| Key | Entry | Venue confirmed on | What I read in it |
| --- | --- | --- | --- |
| `wu2025minizero` | Wu et al., MiniZero, IEEE Transactions on Games 17(1), 125 to 137, March 2025 | Author page listing vol. 17 no. 1 pp. 125 to 137 (Mar. 2025); the AVI paper's reference list agrees | Setup (8x8 Othello, 3 residual blocks, 200 simulations for AlphaZero, 2 and 16 for Gumbel, one machine with four GTX 1080 Ti GPUs), Sections IV-B and IV-C (equal-training-time result), progressive simulation, conclusion |
| `scheiermann2023alphazero` | Scheiermann and Konen, IEEE Transactions on Games 15(4), 637 to 647, Dec 2023 (online 15 Sep 2022), doi 10.1109/TG.2022.3206733 | IEEE Xplore page (volume, issue, pages, DOI) | Introduction, Edax comparison and related work (Section V-C), computation times, the MCTS-inside-training experiments, conclusion |
| `tsai2026regret` | Tsai et al., Regret-Guided Search Control, ICLR 2026 | OpenReview forum Eoiu5iJD71 ("ICLR 2026 Poster") and the arXiv comment "Accepted by ... ICLR 2026" | Experiment section (10x10 Othello, 3 blocks, 200 simulations, Elo against an AlphaZero reference, 95% intervals), Ludii alpha-beta baselines, the "about 150 GPU hours" cost statement, discussion |
| `boige2026avi` | Boige, Boumaza and Scherrer, Approximate Value Iteration in Self-Play, arXiv:2609.09094, Sept 2026 | arXiv header (v1, 08 Sep 2026, cs.AI) | Introduction, problem formulation, experimental setup (oracle metrics, match protocol, cross-inference), results and limitations |

- How much I read: the tool returned the passages most relevant to specific questions (setup, results, discussion, related work). I did not read every page or the appendices in full. The claims in the draft are limited to what those passages state.
- `boige2026avi` is a preprint with no peer review. If an all-peer-reviewed list is preferred, swap it for Pgx (below). It is cited once, for the cross-inference test.
- MiniZero's arXiv version is from 2023 and the journal issue is March 2025. The `.bib` uses the journal data. Scheiermann and Konen appeared online in 2022 and in the December 2023 issue. The `.bib` uses 2023.
- Not used in the proposal, saved for Writing 4: Pgx (Koyamada et al., NeurIPS 2023 Datasets and Benchmarks; includes 8x8 Othello, and an AlphaZero baseline that took 11.4 hours on one A4000 GPU; JAX only), Gumbel AlphaZero (Danihelka et al., ICLR 2022; I have not opened it), Go-Exploit (arXiv 2302.12359), Othello-GPT (Li et al., ICLR 2023, arXiv 2210.13382), and RMCTS (arXiv 2601.01301, Othello timings, preprint). The original AlphaZero papers are background for the final report, not the proposal.
### Format and template check
- **Citation guide** (`How to Cite in LaTeX (Citation Guide).pdf`, updated for Fall 2026): the `.bib` file must be named `citations.bib`; end the document with `\bibliographystyle{plainurl}` and `\bibliography{citations}`; load `xurl` for URLs; cite with `\cite{key}` before the sentence's period; separate several keys with a comma; uncited entries do not print. It also says to cite shared links when citing an AI conversation as a source. This proposal discloses AI use in a footnote and does not cite AI output as a source.
- **TA tutorial** (`HW & Exams/HW/main.tex` and `rf1.bib`): entries use `author` with `and`, brace-protected capitals in titles, `@article` with journal, volume, number, pages, year, and `@inproceedings` with booktitle, pages, year. The new `.bib` follows that shape.
- **Writing 2 as submitted** (the compiled PDF): title and author in the header on every page, `Writing #2` title block with the author and `CSCI 4511W`, numbered headings `1.` to `3.`, the AI footnote on the first sentence, a numbered reference list. This draft keeps the same preamble. Writing 2 used `acm` because the TA tutorial used it. The Writing 3 prompt names no template or style, so this draft follows the Fall 2026 citation guide (`plainurl`). To match Writing 2 instead, change the one line `\bibliographystyle{plainurl}` to `\bibliographystyle{acm}` and move each `url` into `note = {\url{...}}`.
- The Writing 3 prompt links no `acmtemplate.tex`, and none was seen.
### Claim to source
| Claim in the draft | Where it comes from |
| --- | --- |
| Search replaces the unknown result with an evaluation function at the depth limit | Lecture 12 and textbook §5.3, as used in PS3 (`alpha_beta_cutoff_search` with `eval_fn`) |
| Disc difference can mislead mid-game | Discussion 8, slide 13 asks exactly this |
| About 150 GPU hours per run on 9x9 Go, 10x10 Othello and 11x11 Hex | Tsai et al., experiments: "each training requires approximately 150 NVIDIA RTX A6000 GPU hours" |
| An agent trained in under two hours on a standard CPU beat Edax up to level 7 | Scheiermann and Konen, introduction: "trained from scratch in less than 2 hours on a standard CPU", "defeat the strong Othello program Edax at level 7" |
| On 8x8 Othello, Gumbel AlphaZero with 2 simulations reached similar strength to AlphaZero with 200 at equal training time | Wu et al., Section IV-C ("g-alpha0 n=2 and alpha0 n=200 achieve similar playing strength") |
| Few simulations per move are workable on Othello | Wu et al., Section IV-B (on 8x8 Othello n=2 was equal to or slightly better than n=16; "fewer simulations might be sufficient") |
| Cross-inference: keep search and policy fixed, swap only the value function | Boige et al., Section 4.3 and 5.2 |
| Elo ratings with 95 percent confidence intervals | Wu et al., Figures 3 and 4; Tsai et al., Figure 4 |
| `aima-python` has the game interface, alpha-beta cutoff, a baseline MCTS and no Othello | `games.py` listing above |
| PS3: 100 of 100 as each color against random, 65 to 77 of 100 against the course MCTS | PS3 note, Verification table (`c4_good_eval`: 100 and 100; depth 2: 65 and 76; depth 3: 76 and 77). I did not re-run these. |
| 8, 10, 14, 8 and 10 hours add to 50 | Final project page: about 50 hours |
| Nov 25 literature review, Dec 18 final report | Board schedule |
### Draft main.tex
The preamble is the Writing 2 preamble (10pt article class, 1 inch margins, header with title left and author right on every page, centered page number, `N.` headings), with `xurl` for the citation guide. Only the title, sections and bibliography heading changed.
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

\title{Writing \#3: Project Proposal}
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

\section{Team Members}

This is an individual project by Anant Gupta, so all of the work and writing is mine.\footnote{Generative AI use: I used Claude (Anthropic) to brainstorm ideas, find and check references, and draft this proposal. I chose the project and edited the text myself.}

\section{Problem}

A game-playing program cannot search to the end of a game, so at its depth limit it replaces the unknown result with an evaluation function. Writing a good one by hand is hard. In Othello, counting my discs minus yours can mislead mid-game, because the squares held and the moves available often matter more. Every weight in a hand-written function is a guess.

AlphaZero-style systems learn the evaluator from self-play, but they are expensive: recent experiments on 9$\times$9 Go, 10$\times$10 Othello, and 11$\times$11 Hex needed about 150 GPU hours per run \cite{tsai2026regret}. An agent trained in under two hours on a standard CPU beat the Othello program Edax up to level 7 \cite{scheiermann2023alphazero}, and on 8$\times$8 Othello a Gumbel AlphaZero variant with two simulations per move reached similar strength to AlphaZero with 200 simulations at equal training time \cite{wu2025minizero}. My question: \emph{with a laptop-sized budget, can a small value network trained by self-play beat a hand-designed evaluation function at 6$\times$6 Othello under an equal time budget?}

\section{Approach}

The baselines are a random player, a greedy player, plain MCTS with random playouts, and depth-limited alpha-beta search with three hand-crafted evaluations (disc difference, square weights, and mobility plus corners). The learned agent is a small convolutional network with a value output and a move-probability output, used inside MCTS. It plays itself, and each finished game yields examples of a position, the search's visit counts, and the result. Simulations are the main cost, so I will keep them few per move, as the Othello results above suggest is workable \cite{wu2025minizero}.

To separate value from search, I will borrow the cross-inference test of Boige et al.~\cite{boige2026avi}: keep one search and policy fixed and swap only the value function.

\section{Software}

Everything is in Python. The course's \texttt{aima-python} library supplies the \texttt{Game} interface, alpha-beta cutoff search, and a baseline MCTS, but has no Othello, so I will write my own game class and test it on positions worked out by hand. The network and self-play loop use PyTorch on one laptop GPU. Code, seeds, and logs will be kept.

\section{Preliminary Work}

I have not started on Othello, so there are no Othello results yet. The relevant groundwork is Problem Set 3, where I designed a hand-crafted Connect 4 evaluation. With depth-4 alpha-beta search it won 100 of 100 games as each color against a random player, and 65 to 77 of 100 games against the course MCTS agent, depending on color and depth. It also gave me a match-playing harness.

\section{Evaluation}

All agents play a round robin of 200 games per pairing. Each game starts from a random four-move opening, played twice with colors swapped, and every agent gets the same time per move. I will report win rates (a draw counts as half) with 95 percent confidence intervals, plus Elo ratings, as recent AlphaZero studies do \cite{tsai2026regret,wu2025minizero}.

Success means the learned agent beats the strongest hand-crafted agent with an interval excluding 50 percent. A loss is still a result: ablations (value only, policy only, both, more simulations) will show which part a small budget cannot reproduce.

\section{Time Frame}

The budget is about 50 hours. Reading the papers takes 8 hours, through November 25, and doubles as the Writing 4 literature review. The Othello engine and baselines take 10 hours, by November 29; network and self-play training 14 hours, through December 6; experiments and ablations 8 hours, by December 13; and the final report 10 hours, due December 18. If training is too slow, I will shrink the network and the simulations per move before changing the game.

\renewcommand{\refname}{8. References}
\bibliographystyle{plainurl}
\bibliography{citations}

\end{document}
```
### Reference file (citations.bib)
Create it as a new file in Overleaf named exactly `citations.bib`, because `main.tex` ends with `\bibliography{citations}`.
```bibtex
@article{wu2025minizero,
  author  = {Ti-Rong Wu and Hung Guei and Pei-Chiun Peng and Po-Wei Huang and Ting Han Wei and Chung-Chin Shih and Yun-Jui Tsai},
  title   = {{MiniZero}: Comparative Analysis of {AlphaZero} and {MuZero} on {Go}, {Othello}, and {Atari} Games},
  journal = {IEEE Transactions on Games},
  volume  = {17},
  number  = {1},
  pages   = {125--137},
  year    = {2025}
}

@article{scheiermann2023alphazero,
  author  = {Johannes Scheiermann and Wolfgang Konen},
  title   = {{AlphaZero}-Inspired Game Learning: Faster Training by Using {MCTS} Only at Test Time},
  journal = {IEEE Transactions on Games},
  volume  = {15},
  number  = {4},
  pages   = {637--647},
  year    = {2023},
  doi     = {10.1109/TG.2022.3206733}
}

@inproceedings{tsai2026regret,
  author    = {Yun-Jui Tsai and Wei-Yu Chen and Yan-Ru Ju and Yu-Hung Chang and Ti-Rong Wu},
  title     = {Regret-Guided Search Control for Efficient Learning in {AlphaZero}},
  booktitle = {The Fourteenth International Conference on Learning Representations ({ICLR} 2026)},
  year      = {2026},
  url       = {https://openreview.net/forum?id=Eoiu5iJD71}
}

@misc{boige2026avi,
  author       = {Rapha{\"e}l Boige and Amine Boumaza and Bruno Scherrer},
  title        = {The Surprising Effectiveness of Approximate Value Iteration in Self-Play},
  year         = {2026},
  howpublished = {arXiv preprint arXiv:2609.09094},
  url          = {https://arxiv.org/abs/2609.09094}
}
```
### Overleaf steps
1. On overleaf.com choose **New Project**, then **Blank Project**, and name it `Writing 3 - Othello Proposal`.
2. Open `main.tex`, press `Ctrl+A`, `Delete`, and paste the `main.tex` block.
3. Add a **New File** named `citations.bib` and paste the `.bib` block.
4. Under **Menu**, set the compiler to `pdfLaTeX` and the main document to `main.tex`.
5. Click **Recompile**. If the PDF shows `[?]`, use **Recompile from scratch** once.
6. Open **Word Count** and check the total. Then go through the pre-submit list, download the PDF and upload it on Canvas.
### Checks run in this vault (no LaTeX engine used)
A script read both blocks on 2026-11-16 using the course environment's Python. This is a lint, not a compile.
- Passed (21 checks): every `\cite` key is in the `.bib` and every `.bib` key is cited; no space inside the multi-key cite; braces balance in both files; `\begin` and `\end` match; `\makeatletter` is paired; plain ASCII with no dash characters; no bare `%`, `&`, `_` or `#` in the prose; no citation after a sentence period (`et al.~\cite` keeps the abbreviation spacing); dollar signs are even; `plainurl`, `citations` and `xurl` are present; no `\url` inside a `note`; four entries, all dated 2023 or later; each entry has the fields its type needs.
- *Word count:* 602 words of prose, 27 in the footnote and 10 in the headings. The Overleaf-style total (prose, headings and footnote) is 639, and 647 with the title block. Per section: Team Members 17, Problem 168, Approach 116, Software 58, Preliminary Work 69, Evaluation 95, Time Frame 79. Overleaf's own counter may differ by a few words, since it treats inline math differently, so check it in step 6.
- *Not checked:* page count, header and layout, `plainurl` formatting, and BibTeX warnings. These need a real compile in Overleaf. With the Writing 2 preamble I expect about 1.5 pages, which is an estimate.
### Pre-submit checks
- [ ] The Canvas due date and time are confirmed, and the PDF is uploaded before them.
- [ ] Overleaf's word count is under 650.
- [ ] Header on every page, with `Writing #3: Project Proposal` on the left and `Anant Gupta` on the right.
- [ ] Headings read `1. Team Members` through `7. Time Frame`, then `8. References`.
- [ ] References lists four numbered entries, with the two URLs and the DOI readable, and no `[?]` appears.
- [ ] The Logs panel shows no `Citation ... undefined`, no `Undefined control sequence` and no missing `plainurl.bst` message.
- [ ] The AI-use footnote matches what really happened. Edit it if you did more or less than it says.
- [ ] Every sentence is something I can defend. Re-read the Preliminary Work numbers against the PS3 note.
### Open items and risks
- The Writing 3 due date is not known. The `Time Frame` dates assume it is due before Nov 25.
- No Othello code exists. The proposal says so. If a first alpha-beta versus random run is built before submitting, add it to Preliminary Work with the real numbers and keep the code.
- The plan has no slack around Thanksgiving (Nov 26 to 27) or Long Quiz 3 (Dec 9). The backup in the draft is to shrink the network and the simulations per move.
- PyTorch is not in the course environment. The GPU is an RTX 5070 Ti laptop part, so check that the chosen PyTorch build supports it before the training week.
- Plain Python MCTS with a network can be slow. Measure simulations per second early.
- The papers' compute numbers are for much bigger setups (150 A6000 GPU hours per run in Tsai et al.). The proposal's claim is only that a smaller run is worth testing, not that it will match them.
- The preliminary numbers come from my PS3 note, and I did not re-run them. PS3 forbade collaboration, and these are my own results. Whether the course wants the PS3 code reused in the project is not stated.
- Writing 4 needs 6 to 8 papers. These four are the start. Add Pgx, Gumbel AlphaZero, and the original AlphaZero papers as background.
- A Short Quiz 10 note was written into this file by another session at 18:58 on 2026-11-16 and was moved to [[20_Progress/Degree/CSCI 4511W/Assignments/Written/Short Quiz - 10|Short Quiz - 10]] (checked byte for byte before the move). The quiz note's own next step is still open.
## Concepts used
- **Evaluation functions and depth cutoff** (Lecture 12, textbook §5.3, [[20_Progress/Degree/CSCI 4511W/Concepts/Concept - Informed Search|Concept - Informed Search]]): the whole proposal is about replacing a hand-built estimate of a position's value with a learned one.
- **Alpha-beta search** (Lectures 11 and 12): the baseline family, run to a fixed depth with each hand-crafted evaluation.
- **Monte Carlo tree search and UCB1** (Lecture 12, Discussion 9): the plain MCTS baseline, and the search that the network will guide.
- **Writing a proposal in the discussion frame** (Discussions 7 and 8): problem, method with baseline, evaluation, plan with a backup.
## Post-submit reflection
<!-- Optional until feedback: the first failure, the pattern, and what to change. -->
