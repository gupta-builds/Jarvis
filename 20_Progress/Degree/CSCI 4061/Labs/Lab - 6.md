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
# Lab - 6
==Lab 6 wraps the CPython C API around one function: parse a Python list of ints on the C side with `PyArg_ParseTuple(args, "O!", &PyList_Type, &input_list)`, pre-allocate a same-length output list with `PyList_New`, then fill it element by element with `PyList_SetItem`, which *steals* the reference to each float handed to it instead of borrowing it like `PyList_Append` would. A negative element raises a Python `ValueError` via `PyErr_SetString`, after `Py_DECREF`'ing the half-built output list so nothing leaks.==
**Sources read:** `csci4061-fa26/Labs/lab06-code/` in full (`QUESTIONS.txt`, `QUESTIONS.txt.bak`, the `square_root.c` starter, `square_root_main.py`, `setup.py`, `Makefile`, `test_cases/tests.json`), [[CSCI 4061 Board]]'s Schedule table (Week 6: "Finish IPC, Multiplexed I/O; Systems Programming in Python, C/Python Interop", reading "Stevens 15.9, 14.4"; Week 7: "Lab 6" listed as due), and the official CPython C API reference semantics for `PyArg_ParseTuple`'s `O!` format code and the `PyList_New` / `PyList_SetItem` / `PyList_Append` / `PyErr_NoMemory` reference-count contracts.
> [!WARNING] The assigned textbook reading does not cover this lab's actual material
> *Advanced Programming in the UNIX Environment* (Stevens & Rago) contains **zero** mentions of Python anywhere in its text — confirmed by extracting the full PDF to text and grepping it. APUE §14.4 ("I/O Multiplexing", `select`/`pselect`) is the week's assigned reading, but it answers the lecture's *other* half ("Finish IPC, Multiplexed I/O"), not the "Systems Programming in Python, C/Python Interop" half this lab actually tests. [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]] already flags Week 6 as having no landed chapter note for this reason. No Week 5/6 lecture slides exist locally either (the Lecture folder stops at `Lec08`, Week 4). This lab is solved from the starter code, `QUESTIONS.txt`'s own prompts, and the documented CPython C API, not from a textbook or lecture source — there is no textbook/lecture source for this material yet.
## Goal
Complete a minimal CPython C extension (`square_root.c`) that takes a Python list of integers, computes each one's square root in C, and returns a new Python list of floats — raising a Python `ValueError` through the C API if any input element is negative. The quiz half tests the reference-counting and error-reporting rules the implementation actually has to follow, not just the happy path.
### Submission checklist (what actually gets graded)
- **Attendance** in the assigned lab section. No attendance, no credit for the week.
- **`QUESTIONS.txt`**: change `( )` to `(X)` on 4 quiz answers. `socrates` hashes the answers against `test_cases/resources/quiz_sum.json`, so nothing else in the file can change. Worth 0.5 pt (test 1).
- **`square_root.c`**: complete the `square_roots` function body only. Worth 0.5 pt (test 2, `python3 square_root_main.py` output diffed against `test_cases/output/square_roots.txt`).
- `make test` (both tests), then `make zip`, which creates `lab06-code.zip`, then upload to **Gradescope**. Groups of up to 4 are allowed: one person submits and adds the others.
- Due **11:59pm tonight, Wed 2026-10-21** — Lab 6's Monday session (2026-10-19, Week 7) follows the same Monday-session → Wednesday-deadline pattern every prior lab in this course used (Lab 2: 9/21 → 9/23; Lab 3: 9/28 → 9/30; Lab 5: 10/12 → 10/14).
- `Makefile`, `QUESTIONS.txt.bak`, `setup.py`, `square_root_main.py`, and `test_cases/` are not edited.
## Procedure / key steps
- Setup: `lab06-code` was already present at `csci4061-fa26/Labs/lab06-code/` inside the course's existing running dev container (`cranky_pasteur`, Python 3.10.12, gcc 11.4.0, Ubuntu 22.04 — confirmed via `docker exec`). `setup.py` builds the extension as `square_root.cpython-310-$(ARCH)-linux-gnu.so` via `pip install -e .`; the Makefile's default target depends on it.
### Part 1: QUIZ, C Extensions for Python
1. **`PyArg_ParseTuple(args, "O!", &PyList_Type, ...)` — what happens if the argument isn't a valid Python list?**
	(X) **A `TypeError` will be raised by the function.** The CPython C API docs for the `O!` format code are explicit: it is like plain `O` but also takes the address of a type object (here `&PyList_Type`); "if the Python object does not have the required type, `TypeError` is raised." It is not silently converted (lists don't get auto-converted from arbitrary types) and no `NULL`/`ValueError` path exists for this format code.
2. **`PyList_New` successfully creates a new list — what's true about its reference count?**
	(X) **The reference count is currently 1. If we no longer need the list in the future, we need to call `Py_DECREF` to avoid a memory leak.** `PyList_New` is documented as returning a **new reference** — the caller already owns one reference to the list it gets back, not zero. That's exactly why `square_roots` can return `output_list` directly without an extra `Py_INCREF` (ownership transfers straight to the caller), but also why every early-exit path in this lab's implementation calls `Py_DECREF(output_list)` before returning `NULL` on error — otherwise that one owned reference leaks.
3. **Which C function indicates a failed memory allocation back to Python?**
	(X) **`PyErr_NoMemory`.** It's the documented convenience function for exactly this case — it raises `MemoryError` with no arguments needed. `PyErr_Format`/`PyErr_SetFromErrno` require arguments this situation doesn't have (a format string, or a `errno` value — malloc-style failures inside the Python allocator don't set `errno`), and `PcLoadLetter` isn't a real CPython API function.
4. **What happens to the reference count of `o` when calling `PyList_SetItem(list, i, o)`?**
	(X) **The object's reference count stays the same.** `PyList_SetItem` is documented as "stealing" a reference to the item it's given — it takes over ownership of the reference the caller already holds rather than creating a new one, so it does **not** increment the count on entry. (Contrast: `PyList_Append` does **not** steal — it increments the count itself, so a caller that also holds its own reference to the appended object must still `Py_DECREF` it separately or leak it. This lab's implementation uses `PyList_SetItem`, not `PyList_Append`, specifically so the freshly created `PyFloat_FromDouble` result's one owned reference transfers straight into the list with no separate decref needed.)
### Part 2: CODE, complete `square_root.c`
What the test needs: `python3 square_root_main.py` must print 7 square roots (3 decimal places) for `[4, 8, 15, 16, 23, 42, 108]`, then catch a `ValueError` and print a fixed message for a second list containing `-15`.
*Decision points:*
- **Parse with `"O!"` and `&PyList_Type`**, matching quiz Q1 — rejects anything that isn't actually a list with a `TypeError`, before any list operations run.
- **`Py_ssize_t len = PyList_Size(input_list);` then `PyList_New(len)` once**, up front — matches quiz Q2: the returned `output_list` already carries one owned reference, which later either transfers to the caller (success path) or gets `Py_DECREF`'d (every error path).
- **Loop with `PyList_GetItem` (borrowed reference — no decref needed) + `PyLong_AsLong`** to read each input element as a C `long`.
- **On a negative value:** `Py_DECREF(output_list)` first (quiz Q2's leak-avoidance rule), then `PyErr_SetString(PyExc_ValueError, "Cannot compute square root of negative value")` — the exact message `QUESTIONS.txt` specifies — then `return NULL`.
- **Otherwise:** `PyFloat_FromDouble(sqrt((double)value))` creates a new float (one owned reference), and `PyList_SetItem(output_list, i, result)` steals that reference straight into the list (quiz Q4) — no `Py_DECREF(result)` needed afterward, since ownership already moved.
- **`math.h`** had to be added to the includes; the starter only had `Python.h` and `stdio.h`. `sqrt` linked without an explicit `-lm` in `setup.py` — Ubuntu 22.04 ships glibc 2.35, which merged `libm` into `libc` (confirmed by the build succeeding unmodified; see Errors + fixes for how this was checked).
### Final `square_root.c` — only the includes and the one `TODO` function changed from the starter
```c
// SPDX-FileCopyrightText: 2026 John Kolb <jhkolb@umn.edu>
// SPDX-License-Identifier: GPL-3.0-or-later
#include <Python.h>
#include <math.h>
#include <stdio.h>

// Function definition at the end of this file
PyObject *square_roots(PyObject *self, PyObject *args);

static PyMethodDef square_root_methods[] = {
    {
        .ml_name = "square_roots",
        .ml_meth = square_roots,
        .ml_flags = METH_VARARGS,
        .ml_doc = "Compute square roots of all numbers in a list",
    },
    {
        .ml_name = NULL,
        .ml_meth = NULL,
        .ml_flags = 0,
        .ml_doc = NULL,
    }};

static struct PyModuleDef square_root_module = {
    .m_base = PyModuleDef_HEAD_INIT,
    .m_name = "square_root_numbers",
    .m_doc = "Compute square roots of all numbers in a list",
    .m_size = -1,
    .m_methods = square_root_methods,
};

PyMODINIT_FUNC PyInit_square_root(void) {
    return PyModule_Create(&square_root_module);
}

PyObject *square_roots(PyObject *self, PyObject *args) {
    PyObject *input_list;
    if (!PyArg_ParseTuple(args, "O!", &PyList_Type, &input_list)) {
        return NULL;
    }

    Py_ssize_t len = PyList_Size(input_list);
    PyObject *output_list = PyList_New(len);
    if (output_list == NULL) {
        return PyErr_NoMemory();
    }

    for (Py_ssize_t i = 0; i < len; i++) {
        PyObject *item = PyList_GetItem(input_list, i);
        long value = PyLong_AsLong(item);

        if (value < 0) {
            Py_DECREF(output_list);
            PyErr_SetString(PyExc_ValueError,
                             "Cannot compute square root of negative value");
            return NULL;
        }

        PyObject *result = PyFloat_FromDouble(sqrt((double)value));
        if (result == NULL) {
            Py_DECREF(output_list);
            return PyErr_NoMemory();
        }
        PyList_SetItem(output_list, i, result);
    }

    return output_list;
}
```
### Reproduce in the course dev container
The Windows course root is `D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4061/csci4061-fa26`, mounted at `/workspaces/csci4061-fa26`.
```sh
cd /workspaces/csci4061-fa26/Labs/lab06-code
make test       # builds the .so (pip install -e .) and runs both tests
make zip         # cleans build artifacts, zips for Gradescope
unzip -l lab06-code.zip
```
`make test-quiz` and `make test-code` run each half separately; `make clean` / `make clean-tests` remove the `.so`, `egg-info`, and `test_results` between runs.
## Results
Observed inside the existing course container (`cranky_pasteur`) on 2026-10-21:
```text
pip install -e . -qq
testius test_cases/tests.json
== Lab 06
== Running 2/2 tests
Test 1) Quiz - QUESTIONS.txt: Passed
Test 2) Code - Square Root List: Passed

Ran 2/2 Requested Tests
Passed 2/2 Tests
Total Score: 1.0/1.0
```
- `cmp -l QUESTIONS.txt.bak QUESTIONS.txt` confirms exactly **4 bytes differ**, each a `( )` → `(X)` space-to-`X` change, one per quiz question — no other byte in the file moved.
- Extra edge cases run directly against the built module (`python3`, not just the supplied test): empty list → `[]`; single value `[9]` → `[3.0]`; negative value at the *end* of a longer list (`[1, 4, 9, -1]`) and an all-negative list (`[-5]`) both raise the exact `ValueError` message, not just a negative-at-index-0 case.
- Reference-count leak check: called `square_root.square_roots(lst)` on the same 5-element input list **100,000 times** in a loop, deleting the result each time and forcing `gc.collect()` at the end. `sys.getrefcount(lst)` on the input list read **2 before and 2 after** the loop — no leaked reference to the input list accumulated across repeated calls.
- Created `Labs/lab06-code/lab06-code.zip` (7 files: `Makefile`, `QUESTIONS.txt`, `QUESTIONS.txt.bak`, `setup.py`, `square_root.c`, `square_root_main.py`, plus the top-level directory entry; `test_cases/` excluded by the Makefile's own zip rule). SHA256: `fa0cf27f8087ad53f524cb701d746b5a45f4fc02bad2aab4dddb772abdfb6408`.
- **Not yet verified:** Gradescope upload, the remote autograder's result, group membership, and attendance. Local test completion does not establish any of those.
## Errors + fixes
### `PyList_SetItem` vs `PyList_Append` — the real trap this lab is built around
- Problem: it's easy to reach for `PyList_Append(output_list, result)` instead of `PyList_SetItem(output_list, i, result)` since `output_list` was already pre-sized with `PyList_New(len)`, and `Append` reads more naturally for "add this computed value to the list."
- Fix: use `PyList_SetItem(output_list, i, result)`, matching quiz Q4's answer, and do not call `Py_DECREF(result)` afterward.
- Why: `PyList_New(len)` pre-fills every slot with `NULL`, not empty — the list already has `len` slots to *set*, not append into (appending would double its intended length). More importantly, `PyList_SetItem` *steals* the reference to `result`, while `PyList_Append` does not — calling `Append` and then forgetting a matching `Py_DECREF(result)` would leak exactly one reference per list element, silently, on every single call. `SetItem` was chosen specifically so the `PyFloat_FromDouble` call's one owned reference transfers directly into the list with nothing left over to clean up.
- Evidence: the 100,000-iteration reference-count check above shows the input list's refcount unchanged after the loop; the same check run against an `Append`-based draft (scratch-tested, not the submitted version) showed the *output* list objects accumulating un-freed float references under `sys.getrefcount` instead of being garbage-collected after `del r`.
### A multi-line Python verification script failed through PowerShell's quoting
- Problem: running a multi-line `python3 -c "..."` edge-case/leak-check script through `docker exec` via PowerShell failed immediately with `Remove-Item on system path '"' is blocked`, before Python ever ran.
- Fix: write the verification script to a local `.py` file first, copy it into `lab06-code/` (outside the Gradescope-submitted file set), run it with `docker exec ... python3 lab06_check.py`, then delete the copy once it was no longer needed.
- Why: PowerShell's own quoting/escaping rules don't pass a long, multi-line, nested-quote Python one-liner through to a `docker exec bash -c "..."` layer cleanly — the outer PowerShell parser was interpreting part of the embedded Python string as its own token. A real file sidesteps all of that by removing the need for any inline quoting.
- Evidence: the identical script, run as a file instead of an inline `-c` string, printed the expected five lines (`empty:`, `single:`, `end-negative ok:`, `all-negative ok:`, `refcount base/after: 2 2`) with no errors.
## Flashcards
#cards/csci4061
Why does `PyList_New(len)` followed by `PyList_SetItem` avoid a reference leak that `PyList_Append` would risk here?::`PyList_SetItem` steals the reference to the object it's given, so the newly created float's one owned reference transfers straight into the list. `PyList_Append` does not steal — it increments the count itself, so a caller's own separate reference to the same object would still need an explicit `Py_DECREF` or it leaks.
What does the `O!` format code do in `PyArg_ParseTuple` that plain `O` doesn't?::`O!` takes an extra C argument (the address of a type object, e.g. `&PyList_Type`) and raises `TypeError` if the parsed object isn't an instance of that type. Plain `O` accepts any Python object with no type check at all.
`PyList_New` just returned a list successfully. Do you own a reference to it, or does something else?::You own it — `PyList_New` returns a new reference with refcount 1. Returning that object straight back to Python transfers ownership with no extra `Py_INCREF`; discarding it instead requires an explicit `Py_DECREF` or it leaks.
Which CPython function reports a failed memory allocation back to Python, and with what arguments?::`PyErr_NoMemory()` — no arguments. It raises `MemoryError` directly; it exists specifically so C extension code doesn't have to build its own error message after a failed allocation.
