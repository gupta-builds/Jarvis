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

## Raw Transcript

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
