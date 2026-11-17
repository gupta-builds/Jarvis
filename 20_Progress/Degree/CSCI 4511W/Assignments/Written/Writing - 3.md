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
next: "Confirm the Writing 3 due date on Canvas, paste main.tex and citations.bib into a new Overleaf project, compile, fix the AI-use footnote so it states what you really did, run the pre-submit checks, and submit the PDF"
---
# Writing - 3
## Overview
The project proposal, which is the first of the final project's written parts: about 600 to 700 words for one author, written in LaTeX on Overleaf and submitted as a PDF on Canvas. The project I proposed is a mini-AlphaZero for 6x6 Othello, a learned value network inside MCTS compared with hand-crafted evaluation functions.
The due date is not verified. Lecture 15 (Nov 2) only says "Proposal will be due soon", and no local source gives a date, so `deadline` is left empty. The Board puts Writing 4 (the literature review) at Nov 25 and the final project at Dec 18.
## Requirements
Source: the Canvas prompt for Writing 3, the Canvas "Final Project Information" page, and the professor's Discord answers, all pasted 2026-11-16.
### Writing 3 prompt (verbatim)
> This writing assignment is the first part of your project. Write a short proposal for your project reporting on any initial work you might have done. The report should include: team members (a pair submits one paper and says which parts each wrote); a brief description of the problem and why it is interesting; the approach; the software you'll write or use; preliminary work or results (if any); how you will evaluate your solution; a time frame; bibliographic references to a few relevant papers (3 or 4). The expected length is around 600-700 words. For a group of 2, 800-900. If you use generative AI to assist with your work, we expect you to acknowledge that.
### Rubric
40% problem description and justification, 30% description of approach, 20% writing style (clarity, spelling, grammar, LaTeX correctness), 10% other required information (references, time frame).
### Final project rules that shape the proposal
- The project may be individual or in a pair. The professor confirmed in Discord that a partner is not required. I am working alone, so the target is 600 to 700 words.
- It needs a program (own code or open source) to solve a problem of interest, a literature search of 6 to 8 papers, an original experiment on a new problem of my choice with analysis, and a written report. It is a research project, not a programming assignment.
- The parts are: the proposal (Writing 3), the literature review (Writing 4), the final report, and, for pairs only, an individual contribution report.
- Budget about 50 hours per student, and the scope should match that.
- "Preliminary work or results" means my own work, "if you've already started" (the professor, Discord, 11/13). It does not mean published research.
### Checklist
**Must submit**
- [ ] One PDF on Canvas, compiled from LaTeX.
- [ ] About 600 to 700 words of prose, references not counted.
- [ ] Team members, problem and why it is interesting, approach, software, preliminary work, evaluation, time frame, references.
- [ ] 3 or 4 references, each cited in the text, as proper BibTeX entries.
- [ ] A footnote that states how much generative AI was used.
**Must demonstrate**
- [ ] The problem is justified, not only named (40% of the grade).
- [ ] The approach is specific enough to follow (30%).
- [ ] The evaluation says what is measured and what counts as success.
**Must not do**
- [ ] Leave a `[?]` in the PDF (a `\cite` key that does not match the `.bib`).
- [ ] State a result that does not exist. No Othello result exists yet, and the draft says so.
- [ ] List a reference that the text never cites.
## Work log
### What I read
- Canvas prompts and Discord answers above (pasted by the user).
- Lectures 14 to 17 (MinerU), Discussions 7, 8 and 9. The project appears only in Lecture 15 slide 4, Discussion 7 slide 23 (problem and motivation, AI approach and baseline, evaluation, next step) and Discussion 8 slide 17 (goal, method and baseline, evaluation, plan, and "Game project? Test your agent against a random player and report win rates").
- [[20_Progress/Degree/CSCI 4511W/Assignments/Written/Writing - 2|Writing - 2]] for the LaTeX preamble and workflow, and [[20_Progress/Degree/CSCI 4511W/Assignments/Written/Problem Set - 3|Problem Set - 3]] for the preliminary numbers.
- `aima-python/aima/games.py`: it has the `Game` class, `alpha_beta_cutoff_search`, `monte_carlo_tree_search` and `mcts_player`, plus `TicTacToe`, `ConnectFour`, `Gomoku` and `Backgammon`. There is no Othello, so the project writes its own game class.
### Project decision
The user wanted a project that is interesting and teaches a lot, not a standard pathfinding or TSP task, and picked the mini-AlphaZero option out of three.

| Option | Why not (or why) |
| --- | --- |
| Mini-AlphaZero on 6x6 Othello (chosen) | Extends Chapter 5 (evaluation functions, MCTS), keeps evaluation objective through win rates, reuses the PS3 match-playing idea, and teaches self-play RL and PyTorch, which fits the ML engineer track and CSCI 4521. |
| Search over LLM reasoning | Needs API budget, gives noisy results, and the algorithm is less my own code. |
| LLM plus a classical planner | Planning is the least covered topic in lecture. |

Why Othello and not Connect 4 or Gomoku: PS3 already used them, and the proposal needs an original experiment on a new problem. Discussion 8 slides 12 and 13 already pose the Othello evaluation design question, so the baselines come from class.
### Reference verification
| Key | Type | Checked against |
| --- | --- | --- |
| `silver2017mastering` | `@article`, Nature 550(7676), 354 to 359, 2017 | Nature page (nature.com/articles/nature24270) and ResearchGate record |
| `silver2018general` | `@article`, Science 362, 1140 to 1144, 2018 | Science page (doi 10.1126/science.aar6404) and PubMed record 30523106 |
| `kocsis2006bandit` | `@inproceedings`, Machine Learning: ECML 2006, Springer, 282 to 293 | Paper PDF text and ResearchGate record (LNCS, doi 10.1007/11871842_29) |
| `browne2012survey` | `@article`, IEEE Trans. Computational Intelligence and AI in Games 4(1), 1 to 43, 2012 | IEEE Xplore page and ResearchGate record |

- Author lists use `and others` for the three entries with long lists, since the searches confirmed the first author but not the full order. Kocsis and Szepesvári are both listed.
- Left out because I could not confirm them: the Science issue number, the LNCS volume number, and the Browne DOI. The `acm` style does not need them.
- I did not read these four papers in full. The proposal's description of the AlphaGo Zero loop (network with a value and a move probability, MCTS guided by both, training on position, visit counts and result) comes from my background knowledge of that paper and must be checked while reading it for Writing 4.
### Claim to source
| Claim in the draft | Where it comes from |
| --- | --- |
| Search replaces the unknown result with an evaluation function at the depth limit | Lecture 12 and textbook §5.3, as used in PS3 (`alpha_beta_cutoff_search` with `eval_fn`) |
| Disc difference can mislead mid-game | Discussion 8, slide 13 asks exactly this |
| AlphaGo Zero learned from self-play, no knowledge but the rules | Nature abstract |
| AlphaZero applied the same approach to chess and shogi | Science abstract |
| UCB1 rule for MCTS | Kocsis and Szepesvári abstract; Discussion 9 slide 16 for the course version |
| `aima-python` has the game interface, alpha-beta cutoff, a baseline MCTS and no Othello | `games.py` listing above |
| PS3: 100 of 100 as each color against random, 65 to 77 of 100 against the course MCTS | PS3 note, Verification table (`c4_good_eval`: 100 and 100; depth 2: 65 and 76; depth 3: 76 and 77). I did not re-run these. |
| 8, 10, 14, 8 and 10 hours add to 50 | Final project page: about 50 hours |
| Nov 25 literature review, Dec 18 final report | Board schedule |
### Draft main.tex
The preamble is the Writing 2 preamble (10pt article class, 1 inch margins, header with title left and author right on every page, centered page number, `N.` headings). Only the title, sections and bibliography heading changed.
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

This is an individual project by Anant Gupta, so all of the work and writing is mine.\footnote{Generative AI use: I used Claude (Anthropic) to brainstorm project ideas, check the references against their publishers' pages, and draft this proposal. I chose the project, checked each claim, and edited the final text myself.}

\section{Problem}

A game-playing program cannot search to the end of a game, so at its depth limit it replaces the unknown result with an evaluation function. Writing a good one by hand is hard. In Othello, counting my discs minus yours can mislead mid-game, because the squares held and the moves available often matter more than the disc count. A hand-written function must trade these factors off, and every weight is a guess.

Recent systems avoid the guess. AlphaGo Zero learned its evaluator from self-play using only the rules of Go \cite{silver2017mastering}, and AlphaZero applied the recipe to chess and shogi \cite{silver2018general}. Both pair a neural network with Monte Carlo tree search (MCTS). My question is a small, testable version of that claim: \emph{can a compact value network, trained only by self-play on one laptop, replace a hand-designed evaluation function and play 6$\times$6 Othello better under an equal time budget?} A win shows where learning beats design, and a loss shows, through ablations, which part of the recipe a small budget cannot reproduce.

\section{Approach}

I will build the comparison in three stages. First, hand-crafted baselines: a random player, a greedy player that maximizes immediate disc gain, and depth-limited alpha-beta search with three evaluation functions (disc difference, a weighted table of square values, and a mix of mobility and corner features). Second, plain MCTS with random playouts, using the UCB1 rule from Kocsis and Szepesv{\'a}ri \cite{kocsis2006bandit}, surveyed by Browne et al.~\cite{browne2012survey}. It is the natural bar for a learned method.

Third, the learned agent. A small convolutional network reads a board and outputs a value (the expected result) and a probability for each move. MCTS uses both: the value replaces random playouts, and the probabilities decide which branches are tried first. The agent plays itself, each finished game yields examples of a position, the search's visit counts, and the final result, and the network is retrained on them. This loop follows AlphaGo Zero \cite{silver2017mastering}.

\section{Software}

Everything is written in Python. The course's \texttt{aima-python} library supplies the \texttt{Game} interface, alpha-beta cutoff search, and a baseline MCTS. It has no Othello, so I will write my own game class, with passes and the end-of-game rule, and test it on positions worked out by hand. The network and self-play loop use PyTorch on one laptop GPU. I will keep all code, seeds, and logs so every result can be rerun.

\section{Preliminary Work}

I have not started on Othello, so there are no Othello results yet. The relevant groundwork is Problem Set 3, where I designed a hand-crafted Connect 4 evaluation that scores every four-square window. With depth-4 alpha-beta search it won 100 of 100 games as each color against a random player, and 65 to 77 of 100 games against the course MCTS agent, depending on color and depth. That gave me a match-playing harness and a sense of the effort a hand-designed evaluation takes.

\section{Evaluation}

All agents play a round robin of 200 games per pairing. Search agents are deterministic and would repeat one game, so each game starts from a random four-move opening, and each opening is played twice with the colors swapped. Every agent gets the same time per move, so none wins just by thinking longer. I will report each win rate (a draw counts as half) with a 95 percent confidence interval, plus an Elo rating per agent.

The project succeeds if the learned agent beats the strongest hand-crafted agent with an interval that excludes 50 percent. A loss is still a result, so ablations will separate the contributions: value only, policy only, both, and different numbers of MCTS simulations.

\section{Time Frame}

The budget is about 50 hours. Reading the papers takes 8 hours, through November 25, and doubles as the literature review for Writing 4. The Othello engine and baselines take 10 hours, by November 29. Network and self-play training take 14 hours, through December 6. Experiments and ablations take 8 hours, by December 13. The final report takes 10 hours and is due December 18. If training is too slow, I will shrink the network and the simulations per move before changing the game.

\renewcommand{\refname}{8. References}
\bibliographystyle{acm}
\bibliography{citations}

\end{document}
```
### Reference file (citations.bib)
Create it as a new file in Overleaf named exactly `citations.bib`, because `main.tex` ends with `\bibliography{citations}`.
```bibtex
@article{silver2017mastering,
  author  = {David Silver and others},
  title   = {Mastering the Game of {Go} without Human Knowledge},
  journal = {Nature},
  volume  = {550},
  number  = {7676},
  pages   = {354--359},
  year    = {2017}
}

@article{silver2018general,
  author  = {David Silver and others},
  title   = {A General Reinforcement Learning Algorithm that Masters Chess, Shogi, and {Go} through Self-Play},
  journal = {Science},
  volume  = {362},
  pages   = {1140--1144},
  year    = {2018}
}

@inproceedings{kocsis2006bandit,
  author    = {Levente Kocsis and Csaba Szepesv{\'a}ri},
  title     = {Bandit Based {Monte-Carlo} Planning},
  booktitle = {Machine Learning: {ECML} 2006},
  publisher = {Springer},
  pages     = {282--293},
  year      = {2006}
}

@article{browne2012survey,
  author  = {Cameron B. Browne and others},
  title   = {A Survey of {Monte Carlo} Tree Search Methods},
  journal = {{IEEE} Transactions on Computational Intelligence and {AI} in Games},
  volume  = {4},
  number  = {1},
  pages   = {1--43},
  year    = {2012}
}
```
### Overleaf steps
1. On overleaf.com choose **New Project**, then **Blank Project**, and name it `Writing 3 - Othello Proposal`.
2. Open `main.tex`, press `Ctrl+A`, `Delete`, and paste the `main.tex` block.
3. Add a **New File** named `citations.bib` and paste the `.bib` block.
4. Under **Menu**, set the compiler to `pdfLaTeX` and the main document to `main.tex`.
5. Click **Recompile**. If the PDF shows `[?]`, use **Recompile from scratch** once.
6. Check the PDF against the pre-submit list, then download it and upload it on Canvas.
### Checks run in this vault (no LaTeX engine used)
A script read both blocks on 2026-11-16 using the course environment's Python. This is a lint, not a compile.
- Passed: every `\cite` key is in the `.bib` and every `.bib` key is cited; braces balance in both files; `\begin` and `\end` match; `\makeatletter` is paired; no dash characters and plain ASCII only; no bare `%`, `&`, `_` or `#` in the prose; no citation after a sentence period (`et al.~\cite` keeps the abbreviation spacing); `acm` style and `citations` present.
- *Word count:* 694 words of prose, which excludes the footnote (35 words), headings, citations and references. Per section: Team Members 17, Problem 172, Approach 148, Software 72, Preliminary Work 83, Evaluation 119, Time Frame 84. The target is 600 to 700.
- *Not checked:* page count, header and layout, and BibTeX warnings. These need a real compile in Overleaf. With the Writing 2 preamble I expect about two pages, which is an estimate.
### Pre-submit checks
- [ ] The Canvas due date and time are confirmed, and the PDF is uploaded before them.
- [ ] Header on every page, with `Writing #3: Project Proposal` on the left and `Anant Gupta` on the right.
- [ ] Headings read `1. Team Members` through `7. Time Frame`, then `8. References`.
- [ ] References lists four numbered entries, and no `[?]` appears.
- [ ] The Logs panel shows no `Citation ... undefined` and no `Undefined control sequence`.
- [ ] The AI-use footnote matches what really happened. Edit it if you did more or less than it says.
- [ ] Every sentence is something I can defend. Re-read the Preliminary Work numbers against the PS3 note.
### Open items and risks
- The Writing 3 due date is not known. The `Time Frame` dates assume it is due before Nov 25.
- No Othello code exists. The proposal says so. If a first alpha-beta versus random run is built before submitting, add it to Preliminary Work with the real numbers and keep the code.
- The plan has no slack around Thanksgiving (Nov 26 to 27) or Long Quiz 3 (Dec 9). The backup in the draft is to shrink the network and the simulations per move.
- PyTorch is not in the course environment. The GPU is an RTX 5070 Ti laptop part, so check that the chosen PyTorch build supports it before the training week.
- Plain Python MCTS with a network can be slow. Measure simulations per second early.
- The preliminary numbers come from my PS3 note, and I did not re-run them. PS3 forbade collaboration, and these are my own results. Whether the course wants the PS3 code reused in the project is not stated.
- Writing 4 needs 6 to 8 papers. These four are the start. Add papers on Othello evaluation and on AlphaZero-style training in small games.
- A Short Quiz 10 note was written into this file by another session at 18:58 on 2026-11-16 and was moved to [[20_Progress/Degree/CSCI 4511W/Assignments/Written/Short Quiz - 10|Short Quiz - 10]] (checked byte for byte before the move). The quiz note's own next step is still open.
## Concepts used
- **Evaluation functions and depth cutoff** (Lecture 12, textbook §5.3, [[20_Progress/Degree/CSCI 4511W/Concepts/Concept - Informed Search|Concept - Informed Search]]): the whole proposal is about replacing a hand-built estimate of a position's value with a learned one.
- **Alpha-beta search** (Lectures 11 and 12): the baseline family, run to a fixed depth with each hand-crafted evaluation.
- **Monte Carlo tree search and UCB1** (Lecture 12, Discussion 9): the plain MCTS baseline, and the search that the network will guide.
- **Writing a proposal in the discussion frame** (Discussions 7 and 8): problem, method with baseline, evaluation, plan with a backup.
## Post-submit reflection
<!-- Optional until feedback: the first failure, the pattern, and what to change. -->
