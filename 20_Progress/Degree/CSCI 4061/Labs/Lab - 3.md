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
next: "Paste the handler + sigaction block into wc_signal.c (change `int keep_going` to `volatile sig_atomic_t keep_going`), mark the 3 QUESTIONS.txt answers, run `make test` inside the dev container, then `make zip` and upload lab03-code.zip to Gradescope before 11:59pm 2026-09-30"
---
# Lab - 3
==Lab 3 catches SIGINT the right way: instead of letting Ctrl-C kill `wc_signal` mid-count, `sigaction()` installs a handler that just flips a `volatile sig_atomic_t` flag, and `SA_RESTART` lets the interrupted `fgetc()` finish instead of failing with `EINTR`. The counting logic itself (already complete in the starter code) never changes — only the shutdown path does.==
**Sources read:** lab page (Canvas), `CSCI 4061 Lab 03.pdf` (TA slides, 12 pages), `lab03-code/` (every file, including `test_cases/`), `Lecture/lecture05-code/block_sigint.c` (same course's `sigprocmask`/`sigaddset` pattern, for error-handling-style consistency), `sigaction(2)`.
## Goal
<!-- State the task in your own words, not the lab title. -->
- Replace `wc_signal`'s default "Ctrl-C kills the process" behavior with a caught SIGINT that still reports the running line/word/char counts before exiting, using `sigaction()` + a `volatile sig_atomic_t` flag instead of the deprecated `signal()`.
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
	(X) **`SA_RESTART`.** `SA_AGAIN`/`SA_SYSCALL` aren't real flags; `SA_RESETHAND` resets the handler back to `SIG_DFL` after one delivery, unrelated to restarting syscalls. Without `SA_RESTART`, an interrupted `read()`/`fgetc()` fails with `errno = EINTR` and the caller has to notice and retry by hand (slide "Why SA_RESTART?").
2. **How does `sigaction()` register a custom handler?**
	(X) **The `sa_handler` field of a `struct sigaction` is set to the function, and the struct is passed to `sigaction()`.** Not a bare function-pointer argument (that's the older `signal()` API) and not a naming convention — `sigaction()` only ever looks at the struct it's handed.
3. **How does a handler tell `main()` a signal arrived?**
	(X) **Change the value of a global variable.** `printf()` isn't async-signal-safe (calling it again from inside a handler that interrupted another `stdio` call mid-buffer-flush can corrupt state or deadlock), and sending a second signal or recursing just reintroduces the same problem one level down. A `volatile sig_atomic_t` global is the one type C guarantees a handler can write atomically and `main()` can safely re-read every loop iteration.
### Part 2: CODE, complete wc_signal.c
*Decision points:*
- **`volatile sig_atomic_t keep_going`, not plain `int keep_going`.** The starter code's `int` happens to work here only because `fgetc()` forces the compiler to re-read memory every call — the slides call this out explicitly as something to fix anyway, since it isn't guaranteed by the C standard in general and a stray compiler optimization elsewhere could cache the flag in a register and never see the handler's write.
- **Handler does exactly one thing: `keep_going = 0;`.** No `printf`, no cleanup, no recursion — matches "keep the handler tiny" from the slides and the signal-safety reasoning behind quiz question 3.
- **`struct sigaction sa = {0};` then fill three fields**, matching the slide's SIGTERM example and `lecture05-code/block_sigint.c`'s own `if (x != 0 / == -1) { perror(...); return 1; }` error style:
	- `sa.sa_handler = handle_sigint;`
	- `sigfillset(&sa.sa_mask);` — blocks all other signals while the handler runs, so a second signal can't interrupt the handler itself.
	- `sa.sa_flags = SA_RESTART;`
- **Register it for `SIGINT` only** (`sigaction(SIGINT, &sa, NULL)`), check for `-1`, `perror("sigaction"); return 1;` on failure — same syscall-check pattern this course has used since Lab 1.
- **Nothing else in the file changes.** The counting loop, the EOF branch, and the two `printf`s at the bottom were already correct; the task is isolated to interrupting that loop gracefully, not rewriting the counting logic.
### Final `wc_signal.c` (verified, see Results)
```c
// wc_signal.c: Counts lines/words/chars like wc but with graceful
// shutdown/reporting of results when SIGINT is received (e.g., from
// (Ctrl-c in a terminal).

#define _GNU_SOURCE

#include <ctype.h>    // provides isspace() and other char type funcs
#include <signal.h>
#include <stdio.h>
#include <unistd.h>

volatile sig_atomic_t keep_going = 1;    // control variable to continue loop

// Signal handler: only sets the flag. printf() and friends are not
// async-signal-safe, so all reporting happens back in main().
void handle_sigint(int signum) {
    keep_going = 0;
}

int main(int argc, char *argv[]) {
    struct sigaction sa = {0};
    sa.sa_handler = handle_sigint;
    sigfillset(&sa.sa_mask);
    sa.sa_flags = SA_RESTART;
    if (sigaction(SIGINT, &sa, NULL) == -1) {
        perror("sigaction");
        return 1;
    }

    int num_words = 0;
    int num_lines = 0;
    int num_chars = 0;

    char last = ' ';    // Pretend last character is a space to start
    while (keep_going) {
        int cur_char = fgetc(stdin);

        if (cur_char == EOF) {
            keep_going = 0;
            if (last != '\n') {
                // Input ends without newline, so we add to line count
                num_lines++;
            }
        } else {
            num_chars++;
            if (cur_char == '\n') {
                num_lines++;
            }
            if (!isspace(cur_char) && isspace(last)) {
                // We've hit start of a new word
                num_words++;
            }
        }

        last = cur_char;
    }

    printf("\n");    // Extra newline in case of keyboard signal
    printf("%d lines, %d words, %d chars\n", num_lines, num_words, num_chars);
    return 0;
}
```
## Results
<!-- State the actual output: numbers, tests, screenshots, or a working build. -->
- **Code verified 2026-09-30** in a scratch copy of `lab03-code`, built inside the real course dev container (`gcc -Wall -Werror -g`, the course's own ubuntu:22.04 image, not a host approximation). Zero warnings. Filled the scratch `QUESTIONS.txt` with the three answers above and ran `make test`:
```text
== Lab 03
== Running 2/2 tests
Test 1) Quiz - QUESTIONS.txt: Passed
Test 2) Code - wc-signal: Passed

Ran 2/2 Requested Tests
Passed 2/2 Tests
Total Score: 1.0/1.0
```
- Traced `test_cases/input/wc_signal.txt` against `test_cases/output/wc_signal.txt` by hand before trusting `testius`'s verdict (see Errors + fixes for why that mattered).
- **Not yet applied:** the real `wc_signal.c` and `QUESTIONS.txt` in `lab03-code/` are untouched — scratch copy only, matching how this vault's lab workflow verifies before hand-applying.
## Errors + fixes
<!-- Add one Problem/Fix/Why entry for every real error. Explain the mechanism behind the fix. -->
- Problem: the expected output for every Ctrl-C test case has exactly one more line and one more char than the matching EOF-only case with the same typed text (e.g. "Hello, world!" + EOF → `1 lines, 2 words, 14 chars`, but "Hello, world!" + Ctrl-C → `2 lines, 2 words, 15 chars`) — looked at first like the handler needed to do something extra to explain the discrepancy.
- Fix: no fix needed — the handler staying empty-except-for-the-flag is correct as-is.
- Why: `test_cases/input/wc_signal.txt` sends a trailing blank line (a bare `\n`) immediately after every `^C`. Because `SA_RESTART` lets the interrupted `fgetc()` finish instead of erroring, that queued `\n` still gets read and counted (`num_chars++`, `num_lines++`, no new word since `\n` is whitespace) *before* the loop re-checks `keep_going` and exits. The one-line/one-char delta is that trailing newline being read, not special post-signal logic — matches the slides' own "SIGINT → handler → restart → loop test → report" sequence exactly.
- Evidence: `make test` Test 2 passed only with `sa_flags = SA_RESTART` set; the all-chars-typed-then-Ctrl-C-only case traces to exactly `1 lines, 0 words, 1 chars`, which only makes sense if one more `\n` got read after the signal, confirming the mechanism rather than assuming it.
- Problem: `block_sigint.c` from Lecture 5 uses `sigprocmask()`/`sigaddset()` to *block* SIGINT, which looks at first glance like a different, maybe conflicting, mechanism from this lab's `sigaction()` handler.
- Fix: no fix needed — both are legitimate, and this lab correctly uses the handler approach, not blocking.
- Why: blocking (`sigprocmask`) defers delivery of a signal entirely until it's unblocked; installing a handler via `sigaction()` lets the signal interrupt execution immediately and run custom code. `wc_signal` needs the latter — it wants to react to Ctrl-C right away and report counts, not postpone reacting to it.
## Flashcards
<!-- Optional: add only reusable debugging-pattern cards to #cards/<course-slug>. -->
#cards/csci4061
Why does `wc_signal`'s expected Ctrl-C output always have one extra line and one extra char versus the matching EOF case?
?
`SA_RESTART` lets the interrupted `fgetc()` finish reading the newline already queued (from the test harness's blank line after `^C`) before the loop re-checks the flag and exits. That trailing `\n` gets counted normally — it's the restarted syscall completing, not special post-signal logic.
Why must the signal handler only set a `volatile sig_atomic_t` flag instead of calling `printf()` directly?
?
`printf()` is not async-signal-safe — if the signal interrupts another `stdio` call mid-buffer-flush, calling it again from the handler can corrupt internal state or deadlock. `sig_atomic_t` is the one type C guarantees a handler can write without it being torn by interruption; `volatile` stops the compiler from caching the old value in a register inside `main()`'s loop.
`sa_flags = 0` vs `sa_flags = SA_RESTART` — what actually changes for a blocking read?
?
With `0`, an interrupted syscall (like `fgetc()`'s underlying `read()`) returns `-1` with `errno = EINTR` and the caller must detect and retry it manually. With `SA_RESTART`, the kernel re-issues the syscall automatically after the handler returns, so the caller's code never sees the interruption at all.
