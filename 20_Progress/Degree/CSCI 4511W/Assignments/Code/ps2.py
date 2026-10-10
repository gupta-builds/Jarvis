import sys
sys.path.append('aima-python')
from aima.search import *
import math

def mhd(node):
    '''Define your manhattan-distance heuristic for the 8-puzzle here
    '''
    goal = (1, 2, 3, 8, 0, 4, 7, 6, 5)
    distance = 0
    for index, tile in enumerate(node.state):
        if tile != 0:
            goal_index = goal.index(tile)
            distance += abs(index // 3 - goal_index // 3)
            distance += abs(index % 3 - goal_index % 3)
    return distance

class PS2:

    def __init__(self):
        pass

    def example_problem_1(self):
        '''Use the InstrumentedProblem class to track stats about a breadth-first
        search on the Romania Map problem.
        '''
        print("Su: Successor States created")
        print("Go: Number of Goal State checks")
        print("St: States created")
        print("   Su   Go   St")
        g = InstrumentedProblem(GraphProblem('Craiova', 'Zerind', romania_map))
        result = breadth_first_graph_search(g)
        print(g)
        g2 = InstrumentedProblem(GraphProblem('Craiova', 'Zerind', romania_map))
        result2 = iterative_deepening_search(g2)
        print(g2)
        return (g.goal_tests, g2.goal_tests)

    def problem_1a(self):
        '''Use the InstrumentedProblem class to track stats about 
        different searches on the Romania Map problem.
        '''
        bfs = InstrumentedProblem(GraphProblem('Oradea', 'Vaslui', romania_map))
        dfs = InstrumentedProblem(GraphProblem('Oradea', 'Vaslui', romania_map))
        ids = InstrumentedProblem(GraphProblem('Oradea', 'Vaslui', romania_map))
        breadth_first_graph_search(bfs)
        depth_first_graph_search(dfs)
        iterative_deepening_search(ids)
        return (bfs.goal_tests, dfs.goal_tests, ids.goal_tests)

    def problem_1b(self):
        '''Use the InstrumentedProblem class to track stats about
        different searches on the Romania Map problem.
        '''
        bfs = InstrumentedProblem(GraphProblem('Neamt', 'Lugoj', romania_map))
        dfs = InstrumentedProblem(GraphProblem('Neamt', 'Lugoj', romania_map))
        ids = InstrumentedProblem(GraphProblem('Neamt', 'Lugoj', romania_map))
        breadth_first_graph_search(bfs)
        depth_first_graph_search(dfs)
        iterative_deepening_search(ids)
        return (bfs.goal_tests, dfs.goal_tests, ids.goal_tests)

    def example_problem_2(self):
        #EightPuzzle example with A*
        # Default goal is (1, 2, 3, 4, 5, 6, 7, 8, 0)
        #   which represents:   1 2 3
        #                       4 5 6
        #                       7 8 _
        #

        # In this example, we'll construct a puzzle with initial state
        #               1 2 3
        #               4 5 6
        #               _ 7 8
        #
        init = (1, 2, 3, 4, 5, 6, 0, 7, 8)
        puzzle = EightPuzzle(init)

        # Checks whether the initialized configuration is solvable or not
        # this is not a required step, but my be useful in saving you from
        # impossible configurations
        print("Is the puzzle solvable from this initial state?")
        print(puzzle.check_solvability(init))

        print("A* with default heuristic")
        return astar_search(puzzle).solution()

    def problem_2a(self):
        '''
        1. instantiate the search algorithm with the 8 puzzle problem
            as described in the writeup
        2. return the solution from the A* search algorithm
        '''
        puzzle = EightPuzzle((4, 0, 1, 5, 8, 2, 7, 6, 3))
        return astar_search(puzzle).solution()
    
    def problem_2b(self):
        '''
        1. instantiate the search algorithm with the 8 puzzle problem
            as described in the writeup
        2. return the solution from the A* search algorithm
        '''
        puzzle = EightPuzzle((1, 4, 0, 6, 5, 2, 8, 3, 7), (1, 2, 3, 8, 0, 4, 7, 6, 5))
        return astar_search(puzzle).solution()

    def problem_2c(self):
        '''
        1. instantiate the search algorithm with the 8 puzzle problem
            as described in the writeup
        2. return the solution from the A* search algorithm
        '''
        puzzle = EightPuzzle((6, 4, 3, 7, 8, 1, 0, 5, 2), (1, 2, 3, 8, 0, 4, 7, 6, 5))
        return astar_search(puzzle).solution()

    def problem_2d(self):
        '''
        Complete the mhd function (defined above class PS2)

        1. instantiate the search algorithm with the 8 puzzle problem 
        2. write code that will create a different heuristic
        3. return the solution from the A* search algorithm
        '''
        puzzle = EightPuzzle((6, 4, 3, 7, 8, 1, 0, 5, 2), (1, 2, 3, 8, 0, 4, 7, 6, 5))
        return astar_search(puzzle, h=mhd).solution()

    def problem_3c(self):
        '''Create a version of the EasyEightPuzzle with initial state
        as described in the writeup. Use A* to solve it and return 
        a string representation of the solution path
        '''
        puzzle = EasyEightPuzzle((4, 0, 1, 5, 8, 2, 7, 6, 3))
        return astar_search(puzzle).solution()
    
class EasyEightPuzzle(EightPuzzle):
    """Easy version of the Eight puzzle in which a solution is any state in which
    the numbers 1 - 8 are in sequence clockwise around the outside of the grid, with the 
    blank square in the middle.
    
    possible solutions include:

    8 1 2     6 7 8     4 5 6
    7 0 3  ,  5 0 1  ,  3 0 7
    6 5 4     4 3 2     2 1 8

    and so on
    """
    def __init__(self, initial):
        super().__init__(initial)
        # Read the outside squares clockwise, starting at the top left.
        outside = (0, 1, 2, 5, 8, 7, 6, 3)
        self.goals = []
        for first in range(1, 9):
            goal = [0] * 9
            for offset, index in enumerate(outside):
                goal[index] = (first - 1 + offset) % 8 + 1
            self.goals.append(tuple(goal))

    def goal_test(self, state):
        """ Given a state, return True if state is a goal state or False, otherwise
            We're overriding this function to allow for multiple goal states
        """
        return state in self.goals

    def h(self, node):
        """ Return the heuristic value for a given state. 
        Again, overriding this now that we have multiple goal states... how to estimate?"""
        # Distance to the nearest allowed goal, counting numbered tiles only.
        estimates = []
        for goal in self.goals:
            distance = 0
            for index, tile in enumerate(node.state):
                if tile != 0:
                    goal_index = goal.index(tile)
                    distance += abs(index // 3 - goal_index // 3)
                    distance += abs(index % 3 - goal_index % 3)
            estimates.append(distance)
        return min(estimates)

def main():
    
    # Create object, p2, of type PS2.
    p2 = PS2()
 
    print('Example Problem 1 result:')
    print('=======================')
    print(p2.example_problem_1())

    print('Problem 1a result:')
    print('==================')
    print(p2.problem_1a())

    print('Problem 1b result:')
    print('==================')
    print(p2.problem_1b())

    #=======================
    # A* with 8-Puzzle 
    # An example for you to follow to get you started on the EightPuzzle
    print('Example Problem 2 result:')
    print('=======================')
    print(p2.example_problem_2())
    
    print('Problem 2a result:')
    print('==================')
    print(p2.problem_2a())

    print('Problem 2b result:')
    print('==================')
    print(p2.problem_2b())

    print('Problem 2c result:')
    print('==================')
    print(p2.problem_2c())

    print('Problem 2d result:')
    print('==================')
    print(p2.problem_2d())

    
    print('Problem 3c result:')
    print('==================')
    print(p2.problem_3c())

if __name__ == '__main__':
    main()
