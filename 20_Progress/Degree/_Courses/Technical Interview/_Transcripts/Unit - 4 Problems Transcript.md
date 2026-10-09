---
type: input
status: seed
created:
input_kind: transcript
source_url:
related_progress: []
tags:
  - transcript
next:
---
# Unit - 4 Problems Transcript

**Captured:** 2026-10-08
**Source:**

## Session - 1
Paste the untouched transcript below, inside the fence. Do not edit, clean, or summarize here — this file is the raw capture. Summarization happens in the linked brief once `/transcript-to-brief` runs.

````
## Unit 4: Session 1

### Linked Lists | OOP & Linked Lists

In this session, students will learn to apply Python classes and linked lists through practical exercises. They will begin by creating and manipulating instances of a class and then explore the basics of linked lists, focusing on node creation and linkage. These exercises aim to deepen understanding of object-oriented programming and provide foundational skills in managing custom data structures in Python.

You can find session recordings and more on the [resources tab](https://courses.codepath.org/courses/tip103/unit/4#!resources). Session slide decks are available on the [overview tab](https://courses.codepath.org/courses/tip103/unit/4#!overview).

---

### 🎢 Part 1: Instructor Led Session

We'll spend the first portion of the synchronous class time in large groups, where the instructor will lead class instruction for 30-45 minutes.

### 🧑‍💻 Part 2: Breakout Session

In breakout sessions, we will explore and collaboratively solve problem sets in small groups. Here, the **collaboration, conversation, and approach** are just as important as “solving the problem” - please engage warmly, clearly, and plentifully in the process!

In breakout rooms you will:

- Screen-share the problem/s, and verbally review them together
- Screen-share an interactive coding environment, and talk through the steps of a solution approach
    - ProTip: - An Integrated Development Environment (IDE) is a fancy name for a tool you could use for shared writing of code - like VSCode, PyCharm, Replit.com, Collabed.it, CodePen.io, or other - your staff team will specify which tool to use for this class!
- Screen-share an implementation of your proposed solution
- Independently follow-along, or create an implementation, in your own IDE.

Your program leader/s will indicate which code sharing tool/s to use as a group, and will help break down or provide specific scaffolding with the main concepts above.

**Note on Expectations**

---

### 🔎 Problem Solving Approach

We will approach problems using the six steps in the UMPIRE approach.

**UMPIRE: Understand, Match, Plan, Implement, Review, Evaluate.**

We’ll apply these six steps to the problems we’ll see in the first half of the course.

We will learn to:

- **Understand** the problem
- **Match** identifies common approaches you've seen/used before
- **Plan** a solution step-by-step, and
- **Implement** the solution
- **Review** your solution
- **Evaluate** your solution's time and space complexity and think critically about the advantages and disadvantages of your chosen approach.

---

### Problem Set Version 1

Problem 1: Villager Class

A class constructor is a special method or function that is used to create and initialize a new object from a class. Define the class constructor `__init__()` for a new class `Villager` that represents characters in the game Animal Crossing. The constructor accepts three required arguments: strings `name`, `species`, and `catchphrase`. The constructor defines four properties for a `Villager`:

- `name`, a string initialized to the argument `name`
- `species`, a string initialized to the argument `species`
- `catchphrase`, a string initialized to the argument `catchphrase`
- `furniture`, a list initialized to an empty list

```
class Villager:
    def __init__(self, name, species, catchphrase):
        self.name = name
        self.species = species
        self.catchphrase = catchphrase
        self.furniture = []
```

Example Usage:

```
apollo = Villager("Apollo", "Eagle", "pah")
print(apollo.name)
print(apollo.species) 
print(apollo.catchphrase)
print(apollo.furniture)
```

Output:

```
Apollo
Eagle
pah
[]
```

✨ AI Hint: Intro to Object Oriented Programming

_Key Skill: Use AI to explain code concepts_

This problem may require you to be familiar with Object Oriented Programming (OOP) basics, including classes, instances, objects, and constructors. To help, we've included an "intro to OOP" review [Unit 4 Cheatsheet](https://courses.codepath.org/courses/tip103/unit/4#!cheatsheet)

You can also use an AI tool like ChatGPT or GitHub Copilot to get more examples or ask follow-up questions. You can use the following prompt as a starting point:

_"You're an expert computer science tutor. Can you help me understand OOP conceptually, using analogies to real-world objects?"_

Once you understand the concept, you can also ask follow-up questions like:

_"Can you provide an example of a class, instance, and constructor in python?"_

_"What does `self` mean in Python, and how is it used in OOP?"_

Problem 2: Add Furniture

Players and villagers in Animal Crossing can add furniture to their inventory to decorate their house.

Update the `Villager` class with a new method `add_item()` that takes in one parameter, `item_name`.

The method should validate the `item_name`.

- If the item is valid, add `item_name` to the villager’s `furniture` attribute.
- The method does not need to return any values.  
    

`item_name` is valid if it has one of the following values: `"acoustic guitar"`, `"ironwood kitchenette"`, `"rattan armchair"`, `"kotatsu"`, or `"cacao tree"`.

```
class Villager:
    # ... methods from previous problems
	
    def add_item(self, item_name):
        pass
```

Example Usage:

```
alice = Villager("Alice", "Koala", "guvnor")
print(alice.furniture)

alice.add_item("acoustic guitar")
print(alice.furniture)

alice.add_item("cacao tree")
print(alice.furniture)

alice.add_item("nintendo switch")
print(alice.furniture)
```

Output:

```
[]
["acoustic guitar"]
["acoustic guitar", "cacao tree"]
["acoustic guitar", "cacao tree"]
```

✨ AI Hint: Class Methods

_Key Skill: Use AI to explain code concepts_

This question requires you to be familiar with class methods, which are functions attached to an object. To help, we've included more info [Unit 4 Cheatsheet](https://courses.codepath.org/courses/tip103/unit/4#!cheatsheet)

If you'd still like to see more examples or ask follow-up questions, try using an AI tool like ChatGPT or GitHub Copilot. You can use the following prompt as a starting point:

_"You're an expert computer science tutor. Please provide 2-3 examples of how Class Methods are used in Python, and explain how each one works."_

You might also want to ask questions like:

_"Can you explain the difference between class methods, instance methods, and functions?"_

Problem 3: Group by Personality

The `Villager` class has been updated below to include the new string attribute `personality` representing the character's personality type.

Outside of the `Villager` class, write a _function_ `of_personality_type()`. Given a list of `Villager` instances `townies` and a string `personality_type` as parameters, return a list containing the _names_ of all villagers in `townies` with `personality` `personality_type`. Return the names in any order.

```
class Villager:
    def __init__(self, name, species, personality, catchphrase):
        self.name = name
        self.species = species
        self.personality = personality
        self.catchphrase = catchphrase
        self.furniture = []
    # ... methods from previous problems
	
def of_personality_type(townies, personality_type):
    pass
```

Example Usage:

```
isabelle = Villager("Isabelle", "Dog", "Normal", "what's up?")
bob = Villager("Bob", "Cat", "Lazy", "pthhhpth")
stitches = Villager("Stitches", "Cub", "Lazy", "stuffin'")

print(of_personality_type([isabelle, bob, stitches], "Lazy"))
print(of_personality_type([isabelle, bob, stitches], "Cranky"))
```

Example Output:

```
['Bob', 'Stitches']
[]
```
Problem 4: Telephone

The `Villager` constructor has been updated to include an additional attribute `neighbor`. A villager's `neighbor` is another `Villager` instance and represents their closest neighbor. By default, a `Villager`'s neighbor is set to `None`.

Given two `Villager` instances `start_villager` and `target_villager`, write a function `message_received()` that returns `True` if you can pass a message from the `start_villager` to the `target_villager` through a series of neighbors and `False` otherwise.

```
class Villager:
    def __init__(self, name, species, personality, catchphrase, neighbor=None):
        self.name = name
        self.species = species
        self.personality = personality
        self.catchphrase = catchphrase
        self.furniture = []
        self.neighbor = neighbor
    # ... methods from previous problems
	
def message_received(start_villager, target_villager):
    pass
```

Example Usage:

```
isabelle = Villager("Isabelle", "Dog", "Normal", "what's up?")
tom_nook = Villager("Tom Nook", "Raccoon", "Cranky", "yes, yes")
kk_slider = Villager("K.K. Slider", "Dog", "Lazy", "dig it")
isabelle.neighbor = tom_nook
tom_nook.neighbor = kk_slider

print(message_received(isabelle, kk_slider))
print(message_received(kk_slider, isabelle))
```

Example Output:

```
True
Example 1 Explanation: Isabelle can pass a message to her neighbor, Tom Nook. Tom Nook can then pass the 
message to his neighbor, KK Slider. KK Slider is the target, therefore the function should return True.

False
Example 2 Explanation: KK Slider doesn't have a neighbor, so you cannot pass a message to Isabelle from 
KK Slider. 
``` 
Problem 5: Linked Up

A **linked list** is a new data type that, similar to a normal list or array, allows us to store pieces of data sequentially. The difference between a linked list and a normal list lies in how each element is stored in a computer’s memory.  

In a normal list, individual elements of the list are stored in adjacent memory locations according to the order they appear in the list. If we know where the first element of the list is stored, it’s really easy to find any other element in the list.  

In a linked list, the individual elements called **nodes** are not stored in sequential memory locations. Each node may be stored in an unrelated memory location. To connect nodes together into a sequential list, each node stores a reference or pointer to the next node in the list.  

Connect the provided node instances below to create the linked list `kk_slider -> harriet -> saharah -> isabelle`.

A function `print_linked_list()` which accepts the **head**, or first element, of a linked list and prints the values of the list has also been provided for testing purposes.

```
class Node:
    def __init__(self, value, next=None):
        self.value = value
        self.next = next

# For testing
def print_linked_list(head):
    current = head
    while current:
        print(current.value, end=" -> " if current.next else "\n")
        current = current.next

kk_slider = Node("K.K. Slider")
harriet = Node("Harriet")
saharah = Node("Saharah")
isabelle = Node("Isabelle")

# Add code here to link the above nodes
```

Example Usage:

```
print_linked_list(kk_slider)
```

Example Output:

```
K.K. Slider -> Harriet -> Saharah -> Isabelle
```

✨ AI Hint: Linked Lists

_Key Skill: Use AI to explain code concepts_

This question requires you to be familiar with Linked Lists, a incredibly useful but sometimes tricky data structure. To help, we've included a review of linked lists [Unit 4 Cheatsheet](https://courses.codepath.org/courses/tip103/unit/4#!cheatsheet)

You can also use an AI tool like ChatGPT or GitHub Copilot to get more examples or ask follow-up questions. You can use the following prompt as a starting point:

_"You're an expert computer science tutor. Can you help me understand linked lists conceptually, using analogies to real-world objects?"_

Once you understand the concept of Linked Lists, you can also ask follow-up questions like:

_"Can you provide examples of how to implement a linked list in Python, and explain how each part works?"_

_"Here is a provided Linked List class: (CODE). Can you give me an example of how to access the data in this linked list?"_

Problem 6: Got One!

Imagine that behind the scenes, Animal Crossing uses a linked list to represent the order fish will appear to a player who is fishing in the river. The `head` of the list represents the next fish that a player will catch if they keep fishing.

Write a function `catch_fish()` that accepts the `head` of a list. The function should:

1. Print the name of the fish in the `head` node using the format `"I caught a <fish name>!"`.
2. Remove the first node in the list.

The function should return the new head of the list. If the list is empty, print `"Aw! Better luck next time!"` and return `None`.

A function `print_linked_list()` which accepts the **head**, or first element, of a linked list and prints the list data has also been provided for testing purposes.

```
class Node:
    def __init__(self, fish_name, next=None):
        self.fish_name = fish_name
        self.next = next

# For testing
def print_linked_list(head):
    current = head
    while current:
        print(current.fish_name, end=" -> " if current.next else "\n")
        current = current.next

def catch_fish(head):
    pass
```

Example Usage:

```
fish_list = Node("Carp", Node("Dace", Node("Cherry Salmon")))
empty_list = None

print_linked_list(fish_list)
print_linked_list(catch_fish(fish_list))
print(catch_fish(empty_list))
```

Example Output:

```
Carp -> Dace -> Cherry Salmon
I caught a Carp!
Dace -> Cherry Salmon
Aw! Better luck next time!
None
```
Problem 7: Fishing Probability

Imagine that Animal Crossing is still using a linked list to represent the order fish will appear to a player who is fishing in the river! The `head` of the list represents the next fish that a player will catch if they keep fishing.

Write a function `fish_chances()` that accepts the `head` of a list and a string `fish_name`. Return the probability rounded down to the nearest hundredth that the player will catch a fish of type `fish_name`.

A function `print_linked_list()` which accepts the **head**, or first element, of a linked list and prints the list data has also been provided for testing purposes.

```
class Node:
    def __init__(self, fish_name, next=None):
        self.fish_name = fish_name
        self.next = next

# For testing
def print_linked_list(head):
    current = head
    while current:
        print(current.fish_name, end=" -> " if current.next else "\n")
        current = current.next

def fish_chances(head, fish_name):
    pass
```

Example Usage:

```
fish_list = Node("Carp", Node("Dace", Node("Cherry Salmon")))
print(fish_chances(fish_list, "Dace"))
print(fish_chances(fish_list, "Rainbow Trout"))
```

Example Output:

```
0.33
0.00
```

💡 Hint: Linked List Traversal

This problem requires you to traverse a linked list. In other words, it requires you to iterate over the nodes of a linked list. For a break down of how to traverse a linked list, check out the unit cheatsheet.

Problem 8: Restocking the Lake

Imagine that Animal Crossing is still using a linked list to represent the order fish will appear to a player who is fishing! The `head` of the list represents the next fish that a player will catch if they keep fishing.

Write a function `restock()` that accepts the `head` of a linked list and a string `new_fish`, and adds a Node with the `fish_name` `new_fish` to the end of the list. Return the `head` of the modified list.

A function `print_linked_list()` which accepts the **head**, or first element, of a linked list and prints the list data has also been provided for testing purposes.

```
class Node:
    def __init__(self, fish_name, next=None):
        self.fish_name = fish_name
        self.next = next

# For testing
def print_linked_list(head):
    current = head
    while current:
        print(current.fish_name, end=" -> " if current.next else "\n")
        current = current.next

def restock(head, new_fish):
    pass
```

Example Usage:

```
fish_list = Node("Carp", Node("Dace", Node("Cherry Salmon")))
print_linked_list(restock(fish_list, "Rainbow Trout"))
```

Example Output:

```
Carp -> Dace -> Cherry Salmon -> Rainbow Trout
```
````
## Session - 2

````
## Unit 4: Session 2

### Binary Trees & BST | Binary Trees

Students are introduced to foundational and complex tasks involving binary trees. They will engage in constructing trees, manipulating tree structures, traversing trees, and understanding tree properties through a variety of exercises. This session aims to deepen students' understanding of tree algorithms, enhancing their ability to analyze and implement data structures efficiently.

You can find session recordings and more on the [resources tab](https://courses.codepath.org/courses/tip103/unit/4#!resources). Session slide decks are available on the [overview tab](https://courses.codepath.org/courses/tip103/unit/4#!overview).

---

### 🎢 Part 1: Instructor Led Session

We'll spend the first portion of the synchronous class time in large groups, where the instructor will lead class instruction for 30-45 minutes.

### 🧑‍💻 Part 2: Breakout Session

In breakout sessions, we will explore and collaboratively solve problem sets in small groups. Here, the **collaboration, conversation, and approach** are just as important as “solving the problem” - please engage warmly, clearly, and plentifully in the process!

In breakout rooms you will:

- Screen-share the problem/s, and verbally review them together
- Screen-share an interactive coding environment, and talk through the steps of a solution approach
    - ProTip: - An Integrated Development Environment (IDE) is a fancy name for a tool you could use for shared writing of code - like VSCode, PyCharm, Replit.com, Collabed.it, CodePen.io, or other - your staff team will specify which tool to use for this class!
- Screen-share an implementation of your proposed solution
- Independently follow-along, or create an implementation, in your own IDE.

Your program leader/s will indicate which code sharing tool/s to use as a group, and will help break down or provide specific scaffolding with the main concepts above.

**Note on Expectations**

---

### 🔎 Problem Solving Approach

We will approach problems using the six steps in the UMPIRE approach.

**UMPIRE: Understand, Match, Plan, Implement, Review, Evaluate.**

We’ll apply these six steps to the problems we’ll see in the first half of the course.

We will learn to:

- **Understand** the problem
- **Match** identifies common approaches you've seen/used before
- **Plan** a solution step-by-step, and
- **Implement** the solution
- **Review** your solution
- **Evaluate** your solution's time and space complexity and think critically about the advantages and disadvantages of your chosen approach.

---

ℹ️ **Note: Testing your Binary Tree (Printing)**

To keep the amount of starter code manageable, we have chosen not to include a function to print a binary tree as part of each relevant problem statement. You may instead copy the function in the drop-down below `print_tree()` and use it as needed while you complete the problem sets.

Print Binary Tree Function

Accepts the root of a binary tree and prints out the values of each node level by level from left to right. Values of `None` are used to indicate a null child node between non-null children on the same level. Prints `"Empty"` for an empty tree.

```
from collections import deque 

# Tree Node class
class TreeNode:
    def __init__(self, value, left=None, right=None):
        self.val = value
        self.left = left
        self.right = right

def print_tree(root):
    if not root:
        return "Empty"
    result = []
    queue = deque([root])
    while queue:
        node = queue.popleft()
        if node:
            result.append(node.val)
            queue.append(node.left)
            queue.append(node.right)
        else:
            result.append(None)
    while result and result[-1] is None:
        result.pop()
    print(result)

```

Example Usage:

```
"""
          1
        /   \
       2     3
      /     / \
     4     5   6
"""

root = Node(1, Node(2, Node(4)), Node(3, Node(5), Node(6)))

print_tree(root)
print_tree(None)
```

Example Output:

```
[1, 2, 3, 4, None, 5, 6]
'Empty'
```

---

### Problem Set Version 1

Problem 1: Ivy Cutting

You have a trailing ivy plant represented by a binary tree. You want to take a cutting to start a new plant using the rightmost vine in the plant. Given the `root` of the plant, return a list with the value of each node in the path from the `root` node to the rightmost leaf node. _**If there is no right child, return only the root node value (the rightmost path in this case is just the root node).**_

Evaluate the time and space complexity of your function. Define your variables and provide a rationale for why you believe your solution has the stated time and space complexity. Assume the input tree is balanced when calculating time and space complexity.

```
class TreeNode:
    def __init__(self, value, left=None, right=None):
        self.val = value
        self.left = left
        self.right = right

def right_vine(root):
  pass
```

Example Usage:

```
"""
        Root
      /      \
    Node1    Node2
  /         /    \
Leaf1    Leaf2  Leaf3
"""
ivy1 = TreeNode("Root", 
                TreeNode("Node1", TreeNode("Leaf1")),
                TreeNode("Node2", TreeNode("Leaf2"), TreeNode("Leaf3")))

"""
      Root
      /  
    Node1
    /
  Leaf1  
"""
ivy2 = TreeNode("Root", TreeNode("Node1", TreeNode("Leaf1")))

print(right_vine(ivy1))
print(right_vine(ivy2))
```

Example Output:

```
['Root', 'Node2', 'Leaf3']
['Root']
```

✨ AI Hint: Binary Trees

[](https://courses.codepath.org/courses/tip103/unit/4#!cheatsheet)

Problem 2: Ivy Cutting II

If you implemented `right_vine()` iteratively in the previous problem, implement it recursively. If you implemented it recursively, implement it iteratively.

Evaluate the time and space complexity of your function. Define your variables and provide a rationale for why you believe your solution has the stated time and space complexity. Assume the input tree is balanced when calculating time and space complexity.

```
class TreeNode:
    def __init__(self, value, left=None, right=None):
        self.val = value
        self.left = left
        self.right = right

def right_vine(root):
  pass
```

Example Usage:

```
"""
        Root
      /      \
    Node1    Node2
  /         /    \
Leaf1    Leaf2  Leaf3
"""
ivy1 = TreeNode("Root", 
                TreeNode("Node1", TreeNode("Leaf1")),
                TreeNode("Node2", TreeNode("Leaf2"), TreeNode("Leaf3")))

"""
      Root
      /  
    Node1
    /
  Leaf1  
"""
ivy2 = TreeNode("Root", TreeNode("Node1", TreeNode("Leaf1")))

print(right_vine(ivy1))
print(right_vine(ivy2))
```

Example Output:

```
['Root', 'Node2', 'Leaf3']
['Root']
```
Problem 3: Pruning Plans

You have a large overgrown Magnolia tree that's in desperate need of some pruning. Before you can prune the tree, you need to do a full survey of the tree to evaluate which sections need to be pruned.

Given the `root` of a binary tree representing the magnolia, return a list of the values of each node using a postorder traversal. In a postorder traversal, you explore the left subtree first, then the right subtree, and finally the root. Postorder traversals are often used when deleting nodes from a tree.

Evaluate the time and space complexity of your function. Define your variables and provide a rationale for why you believe your solution has the stated time and space complexity. Assume the input tree is balanced when calculating time and space complexity.

```
class TreeNode:
    def __init__(self, value, left=None, right=None):
        self.val = value
        self.left = left
        self.right = right

def survey_tree(root):
    pass
```

Example Usage:

```
"""
        Root
      /      \
    Node1    Node2
  /         /    \
Leaf1    Leaf2  Leaf3
"""

magnolia = TreeNode("Root", 
                TreeNode("Node1", TreeNode("Leaf1")),
                        TreeNode("Node2", TreeNode("Leaf2"), TreeNode("Leaf3")))

print(survey_tree(magnolia))
```

Example Output:

```
['Leaf1', 'Node1', 'Leaf2', 'Leaf3', 'Node2', 'Root']
```

✨ AI Hint: Traversing Trees

_Key Skill: Use AI to explain code concepts_

This problem requires you to traverse a binary tree. For a refresher on this topic, check out the Tree Traversal section of the [Unit 4 Cheatsheet](https://courses.codepath.org/courses/tip103/unit/4#!cheatsheet).

Still have questions? Try asking an AI tool like ChatGPT or GitHub Copilot to explain the different types of binary tree traversal. You can use the following prompt as a starting point:

_"You're an expert computer science tutor. Please explain the different types of binary tree traversal, and show me how they would each work on an example tree."_

Hint: Be sure to learn about "preorder", "postorder", and "inorder" traversals!

Problem 4: Sum Inventory

A local flower shop stores its inventory in a binary tree, where each node represents their current stock of a flower variety. Given the root of a binary tree `inventory`, return the sum of all the flower stock in the store.

Evaluate the time and space complexity of your function. Define your variables and provide a rationale for why you believe your solution has the stated time and space complexity. Assume the input tree is balanced when calculating time and space complexity.

```
class TreeNode:
    def __init__(self, value, left=None, right=None):
        self.val = value
        self.left = left
        self.right = right

def sum_inventory(inventory):
    pass
```

Example Usage:

```
"""
     40
    /  \
   5   10
  /   /  \
20   1   30
"""

inventory = TreeNode(40, 
                    TreeNode(5, TreeNode(20)),
                            TreeNode(10, TreeNode(1), TreeNode(30)))

print(sum_inventory(inventory))
```

Example Output:

```
106
```
Problem 5: Calculating Yield II

You have a fruit tree represented as a binary tree. Given the `root` of the tree, evaluate the amount of fruit your tree will yield this year. The tree has the following form:

- **Leaf nodes** have an integer value.
- **Non-leaf nodes** have a string value of either `"+"`, `"-"`, `"*"`, or `"/"`.

The **yield** of the tree is calculated as follows:

- If the node is a leaf node, the yield is the **value** of the node.
- Otherwise evaluate the node's two children and apply the mathematical operation of its value with the children's evaluations.

Return the result of evaluating the `root` node.

Evaluate the time and space complexity of your function. Define your variables and provide a rationale for why you believe your solution has the stated time and space complexity. Assume the input tree is balanced when calculating time and space complexity.

```
class TreeNode:
    def __init__(self, value, left=None, right=None):
        self.val = value
        self.left = left
        self.right = right

def calculate_yield(root):
  pass
```

Example Usage:

```
"""
      +
     / \ 
    /   \
   -     *
  / \   / \
 4   2 10  2
"""

root = TreeNode("+")
root.left = TreeNode("-")
root.right = TreeNode("*")
root.left.left = TreeNode(4)
root.left.right = TreeNode(2)
root.right.left = TreeNode(10)
root.right.right = TreeNode(2)

print(calculate_yield(root))
```

Example Output:

```
22
Explanation:
- 4 - 2 = 2
- 10 * 2 = 20
- 2 + 20 = 22
```
Problem 6: Plant Classifications

Given the `root` of a binary tree used to classify plants where each level of the tree represents a higher degree of speficity, return an array with the most specific plant classification categories (aka the leaf node values). Leaf nodes are nodes with no children.

Evaluate the time and space complexity of your function. Define your variables and provide a rationale for why you believe your solution has the stated time and space complexity. Assume the input tree is balanced when calculating time and space complexity.

```
class TreeNode:
    def __init__(self, value, left=None, right=None):
        self.val = value
        self.left = left
        self.right = right

def get_most_specific(taxonomy):
    pass
```

Example Usage:

```
"""
           Plantae
          /       \
         /         \
        /           \ 
Non-flowering     Flowering
   /      \       /        \
Mosses   Ferns Gymnosperms Angiosperms
                             /     \
                        Monocots  Dicots
"""
plant_taxonomy = TreeNode("Plantae", 
                          TreeNode("Non-flowering", TreeNode("Mosses"), TreeNode("Ferns")),
                                  TreeNode("Flowering", TreeNode("Gymnosperms"), 
                                          TreeNode("Angiosperms", TreeNode("Monocots"), TreeNode("Dicots"))))

print(get_most_specific(plant_taxonomy))
```

Example Output:

```
['Mosses', 'Ferns', 'Gymnosperms', 'Monocots', 'Dicots']
```
Problem 7: Count Old Growth Trees

Given the `root` of a binary tree where each node represents the age of a tree in a forest, write a function `count_old_growth()` that returns the number of old growth trees in the forest. A tree is considered old growth if it has age greater than `threshold`.

Evaluate the time and space complexity of your function. Define your variables and provide a rationale for why you believe your solution has the stated time and space complexity. Assume the input tree is balanced when calculating time and space complexity.

```
class TreeNode:
    def __init__(self, value, left=None, right=None):
        self.val = value
        self.left = left
        self.right = right

def count_old_growth(root, threshold):
    pass 
```

Example Usage:

```
"""
     100
     /  \
    /    \
  1200  1500
  /     /  \
20    700  2600
"""

forest = TreeNode(100, 
                  TreeNode(1200, TreeNode(20))
                          TreeNode(1500, TreeNode(700), TreeNode(2600)))

print(count_old_growth(forest, 1000))
```

Example Output:

```
3
```
Problem 8: Twinning Trees

Given the roots of two trees `root1` and `root2`, return `True` if the trees have identical structures and values and `False` otherwise.

Evaluate the time and space complexity of your function. Define your variables and provide a rationale for why you believe your solution has the stated time and space complexity. Assume the input tree is balanced when calculating time and space complexity.

```
class TreeNode:
    def __init__(self, value, left=None, right=None):
        self.val = value
        self.left = left
        self.right = right

def is_identical(root1, root2):
    pass 
```

Example Usage:

```
"""
      1                1
     / \              / \
    2   3            2   3  
"""
root1 = TreeNode(1, TreeNode(2), TreeNode(3))
root2 = TreeNode(1, TreeNode(2), TreeNode(3))

"""
      1                1
     /                  \
    2                    2  
"""

root3 = TreeNode(1, TreeNode(2))
root4 = TreeNode(1, None, TreeNode(2))

print(is_identical(root1, root2))
print(is_identical(root3, root4))
```

Example Output:

```
True
False
```
````