---
type: class
input_kind: lab
status: seed
created: 2026-09-23
updated: 2026-09-23
area:
  - "[[CSCI 4061 Board]]"
deadline: 2026-09-23
tags:
  - "#class"
  - "#Lab"
next: "Paste the two answers below into lab02-code, run make test inside the dev container, then make zip and upload lab02-code.zip to Gradescope before 11:59pm 2026-09-23"
---
# Lab - 2
==Lab 2 is a tiny version of the shell's `cmd > file`: fork a child, point its fd 1 at a file with `dup2`, exec `wc`, and have the parent read the exit status with the wait macros.== Part 1 is a job-control quiz on `print_nums`. Both parts feed straight into Project 1.
**Sources read:** lab page (Canvas), `CSCI 4061 Lab 02.pdf` (TA slides, 12 pages), `lab02-code/` (every file, including `test_cases/`), Lec02 (exec, exit, wait), Lec03 (open, fd 0/1/2, buffering), Lec04 (fd tables, fork inherits fds, dup, dup2, redirection), lecture code (`mini_shell.c`, `write_points_unix.c`, `fork_print.c`, `fork_io.c`), and Stevens (APUE 3e) §3.2 to 3.5, 3.10, 3.12, Exercise 3.4 plus its Appendix C answer, §8.3, 8.5, 8.6, 8.10, 9.8, 10.2, 10.21.
## Goal
<!-- State the task in your own words, not the lab title. -->
- Show that I understand how the shell ends, pauses, and resumes a job (SIGINT, SIGTSTP, SIGCONT, SIGTERM). Then write the redirection mechanism by hand: a child whose stdout goes into a file named on the command line, while the parent waits and reports how the child ended.
### Submission checklist (what actually gets graded)
- **Attendance** in my assigned lab section (Mon). No attendance means no credit for the week.
- **`QUESTIONS.txt`**: change `( )` to `(X)` on 4 quiz answers. Change nothing else, because `socrates` hashes the answers against `test_cases/resources/quiz_sum.json`. Worth 0.5 pt (test 1).
- **`redirect_child.c`**: fill in the two TODO blocks. Worth 0.5 pt (test 2).
- `make test` (both tests), then `make zip`, which creates `lab02-code.zip`, then upload to **Gradescope**. Groups of up to 4 are allowed: one person submits and adds the others.
- Due **11:59pm Wed 2026-09-23**. No late work on labs (the lowest 2 lab scores get dropped).
- `print_nums.c`, `Makefile`, `QUESTIONS.txt.bak`, and `test_cases/` are not edited.
## Procedure / key steps
<!-- Record the decision points and commands needed to reproduce the work. -->
- Setup: unzip into `csci4061-fa26/lab02-code/`, open the top folder in VS Code, and choose **Reopen in Container**. `testius` and `socrates` only exist inside the course Docker image, so every `make test*` command has to run in there.
### Part 1: QUIZ, Program Management in the Shell
`make print_nums && ./print_nums`. It prints 0, 1, 2, ... once per second forever (`while (1) { printf; i++; sleep(1); }`).
1. **Terminate the endless program**
	(X) **Type 'Ctrl-C'.** The terminal driver turns Ctrl-C into **SIGINT** and sends it to every process in the foreground process group. The default action of SIGINT is terminate (APUE §9.8, §10.2). Escape and `q` are just ordinary input bytes, and `print_nums` never reads stdin.
2. **What `jobs` does**
	(X) **Shows a list of programs that have been stopped previously or are active in the background in this terminal session.** After Ctrl-Z the shell prints `Stopped` and the job stays in the table as `[1]+ Stopped ./print_nums`. Finished and killed jobs are dropped from the list, so the option "all programs run previously" is wrong.
3. **After `fg %1`, the numbers**
	(X) **They resume increasing from where 'print_nums' previously left off.** Ctrl-Z sends **SIGTSTP**, which stops the process without killing it, so `i` survives in memory. `fg` moves the job into the foreground process group and sends **SIGCONT** (APUE §9.8). Nothing restarts, and the process keeps the same pid.
4. **What `kill %1` does**
	(X) **Signals the first job in our terminal session ('print_nums'), causing it to terminate.** `%1` is a **job number** from `jobs`, not a pid (so it's neither "PID 1" nor "a program named %1"). With no `-SIG` given, `kill` sends **SIGTERM**, whose default action is terminate. You sometimes need an extra ENTER because bash only reports job status changes right before it prints the next prompt (APUE §9.8).

> [!NOTE]
> A stopped job can still be killed by SIGTERM. The kernel delivers SIGCONT as well so the process can act on the signal. SIGKILL (`kill -9`) and SIGSTOP are the only two signals that can never be caught or ignored (APUE §10.2), and the slides call SIGKILL the "you really mean it this time" version.

### Part 2: CODE, complete `redirect_child.c`
What the tests need: `./redirect_child out1.tmp` prints exactly `Child complete, return code 0` on the terminal, and `cat out1.tmp` then shows the same output as `wc test_cases/resources/nums.txt`, which is `25 25 66 test_cases/resources/nums.txt`. The test does this twice, with `out1.tmp` and then `out2.tmp`.
*Decision points:*
- **Uncomment the two provided lines** (`output_file`, `child_argv`). The skeleton tells you to do this, and without it `-Wall -Werror` has no variables to use.
- **Do the redirection only in the child, after `fork()` and before `exec`.** fd 1 in the parent must stay on the terminal so that "Child complete..." reaches the screen. APUE §8.3 notes that keeping fork and exec separate is exactly what lets the child set up its I/O redirection in between.
- **`open` flags `O_CREAT | O_WRONLY | O_TRUNC` with mode `S_IRUSR | S_IWUSR`.** These are the lecture's exact flags (Lec03/04, `write_points_unix.c`). `O_CREAT` is there because the file doesn't exist yet, and it requires the 3rd `mode` argument (APUE §3.3). `O_TRUNC` means a rerun on a longer old file doesn't leave junk behind the new `wc` line. This is the same thing `creat()` / shell `>` does (APUE §3.4).
- **`dup2(fd, STDOUT_FILENO)`.** The order is `dup2(source, target)`: the target (1) gets closed if it's open, then becomes a copy of `fd` that shares the same file table entry and offset (APUE §3.12, Lec04 p28).
- **`close(fd)` after the dup2.** Otherwise fd 3 and fd 1 both point at the file, and fd 3 leaks into `wc` through exec. This is APUE Exercise 3.4's `if (fd > 2) close(fd)`.
- **`execvp(child_argv[0], child_argv)`.** `child_argv` is already an array (`v`), and `"wc"` has no slash, so `p` searches PATH (APUE §8.10). Open fds survive exec by default, since close-on-exec is off and dup2 clears FD_CLOEXEC on the new fd. That is why the redirect is still in place once `wc` runs. Exec only returns if it failed, so a `perror` + `return 1` goes right after it.
- **Parent: `wait(&status)` then `WIFEXITED` / `WEXITSTATUS`.** There is only one child, so plain `wait` is fine (the same reasoning as Lab 1). The raw `status` is not the exit code. The exit code lives in the low 8 bits that `WEXITSTATUS` pulls out, and it's only valid when `WIFEXITED` is true. Otherwise the child died from a signal (`WIFSIGNALED`), so print `Child exited abnormally` (APUE §8.6, Fig 8.4 and 8.5).
- Error style copies the instructor's code: `if (x == -1) { perror("..."); return 1; }`, the same as `mini_shell.c` and `fork_print.c`.
### Final `redirect_child.c` (the only code change, pasted into the two TODO spots)
The skeleton's own lines and comments are left exactly as they were, and the new code sits directly under each TODO.
```c
// redirect_child.c: starts a child process which will print into a
// file instead of onto the screen.
// Uses fork(), open(), dup2(), exec(), and wait()
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
    if (argc < 2) {    // check for at least 1 command line arg
        printf("Usage: %s <childfile>\n", argv[0]);
        return 1;
    }

    // Uncomment lines below to use specified output file and command-line args in child process

    // output file that child process will print into
    char *output_file = argv[1];

    // child command/arguments to execute
    char *child_argv[] = {"wc", "test_cases/resources/nums.txt", NULL};

    // TODO: Spawn a child process, which will:
    //     open() the output file for writing
    //     Redirect standard output to the output file
    //     exec the "wc" command with the arguments in 'child_argv'
    pid_t child_pid = fork();
    if (child_pid == -1) {
        perror("fork failed");
        return 1;
    } else if (child_pid == 0) {
        int fd = open(output_file, O_CREAT | O_WRONLY | O_TRUNC, S_IRUSR | S_IWUSR);
        if (fd == -1) {
            perror("Failed to open output file");
            return 1;
        }
        if (dup2(fd, STDOUT_FILENO) == -1) {
            perror("dup2 failed");
            close(fd);
            return 1;
        }
        close(fd);
        execvp(child_argv[0], child_argv);
        perror("exec failed");
        return 1;
    }

    // TODO: In the parent, wait for the child and ensure it terminated normally using wait macros
    // Print "Child complete, return code <status_code>" if child terminated normally, replacing
    //    <status_code> with the child's numerical status code
    // Print "Child exited abnormally" if child terminated abnormally
    int status;
    if (wait(&status) == -1) {
        perror("wait failed");
        return 1;
    }
    if (WIFEXITED(status)) {
        printf("Child complete, return code %d\n", WEXITSTATUS(status));
    } else {
        printf("Child exited abnormally\n");
    }

    return 0;
}
```
### Fd table walk (the slides' picture)
- Start: 0 = terminal, 1 = terminal, 2 = terminal.
- `open(output_file, ...)` returns **3**, because open always hands back the lowest unused descriptor (APUE §3.3). 3 = `out1.tmp`.
- `dup2(3, 1)`: 1 = `out1.tmp`, 3 = `out1.tmp`. Both share one file table entry and one offset (Fig 3.9).
- `close(3)`: only 1 = `out1.tmp` is left. `wc` calls `write(1, ...)` and has no idea it isn't the screen (Lec04 p32: "Process thinks it is printing to the screen").
## Results
<!-- State the actual output: numbers, tests, screenshots, or a working build. -->
- **Code verified 2026-09-23** on a scratch copy of `lab02-code`, built with the lab `Makefile` (`gcc -Wall -Werror -g`, gcc 13.3, Ubuntu 24.04 in WSL). It compiled with zero warnings. Replaying `test_cases/input/redirect_child.txt` by hand gave output identical to `test_cases/output/redirect_child.txt`:
```text
$ ./redirect_child out1.tmp
Child complete, return code 0
$ cat out1.tmp
25 25 66 test_cases/resources/nums.txt
$ ./redirect_child out2.tmp
Child complete, return code 0
$ cat out2.tmp
25 25 66 test_cases/resources/nums.txt
```
- `wc` columns are newlines, words, bytes, then the file name. For `nums.txt` (1 to 25, one per line) that's 25 lines and 25 words, with bytes = 9·2 + 16·3 = 66.
- *Edge cases checked:* with no arguments it prints `Usage: ./redirect_child <childfile>` and exits 1. Prefilling `out1.tmp` with 201 bytes and rerunning left 39 bytes, so `O_TRUNC` works. A bad path (`/nonexistent_dir/x.txt`) prints the `perror` on stderr and then `Child complete, return code 1`.
- **Not yet run:** `make test-quiz` / `make test` inside the container, and the Gradescope upload. The quiz answers come from the slides and APUE §9.8/§10.2. I couldn't check them against `quiz_sum.json` offline (see Errors). The actual `QUESTIONS.txt` and `redirect_child.c` in the lab folder have **not** been edited yet.

> [!WARNING]
> The spec's sample run shows lowercase `usage:`, but the skeleton prints `Usage:`. The tests never run it without arguments, so leave the skeleton line alone.

## Errors + fixes
<!-- Add one Problem/Fix/Why entry for every real error. Explain the mechanism behind the fix. -->
- Problem: a "bad path" run shows `Child complete, return code 1`, not `Child exited abnormally`, which looks wrong at first.
- Fix: no fix is needed. That output is correct.
- Why: when `open` fails, the child runs `return 1`, and returning from main is a **normal** termination (APUE §8.5). So `WIFEXITED` is true and `WEXITSTATUS` is 1. "Abnormal" only means the child was killed by a signal it didn't catch (`WIFSIGNALED`), like a Ctrl-C or a segfault.
- Evidence: the scratch run printed `Failed to open output file: No such file or directory` followed by `Child complete, return code 1`.
- Problem: in the same scripted run, the `perror` line came out **above** earlier `printf` lines once output went through a pipe.
- Fix: nothing to fix. It's a buffering artifact and only a problem if the ordering matters.
- Why: stdout is line-buffered on a terminal but fully buffered when it goes to a pipe or file. stderr is unbuffered, so it gets written first (Lec03 "stdout vs stderr" slide, APUE §8.3). This is also why there's no printf before the `fork()`: a buffered line that hasn't been flushed yet gets copied into the child and printed twice (APUE Fig 8.1, `a.out > temp.out`).
- Evidence: the first line of the captured output was the `perror` message, even though it ran last.
- Problem: when I tried to script Part 1 (`./print_nums &`, then `kill -TSTP`, `kill -CONT`, `kill -INT`), `ps` showed `S+` (not stopped) after SIGTSTP, and the script hung forever on `wait`.
- Fix: killed it with `kill -KILL`. Do Part 1 by hand in the interactive VS Code terminal, the way the lab intends.
- Why: a non-interactive shell starts `&` jobs with SIGINT set to **ignored**, so `kill -INT` did nothing. The SIGTSTP was also thrown away: POSIX discards terminal stop signals sent to a process in an orphaned process group (APUE §9.10). Only an interactive, job-control shell gives the Ctrl-C / Ctrl-Z / `fg` behavior the quiz asks about.
- Evidence: after `kill -TSTP`, `ps -o stat=` printed `S+`, the run never finished, and `pgrep print_nums` was empty only after `pkill -KILL`.
- Problem: I couldn't confirm the quiz answers offline. Hashing guesses of the `QUESTIONS.txt` format with sha256 never matched `quiz_sum.json`.
- Fix: rely on `make test-quiz` inside the container. It prints `All quiz answers correct.` when the answers are right.
- Why: `socrates` hashes some normalized form of the answers that isn't documented, so only the real tool can check them.
- Evidence: in-memory sha256 attempts over all 256 answer combinations and ~15 encodings found no match (and none for Lab 1's hash either).
## Flashcards
<!-- Optional: add only reusable debugging-pattern cards to #cards/<course-slug>. -->
#cards/csci4061
Why do the open and dup2 calls for `cmd > file` go in the child between fork and exec, not in the parent?
?
dup2 only changes the calling process's fd table. Done in the child, it redirects only the child, while the parent's fd 1 stays on the terminal so it can still print. Open fds survive exec by default, so the exec'd program writes into the file without knowing it.
Why `close(fd)` right after `dup2(fd, STDOUT_FILENO)`?
?
After dup2, fd 1 and fd 3 both point to the same file table entry. Leaving fd 3 open leaks an extra descriptor into the exec'd program for no reason. APUE Ex 3.4 does this as `if (fd > 2) close(fd)`, where the check covers the case of fd already being 0, 1, or 2.
Child did `return 1` after a failed open. Does `WIFEXITED(status)` return true or false?
?
True. Returning from main is a normal exit, so `WEXITSTATUS` gives 1. `WIFSIGNALED` is only true when an uncaught signal killed the child.
Ctrl-Z then `fg %1`: which signals are sent, and why does the counter keep its value?
?
Ctrl-Z makes the terminal driver send SIGTSTP (stop, not kill) to the foreground process group, and `fg` sends SIGCONT. The process is never destroyed, so its memory (including `i`) and its pid stay the same.
In `kill %1`, what is `%1`, and which signal is sent?
?
`%1` is the shell's job number from `jobs`, not a pid. With no signal given, kill sends SIGTERM (catchable, default action terminate). `kill -9` sends SIGKILL, which can't be caught or ignored.