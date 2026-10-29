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
- `make zip` produced `lab07-code.zip` with 4 files plus the directory entry: `Makefile`, `QUESTIONS.txt`, `QUESTIONS.txt.bak`, `sum_files.c`. Extracting it into a temp directory gave byte-identical copies of all four, and `socrates` on the extracted `QUESTIONS.txt` printed `All quiz answers correct.` SHA256 `e212bc8a8e523b57cc36f8b12307bc73ddc7f248d0af991a3ad0294ed1f1a1f3`.
- **Not yet verified:** the Gradescope upload, the remote autograder's score (it runs on a different machine, so the TSAN startup problem below may not appear there, but I have not seen it), group membership, and attendance.
## Errors + fixes
### TSAN aborts at startup: `unexpected memory mapping`
- Problem: `make test` failed test 2. `./sum_files` printed `FATAL: ThreadSanitizer: unexpected memory mapping 0x...-0x...` and exited 66 before `main` ran. An empty `int main(void){return 0;}` compiled with `-fsanitize=thread` failed identically, so the program under test was not the cause.
- Fix: run under `setarch x86_64 -R` (disables address-space randomization for that process and its children), e.g. `setarch x86_64 -R make test`. No system setting changed.
- Why: TSAN reserves fixed shadow-memory ranges and aborts if the kernel maps something inside them. Here the kernel is `6.18.54.1-microsoft-standard-WSL2` with `vm.mmap_rnd_bits = 32` and gcc 11.4's TSAN runtime. Turning ASLR off made the empty program run, which fits an ASLR-entropy mismatch. That is the explanation I am confident in from the evidence; I did not test the other known remedy, lowering `vm.mmap_rnd_bits` to 28 on the WSL VM.
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
