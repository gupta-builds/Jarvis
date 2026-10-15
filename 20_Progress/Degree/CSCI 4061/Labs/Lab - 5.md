---
type: class
input_kind: lab
status: sprout
created: 2026-10-14
updated: 2026-10-14
area:
  - "[[UMN Board]]"
  - "[[CSCI 4061 Board]]"
deadline: 2026-10-14
tags:
  - "#class"
  - "#Lab"
next: "Upload lab05-code.zip to Gradescope before 11:59pm October 14, verify its autograder matches 1.0/1.0 locally, and confirm attendance was recorded."
---
# Lab - 5
==Create one shared result array before forking, let each child fill its own range, and wait for every child before the parent reads the results.==
## Goal
Compute all 40 squares with the requested number of worker processes, sharing their results with the parent and dividing work so worker loads differ by at most one element.
## Sources and scope
- The Canvas instructions pasted by the user give the deadline as October 14, 2026, 11:59pm. Attendance in the assigned lab section and a Gradescope submission are required. Labs allow open resources and collaboration in groups of up to four; one member submits and adds the others.
- Read all five pages of `D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/Labs/Lab 05.pdf`, including visual inspection of the shared-memory example and API slide. Read the actual `QUESTIONS.txt`, starter `square_numbers.c`, Makefile, test definitions, and expected output in `csci4061-fa26/Labs/lab05-code/`.
- Reviewed the existing dev container's mount, build/configuration, installed tools, lab/lecture/project directory inventory, Lab 1's fork/wait starter, and Lab 4's completed pipe implementation. Project 2 files were inventoried; they were not changed.
- [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 15|APUE Chapter 15]], especially section 15.9, supplies the existing textbook explanation of inherited anonymous mappings. [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8|Chapter 8]] explains fork/wait. The installed container's `mmap(2)` manual confirms shared versus private mapping behavior.
- This is Week 6 in [[CSCI 4061 Board]]'s schedule. The local lecture PDFs stop at Lec08, Week 4; Lec08 was checked and has no shared-memory coverage. No Week 5/6 lecture slides or transcripts were available to verify. [[20_Progress/Degree/CSCI 4061/Weekly/Week - 4|Week 4]] and [[20_Progress/Degree/CSCI 4061/Labs/Lab - 4|Lab 4]] are the preceding pipe material, rather than this lab's paired lecture capture.
## Procedure / key steps
### Quiz answers and reasoning
1. Select `Existing shared memory segments are inherited by the child when 'fork' is called`. Create the mapping first so the child inherits access. Ordinary writable globals and heap memory are private after fork; their addresses alone do not provide IPC.
2. Select `They both need to call 'shm_open' with the same 'name' argument`. Unrelated processes can open the same named shared-memory object and then map it. `shm_open()` supplies a descriptor; the mapping supplies memory access. This lab's related workers need only anonymous `mmap()`.
3. With floor-sized chunks and leftovers assigned to the final worker, select `The last worker will have a slightly larger chunk than the others`. For 40 elements and 3 workers, the sizes are 13, 13, 14.
4. With ceiling-sized chunks and a clipped final range, select `The last worker will have a slightly smaller chunk than the others`. For 40/3, the sizes are 14, 14, 12. For large worker counts, naïvely extending this formula needs additional empty-range handling.
5. Select `No, '5 / 4' yields '1' while '(float) 5 / 4' yields '1.25'.` Casting an operand before division changes the arithmetic; casting the already truncated result afterward cannot restore the fraction.
Only five answer-marker bytes changed from spaces to `X`; all other bytes in `QUESTIONS.txt` were preserved. This distribution has no `QUESTIONS.txt.bak`; it was not invented or added to the submission.
### Implementation choices
- Parse the worker count using `strtol()`. Reject missing, nonnumeric, partially numeric, nonpositive, out-of-range, and overflowing input before allocating memory or forking.
- Allocate `NUMBERS_LEN * sizeof(int)` bytes using `mmap(NULL, shm_size, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0)`. Check against `MAP_FAILED`. This call precedes every fork.
- Keep `numbers[]` as inherited read-only input. Each child writes its squares into the separate shared array.
- Use quotient and remainder to balance the work: `base = 40 / n_procs`, `remainder = 40 % n_procs`, `start = worker * base + min(worker, remainder)`, and `count = base + (worker < remainder)`. Worker `w` processes `[start, start + count)`.
- For 3 workers, the ranges are `[0,14)`, `[14,27)`, `[27,40)`, with sizes 14, 13, 13. For 41 workers, the first 40 get one element and the last gets zero. Every requested worker is still forked if resources permit. This is the implementation's choice; the quiz asks about different floor/ceiling policies.
- Each child computes only its range, unmaps its own view, and returns immediately. Returning prevents children from continuing the parent's fork loop or printing results.
- The parent creates all workers before entering its wait loop. It retries interrupted waits and checks normal termination plus exit status. Waiting inside the fork loop would serialize the computation.
- Disjoint writes avoid worker-to-worker conflicts; waiting for all children orders the parent's reads after completion. A mutex is unnecessary for this access pattern. Shared memory alone would not synchronize overlapping updates.
- Track successfully created children. A failed fork stops creation, but the parent still reaps existing workers, releases its mapping, and returns failure without printing incomplete results. Each process calls `munmap()` on its own view; a child's unmap does not erase the parent's mapping.
### Reproduce in the course dev container
The Windows course root is `D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/csci4061-fa26`, mounted at `/workspaces/csci4061-fa26`. Keep the existing `Labs/` placement, which is already used by previous labs.
```sh
cd /workspaces/csci4061-fa26/Labs/lab05-code
make test
make zip
unzip -l lab05-code.zip
```
`make test-quiz` and `make test-code` are available separately. `make zip` cleans the executable and test results, so a missing executable after packaging is expected; `make` rebuilds it.
## Results
Observed inside the existing Ubuntu 22.04 course container on October 14:
```text
gcc -Wall -Werror -g -o square_numbers square_numbers.c -lm
Test 1) Quiz - QUESTIONS.txt: Passed
Test 2) Code - square_numbers 1 worker: Passed
Test 3) Code - square_numbers 2 workers: Passed
Test 4) Code - square_numbers 3 workers: Passed
Test 5) Code - square_numbers 4 workers: Passed
Passed 5/5 Tests
Total Score: 1.0/1.0
```
- An independent arithmetic check compared every output value against the original array's squares for 1, 2, 3, 4, 6, 7, 13, 39, 40, 41, 64, and 100 workers. All passed. The range calculation covered indices 0 through 39 exactly once, with load difference at most one, for each count.
- Eight missing/invalid input cases returned failure without printing results. Twenty additional runs, ten each with 3 and 41 workers, produced identical correct output.
- `valgrind --trace-children=yes --leak-check=full --errors-for-leak-kinds=all --error-exitcode=99 --log-file=/tmp/lab05-valgrind.%p.log ./square_numbers 3` reported zero errors and zero heap bytes remaining for the parent and all three children. Allocation/fork failure branches were reviewed but were not fault-injected.
- Hash comparison confirmed only `QUESTIONS.txt` and `square_numbers.c` changed among the original files. The Makefile and all tests remain unchanged.
- Created `Labs/lab05-code/lab05-code.zip`. It contains the `lab05-code/` directory with `Makefile`, `QUESTIONS.txt`, and `square_numbers.c`; test fixtures and executables are excluded by the supplied Makefile.
- Verified zip integrity and byte-for-byte source equality, then extracted the actual archive into a temporary directory, supplied the unchanged tests, and reran `make test`: 5/5 passed, 1.0/1.0.
- Archive SHA256: `22b3c50b7befd7cf433339ceea4dc97a7df464ffad345058b1207fb3b40732ee`.
- Gradescope upload, remote autograder results, group membership, and attendance remain unverified. Local test completion does not establish those requirements.
## Errors + fixes
### A quiz marker matched repeated wording
- Problem: The first test run passed all four code tests but failed the quiz. An automated edit selected the smaller-final-chunk choice in the floor question as well as its larger-final-chunk choice, leaving the ceiling question unanswered.
- Fix: Restore the original text in memory and select exactly one answer within each question's boundary. Check that precisely five bytes differ, each a space changed to `X`.
- Why: Floor and ceiling questions repeat the same answer strings. Replacing the first matching phrase globally cannot identify the intended question.
- Evidence: The corrected file passed the quiz and full 5/5 suite, including the archive rebuild. An intermediate verification assertion also needed to account for the literal `(X)` already present in the instructions.
### The sandbox could not start PowerShell
- Problem: Initial read-only shell commands failed with `CreateProcessAsUserW failed: 5 (Access is denied.)`.
- Fix: Use reviewed elevated shell execution, then run Linux compilation and testing through `docker exec` in the existing course container.
- Why: Shell-launch permissions prevented inspection before any lab command ran; this was separate from the C implementation.
- Evidence: The reviewed reads succeeded, the existing course bind mount was confirmed, and the compiler and official test tools ran successfully inside that container.
## Practice for Project 2 and exams
Reconstruct the three-worker ranges without the code open, explain why `MAP_PRIVATE` would hide child results, and explain why one `wait()` cannot establish that all workers finished. These extend the fork/wait practice in [[20_Progress/Degree/CSCI 4061/Labs/Lab - 2|Lab 2]] and the IPC mechanisms in [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 15|Chapter 15]]. The Canvas lab description explicitly identifies shared memory and work partitioning as preparation for Project 2 part 2.
## Flashcards
#cards/csci4061
Why must this lab create a MAP_SHARED anonymous mapping before fork?::The workers inherit the same shared backing storage. Child writes to ordinary private memory would not update the parent's results.
How can 40 elements be divided among 3 workers with load difference at most one?::Use quotient 13 and remainder 1. Give the first worker 14 elements and the others 13: [0,14), [14,27), [27,40).
Why can Lab 5 use shared memory without a mutex?::Workers write disjoint elements, and the parent reads only after every worker has exited and been reaped. Shared storage by itself would not make overlapping updates safe.
