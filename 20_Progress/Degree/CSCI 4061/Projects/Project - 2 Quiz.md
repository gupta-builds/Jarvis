---
type: class
class_kind: project
project_role: companion
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - class
  - project
  - quiz
area:
  - "[[CSCI 4061 Board]]"
related: []
next:
---
# Project - 2 Quiz
Answer key checked against the Fall 2026 Project 2 starter code in `csci4061-fa26/Projects/proj2-code`. The two parts are `part1` (`swish` pipelines) and `part2` (parallel Hadamard products).
## Answer Key
1. **All of the above.** The root Makefile's `test` target delegates to `part1` and `part2`; each part Makefile defines its own `test` target.
2. **Only in the top-level `proj2-code` directory.** Both part Makefiles' `zip` targets print an error directing you to run it from the project root.
3. **One partner submits, then adds the other partner through Gradescope's web UI.**
4. **`n - 1` pipes.** Each adjacent pair of commands needs one connecting pipe.
5. **As a one-dimensional array of ints.** The starter's pipe descriptor API takes `int *pipes`; each pipe contributes its read and write file descriptors.
6. **`strvec_num_occurrences(my_vec, "|")`.** This helper is declared and implemented in `string_vector.h/.c`.
7. **`strvec_slice(x, y, 2, 5)`.** The slice start is inclusive and end is exclusive, so indices 2, 3, and 4 are copied to `y`.
8. **A command pipeline with four or more elements.** Part 1 tests cover two- and three-command pipelines, including input and output redirection.
9. **The `head` command may stop reading once it has enough lines, which can cause `SIGPIPE` to reach its pipeline predecessor.**
10. **Bash does extra signal handling around `SIGPIPE` that swish does not do.**
11. **As soon as possible.** A writer that keeps an unnecessary read end open can prevent the pipe from reporting that no readers remain.
12. **`n` times.** Create `n` child worker processes; the original process coordinates the work.
13. **`n` times.** `pthread_create()` creates each of the `n` worker threads; the main thread is the coordinator.
14. **None of the worker processes need to read the input files.** The coordinator reads both matrices before forking, so children inherit access to the input arrays. The worker TODO says to reopen and reread the files, which conflicts with that inherited data and is not necessary for the quiz question.
15. **Two `PyObject *` arguments.** The formal signature is `(PyObject *self, PyObject *args)`; the actual filenames and worker count are extracted from `args` using `PyArg_ParseTuple(args, "ssI", ...).
16. **`None`.** The C functions return `Py_RETURN_NONE` after completing the work.
17. **`NULL`.** This is the Python C API error return; the exception is set separately, as `PyArg_ParseTuple` and utility failures demonstrate.
18. **Call `print_matrix()` with the result matrix.** The Part 2 test outputs are the printed matrix results.
## Source Checks
- `Projects/proj2-code/Makefile` and the `part1/Makefile` and `part2/Makefile`: test and zip working directories.
- `Projects/proj2-code/part1/string_vector.h` and `string_vector.c`: occurrence-counting and slice APIs, including exclusive slice end.
- `Projects/proj2-code/part1/test_cases/tests.json`: provided pipeline lengths and redirection cases.
- `Projects/proj2-code/part1/swish_funcs.h`: pipe descriptors represented through an integer array.
- `Projects/proj2-code/part2/hadamard.h`, `hadamard_main.py`, and `hadamard_pipe.c`: Python call arguments, worker count, and per-worker file reads.
- `Projects/proj2-code/part2/hadamard_pipe.c`, `hadamard_shmem.c`, and `hadamard_threads.c`: Python return conventions and required result printing in the TODO descriptions.
- Questions 3 and 9-11 concern the quiz's submission instructions and process/signal behavior. Their answer wording follows the course quiz choices; the code checks above do not independently establish the Gradescope policy or Bash's signal behavior. Question 14 follows the fork inheritance model, though the pipe worker TODO separately requests reopening the files.


