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
# Unit - 2 Problems Transcript

**Captured:** 2026-10-08
**Source:**

## Session - 1
Paste the untouched transcript below, inside the fence. Do not edit, clean, or summarize here — this file is the raw capture. Summarization happens in the linked brief once `/transcript-to-brief` runs.

````
## Unit 2: Session 1

### Hash Tables / Heaps | Dictionaries

The focus of this session is advanced data handling in Python, focusing on functions, lists, strings, and dictionaries. Students will tackle practical programming challenges such as verifying subsequences, creating and manipulating dictionaries, and calculating values based on dynamic inputs.

The tasks are designed to enhance understanding of data structures, algorithmic thinking, and conditional logic, preparing students for more complex problem-solving scenarios involving data manipulation and retrieval.

You can find session recordings and more on the [resources tab](https://courses.codepath.org/courses/tip103/unit/2#!resources). Session slide decks are available on the [overview tab](https://courses.codepath.org/courses/tip103/unit/2#!overview).

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

Problem 1: Counting Treasure

Captain Blackbeard has a treasure map with several clues that point to different locations on an island. Each clue is associated with a specific location and the number of treasures buried there. Given a dictionary `treasure_map` where keys are location names and values are integers representing the number of treasures buried at those locations, write a function `total_treasures()` that returns the total number of treasures buried on the island.

```
def total_treasure(treasure_map):
    pass
```

Example Usage:

```
treasure_map1 = {
    "Cove": 3,
    "Beach": 7,
    "Forest": 5
}

treasure_map2 = {
    "Shipwreck": 10,
    "Cave": 20,
    "Lagoon": 15,
    "Island Peak": 5
}

print(total_treasures(treasure_map1)) 
print(total_treasures(treasure_map2)) 
```

Example Output:

```
15
50
```

✨ AI Hint: Dictionaries

✨ AI Hint: Accessing Values in a Dictionary

💡 Hint: Dictionary Access options

The two common ways to access values in a dictionary are square bracket notation `d[key]` and the `get()` method.

The Unit 2 cheatsheet includes a more thorough breakdown of these two options. If you still feel confused after reviewing the cheatsheet, try asking generative AI to help you understand!

💡 Hint: Accessing Keys, Values, and Key-Value Pairs

This question will require you to loop over a dictionary. We have three options for looping over a dictionary: looping over the keys, values, or key-value pairs. To explore how to access the keys, values, and key-value pairs reference the unit cheatsheet. For specific examples of looping over a dictionary, ask a generative AI tool to provide an example or search for existing examples using a search engine.

Problem 2: Pirate Message Check

Taken captive, Captain Anne Bonny has been smuggled a secret message from her crew. She will know she can trust the message if it contains all of the letters in the alphabet. Given a string `message` containing only lowercase English letters and whitespace, write a function `can_trust_message()` that returns `True` if the message contains every letter of the English alphabet at least once, and `False` otherwise.

```
def can_trust_message(message):
    pass
```

Example Usage:

```
message1 = "sphinx of black quartz judge my vow"
message2 = "trust me"

print(can_trust_message(message1))
print(can_trust_message(message2))
```

Example Output:

```
True
False
```

✨ AI Hint: Introduction to sets

_Key Skill: Use AI to explain code concepts_

This problem may benefit from the use of a **set**. A Python set is a data type which holds an unordered, mutable collection of _unique_ elements.

If you are unfamiliar with what a set is, or how to create a set, you can learn about them using a generative AI tool, like this:

_"You're an expert computer science tutor. Please explain what a set is in Python, and provide a simple code example of how to create one."_

After you get your answer, you can also ask follow up questions:

_"How is a set different from a list or dictionary? Can you show me examples of each?"_

Problem 3: Find All Duplicate Treasure Chests in an Array

Captain Blackbeard has an integer array `chests` of length `n` where all the integers in `chests` are in the range `[1, n]` and each integer appears once or twice. Return an array of all the integers that appear twice, representing the treasure chests that have duplicates.

```
def find_duplicate_chests(chests):
    pass
```

Example Usage:

```
chests1 = [4, 3, 2, 7, 8, 2, 3, 1]
chests2 = [1, 1, 2]
chests3 = [1]

print(find_duplicate_chests(chests1))
print(find_duplicate_chests(chests2))
print(find_duplicate_chests(chests3))
```

Example Output:

```
[2, 3]
[1]
[]
```

✨ AI Hint: Frequency Maps

_Key Skill: Use AI to explain code concepts_

A dictionary that maps unique values to their frequencies within a given data structure or data type is often called a **frequency map**. Frequency maps are an extremely useful problem solving tool that you will see often throughout this unit and in future units.

We encourage you to learn by doing and attempt this problem before doing a deeper dive! However, if you get stuck, you can ask a generative AI tool like ChatGPT or GitHub Copilot to explain the concept.

For example, you could say:

_"You're an expert computer science tutor for a Python-based technical interviewing course. Please explain what a frequency map is, and provide one or more examples of simple technical interview problems in which a frequency map is useful."_

Problem 4: Booby Trap

Captain Feathersword has found another pirate's buried treasure, but they suspect it's booby-trapped. The treasure chest has a secret code written in pirate language, and Captain Feathersword believes the trap can be disarmed if the code can be balanced. A balanced code is one where the frequency of every letter present in the code is equal. To disable the trap, Captain Feathersword _must_ remove exactly one letter from the message. Help Captain Feathersword determine if it's possible to remove one letter to balance the pirate code.

Given a 0-indexed string `code` consisting of only lowercase English letters, write a function `can_make_balanced()` that returns `True` if it's possible to remove one letter so that the frequency of all remaining letters is equal, and `False` otherwise.

```
def can_make_balanced(code):
    pass
```

Example Usage:

```
code1 = "arghh"
code2 = "haha"

print(can_make_balanced(code1)) 
print(can_make_balanced(code2)) 
```

Example Output:

```
True
Explanation: Select index 4 and delete it: word becomes "argh" and each character has a frequency of 1.

False
Explanation: They must delete a character, so either the frequency of "h" is 1 and the frequency of "a" is 2, or vice versa. It is impossible to make all present letters have equal frequency.
```
Problem 5: Overflowing With Gold

Captain Feathersword and their crew has discovered a list of gold amounts at various hidden locations on an island. Each number on the map corresponds to the amount of gold at a specific location. Captain Feathersword already has plenty of loot, and their ship is nearly full. They want to find two distinct locations on the map such that the sum of the gold amounts at these two locations is exactly equal to the amount of space left on their ship.

Given an array of integers `gold_amounts` representing the amount of gold at each location and an integer `target`, return the _indices_ of the two locations whose gold amounts add up to the target.

Assume that each input has exactly one solution, and you may not use the same location twice. You can return the answer in any order.

```
def find_treasure_indices(gold_amounts, target):
    pass
```

Example Usage:

```
gold_amounts1 = [2, 7, 11, 15]
target1 = 9

gold_amounts2 = [3, 2, 4]
target2 = 6

gold_amounts3 = [3, 3]
target3 = 6

print(find_treasure_indices(gold_amounts1, target1))  
print(find_treasure_indices(gold_amounts2, target2))  
print(find_treasure_indices(gold_amounts3, target3))  
```

Example Output:

```
[0, 1]
[1, 2]
[0, 1]
```
Problem 6: Organize the Pirate Crew

Captain Blackbeard needs to organize his pirate crew into different groups for a treasure hunt. Each pirate has a unique ID from 0 to n - 1.

You are given an integer array `group_sizes`, where `group_sizes[i]` is the size of the group that pirate `i` should be in. For example, if `group_sizes[1] = 3`, then pirate 1 must be in a group of size 3.

Return a list of groups such that each pirate `i` is in a group of size `group_sizes[i]`.

Each pirate should appear in exactly one group, and every pirate must be in a group. If there are multiple answers, return any of them. It is guaranteed that there will be at least one valid solution for the given input.

```
def organize_pirate_crew(group_sizes):
    pass
```

Example Usage:

```
group_sizes1 = [3, 3, 3, 3, 3, 1, 3]
group_sizes2 = [2, 1, 3, 3, 3, 2]

print(organize_pirate_crew(group_sizes1))
print(organize_pirate_crew(group_sizes2)) 
```

Example Output:

```
[[5], [0, 1, 2], [3, 4, 6]]
[[1], [0, 5], [2, 3, 4]]
```
Problem 7: Minimum Number of Steps to Match Treasure Maps

Captain Blackbeard has two treasure maps represented by two strings of the same length `map1` and `map2`. In one step, you can choose any character of `map2` and replace it with another character.

Return the minimum number of steps to make `map2` an anagram of `map1`.

An Anagram of a string is a string that contains the same characters with a different (or the same) ordering.

```
def min_steps_to_match_maps(map1, map2):
    pass
```

Example Usage:

```
map1_1 = "bab"
map2_1 = "aba"
map1_2 = "treasure"
map2_2 = "huntgold"
map1_3 = "anagram"
map2_3 = "mangaar"

print(min_steps_to_match_maps(map1_1, map2_1))
print(min_steps_to_match_maps(map1_2, map2_2))
print(min_steps_to_match_maps(map1_3, map2_3))
```

Example Output:

```
1
6
0
```
Problem 8: Counting Pirates' Action Minutes

Captain Dread is keeping track of the crew's activities using a log. The logs are represented by a 2D integer array `logs` where each `logs[i] = [pirateID, time]` indicates that the pirate with `pirateID` performed an action at the minute `time`.

Multiple pirates can perform actions simultaneously, and a single pirate can perform multiple actions in the same minute.

The pirate action minutes (PAM) for a given pirate is defined as the number of unique minutes in which the pirate performed an action. A minute can only be counted once, even if multiple actions occur during it.

You are to calculate a 1-indexed array `answer` of size `k` such that, for each `j (1 <= j <= k)`, `answer[j]` is the number of pirates whose PAM equals `j`.

Return the array `answer` as described above.

```
def counting_pirates_action_minutes(logs, k):
    pass
```

Example Usage:

```
logs1 = [[0, 5], [1, 2], [0, 2], [0, 5], [1, 3]]
k1 = 5
logs2 = [[1, 1], [2, 2], [2, 3]]
k2 = 4

print(counting_pirates_action_minutes(logs1, k1)) 
print(counting_pirates_action_minutes(logs2, k2))
```

Example Output:

```
[0, 2, 0, 0, 0]
[1, 1, 0, 0]
```

### Problem Set Version 2

Problem 1: The Library of Alexandria

In the ancient Library of Alexandria, a temporal rift has scattered several important scrolls across different rooms. You are given a dictionary `library_catalog` that maps room names to the number of scrolls that room should have and a second dictionary `actual_distribution` that maps room names to the number of scrolls found in that room after the temporal rift.

Write a function `analyze_library()` that determines if any room has more or fewer scrolls than it should. The function should return a dictionary where the keys are the room names and the values are the differences in the number of scrolls (actual number of scrolls - expected number of scrolls). You must loop over the dictionaries to compute the differences.

```
def analyze_library(library_catalog, actual_distribution):
    pass
```

Example Usage:

```
library_catalog = {
    "Room A": 150,
    "Room B": 200,
    "Room C": 250,
    "Room D": 300
}

actual_distribution = {
    "Room A": 150,
    "Room B": 190,
    "Room C": 260,
    "Room D": 300
}


print(analyze_library(library_catalog, actual_distribution))
```

Example Output:

```
{'Room A': 0, 'Room B': -10, 'Room C': 10, 'Room D': 0}
```

✨ AI Hint: Dictionaries

✨ AI Hint: Accessing Values in a Dictionary

💡 Hint: Dictionary Access options

💡 Hint: Accessing Keys, Values, and Key-Value Pairs

Problem 2: Grecian Artifacts

You've spent your last few trips exploring different periods of Ancient Greece. During your travels, you discover several interesting artifacts. Some artifacts appear in multiple time periods, while others in just one.

You are given two lists of strings `artifacts1` and `artifacts2` representing the artifacts found in two different time periods. Write a function `find_common_artifacts()` that returns a list of artifacts common to both time periods.

```
def find_common_artifacts(artifacts1, artifacts2):
    pass
```

Example Usage:

```
artifacts1 = ["Statue of Zeus", "Golden Vase", "Bronze Shield"]
artifacts2 = ["Golden Vase", "Silver Sword", "Bronze Shield"]

print(find_common_artifacts(artifacts1, artifacts2))
```

Example Output:

```
 ["Golden Vase", "Bronze Shield"]
```

✨ AI Hint: Introduction to sets

Problem 3: Souvenir Declutter

As a time traveler, you've collected a mountain of souvenirs over the course of your travels. You're running out of room to store them all and need to declutter. Given a list of strings `souvenirs` and a integer `threshold`, declutter your souvenirs by writing a function `declutter()` return a list of souvenirs whose _frequencies_ are below the `threshold`.

```
def declutter(souvenirs, threshold):
    pass
```

Example Usage:

```
souvenirs1 = ["coin", "alien egg", "coin", "coin", "map", "map", "statue"]
threshold1 = 3

souvenirs2 = ["postcard", "postcard", "postcard", "sword"]
threshold = 2
```

Example Output:

```
["alien egg", "map", "map", "statue"]
["sword"]
```

✨ AI Hint: Frequency Maps

Problem 4: Time Portals

Problem 5: Detect Temporal Anomaly

Problem 6: Time Portal Race Rankings

Problem 7: Lingual Frequencies

As a time traveling linguist, you are analyzing texts written in an ancient script. However, some words in the text are illegible and can't be deciphered. Write a function `find_most_frequent_word()` that accepts a string `text` and a list of illegible words `illegibles` and returns the most frequent word in `text` that is not an illegible word.

```
def find_most_frequent_word(text, illegibles):
    pass
```

Example Usage:

```
paragraph1 = "a."
illegibles1 = []
print(find_most_frequent_word(paragraph1, illegibles1)) 

paragraph2 = "Bob hit a ball, the hit BALL flew far after it was hit."
illegibles2 = ["hit"]
print(find_most_frequent_word(paragraph2, illegibles2)) 
```

Example Output:

```
a

ball
Example 2 Explanation:
"hit" occurs 3 times, but it is an unknown word.
"ball" occurs twice (and no other word does), so it is the most frequent legible word in the paragraph. 
Note that words in the paragraph are not case sensitive,
that punctuation is ignored (even if adjacent to words, such as "ball,"), 
and that "hit" isn't the answer even though it occurs more because it is illegible.
```

💡 Hint: Cleaning up the String

[](https://www.w3schools.com/python/python_ref_string.asp)

Problem 8: Time Portal Usage
````
## Session - 2

````
## Unit 2: Session 2

### Big O / AI Tools | Dictionaries & Sets

Students will continue to expand their expertise in Python through the exploration of data structures such as lists, dictionaries, and sets. They engage in various tasks like verifying list properties, creating and updating dictionaries, and analyzing data to make decisions.

You can find session recordings and more on the [resources tab](https://courses.codepath.org/courses/tip103/unit/2#!resources). Session slide decks are available on the [overview tab](https://courses.codepath.org/courses/tip103/unit/2#!overview).

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

Problem 1: Balanced Art Collection

As the curator of an art gallery, you are organizing a new exhibition. You must ensure the collection of art pieces are balanced to attract the right range of buyers. A balanced collection is one where the difference between the maximum and minimum value of the art pieces is exactly 1.

Given an integer array `art_pieces` representing the value of each art piece, write a function `find_balanced_subsequence()` that returns the length of the longest balanced subsequence.

A **subsequence** is a sequence derived from the array by deleting some or no elements without changing the order of the remaining elements.

```
def find_balanced_subsequence(art_pieces):
    pass
```

Example Usage:

```
art_pieces1 = [1,3,2,2,5,2,3,7]
art_pieces2 = [1,2,3,4]
art_pieces3 = [1,1,1,1]

print(find_balanced_subsequence(art_pieces1))
print(find_balanced_subsequence(art_pieces2))
print(find_balanced_subsequence(art_pieces3))
```

Example Output:

```
5
Example 1 Explanation:  The longest balanced subsequence is [3,2,2,2,3].

2
0
```
Problem 2: Verifying Authenticity

Your art gallery has just been shipped a new collection of numbered art pieces, and you need to verify their authenticity. The collection is considered "authentic" if it is a permutation of an array `base[n]`.

The `base[n]` array is defined as `[1, 2, ..., n - 1, n, n]`, meaning it is an array of length `n + 1` containing the integers from `1` to `n - 1` exactly once, and the integer `n` twice. For example, `base[1]` is `[1, 1]` and `base[3]` is `[1, 2, 3, 3]`.

Write a function `is_authentic_collection` that accepts an array of integers `art_pieces` and returns `True` if the given array is an authentic array, and otherwise returns `False`.

Note: A permutation of integers represents an arrangement of these numbers. For example `[3, 2, 1]` and `[2, 1, 3]` are both permutations of the series of numbers `1`, `2`, and `3`.

```
def is_authentic_collection(art_pieces):
    pass
```

Example Usage:

```
collection1 = [2, 1, 3]
collection2 = [1, 3, 3, 2]
collection3 = [1, 1]

print(is_authentic_collection(collection1))
print(is_authentic_collection(collection2))
print(is_authentic_collection(collection3))
```

Example Output:

```
False
Example 1 Explanation: Since the maximum element of the array is 3, the only 
candidate n for which this array could be a permutation of base[n], is n = 3. 
However, base[3] has four elements but array collection1 has three. Therefore, 
it can not be a permutation of base[3] = [1, 2, 3, 3]. So the answer is false.

True
Example 2 Explanation:  Since the maximum element of the array is 3, the only 
candidate n for which this array could be a permutation of base[n], is n = 3. 
It can be seen that collection2 is a permutation of base[3] = [1, 2, 3, 3] 
(by swapping the second and fourth elements in nums, we reach base[3]).
 Therefore, the answer is true.

True
Example 3 Explanation; Since the maximum element of the array is 1, 
the only candidate n for which this array could be a permutation of base[n], 
is n = 1. It can be seen that collection3 is a permutation of base[1] = [1, 1].
 Therefore, the answer is true.
```
Problem 3: Gallery Wall

You are tasked with organizing a collection of art prints represented by a list of strings `collection`. You need to display these prints on a single wall in a 2D array format that meets the following criteria:

1. The 2D array should contain only the elements of the array `collection`.
2. Each row in the 2D array should contain distinct strings.
3. The number of rows in the 2D array should be minimal.

Return the resulting array. If there are multiple answers, return any of them. Note that the 2D array can have a different number of elements on each row.

```
def organize_exhibition(collection):
    pass
```

Example Usage:

```
collection1 = ["O'Keefe", "Kahlo", "Picasso", "O'Keefe", "Warhol", 
              "Kahlo", "O'Keefe"]
collection2 = ["Kusama", "Monet", "Ofili", "Banksy"]

print(organize_exhibition(collection1))
print(organize_exhibition(collection2))
```

Example Output:

```
[
  ["O'Keefe", "Kahlo", "Picasso", "Warhol"],
  ["O'Keefe", "Kahlo"],
  ["O'Keefe"]
]
Example 1 Explanation:
All elements of collections were used, and each row of the 2D array contains 
distinct strings, so it is a valid answer.
It can be shown that we cannot have less than 3 rows in a valid array.

[["Kusama", "Monet", "Ofili", "Banksy"]]
Example 2 Explanation: 
All elements of the array are distinct, so we can keep all of them in the first 
row of the 2D array.
```
Problem 4: Gallery Subdomain Traffic

Your gallery has been trying to increase it's online presence by hosting several virtual galleries. Each virtual gallery's web traffic is tracked through domain names, where each domain may have subdomains.

A domain like `"modern.artmuseum.com"` consists of various subdomains. At the top level, we have `"com"`, at the next level, we have `"artmuseum.com"`, and at the lowest level, `"modern.artmuseum.com"`. When visitors access a domain like `"modern.artmuseum.com"`, they also implicitly visit the parent domains `"artmuseum.com`" and `"com"`.

A **count-paired domain** is represented as `"rep d1.d2.d3"` where `rep` is the number of visits to the domain and `d1.d2.d3` is the domain itself.

- For example, `"9001 modern.artmuseum.com"` indicates that `"modern.artmuseum.com"` was visited `9001` times.

Given an array of count-paired domains `cpdomains`, return an array of the count-paired domains of each subdomain. The order of the output does not matter.

```
def subdomain_visits(cpdomains):
    pass
```

Example Usage:

```
cpdomains1 = ["9001 modern.artmuseum.com"]
cpdomains2 = ["900 abstract.gallery.com", "50 impressionism.com", 
              "1 contemporary.gallery.com", "5 medieval.org"]

print(subdomain_visits(cpdomains1))
print(subdomain_visits(cpdomains2))
```

Example Output:

```
["9001 artmuseum.com", "9001 modern.artmuseum.com", "9001 com"]

["901 gallery.com", "50 impressionism.com", "900 abstract.gallery.com", "5 medieval.org", "5 org",
"1 contemporary.gallery.com", "951 com"]
```
Problem 5: Beautiful Collection

Your gallery has entered a competition for the most beautiful collection. Your collection is represented by a string `collection` where each artist in your gallery is represented by a character. The beauty of a collection is defined as the difference in frequencies between the most frequent and least frequent characters.

- For example, the beauty of `"abaacc"` is `3 - 1 = 2`.

Given a string `collection`, write a function `beauty_sum()` that returns _the sum of beauty of all of its substrings (subcollections)_, not just of the collection itself.

```
def beauty_sum(collection):
    pass
```

Example Usage:

```
print(beauty_sum("aabcb")) 
print(beauty_sum("aabcbaa"))
```

Example Output:

```
5
Example 1 Explanation: The substrings with non-zero beauty are 
["aab","aabc","aabcb","abcb","bcb"], each with beauty equal to 1.

17
```
Problem 6: Counting Divisible Collections in the Gallery

You have a list of integers `collection_sizes` representing the sizes of different art collections in your gallery and are trying to determine how to group them to best fit in your space. Given an integer `k` write a function `count_divisible_collections()` that returns the number of non-empty subarrays (contiguous parts of the array) where the sum of the sizes is divisible by `k`.

```
def count_divisible_collections(collection_sizes, k):
    pass
```

Example Usage:

```
nums1 = [4, 5, 0, -2, -3, 1]
k1 = 5
nums2 = [5]
k2 = 9

print(count_divisible_collections(nums1, k1))  
print(count_divisible_collections(nums2, k2))  
```

Example Output:

```
7
Example 1 Explanation: There are 7 subarrays with a sum divisible by k = 5:
[4, 5, 0, -2, -3, 1], [5], [5, 0], [5, 0, -2, -3], [0], [0, -2, -3], [-2, -3]

0
```
````