---
type: input
status: seed
created: 2026-11-03
updated: 2026-11-03
tags:
  - transcript
input_kind: transcript
related_progress: []
next:
---
# Unit - 8 Problems Transcript
**Date:**
**Participants:**
**Captured with:**
## Raw Transcript
<!-- Paste the untouched transcript inside one fence, no blank lines between turns. Never edit, clean, or summarize it. -->
````
## Unit 8: Session 1

### Dynamic Programming & Backtracking | Dynamic Programming

In this session, students will learn how to use a dynamic programming approach and memoization to optimize solutions by breaking down problems into overlapping subproblems and storing results to avoid redundant calculations. Dynamic programming is a key technique for improving the efficiency of algorithms, especially in optimization problems that would otherwise have high time complexity due to repeated work.

You can find session recordings and more on the [resources tab](https://courses.codepath.org/courses/tip103/unit/8#!resources). Session slide decks are available on the [overview tab](https://courses.codepath.org/courses/tip103/unit/8#!overview).

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

Problem 1: Spirit World Wisdom Pyramid

In _Avatar: The Last Airbender_ the Spirit World is a parallel plane of existence where spirits live. In the Spirit World, there exists an ancient pyramid known as the Wisdom Pyramid. Each layer of the pyramid contains mystical numbers that guide the Avatar’s journey. The numbers in each layer are formed by combining the two numbers directly above them from the previous layer.

Given an integer `wisdomLevel`, return the `wisdomLevel`-th (0-indexed) row of the Wisdom Pyramid.

In the Wisdom Pyramid, each number is the sum of the two numbers directly above it from the previous row. The first row of the pyramid (layer 0) starts with the number 1.

Write a function `wisdom_pyramid()` to return the `wisdomLevel`-th row of the pyramid.

```
def wisdom_pyramid(wisdomLevel):
    pass
```

Example Usage:

[![Wisdom Pyramid](https://courses.codepath.org/course_images/tip103/unit12_session1/pascals.gif "Wisdom Pyramid")](https://courses.codepath.org/course_images/tip103/unit12_session1/pascals.gif)

```
print(wisdom_pyramid(3))
print(wisdom_pyramid(0))
print(wisdom_pyramid(5))
```

Example Output:

```
[1, 3, 3, 1]
Example 1 Explanation: The 3rd row of the Wisdom Pyramid is [1, 3, 3, 1].

[1]
Example 2 Explanation: The 0th row of the Wisdom Pyramid is [1].

[1, 5, 10, 10, 5, 1]
Example 3 Explanation: The 5th row of the Wisdom Pyramid is [1, 5, 10, 10, 5, 1].
```

✨ AI Hint: 1-D Dynamic Programming

[](https://courses.codepath.org/courses/tip103/unit/8#!cheatsheet)

Problem 2: Aang and Zuko’s Elemental Duel

Aang and Zuko take turns in a strategic duel to control the elements, with Aang going first. The duel begins with a number `n` representing the strength of the elements on the battlefield.

On each turn, a player must:

1. Choose any `x` such that `0 < x < n` and `n % x == 0`.
2. Reduce the battlefield’s strength by `x`, replacing `n` with `n - x`.

If a player cannot make a move, they lose the duel.

Write a function `aang_wins()` that accepts an integer `n` and returns `True` if Aang wins the duel (assuming both Aang and Zuko play optimally), and `False` otherwise.

Evaluate the time and space complexity of your solution. Define your variables and provide a rationale for why you believe your solution has the stated time and space complexity.

```
def aang_wins(n):
    pass
```

Example Usage:

```
print(aang_wins(2))
print(aang_wins(3))
```

Example Output:

```
True
Example 1 Explanation: Aang reduces the strength by 1, and Zuko has no more moves.

False
Example 2 Explanation: Aang reduces the strength by 1, then Zuko does the same, leaving 
Aang with no moves.
```
Problem 3: Iroh’s Tea Brewing

Uncle Iroh is experimenting with various ingredients to brew the strongest tea. He has a list of ingredients, each with a specific strength value, represented by an integer array `ingredients`. Some ingredients increase the tea's strength (positive values), while others weaken it (negative values). Iroh needs to find the combination of consecutive ingredients that results in the tea with the highest strength value.

Write a function `strongest_tea()` to help Uncle Iroh find the subarray of consecutive ingredients that results in the largest product of strengths, and return that product.

```
def strongest_tea(ingredients):
    pass
```

Example Usage:

```
print(strongest_tea([1, 2, -3, 4]))
print(strongest_tea([-2, -1]))
```

Example Output:

```
4  
Example 1 Explanation: The strongest tea Iroh can brew uses only the last ingredient with strength 4.

2  
Example 2 Explanation: The strongest tea Iroh can brew uses both ingredients: -2 and -1 (-2 * -1 is 2).
```
Problem 4: Toph and Katara's Training Synchronization

Toph and Katara are practicing their bending skills together. Both have different training sequences, but they want to synchronize their moves as much as possible. A synchronized sequence is a common subsequence that appears in both Toph’s and Katara’s training routines while preserving the order of the moves.

Given two strings `katara_moves` and `toph_moves`, return the length of their longest common subsequence. If there is no common subsequence, return `0`.

A subsequence of a string is a new string generated from the original string by deleting some characters (without changing the relative order of the remaining characters).

Using dynamic programming, write a function `training_synchronization()` to calculate the longest common subsequence.

```
def training_synchronization(katara_moves, toph_moves):
    pass
```

Example Usage:

```
print(training_synchronization("waterbend", "earthbend"))
print(training_synchronization("bend", "bend"))
print(training_synchronization("fire", "air"))
```

Example Output:

```
6  
Example 1 Explanation: The longest common subsequence is "erbend" and its length is 6.

4  
Example 2 Explanation: The longest common subsequence is "bend" and its length is 4.

2  
Example 3 Explanation: The longest common subsequence is "ir" and its length is 2.
```

✨ AI Hint: 2-D Dynamic Programming

Because the solution to this problem depends on two different variables, we'll need **2-D dynamic programming** to solve this problem.

To learn more about 2-D dynamic programming, try using an AI tool like ChatGPT or GitHub Copilot to explain the topic, both conceptually and with examples in Python. You can also check out the 2-D Dynamic Programming section of the [Unit 8 Cheatsheet](https://courses.codepath.org/courses/tip103/unit/8#!cheatsheet).

Note that 2-D dynamic programming is **only in scope for TIP103 Assessments**. It is just an extra challenge for TIP102 students 😊.

Problem 5: Aang’s Airbending Journey

Aang is on a journey across a series of floating air platforms, represented by an integer array `platforms`. He starts on the first platform (index `0`), and each element in the array represents the maximum distance Aang can airbend-jump from that platform.

Write a function `aang_journey()` that returns `True` if Aang can reach the last platform, or `False` if it’s impossible.

```
def aang_journey(platforms):
    pass
```

Example Usage:

```
print(aang_journey([2, 3, 1, 1, 4]))
print(aang_journey([3, 2, 1, 0, 4]))
```

Example Output:

```
True  
Example 1 Explanation: Aang can airbend-jump 1 step from platform 0 to platform 1, and then jump 3 steps to the last platform.

False  
Example 2 Explanation: No matter what, Aang is stuck at platform 3 because its maximum jump is 0, making it impossible to reach the last platform.
```
Problem 6: Katara’s Waterbending Mastery

Katara is working on perfecting her waterbending techniques, starting from a basic form `form1` and needing to adapt it to a more advanced form `form2`. To master the advanced form, Katara can perform three types of operations:

- **Insert** a move
- **Delete** a move
- **Replace** a move with another

Write a function `waterbending_mastery()` that calculates the minimum number of operations Katara needs to convert `form1` to `form2`.

```
def waterbending_mastery(form1, form2):
    pass
```

Example Usage:

```
print(waterbending_mastery("tide", "wave"))
print(waterbending_mastery("intention", "execution"))
```

Example Output:

```
3  
Example 1 Explanation:  
tide -> wide (replace 't' with 'w')  
wide -> wade (replace 'i' with 'a')  
wade -> wave (replace 'd' with 'v')

5  
Example 2 Explanation:  
intention -> inention (remove 't')  
inention -> enention (replace 'i' with 'e')  
enention -> exention (replace 'n' with 'x')  
exention -> exection (replace 'n' with 'c')  
exection -> execution (insert 'u')
```
````