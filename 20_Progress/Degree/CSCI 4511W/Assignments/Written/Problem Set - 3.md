---
type: class
class_kind: homework
status: sprout
created: 2026-11-06
updated: 2026-11-06
tags:
  - class
  - homework
area:
  - "[[CSCI 4511W Board]]"
next: "Put the writeup answers for 1a, 1b, 1c, 2a, 3a, 3b into one PDF (typed is fine, see Requirements); read through the code once so you can explain it in the TA code review; submit ps3.py and the writeup; book the code review within 10 days of the due date."
---
# Problem Set - 3
## Overview
Problem Set 3 covers adversarial search: Tic-Tac-Toe and Connect 4 with minimax, alpha-beta and an evaluation function (Problem 1), Monte Carlo tree search on Gomoku (Problem 2), and pruning in an expectimax tree (Problem 3). The code part is the modified [[20_Progress/Degree/CSCI 4511W/Assignments/Code/ps3.py|ps3.py]], and the written part is Problems 1a to 1c, 2a, 3a and 3b below. The PDF is dated October 28, 2026 and gives no due date or upload location, so the due date is not verified. The Board says a TA code review for the coding part must happen within 10 days of the due date.
## Requirements
Source: `HW & Exams/HW/ps3.pdf`, both pages, in the course folder `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4511W`.
### Must submit
- [ ] `ps3.py`, the professor's file with the code below filled in (the PDF says to modify the provided ps3.py and submit that).
- [ ] A writeup with the answers to 1a, 1b, 1c (12 points for Problem 1, 1d is code only), 2a (12 points for Problem 2) and 3a, 3b (8 points). Format: the PS3 PDF only says "writeup". The one explicit rule in the course files is in `ps1.pdf`: submit written answers "as a pdf", "any method", "it does not need to be Latex", and handwriting can lose points only if it cannot be read. So a typed PDF is allowed and handwriting is not required. The Board says problem sets are "submitted individually online" (Gradescope), and Lecture 02 has no format rule. Confirm with course staff if you want PS3 confirmed in writing.
- [ ] `c4_good_eval` written, and `problem_1c` returning `(n_x, n_o)` from 2 games as X and 2 games as O against the random agent, alpha-beta cutoff depth 4.
- [ ] `problem_1d` returning `(n_x, n_o)` from 8 games against the MCTS agent: 4 as X and 4 as O, four games at depth limit 2 and four at depth limit 3.
- [ ] `better_gomoku_player` written, and `problem_2b` returning `(n_x, n_o)` from 4 games against a random agent: 2 as X and 2 as O, each game under one minute.
### Must demonstrate
- [ ] 1a: 4 to 5 sentences. 1b: 3 to 4 sentences for the plan and 2 to 3 sentences for why it works. 1c: 2 to 3 sentences describing the eval and 2 to 3 sentences on why it should do well. 2a: 2 to 3 sentences.
### Must not do
- Do not collaborate, look for answers online, or post the problems or solutions anywhere (PDF collaboration policy). Office hours are encouraged.
- The PDF states no separate AI-tool rule. This draft was built only from the course folder, and you still have to understand it before you submit it as your own.
## Work log
### Writeup answers
Short on purpose, in the sentence counts the PDF asks for. Moves are `(row, column)`; the Connect 4 board has 7 rows and 6 columns, row 7 is the bottom, and the agent is X and moves first.
#### 1a
Minimax only compares win, draw and loss, and with perfect play every first move is a draw, so all nine squares have value 0. The center is better only against a weak opponent, and the agent assumes the opponent never errs. `alpha_beta_search` replaces its best move only when `v > best_score`, so a tie keeps the first move in the list. That move is `(1, 1)`, the corner, so the agent plays it by list order, not because it is better.
#### 1b
Plan: I play O, and the agent opens in column 3 and keeps stacking it. I play `(7,1)`, then block its stack with `(5,3)` once it has two discs there. Then I play `(6,1)`, `(5,1)`, `(4,1)` for four in column 1, and the agent never blocks.

Why it works: the search calls the eval on finished games, and `c4_silly_eval` only adds square weights, so it scores my four in a column as about 0 and sees no threat or loss. The agent is deterministic, so the same moves always get the same replies.
#### 1c
`c4_good_eval` is a weighted sum over the 69 windows of four squares: a window holding only one player's stones is worth 1, 4 or 16 to that player for 1, 2 or 3 stones. A finished game returns its utility, a threat that can be played at once returns 0.9, and the score is scaled into (-1, 1). A threat on the row that player gets at the end of the game earns a small bonus.

Every window is a way to still make four, so the score tracks winning chances and favors the center. Unlike the silly eval it recognizes wins and playable threats at the cutoff, and it won 100 of 100 games as X and 100 of 100 as O against the random agent.
#### 2a
Gomoku has 240 squares, so the root gets 240 children and `ucb` is infinite for an unvisited child, which leaves only about 4 playouts per move (1000 / 240). Each `simulate` playout is `random.choice` play of about 108 plies, so its winner barely depends on the first move. The estimates are noise: in my test the agent failed to block an open four 8 of 8 times.
#### 3a
No. Without an upper bound, an unseen child of a chance node can be arbitrarily large, so no partial average bounds the node, and pruning needs such a bound. Example: the root max node has chance nodes A (leaves 5 and 5, so A = 5) and B (probabilities 1/2 and 1/2, first leaf 0, second leaf x unseen). B = x/2 is 50 if x = 100 but 0 if x = 0, so x must be read.
#### 3b
Yes. With leaves in [0, 1], a chance node with seen children (p_i, v_i) is at most the sum of p_i v_i plus (1 minus the sum of p_i), so it can be cut once that bound is no better than the best sibling. Example: A has leaves 0.8 and 0.6 (probability 1/2 each), so A = 0.7; B's first leaf is 0.2, so B is at most 0.5(0.2) + 0.5(1) = 0.6, below 0.7, and B's second leaf is pruned.
### Coding reasoning
Everything is in [[20_Progress/Degree/CSCI 4511W/Assignments/Code/ps3.py|ps3.py]]. The professor's starter is kept as given (`c4_silly_eval`, `ab_cutoff_player`, `problem_1a`, `problem_1b`, `problem_2a`, `main`); two import lines were added (`random`, and `MCT_Node` and `ucb` from `aima.utils`). New code uses the style of the CSCI 4041 lecture notebooks: small functions, a one-line docstring on each, and a short comment beside any line that needs one.

| Part | What was written | How it works |
|---|---|---|
| 1c eval | `c4_make_windows`, `c4_playable`, `c4_good_eval`, `c4_good_eval_o` | Weighted linear eval from X's side; `c4_good_eval_o` flips the sign for O. `alpha_beta_cutoff_search` takes an eval with no player argument, and it always maximizes at the root, so each player needs its own sign. |
| 1c, 1d | `c4_make_player(depth)`, `play_match` | `c4_make_player` picks the eval for whichever player is to move and calls the professor's `alpha_beta_cutoff_search` with `d=depth`. `play_match` plays one game and says whether the agent won. |
| 2b | `gomoku_candidates`, `gomoku_line_length`, `gomoku_forced_move`, `gomoku_playout`, `better_gomoku_player` | The four steps of `monte_carlo_tree_search` in `games.py`, with three changes (below). |

Why the eval returns the utility for a finished game and uses a 0.9 value for a playable threat: the library calls `eval_fn` on terminal states in place of `utility`, and a win must score highest. The threat rule fixes the horizon effect from Lecture 12, because at the cutoff the side to move can finish four one ply later or the other side holds two playable threats that cannot both be blocked. The parity bonus comes from counting squares: the board has 42 squares and each column has 7 rows, so when one column is left X gets the even heights and O the odd ones.

Changes to MCTS for Gomoku, each one answering a cause from 2a: only empty squares next to a stone become children (forward pruning, textbook §5.3.3, so the root has far fewer than 240 children); a playout plays a winning move if it has one, otherwise blocks, otherwise picks randomly next to a stone (a playout policy, Lecture 12 slide 15), and stops after 20 plies and counts as a draw (early playout termination, textbook p. 331); and a win or block at the root is played at once. It runs 200 iterations per move, which keeps a game around 3 seconds.
### Verification
All runs used Python 3.12.14 with the course `aima-python`, from the course `Code` folder as `sys.path.append('aima-python')` expects. Nothing was fetched online.

| Check | Result |
|---|---|
| 1a: minimax value of each of the 9 first moves; `alpha_beta_player` first move | all 0; plays `(1, 1)` |
| 1b: scripted O moves above against `ab_cutoff_player` | O wins in 5 moves, 3 of 3 replays |
| 1c: depth 4 against random, 100 games each as X and O | 100 of 100 and 100 of 100 |
| 1d: depth 2 against `mcts_player`, 100 games each | as X 65 of 100, as O 76 of 100 |
| 1d: depth 3 against `mcts_player`, 100 games each | as X 76 of 100, as O 77 of 100 |
| 2b: `better_gomoku_player` against random, 60 games each | 60 of 60 as X and 60 of 60 as O; slowest game 10.5 s |
| 2a: stock MCTS on a board with an open four, 8 tries each | blocked 0 of 8, completed its own four 0 of 8 |
| `PS3.problem_1c()`, `problem_1d()`, `problem_2b()` as written | `(2, 2)` in 0.8 s, `(3, 3)` in 10.8 s, `(2, 2)` in 24.4 s |

`problem_1d` plays against the MCTS agent, which is random, so its result changes from run to run. A win rate near 75% means most runs return a pair like `(3, 3)` or `(4, 3)`, and `(4, 4)` is not guaranteed. I tried other weights, a bigger parity bonus, and a rule that a lone parity threat decides the game, and none of them moved the win rate beyond noise, so the one above is kept.
### Running it
`ps3.py` starts with `sys.path.append('aima-python')`, and the library sits in the course folder `Code\aima-python`. Run the file with that `Code` folder as the working directory and NumPy available (the starter in `Code\Homework` is meant to be run the same way). The original starter in the course folder was left untouched. `main()` is unchanged and only plays Tic-Tac-Toe interactively.
### Submission
Not submitted. No receipt, grade or code review is recorded.
## Concepts used
- [[20_Progress/Degree/CSCI 4511W/Weekly/Week - 8|Week - 8]] holds the Lecture 14 notes on the adversarial search wrap-up, forward pruning and the limits of game search. Lectures 11 to 13 (minimax, alpha-beta, cutoff and eval, MCTS, expectiminimax) and textbook Chapter 5 have no vault note yet.
- Minimax and alpha-beta (Lecture 11, textbook §5.2): the tie rule in 1a and the cutoff behavior in 1b both come from `alpha_beta_search` and `alpha_beta_cutoff_search` in `games.py`.
- Evaluation functions and cutoff (Lecture 12, textbook §5.3): the weighted linear eval and the horizon fix in 1c. [[20_Progress/Degree/CSCI 4511W/Concepts/Concept - Informed Search|Concept - Informed Search]] covers the heuristic idea that an eval function reuses.
- Monte Carlo tree search (Lecture 12, textbook §5.4): selection by UCB1, expansion, simulation, back-propagation and the playout policy, in 2a and 2b.
- Expectiminimax and pruning with bounds (Lectures 12 and 13, textbook §5.5, p. 337): Problem 3.
## Post-submit reflection
Empty until feedback exists.
