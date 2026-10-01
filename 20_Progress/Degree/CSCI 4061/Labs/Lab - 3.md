---
type: class
input_kind: lab
status: seed
created: 2026-10-01
updated: 2026-10-01
area:
  - "[[CSCI 4061 Board]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]]"
deadline: 2026-10-01
tags:
  - "#class"
  - "#Lab"
next: "Open lab03-code in the dev container, paste the sigaction()/global-flag fix into wc_signal.c, run make test-quiz and make test-code, then make zip and submit before the deadline"
---
# Lab - 3
==Lab 3 turns `wc_signal`'s uncatchable Ctrl-C into a caught `SIGINT`: install a `sigaction()` handler with `SA_RESTART` that flips a `volatile sig_atomic_t` flag, so `main()`'s read loop exits cleanly and still prints the running counts instead of dying mid-count.== Direct continuation of Lab 2's fd/signal material into Week 3's `sigaction`/`SA_RESTART`/reentrancy content.
**Sources read:** `CSCI 4061 Lab 03.pdf` (TA slides, 12 pages, "Catching SIGINT Gracefully"), Lec05 (9/22, signal concepts, `sigaction` struct), Lec06 (9/24, `SA_RESTART`, reentrancy, `errno` save/restore), [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]] §10.5-10.6, §10.14. `lab03-code/` itself (the starter `wc_signal.c`, `QUESTIONS.txt`, `test_cases/`) has not yet been opened in the dev container this session — see Open Questions.
## Goal
- Catch `SIGINT` in `wc_signal` instead of letting its default action (terminate) throw away the running line/word/char counts, by installing a `sigaction()` handler that sets a flag `main()`'s read loop checks every iteration.
## Procedure / key steps
### The problem the lab demonstrates first
`wc_signal`'s loop reads one character at a time with `fgetc(stdin)` until EOF, incrementing counters, then prints totals. Piped against a finite stream (`seq 10 | ./wc_signal`) it behaves normally — EOF ends the loop, counts print. Piped against an infinite stream (`yes | ./wc_signal`) the loop never sees EOF, and before any fix, Ctrl-C's default `SIGINT` action kills the process outright — the counts it had already accumulated are simply lost, because nothing intercepts the signal before the kernel's default termination runs.
### `struct sigaction`'s three fields
- `sa_handler`: the handler function pointer (or `SIG_IGN`/`SIG_DFL`) — same shape as [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter 10]] §10.14's `struct sigaction`.
- `sa_mask`: signals to additionally block while the handler itself is running; `sigfillset(&sa.sa_mask)` blocks everything else for the handler's duration, same pattern as the course's own `sigaction` examples in Week 3.
- `sa_flags`: `SA_RESTART` is the one this lab turns on.
### Why `SA_RESTART` specifically matters here
`wc_signal`'s read sits inside `fgetc`, which blocks in the kernel's `read()` underneath. Without `SA_RESTART`, a caught `SIGINT` makes that `read()` fail with `errno == EINTR` once the handler returns, and the caller would need its own manual retry loop (Chapter 10 §10.5's "slow system call" problem). With `SA_RESTART` set, the kernel resumes the interrupted `read()` automatically once the handler returns, and the surrounding C code never has to detect or handle `EINTR` itself.
### The handler-to-main() handoff: `volatile sig_atomic_t`
The handler's only job is to flip a flag — `running = 0;` — never to do real work like `printf` or `malloc` directly, since those aren't async-signal-safe (Chapter 10 §10.6's reentrancy hazard, taught the same week). `main()`'s loop condition (`while (running)`) has to actually re-read that flag from memory every iteration rather than trust a cached register copy, which is exactly what `volatile` guarantees; `sig_atomic_t` is the one integer type ISO C guarantees a handler can read or write without risk of a torn, half-written value. The slides flag that the *starter* code's plain `int keep_going` happens to work anyway, purely because `fgetc` already forces a fresh read each call — but the correct type to actually write is `volatile sig_atomic_t`, not the lucky-by-accident plain `int`.
### The four-step install, applied to `SIGINT`
Mirrors the slide deck's own `SIGTERM` worked example, retargeted at `SIGINT`:
1. `sa.sa_handler = handler;` — point at a tiny function that does nothing but `running = 0;`.
2. `sigfillset(&sa.sa_mask);` — block other signals while the handler runs.
3. `sa.sa_flags = SA_RESTART;` — auto-restart the interrupted `read()`.
4. `sigaction(SIGINT, &sa, NULL)` — register it, and check for `-1` the same way every other lab/lecture example in this course does (`perror` + return 1 on failure).
### What `wc_signal.c` needs end to end
```c
volatile sig_atomic_t running = 1;
void handler(int signum) {
    running = 0;
}
int main(void) {
    struct sigaction sa = {0};
    sa.sa_handler = handler;
    sigfillset(&sa.sa_mask);
    sa.sa_flags = SA_RESTART;
    if (sigaction(SIGINT, &sa, NULL) == -1) {
        perror("sigaction");
        return 1;
    }
    while (running) {
        int cur_char = fgetc(stdin);
        if (cur_char == EOF) {
            running = 0;
        } else {
            /* existing counting logic */
        }
    }
    printf("%d lines, %d words, %d chars\n", num_lines, num_words, num_chars);
    return 0;
}
```
The exact wiring into the real starter file's variable names (`keep_going` vs. `running`, the existing counting branch) still needs to be done against the actual `lab03-code/wc_signal.c` — see Open Questions.
## Results
> [!WARNING]
> Not yet run. This note was built from the TA slide deck's worked example and the matching lecture/textbook material, not from an actual edit-compile-test pass inside the course Docker container. Per the Lab Standard, no test output is claimed here until it has actually been observed — fill this section in after running `make test-quiz`, `make test-code`, and `make test` against the real `lab03-code/`.
## Errors + fixes
<!-- Add one Problem/Fix/Why entry for every real error. Explain the mechanism behind the fix. -->
- Not yet populated — no real run has happened against this lab's actual starter code yet.
## Flashcards
#cards/csci4061
Why does `wc_signal`'s handler only set a flag instead of printing the counts directly?::A signal handler should do the minimum possible and avoid non-reentrant functions like `printf`; printing from inside the handler risks corrupting `stdio`'s own internal buffering state if the main code was mid-`printf` when the signal landed. Setting a flag and letting `main()` print after the loop exits keeps all the real work on the main execution path.
What does `SA_RESTART` change about `fgetc`'s behavior when `SIGINT` is caught mid-read?::Without it, the interrupted `read()` underneath `fgetc` fails with `errno == EINTR` and the caller must retry manually. With `SA_RESTART` set on the handler's `sigaction`, the kernel transparently restarts the same `read()` once the handler returns, so `wc_signal`'s loop never even sees an interruption.
Why `volatile sig_atomic_t` instead of a plain `int` for the running flag, even if a plain `int` happens to work here?::`sig_atomic_t` is the only type ISO C guarantees a handler can read or write without a torn value; `volatile` forces `main()`'s loop to re-read the flag from memory every iteration instead of trusting a register-cached copy an optimizing compiler might otherwise keep. A plain `int` can work by accident (as the starter code does, since `fgetc` forces a fresh read anyway) without being correct in general.
## Open Questions
- [ ] Open `lab03-code/` in the dev container (VS Code "Reopen in Container", same workflow as Lab 2) and confirm the real starter file's variable names, the quiz questions in `QUESTIONS.txt`, and exactly which lines are the TODO blocks.
- [ ] Run `make test-quiz` and `make test-code`, fill in Results with real output, and record any real Problem/Fix/Why entries from the actual build.
- [ ] Confirm the deadline against Canvas/Gradescope directly — `11:59pm the Wednesday following` the Monday lab session, per [[CSCI 4061 Board]]'s Labs policy.
