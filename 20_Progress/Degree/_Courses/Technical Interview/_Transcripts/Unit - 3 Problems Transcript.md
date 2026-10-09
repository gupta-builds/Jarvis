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
# Unit - 3 Problems Transcript

**Captured:** 2026-10-08
**Source:**

## Session - 1
Paste the untouched transcript below, inside the fence. Do not edit, clean, or summarize here — this file is the raw capture. Summarization happens in the linked brief once `/transcript-to-brief` runs.

````
## Unit 3: Session 1

### Recursion & Memoization | Recursion

In this session, students will dive deep into the concept of recursion, a fundamental programming technique used to solve problems by breaking them down into simpler, self-similar subproblems. The session will cover how to write recursive functions - specifically how to identify the base case and the importance of recursive calls, equipping students with the skills needed to tackle recursive programming questions.

You can find session recordings and more on the [resources tab](https://courses.codepath.org/courses/tip103/unit/3#!resources). Session slide decks are available on the [overview tab](https://courses.codepath.org/courses/tip103/unit/3#!overview).

---

## 🎢 Part 1: Instructor Led Session

We'll spend the first portion of the synchronous class time in large groups, where the instructor will lead class instruction for 30-45 minutes.

## 🧑‍💻 Part 2: Breakout Session

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

Problem 1: Counting the Layers of a Sandwich

You're working at a deli, and need to count the layers of a sandwich to make sure you made the order correctly. Each layer is represented by a nested list. Given a list of lists `sandwich` where each list `[]` represents a sandwich layer, write a recursive function `count_layers()` that returns the total number of sandwich layers.

Evaluate the time and space complexity of your solution. Define your variables and provide a rationale for why you believe your solution has the stated time and space complexity.

```
def count_layers(sandwich):
    pass
```

Example Usage:

```
sandwich1 = ["bread", ["lettuce", ["tomato", ["bread"]]]]
sandwich2 = ["bread", ["cheese", ["ham", ["mustard", ["bread"]]]]]

print(count_layers(sandwich1))
print(count_layers(sandwich2))
```

Example Output:

```
4
5
```

💡 Hint: Recursion

Problem 2: Reversing Deli Orders

The deli counter is busy, and orders have piled up. To serve the last customer first, you need to reverse the order of the deli orders. Given a string `orders` where each individual order is separated by a single space, write a recursive function `reverse_orders()` that returns a new string with the orders reversed.

Evaluate the time and space complexity of your solution. Define your variables and provide a rationale for why you believe your solution has the stated time and space complexity.

```
def reverse_orders(orders):
    pass
```

Example Usage:

```
print(reverse_orders("Bagel Sandwich Coffee"))
```

Example Output:

```
Coffee Sandwich Bagel
```

💡 Hint: Recursive Helpers

Problem 3: Sharing the Coffee

The deli staff is in desperate need of caffeine to keep them going through their shift and has decided to divide the coffee supply equally among themselves. Each batch of coffee is stored in containers of different sizes and must remain whole when distributed among n staff. Write a recursive function `can_split_coffee()` that accepts a list of integers `coffee` representing the volume of each batch of coffee and returns `True` if the coffee can be split evenly by volume among `n` staff and `False` otherwise.

Evaluate the time and space complexity of your solution. Define your variables and provide a rationale for why you believe your solution has the stated time and space complexity.

```
def can_split_coffee(coffee, n):
pass
```

Example Usage:

```
print(can_split_coffee([4, 4, 8], 2))
print(can_split_coffee([5, 10, 15], 4))
```

Example Output:

```
True
False
```
Problem 4: Super Sandwich

A regular at the deli has requested a new order made by merging two different sandwiches on the menu together. Given the heads of two linked lists `sandwich_a` and `sandwich_b` where each node in the lists contains a sandwich layer, write a recursive function `merge_orders()` that merges the two sandwiches together in the pattern:

`a1 -> b1 -> a2 -> b2 -> a3 -> b3 -> ...`

Return the head of the merged sandwich.

Evaluate the time and space complexity of your solution. Define your variables and provide a rationale for why you believe your solution has the stated time and space complexity.

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

def merge_orders(sandwich_a, sandwich_b)
    pass
```

Example Usage:

```
sandwich_a = Node('Bacon', Node('Lettuce', Node('Tomato')))
sandwich_b = Node('Turkey', Node('Cheese', Node('Mayo')))
sandwich_c = Node('Bread')

print_linked_list(merge_orders(sandwich_a, sandwich_b))
print_linked_list(merge_orders(sandwich_a, sandwich_c))
```

Example Output:

```
Bacon -> Turkey -> Lettuce -> Cheese -> Tomato -> Mayo
Bacon -> Bread -> Lettuce -> Tomato
```
Problem 5: Super Sandwich II

Below is an iterative solution to the `merge_orders()` function from the previous problem. Compare your recursive solution to the iterative solution below.

Discuss with your podmates. Which solution do you prefer? How do they compare on time complexity? Space complexity?

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

def merge_orders(sandwich_a, sandwich_b):
    # If either list is empty, return the other
    if not sandwich_a:
        return sandwich_b
    if not sandwich_b:
        return sandwich_a

    # Start with the first node of sandwich_a
    head = sandwich_a
    
    # Loop through both lists until one is exhausted
    while sandwich_a and sandwich_b:
        # Store the next pointers
        next_a = sandwich_a.next
        next_b = sandwich_b.next
        
        # Merge sandwich_b after sandwich_a
        sandwich_a.next = sandwich_b
        
        # If there's more in sandwich_a, add it after sandwich_b
        if sandwich_a:
            sandwich_b.next = next_a
        
        # Move to the next nodes
        sandwich_a = next_a
        sandwich_b = next_b

    # Return the head of the new merged list
    return head
```
Problem 6: Ternary Expression

Given a string `expression` representing arbitrarily nested ternary expressions, evaluate the expression, and return its result as a string.

You can always assume that the given expression is valid and only contains digits, `'?'`, `':'`, `'T'`, and `'F'` where `'T'` is `True` and `'F'` is `False`. All the numbers in the expression are one-digit numbers (i.e., in the range `[0, 9]`).

Ternary expressions use the following syntax:

`condition ? true_choice : false_choice`

- `condition` is evaluate first and determines which choice to make.
    - `true_choice` is taken if `condition` evaluates to `True`
    - `false_choice` is taken if `condition` evaluates to `False`

The conditional expressions group right-to-left, and the result of the expression will always evaluate to either a digit, `'T'` or `'F'`.

We have provided an iterative solution that uses an explicit stack. Implement a recursive solution `evaluate_ternary_expression_recursive()`.

```
def evaluate_ternary_expression_iterative(expression):
    stack = []
    
    # Traverse the expression from right to left
    for i in range(len(expression) - 1, -1, -1):
        char = expression[i]
        
        if stack and stack[-1] == '?':
            stack.pop()  # Remove the '?'
            true_expr = stack.pop()  # True expression
            stack.pop()  # Remove the ':'
            false_expr = stack.pop()  # False expression
            
            if char == 'T':
                stack.append(true_expr)
            else:
                stack.append(false_expr)
        else:
            stack.append(char)
    
    return stack[0]

def evaluate_ternary_expression_recursive(expression):
    pass
```

Example Usage:

```
print(evaluate_ternary_expression_recursive("T?2:3"))
print(evaluate_ternary_expression_recursive("F?1:T?4:5"))
print(evaluate_ternary_expression_recursive("T?T?F:5:3"))
```

Example Output:

```
2
Example 1 Explanation: If True, then result is 2; otherwise result is 3.

4
Example Explanation: The conditional expressions group right-to-left. Using parentheses, 
it is read/evaluated as:
"(F ? 1 : (T ? 4 : 5))" --> "(F ? 1 : 4)" --> "4"
or "(F ? 1 : (T ? 4 : 5))" --> "(T ? 4 : 5)" --> "4"

F
Explanation: The conditional expressions group right-to-left. Using parentheses, 
it is read/evaluated as:
"(T ? (T ? F : 5) : 3)" --> "(T ? F : 3)" --> "F"
"(T ? (T ? F : 5) : 3)" --> "(T ? F : 5)" --> "F"
```

### Problem Set Version 2

Problem 1: Mapping Atlantis' Hidden ChambersProblem 2: Finding the Longest Sequence of Trident GemsProblem 3: Last Building StandingProblem 4: Merging MissionsProblem 5: Merging Missions IIProblem 6: Decoding Ancient Atlantean Scrolls
````
## Session - 2

````
## Unit 3: Session 2

### Stacks, Queues & OOP | Stacks, Queues, Two-Pointer

In this session, we will continue to work with linear data structures like strings and arrays. Students will strengthen their ability to solve problems using stacks, queues, and the two pointer method.

You can find session recordings and more on the [resources tab](https://courses.codepath.org/courses/tip103/unit/3#!resources). Session slide decks are available on the [overview tab](https://courses.codepath.org/courses/tip103/unit/3#!overview).

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

To build a long-term organized approach to problem solving, we’ll start with three main steps. We’ll refer to them as **UPI: Understand, Plan, and Implement**.

We’ll apply these three steps to most of the problems we’ll see in the first half of the course.

We will learn to:

- **Understand** the problem,
- **Plan** a solution step-by-step, and
- **Implement** the solution

Comment on UPI

UPI Example

[![Example UPI](https://courses.codepath.org/course_images/tip103/upi.png "Example UPI")](https://courses.codepath.org/course_images/tip103/upi.png)

---

### Problem Set Version 1

Problem 1: Blueprint Approval Process

You are in charge of overseeing the blueprint approval process for various architectural designs. Each blueprint has a specific complexity level, represented by an integer. Due to the complex nature of the designs, the approval process follows a strict order:

1. Blueprints with lower complexity should be reviewed first.
2. If a blueprint with higher complexity is submitted, it must wait until all simpler blueprints have been approved.

Your task is to simulate the blueprint approval process using a queue. You will receive a list of blueprints, each represented by their complexity level in the order they are submitted. Process the blueprints such that the simpler designs (lower numbers) are approved before more complex ones.

Return the order in which the blueprints are approved.

```
def blueprint_approval(blueprints):
    pass
```

Example Usage:

```
print(blueprint_approval([3, 5, 2, 1, 4])) 
print(blueprint_approval([7, 4, 6, 2, 5])) 
```

Example Output:

```
[1, 2, 3, 4, 5]
[2, 4, 5, 6, 7]
```
Problem 2: Build the Tallest Skyscraper

You are given an array `floors`. Each number in `floors` is the height of one building floor. Use the floors to build skyscrapers. Place the floors one at a time, in the same order they appear in `floors`. You cannot sort or reorder the floors.

Follow these rules:

1. The first floor starts the first skyscraper.
2. If the next floor's height is less than or equal to the height of the top floor of the current skyscraper (the one you are building now), place it on top of the current skyscraper.
3. If the next floor is taller than the top floor of the current skyscraper, start a new skyscraper with it. The new skyscraper becomes the current skyscraper.
4. You can only add floors to the current skyscraper. You cannot go back and add floors to an earlier skyscraper.

Return the number of skyscrapers you build. If `floors` is empty, return `0`.

```
def build_skyscrapers(floors):
    pass
```

Example Usage:

```
print(build_skyscrapers([10, 5, 8, 3, 7, 2, 9])) 
print(build_skyscrapers([7, 3, 7, 3, 5, 1, 6]))  
print(build_skyscrapers([8, 6, 4, 7, 5, 3, 2])) 
```

Example Output:

```
4
Example 1 Explanation: Place the floors in order.
Skyscraper 1: [10, 5]. The next floor, 8, is taller than 5, so start a new skyscraper.
Skyscraper 2: [8, 3]. The next floor, 7, is taller than 3, so start a new skyscraper.
Skyscraper 3: [7, 2]. The next floor, 9, is taller than 2, so start a new skyscraper.
Skyscraper 4: [9].
That makes 4 skyscrapers.

4
2
```
Problem 3: Dream Corridor Design

You are an architect designing a corridor for a futuristic dream space. The corridor is represented by a list of integer values where each value represents the width of a segment of the corridor. Your goal is to find two segments such that the corridor formed between them (including the two segments) has the maximum possible area. The area is defined as the minimum width of the two segments multiplied by the distance between them.

You need to return the maximum possible area that can be achieved.

```
def max_corridor_area(segments):
    pass
```

Example Usage:

```
print(max_corridor_area([1, 8, 6, 2, 5, 4, 8, 3, 7])) 
print(max_corridor_area([1, 1])) 
```

Example Output:

```
49
1
```
Problem 4: Dream Building Layout

You are an architect tasked with designing a dream building layout. The building layout is represented by a string `s` of even length `n`. The string consists of exactly `n / 2` left walls `'['` and `n / 2` right walls `']'`.

A layout is considered balanced if and only if:

- It is an empty space, or
- It can be divided into two separate balanced layouts, or
- It can be surrounded by left and right walls that balance each other out.

You may swap the positions of any two walls any number of times.

Return the minimum number of swaps needed to make the building layout balanced.

```
def min_swaps(s):
    pass
```

Example Usage:

```
print(min_swaps("][][")) 
print(min_swaps("]]][[[")) 
print(min_swaps("[]"))  
```

Example Output:

```
1
2
0
```
Problem 5: Designing a Balanced Room

You are designing a room layout represented by a string `s` consisting of walls `'('`, `')'`, and decorations in the form of lowercase English letters.

Your task is to remove the minimum number of walls `'('` or `')'` in any positions so that the resulting room layout is balanced and return any valid layout.

Formally, a room layout is considered balanced if and only if:

- It is an empty room (an empty string), contains only decorations (lowercase letters), or
- It can be represented as AB (A concatenated with B), where A and B are valid layouts, or
- It can be represented as (A), where A is a valid layout.

```
def make_balanced_room(s):
    pass
```

Example Usage:

```
print(make_balanced_room("art(t(d)e)sign)")) 
print(make_balanced_room("d)e(s)ign")) 
print(make_balanced_room("))((")) 
```

Example Output:

```
art(t(d)e)sign
# Note: other outputs such as "art(t(d)esign)" would also be considered balanced and valid
de(s)ign
```
Problem 6: Time to Complete Each Dream Design

As an architect, you are working on a series of imaginative designs for various dreamscapes. Each design takes a certain amount of time to complete, depending on the complexity of the elements involved. You want to know how many days it will take for each design to be ready for the next one to begin, assuming each subsequent design is more complex and thus takes more time to finish.

You are given an array `design_times` where each element represents the time in days needed to complete a particular design. For each design, determine the number of days you will have to wait until a more complex design (one that takes more days) is ready to begin. If no such design exists for a particular design, return `0` for that position.

Return an array `answer` such that `answer[i]` is the number of days you have to wait after the `i`-th design to start working on a more complex design. If there is no future design that is more complex, keep `answer[i] == 0` instead.

```
def time_to_complete_dream_designs(design_times):
    pass
```

Example Usage:

```
print(time_to_complete_dream_designs([3, 4, 5, 2, 1, 6, 7, 3])) 
print(time_to_complete_dream_designs([2, 3, 1, 4]))  
print(time_to_complete_dream_designs([5, 5, 5, 5]))  
```

Example Output:

```
[1, 1, 3, 2, 1, 1, 0, 0]
[1, 2, 1, 0]
[0, 0, 0, 0]
```
Problem 7: Next Greater Element

You are designing a sequence of dream elements, each represented by a number. The sequence is circular, meaning that the last element is followed by the first. Your task is to determine the next greater dream element for each element in the sequence.

The next greater dream element for a dream element `x` is the first element that is greater than x when traversing the sequence in its natural circular order. If no such dream element exists, return -1 for that dream element.

```
def next_greater_dream(dreams):
    pass
```

Example Usage:

```
print(next_greater_dream([1, 2, 1])) 
print(next_greater_dream([1, 2, 3, 4, 3])) 
```

Example Output:

```
[2, -1, 2]
[2, 3, 4, -1, 4]
```
````