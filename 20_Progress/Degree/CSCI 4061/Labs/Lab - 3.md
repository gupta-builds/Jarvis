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
next: "Paste the handler + sigaction block into wc_signal.c (the two TODO spots only — leave `int keep_going` as-is), mark the 3 QUESTIONS.txt answers, run `make test` inside the dev container, then `make zip` and upload lab03-code.zip to Gradescope before 11:59pm 2026-09-30"
---
# Lab - 3
==Lab 3 catches SIGINT the right way: instead of letting Ctrl-C kill `wc_signal` mid-count, `sigaction()` installs a handler that just flips the existing `keep_going` flag, and `SA_RESTART` lets the interrupted `fgetc()` finish instead of failing with `EINTR`. The counting logic itself (already complete in the starter code) never changes — only the shutdown path does, and only inside the two `// TODO` spots.==
**Sources read:** lab page (Canvas), `CSCI 4061 Lab 03.pdf` (TA slides, 12 pages), `lab03-code/` (every file, including `test_cases/`), `Lecture/lecture05-code/block_sigint.c` (same course's `sigprocmask`/`sigaddset` pattern, for error-handling-style consistency), [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]] (Stevens & Rago, *Advanced Programming in the UNIX Environment* 3e, Ch. 10 "Signals" — pp. 328-330 §10.5 interrupted system calls/`SA_RESTART`, p. 350 §10.14 `struct sigaction` fields, pp. 330-331, 357 §10.6/§10.15 reentrancy and `sig_atomic_t`).
## Goal
<!-- State the task in your own words, not the lab title. -->
- Replace `wc_signal`'s default "Ctrl-C kills the process" behavior with a caught SIGINT that still reports the running line/word/char counts before exiting, using `sigaction()` instead of the deprecated `signal()`.
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
	(X) **`SA_RESTART`.** `SA_AGAIN`/`SA_SYSCALL` aren't real flags; `SA_RESETHAND` resets the handler back to `SIG_DFL` after one delivery, unrelated to restarting syscalls. Stevens Ch.10 §10.5 (p. 327-329): a caught signal arriving during a *slow* system call (`read`, `fgetc`'s underlying `read`, `pause`, `wait`) interrupts it, returning `-1` with `errno = EINTR`; before `SA_RESTART` existed every such call needed a manual `while (ret==-1 && errno==EINTR) retry;` loop. `SA_RESTART` makes the kernel reissue the call automatically once the handler returns.
2. **How does `sigaction()` register a custom handler?**
	(X) **The `sa_handler` field of a `struct sigaction` is set to the function, and the struct is passed to `sigaction()`.** Not a bare function-pointer argument (that's the older `signal()` API, p. 323) and not a naming convention — Stevens §10.14 (p. 350) lists `sa_handler` as one of the three fields `sigaction()` reads from the struct it's handed; it never inspects global names.
3. **How does a handler tell `main()` a signal arrived?**
	(X) **Change the value of a global variable.** Stevens §10.6 (pp. 330-331) names `printf`, `malloc`, `free`, `strtok`, `getpwnam` as explicitly non-reentrant — calling one from a handler while main-line code is mid-call to the same function can corrupt its internal state. Sending a second signal or recursing just reintroduces the same problem one level down. §10.15 (p. 357) is explicit that `sig_atomic_t`, paired with `volatile`, is the ISO C-guaranteed type for a flag shared between a handler and main-line code — that's the idiom this question is really pointing at, even though the lab's own starter code doesn't require applying it (see Procedure, Part 2).
### Part 2: CODE, complete wc_signal.c
Scope is deliberately minimal: touch only the two `// TODO` spots, nothing else. `int keep_going = 1;` stays exactly as the starter wrote it — the slides suggest `volatile sig_atomic_t` is the more portable idiom (Stevens §10.15, p. 357), and that's genuinely correct in general, but it isn't inside either TODO block, so it's left alone rather than rewritten on my own judgment.
*Decision points, both confined to the TODO regions:*
- **TODO 1 (above `main`): a one-line handler.** `handle_sigint(int signum) { keep_going = 0; }` — nothing else. No `printf`, no cleanup, no recursion, matching the signal-safety reasoning behind quiz question 3 and Stevens §10.6's non-reentrant-function list (pp. 330-331).
- **TODO 2 (top of `main`): `struct sigaction sa = {0};` then fill three fields**, matching the slide's SIGTERM example, Stevens §10.14 (p. 350), and `lecture05-code/block_sigint.c`'s own `if (x != 0 / == -1) { perror(...); return 1; }` error style:
	- `sa.sa_handler = handle_sigint;`
	- `sigfillset(&sa.sa_mask);` — blocks all other signals while the handler runs, so a second signal can't interrupt the handler itself.
	- `sa.sa_flags = SA_RESTART;`
- **Register it for `SIGINT` only** (`sigaction(SIGINT, &sa, NULL)`), check for `-1`, `perror("sigaction"); return 1;` on failure — same syscall-check pattern this course has used since Lab 1.
### Final `wc_signal.c` — minimal diff, only the two TODO blocks filled (verified, see Results)
```c
// wc_signal.c: Counts lines/words/chars like wc but with graceful
// shutdown/reporting of results when SIGINT is received (e.g., from
// (Ctrl-c in a terminal).

#define _GNU_SOURCE

#include <ctype.h>    // provides isspace() and other char type funcs
#include <signal.h>
#include <stdio.h>
#include <unistd.h>

int keep_going = 1;    // control variable to continue loop

// Handler: ends the main loop on SIGINT.
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
- **Code verified 2026-09-30**, minimal-diff version, in a scratch copy of `lab03-code` built inside the real course dev container (`gcc -Wall -Werror -g`, the course's own ubuntu:22.04 image, not a host approximation). Zero warnings. Filled the scratch `QUESTIONS.txt` with the three answers above and ran `make test`, step-verified in isolation (real file checked after every single sub-step — copy, each `sed`, then `make test` — to rule out any side effect on the real files, see Errors + fixes):
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
- Confirmed via `diff` against the real starter `wc_signal.c` that only the two `// TODO` regions changed — `int keep_going = 1;` is byte-identical to the starter.
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
- Problem: during verification, the **real** `Labs/lab03-code/QUESTIONS.txt` (not a scratch copy) ended up with `(X)` on two wrong answers (`SA_AGAIN`, `SA_SYSCALL`) alongside the correct one, even though every intended edit was scoped to a `/tmp` scratch copy inside the container.
- Fix: restored the real file from its own `QUESTIONS.txt.bak` (exactly what that backup exists for), confirmed byte-identical via `diff` afterward. Re-ran the same copy → mark → `make test` sequence three more times, checking the real file's content after *every individual sub-step* (the copy, each `sed`, and `make test` itself) — all three reruns left the real file untouched and finished `1.0/1.0`, so whatever caused the one bad run wasn't reproducible under controlled, single-step execution.
- Why: not conclusively identified — most likely a one-off quoting/escaping artifact in how one specific heavily-nested shell command got passed through (several apostrophes needing escaping, all crammed into one invocation), not a property of the approach itself. Recorded here because a `QUESTIONS.txt` that's wrong in a way that *looks* plausible (extra, incorrect `(X)` marks rather than an obvious syntax break) is exactly the kind of error that's easy to submit by accident without a careful diff first.
- Evidence: `grep -c "(X)"` on the real file before this session's edits returned 1 (only the instructional sentence that contains the literal text "(X)", zero real answers marked); after the bad run it returned 4 real marks instead of the intended 3, with two of them wrong.
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
