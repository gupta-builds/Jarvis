import sys
sys.path.append('aima-python')
from aima.games import *
import math
import random
from aima.utils import MCT_Node, ucb

def c4_silly_eval(state):
    '''Example of a silly evaluation function.
    What is it doing?
    '''
    ev = 0
    col_scores = [0, 0.01, 0.02, 0.03, 0.03, 0.02, 0.01]
    row_scores = [0, 0.03, 0.03, 0.02, 0.02, 0.02, 0.02, 0.01]
    for col in range(1,7):
        for row in range(1,8):
            if state.board.get((row,col)) == 'X':
                ev += col_scores[col]
                ev += row_scores[row]
            elif state.board.get((row, col)) == 'O':
                ev -= col_scores[col]
                ev -= row_scores[row]
    return ev

################################################################## Problem 1: Connect 4

def c4_make_windows(rows=7, cols=6, k=4):
    """lists every window, a group of k squares in a line, that can hold a connect-k"""
    windows = []
    for x in range(1, rows + 1):
        for y in range(1, cols + 1):
            for (dx, dy) in [(0, 1), (1, 0), (1, 1), (1, -1)]:   # across, down, and both diagonals
                end_x = x + (k - 1) * dx                         # square where the window ends
                end_y = y + (k - 1) * dy
                if 1 <= end_x <= rows and 1 <= end_y <= cols:    # keep windows that fit on the board
                    windows.append([(x + i * dx, y + i * dy) for i in range(k)])
    return windows

C4_WINDOWS = c4_make_windows()           # the 69 windows of the 7 x 6 board, built once
C4_WEIGHTS = [0, 1, 4, 16]               # weight of a window holding 0, 1, 2 or 3 stones of one player
C4_PARITY = 10                           # bonus for a threat on the row its owner gets in the endgame
C4_SCALE = 2 * (len(C4_WINDOWS) * C4_WEIGHTS[3] + 42 * C4_PARITY + 1)   # keeps a heuristic score well inside (-1, 1)
C4_NEAR_WIN = 0.9                        # value of a position that is a win by force one ply past the cutoff

def c4_playable(state, square):
    """True if a stone can be dropped on the empty square right now"""
    return square[0] == 7 or (square[0] + 1, square[1]) in state.board   # bottom row, or a stone below

def c4_good_eval(state):
    """evaluates a Connect 4 state from the point of view of X (positive is good for X)

    weighted linear function: each window that holds stones of only one player counts
    for that player, and more stones in the window count for more (1c)
    """
    if state.utility != 0:               # somebody already connected four, eval must equal the utility
        return state.utility             # +1 if X won, -1 if O won

    score = 0
    threats = {'X': set(), 'O': set()}   # empty squares that would finish four for each player
    for window in C4_WINDOWS:
        marks = [state.board.get(square) for square in window]
        n_x = marks.count('X')           # features: how many stones each player has in this window
        n_o = marks.count('O')
        if n_o == 0:                     # only X can still use this window
            score += C4_WEIGHTS[n_x]
            if n_x == 3:
                threats['X'].add(window[marks.index(None)])
        elif n_x == 0:                   # only O can still use this window
            score -= C4_WEIGHTS[n_o]
            if n_o == 3:
                threats['O'].add(window[marks.index(None)])

    # a threat that can be played right now decides the game one ply past the cutoff
    now_x = [s for s in threats['X'] if c4_playable(state, s)]
    now_o = [s for s in threats['O'] if c4_playable(state, s)]
    if state.to_move == 'X':
        if now_x:                        # X to move and can finish four
            return C4_NEAR_WIN
        if len(now_o) >= 2:              # X can only block one of them
            return -C4_NEAR_WIN
    else:
        if now_o:
            return -C4_NEAR_WIN
        if len(now_x) >= 2:
            return C4_NEAR_WIN

    # parity: the board has 7 rows, so when the columns fill up X gets the even heights (even row numbers
    # here, since row 7 is the bottom) and O gets the odd ones; a threat on your own parity is worth more
    for square in threats['X']:
        if square[0] % 2 == 0:
            score += C4_PARITY
    for square in threats['O']:
        if square[0] % 2 == 1:
            score -= C4_PARITY
    return score / C4_SCALE              # normalize into (-1, 1)

def c4_good_eval_o(state):
    """the same evaluation seen from the point of view of O (positive is good for O)"""
    return -c4_good_eval(state)

def ab_cutoff_player(game, state):
    return alpha_beta_cutoff_search(state, game, d=2, eval_fn=c4_silly_eval)

def c4_make_player(depth):
    """builds an alpha-beta cutoff player with c4_good_eval that works as X and as O"""
    def player(game, state):
        if game.to_move(state) == 'X':
            eval_fn = c4_good_eval       # X maximizes the evaluation as it is
        else:
            eval_fn = c4_good_eval_o     # O maximizes the flipped evaluation
        return alpha_beta_cutoff_search(state, game, d=depth, eval_fn=eval_fn)
    return player

def play_match(game, agent, opponent, agent_mark):
    """plays one game and returns True if agent, playing agent_mark, wins"""
    if agent_mark == 'X':
        result = game.play_game(agent, opponent)     # play_game returns the utility for X
        return result == 1
    else:
        result = game.play_game(opponent, agent)
        return result == -1

################################################################## Problem 2: Gomoku

def gomoku_line_length(board, move, player):
    """length of the longest line of player stones through move, counting move itself"""
    longest = 1
    for (dx, dy) in [(0, 1), (1, 0), (1, 1), (1, -1)]:   # the four line directions
        length = 1                                       # the stone at move
        for sign in [1, -1]:                             # walk both ways along the line
            x, y = move[0] + sign * dx, move[1] + sign * dy
            while board.get((x, y)) == player:
                length += 1
                x, y = x + sign * dx, y + sign * dy
        longest = max(longest, length)
    return longest

def gomoku_candidates(game, state):
    """empty squares next to a stone, all far away squares are forward-pruned"""
    if not state.board:                                  # empty board: start in the middle
        return [((game.h + 1) // 2, (game.v + 1) // 2)]
    squares = set()
    for (x, y) in state.board:
        for dx in [-1, 0, 1]:
            for dy in [-1, 0, 1]:
                square = (x + dx, y + dy)
                if 1 <= square[0] <= game.h and 1 <= square[1] <= game.v and square not in state.board:
                    squares.add(square)
    return sorted(squares)                               # sorted so the search is repeatable

def gomoku_forced_move(game, state, candidates):
    """a square that wins right now, else a square that stops an opponent win, else None"""
    me = state.to_move
    opponent = 'O' if me == 'X' else 'X'
    for player in [me, opponent]:                        # winning comes before blocking
        for square in candidates:
            if gomoku_line_length(state.board, square, player) >= game.k:
                return square
    return None

def gomoku_playout(game, state, max_plies):
    """plays a biased random game from state and returns the utility for the player to move"""
    player = game.to_move(state)
    plies = 0
    while not game.terminal_test(state) and plies < max_plies:
        candidates = gomoku_candidates(game, state)
        move = gomoku_forced_move(game, state, candidates)   # playout policy: win, block,
        if move is None:
            move = random.choice(candidates)                 # otherwise random next to a stone
        state = game.result(state, move)
        plies += 1
    if game.terminal_test(state):
        return game.utility(state, player)
    return 0                                             # playout cut short, count it as a draw

def better_gomoku_player(game, state, iterations=200, max_plies=20):
    """Monte Carlo tree search with forward pruning and a biased playout policy (2b)

    Same four steps as monte_carlo_tree_search in games.py, with three changes:
    only squares next to a stone are children, playouts win or block when they can
    and stop after max_plies, and a win or block at the root is played immediately.
    """
    candidates = gomoku_candidates(game, state)
    forced = gomoku_forced_move(game, state, candidates)
    if forced is not None:                               # no need to search, the move is forced
        return forced

    def select(n):
        """select a leaf node in the tree"""
        if n.children:
            return select(max(n.children.keys(), key=ucb))
        else:
            return n

    def expand(n):
        """add the children of the leaf node, only next to a stone"""
        if not n.children and not game.terminal_test(n.state):
            n.children = {MCT_Node(state=game.result(n.state, move), parent=n): move
                          for move in gomoku_candidates(game, n.state)}
        return select(n)

    def backprop(n, utility):
        """pass the utility back to all parent nodes"""
        if utility > 0:
            n.U += utility
        n.N += 1
        if n.parent:
            backprop(n.parent, -utility)

    root = MCT_Node(state=state)
    for _ in range(iterations):
        leaf = select(root)
        child = expand(leaf)
        result = -gomoku_playout(game, child.state, max_plies)   # seen by the player who moved into child
        backprop(child, result)

    best = max(root.children, key=lambda c: c.N)         # most playouts, as in the lecture
    return root.children[best]

class PS3:
    def __init__(self):
        pass

    def problem_1a(self):
        tt = TicTacToe()
        tt.play_game(alpha_beta_player,query_player)

    def problem_1b(self):
        c4 = ConnectFour()
        c4.play_game(ab_cutoff_player, query_player)

    def problem_1c(self):
        """alpha-beta cutoff depth 4 with c4_good_eval against a random agent, twice as X and twice as O"""
        agent = c4_make_player(4)
        n_x = 0
        n_o = 0
        for i in range(2):
            if play_match(ConnectFour(), agent, random_player, 'X'):
                n_x += 1
        for i in range(2):
            if play_match(ConnectFour(), agent, random_player, 'O'):
                n_o += 1
        return n_x, n_o

    def problem_1d(self):
        """alpha-beta cutoff with c4_good_eval against MCTS, depth 2 then depth 3, two games as each mark"""
        n_x = 0
        n_o = 0
        for depth in [2, 3]:
            agent = c4_make_player(depth)
            for i in range(2):
                if play_match(ConnectFour(), agent, mcts_player, 'X'):
                    n_x += 1
            for i in range(2):
                if play_match(ConnectFour(), agent, mcts_player, 'O'):
                    n_o += 1
        return n_x, n_o

    def problem_2a(self):
        # play a sample game against the MCTS agent
        g = Gomoku()
        g.play_game(query_player, mcts_player)

    def problem_2b(self):
        """four games of better_gomoku_player against a random agent, twice as X and twice as O"""
        n_x = 0
        n_o = 0
        for i in range(2):
            if play_match(Gomoku(), better_gomoku_player, random_player, 'X'):
                n_x += 1
        for i in range(2):
            if play_match(Gomoku(), better_gomoku_player, random_player, 'O'):
                n_o += 1
        return n_x, n_o



def main():
    ps3 = PS3()
    # An example for you to follow to get you started on Games
    print('Example Problem, playing Tic Tac Toe:')
    print('=====================================')
    ps3.problem_1a()

    print('Example Problem, playing Connect 4 against my silly eval:')
    print('=======================================================')
    # uncomment to get it to run problem1b
    #ps3.problem_1b()

    print('Example Problem, playing Gomoku against mcts:')
    print('=======================================================')
    # uncomment to get it to run problem2a
    #ps3.problem_2a()

if __name__ == '__main__':
    main()
