---
type: class
input_kind: lab
status: seed
created: 2026-10-06
updated: 2026-10-06
area:
  - "[[UMN Board]]"
  - "[[CSCI 4061 Board]]"
deadline:
tags:
  - "#class"
  - "#Lab"
next: "Apply only the marked quiz answers and TODO-region solution in lab04-code inside the course dev container; run make test, then make zip and submit lab04-code.zip to Gradescope."
---
# Lab - 4
==Lab 4 reconstructs a two-command shell pipeline: `sort` writes ordered numbers into a kernel pipe, and `tail` reads that pipe as its standard input. `pipe()` creates both descriptors before `fork()`; each process closes the end it will never use, then `dup2()` makes the remaining end become the standard stream expected by the program it `exec`s.==
**Sources read:** `Lab 04.pdf`; `lab04-code/QUESTIONS.txt`, `pipeline_commands.c`, `Makefile`, and `test_cases/`; [[20_Progress/Degree/CSCI 4061/Weekly/Week - 4|Week 4]] (Lec08); `Lecture/lecture08-code/single_pipe.c`; and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 15|APUE Chapter 15]] (§15.1–15.2).
## Goal
- Mark the pipeline answers and complete the one-pipe, two-process `sort -n test_cases/resources/numbers.txt | tail -n 10` implementation without changing any other graded files.
### Submission checklist
- In `QUESTIONS.txt`, change only the four selected quiz markers from `( )` to `(X)`; do not edit its wording, `QUESTIONS.txt.bak`, `Makefile`, or `test_cases/`.
- In `pipeline_commands.c`, fill only the TODO regions with the solution below.
- Inside the course Docker dev container, run `make test` (or `make test-quiz` and `make test-code` separately). Both tests are worth 0.5 points.
- After a passing local result, run `make zip`; upload the resulting `lab04-code.zip` to Gradescope and verify its autograder result. For group work, one member submits and adds the others.
## Procedure / key steps
- Work from `csci4061-fa26/Labs/lab04-code/` in the supplied dev container, where `testius` and `socrates` are available.
### Part 1: QUIZ — shell pipelines
1. **`cat numbers.txt | sort -n | tail -n 10 | wc -l` creates `(X) 3` pipes.** Four commands need one pipe between each adjacent pair.
2. **It needs `(X) 6` calls to `dup2()`.** The first command redirects stdout once; each middle command redirects stdin and stdout (two each); the last redirects stdin once: `1 + 2 + 2 + 1 = 6`.
3. **`(X) Trick question: all of the above are valid.`** Giving `cat` a pathname or redirecting its stdin both provide the same input; redirecting the final command's stdout is also valid.
4. **`cat < numbers.txt | sort -n | tail -n 10 | wc -l > out.txt` needs `(X) 8` calls to `dup2()`.** The pipeline itself takes six; `< numbers.txt` redirects the first command's stdin and `> out.txt` redirects the last command's stdout, adding two.
### Part 2: CODE — `pipeline_commands.c`
- `pipe(pipe_fds)` must precede `fork()` so the child inherits both descriptors.
- The child is the `sort` stage: close `pipe_fds[0]`, duplicate `pipe_fds[1]` onto `STDOUT_FILENO`, close the redundant original write descriptor, then execute `sort`.
- The original parent becomes the `tail` stage: close `pipe_fds[1]`, duplicate `pipe_fds[0]` onto `STDIN_FILENO`, close the redundant original read descriptor, then execute `tail`.
- The closes are required communication state, not cosmetic cleanup. If either process keeps an unused write descriptor open, the reader can never observe end-of-file once all actual writers finish.
### Required `pipeline_commands.c` answer
```c
#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int main() {
    // Run equivalent of 'sort -n test_cases/resources/numbers.txt | tail -n 10'

    int pipe_fds[2];
    if (pipe(pipe_fds) == -1) {
        perror("pipe");
        return 1;
    }

    pid_t child_pid = fork();
    if (child_pid == -1) {
        perror("fork");
        close(pipe_fds[0]);
        close(pipe_fds[1]);
        return 1;
    } else if (child_pid == 0) {
        if (close(pipe_fds[0]) == -1) {
            perror("close");
            close(pipe_fds[1]);
            return 1;
        }
        if (dup2(pipe_fds[1], STDOUT_FILENO) == -1) {
            perror("dup2");
            close(pipe_fds[1]);
            return 1;
        }
        if (close(pipe_fds[1]) == -1) {
            perror("close");
            return 1;
        }
        execlp("sort", "sort", "-n", "test_cases/resources/numbers.txt", NULL);
        perror("execlp");
        return 1;
    }

    if (close(pipe_fds[1]) == -1) {
        perror("close");
        close(pipe_fds[0]);
        return 1;
    }
    if (dup2(pipe_fds[0], STDIN_FILENO) == -1) {
        perror("dup2");
        close(pipe_fds[0]);
        return 1;
    }
    if (close(pipe_fds[0]) == -1) {
        perror("close");
        return 1;
    }
    execlp("tail", "tail", "-n", "10", NULL);
    perror("execlp");
    return 1;
}
```
## Results
- The supplied expected output for the required pipeline is:
```text
75
86
87
88
92
93
93
96
99
100
```
- The supplied quiz oracle's passing message is `All quiz answers correct.` The source submission files and Docker container were intentionally not edited or run for this note, so no local test result or zip archive is claimed here.
## Errors + fixes
- Problem: Counting four commands as four pipes in the first quiz question.
- Fix: Mark `3`.
- Why: A pipe connects two adjacent commands; a linear pipeline of four commands has three connections.
- Evidence: The command has the three `|` separators shown in `QUESTIONS.txt`.
- Problem: Leaving a pipe end open after `dup2()`.
- Fix: Close the original descriptor after duplicating it, and close the unused end in each process before `exec()`.
- Why: `dup2()` creates another descriptor for the same pipe end; descriptors survive `exec()` unless closed. A lingering write end keeps the pipe's writer count nonzero and can prevent a reader from receiving EOF.
- Evidence: Week 4 and the supplied `single_pipe.c` both close unused pipe descriptors before their communication work.
## Flashcards
#cards/csci4061
Why must each process close the pipe end it does not use before `exec()`?::The close communicates that the process will never use that end. In particular, any accidentally inherited write end keeps the pipe open and can stop readers from ever getting EOF after the real writer exits.
For a pipeline of four commands with no file redirections, why are six `dup2()` calls needed?::The first command redirects stdout once, the two middle commands each redirect stdin and stdout, and the last command redirects stdin once: `1 + 2 + 2 + 1 = 6`.
