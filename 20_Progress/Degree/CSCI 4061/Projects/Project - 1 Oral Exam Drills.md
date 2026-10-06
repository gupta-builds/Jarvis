---
type: class
input_kind: project
status: sprout
created: 2026-10-06
updated: 2026-10-06
area:
  - "[[CSCI 4061 Board]]"
related:
  - "[[20_Progress/Degree/CSCI 4061/Projects/Project - 1 Assignment|Project - 1 Assignment]]"
  - "[[20_Progress/Degree/CSCI 4061/Projects/Project - 1 Code|Project - 1 Code]]"
  - "[[20_Progress/Degree/CSCI 4061/Weekly/Week - 1|Week - 1]]"
  - "[[20_Progress/Degree/CSCI 4061/Weekly/Week - 2|Week - 2]]"
  - "[[20_Progress/Degree/CSCI 4061/Weekly/Week - 3|Week - 3]]"
  - "[[20_Progress/Degree/CSCI 4061/Labs/Lab - 2|Lab - 2]]"
tags:
  - "#class"
  - "#oral-exam"
next: "Do the 120-minute closed-book drill, then answer every prompt aloud while pointing to the submitted code."
---
# Project - 1 Oral Exam Drills
This is a retrieval-practice companion to [[20_Progress/Degree/CSCI 4061/Projects/Project - 1 Code|Project - 1 Code]], not a second implementation walkthrough. The goal is to explain the submitted `swish` from first principles: what state exists, how each line changes it, what each call promises, and why the ordering matters.
The project is a small shell, not seven disconnected exercises. Each command follows one lifecycle:
```text
input → tokens → builtin OR forked child
      → child configures descriptors/process group → exec
      → parent waits OR records a job → restores terminal ownership
```
## The 120-minute oral-exam session
| Time | Work | Completion check |
|---|---:|---|
| 0–10 min | Read the assignment’s seven tasks once. Say the shell lifecycle above without notes. | Explain why `cd` differs from `ls`. |
| 10–30 min | Trace Tasks 0–2 from a fresh command line: `ls -l`. Draw parent and child after `fork()`. | Explain every return path of `fork()` and why `execvp()` returning is an error. |
| 30–50 min | Trace Task 3 with `wc -l < input.txt > output.txt`. Draw fd 0, 1, and the opened file descriptors before and after each `dup2()`. | Explain `>`, `>>`, `<`, `open()`, `dup2()`, and `close()` without looking. |
| 50–75 min | Trace a foreground program receiving Ctrl-C, then a program receiving Ctrl-Z. Draw shell pgid, child pgid, and the terminal foreground pgid. | State the exact foreground order: give terminal → wait → reclaim terminal. |
| 75–90 min | Trace Task 5/6 job transitions: stopped → foreground → exits; stopped → background → `wait-for`; two background jobs → `wait-all`. | Say when a job is added, updated, removed, or deliberately retained. |
| 90–105 min | Do the drills below aloud, closed-book. Open the code only after each answer to correct it. | Every answer uses the five-part frame. |
| 105–115 min | Whiteboard the full command paths: `pwd`, `cd`, normal command, redirected command, foreground stop, `fg`, `cmd &`, `bg`, `wait-for`, and `wait-all`. | No unexplained jump between processes or states. |
| 115–120 min | Give a two-minute project explanation and answer: “Why did you choose this design instead of another one?” | Name the tradeoff and the assignment constraint for each major choice. |
If one answer is weak, do not reread the whole note. Re-run the smallest relevant command mentally, identify the state transition you missed, then answer again.
## The five-part answer frame
Use this for almost every oral-exam question. It prevents an answer from becoming a list of function definitions.
1. **Input:** What command, token, argument, signal, or return value triggers this branch?
2. **State:** What changes in process state, current directory, file-descriptor table, terminal foreground group, or job list?
3. **Contract:** What does this function/macro promise on success, and what return value signals failure or a special condition?
4. **Failure:** What is checked, what message is produced, what resource must be cleaned up, and does the shell re-prompt or exit?
5. **Why:** Why is this call/order/design necessary? What plausible alternative exists, and why is it wrong or less suitable here?
Example: “Why does the parent use `waitpid()`?”
> Input: a non-builtin foreground command was forked. State: the parent must not issue another prompt until that specific child exits or stops. Contract: `waitpid(child_pid, &status, WUNTRACED)` waits for that child and reports stopping as well as termination. Failure: a failed wait must not be followed by interpretation of an uninitialized `status`. Why: `wait()` could collect any child; `waitpid()` identifies the intended child and supports the stopped-job behavior needed later.
## Task-to-concept map
| Task | User-visible behavior | Core concepts to explain | Anchor material |
|---|---|---|---|
| 0 | Split `ls -l -a` into command tokens | mutable strings, `strtok()`’s internal state, `strvec_t` ownership and failure propagation | Week 2; `string_vector.h` |
| 1 | `pwd`, `cd path`, `cd` | per-process cwd, `getcwd()`, `chdir()`, `HOME`, environment variables, shell builtins | Week 1 |
| 2 | Run an external command | `fork()` return values, copied process state, `execvp()`/`PATH`, `argv` ending in `NULL`, `waitpid()`, zombies | Week 1; Chapter 8 |
| 3 | `<`, `>`, `>>` | fd table inheritance, `open()` flags and permissions, `dup2()` replacement semantics, descriptor lifetime across `exec()` | Week 2; Chapter 3; Lab 2 |
| 4 | Ctrl-C reaches command, not shell | signal disposition inheritance, pid versus pgid, foreground process group, `setpgid()`, `tcsetpgrp()` | Week 3; Chapter 10 |
| 5 | Ctrl-Z, `jobs`, `fg N` | stopped versus terminated, `WUNTRACED`, `WIFSTOPPED`, persistent job records, `SIGCONT` | Week 3; `job_list.h` |
| 6 | `cmd &`, `bg N`, `wait-for N`, `wait-all` | nonblocking shell behavior, job-state transitions, targeted waits, safe list traversal/removal | Week 3; `job_list.h` |
Week 4/5 material is not a new dependency of Project 1. It reinforces the same resource-ownership habit: distinguish an OS object from the handles that refer to it, and close/remove only when the object’s lifecycle permits it.
## Initial high-yield drills
Answer each aloud in 60–90 seconds. Then point to the relevant submitted code and verify every claim.
### Task 0 — tokenization
**Why does `tokenize()` call `strtok()` once with the input string and later with `NULL`?**
`strtok()` modifies the original mutable input buffer by replacing delimiters with null terminators and stores where it stopped internally. The first call establishes that state; `strtok(NULL, " ")` continues from it. The resulting token pointers refer into that buffer, so the vector must be used while the underlying command buffer remains valid. If `strvec_add()` fails, the function reports failure rather than pretending the command was completely tokenized.
**Why not hand-build an argument array while tokenizing?**
The vector is the project’s supplied command representation and is needed for builtins, redirection detection, `&` detection, and job commands. Separating tokenization from interpretation lets later tasks decide where arguments end without reparsing input.
### Task 1 — working directory
**Why must `cd` be a builtin executed by the shell itself?**
A current working directory belongs to a process. If the shell forked a child to run `chdir()`, only the child’s cwd would change; when that child exits, the interactive shell would still be in its prior directory. `pwd` only observes shell state, while `cd` mutates it.
**What does bare `cd` do, and what is the error boundary?**
Its target comes from `getenv("HOME")`; otherwise token 1 supplies the target. `chdir()` changes the shell process’s cwd on success. A command-level failure such as an invalid path prints `perror("chdir")` and returns to the prompt; it is not a reason to terminate the shell.
### Task 2 — launching a command
**Walk through `ls -l` from token vector to running program.**
The parent forks. Both processes resume after `fork()`, but the child sees return value `0` and the parent sees the child PID. The child builds a `NULL`-terminated `argv` beginning with `"ls"` and calls `execvp()`. The `p` variant searches `PATH`; successful `execvp()` replaces the child’s program image and never returns. The parent uses the known child PID with `waitpid()` so it reaps the intended child instead of an arbitrary child.
**Why must the child return from `main()` after `run_command()` fails?**
A return from `run_command()` means setup or `execvp()` failed. The child must terminate; if it fell back into the main loop, it would become a second interactive `swish`. The error is printed where it occurred, so the parent/loop must not print a duplicate error.
### Task 3 — redirection
**For `wc -l < input.txt > output.txt`, what must the executed `wc` receive?**
Its argument array is only `{"wc", "-l", NULL}`. `<`, `>`, and both filenames are shell syntax, not arguments for `wc`. Before `execvp()`, the child opens `input.txt`, duplicates its fd onto `STDIN_FILENO`, opens `output.txt` with create/write/truncate behavior, and duplicates that fd onto `STDOUT_FILENO`. `wc` then inherits fd 0 and fd 1 already connected to those files.
**Why `dup2()` and then `close()` the original file descriptor?**
`dup2(source, target)` makes `target` refer to the same open file description as `source`, replacing the target’s previous association if needed. `exec()` preserves descriptors, so fd 0/1 survive into the new program as desired. The original extra descriptor is no longer needed and must be closed to avoid a descriptor leak. For `>>`, the meaningful difference is `O_APPEND`; for `>`, it is `O_TRUNC`. Both output cases use `O_CREAT` and the requested user read/write permission mode.
### Task 4 — terminal signals
**Why does Ctrl-C kill the command after Task 4 but not the shell?**
The terminal sends terminal-generated signals to its foreground *process group*, not merely to whichever process called `read()`. The child puts itself in a new group whose pgid is its PID. Before waiting, the parent gives that child group terminal foreground ownership with `tcsetpgrp()`. Ctrl-C therefore reaches the command group. After the wait, the parent returns foreground ownership to the shell group.
**Why reset `SIGTTIN` and `SIGTTOU` to `SIG_DFL` in the child?**
Signal dispositions are inherited across `fork()`. The shell ignores those signals so it can manage terminal foreground changes without being stopped. A normal executed program must not inherit that special shell policy; it should have standard terminal behavior. Resetting happens in the child before `exec()`.
### Task 5 — stopped jobs and `fg`
**What is the difference between a stopped process and a terminated one?**
A stopped process still exists and retains its PID, process group, memory, and execution position; it is not running until continued. A terminated process is finished and must be reaped. `waitpid(..., WUNTRACED)` returns for either relevant event, and `WIFSTOPPED(status)` distinguishes the stopped case. Only a stopped child is added to the job list because it can be resumed.
**Why does `fg N` not call `fork()` again?**
The selected job is the original process, preserved after Ctrl-Z. `fg` restores its process group to terminal foreground, sends `SIGCONT`, waits for it to stop or terminate, then returns terminal ownership to the shell. Forking would start a new program rather than resume its saved execution state.
### Task 6 — background jobs
**What specifically makes `command &` a background command?**
The trailing `&` is shell syntax and is removed before command execution. The shell still forks, but the parent does not give the child terminal foreground ownership and does not wait. Instead it records the child PID, command name, and `BACKGROUND` status, then immediately displays the next prompt. The child can still use redirection because descriptor setup remains entirely in the child.
**Why does `wait-all` avoid removing jobs during its first traversal?**
The function needs to walk linked job records and wait on background jobs while preserving stopped jobs. Removing the current record during that traversal can invalidate the pointer/next link needed to continue safely. The correct state transition is: mark any newly stopped job as `STOPPED`, finish the walk, then remove the entries still marked `BACKGROUND`, which are the jobs that terminated rather than stopped.
## Questions that expose shallow understanding
- What is copied by `fork()`, what remains after `exec()`, and why do those facts make redirection possible?
- Why is `pid == pgid` a convenient choice here, but not a general definition of either identifier?
- What breaks if `tcsetpgrp()` occurs after `waitpid()` instead of before it?
- What breaks if the shell never reclaims foreground terminal control?
- Why is `WUNTRACED` necessary for `fg` and initial foreground execution, but `WNOHANG` would change the shell’s behavior?
- Why is `wait-for` invalid for a stopped job?
- Which failures end only the current command, and why is a failed `fork()` treated more seriously?
- Which project resources require cleanup on an error path: vector contents, opened fds, job-list storage, or child state?
## Final two-minute explanation
`swish` reads a command, tokenizes it, and chooses either a builtin that must change shell state or an external command that runs in a child. For external commands, the parent creates a child with `fork()`. The child configures any redirection and job-control state, then replaces itself with the requested program through `execvp()`. The parent either waits for a foreground child and manages terminal ownership, or records a background/stopped child in the job list. The later tasks do not change that architecture; they add the process, descriptor, terminal, and job-list state needed to make a real interactive shell behave correctly.
