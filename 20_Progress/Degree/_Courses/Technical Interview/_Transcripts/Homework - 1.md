---
type: input
status: complete
created: 2026-10-04
updated: 2026-10-04
input_kind: homework
course: "[[20_Progress/Degree/_Courses/Technical Interview/Technical Interview|Technical Interview]]"
tags:
  - homework
  - technical-interview
  - codepath
  - transcript
---
# Homework - 1 — Solutions & Code

**Captured:** 2026-10-04  
**Course:** [[20_Progress/Degree/_Courses/Technical Interview/Technical Interview|Technical Interview (CodePath TIP103)]]  
**Topic:** Unit 1 — Strings, Arrays & Loops  
**Coding Style:** Python 3 algorithmic style patterned on Prof. Joy Upton-Azzam's CSCI 4041 methods (clean loops, explicit edge condition guards, in-place checks, clear invariants).

---

## Question 1: Matrix Traversal

### Problem Description
Write a function `get_sum_of_odds(matrix)` that accepts a 2D list of integers `matrix`. Return a list in the format `[num_odds, sum]` where:
- `num_odds` represents the number of odd numbers in the matrix.
- `sum` represents the sum of all odd numbers in the matrix.

### Professor's Method & Solution
```python
def get_sum_of_odds(matrix):
    """
    Traverses a 2D matrix of integers and returns [num_odds, sum]
    containing the count and sum of all odd integers.
    """
    num_odds = 0
    total_sum = 0
    
    # Traverse each row and element in the 2D matrix
    for row in matrix:
        for val in row:
            if val % 2 != 0:       # Check if value is odd (handles negative odds correctly)
                num_odds += 1
                total_sum += val
                
    return [num_odds, total_sum]
```

### Complexity
- **Time Complexity:** $O(R \times C)$ where $R$ is the number of rows and $C$ is the number of columns, visiting each cell exactly once.
- **Space Complexity:** $O(1)$ auxiliary space beyond the return list.

### Test Cases
```python
# Example 1
matrix1 = [
    [1, 2, 3, 4],
    [5, 6, 7, 8],
    [9, 10, 11, 12]
]
print(get_sum_of_odds(matrix1))  # Output: [6, 36]

# Example 2
matrix2 = [
    [10, -2],
    [-3, 5],
    [4, 8]
]
print(get_sum_of_odds(matrix2))  # Output: [2, 2]

# Example 3 (Edge Case: Empty Matrix)
matrix3 = []
print(get_sum_of_odds(matrix3))  # Output: [0, 0]
```

---

## Question 2: Flowerbed

### Problem Description
You have a long flowerbed in which some of the plots are planted, and some are not. Flowers cannot be planted in adjacent plots.
Given an integer array `flowerbed` containing `0`'s and `1`'s (where `0` means empty and `1` means not empty), and an integer `n`, return `True` if `n` new flowers can be planted without violating the no-adjacent-flowers rule, and `False` otherwise.

### Professor's Method & Solution
```python
def can_place_flowers(flowerbed, n):
    """
    Determines if n new flowers can be planted in the flowerbed
    without violating the no-adjacent-flowers rule using a greedy scan.
    """
    count = 0
    length = len(flowerbed)
    
    for i in range(length):
        if flowerbed[i] == 0:
            # Check left neighbor boundary or if previous plot is empty
            prev_empty = (i == 0 or flowerbed[i - 1] == 0)
            # Check right neighbor boundary or if next plot is empty
            next_empty = (i == length - 1 or flowerbed[i + 1] == 0)
            
            # Plant greedily if both adjacent positions are empty
            if prev_empty and next_empty:
                flowerbed[i] = 1
                count += 1
                if count >= n:
                    return True
                    
    return count >= n
```

### Complexity
- **Time Complexity:** $O(L)$ where $L$ is `len(flowerbed)`, single pass over the array with early termination when $n$ flowers are placed.
- **Space Complexity:** $O(1)$ auxiliary space modifying array in-place.

### Test Cases
```python
# Example 1
print(can_place_flowers([1, 0, 0, 0, 1], 1))  # Output: True

# Example 2
print(can_place_flowers([1, 0, 0, 0, 1], 2))  # Output: False

# Edge Cases
print(can_place_flowers([0], 1))              # Output: True
print(can_place_flowers([1], 0))              # Output: True
print(can_place_flowers([0, 0, 0], 2))        # Output: True
```

---

## Question 3: Merge Sorted List

### Problem Description
Write a function `merge_sorted_lists(lst1, lst2)` that accepts two sorted lists `lst1` and `lst2` as parameters and merges them into a single sorted list.

### Professor's Method & Solution
```python
def merge_sorted_lists(lst1, lst2):
    """
    Merges two pre-sorted lists lst1 and lst2 into a single sorted list
    using the standard two-pointer combine technique from CLRS / CSCI 4041.
    """
    i = 0
    j = 0
    merged = []
    
    # Compare elements from both lists and append the smaller one
    while i < len(lst1) and j < len(lst2):
        if lst1[i] <= lst2[j]:
            merged.append(lst1[i])
            i += 1
        else:
            merged.append(lst2[j])
            j += 1
            
    # Copy any remaining elements from lst1
    while i < len(lst1):
        merged.append(lst1[i])
        i += 1
        
    # Copy any remaining elements from lst2
    while j < len(lst2):
        merged.append(lst2[j])
        j += 1
        
    return merged
```

### Complexity
- **Time Complexity:** $O(N_1 + N_2)$ where $N_1$ and $N_2$ are the lengths of `lst1` and `lst2`.
- **Space Complexity:** $O(N_1 + N_2)$ to construct and return the combined merged list.

### Test Cases
```python
# Example 1
lst1 = [1, 3, 5]
lst2 = [2, 4, 6]
print(merge_sorted_lists(lst1, lst2))  # Output: [1, 2, 3, 4, 5, 6]

# Edge Cases
print(merge_sorted_lists([], [1, 2]))      # Output: [1, 2]
print(merge_sorted_lists([5, 10], []))     # Output: [5, 10]
print(merge_sorted_lists([], []))          # Output: []
```

---

## Question 4: Code Output Snippet

### Problem Description
What is the output of the following code snippet?
```python
def mystery_function(nums):
    count = 0
    max_count = 0
    for i in range(len(nums)):
        if nums[i] > 0:
            count += 1
        else:
            if count > max_count:
                max_count = count
            count = 0
    if count > max_count:
        max_count = count
    return max_count

result = mystery_function([1, 2, -3, 4, 5, -6, 7, 8, 9])
print(result)
```

**Options:**
- `2`
- `3`
- `4`
- `5`

### Answer
**`3`**

### Step-by-Step Trace & Explanation
The function calculates the maximum length of consecutive strictly positive integers (`nums[i] > 0`):
- `nums = [1, 2, -3, 4, 5, -6, 7, 8, 9]`
- Indices `0`–`1`: `[1, 2]` $\to$ `count = 2`.
- Index `2`: `-3` $\le 0 \to$ `count > max_count` ($2 > 0$) $\to$ `max_count = 2`, `count` resets to `0`.
- Indices `3`–`4`: `[4, 5]` $\to$ `count = 2`.
- Index `5`: `-6` $\le 0 \to$ `count > max_count` ($2 > 2$ is False) $\to$ `max_count = 2`, `count` resets to `0`.
- Indices `6`–`8`: `[7, 8, 9]` $\to$ `count = 3`.
- After loop terminates: `if count > max_count` ($3 > 2$) $\to$ `max_count = 3`.
- Returns `max_count = 3`.

---

## Question 5: Find the Bug!

### Problem Description
The following function contains a bug. `sum_positives` should accept a list of integers `lst` and return the sum of all positive values in `lst`.
For example, if we passed in `[-1, 2, 3, 4, -5]`, `sum_positives` should return `9`.
```python
def sum_positives(lst):
    total = 0
    for num in lst:
        if num > 0:
            total = num
    return total
```

### Bug Diagnosis & Fix
- **Bug:** Line `total = num` overwrites `total` with the last encountered positive number instead of accumulating the running sum.
- **Fix:** Replace `total = num` with `total += num` (or `total = total + num`).

### Professor's Method & Corrected Code
```python
def sum_positives(lst):
    """
    Computes and returns the sum of all strictly positive integers in lst.
    """
    total = 0
    for num in lst:
        if num > 0:
            total += num      # Corrected from 'total = num' to accumulate sum
    return total
```

### Complexity
- **Time Complexity:** $O(N)$ where $N$ is `len(lst)`.
- **Space Complexity:** $O(1)$ auxiliary memory.

### Test Cases
```python
print(sum_positives([-1, 2, 3, 4, -5]))  # Output: 9 (2 + 3 + 4)
print(sum_positives([-2, -4, -6]))       # Output: 0
print(sum_positives([10, 20, 30]))       # Output: 60
print(sum_positives([]))                 # Output: 0
```

---

## Question 6: Code Output Snippet — Palindrome Check

### Problem Description
What is the output of the following code snippet?
```python
def mystery_function(word):
    start = 0
    end = len(word) - 1
    
    while start < end:
        if word[start] != word[end]:
            return False
        start += 1
        end -= 1
    return True

word = "kayak"
result = mystery_function(word)
print(result)
```

**Options:**
- `True`
- `False`
- `Throws an error because strings don't support slicing.`
- `Causes an infinite loop, causing the program to crash`

### Answer
**`True`**

### Step-by-Step Trace & Explanation
The function implements the classic two-pointer algorithm to test if a string is a palindrome (reads identically forwards and backwards):
- `word = "kayak"` has length 5.
- Pointers initialize to `start = 0` (pointing to `'k'`) and `end = 4` (pointing to `'k'`).
- **Iteration 1 (`start = 0`, `end = 4`):**
  - Condition `start < end` ($0 < 4$) is True.
  - `word[0]` (`'k'`) == `word[4]` (`'k'`). They match.
  - `start` advances to `1`, `end` decrements to `3`.
- **Iteration 2 (`start = 1`, `end = 3`):**
  - Condition `start < end` ($1 < 3$) is True.
  - `word[1]` (`'a'`) == `word[3]` (`'a'`). They match.
  - `start` advances to `2`, `end` decrements to `2`.
- **Loop Termination:**
  - Condition `start < end` ($2 < 2$) evaluates to False. The `while` loop terminates.
- Returns **`True`**, which `print(result)` outputs to stdout.

### Complexity & Analysis of Options
- **Time Complexity:** $O(L)$ where $L$ is `len(word)`. The loop runs at most $\lfloor L/2 \rfloor$ times.
- **Space Complexity:** $O(1)$ auxiliary space.
- **Why other options are incorrect:**
  - **`False`:** `"kayak"` is a valid palindrome; every mirrored pair of characters matches.
  - **`Throws an error because strings don't support slicing.`:** The code performs direct character indexing (`word[start]`, `word[end]`), not slicing. Moreover, Python strings fully support both indexing and slicing.
  - **`Causes an infinite loop, causing the program to crash`:** `start` increments and `end` decrements on every iteration, guaranteeing termination.

---

## Question 7: Find the Bug! (`sum_matrix`)

### Problem Description
The provided code incorrectly implements the function `sum_matrix`. Given a 2D list of integers `matrix`, `sum_matrix` should return the sum of all elements in `matrix`.

Identify any bug(s) within the given implementation and correct the code so that it successfully passes the provided test cases.

```python
def sum_matrix(matrix):
    row_length = len(matrix[0])
    for row in matrix:
        for j in range(row_length):
            total += row[j]
    return total
```

### Bug Diagnosis
1. **Uninitialized Accumulator Variable:** `total` was never initialized before the loops. Attempting `total += row[j]` triggers an `UnboundLocalError` (or `NameError`). `total = 0` must be initialized at the top of the function.
2. **Empty Matrix Crash (`IndexError`):** `len(matrix[0])` will crash with an `IndexError: list index out of range` if `matrix = []` or if empty sublists exist.
3. **Fragile Row Length Assumption:** Using `range(row_length)` assumes all rows have the exact same length as row 0. Directly iterating over elements with `for val in row:` is cleaner, safer, handles any matrix dimension, and matches Prof. Joy Upton-Azzam's matrix traversal style.

### Professor's Method & Corrected Code
```python
def sum_matrix(matrix):
    """
    Computes and returns the sum of all elements in the 2D list matrix.
    """
    total = 0
    for row in matrix:
        for val in row:
            total += val
    return total
```

### Complexity
- **Time Complexity:** $O(R \times C)$ where $R$ is the number of rows and $C$ is the number of columns, visiting each cell once.
- **Space Complexity:** $O(1)$ auxiliary space.

### Test Cases
```python
# Standard case
matrix1 = [
    [1, 2, 3],
    [4, 5, 6]
]
print(sum_matrix(matrix1))  # Output: 21

# Matrix with negative numbers
matrix2 = [
    [10, -2],
    [-3, 5],
    [4, 8]
]
print(sum_matrix(matrix2))  # Output: 22

# Edge case: Empty matrix
print(sum_matrix([]))       # Output: 0

# Edge case: Empty rows
print(sum_matrix([[], []])) # Output: 0
```
