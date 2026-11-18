---
type: input
status: seed
created: 2026-11-17
updated: 2026-11-17
tags:
  - transcript
input_kind: transcript
related_progress: []
next:
notes: []
---
# Unit 1- Problems Transcript
**Date:**
**Participants:**
**Captured with:**
## Raw Transcript
<!-- Paste the untouched transcript inside one fence, no blank lines between turns. Never edit, clean, or summarize it. -->
### Session - 1
````
## Unit 10: Session 1

### Mock Interview | Binary Trees

In this session, you will complete the final peer mock interview of the course, themed on binary trees. You will rotate through the interviewer, interviewee, and observer roles, solve a tree problem end to end under interview conditions, talk through your thinking with the UMPIRE method, and exchange structured feedback with your partners.

You can find session recordings and more on the [resources tab](https://courses.codepath.org/courses/tip103/unit/10#!resources). Session slide decks are available on the [overview tab](https://courses.codepath.org/courses/tip103/unit/10#!overview).

---

### 🎢 Part 1: Instructor Led Session

We'll spend the first portion of the synchronous class time in large groups, where the instructor will lead class instruction for 30-45 minutes.

### 🧑‍💻 Part 2: Breakout Session

In breakout sessions, we will explore and collaboratively solve problem sets in small groups. Here, the **collaboration, conversation, and approach** are just as important as “solving the problem” - please engage warmly, clearly, and plentifully in the process!

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

- **Understand** the problem
- **Match** identifies common approaches you've seen/used before
- **Plan** a solution step-by-step, and
- **Implement** the solution
- **Review** your solution
- **Evaluate** your solution's time and space complexity and think critically about the advantages and disadvantages of your chosen approach.

---

ℹ️ **Note: Testing your Binary Tree (Printing)**

To keep the amount of starter code manageable, we have chosen not to include a function to print a binary tree as part of each relevant problem statement. You may instead copy the function in the drop-down below `print_tree()` and use it as needed while you complete the problem sets.

Print Binary Tree Function

Accepts the root of a binary tree and prints out the values of each node level by level from left to right. Values of `None` are used to indicate a null child node between non-null children on the same level. Prints `"Empty"` for an empty tree.

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

ℹ️ **Note: Testing your Binary Tree (Generating a Tree)**

Now that you have practice manually building trees for testing in previous sessions, we are providing a function that builds binary trees based off of a list of values to speed up the testing process. We have chosen not to include this function in the starter code for each problem to keep the length of problems manageable. You may instead copy the function in the drop-down below `build_tree()` and use it as needed while you complete the problem sets.

Build Binary Tree Function

---

### Problem Set Version 1

Problem 1: Croquembouche II

You are designing a delicious croquembouche (a French dessert composed of a cone-shaped tower of cream puffs 😋), for a couple's wedding. They want the cream puffs to have a variety of flavors. You've finished your design and want to send it to the couple for review.

Given a root of a binary tree `design` where each node in the tree represents a cream puff in the croquembouche, traverse the croquembouche in tier order (i.e., level by level, left to right).

You should return a list of lists where each inner list represents a tier (level) of the croquembouche and the elements of each inner list contain the flavors of each cream puff on that tier (node `val`s from left to right).

**Note:** The `build_tree()` and `print_tree()` functions both use variations of a level order traversal. To get the most out of this problem, we recommend that you reference these functions as little as possible while implementing your solution.

Evaluate the time and space complexity of your function. Define your variables and provide a rationale for why you believe your solution has the stated time and space complexity. Assume the input tree is balanced when calculating time complexity.

_Hint: Level order traversal, BFS_

```
class Puff():
     def __init__(self, flavor, left=None, right=None):
        self.val = flavor
        self.left = left
        self.right = right

def listify_design(design):
    pass
```

Example Usage:

```
"""
            Vanilla
           /       \
      Chocolate   Strawberry
      /     \
  Vanilla   Matcha  
"""
croquembouche = Puff("Vanilla", 
                    Puff("Chocolate", Puff("Vanilla"), Puff("Matcha")), 
                    Puff("Strawberry"))
print(listify_design(croquembouche))
```

Example Output:

```
[['Vanilla'], ['Chocolate', 'Strawberry'], ['Vanilla', 'Matcha']]
```

✨ AI Hint: Breadth First Search Traversal

[](https://courses.codepath.org/courses/tip103/unit/3#!cheatsheet)[](https://courses.codepath.org/courses/tip103/unit/10#!cheatsheet)

  

Problem 2: Icing Cupcakes in Zigzag Order

You have rows of cupcakes represented as a binary tree `cupcakes` where each node in the tree represents a cupcake. To ice them efficiently, you are icing cupcakes one row (level) at a time, in zig zag order (i.e., from left to right, then right to left for the next row and alternate between).

Return a list of the cupcake values in the order you iced them.

Evaluate the time and space complexity of your function. Define your variables and provide a rationale for why you believe your solution has the stated time and space complexity. Assume the input tree is balanced when calculating time complexity.

```
class TreeNode():
     def __init__(self, flavor, left=None, right=None):
        self.val = flavor
        self.left = left
        self.right = right

def zigzag_icing_order(cupcakes):
    pass
```

Example Usage:

```
"""
            Chocolate
           /         \
        Vanilla       Lemon
       /              /    \
    Strawberry   Hazelnut   Red Velvet   
"""

# Using build_tree() function included at top of page
flavors = ["Chocolate", "Vanilla", "Lemon", "Strawberry", None, "Hazelnut", "Red Velvet"]
cupcakes = build_tree(flavors)
print(zigzag_icing_order(cupcakes))
```

Example Output:

```
['Chocolate', 'Lemon', 'Vanilla', 'Strawberry', 'Hazelnut', 'Red Velvet']
```

💡 Hint: Choosing your Traversal Method

This problem can be solved multiple ways, but may work best with a modified breadth first search traversal. To learn more about how to choose a traversal algorithm visit the How to Pick a Traversal Method section of the [unit cheatsheet](https://courses.codepath.org/courses/tip103/unit/10#!cheatsheet).

Problem 3: Larger Order Tree

You have the root of a binary search tree `orders`, where each node in the tree represents an order and each node's value represents the number of cupcakes the customer ordered. Convert the tree to a 'larger order tree' such that the value of each node in tree is equal to its original value plus the sum of all node values greater than it.

As a reminder a BST satisfies the following constraints:

- The left subtree of a node contains only nodes with keys less than the node's key.
- The right subtree of a node contains only nodes with keys greater than the node's key.
- Both the left and right subtrees must also be binary search trees.

Evaluate the time and space complexity of your function. Define your variables and provide a rationale for why you believe your solution has the stated time and space complexity. Assume the input tree is balanced when calculating time complexity.

```
class TreeNode():
     def __init__(self, order_size, left=None, right=None):
        self.val = order_size
        self.left = left
        self.right = right

def larger_order_tree(orders):
    pass
```

Examples Usage:

[![Example 'orders' tree with both original node vlaue and larger order value listed](https://courses.codepath.org/course_images/tip103/unit9_session1/larger_order_tree.png "Example 'orders' tree with both original node vlaue and larger order value listed")](https://courses.codepath.org/course_images/tip103/unit9_session1/larger_order_tree.png)

```
"""
         4
       /   \
      /     \
     1       6
    / \     / \
   0   2   5   7
        \       \
         3       8   
"""
# using build_tree() function included at top of page
order_sizes = [4,1,6,0,2,5,7,None,None,None,3,None,None,None,8]
orders = build_tree(order_sizes)

# using print_tree() function included at top of page
print_tree(larger_order_tree(orders))
```

Example Output:

```
[30,36,21,36,35,26,15,None,None,None,33,None,None,None,8]
Explanation:
Larger Order Tree:
        30
       /   \
      /     \
     36     21
    / \     / \
   36  35  26  15
         \       \
         33       8   
```

  

💡 Hint: Choosing your Traversal Method

This problem can be solved multiple ways, but may work best with a modified depth first search traversal. To learn more about how to choose a traversal algorithm visit the How to Pick a Traversal Method section of the [unit cheatsheet](https://courses.codepath.org/courses/tip103/unit/10#!cheatsheet).

Problem 4: Find Next Order to Fulfill Today

You store each customer order at your bakery in a binary tree where each node represents a different order. Each level of the tree represents a different day's orders. Given the root of a binary tree `order_tree` and an `TreeNode` object `order` representing the order you are currently fulfilling, return the next order to fulfill that day. The next order to fulfill is the nearest node on the same level. Return `None` if `order` is the last order of the day (rightmost node of the level).

**Note:** Because we must pass in a reference to a node in the tree, you cannot use the `build_tree()` function for testing. You must manually create the tree.

```
class TreeNode():
     def __init__(self, order, left=None, right=None):
        self.val = order
        self.left = left
        self.right = right

def find_next_order(order_tree, order):
    pass
```

Example Usage:

```
"""
        Cupcakes
       /       \ 
   Macaron     Cookies      
        \      /      \
      Cake   Eclair   Croissant
"""
cupcakes = TreeNode("Cupcakes")
macaron = TreeNode("Macaron")
cookies = TreeNode("Cookies")
cake = TreeNode("Cake")
eclair = TreeNode("Eclair")
croissant = TreeNode("Croissant")

cupcakes.left, cupcakes.right = macaron, cookies
macaron.right = cake
cookies.left, cookies.right = eclair, croissant

next_order1 = find_next_order(cupcakes, cake)
next_order2 = find_next_order(cupcakes, cookies)
print(next_order1.val)
print(next_order2.val)
```

Example Output:

```
Eclair
None
```
Problem 5: Insert Row of Cupcakes to Display

You have a cupcake display represented by a binary tree where each node represents a different cupcake in the display and each node value represents the flavor of the cupcake. Given the root of the binary tree `display` a string `flavor` and an integer `depth`, insert a row of nodes with value `flavor` at the given depth `depth`.

Note that the root node has depth `1`.

The inserting rule is:

- Given the integer `depth`, for each existing tree node `cur` at the depth `depth - 1`, create two cupcakes with value `flavor` as `cur`'s left subtree root and right subtree root.
- `cur`'s original left subtree should be the left subtree of the new left subtree root.
- `cur`'s original right subtree should be the right subtree of the new right subtree root.
- If `depth == 1` that means there is no depth `depth - 1` at all, then create a cupcake with value `flavor` as the new root of the whole original tree, and the original tree is the new root's left subtree.

Evaluate the time and space complexity of your function. Define your variables and provide a rationale for why you believe your solution has the stated time and space complexity. Assume the input tree is balanced when calculating time complexity.

```
class TreeNode():
    def __init__(self, sweetness, left=None, right=None):
        self.val = sweetness
        self.left = left
        self.right = right

def insert_row(display, flavor, depth):
    pass
```

```
"""
        Chocolate
        /        \
    Vanilla    Strawberry
                /     \
         Chocolate    Red Velvet
"""
# Using build_tree() function included at top of page
cupcake_flavors = ["Chocolate", "Vanilla", "Strawberry", None, None, "Chocolate", "Red Velvet"]
display = build_tree(cupcake_flavors)

# Using print_tree() function included at top of page
print_tree(insert_row(display, "Mocha", 3))
```

Example Output:

```
['Chocolate', 'Vanilla', 'Strawberry', 'Mocha', 'Mocha', 'Mocha', 'Mocha', None, None, None, None, 'Chocolate', None, None, 'Red Velvet']
Explanation:
Tree with inserted row:
                   Chocolate
                   /        \
             Vanilla        Strawberry
             /    \         /       \
          Mocha   Mocha  Mocha     Mocha
                         /             \
                      Chocolate       Red Velvet
```
Problem 6: Maximum Icing Difference

In your bakery, you're planning a display of cupcakes where each cupcake is represented by a node in a binary tree. The sweetness level of the icing on each cupcake is stored in the node's value. You want to identify the maximum icing difference between any two cupcakes where one cupcake is an ancestor of the other in the display.

Given the `root` of a binary tree representing the cupcake display, find the maximum value `v` for which there exist different cupcakes `a` and `b` where `v = |a.val - b.val|` and `a` is an ancestor of `b`.

A cupcake `a` is an ancestor of `b` if either any child of `a` is equal to `b`, or any child of `a` is an ancestor of `b`.

Evaluate the time and space complexity of your function. Define your variables and provide a rationale for why you believe your solution has the stated time and space complexity. Assume the input tree is balanced when calculating time complexity.

```
class TreeNode():
    def __init__(self, sweetness, left=None, right=None):
        self.val = sweetness
        self.left = left
        self.right = right

def max_icing_difference(root):
    pass
```

Example Usage:

```
"""
            8
           /  \
         3     10
        / \      \
       1   6     14
          /  \    /
         4    7  13
"""

# Using build_tree() function included at top of page
sweetness_levels = [8, 3, 10, 1, 6, None, 14, None, None, 4, 7, 13]
display = build_tree(sweetness_levels)

print(max_icing_difference(display))
```

Example Output:

```
7
Explanation: The maximum icing difference is between the root cupcake (8) and a descendant with
sweetness level 1, yielding a difference of |8 - 1| = 7.
```

  

### Problem Set Version 2

Problem 1: Mapping a Haunted Hotel IIProblem 2: Reverse Odd Levels of the HotelProblem 3: Purging Unwanted GuestsProblem 4: Kth Spookiest Room in the HotelProblem 5: Lowest Common Ancestor of Youngest ChildrenProblem 6: Topsy Turvy
````