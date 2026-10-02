'''
Complete the homework by changing the code where noted.

'''

import sys
sys.path.append('aima-python')
from aima.agents import *

loc_C = (2,0)

class P4:

    def problem_a(self):
        '''
        Call the run() method with the reflex agent and the trivial vac environment
        and return the environment status
        '''
        # Wrap the agent in TraceAgent so every step's (percept, action) pair is
        # printed, then run for exactly 20 steps as the assignment specifies
        # (the default run() length is 1000, which is NOT what's asked for here).
        agent = TraceAgent(ReflexVacuumAgent())
        environment = TrivialVacuumEnvironment()
        environment.add_thing(agent)
        environment.run(20)
        return environment.status

    def problem_b(self):
        '''
        Call the run() method with the model based agent and the trivial vac environment
        and return the environment status
        '''
        agent = TraceAgent(ModelBasedVacuumAgent())
        environment = TrivialVacuumEnvironment()
        environment.add_thing(agent)
        environment.run(20)
        return environment.status

    def problem_c(self):
        '''
        Call the run() method with the random agent and the trivial vac environment
        and return the environment status
        '''
        agent = TraceAgent(RandomVacuumAgent())
        environment = TrivialVacuumEnvironment()
        environment.add_thing(agent)
        environment.run(20)
        return environment.status

    def problem_d(self):
        '''
        Compare the performance of the reflex agent, the model based agent, and random agent in the trivial vac environment.
        You will have to pass the agents and the environment to the comparison function,
        this will require reviewing the documentation because the process is a little different.
        '''
        # compare_agents takes an environment *factory* (the class itself, so it can build
        # a fresh copy for each trial) and a list of agent *factories* (the constructor
        # functions above, not agent instances). It runs each agent in n independent
        # copies of the environment and returns a list of (AgentFactory, average_score)
        # tuples -- see aima/agents.py, compare_agents().
        agent_factories = [ReflexVacuumAgent, ModelBasedVacuumAgent, RandomVacuumAgent]
        return compare_agents(TrivialVacuumEnvironment, agent_factories)


class LessTrivialVacuumEnvironment(Environment):
    """A simple vacuum environment with 3 locations, A, B and C.
    Each can be dirty or clean.
    Look at TrivialVacuumEnvironment for guidance
    """
    def __init__(self):
        super().__init__()
        self.status = {loc_A: random.choice(['Clean','Dirty']),
                       loc_B: random.choice(['Clean','Dirty']),
                       loc_C: random.choice(['Clean','Dirty'])}

    def thing_classes(self):
        return [Wall, Dirt, RandomVacuumAgent]

    def percept(self, agent):
        """Returns the agent's location, and the location status (Dirty/Clean)."""
        return agent.location, self.status[agent.location]

    def execute_action(self, agent, action):
        """Change agent's location and/or location's status, track performance.
        Score 10 for each dirt cleaned, -1 for each move."""
        # The three locations sit in a row: A - B - C. 'Right' moves toward C,
        # 'Left' moves toward A. At either end, an out-of-bounds move just
        # keeps the agent where it is (mirrors how TrivialVacuumEnvironment
        # only ever has one neighbor to move to/from in each direction),
        # but the action still costs a point, same as a real move would.
        order = [loc_A, loc_B, loc_C]
        index = order.index(agent.location)
        if action == 'Right':
            if index < len(order) - 1:
                agent.location = order[index + 1]
            agent.performance -= 1
        elif action == 'Left':
            if index > 0:
                agent.location = order[index - 1]
            agent.performance -= 1
        elif action == 'Suck':
            if self.status[agent.location] == 'Dirty':
                agent.performance += 10
            self.status[agent.location] = 'Clean'
        # 'NoOp' does nothing and costs nothing.

    def default_location(self, thing):
        """Agents start in either location at random."""
        return random.choice([loc_A, loc_B, loc_C])


def problem5():
    """Write code that will perform 100 runs of a RandomVacuumAgent in a
    LessTrivialVacuumEnvironment for 50 timesteps and calculate the
    average performance of those Agents. Return the average performance.
    """
    # test_agent(AgentFactory, steps, envs) builds one agent per environment in
    # `envs`, runs each for `steps` timesteps, and returns the mean of their
    # final .performance scores -- exactly the "100 runs, 50 timesteps, average
    # performance" this problem asks for (see aima/agents.py, test_agent()).
    environments = [LessTrivialVacuumEnvironment() for _ in range(100)]
    return test_agent(RandomVacuumAgent, 50, environments)

def main():
    ps1p4 = P4()
    print("Problem 4a:", ps1p4.problem_a())
    print("Problem 4b:", ps1p4.problem_b())
    print("Problem 4c:", ps1p4.problem_c())
    print("Problem 4d:", ps1p4.problem_d())
    print("Problem 5:", problem5())

if __name__ == '__main__':
    main()
