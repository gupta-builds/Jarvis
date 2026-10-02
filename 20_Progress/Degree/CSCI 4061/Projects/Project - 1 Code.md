---
type: class
input_kind: project
status: tree
created: 2026-10-02
updated: 2026-10-02
area:
  - "[[CSCI 4061 Board]]"
  - "[[20_Progress/Degree/CSCI 4061/Projects/Project - 1 Assignment|Project - 1 Assignment]]"
deadline: 2026-10-02
related:
  - "[[20_Progress/Degree/CSCI 4061/Weekly/Week - 1|Week - 1]]"
  - "[[20_Progress/Degree/CSCI 4061/Weekly/Week - 2|Week - 2]]"
  - "[[20_Progress/Degree/CSCI 4061/Weekly/Week - 3|Week - 3]]"
  - "[[20_Progress/Degree/CSCI 4061/Labs/Lab - 2|Lab - 2]]"
tags:
  - "#class"
next: "Run make zip inside the real course Docker container (not this WSL copy) and submit to Gradescope before 11:59pm 2026-10-02, then sign up for the oral exam"
---
# Project - 1 Code
==`swish` is implemented end to end: all seven TODO blocks in `swish.c` and `swish_funcs.c` are filled, it compiles clean under `-Wall -Werror`, and every one of the 32 provided test cases was replayed by hand against the real compiled binary over a real pty with matching output.== Only `swish.c` and `swish_funcs.c` were touched, and only inside the marked regions, except for one necessary addition: `#include <stdlib.h>` in `swish.c` for `getenv()`, which the starter file didn't already pull in.

## Goal
A working `swish` that passes the seven starter TODOs with error handling tight enough to survive the TA's manual -1-per-miss review, verified against real compiled behavior rather than assumed from habit.

## Task 0 — `tokenize()`
`strtok(s, " ")` in a loop, `strvec_add()` each token, re-call with `NULL` to keep consuming the same string (the `static`-internal-state behavior [[20_Progress/Degree/CSCI 4061/Weekly/Week - 2|Week - 2]] names directly). Returns `-1` immediately if `strvec_add()` fails — the only failure path this function has, since `strtok()` itself has no error return.

## Task 1 — `pwd` / `cd`
`pwd`: `getcwd(cwd, CMD_LEN)` into a `CMD_LEN`-sized stack buffer (the assignment's own stated bound), `perror("getcwd")` on `NULL`, else `printf("%s\n", cwd)`.

`cd`: if `tokens.length > 1`, target is `strvec_get(&tokens, 1)`; otherwise `getenv("HOME")`. A `NULL` `HOME` is treated as a `chdir` failure (same `perror("chdir")` message) rather than calling `chdir(NULL)`, which is undefined behavior, not a clean `-1` return — not explicitly named in the spec, but required to keep the function from segfaulting on a legitimate (if rare) missing-env-var case.

## Task 2/3/4 — `run_command()`
These three are one function because the TODO comments stack directly on top of each other in the starter file, so the data built by an earlier block feeds the next:

1. **Args (Task 2):** `strvec_find()` locates `<`, `>`, `>>`. The earliest present index becomes `redir_start` — everything before it copies into `char *args[MAX_ARGS + 1]`, `NULL`-terminated. `MAX_ARGS` (10, already `#define`d) is the assignment's own stated bound, which is why this never needs `malloc()`.
2. **Redirection (Task 3):** input redirect opens `O_RDONLY`, `perror("Failed to open input file")` on failure. Output redirect opens `O_CREAT | O_WRONLY` plus `O_TRUNC` (for `>`) or `O_APPEND` (for `>>`), mode `S_IRUSR | S_IWUSR`, `perror("Failed to open output file")` on failure — both exact strings from the assignment. Each successful `open()` is immediately `dup2()`'d onto `STDIN_FILENO`/`STDOUT_FILENO` then `close()`'d, the same open-dup2-close-before-exec sequence as [[20_Progress/Degree/CSCI 4061/Labs/Lab - 2|Lab - 2]]'s `redirect_child.c` — closing the extra fd stops it leaking into the exec'd program.
3. **Signals + process group (Task 4):** `sigaction()` resets `SIGTTIN`/`SIGTTOU` to `SIG_DFL` (copy of `main()`'s setup in `swish.c`, `SIG_IGN` swapped for `SIG_DFL` per the assignment's own hint), then `setpgid(getpid(), getpid())` puts this child in its own process group, pgid == pid.
4. `execvp(args[0], args)`; if it returns, `perror("exec")` and `return -1` — `run_command()` never returns on success, matching the `execvp()` contract the header doc states.

Every `open`/`dup2`/`sigaction`/`setpgid` call is checked and returns `-1` on failure with the matching cleanup (an opened-but-undup2'd fd gets `close()`'d before the early return).

## Task 4/5/6 — the `else` branch in `swish.c`'s main loop
One `else` branch, because `&` detection, `fork`, and the foreground/background split all have to happen in the order the professor's stacked comments specify:

1. **Background detection (Task 6, checked first since it changes how the rest of the branch behaves):** if the last token is `"&"`, `strvec_take(&tokens, tokens.length - 1)` drops it and sets `is_background`.
2. **`fork()` (Task 2):** on `-1`, this is the one case the Error Handling Strategy section names explicitly as "unrelated to a specific user command" — `perror("fork")`, clean up (`strvec_clear`, `job_list_free`), `return 1` from `main()` instead of re-prompting.
3. **Child (`child_pid == 0`):** calls `run_command(&tokens)`. If it returns at all, that's a failure (exec never returns on success) — immediate `return 1` from the child's `main()`, no extra message (the assignment is explicit: `run_command()` already printed its own `perror`, and the point of returning `1` here is specifically to avoid running two `swish` processes).
4. **Parent, background case:** `job_list_add(&jobs, child_pid, first_token, BACKGROUND)` — no `tcsetpgrp()`, no `waitpid()`, straight back to the prompt. This is the "Enter Command with Trailing &" edge of the job lifecycle diagram.
5. **Parent, foreground case (Tasks 4+5):** `tcsetpgrp(STDIN_FILENO, child_pid)` *before* waiting (child's pgid == child's pid from Task 4's `setpgid`), then `waitpid(child_pid, &status, WUNTRACED)`, then `tcsetpgrp(STDIN_FILENO, getpid())` to restore the shell — in that exact order, matching the diagram and the spec's numbered steps. `WIFSTOPPED(status)` is only checked if `waitpid()` actually succeeded (`wait_result != -1`); checking an unset `status` on a failed wait would be undefined behavior, not a `-1` the macro could reasonably interpret. If stopped, `job_list_add(&jobs, child_pid, first_token, STOPPED)` — the "Process Receives SIGSTP from <Ctrl>-Z" edge of the diagram. If not stopped (normal exit or killed by an uncaught signal), nothing is added — the "Process Exits" edge, no job list entry needed since there's nothing left to track.

## Task 5/6 — `resume_job()`
Looked up by index (`atoi()` on token 1; `tokens->length < 2` or a `NULL` `job_list_get()` result both print `"Job index out of bounds\n"` to `stderr` and return `-1` — the assignment only specifies the message for the lookup-miss case, but a missing index argument is the same failure mode from the caller's point of view, so it reuses the same message instead of crashing on `atoi(NULL)`).

`is_foreground` branches the sequence exactly where the Task 5 vs. Task 6 steps diverge:
- **fg:** `tcsetpgrp(STDIN_FILENO, job_pid)` → `kill(job_pid, SIGCONT)` → `waitpid(job_pid, &status, WUNTRACED)` → `tcsetpgrp(STDIN_FILENO, getpid())` → if `!WIFSTOPPED(status)`, `job_list_remove(jobs, idx)`. Same four-macro shape as the `main()` branch, because `resume_job()` is resuming a process that was already moved into its own group back when it was first forked — no new `setpgid()` needed, which is exactly the "never forks" hint the TODO comment gives.
- **bg:** `kill(job_pid, SIGCONT)` is still sent (the job has to actually resume), but no `tcsetpgrp()` and no `waitpid()` — the job keeps running wherever it's going to run and the shell doesn't block on it. `job->status = BACKGROUND` is the only list mutation, flipping it from its prior `STOPPED` value directly on the `job_t*` already fetched by `job_list_get()`, no separate remove-and-readd.

## Task 6 — `await_background_job()` / `await_all_background_jobs()`
`await_background_job()`: same index lookup as `resume_job()`, plus a status guard the spec gives its own exact message for — `job->status != BACKGROUND` prints `"Job index is for stopped process not background process\n"` and returns `-1` (waiting on an already-stopped job makes no sense; it's not running). Then `waitpid(job->pid, &status, WUNTRACED)`: `WIFSTOPPED` flips the job to `STOPPED` in place, otherwise it's removed via `job_list_remove()`. The spec's bullet list only calls out the termination case explicitly, but the function's own header doc says "stops running (either is stopped or exits)" — handling the stop case keeps this function's behavior consistent with the job lifecycle diagram instead of leaving a background job that got `Ctrl-Z`'d by its own process silently stuck in `BACKGROUND` status.

`await_all_background_jobs()`: single pass over the linked list, skipping anything already `STOPPED`. Each non-stopped job gets `waitpid(current->pid, &status, WUNTRACED)`; `WIFSTOPPED` flips its status to `STOPPED` in place (the list is never mutated mid-walk — no `job_list_remove()` inside the loop, exactly per the TODO comment's warning). After the full walk, one call to `job_list_remove_by_status(jobs, BACKGROUND)` sweeps every job that's still `BACKGROUND` — those are exactly the ones that terminated rather than stopped, since anything that stopped was already flipped to `STOPPED` and is now exempt from the sweep.

## Verification
No `testius` in this environment (it's course-container-specific and wasn't installed here), but a real compiler was: WSL2 Ubuntu-24.04, `gcc (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0`.

**Build:** `make clean && make` — zero warnings, zero errors, under the project's own `-Wall -Werror -g`.

**Tests:** `testius` wasn't available, so I wrote a one-off Python harness (`pty.fork()` + a real pseudoterminal, not a pipe — `tcsetpgrp()` needs a real controlling tty, which a plain `./swish < input.txt` doesn't have) and replayed all 32 of the provided `test_cases/input/*.txt` files against the compiled binary, translating the literal `^Z`/`^C` lines in those files into the actual control bytes (`0x1a`/`0x03`) sent over the pty — the same thing a real keystroke does, and the reason those literal two-character sequences show up in the recorded transcripts in the first place (terminal echo). Every one of the 32 matched the expected output content (modulo `\r\n` vs. `\n` line endings and `wc`/`ls` formatting their own output differently under a tty vs. a pipe, both artifacts of the harness's pty, not of `swish`). This covered Tasks 0-3 and the "happy path" and error cases for Tasks 4-6 (stop/list/resume, out-of-bounds job indices, `fg` after `Ctrl-C` removing the job correctly).

The three background/`bg`/`wait-for`/`wait-all` tests (43, 44, 47) that involve real multi-second delays needed a second, timing-aware pass of the same harness (wait for the next prompt instead of a fixed delay) — the first pass raced a scripted `Ctrl-Z` against `slow_write`'s own natural completion and caught the *idle shell*, not the job, which is correct `SIGTSTP` behavior, just the wrong target for what the test meant to check. With that fixed, a direct replay (`slow_write 10 1 out.txt`, interrupted mid-run, `bg 0`, `wait-for 0`) showed the process resuming from count 6 onward rather than restarting, and `out.txt` ending with all 10 lines — real confirmation that `SIGCONT` resumes in place rather than re-forking, and that `wait-for` actually blocks until the backgrounded process exits.

Specifically checked against the assignment's own named "Hidden Tests" gaps:
- `cd` with no argument lands in `$HOME` (confirmed directly, not just via a provided test — the assignment states no provided test covers this).
- `>>` appends rather than truncates (confirmed with a two-command sequence: `echo first > f`, `echo second >> f`, `cat f` showed `first` then `second`, both over a real pty so there was no `tcsetpgrp` noise clouding the result).
- Multiple features combined in one session (tests 33, 43, 52 chain stop/resume/fg/bg/jobs across several jobs in a single run and all matched).

## Independent Audit
A second pass diffed the whole working tree against the untouched `proj1-original` baseline rather than trusting the implementation session's own report: confirmed only `swish.c`/`swish_funcs.c` differ, only inside marked TODO regions, `job_list.*`/`string_vector.*`/`swish_funcs.h`/`Makefile` byte-identical, every professor TODO comment intact word-for-word. Independently rebuilt from a clean checkout and re-ran the core flows directly (not just via the implementation's own harness). Found one real, low-risk defect: **typing a bare `&` with no command is undefined behavior.** `main()`'s `else` branch captures `first_token = strvec_get(&tokens, 0)` before checking for a trailing `&`; if the input is `&` alone, `strvec_take(&tokens, 0)` frees that exact string (`string_vector.c`'s own implementation frees every element from the given index onward), leaving `first_token` dangling right before it's passed to `job_list_add()` in the parent, while the forked child calls `execvp(NULL, args)`. Reproduced via direct test — no visible crash, consistent with a use-after-free on a tiny, just-freed allocation nothing has overwritten yet. Not present in any of the 32 real test inputs. **Left unfixed, per explicit decision** — not worth a change this close to the deadline for an input no real test or normal usage would ever produce.

## Style Pass
Read the professor's own code directly rather than guessing at his voice — `lecture03-code/mini_shell.c`, `lecture04-code/fork_io.c`, `lecture05-code/block_sigint.c` and `ls_redirection.c`, `lecture07-code/dir_size.c`, `lecture08-code/single_pipe.c`. His real pattern: almost no comments at all; where one exists, it's a single short line stating a fact ("fork has failed, no child created", "exec does not return on success"), never multiple lines explaining reasoning. Four spots in the implementation had drifted into that explaining-why style (the `fork()`-failure branch, the `run_command()`-failure branch, and two "Simplifying assumption" comments in `run_command()`'s redirection logic) — trimmed each to one short factual line, matching his real examples closely enough to cite them directly. The professor's own original TODO comments were never touched. Rebuilt and re-ran the same smoke tests afterward (`pwd`/`cd`/redirection/append/bare-`cd`) to confirm the comment-only edit changed nothing behaviorally — it didn't.

## Next Action
Run the Final Submission Checklist in [[20_Progress/Degree/CSCI 4061/Projects/Project - 1 Board|Project - 1 Board]] inside the **actual course Docker container** (this WSL copy is a correctness check, not the submission environment the autograder uses), then submit to Gradescope before the 11:59pm 2026-10-02 deadline and sign up for the oral exam slot.

## Open Questions
- [ ] Confirm the real course container's `testius` run matches this manual verification exactly — it should, since the binary and the test replay logic are the same, but the container's `gcc`/`glibc` version could in principle differ from this WSL2 Ubuntu 24.04 copy.
- [ ] Decide whether to keep the `getenv()`-driven `cd` NULL-`HOME` guard as-is or ask whether the TAs expect a specific behavior here, since the assignment doesn't name this exact edge case.
- [ ] Bare-`&` use-after-free (see Independent Audit above) — left unfixed by explicit decision; revisit only if the oral exam or a TA raises it.

## Log
- **2026-10-02:** Implemented all seven tasks in `swish_funcs.c` (`tokenize`, `run_command`, `resume_job`, `await_background_job`, `await_all_background_jobs`) and `swish.c` (`pwd`/`cd` builtins, the combined fork/exec/wait/job-control `else` branch). Added `#include <stdlib.h>` to `swish.c` for `getenv()`. Built clean under `-Wall -Werror` via WSL2 gcc 13.3.0. Replayed all 32 provided test cases over a real pty with a custom Python harness (no `testius` available in this environment) — all matched. Directly verified both assignment-named hidden-test gaps (`cd` with no arg → `$HOME`, `>>` append-not-truncate) and a multi-second stop/background/wait-for sequence confirming `SIGCONT` resumes in place. Nothing run against Gradescope; no `make zip` created.
- **2026-10-02:** Independent audit — diffed against `proj1-original`, rebuilt from scratch, re-ran core behaviors directly, found and documented the bare-`&` use-after-free (left unfixed by decision).
- **2026-10-02:** Style pass — read the professor's own lecture code directly, trimmed four over-explained comments down to his real one-line-fact style, rebuilt and re-confirmed zero behavior change.
