---
type: index
status: seed
created: 2026-10-01
updated: 2026-10-01
tags:
  - moc
notes:
  - "[[20_Progress/Degree/CSCI 4061/Projects/Project - 1 Assignment|Project - 1 Assignment]]"
next: "Run make zip inside the real course Docker container and submit to Gradescope before 11:59pm 2026-10-02"
---
# Project - 1 Board
## Purpose
A submission tracker for `swish`, separate from [[20_Progress/Degree/CSCI 4061/Projects/Project - 1 Assignment|Project - 1 Assignment]], which holds the actual spec. This note exists to answer one question fast: which of the seven tasks are actually done, and what is still blocking a clean `make zip`.
## Map
[[20_Progress/Degree/CSCI 4061/Projects/Project - 1 Assignment|Project - 1 Assignment]] is the full spec: starter-code layout, the per-task instructions, and the error-handling convention (`perror` plus cleanup on every failure path, -1 point per missed check). This Board only tracks status against that spec's seven tasks.
## Task Status
| Task | What it is | Points | Status |
|---|---|---|---|
| 0 | `tokenize()` — split input into a `strvec_t` with `strtok()` | 2 | Passing locally |
| 1 | `pwd`/`cd` built-ins via `getcwd()`/`chdir()` | 4 | Passing locally |
| 2 | `run_command()` — `fork`/`exec`/`wait` for non-built-ins | 4 | Passing locally |
| 3 | `<`/`>`/`>>` redirection via `open()`/`dup2()` | 4 | Passing locally |
| 4 | Foreground process groups: `setpgid`/`tcsetpgrp`, restore `SIGTTOU`/`SIGTTIN` defaults in the child | 4 | Passing locally |
| 5 | Stopped-job tracking: `WUNTRACED`, `WIFSTOPPED`, `resume_job()`/`fg` | 4 | Passing locally |
| 6 | Background jobs: `&`, `bg`, `wait-for`, `wait-all` | 4 | Passing locally |
Automated tests (40%) run per-task via `make test testnum=N`; the project quiz (10%), oral exam (40%), and manual error-checking review (10%) sit outside this table — see the Assignment note's Grading Criteria.
## Deadline and Logistics
Due **2026-10-02, 11:59pm** (Week 4). Late penalty: 90% up to 24h late, 80% up to 48h, 0% past 48h — no slow decay to lean on, per [[CSCI 4061 Board]]. Project grade is the **latest** submission, not the best one — don't resubmit a "fix" casually once something already passes. Individual oral exam follows submission; the per-project spec quiz is separate and individual even on a team project.
## Resources
Starter code: `proj1-code.zip`, unpacked into `csci4061-fa26/proj1-code/` inside the Docker dev container (same `.devcontainer` setup as the labs). Edit only `swish.c` and `swish_funcs.c` — every other file is overwritten by the autograder. Test with `make test` / `make test testnum=N`; package with `make zip`.
## Verification Notes
Built clean under `-Wall -Werror` (WSL2 Ubuntu 24.04, gcc 13.3.0) and all 32 provided test cases replayed against the real compiled binary over a real pty, matching expected output — `testius` itself wasn't available in this environment, so verification used a hand-written `pty`-based Python harness instead. Not yet run inside the actual course Docker container or against the real Gradescope autograder; "Passing locally" means this specific build and test replay, not a Gradescope confirmation. Full mechanism-level writeup: [[20_Progress/Degree/CSCI 4061/Projects/Project - 1 Code|Project - 1 Code]].
