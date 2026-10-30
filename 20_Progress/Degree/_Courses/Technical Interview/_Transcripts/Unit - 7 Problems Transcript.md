---
type: input
status: seed
created: 2026-10-29
updated: 2026-10-29
tags:
  - transcript
input_kind: transcript
related_progress: []
next:
---
# Unit - 7 Problems Transcript
**Date:**
**Participants:**
**Captured with:**
## Raw Transcript
<!-- Paste the untouched transcript inside one fence, no blank lines between turns. Never edit, clean, or summarize it. -->
````
## Unit 7: Session 2

### Peer Mock Interviews | Binary Search, Divide and Conquer

This session covers binary search, recursion, and divide-and-conquer techniques to solve problems efficiently. Tasks include finding cruise lengths, locating cabins, counting checked-in passengers, and determining profitability of excursions. Other challenges involve finding the shallowest route point, conducting a treasure hunt in a grid, and solving music-related problems, all emphasizing optimal performance with logarithmic time complexity.

You can find session recordings and more on the [resources tab](https://courses.codepath.org/courses/tip103/unit/7#!resources). Session slide decks are available on the [overview tab](https://courses.codepath.org/courses/tip103/unit/7#!overview).

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

_**Please Note:**_ **It is not required or expected** that you complete all of the practice problems! In some sessions you may only complete 1 problem and that's okay.

Strengthening your **approach** to problems, and your **ability to speak and engage through the process** are key skills most often underdeveloped for engineers at this stage - focus on those in our small groups for your long term success!

You can always return to problems independently, after class time, to embrace the technical concepts and gain additional practice.

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

Problem 1: Find Millenium Falcon Part I

Han Solo's ship, the Millenium Falcon, has broken down and he's searching for a specific replacement part. As a repair shop owner helping him out, write a function `check_stock()` that takes in a sorted list `inventory` where each element is an integer ID of a part you stock in your shop, and an integer `part_id` representing the integer ID of the part Han Solo is looking for. Return `True` if the `part_id` is in `inventory` and `False` otherwise.

Your solution must have `O(log n)` time complexity.

```
def check_stock(inventory, part_id):
    pass
```

Example Usage:

```
print(check_stock([1, 2, 5, 12, 20], 20))
print(check_stock([1, 2, 5, 12, 20], 100))
```

Example Output:

```
True
False
```

✨ AI Hint: Binary Search

_Key Skill: Use AI to explain code concepts_

This problem requires you to understand the binary search algorithm. To learn more about this topic, check out the Binary Search section of the Unit Cheatsheet.

For more help, you can use an AI tool like ChatGPT or GitHub Copilot to show you examples of the binary search algorithm. Try asking it to explain the concept first, using a real-world analogy. Once you understand the concepts, you can ask it to help you understand how to implement it in Python.

💡 Hint: `O(log n)` Time Complexity

This problem lists the constraint that the solution has `O(log n)` or logarithmic time complexity. To learn more about what that means, take a look at the Logarithmic Time Complexity section of the unit cheatsheet. We recommend implementing your solution using binary search, then reading more about this time complexity **after** attempting this problem.

Problem 2: Find Millenium Falcon Part II

If you implemented your `check_stock()` function from the previous problem iteratively, implement it recursively. If you implemented it recursively, implement it iteratively.

```
def check_stock(inventory, part_id):
    pass
```

Example Usage:

```
print(check_stock([1, 2, 5, 12, 20], 20))
print(check_stock([1, 2, 5, 12, 20], 100))
```

Example Output:

```
True
False
```
Problem 3: Find First and Last Frequency Positions

The Rebel Alliance has intercepted a crucial sequence of encrypted transmissions from the evil Empire. Each transmission is marked with a unique frequency code, represented as integers, and these codes are stored in a sorted array `transmissions`. As a skilled codebreaker for the Rebellion, write a function `find_frequency_positions()` that returns a tuple with the first and last indices of a specific frequency code `target_code` in `transmissions`. If `target_code` does not exist in `transmissions`, return `(-1, -1)`.

Your solution must have `O(log n)` time complexity.

```
def find_frequency_positions(transmissions, target_code):
    pass
```

Example Usage:

```
print(find_frequency_positions([5,7,7,8,8,10], 8))
print(find_frequency_positions([5,7,7,8,8,10], 6))
print(find_frequency_positions([], 0))
```

Example Output:

```
(3, 4)
(-1, -1)
(-1, -1)
```
Problem 4: Smallest Letter Greater Than Target

You are given an array of characters `letters` that is sorted in non-decreasing order, and a character `target`. There are at least two different characters in letters.

Write a function `next_greatest_letter()` that returns the smallest character in `letters` that is lexicographically greater than target. If such a character does not exist, return the first character in `letters`.

Lexicographic order can also be defined as alphabetic order.

Evaluate the time and space complexity of your solution. Define your variables and provide a rationale for why you believe your solution has the stated time and space complexity.

```
def next_greatest_letter(letters, target):
    pass
```

Example Usage:

```
letters = ['a', 'a', 'b', 'c', 'c', 'c', 'e', 'h', 'w']

print(next_greatest_letter(letters, 'a'))
print(next_greatest_letter(letters, 'd'))
print(next_greatest_letter(letters, 'y'))
```

Example Output:

```
b
Example 1 Explanation: The smallest character lexicographically greater than 'a' in letters is 'b'

e
Example 2 Explanation: The smallest character lexicographically greater than 'd' in letters is 'e'

a
Example 3 Explanation: There is no character lexicographically greater than 'y' in letters
so we return letters[0]
```
Problem 5: Find K Closest Planets

You are a starship pilot navigating the galaxy and have a list of planets, each with its distance from your current position on your star map. Given an array of planet distances `planets` sorted in ascending order and your target destination distance `target_distance`, return an array with the `k` planets that are closest to your target distance. The result should also be sorted in ascending order.

Planet with distance `a` is closer to `target_distance` than planet with distance `b` if:

- `|a - target_distance| < |b - target_distance|`
- `|a - target_distance| == |b - target_distance|` and `a < b`

Evaluate the time and space complexity of your solution. Define your variables and provide a rationale for why you believe your solution has the stated time and space complexity.

```
def find_closest_planets(planets, target_distance, k):
    pass
```

Example Usage:

```
planets1 = [100, 200, 300, 400, 500]
planets2 = [10, 20, 30, 40, 50]

print(find_closest_planets(planets1, 350, 3))
print(find_closest_planets(planets2, 25, 2))
```

Example Output:

```
[200, 300, 400]
[20, 30]
```
Problem 6: Sorting Crystals

The Jedi Council has tasked you with organizing a collection of ancient kyber crystals. Each crystal has a unique power level represented by an integer. The kyber crystals are stored in a holocron in a completely random order, but to harness their true power, they must be arranged in ascending order based on their power levels.

Given an unsorted list of crystal power levels `crystals`, write a function that returns `crystals` as a sorted list. Your function must have `O(nlog(n))` time complexity.

```
def sort_crystals(crystals):
    pass
```

Example Usage:

```
print(sort_crystals([5, 2, 3, 1]))
print(sort_crystals([5, 1, 1, 2, 0, 0]))
```

Example Output:

```
[1, 2, 3, 5]
[0, 0, 1, 1, 2, 5]
```

✨ AI Hint: Divide and Conquer

_Key Skill: Use AI to explain code concepts_

Merge sort (and binary search!) are examples of algorithms that use the divide and conquer technique. To learn more about this topic, check out the Divide and Conquer and Merge Sort sections of the Unit Cheatsheet.

If you have more questions, try asking an AI tool like ChatGPT or GitHub Copilot to explain the divide and conquer technique.

You can ask it to provide a real-world analogy to help you understand the concept better. Once you grasp the idea, you can ask it to help you implement a divide and conquer algorithm in Python, such as merge sort or binary search.

✨ AI Hint: Merge Sort

_Key Skill: Use AI to explain code concepts_

This problem requires you to understand the merge sort algorithm. To learn more about this topic, check out the Merge Sort section of the Unit Cheatsheet.

For more help, you can use an AI tool like ChatGPT or GitHub Copilot to show you examples of the merge sort algorithm, and break down each step of the process.

Problem 7: Longest Substring With at Least K Repeating Characters

Given a string `s` and an integer `k`, use a divide and conquer approach to return the length of the longest substring of `s` such that the frequency of each character in substring is greater than or equal to `k`.

If no such substring exists, return `0`.

Evaluate the time and space complexity of your solution. Define your variables and provide a rationale for why you believe your solution has the stated time and space complexity.

```
def longest_substring(s, k):
    pass
```

Example Usage:

```
print(longest_substring("tatooine", 2))
print(longest_substring("chewbacca", 2))
```

Example Output:

```
2
Example 1 Explanation: The longest substring is 'oo' as 'o' is repeated 2 times.

4
Example 2 Explanation: The longest substirng is 'acca' as both 'a' and 'c' are repeated 2 times.
```
````