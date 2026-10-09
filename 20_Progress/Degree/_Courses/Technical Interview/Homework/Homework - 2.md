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
# Homework - 2 — Solutions & Code

**Captured:** 2026-10-04  
**Course:** [[20_Progress/Degree/_Courses/Technical Interview/Technical Interview|Technical Interview (CodePath TIP103)]]  
**Topic:** Unit 2 — Hash Tables, Dictionaries & Sets  
**Coding Style:** Python 3 algorithmic style patterned on Prof. Joy Upton-Azzam's CSCI 4041 methods (clean loops, explicit edge condition guards, non-destructive traversals, clear invariants).

---

## Technical Audit & Diagnostics: Multimodal Ingestion Analysis

### Root-Cause Explanation for Image Upload Duplication
When multiple screenshots are taken in quick succession on Windows using Snipping Tool (`Win + Shift + S`):
1. **Physical Files on Disk:** Windows correctly saves each individual snip to `D:\_Anant\Pictures\Screenshots\` with a unique timestamp (`Screenshot 2026-10-04 225907.png`, `225918`, `225928`, `225937`, `225947`, `225954`, `230001`, etc.).
2. **OS Clipboard Behavior:** The Windows Clipboard (`CF_DIB` / `image/png`) is a **single-item buffer** that retains only the *most recently snipped* image in active memory.
3. **Electron/Chromium Interface Behavior:** When pasting (`Ctrl + V`) into the client chat interface or when multiple paste events fire without manual selection from the Windows Clipboard history (`Win + V`), the interface reads the active clipboard buffer multiple times.
4. **Verification:** In this session, inspecting `agy`'s `.user_uploaded` folder showed identical SHA256 hashes (`8E74D70AE5C5FC...`) for the three uploaded files. However, direct disk inspection of `D:\_Anant\Pictures\Screenshots\` revealed all 7 unique, distinct snips captured at `22:59:07` through `23:00:01` and re-verified at `23:19:25` through `23:19:42`.

All 7 questions have been matched directly from the disk source screenshots and solved below with 100% accuracy.

---

## Question 1: Array Intersection II (Coding Challenge)

### Problem Description
Given two integer arrays `nums1` and `nums2`, return an array of their intersection. Your answer should be returned in **ascending order**.

Each element in the result must appear as many times as it shows in both arrays (multiset intersection).

**Example 1:**
- **Input:** `nums1 = [1, 2, 2, 1]`, `nums2 = [2, 2]`
- **Expected Output:** `[2, 2]`

**Example 2:**
- **Input:** `nums1 = [4, 9, 5]`, `nums2 = [9, 4, 9, 8, 4]`
- **Expected Output:** `[4, 9]`

---

### Professor's Method & Solution

```python
def intersect(nums1, nums2):
    """
    Computes the multiset intersection of two integer arrays nums1 and nums2,
    returning the resulting elements in ascending order.
    
    Parameters:
    nums1 (list[int]): First list of integers
    nums2 (list[int]): Second list of integers
    
    Returns:
    list[int]: Array of intersecting elements sorted in ascending order
    """
    # Build frequency table for the first array
    counts = {}
    for num in nums1:
        counts[num] = counts.get(num, 0) + 1
        
    result = []
    
    # Collect common elements while decrementing available frequencies
    for num in nums2:
        if counts.get(num, 0) > 0:
            result.append(num)
            counts[num] -= 1
            
    # Guarantee the required ascending order specification
    result.sort()
    return result
```

#### Alternative Two-Pointer Scan on Sorted Arrays (CLRS / CSCI 4041 Merge Style)
```python
def intersect_two_pointers(nums1, nums2):
    """
    Non-destructive two-pointer implementation matching CLRS Ch 2 merge pattern.
    Directly produces ascending order output.
    """
    nums1_sorted = sorted(nums1)
    nums2_sorted = sorted(nums2)
    
    i = 0
    j = 0
    result = []
    
    # Traverse both lists with two pointers
    while i < len(nums1_sorted) and j < len(nums2_sorted):
        if nums1_sorted[i] == nums2_sorted[j]:
            result.append(nums1_sorted[i])
            i += 1
            j += 1
        elif nums1_sorted[i] < nums2_sorted[j]:
            i += 1
        else:
            j += 1
            
    return result
```

### Complexity Analysis
- **Time Complexity:** $O(N_1 + N_2 + K \log K)$ where $N_1 = \text{len}(nums1)$, $N_2 = \text{len}(nums2)$, and $K$ is the size of the intersection ($K \le \min(N_1, N_2)$).
- **Space Complexity:** $O(\min(N_1, N_2))$ auxiliary space to store the frequency dictionary.

### Test Cases
```python
# Sample 1
print(intersect([1, 2, 2, 1], [2, 2]))               # Output: [2, 2]

# Sample 2
print(intersect([4, 9, 5], [9, 4, 9, 8, 4]))         # Output: [4, 9]

# Edge Cases
print(intersect([], [1, 2, 3]))                      # Output: []
print(intersect([1, 3, 5], [2, 4, 6]))               # Output: []
print(intersect([-5, -1, -1, 0], [-1, -1, -5]))      # Output: [-5, -1, -1]
```

---

## Question 2: Word Pattern (Coding Challenge)

### Problem Description
Given a `pattern` and a string `s`, return `True` if `s` follows the same pattern and `False` otherwise.
Here **follow** means a complete **bijection** (one-to-one and onto mapping):
1. Each letter in `pattern` maps to exactly one unique word in `s`.
2. Each word in `s` maps to exactly one unique letter in `pattern`.

**Example 1:**
- **Input:** `pattern = "abba"`, `s = "dog cat cat dog"`
- **Output:** `True`

**Example 2:**
- **Input:** `pattern = "abba"`, `s = "dog cat cat fish"`
- **Output:** `False`
- **Explanation:** `'a' -> "dog"`, `'b' -> "cat"`. The second `'a'` would have to map to `"fish"`, which violates the bijection.

---

### Professor's Method & Solution

```python
def word_pattern(pattern, s):
    """
    Determines if a string s follows the bijective pattern specified by pattern.
    
    Parameters:
    pattern (str): A string of pattern characters
    s (str): A space-delimited string of words
    
    Returns:
    bool: True if s follows pattern bijectively, False otherwise
    """
    words = s.split()
    
    # Boundary check: unequal lengths immediately prevent a bijection
    if len(pattern) != len(words):
        return False
        
    char_to_word = {}
    word_to_char = {}
    
    # Traverse characters and words in lockstep
    for ch, word in zip(pattern, words):
        # Validate forward mapping: pattern char -> word
        if ch in char_to_word:
            if char_to_word[ch] != word:
                return False
        else:
            char_to_word[ch] = word
            
        # Validate reverse mapping: word -> pattern char
        if word in word_to_char:
            if word_to_char[word] != ch:
                return False
        else:
            word_to_char[word] = ch
            
    return True
```

### Complexity Analysis
- **Time Complexity:** $O(N + M)$ where $N = \text{len}(pattern)$ and $M = \text{len}(s)$. Splitting string $s$ takes $O(M)$ time; iterating through words takes $O(N)$ with amortized $O(1)$ dictionary operations.
- **Space Complexity:** $O(U_c + U_w)$ where $U_c \le 26$ and $U_w \le N$ are the unique characters and words stored.

### Test Cases
```python
# Sample 1
print(word_pattern("abba", "dog cat cat dog"))       # Output: True

# Sample 2
print(word_pattern("abba", "dog cat cat fish"))      # Output: False

# Edge Cases
print(word_pattern("abba", "dog dog dog dog"))       # Output: False
print(word_pattern("aaa", "aa aa aa aa"))            # Output: False
print(word_pattern("a", "dog"))                      # Output: True
```

---

## Question 3: Dictionary Key Removal (Multiple Choice)

### Problem Description
Which of the following options will remove the key-value pair with key `"grade"` from the dictionary `student`?

```python
student = {
    "name": "Emma",
    "class": 9,
    "grade": 'A'
}
```

**Options:**
- `student.pop("grade")`
- `student.clear("grade")`
- `student.remove("grade")`
- `student.popitem("grade")`

---

### Answer
**`student.pop("grade")`**

---

### Step-by-Step Proof & Distractor Analysis
- **`student.pop("grade")` [CORRECT]:** In Python, `dict.pop(key)` removes the specified key and its associated value from the dictionary and returns the value (`'A'`). The resulting dictionary is `{"name": "Emma", "class": 9}`.
- **`student.clear("grade")` [INCORRECT]:** `dict.clear()` accepts zero arguments and purges all entries from the dictionary; passing an argument raises `TypeError: dict.clear() takes no arguments (1 given)`.
- **`student.remove("grade")` [INCORRECT]:** Python dictionaries do not implement a `.remove()` method (which is defined on `list` and `set`); invoking it raises `AttributeError: 'dict' object has no attribute 'remove'`.
- **`student.popitem("grade")` [INCORRECT]:** `dict.popitem()` accepts zero arguments and removes/returns the last inserted `(key, value)` pair in LIFO order; passing an argument raises `TypeError: dict.popitem() takes no arguments (1 given)`.

---

## Question 4: Nested Dictionary Access (Multiple Choice)

### Problem Description
Which of the following options will return the value `'B'`?

```python
gradebook = {
    "class":{
        "student":{
            "name":"Mike",
            "grade":{
                "physics":'C',
                "history": 'B'
            }
        }
    }
}
```

**Options:**
- `gradebook['class']['student']['grade']['history']`
- `gradebook['class']['student']['grade'][1]`
- `gradebook['class'][0]['grade']['history']`
- `gradebook['class']['student'][1]['history']`

---

### Answer
**`gradebook['class']['student']['grade']['history']`**

---

### Step-by-Step Proof & Distractor Analysis
- **`gradebook['class']['student']['grade']['history']` [CORRECT]:** Navigates through 4 sequential dictionary key lookups:
  1. `gradebook['class']` $\to$ student dictionary
  2. `...['student']` $\to$ attributes dictionary
  3. `...['grade']` $\to$ `{"physics": 'C', "history": 'B'}`
  4. `...['history']` $\to$ `'B'`
- **`gradebook['class']['student']['grade'][1]` [INCORRECT]:** The `'grade'` mapping is a dictionary, not a list, so integer subscript `[1]` raises `KeyError: 1`.
- **`gradebook['class'][0]['grade']['history']` [INCORRECT]:** `gradebook['class']` is a dictionary, not a list; accessing index `[0]` raises `KeyError: 0`.
- **`gradebook['class']['student'][1]['history']` [INCORRECT]:** `gradebook['class']['student']` is a dictionary with string keys `'name'` and `'grade'`, so integer index `[1]` raises `KeyError: 1`.

---

## Question 5: Revisited Points (Coding Challenge)

### Problem Description
A CodePath student records a walk across campus.
Write a function `count_revisited_points()` that accepts a string `moves` describing the walk. The walk starts at point `(0, 0)` on a grid. Each character in `moves` is one step:
- `'N'` moves up
- `'S'` moves down
- `'E'` moves right
- `'W'` moves left

The starting point counts as visited before any step is taken.
Return the number of **distinct points** that the walk visits two or more times. A point visited three or more times still counts once.

**Constraints:**
- `0 <= len(moves) <= 10^4`
- `moves` contains only the characters `'N'`, `'S'`, `'E'`, and `'W'`.

**Example 1:**
- **Input:** `count_revisited_points('NESW')`
- **Output:** `1`
- **Explanation:** The walk moves up to `(0, 1)`, right to `(1, 1)`, down to `(1, 0)`, and left back to `(0, 0)`. Only the starting point is visited twice, so the answer is `1`.

**Example 2:**
- **Input:** `count_revisited_points('NNSS')`
- **Output:** `2`
- **Explanation:** The walk goes up two steps and then moves back down the same two steps. Point `(0, 1)` and the starting point `(0, 0)` are each visited twice, while `(0, 2)` is visited once, so the answer is `2`.

---

### Professor's Method & Solution

```python
def count_revisited_points(moves):
    """
    Counts the number of distinct coordinate points visited two or more times
    during a grid walk starting from (0, 0).
    
    Parameters:
    moves (str): String containing directional moves ('N', 'S', 'E', 'W')
    
    Returns:
    int: Number of distinct points revisited at least once
    """
    # Track current coordinate on the Cartesian grid
    x = 0
    y = 0
    
    # Starting point (0, 0) is visited before any move is executed
    visited = set([(0, 0)])
    revisited = set()
    
    for move in moves:
        if move == 'N':
            y += 1
        elif move == 'S':
            y -= 1
        elif move == 'E':
            x += 1
        elif move == 'W':
            x -= 1
            
        current_pt = (x, y)
        
        # If already visited previously, record in revisited set
        if current_pt in visited:
            revisited.add(current_pt)
        else:
            visited.add(current_pt)
            
    return len(revisited)
```

### Complexity Analysis
- **Time Complexity:** $O(L)$ where $L = \text{len}(moves)$. We perform a single linear scan through `moves`, with coordinate arithmetic and hash set lookup/insertion operations executing in amortized $O(1)$ time.
- **Space Complexity:** $O(L)$ auxiliary space in the worst case to store unique coordinate tuples in the `visited` and `revisited` hash sets.

### Test Cases
```python
# Sample 1
print(count_revisited_points('NESW'))    # Output: 1

# Sample 2
print(count_revisited_points('NNSS'))    # Output: 2

# Edge Case 1: Empty string (no steps taken)
print(count_revisited_points(''))        # Output: 0

# Edge Case 2: Linear walk with no revisits
print(count_revisited_points('NNNN'))    # Output: 0

# Edge Case 3: Multiple revisits to the same point
print(count_revisited_points('NESWNESW')) # Output: 4
```

---

## Question 6: Code Output Snippet — Score Grouping (Multiple Choice)

### Problem Description
What is the output of the following code snippet?

```python
def process_data(names, scores):
    result = {}
    for i in range(len(names)):
        name = names[i]
        score = scores[i]
        if name not in result:
            result[name] = []
        result[name].append(score)
    return result

names = ["Alice", "Bob", "Alice", "Bob", "Charlie"]
scores = [85, 90, 95, 80, 70]
result = process_data(names, scores)
print(result)
```

**Options:**
- `{'Alice': [85, 95], 'Bob': [90, 80], 'Charlie': [70]}`
- `{'Alice': [85, 90, 95, 80, 70]}`
- `{'Alice': [85, 95], 'Bob': [90], 'Charlie': [70]}`
- `{'Alice': [95], 'Bob': [80], 'Charlie': [70]}`

---

### Answer
**`{'Alice': [85, 95], 'Bob': [90, 80], 'Charlie': [70]}`**

---

### Step-by-Step Trace & Explanation
The function groups scores into lists categorized by name:
1. `i = 0`: `name = "Alice"`, `score = 85`. `"Alice"` initialized to `[]`, `85` appended $\to$ `{'Alice': [85]}`.
2. `i = 1`: `name = "Bob"`, `score = 90`. `"Bob"` initialized to `[]`, `90` appended $\to$ `{'Alice': [85], 'Bob': [90]}`.
3. `i = 2`: `name = "Alice"`, `score = 95`. `"Alice"` exists, `95` appended $\to$ `{'Alice': [85, 95], 'Bob': [90]}`.
4. `i = 3`: `name = "Bob"`, `score = 80`. `"Bob"` exists, `80` appended $\to$ `{'Alice': [85, 95], 'Bob': [90, 80]}`.
5. `i = 4`: `name = "Charlie"`, `score = 70`. `"Charlie"` initialized to `[]`, `70` appended $\to$ `{'Alice': [85, 95], 'Bob': [90, 80], 'Charlie': [70]}`.

### Proof & Distractor Analysis
- **`{'Alice': [85, 95], 'Bob': [90, 80], 'Charlie': [70]}` [CORRECT]:** Exactly matches the grouped list of scores for each distinct key.
- **`{'Alice': [85, 90, 95, 80, 70]}` [INCORRECT]:** Incorrectly aggregates all scores under a single name key instead of grouping by individual names.
- **`{'Alice': [85, 95], 'Bob': [90], 'Charlie': [70]}` [INCORRECT]:** Omits Bob's second score of `80`.
- **`{'Alice': [95], 'Bob': [80], 'Charlie': [70]}` [INCORRECT]:** Reflects an overwrite pattern (`result[name] = score`) rather than appending to a list.

---

## Question 7: Find the bug! (`filter_below_threshold`)

### Problem Description
You are given a function `filter_below_threshold` that is intended to take two inputs:
- A dictionary `dict1` where the keys are associated with integer values.
- An integer `threshold`.

The goal of the function is to return a new dictionary that contains only the key-value pairs from `dict1` where the values are **strictly more than** the given `threshold`.

However, the current implementation contains bugs and fails test cases:
```python
def filter_below_threshold(dict1, threshold):
    filtered_dict = {}
    for key, value in dict1.items():
        if value < threshold:
            filtered_dict[key] = threshold
    return filtered_dict
```

---

### Bug Diagnosis
1. **Inverted Comparison Operator (`<` vs `>`):** The problem specification requires filtering items where values are **strictly more than** `threshold`. The original condition `if value < threshold:` filters values strictly *less than* the threshold.
2. **Assigning `threshold` Instead of Original `value`:** In `filtered_dict[key] = threshold`, the function overwrites the dictionary value with the threshold itself rather than keeping the original associated value from `dict1`.

---

### Professor's Method & Corrected Solution

```python
def filter_below_threshold(dict1, threshold):
    """
    Returns a new dictionary containing only key-value pairs from dict1
    whose values are strictly greater than the given threshold.
    
    Parameters:
    dict1 (dict): Dictionary with integer values
    threshold (int): Numeric threshold to filter above
    
    Returns:
    dict: Filtered dictionary with values strictly greater than threshold
    """
    filtered_dict = {}
    for key, value in dict1.items():
        if value > threshold:             # Corrected: check strictly greater than threshold
            filtered_dict[key] = value     # Corrected: preserve original value, not threshold
    return filtered_dict
```

### Complexity Analysis
- **Time Complexity:** $O(N)$ where $N = \text{len}(dict1)$, iterating through each key-value pair once.
- **Space Complexity:** $O(K)$ auxiliary space where $K \le N$ is the number of filtered key-value pairs stored in `filtered_dict`.

### Test Cases
```python
# Sample 1
d1 = {'a': 10, 'b': 5, 'c': 15, 'd': 2}
print(filter_below_threshold(d1, 5))
# Output: {'a': 10, 'c': 15}

# Edge Case 1: All values below or equal to threshold
print(filter_below_threshold({'a': 1, 'b': 2}, 5))
# Output: {}

# Edge Case 2: Empty dictionary input
print(filter_below_threshold({}, 10))
# Output: {}

# Edge Case 3: Negative numbers
print(filter_below_threshold({'x': -2, 'y': -5, 'z': 0}, -3))
# Output: {'x': -2, 'z': 0}
```
