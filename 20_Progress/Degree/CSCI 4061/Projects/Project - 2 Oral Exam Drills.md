---
type: class
class_kind: project
project_role: companion
status: sprout
created: 2026-11-09
updated: 2026-11-09
tags:
  - class
  - project
  - oral-exam
area:
  - "[[CSCI 4061 Board]]"
related:
  - "[[20_Progress/Degree/CSCI 4061/Projects/Project - 2 Assignment|Project - 2 Assignment]]"
  - "[[20_Progress/Degree/CSCI 4061/Projects/Project - 2 Implementation|Project - 2 Implementation]]"
  - "[[20_Progress/Degree/CSCI 4061/Projects/Project - 2 Quiz|Project - 2 Quiz]]"
  - "[[20_Progress/Degree/CSCI 4061/Projects/Project - 1 Oral Exam Drills|Project - 1 Oral Exam Drills]]"
next: "Answer every question aloud, closed-book, pointing at the submitted code. Re-do only the ones that stall."
---

# Project - 2 Oral Exam Drills
Questions a TA can ask about the submitted Project 2, each with a short answer to say aloud. Main note: [[20_Progress/Degree/CSCI 4061/Projects/Project - 2 Assignment|Project - 2 Assignment]]. Answers follow the submitted code in `proj2-code`, not [[20_Progress/Degree/CSCI 4061/Projects/Project - 2 Implementation|Project - 2 Implementation]], which describes a balanced split and extra read checks the code does not have. Where they disagree, the code wins. Use the Input / State / Contract / Failure / Why frame from [[20_Progress/Degree/CSCI 4061/Projects/Project - 1 Oral Exam Drills|Project - 1 Oral Exam Drills]] when a question is open-ended.
## The two-minute explanation
Say this first, then answer follow-ups from the sections below.
*Part 1:* `swish.c` reads a line and, if it has a `|`, calls my `run_pipelined_commands`. I count the bars to get the number of pipes and create them all in one `int` array (pipe `i` is slots `2i` and `2i+1`). I split the tokens into one command per stage and fork once per stage. Each child plugs its stdin or stdout into the right pipe end with `dup2`, closes every pipe fd, and calls the provided `run_command`, which handles `<`, `>`, `>>` and does the exec. The parent closes all pipe fds, then waits once per child.
*Part 2:* it multiplies two matrices element by element. Both are one flat array, so each of `n` workers gets a range `[start, end)`. The three functions differ only in how workers return answers: processes plus one shared pipe (each message is `idx, value`), processes plus shared `mmap` memory (write in place, parent `wait`s), threads (write in place, main `pthread_join`s). Each is a C function in a Python module: it takes two filenames and a worker count, prints with `print_matrix`, and returns `None`, or sets an exception and returns `NULL`.
## Four rules that answer most questions
1. **fork copies memory, not kernel objects.** Variables and arrays are duplicated, so a child's writes are invisible to the parent. File descriptors are duplicated too, but both copies point at the same pipe or open file. That is why a pipe works across `fork` and a plain variable does not.
2. ==A reader sees end-of-file only when every write end of the pipe, in every process, is closed.== One forgotten copy anywhere means a hang.
3. **Something must say "done".** A pipe says it by EOF. Shared memory says nothing, so the parent calls `wait`. Threads need `pthread_join`. Reading or freeing before that is a bug.
4. **Every failure path: check, undo, report.** Check each call that can fail, release what you already got (free, `munmap`, close, wait, join), then report (Python exception in Part 2, `-1` or a message in Part 1).
## Part 1: pipelines in swish
**Walk me through `cat a.txt | sort | wc -l`.**
Tokens: `cat a.txt | sort | wc -l`. Two bars, so `n_pipes = 2` and `pipes` holds 4 ints: pipe 0 is `pipes[0]` (read) and `pipes[1]` (write), pipe 1 is `pipes[2]` and `pipes[3]`. The loop runs `i = 2, 1, 0` (last command first):

| Command | `i` | `in_idx` | `out_idx` | Meaning |
|---|---|---|---|---|
| `wc -l` | 2 | 2 | -1 | reads pipe 1, prints to screen |
| `sort` | 1 | 0 | 3 | reads pipe 0, writes pipe 1 |
| `cat a.txt` | 0 | -1 | 1 | writes pipe 0 |

The rule in code: `in_idx = (i == 0) ? -1 : 2*(i-1)` and `out_idx = (i == n_pipes) ? -1 : 2*i + 1`.
**Why `n - 1` pipes, and why one int array?**
Each neighbouring pair of commands needs one connection, so `n` commands need `n - 1`. One `malloc`'d array of `2 * n_pipes` ints holds every pipe, so `run_piped_command` takes a single pointer plus indexes, and closing "all of them" is one loop.
**How do you cut the tokens into commands?**
`strvec_find_last(tokens, "|")` gives the last bar, `strvec_slice(tokens, &command, bar_idx + 1, tokens->length)` copies everything after it (start included, end excluded), then `strvec_take(tokens, bar_idx)` drops that command and the bar. On `{cat, a.txt, |, sort, |, wc, -l}` the first pass slices `{wc, -l}` and leaves `{cat, a.txt, |, sort}`. For the first command there is no bar, so `find_last` returns -1, `bar_idx + 1` is 0, and the slice is everything left. The `if (i > 0)` skips the take on that last pass.
**Why slice at all instead of giving `run_command` the whole line?**
`run_command` scans its whole vector for `<`, `>`, `>>` and builds `argv` from it. Given the whole pipeline it would mix every stage's words. Each stage must see only its own words.
**Does the launch order (last to first) matter?**
Not for correctness: every pipe exists before the first fork, so any order works. Last-to-first is just convenient because `find_last` and `take` peel commands off the end.
**Why does the child `dup2` and then close every pipe fd?**
`dup2(pipes[in_idx], STDIN_FILENO)` makes slot 0 point at the pipe, and `run_command` then reads stdin without knowing. The child inherited every pipe fd, and the original numbers are now spare copies. A spare write end held by a downstream command stops the pipe from ever reaching EOF, so all of them are closed (slot 0 and 1 keep the pipe alive).
**Why does the parent close all pipe fds before `wait`?**
The parent also holds both ends of every pipe. If it keeps a write end open, the last reader never sees EOF, never exits, and the parent sits in `wait` forever. ==That closing loop is what makes the whole pipeline terminate.==
**Why `exit(1)` after `run_command`?**
`run_command` only returns on failure (bad program, bad redirect file), after printing the error. If the child returned into the shell loop, there would be two shells reading the keyboard. `exit(1)` ends only that child.
**What is `fflush(stdout)` for?**
Buffered output such as the `@> ` prompt is part of process memory, so `fork` copies it, and a child that leaves through `exit(1)` flushes its own copy. Flushing before the first fork empties the buffer so nothing prints twice. The course material does not require this. I added it after reasoning about `fork` and stdio.
**Where do `<` and `>` get handled in a pipeline?**
In `run_command`, inside the child, after my `dup2`. In `cat < in.txt | sort > out.txt` the first slice contains `<` and the last contains `>`, so the first stage's stdin and the last stage's stdout are replaced by files. Redirects on the first and last commands are the hidden-test cases.
**What happens with `yes | head -1`?**
`head` exits after one line, which closes its read end. Once every read end is closed, `yes` gets `SIGPIPE` on its next write and dies. This only works because I close the pipe fds eagerly: with a leftover read end in the parent, `SIGPIPE` never fires and `yes` just blocks on the full pipe, so the pipeline hangs. Bash does extra `SIGPIPE` handling that swish does not, and my `wait(NULL)` just reaps the dead child without reporting it.
**What errors do you handle, and how?**
Every call that can fail is checked: `malloc`, `pipe` (close the pipes made so far, free, return -1), `fflush`, `strvec_slice`, `fork` (`run_piped_command` returns -1), `dup2` and `close` in the child (`exit(1)`), and `close` and `wait` in the parent. On a failed launch the loop breaks, but the parent still closes all pipes and waits for the children already started, so nothing is left running or zombied. It returns -1, and `swish.c` ignores that value.
**Do you check how the children exited?**
No. I call `wait(NULL)` once per child, because swish shows no exit status. To report one I would use `wait(&status)` with `WIFEXITED` and `WEXITSTATUS`.
## Part 2 shared ideas: splitting, Python, comparison
**How is the work divided? Give an example.**
`chunk_size = ceil(total / (double) n_workers)`, `start = i * chunk_size`, `end = min(start + chunk_size, total)`. ==Ranges are half-open: `start` included, `end` excluded.== 10 elements and 4 workers: chunk 3, ranges `[0,3) [3,6) [6,9) [9,10)`. Every index lands in exactly one range, no gaps or overlaps.
**Why `ceil` and the `double` cast?**
Plain `total / n_workers` is integer division and rounds down, which would leave the last few elements unassigned. The cast makes it a real division, and `ceil` rounds up so everything is covered. `min` stops the last range from running past `total`.
**What if there are more workers than elements, or zero workers?**
5 elements and 4 workers: chunk 2, ranges `[0,2) [2,4) [4,5)` and `[6,5)`. The last one has `start > end`, so its loop never runs and that worker does nothing. Zero workers would divide by zero, so each function rejects it with `ValueError` first. `hadamard_main.py` also asserts, but the C function must not depend on that.
**What is the downside of this split?**
It can be uneven: 9 elements and 4 workers gives 3, 3, 3 and 0. A balanced split (sizes differ by at most one) shares the work better. I used the simple ceiling split from lab 5. It is correct, just not optimal.
**How does Python reach your C function?**
`setup.py` compiles the five `.c` files into one module `hadamard`. `hadamard_extension.c` holds a method table (name, C function, `METH_VARARGS`, doc, ended by an all-`NULL` entry) and `PyInit_hadamard`, which Python calls on `import hadamard`. A call lands in my function as `(PyObject *self, PyObject *args)`.
**What does `PyArg_ParseTuple(args, "ssI", ...)` do?**
It unpacks the Python arguments into C variables: `s` is a C string (`const char *`), `I` is an `unsigned int`, so two filenames and a worker count. It returns 0 on failure and has already set a Python exception, so I just `return NULL`.
**What do you return, and when?**
Success is `Py_RETURN_NONE`. Failure is: set an exception, then return `NULL`. Returning `NULL` with no exception set is a bug (Python raises `SystemError`). Exceptions I use: `ValueError` for zero workers, `OSError` for file problems and failed system calls (`PyErr_SetFromErrno` reads `errno`), `MemoryError` via `PyErr_NoMemory()` for `malloc`.
**Why print inside C instead of returning the matrix?**
The tests compare printed text, and the starter says to pass the result to `print_matrix` once. Printing only on success also means a failed run prints nothing.
**Why are A and B read once in the parent, before forking?**
All workers need the same data, so one read is enough, and children inherit it. Reading in every child would repeat the file I/O `n` times.
**What if the two matrices have different sizes?**
`assert(a_rows == b_rows && a_cols == b_cols)` aborts the whole Python process. That check came with the starter and the tests never use mismatched files.
**Compare the three techniques.**

| | Pipe | Shared memory | Threads |
|---|---|---|---|
| Workers | child processes | child processes | threads |
| Where A, B live | heap, copied per child | shared `mmap` | heap, shared by all |
| How results return | `(idx, value)` messages through one pipe | children write C directly | threads write C directly |
| "Done" signal | EOF on the pipe, then `wait` | `wait` | `pthread_join` |
| Cost | highest: a `write` and a `read` per element | process creation only | lowest |
| Typical risk | forgotten pipe end hangs | reading before `wait` | races if ranges overlap |

The cost row is my reasoning, not something I measured.
## Technique 1: processes and one pipe (`hadamard_pipe.c`)
**Walk me through it.**
Parse and read A and B to the heap, make one pipe, loop `n_workers` times calling `fork`. Each child closes the read end, runs `worker` (for each `i` in its range, `write` a `struct element {idx, a[i]*b[i]}`), frees its copies of A and B, and calls `exit`. The parent closes its write end, `malloc`s C, and loops `read(...) > 0` setting `C[elem.idx] = elem.value` until EOF. Then it closes the read end, waits for every child, and calls `print_matrix` if all succeeded.
**Why does the message carry the index?**
==All children write into the same pipe at the same time, so values arrive in any order.== The parent could not tell which slot a value belongs to. With `idx` in each message it just does `C[idx] = value`.
**Why is sending a struct from several children safe?**
`struct element` is 8 bytes. Writes up to `PIPE_BUF` (at least 512 bytes, 4096 on Linux) are atomic, so two children's messages never interleave inside a message.
**Why one shared pipe and not one per child?**
The assignment asks for one. It also keeps the parent simple: one read end and one loop. With a pipe per child the parent would need to juggle `n` read ends.
**Why does the parent close its write end before reading?**
The parent also holds a copy of the write end. If it keeps that open, the pipe never reaches EOF and `read` blocks forever after the last child finishes.
**Why must the parent read while the children run, instead of `wait` first?**
A pipe holds about 64 KB, and a 1024x1024 run sends 8 MB (1,048,576 messages of 8 bytes). Children block when the pipe is full. If the parent were in `wait`, nobody drains the pipe and everything deadlocks.
**Why does the child `exit` and not `return`?**
`return` would carry the child back into the Python interpreter, which would keep running as a second copy and print twice. `exit(1)` on failure gives the parent a nonzero status to detect.
**Why does the child free A and B?**
After `fork` the child has its own copy of the heap. It frees that copy before exiting so there is no leak in the child.
**How does the parent know a child failed?**
`wait(&status)` then `WIFEXITED(status) && WEXITSTATUS(status) == 0`. Any other result sets `ret_val = -1`: no matrix is printed, `OSError("Worker process failed")` is raised, and memory is still freed.
**Why do the error paths close the read end before waiting?**
If the parent stops reading and just waits, children blocked on a full pipe never finish. Closing the read end makes their `write` fail (Python ignores `SIGPIPE`, so the error is `EPIPE`), the worker returns -1, the child exits 1, and `wait` returns.
## Technique 2: processes and shared memory (`hadamard_shmem.c`)
**Walk me through it.**
`read_matrix_from_file(..., 1)` puts A and B into shared `mmap` memory. I `mmap` a third block for C with the same flags, then fork `n_workers` children. Each child's `worker` computes `c[i] = a[i] * b[i]` over its range, `munmap`s its three blocks and exits. The parent waits for every child, checks statuses, prints C, and unmaps its blocks.
**What do the `mmap` flags mean?**
`PROT_READ | PROT_WRITE` allows reading and writing. `MAP_SHARED` means `fork` does not copy it, parent and children see the same bytes. `MAP_ANONYMOUS` means no file backs it, so the fd argument is -1.
**What would `MAP_PRIVATE` do?**
Writes become copy-on-write: each child would change a private copy, and the parent's C would stay all zeros. It would behave like the heap version.
**Why does the parent need `wait` here?**
==Nothing else signals completion.== Printing C right after forking would show zeros and half-written values. Only after every `wait` is C complete.
**Why no lock?**
No two workers write the same element, A and B are only read, and the parent reads C only after all children are gone.
**Who unmaps, and why does each process do it?**
Every process has its own mapping of the same memory. The child's `munmap` removes only the child's mapping, so the parent still sees the data. The parent unmaps last. Use `munmap` here, never `free`, which is for `malloc`.
**Why is C `mmap`'d too?**
C must be visible to the parent after children write it, so it has to be shared. A `malloc`'d C would be a private copy in each child.
**Anything different about error paths?**
Same pattern: on a failed `fork` I wait for the children already started, then `munmap` all three blocks. On a bad child status I still unmap and then return `NULL` with an exception.
## Technique 3: threads (`hadamard_threads.c`)
**Walk me through it.**
Read A and B to the heap, `malloc` C plus an array of `pthread_t` and an array of `struct thread_args` (one per worker). For each worker fill `a, b, c, start, end` and call `pthread_create(&threads[i], NULL, worker, &thread_data[i])`. Then `pthread_join` every thread, print C, free everything.
**Why a struct for the arguments?**
A thread function receives exactly one `void *`. The struct packs everything the worker needs into that one pointer, and the worker casts it back.
**Why an array of structs and not one reused struct?**
A thread may start running after the loop has moved on. With one reused struct, a thread could read another thread's range. Each thread needs its own struct that stays alive until it is joined.
**Why no mutex when Lab 7 needed one?**
Lab 7 threads updated one shared sum, a real race. Here every thread writes its own disjoint range of C and only reads A and B, so threads never touch the same element.
**Why must you join?**
Without it `print_matrix` could run while workers are still writing, and the function could free memory they are using. ==Join is to threads what `wait` is to processes.==
**How do you report a `pthread_create` failure?**
It returns an error number, not -1, and does not set `errno`, so `PyErr_SetFromErrno` would be wrong. I use `PyErr_Format(PyExc_OSError, "pthread_create failed: %s", strerror(result))`.
**What if `pthread_create` fails part-way?**
The threads already started are still running on my arrays, so I join them first (`j < i`), then free. Freeing first would leave them writing into freed memory. A failed join does the same for the remaining threads.
**Do these threads really run in parallel under Python?**
The workers are plain C and never touch Python objects, so they do not need the GIL and can run in parallel. The calling thread holds the GIL but is just waiting in `pthread_join`.
## Error handling across the project
**What is your general error-handling pattern?**
Check the return value, set the error (exception in Part 2, `perror` or `-1` in Part 1), release what you already acquired, return. One example: in `hadamard_pipe`, if `fork` fails on iteration `i`, I set `OSError` from `errno`, close both pipe ends, `wait` for the `i` children already started, free A and B, and return `NULL`.
**Who releases what?**

| Resource | Release with |
|---|---|
| `malloc` memory (A, B, C in pipe and threads, `pipes` array in Part 1) | `free` |
| `mmap` memory (shared version) | `munmap` |
| pipe fds | `close`, every end in every process |
| child processes | `wait`, once per child |
| threads | `pthread_join`, once per thread |

**Why wait for already-started children on an error path?**
==Otherwise they become zombies, and they may still be using memory you are about to free or unmap.==
## Break it: what goes wrong if you remove X?
==Every row below is one of the four rules broken.== Use this table to answer "what if you didn't..." questions in any form.

| Remove or change | Symptom |
|---|---|
| Parent closes no pipe fds (Part 1) | last command never sees EOF, shell hangs in `wait` |
| Child skips the close loop (Part 1) | a downstream command holds a write end, pipeline hangs |
| No `dup2` | program reads the keyboard and prints to the screen, the pipe is unused |
| Child returns instead of `exit` (Part 1) | an extra shell loop reading the same input |
| Child returns instead of `exit` (Part 2) | child keeps running Python code, duplicate output |
| Pipe parent keeps its write end | `read` never returns 0, hang |
| Pipe parent calls `wait` before reading | deadlock once 64 KB fill the pipe |
| No index in the pipe message | values land in the wrong slots |
| Shared memory without `wait` | C printed too early, zeros or partial values |
| `MAP_PRIVATE` instead of `MAP_SHARED` | parent never sees the children's writes |
| No `pthread_join` | print and free while threads still run |
| One reused `thread_args` | threads read the wrong range |
| `floor` instead of `ceil` in the split | last elements never computed: garbage in malloc'd C, zeros in `mmap`'d C |
| `return NULL` with no exception | Python raises `SystemError` |
| Missing all-`NULL` end of method table | crash or garbage when Python reads the table |
## Where a TA could push on the submitted code
> [!WARNING]
> Know these weak spots before the TA finds them. Each answer is honest, not a defense.

- Part 1 ignores child exit statuses (`wait(NULL)`). Fine for the required behaviour, but a failed command is invisible to the shell.
- The pipe worker assumes `write` writes all 8 bytes, and the parent assumes `read` returns whole messages and a valid `idx`. For a blocking pipe and 8-byte atomic messages that holds in practice, but there is no short-read handling, no `EINTR` retry and no `idx < total` check.
- The ceiling split can leave the last worker with little or nothing. A balanced split is better and would be the first improvement.
- `assert` on mismatched dimensions aborts the whole interpreter instead of raising a Python exception.
- If the final `munmap` fails in the shared-memory version, its `PyErr_SetFromErrno` can replace an earlier "Worker process failed" exception.
- Reading a file error gives a generic `OSError` message; the detail from `perror` goes to stderr only.
- `exit()` in a forked child flushes C stdio and runs handlers. The earlier check recorded in [[20_Progress/Degree/CSCI 4061/Projects/Project - 2 Implementation|Project - 2 Implementation]] found no duplicate output, because nothing is buffered at fork time in these runs.
