---
type: class
class_kind: lab
status: sprout
created: 2026-11-16
updated: 2026-11-16
tags:
  - class
  - lab
area:
  - "[[CSCI 4061 Board]]"
deadline: 2026-11-18
next: "Upload lab10-code.zip to Gradescope before 11:59pm Wed 2026-11-18, then confirm the remote autograder matches the local 1.0/1.0 and that lab attendance was recorded."
---
# Lab - 10
==Lab 10 is the first lab written in Python: `sema_barrier.py` starts 10 threads that each sleep a random time, print `about to enter barrier`, call `Barrier.wait()`, and print `past barrier`. The lab is to fill in the `Barrier` constructor and `wait()` using one lock and one semaphore, so that no thread prints `past` until all 10 have printed `about to`.== The thread code and `main` are given.
**Sources read:** the lab prompt (pasted by the user: due date, grading policy, file table); `csci4061-fa26/Labs/lab10-code/` in full (`QUESTIONS.txt`, `QUESTIONS.txt.bak`, `sema_barrier.py`, `Makefile`, and `test_cases/` with `tests.json`, the input script and both expected outputs; the quiz hash file is there and I did not open it); Lecture 14 (`Lec14.pdf`, 27 Oct, slides 7 and 8 on the deadlock conditions, slides 14 to 23 on semaphores) and its transcript (the semaphore passage and the discussion of swapping the order of the `sem_wait` calls); the 20 Oct and 22 Oct transcripts (what the scheduler does with new threads, and the "same program, 10 different behaviors" passage); Stevens and Rago, *APUE* 3e, §11.6.8 Barriers (printed pp. 418 to 419, PDF pp. 452 to 453), the condition-variable example (Figure 11.15, p. 416) and §15.10 POSIX Semaphores (printed pp. 579 to 583, PDF pp. 613 to 617), all read through MinerU from the PDF; [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 11|Chapter - 11]] for the barrier and condition-variable notes; [[20_Progress/Degree/CSCI 4061/Labs/Lab - 9|Lab - 9]] for the note shape; [[CSCI 4061 Board]] for the schedule.
> [!NOTE] Three source gaps, stated so they are not mistaken for coverage
> There are no Lab 10 TA slides in the `Labs/` source folder (it stops at `Lab 09.pptx.pdf`), and the Board's Week 10 "Python Multithreading" lecture is not in the local folders either (`Lecture/Week - 10` is empty and the transcripts end on 5 Nov). The course material I have covers the **C** semaphore API (`sem_init`, `sem_wait`, `sem_post`). The Python names (`Lock.acquire`, `Semaphore.acquire`, `Semaphore.release`) come from the Python 3.10.12 `help()` text inside the container, not from a lecture. [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 15|Chapter - 15]] stops at §15.9, so I read §15.10 straight from the PDF, and `Weekly/` stops at Week - 4, so there is no week note to link.

## Goal
==Make a rendezvous out of two primitives: a lock that protects the arrival count, and a semaphore that starts at 0 so every early arrival blocks until the last thread arrives and posts one token for each of them.==
### Submission checklist (what actually gets graded)
- **Attendance** in the assigned lab section.
- **`QUESTIONS.txt`**: change `( )` to `(X)` on 3 quiz answers, nothing else. `socrates` hashes the whole file against `test_cases/resources/quiz_sum.json`. Test 1, 0.5 pt.
- **`sema_barrier.py`**: fill in the constructor and `wait()` at their two `TODO` comments. Test 2 runs `python3 sema_barrier.py | sed 's/[0-9]\+ past/x past/'` and diffs against `test_cases/output/sema_barrier.txt`. 0.5 pt.
- `make test`, then `make zip` creates `lab10-code.zip` (the Makefile leaves out `test_cases/`), then upload to **Gradescope**. Groups of up to 4 may submit once and add names.
- Due 11:59pm Wednesday 2026-11-18 (stated in the lab prompt).
- Not edited: `Makefile`, `QUESTIONS.txt.bak`, `thread_func`, `main`, `test_cases/`.
## Procedure / key steps
- Setup: `lab10-code` was already in `/workspaces/csci4061-fa26/Labs/lab10-code` inside the running container `modest_ganguly` (Python 3.10.12). `docker ps` showed that name, so check it before assuming it matches Lab 8's or Lab 9's.
- Nothing needs compiling. The Makefile only runs `testius`, `socrates` and `zip`.
- Before editing I ran `make test` on the untouched starter to see the failure first (Errors + fixes, first entry).
### Which course ideas the lab is built from
- **Barrier (APUE §11.6.8, pp. 418 to 419):** each thread waits until all cooperating threads have reached the same point, then they all continue. `pthread_barrier_init(count)` fixes the head count, and the last thread to call `pthread_barrier_wait` wakes the rest. This lab rebuilds that by hand, so `total_threads` plays the role of `count`.
- **Semaphore (Lecture 14 slide 14, APUE §15.10 pp. 581 to 582):** an unsigned counter plus a group of waiting threads. Wait decrements the counter if it is above 0 and blocks if it is 0. Post increments it. The same lecture slide 22 adds the property this lab leans on: a post is remembered even when nobody is waiting yet.
- **Python names (container `help(threading.Semaphore)`):** `Semaphore(value)` is `sem_init`, `acquire()` is `sem_wait`, `release()` is `sem_post`. The docs describe `acquire` as blocking when the counter is zero and `release` as waking exactly one blocked thread. `threading.Lock` is the mutex.
### Code: the constructor
1. `self.lock = threading.Lock()` guards `waiting_threads`, which the starter already declares. Lab text: "the lock protects reads/writes of the barrier's internal state".
2. `self.semaphore = threading.Semaphore(0)` is the gate. It starts closed (see quiz answer 1).
### Code: `wait()`
1. `lock.acquire()`, then `waiting_threads += 1`. The increment is a read, add and write, which is the lost-update race from Lecture 13, so it must sit inside the lock.
2. **Last arrival** (`waiting_threads == total_threads`): `semaphore.release()` once per other thread (`total_threads - 1` times), then `lock.release()`. It does not wait, because everyone else is already waiting for it.
3. **Every other arrival:** `lock.release()` first, then `semaphore.acquire()`.
4. I used explicit `acquire`/`release` and not `with`, as the lab hint says: the lock has to be dropped in the middle of the function, before the thread blocks, and `with` would only drop it at the end.
```python
# __init__
self.lock = threading.Lock()
self.semaphore = threading.Semaphore(0)
# wait
self.lock.acquire()
self.waiting_threads += 1
if self.waiting_threads == self.total_threads:
    for _ in range(self.total_threads - 1):
        self.semaphore.release()
    self.lock.release()
else:
    self.lock.release()
    self.semaphore.acquire()
```
The block is the real code without its comments.
### Why the lock is released before the thread blocks
This is the Lecture 14 deadlock lesson in a new place. Slides 7 and 8 list hold and wait as one of the four deadlock conditions, and the transcript works the example: in `queue_add`, if you `sem_wait` on the lock first and then on `slots`, a producer blocks on a full queue while holding the lock, and the consumers that would free a slot can never get the lock. The barrier has the same shape. A thread that blocked on the semaphore while holding `self.lock` would stop the threads that have not arrived yet from ever taking the lock to count themselves, so the last arrival never comes. Evidence: the hang in Errors + fixes.
### Why releasing the lock before `acquire()` does not lose the wake-up
Between `lock.release()` and `semaphore.acquire()` the last thread could arrive and post all its tokens before this thread has started waiting. With a condition variable that is a lost wake-up, because a signal with no waiting thread is thrown away (Lecture 14 slide 22 and the transcript; APUE Figure 11.15 on p. 416 avoids it by re-checking a predicate under the mutex). With a semaphore the post is kept as counter value, so the later `acquire()` finds a positive count and passes straight through. I tested this on purpose (Results). It is also the reason the course favors semaphores when the coordination is "a number" (slide 23).
### Quiz answers (3 total, 3 flipped)
1. **Initial value of the semaphore: `0`.** `acquire()` blocks while the counter is 0, and we want every early arrival to block until the last thread posts. The other choices are the initial values of different jobs. `1` is the mutex setting (Lecture 14 slide 19: a binary semaphore at 1 is "unlocked"; APUE p. 581: 1 is unlocked and 0 is locked), so the first thread to arrive would take the token and print `past` before the other nine had arrived. `N_THREADS` is the `slots` setting from the bounded queue (slide 21, `sem_init(&queue->slots, 0, MAX_SIZE)`), where it means "everything is free", so nobody would ever block. Here the semaphore is not guarding a resource. It starts at 0 like the `items` semaphore, which also begins with nothing available. "None of the Above" is wrong because 0 is on the list.
2. **Order in which threads get turns: random but the same on every run.** Nothing in the lecture makes thread order follow creation order. On 20 Oct: "Once pthread-create completes, we don't know which thread gets to run when". On 22 Oct: the same program can show 10 different behaviors depending on how the scheduler treats the threads. What happens in this program is more specific: each thread's first action is a sleep of `random.random() * MAX_SLEEP_SEC`, and `main` runs `random.seed(RAND_SEED)` before starting them, so the sequence of delays is the same on every run. I generated that sequence in the container and sorted threads by delay with thread `i` taking the `i`-th draw. It gives `6 2 7 1 8 3 5 9 0 4`, which is the order printed in `test_cases/output/sema_barrier.txt` and the order I saw in 30 of 30 runs. That rules out "creation order" (`0 1 2 ...`) and "reverse creation order" (`9 8 7 ...`). The choice I left is the one next to it, "no particular order", which is also true in the sense that `6 2 7 ...` looks arbitrary. I picked "random but consistent" because the question asks what you observe across multiple runs, and what I observe is an exact repeat. That pick is a judgment between two close options, made from the observations before I ran `make test-quiz`, and the hash check is what confirmed it. The caveat is that the draw happens inside each thread, so strictly it is the thread that reaches `random.random()` first that gets the first value. `Thread.start()` waits until the new thread has started (I checked the source in the container), which makes creation order the practical draw order, but I do not claim it is guaranteed.
3. **Order in which threads leave the barrier: no particular order.** After the last arrival posts 9 tokens, 9 blocked threads become runnable at the same moment and the scheduler decides who runs, the situation Lecture 14 and the 22 Oct transcript describe ("we can't change the scheduler"). The container's own docs say it directly for this class: `release()` wakes exactly one blocked thread and the order in which blocked threads are awakened "should not be relied on". The textbook's `sem_post` text (p. 582) also says only that a blocked process is awakened and promises no order. In a check of 30 runs I got 30 different leave orders, none equal to the arrival order `6 2 7 1 8 3 5 9 0 4` and none equal to its reverse `4 0 9 5 3 8 1 7 2 6`. One pattern is real but does not change the answer: thread 4, the last arrival, printed first in 30 of 30 runs, because it never blocks and goes straight on after posting. The other nine positions changed from run to run. This is why the test uses `sed` to blank only the index on `past` lines and leaves the `about to` lines alone.
`socrates` checks the file as one hash, so it confirms the three together and not each on its own.
### Reproduce in the course dev container
```sh
cd /workspaces/csci4061-fa26/Labs/lab10-code
make test                  # both tests, no network needed
python3 sema_barrier.py    # run the barrier by hand
make zip                   # cleans test_results, then creates lab10-code.zip
unzip -l lab10-code.zip
```
`make test-quiz` and `make test-code` run each half on its own. `make clean-tests` removes `test_results/`.
## Results
==Observed in `modest_ganguly` on 2026-11-16: `make test` passed 2/2 for 1.0/1.0.==
```text
testius test_cases/tests.json
== Lab 10
== Running 2/2 tests
Test 1) Quiz - QUESTIONS.txt: Passed
Test 2) Code - sema_barrier: Passed

Ran 2/2 Requested Tests
Passed 2/2 Tests
Total Score: 1.0/1.0
```
- Before the edits, `make test` gave `Test 1: Failed`, `Test 2: Failed` and `Total Score: 0.0/1.0`.
- 10 consecutive `make test` runs each printed `Total Score: 1.0/1.0`.
- `cmp -l QUESTIONS.txt.bak QUESTIONS.txt` lists exactly 3 differing bytes (offsets 3618, 4191, 4756), each a space (octal 40) turned into `X` (octal 130). They are lines 76 (`0`), 89 (the "random order, but that order is consistent" choice) and 99 (the "any particular order" leave choice). Neither edited file has a CR byte.
- **Arrival order:** 30 runs gave one identical `about to enter` sequence, `6 2 7 1 8 3 5 9 0 4`. Sorting the seeded draws gave the same sequence.
- **Leave order:** two separate sets of 30 runs each gave 30 different sequences (three samples: `4 1 5 6 3 9 7 0 2 8`, `4 8 9 0 1 2 3 5 6 7`, `4 6 2 3 8 1 7 5 9 0`). In the second set, 0 of 30 equaled the arrival order and 0 of 30 equaled its reverse. Thread 4 was first in 30 of 30 in the first set.
- **The barrier property itself:** in 20 runs, no `about to` line ever appeared after a `past` line. The direct tests with 1, 2 and 5 threads (a `Barrier(n)` driven from Python, each thread recording `in` and `out` events) passed: every `in` came before every `out`.
- **Delayed `acquire`:** with a `time.sleep(1.5)` added between `lock.release()` and `semaphore.acquire()` in a scratch copy, all 10 threads still got past the barrier and the property held, so a post that arrives before the wait is not lost.
- `Makefile` and `QUESTIONS.txt.bak` kept their md5 (`9b05b67f...`, `2fb88610...`), and `sema_barrier.py` is `2123` bytes after the edit (the starter's md5 was `91a12def...`). The two `Edit`s touched only the two `TODO` spots, so `thread_func` and `main` are unchanged by construction.
- `make zip` produced `lab10-code.zip` with 4 files plus the directory entry: `Makefile`, `QUESTIONS.txt`, `QUESTIONS.txt.bak`, `sema_barrier.py`. Extracting it into a temp folder gave byte-identical copies of all four, and `make test` there with `test_cases/` copied in gave `1.0/1.0`. SHA256 `482dcb54d679b6bd462ab41623a0ac0d0b8381a39fb483cf7436ec074b7a6c3e`. The lab folder holds only the submission files, the zip and `test_cases/`.
- **Not yet verified:** the Gradescope upload, the remote autograder score, group membership, attendance, and whether the autograder's machine produces the same arrival order (the test compares the `about to` lines literally, so it relies on the seeded order holding there too). I did not run the given test against the mutated copies below. Those were checked with my own "no arrival after a departure" script.
## Errors + fixes
==The given test diffs one run's output, so the stronger check is "no `about to` line after any `past` line" over many runs, and every mistake below fails that check in its own way.==
### The starter fails because `wait()` raises
- Problem: the untouched starter ran, but `make test` gave `0.0/1.0`. The quiz was blank, and `wait()` is `raise NotImplementedError`, so no thread can ever reach the `past` line.
- Fix: implement the constructor and `wait()`, and flip the three quiz answers.
- Why: the code test compares the whole output, so a thread that dies in `wait()` means the 10 `past` lines never appear. I did not capture the traceback, only the score.
- Evidence: baseline `Total Score: 0.0/1.0`, then `1.0/1.0` after the edits.
### Semaphore initial value `1` (reproduced on purpose, not in the submitted file)
- Problem: in a scratch copy with `Semaphore(1)`, the barrier leaked. One thread got past without waiting, and my check reported 9 threads printing `about to` after another thread had already printed `past`.
- Fix: `Semaphore(0)`.
- Why: a semaphore at 1 is the mutex setting. The first arrival's `acquire()` takes the one token and returns at once, so the gate is open for exactly one thread before anyone has posted.
- Evidence: `VIOLATION: 9 thread(s) arrived after another already passed`. The submitted version printed `ok`.
### Semaphore initial value `N_THREADS` (reproduced on purpose)
- Problem: with `Semaphore(total_threads)` the check again reported 9 late arrivals. No thread ever blocked.
- Fix: `Semaphore(0)`.
- Why: with 10 tokens in the bank, every `acquire()` succeeds immediately. This is the `slots = MAX_SIZE` setting of Lecture 14's queue, where a full count means "nothing to wait for".
- Evidence: the same 9-thread violation line.
### Blocking on the semaphore while still holding the lock (reproduced on purpose)
- Problem: with `self.semaphore.acquire()` placed before `self.lock.release()` in the else branch, the program never finished. My `timeout 12` ended it with exit code 124. I sent its output to a file I did not read, so I did not see which lines it printed.
- Fix: release the lock first, then block, as in the submitted code.
- Why: the first thread to arrive sleeps holding the lock, so the next thread blocks on `lock.acquire()` and never increments `waiting_threads`. The count never reaches 10, so nobody posts. This is the hold-and-wait deadlock of Lecture 14 slides 7 and 8 and the swapped-`sem_wait` example in the transcript.
- Evidence: `exit=124 (124 = hung)`.
### A `wait()` that does nothing
- Problem: in a scratch copy with `pass` as the body, my check reported that threads printed `about to` after others had already printed `past`.
- Fix: the real body.
- Why: it shows why the property to check is the order of the two kinds of lines, not that the program prints 10 of each. A no-op `wait()` also prints 10 of each.
- Evidence: `BAD (as expected)` from the check, `ok` for the submitted file.
### Not a bug: `4 past barrier` always comes first
- Problem: the first `past` line was thread 4 in all 30 runs, which looks like a fixed leave order and could make quiz answer 3 look wrong.
- Fix: none needed. Thread 4 is the last arrival, so it posts and keeps running without calling `acquire()`.
- Why: it is a consequence of the last thread not blocking, not of the scheduler picking an order. The 9 threads that did block left in different orders in every run.
- Evidence: leave position of thread 4 was 1 in 30 of 30 runs, and 30 distinct full sequences.
## Flashcards
#cards/csci4061
Why does a barrier's semaphore start at 0 when a semaphore used as a lock starts at 1?::A lock-style semaphore must let exactly one thread in at the start, so it begins at 1. A barrier gate must let nobody in until the last thread arrives, so it begins at 0 and the last arrival posts one token per waiting thread. Starting at 1 or `N` lets threads through early.
In a lock-plus-semaphore barrier, why must a thread drop the lock before it blocks on the semaphore?::Blocking while holding the lock stops the other threads from taking the lock to count themselves, so the count never reaches `N` and nobody posts. It is the hold-and-wait deadlock from Lecture 14, and the program hangs.
Why is it safe for the last thread to post before an early thread has reached `acquire()`, when a condition variable signal at that moment would be lost?::A semaphore keeps its count after a post, so the later `acquire()` sees a positive counter and returns. A condition variable signal with no waiting thread is discarded (Lecture 14 slide 22).
A threaded program with a seeded RNG prints its arrival lines in the same order on every run, but the leave lines in a different order each run. Why?::The arrival order comes from the seeded sleep delays, so it repeats. The leave order comes from 9 blocked threads becoming runnable together after the last post, and the scheduler picks among them, so it varies. The last arrival does not block and leaves first.
Why is "10 `about to` lines and 10 `past` lines" not enough to show a barrier works?::A `wait()` that does nothing prints 10 of each. The barrier property is ordering: no `past` line before the last `about to` line, which has to hold over many runs.
