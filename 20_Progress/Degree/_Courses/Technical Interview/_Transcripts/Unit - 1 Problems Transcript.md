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
# Unit - 1 Problems Transcript
**Captured:** 2026-10-08
**Source:**
## Session - 1
Paste the untouched transcript below, inside the fence. Do not edit, clean, or summarize here — this file is the raw capture. Summarization happens in the linked brief once `/transcript-to-brief` runs.
````
## Unit 1: Session 1

### Course Structure | Strings & Arrays

Students will be introduced to the foundational concepts of strings and arrays in Python, which are essential for solving common coding problems. They will also learn about the UPI method, a structured approach to planning and solving technical interview questions. The lesson will cover basic operations like accessing, iterating over, and modifying lists, as well as performing advanced string manipulation.

You can find session recordings and more on the [resources tab](https://courses.codepath.org/courses/tip103/unit/1#!resources). Session slide decks are available on the [overview tab](https://courses.codepath.org/courses/tip103/unit/1#!overview).

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

Problem 1: Hunny Hunt

Write a function `linear_search()` to help Winnie the Pooh locate his lost items. The function accepts a list `items` and a `target` value as parameters. The function should return the first index of `target` in `items`, and `-1` if `target` is not in `items`. Do not use any built-in functions.

```
def linear_search(items, target):
	pass
```

Example Usage:

```
items = ['haycorn', 'haycorn', 'haycorn', 'hunny', 'haycorn']
target = 'hunny'
linear_search(items, target)

items = ['bed', 'blue jacket', 'red shirt', 'hunny']
target = 'red balloon'
linear_search(items, target)
```

Example Output:

```
3
-1
```

💡Hint: Python Basics

Problem 2: Bouncy, Flouncy, Trouncy, Pouncy

Tigger has developed a new programming language Tiger with only **four** operations and **one** variable `tigger`.

- `bouncy` and `flouncy` both **increment** the value of the variable `tigger` by `1`.
- `trouncy` and `pouncy` both **decrement** the value of the variable `tigger` by `1`.

Initially, the value of `tigger` is `1` because he's the only tigger around! Given a list of strings `operations` containing a list of operations, return the **final** value of `tigger` after performing all the operations.

```
def final_value_after_operations(operations):
	pass
```

Example Usage:

```
operations = ["trouncy", "flouncy", "flouncy"]
final_value_after_operations(operations)

operations = ["bouncy", "bouncy", "flouncy"]
final_value_after_operations(operations)
```

Example Output:

```
2
4
```
Problem 3: T-I-Double Guh-Er II

T-I-Double Guh-Er: That spells Tigger! Write a function `tiggerfy()` that accepts a string `word` and returns a new string that removes any substrings `t`, `i`, `gg`, and `er` from `word`. The function should be case insensitive.

```
def tiggerfy(word):
	pass
```

Example Usage:

```
word = "Trigger"
tiggerfy(word)

word = "eggplant"
tiggerfy(word)

word = "Choir"
tiggerfy(word)
```

Example Output:

```
"r"
"eplan"
"chor"
```

  

💡Hint: String Methods

When working with strings, it's very common to need to process the string to convert all characters to upper or lower case, remove punctuation, handle whitespace, etc. Luckily, Python has several built-in string methods for common string operations. Practice your research skills by looking up common string methods to find one that will help you implement this function, or check out the Unit 1 cheatsheet for the most essential ones.

Problem 4: Non-decreasing Array

Given an array `nums` with `n` integers, write a function `non_decreasing()` that checks if `nums` could become non-decreasing by modifying **at most one element**.

We define an array is non-decreasing if `nums[i] <= nums[i + 1]` holds for every `i` (**0-based**) such that (`0 <= i <= n - 2`).

```
def non_decreasing(nums):
	pass
```

Example Usage:

```
nums = [4, 2, 3]
non_decreasing(nums)

nums = [4, 2, 1]
non_decreasing(nums)
```

Example Output:

```
True
False
```
Problem 5: Missing Clues

Christopher Robin set up a scavenger hunt for Pooh, but it's a blustery day and several hidden clues have blown away. Write a function `find_missing_clues()` to help Christopher Robin figure out which clues he needs to remake. The function accepts two integers `lower` and `upper` and a unique integer array `clues`. All elements in `clues` are within the inclusive range `[lower, upper]`.

A clue `x` is considered missing if `x` is in the range `[lower, upper]` and `x` is not in `clues`.

Return the shortest sorted list of ranges that exactly covers all the missing numbers. That is, no element of `clues` is included in any of the ranges, and each missing number is covered by one of the ranges.

```
def find_missing_clues(clues, lower, upper):
	pass
```

Example Usage:

```
clues = [0, 1, 3, 50, 75]
lower = 0
upper = 99
find_missing_clues(clues, lower, upper)

clues = [-1]
lower = -1
upper = -1
find_missing_clues(clues, lower, upper)
```

Example Output:

```
[[2, 2], [4, 49], [51, 74], [76, 99]]
[]
```

✨ AI Hint: Nested Lists

[](https://courses.codepath.org/courses/tip103/unit/1#!cheatsheet)

💡Hint: String Methods

When working with strings, it's very common to need to process the string to convert all characters to upper or lower case, remove punctuation, handle whitespace, etc. Luckily, Python has several built-in string methods for common string operations. Practice your research skills by looking up common string methods to find one that will help you implement this function, or check out the Unit 1 cheatsheet for the most essential ones.

Problem 6: Vegetable Harvest

Rabbit is collecting carrots from his garden to make a feast for Pooh and friends. Write a function `harvest()` that accepts a 2D `n x m` matrix `vegetable_patch` and returns the number of carrots that are ready to harvest in the vegetable patch. A carrot is ready to harvest if `vegetable_patch[i][j]` has value `'c'`.

Assume `n = len(vegetable_patch)` and `m = len(vegetable_patch[0])`. `0 <= i < n` and `0 <= j < m`.

```
def harvest(vegetable_patch):
	pass
```

Example Usage:

```
vegetable_patch = [
	['x', 'c', 'x'],
	['x', 'x', 'x'],
	['x', 'c', 'c'],
	['c', 'c', 'c']
]
harvest(vegetable_patch)
```

Example Output:

```
6
```

**✍️ Write this down:** once your function works, run `harvest()` on this patch and write down what it returns:

```
vegetable_patch = [
	['c', 'x', 'c', 'x', 'c'],
	['x', 'c', 'x', 'c', 'x'],
	['c', 'c', 'x', 'c', 'c'],
	['x', 'x', 'c', 'x', 'c']
]
```

You'll need it for the special activity at the end of today's session.

✨ AI Hint: Nested Loops

_Key Skill: Use AI to explain code concepts_

This problem may benefit from an understanding of nested loops. For a refresher, check out the Advanced section of the [Unit 1 Cheatsheet](https://courses.codepath.org/courses/tip103/unit/1#!cheatsheet).

Want to dive deeper? Ask an AI tool like ChatGPT or GitHub Copilot to show you examples of how to work with nested loops in Python.

Problem 7: Eeyore's House

Eeyore has collected two piles of sticks to rebuild his house and needs to choose pairs of sticks whose lengths are the right proportion. Write a function `good_pairs()` that accepts two integer arrays `pile1` and `pile2` where each integer represents the length of a stick. The function also accepts a positive integer `k`. The function should return the number of **good** pairs.

A pair `(i, j)` is called **good** if `pile1[i]` is divisible by `pile2[j] * k`. Assume `0 <= i <= len(pile1) - 1` and `0 <= j <= len(pile2) - 1`.

```
def good_pairs(pile1, pile2, k):
	pass
```

Example Usage:

```
pile1 = [1, 3, 4]
pile2 = [1, 3, 4]
k = 1
good_pairs(pile1, pile2, k)

pile1 = [1, 2, 4, 12]
pile2 = [2, 4]
k = 3
good_pairs(pile1, pile2, k)
```

Example Output:

```
5
2
```

💡 Remainders with Modulus Division

This problem requires you to know how to find the remainder of a division operation. We can do this with something called modulus division. If you are unfamiliar with how to do this in Python, checkout the Unit 1 cheatsheet or do your own research.

Problem 8: Local Maximums

Write a function `local_maximums()` that accepts an `n x n` integer matrix `grid` and returns an integer matrix `local_maxes` of size `(n - 2) x (n - 2)` such that:

- `local_maxes[i][j]` is equal to the largest value of the `3 x 3` matrix in `grid` centered around row `i + 1` and column `j + 1`.

In other words, we want to find the largest value in every contiguous `3 x 3` matrix in `grid`.

```
def local_maximums(grid):
	pass
```

[![4x4 matrix with cells numbered according to Example 1 input next to 2x2 matrix numbered according Example 1 output](https://courses.codepath.org/course_images/tip103/unit1_session1/local_maxes_ex1.png "4x4 matrix with cells numbered according to Example 1 input next to 2x2 matrix numbered according Example 1 output")](https://courses.codepath.org/course_images/tip103/unit1_session1/local_maxes_ex1.png)

Example Usage:

```
grid = [
	[9, 9, 8, 1],
	[5, 6, 2, 6],
	[8, 2, 6, 4],
	[6, 2, 2, 2]
]
local_maximums(grid)

grid = [
	[1, 1, 1, 1, 1],
	[1, 1, 1, 1, 1],
	[1, 1, 2, 1, 1],
	[1, 1, 1, 1, 1],
	[1, 1, 1, 1, 1]
]
local_maximums(grid)
```

Example Output:

```
[[9, 9], [8, 6]]
[[2, 2, 2], [2, 2, 2], [2, 2, 2]]
```
````
## Session - 2
Paste the untouched transcript below, inside the fence. Do not edit, clean, or summarize here — this file is the raw capture. Summarization happens in the linked brief once `/transcript-to-brief` runs.

````
## Unit 1: Session 2

### UMPIRE | Strings & Arrays

Students will build upon the concepts introduced in the first session by tackling more complex string and array problems. They will deepen their understanding of manipulating data structures, including reversing words in a sentence, summing digits, and handling list operations such as finding exclusive elements between two lists. The session will also introduce them to important problem-solving techniques, like using loops and conditionals to manipulate numbers and strings.

You can find session recordings and more on the [resources tab](https://courses.codepath.org/courses/tip103/unit/1#!resources). Session slide decks are available on the [overview tab](https://courses.codepath.org/courses/tip103/unit/1#!overview).

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

Problem 1: Transpose Matrix

Write a function `transpose()` that accepts a 2D integer array `matrix` and returns the transpose of `matrix`. The transpose of a matrix is the matrix flipped over its main diagonal, swapping the rows and columns.

[![3x3 matrix before and after being transposed](https://courses.codepath.org/course_images/tip103/unit1_session2/matrix_transpose_ex1.png "3x3 matrix before and after being transposed")](https://courses.codepath.org/course_images/tip103/unit1_session2/matrix_transpose_ex1.png)

```
def transpose(matrix):
    pass
```

Example Usage

```
matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]
transpose(matrix)

matrix = [
    [1, 2, 3],
    [4, 5, 6]
]
transpose(matrix)
```

Example Output:

```
[
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9]
]
[
    [1, 4],
    [2, 5],
    [3, 6]
]
```

✨ AI Hint: Nested Lists

_Key Skill: Use AI to explain code concepts_

This problem may benefit from an understanding of nested data, particularly nested lists. For a refresher, check out the Advanced section of the [Unit 1 Cheatsheet](https://courses.codepath.org/courses/tip103/unit/1#!cheatsheet).

Want to dive deeper? Ask an AI tool like ChatGPT or GitHub Copilot to show you examples of how to work with nested lists in Python.

✨ AI Hint: Nested Loops

_Key Skill: Use AI to explain code concepts_

This problem may benefit from an understanding of nested loops. For a refresher, check out the Advanced section of the [Unit 1 Cheatsheet](https://courses.codepath.org/courses/tip103/unit/1#!cheatsheet).

Want to dive deeper? Ask an AI tool like ChatGPT or GitHub Copilot to show you examples of how to work with nested loops in Python.

Problem 2: Two-Pointer Reverse List

Write a function `reverse_list()` that takes in a list `lst` and returns elements of the list in reverse order. The list should be reversed in-place without using list slicing (e.g. `lst[::-1]`).

Instead, use the two-pointer approach, which is a common technique in which we initialize two variables (also called a pointer in this context) to track different indices or places in a list or string, then moves the pointers to point at new indices based on certain conditions. In the most common variation of the two-pointer approach, we initialize one variable to point at the beginning of a list and a second variable/pointer to point at the end of list. We then shift the pointers to move inwards through the list towards each other, until our problem is solved or the pointers reach the opposite ends of the list.

```
def reverse_list(lst):
    pass
```

Example Usage

```
lst = ["pooh", "christopher robin", "piglet", "roo", "eeyore"]
reverse_list(lst)
```

Example Output:

```
["eeyore", "roo", "piglet", "christopher robin", "pooh"]
```

💡Hint: While Loops

This problem may benefit from a while loop! If you are unfamiliar with while loop syntax in Python, use your independent research skills or the Python Syntax section of the unit cheatsheet to learn more.

Problem 3: Remove Duplicates

Write a function `remove_dupes()` that accepts a sorted array `items`, and removes the duplicates in-place such that each element appears only once. Return the length of the modified array. You may not create another array; your implementation must modify the original input array `items`.

```
def remove_dupes(items):
    pass
```

Example Usage

```
items = ["extract of malt", "haycorns", "honey", "thistle", "thistle"]
remove_dupes(items)

items = ["extract of malt", "haycorns", "honey", "thistle"]
remove_dupes(items)
```

Example Output:

```
4
4
```

💡Hint: Two Pointer Technique

Problem 4: Sort Array by Parity

Given an integer array `nums`, write a function `sort_by_parity()` that moves all the even integers to the beginning of the array, followed by all the odd integers.

Return _**any array** that satisfies this condition_.

```
def sort_by_parity(nums):
    pass
```

Example Usage

```
nums = [3, 1, 2, 4]
sort_by_parity(nums)

nums = [0]
sort_by_parity(nums)
```

Example Output:

```
[2, 4, 3, 1]
[0]
```

💡 Remainders with Modulus Division

This problem requires you to know how to find the remainder of a division operation. We can do this with something called modulus division. If you are unfamiliar with how to do this in Python, checkout the Unit 1 cheatsheet or do your own research.

Problem 5: Container with Most Honey

Christopher Robin is helping Pooh construct the biggest hunny jar possible.

Help him write a function that accepts an integer array `heights` of length `n`. The height of each element is given by `heights[i]`.

There are `n` vertical lines drawn such that the two endpoints of the `ith` line are `(i, 0)` and `(i, heights[i])`.

Find two lines that, together with the x-axis, form the container that holds the most honey.

Return the maximum amount of honey a container can store.

**Notice** that you may not slant the container.

```
def most_honey(heights):
	pass
```

[![Bar graph showing heights of lines in Example 1, with blue section between lines with height 8 and 7](https://courses.codepath.org/course_images/tip103/unit1_session2/container_with_most_water_ex1.jpg "Bar graph showing heights of lines in Example 1, with blue section between lines with height 8 and 7")](https://courses.codepath.org/course_images/tip103/unit1_session2/container_with_most_water_ex1.jpg)

Example Usage

```
height = [1, 8, 6, 2, 5, 4, 8, 3, 7]
most_honey(height)

height = [1, 1]
most_honey(height)
```

Example Output:

```
49
1
```
Problem 6: Merge Intervals

You are given an array of intervals, where each interval is represented as `[start, end]`.

Write a function `merge_intervals(intervals)` that merges all overlapping intervals and returns a new array of the merged, non-overlapping intervals.

```
def merge_intervals(intervals):
	pass
```

Example Usage

```
intervals = [[1, 3], [2, 6], [8, 10], [15, 18]]
merge_intervals(intervals)

intervals = [[1, 4], [4, 5]]
merge_intervals(intervals)
```

Example Output:

```
[[1, 6], [8, 10], [15, 18]]
[[1, 5]]
```

💡Hint: Sorting Lists

This problem may benefit from knowing how to sort a list. Python provides a couple options for sorting lists and other iterables, including `sort()` and `sorted()`. Use your independent research skills or the unit cheatsheet to research how these functions work!

  

### Problem Set Version 2

Problem 1: Matrix Addition

Write a function `add_matrices()` that accepts two `n x m` matrices `matrix1` and `matrix2`. The function should return an `n x m` matrix `sum_matrix` that is the sum of the given matrices such that each value in `sum_matrix` is the sum of values of corresponding elements in `matrix1` and `matrix2`.

```
def add_matrices(matrix1, matrix2):
    pass
```

Example Usage

```
matrix1 = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

matrix2 = [
    [9, 8, 7],
    [6, 5, 4],
    [3, 2, 1]
]

add_matrices(matrix1, matrix2)
```

Example Output:

```
[
    [10, 10, 10],
    [10, 10, 10],
    [10, 10, 10]
]
```

✨ AI Hint: Nested Lists

[](https://courses.codepath.org/courses/tip103/unit/1#!cheatsheet)

✨ AI Hint: Nested Loops

[](https://courses.codepath.org/courses/tip103/unit/1#!cheatsheet)

Problem 2: Two-Pointer Palindrome

Write a function `is_palindrome()` that takes in a string `s` as a parameter and returns `True` if the string is a palindrome and `False` otherwise. You may assume the string contains only lowercase alphabetic characters.

The function must use the two-pointer approach, which is a common technique in which we initialize two variables (also called a pointer in this context) to track different indices or places in a list or string, then moves the pointers to point at new indices based on certain conditions. In the most common variation of the two-pointer approach, we initialize one variable to point at the beginning of a list and a second variable/pointer to point at the end of list. We then shift the pointers to move inwards through the list towards each other, until our problem is solved or the pointers reach the opposite ends of the list.

```
def is_palindrome(s):
    pass
```

Example Usage

```
s = "madam"
is_palindrome(s)

s = "madamweb"
is_palindrome(s)
```

Example Output:

```
True
False
```

💡Hint: While Loops

💡Hint: Two Pointer Technique

Problem 3: Squash Spaces

Problem 4: Two-Pointer Two Sum

Problem 5: Three Sum

Given an integer array `nums`, return all the triplets `[nums[i], nums[j], nums[k]]` such that `i != j`, `i != k`, and `j != k`, and `nums[i] + nums[j] + nums[k] == 0`.

Notice that the solution set must not contain duplicate triplets.

```
def three_sum(nums):
    pass
```

Example Usage

```
nums = [-1, 0, 1, 2, -1, -4]
three_sum(nums)

nums = [0, 1, 1]
three_sum(nums)

nums = [0, 0, 0]
three_sum(nums)
```

Example Output:

```
[[-1, -1, 2], [-1, 0, 1]]
[]
[[0, 0, 0]]
```

💡Hint: Sorting Lists

Problem 6: Insert Interval
````
