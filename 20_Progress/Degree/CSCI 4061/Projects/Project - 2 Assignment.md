---
type: class
class_kind: project
status: sprout
created: 2026-10-30
updated: 2026-10-30
tags:
  - class
  - project
area:
  - "[[UMN Board]]"
  - "[[CSCI 4061 Board]]"
deadline: 2026-10-30
related:
  - "[[20_Progress/Degree/CSCI 4061/Projects/Project - 2 Implementation|Project - 2 Implementation]]"
  - "[[20_Progress/Degree/CSCI 4061/Projects/Project - 2 Quiz|Project - 2 Quiz]]"
  - "[[20_Progress/Degree/CSCI 4061/Weekly/Week - 4|Week - 4]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 15|Chapter - 15]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8|Chapter - 8]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter - 3]]"
next: "The four EDIT files are implemented and verified in the course image (see Work Log). Run make test-part1, make test-part2 and make zip once more in your own dev container, read the four files for the oral exam, then upload proj2-code.zip to Gradescope before 11:59pm tonight (2026-10-30)."
---
# Project - 2 Assignment
## Overview
Project 2 has two independent parts that share one rule set: edit only the four files marked EDIT, check every return value that can fail, and expect an individual oral exam afterward. Part 1 adds `|` pipelines to the `swish` shell from [[20_Progress/Degree/CSCI 4061/Projects/Project - 1 Code|Project - 1]]. Part 2 computes the Hadamard (element-wise) product of two matrices in parallel three ways (child processes plus one shared pipe, child processes plus shared memory, threads) and exposes all three to Python as a C extension. Worth 6.25% of the course grade. Collaboration with one partner is allowed; anyone outside the team is prohibited. See the syllabus for the integrity policy.

> [!DANGER] Due tonight
> Final submission is **11:59pm Friday 2026-10-30 on Gradescope**. Late penalty from [[CSCI 4061 Board]]: up to 24h late keeps 90% of earned credit, up to 48h keeps 80%, beyond 48h is 0%. Canvas states that no submission is accepted more than 48 hours late. The project grade is the **latest** submission, not the best one, so do not resubmit a worse build. The project quiz closed 10/16; its key is in [[20_Progress/Degree/CSCI 4061/Projects/Project - 2 Quiz|Project - 2 Quiz]].

> [!WARNING] The starter code on disk is not one version
> `proj2-code` still holds the 10/14 starter drop. `proj2-original` (copied 2026-10-30 and never to be edited) holds a revised drop. They differ in six part-2 files. Section "Starter code drift" below lists every difference. The autograder replaces every non-EDIT file with its own copy, so write the EDIT files to work against the revised non-EDIT files (`-Wall -Werror` on the extension build, `perror` instead of Python errors inside `read_matrix_from_file`).

### Deadlines and grading
| Item | Weight | Detail |
|---|---|---|
| Project quiz | 10% | Canvas, individual, multiple attempts, due 10/16 (past) |
| Automated tests | 40% | Provided tests plus hidden tests Gradescope runs against your code |
| Oral exam | 40% | Short slot with a TA, individual even on a team, signed up for after the due date |
| Error checking | 10% | TAs read the code for checks on every C library or system call that can fail |

The error-checking line is the one the spec bolds: "properly check for and deal with errors whenever using a C library function that may indicate an error with its return value." The Project 1 convention applied: one point lost per missed check or missed cleanup step. Passing the visible tests is not a completion guarantee, because hidden tests exist for both parts. Local test output is not the debugging tool; run the program by hand and use `gdb`. The Gradescope autograder is the final authority on the automated 40%.

### Build commands
Three Makefiles exist: the project root, `part1/` and `part2/`.

| Where | Command | Effect |
|---|---|---|
| part1, part2 | `make` | Compile everything |
| part1, part2 | `make clean` | Remove compiled files |
| part1, part2 | `make clean-tests` | Remove files produced by tests |
| part1, part2 | `make test` | Run every test case |
| part1, part2 | `make test testnum=5` | Run test case 5 only |
| root | `make`, `make clean`, `make clean-tests` | Same, for both parts |
| root | `make test-part1`, `make test-part2` | Run one part's tests |
| root only | `make zip` | Build `proj2-code.zip` for Gradescope (the part Makefiles print an error if you try) |

Tests are known to work only inside the 4061 Docker container. `make zip` excludes `test_cases/` and `.git/`, warns above 10 MB and warns above 256 files.

### Starter code
Part 1 (`part1/`):

| File | Role | Notes |
|---|---|---|
| `Makefile` | Build | Links `swish_funcs_provided_$(ARCH).o` (x86_64 or aarch64) |
| `string_vector.h` / `.c` | Provided | Vector of strings, with Project 2 additions |
| `swish.c` | Provided | CLI loop; no longer editable in this project |
| `swish_funcs.h` | Provided | Declares `tokenize`, `run_command`, `run_pipelined_commands` |
| `swish_funcs_provided.o` | Provided | Compiled `tokenize()` and `run_command()` |
| `swish_funcs.c` | **EDIT** | Holds `run_piped_command()` and `run_pipelined_commands()` stubs |
| `test_cases/` | Testing | 8 provided tests |

Part 2 (`part2/`):

| File | Role | Notes |
|---|---|---|
| `Makefile` | Build | Builds `hadamard.cpython-310-$(ARCH)-linux-gnu.so` via `pip install -e .` |
| `setup.py` | Build | Declares the extension from the five C files |
| `hadamard.h` | Provided | Prototypes of the three functions plus helpers |
| `hadamard_extension.c` | Provided | `PyMethodDef` table and `PyInit_hadamard` |
| `hadamard_utils.c` | Provided | `read_matrix_from_file`, `print_matrix`, `min` |
| `hadamard_pipe.c` | **EDIT** | Processes plus one pipe |
| `hadamard_shmem.c` | **EDIT** | Processes plus shared memory |
| `hadamard_threads.c` | **EDIT** | Threads |
| `hadamard_main.py` | Testing | Driver: `python3 hadamard_main.py <a> <b> <mode> <n_workers>` (mode: pipe, shmem or threads) |
| `test_cases/` | Testing | 18 provided tests (9 pipe, 9 shmem), none for threads |

> [!IMPORTANT] Only the EDIT files count
> The four EDIT files are `part1/swish_funcs.c`, `part2/hadamard_pipe.c`, `part2/hadamard_shmem.c`, `part2/hadamard_threads.c`. The autograder ignores every other change and substitutes its own standard copies. Changing a non-EDIT file makes the autograder fail your code.

### Starter code drift (proj2-code versus proj2-original)
Verified with `diff -r` on 2026-10-30. Part 1 is byte-identical in both. Part 2 differs:

| File | `proj2-code` (10/14 drop) | `proj2-original` (revised) |
|---|---|---|
| `Makefile` | `pip install -e . -qq` | `pip install -e . -qq --no-build-isolation` |
| `setup.py` | No compile flags | `extra_compile_args=["-Wall", "-Werror"]`, so a warning in your extension now fails the build |
| `hadamard_utils.c` | Failures call `PyErr_SetFromErrno` / `PyErr_SetString` / `PyErr_NoMemory` inside the helper | Failures call `perror` / `fprintf(stderr, ...)` and return `NULL`; the caller must raise the Python exception |
| `hadamard_pipe.c` | `worker` declared up top, defined at the bottom; its TODO says to open and reread both matrix files; no `PyErr_SetString` after a failed read | `worker` commented out (uncomment and implement it); no reread instruction; caller raises `PyExc_OSError` "Failed to read matrix data from file" |
| `hadamard_shmem.c`, `hadamard_threads.c` | `worker` declared, definition at the bottom | `worker` commented out as a TODO block |

Consequences: an unused `static` function is now a build error (`-Werror`), so implement and call each `worker`. An EDIT file must not assume which version of `read_matrix_from_file` it runs against, so only set a Python exception after a failed read when none is already set (`PyErr_Occurred()`). The [[20_Progress/Degree/CSCI 4061/Projects/Project - 2 Quiz|quiz note]] answer for question 14 quotes the old pipe-worker TODO ("reopen and reread the files"); the revised file no longer says that.

### Part 1: extending swish
`swish` keeps its Project 1 loop: read a line, tokenize, branch. In this simplified version `swish.c` handles `exit`, prints "Error: This simplified version of swish only supports piped commands" when no `|` token exists, and otherwise calls `run_pipelined_commands(&tokens)` and ignores its return value.

**What a pipeline is.** The output of each command feeds the next over a pipe. For the command at position `i`: stdin comes from the stdout of command `i-1` and stdout goes to the stdin of command `i+1`. The first command reads stdin normally and the last writes stdout normally. In `cat file.txt | wc -l`, `cat` has its stdout redirected to the write end of the pipe and `wc -l` has its stdin redirected to the read end.

**Redirection still works at the ends.** The first command may use `<` and the last may use `>` or `>>`. All six forms must work:

- `cat file.txt | wc -l`
- `cat < file.txt | wc -l`
- `cat file.txt | wc -l > out.txt`
- `cat < file.txt | wc -l > out.txt`
- `cat file.txt | wc -l >> out.txt`
- `cat < file.txt | wc -l >> out.txt`

**Arbitrary length.** A pipeline of `n` commands uses `n-1` pipes. Build an array of pipes, as in lecture. The example `cat gatsby.txt | tr -cs A-Za-z \n | tr A-Z a-z | sort | uniq -c | sort -n | tail -n 12` counts the most frequent words: seven commands, six pipes (pipes 0 to 5).

![[Pasted image 20261030171412.png]]
*Seven commands joined by six pipes. Each pipe has a write end (gold) and a read end (green). The Canvas alt text says "five pairs", which is wrong; the diagram and the arithmetic (`n-1 = 6`) agree.*

**Functions to complete in `swish_funcs.c`:**
1. `run_pipelined_commands(strvec_t *tokens)`: returns 0 on success, -1 on error. Set up the pipe array, split the tokens into commands, call `fork()` per command, and wait.
2. `run_piped_command(strvec_t *tokens, int *pipes, int n_pipe_fds, int in_idx, int out_idx)`: strongly recommended helper that runs one pipeline member. `in_idx` is the index in `pipes` of the descriptor to read stdin from, or -1 if input does not come from a pipe. `out_idx` is the index of the descriptor to write stdout to, or -1. `n_pipe_fds` is the length of the `pipes` array. Returns 0 on success, -1 on error.

**What the provided `run_command()` does.** The professor ships it compiled, not as source. It handles `exec` and handles `<`, `>`, `>>` found in the `tokens` it receives. It knows nothing about pipes, so pipes are your job through `pipe()` and `dup2()`. Call it only in a freshly forked child, exactly as in Project 1. Details recovered from the `.o` file are in [[20_Progress/Degree/CSCI 4061/Projects/Project - 2 Implementation|Project - 2 Implementation]].

**Token splitting.** The first command is every token before the first `|`. An interior command is the tokens between two `|` tokens. The last command is every token after the last `|`. `string_vector.h` gained helpers for Project 2: `strvec_find_last`, `strvec_num_occurrences`, `strvec_take`, `strvec_slice` (start inclusive, end exclusive, destination need not be initialized).

**Launch order.** Theoretically any order works. The professor recommends launching backwards: last command first, working toward the first.

**Hints from the spec.**
- Close inherited pipe descriptors in each child if the child will never use them.
- Close all necessary pipe descriptors on every error path.
- Use the `string_vector.h` helpers to decide how many pipes to make and what each command's tokens are.

**Hidden tests.** The provided tests cover only two- and three-command pipelines. Hidden tests run pipelines longer than three commands and redirect the first command's input and/or the last command's output.

**The `SIGPIPE` caveat.** A command that does not consume all of stdin, such as `head -n 10`, can leave its predecessor writing into a pipe nobody reads. The predecessor may receive `SIGPIPE`, print "broken pipe" and die. The provided tests use `tail` and avoid `head` for this reason. `bash` makes its children ignore `SIGPIPE`; `swish` is not expected to, and no provided or hidden test will trigger this.

### Part 2: parallel matrix computations
Why Hadamard: matrix math underlies data science, ML and AI code, and multi-core CPUs speed it up by working in parallel. Frameworks keep the fast part in C and wrap it in Python. Here the C code becomes a Python extension.

#### The math
The Hadamard product of two matrices of identical dimensions multiplies entries in matching positions. The code may assume it is always given matching dimensions.

$$
A=\begin{bmatrix} a_{11} & a_{12} \\ a_{21} & a_{22} \end{bmatrix},\quad
B=\begin{bmatrix} b_{11} & b_{12} \\ b_{21} & b_{22} \end{bmatrix},\quad
(A\circ B)_{ij}=a_{ij}\,b_{ij}
$$

$$
A\circ B=\begin{bmatrix} a_{11}b_{11} & a_{12}b_{12} \\ a_{21}b_{21} & a_{22}b_{22} \end{bmatrix}
$$

The Canvas paste only captured the matrix `A` as MathML. The product form above is the definition stated in the prose ("each element is the product of two elements in the same location"), written out.

#### Row-major storage
Every matrix is stored as a **one-dimensional** array in row-major order: row 0, then row 1, and so on.

![[Pasted image 20261030171424.png]]
*A 3x3 matrix with its rows concatenated into one array: 1 2 3 | 4 5 6 | 7 8 9.*

For an `r x c` matrix, element `(i, j)` sits at flat index `i*c + j`, and flat index `k` is row `k / c`, column `k % c`. Total elements: `r*c`. Because the product is element-wise, the flat index is all a worker needs, so it never has to think in rows and columns.

#### File format (`test_cases/resources/mat_NN_{a,b}.bin`)
1. 4-byte unsigned integer: number of rows `r`
2. 4-byte unsigned integer: number of columns `c`
3. `r*c` signed 4-byte integers in row-major order

Size check: `mat_00` is 128x128, so 8 + 128*128*4 = 65 544 bytes, which matches the file on disk. The files are little-endian because the container is x86_64.

#### Provided helpers (`hadamard_utils.c`)
- `unsigned min(unsigned a, unsigned b)`: the smaller of two unsigned values; offered for splitting work.
- `int *read_matrix_from_file(const char *file_name, unsigned *n_rows, unsigned *n_cols, int sh_mem)`: reads dimensions and elements. The last argument decides placement: nonzero puts the elements in a shared `mmap` segment (`MAP_SHARED | MAP_ANONYMOUS`), zero puts them on the heap with `malloc`. You will use both modes, in different implementations. Returns `NULL` on failure. Segment size is `rows*cols*sizeof(int)`.
- `void print_matrix(const int *mat, unsigned n_rows, unsigned n_cols)`: prints one row per line with `", "` between elements and no trailing comma. **Every one of your three functions must call it once the result matrix is computed**, because the tests compare that exact text.

#### Organizing parallel work
All three techniques split the same way: break `A`, `B` and the output `C` into chunks as equal in size as possible and give each worker (a process in techniques 1 and 2, a thread in technique 3) a `start` and `stop` index into the flat arrays. How to compute them is your decision. `math.h` is already included for you. Once the method is right, the same one serves all three techniques. The worker count comes from Python as an `unsigned`.

#### Technique 1: processes and a pipe (`hadamard_pipe.c`)
- Many processes can share one pipe; several pipes would be more trouble than help (they are needed in Part 1, not here).
- Create the pipe in the parent, then fork one child per worker. The original parent does not count as a worker.
- `A` and `B` are read into heap memory in the parent. Children inherit copies of those heap regions, so each child must explicitly free them before it exits.
- Each child computes its `start..stop` portion and writes each result element to the pipe, then cleans up and calls `exit()`.
- After launching every child, the parent creates the `C` matrix.
- The parent then reads from the pipe continuously until all children have finished and closed their write ends.
- Elements from different children can arrive in any order and interleave, so send instances of the provided `struct element` (an `unsigned idx` and an `int value`). The parent uses `idx` to place each value in `C`.
- Finally call `print_matrix()` on `C`.

#### Technique 2: processes and shared memory (`hadamard_shmem.c`)
- The pipe approach is clumsy here: a pipe's coordination benefit is wasted when children work on disjoint chunks, and, while Linux copy-on-write makes the `A`/`B` copies cheap, sending elements one by one is cumbersome.
- Instead, read `A` and `B` into shared memory in the parent before forking, using `read_matrix_from_file` with `sh_mem` set. Adapt that function's `mmap` code to make a third shared segment for `C`. Children inherit all three.
- Fork one child per worker. Children read `A` and `B` through their pointers and store each result at the right index of `C`.
- Chunks are disjoint, so little coordination is needed. Each child calls `exit()`. The parent waits for all children, then prints `C`.

#### Technique 3: threads (`hadamard_threads.c`)
The simplest of the three, because `A`, `B` and `C` all live on the heap.
1. Read `A` and `B` with `read_matrix_from_file`.
2. Allocate `C` on the heap.
3. Launch one thread per worker, each with a unique, roughly equal `start`/`stop`.
4. Each worker computes its chunk; the thread body can be a handful of lines.
5. The main thread waits for every thread.
6. The main thread calls `print_matrix()` on `C`.

A thread function takes one `void *`, so pass a pointer to the provided `struct thread_args` (`int *a`, `int *b`, `int *c`, `unsigned start`, `unsigned end`). Look back at the relevant lab and lecture code for the pattern.

#### Making it a Python extension
The key points the spec asks you to remember, all shown in the provided code:
- A function called from Python takes `PyObject *self` and `PyObject *args`. Use `PyArg_ParseTuple` to pull the Python arguments into C locals. The arguments here are two file names and a worker count.
- It returns a `PyObject *`. On success return `None` with `Py_RETURN_NONE`.
- On error return `NULL`, but set a Python error first so an exception is raised in the interpreter. `PyErr_SetString` and `PyErr_Format` set one. If a failing C function set `errno`, use `PyErr_SetFromErrno`. A reasonable default type is `PyExc_OSError`.

The provided `hadamard_extension.c` registers the three functions as `hadamard_pipe`, `hadamard_shmem`, `hadamard_threads` in module `hadamard`, each with `METH_VARARGS`.

### Testing
Provided tests exercise `hadamard_pipe.c` and `hadamard_shmem.c` on matrices of different shapes with different worker counts. The provided tests do **not** cover `hadamard_threads.c`; test it yourself on every provided matrix and with varying worker counts. Hidden tests exist as well.

| Test | Matrix (rows x cols) | Elements | Workers (pipe and shmem) | Elements divide evenly? |
|---|---|---|---|---|
| `mat_00` | 128 x 128 | 16 384 | 1 | yes |
| `mat_01` | 256 x 256 | 65 536 | 2 | yes |
| `mat_02` | 512 x 512 | 262 144 | 3 | no (remainder 1) |
| `mat_03` | 1024 x 1024 | 1 048 576 | 4 | yes |
| `mat_04` | 128 x 256 | 32 768 | 8 | yes |
| `mat_05` | 256 x 128 | 32 768 | 11 | no (remainder 10) |
| `mat_06` | 256 x 512 | 131 072 | 16 | yes |
| `mat_07` | 201 x 301 | 60 501 | 20 | no (remainder 1) |
| `mat_08` | 301 x 201 | 60 501 | 32 | no (remainder 21) |

Part 1 has eight tests, all run with `./swish` under valgrind (`use_valgrind: true`), four of them two-step (run the shell, then `cat out.txt`):

| Input line | Checks |
|---|---|
| `echo hello \| cat` | two-element pipe |
| `cat < test_cases/resources/numbers.txt \| wc -l` | two-element with input redirect (expect 30) |
| `echo hello \| cat > out.txt` | two-element with output redirect |
| `cat < ... \| wc -l > out.txt` | both redirects |
| `cat test_cases/resources/numbers.txt \| sort -rn \| tail -n 10` | three-element |
| the same with `<` | three-element, input redirect |
| the same with `> out.txt` | three-element, output redirect |
| both | three-element, both redirects |

### Submission rules
- Run `make zip` in the root `proj2-code` directory and upload the zip to Gradescope.
- Only the EDIT files may change. The autograder ignores or replaces anything else.
- One submission per group; add the partner through Gradescope's group option after submitting.
- Check that Gradescope's autograder output matches your local results. After the deadline, sign up for the individual oral exam with the TAs.

## Chosen Project
Project 2 offers no options. This section is the mechanism: the concrete action sequence for each EDIT file, in the order to build and test them. No code, only the steps and the invariants each step must preserve. Source references for every step are in [[20_Progress/Degree/CSCI 4061/Projects/Project - 2 Implementation|Project - 2 Implementation]].

### Build order
1. Part 1 first. It is the shortest and the only part with a shell-level test harness.
2. `hadamard_threads.c` next. No process or IPC details, and it proves the split arithmetic.
3. `hadamard_shmem.c`, then `hadamard_pipe.c`. Pipe last because it carries the one real deadlock trap.
4. Re-run all of Part 2 after each file; a mistake in the shared split arithmetic shows up in every technique.

### Part 1 actions (`swish_funcs.c`)
**`run_pipelined_commands`:**
1. Count pipes with `strvec_num_occurrences(tokens, "|")`; commands = pipes + 1; the descriptor array has `2 * pipes` ints.
2. Allocate the descriptor array and call `pipe()` for each pair at offset `2*i` (read end `2*i`, write end `2*i+1`). On failure close the pairs already made, free, return -1.
3. Walk the commands from last to first. For command `j`: its tokens run from just after the `(j)`th `|` to just before the `(j+1)`th `|` (or to the end for the last command). Copy that range with `strvec_slice` (end exclusive).
4. Compute `in_idx` and `out_idx`: first command has `in_idx = -1`, otherwise the read end of pipe `j-1`, which is index `2*(j-1)`; last command has `out_idx = -1`, otherwise the write end of pipe `j`, which is index `2*j + 1`.
5. Call `run_piped_command` with the slice. Clear the slice with `strvec_clear` afterward on every path.
6. Once every child is launched, close **every** pipe descriptor in the parent. The parent never reads or writes the pipes. An open write end in the parent stops the last reader ever seeing end-of-file.
7. Wait for every child (one `wait`/`waitpid` per command, even after a failure). Return 0 only if everything succeeded; free the array.

**`run_piped_command`:**
1. `fork()`. On failure return -1 (the caller closes pipes and reaps what it started).
2. In the child: if `in_idx != -1`, `dup2(pipes[in_idx], STDIN_FILENO)`; if `out_idx != -1`, `dup2(pipes[out_idx], STDOUT_FILENO)`. Textbook p. 539 adds a defensive rule: when the two descriptors are equal, `dup2` and then `close` would close the only copy, so compare first.
3. Close all `n_pipe_fds` pipe descriptors in the child, including the two just duplicated. A child that keeps an extra write end of a pipe it reads from, or a stray read end, hangs the pipeline.
4. Call `run_command(tokens)`. It returns only on failure (exec does not return on success). If it returns, print nothing extra (it printed its own `perror`) and `exit` nonzero. Never return into the parent's code: that would run the shell loop twice.
5. In the parent: return 0.

**Invariants:** every pipe end is closed in the parent before waiting, every child closes all pipe ends before `exec`, stdin/stdout of the middle commands both go through pipes, and no `run_command` is called outside a child.

### Part 2 shared actions
1. Parse arguments with `PyArg_ParseTuple(args, "ssI", ...)`. A failed parse returns `NULL` (the exception is already set).
2. Reject a worker count of 0 with a Python exception, since the split divides by it.
3. Read `A` and `B` (heap for pipe and threads, shared for shmem). On a `NULL` result, raise `OSError` only if no exception is already set, free whatever was already read, return `NULL`.
4. Split with the balanced formula from [[20_Progress/Degree/CSCI 4061/Labs/Lab - 5|Lab - 5]]: with `total = rows*cols`, `base = total / n`, `rem = total % n`, worker `i` takes `start = i*base + min(i, rem)` and `count = base + (i < rem ? 1 : 0)`, so `end = start + count` and loads differ by at most one element. Ranges are half-open `[start, end)`; the provided doc comments are ambiguous ("last element"), so state the convention in a comment. The alternative the starter's `min()` helper hints at is `chunk = ceil(total / n)`, `start = min(i*chunk, total)`, `end = min(start+chunk, total)`; it leaves the last workers smaller or even empty ([[20_Progress/Degree/CSCI 4061/Labs/Lab - 5|Lab 5]] quiz: ceiling makes the last chunk smaller, floor makes it larger).
5. Per element: `c[k] = a[k] * b[k]` for `k` in `[start, end)`. Plain `int` multiplication reproduces every expected output file, so the reference values use 32-bit arithmetic (confirmed by the 216-run sweep in the Work Log).
6. Finish with `print_matrix(c, rows, cols)` exactly once in the parent/main thread, then free or unmap everything and `Py_RETURN_NONE`.
7. Error rule everywhere: `errno`-setting call fails, `PyErr_SetFromErrno(PyExc_OSError)`; allocation fails, `PyErr_NoMemory()`; pthread call fails, build a message with `strerror(code)` because `pthread_*` return the error number and do not set `errno`.

### `hadamard_threads.c` actions
1. Allocate `C` (`malloc(total * sizeof(int))`), an array of `pthread_t`, and an array of `struct thread_args` with one slot per worker, all on the heap so each argument struct outlives its thread (textbook p. 390 warns about stack-allocated structures going stale).
2. Fill `args[i]` (`a`, `b`, `c`, `start`, `end`) then `pthread_create(&threads[i], NULL, worker, &args[i])`. If creation fails at `i`, still join the `i` threads already running, free, and raise.
3. `worker` casts the `void *` back to `struct thread_args *`, loops over `[start, end)`, returns `NULL`.
4. Join every thread; check each `pthread_join` return value.
5. Print `C`, free everything. No mutex is needed: workers write disjoint indexes and only read `A` and `B` ([[20_Progress/Degree/CSCI 4061/Labs/Lab - 7|Lab - 7]] needed a lock only because every thread updated one shared sum).

### `hadamard_shmem.c` actions
1. Parse arguments; read `A` and `B` with `sh_mem = 1`.
2. `mmap` a third segment for `C` with the same flags and size `total * sizeof(int)`; check for `MAP_FAILED`.
3. Fork `n` children. Fork failure: stop forking, still wait for the children already started, unmap all three segments, raise `OSError`.
4. In each child, `worker(a, b, c, start, end, mapped_size)` fills its range, then every segment is unmapped with `munmap(ptr, mapped_size)` (a mapping is inherited, so the child must unmap even though it never mapped) and the child calls `exit(0)`, or `exit(1)` when anything failed. A child must never return into Python.
5. The parent waits for all `n` children and inspects each status with `WIFEXITED` and `WEXITSTATUS`. Only after every child has exited does it read `C`: shared memory has no built-in timing, and `wait` is the synchronization.
6. Print `C`, unmap all three, return `None`.

### `hadamard_pipe.c` actions
1. Parse arguments; read `A` and `B` to the heap.
2. `pipe()` once, before any `fork`.
3. Fork `n` children. Each child closes the read end, runs `worker(a, b, start, end, write_fd)`, which writes one `struct element {idx, value}` per element (8 bytes, far below `PIPE_BUF`, so writes from different children never interleave), checks that `write` returned the full size, closes the write end, frees `A` and `B`, calls `exit`.
4. After the fork loop the parent closes its write end **before** reading. If it keeps the write end open, `read` never returns 0.
5. The parent allocates `C`, then loops `read` of one `struct element` at a time into `C[idx]` until `read` returns 0. Treat a short read (more than 0 but fewer bytes than a struct) as an error, check `idx < total`, retry on `EINTR`.
6. The parent must be reading while children write: a 1024x1024 run pushes 8 MB through a pipe whose buffer holds about 64 KB, so waiting for children before draining the pipe deadlocks.
7. After `read` returns 0, close the read end, `wait` for all `n` children and check their statuses, print `C`, free everything, return `None`.
8. On fork failure close the read end as well, so already-started children get `EPIPE`/`SIGPIPE` instead of blocking forever, then reap them.

### Final checks before zipping
1. Build clean from scratch under the revised non-EDIT files, with zero warnings (`-Werror`).
2. Run all 8 Part 1 tests and all 18 Part 2 tests.
3. Run the three techniques by hand on every provided matrix and diff the output against `test_cases/output/mat_NN.txt`, including the threads mode, which has no provided test.
4. Run a 4+ command pipeline and the six redirection forms in `swish`.
5. `make zip` from the root, `unzip -l` it, and confirm only sources are present.

## Concept Links
- [[20_Progress/Degree/CSCI 4061/Weekly/Week - 4|Week - 4]]: Lec08 pipes, the descriptor-close rules and the single-pipe exercise. Weeks 5 to 8 have no weekly note yet; their lectures (Lec09 to Lec15) are mapped in [[20_Progress/Degree/CSCI 4061/Projects/Project - 2 Implementation|Project - 2 Implementation]].
- [[20_Progress/Degree/CSCI 4061/Labs/Lab - 4|Lab - 4]]: one `pipe` plus `fork` plus `dup2` plus `exec`, which Part 1 repeats `n-1` times.
- [[20_Progress/Degree/CSCI 4061/Labs/Lab - 5|Lab - 5]]: the work-splitting formula and `mmap` shared results.
- [[20_Progress/Degree/CSCI 4061/Labs/Lab - 6|Lab - 6]]: the CPython extension skeleton and error rules.
- [[20_Progress/Degree/CSCI 4061/Labs/Lab - 7|Lab - 7]]: `pthread_create`, `pthread_join`, `strerror` error handling.
- [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 15|Chapter - 15]]: APUE 15.2 pipes and 15.9 shared memory, anonymous mapping.
- [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8|Chapter - 8]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter - 3]]: `fork`/`wait` and `dup2`/`close`/`read`/`write`.
- [[20_Progress/Degree/CSCI 4061/Projects/Project - 1 Code|Project - 1 Code]]: the fork, `run_command`, redirection and cleanup pattern Part 1 extends.

## Work Log
- **2026-10-30:** Pasted the Canvas spec and rewrote it as this note, replacing the raw code block. Read every file in `proj2-code` and `proj2-original`, found the six-file part-2 drift (table above), confirmed part 1 is identical in both. Read `swish_funcs_provided_x86_64.o` through `nm`, `strings` and `objdump` in a throwaway container from the course image (read-only mount) to learn what `run_command` does. Read slides Lec09 to Lec15, transcripts Oct 1, 6, 13, 15, 20, the lecture and lab code for pipes, shared memory, Python extensions and threads, and APUE 1.7, 3.5 to 3.12, 5.9, 8.3 to 8.6, 11.1 to 11.5, 12.5, 14.8, 15.1 to 15.2, 15.9 straight from the PDF through MinerU (PDF page = book page + 34). MinerU first failed with `server_instance_mismatch`; `mineru server restart` fixed it. The course dev container was stopped when checked (`docker ps -a` showed it exited 42 hours earlier), so every build and test below ran in throwaway `docker run --rm` containers from its image (Ubuntu 22.04, gcc 11.4.0, Python 3.10.12, `testius`, valgrind), with `proj2-code` mounted read-write and `proj2-original` mounted read-only.
- **2026-10-30, implementation:** Wrote the four EDIT files in `proj2-code` following the Chosen Project steps: `part1/swish_funcs.c`, `part2/hadamard_pipe.c`, `hadamard_shmem.c`, `hadamard_threads.c`. Nothing outside them changed (`diff -rq` against `proj2-original` shows those four plus the pre-existing drift in `Makefile`, `hadamard_utils.c` and `setup.py`).
- **Part 1 result:** `make test` 8/8 (8.0/8.0) in `proj2-code` and again on the revised starter with my file overlaid. Extra runs: a seven-command word-count pipeline matched `bash`'s output; first-command `<` plus last-command `>` and `>>` worked; a 12-command chain worked; a missing command in the middle printed `exec: No such file or directory` and the shell kept running; leading, trailing and doubled `|` print "Error: missing command in pipeline" instead of crashing; `valgrind --leak-check=full --track-fds=yes` printed nothing for `swish`.
- **Part 2 result:** `make test` 18/18 against the 10/14 non-EDIT files, and 18/18 against the revised starter built with `-Wall -Werror`. Sweep of all 9 matrices x {threads, pipe, shmem} x workers {1, 2, 3, 5, 7, 16, 33, 100}: 216 runs, every output byte-identical to `test_cases/output/mat_NN.txt`, nothing on stderr. This includes the threads mode, which has no provided test, and 8 MB flowing through the pipe for the 1024x1024 case. A 2x3 matrix with 50 workers works in all three modes (empty chunks). 200 calls of each mode in one interpreter left the fd count at 4 and no zombie processes. Python sees `ValueError` for 0 workers and for mismatched dimensions, `OSError` for a missing file and `TypeError` for a non-integer worker count.
- **Not covered:** the real Gradescope autograder and the hidden tests; `make zip` was only dry-run on a scratch copy (its listing held only sources, no `test_cases`); behavior of `SIGPIPE` for a pipe worker whose parent died was not exercised.

## Submission
Not submitted yet. No zip has been created in your folders. Upload `proj2-code.zip` from the project root to Gradescope, confirm the autograder matches the local result, add the partner if any, then book the oral exam slot.

## Post-Submit Reflection
<!-- Within a day or two of submitting: what failed first and what pattern repeats. -->
