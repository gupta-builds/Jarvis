---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "CSCI 4061 threads quiz answers"
started_at: 2026-11-02T21:04:03
ended_at: 2026-11-02T22:18:41
exported_at: 2026-11-02T23:33:07
duration_minutes: 74.6
project: Jarvis
cwd: 'D:\_Anant\20_Progress\Documents\Jarvis'
session_id: 25a79c97-aba6-4030-a0c4-a94cb230c2b2
status: seed
review_state: raw
created: 2026-11-02
updated: 2026-11-02
turn_count: 5
tools_used:
  Bash: 43
  Edit: 9
  Grep: 1
  Read: 8
  Write: 1
tokens:
  input: 100
  output: 49949
  cache_creation: 181875
  cache_read: 6894578
  total: 7126502
cost_usd: 1.916648
model:
  - "claude-sonnet-5-5"
files_touched:
  - "C:\\Users\\anant\\AppData\\Local\\Temp\\mineru-out\\Advanced_Programming_in_the_UNIX_Environment__3rd_Edition.standard.p436-451.md"
  - "C:\\Users\\anant\\AppData\\Local\\Temp\\mineru-out\\Lab_08.standard.pall.md"
  - "C:\\Users\\anant\\AppData\\Local\\Temp\\mineru-out\\Lec13.standard.pall.md"
  - "C:\\Users\\anant\\AppData\\Local\\Temp\\mineru-out\\Lec14.standard.pall.md"
  - "C:\\Users\\anant\\AppData\\Local\\Temp\\mineru-out\\Lec15.standard.pall.md"
  - "D:\\_Anant\\10_Areas\\UMN\\Classes\\CSCI\\CSCI 4061\\csci4061-fa26\\Labs\\lab08-code\\QUESTIONS.txt"
  - "D:\\_Anant\\10_Areas\\UMN\\Classes\\CSCI\\CSCI 4061\\csci4061-fa26\\Labs\\lab08-code\\queue.c"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4061\\Labs\\Lab - 8.md"
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# CSCI 4061 threads quiz answers

## You

```

<pasted_content id="4ab3">
Question 11 pts
Which of the following is not shared among the multiple threads of a process?

Group of answer choices

Stack


Heap


Globals


Code

 
Flag question: Question 2
Question 21 pts
What kind of workload would still benefit from using multiple threads, even on a computer with a single-core CPU?

Group of answer choices

Work involving lots of computation, such as approximating the value of pi


Work that requires a lot of storage in memory, like analyzing a large dataset


Work that involves lots of blocking operations, like reading from files, pipes, and sockets


Trick question: Multithreading is only useful on multi-core systems

 
Flag question: Question 3
Question 31 pts
All threads start their life by calling a function. Which of the following is an example of a correctly-typed thread start function?

Group of answer choices

void do_work()


void do_work(void *arg)


void *do_work()


void *do_work(void *arg)

 
Flag question: Question 4
Question 41 pts
Why do we have to print out an error from a call to a pthread function manually, with fprintf() and strerror() rather than with perror()?

Group of answer choices

This isn’t required for thread calls, it’s just the preferred convention.


perror() is not safe for concurrent use by multiple threads – the output on the screen could end up garbled.


pthread functions don’t set the errno global variable


Threads are not allowed to print to stderr, only to stdout, so we need to use fprintf() to ensure that the error message goes to the correct destination.

 
Flag question: Question 5
Question 51 pts
Which of the following lines of C code is most likely to be atomic? Assume p is of type int * and is not NULL, and assume x is of type int.

Group of answer choices

*p++;


*p = *p + 5;


x = *p + 5;


x = 5;

 
Flag question: Question 6
Question 61 pts
Which of the following snippets of C code is mostly like to be atomic (at least from the perspective of all threads belonging to the current process)?

Assume p is of type int * and is not NULL, assume x is of type int, and assume lock is of type pthread_mutex_t and has been properly initialized.

You may also assume that no errors occur.

Group of answer choices

pthread_mutex_lock(&lock);
*p++;
pthread_mutex_unlock(&lock);

pthread_mutex_lock(&lock);
x = 4;
pthread_mutex_unlock(&lock);

pthread_mutex_lock(&lock);
x = *p;
x = x + 15;
*p = x;
pthread_mutex_unlock(&lock);

All of the Above

 
Flag question: Question 7
Question 71 pts
Which of the following is not a problem with busy waiting?

Group of answer choices

It wastes CPU cycles


It wastes space in memory


It prevents other threads from getting a chance to run


If we’re unlucky, the condition the current thread is waiting on never becomes true

 
Flag question: Question 8
Question 81 pts
What is wrong with the following code for removing an element from a thread-safe bounded queue?

if (queue->size == 0) {
    pthread_cond_wait(&queue->cv_empty, &queue->lock);
}
// Remove element from queue
pthread_mutex_unlock(queue->lock);
pthread_cond_signal(&queue->cv_full);
Group of answer choices

A thread needs to lock queue->lock before checking if the queue is empty.


A thread should check for a condition it may need to wait on using while rather than if.


A thread should hold the queue’s lock when it signals one of the data structure’s condition variables.


All of the above

 
Flag question: Question 9
Question 91 pts
What is wrong with the following code for removing an element from a thread-safe bounded queue?

pthread_mutex_lock(&queue->lock);
while (queue->size == 0) {
    pthread_cond_wait(&queue->cv_empty, &queue->lock);
}
// Remove element from queue
pthread_cond_signal(&queue->cv_empty);
pthread_mutex_unlock(queue->lock);
Group of answer choices

A thread doesn’t need to acquire the queue’s lock before calling pthread_cond_wait().


A thread should unlock the queue’s lock before calling pthread_cond_signal().


The code is not signaling the correct condition variable.


None of the above

 
Flag question: Question 10
Question 101 pts
Which of the following is true about pthread_cond_signal()?

Group of answer choices

The signaled thread will be given a turn on the CPU immediately.


This function will notify all threads waiting on the condition variable.


If no thread is currently waiting on the condition variable, this notification is thrown away.


It is best practice not to hold the relevant lock when signaling a condition variable.
</pasted_content id="4ab3">

```

Answer the questions correctly regarding the course CSCI 4061. Provide me the answers as option numbers so that it is easy to mark.

## Claude

Options are numbered 1 to 4 in the order listed for each question.

| Q | Answer | Choice |
|---|--------|--------|
| 1 | **1** | Stack (each thread has its own) |
| 2 | **3** | Lots of blocking operations (file, pipe and socket reads) |
| 3 | **4** | `void *do_work(void *arg)` |
| 4 | **3** | pthread functions don't set `errno` |
| 5 | **4** | `x = 5;` |
| 6 | **4** | All of the above |
| 7 | **2** | It wastes space in memory |
| 8 | **4** | All of the above |
| 9 | **3** | The code is not signaling the correct condition variable (it should signal `cv_full`) |
| 10 | **3** | If no thread is waiting, the notification is thrown away |

**Q5:** `x = 5;` is a single store. The other lines are read-modify-write sequences.

**Q6:** All three snippets are protected by the same mutex, so each is atomic with respect to other threads that use that lock.

**Q8:** The code never locks before checking the size, uses `if` instead of `while`, and unlocks before signaling.

**Q9:** A remove should wake threads waiting for space, so it should signal `cv_full`, not `cv_empty`.

## You

Great work, now in the same manner you are required to work on the lab - 8 for the course. `"D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\Labs\Lab 08.pdf"` - slides for the lab. `"D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\csci4061-fa26\Labs\lab08-code"` - the actual code lives there. But the dev container has been run. So, you are going to be working inside: `/workspaces/csci4061-fa26/Labs/lab08-code`. Make sure to go through the previous lab files already created to understand what exactly to write in the lab note and the exact byte by byte changes required to the lab files. Make no mistakes and there is no overstepping the task here. Only write code where it is mentioned to write code. Do not make any sort of unecessary edits and finish the lab correctly by going through the main standards, workflows established inside 30_order. Do the task correctly and write the lab note here: `20_Progress/Degree/CSCI 4061/Labs/Lab - 8`. Do the task correctly and tell me when you have finished the job and how exactly did you do it. Follow only the course material, the textbook, lectures and things already provided in the main hub of the course. Do not rely on training data for solving the lab, rely on the textbook for true source of truth information after the lecture slides and lecture code. Do the task correctly and lay the note our perfectly.

## Claude

I'll start by locating the previous lab notes, the lab 8 code, and the 30_Order material.

Reading the course lecture slides and code on threads and condition variables, then the textbook.

Parsing the earlier textbook pages that cover mutexes and condition variables (§11.6).

Both paths are the same mount. I'll record baseline behaviour of the unmodified starter in a scratch copy inside the container, so the lab directory stays untouched.

Baseline recorded: the starter races under TSAN and then segfaults when a consumer reads a NULL head from the empty queue. Now the edits, beginning with `queue.c`.

Code is in. I'll build it in a scratch copy first and run it repeatedly, so the quiz answers come from observed behaviour.

The parallel runs shared one stdout, so lines got interleaved. I'll redo it with one output file per run.

Under load, 24 plain-build runs gave 20 different consumer sequences, and all 24 printed the messages alphabetically. That gives the quiz answers. Now `QUESTIONS.txt`:

Now the full verification in the real lab directory: `make test`, the byte-level diff, and a check that no other file changed.

The stress runs lose nothing and report no TSAN races. To confirm they really hit both wait loops, I'll add counters to a scratch copy of `queue.c`.

Shell quoting trouble in my scratch harness (not the lab code). I'll avoid the newline escape.

Both loops were hit hundreds of times. One more scratch check: swapping `while` for `if` in the wait loops, to see what actually breaks. The slides and §11.6.6 both warn about this.

Now `make zip` to confirm the submission package, then check the extracted copy matches the working files.

The package checks out. Before writing the note, I'm reading the vault's lint, decoration and writing rules, plus the gold-standard Lab 3, so the note's shape is right.

Now the note. The existing `Lab - 8.md` is the empty template stub, so I'll read it with the Read tool and then replace it.

Note is written. Now the lint and style checks from the Lab Workflow: Vault Lint on the Labs path, an em-dash scan, and the highlight count per section.

Lint flags one extra blank line (the one after the quiz list; the callout one is allowed). Removing it.

Lab 8 is finished locally: `make test` passes 2/2, 1.0/1.0, and the note is written. I haven't uploaded anything to Gradescope, so the remote autograder score, lab attendance and group membership are all unchecked.

## What I changed in the lab
- **`QUESTIONS.txt`:** 3 bytes differ from `QUESTIONS.txt.bak` (checked with `cmp -l`), one `( )` turned into `(X)` on each answer.
  - 2 Iterations.
  - Consumers don't take turns in a consistent order.
  - Messages are always printed in alphabetical order.
- **`queue.c`:** added 57 lines and removed none. `queue_init`, `queue_add` and `queue_remove` are now thread-safe.
  - `queue_init` initializes the mutex and both condition variables, and returns 1 if any init fails.
  - `queue_add` locks, waits on `queue_full` in a `while` loop, runs the starter's list code unchanged, signals `queue_empty`, then unlocks.
  - `queue_remove` is the mirror image, waiting on `queue_empty` and signaling `queue_full`.
  - Every early return unlocks first, as the lab slide requires.
- **Untouched:** `Makefile`, `queue.h`, `threads_main.c`, `QUESTIONS.txt.bak` and `test_cases/` have unchanged checksums.
- **`lab08-code.zip`:** I ran `make zip`, as earlier labs did. It holds 6 files, and the extracted copies are byte-identical to the working files.

## How I worked
1. I parsed `Lab 08.pdf`, Lec13, Lec14 and Lec15 through MinerU. Lec15 is networking only. I read APUE §11.6.6 (printed pp. 413 to 416) directly, since no Chapter 11 note exists yet.
2. I read the Lab Standard, Template and Workflow, and Lab - 7 and Lab - 3 as the models for the note.
3. I ran the unmodified starter in a scratch copy first. It showed a TSAN data race, then a segfault at address `0x200`, which is the offset of `next` in `node_t`. That means a consumer read a NULL `head`.
4. I picked the quiz answers from runs before I tried `make test-quiz`:
   - **Consumer order:** 24 plain-build runs under load gave 20 different consumer orders.
   - **Message order:** all 24 runs printed the names alphabetically.
5. I checked the finished queue in scratch. A stress program ran 3 producers and 4 consumers over 1200 items. It lost or duplicated nothing and had no TSAN reports, and counters showed both wait loops ran. Swapping `while` for `if` crashed 6 of 6 runs. I deleted all scratch directories afterwards.

## The note
`20_Progress/Degree/CSCI 4061/Labs/Lab - 8.md` follows the Lab Standard (the four required headings plus Flashcards). Each of the four Errors + fixes entries has Problem, Fix, Why and Evidence, and it passes Vault Lint at 100%.

## Open items
- **Deadline:** I derived Wed 2026-11-04 from the Board's rule, since the slides are dated Mon 11/02. Confirm it on Gradescope.
- **Untested:** I could not trigger the `queue_init` failure branches. I also didn't test whether the lab's own test would catch the `if` variant.
- **Not touched:** I didn't edit the Board or `Session Logs/log.md`, because you asked only for the lab note. Say if you want those updated.

### Tool Calls

- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && ls "20_Progress/Degree/CSCI 4061/" "20_Progress/Degree/CSCI 4061/Labs" 2>&1 | head -50; echo ---; ls -R "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/csci4061-fa26/Labs/lab08-code" | head -50; echo ---; ls "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/Labs" "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/csci4061-fa26/Labs"
```
```
20_Progress/Degree/CSCI 4061/:
CSCI 4061 Board.md
Concepts
Labs
Preparation.md
Projects
Textbook
Weekly

20_Progress/Degree/CSCI 4061/Labs:
Lab - 2.md
Lab - 3.md
Lab - 4.md
Lab - 5.md
Lab - 6.md
Lab - 7.md
Lab - 8.md
blobs
---
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/csci4061-fa26/Labs/lab08-code:
Makefile
QUESTIONS.txt
QUESTIONS.txt.bak
queue.c
queue.h
test_cases
threads_main.c

D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/csci4061-fa26/Labs/lab08-code/test_cases:
input
output
resources
tests.json

D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/csci4061-fa26/Labs/lab08-code/test_cases/input:
threads_main.txt

D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/csci4061-fa26/Labs/lab08-code/test_cases/output:
quiz.txt
threads_main.txt

D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/csci4061-fa26/Labs/lab08-code/test_cases/resources:
quiz_sum.json
---
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/Labs:
CSCI 4061 Lab 02.pdf
CSCI 4061 Lab 03.pdf
CSCI 4061 Lab 06.pdf
CSCI 4061 Lab 07.pdf
Lab 01.pdf
Lab 04.pdf
Lab 05.pdf
Lab 08.pdf

D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/csci4061-fa26/Labs:
lab01-code
lab02-code
lab03-code
lab04-code
lab05-code
lab06-code
lab07-code
lab08-code
```
- `Bash`
```bash
powershell -NoProfile -ExecutionPolicy Bypass -File D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/claude-workflow/scripts/mineru-pdf.ps1 "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/Labs/Lab 08.pdf"
```
```
OK  mineru parse done in 11 s (cache hit: False, server started by this run: False)
Markdown : C:\Users\anant\AppData\Local\Temp\mineru-out\Lab_08.standard.pall.md (3404 bytes)
Pages    : 1-6   Tier: standard   Document: 0e3fbfd
Next     : read the Markdown with the Read tool in pieces (offset and limit); page markers look like '<!-- page N of M -->'.
Pieces   : mineru read doc:0e3fbfd/tier:standard/page:N --context 1      one page and its neighbours, from the cache
Figures  : mineru read doc:0e3fbfd/tier:standard/page:N --format image --output page-N.png     then Read the PNG
Find     : mineru search "terms" --json                  across everything parsed so far
```
- `Read` -- `C:\Users\anant\AppData\Local\Temp\mineru-out\Lab_08.standard.pall.md`
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 4061/Labs" && wc -c Lab*.md && echo ---- && cat "Lab - 8.md"; ls blobs | head
```
```
15895 Lab - 2.md
14363 Lab - 3.md
 6585 Lab - 4.md
10901 Lab - 5.md
16717 Lab - 6.md
13337 Lab - 7.md
  572 Lab - 8.md
78370 total
----
---
type: class
class_kind: lab
status: seed
created: 2026-11-02
updated: 2026-11-02
tags:
  - class
  - lab
area:
next:
---
# Lab - 8
## Goal
<!-- What the lab was trying to accomplish, in your own words. -->
## Procedure / key steps
<!-- The decision points and commands needed to redo the lab from this note. -->
## Results
<!-- The observed output: numbers, tests, a working build. -->
## Errors + fixes
<!-- One entry per real error with Problem, Fix, Why, and Evidence. -->
## Flashcards
<!-- Optional. Only reusable debugging patterns, on #cards/<course-slug>. -->
```
- `Bash`
```bash
cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/csci4061-fa26/Labs/lab08-code" && for f in Makefile QUESTIONS.txt queue.h queue.c threads_main.c test_cases/tests.json test_cases/input/threads_main.txt test_cases/output/quiz.txt test_cases/output/threads_main.txt test_cases/resources/quiz_sum.json; do echo "=================== $f"; cat -A "$f" | sed 's/\$$//' ; done; echo; diff QUESTIONS.txt QUESTIONS.txt.bak && echo bak-same; git -C . status --short . | head
```
```
=================== Makefile
AN = lab08
CFLAGS = -Wall -Werror -g -fsanitize=thread -fno-omit-frame-pointer
CC = gcc $(CFLAGS)
SHELL = /bin/bash
CWD = $(shell pwd | sed 's/.*\///g')

.PHONY: clean help test test-quiz test-code clean-tests zip

threads_main: threads_main.c queue.o
^I$(CC) -pthread -o $@ $^

queue.o: queue.h queue.c
^I$(CC) -c queue.c

clean:
^Irm -f *.o threads_main

help:
^I@echo 'Typical usage is:'
^I@echo '  > make                          # build all programs'
^I@echo '  > make clean                    # remove all compiled items'
^I@echo '  > make zip                      # create a zip file for submission'
^I@echo '  > make test                     # run all tests'
^I@echo '  > make test-quiz                # run tests that verify quiz answers'
^I@echo '  > make test-code                # run tests that verify code is correct'

test: threads_main QUESTIONS.txt
^Itestius test_cases/tests.json

test-quiz: QUESTIONS.txt
^Itestius test_cases/tests.json -v -n 1

test-code: threads_main
^Itestius test_cases/tests.json -v -n 2

clean-tests:
^Irm -rf *.o test_results

zip: clean clean-tests
^Irm -f $(AN)-code.zip
^Icd .. && zip "$(CWD)/$(AN)-code.zip" -r "$(CWD)" -x "$(CWD)/test_cases/*"
^I@echo Zip created in $(AN)-code.zip
^I@if (( $$(stat -c '%s' $(AN)-code.zip) > 10*(2**20) )); then echo "WARNING: $(AN)-code.zip seems REALLY big, check there are no abnormally large test files"; du -h $(AN)-code.zip; fi
^I@if (( $$(unzip -t $(AN)-code.zip | wc -l) > 256 )); then echo "WARNING: $(AN)-code.zip has 256 or more files in it which may cause submission problems"; fi
=================== QUESTIONS.txt
                           __________________

                            LAB 08 QUESTIONS
                           __________________

Lab Instructions
================

  Follow the instructions below to experiment with topics related to
  this lab.
  - For sections marked QUIZ, fill in an (X) for the appropriate
    response in this file. Use the command 'make test-quiz' to see if
    all of your answers are correct.
  - For sections marked CODE, complete the code indicated. Use the
    command 'make test-code' to check if your code is complete.
  - DO NOT CHANGE any parts of this file except the QUIZ sections as it
    may interfere with the tests otherwise.
  - If your 'QUESTIONS.txt' file seems corrupted, restore it by copying
    over the 'QUESTIONS.txt.bak' backup file.
  - When you complete the exercises, check your answers with 'make test'
    and if all is well, create a zip file with 'make zip' and upload it
    to Gradescope. Ensure that the autograder there reflects your local
    results.
  - IF YOU WORK IN A GROUP only one member needs to submit and then add
    the names of their group.


CODE Complete Thread-Safe Queue Implementation
==============================================

  First, study the code in 'threads_main.c'. This program creates a queue data
  structure to be used by a single producer thread and several consumer
  threads. The "items" being shared from the producer to the consumer are
  simple message strings. The producer thread adds strings to the queue while
  the consumer threads remove strings from the queue and print them to the
  screen.

  To complete the code portion of this lab, you will need to complete the code
  in the 'queue.c' file.

  The code in 'queue.c' currently implements a bounded queue data structure
  based on a linked list, but it is *not* thread safe. Your task is to modify
  this code to make the queue safe for concurrent access by multiple threads.

  We have already added the necessary synchronization primitives to the
  'queue_t' definition in 'queue.h':

    - 'pthread_mutex_t lock': This lock must be held by any thread while it
      accesses and/or modifies the queue
    - 'pthread_cond_t queue_full': Threads wait on this condition variable when
      they wish to add a new element to an already full queue.
    - 'pthread_cond_t queue_empty': Threads wait on this condition variable when
      they wish to remove an element from a queue that is currently empty.

  Remember, this queue has a maximum size, given by the 'MAX_QUEUE_SIZE'
  constant defined in 'queue.h'. If the queue's size is equal to
  'MAX_QUEUE_SIZE', then threads that want to add a new element to the queue
  should block by waiting on the appropriate condition variable. If the queue
  is empty, then threads that want to remove an element from the queue should
  block by waiting on the appropriate condition variable.

QUIZ Questions 'threads_main' Observations
==========================================

  Given the values of 'NUM_MESSAGES' and 'NUM_CONSUMERS' defined in
  'threads_main.c', how many iterations should we expect each consumer thread
  to execute?
    - ( ) 0 Iterations
    - ( ) 1 Iteration
    - ( ) 2 Iterations
    - ( ) 3 Iterations

  Each consumer thread is given a unique index, and each consumer prints its
  index to the screen along with the element it just removed from the shared
  queue. When you execute the 'threads_main' program multiple times, what do
  you observe about the order in which the consumer threads run?
    - ( ) Consumers always take turns in the order in which they were created.
    - ( ) Consumers always take turns in the reverse order of their creation.
    - ( ) Consumers don't take turns in a consistent order.

  What do you observe about the order of the messages printed to the screen when
  you execute the 'threads_main' program multiple times?
    - ( ) Messages are always printed in alphabetical order.
    - ( ) Messages are always printed in reverse alphabetical order.
    - ( ) Messages are not printed in a consistent order.

=================== queue.h
// SPDX-FileCopyrightText: 2026 John Kolb <jhkolb@umn.edu>
// SPDX-License-Identifier: GPL-3.0-or-later
#ifndef QUEUE_H
#define QUEUE_H

#include <pthread.h>

#define MAX_QUEUE_SIZE 5
#define BUFLEN 512

typedef struct node {
    char message[BUFLEN];
    struct node *next;
} node_t;

typedef struct {
    node_t *head;
    unsigned size;
    pthread_mutex_t lock;
    pthread_cond_t queue_full;
    pthread_cond_t queue_empty;
} queue_t;

int queue_init(queue_t *queue);

int queue_add(queue_t *queue, const char *item);

int queue_remove(queue_t *queue, char *item_dest);

#endif    // QUEUE_H
=================== queue.c
#include "queue.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int queue_init(queue_t *queue) {
    queue->head = NULL;
    queue->size = 0;

    // TODO Initialize synchronization primitives here
    return 0;
}

int queue_add(queue_t *queue, const char *item) {
    // TODO Add synchronization logic before and after queue
    // modification code below as needed

    if (queue->head == NULL) {
        if ((queue->head = malloc(sizeof(node_t))) == NULL) {
            fprintf(stderr, "malloc() failed\n");
            pthread_mutex_unlock(&queue->lock);
            return -1;
        }
        strncpy(queue->head->message, item, BUFLEN - 1);
        queue->head->message[BUFLEN - 1] = '\0';
        queue->head->next = NULL;
        queue->size = 1;
    } else {
        node_t *current = queue->head;
        while (current->next != NULL) {
            current = current->next;
        }
        if ((current->next = malloc(sizeof(node_t))) == NULL) {
            fprintf(stderr, "malloc() failed\n");
            pthread_mutex_unlock(&queue->lock);
            return -1;
        }
        strncpy(current->next->message, item, BUFLEN - 1);
        current->next->message[BUFLEN - 1] = '\0';
        current->next->next = NULL;
        queue->size++;
    }

    return 0;
}

int queue_remove(queue_t *queue, char *item_dest) {
    // TODO Add synchronization logic before and after queue
    // modification code below as needed

    strcpy(item_dest, queue->head->message);
    node_t *new_head = queue->head->next;
    free(queue->head);
    queue->head = new_head;
    queue->size--;

    return 0;
}
=================== threads_main.c
// SPDX-FileCopyrightText: 2026 John Kolb <jhkolb@umn.edu>
// SPDX-License-Identifier: GPL-3.0-or-later
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "queue.h"

#define USLEEP_DURATION 500000
#define NUM_MESSAGES 10
#define NUM_CONSUMERS 5

// Information passed to consumer threads
typedef struct {
    int idx;
    queue_t *queue;
} thread_args_t;

// Messages exchanged between threads via shared queue
char *messages[] = {"Akerman", "Blegen", "Campbell", "Diehl", "Eddy",
                    "Ford",    "Gibson", "Heller",   "Iona",  "Jackson"};

// Producer thread start function
void *producer_thread_func(void *arg) {
    queue_t *queue = (queue_t *) arg;
    for (int i = 0; i < NUM_MESSAGES; i++) {
        if (queue_add(queue, messages[i]) == -1) {
            exit(1);
        }
        usleep(USLEEP_DURATION);
    }
    return NULL;
}

// Consumer thread start function
void *consumer_thread_func(void *arg) {
    thread_args_t *args = (thread_args_t *) arg;
    char buf[BUFLEN];
    for (int i = 0; i < NUM_MESSAGES / NUM_CONSUMERS; i++) {
        if (queue_remove(args->queue, buf) == -1) {
            exit(1);
        }
        printf("Consumer %d: %s\n", args->idx, buf);
    }
    return NULL;
}

int main() {
    queue_t queue;
    if (queue_init(&queue) != 0) {
        fprintf(stderr, "Failed to initialize queue\n");
        return 1;
    }

    // Create single producer thread
    int result;
    pthread_t producer_thread;
    if ((result = pthread_create(&producer_thread, NULL, producer_thread_func, &queue)) != 0) {
        fprintf(stderr, "pthread_create: %s\n", strerror(result));
        return 1;
    }

    // Create multiple producer threads
    pthread_t consumer_threads[NUM_CONSUMERS];
    thread_args_t thread_args[NUM_CONSUMERS];
    for (int i = 0; i < NUM_CONSUMERS; i++) {
        thread_args[i].queue = &queue;
        thread_args[i].idx = i;
        if ((result = pthread_create(consumer_threads + i, NULL, consumer_thread_func,
                                     thread_args + i)) != 0) {
            fprintf(stderr, "pthread_create: %s\n", strerror(result));
            return 1;
        }
    }

    // Join all threads
    // Even if an individual join fails, try to complete remaining joins
    int exit_code = 0;
    if ((result = pthread_join(producer_thread, NULL)) != 0) {
        fprintf(stderr, "pthread_join: %s\n", strerror(result));
        exit_code = 1;
    }
    for (int i = 0; i < NUM_CONSUMERS; i++) {
        if ((result = pthread_join(consumer_threads[i], NULL)) != 0) {
            fprintf(stderr, "pthread_join: %s\n", strerror(result));
            exit_code = 1;
        }
    }

    return exit_code;
}
=================== test_cases/tests.json
{
    "name": "Lab 08",
    "tests": [
        {
            "name": "Quiz - QUESTIONS.txt",
            "description": "Check if the answers in QUESTIONS.txt are correct. This file must be edited so that the correct ( ) choices are replaced with (X) and no other changes are made to the file.",
            "command": "socrates QUESTIONS.txt -c test_cases/resources/quiz_sum.json -a",
            "output_file": "test_cases/output/quiz.txt",
            "points": 0.5
        },
        {
            "name": "Code - threads_main",
            "description": "Checks the threads_main program for correct output. 'sed' is used to elide consumer indexes and make the test insensitive to the specific order in which consumer threads run.",
            "input_file": "test_cases/input/threads_main.txt",
            "output_file": "test_cases/output/threads_main.txt",
            "points": 0.5
        }
    ]
}
=================== test_cases/input/threads_main.txt
$ $(setarch -R true 2>/dev/null && echo setarch -R) ./threads_main | sed 's/^Consumer [0-9]/Consumer x/'
$ exit
=================== test_cases/output/quiz.txt
All quiz answers correct.
=================== test_cases/output/threads_main.txt
$ $(setarch -R true 2>/dev/null && echo setarch -R) ./threads_main | sed 's/^Consumer [0-9]/Consumer x/'
Consumer x: Akerman
Consumer x: Blegen
Consumer x: Campbell
Consumer x: Diehl
Consumer x: Eddy
Consumer x: Ford
Consumer x: Gibson
Consumer x: Heller
Consumer x: Iona
Consumer x: Jackson
$ exit
exit
=================== test_cases/resources/quiz_sum.json
"[REDACTED]"
bak-same
fatal: not a git repository (or any of the parent directories): .git
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 4061/Labs" && cat "Lab - 7.md"
```
````
---
type: class
class_kind: lab
status: sprout
created: 2026-10-28
updated: 2026-10-28
tags:
  - class
  - lab
area:
  - "[[CSCI 4061 Board]]"
next: "Upload lab07-code.zip to Gradescope, then confirm the remote autograder matches the local 1.0/1.0 and that lab attendance was recorded. The due date is not sourced: the Board puts Lab 7 in Week 8, and Labs 2, 3, 5 and 6 all closed Wednesday 11:59pm, which would make it tonight (2026-10-28). Check Gradescope for the real deadline."
---
# Lab - 7
==Lab 7 is the first lab with threads: four `pthread_create` calls each hand one file name to the same `worker`, the workers add their file's sum into one shared `long global_sum`, and `pthread_join` makes `main` wait before it prints. Part 1 deliberately has no lock so that the thread sanitizer (TSAN) reports a data race on `global_sum`; Part 2 fixes it with a global `pthread_mutex_t` around the one `+=`.==
**Sources read:** the lab slides (`CSCI 4061 Lab 07.pdf`, 6 pages: create/join, lock/unlock, sanitizers, reading a TSAN report), `csci4061-fa26/Labs/lab07-code/` in full (`QUESTIONS.txt`, `QUESTIONS.txt.bak`, `sum_files.c`, `Makefile`, `test_cases/tests.json`, the four `numbers0N.txt` inputs, the expected output), and [[CSCI 4061 Board]]'s Schedule (Week 8: "Advanced Synchronization", reading Stevens Ch 11, "Lab 7").
> [!WARNING] No textbook or lecture note backs this lab yet
> [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]] lists Ch 11 (threads, basic synchronization) for Week 7 and says no chapter note exists, and there is no Week 7 or Week 8 note. The solution below comes from the slides, the starter code, and the `QUESTIONS.txt` prompts. I have not read Stevens Ch 11 for this note, so no page citations.
## Goal
Make four threads each sum one file in parallel and add that sum into a shared total without losing updates, and learn to read a TSAN report well enough to know when the program is wrong even though the printed number looks right.
### Submission checklist (what actually gets graded)
- **Attendance** in the assigned lab section.
- **`QUESTIONS.txt`**: change `( )` to `(X)` on 6 quiz answers, nothing else. `socrates` hashes the whole file against `test_cases/resources/quiz_sum.json`. Test 1, 0.5 pt.
- **`sum_files.c`**: edit only at the `TODO` comments, plus the global mutex Part 2 asks for. Test 2 runs `./sum_files` and diffs against `test_cases/output/sum_files.txt` (`Sum for all files = 19241311`) with TSAN active, so any TSAN report fails it. 0.5 pt.
- `make test`, then `make zip` creates `lab07-code.zip` (the Makefile excludes `test_cases/`), then upload to **Gradescope**. Groups may submit once and add names.
- Not edited: `Makefile`, `QUESTIONS.txt.bak`, `test_cases/`, and the provided `sum_file` function.
## Procedure / key steps
- Setup: reused the existing course container (`cranky_pasteur`, Ubuntu 22.04, gcc 11.4.0, as in [[20_Progress/Degree/CSCI 4061/Labs/Lab - 6|Lab - 6]]). Docker Desktop was not running, so it had to be started first, then `docker start cranky_pasteur`. The repo is mounted at `/workspaces/csci4061-fa26`.
- The Makefile compiles with `-Wall -Werror -g -fsanitize=thread -fno-omit-frame-pointer`, so an unused variable or a missing include is a build failure, and every run is a TSAN run.
### Quiz answers (6 total, 6 flipped)
1. **Third argument of `pthread_create`, `void *(*start_routine)(void *)`:** a pointer to a function taking one `void *` and returning `void *`. The leading `void *` is the return type, `(*start_routine)` is the pointer, `(void *)` is the one parameter.
2. **When the new thread starts:** immediately once `pthread_create` succeeds (slide 3: "starts running as soon as pthread_create succeeds"). `pthread_start` does not exist, and `pthread_join` only waits. "Immediately" means runnable, not that it runs before `pthread_create` returns.
3. **Second argument of `pthread_join`:** where to store the thread's return value, a `void **`. This lab passes `NULL` because `worker` returns `NULL` and the result goes through `global_sum`.
4. **TSAN's error:** a data race with the `global_sum` variable. TSAN's own wording is `WARNING: ThreadSanitizer: data race` (slide 6: two threads touch the same memory, at least one writes, nothing orders them).
5. **Initializing a global mutex:** assign `PTHREAD_MUTEX_INITIALIZER`. `PTHREAD_COND_INITIALIZER` is for condition variables. "Globals are zero-initialized" happens to work on glibc but POSIX does not promise it, and `pthread_mutex_init` at the top of `main` works but is dynamic initialization for something that can be static.
6. **Error-checking `pthread_mutex_lock`:** save the return value, test for non-zero, print with `strerror` (slide 3: pthread functions return an error number and do not set `errno`, so `perror` would print a stale `errno`).
`socrates` checks the file as one hash, so it confirms the set of six together, not each answer on its own. The reasoning above is mine; the hash only says the set is right.
### Part 1 and 2: `sum_files.c`
Decisions, in the order they came up:
- **Uncomment `file_names`** by deleting the `/*` and `*/` lines only.
- **Pass `file_names[i]` itself as the thread argument**, cast back to `const char *` in `worker`. Each string literal lives for the whole program, so no per-thread struct and no `malloc` is needed. Contrast with passing `&i` of the loop counter, which races because `i` changes before the thread reads it (the slide avoids this with an `ids[]` array).
- **Track `n_created`** so a failed `pthread_create` still joins only the threads that really exist; never join an uninitialized `pthread_t`.
- **Check `sum_file(...) == -1`** and skip the add. `sum_file` already `perror`s and returns `-1` on failure; adding it would silently shave 1 off the total. The catch is that a file whose real sum is `-1` would also be skipped, which cannot happen with these inputs.
- **Lock only around `global_sum += file_sum`.** `sum_file` runs outside the lock, which is the whole point of the threads. Holding the lock across the file read would serialize the work.
- **Every error path returns** with the lock released: if `pthread_mutex_lock` fails, `worker` returns before touching `global_sum`, so there is nothing to unlock.
- **`main` returns 1 before the provided `printf`** if any create or join failed, rather than printing a partial sum.
```c
long global_sum;
pthread_mutex_t global_sum_lock = PTHREAD_MUTEX_INITIALIZER;
// worker
const char *file_name = (const char *)arg;
long file_sum = sum_file(file_name);
if (file_sum == -1) return NULL;
int ret = pthread_mutex_lock(&global_sum_lock);
if (ret != 0) { fprintf(stderr, "pthread_mutex_lock: %s\n", strerror(ret)); return NULL; }
global_sum += file_sum;
ret = pthread_mutex_unlock(&global_sum_lock);
if (ret != 0) { fprintf(stderr, "pthread_mutex_unlock: %s\n", strerror(ret)); }
// main
pthread_t threads[N_THREADS];
for (int i = 0; i < N_THREADS; i++) { ret = pthread_create(&threads[i], NULL, worker, file_names[i]); /* check, break, n_created++ */ }
for (int i = 0; i < n_created; i++) { ret = pthread_join(threads[i], NULL); /* check */ }
```
The block above is condensed to the decisions; the error branches are written out in the real file.
### Reproduce in the course dev container
```sh
cd /workspaces/csci4061-fa26/Labs/lab07-code
setarch x86_64 -R make test     # see Errors + fixes: plain `make test` aborts inside TSAN on this machine
make zip                        # cleans, then creates lab07-code.zip
unzip -l lab07-code.zip
```
`make test-quiz` and `make test-code` run each half separately.
## Results
Observed in `cranky_pasteur` on 2026-10-28.
- First `make test`, no changes to the environment: **0.5/1.0**. Quiz passed; the code test failed with `FATAL: ThreadSanitizer: unexpected memory mapping ...` instead of the sum (see Errors + fixes, this was not my code).
- `setarch x86_64 -R make test`:
```text
testius test_cases/tests.json
== Lab 07
== Running 2/2 tests
Test 1) Quiz - QUESTIONS.txt: Passed
Test 2) Code - Multithreaded Sum: Passed

Ran 2/2 Requested Tests
Passed 2/2 Tests
Total Score: 1.0/1.0
```
- 10 consecutive runs of `./sum_files` under `setarch -R` all printed `Sum for all files = 19241311` with exit 0 and no TSAN output.
- `cmp -l QUESTIONS.txt.bak QUESTIONS.txt` shows exactly **6 bytes** differ, one `( )` to `(X)` per question. `Makefile` and `QUESTIONS.txt.bak` kept their original timestamps.
- Missing-file path: running the binary from a directory with no `test_cases/` printed four `fopen: No such file or directory` lines, added nothing, and printed `Sum for all files = 0`.
- `make zip` produced `lab07-code.zip` with 4 files plus the directory entry: `Makefile`, `QUESTIONS.txt`, `QUESTIONS.txt.bak`, `sum_files.c`. Extracting it into a temp directory gave byte-identical copies of all four, and `socrates` on the extracted `QUESTIONS.txt` printed `All quiz answers correct.` SHA256 `[REDACTED]`.
- **Not yet verified:** the Gradescope upload, the remote autograder's score (it runs on a different machine, so the TSAN startup problem below may not appear there, but I have not seen it), group membership, and attendance.
## Errors + fixes
### TSAN aborts at startup: `unexpected memory mapping`
- Problem: `make test` failed test 2. `./sum_files` printed `FATAL: ThreadSanitizer: unexpected memory mapping 0x...-0x...` and exited 66 before `main` ran. An empty `int main(void){return 0;}` compiled with `-fsanitize=thread` failed identically, so the program under test was not the cause.
- Fix: run under `setarch x86_64 -R` (disables address-space randomization for that process and its children), e.g. `setarch x86_64 -R make test`. No system setting changed.
- Why: TSAN reserves fixed shadow-memory ranges and aborts if the kernel maps something inside them. Here the kernel is `6.18.54.[REDACTED]` with `vm.mmap_rnd_bits = 32` and gcc 11.4's TSAN runtime. Turning ASLR off made the empty program run, which fits an ASLR-entropy mismatch. That is the explanation I am confident in from the evidence; I did not test the other known remedy, lowering `vm.mmap_rnd_bits` to 28 on the WSL VM.
- Evidence: empty program exit 66 without `setarch`, exit 0 with it; `setarch x86_64 -R make test` gave 2/2 and 1.0/1.0.
### The data race Part 1 is built to show
- Problem: with the lock calls removed from a scratch copy of the finished code (not the submitted file), three runs each printed `WARNING: ThreadSanitizer: data race`, with a size-8 read in thread T2 and a previous size-8 write in thread T1, both at the `global_sum += file_sum` line, location `global 'global_sum' of size 8`, and exited 66. The program still printed `Sum for all files = 19241311`, the correct total.
- Fix: add `pthread_mutex_t global_sum_lock = PTHREAD_MUTEX_INITIALIZER;` and wrap only `global_sum += file_sum` in `pthread_mutex_lock` / `pthread_mutex_unlock`.
- Why: `+=` on a global is load, add, store. Two threads can load the same old value and both store, losing one file's sum. A correct printed number only means the schedule was lucky this time. TSAN flags the missing happens-before ordering between the two accesses, not a wrong value, which is why it fails the test even when the sum matches.
- Evidence: the three lock-free reports above; the locked version gives no report in 10 runs and in `make test`.
### Reading the lock-free run on a wrong working directory
- Problem: my first lock-free experiment printed four `fopen: No such file or directory` errors and no TSAN report, which looked like "no race".
- Fix: copy `test_cases/resources/` next to the scratch binary and rerun; the race report then appeared on every run.
- Why: with every `sum_file` returning `-1`, `worker` returns before touching `global_sum`, so there is no shared access to race on. Absence of a TSAN report only means the racy code path did not execute.
- Evidence: the missing-file run printed sum 0 and no report; the run with inputs present printed the report three times out of three.
## Flashcards
#cards/csci4061
`./prog` built with `-fsanitize=thread` prints `FATAL: ThreadSanitizer: unexpected memory mapping` and exits 66, even for an empty `main`. What is wrong and what is the quickest fix?::The kernel's ASLR entropy (`vm.mmap_rnd_bits`, 32 on a recent WSL2 kernel) does not fit the shadow-memory layout of gcc 11's TSAN runtime. It is not a bug in your program. Run it with ASLR disabled, `setarch x86_64 -R ./prog`.
The program printed the correct total, yet TSAN reports a data race on a global. Is it a false alarm?::No. `x += n` from several threads is an unordered load, add, store. The right answer in this run came from a lucky interleaving. TSAN reports the missing ordering, not the wrong value.
Why does `perror` give the wrong message after a failed `pthread_mutex_lock`?::`pthread_*` functions return the error number and do not set `errno`, so `perror` prints whatever stale value `errno` holds. Save the return value and print `strerror(ret)`.
Why pass `file_names[i]` to `pthread_create` instead of `&i`?::The thread reads its argument some time after `pthread_create` returns, by which point the loop has changed `i`. A pointer to a string literal (or to a per-thread slot like `ids[i]`) stays valid and unchanged.
````
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && grep -n -i "class" "30_Order/Standards/Note Type Registry.md" 2>/dev/null | head -20; ls 30_Order 30_Order/Standards 30_Order/Templates 30_Order/Workflows | head -120; find 30_Order -iname "*Note Type Registry*" -o -iname "*Class Standard*" -o -iname "*Lab*" | head
```
```
30_Order:
00_How This Folder Works.md
Note Type Registry.md
Standards
System
Templates
Workflows

30_Order/Standards:
AI Loop
Conformance Standard.md
Courses
Decoration Standard.md
Editing Standard.md
Enrich
Frontmatter Standard.md
Generated Output Standard.md
Ingestion
Internship
Log Standard.md
MOC Standard.md
Note Kit Standard.md
Operations
Plan Standard.md
Project Standard.md
Projects
System Component Standard.md

30_Order/Templates:
AI Toolkit
Capability
Career
Classes
Enumerate
Frontmatter
Knowledge
MOC.md
Projects
System

30_Order/Workflows:
00_Workflows Index.md
Courses
Enrichment
Ingestion
Internship
Operations
Projects
System
Toolkit
30_Order/Note Type Registry.md
30_Order/Standards/Courses/Lab Standard.md
30_Order/Templates/Classes/Lab Template.md
30_Order/Workflows/Courses/Lab Workflow.md
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 4061" && ls Concepts Textbook Weekly Projects; echo ----; cat "CSCI 4061 Board.md" | head -150
```
```
Concepts:
C Refresher
Code
Concepts Board.md
Exams
Lecture
Midterm - 1.md

Projects:
Project - 1 Assignment.md
Project - 1 Board.md
Project - 1 Code.md
Project - 1 Oral Exam Drills.md
Project - 2 Assignment.md
Project - 2 Implementation.md
Project - 2 Quiz.md

Textbook:
Chapter - 1.md
Chapter - 10.md
Chapter - 15.md
Chapter - 3.md
Chapter - 4.md
Chapter - 7.md
Chapter - 8.md
Textbook Map.md

Weekly:
Week - 1.md
Week - 2.md
Week - 3.md
Week - 4.md
Weekly Board.md
----
---
type: class
input_kind: board
status: sprout
created: 2026-09-07
updated: 2026-10-21
area:
  - "[[Fall'26 Syllabus]]"
  - "[[APAS]]"
tags:
  - "#class"
next: "Upload the verified Lab 6 zip to Gradescope before 2026-10-21 11:59pm (tonight), confirm the remote result and lab attendance; see [[20_Progress/Degree/CSCI 4061/Labs/Lab - 6]]."
---
# CSCI 4061 — Introduction to Operating Systems
Fall'26, 4 credits, in person. Closes the Introduction to Operating Systems sub-requirement of the Computer Science Core — the last open CS Core sub-req per [[APAS]], so this class finishes CS Core outright. Real syllabus pasted in full by the user 2026-09-08, from the course's Canvas page.
## Current State (2026-10-21)
[[20_Progress/Degree/CSCI 4061/Labs/Lab - 6|Lab 6]] is implemented and locally verified in the course dev container: 2/2 supplied tests, 1.0/1.0, plus empty/negative-at-end/all-negative edge cases and a 100,000-call reference-count leak check on the CPython extension. The actual `Labs/lab06-code/lab06-code.zip` was rebuilt and passed the same suite (SHA256 `[REDACTED]`). Deadline is **tonight, 2026-10-21, 11:59pm** (Lab 6's Monday 10/19 session follows the same Monday-session-to-Wednesday-deadline pattern every prior lab used). Gradescope submission/results and attendance remain unverified; the lab note holds the reasoning, reproducible commands, and error log. [[20_Progress/Degree/CSCI 4061/Labs/Lab - 5|Lab 5]] was previously verified the same way (5/5, 1.0/1.0) and submitted 2026-10-14.
## Current Grade
> [!DANGER] Estimated ceiling, not an earned grade — recompute once [[Hit or Miss - Miss]] gets the full Canvas pass
> Computed 2026-09-24 from [[Hit or Miss - Miss]] against this course's own weights and drop policy. This is the **maximum grade still reachable** if everything remaining is aced, degraded only by weight already lost to misses logged so far — not a real transcript grade, since most of the semester's weight hasn't happened yet.
- **Labs (10%, lowest 2 dropped):** Lab 1 and 2 both missed — exactly uses up both drops. 0% lost, but **zero buffer left**: the next missed lab costs real points.
- **Quizzes (10%, lowest 2 dropped):** Quiz 1 missed — 1 of 2 drops used. 0% lost, 1 buffer remaining.
- **Surveys (5%, 3 surveys, full credit for submitting, no drop):** Entrance Survey missed — 1 of 3 gone. **−1.67%.**
- **Project 1 Quiz missed** — required individual per-project spec quiz, exact point value not stated anywhere captured. Flagged unresolved, not counted below; confirm on Gradescope/Canvas whether this zeroes part of the Project 1 grade outright.
**Ceiling: ~98.3%**, plus one unresolved risk (Project 1 Quiz).
## Source of truth
> [!IMPORTANT] Read before trusting anything about this course
> Real source folder: `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061` — slides, PDFs, and any future Canvas exports land there first. This Board note is the readable distillation of the real syllabus (pasted in full 2026-09-08), not a replacement for checking Canvas directly when anything here seems stale, especially exam dates and project deadlines. Desktop shortcut: `CSCI 4061.lnk` in `D:\_Anant\`.
## What This Course Actually Covers
An introduction to modern computer systems and how operating systems support them. Starts with systems programming and OS primitives on Linux, moves into distributed systems. Taught first through C, then Python, then interop between the two — understanding both levels is the point, not just passing tests. Course catalog description: processes/threads, process coordination, interprocess communication, asynchronous events, memory management, file systems, systems programming projects using OS interfaces and dev tools.
**Real structure, per Lecture 1** (a genuinely new split this offering, not the traditional 4061 shape): **first ~65% of the class is traditional OS material** (with some new topics like C/Python interop), **last ~35% is new distributed systems material** - added because "this may be the last systems course you ever take." 10 major topics in order: (1) Processes/Process Creation, (2) Low-Level I/O, (3) Signals, (4) File Systems, (5) IPC, (6) Multi-Language Systems (C/Python interop), (7) Threads & Synchronization, (8) Network Communication & Protocols, (9) Distributed Systems Fundamentals, (10) Modern Topics (Large-Scale Systems, Virtualization).
CSCI 4061 contrasts with **CSCI 5103** (OS internals for their own sake, implementing OS features) and **CSCI 5105** (distributed systems internals in detail) - 4061 looks at both through the lens of systems programming and using existing tools, not building the internals itself.
## Instructor & TAs
Primary instructor: **Jack Kolb** (jhkolb@umn.edu, 300F Lind Hall). Office hours: **Wednesdays 2:00-3:00pm** (can always email to schedule an appointment) - per `Lec01.pdf`, 2026-09-15.

| TA             | Email            | Role        |
| -------------- | ---------------- | ----------- |
| Guangyan Sun   | sun01158@umn.edu | 50% Grad TA |
| Pengju Liu     | liu03486@umn.edu | 50% Grad TA |
| Zhipeng Lu     | lu000728@umn.edu | 50% Grad TA |
| Akul Mundada   | munda057@umn.edu | Ugrad TA    |
| Ben Mechels    | meche046@umn.edu | Ugrad TA    |
| Jason Jiang    | jian0905@umn.edu | Ugrad TA    |
| Ken Vang       | vang3832@umn.edu | Ugrad TA    |
| Krivan Semlani | semla014@umn.edu | Ugrad TA    |
## Meetings
Two sections run under this syllabus - confirm which one applies before trusting any date below.

| Section | Lecture                             | Lab                                                    |
| ------- | ------------------------------------ | ------------------------------------------------------ |
| 001     | TuTh 1:00–2:15pm, 101 Tate Hall     | Labs 002–005, Mondays 9:05am–1:10pm, 1-250 Keller Hall |
| 010     | TuTh 4:00–5:15pm, 3-210 Keller Hall | Labs 011–014, Mondays 1:25pm–5:30pm, 1-250 Keller Hall |
## Prerequisites
Grade of **C- or better in CSCI 2021 or EE 2361**, admission to CS Major/Minor or CompE Major. Beyond the formal requirement: solid C is essential, not optional - if rusty, review before week 1 using the C Programming Resources section below.
## Learning Objectives
By the end: understand core OS abstractions (processes, files, threads, synchronization, communication, local and networked) and why they enable security, integrity, flexibility, and efficiency; understand parallelism/concurrency tradeoffs and write real multi-process/multi-thread programs; reason about distributed systems (replication, partitioning, consistency, consensus) and their network protocols; do real systems programming with OS/networking primitives, low-level in C and higher-level in Python.
## Textbooks
Both required: *Advanced Programming in the UNIX Environment*, 3rd ed., Stevens & Rago, 2013 (via CourseWorks); *Designing Data-Intensive Applications*, 1st ed., Kleppmann, 2017 (via Library Course Materials).
## Computing Environment
> [!WARNING] Docker setup is not optional and not extendable
> Every assignment gets graded inside a standardized Docker Linux environment - this gets set up in the first lab (Mon 2026-09-14). Environment problems are explicitly **not** grounds for a deadline extension, and neither is data loss - back up work regularly. Setup guidance lives in the course's Programming Environment Guide on Canvas, not reproduced here yet.

### Resources
1. C Programming Resources
	Prerequisite review material, ranked by the course itself: **Dive Into Systems** (first few chapters, free online) is the top recommendation. Others if more depth is needed: the C Programming Wikibook, Beej's Guide to C Programming (informal, complete, ad-free), the GNU C Programming Tutorial (Burgess & Hale-Evans, a bit scattered), Learn C from ProgramIz (ad-heavy but example-rich), Burgess's 1999 C tutorial (dated but complete, single page), and Modern C (long, comprehensive, reflects current idiom).
	- Probably the best resource is the first few chapters of the [Dive Into SystemsLinks to an external site.](https://diveintosystems.org/book/) textbook, which is freely available online.
	If you are looking for more resources, you might try some of the following:
	- [Wikibook on C ProgrammingLinks to an external site.](https://en.wikibooks.org/wiki/C_Programming): Basic to advanced concepts with some pictures to address tricky concepts like arrays and pointers.
	- [Beej’s Guide to C ProgrammingLinks to an external site.](https://beej.us/guide/bgc/html/multi/index.html): Humorous, irreverent, reasonably complete, and ad-free.
	- The GNU C Programming Tutorial by Mark Burgess and Ron Hale-Evans, as [PDFLinks to an external site.](http://www.it.uc3m.es/pbasanta/asng/course_notes/ctut.pdf) or [HTMLLinks to an external site.](http://www.crasseux.com/books/ctutorial/index.html). A bit scattered but decent.
	- [Learn C Programming from ProgramIZLinks to an external site.](https://www.programiz.com/c-programming): Decent and many examples, but lots of ads.
	- [C Programming Tutorial by Mark Burgess, circa 1999Links to an external site.](http://markburgess.org/CTutorial/CTutorial.html): A bit dated and questionable code style, but fairly complete and comes as a single web page.
	- [Modern CLinks to an external site.](https://gustedt.gitlabpages.inria.fr/modern-c/): Very long and comprehensive, but as the title implies it reflects very up-to-date ideas on how to write C.
2. GDB Guide
	- https://ccrma.stanford.edu/~jos/stkintro/Useful_commands_gdb.html
	- https://sourceware.org/gdb/current/onlinedocs/gdb/TUI.html
	- Other gdb Guides
		- [Beej’s Quick Guide to GDBLinks to an external site.](http://beej.us/guide/bggdb/): Beej’s guides are accurate, short, and usually funny
		- [Official GDB ManualLinks to an external site.](https://sourceware.org/gdb/current/onlinedocs/gdb/): Long and thorough, go here if you need more information
## Important Dates
Start of semester / first lecture: **Tue 2026-09-08**. First lab meetings: **Mon 2026-09-14**. Midterm 1: **Thu 2026-10-08**, in class, 75 min. Midterm 2: **Thu 2026-11-12**, in class, 75 min. Final exam - Section 001: **Mon 2026-12-21, 8:00–10:00am**, location TBD. Final exam - Section 010: **Thu 2026-12-17, 4:00–6:00pm**, location TBD.
## Course Tools
Canvas is the primary information source - check it regularly. Piazza is the Q&A forum. Gradescope handles all programming-assignment and exam submission/grading, including regrade requests.
## Grading
| Component | Weight |
|---|---|
| Weekly Canvas Quizzes (lowest 2 dropped) | 10% |
| Laboratory Assignments (lowest 2 dropped) | 10% |
| Course Projects | 25% |
| Midterm Exam 1 | 15% |
| Midterm Exam 2 | 15% |
| Final Exam (cumulative) | 20% |
| Surveys | 5% |
No rounding on the scale below; a curve, if applied, only moves grades up, never down.

| %     | Grade | %     | Grade |
| ----- | ----- | ----- | ----- |
| 93+   | A     | 73–76 | C     |
| 90–92 | A-    | 70–72 | C-    |
| 87–89 | B+    | 65–69 | D+    |
| 83–86 | B     | 60–64 | D     |
| 80–82 | B-    | ≤59   | F     |
| 77–79 | C+    |       |       |
## Labs
Attendance at each week's lab is required to get credit for that week's assignment - labs solidify lecture material and are the natural place to find project teammates. Submitted on Gradescope, due **11:59pm the Wednesday following** each lab session. **No late work accepted** for labs; two lowest scores dropped to absorb unavoidable misses.
## Weekly Canvas Quizzes
**Released Monday, due the following Monday** (a full week window, not same-day) - per `Lec01.pdf`. Applies recent lecture/lab/reading material, auto-graded with **10 attempts allowed**. No late work accepted; two lowest dropped. Open-resource and open-collaboration explicitly encouraged ("as long as you understand your answers"), but the submitted answers must reflect real personal understanding - the academic integrity policy applies here too. First quiz released the first week, due 9/14.
## Projects
Four projects this semester (see Schedule below), **6.25% of course grade each** (25% total), each pairing a coding submission with an **individual oral exam** on its design and functionality - even if the project itself was done as a team of two. A per-project spec quiz must be completed individually. Teams of three+ are not allowed, and once a two-person team dissolves mid-project, the remaining partner finishes solo - no new partner until the next project. Grading has three real components: automated Gradescope test results (not exhaustive - passing tests isn't a completion guarantee), manual inspection of error-handling quality, and the oral exam. Project grade is your **latest submission**, not your best one. **The Gradescope score will not match the final Canvas score** - manual inspection and the oral exam adjust it afterward, per `Lec01.pdf`.
## Surveys
**5% of course grade, 3 surveys**: Entrance Survey (released week 1), Mid-Semester Survey, Exit Survey. Full credit awarded simply for submitting - not graded on content.
> [!WARNING] Late project penalty schedule
> On time: full credit. Up to 24h late: **90%** of earned credit. Up to 48h late: **80%**. Beyond 48h: **0%**. An 80-point submission becomes 72 at 24h late, 64 at 48h late, 0 after that.
## Exams
Two 75-minute midterms during normal lecture time, one 120-minute cumulative final at the university-assigned time. All graded and regrade-requested through Gradescope. **Collaboration in any form is prohibited on exams**, and the default assumption is that no resources (notes, electronics, textbooks) are allowed unless a specific exam's resource policy says otherwise - that policy gets announced well ahead of each exam.
## Extra Credit, Withdrawals, Incompletes
No extra credit opportunities exist in this course. Withdrawal without special approval is only guaranteed through the end of Week 4 - after that, only the college administration can approve one, and only in extraordinary circumstances. Incompletes are instructor-discretion only, and only with a substantial, timely portion of the work already done.
## Workload
Per university policy, ~3 hours/week per credit - this is a 4-credit course, so budget **~12 hours/week** against [[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan|Fall 2026 Plan]]'s 80/20 daily split. That is the heaviest single-class load among the six Fall'26 courses and should be weighted accordingly when the week's One Hard Thing competes with a project deadline.
## Schedule
Readings: "Stevens" = *Advanced Programming in the UNIX Environment*; "Kleppmann" = *Designing Data-Intensive Applications*.

| Wk | Lecture Topics | Reading | Due This Week |
|---|---|---|---|
| 1 | 9/7 No class (Labor Day); 9/8 Course Introduction (first lecture); 9/10 System Calls, Process Management | Stevens Chs 1, 7, 8 | Quiz 1 & Entrance Survey released |
| 2 | Process Management, Intro Low-Level I/O; Advanced I/O, Redirection | Stevens Chs 7, 3 | Quiz 1 + Entrance Survey due; Lab 1; Project 1 released; Project 1 Quiz due |
| 3 | Signals; More Signals, Intro File Systems | Stevens Chs 10, 4 | Quiz 2 due; Lab 2 |
| 4 | File Systems; IPC: Pipes | Stevens Ch 4, 15.1–15.2 | Quiz 3 due; Lab 3; **Project 1 due (10/2)** |
| 5 | IPC: Pipes and Shared Memory; **Midterm 1 (10/8)** | Stevens 15.1, 15.2, 15.9 | Quiz 4 due; Lab 4 |
| 6 | Finish IPC, Multiplexed I/O; Systems Programming in Python, C/Python Interop | Stevens 15.9, 14.4 | Quiz 5 due; Lab 5; Project 2 released; Project 2 Quiz due |
| 7 | Intro to Threads; Threads and Basic Synchronization | Stevens Ch 11 | Quiz 6 released; Lab 6 |
| 8 | Advanced Synchronization; Finish Synchronization, Start Networking | Stevens Chs 11, 12, 16 | Quiz 6 due; Mid-Semester Survey released; Lab 7; **Project 2 due (10/30)** |
| 9 | Sockets and UDP/TCP; Finish TCP, HTTP 1/2 | Stevens Ch 16 | Quiz 7 due; Mid-Semester Survey due; Lab 8; Project 3 released; Project 3 Quiz due |
| 10 | Finish Protocols, Python Multithreading; **Midterm 2 (11/12)** | — | Quiz 8 due; Lab 9 |
| 11 | Data Serialization, Intro Distributed Systems; More Dist Sys, RPC | Kleppmann Chs 8, 4 | Quiz 9 due; Lab 10; **Project 3 due (11/20)** |
| 12 | Finish RPC; No class 11/26 (Thanksgiving) | Kleppmann Ch 4 | Quiz 10 released; Lab 11; Project 4 released |
| 13 | Replication and Partitioning; Consistency and Consensus | Kleppmann Chs 5, 6, 7, 9 | Quiz 10 due; Lab 12; Project 4 Quiz due |
| 14 | Example Large-Scale Systems, Microservices; Virtualization and Containers | — | Quiz 11 due; Lab 13; **Project 4 due (12/11)** |
| 15 | Looking Ahead: Web, OS, Embedded | — | Quiz 12 due |
Final exam per section is listed in Important Dates above, not repeated here.
## Standards Once Material Starts
Week-by-week notes follow [[Weekly Standard]] once lectures actually begin - this Board stays the single-class deep source for grading detail, policy, and the full schedule; the spreadsheet cross-class view is `Fall'26 Semester Calendar.xlsx` (`10_Areas/UMN/Plan/In Semester Review/`).
## Common Mistakes
None logged yet for this course specifically - add here the first time something costs real points, per the [[Fall'26 Syllabus]] convention.
## Verification Notes (2026-09-15 addendum)
`Lecture/Lec01.pdf` (Course Mechanics & Introduction, 2026-09-08) was read in full and used to add real detail not in the original pasted syllabus: office hours, the 65%/35% traditional-OS/distributed-systems split rationale, the exact weekly-quiz release/due window, project grading mechanics (Gradescope-vs-Canvas score mismatch), and the exact survey count/names. Both required textbooks and Lec01 slides are now present in the source folder - no longer waiting on Canvas exports for week 1.
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis/30_Order" && cat "Standards/Courses/Lab Standard.md" "Templates/Classes/Lab Template.md" "Workflows/Courses/Lab Workflow.md"
```
````
---
type: system
status: sprout
created: 2026-09-08
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: course-lab
tier: 1
maps_to:
  - "[[Lab Template]]"
used_by:
  - "[[Lab Workflow]]"
gold_standard: "[[20_Progress/Degree/CSCI 4061/Labs/Lab - 3|Lab - 3]]"
notes:
  - "[[Weekly Standard]]"
  - "[[Concept Standard]]"
---
# Lab Standard
==A lab note's real value is its error log: Problem, Fix, Why, Evidence. The same class of error costs an hour the first time and should cost a minute the second.==
This is the standard for a lab note at `<Course>/Labs/Lab - N.md`. A lab is usually low-stakes on its own, so the write-up is not proof that the work happened. It is a personal debugging reference that gets faster to consult each week.
## Spec
```json
{
  "family": "course-lab",
  "tier": 1,
  "match": {"type": "class", "kind": "lab", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "class_kind", "status", "created", "updated", "tags", "area", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "area": "list", "deadline": "date"},
  "headings": ["Goal", "Procedure / key steps", "Results", "Errors + fixes"],
  "optional_headings": ["Flashcards"],
  "legacy_match": [
    {"type": "class", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/", "where": {"input_kind": "lab"}, "absent": ["class_kind"]}
  ]
}
```
## Headings
### Frontmatter
`class_kind: lab`, `status: seed` (labs rarely need to mature past it), `area` linking the course Board and the week the lab paired with, optional `deadline` only when sourced, `tags: [class, lab]`, and `next`.
### Goal
What the lab was trying to accomplish, in your own words, not the assignment title. Separate the required behavior from your chosen implementation.
*Density:* one sentence.
> [!WARNING]
> Copying the assignment title as the goal.
### Procedure / key steps
The real sequence, compressed to the decision points: which flag, which config, which command. Enough that redoing the lab from this note alone would work. Record commands, interfaces, and tests from the prompt, starter files, and actual run output.
> [!WARNING]
> A procedure so compressed it skips the decisions that were the point of the lab.
### Results
What actually came out: a number, a passing test suite, a working build, stated plainly. Never claim tests passed without observed output.
*Density:* short and factual.
### Errors + fixes
==The centerpiece.== One entry per real error, however small: *Problem:* the symptom and the smallest reproduction. *Fix:* the change that resolved it. *Why:* the mechanism, so the next error of this class is recognized. *Evidence:* the test or output that proves the fix.
> [!WARNING]
> Recording the fix without the Why. "Added a semicolon" does not help when the same class of error returns in a different form.
### Flashcards
Optional. Only for a reusable debugging pattern, on `#cards/<course-slug>`. After the lab, carry durable discoveries to the week and concept notes. Do not force cards out of mechanical setup.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `input_kind: lab` | `class_kind: lab` | Mechanical |
| `tags: ["#class", "#Lab"]` | `tags: [class, lab]` | Mechanical |
| Entries with Problem and Fix but no Why or Evidence | Add Why and Evidence from the run output | Judgment |
| Extra `Sources and scope` section | Fold into Goal | Judgment |
| Extra `Practice for Project 2 and exams` section | Link to the concept or exam material; keep one line here | Judgment |
## Done Conditions
- The procedure is detailed enough to redo the lab from the note.
- Every real error has Problem, Fix, Why, and Evidence.
- The goal is in your own words, and results come from observed output.
- Durable discoveries were propagated to the week and concept notes.
## Gold Standard Example
[[20_Progress/Degree/CSCI 4061/Labs/Lab - 3|Lab - 3]]: all four required headings, with a substantive error log and observed results.
---
type: class
class_kind: lab
status: seed
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - class
  - lab
area:
next:
---
# <% tp.file.title %>
## Goal
<!-- What the lab was trying to accomplish, in your own words. -->
## Procedure / key steps
<!-- The decision points and commands needed to redo the lab from this note. -->
## Results
<!-- The observed output: numbers, tests, a working build. -->
## Errors + fixes
<!-- One entry per real error with Problem, Fix, Why, and Evidence. -->
## Flashcards
<!-- Optional. Only reusable debugging patterns, on #cards/<course-slug>. -->
---
type: system
status: sprout
created: 2026-09-08
updated: 2026-10-16
tags:
  - system
  - workflow
system_kind: workflow
serves: "[[Lab Standard]]"
trigger: A lab prompt and starter files are available, or a lab session just happened.
notes:
  - "[[Lab Template]]"
  - "[[Weekly Workflow]]"
  - "[[Concept Workflow]]"
---
# Lab Workflow
Capture a lab's errors and fixes while they are still specific, not from memory days later.
## Use when
The lab prompt is available (create the note before or during the lab), or a session just ended.
## Steps
1. Read [[Lab Standard]]. Its Errors + fixes section is the point of the note.
2. Create `Lab - N` in the course's `Labs/` folder from [[Lab Template]] using the prompt, starter files, tests, and the paired lecture and textbook material.
3. Write the Goal and the Procedure in your own words, keeping the decision points: flags, config, commands.
4. As each error is resolved, write its Problem, Fix, Why, and Evidence on the spot. Take Evidence from the actual test or run output.
5. Record the observed Results. Keep collaboration rules and required submission steps separate from the implementation you chose.
6. Link the lab to its week and the concepts it exercised. Carry durable debugging patterns to the concept, preparation, and exam-practice notes.
7. Run [[Vault Lint]] on the path and fix what it reports.
## Do not
Do not claim tests passed without observed output, or paste a full solution only to make the note look complete.
## Done when
- Every real error has Problem, Fix, Why, and Evidence.
- Results are plain and the lab is linked to its week.
````
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 4061" && cat "Textbook/Textbook Map.md"; ls Concepts/Lecture Concepts/Code "Concepts/C Refresher" Concepts/Exams; ls -la Weekly
```
```
---
type: class
input_kind: textbook
status: sprout
created: 2026-09-08
updated: 2026-10-02
area:
  - "[[CSCI 4061 Board]]"
tags:
  - "#class"
  - "#Textbook"
next: "Extend Chapter 15 past §15.9 (Message Queues §15.7, Semaphores §15.8) only if a future week's reading actually assigns them - not assigned as of Week 5"
---
# CSCI 4061 — Textbook Map
==Two required texts split cleanly by subject half: Stevens & Rago covers the systems-programming-in-C half, Kleppmann covers the distributed-systems half that starts around Week 11.== Cross-referenced against the Schedule table in [[CSCI 4061 Board]].
## Stevens & Rago — Advanced Programming in the UNIX Environment (3rd ed., 2013)
Covers Weeks 1-10, the systems-programming core of the course:
- **Ch 1, 7, 8** - Week 1: System calls, process management basics. [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter 1]], [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter 7]], and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8|Chapter 8]] are all landed and **source-checked against the textbook PDF**.
- **Ch 7, 3** - Week 2: Process management continued, low-level and advanced I/O. [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter 3]] is landed and source-checked.
- **Ch 10, 4** - Week 3: Signals, intro file systems. [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter 10]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter 4]] are landed and source-checked.
- **Ch 4, 15.1-15.2** - Week 4: File systems continued, IPC pipes. [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter 4]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 15|Chapter 15]] (§15.1-15.2) are both landed and source-checked.
- **15.1, 15.2, 15.9** - Week 5: IPC pipes and shared memory. [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 15|Chapter 15]] already covers §15.9 (landed ahead of this week, since Gemini Notebook built both parts back to back) - no further textbook production needed for Week 5 unless the real lecture reveals a gap.
- **15.9, 14.4** - Week 6: Finish IPC/multiplexed I/O, systems programming in Python and C/Python interop. No chapter note yet.
- **Ch 11** - Week 7: Threads, basic synchronization. No chapter note yet.
- **Ch 11, 12, 16** - Week 8: Advanced synchronization, start networking. No chapter note yet.
- **Ch 16** - Week 9: Sockets, UDP/TCP, HTTP. No chapter note yet.
All seven landed chapter notes (Chapters 1, 3, 4, 7, 8, 10, 15) are now source-checked against the textbook PDF as of 2026-10-02, matching Weeks 1-5's reading in full. Chapters for Weeks 6+ are created as their weeks are actually covered, per [[Weekly Standard]].
## Kleppmann — Designing Data-Intensive Applications (1st ed., 2017)
Covers Weeks 11-13, the distributed-systems half:
- **Ch 8, 4** - Week 11: Data serialization, intro distributed systems, RPC.
- **Ch 4** - Week 12: Finish RPC (Thanksgiving-shortened week).
- **Ch 5, 6, 7, 9** - Week 13: Replication, partitioning, consistency, and consensus.
No chapter notes yet - same as above, created as covered.
## Status
All six chapter notes (Chapters 1, 3, 4, 7, 8, 10) are now source-checked against the actual textbook PDF as of 2026-09-29, matching Weeks 1-4's full reading list. Every chapter was restructured to this vault's real Textbook Standard shape (`Full Reading Notes` heading restored where missing, duplicate template stubs removed, frontmatter fixed - real `created`/`updated` dates and `area:` pointing at this course's own Board and Map instead of `[[UMN Board]]`, flashcards capped at 10 under `#cards/csci4061`), and enriched with real content the original NotebookLM pass had dropped entirely: Chapter 3 gained `lseek`, I/O-efficiency benchmarks, `sync`/`fsync`/`fdatasync`, `fcntl`, `ioctl`, and `/dev/fd`; Chapter 4 gained roughly twenty missing subsections (setuid/setgid, `umask`, `chmod`, the sticky bit, `chown`, file truncation, hard and symbolic links, `rename`, file times, `mkdir`/`rmdir`, directory reading, and device special files - previously only 6 of 26 subsections existed); Chapter 7 gained the entire `setjmp`/`longjmp` section (§7.10) and `getrlimit`/`setrlimit` (§7.11); Chapter 8 gained changing UIDs/GIDs, interpreter files, `system`, process accounting, `getlogin`, scheduling, and process times (§8.11-8.17); Chapter 10 gained unreliable-signal history, `SIGCLD` semantics, reliable-signal terminology, `alarm()`, `sigsetjmp`/`siglongjmp`, `abort`, signal-aware `system`, `sigqueue`, formal job-control signals, and signal name/number utilities. See each chapter's own Connections section for exactly which sections still have no matching lecture slide (mostly textbook-only material Lec01-06 never touched).
## Correction (2026-09-24, from reading Lec01-06 in full)
The clean one-chapter-per-week mapping above is real for lecture *topic order* but not for what actually gets tested. Lec04 (the "Ch3 week" I/O lecture) also teaches file permission bits (chmod, octal notation, S_IRUSR/etc.) — that's APUE **§4.5-4.9**, not Ch3 — and stdio buffering (fully/line/unbuffered, fflush, fsync) — that's APUE **Chapter 5**, not Ch3. Lec06 (the second "Ch10 week" lecture) already previews the start of Ch4 (storage devices, i-nodes, paths, directories) a full week before Ch4's own scheduled week. See [[20_Progress/Degree/Repetitive Things|Repetitive Things]] for the Gemini Notebook prompts built around this, and the real lecture-by-lecture grounding behind each one.
Concepts/C Refresher:
Arrays and Strings.md
Bitwise Operations and Integer Representation.md
C Language.md
Compilation and Linking.md
Dynamic Memory.md
File IO in C.md
Linked Data Structures.md
Pointers and Addresses.md
Recursion.md
Structs and Typedef.md
x86-64 and Memory Layout.md

Concepts/Code:

Concepts/Exams:
Midterm - 1 MOC.md

Concepts/Lecture:
total 76
drwxr-xr-x 1 anant 197609     0 Oct  2 16:18 .
drwxr-xr-x 1 anant 197609     0 Oct 21 20:31 ..
-rw-r--r-- 1 anant 197609 17026 Oct  2 16:33 Week - 1.md
-rw-r--r-- 1 anant 197609 22437 Sep 29 22:18 Week - 2.md
-rw-r--r-- 1 anant 197609 22160 Sep 29 22:18 Week - 3.md
-rw-r--r-- 1 anant 197609 25441 Oct  2 16:33 Week - 4.md
-rw-r--r-- 1 anant 197609  3128 Oct  2 16:33 Weekly Board.md
```
- `Bash`
```bash
cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061" && ls; echo ---; ls Lectures lecture* Textbook* 2>/dev/null; echo ---; ls csci4061-fa26; ls csci4061-fa26/* | head -80
```
```
Labs
Lecture
Midterm
Textbook
csci4061-fa26
---
Textbook:
Advanced Programming in the UNIX Environment, 3rd Edition.pdf
---
Labs
Lecture
Practice
Projects
csci4061-fa26/Labs:
lab01-code
lab02-code
lab03-code
lab04-code
lab05-code
lab06-code
lab07-code
lab08-code

csci4061-fa26/Lecture:
lecture01-code
lecture02-code
lecture03-code
lecture04-code
lecture05-code
lecture07-code
lecture08-code
lecture09-code
lecture10-code
lecture11-code
lecture12-code
lecture13-code

csci4061-fa26/Practice:

csci4061-fa26/Projects:
proj1-code
proj1-original
proj2-code
proj2-code-naf
proj2-original
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash`
```bash
cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061" && ls Lecture; for d in lecture11-code lecture12-code lecture13-code; do echo "== $d"; ls -la csci4061-fa26/Lecture/$d; done
```
```
Transcripts
Week - 1
Week - 2
Week - 3
Week - 4
Week - 5
Week - 6
Week - 7
Week - 8
== lecture11-code
total 25
drwxr-xr-x 1 anant 197609    0 Oct 30 17:21 .
drwxr-xr-x 1 anant 197609    0 Oct 30 17:22 ..
-rw-r--r-- 1 anant 197609  433 Oct 30 17:21 Makefile
-rw-r--r-- 1 anant 197609  279 Oct 30 17:21 hello.c
-rw-r--r-- 1 anant 197609  327 Oct 30 17:21 hello.py
-rw-r--r-- 1 anant 197609  435 Oct 30 17:21 hello_extension.c
-rw-r--r-- 1 anant 197609 1888 Oct 30 17:21 inc_list.c
-rw-r--r-- 1 anant 197609  293 Oct 30 17:21 inc_list_main.py
-rw-r--r-- 1 anant 197609  529 Oct 30 17:21 multiproc.py
-rw-r--r-- 1 anant 197609  299 Oct 30 17:21 my_cat.py
-rw-r--r-- 1 anant 197609 1143 Oct 30 17:21 python_pipes.py
-rw-r--r-- 1 anant 197609  395 Oct 30 17:21 setup.py
-rw-r--r-- 1 anant 197609   15 Oct 30 17:21 test.txt
== lecture12-code
total 29
drwxr-xr-x 1 anant 197609    0 Oct 30 17:22 .
drwxr-xr-x 1 anant 197609    0 Oct 30 17:22 ..
-rw-r--r-- 1 anant 197609  247 Oct 30 17:22 Makefile
-rw-r--r-- 1 anant 197609 3948 Oct 30 17:22 array_threads_v1.c
-rw-r--r-- 1 anant 197609 3947 Oct 30 17:22 array_threads_v2.c
-rw-r--r-- 1 anant 197609 1934 Oct 30 17:22 pthreads_exercise_v1.c
-rw-r--r-- 1 anant 197609 2465 Oct 30 17:22 pthreads_exercise_v2.c
-rw-r--r-- 1 anant 197609 2259 Oct 30 17:22 pthreads_exercise_v3.c
== lecture13-code
total 9
drwxr-xr-x 1 anant 197609    0 Oct 30 17:22 .
drwxr-xr-x 1 anant 197609    0 Oct 30 17:22 ..
-rw-r--r-- 1 anant 197609  161 Oct 30 17:22 Makefile
-rw-r--r-- 1 anant 197609 3017 Oct 30 17:22 array_threads_sum_fixed.c
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash`
```bash
cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/Lecture" && ls "Week - 7" "Week - 8" Transcripts | head -50; grep -ril "pthread_cond" "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/csci4061-fa26" 2>/dev/null | head
```
```
Transcripts:
Week 1 - 3
Week 4 - 8

Week - 7:
Lec12.pdf
Lec13.pdf

Week - 8:
Lec14.pdf
Lec15.pdf
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/csci4061-fa26/Labs/lab07-code/QUESTIONS.txt
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/csci4061-fa26/Labs/lab07-code/QUESTIONS.txt.bak
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/csci4061-fa26/Labs/lab08-code/QUESTIONS.txt
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/csci4061-fa26/Labs/lab08-code/QUESTIONS.txt.bak
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/csci4061-fa26/Labs/lab08-code/queue.h
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash`
```bash
cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/Lecture" && for f in "Week - 8/Lec14.pdf" "Week - 8/Lec15.pdf"; do powershell -NoProfile -ExecutionPolicy Bypass -File D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/claude-workflow/scripts/mineru-pdf.ps1 "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/Lecture/$f" | head -3; done; ls -R Transcripts | head -40
```
```
OK  mineru parse done in 1 s (cache hit: True, server started by this run: False)
Markdown : C:\Users\anant\AppData\Local\Temp\mineru-out\Lec14.standard.pall.md (17767 bytes)
Pages    : 1-34   Tier: standard   Document: e9017bb
OK  mineru parse done in 1 s (cache hit: True, server started by this run: False)
Markdown : C:\Users\anant\AppData\Local\Temp\mineru-out\Lec15.standard.pall.md (21949 bytes)
Pages    : 1-38   Tier: standard   Document: 91036fc
Transcripts:
Week 1 - 3
Week 4 - 8

Transcripts/Week 1 - 3:
en-CSCI 4061 September 8 lecture (multi-source).txt
en-CSCI 4061-10 September 10 Lecture (multi-source).txt
en-CSCI 4061-10 September 15 Lecture (multi-source).txt
en-CSCI 4061-10 September 17 Lecture (multi-source).txt
en-CSCI 4061-10 September 22 Lecture (multi-source).txt
en-CSCI 4061-10 September 24 Lecture (multi-source).txt

Transcripts/Week 4 - 8:
en-CSCI 4061 October 29 lecture (multi-source).txt
en-CSCI 4061-10 October 1 Lecture (multi-source).txt
en-CSCI 4061-10 October 13 Lecture (multi-source).txt
en-CSCI 4061-10 October 15 lecture (multi-source).txt
en-CSCI 4061-10 October 20 Lecture (multi-source).txt
en-CSCI 4061-10 October 22 Lecture (multi-source).txt
en-CSCI 4061-10 October 27 Lecture (multi-source).txt
en-CSCI 4061-10 October 6 Lecture (multi-source).txt
en-CSCI 4061-10 October 8 Lecture (multi-source).txt
en-CSCI 4061-10 September 29 Lecture (multi-source).txt
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Read` -- `C:\Users\anant\AppData\Local\Temp\mineru-out\Lec15.standard.pall.md`
- `Read` -- `C:\Users\anant\AppData\Local\Temp\mineru-out\Lec14.standard.pall.md`
- `Bash`
```bash
cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/Lecture/Week - 7" && for f in Lec12.pdf Lec13.pdf; do powershell -NoProfile -ExecutionPolicy Bypass -File D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/claude-workflow/scripts/mineru-pdf.ps1 "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/Lecture/Week - 7/$f" | head -3; done; grep -il "cond" C:/Users/anant/AppData/Local/Temp/mineru-out/Lec1[23]*.md
```
```
OK  mineru parse done in 1 s (cache hit: True, server started by this run: False)
Markdown : C:\Users\anant\AppData\Local\Temp\mineru-out\Lec12.standard.pall.md (15255 bytes)
Pages    : 1-27   Tier: standard   Document: 68547d0
OK  mineru parse done in 2 s (cache hit: True, server started by this run: False)
Markdown : C:\Users\anant\AppData\Local\Temp\mineru-out\Lec13.standard.pall.md (24759 bytes)
Pages    : 1-44   Tier: standard   Document: 4074df9
C:/Users/anant/AppData/Local/Temp/mineru-out/Lec12.standard.pall.md
C:/Users/anant/AppData/Local/Temp/mineru-out/Lec13.standard.pall.md
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Read` -- `C:\Users\anant\AppData\Local\Temp\mineru-out\Lec13.standard.pall.md`
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 4061/Textbook" && grep -n -i "pdf page\|offset\|p\. [0-9]\|pages" "Chapter - 15.md" | head -10; ls C:/Users/anant/AppData/Local/Temp/mineru-out/ | head -30
```
```
16:**Source:** W. Richard Stevens and Stephen A. Rago, *Advanced Programming in the UNIX Environment*, 3rd ed. (Addison-Wesley, 2013), Chapter 15, §15.1-15.2 (pp. 533-540) and §15.9 (pp. 571-579).
23:- **interprocess communication (IPC)**: Techniques letting independent processes exchange data and coordinate actions (p. 533).
24:- **half-duplex pipe**: A unidirectional kernel-buffered channel; data flows only from the write end to the read end (p. 534).
25:- **full-duplex pipe**: A pipe whose two ends can both read and write; POSIX.1 permits but does not require it (p. 534).
26:- **common ancestor limitation**: A pipe can only be shared between processes descended from the one that called `pipe()` before `fork()`-ing (p. 534-535).
27:- **pipe**: `int pipe(int fd[2]);` - creates an unnamed pipe; `fd[0]` is the read end, `fd[1]` is the write end (p. 535).
28:- **S_ISFIFO**: Macro testing `fstat()`'s `st_mode` to confirm a descriptor is a pipe (p. 535).
29:- **PIPE_BUF**: The kernel's per-pipe atomicity threshold (queried via `fpathconf`); writes at or under this size never interleave with another writer's bytes (p. 537).
30:- **SIGPIPE / EPIPE**: Writing to a pipe with no open read end raises `SIGPIPE` (default: terminate); if caught or ignored, `write()` instead returns -1 with `errno == EPIPE` (p. 537).
31:- **TELL_WAIT family**: The `TELL_PARENT`/`TELL_CHILD`/`WAIT_PARENT`/`WAIT_CHILD` synchronization API from Chapter 8/10, rebuilt here on two pipes instead of signals (p. 539-540).
[REDACTED].standard.p100-115.md
[REDACTED].standard.p190-191.md
[REDACTED].standard.p263-278.md
[REDACTED].standard.p349-352.md
[REDACTED].standard.p417-431.md
[REDACTED].standard.p476-480.md
[REDACTED].standard.p48-50.md
[REDACTED].standard.p559-565.md
[REDACTED].standard.p560-562.md
[REDACTED].standard.p567-575.md
[REDACTED].standard.p605-613.md
[REDACTED].standard.p8-26.md
CSCI4511W_Lecture_11.standard.pall.md
CSCI4511W_Lecture_12.standard.pall.md
CSCI4511W_Lecture_13.standard.pall.md
CSCI4511W_Lecture_14.standard.pall.md
CSCI_2521___1521_FAQ.standard.pall.md
CSCI_4061_Lab_06.standard.pall.md
CSCI_4061_Lab_07.standard.pall.md
CSCI_4511W_Textbook.standard.p240-240.md
CSCI_4511W_Textbook.standard.p300-300.md
CSCI_4511W_Textbook.standard.p314-326.md
CSCI_4511W_Textbook.standard.p345-375.md
Discussion_8.standard.pall.md
Lab_04.standard.pall.md
Lab_05.standard.pall.md
Lab_08.standard.pall.md
Lec05.standard.pall.md
Lec07.standard.pall.md
Lec08.standard.pall.md
```
- `Bash`
```bash
cd C:/Users/anant/AppData/Local/Temp/mineru-out && grep -l -i "pthread_cond_wait" *.md; grep -n -i "^.*11\.6\.[0-9]" Advanced*p476-480.md Advanced*p417-431.md | head
```
```
Lab_08.standard.pall.md
Lec13.standard.pall.md
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook
```
- `Bash`
```bash
cd C:/Users/anant/AppData/Local/Temp/mineru-out && head -c 600 Advanced*p476-480.md; echo; grep -o "<!-- page [0-9]* of [0-9]* -->" Advanced*p476-480.md | head -3; grep -n -i "Thread Synchronization\|Mutexes" Advanced*p476-480.md | head
```
```
<!-- page 476 of 1034 -->

442

Thread Control

Chapter 12

The value of the process-shared attribute can be either PTHREAD\_PROCESS\_SHARED (accessible to threads from multiple processes) or PTHREAD\_PROCESS\_PRIVATE (accessible to only threads in the process that initialized the barrier).

## 12.5 Reentrancy

We discussed reentrant functions and signal handlers in Section 10.6. Threads are similar to signal handlers when it comes to reentrancy. In both cases, multiple threads of control can potentially call the same function at the same time.

| basename catgets cryptdbm_cleare
<!-- page 476 of 1034 -->
<!-- page 477 of 1034 -->
<!-- page 478 of 1034 -->
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook
```
- `Bash`
```bash
powershell -NoProfile -ExecutionPolicy Bypass -File D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/claude-workflow/scripts/mineru-pdf.ps1 "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/Textbook/Advanced Programming in the UNIX Environment, 3rd Edition.pdf" -Pages 452-468
```
```
OK  mineru parse done in 29 s (cache hit: False, server started by this run: False)
Markdown : C:\Users\anant\AppData\Local\Temp\mineru-out\[REDACTED].standard.p452-468.md (36377 bytes)
Pages    : 452-468   Tier: standard   Document: 3b273a8
Next     : read the Markdown with the Read tool in pieces (offset and limit); page markers look like '<!-- page N of M -->'.
Pieces   : mineru read doc:3b273a8/tier:standard/page:N --context 1      one page and its neighbours, from the cache
Figures  : mineru read doc:3b273a8/tier:standard/page:N --format image --output page-N.png     then Read the PNG
Find     : mineru search "terms" --json                  across everything parsed so far
```
- `Bash`
```bash
cd C:/Users/anant/AppData/Local/Temp/mineru-out && f=Advanced_Programming_in_the_UNIX_Environment__3rd_Edition.standard.p452-468.md; grep -n "^## \|^### \|<!-- page" $f | head -80
```
```
1:<!-- page 452 of 1034 -->
29:## 11.6.8 Barriers
49:<!-- page 453 of 1034 -->
73:## Example
98:<!-- page 454 of 1034 -->
164:<!-- page 455 of 1034 -->
227:<!-- page 456 of 1034 -->
245:## 11.7 Summary
249:## Exercises
267:<!-- page 457 of 1034 -->
287:<!-- page 458 of 1034 -->
291:<!-- page 459 of 1034 -->
295:## 12.1 Introduction
301:## 12.2 Thread Limits
309:<!-- page 460 of 1034 -->
336:## 12.3 Thread Attributes
342:<!-- page 461 of 1034 -->
379:<!-- page 462 of 1034 -->
399:## Example
429:<!-- page 463 of 1034 -->
464:<!-- page 464 of 1034 -->
504:## 12.4 Synchronization Attributes
508:## 12.4.1 Mutex Attributes
512:<!-- page 465 of 1034 -->
554:<!-- page 466 of 1034 -->
589:<!-- page 467 of 1034 -->
628:<!-- page 468 of 1034 -->
653:## Example
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook
```
- `Bash`
```bash
powershell -NoProfile -ExecutionPolicy Bypass -File D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/claude-workflow/scripts/mineru-pdf.ps1 "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/Textbook/Advanced Programming in the UNIX Environment, 3rd Edition.pdf" -Pages 436-451 | head -3; cd C:/Users/anant/AppData/Local/Temp/mineru-out && grep -n "^## \|^### \|<!-- page" Advanced*p436-451.md | head -60
```
```
OK  mineru parse done in 39 s (cache hit: False, server started by this run: False)
Markdown : C:\Users\anant\AppData\Local\Temp\mineru-out\[REDACTED].standard.p436-451.md (34087 bytes)
Pages    : 436-451   Tier: standard   Document: 3b273a8
1:<!-- page 436 of 1034 -->
17:## 11.6.2 Deadlock Avoidance
25:## Example
29:<!-- page 437 of 1034 -->
94:<!-- page 438 of 1034 -->
159:<!-- page 439 of 1034 -->
206:<!-- page 440 of 1034 -->
271:<!-- page 441 of 1034 -->
296:## 11.6.3 pthread\_mutex\_timedlock Function
312:## Example
316:<!-- page 442 of 1034 -->
376:<!-- page 443 of 1034 -->
386:## 11.6.4 Reader–Writer Locks
414:<!-- page 444 of 1034 -->
449:## Example
462:<!-- page 445 of 1034 -->
521:<!-- page 446 of 1034 -->
584:<!-- page 447 of 1034 -->
596:## 11.6.5 Reader–Writer Locking with Timeouts
615:## 11.6.6 Condition Variables
623:<!-- page 448 of 1034 -->
673:<!-- page 449 of 1034 -->
719:## Example
723:<!-- page 450 of 1034 -->
778:<!-- page 451 of 1034 -->
786:## 11.6.7 Spin Locks
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook
```
- `Read` -- `C:\Users\anant\AppData\Local\Temp\mineru-out\Advanced_Programming_in_the_UNIX_Environment__3rd_Edition.standard.p436-451.md`
- `Bash`
```bash
cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/csci4061-fa26" && cat Lecture/lecture13-code/array_threads_sum_fixed.c; echo =======; cat -A Labs/lab07-code/sum_files.c | sed 's/\$$//' | sed -n 1,200p; echo ====; diff Labs/lab07-code/QUESTIONS.txt.bak Labs/lab07-code/QUESTIONS.txt
```
```
// SPDX-FileCopyrightText: 2026 John Kolb <jhkolb@umn.edu>
// SPDX-License-Identifier: GPL-3.0-or-later
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define NUM_THREADS 8
#define ARRAY_LEN 5000000

// Define a struct to pack all thread arguments together
typedef struct {
    long *sum;
    int *elements;
    int start;
    int stop;
} args_t;

pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;

// Generate an array of random integer values
int *generate_array(int len) {
    int *arr = malloc(len * sizeof(int));
    if (arr == NULL) {
        return NULL;
    }
    for (int i = 0; i < len; i++) {
        arr[i] = rand() % 5;
    }
    return arr;
}

// Add up all elements in index interval [start, stop) in an array (version 1)
int sum_elements(long *sum, int *elements, int start, int stop) {
    long temp_sum = 0;
    int result;
    for (int i = start; i < stop; i++) {
        temp_sum += elements[i];
    }
    if ((result = pthread_mutex_lock(&lock)) != 0) {
        fprintf(stderr, "pthread_mutex_lock: %s\n", strerror(result));
        return -1;
    }
    *sum += temp_sum;
    if ((result = pthread_mutex_unlock(&lock)) != 0) {
        fprintf(stderr, "pthread_mutex_unlock: %s\n", strerror(result));
        return -1;
    }
    return 0;
}

// Function executed by each thread, calls sum version 1
void *thread_func(void *arg) {
    args_t *sum_args = (args_t *) arg;
    sum_elements(sum_args->sum, sum_args->elements, sum_args->start, sum_args->stop);
    return NULL;
}

int main() {
    srand(4061);    // For repeatable random number generation
    printf("Generating array elements...\n");
    int *arr = generate_array(ARRAY_LEN);
    if (arr == NULL) {
        printf("Failed to allocate array\n");
        return 1;
    }

    // Number of elements summed by each thread - C does integer division
    int chunk_size = ARRAY_LEN / NUM_THREADS;
    pthread_t threads[NUM_THREADS];
    long thread_sum = 0;

    args_t thread_args[NUM_THREADS];
    int start_idx = 0;
    for (int i = 0; i < NUM_THREADS; i++) {
        thread_args[i].sum = &thread_sum;
        thread_args[i].elements = arr;
        thread_args[i].start = start_idx;
        thread_args[i].stop = start_idx + chunk_size;

        start_idx += chunk_size;
    }

    // Use threads to add up elements in parallel
    printf("Starting multithreaded sum...\n");
    for (int i = 0; i < NUM_THREADS; i++) {
        if (pthread_create(threads + i, NULL, thread_func, thread_args + i) != 0) {
            printf("Failed to create thread\n");
            free(arr);
            return 1;
        }
    }

    // Wait for all threads to finish their work
    for (int i = 0; i < NUM_THREADS; i++) {
        // Technically, should use join to get return value here
        if (pthread_join(threads[i], NULL) != 0) {
            printf("Failed to join thread\n");
            free(arr);
            return 1;
        }
    }
    printf("Sum is: %ld\n", thread_sum);
    free(arr);
    return 0;
}
=======
#include <pthread.h>
#include <stdio.h>
#include <string.h>

#define N_THREADS 4

long global_sum;
pthread_mutex_t global_sum_lock = PTHREAD_MUTEX_INITIALIZER;

long sum_file(const char *file_name) {
    FILE *f = fopen(file_name, "r");
    if (f == NULL) {
        perror("fopen");
        return -1;
    }

    long sum = 0;
    int current;
    while (fscanf(f, "%d", &current) != EOF) {
        sum += current;
    }
    if (ferror(f)) {
        perror("fscanf");
        fclose(f);
        return -1;
    }

    if (fclose(f) != 0) {
        perror("fclose");
        return -1;
    }

    return sum;
}

void *worker(void *arg) {
    // TODO Call 'sum_file' on the thread's assigned file name
    // Add the file's sum to 'global_sum'
    const char *file_name = (const char *)arg;
    long file_sum = sum_file(file_name);
    if (file_sum == -1) {
        // 'sum_file' already reported the error, so don't add its -1 marker
        return NULL;
    }

    int ret = pthread_mutex_lock(&global_sum_lock);
    if (ret != 0) {
        fprintf(stderr, "pthread_mutex_lock: %s\n", strerror(ret));
        return NULL;
    }
    global_sum += file_sum;
    ret = pthread_mutex_unlock(&global_sum_lock);
    if (ret != 0) {
        fprintf(stderr, "pthread_mutex_unlock: %s\n", strerror(ret));
    }

    return NULL;
}

int main(int argc, char **argv) {
    // TODO Uncomment the variable definition below so you can use it
    char *file_names[] = {
        "test_cases/resources/numbers01.txt",
        "test_cases/resources/numbers02.txt",
        "test_cases/resources/numbers03.txt",
        "test_cases/resources/numbers04.txt",
    };

    // TODO Create 4 threads and have each thread compute a sum for a different
    // element in the 'file_names' array
    pthread_t threads[N_THREADS];
    int n_created = 0;
    for (int i = 0; i < N_THREADS; i++) {
        int ret = pthread_create(&threads[i], NULL, worker, file_names[i]);
        if (ret != 0) {
            fprintf(stderr, "pthread_create: %s\n", strerror(ret));
            break;
        }
        n_created++;
    }

    // TODO Join all threads before printing out 'global_sum'
    int failed = (n_created != N_THREADS);
    for (int i = 0; i < n_created; i++) {
        int ret = pthread_join(threads[i], NULL);
        if (ret != 0) {
            fprintf(stderr, "pthread_join: %s\n", strerror(ret));
            failed = 1;
        }
    }
    if (failed) {
        return 1;
    }

    printf("Sum for all files = %ld\n", global_sum);
}
====
42c42
<   - ( ) A pointer to a function that takes one argument of type 'void *' and
---
>   - (X) A pointer to a function that takes one argument of type 'void *' and
46c46
<   - ( ) Immediately once 'pthread_create' completes successfully
---
>   - (X) Immediately once 'pthread_create' completes successfully
54c54
<   - ( ) It is used to store the thread's return value
---
>   - (X) It is used to store the thread's return value
101c101
<   - ( ) A data race with the 'global_sum' variable
---
>   - (X) A data race with the 'global_sum' variable
111c111
<   - ( ) Assign the variable the pre-defined value 'PTHREAD_MUTEX_INITIALIZER'
---
>   - (X) Assign the variable the pre-defined value 'PTHREAD_MUTEX_INITIALIZER'
118c118
<   - ( ) Save the function's return value to a variable, check if it is
---
>   - (X) Save the function's return value to a variable, check if it is
```
- `Bash`
```bash
docker ps -a --format '{{.Names}} {{.Status}} {{.Image}}' 2>&1 | head
```
```
cranky_pasteur Up 6 minutes [REDACTED]
```
- `Bash`
```bash
docker exec cranky_pasteur bash -lc 'cd /workspaces/csci4061-fa26/Labs/lab08-code && pwd && ls -la --time-style=full-iso && gcc --version | head -1 && uname -r && cat /proc/sys/vm/mmap_rnd_bits; which testius socrates; md5sum queue.c QUESTIONS.txt QUESTIONS.txt.bak Makefile queue.h threads_main.c'
```
```
/workspaces/csci4061-fa26/Labs/lab08-code
total 21
drwxrwxrwx 1 root root  512 2026-11-02 21:09:07.327745300 -0600 .
drwxrwxrwx 1 root root  512 2026-11-02 21:09:07.261812000 -0600 ..
-rwxrwxrwx 1 root root 1555 2026-11-02 21:09:07.317350600 -0600 Makefile
-rwxrwxrwx 1 root root 4085 2026-11-02 21:09:07.325739800 -0600 QUESTIONS.txt
-rwxrwxrwx 1 root root 4085 2026-11-02 21:09:07.270810800 -0600 QUESTIONS.txt.bak
-rwxrwxrwx 1 root root 1629 2026-11-02 21:09:07.286831100 -0600 queue.c
-rwxrwxrwx 1 root root  597 2026-11-02 21:09:07.300834200 -0600 queue.h
drwxrwxrwx 1 root root  512 2026-11-02 21:09:07.380610800 -0600 test_cases
-rwxrwxrwx 1 root root 2743 2026-11-02 21:09:07.311349400 -0600 threads_main.c
gcc (Ubuntu 11.4.0-1ubuntu1~22.04.3) 11.4.0
6.18.54.[REDACTED]
32
/usr/local/bin/testius
/usr/local/bin/socrates
[REDACTED]  queue.c
[REDACTED]  QUESTIONS.txt
[REDACTED]  QUESTIONS.txt.bak
[REDACTED]  Makefile
[REDACTED]  queue.h
[REDACTED]  threads_main.c
```
- `Bash`
```bash
docker exec cranky_pasteur bash -lc 'rm -rf /tmp/l8base && cp -r /workspaces/csci4061-fa26/Labs/lab08-code /tmp/l8base && cd /tmp/l8base && setarch x86_64 -R make threads_main 2>&1 | tail -5; echo "--- run starter (timeout 10)"; timeout 10 setarch x86_64 -R ./threads_main 2>&1 | head -40; echo "exit=${PIPESTATUS[0]}"; echo "--- make test-code"; setarch x86_64 -R make test-code 2>&1 | tail -30'
```
```
gcc -Wall -Werror -g -fsanitize=thread -fno-omit-frame-pointer -c queue.c
gcc -Wall -Werror -g -fsanitize=thread -fno-omit-frame-pointer -pthread -o threads_main threads_main.c queue.o
--- run starter (timeout 10)
==================
WARNING: ThreadSanitizer: data race (pid=1942)
  Read of size 8 at 0x7fffffffeb80 by thread T2:
    #0 queue_remove /tmp/l8base/queue.c:52 (threads_main+0x1d08)
    #1 consumer_thread_func /tmp/l8base/threads_main.c:42 (threads_main+0x150e)

  Previous write of size 8 at 0x7fffffffeb80 by thread T1:
    #0 queue_add /tmp/l8base/queue.c:20 (threads_main+0x19fb)
    #1 producer_thread_func /tmp/l8base/threads_main.c:29 (threads_main+0x145c)

  Location is stack of main thread.

  Location is global '<null>' at 0x000000000000 ([stack]+0x000000020b80)

  Thread T2 (tid=1945, running) created by main thread at:
    #0 pthread_create ../../../../src/libsanitizer/tsan/tsan_interceptors_posix.cpp:969 (libtsan.so.0+0x605b8)
    #1 main /tmp/l8base/threads_main.c:71 (threads_main+0x1764)

  Thread T1 (tid=1944, running) created by main thread at:
    #0 pthread_create ../../../../src/libsanitizer/tsan/tsan_interceptors_posix.cpp:969 (libtsan.so.0+0x605b8)
    #1 main /tmp/l8base/threads_main.c:60 (threads_main+0x162c)

SUMMARY: ThreadSanitizer: data race /tmp/l8base/queue.c:52 in queue_remove
==================
==================
WARNING: ThreadSanitizer: data race (pid=1942)
  Read of size 8 at 0x7b5400000000 by thread T2:
    #0 strcpy ../../../../src/libsanitizer/tsan/tsan_interceptors_posix.cpp:732 (libtsan.so.0+0x4703d)
    #1 queue_remove /tmp/l8base/queue.c:52 (threads_main+0x1d21)
    #2 consumer_thread_func /tmp/l8base/threads_main.c:42 (threads_main+0x150e)

  Previous write of size 8 at 0x7b5400000000 by thread T1:
    #0 malloc ../../../../src/libsanitizer/tsan/tsan_interceptors_posix.cpp:655 (libtsan.so.0+0x31c57)
    #1 queue_add /tmp/l8base/queue.c:20 (threads_main+0x19ec)
    #2 producer_thread_func /tmp/l8base/threads_main.c:29 (threads_main+0x145c)

  Location is heap block of size 520 at 0x7b5400000000 allocated by thread T1:
    #0 malloc ../../../../src/libsanitizer/tsan/tsan_interceptors_posix.cpp:655 (libtsan.so.0+0x31c57)
    #1 queue_add /tmp/l8base/queue.c:20 (threads_main+0x19ec)
    #2 producer_thread_func /tmp/l8base/threads_main.c:29 (threads_main+0x145c)
exit=141
--- make test-code
ACTUAL 70) [1m[0m    #0 malloc ../../../../src/libsanitizer/tsan/tsan_interceptors_posix.cpp:655 (libtsan.so.0+0x31c57)
ACTUAL 71)     #1 queue_add /tmp/l8base/queue.c:20 (threads_main+0x19ec)
ACTUAL 72)     #2 producer_thread_func /tmp/l8base/threads_main.c:29 (threads_main+0x145c)
ACTUAL 73) [1m[36m  Thread T2 (tid=1959, running) created by main thread at:
ACTUAL 74) [1m[0m    #0 pthread_create ../../../../src/libsanitizer/tsan/tsan_interceptors_posix.cpp:969 (libtsan.so.0+0x605b8)
ACTUAL 75)     #1 main /tmp/l8base/threads_main.c:71 (threads_main+0x1764)
ACTUAL 76) [1m[36m  Thread T1 (tid=1958, running) created by main thread at:
ACTUAL 77) [1m[0m    #0 pthread_create ../../../../src/libsanitizer/tsan/tsan_interceptors_posix.cpp:969 (libtsan.so.0+0x605b8)
ACTUAL 78)     #1 main /tmp/l8base/threads_main.c:60 (threads_main+0x162c)
ACTUAL 79) SUMMARY: ThreadSanitizer: data race /tmp/l8base/queue.c:54 in queue_remove
ACTUAL 80) ==================
ACTUAL 81) ThreadSanitizer:DEADLYSIGNAL
ACTUAL 82) [1m[31m==1953==ERROR: ThreadSanitizer: SEGV on unknown address 0x000000000200 (pc 0x555555555d44 bp 0x7ffff37bbfb0 sp 0x7ffff37bbf80 T1960)
ACTUAL 83) [1m[0m==1953==The signal is caused by a READ memory access.
ACTUAL 84) ==1953==Hint: address points to the zero page.
ACTUAL 85)     #0 queue_remove /tmp/l8base/queue.c:53 (threads_main+0x1d44)
ACTUAL 86)     #1 consumer_thread_func /tmp/l8base/threads_main.c:42 (threads_main+0x150e)
ACTUAL 87)     #2 __tsan_thread_start_func ../../../../src/libsanitizer/tsan/tsan_interceptors_posix.cpp:959 (libtsan.so.0+0x2e5ff)
ACTUAL 88)     #3 start_thread nptl/pthread_create.c:442 (libc.so.6+0x94a82)
ACTUAL 89)     #4 <null> <null> (libc.so.6+0x1268df)
ACTUAL 90) ThreadSanitizer can not provide additional info.
ACTUAL 91) SUMMARY: ThreadSanitizer: SEGV /tmp/l8base/queue.c:53 in queue_remove
ACTUAL 92) ==1953==ABORTING
================================================================================
== Summary of Results
Test 2) Code - threads_main: Failed -> Results in test_results/lab_08-2-results.tmp

Ran 1/1 Requested Tests
Passed 0/1 Tests
Total Score: 0.0/0.5
```
- `Read` -- `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\csci4061-fa26\Labs\lab08-code\queue.c`
- `Edit` -- `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\csci4061-fa26\Labs\lab08-code\queue.c`
```diff
-     // TODO Initialize synchronization primitives here
-     return 0;
+     // TODO Initialize synchronization primitives here
+     int result;
+     if ((result = pthread_mutex_init(&queue->lock, NULL)) != 0) {
+         fprintf(stderr, "pthread_mutex_init: %s\n", strerror(result));
+         return 1;
+     }
+     if ((result = pthread_cond_init(&queue->queue_full, NULL)) != 0) {
+         fprintf(stderr, "pthread_cond_init: %s\n", strerror(result));
+         return 1;
+     }
+     if ((result = pthread_cond_init(&queue->queue_empty, NULL)) != 0) {
+         fprintf(stderr, "pthread_cond_init: %s\n", strerror(result));
+         return 1;
+     }
+     return 0;
```
- `Edit` -- `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\csci4061-fa26\Labs\lab08-code\queue.c`
```diff
- int queue_add(queue_t *queue, const char *item) {
-     // TODO Add synchronization logic before and after queue
-     // modification code below as needed
- 
-     if (queue->head == NULL) {
+ int queue_add(queue_t *queue, const char *item) {
+     // TODO Add synchronization logic before and after queue
+     // modification code below as needed
+     int result;
+     if ((result = pthread_mutex_lock(&queue->lock)) != 0) {
+         fprintf(stderr, "pthread_mutex_lock: %s\n", strerror(result));
+         return -1;
+     }
+     while (queue->size == MAX_QUEUE_SIZE) {
+         if ((result = pthread_cond_wait(&queue->queue_full, &queue->lock)) != 0) {
+             fprintf(stderr, "pthread_cond_wait: %s\n", strerror(result));
+             pthread_mutex_unlock(&queue->lock);
+             return -1;
+         }
+     }
+ 
+     if (queue->head == NULL) {
```
- `Edit` -- `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\csci4061-fa26\Labs\lab08-code\queue.c`
```diff
-         queue->size++;
-     }
- 
-     return 0;
+         queue->size++;
+     }
+ 
+     if ((result = pthread_cond_signal(&queue->queue_empty)) != 0) {
+         fprintf(stderr, "pthread_cond_signal: %s\n", strerror(result));
+         pthread_mutex_unlock(&queue->lock);
+         return -1;
+     }
+     if ((result = pthread_mutex_unlock(&queue->lock)) != 0) {
+         fprintf(stderr, "pthread_mutex_unlock: %s\n", strerror(result));
+         return -1;
+     }
+ 
+     return 0;
```
- `Edit` -- `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\csci4061-fa26\Labs\lab08-code\queue.c`
```diff
- int queue_remove(queue_t *queue, char *item_dest) {
-     // TODO Add synchronization logic before and after queue
-     // modification code below as needed
- 
-     strcpy(item_dest, queue->head->message);
+ int queue_remove(queue_t *queue, char *item_dest) {
+     // TODO Add synchronization logic before and after queue
+     // modification code below as needed
+     int result;
+     if ((result = pthread_mutex_lock(&queue->lock)) != 0) {
+         fprintf(stderr, "pthread_mutex_lock: %s\n", strerror(result));
+         return -1;
+     }
+     while (queue->size == 0) {
+         if ((result = pthread_cond_wait(&queue->queue_empty, &queue->lock)) != 0) {
+             fprintf(stderr, "pthread_cond_wait: %s\n", strerror(result));
+             pthread_mutex_unlock(&queue->lock);
+             return -1;
+         }
+     }
+ 
+     strcpy(item_dest, queue->head->message);
```
- `Edit` -- `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\csci4061-fa26\Labs\lab08-code\queue.c`
```diff
-     queue->size--;
- 
-     return 0;
+     queue->size--;
+ 
+     if ((result = pthread_cond_signal(&queue->queue_full)) != 0) {
+         fprintf(stderr, "pthread_cond_signal: %s\n", strerror(result));
+         pthread_mutex_unlock(&queue->lock);
+         return -1;
+     }
+     if ((result = pthread_mutex_unlock(&queue->lock)) != 0) {
+         fprintf(stderr, "pthread_mutex_unlock: %s\n", strerror(result));
+         return -1;
+     }
+ 
+     return 0;
```
- `Bash`
```bash
docker exec cranky_pasteur bash -lc 'rm -rf /tmp/l8obs && cp -r /workspaces/csci4061-fa26/Labs/lab08-code /tmp/l8obs && cd /tmp/l8obs && setarch x86_64 -R make threads_main 2>&1 | tail -3; echo "--- one run with consumer ids"; setarch x86_64 -R ./threads_main; echo "exit=$?"; echo "--- consumer index order over 8 runs (first-printed line first)"; for i in 1 2 3 4 5 6 7 8; do setarch x86_64 -R ./threads_main | sed "s/^Consumer \([0-9]\):.*/\1/" | tr "\n" " "; echo; done; echo "--- distinct message-order sequences over 8 runs"; for i in 1 2 3 4 5 6 7 8; do setarch x86_64 -R ./threads_main | sed "s/^Consumer [0-9]: //" | tr "\n" " "; echo; done | sort | uniq -c'
```
```
gcc -Wall -Werror -g -fsanitize=thread -fno-omit-frame-pointer -c queue.c
gcc -Wall -Werror -g -fsanitize=thread -fno-omit-frame-pointer -pthread -o threads_main threads_main.c queue.o
--- one run with consumer ids
Consumer 0: Akerman
Consumer 0: Blegen
Consumer 1: Campbell
Consumer 2: Diehl
Consumer 3: Eddy
Consumer 4: Ford
Consumer 1: Gibson
Consumer 2: Heller
Consumer 3: Iona
Consumer 4: Jackson
exit=0
--- consumer index order over 8 runs (first-printed line first)
0 0 1 2 3 4 1 2 3 4 
0 0 1 2 3 4 1 2 3 4 
0 0 1 2 3 4 1 2 3 4 
0 0 1 2 3 4 1 2 3 4 
0 0 1 2 3 4 1 2 3 4 
0 0 1 2 3 4 1 2 3 4 
0 0 1 2 3 4 1 2 3 4 
0 0 1 2 3 4 1 2 3 4 
--- distinct message-order sequences over 8 runs
      8 Akerman Blegen Campbell Diehl Eddy Ford Gibson Heller Iona Jackson
```
- `Bash`
```bash
docker exec cranky_pasteur bash -lc 'cd /tmp/l8obs && gcc -Wall -Werror -g -pthread -o tm_plain threads_main.c queue.c && nproc && echo "--- plain build, 24 runs, 12 in parallel (load): consumer-index sequence, counted" && seq 24 | xargs -P 12 -I{} sh -c "./tm_plain | sed \"s/^Consumer \([0-9]\):.*/\1/\" | tr \"\n\" \" \"; echo" | sort | uniq -c | sort -rn; echo "--- plain build: message-order sequences" && seq 12 | xargs -P 12 -I{} sh -c "./tm_plain | sed \"s/^Consumer [0-9]: //\" | tr \"\n\" \" \"; echo" | sort | uniq -c'
```
```
18
--- plain build, 24 runs, 12 in parallel (load): consumer-index sequence, counted
      8 0 0 1 2 3 4 1 2 3 4 
      4 
      1 2 3 1 2 0 4 3 1 0 4 0 3 0 4 2 1 3 4 2 1 
      1 2 3 1 2 0 4 3 1 0 4 
      1 2 2 0 4 3 1 0 4 3 1 
      1 1 2 1 0 3 4 2 0 3 4 
      1 1 1 2 3 4 0 2 3 4 0 
      1 1 0 1 2 3 4 0 2 3 4 1 4 2 1 3 0 4 2 3 0 
      1 0 2 3 0 4 1 2 3 4 1 0 0 2 3 1 4 2 3 1 4 
      1 0 1 0 3 2 4 1 3 2 4 
      1 0 1 0 2 3 4 1 2 3 4 0 0 1 2 3 4 1 2 3 4 
      1 0 1 0 2 3 4 1 2 3 4 
      1 0 0 2 3 4 1 2 3 4 1 
      1 0 0 1 2 4 3 1 2 4 3 
--- plain build: message-order sequences
      3 
      6 Akerman Blegen Campbell Diehl Eddy Ford Gibson Heller Iona Jackson 
      3 Akerman Blegen Campbell Diehl Eddy Ford Gibson Heller Iona Jackson Akerman Blegen Campbell Diehl Eddy Ford Gibson Heller Iona Jackson
```
- `Bash`
```bash
docker exec cranky_pasteur bash -lc 'cd /tmp/l8obs && rm -rf obs && mkdir obs && seq 24 | xargs -P 12 -I{} sh -c "./tm_plain > obs/run_{}.txt" && for f in obs/run_*.txt; do sed "s/^Consumer \([0-9]\):.*/\1/" $f | tr "\n" " "; echo; done | sort | uniq -c | sort -rn; echo "--- distinct message-order sequences:"; for f in obs/run_*.txt; do sed "s/^Consumer [0-9]: //" $f | tr "\n" " "; echo; done | sort | uniq -c; echo "--- line counts per run (expect 10):"; wc -l obs/run_*.txt | awk "{print \$1}" | sort | uniq -c'
```
```
      4 0 1 0 2 3 4 1 2 3 4 
      2 0 0 2 1 3 4 2 1 3 4 
      1 4 2 4 0 3 1 2 0 3 1 
      1 4 1 4 2 3 0 1 2 3 0 
      1 3 0 3 2 1 4 0 2 1 4 
      1 2 2 4 1 3 0 4 1 3 0 
      1 2 2 4 1 0 3 4 1 0 3 
      1 1 4 1 0 2 3 4 0 2 3 
      1 1 2 1 0 3 4 2 0 3 4 
      1 1 1 4 0 2 3 4 0 2 3 
      1 1 1 2 0 3 4 2 0 3 4 
      1 1 1 0 2 4 3 0 2 4 3 
      1 1 0 1 3 2 4 0 3 2 4 
      1 1 0 1 2 3 4 0 2 3 4 
      1 0 4 0 1 3 2 4 1 3 2 
      1 0 4 0 1 2 3 4 1 2 3 
      1 0 2 3 0 1 4 2 3 1 4 
      1 0 0 1 4 2 3 1 4 2 3 
      1 0 0 1 2 4 3 1 2 4 3 
      1 0 0 1 2 3 4 1 2 3 4 
--- distinct message-order sequences:
     24 Akerman Blegen Campbell Diehl Eddy Ford Gibson Heller Iona Jackson 
--- line counts per run (expect 10):
     24 10
      1 240
```
- `Grep` -- pattern `- \( \)` path `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\csci4061-fa26\Labs\lab08-code\QUESTIONS.txt`
- `Read` -- `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\csci4061-fa26\Labs\lab08-code\QUESTIONS.txt`
- `Edit` -- `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\csci4061-fa26\Labs\lab08-code\QUESTIONS.txt`
```diff
-     - ( ) 2 Iterations
+     - (X) 2 Iterations
```
- `Edit` -- `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\csci4061-fa26\Labs\lab08-code\QUESTIONS.txt`
```diff
-     - ( ) Consumers don't take turns in a consistent order.
+     - (X) Consumers don't take turns in a consistent order.
```
- `Edit` -- `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\csci4061-fa26\Labs\lab08-code\QUESTIONS.txt`
```diff
-     - ( ) Messages are always printed in alphabetical order.
+     - (X) Messages are always printed in alphabetical order.
```
- `Bash`
```bash
docker exec cranky_pasteur bash -lc 'cd /workspaces/csci4061-fa26/Labs/lab08-code && echo "=== plain make test (no setarch)"; make test 2>&1 | tail -12; echo; echo "=== setarch x86_64 -R make test"; setarch x86_64 -R make test 2>&1 | tail -12'
```
```
=== plain make test (no setarch)
gcc -Wall -Werror -g -fsanitize=thread -fno-omit-frame-pointer -c queue.c
gcc -Wall -Werror -g -fsanitize=thread -fno-omit-frame-pointer -pthread -o threads_main threads_main.c queue.o
testius test_cases/tests.json
== Lab 08
== Running 2/2 tests
Test 1) Quiz - QUESTIONS.txt: Passed
Test 2) Code - threads_main: Passed

Ran 2/2 Requested Tests
Passed 2/2 Tests
Total Score: 1.0/1.0

=== setarch x86_64 -R make test
testius test_cases/tests.json
== Lab 08
== Running 2/2 tests
Test 1) Quiz - QUESTIONS.txt: Passed
Test 2) Code - threads_main: Passed

Ran 2/2 Requested Tests
Passed 2/2 Tests
Total Score: 1.0/1.0
```
- `Bash`
```bash
docker exec cranky_pasteur bash -lc 'cd /workspaces/csci4061-fa26/Labs/lab08-code && echo "=== cmp -l QUESTIONS.txt.bak QUESTIONS.txt"; cmp -l QUESTIONS.txt.bak QUESTIONS.txt; echo "=== diff bak"; diff QUESTIONS.txt.bak QUESTIONS.txt; echo "=== md5 of untouched files vs originals"; md5sum QUESTIONS.txt.bak Makefile queue.h threads_main.c; echo "(orig: bak a105822d..., Makefile f1c9ee01..., queue.h 172caab1..., threads_main 0b1111ad...)"; echo "=== CR bytes in queue.c / QUESTIONS.txt:"; grep -c $'"'"'\r'"'"' queue.c QUESTIONS.txt'
```
```
Exit code 1
=== cmp -l QUESTIONS.txt.bak QUESTIONS.txt
3205  40 130
3705  40 130
3904  40 130
=== diff bak
70c70
<     - ( ) 2 Iterations
---
>     - (X) 2 Iterations
79c79
<     - ( ) Consumers don't take turns in a consistent order.
---
>     - (X) Consumers don't take turns in a consistent order.
83c83
<     - ( ) Messages are always printed in alphabetical order.
---
>     - (X) Messages are always printed in alphabetical order.
=== md5 of untouched files vs originals
[REDACTED]  QUESTIONS.txt.bak
[REDACTED]  Makefile
[REDACTED]  queue.h
[REDACTED]  threads_main.c
(orig: bak a105822d..., Makefile f1c9ee01..., queue.h 172caab1..., threads_main 0b1111ad...)
=== CR bytes in queue.c / QUESTIONS.txt:
queue.c:0
QUESTIONS.txt:0
```
- `Bash`
```bash
docker exec cranky_pasteur bash -lc 'cd /workspaces/csci4061-fa26/Labs && echo "=== diff -u starter queue.c vs mine"; diff -u /tmp/l8base/queue.c lab08-code/queue.c; echo; echo "=== what earlier labs leave on disk"; ls lab07-code lab06-code'
```
```
=== diff -u starter queue.c vs mine
--- /tmp/l8base/queue.c	2026-11-02 21:16:40.365110082 -0600
+++ lab08-code/queue.c	2026-11-02 21:17:08.312129600 -0600
@@ -9,12 +9,37 @@
     queue->size = 0;
 
     // TODO Initialize synchronization primitives here
+    int result;
+    if ((result = pthread_mutex_init(&queue->lock, NULL)) != 0) {
+        fprintf(stderr, "pthread_mutex_init: %s\n", strerror(result));
+        return 1;
+    }
+    if ((result = pthread_cond_init(&queue->queue_full, NULL)) != 0) {
+        fprintf(stderr, "pthread_cond_init: %s\n", strerror(result));
+        return 1;
+    }
+    if ((result = pthread_cond_init(&queue->queue_empty, NULL)) != 0) {
+        fprintf(stderr, "pthread_cond_init: %s\n", strerror(result));
+        return 1;
+    }
     return 0;
 }
 
 int queue_add(queue_t *queue, const char *item) {
     // TODO Add synchronization logic before and after queue
     // modification code below as needed
+    int result;
+    if ((result = pthread_mutex_lock(&queue->lock)) != 0) {
+        fprintf(stderr, "pthread_mutex_lock: %s\n", strerror(result));
+        return -1;
+    }
+    while (queue->size == MAX_QUEUE_SIZE) {
+        if ((result = pthread_cond_wait(&queue->queue_full, &queue->lock)) != 0) {
+            fprintf(stderr, "pthread_cond_wait: %s\n", strerror(result));
+            pthread_mutex_unlock(&queue->lock);
+            return -1;
+        }
+    }
 
     if (queue->head == NULL) {
         if ((queue->head = malloc(sizeof(node_t))) == NULL) {
@@ -42,12 +67,34 @@
         queue->size++;
     }
 
+    if ((result = pthread_cond_signal(&queue->queue_empty)) != 0) {
+        fprintf(stderr, "pthread_cond_signal: %s\n", strerror(result));
+        pthread_mutex_unlock(&queue->lock);
+        return -1;
+    }
+    if ((result = pthread_mutex_unlock(&queue->lock)) != 0) {
+        fprintf(stderr, "pthread_mutex_unlock: %s\n", strerror(result));
+        return -1;
+    }
+
     return 0;
 }
 
 int queue_remove(queue_t *queue, char *item_dest) {
     // TODO Add synchronization logic before and after queue
     // modification code below as needed
+    int result;
+    if ((result = pthread_mutex_lock(&queue->lock)) != 0) {
+        fprintf(stderr, "pthread_mutex_lock: %s\n", strerror(result));
+        return -1;
+    }
+    while (queue->size == 0) {
+        if ((result = pthread_cond_wait(&queue->queue_empty, &queue->lock)) != 0) {
+            fprintf(stderr, "pthread_cond_wait: %s\n", strerror(result));
+            pthread_mutex_unlock(&queue->lock);
+            return -1;
+        }
+    }
 
     strcpy(item_dest, queue->head->message);
     node_t *new_head = queue->head->next;
@@ -55,5 +102,15 @@
     queue->head = new_head;
     queue->size--;
 
+    if ((result = pthread_cond_signal(&queue->queue_full)) != 0) {
+        fprintf(stderr, "pthread_cond_signal: %s\n", strerror(result));
+        pthread_mutex_unlock(&queue->lock);
+        return -1;
+    }
+    if ((result = pthread_mutex_unlock(&queue->lock)) != 0) {
+        fprintf(stderr, "pthread_mutex_unlock: %s\n", strerror(result));
+        return -1;
+    }
+
     return 0;
 }

=== what earlier labs leave on disk
lab06-code:
Makefile
QUESTIONS.txt
QUESTIONS.txt.bak
build
lab06-code.zip
setup.py
square_root.c
square_root.[REDACTED].so
square_root.egg-info
square_root_main.py
test_cases
test_results

lab07-code:
Makefile
QUESTIONS.txt
QUESTIONS.txt.bak
lab07-code.zip
sum_files.c
test_cases
```
- `Bash`
```bash
docker exec cranky_pasteur bash -lc 'mkdir -p /tmp/l8stress && cd /tmp/l8stress && cp /workspaces/csci4061-fa26/Labs/lab08-code/queue.c /workspaces/csci4061-fa26/Labs/lab08-code/queue.h . && cat > stress.c <<'"'"'EOF'"'"'
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "queue.h"
#define NP 3
#define NC 4
#define PER_P 400            /* 1200 items total, divisible by NC */
static queue_t q;
static int seen[NP * PER_P];
static pthread_mutex_t seen_lock = PTHREAD_MUTEX_INITIALIZER;
static int slow_consumers;   /* 1: consumers sleep, queue fills; 0: producers sleep, queue empties */
static unsigned max_size_seen;
void *prod(void *a) {
    int id = (int)(long)a; char buf[64];
    for (int i = 0; i < PER_P; i++) {
        snprintf(buf, sizeof buf, "%d", id * PER_P + i);
        if (queue_add(&q, buf) != 0) exit(2);
        if (!slow_consumers && i % 20 == 0) usleep(200);
    }
    return NULL;
}
void *cons(void *a) {
    char buf[BUFLEN];
    for (int i = 0; i < NP * PER_P / NC; i++) {
        if (queue_remove(&q, buf) != 0) exit(3);
        int v = atoi(buf);
        pthread_mutex_lock(&seen_lock); seen[v]++; pthread_mutex_unlock(&seen_lock);
        if (slow_consumers && i % 20 == 0) usleep(200);
    }
    return NULL;
}
int main(int argc, char **argv) {
    slow_consumers = argc > 1 && argv[1][0] == '"'"'s'"'"';
    if (queue_init(&q) != 0) return 1;
    pthread_t p[NP], c[NC];
    for (long i = 0; i < NC; i++) pthread_create(&c[i], NULL, cons, (void *)i);
    for (long i = 0; i < NP; i++) pthread_create(&p[i], NULL, prod, (void *)i);
    for (int i = 0; i < NP; i++) pthread_join(p[i], NULL);
    for (int i = 0; i < NC; i++) pthread_join(c[i], NULL);
    int bad = 0;
    for (int i = 0; i < NP * PER_P; i++) if (seen[i] != 1) bad++;
    printf("mode=%s items=%d bad(lost or duplicated)=%d final size=%u head=%p\n", slow_consumers ? "slow-consumers(queue fills)" : "slow-producers(queue empties)", NP*PER_P, bad, q.size, (void*)q.head);
    return bad != 0;
}
EOF
gcc -Wall -Werror -g -fsanitize=thread -fno-omit-frame-pointer -pthread -o stress stress.c queue.c && for r in 1 2 3 4 5; do setarch x86_64 -R ./stress s 2>&1 | tail -3; echo "exit=$?"; setarch x86_64 -R ./stress f 2>&1 | tail -3; done'
```
```
Exit code 1
stress.c:14:17: error: 'max_size_seen' defined but not used [-Werror=unused-variable]
   14 | static unsigned max_size_seen;
      |                 ^~~~~~~~~~~~~
cc1: all warnings being treated as errors
```
- `Bash`
```bash
docker exec cranky_pasteur bash -lc 'cd /tmp/l8stress && sed -i "/max_size_seen/d" stress.c && gcc -Wall -Werror -g -fsanitize=thread -fno-omit-frame-pointer -pthread -o stress stress.c queue.c && for r in 1 2 3 4 5; do setarch x86_64 -R ./stress s 2>&1 | tail -3; echo "exit=${PIPESTATUS[0]}"; setarch x86_64 -R ./stress f 2>&1 | tail -3; echo "exit=${PIPESTATUS[0]}"; done'
```
```
mode=slow-consumers(queue fills) items=1200 bad(lost or duplicated)=0 final size=0 head=(nil)
exit=0
mode=slow-producers(queue empties) items=1200 bad(lost or duplicated)=0 final size=0 head=(nil)
exit=0
mode=slow-consumers(queue fills) items=1200 bad(lost or duplicated)=0 final size=0 head=(nil)
exit=0
mode=slow-producers(queue empties) items=1200 bad(lost or duplicated)=0 final size=0 head=(nil)
exit=0
mode=slow-consumers(queue fills) items=1200 bad(lost or duplicated)=0 final size=0 head=(nil)
exit=0
mode=slow-producers(queue empties) items=1200 bad(lost or duplicated)=0 final size=0 head=(nil)
exit=0
mode=slow-consumers(queue fills) items=1200 bad(lost or duplicated)=0 final size=0 head=(nil)
exit=0
mode=slow-producers(queue empties) items=1200 bad(lost or duplicated)=0 final size=0 head=(nil)
exit=0
mode=slow-consumers(queue fills) items=1200 bad(lost or duplicated)=0 final size=0 head=(nil)
exit=0
mode=slow-producers(queue empties) items=1200 bad(lost or duplicated)=0 final size=0 head=(nil)
exit=0
```
- `Bash`
```bash
docker exec cranky_pasteur bash -lc 'cd /tmp/l8stress && sed -e "s/^#include \"queue.h\"/#include \"queue.h\"\nlong wait_full, wait_empty;/" -e "s/^    while (queue->size == MAX_QUEUE_SIZE) {/&\n        wait_full++;/" -e "s/^    while (queue->size == 0) {/&\n        wait_empty++;/" queue.c > queue_counted.c && grep -n "wait_full\|wait_empty" queue_counted.c && sed -e "s/^    return bad != 0;/    extern long wait_full, wait_empty; printf(\"queue_add waited on queue_full %ld times, queue_remove waited on queue_empty %ld times\\\\n\", wait_full, wait_empty);\n&/" stress.c > stress_counted.c && gcc -Wall -Werror -g -fsanitize=thread -fno-omit-frame-pointer -pthread -o stress_counted stress_counted.c queue_counted.c && setarch x86_64 -R ./stress_counted s 2>&1 | tail -3 && setarch x86_64 -R ./stress_counted f 2>&1 | tail -3'
```
```
Exit code 1
2:long wait_full, wait_empty;
38:        wait_full++;
94:        wait_empty++;
stress_counted.c: In function 'main':
stress_counted.c:44:47: error: missing terminating " character [-Werror]
   44 |     extern long wait_full, wait_empty; printf("queue_add waited on queue_full %ld times, queue_remove waited on queue_empty %ld times
      |                                               ^
stress_counted.c:44:47: error: missing terminating " character
   44 |     extern long wait_full, wait_empty; printf("queue_add waited on queue_full %ld times, queue_remove waited on queue_empty %ld times
      |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
stress_counted.c:45:1: error: missing terminating " character [-Werror]
   45 | ", wait_full, wait_empty);
      | ^
stress_counted.c:45:1: error: missing terminating " character
   45 | ", wait_full, wait_empty);
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
stress_counted.c:46:5: error: expected expression before 'return'
   46 |     return bad != 0;
      |     ^~~~~~
stress_counted.c:46:21: error: expected ';' before '}' token
   46 |     return bad != 0;
      |                     ^
      |                     ;
   47 | }
      | ~                    
stress_counted.c:44:28: error: unused variable 'wait_empty' [-Werror=unused-variable]
   44 |     extern long wait_full, wait_empty; printf("queue_add waited on queue_full %ld times, queue_remove waited on queue_empty %ld times
      |                            ^~~~~~~~~~
stress_counted.c:44:17: error: unused variable 'wait_full' [-Werror=unused-variable]
   44 |     extern long wait_full, wait_empty; printf("queue_add waited on queue_full %ld times, queue_remove waited on queue_empty %ld times
      |                 ^~~~~~~~~
cc1: all warnings being treated as errors
```
- `Bash`
```bash
docker exec cranky_pasteur bash -lc 'cd /tmp/l8stress && sed -e "s/^    return bad != 0;/    extern long wait_full, wait_empty; printf(\"waits: queue_full=%ld queue_empty=%ld\", wait_full, wait_empty); putchar(10);\n&/" stress.c > stress_counted.c && gcc -Wall -Werror -g -fsanitize=thread -fno-omit-frame-pointer -pthread -o stress_counted stress_counted.c queue_counted.c && for m in s f; do setarch x86_64 -R ./stress_counted $m 2>&1 | tail -3; done'
```
```
mode=slow-consumers(queue fills) items=1200 bad(lost or duplicated)=0 final size=0 head=(nil)
waits: queue_full=300 queue_empty=304
mode=slow-producers(queue empties) items=1200 bad(lost or duplicated)=0 final size=0 head=(nil)
waits: queue_full=187 queue_empty=498
```
- `Bash`
```bash
docker exec cranky_pasteur bash -lc 'cd /tmp/l8stress && sed -e "s/^    while (queue->size == MAX_QUEUE_SIZE) {/    if (queue->size == MAX_QUEUE_SIZE) {/" -e "s/^    while (queue->size == 0) {/    if (queue->size == 0) {/" queue.c > queue_if.c && diff queue.c queue_if.c; gcc -Wall -Werror -g -fsanitize=thread -fno-omit-frame-pointer -pthread -o stress_if stress.c queue_if.c && for r in 1 2 3 4 5 6; do setarch x86_64 -R timeout 60 ./stress_if f > out_if.txt 2>&1; echo "run $r exit=$? :: $(grep -m1 -E "SUMMARY|mode=|DEADLYSIGNAL" out_if.txt)"; done'
```
```
36c36
<     while (queue->size == MAX_QUEUE_SIZE) {
---
>     if (queue->size == MAX_QUEUE_SIZE) {
91c91
<     while (queue->size == 0) {
---
>     if (queue->size == 0) {
run 1 exit=66 :: ThreadSanitizer:DEADLYSIGNAL
run 2 exit=66 :: ThreadSanitizer:DEADLYSIGNAL
run 3 exit=66 :: ThreadSanitizer:DEADLYSIGNAL
run 4 exit=66 :: ThreadSanitizer:DEADLYSIGNAL
run 5 exit=66 :: ThreadSanitizer:DEADLYSIGNAL
run 6 exit=66 :: ThreadSanitizer:DEADLYSIGNAL
```
- `Bash`
```bash
docker exec cranky_pasteur bash -lc 'cd /tmp/l8stress && setarch x86_64 -R timeout 60 ./stress_if f 2>&1 | grep -v "^$" | head -12'
```
```
ThreadSanitizer:DEADLYSIGNAL
==3862==ERROR: ThreadSanitizer: SEGV on unknown address 0x000000000000 (pc 0x7ffff7524166 bp 0x7ffff33bfac0 sp 0x7ffff33bef28 T3866)
==3862==The signal is caused by a READ memory access.
==3862==Hint: address points to the zero page.
    #0 __sanitizer::internal_strlen(char const*) ../../../../src/libsanitizer/sanitizer_common/sanitizer_libc.cpp:167 (libtsan.so.0+0xb1166)
    #1 __interceptor_strcpy ../../../../src/libsanitizer/tsan/tsan_interceptors_posix.cpp:733 (libtsan.so.0+0x470ba)
    #2 queue_remove /tmp/l8stress/queue_if.c:99 (stress_if+0x2225)
    #3 cons /tmp/l8stress/stress.c:26 (stress_if+0x165c)
    #4 __tsan_thread_start_func ../../../../src/libsanitizer/tsan/tsan_interceptors_posix.cpp:959 (libtsan.so.0+0x2e5ff)
    #5 start_thread nptl/pthread_create.c:442 (libc.so.6+0x94a82)
    #6 <null> <null> (libc.so.6+0x1268df)
ThreadSanitizer can not provide additional info.
```
- `Bash`
```bash
docker exec cranky_pasteur bash -lc 'cd /workspaces/csci4061-fa26/Labs/lab08-code && make zip 2>&1 | tail -4; echo "=== unzip -l"; unzip -l lab08-code.zip; sha256sum lab08-code.zip; rm -rf /tmp/l8unz && mkdir /tmp/l8unz && cd /tmp/l8unz && unzip -q /workspaces/csci4061-fa26/Labs/lab08-code/lab08-code.zip && cd lab08-code && for f in Makefile QUESTIONS.txt QUESTIONS.txt.bak queue.c queue.h threads_main.c; do cmp $f /workspaces/csci4061-fa26/Labs/lab08-code/$f && echo "identical: $f"; done; echo "=== socrates on extracted QUESTIONS.txt"; socrates QUESTIONS.txt -c /workspaces/csci4061-fa26/Labs/lab08-code/test_cases/resources/quiz_sum.json -a; echo "=== lab dir listing"; ls -la /workspaces/csci4061-fa26/Labs/lab08-code'
```
```
  adding: lab08-code/queue.c (deflated 81%)
  adding: lab08-code/queue.h (deflated 44%)
  adding: lab08-code/threads_main.c (deflated 66%)
Zip created in lab08-code.zip
=== unzip -l
Archive:  lab08-code.zip
  Length      Date    Time    Name
---------  ---------- -----   ----
        0  2026-11-02 21:20   lab08-code/
     1555  2026-11-02 21:09   lab08-code/Makefile
     4085  2026-11-02 21:19   lab08-code/QUESTIONS.txt
     4085  2026-11-02 21:09   lab08-code/QUESTIONS.txt.bak
     3784  2026-11-02 21:17   lab08-code/queue.c
      597  2026-11-02 21:09   lab08-code/queue.h
     2743  2026-11-02 21:09   lab08-code/threads_main.c
---------                     -------
    16849                     7 files
[REDACTED]  lab08-code.zip
identical: Makefile
identical: QUESTIONS.txt
identical: QUESTIONS.txt.bak
identical: queue.c
identical: queue.h
identical: threads_main.c
=== socrates on extracted QUESTIONS.txt
All quiz answers correct.
=== lab dir listing
total 25
drwxrwxrwx 1 root root  512 Nov  2 21:20 .
drwxrwxrwx 1 root root  512 Nov  2 21:09 ..
-rwxrwxrwx 1 root root 1555 Nov  2 21:09 Makefile
-rwxrwxrwx 1 root root 4085 Nov  2 21:19 QUESTIONS.txt
-rwxrwxrwx 1 root root 4085 Nov  2 21:09 QUESTIONS.txt.bak
-rw-r--r-- 1 root root 7027 Nov  2 21:20 lab08-code.zip
-rwxrwxrwx 1 root root 3784 Nov  2 21:17 queue.c
-rwxrwxrwx 1 root root  597 Nov  2 21:09 queue.h
drwxrwxrwx 1 root root  512 Nov  2 21:09 test_cases
-rwxrwxrwx 1 root root 2743 Nov  2 21:09 threads_main.c
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && head -40 "20_Progress/Degree/CSCI 4061/Labs/Lab - 3.md"; echo ......; head -14 "20_Progress/Degree/CSCI 4061/Labs/Lab - 6.md"; echo; find . -name "Vault Lint.md" -not -path "./50_Archive/*" | head -2; find . -name "Decoration Standard.md" -o -name "HUMAN_WRITING.md" -o -name "Jarvis Writing and Formatting.md" | grep -v Archive | head
```
```
---
type: class
input_kind: lab
status: sprout
created: 2026-09-30
updated: 2026-09-30
area:
  - "[[UMN Board]]"
  - "[[CSCI 4061 Board]]"
deadline: 2026-09-30
tags:
  - "#class"
  - "#Lab"
next: "Paste the handler + sigaction block into wc_signal.c (the two TODO spots only — leave `int keep_going` as-is), mark the 3 QUESTIONS.txt answers, run `make test` inside the dev container, then `make zip` and upload lab03-code.zip to Gradescope before 11:59pm 2026-09-30"
---
# Lab - 3
==Lab 3 catches SIGINT the right way: instead of letting Ctrl-C kill `wc_signal` mid-count, `sigaction()` installs a handler that just flips the existing `keep_going` flag, and `SA_RESTART` lets the interrupted `fgetc()` finish instead of failing with `EINTR`. The counting logic itself (already complete in the starter code) never changes — only the shutdown path does, and only inside the two `// TODO` spots.==
**Sources read:** lab page (Canvas), `CSCI 4061 Lab 03.pdf` (TA slides, 12 pages), `lab03-code/` (every file, including `test_cases/`), `Lecture/lecture05-code/block_sigint.c` (same course's `sigprocmask`/`sigaddset` pattern, for error-handling-style consistency), [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]] (Stevens & Rago, *Advanced Programming in the UNIX Environment* 3e, Ch. 10 "Signals" — pp. 328-330 §10.5 interrupted system calls/`SA_RESTART`, p. 350 §10.14 `struct sigaction` fields, pp. 330-331, 357 §10.6/§10.15 reentrancy and `sig_atomic_t`).
## Goal
<!-- State the task in your own words, not the lab title. -->
- Replace `wc_signal`'s default "Ctrl-C kills the process" behavior with a caught SIGINT that still reports the running line/word/char counts before exiting, using `sigaction()` instead of the deprecated `signal()`.
### Submission checklist (what actually gets graded)
- **Attendance** in my assigned lab section. No attendance means no credit for the week.
- **`QUESTIONS.txt`**: change `( )` to `(X)` on 3 quiz answers (SA_RESTART, `sa_handler` field, global variable). Worth 0.5 pt (test 1, hashed against `test_cases/resources/quiz_sum.json` via `socrates`).
- **`wc_signal.c`**: add the signal handler + `sigaction()` setup in `main()`. Worth 0.5 pt (test 2, `testius` replays a scripted terminal session from `test_cases/input/wc_signal.txt` and diffs against `test_cases/output/wc_signal.txt`).
- `make test` (both tests), then `make zip`, which creates `lab03-code.zip`, then upload to **Gradescope**. Groups of up to 4 are allowed: one person submits and adds the others.
- Due **11:59pm today, Wed 2026-09-30**.
- `Makefile`, `QUESTIONS.txt.bak`, and `test_cases/` are not edited.
## Procedure / key steps
<!-- Record the decision points and commands needed to reproduce the work. -->
- Setup: `lab03-code` was already unzipped directly into `csci4061-fa26/Labs/lab03-code/`. Dev container confirmed healthy going into this lab (verified in a prior session: Docker Desktop running, full toolchain present, `.gdbinit`/prompt QoL layer added without touching the graded Dockerfile).
### Part 1: QUIZ, sigaction()
1. **Which `sa_flags` value restarts interrupted system calls?**
	(X) **`SA_RESTART`.** `SA_AGAIN`/`SA_SYSCALL` aren't real flags; `SA_RESETHAND` resets the handler back to `SIG_DFL` after one delivery, unrelated to restarting syscalls. Stevens Ch.10 §10.5 (p. 327-329): a caught signal arriving during a *slow* system call (`read`, `fgetc`'s underlying `read`, `pause`, `wait`) interrupts it, returning `-1` with `errno = EINTR`; before `SA_RESTART` existed every such call needed a manual `while (ret==-1 && errno==EINTR) retry;` loop. `SA_RESTART` makes the kernel reissue the call automatically once the handler returns.
2. **How does `sigaction()` register a custom handler?**
	(X) **The `sa_handler` field of a `struct sigaction` is set to the function, and the struct is passed to `sigaction()`.** Not a bare function-pointer argument (that's the older `signal()` API, p. 323) and not a naming convention — Stevens §10.14 (p. 350) lists `sa_handler` as one of the three fields `sigaction()` reads from the struct it's handed; it never inspects global names.
3. **How does a handler tell `main()` a signal arrived?**
	(X) **Change the value of a global variable.** Stevens §10.6 (pp. 330-331) names `printf`, `malloc`, `free`, `strtok`, `getpwnam` as explicitly non-reentrant — calling one from a handler while main-line code is mid-call to the same function can corrupt its internal state. Sending a second signal or recursing just reintroduces the same problem one level down. §10.15 (p. 357) is explicit that `sig_atomic_t`, paired with `volatile`, is the ISO C-guaranteed type for a flag shared between a handler and main-line code — that's the idiom this question is really pointing at, even though the lab's own starter code doesn't require applying it (see Procedure, Part 2).
### Part 2: CODE, complete wc_signal.c
Scope is deliberately minimal: touch only the two `// TODO` spots, nothing else. `int keep_going = 1;` stays exactly as the starter wrote it — the slides suggest `volatile sig_atomic_t` is the more portable idiom (Stevens §10.15, p. 357), and that's genuinely correct in general, but it isn't inside either TODO block, so it's left alone rather than rewritten on my own judgment.
......
---
type: class
class_kind: lab
status: sprout
created: 2026-10-21
updated: 2026-10-21
tags:
  - class
  - lab
area:
  - "[[CSCI 4061 Board]]"
deadline: 2026-10-21
next: "Upload lab06-code.zip to Gradescope before 11:59pm tonight (2026-10-21), confirm the remote autograder matches the local 1.0/1.0, and confirm lab attendance was recorded."
---

./30_Order/System/vault-lint/Vault Lint.md
./30_Order/Standards/Decoration Standard.md
./60_Claude/07_AI_Information/Jarvis Writing and Formatting.md
./HUMAN_WRITING.md
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && sed -n 1,80p HUMAN_WRITING.md; echo =======; sed -n 1,70p "30_Order/Standards/Decoration Standard.md"; echo ======; sed -n 1,60p "30_Order/System/vault-lint/Vault Lint.md"
```
````
---
type: ai
status: sprout
created: 2026-03-11
updated: 2026-06-07
tags:
  - "#ai"
  - "#evergreen"
  - "#ai-infrastructure"
related:
  - "[[AGENTS]]"
  - "[[CLAUDE]]"
  - "[[Concept Standard]]"
  - "[[Project Standard]]"
  - "[[Evergreen Standard]]"
  - "[[Weekly Standard]]"
  - "[[Source Summary Standard]]"
---
# Human Writing Standard
This file is the writing contract for Jarvis — it owns one job: *how prose must sound*. For *why we write notes this way and what Jarvis is for*, see [[Jarvis OS — North Star]]; for *where each note goes*, see [[40_Resources/Obsidian/Jarvis Vault Architecture]]. This file does not restate either.
Any AI tool editing notes in this vault should read and follow it before drafting or rewriting Markdown.
## Voice here, structure in 30_Order
This file governs how prose should *sound*. It is one half of the writing standard. The other half — how a note is *shaped, filed, and which template it uses* — lives in `30_Order/`: read its `Templates/` and `Workflows/` before writing. For where each note type belongs, see [[40_Resources/Obsidian/Jarvis Vault Architecture]]. Voice without structure produces tidy notes in the wrong place; structure without voice produces slop in the right place. You need both.
## Objective
Write notes that sound like a learning human who is trying to understand the material. Eager to build, learn and test. Each sentence should be written as someone who is interested in the core idea of the note.  
> [!DANGER] The don't
> 1. Do not write generic AI copy.
> 2. Do not inflate.
> 3. Do not smooth everything into the same tone.

The note should feel:
> [!IMPORTANT] The do
> 1. Specific
> 2. Grounded
> 3. Compressed
> 4. Honest about uncertainty
> 5. Useful when reread later
## The Core Test
Delete any sentence that could be pasted unchanged into a random productivity blog, AI newsletter, or study-hack page.

If a sentence survives only because it sounds polished, remove it.
If it survives because it carries a mechanism, example, contrast, or decision, keep it.
## What Good Notes Must Do
Each section should do at least one of these:
1. define the thing clearly
2. explain why it matters
3. show how it works
4. contrast it with a nearby concept
5. give a real example
6. record a failure mode or misconception
7. show where it was used
8. state what is still unclear
If a paragraph does none of these, it is probably filler.
## Anti-Slop Rules
### 1. Prefer concrete claims over polished framing
Bad:
- "This concept is incredibly important in today's fast-moving landscape."
Better:
- "This matters because the worker queue can fail in three different places and tracing shows which one broke."
### 2. Prefer mechanism over vibes
Bad:
- "RAG improves reliability and unlocks better performance."
Better:
- "RAG improves reliability only if retrieval actually surfaces relevant documents. Bad retrieval just feeds the model cleaner nonsense."
### 3. Prefer real context over generic examples
Use examples from:
- BOOM / UROP
- your courses
- your projects
- actual errors
- actual tradeoffs
### 4. Prefer contrast over isolated summary
Whenever possible, answer:
- what this is
- what it is not
- what people confuse it with
### 5. Prefer compression over repetition
Do not say the same point three ways unless the note is intentionally doing an explanation ladder.
### 6. Prefer plain language over inflated language
Avoid:
=======
---
type: system
status: sprout
created: 2026-09-15
updated: 2026-10-29
tags:
  - system
  - standards
  - writing
system_kind: standard
family: policy
maps_to: []
used_by:
  - "[[Decoration]]"
gold_standard: "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]]"
notes:
  - "[[Jarvis Writing and Formatting]]"
  - "[[Plugins Usage Standard]]"
  - "[[Human Writing Standard]]"
---
# Decoration Standard
==Every marker in a note tells review, search, or the reader what to do with a line. A marker that carries no job is removed.==
This is the standard for the markers inside a note body: highlight, bold, italic labels, callouts, tables, embeds, math, and code. It gives counts and triggers that a reviewer can check. Syntax and blank-line rules stay in [[Jarvis Writing and Formatting]]; card syntax and plugin choice are in [[Plugins Usage Standard]].
## Markers
- **Highlight.** Exactly one `==highlight==` per `##` section, on the one most important definitional claim. In a note tagged `#cards` it becomes a cloze card, so a second highlight makes an accidental flashcard. Under `## Flashcards` each card carries its own cloze, which is the one exception.
- **Bold.** A named concept, entity, or category label, on its first introduction. In a `#cards` section every bold term is a cloze. Never a whole sentence and never general emphasis.
- **Italic label.** `*Mechanism:*`, `*Failure mode:*`, `*Interview value:*` introduce a sub-group. It is not a cloze.
- **Numbered items with a bold title.** `1. **Title**` with the sub-content indented by a tab, not spaces.
## Callouts
| Type | Use when |
|---|---|
| `NOTE` | Source context or background the reader needs |
| `TIP` | A practical shortcut |
| `WARNING` | A correctness or safety risk, or the main failure mode of a concept |
| `QUESTION` | An unresolved question or known gap |
| `SUMMARY` | A section or source summary |
| `EXAMPLE` | A worked example |
`IMPORTANT` and `DANGER` appear in [[HUMAN_WRITING]] for its do and do-not pair. `INFO`, `CAUTION`, and `DECISION` appear in older notes and are not in the documented set: add no new ones, and when touching a note map `INFO` to `NOTE` and `CAUTION` to `WARNING`. Do not stack callouts. One blank line follows a callout before prose, and that is the only blank line allowed.
## Tables, embeds, math, code
- A table compares rows. A list that Dataview can derive from frontmatter is a query, not a hand-built table. A table and a dataview block need one blank line above them when text sits directly over them, or Obsidian does not render them; Vault Lint warns, and does not fail the note ([[Jarvis Writing and Formatting]]).
- An Excalidraw or Canvas embed sits beside a paragraph that states the mechanism in words. An image-only diagram is invisible to search.
- Notation goes in `$...$` with a sentence saying what it means. Use `$$...$$` only for an equation worth reading on its own line.
- Code blocks carry a language identifier and stay short.
- Raw source material does not belong in a durable note. Long captures go to `60_Claude/05_Clippings/` or a source summary.
## Done Conditions
- Every `##` section outside `## Flashcards` holds exactly one `==...==`.
- Every callout type is in the table above, no two callouts touch, and each is followed by one blank line and prose, or ends its section.
- No bold on a whole sentence, and no bold used only to emphasize.
- Each embedded drawing has a text paragraph next to it that names the relationship it shows.
- No hand-built table lists rows that a Dataview block could generate.
- Points 8 to 12 of the Quality Gate in [[Jarvis Writing and Formatting]] pass.
## Gold Standard Example
[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]]: six of its seven sections hold exactly one highlight, its `NOTE` callouts carry real caveats (the thread-local `errno`), and its cards use cloze highlights. Its Key Concepts list highlights every term, which breaks the one-per-section rule and is the thing to fix on the next touch.
======
---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-29
tags:
  - system
  - tooling
system_kind: spec
trigger: On demand with node, in the weekly review, and after any change to a Standard.
owner: Anant, and any session that changes a Standard or a Spec block.
notes:
  - "[[Conformance Standard]]"
  - "[[Note Kit Standard]]"
  - "[[Conformance on Touch]]"
---
# Vault Lint
## Purpose
Measures how many notes fit their Standard and checks that the kit files (Standards, Templates, Workflows) agree with each other. Without it the goal of 90% fit has no number, and a Standard can drift from its Template unnoticed.
## Trigger
Run by hand: `node vault-lint.js` from this folder. The weekly review records the fit percentage. Run `--kit` after any change to a Standard, Template, or Workflow. No scheduled task exists yet.
## Inputs and Outputs
Reads every `.md` file under the vault root (found three folders up from the script), the Spec blocks in `30_Order/Standards/`, the vocabulary tables in [[Frontmatter Standard]], and `vault-lint.config.json`. By default it writes nothing into the vault; only `--fix` writes (see below). `--json FILE` writes a report wherever you point it, which should be an ignored or scratch folder.
Beyond front matter, headings, links, and placement, it enforces the shape of an action note from [[Action Standard]] and warns about two formatting rules from [[Jarvis Writing and Formatting]]. Failure codes read `<check>:<reason>`. Warnings list line numbers as `L12,L40`.
- Warnings `table-no-blank-above` and `dataview-no-blank-above`: a Markdown table, or a fenced `dataview` or `dataviewjs` block, starts on the line after text. A heading, a closing code fence, a callout title, or the end of an HTML comment above is allowed, and so is a blank line. Tables inside fenced code and frontmatter are ignored. The single blank line that fixes it is not counted as `extra-blank-lines`. They are warnings only: they never fail a note or change the fit percentage, so that number stays a pure structure measure. They print in a Warnings section after the report (first 20 notes, or `--list N`) and in the `--json` output under `warns`. `--fix` repairs them, and nothing else (see below).
- `7:todo-missing`, `7:todo-not-under-opening`, `7:todo-lines:N`, `7:todo-next-mismatch`, `7:checkbox-outside-todo:N`, `7:missing-subheading:<name>`: for `action` notes, a `> [!todo]` callout sits directly under the opening line, holds one to three `- [ ]` lines, the first equal to `next`, no checkbox appears outside it, and Open Threads has the subheadings the Spec names. The Spec keys are `todo_callout` and `open_threads_subheadings` in [[Action Standard]]; change the Standard, not the script.
```powershell
node vault-lint.js                                  # fit %, by tier, by family, top failure reasons
node vault-lint.js --path 30_Order/Standards/       # one folder
node vault-lint.js --family course-concept --list 20   # failing notes in a family
node vault-lint.js --specs                          # Spec blocks, names, empty files
node vault-lint.js --kit                            # Standard, Template, Workflow consistency
node vault-lint.js --path 30_Order/ --dry-run       # list the blank lines --fix would insert, write nothing
node vault-lint.js --path 30_Order/ --fix           # insert them
node vault-lint.js --fix --skip 60_Claude/05_Clippings/   # whole vault, but leave raw captures alone
```
## State
None. `vault-lint.config.json` is tracked source: `out_of_scope`, `tier4`, and `template_paths` regular expressions. The type and status vocabulary is read from the tables in [[Frontmatter Standard]]; change the tables, not the script.
## Failure Behavior
It edits a note only under `--fix`: it inserts one blank line above each table or fenced `dataview`/`dataviewjs` block flagged by the two warnings, and changes nothing else. It never touches frontmatter or tables inside fenced code, keeps a file's line endings, and checks that removing blank lines from the old and new text gives identical text before it writes (a note that fails the check is skipped and reported). `--dry-run` prints the same changes and writes nothing, and wins if both flags are given. `--skip PREFIX,PREFIX` leaves path prefixes alone, for example the read-only clippings. Run `--dry-run` first. A Spec block that is not valid JSON is reported as an error, and notes of that family then fall to `unmapped`. `--kit` exits with status 1 when it finds an error, so it can gate a commit.
## Verify
Run `node vault-lint.js --specs` and compare the Spec count with the number of Spec blocks you wrote. Lint a note you know fits and one you know does not. The scanned count plus the excluded counts equals the number of `.md` files under the root.
## Retire
Delete this folder in one commit and remove the lint step from the weekly review. The fit number then goes back to being unmeasured.
````
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && sed -n 1,200p "60_Claude/07_AI_Information/Jarvis Writing and Formatting.md"
```
````
---
type: evergreen
status: sprout
created: 2026-05-15
updated: 2026-10-29
tags:
  - evergreen
  - system
  - writing
  - ai-agents
notes:
  - "[[HUMAN_WRITING]]"
  - "[[60_Claude/07_AI_Information/Plugins]]"
  - "[[40_Resources/Obsidian/Vault Operating System]]"
  - "[[40_Resources/Obsidian/Plugins/00 Plugin Reference Index]]"
---
# Jarvis Writing and Formatting

This file extends [[HUMAN_WRITING]] with Obsidian-specific rules.

[[HUMAN_WRITING]] is still the source of truth for voice. This note explains how that voice should appear inside Jarvis: frontmatter, wikilinks, headings, Dataview-friendly fields, Tasks syntax, flashcards, math, code, boards, and visual notes.

For deeper plugin-specific examples, use [[40_Resources/Obsidian/Plugins/Dataview and Dashboards]], [[40_Resources/Obsidian/Plugins/Tasks Kanban and Project Tracking]], [[40_Resources/Obsidian/Plugins/Spaced Repetition and Learning Loops]], [[40_Resources/Obsidian/Plugins/Visual Thinking with Canvas and Excalidraw]], and [[40_Resources/Obsidian/Plugins/Appearance Code Math and Reading Experience]].

## Relationship To Human Writing

Follow [[HUMAN_WRITING]] before anything here.

The note should sound like someone who understands the thing, not like someone performing expertise. Formatting cannot rescue vague writing.

Good Jarvis writing usually does one of these:

- explains a mechanism
- captures a decision
- contrasts nearby ideas
- names a failure mode
- links a claim to a real source or project
- gives a usable next action
- marks what is still uncertain

If a section only says that something is "important," "powerful," or "useful," rewrite it until it says why.

## Blank Lines Rule

The vault's `headerspace.css` CSS snippet handles visual heading spacing. Blank lines are not needed for visual breathing room.

Rules:
- Zero blank lines between `---` (frontmatter close) and the `#` title
- Zero blank lines between any heading (`##`, `###`) and its first content line
- Zero blank lines between consecutive list items
- Zero blank lines between consecutive sections
- **One blank line is acceptable:** immediately after a callout (`> [!X]`) or blockquote (`> `) before a following paragraph of prose
- **One blank line is required:** directly above a Markdown table or a fenced `dataview` or `dataviewjs` block when text sits right above it

Extra blank lines are not stylistic — they are an error. They bloat the file and signal that the agent added them instead of relying on CSS.

### Tables and Dataview Blocks Need A Blank Line Above

When a table starts on the line right after a paragraph, a list item, or a callout, Obsidian does not render it as a table. A `dataview` or `dataviewjs` block behaves the same way. AI-written notes must never start a table or a dataview block on the line after text.

- Put one blank line between the text and the table or block.
- No blank line is needed when the line above is a heading, the closing line of a code fence, or the end of an HTML comment, because those already end their block. Keep the vault's zero-blank-lines rule there.
- Tables and dataview blocks inside fenced code or frontmatter are ignored.
- [[Vault Lint]] reports `table-no-blank-above` and `dataview-no-blank-above` as warnings with line numbers. A warning does not fail a note or change the fit percentage, but the rule still holds for every note an AI writes. Run `node vault-lint.js --dry-run` to preview and `--fix` to insert the blank lines; `--fix` changes nothing else.

## Markdown Shape

Write for fast rereading.

- Use short paragraphs.
- Use headings when they help navigation or retrieval.
- Use bullets for comparison, steps, symptoms, examples, and constraints.
- Use tables only when comparison is clearer in rows, with a blank line above them when text is directly over them.
- Use code blocks for code, syntax, commands, data examples, and exact formats.
- Use callouts sparingly for warnings, source notes, definitions, or important caveats.

Headings should name the thing inside the section. Avoid headings like "Overview" if a more precise heading exists.

Better headings:

- `## Why Retrieval Fails`
- `## Heap Construction Trap`
- `## When To Use Kanban`
- `## Source-Grounded Claims`

Weaker headings:

- `## Introduction`
- `## Important Information`
- `## Key Insights`
- `## Comprehensive Overview`

## Formatting Markers

These markers have semantic meaning in this vault. Because SR cloze is enabled for both bold and highlight, using them carelessly creates accidental flashcards.

- `==text==` → **highlight cloze.** Use for the ONE most important definitional claim per section. Becomes an SR cloze card automatically when the note is tagged `#cards`. Do not use more than once per heading.
- `**text**` → **bold cloze.** Use for named concepts and entities on introduction, category labels, key contrast words. In `#cards` sections, every bold term becomes an automatic cloze. Use deliberately — not for general emphasis.
- `*label:*` → *italic sub-label.* Use for sub-category intro labels: *Mechanism:*, *Failure mode:*, *Interview value:*, *Core Python skills:*. Not a cloze.

Numbered list items with a bold title follow this pattern:

```markdown
1. **Title**
	sub-content indented with a tab, not spaces
```

Derived from MGMT 3001 and CSCI 2041 chapter notes. Any deviation from this in agent output is an error.

## Links

Use Obsidian wikilinks for internal notes.

Good:

- `[[HUMAN_WRITING]]`
- `[[40_Resources/Obsidian/Vault Operating System]]`
- `[[CSCI 2041 Board]]`
- `[[OCaml - Pattern Matching|pattern matching]]`

Use aliases when the sentence reads better with natural language.

Do not create plain-text mentions of existing notes when a wikilink would improve retrieval.

Do not create links just because a word could be linked. Link when the target note would help future reading.

## Frontmatter And Properties

Preserve existing frontmatter.

When creating new notes, use the vault's canonical fields from [[40_Resources/Obsidian/Vault Operating System]]:

```yaml
---
type: evergreen
status: sprout
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags:
  - evergreen
notes:
  - "[[Related Note]]"
next:
---
```

Use `updated:` only after meaningful changes. Fixing a typo usually does not need a semantic update. Adding a new section, changing claims, creating a new workflow, or changing the note's purpose does.

Important fields:

- `type`: note class such as `input`, `evergreen`, `concept`, `project`, `thought`, `brainstorm`, `class`, `plan`, `review`, `dashboard`, `index`, or `output`.
- `status`: maturity or state such as `seed`, `sprout`, `tree`, `active`, `paused`, `complete`, or `archived`.
- `created`: creation date.
- `updated`: last meaningful content update.
- `tags`: retrieval tags, not folder replacements.
- `notes`: primary related notes.
- `next`: concrete next action or next note.
- `source_url`: external source pointer.
- `track`: long-term domain such as `ai`, `systems`, `algorithms`, `career`, or `trading`.
- `enrichment_status`: `candidate`, `in-progress`, `enriched`, or `needs-review`.
- `source_status`: `vault-grounded`, `externally-sourced`, `mixed`, or `uncertain`.

Do not invent new metadata fields unless the current schema cannot represent the information.

## Dataview-Friendly Writing

Dataview works only when metadata is consistent.

Use structured fields for things dashboards need to query:

- active state
- due dates
- review dates
- enrichment state
- track/domain
- related projects
- source status
- mastery or drill dates

Do not hide queryable information only in prose.

Good:

```yaml
type: project
status: active
deadline: 2026-05-25
next: "Draft project brief"
```

Weak:

```markdown
This is probably still active and maybe due soon.
```

Use Dataview blocks for live indexes, not static tables that will immediately go stale.

## Tasks-Compatible Writing
````
- `Bash`
```bash
docker exec cranky_pasteur bash -lc 'cd /workspaces/csci4061-fa26/Labs && echo "added/removed lines in queue.c vs starter:"; diff /tmp/l8base/queue.c lab08-code/queue.c | grep -c "^>" ; diff /tmp/l8base/queue.c lab08-code/queue.c | grep -c "^<"; echo "--- bare TSAN binary without setarch (scratch build)"; cd /tmp/l8obs && ./threads_main 2>&1 | head -3; echo "exit=${PIPESTATUS[0]}"; echo "--- final checksums"; cd /workspaces/csci4061-fa26/Labs/lab08-code && sha256sum queue.c QUESTIONS.txt lab08-code.zip; echo "--- cleanup scratch"; rm -rf /tmp/l8base /tmp/l8obs /tmp/l8stress /tmp/l8unz; ls /tmp | head; ls -A /workspaces/csci4061-fa26/Labs/lab08-code'
```
```
added/removed lines in queue.c vs starter:
57
0
--- bare TSAN binary without setarch (scratch build)
FATAL: ThreadSanitizer: unexpected memory mapping [REDACTED]
exit=66
--- final checksums
[REDACTED]  queue.c
[REDACTED]  QUESTIONS.txt
[REDACTED]  lab08-code.zip
--- cleanup scratch
[REDACTED]
[REDACTED]
[REDACTED]
[REDACTED]
lab05-archive-hzsgdl95
[REDACTED].txt
lab05-original-hashes.json
[REDACTED].c
lab05-page-2.png
lab05-page-3.png
Makefile
QUESTIONS.txt
QUESTIONS.txt.bak
lab08-code.zip
queue.c
queue.h
test_cases
threads_main.c
```
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Labs\Lab - 8.md`
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Labs\Lab - 8.md`
````
---
type: class
class_kind: lab
status: sprout
created: 2026-11-02
updated: 2026-11-02
tags:
  - class
  - lab
area:
  - "[[CSCI 4061 Board]]"
deadline: 2026-11-04
next: "Upload lab08-code.zip to Gradescope before 11:59pm Wed 2026-11-04 (derived from the Board's rule of the Wednesday after the Monday session, so confirm it on Gradescope), then confirm the remote autograder matches the local 1.0/1.0 and that lab attendance was recorded."
---
# Lab - 8
==Lab 8 makes the linked-list queue in `queue.c` a bounded, thread-safe producer-consumer queue: one mutex guards every touch of `head` and `size`, and two condition variables put a producer to sleep when the queue holds `MAX_QUEUE_SIZE` (5) items and a consumer to sleep when it is empty.== `threads_main` runs one producer and five consumers over ten names, so the lab is Lecture 13's busy-waiting "Bad Attempt" rewritten as the "Proper Enqueue / Dequeue" pattern.
**Sources read:** the lab slides (`Lab 08.pdf`, 6 pages: producer-consumer queues, condition variables, waiting in a loop, the `queue.c` starter); `csci4061-fa26/Labs/lab08-code/` in full (`QUESTIONS.txt`, `QUESTIONS.txt.bak`, `queue.c`, `queue.h`, `threads_main.c`, `Makefile`, and `test_cases/` with `tests.json`, the input script, both expected outputs and the quiz hash); Lecture 13 (`Lec13.pdf`, 22 Oct, slides 22 to 33: producer/consumer, busy waiting, condition variables, proper enqueue and dequeue, why the `while`); Lecture 14 (`Lec14.pdf`, 27 Oct, slides 14 to 23: semaphores and the semaphore version of this same queue, read for contrast and not used); Stevens and Rago, *APUE* 3e, §11.6.6 "Condition Variables", printed pp. 413 to 416 (PDF pp. 447 to 450) including Figure 11.15; [[20_Progress/Degree/CSCI 4061/Labs/Lab - 7|Lab - 7]] for the error-handling style and the TSAN startup problem; [[CSCI 4061 Board]] for the lab policy.
> [!NOTE] No week note or chapter note backs this lab yet
> [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]] still lists Chapter 11 as "No chapter note yet", and `Weekly/` stops at Week - 4, so there is no week or chapter note to link. The textbook citations below come from reading §11.6.6 directly. Lecture 15 (29 Oct) is networking only and has nothing for this lab.

## Goal
==Make `queue_add` and `queue_remove` safe for one producer and five consumers running at once: hold one lock for every access to the list, and sleep on `queue_full` or `queue_empty` instead of spinning or reading a NULL `head`.==
### Submission checklist (what actually gets graded)
- **Attendance** in the assigned lab section.
- **`QUESTIONS.txt`**: change `( )` to `(X)` on 3 quiz answers, nothing else. `socrates` hashes the whole file against `test_cases/resources/quiz_sum.json`. Test 1, 0.5 pt.
- **`queue.c`**: edit only at the `TODO` comments, in `queue_init`, `queue_add` and `queue_remove`. Test 2 runs `./threads_main` under TSAN, pipes it through `sed 's/^Consumer [0-9]/Consumer x/'` so the consumer numbers do not matter, and diffs against the ten names in alphabetical order. Any TSAN report fails it. 0.5 pt.
- `make test`, then `make zip` creates `lab08-code.zip` (the Makefile leaves out `test_cases/`), then upload to **Gradescope**. Groups may submit once and add names.
- Due 11:59pm on the Wednesday after the Monday session. The slides are dated Mon 2026-11-02, so that is Wed 2026-11-04. That date is derived from the Board's rule, not read off Gradescope.
- Not edited: `Makefile`, `QUESTIONS.txt.bak`, `queue.h`, `threads_main.c`, `test_cases/`. The lab text says `queue_t` in `queue.h` already carries the primitives (`lock`, `queue_full`, `queue_empty`).
## Procedure / key steps
- Setup: the course container `cranky_pasteur` (Ubuntu 22.04, gcc 11.4.0, kernel `6.18.54.[REDACTED]`) was already running. The host folder and `/workspaces/csci4061-fa26/Labs/lab08-code` are the same mount, so an edit made on the Windows path showed up in the container at once (checked with `md5sum` before and after).
- The Makefile builds with `-Wall -Werror -g -fsanitize=thread -fno-omit-frame-pointer` and links with `-pthread`. An unused variable fails the build, and every run of `threads_main` is a TSAN run.
- Before changing anything I built and ran the untouched starter in a scratch copy under `/tmp` to see the failure first (Errors + fixes, first entry). All experiments below ran in scratch copies that I deleted afterwards. The lab folder holds only the submitted edits.
### The pattern (Lecture 13 and APUE §11.6.6)
==Take the lock, `while (condition not met) pthread_cond_wait`, change the state, signal the other side, unlock, and make every return path after the lock pass through an unlock.==
1. **Why `pthread_cond_wait` takes the mutex**
	The mutex protects the condition. `pthread_cond_wait` puts the thread on the wait list and unlocks in one atomic step, which closes the window between checking the condition and going to sleep. When it returns the mutex is locked again (APUE p. 414, Lecture 13 slide 29). Here the condition is `queue->size`, so it can only be read under `queue->lock`.
2. **Why `while` and not `if`**
	A woken thread is runnable, not running. Another consumer can take the last item first (Lecture 13 slide 33), and a **spurious wakeup** can return from the wait with nobody having signaled. APUE p. 414: after a successful return "a thread needs to reevaluate the condition". The lab slide says the same ("Use while, not if").
3. **Signal after the state change, with the lock held**
	APUE p. 415: signal only after changing the condition. Lecture 13 slide 29 says to hold the relevant mutex when signaling, and the lab slide orders it "signal queue_empty after adding". APUE p. 416 says signaling after unlocking is fine when the `while` loop tolerates an early thief. I followed the lecture order.
4. **Signal, not broadcast**
	One add makes one item, so waking one consumer is enough. APUE p. 415 notes `pthread_cond_signal` may wake more than one thread, which the `while` makes harmless.
5. **A signal with no waiter is lost, and that is fine**
	Lecture 13 slide 29: the notification is thrown away. Nothing is lost here because the fact "an item exists" lives in `size`, and a consumer that arrives late checks `size` under the lock and never sleeps. Lecture 14 slide 22 contrasts this with a semaphore, whose counter remembers.
### Quiz answers (3 total, 3 flipped)
1. **Iterations per consumer: 2**
	`consumer_thread_func` loops `NUM_MESSAGES / NUM_CONSUMERS` times, which is 10 / 5 = 2. Five consumers times two removals is the ten messages the producer adds, so every consumer returns and `pthread_join` completes.
2. **Consumer order: not consistent**
	The scheduler decides which waiting consumer wakes. Observed: on the TSAN build with ASLR off, 8 runs gave the same order `0 0 1 2 3 4 1 2 3 4`. On a plain build, 24 runs with 12 at a time on the 18-core machine gave 20 different index sequences. Even the repeatable sequence breaks "take turns in creation order", because consumer 0 prints twice before consumer 1 prints once. My reading: consumer 0 starts first, takes the first name, and is first in line on `queue_empty` for the second. `tests.json` elides the index with `sed` for this reason.
3. **Message order: always alphabetical**
	The producer adds `Akerman` to `Jackson` in array order and the queue is FIFO. The producer sleeps `USLEEP_DURATION` (500000 µs) between adds, so each name is removed and printed long before the next one arrives. 24 of 24 runs printed the identical alphabetical list. Removal order is guaranteed by the queue, but print order after the unlock is only effectively fixed by that 0.5 s gap. That last point is my reasoning and I did not test it without the sleep.

`socrates` checks the file as one hash, so it confirms the three together and not each on its own. The reasoning and the run counts above are mine, and I picked the answers before running `make test-quiz`.
### Code: `queue.c`
Decisions, in the order they came up:
1. **`queue_init` returns 1 on any failure**
	`pthread_mutex_init(&queue->lock, NULL)`, then `pthread_cond_init` for `queue_full` and for `queue_empty`, all with a NULL attribute (APUE p. 414: NULL unless nondefault attributes are needed). The lab slide says "Return 1 if any init fails" and `main` tests `!= 0`. The return value is the error number, so it is printed with `strerror` (pthread calls do not set `errno`, the same point as Lab 7's quiz). I did not undo earlier inits when a later one fails: there is no `queue_destroy`, and `main` exits on failure.
2. **Lock first in `queue_add`**
	The starter's two `malloc` failure branches already call `pthread_mutex_unlock(&queue->lock)` and return `-1`. That only makes sense if the lock is held there, which confirms the lock goes at the top, before the list is read.
3. **Full check in `queue_add`**
	`while (queue->size == MAX_QUEUE_SIZE)` waits on `queue_full` with `queue->lock`. The lab text says "equal to" `MAX_QUEUE_SIZE`, so `==`.
4. **Empty check in `queue_remove`**
	`while (queue->size == 0)` waits on `queue_empty`. This guard is what protects the starter's `queue->head->message` from a NULL `head`.
5. **Signal the opposite side before unlocking**
	`queue_add` signals `queue_empty` after the list is changed, and `queue_remove` signals `queue_full` after `queue->size--`.
6. **Every early return unlocks first**
	The lab slide: "including when wait or signal fails". A failed `pthread_cond_wait` or `pthread_cond_signal` prints, calls `pthread_mutex_unlock`, and returns `-1`. A failed lock has nothing to unlock. A failed final unlock prints and returns `-1`. The `-1` matches what `threads_main` checks.
7. **Starter lines untouched**
	The `TODO` comments, the list walk in `queue_add` and the five lines of removal stay byte for byte. Edits are additions only.
```c
int queue_add(queue_t *queue, const char *item) {
    int result;
    if ((result = pthread_mutex_lock(&queue->lock)) != 0) { /* strerror print */ return -1; }
    while (queue->size == MAX_QUEUE_SIZE) {
        if ((result = pthread_cond_wait(&queue->queue_full, &queue->lock)) != 0) {
            /* strerror print */ pthread_mutex_unlock(&queue->lock); return -1;
        }
    }
    /* starter list code, unchanged */
    if ((result = pthread_cond_signal(&queue->queue_empty)) != 0) {
        /* strerror print */ pthread_mutex_unlock(&queue->lock); return -1;
    }
    if ((result = pthread_mutex_unlock(&queue->lock)) != 0) { /* strerror print */ return -1; }
    return 0;
}
```
`queue_remove` is the mirror image: wait while `size == 0` on `queue_empty`, run the starter's removal lines, signal `queue_full`. The block is condensed, the print lines are written out in the real file.
### Reproduce in the course dev container
```sh
cd /workspaces/csci4061-fa26/Labs/lab08-code
make test                  # both tests; plain make works, see Errors + fixes
make zip                   # cleans, then creates lab08-code.zip
unzip -l lab08-code.zip
```
`make test-quiz` and `make test-code` run each half on its own. Running `./threads_main` by hand needs `setarch x86_64 -R ./threads_main`.
## Results
==Observed in `cranky_pasteur` on 2026-11-02: `make test` passed 2/2 for 1.0/1.0 on its first run in the lab folder after the edits.==
```text
testius test_cases/tests.json
== Lab 08
== Running 2/2 tests
Test 1) Quiz - QUESTIONS.txt: Passed
Test 2) Code - threads_main: Passed

Ran 2/2 Requested Tests
Passed 2/2 Tests
Total Score: 1.0/1.0
```
- Before the edits, in a scratch copy, `make test-code` gave `Test 2) Code - threads_main: Failed` and `Total Score: 0.0/0.5`. `setarch x86_64 -R make test` after the edits gave the identical 1.0/1.0.
- `cmp -l QUESTIONS.txt.bak QUESTIONS.txt` lists exactly 3 differing bytes (offsets 3205, 3705, 3904), each a space (octal 40) turned into `X` (octal 130). `diff` shows the lines `2 Iterations`, `Consumers don't take turns in a consistent order.` and `Messages are always printed in alphabetical order.`
- `diff` of the starter `queue.c` against the finished one shows 57 lines added and 0 removed. Neither file has a CR byte.
- `md5sum` of `Makefile`, `queue.h`, `threads_main.c` and `QUESTIONS.txt.bak` matches what I recorded before editing. `lab08-code/` holds only the submission files plus `lab08-code.zip`.
- Stress, in scratch and not submitted: 3 producers, 4 consumers, 1200 distinct numbered items, TSAN build, one mode with slow consumers (queue fills) and one with slow producers (queue empties). 5 runs of each: 0 lost or duplicated items, 0 TSAN reports, exit 0, final `size` 0 and `head` NULL. A counted copy of `queue.c` showed `queue_add` waited on `queue_full` 300 and 187 times and `queue_remove` waited on `queue_empty` 304 and 498 times, so both wait loops ran. The lab's own run cannot fill the queue, since the producer sleeps 0.5 s per add, so this is the only evidence for the full path.
- `make zip` produced `lab08-code.zip` with 6 files plus the directory entry: `Makefile`, `QUESTIONS.txt`, `QUESTIONS.txt.bak`, `queue.c`, `queue.h`, `threads_main.c`. Extracting it into a temp folder gave byte-identical copies of all six, and `socrates` on the extracted `QUESTIONS.txt` printed `All quiz answers correct.` SHA256 `[REDACTED]`.
- **Not yet verified:** the Gradescope upload, the remote autograder score, group membership, attendance, and the `queue_init` failure branches (a NULL-attribute `pthread_*_init` call does not fail here, so I could not trigger them).
## Errors + fixes
==An unsynchronized queue fails in two separate ways: TSAN reports a data race, and a consumer that runs before the first add dereferences a NULL `head`.==
### The starter queue: data race, then a segfault
- Problem: the untouched `queue.c` under `setarch x86_64 -R ./threads_main` printed `WARNING: ThreadSanitizer: data race` (a size-8 read in `queue_remove` at `queue.c:52` against a previous size-8 write in `queue_add` at `queue.c:20`), then a second report on a heap block of size 520, then `ERROR: ThreadSanitizer: SEGV on unknown address 0x000000000200 ... READ memory access` at `queue_remove queue.c:53`. `make test-code` failed 0.0/0.5.
- Fix: the lock, the two `while` waits on the condition variables, the two signals and the unlocks described under Procedure.
- Why: the consumers start right after the producer, and `queue_remove` had no empty check, so `queue->head` could still be NULL. `queue->head->next` then reads address `0x200`, which is the offset of `next` in `node_t` (512 bytes of `message` come first). A small fault address is a field offset from a NULL struct pointer. The race reports are separate: even with a non-NULL head, two threads touched the list and `size` with no ordering between them. The 520-byte block is one `node_t`, 512 plus an 8-byte pointer.
- Evidence: the baseline output above. After the fix, `make test` passed with no TSAN output and the stress runs were clean.
### `if` instead of `while` (reproduced on purpose, not in the submitted file)
- Problem: in a scratch copy of the finished `queue.c` I changed both `while` to `if` and ran the stress program with slow producers, so consumers wait on an empty queue. 6 of 6 runs died with `ThreadSanitizer: SEGV on unknown address 0x000000000000 ... READ memory access`, inside `strcpy` called from `queue_remove`.
- Fix: keep `while`.
- Why: a signal makes a waiter runnable and nothing more. By the time it holds the lock again another consumer may have taken the item, or the wait may have returned spuriously. With `if` the thread falls through to `queue->head->message` on an empty queue. With `while` it rechecks `size` and goes back to sleep. Address `0x0` here versus `0x200` above is `message` versus `next`, the two fields the removal code reads.
- Evidence: 6 of 6 crashes with `if`, against 10 of 10 clean runs with `while`. I did not run the `if` variant through `threads_main` itself, so I do not know whether the lab's own test would catch it.
### A scratch program failed to compile on an unused variable
- Problem: my stress harness stopped with `error: 'max_size_seen' defined but not used [-Werror=unused-variable]`.
- Fix: delete the variable.
- Why: I copied the Makefile's `-Wall -Werror`, which turns every warning into an error. The same applies to the lab: each function's `int result` is used, an unused one would fail `make`.
- Evidence: the harness built after the deletion.
### A bare `./threads_main` aborts at TSAN startup
- Problem: a scratch binary run without `setarch` printed `FATAL: ThreadSanitizer: unexpected memory mapping [REDACTED]` and exited 66 before `main`.
- Fix: run it as `setarch x86_64 -R ./threads_main`. `make test` needed no wrapper this time.
- Why: this is the ASLR and TSAN shadow-memory mismatch from [[20_Progress/Degree/CSCI 4061/Labs/Lab - 7|Lab - 7]]. Lab 7's test command did not disable ASLR, so it needed `setarch x86_64 -R make test`. Lab 8's `test_cases/input/threads_main.txt` runs `$(setarch -R true 2>/dev/null && echo setarch -R) ./threads_main`, so the test handles it.
- Evidence: bare run exit 66; plain `make test` gave 2/2.
## Flashcards
#cards/csci4061
Why must the condition around `pthread_cond_wait` be a `while` and not an `if`?::A woken thread is only runnable. Another thread may take the item before it runs, and the wait can return spuriously. The `while` rechecks the condition under the lock and sleeps again if it no longer holds.
Why does `pthread_cond_wait(&cv, &lock)` need the mutex?::It unlocks and sleeps atomically, so no change to the condition can slip in between the check and the sleep. When it returns the mutex is locked again.
A consumer calls `pthread_cond_signal` before any thread is waiting. Is the item lost?::The signal is thrown away, but the item is not, because the state lives in the protected variable (`size`). A later consumer checks it under the lock and does not sleep. A semaphore remembers the count, a condition variable does not.
You lock a mutex and then hit an error branch that returns. What must that branch do first?::Unlock. Every return path after the lock, including a failed `pthread_cond_wait` or `pthread_cond_signal`, has to release it or every other thread blocks forever.
A segfault reports a fault address like `0x200` or `0x8` inside a linked-list function. What does it usually mean?::A NULL struct pointer with a field read at that offset. Here `0x200` was the `next` field of a node that starts with a 512-byte `message`, read through a NULL `head`.

````
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/vault-lint" && node vault-lint.js --path "20_Progress/Degree/CSCI 4061/Labs/" --list 20 2>&1 | head -40; echo "=== em dash / en dash scan"; grep -c "—" "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 4061/Labs/Lab - 8.md"; echo "=== highlights per line"; grep -n "==" "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 4061/Labs/Lab - 8.md" | cut -c1-90; echo "=== tabs used for numbered sub-content:"; grep -c $'^\t' "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 4061/Labs/Lab - 8.md"; echo "=== blank lines (line numbers)"; grep -n '^$' "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 4061/Labs/Lab - 8.md"
```
```
Scanned 7 notes in scope (excluded: 1 out of scope, 1469 tier 4, 77 templates). Specs: 76. Vocabulary parsed: true
FIT: 2/7 = 28.6%

By tier:
  tier 1: 2/7 = 28.6%

By family (fit / total, near-fit, failing checks):
  course-lab                       2/7      28.6%  near    1  F1:4 F5:2 F6:4

Top failure reasons:
      4  6:legacy-shape
      4  1:missing-key
      4  1:hash-in-tags
      2  5:extra-blank-lines
      1  1:bad-date

First 20 failing notes:
  20_Progress/Degree/CSCI 4061/Labs/Lab - 2.md  [course-lab]  6:legacy-shape; 1:missing-key:class_kind; 1:hash-in-tags; 5:extra-blank-lines:2
  20_Progress/Degree/CSCI 4061/Labs/Lab - 3.md  [course-lab]  6:legacy-shape; 1:missing-key:class_kind; 1:hash-in-tags
  20_Progress/Degree/CSCI 4061/Labs/Lab - 4.md  [course-lab]  6:legacy-shape; 1:missing-key:class_kind; 1:bad-date:deadline; 1:hash-in-tags
  20_Progress/Degree/CSCI 4061/Labs/Lab - 5.md  [course-lab]  6:legacy-shape; 1:missing-key:class_kind; 1:hash-in-tags
  20_Progress/Degree/CSCI 4061/Labs/Lab - 8.md  [course-lab]  5:extra-blank-lines:1
=== em dash / en dash scan
0
=== highlights per line
16:==Lab 8 makes the linked-list queue in `queue.c` a bounded, thread-safe producer-consum
22:==Make `queue_add` and `queue_remove` safe for one producer and five consumers running 
35:==Take the lock, `while (condition not met) pthread_cond_wait`, change the state, signa
62:	`while (queue->size == MAX_QUEUE_SIZE)` waits on `queue_full` with `queue->lock`. The 
64:	`while (queue->size == 0)` waits on `queue_empty`. This guard is what protects the sta
75:    while (queue->size == MAX_QUEUE_SIZE) {
88:`queue_remove` is the mirror image: wait while `size == 0` on `queue_empty`, run the st
98:==Observed in `cranky_pasteur` on 2026-11-02: `make test` passed 2/2 for 1.0/1.0 on its
101:== Lab 08
102:== Running 2/2 tests
118:==An unsynchronized queue fails in two separate ways: TSAN reports a data race, and a 
=== tabs used for numbered sub-content:
15
=== blank lines (line numbers)
20:
53:
105:
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Labs\Lab - 8.md`
```diff
- I did not test it without the sleep.
- 
- `socrates` checks the file
+ I did not test it without the sleep.
+ `socrates` checks the file
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/vault-lint" && node vault-lint.js --path "20_Progress/Degree/CSCI 4061/Labs/Lab - 8" --list 5 2>&1 | head -14; echo ==== ; node vault-lint.js --path "20_Progress/Degree/CSCI 4061/Labs/" --list 20 2>&1 | grep -i "Lab - 8\|Lab - 7\|Lab - 6\|FIT\|Warn"
```
```
Scanned 1 notes in scope (excluded: 1 out of scope, 1469 tier 4, 77 templates). Specs: 76. Vocabulary parsed: true
FIT: 1/1 = 100.0%

By tier:
  tier 1: 1/1 = 100.0%

By family (fit / total, near-fit, failing checks):
  course-lab                       1/1     100.0%  near    0  

Top failure reasons:

First 5 failing notes:
====
FIT: 3/7 = 42.9%
By family (fit / total, near-fit, failing checks):
```

## You

This session is being continued from a previous conversation that ran out of context. The summary below covers the earlier portion of the conversation.

<system-reminder>
<tools-used-before-summary>Bash, Edit, Grep, Read, Write</tools-used-before-summary>
</system-reminder>
Summary:
1. Primary Request and Intent:
   - Message 1: the user pasted a 10-question CSCI 4061 multiple-choice quiz on threads, atomicity, busy waiting and condition variables, and asked for answers as option numbers (done, user said "Great work").
   - Message 2 (the main task): "in the same manner you are required to work on the lab - 8 for the course." Inputs:
     - Slides: `"D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\Labs\Lab 08.pdf"`
     - Code: `"D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\csci4061-fa26\Labs\lab08-code"`, to be worked on inside `/workspaces/csci4061-fa26/Labs/lab08-code` in the already-running dev container.
   - Requirements stated by the user:
     - Go through previous lab files to understand what to write in the lab note and the exact byte-by-byte changes required.
     - "Make no mistakes and there is no overstepping the task here. Only write code where it is mentioned to write code. Do not make any sort of unecessary edits."
     - Finish the lab by going through the main standards and workflows in 30_Order.
     - Write the lab note at `20_Progress/Degree/CSCI 4061/Labs/Lab - 8`.
     - "Follow only the course material, the textbook, lectures and things already provided in the main hub of the course. Do not rely on training data for solving the lab, rely on the textbook for true source of truth information after the lecture slides and lecture code."
     - "tell me when you have finished the job and how exactly did you do it." "lay the note our perfectly."

2. Key Technical Concepts:
   - Bounded, thread-safe producer-consumer queue: linked list, one `pthread_mutex_t lock`, `pthread_cond_t queue_full` and `queue_empty`, `MAX_QUEUE_SIZE` 5, 1 producer and 5 consumers over 10 messages.
   - `pthread_cond_wait` atomically unlocks and sleeps, and relocks on return.
   - Waiting in a `while`, not an `if`: spurious wakeups, and another thread can take the item first (Lec13 slide 33; APUE p. 414).
   - `pthread_cond_signal` with no waiter is lost (Lec13 slide 29); signal after the state change while holding the lock.
   - pthread functions return an error number and do not set `errno`, so errors are printed with `fprintf(stderr, ..., strerror(result))`.
   - Every early return after the lock must unlock first (lab slide 5).
   - TSAN: the Makefile uses `-Wall -Werror -g -fsanitize=thread -fno-omit-frame-pointer`. A bare TSAN binary aborts with "unexpected memory mapping" (exit 66) on this WSL2 kernel; `setarch x86_64 -R` fixes it. Lab 8's test input already wraps `setarch -R`, so plain `make test` works.
   - A SEGV at a small address such as 0x200 is a NULL struct pointer plus a field offset (`next` follows the 512-byte `message`).
   - Semaphore alternative (Lec14) was read for contrast only and not used.
   - Tools: `testius`, `socrates` (hashes QUESTIONS.txt against `quiz_sum.json`), `make test/test-quiz/test-code/zip`.
   - Vault: Lab Standard (headings Goal, Procedure / key steps, Results, Errors + fixes, optional Flashcards; required keys `type, class_kind, status, created, updated, tags, area, next`, optional sourced `deadline`), Decoration Standard, HUMAN_WRITING, Vault Lint.

3. Files and Code Sections:
   - `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\csci4061-fa26\Labs\lab08-code\queue.c` (MODIFIED, additions only: 57 lines added, 0 removed; no CR bytes). Final sha256 `[REDACTED]`. The starter had `TODO` comments, a `queue_add` whose malloc-failure branches already call `pthread_mutex_unlock(&queue->lock)`, and an unsynchronized `queue_remove`. TODO comments and all starter lines were kept byte for byte. Added code:
     - `queue_init` (after the TODO comment, before `return 0;`):
       ```c
       int result;
       if ((result = pthread_mutex_init(&queue->lock, NULL)) != 0) {
           fprintf(stderr, "pthread_mutex_init: %s\n", strerror(result));
           return 1;
       }
       if ((result = pthread_cond_init(&queue->queue_full, NULL)) != 0) {
           fprintf(stderr, "pthread_cond_init: %s\n", strerror(result));
           return 1;
       }
       if ((result = pthread_cond_init(&queue->queue_empty, NULL)) != 0) {
           fprintf(stderr, "pthread_cond_init: %s\n", strerror(result));
           return 1;
       }
       ```
     - `queue_add` (before the existing `if (queue->head == NULL)`):
       ```c
       int result;
       if ((result = pthread_mutex_lock(&queue->lock)) != 0) {
           fprintf(stderr, "pthread_mutex_lock: %s\n", strerror(result));
           return -1;
       }
       while (queue->size == MAX_QUEUE_SIZE) {
           if ((result = pthread_cond_wait(&queue->queue_full, &queue->lock)) != 0) {
               fprintf(stderr, "pthread_cond_wait: %s\n", strerror(result));
               pthread_mutex_unlock(&queue->lock);
               return -1;
           }
       }
       ```
       and, before the final `return 0;`:
       ```c
       if ((result = pthread_cond_signal(&queue->queue_empty)) != 0) {
           fprintf(stderr, "pthread_cond_signal: %s\n", strerror(result));
           pthread_mutex_unlock(&queue->lock);
           return -1;
       }
       if ((result = pthread_mutex_unlock(&queue->lock)) != 0) {
           fprintf(stderr, "pthread_mutex_unlock: %s\n", strerror(result));
           return -1;
       }
       ```
     - `queue_remove` mirrors this: lock, `while (queue->size == 0)` wait on `queue_empty`, then the starter's 5 removal lines, then signal `queue_full`, then unlock.
   - `...\lab08-code\QUESTIONS.txt` (MODIFIED, exactly 3 bytes, space (octal 40) to `X` (octal 130) at offsets 3205, 3705, 3904): `(X) 2 Iterations`; `(X) Consumers don't take turns in a consistent order.`; `(X) Messages are always printed in alphabetical order.` sha256 `[REDACTED]`.
   - `...\lab08-code\lab08-code.zip` (created by `make zip`): contains Makefile, QUESTIONS.txt, QUESTIONS.txt.bak, queue.c, queue.h, threads_main.c (plus directory entry). sha256 `[REDACTED]`. The extracted copy was byte-identical and socrates printed "All quiz answers correct." Earlier labs 6 and 7 also left a zip in their directories.
   - Untouched, md5 verified unchanged: `Makefile` [REDACTED], `queue.h` [REDACTED], `threads_main.c` [REDACTED], `QUESTIONS.txt.bak` [REDACTED], and `test_cases/`.
   - `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Labs\Lab - 8.md` (REPLACED the empty template stub with the full note, then removed one extra blank line):
     - Frontmatter: `type: class`, `class_kind: lab`, `status: sprout`, `created/updated: 2026-11-02`, `tags: [class, lab]`, `area: ["[[CSCI 4061 Board]]"]`, `deadline: 2026-11-04` (derived from the Board rule: Wednesday after the Monday session), and a `next` about the Gradescope upload.
     - Structure: H1, highlighted summary line, "Sources read" paragraph, a NOTE callout (no week or chapter note exists), then `## Goal` (with a Submission checklist subsection), `## Procedure / key steps` (setup; "The pattern" with 5 numbered decisions; quiz answers with evidence; code decisions with a condensed `queue_add` snippet; reproduce commands), `## Results`, `## Errors + fixes` (4 entries), and `## Flashcards` (5 cards on `#cards/csci4061` in `::` format).
     - Quiz evidence recorded: 8 TSAN-build runs gave the identical order `0 0 1 2 3 4 1 2 3 4`; 24 plain-build runs under load gave 20 distinct consumer sequences; all 24 runs printed alphabetical messages.
     - Errors entries: starter race plus SEGV at 0x200; `if` instead of `while` negative control (6/6 SEGV at address 0x0, versus 10/10 clean with `while`); scratch `-Werror` unused-variable; bare TSAN `unexpected memory mapping` (exit 66).
   - Read-only sources consulted: `Lab 08.pdf` (MinerU), `Lec13.pdf`, `Lec14.pdf`, `Lec15.pdf` (networking only), the APUE 3e PDF §11.6.6 via MinerU, the Lab - 7 note (model), Lab - 3 and Lab - 6 frontmatter, Lab Standard/Template/Workflow, Board, Textbook Map, HUMAN_WRITING, Decoration Standard, Vault Lint, Jarvis Writing and Formatting.

4. Errors and fixes:
   - Scratch stress harness failed to compile: `'max_size_seen' defined but not used [-Werror=unused-variable]`. Fixed by deleting the variable.
   - Shell quoting errors in my scratch sed commands, fixed by simplifying the commands. Not lab code.
   - First parallel xargs observation run had interleaved output because all runs shared one stdout. Redone with one output file per run.
   - Vault Lint reported `5:extra-blank-lines:1` on Lab - 8.md. Removed the blank line before the "`socrates` checks the file..." paragraph. Re-lint of the single note: FIT 1/1 = 100%.
   - The starter's own failures (race plus NULL deref) were the expected baseline, resolved by the implementation.
   - No user corrections or negative feedback in this turn.

5. Problem Solving:
   - Determined the quiz answers by reasoning and observation. The loop bound is 10/5 = 2. Consumer order is nondeterministic (20 distinct sequences in 24 loaded runs; even the stable sequence is not creation-order turn-taking). The producer's 0.5 s sleep and the FIFO queue give the alphabetical message order. `make test` confirmed the set.
   - Verified full-queue wait coverage with a stress harness (3 producers, 4 consumers, 1200 items, TSAN, 5 runs per mode, 0 loss, 0 TSAN reports). Counters showed queue_full waited 300/187 times and queue_empty 304/498 times.
   - Results: plain `make test` and `setarch x86_64 -R make test` both gave 2/2, 1.0/1.0.
   - Scratch dirs (`/tmp/l8base`, `l8obs`, `l8stress`, `l8unz`) in the container were removed. The lab folder holds only the submission files plus the zip.

6. All user messages:
   - Message 1: pasted a 10-question quiz (threads: non-shared item, single-core benefit, thread function signature, perror vs strerror, atomic lines, mutex atomicity, busy waiting, two bounded-queue code bugs, `pthread_cond_signal` truth) with "Answer the questions correctly regarding the course CSCI 4061. Provide me the answers as option numbers so that it is easy to mark."
   - Message 2: "Great work, now in the same manner you are required to work on the lab - 8 for the course. `"D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\Labs\Lab 08.pdf"` - slides for the lab. `"D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\csci4061-fa26\Labs\lab08-code"` - the actual code lives there. But the dev container has been run. So, you are going to be working inside: `/workspaces/csci4061-fa26/Labs/lab08-code`. Make sure to go through the previous lab files already created to understand what exactly to write in the lab note and the exact byte by byte changes required to the lab files. Make no mistakes and there is no overstepping the task here. Only write code where it is mentioned to write code. Do not make any sort of unecessary edits and finish the lab correctly by going through the main standards, workflows established inside 30_order. Do the task correctly and write the lab note here: `20_Progress/Degree/CSCI 4061/Labs/Lab - 8`. Do the task correctly and tell me when you have finished the job and how exactly did you do it. Follow only the course material, the textbook, lectures and things already provided in the main hub of the course. Do not rely on training data for solving the lab, rely on the textbook for true source of truth information after the lecture slides and lecture code. Do the task correctly and lay the note our perfectly."
   - Message 3: a request for this summary (system-style instruction, text only).

7. Pending Tasks:
   - Deliver the final report to the user: state that the lab is finished and explain exactly how it was done, using the points under Current Work below.
   - Nothing else was explicitly requested.

8. Current Work:
   Immediately before the summary request, I had finished writing `Lab - 8.md`, fixed the one Vault Lint warning, and re-run lint (single-note FIT 100%; the folder-wide FIT of 3/7 comes from the older legacy Lab 2-5 notes, which were not touched). All implementation, verification and note-writing steps are complete. The only remaining item is the final user-facing report.

   Report content (all verified):
   - `queue.c`: additions only (57 added, 0 removed lines) in `queue_init`, `queue_add` and `queue_remove`.
   - `QUESTIONS.txt`: exactly 3 bytes changed.
   - `make test` gave 2/2, 1.0/1.0, both plain and with `setarch`.
   - Stress and negative-control checks as described above.
   - `lab08-code.zip` verified (sha256 `4144d7f0...01c0e`, extracted copy byte-identical).
   - Untouched files' md5s unchanged.
   - The note is at `20_Progress/Degree/CSCI 4061/Labs/Lab - 8.md` and passes Vault Lint.
   - Sources used: lab slides, Lec13/Lec14, APUE §11.6.6 pp. 413-416.
   - Unverified: Gradescope upload, remote score, attendance.
   - The deadline (2026-11-04) is derived from the Board rule, not read off Gradescope.
   - The Board's Current State and the session log were not updated, because it wasn't asked and the global rule forbids writing unrequested files. I can offer to do either.
   - `queue_init` failure branches could not be triggered.
   - The `if`-vs-`while` variant was not run through `threads_main`.

9. Optional Next Step:
   Send the final plain-text completion report described under Current Work. No further tool actions are needed. Offer, without doing it, to update the CSCI 4061 Board's Current State/`next` or append the Session Log entry if the user wants those.

If you need specific details from before compaction (like exact code snippets, error messages, or content you generated), read the full transcript at: C:\Users\anant\.claude\projects\[REDACTED]\[REDACTED].jsonl
Continue the conversation from where it left off without asking the user any further questions. Resume directly — do not acknowledge the summary, do not recap what was happening, do not preface with "I'll continue" or similar. Pick up the last task as if the break never happened.

The messages after this summary are the most recent messages from before compaction, kept verbatim. The summary was written without seeing them, so something it says has not happened yet may already have happened in them.

## Actions Taken

**Files created:**
- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Labs\Lab - 8.md`

**Files modified:**
- `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\csci4061-fa26\Labs\lab08-code\QUESTIONS.txt`
- `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\csci4061-fa26\Labs\lab08-code\queue.c`

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
- `cd "D:/_Anant/20_Progress/Documents/Jarvis" && ls "20_Progress/Degree/CSCI 4061/" "20_Progress/Degree/CSCI 4061/Labs" 2>&1 | head -50; echo ---; ls -R "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/csci4061-fa26/Labs/lab08-code" | head -50; echo ---; ls "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/Labs" "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/csci4061-fa26/Labs"`
- `powershell -NoProfile -ExecutionPolicy Bypass -File D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/claude-workflow/scripts/mineru-pdf.ps1 "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/Labs/Lab 08.pdf"`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 4061/Labs" && wc -c Lab*.md && echo ---- && cat "Lab - 8.md"; ls blobs | head`
- `cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/csci4061-fa26/Labs/lab08-code" && for f in Makefile QUESTIONS.txt queue.h queue.c threads_main.c test_cases/tests.json test_cases/input/threads_main.txt test_cases/output/quiz.txt test_cases/output/threads_main.txt test_cases/resources/quiz_sum.json; do echo "=================== $f"; cat -A "$f" | sed 's/\$$//' ; done; echo; diff QUESTIONS.txt QUESTIONS.txt.bak && echo bak-same; git -C . status --short . | head`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 4061/Labs" && cat "Lab - 7.md"`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis" && grep -n -i "class" "30_Order/Standards/Note Type Registry.md" 2>/dev/null | head -20; ls 30_Order 30_Order/Standards 30_Order/Templates 30_Order/Workflows | head -120; find 30_Order -iname "*Note Type Registry*" -o -iname "*Class Standard*" -o -iname "*Lab*" | head`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 4061" && ls Concepts Textbook Weekly Projects; echo ----; cat "CSCI 4061 Board.md" | head -150`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis/30_Order" && cat "Standards/Courses/Lab Standard.md" "Templates/Classes/Lab Template.md" "Workflows/Courses/Lab Workflow.md"`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 4061" && cat "Textbook/Textbook Map.md"; ls Concepts/Lecture Concepts/Code "Concepts/C Refresher" Concepts/Exams; ls -la Weekly`
- `cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061" && ls; echo ---; ls Lectures lecture* Textbook* 2>/dev/null; echo ---; ls csci4061-fa26; ls csci4061-fa26/* | head -80`
- `cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061" && ls Lecture; for d in lecture11-code lecture12-code lecture13-code; do echo "== $d"; ls -la csci4061-fa26/Lecture/$d; done`
- `cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/Lecture" && ls "Week - 7" "Week - 8" Transcripts | head -50; grep -ril "pthread_cond" "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/csci4061-fa26" 2>/dev/null | head`
- `cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/Lecture" && for f in "Week - 8/Lec14.pdf" "Week - 8/Lec15.pdf"; do powershell -NoProfile -ExecutionPolicy Bypass -File D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/claude-workflow/scripts/mineru-pdf.ps1 "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/Lecture/$f" | head -3; done; ls -R Transcripts | head -40`
- `cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/Lecture/Week - 7" && for f in Lec12.pdf Lec13.pdf; do powershell -NoProfile -ExecutionPolicy Bypass -File D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/claude-workflow/scripts/mineru-pdf.ps1 "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/Lecture/Week - 7/$f" | head -3; done; grep -il "cond" C:/Users/anant/AppData/Local/Temp/mineru-out/Lec1[23]*.md`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 4061/Textbook" && grep -n -i "pdf page\|offset\|p\. [0-9]\|pages" "Chapter - 15.md" | head -10; ls C:/Users/anant/AppData/Local/Temp/mineru-out/ | head -30`
- `cd C:/Users/anant/AppData/Local/Temp/mineru-out && grep -l -i "pthread_cond_wait" *.md; grep -n -i "^.*11\.6\.[0-9]" Advanced*p476-480.md Advanced*p417-431.md | head`
- `cd C:/Users/anant/AppData/Local/Temp/mineru-out && head -c 600 Advanced*p476-480.md; echo; grep -o "<!-- page [0-9]* of [0-9]* -->" Advanced*p476-480.md | head -3; grep -n -i "Thread Synchronization\|Mutexes" Advanced*p476-480.md | head`
- `powershell -NoProfile -ExecutionPolicy Bypass -File D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/claude-workflow/scripts/mineru-pdf.ps1 "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/Textbook/Advanced Programming in the UNIX Environment, 3rd Edition.pdf" -Pages 452-468`
- `cd C:/Users/anant/AppData/Local/Temp/mineru-out && f=Advanced_Programming_in_the_UNIX_Environment__3rd_Edition.standard.p452-468.md; grep -n "^## \|^### \|<!-- page" $f | head -80`
- `powershell -NoProfile -ExecutionPolicy Bypass -File D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/claude-workflow/scripts/mineru-pdf.ps1 "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/Textbook/Advanced Programming in the UNIX Environment, 3rd Edition.pdf" -Pages 436-451 | head -3; cd C:/Users/anant/AppData/Local/Temp/mineru-out && grep -n "^## \|^### \|<!-- page" Advanced*p436-451.md | head -60`
- `cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/csci4061-fa26" && cat Lecture/lecture13-code/array_threads_sum_fixed.c; echo =======; cat -A Labs/lab07-code/sum_files.c | sed 's/\$$//' | sed -n 1,200p; echo ====; diff Labs/lab07-code/QUESTIONS.txt.bak Labs/lab07-code/QUESTIONS.txt`
- `docker ps -a --format '{{.Names}} {{.Status}} {{.Image}}' 2>&1 | head`
- `docker exec cranky_pasteur bash -lc 'cd /workspaces/csci4061-fa26/Labs/lab08-code && pwd && ls -la --time-style=full-iso && gcc --version | head -1 && uname -r && cat /proc/sys/vm/mmap_rnd_bits; which testius socrates; md5sum queue.c QUESTIONS.txt QUESTIONS.txt.bak Makefile queue.h threads_main.c'`
- `docker exec cranky_pasteur bash -lc 'rm -rf /tmp/l8base && cp -r /workspaces/csci4061-fa26/Labs/lab08-code /tmp/l8base && cd /tmp/l8base && setarch x86_64 -R make threads_main 2>&1 | tail -5; echo "--- run starter (timeout 10)"; timeout 10 setarch x86_64 -R ./threads_main 2>&1 | head -40; echo "exit=${PIPESTATUS[0]}"; echo "--- make test-code"; setarch x86_64 -R make test-code 2>&1 | tail -30'`
- `docker exec cranky_pasteur bash -lc 'rm -rf /tmp/l8obs && cp -r /workspaces/csci4061-fa26/Labs/lab08-code /tmp/l8obs && cd /tmp/l8obs && setarch x86_64 -R make threads_main 2>&1 | tail -3; echo "--- one run with consumer ids"; setarch x86_64 -R ./threads_main; echo "exit=$?"; echo "--- consumer index order over 8 runs (first-printed line first)"; for i in 1 2 3 4 5 6 7 8; do setarch x86_64 -R ./threads_main | sed "s/^Consumer \([0-9]\):.*/\1/" | tr "\n" " "; echo; done; echo "--- distinct message-order sequences over 8 runs"; for i in 1 2 3 4 5 6 7 8; do setarch x86_64 -R ./threads_main | sed "s/^Consumer [0-9]: //" | tr "\n" " "; echo; done | sort | uniq -c'`
- `docker exec cranky_pasteur bash -lc 'cd /tmp/l8obs && gcc -Wall -Werror -g -pthread -o tm_plain threads_main.c queue.c && nproc && echo "--- plain build, 24 runs, 12 in parallel (load): consumer-index sequence, counted" && seq 24 | xargs -P 12 -I{} sh -c "./tm_plain | sed \"s/^Consumer \([0-9]\):.*/\1/\" | tr \"\n\" \" \"; echo" | sort | uniq -c | sort -rn; echo "--- plain build: message-order sequences" && seq 12 | xargs -P 12 -I{} sh -c "./tm_plain | sed \"s/^Consumer [0-9]: //\" | tr \"\n\" \" \"; echo" | sort | uniq -c'`
- `docker exec cranky_pasteur bash -lc 'cd /tmp/l8obs && rm -rf obs && mkdir obs && seq 24 | xargs -P 12 -I{} sh -c "./tm_plain > obs/run_{}.txt" && for f in obs/run_*.txt; do sed "s/^Consumer \([0-9]\):.*/\1/" $f | tr "\n" " "; echo; done | sort | uniq -c | sort -rn; echo "--- distinct message-order sequences:"; for f in obs/run_*.txt; do sed "s/^Consumer [0-9]: //" $f | tr "\n" " "; echo; done | sort | uniq -c; echo "--- line counts per run (expect 10):"; wc -l obs/run_*.txt | awk "{print \$1}" | sort | uniq -c'`
- `docker exec cranky_pasteur bash -lc 'cd /workspaces/csci4061-fa26/Labs/lab08-code && echo "=== plain make test (no setarch)"; make test 2>&1 | tail -12; echo; echo "=== setarch x86_64 -R make test"; setarch x86_64 -R make test 2>&1 | tail -12'`
- `docker exec cranky_pasteur bash -lc 'cd /workspaces/csci4061-fa26/Labs/lab08-code && echo "=== cmp -l QUESTIONS.txt.bak QUESTIONS.txt"; cmp -l QUESTIONS.txt.bak QUESTIONS.txt; echo "=== diff bak"; diff QUESTIONS.txt.bak QUESTIONS.txt; echo "=== md5 of untouched files vs originals"; md5sum QUESTIONS.txt.bak Makefile queue.h threads_main.c; echo "(orig: bak a105822d..., Makefile f1c9ee01..., queue.h 172caab1..., threads_main 0b1111ad...)"; echo "=== CR bytes in queue.c / QUESTIONS.txt:"; grep -c $'"'"'\r'"'"' queue.c QUESTIONS.txt'`
- `docker exec cranky_pasteur bash -lc 'cd /workspaces/csci4061-fa26/Labs && echo "=== diff -u starter queue.c vs mine"; diff -u /tmp/l8base/queue.c lab08-code/queue.c; echo; echo "=== what earlier labs leave on disk"; ls lab07-code lab06-code'`
- `docker exec cranky_pasteur bash -lc 'mkdir -p /tmp/l8stress && cd /tmp/l8stress && cp /workspaces/csci4061-fa26/Labs/lab08-code/queue.c /workspaces/csci4061-fa26/Labs/lab08-code/queue.h . && cat > stress.c <<'"'"'EOF'"'"' #include <pthread.h> #include <stdio.h> #include <stdlib.h> #include <string.h> #include <unistd.h> #include "queue.h" #define NP 3 #define NC 4 #define PER_P 400            /* 1200 items total, divisible by NC */ static queue_t q; static int seen[NP * PER_P]; static pthread_mutex_t seen_lock = PTHREAD_MUTEX_INITIALIZER; static int slow_consumers;   /* 1: consumers sleep, queue fills; 0: producers sleep, queue empties */ static unsigned max_size_seen; void *prod(void *a) {     int id = (int)(long)a; char buf[64];     for (int i = 0; i < PER_P; i++) {         snprintf(buf, sizeof buf, "%d", id * PER_P + i);         if (queue_add(&q, buf) != 0) exit(2);         if (!slow_consumers && i % 20 == 0) usleep(200);     }     return NULL; } void *cons(void *a) {     char buf[BUFLEN];     for (int i = 0; i < NP * PER_P / NC; i++) {         if (queue_remove(&q, buf) != 0) exit(3);         int v = atoi(buf);         pthread_mutex_lock(&seen_lock); seen[v]++; pthread_mutex_unlock(&seen_lock);         if (slow_consumers && i % 20 == 0) usleep(200);     }     return NULL; } int main(int argc, char **argv) {     slow_consumers = argc > 1 && argv[1][0] == '"'"'s'"'"';     if (queue_init(&q) != 0) return 1;     pthread_t p[NP], c[NC];     for (long i = 0; i < NC; i++) pthread_create(&c[i], NULL, cons, (void *)i);     for (long i = 0; i < NP; i++) pthread_create(&p[i], NULL, prod, (void *)i);     for (int i = 0; i < NP; i++) pthread_join(p[i], NULL);     for (int i = 0; i < NC; i++) pthread_join(c[i], NULL);     int bad = 0;     for (int i = 0; i < NP * PER_P; i++) if (seen[i] != 1) bad++;     printf("mode=%s items=%d bad(lost or duplicated)=%d final size=%u head=%p\n", slow_consumers ? "slow-consumers(queue fills)" : "slow-producers(queue empties)", NP*PER_P, bad, q.size, (void*)q.head);     return bad != 0; } EOF gcc -Wall -Werror -g -fsanitize=thread -fno-omit-frame-pointer -pthread -o stress stress.c queue.c && for r in 1 2 3 4 5; do setarch x86_64 -R ./stress s 2>&1 | tail -3; echo "exit=$?"; setarch x86_64 -R ./stress f 2>&1 | tail -3; done'`
- `docker exec cranky_pasteur bash -lc 'cd /tmp/l8stress && sed -i "/max_size_seen/d" stress.c && gcc -Wall -Werror -g -fsanitize=thread -fno-omit-frame-pointer -pthread -o stress stress.c queue.c && for r in 1 2 3 4 5; do setarch x86_64 -R ./stress s 2>&1 | tail -3; echo "exit=${PIPESTATUS[0]}"; setarch x86_64 -R ./stress f 2>&1 | tail -3; echo "exit=${PIPESTATUS[0]}"; done'`
- `docker exec cranky_pasteur bash -lc 'cd /tmp/l8stress && sed -e "s/^#include \"queue.h\"/#include \"queue.h\"\nlong wait_full, wait_empty;/" -e "s/^    while (queue->size == MAX_QUEUE_SIZE) {/&\n        wait_full++;/" -e "s/^    while (queue->size == 0) {/&\n        wait_empty++;/" queue.c > queue_counted.c && grep -n "wait_full\|wait_empty" queue_counted.c && sed -e "s/^    return bad != 0;/    extern long wait_full, wait_empty; printf(\"queue_add waited on queue_full %ld times, queue_remove waited on queue_empty %ld times\\\\n\", wait_full, wait_empty);\n&/" stress.c > stress_counted.c && gcc -Wall -Werror -g -fsanitize=thread -fno-omit-frame-pointer -pthread -o stress_counted stress_counted.c queue_counted.c && setarch x86_64 -R ./stress_counted s 2>&1 | tail -3 && setarch x86_64 -R ./stress_counted f 2>&1 | tail -3'`
- `docker exec cranky_pasteur bash -lc 'cd /tmp/l8stress && sed -e "s/^    return bad != 0;/    extern long wait_full, wait_empty; printf(\"waits: queue_full=%ld queue_empty=%ld\", wait_full, wait_empty); putchar(10);\n&/" stress.c > stress_counted.c && gcc -Wall -Werror -g -fsanitize=thread -fno-omit-frame-pointer -pthread -o stress_counted stress_counted.c queue_counted.c && for m in s f; do setarch x86_64 -R ./stress_counted $m 2>&1 | tail -3; done'`
- `docker exec cranky_pasteur bash -lc 'cd /tmp/l8stress && sed -e "s/^    while (queue->size == MAX_QUEUE_SIZE) {/    if (queue->size == MAX_QUEUE_SIZE) {/" -e "s/^    while (queue->size == 0) {/    if (queue->size == 0) {/" queue.c > queue_if.c && diff queue.c queue_if.c; gcc -Wall -Werror -g -fsanitize=thread -fno-omit-frame-pointer -pthread -o stress_if stress.c queue_if.c && for r in 1 2 3 4 5 6; do setarch x86_64 -R timeout 60 ./stress_if f > out_if.txt 2>&1; echo "run $r exit=$? :: $(grep -m1 -E "SUMMARY|mode=|DEADLYSIGNAL" out_if.txt)"; done'`
- `docker exec cranky_pasteur bash -lc 'cd /tmp/l8stress && setarch x86_64 -R timeout 60 ./stress_if f 2>&1 | grep -v "^$" | head -12'`
- `docker exec cranky_pasteur bash -lc 'cd /workspaces/csci4061-fa26/Labs/lab08-code && make zip 2>&1 | tail -4; echo "=== unzip -l"; unzip -l lab08-code.zip; sha256sum lab08-code.zip; rm -rf /tmp/l8unz && mkdir /tmp/l8unz && cd /tmp/l8unz && unzip -q /workspaces/csci4061-fa26/Labs/lab08-code/lab08-code.zip && cd lab08-code && for f in Makefile QUESTIONS.txt QUESTIONS.txt.bak queue.c queue.h threads_main.c; do cmp $f /workspaces/csci4061-fa26/Labs/lab08-code/$f && echo "identical: $f"; done; echo "=== socrates on extracted QUESTIONS.txt"; socrates QUESTIONS.txt -c /workspaces/csci4061-fa26/Labs/lab08-code/test_cases/resources/quiz_sum.json -a; echo "=== lab dir listing"; ls -la /workspaces/csci4061-fa26/Labs/lab08-code'`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis" && head -40 "20_Progress/Degree/CSCI 4061/Labs/Lab - 3.md"; echo ......; head -14 "20_Progress/Degree/CSCI 4061/Labs/Lab - 6.md"; echo; find . -name "Vault Lint.md" -not -path "./50_Archive/*" | head -2; find . -name "Decoration Standard.md" -o -name "HUMAN_WRITING.md" -o -name "Jarvis Writing and Formatting.md" | grep -v Archive | head`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis" && sed -n 1,80p HUMAN_WRITING.md; echo =======; sed -n 1,70p "30_Order/Standards/Decoration Standard.md"; echo ======; sed -n 1,60p "30_Order/System/vault-lint/Vault Lint.md"`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis" && sed -n 1,200p "60_Claude/07_AI_Information/Jarvis Writing and Formatting.md"`
- `docker exec cranky_pasteur bash -lc 'cd /workspaces/csci4061-fa26/Labs && echo "added/removed lines in queue.c vs starter:"; diff /tmp/l8base/queue.c lab08-code/queue.c | grep -c "^>" ; diff /tmp/l8base/queue.c lab08-code/queue.c | grep -c "^<"; echo "--- bare TSAN binary without setarch (scratch build)"; cd /tmp/l8obs && ./threads_main 2>&1 | head -3; echo "exit=${PIPESTATUS[0]}"; echo "--- final checksums"; cd /workspaces/csci4061-fa26/Labs/lab08-code && sha256sum queue.c QUESTIONS.txt lab08-code.zip; echo "--- cleanup scratch"; rm -rf /tmp/l8base /tmp/l8obs /tmp/l8stress /tmp/l8unz; ls /tmp | head; ls -A /workspaces/csci4061-fa26/Labs/lab08-code'`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/vault-lint" && node vault-lint.js --path "20_Progress/Degree/CSCI 4061/Labs/" --list 20 2>&1 | head -40; echo "=== em dash / en dash scan"; grep -c "—" "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 4061/Labs/Lab - 8.md"; echo "=== highlights per line"; grep -n "==" "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 4061/Labs/Lab - 8.md" | cut -c1-90; echo "=== tabs used for numbered sub-content:"; grep -c $'^\t' "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 4061/Labs/Lab - 8.md"; echo "=== blank lines (line numbers)"; grep -n '^$' "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 4061/Labs/Lab - 8.md"`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/vault-lint" && node vault-lint.js --path "20_Progress/Degree/CSCI 4061/Labs/Lab - 8" --list 5 2>&1 | head -14; echo ==== ; node vault-lint.js --path "20_Progress/Degree/CSCI 4061/Labs/" --list 20 2>&1 | grep -i "Lab - 8\|Lab - 7\|Lab - 6\|FIT\|Warn"`

