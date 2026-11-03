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
- Setup: the course container `cranky_pasteur` (Ubuntu 22.04, gcc 11.4.0, kernel `6.18.54.1-microsoft-standard-WSL2`) was already running. The host folder and `/workspaces/csci4061-fa26/Labs/lab08-code` are the same mount, so an edit made on the Windows path showed up in the container at once (checked with `md5sum` before and after).
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
- `make zip` produced `lab08-code.zip` with 6 files plus the directory entry: `Makefile`, `QUESTIONS.txt`, `QUESTIONS.txt.bak`, `queue.c`, `queue.h`, `threads_main.c`. Extracting it into a temp folder gave byte-identical copies of all six, and `socrates` on the extracted `QUESTIONS.txt` printed `All quiz answers correct.` SHA256 `4144d7f050730bbf5a33dbf3c94e4fda28f3aae3b8cea4a17211a10211b01c0e`.
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
- Problem: a scratch binary run without `setarch` printed `FATAL: ThreadSanitizer: unexpected memory mapping 0x649cfdc1c000-0x649cfdc1d000` and exited 66 before `main`.
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
