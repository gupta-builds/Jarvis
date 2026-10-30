---
type: class
class_kind: project
project_role: companion
status: sprout
created: 2026-10-30
updated: 2026-10-30
tags:
  - class
  - project
area:
  - "[[CSCI 4061 Board]]"
related:
  - "[[20_Progress/Degree/CSCI 4061/Projects/Project - 2 Assignment|Project - 2 Assignment]]"
  - "[[20_Progress/Degree/CSCI 4061/Projects/Project - 2 Quiz|Project - 2 Quiz]]"
next: "Open Project - 2 Assignment's Chosen Project steps and implement against this map. Skim 'Known conflicts and gaps' first; the starter-code drift can fail the build."
---
# Project - 2 Implementation
This note holds no solutions. It answers one question for every piece of Project 2: where in the course material is the thing I need, and what exactly does that source say. The steps to follow live in [[20_Progress/Degree/CSCI 4061/Projects/Project - 2 Assignment|Project - 2 Assignment]] under Chosen Project. Every project task there is built from a mechanism the lectures and labs already taught, and the textbook is the authority behind them. Page numbers for APUE are the book's printed pages (PDF page = printed page + 34).

## How to read the citations
- **Lec N, slide k** is the course PDF in `Lecture/Week - X/LecNN.pdf`; the slide number is the footer number, not the PDF page.
- **Transcript Oct D, line k** is `Lecture/Transcripts/Week 4 - 8/en-CSCI 4061-10 October D Lecture (multi-source).txt`.
- **lectureNN-code/file.c** is under `csci4061-fa26/Lecture/`; **labNN-code** is under `csci4061-fa26/Labs/`.
- **APUE p. N** is *Advanced Programming in the UNIX Environment*, 3rd ed., read through MinerU from the PDF.
- The lecture and lab code that already runs is the closest thing to a model answer for each technique. The professor's own transcripts say Project 2 questions come from these exact exercises ("all these steps to prep you for project two", Oct 13 transcript, line 551; "you will have a reason to use arrays of pipes in project two", Oct 6, line 490).

## Source inventory
Registered in [[CSCI 4061 Board]] means the path appears in that note. Only the root `CSCI 4061` folder is named there today.

| Path (under `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\`) | What it holds | Read for this note | In the Board |
|---|---|---|---|
| `csci4061-fa26\Projects\proj2-code` | Working copy: 10/14 starter drop, EDIT files still stubs | Every file | No |
| `csci4061-fa26\Projects\proj2-original` | Revised starter, copied 2026-10-30, never edit | Every file | No |
| `csci4061-fa26\Projects\proj1-code`, `proj1-original` | Project 1 swish, solved | Used as the style and pattern reference through [[20_Progress/Degree/CSCI 4061/Projects/Project - 1 Code\|Project - 1 Code]] | No |
| `Lecture\Week - 1` to `Week - 8` | Slides Lec01 to Lec15 | Lec08 to Lec14 fully, Lec15 headings; Lec01 to Lec07 only through the existing weekly notes | No |
| `Lecture\Transcripts\Week 4 - 8` | 10 transcripts, Sep 29 to Oct 29 | Oct 1, 6, 13 (shm_open half), 15, 20 fully; Oct 22, 27, 29 only searched | No |
| `Lecture\Transcripts\Week 1 - 3` | 6 transcripts | Not read (fork, files and signals; covered by weeks 1 to 3) | No |
| `csci4061-fa26\Lecture\lecture01-code` to `lecture13-code` | Professor's example programs | Pipes, shared memory, Python, threads folders in full | No |
| `csci4061-fa26\Labs\lab01-code` to `lab07-code` | Lab starter plus the solved versions | Labs 4, 5, 6, 7 in full | No |
| `Labs\*.pdf` | TA slide decks | Lab 04 read; Labs 05 to 07 are covered by [[20_Progress/Degree/CSCI 4061/Labs/Lab - 5\|Lab - 5]], [[20_Progress/Degree/CSCI 4061/Labs/Lab - 6\|Lab - 6]], [[20_Progress/Degree/CSCI 4061/Labs/Lab - 7\|Lab - 7]] | No |
| `Textbook\Advanced Programming in the UNIX Environment, 3rd Edition.pdf` | APUE | Sections listed in the maps below | Textbook named, not the PDF path |
| `Midterm\*.pdf` | Midterm 1 practice | Not relevant to Project 2 | No |

Stale vault notes: [[20_Progress/Degree/CSCI 4061/Weekly/Weekly Board|Weekly Board]] stops at Week 4 (Lec07, Lec08); no Week 5 to 8 note exists even though Lec09 to Lec15 and ten transcripts are on disk. [[20_Progress/Degree/CSCI 4061/Labs/Lab - 5|Lab - 5]]'s "Sources" paragraph still says slides stop at Lec08. [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]] has no chapters for 11, 12 or 14.

## Starter-code facts the spec does not state
These come from reading the files and disassembling the `.o`, not from Canvas.

### `run_command()` (inside `swish_funcs_provided_x86_64.o`)
Recovered with `nm`, `strings` and `objdump -d` in the course image (gcc 11.4.0, Ubuntu 22.04, Python 3.10.12). It also exports `tokenize`.
- It scans the **whole** `tokens` vector it is handed. It looks for `<` (accepted only if its index is above 0), then `>`, and if no `>` exists, `>>`. Passing the full pipeline instead of one command's slice would make later commands see the first command's `<`. This is why the spec says to split tokens per command.
- Input redirect: `open(path, O_RDONLY)`, `dup2` onto fd 0, `close`. Failure prints `perror("Failed to open input file")` and returns -1.
- Output redirect: flags are `O_WRONLY|O_CREAT|O_TRUNC` for `>` and `O_WRONLY|O_CREAT|O_APPEND` for `>>`, mode 0600. Failure prints `perror("Failed to open output file")`.
- `argv` for `execvp` is the tokens before the first redirect token, copied into a fixed stack array that holds 10 words plus the terminating NULL (matches `MAX_ARGS 10` in `swish_funcs.c`). A command longer than that is outside the contract.
- `execvp` failure prints `perror("exec")` and returns -1. On success it never returns.
- It does not touch pipe descriptors, does not call `setpgid`, and does not fork. Closing every unused pipe end is therefore the caller's job.

### `string_vector.c` behaviors that matter
- `strvec_slice(src, dest, start, end)`: `start` is clamped to 0, `end` to `length`; it calls `strvec_init(dest)` itself, so never pass an already-initialized vector. If an `add` fails midway it returns -1 without clearing, so a failed slice still needs `strvec_clear`. `end` is exclusive.
- `strvec_num_occurrences`, `strvec_find`, `strvec_find_last`, `strvec_take` (frees elements from `n` onward), `strvec_get` (NULL out of range), `strvec_clear` (frees everything; the vector must be re-`init`ed to reuse).
- `strvec_init` returns **1** on failure (not -1) although the header says -1. Compare with `!= 0`, not `== -1`.

### `hadamard_utils.c`
- `read_matrix_from_file` uses `fopen`, then `fread` for the two `unsigned` dimensions and for `rows*cols` ints (binary I/O, APUE 5.9, p. 156). Size is computed as `unsigned`, so the products in the 1024x1024 case fit (1 048 576 elements, 4 194 304 bytes).
- `sh_mem` nonzero: `mmap(NULL, size, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_ANONYMOUS, -1, 0)`. Zero: `malloc`. The file starts with `#define _GNU_SOURCE`, which is why `MAP_ANONYMOUS` compiles. Your own shared-memory file already starts with the same define.
- `print_matrix` uses `printf`, so output goes through C stdio buffering, not Python's.
- Revised version reports failures with `perror` and returns `NULL`; the old one set Python exceptions. See drift table in the Assignment.

### Build facts
- `hadamard.cpython-310-x86_64-linux-gnu.so` is rebuilt by `pip install -e .` only when `hadamard_pipe.c`, `hadamard_shmem.c` or `hadamard_threads.c` change (Makefile dependency list), not when `hadamard_utils.c` does.
- `setup.py` passes no `-pthread` or `-lpthread`. Lecture 12's Makefile compiles with `-pthread`. Whether `pthread_create` links inside the extension without it is untested (Ubuntu 22.04's glibc 2.35 carries the pthread functions in libc, so it should). No worker touches the Python API, which is what makes threads safe inside an extension.
- Tests run through `testius test_cases/tests.json` (installed in the image). Part 1 marks every test `use_valgrind: true`.

## Resource map by task

### A. Part 1: pipe array, descriptor discipline, `dup2`
| Need | Best source | What it gives |
|---|---|---|
| The array-of-pipes layout (read end `2*i`, write end `2*i+1`) and `pipe(pipe_fds + 2*i)` | Lec08, slide 26; Lec09, slide 6; Lec10, slide 19; **lecture09-code/multi_pipes.c** | The exact indexing the project uses |
| Why the parent creates all pipes first and forks after | Oct 6 transcript, lines 162-168 and 289-302 | Children inherit both ends; the parent cannot close early or children lose them |
| What a child must close | Oct 6, lines 184-225; multi_pipes.c lines 58-75 | In that exercise, all read ends and all write ends but one. In swish, **all** pipe ends once the needed ones are duplicated |
| What the parent must close, and why before reading | Oct 6, lines 326-342; Oct 1, lines 713-731; Lec08 slides 9-10, 17 | An open write end held by the reader means `read` never returns 0 |
| Read/write behavior table (six cases) | Lec08, slides 11-16; APUE p. 536-537; Lab 04 slide 3 | Block, return 0, `SIGPIPE`, `EPIPE` |
| `dup2(pipe_fd, STDIN_FILENO)` and `STDOUT_FILENO` | Lec08, slide 18; Lec09, slide 3; **lab04-code/pipeline_commands.c**; APUE 15.2 Fig 15.6, p. 538-539; APUE 3.12, p. 79-80 | One pipe, two processes, `dup2` then `exec`. Textbook rule: compare the two descriptors before `dup2` plus `close`, because equal descriptors would close the only copy |
| Why close the extra copy after `dup2` | APUE p. 539 ("don't need this after dup2"); Lab 4 note | The duplicate keeps the pipe alive otherwise |
| Why the process that execs must close every other pipe end | Lec08 slide 10 ("close communicates your intentions") | Each unclosed end is a phantom reader or writer |
| The six-command, five-pipe picture | Lec08 slide 19; Lec09 slide 4; Assignment image | The same pattern Project 2 extends to seven commands |
| Shell fork-exec skeleton to reuse | [[20_Progress/Degree/CSCI 4061/Projects/Project - 1 Code\|Project - 1 Code]], Task 2 to 4 section; lecture03-code/mini_shell.c; lecture04-code/fork_io.c | Same child-exits-on-failure rule |
| Why a child must `exit` instead of returning | Oct 1, lines 855-880; Oct 6, lines 169-178 | Returning would run a second copy of the shell loop |

### B. Part 1: splitting tokens into commands
| Need | Source |
|---|---|
| Counting pipes and commands | `strvec_num_occurrences` in `string_vector.h`; Quiz answers 4 and 6 in [[20_Progress/Degree/CSCI 4061/Projects/Project - 2 Quiz\|Project - 2 Quiz]] |
| Extracting one command's tokens | `strvec_slice` (start inclusive, end exclusive); Quiz answer 7 |
| Finding the pipe-character tokens | `strvec_find`, `strvec_find_last`, `strvec_get` |
| Pointer arithmetic over `int *` | [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Pointers and Addresses\|Pointers and Addresses]], [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Dynamic Memory\|Dynamic Memory]] |
| Freeing the descriptor array in children too | Oct 6, lines 249-262 (`malloc` copies exist in every child) |

### C. Part 1: waiting, errors, and what hangs
| Need | Source |
|---|---|
| Reap every child, check status macros | APUE 8.6, p. 238-239 and Fig 8.4 (`WIFEXITED`, `WEXITSTATUS`); lecture08-code/single_pipe.c lines 97-104 |
| Why a missing `close` hangs the pipeline | Oct 1 transcript, lines 713-731; Oct 6, lines 326-334 |
| Why `head` in the middle breaks | Assignment "SIGPIPE caveat"; Lec08 slide 15; APUE p. 537 |
| Pipe capacity and why you do not rely on it | Lec08 slide 7 (16 pages = 65 536 bytes); Oct 1, lines 429-444 |
| Cleanup on `pipe` and `fork` failure | multi_pipes.c lines 32-41 (pipe fails mid-array), 46-56 (fork fails mid-loop); single_pipe.c lines 33-40 |

### D. Part 2: dividing the work
| Need | Source |
|---|---|
| The exact balanced split | **lab05-code/square_numbers.c** (`base`, `remainder`, `start = worker*base + min(worker, remainder)`, `count = base + (worker < remainder)`); [[20_Progress/Degree/CSCI 4061/Labs/Lab - 5\|Lab - 5]] |
| Floor versus ceiling chunking | lab05 `QUESTIONS.txt` quiz: floor makes the last chunk larger, ceiling makes the last smaller; lecture12-code/array_threads_v1.c (last thread absorbs the remainder) |
| Half-open `[start, stop)` convention | lecture12-code/array_threads_v1.c comment "elements in index interval [start, stop)"; Lec12 slide 7 (8 threads, 100 elements, generalize to n threads, m elements) |
| Integer versus floating division | lab05 `QUESTIONS.txt` (`5 / 4` versus `(float) 5 / 4`) |
| Why a `min()` helper exists | `hadamard.h`; it clamps `start + chunk` for the last worker in a ceiling split |
| Zero or too many workers | Not in any source. Zero divides by zero. More workers than elements gives empty chunks (the largest test is 32 workers on 60 501 elements) |

### E. Part 2: processes and one shared pipe
| Need | Source |
|---|---|
| Many writers on one pipe, parent reading | Oct 1, lines 769-1008 and **lecture08-code/single_pipe.c**; Lec09 slide 7 |
| Why one pipe and not many | Oct 6, lines 462-490; Lec09 slide 7 ("use a single pipe whenever you can") |
| Why writes do not interleave | Oct 1, lines 972-1006; Lec08 slide 24 (POSIX 512 bytes, Linux 4096); APUE p. 537 (`PIPE_BUF`). A `struct element` is 8 bytes |
| Tagging each value with its index | Oct 6, lines 467-482 and Lec09 slide 7 (the `pid` plus `data` struct idea) |
| `read` loop until 0 | Lec08 slide 17; single_pipe.c line 77; APUE 3.7, p. 71 (a pipe read returns only what is available) |
| End-of-file needs every writer closed | APUE p. 536 rule 1 (writers can be many, EOF only when none remain) |
| Children free their copy of `A` and `B` | Oct 6, lines 249-262; APUE 8.3, p. 229 (copy-on-write) |
| Child exits instead of returning into Python | Oct 1, lines 855-880; Assignment ("make sure to clean up and call `exit()`") |
| `exit` versus `_exit` | APUE 8.5, p. 236-237: `exit` runs handlers and flushes stdio, `_exit` does not. Relevant because the child shares a Python process image |
| Large data through a small pipe | Lec08 slide 7 ("read data as soon as it is available"); Oct 1, lines 429-444. The 1024x1024 case sends 8 MB through a 64 KB buffer |
| What `SIGPIPE` does inside Python | Lab 04 slide 3 (ignored signal gives `EPIPE`); Oct 15, lines 96-102 (Python installs many handlers at startup). Not verified for `SIGPIPE`; check inside the container |
| Polling several pipes (not needed here) | Lec10 slides 20-27, lecture10-code/polling.c. Skip: one pipe means one `read` loop |

### F. Part 2: processes and shared memory
| Need | Source |
|---|---|
| `mmap` with `MAP_SHARED` and `MAP_ANONYMOUS` for related processes | Lec09 slides 10-12; lecture09-code/shmem_example.c; Oct 6, lines 541-693 |
| Every argument explained | Lec09 slide 10; Oct 6, lines 558-593 |
| Array shared with children, child writes index `i`, parent waits then reads | **lecture09-code/shmem_exercise_v1.c**; **lab05-code/square_numbers.c**; Oct 6, lines 699-856 |
| Why `wait` is a correctness requirement here | Oct 6, lines 645-662 and 810-823; Lec09 slide 31 |
| Mappings survive `fork` | APUE 14.8, p. 527 ("inherited by a child across a fork, not across an exec"); APUE 8.3, p. 232 (inherited properties list includes memory mappings and attached shared memory) |
| Anonymous mapping in the textbook | APUE 15.9, p. 576-578 (`/dev/zero` first, then `MAP_ANON`; Linux accepts `MAP_ANONYMOUS`) |
| Every process unmaps, even ones that only inherited | Oct 6, lines 798-805; shmem_exercise_v1.c lines 42-45; `munmap` does not follow `close`: APUE p. 528 |
| The third segment `C` | Same `mmap` call as inside `read_matrix_from_file` (`hadamard_utils.c`); size `rows*cols*sizeof(int)` |
| Exit codes and status checking | Quiz in lab05; lab05-code/square_numbers.c lines 71-85 (reaps every started worker, checks `WIFEXITED` and `WEXITSTATUS`) |
| `shm_open` route (not required) | Lec09 slides 15-23, Lec10 slides 4-12, lecture10-code/shmem_exercise_v2.c, Oct 13 lines 196-435. The project hands you anonymous shared memory, so this is background for the oral exam only |
| Each worker owns a disjoint range, so no lock | Lec09 slide 31; Oct 6, lines 756-766 |

### G. Part 2: threads
| Need | Source |
|---|---|
| Thread API vs process API | Lec12 slide 19 (fork/pthread_create, waitpid/pthread_join, exit/pthread_exit); Oct 20, lines 533-547; APUE 11.4-11.5, p. 385-389 |
| `pthread_create` arguments | Lec12 slides 21-22; Oct 20, lines 547-570; APUE p. 385-386 |
| Passing several values through `void *` | Lec12 slide 22; Oct 20, lines 456-489 and 899-975; **lecture12-code/pthreads_exercise_v2.c** (struct holding inputs and a result pointer); the Assignment's `struct thread_args` |
| Casting the `void *` back | Oct 20, lines 493-517; Lec12 slide 24 |
| The args struct must outlive the thread | APUE 11.5, p. 390-391 (Fig 11.4, stack-allocated structure goes stale); lecture12-code stores `args_t thread_args[NUM_THREADS]` in `main`'s frame, which is valid only because `main` joins before returning |
| `pthread_join` and ignoring the return value | Lec12 slide 23; APUE p. 389 (`rval_ptr` may be NULL) |
| Error codes instead of `errno` | Lec12 slides 24-25; Oct 20, lines 595-632; APUE p. 386 and 1.7, p. 14-15; lab07 `QUESTIONS.txt` (use `strerror`) |
| No guarantee which thread runs first | APUE p. 386; Oct 20, lines 641-656 |
| Creation failure partway | lecture12-code/pthreads_exercise_v2.c lines 51-60 (join the ones already started, free, return); lab07-code/sum_files.c lines 70-95 |
| Why a lock is needed in lecture and lab but not here | Lec13 slides 3-11 and lecture13-code/array_threads_sum_fixed.c (every thread updated one `sum`); Lab 7. Here each thread writes only its own indexes |
| Heap shared by all threads | Lec12 slides 11-13; Oct 20, lines 141-165; APUE 11.2, p. 384 |
| Every thread has its own `errno` | APUE 1.7, p. 14-15 and 11.2, p. 384 |

### H. Part 2: the Python extension
| Need | Source |
|---|---|
| Overall pattern (unbox, work, box) | Lec11 slide 20; Oct 15, lines 715-732 |
| Required function shape (two `PyObject *` in, one out) | Lec11 slide 21; **lecture11-code/hello_extension.c**; Oct 15, lines 636-700 |
| `PyArg_ParseTuple` and its format letters (`s` char pointer, `I` unsigned int) | Lec11 slide 22 (table); Oct 15, lines 794-812; the starter's `"ssI"` |
| `Py_RETURN_NONE` versus returning `NULL` | Lec11 slide 20-21; Oct 15, lines 653-670 |
| Setting the exception before returning `NULL` | Lec11 slides 24-26; Oct 15, lines 849-876 |
| The three setters: `PyErr_SetString`, `PyErr_Format`, `PyErr_SetFromErrno(PyExc_OSError)` | Lec11 slides 24-26; Lab 6 quiz; [[20_Progress/Degree/CSCI 4061/Labs/Lab - 6\|Lab - 6]] |
| Memory failure | `PyErr_NoMemory()` in inc_list.c line 48 and square_root.c line 45 |
| Reference counts | Lec11 slides 29-31; Oct 15, lines 913-998; Lab 6 quiz. The project returns only `None` and creates no Python objects, so no reference handling is needed |
| Module and method table | Provided `hadamard_extension.c` (identical in format to lecture11-code/inc_list.c and lab06-code/square_root.c) |
| Build mechanics | `setup.py`, `pip install -e .`; lecture11-code/Makefile; lab06-code/Makefile |
| How Python gets to run C | Oct 15, lines 502-545; Lec11 slides 15-17 |
| Calling from Python | `hadamard_main.py` (the driver); lecture11-code/inc_list_main.py |
| Why a child must never return into Python | Same rule as shell children: a returning child becomes a second Python interpreter |
| Python's own pipe-and-fork example (comparison only) | lecture11-code/python_pipes.py; Oct 15, lines 195-266 |

### I. Error checking and cleanup (10% plus oral)
The grader reads for a check on every call that signals failure and for cleanup on each failure path. Use this as a worklist, not a solution.

| Call | Failure signal | Where the error is reported | Source |
|---|---|---|---|
| `malloc`, `calloc` | `NULL` | `PyErr_NoMemory()` in Part 2; nothing extra in Part 1 | Lec11 slide 31 |
| `pipe` | -1, `errno` | `perror("pipe")` in Part 1; `PyErr_SetFromErrno` in Part 2 | APUE 1.7, p. 14-15 |
| `fork` | -1 | same; unwind (close fds, reap children started so far) | multi_pipes.c lines 46-56 |
| `dup2`, `close` | -1 | same | Lab 4 solution |
| `read`, `write` | -1, or a short count | same; also check the count | APUE 3.7-3.8, p. 71-72 |
| `wait`, `waitpid` | -1; abnormal status | same; inspect `WIFEXITED` and `WEXITSTATUS` | APUE Fig 8.4, p. 239 |
| `mmap` | `MAP_FAILED` | `PyErr_SetFromErrno` | Lec09 slide 12 |
| `munmap` | -1 | same | lecture09-code/shmem_example.c lines 33-35 |
| `pthread_create`, `pthread_join` | nonzero return, **not** `errno` | `strerror(code)` message | Lec12 slide 24; lab07 quiz |
| `read_matrix_from_file` | `NULL` | Python exception if none is set yet | `hadamard_utils.c` |
| `PyArg_ParseTuple` | 0 | already set, return `NULL` | Lec11 slide 22 |
| `strvec_slice` | -1 | free partial results with `strvec_clear` | `string_vector.c` |
| `run_command` | -1 | child exits nonzero | Assignment, Part 1 |

APUE p. 15 gives the rule behind all of this: `errno` is meaningful only right after a call that reported an error, and functions never reset it to 0.

### J. Verifying the work
| Need | How |
|---|---|
| Run an unlisted thing the same way the autograder does | `make test-part1`, `make test-part2` from the root; `make test testnum=N` inside a part |
| Compare Hadamard output | `test_cases/output/mat_NN.txt` versus `python3 hadamard_main.py <a.bin> <b.bin> <mode> <n>` |
| Thread mode has no provided test | Run it on all nine matrices with the nine worker counts above and diff against the same expected files |
| Edge worker counts | 1 worker, workers greater than rows, workers that do not divide the element count (matrices 02, 05, 07, 08) |
| Redirection combinations in swish | Six forms in the Assignment, plus a pipeline of 4 or more commands (the gatsby example) |
| Descriptor and memory leaks | Part 1 tests already run under valgrind; for hand runs use `valgrind --track-fds=yes ./swish` |
| Race and thread bugs | Lab 7 used `-fsanitize=thread`; lectures 12 and 13 explain the output |
| Reading a crash | Lab and project guidance says use `gdb`, not the tests, to debug |

### K. Oral exam question bank (answer from the sources, not from the code)
- Why does the parent close the write end before reading? (Lec08 slides 9-10, 17; Oct 1, lines 713-731)
- Why does every child close the other pipe ends? (Oct 6, lines 184-225)
- What does the pipe buffer do when the parent is slow? (Lec08 slide 7; Oct 1, lines 636-644)
- Why is sending a `struct element` safe from several writers? (Lec08 slide 24; APUE p. 537)
- Why include the index in the struct? (Oct 6, lines 467-482)
- What would break if the parent called `wait` before reading the pipe? (Lec08 slide 7)
- Why is `wait` needed in the shared-memory version but not for correctness in the pipe version? (Oct 6, lines 313-325 and 645-662)
- Who unmaps a shared segment? (Oct 6, lines 798-805)
- Why does a child call `exit`, and why not `return`? (Oct 1, lines 855-880)
- What happens to `A` and `B` after `fork`? (APUE 8.3, p. 229; Oct 6, lines 249-262)
- Why is no mutex needed in the threaded version when Lab 7 needed one? (Lec13 slides 3-11)
- How does a thread receive several arguments and report an error? (Lec12 slides 22-25)
- What does returning `NULL` do versus `Py_RETURN_NONE`? (Lec11 slides 21, 24)
- What is `PyErr_SetFromErrno` for, and why not for `pthread_create`? (Lec11 slide 26; Oct 20, lines 595-632)
- How is the work divided when elements do not divide evenly? (Lab 5; Lec12 slide 7)
- Why do the number of pipes equal commands minus one? (Lec08 slide 26; Quiz answer 4)

## Known conflicts and gaps
- **Two starter versions.** `proj2-code` and `proj2-original` differ in part 2 (Assignment drift table). Treat `proj2-original` as the version the autograder will build against. Not confirmed with Gradescope or Canvas; check the starter-code link if Gradescope fails to compile.
- **`end` semantics.** The pipe worker's comment says `end` is the "last element", the thread struct says "second element", the shared-memory worker says "last element". The lectures and `min()` suggest half-open `[start, end)`. Pick one, apply it identically in all three files and write the convention in a comment.
- **Struct sizes and signedness.** `struct element` has `unsigned idx` and `int value`; `read_matrix_from_file` returns `int *`. Mixing `unsigned` and `int` in loops compiles under `-Wall` but breaks past 2^31; not an issue for the provided sizes.
- **`SIGPIPE` under Python.** Textbook and slides say an ignored `SIGPIPE` turns the write failure into `EPIPE`. Whether the embedded interpreter ignores it for forked children was not tested.
- **`exit()` in a forked child of Python.** The assignment says to call `exit()`; APUE 8.5 shows it flushes stdio and runs handlers. Verify by comparing stdout redirected to a file against the expected output.
- **Not read.** Lec01 to Lec07 slides and the Week 1 to 3 transcripts (earlier-week material already summarized in the weekly notes); transcripts Oct 22, 27, 29 (synchronization and networking); the Lab 05 to 07 PDFs (covered by the three lab notes above); Kleppmann.
- **Dev container.** It was stopped when checked, so no EDIT file has been compiled yet. All claims about behavior come from source text, except the `run_command` facts, which come from the compiled object.
