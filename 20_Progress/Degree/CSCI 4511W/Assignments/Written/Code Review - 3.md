---
type: class
class_kind: homework
status: sprout
created: 2026-11-19
updated: 2026-11-19
tags:
  - class
  - homework
area:
  - "[[CSCI 4511W Board]]"
next: "Say the one-minute script and the Questions to expect out loud once, run problem_1c, problem_1d and problem_2b from the vault copy, and confirm the real review date with the TA."
---
# Code Review - 3
## Overview
This is the script for the TA code review of [[20_Progress/Degree/CSCI 4511W/Assignments/Written/Problem Set - 3|Problem Set - 3]]: a 10-minute slot where a TA asks me to explain [[20_Progress/Degree/CSCI 4511W/Assignments/Code/ps3.py|ps3.py]], the code I submitted. ==The TA is checking that I understand my own code, so every answer here is meant to be said in my own words with the file open, not read aloud.== The prompt, the writeup answers and the test table stay in the Problem Set note; this note only explains the code.
## Requirements
Sources: the Board's Problem Sets section, `ps3.pdf` page 1 ("For the code, modify the provided ps3.py and submit that"), the email thread with Professor Exley (Nov 12 and Nov 15), and the git history of `ps3.py`.
### Must demonstrate
- [ ] Explain each function I wrote and why it is written that way, in about 10 minutes. The booked slots were 10 minutes: Nov 10, 5:00 to 5:10 pm, and the rescheduled Tue Nov 17, 4:30 to 4:40 pm.
- [ ] Run `problem_1c`, `problem_1d` and `problem_2b` if asked, and say what each returned.
- [ ] Say which parts came with the starter and which are mine (table under "The file in one minute").
### Must have ready
- [ ] The TA can see the file. Professor Exley asked on Nov 15 for the code by email so he could pass it to the TA. Whether to also upload it to Gradescope is an open question; no answer is recorded.
- [ ] Proof the file has not changed since the due date. Git shows `ps3.py` last modified 2026-11-06 22:52 (-0600) and last committed 2026-11-06 23:03. The sources give the due date (Fri Nov 6, Lecture 16 slide 2) but no time of day, so the Gradescope deadline time still needs checking.
- [ ] Run the vault copy, not `Code\Homework\ps3.py` in the course folder. That one is the starter, and every problem function in it returns `(0, 0)`.
### Rules
- The Board says a coding review must happen within 10 days of the due date, which is Nov 16 for a Nov 6 due date. The Nov 10 slot was inside the window and the Nov 17 slot is one day past it. Professor Exley's Nov 15 reply says he will talk to the TA; it does not mention the window.
- The PDF's collaboration policy is individual work, no looking for answers online, no posting. No separate AI-tool rule is stated. The review exists to test ownership, so rehearse from the code, not from this note's wording.
## Work log
==`ps3.py` is the professor's 84-line starter with a Connect 4 agent, a Gomoku agent and three match functions added.==
### Review logistics
- Nov 10, 5:00 to 5:10 pm: first slot with TA Banu Arunachalam. The Gradescope upload held the starter file instead of my code, so there was nothing to review, even though Gradescope showed a green submission.
- Nov 12: I wrote to Professor Exley asking to reopen the submission. Nov 15: he asked me to email the code and name the TA.
- The rescheduled review was Tue Nov 17, 4:30 to 4:40 pm. Today is Nov 19 and no completed review is recorded here, so confirm the real date and update this block.
### The file in one minute
Say this first: "ps3.py is the professor's starter plus my code. The starter gave me a silly Connect 4 evaluation, a depth-2 alpha-beta player that uses it, and the functions that start the games for 1a, 1b and 2a. I wrote a real Connect 4 evaluation and the code that plays it against a random agent and against MCTS (Problem 1), and a better Gomoku player built on Monte Carlo tree search (Problem 2). `problem_1c`, `problem_1d` and `problem_2b` play matches and return `(n_x, n_o)`, the number of games my agent won as X and as O."
The starter's `c4_good_eval`, `better_gomoku_player` and three problem functions were stubs (`return 0`, `(0, 0)` or nothing). My only changes outside those are two imports: `random`, and `MCT_Node` with `ucb` from `aima.utils`.

| Lines | Name | Origin | Job |
|---|---|---|---|
| 8 to 23 | `c4_silly_eval` | starter | Adds fixed square weights, no idea of lines or wins |
| 27 to 37 | `c4_make_windows` | mine | Lists the 69 four-square windows of the board |
| 39 to 43 | `C4_*` constants | mine | Window list, weights, parity bonus, scale, near-win value |
| 45 to 47 | `c4_playable` | mine | True if a stone can be dropped on that square now |
| 49 to 95 | `c4_good_eval` | mine | The 1c evaluation, from X's point of view |
| 97 to 99 | `c4_good_eval_o` | mine | Same evaluation, sign flipped, for O |
| 101 to 102 | `ab_cutoff_player` | starter | Depth-2 alpha-beta with the silly eval (1b opponent) |
| 104 to 112 | `c4_make_player` | mine | Builds an alpha-beta cutoff player that works as X or O |
| 114 to 121 | `play_match` | mine | Plays one game, says whether my agent won |
| 125 to 159 | `gomoku_line_length`, `gomoku_candidates`, `gomoku_forced_move` | mine | Line length through a square, squares worth searching, win-or-block move |
| 161 to 174 | `gomoku_playout` | mine | One biased random playout |
| 176 to 218 | `better_gomoku_player` | mine | The 2b MCTS player |
| 220 to 274 | `PS3` | mixed | `problem_1a`, `1b`, `2a` are starter; `1c`, `1d`, `2b` are mine |
| 278 to 296 | `main` | starter | Unchanged, plays Tic-Tac-Toe |
### What the library does for me
- *Board:* Connect 4 is 7 rows by 6 columns, squares are `(row, col)`, row 7 is the bottom. `state.board` maps squares to `'X'` or `'O'`, `state.to_move` is the side to move, and `state.utility` is +1 if X has won, -1 if O has won, 0 otherwise. Gomoku is 15 by 16 with five in a row. `play_game` returns the utility for X.
- *`alpha_beta_cutoff_search(state, game, d, eval_fn)`:* the professor's. It calls `eval_fn` when the depth passes `d` or the state is terminal, so at a finished game it uses my eval, not `utility`, and a win has to score highest. The root's children are depth 1, so with `d=4` states are evaluated 5 plies down (read from `games.py` lines 137 to 167, not stated in the lecture). It always maximizes at the root, so the eval must be good for whoever is moving.
- *`monte_carlo_tree_search`:* the professor's MCTS, 1000 iterations by default: select a leaf by `ucb`, expand it, simulate a random game, back-propagate, then return the most-visited child. `ucb` scores an unvisited node as infinity. `mcts_player`, `random_player` and `query_player` all have the signature `(game, state)`.
### Problem 1: the Connect 4 agent
#### `c4_good_eval` in order
1. **Finished game.** If `state.utility != 0`, return it: +1 if X connected four, -1 if O did.
2. **Windows.** For every one of the 69 windows count the X and O stones. A window holding stones of only one player is alive for that player and adds 1, 4 or 16 for 1, 2 or 3 stones (`C4_WEIGHTS`), positive for X and negative for O. A window holding both colors counts for nothing, because neither side can still complete it.
3. **Threats.** A live window with 3 stones has one empty square, and that square is recorded as a threat for its owner.
4. **Near-win rule.** A threat counts as playable if a stone can be dropped there now (`c4_playable`). If the side to move has a playable threat, it wins next ply, so return 0.9 for that side. If the other side has two playable threats, the mover can block only one, so return 0.9 for the other side.
5. **Parity.** Add 10 for each X threat on an even row and subtract 10 for each O threat on an odd row. The board has 7 rows, so if the other columns fill up first, X ends up playing the even heights of the last column and O the odd ones, and a threat on the owner's parity tends to survive to the end.
6. **Scale.** Divide by `C4_SCALE` = $2 \times (69 \times 16 + 42 \times 10 + 1) = 3050$ so a heuristic score stays inside $(-1, 1)$.
#### Hand checks and constants
- X's only stone at `(7,3)` sits in 5 live windows (3 across, 1 up, 1 diagonal), so the score is 5 and the eval is 5/3050 = 0.0016. `c4_good_eval_o` gives -0.0016.
- X on `(7,1)`, `(6,1)`, `(5,1)` and O on `(7,2)`, `(6,2)`, O to move: 0.0082, because O can still block `(4,1)`. After O plays `(7,3)` and X is to move: 0.9.
- X with four in column 1: `c4_good_eval` returns 1, `c4_good_eval_o` returns -1, and `c4_silly_eval` returns about 0.

| Constant | Value | Why |
|---|---|---|
| `C4_WEIGHTS` | `[0, 1, 4, 16]` | A window one stone from four should count far more than one stone in it. Chosen, then checked; not derived. |
| `C4_PARITY` | 10 | Small next to a three-stone window (16), so it only breaks ties. |
| `C4_SCALE` | 3050 | Raw score can never reach 1524, so the scaled score stays under 0.5. |
| `C4_NEAR_WIN` | 0.9 | Above every heuristic score and below a real win (1), so the ordering is win, forced win, heuristic. |
#### Players and matches
- `c4_make_player(depth)` returns a function `player(game, state)` that picks `c4_good_eval` when X is to move and `c4_good_eval_o` when O is, then calls `alpha_beta_cutoff_search` with `d=depth`.
- `play_match(game, agent, opponent, agent_mark)` plays one game. As X it calls `play_game(agent, opponent)` and counts a win if the result is 1. As O it calls `play_game(opponent, agent)` and counts a win if the result is -1. A draw is not a win.
- `problem_1c`: depth 4 against `random_player`, two games as each mark. `problem_1d`: depth 2 then depth 3 against `mcts_player`, two games as each mark at each depth, so 4 as X and 4 as O.
#### 1b: why the silly agent loses
`c4_silly_eval` only adds square weights, so a won position scores about 0 and the depth-2 search sees no loss when I connect four. The agent is also deterministic. The scripted game I replayed: X (7,3), O (7,1), X (6,3), O (5,3), X (4,3), O (6,1), X (3,3), O (5,1), X (2,3), O (4,1), and O wins with four in column 1.
### Problem 2: the Gomoku agent
#### Why the stock MCTS fails (2a)
Gomoku has 240 squares, so the root has 240 children, and the first 240 of the 1000 iterations just visit each one once, leaving about 4 playouts per move. Each playout is random play to the end, about 114 plies (I measured 30 random games: 67 to 157), so the first move barely changes who wins and the estimates are noise. In my 8 trials the stock agent never blocked an open four and never finished its own.
#### Helpers
- `gomoku_line_length(board, move, player)`: for each of the four directions, counts `player` stones both ways from `move`, plus the stone itself, and returns the longest line. With `k = 5` a result of 5 or more means playing there makes five.
- `gomoku_candidates(game, state)`: empty squares touching a stone, sorted so runs repeat. On an empty board it returns the center `(8, 8)`. After one stone it returns 8 squares instead of 239.
- `gomoku_forced_move(game, state, candidates)`: the first candidate that wins for the side to move, else the first that blocks the other side's five, else `None`. Winning is checked first.
- `gomoku_playout(game, state, max_plies)`: plays the forced move if there is one, else a random candidate, until the game ends or `max_plies` is reached. Returns the utility for the player to move at the start, or 0 if cut short.
#### `better_gomoku_player` against the stock MCTS
Everything not in the table is the stock algorithm: select by `ucb`, expand, simulate, back-propagate, return the most-visited child. The simulation result is negated in the caller, `-gomoku_playout(...)`, because the playout returns the utility for the player to move at the new node, and the node's score belongs to the player who moved into it.

| Step | Stock MCTS | Mine | Why |
|---|---|---|---|
| Root | Always searches | Returns a forced win or block at once | No search needed when the move is forced |
| Children | Every empty square | Only squares touching a stone (forward pruning) | 8 children instead of 239 after one stone |
| Playout moves | Uniform random over all squares | Win, else block, else random next to a stone | Playouts stop ignoring fives (a playout policy) |
| Playout length | To the end of the game | At most 20 plies, then counted as a draw | Keeps a game under a minute (early playout termination) |
| Iterations | 1000 | 200 | Time budget |
### Questions to expect
1. **Why does the eval return `state.utility` before anything else?**
	The library calls `eval_fn` on finished games instead of `utility`, so a won position has to score exactly +1 or -1. Lecture 12 slide 4 says the same: on terminal states `Eval(s, p) = Utility(s, p)`.
2. **Why 1, 4 and 16?**
	Each extra stone makes a window much closer to a four, so the weight grows by a factor of 4. I picked it, I did not derive it. I tried other weights, a bigger parity bonus and a rule that a lone parity threat decides the game, and none changed the win rate beyond noise.
3. **Why do you need `c4_good_eval_o`?**
	The search always maximizes at the root and the eval takes no player argument. `c4_good_eval` is written from X's side, so O's agent maximizes its negative.
4. **What does the 0.9 solve?**
	The horizon effect (Lecture 12 slides 9 to 13): at the cutoff a position can look quiet while the side to move wins next ply. The rule looks one ply past the cutoff for a playable threat. It is close in spirit to quiescence (slide 8), which is my reading and not something the lecture says about this code.
5. **Is the parity term doing anything?**
	I can explain the counting argument, but I cannot show it helps: it did not move the win rate in my tests, so dropping it would probably change nothing.
6. **How do you know the eval works?**
	Hand checks on small positions (the 5/3050 example), 100 of 100 wins as X and 100 of 100 as O against the random agent at depth 4, and `problem_1c` returning `(2, 2)` in under a second.
7. **Why doesn't `problem_1d` always return `(4, 4)`?**
	The MCTS opponent plays random playouts, so its moves change from run to run. Against it I won about 65 to 77 of 100 games per mark in 100-game runs, so `(3, 3)` or `(4, 3)` is typical. The run I did today returned `(1, 4)`.
8. **What is forward pruning here, and what does it cost?**
	Only squares next to a stone become children, so far-away squares are never searched. The cost is that a good move away from every stone is never considered, which rarely matters in Gomoku.
9. **Why do playouts stop at 20 plies?**
	A full random game takes about 114 plies, which would blow the one-minute limit. The cost is that most truncated playouts say nothing: from a position with two stones, only 20% of 300 twenty-ply playouts ended in a win or loss, against 100% at 200 plies.
10. **Why is `U` only increased when the utility is positive, and why the sign flip in `backprop`?**
	`U` counts wins for the player who moved into that node, and `N` counts visits, so `U/N` is that player's win rate. The parent was reached by the other player, so a win for one is a loss for the other and the utility flips sign at each level. Draws and losses add 0 to `U` but still add 1 to `N`.
11. **Why return the most-visited child and not the best win rate?**
	Lecture 12 slide 36: UCB keeps exploring what is good for us, so the most-visited move is the best one. A child with one visit and one win has a 100% rate on almost no evidence.
12. **Why win before block in `gomoku_forced_move`?**
	If I can make five now, the game is over, so blocking first would throw the win away.
13. **Why 200 iterations?**
	The PDF requires each game under a minute. 200 keeps the four games in `problem_2b` at 10 to 25 seconds in total. I did not tune it beyond that.
### Weak spots to admit
- `gomoku_forced_move` only sees a five, not an open three or an open four. With four in a row open at both ends it blocks one end and loses. I checked this on a board with an X four across row 8: it blocks `(8, 2)` and `(8, 7)` stays open.
- Most 20-ply playouts are draws early in the game, so the tree search adds little there. The agent beats random mostly through the root win-or-block check and the pruning. I only tested it against a random agent, as the PDF asks, and I expect it to lose to a competent player (inferred, not tested).
- The 1c weights and the parity bonus were chosen, not derived, and the parity bonus has no measured effect.
- `problem_1d` is not guaranteed to return `(4, 4)`.
### Run it live
From the course `Code` folder, import the vault copy so `aima-python` resolves and no `__pycache__` is written:
```powershell
cd "D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4511W\Code"
.\.venv\Scripts\python.exe -B -c "import sys; sys.path.insert(0, r'D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4511W\Assignments\Code'); import ps3; print(ps3.PS3().problem_1c())"
```
Swap `problem_1c` for `problem_1d` or `problem_2b`. Each game prints its final board before the tuple. Timings on Python 3.12.14 today: `problem_1c` returned `(2, 2)` in 0.8 s, `problem_1d` returned `(1, 4)` in 8.7 s, `problem_2b` returned `(2, 2)` in 9.9 s. Running `ps3.py` itself starts the interactive Tic-Tac-Toe game for 1a; moves are typed as `(row, col)`. To show 1b, uncomment `ps3.problem_1b()` in `main`.
### Review record
Not completed as far as this note knows. No TA feedback, grade or credit is recorded.
## Concepts used
- Lectures 11 to 13 are the source: alpha-beta (L11 slides 28 to 32), weighted linear evaluation and normalizing to $[-1, 1]$ (L11 slide 34, L12 slides 4 and 5), cutoff, quiescence and the horizon effect (L12 slides 7 to 13), MCTS and the playout policy (L12 slides 15 to 20), and UCB1 (L12 slide 35). [[20_Progress/Degree/CSCI 4511W/Weekly/Week - 7|Week - 7]] has no live capture for them, so the slides are the source. [[20_Progress/Degree/CSCI 4511W/Weekly/Week - 8|Week - 8]] covers the Lecture 14 wrap-up.
- Alpha-beta cutoff search: a depth limit needs an eval, and the library uses that eval on finished games too.
- Weighted linear evaluation function: the features are counts of live windows holding 1, 2 or 3 stones, the weights are 1, 4 and 16, and the result is scaled into $(-1, 1)$. The threat rule and the finished-game return make the whole function piecewise, not purely linear.
- Horizon effect: the 0.9 rule is a one-ply lookahead past the cutoff.
- Monte Carlo tree search with $\text{UCB1}(n) = \frac{U(n)}{N(n)} + C\sqrt{\frac{\ln N(\text{parent}(n))}{N(n)}}$ and $C = 1.4$ in `ucb`: forward pruning, a biased playout policy and early playout termination. The textbook sections and page references are in [[20_Progress/Degree/CSCI 4511W/Assignments/Written/Problem Set - 3|Problem Set - 3]].
- Problem 3 (pruning in an expectimax tree) is written only, so the code review does not cover it.
## Post-submit reflection
Empty until the review happens.
