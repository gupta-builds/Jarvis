---
type: class
class_kind: project
project_role: companion
status: sprout
created: 2026-11-20
updated: 2026-11-20
tags:
  - class
  - project
area:
  - "[[CSCI 4061 Board]]"
related:
  - "[[20_Progress/Degree/CSCI 4061/Projects/Project - 3 Assignment|Project - 3 Assignment]]"
  - "[[20_Progress/Degree/CSCI 4061/Projects/Project - 3 Quiz|Project - 3 Quiz]]"
  - "[[20_Progress/Degree/CSCI 4061/Projects/Project - 2 Implementation|Project - 2 Implementation]]"
  - "[[20_Progress/Degree/CSCI 4061/Projects/Project - 1 Assignment|Project - 1 Assignment]]"
  - "[[20_Progress/Degree/CSCI 4061/Labs/Lab - 3|Lab - 3]]"
  - "[[20_Progress/Degree/CSCI 4061/Labs/Lab - 4|Lab - 4]]"
  - "[[20_Progress/Degree/CSCI 4061/Labs/Lab - 7|Lab - 7]]"
  - "[[20_Progress/Degree/CSCI 4061/Labs/Lab - 8|Lab - 8]]"
  - "[[20_Progress/Degree/CSCI 4061/Labs/Lab - 9|Lab - 9]]"
  - "[[20_Progress/Degree/CSCI 4061/Labs/Lab - 10|Lab - 10]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 11|Chapter - 11]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 16|Chapter - 16]]"
next: "Build in this order: Part 1 Task 1, Task 2, Part 2, then the error-handling ledger pass. Edit only the regions listed under Edit surface and re-diff against proj3-original after every save."
---
# Project - 3 Code Explaination
This note holds no solutions and no drafted code. It explains how the Project 3 starter works, how each piece is meant to be solved, and which lecture slide, transcript line, lab file, textbook page, man page or measurement supports each step. The second pass (2026-11-20) added Week 10 and 11 (Lec18 to Lec20, transcripts Nov 10, 17, 19, lecture18-code to lecture20-code), went through all ten labs, rebuilt the error-handling section around the grading rubric, and closed the open questions that blocked implementation. The assignment text lives in [[20_Progress/Degree/CSCI 4061/Projects/Project - 3 Assignment|Project - 3 Assignment]]. The format follows [[20_Progress/Degree/CSCI 4061/Projects/Project - 2 Implementation|Project - 2 Implementation]].
> [!NOTE]
> Items marked (measured) were run in the course container (Ubuntu 22.04, gcc 11.4.0, Python 3.10.12) on 2026-11-20 inside scratch copies under `/tmp`, deleted afterwards. `proj3-code` was compared with `proj3-original` before and after the second pass with `diff -rq` and a SHA-256 over every file: identical both times. Nothing was written to the project folders.

## How to read the citations
==Every claim carries one of eight source forms, and "measured" means I ran it rather than read it.==
- **Lec N, slide k**: `Lecture/Week - X/LecNN.pdf`, read through MinerU. The slide number is the PDF page of the deck. Lec08's printed footers run 4 higher than the PDF page (page 9 prints "13"); I use the PDF page.
- **Nov 17, lines a-b**: the transcript in `Lecture/Transcripts/Week 9 - 14/` (Nov 3, 5, 10, 17, 19) or `Week 4 - 8/` (Oct 20, 22, 29) or `Week 1 - 3/` (Sep 22, 24). Line numbers are file lines.
- **lectureNN-code/file line n** and **labNN-code/file line n**: under `csci4061-fa26/Lecture/` and `csci4061-fa26/Labs/`. The lectures are the professor's patterns; the labs hold your own solved versions.
- **Lab N deck, slide k**: the TA slide deck for that lab in `Labs/*.pdf`.
- **APUE p. N**: *Advanced Programming in the UNIX Environment*, 3rd ed., printed page. PDF page equals printed page plus 34. Extracted from the PDF itself, not from the vault chapter notes.
- **man**: the manual page inside the container. **py3.10**: docstring or source read from the container's Python 3.10.12, the autograder's version. **py3.13 docs** and **RFC 1945** were fetched from their official sites on 2026-11-20.
- **Quiz Qn**: [[20_Progress/Degree/CSCI 4061/Projects/Project - 3 Quiz|Project - 3 Quiz]].
- **(measured)**: an experiment I ran.
## Source inventory
Registered means the path appears in [[CSCI 4061 Board]]. Only the course root folder is named there, so none of these paths is individually registered.

| Material | Where | How deeply I read it |
|---|---|---|
| Project files | `csci4061-fa26/Projects/proj3-code` (identical to `proj3-original`) | Every source file, all three Makefiles, both `tests.json`, every test input and output, `server_files` listing and contents |
| Assignment, quiz, rubric history | Vault `Project - 3 Assignment`, `Project - 3 Quiz`, `Project - 1 Assignment` (Error Checking Criteria, Error Handling Strategy), `Project - 2 Assignment`, `Project - 2 Oral Exam Drills` | Fully; the error-checking rubric is quoted in the Error handling section |
| Networking slides | `Week - 8/Lec15.pdf`, `Week - 9/Lec16.pdf`, `Lec17.pdf` | Fully |
| Thread slides | `Week - 7/Lec12.pdf`, `Lec13.pdf`; `Week - 8/Lec14.pdf` | Fully |
| **Python slides (new)** | `Week - 10/Lec18.pdf` (Python threading), `Week - 11/Lec19.pdf` (Python networking), `Lec20.pdf` (serialization, RPC) | Lec18 and Lec19 fully; Lec20 headings only (RPC is not part of Project 3, except slide 17 of its server code pack, a worker pool) |
| Signal slides | `Week - 3/Lec05.pdf`; `Lec06.pdf` | Lec05 fully; Lec06 pages 1-35 |
| I/O, file, pipe, Python-intro slides | `Lec03`, `Lec04`, `Lec07`, `Lec08`, `Lec11` | Lec04 pages 7-20, Lec03 pages 5-7, Lec07 pages 7 and 21-22, Lec08 pages 9-17, Lec11 pages 1-20 |
| Other slides | `Lec01`, `Lec02`, `Lec09`, `Lec10` | Keyword search only; sockets appear on Lec01 slide 6, Lec09 slide 33, Lec10 slides 18 and 27 |
| Transcripts | Nov 3, 5 fully. **Nov 10 lines 236-1044, Nov 17 lines 1-660, Nov 19 lines 1-70 and 800-860 (new)**. Oct 22 lines 640-1019, Oct 20 lines 440-700, Oct 29 lines 120-310, Sep 24 lines 55-304 and 440-769, Sep 22 lines 730-1144. Others by keyword search | Nov 12 was the midterm (no lecture); Oct 8 is 107 bytes (an exam). The unread halves of Nov 10, 17, 19 cover serialization and RPC |
| Lecture code | `lecture16-code` to `lecture20-code`, `lecture12-code`, `lecture13-code`, `lecture11-code`, `lecture05-code`, `lecture03-code` | The files named in the tables, in full. `lecture18-code` and `lecture19-code` are new |
| **Labs 1 to 10 (all, new)** | `Labs/lab01-code` to `lab10-code` (code, `QUESTIONS.txt`, tests); TA decks `Lab 01` to `Lab 09` (no Lab 10 deck exists on disk); vault notes [[20_Progress/Degree/CSCI 4061/Labs/Lab - 7\|Lab - 7]] and [[20_Progress/Degree/CSCI 4061/Labs/Lab - 8\|Lab - 8]] | Everything. Labs 1 and 2 in this folder are partly unsolved templates (Lab 1 quiz and code blank) |
| Exam practice | `Midterm/csci4061_fa26_Midterm_2_Practice.pdf` and `_Solutions.pdf` | Fully; its function list shows what the professor treats as core API |
| Textbook | `Textbook/Advanced Programming in the UNIX Environment, 3rd Edition.pdf` | Ch 1.7, 3.2-3.9, 4.2-4.3, 5.4-5.5 and 5.11, 7.7, 10.1-10.14, 11.4-11.6.8, 12.5 and 12.8, 14.4, 15.2 and 15.10, 16.2-16.6 |
| External | RFC 1945 (HTTP/1.0); py3.13 `queue` documentation; man pages `signal(7)`, `accept(2)`, `send(2)`, `getaddrinfo(3)`, `strerror(3)`, `dlsym(3)`, `ld.so(8)` | The passages quoted below |
| Container | Running dev container `vsc-csci4061-fa26-...` | The experiments reported below |
- *Not covered:* Lec01, Lec02, Lec09, Lec10 beyond keyword hits; the serialization and RPC halves of Lec19 and Lec20; the Weekly notes (they stop at Week 4); Kleppmann.
## What the project is and how it gets solved
==Project 3 is a TCP file server that speaks only HTTP GET, built twice (C with a thread pool and a hand-written bounded queue, then Python with the same shape), and it is graded 40 percent by tests, 40 percent by an oral exam on your own code, 10 percent by the quiz and 10 percent by a manual error-checking review.== Part 1 shows 15 visible test points (test 1 sequential 5, test 2 concurrent 10) and Part 2 shows 10 (5 and 5); hidden tests also run. The whole project is 6.25 percent of the course grade.
```text
curl x10 ---> accept() in main thread ---> connection_queue (CAPACITY 5) ---> 5 worker threads
                  |                              ^   enqueue blocks when full       |
                  |                              |   dequeue blocks when empty      v
              SIGINT ends the loop ---> shutdown(queue) wakes all ---> join workers ---> close server socket
```
The solution is a fixed order of work. Each step names where the explanation lives.

| Step | What you build | Why it works | Main sources |
|---|---|---|---|
| 1 | `http.c`: read a request until `\r\n\r\n`, send a status line, headers and the file bytes | HTTP/1.0 is plain text over a TCP byte stream; the body is the file's exact bytes | Lec17 slides 17-19; Nov 5 lines 759-1008; Lab 9; APUE 16.5 p. 610-615; RFC 1945 |
| 2 | `http_server.c` Task 1: signal handler, `getaddrinfo`, `socket`, `bind`, `listen`, an `accept` loop, close | Lecture 17's `question_server_tcp.c` is the same skeleton; `EINTR` from `accept` ends the loop | lecture17-code lines 23-125; Lec16, Lec17; APUE 16.3-16.4 |
| 3 | `connection_queue.h` and `.c`: ring buffer, one mutex, two condition variables, a `shutdown` flag | Lab 8's queue plus a flag that every wait loop tests | Lab 8; Lec13 slides 22-33; APUE 11.6.6 p. 413-416 |
| 4 | Task 2 in `http_server.c`: block all signals, create five workers, restore the mask, enqueue instead of serving, shut down, join | Threads inherit the mask, so only main can take SIGINT | Assignment; APUE 11.4 p. 386 and 12.8 p. 453; Oct 22 lines 756-776 |
| 5 | `connection_queue.py`: the same queue with `threading.Condition` | Lec18 slides 26-27 is the queue minus shutdown; the shutdown rule is Python 3.13's `Queue.shutdown`, which Lec18 slide 29 points to | lecture18-code/producer_consumer_queue.py; py3.13 docs |
| 6 | `http_handler.py`: the same request and response in Python | `recv` loop and `sendall`, as lecture19-code does | Lec19 slides 7-8; lecture19-code/question_server_tcp.py |
| 7 | `http_server.py`: `create_server`, `settimeout(1)`, a `TimeoutError` loop, five threads, shutdown, join | Python restarts interrupted calls, so a timeout is the only way back to the loop | Lec19 slides 9-13; lecture19-code/question_server_tcp_signal_fixed.py; Nov 17 lines 461-612 |
| 8 | The error-handling ledger pass | Every call checked, every failure path releases what it holds | Error handling section below |
## Environment facts (measured)
The `.devcontainer` files are the course's environment rules: `Dockerfile` installs the toolchain and downloads `testius` and `socrates`; `devcontainer.json` sets `--ulimit=nofile=1024:1024`, `SYS_PTRACE`, `seccomp=unconfined`, format-on-save with clang-format 19 and ruff, trailing-whitespace trimming, and `chat.disableAIFeatures`.

| Fact | Value | Why it matters here |
|---|---|---|
| Compiler and flags | gcc 11.4.0 with `-Wall -Werror -g -pthread` (Part 1 Makefile line 3) | An unused variable fails the build. This is why the starter comments out `serve_dir` and `port` (lines 33-34) |
| Python | 3.10.12 | `socket.timeout is TimeoutError` is True; `queue.Queue.shutdown` does not exist (added in 3.13) |
| User | `root` | Binding ports below 1024 succeeds in the container but fails for a normal user (APUE p. 605; Nov 5 lines 357-367) |
| Open-file limit | `ulimit -n` is 1024 | A leaked client descriptor per request exhausts the server after about 1000 requests |
| Client tools | `curl` 7.81.0, `wget` 1.21.2, `valgrind`, `zip`; **no `nc`, no `strace`, no `ruff` command** | The netcat demo (Nov 5 lines 943-985) needs `curl -v` or Python instead |
| Real client bytes | curl sends `GET /quote.txt HTTP/1.1\r\nHost: localhost:PORT\r\nUser-Agent: curl/7.81.0\r\nAccept: */*\r\n\r\n` (88 bytes); wget adds `Accept-Encoding: identity` and `Connection: Keep-Alive` (139 bytes) | Both send **HTTP/1.1** request lines. The parser accepts `HTTP/1.x`; the reply still says `HTTP/1.0` |
| `getaddrinfo(NULL,"8000",AI_PASSIVE,AF_UNSPEC,SOCK_STREAM)` | First result `AF_INET`, second `AF_INET6` | Using the first result, as Nov 3 lines 566-569 says, binds IPv4 |
| TSAN binary | Plain `./http_server_tsan` exits 66 with `FATAL: ThreadSanitizer: unexpected memory mapping`; `setarch -R ./http_server_tsan ...` runs | Same WSL2 kernel issue as [[20_Progress/Degree/CSCI 4061/Labs/Lab - 7\|Lab - 7]]. `make test` never runs the TSAN binary |
| Stray output | A line the background server wrote to stdout or stderr appeared in the actual transcript of test 1 | Quiz Q15 is literal: print nothing on success |
| `pkill` | `pkill -INT http_server` also killed a process named `http_server_tsan` | Do not leave your own TSAN server running while `make test` runs |
| Starter file hygiene | The seven EDIT files are LF-only, have no trailing spaces, and end with a newline | Trim-on-save and final-newline will not touch them. Format-on-save might (see Edit surface) |
## File map and edit surface
Only the files marked EDIT are graded as yours. The autograder replaces every other file with the standard copy (Assignment, Starter Code).

| File | Status | Lines | Role |
|---|---|---|---|
| `Makefile` (top) | Provided | 37 | `make`, `test`, `clean`, `clean-tests`, `zip` for both parts |
| `part1/Makefile` | Provided | 62 | Builds `http_server`, `http_server_tsan`, `concurrent_open.so`; runs `testius` |
| `part1/http.h` | Provided | 22 | Two function contracts |
| `part1/http.c` | **EDIT** | 39 | `get_mime_type` given; two stubs |
| `part1/http_server.c` | **EDIT** | 37 | `main` is a stub |
| `part1/connection_queue.h` | **EDIT** | 63 | Struct with a TODO; five contracts you may not change |
| `part1/connection_queue.c` | **EDIT** | 29 | Five stubs |
| `part1/concurrent_open.c` | Provided (test only) | 235 | The `LD_PRELOAD` barrier |
| `part1/server_files/`, `part2/server_files/` | Provided | 11 files each | `quote.txt` 68 bytes, `index.html` 359, `headers.html` 229, `courses.txt` 2655, `gatsby.txt` 299452, `mt2_practice.pdf` 147103, `africa.jpg` 987613, `ocelot.jpg` 1186359, `hard_drive.png` 1681872, `Lec01.pdf` 2216288, `rain.mp3` 282282 |
| `part1/test_cases/`, `part2/test_cases/` | Provided | `tests.json`, 15 inputs, 16 outputs | The two tests per part |
| `part2/http_server.py` | **EDIT** | 34 | Arguments given; the rest is a TODO |
| `part2/http_handler.py` | **EDIT** | 25 | MIME dictionary given; two stubs |
| `part2/connection_queue.py` | **EDIT** | 46 | Exception class and constructor given; three stubs |
| `part2/Makefile`, `part2/concurrent_open.c` | Provided | 37, 235 | Builds only `concurrent_open.so`; the C file is byte-identical to Part 1's |
### Edit surface (the only lines that should change)
==Seven files may differ from `proj3-original`, and inside them only the regions below; every other byte, including the Makefiles, `http.h`, the test files and `server_files`, must stay identical.== After any save, `diff -u proj3-original/<file> proj3-code/<file>` should show hunks only in these regions.

| File | Regions that change | Lines that must stay byte-identical |
|---|---|---|
| `part1/http_server.c` | Lines 33-34 (uncomment); line 36 `return 0;` becomes the real body; new code inserted after line 24 (the worker function) and between lines 31 and 36. Optional one-line change at line 19 (flag type, Decision 10) | Lines 1-18, 20-24, 26-31, 37 |
| `part1/http.c` | Lines 32-33 and 37-38 (the two stub bodies). Include lines near the top only if a new header is needed | Lines 11-29 (`BUFSIZE`, `get_mime_type`) |
| `part1/connection_queue.h` | Line 18 (the TODO becomes the new fields) | Everything else: lines 21-61 are the contracts you may not change |
| `part1/connection_queue.c` | Bodies at lines 7-8, 12-13, 17-18, 22-23, 27-28 | Includes and signatures |
| `part2/http_server.py` | Line 30 (the TODO); a worker function inserted between lines 17 and 19 | Lines 1-28 and 33-34, including all imports (no new library is allowed) |
| `part2/http_handler.py` | Lines 17 and 25 (the two bodies); one added `import pathlib` line; line 6 token `text/jpeg` to `image/jpeg` | Lines 3-5, 7-10, comments |
| `part2/connection_queue.py` | Line 18 (the TODO) and bodies at lines 29, 40, 46 | Lines 1-17 and the class, method and exception definitions |
- *Format-on-save is the hazard.* The dev container formats C with clang-format 19 on save, and no `.clang-format` exists anywhere on the image or workspace (measured). (measured) With no style file, `clang-format --style=Microsoft` rewrites 3 lines of `http_server.c`, 5 of `connection_queue.c`, 2 of `connection_queue.h` and 9 of `http.c`, all untouched starter lines (for example `int main(int argc, char **argv) {` moves its brace to a new line); `LLVM` and `Google` rewrite 12, 10, 7 and 18. I cannot tell which fallback the editor applies, so assume it will. Your own Lab 3 and Lab 4 files use brace-on-new-line style while the starter is brace-on-same-line, which fits that explanation but does not prove it (my inference).
- *How to keep the diff clean:* save with "Save without Formatting" (`Ctrl+K S`), or turn `editor.formatOnSave` off for this folder, or edit from the host side. Then check with `diff -rq proj3-original proj3-code` after `make clean clean-tests`; it should list exactly the EDIT files you touched (plus `proj3-code.zip` after `make zip`). Ruff could not be tested because it is not installed in the container shell; the Python starter already looks ruff-formatted.
- *Build artifacts count as differences.* Objects, binaries, `test_results/`, `downloaded_files/` and `__pycache__/` appear in the folder after any `make` or test run. Run `make clean clean-tests` before diffing, or build in a scratch copy as this note's experiments did.
## Part 1: http_server.c, line by line
==The starter gives you a flag, a handler, a pool size and an argument check; everything that touches a socket, a signal mask or a thread is yours, and every call you add needs a check and a cleanup (Error handling section).== The file is 37 lines.
### Provided lines
| Lines | What the line is | What you do with it | Sources |
|---|---|---|---|
| 1 | `#define _GNU_SOURCE` | Keep it first, before every include | Every professor networking file starts with it: lecture17-code/question_server_tcp.c line 3, lecture16-code line 3, Lab 9 `simple_http_client.c` line 1; `man 3 dlsym` shows the macro is what exposes `RTLD_NEXT` (`concurrent_open.c` line 3) |
| 3 | `errno.h` | `errno`, `EINTR` for accept, `ENOENT` in `http.c` | Quiz Q2; Lec05 slide 37; lecture17-code line 83; APUE 1.7 p. 14-16, 10.5 p. 327-329 |
| 4 | `netdb.h` | `getaddrinfo`, `freeaddrinfo`, `gai_strerror`, `struct addrinfo` | Lec16 slides 12-16; Nov 3 lines 453-523; APUE 16.3.3 p. 599-600 |
| 5 | `pthread.h` | `pthread_create`, `pthread_join`, `pthread_t` | Lec12 slides 19-25; Oct 20 lines 533-570; APUE 11.4-11.5 p. 385-389 |
| 6 | `signal.h` | `sigaction`, `sigset_t`, `sigfillset`, `sigprocmask`, `SIGINT`, `sig_atomic_t` | Lec05 slides 19-21 and 31-35; APUE 10.12 p. 346, 10.14 p. 349-351 |
| 7 | `stdio.h` | `perror`, `fprintf`, `snprintf` | APUE 1.7 p. 15; 5.11 p. 159 |
| 8 | `string.h` | `memset` to zero `hints`, `strerror` for pthread errors | Nov 3 lines 575-577; Lec12 slide 24; Lab 7 deck slide 3 |
| 9 | `sys/socket.h` | `socket`, `bind`, `listen`, `accept` | Lec16 slide 11; Lec17 slides 5-7; APUE 16.2-16.4 p. 590-609 |
| 10 | `sys/stat.h` | Listed, but `main` as specified needs no `stat` (`http.c` has it) | Lec06 slide 34; APUE 4.2 p. 93-94 |
| 11-12 | `sys/types.h`, `unistd.h` | Portable types; `close`, `read`, `write` | lecture17-code lines 11-12; Lec04 slides 8-9; APUE 3.7-3.8 p. 71-72 |
| 14-15 | `connection_queue.h`, `http.h` | The two interfaces you may not change | Assignment |
| 17 | `#define N_THREADS 5` | Keep 5. `concurrent_open.c` line 13 holds callers until five are inside `open()`, so fewer workers means a timeout | Assignment "Testing Your Server"; Quiz Q13; Lec17 slide 13; Nov 5 lines 684-704 |
| 19 | `int keep_going = 1;` | Written by the handler, read by the accept loop, nothing else. Change the type to `volatile sig_atomic_t` (Decision 10); this is the one provided line it is worth editing | Lab 3 deck slide 9: the plain `int` "works only because `fgetc()` forces a re-read. Use the right type anyway"; APUE p. 361 declares its quit flag `volatile sig_atomic_t`; lecture17-code line 16 and Lab 3 line 12 use a plain `int` |
| 20 | `const char *serve_dir;` | Assign once in `main` before the first thread exists, never again; workers read it without a lock | Lec13 slides 3-11 (a race needs a write); Lec12 slide 13 |
| 22-24 | `handle_sigint` sets `keep_going = 0` | Leave it. No `printf`, `malloc` or `strtok` here | Lec05 slide 26; Lec06 slide 15; Lab 3 deck slide 9 ("Keep the handler tiny"); Sep 24 lines 559-569; APUE 10.6 p. 330-332 |
| 26-31 | `argc != 3` prints usage, returns 1 | Keep. Tests always pass two arguments | lecture17-code lines 25-28 |
| 32-34 | Commented `serve_dir = argv[1];` and `const char *port = argv[2];` | Uncomment both. `port` stays a `const char *` because `getaddrinfo` takes the service as a string. The starter hides them because `-Werror` rejects an unused variable | Part 1 Makefile line 3; [[20_Progress/Degree/CSCI 4061/Labs/Lab - 8\|Lab - 8]] Errors and fixes; Lec16 slide 13; Nov 3 lines 465-480 |
| 36-37 | `return 0;` and the closing brace | Replace with the real flow and a real return code | lecture17-code lines 119-124 |
### Task 1: what main() does, in order
| Step | Call | Failure signal and handling | Sources |
|---|---|---|---|
| 1 | `sigaction(SIGINT, &act, NULL)`: `sa_handler = handle_sigint`, `sigfillset(&act.sa_mask)`, `sa_flags = 0`, struct zeroed first (`= {0}`) | -1: `perror("sigaction")`, return 1 | Assignment "Signal Handling"; lecture17-code lines 31-39; Lec05 slides 31-35; Lec06 slides 4-7; Lab 3 lines 26-34 and deck slides 7-8 (`sa_flags` 0 makes the call fail with `EINTR`); APUE 10.14 p. 349-351 and p. 354 |
| 2 | `sigaction(SIGPIPE, SIG_IGN)` (Decision 6) | -1: `perror`, return 1 | Lec05 slides 32 and 34 (`SIG_IGN` example); APUE 10.2 p. 319 (SIGPIPE is also generated "when a process writes to a socket of type SOCK_STREAM that is no longer connected"); Lab 4 deck slide 3 (ignored: `write` fails with `EPIPE`); APUE 12.8 p. 453 (dispositions are shared by all threads) |
| 3 | Fill `hints`: `memset` 0, `ai_family = AF_UNSPEC`, `ai_socktype = SOCK_STREAM`, `ai_flags = AI_PASSIVE` | No call | Lec16 slides 14-16 and 21; Lec17 slide 5; lecture17-code lines 41-47; Nov 3 lines 575-583 and 850-864; APUE p. 600 |
| 4 | `getaddrinfo(NULL, port, &hints, &server)` | A **nonzero error code, not errno**: `fprintf(stderr, "getaddrinfo failed: %s\n", gai_strerror(ret))`, return 1 | Lec16 slides 12-14; Nov 3 lines 510-524; lecture17-code lines 49-54; APUE p. 600 |
| 5 | `socket(server->ai_family, server->ai_socktype, server->ai_protocol)` | -1: `perror("socket")`, `freeaddrinfo(server)`, return 1 | Lec16 slides 11 and 17; lecture17-code lines 55-61; APUE 16.2 p. 590-591 |
| 6 | `bind(sock_fd, server->ai_addr, server->ai_addrlen)` | -1: `perror("bind")`, `freeaddrinfo`, `close(sock_fd)`, return 1 | Lec16 slide 22; Nov 3 lines 931-956; lecture17-code lines 62-68; APUE 16.3.4 p. 604-605 |
| 7 | `freeaddrinfo(server)` right after `bind` | No return value | lecture17-code line 69; Lab 9 deck slide 4 (free on every path); APUE p. 599 |
| 8 | `listen(sock_fd, backlog)` (lecture uses 5) | -1: `perror`, `close`, return 1 | Lec17 slide 6; Nov 5 lines 143-165; lecture17-code lines 15 and 70-75; APUE p. 608 |
| 9 | `while (keep_going)` around `accept(sock_fd, NULL, NULL)` | -1 with `errno == EINTR`: leave the loop and clean up. Any other errno: `perror("accept")`, clean up, return 1 (Decision 9) | Lec17 slide 7; Nov 5 lines 171-194 and 321-323; Nov 3 lines 861-894 and 902-907; lecture17-code lines 77-91; Quiz Q2; APUE p. 608-609 |
| 10 | `read_http_request(client_fd, resource_name)` | -1: close `client_fd`, keep serving | Quiz Q1; Assignment main-loop step 1 |
| 11 | Join `serve_dir` and `resource_name` with `snprintf` | Result below 0 or at least the buffer size means truncation: close `client_fd`, keep serving | Assignment main-loop step 2; Quiz Q6; Lab 9 lines 63-68; Lab 9 deck slide 6; APUE 5.11 p. 159 |
| 12 | `write_http_response(client_fd, path)` | -1: report, keep serving | Assignment main-loop step 3 |
| 13 | `close(client_fd)` | -1: `perror("close")` | Assignment step 4; lecture17-code lines 112-114; Lec08 slide 10 |
| 14 | After the loop: `close(sock_fd)`, `return 0` | -1: `perror("close")`, return 1 | lecture17-code lines 119-124; Nov 3 lines 909-923 |
- *Why the accept loop ends on SIGINT:* `sa_flags = 0` means no `SA_RESTART`, so a signal that lands while `accept` is blocked makes it return -1 with `EINTR` (APUE p. 327-329 and p. 351; Lab 3 deck slide 8). `man 7 signal` lists `accept` as restarted only with `SA_RESTART`. (measured) With `sa_flags = 0`, `accept` returned -1 with `EINTR` and the handler ran on the main thread in 3 of 3 runs; with `SA_RESTART` the process never exited in 3 of 3.
- *Why this overrides the usual advice:* Lec05 slide 38 says "Use SA_RESTART in your code and you will usually be fine" and Lab 3 required it. Project 3 is the stated exception, and the lecture code for this exact server writes `sa_flags = 0` with the comment "Note the lack of SA_RESTART" (lecture17-code line 35).
- *Why print nothing on success:* (measured) lines the background server wrote to stdout and stderr appeared inside the recorded transcript of test 1, which is Quiz Q15. The lecture servers print "Waiting for client to connect" (lecture17-code line 80); do not copy those lines.
### Task 2: what changes
| Step | Change | Why this position | Sources |
|---|---|---|---|
| 1 | Declare `connection_queue_t queue;` in `main`; `connection_queue_init(&queue)` first. On -1, return 1 | The queue must exist before any worker or accept call uses it | Assignment "Modifying the Server Implementation" |
| 2 | `sigaction` (SIGINT, SIGPIPE) at the top of `main` | Handlers and dispositions are process-wide; only the mask is per thread | APUE 12.8 p. 453 |
| 3 | `sigfillset(&all)` then `sigprocmask(SIG_BLOCK, &all, &old)` before creating any thread | A new thread inherits the creator's mask, so blocked-before-create means blocked in every worker | Assignment steps 1-3; APUE 11.4 p. 386; Lec05 slides 19-21; Sep 22 lines 786-806 (third argument saves the old mask) |
| 4 | Create `N_THREADS` workers: `pthread_create(&threads[i], NULL, worker, &queue)` | Workers block in `dequeue` on the empty queue | Lec12 slides 21-25; Oct 20 lines 533-570; APUE p. 385-386; Lab 7 `sum_files.c` lines 71-80 |
| 5 | `sigprocmask(SIG_SETMASK, &old, NULL)` right after the last create | Only main should be able to take SIGINT | Assignment step 3 |
| 6 | Accept loop calls `connection_queue_enqueue(&queue, client_fd)`; on -1 close `client_fd` | Main only produces; blocking on a full queue is the intended cap | Nov 5 lines 684-704; Lec13 slide 22 |
| 7 | After the loop: `connection_queue_shutdown`, `pthread_join` every worker, `connection_queue_free`, `close(sock_fd)` | Free the queue only after every thread that uses it is joined | Assignment "Cleanly Shutting Down"; Oct 20 lines 633-638; APUE 11.5 p. 389; Lab 7 lines 84-90 |
- *Worker body (you add the function):* loop on `connection_queue_dequeue`; -1 means shutdown and empty, so return `NULL`. Otherwise read the request, build the path, write the response, `close(fd)`. A failed request is reported and the loop continues, so one bad client never kills a worker. The lecture has the workers close the connection: "they take a file descriptor, they read or write on it, and then they close when they're done" (Nov 5 lines 697-702).
- *Per-thread state:* `resource_name` and the path buffer are locals in the worker, never `static` or global (Lec12 slides 11-13; Lec13 slides 3-11).
- *What `arg` points to:* the queue lives in `main`'s frame and `main` joins every worker before returning (APUE p. 391-392 shows what goes wrong otherwise; lecture12-code/pthreads_exercise_v2.c lines 14-17 and 38-82).
- *If `pthread_create` fails at worker i:* restore the mask, then `connection_queue_shutdown`, join the i workers already running, free the queue, close the socket. The workers are blocked in `dequeue`, so joining without a shutdown hangs; lecture12-code/pthreads_exercise_v2.c lines 50-60 joins and frees but its threads end on their own. This ordering is my inference from the two code shapes.
- *Signal edge cases:* SIGINT while main is blocked in `enqueue` on a full queue runs the handler, but `pthread_cond_wait` is restarted (`man 7 signal`), so main waits for a dequeue. SIGINT between `while (keep_going)` and `accept` is lost; the course shows the same race for `pause` (Lec06 slides 18-21) and has no `accept` fix. (measured) With workers left unblocked, the handler still ran on the main thread 3 of 3 times, but `man 7 signal` says delivery goes to an arbitrary unblocked thread, so keep the mask step.
## Part 1: http.h and http.c, line by line
==`read_http_request` and `write_http_response` are the two halves of one HTTP/1.0 exchange, joined only by the `resource_name` string the first produces.== `http.h` is not an EDIT file, so its prototypes are fixed.
### http.h
| Lines | What the line is | What it means for your code | Sources |
|---|---|---|---|
| 1-2 | SPDX comments | Nothing | |
| 3-4, 22 | Include guard `HTTP_H` | Same pattern as `connection_queue.h` lines 3-4 and 63 and Lab 8 `queue.h` lines 3-4 and 30 | |
| 6-12 | Contract for `read_http_request(int fd, char *resource_name)` | `fd` is the connection socket. On success `resource_name` holds only the resource (`/quote.txt`) and the result is 0; -1 on error. **There is no size parameter**, so the buffer size is an unwritten agreement (Decision 2) | Assignment "Reading HTTP Requests"; Quiz Q6 |
| 14-20 | Contract for `write_http_response(int fd, const char *resource_path)` | `resource_path` is a real path, `serve_dir` joined to the name. Returns 0 or -1 | Quiz Q6. The Assignment hint calls it `write_http_request`, a typo |
### http.c
| Lines | What the line is | What it means for your code | Sources |
|---|---|---|---|
| 1 | `#include "http.h"` | The contract | |
| 3 | `assert.h` | Unused. An `assert` aborts the whole server, the wrong answer to one bad client (my reasoning) | |
| 4 | `errno.h` | `ENOENT` after a failed `stat` | Assignment hint; Quiz Q2; APUE 1.7 p. 14-16 |
| 5 | `fcntl.h` | `open`, `O_RDONLY` | Lec04 slide 7; Lab 9 line 128; APUE 3.3 p. 62 |
| 6 | `stdio.h` | `snprintf`, `perror` | APUE 5.11 p. 159; Lab 9 line 64 |
| 7 | `string.h` | `strcmp` (used by line 14), plus whatever you parse with | Lec03 slide 5; Lec06 slide 15; Sep 24 lines 507-531; APUE 12.5 p. 442-443 |
| 8 | `sys/stat.h` | `struct stat`, `stat` | Lec06 slide 34; Lec07 slides 7 and 21; APUE 4.2 p. 93-94 |
| 9 | `unistd.h` | `read`, `write`, `close` | Lec04 slides 8-9 and 12-13; APUE 3.7-3.8 p. 71-72, 3.5 p. 66 |
| 11 | `#define BUFSIZE 512` | Chunk size for the body copy and an implied bound for the request buffer; the Assignment suggests 512 or 4096 | Lec06 slide 22; APUE 3.9 p. 72-73 (4096 equals `st_blksize` on ext4); Lab 9 line 12 |
| 13-29 | `get_mime_type(const char *file_extension)` | Provided. Exact, case-sensitive match on an extension with its dot. Returns `NULL` for anything unlisted; a `NULL` argument dereferences null inside `strcmp` | Assignment "Writing HTTP Responses"; Lec17 slide 19; Nov 5 lines 898-904 |
| 31-34, 36-39 | The two stubs returning 0 | You write both bodies | |
### What read_http_request must do
- *Loop on `read()` until the request is complete.* TCP is a byte stream with no message boundaries, so one `read` can return half a request (APUE 16.2 p. 591; 3.7 p. 71; Lec04 slide 12; Lab 9 deck slide 3). The request ends at the first `\r\n\r\n`. Search the accumulated buffer, because those four bytes can arrive split across two reads. This is Decision 1 (a plain `read` loop: no extra descriptor or `FILE` to clean up).
- *Consume the whole request, headers included.* The Assignment says so, and there is a mechanism behind it. (measured) A server that sent its reply and closed with request bytes still unread made the client fail with `ConnectionResetError` and lose the reply; the same server after reading the request delivered all 43 bytes. Closing with unread data resets the connection (my reading of the measurement; APUE does not cover it).
- *Bound everything.* Pick one buffer-size constant for `http_server.c` and `http.c` (Decision 2) and never write past it; an over-long request line is an error, not an overflow.
- *Parse only the first line.* `GET`, a space, the resource, a space, the version. curl and wget send `HTTP/1.1` (measured), so accept any `HTTP/1.x`. RFC 1945 section 5.1: `Request-Line = Method SP Request-URI SP HTTP-Version CRLF`. Ignore every header but still consume them. Quiz Q4 gives the line shape.
- *Do not use `strtok`.* It keeps hidden static state, modifies the string and is unsafe across threads (Quiz Q7, all three true; Lec03 slide 5; Lec06 slide 15; Sep 24 lines 507-531; APUE p. 442 lists `strtok` as not thread-safe and p. 443 gives the `_r` form). `strtok_r`, `sscanf` (APUE 5.11 p. 160) or pointer scanning all work.
- *Return -1 when the peer closes early.* `read` returning 0 before the terminator means the client hung up (Lab 9 QUESTIONS; Lec08 slide 14; Nov 5 lines 80-83). A negative return is an error; in Task 1 an `EINTR` from SIGINT is possible because the handler has no `SA_RESTART`.
- *The lab technique is the fallback.* Lab 9 `read_http_response` (lines 90-125) uses `dup`, `fdopen`, `setvbuf(..., _IONBF, 0)` and `fgets` until `"\r\n"`. It adds three resources to release (the duplicate, the `FILE`, the close); closing the `FILE` closes only the duplicate (Lab 9 lines 122-125). The Assignment's own fallback is plain `read()`.
### What write_http_response must do
| Order | Action | Failure and edge handling | Sources |
|---|---|---|---|
| 1 | `stat(resource_path, &sb)` | -1 with `ENOENT`: 404. Any other errno: `perror("stat")`, return -1. A path that is not a regular file (`S_ISREG` false, for example `GET /`) is also a 404 (Decision 3) | Assignment hint; Lec06 slide 34; Lec07 slide 7; APUE 4.2 p. 93-94 and 4.3 p. 96 |
| 2 | 404: write exactly `HTTP/1.0 404 Not Found\r\nContent-Length: 0\r\n\r\n`, no body | Write fully (loop). A handled 404 returns 0 and prints nothing | Assignment examples; Quiz Q8 (a 404 also needs `Content-Length`); Nov 5 lines 992-999; RFC 1945 section 6.1 (Status-Line) |
| 3 | Pick the type: `get_mime_type(strrchr(path, '.'))` | `strrchr` returns `NULL` with no dot and `get_mime_type` returns `NULL` for unlisted types; both need a fallback of `application/octet-stream` (Decision 3). `strrchr` is in the string manual, not in any course slide | Starter lines 13-29; RFC 1945 section 7.2.1 |
| 4 | Build `HTTP/1.0 200 OK\r\nContent-Type: <type>\r\nContent-Length: <n>\r\n\r\n` with `snprintf` | `n` is `st_size`, an `off_t`: print with `%ld` and a `(long)` cast so `-Wformat` under `-Werror` is quiet. A result below 0 or at least the buffer size is truncation: return -1 | Assignment "Writing HTTP Responses"; Lec07 slide 21; APUE 4.2 p. 94 and 5.11 p. 159; Lab 9 lines 63-68 |
| 5 | `open(resource_path, O_RDONLY)`, done before any byte is sent | -1: `perror("open")`, return -1, with no half-sent 200 behind it (Error handling ledger). **This is the call `concurrent_open.so` intercepts**: make exactly one `open` per request | `concurrent_open.c` lines 76-97; Lab 9 line 128 |
| 6 | Send the header with a loop on `write` | A `write` can return fewer bytes than asked (Lec04 slide 12; APUE 3.8 p. 72); on a blocking socket a short count appears when a signal interrupts a partly finished write (`man 7 signal`; APUE 10.5 p. 328). A -1 here (including `EPIPE`) is a per-request failure: `close(file_fd)`, return -1 | Lab 9 lines 70-79; Nov 17 lines 280-312 ("write in a loop ... until the total equals the number you wanted") |
| 7 | Copy in chunks: `read` a chunk, write all of it, repeat until `read` returns 0 | Write `nread` bytes, never `strlen`: JPEG, PNG, PDF and MP3 bodies contain zero bytes. A read or write error cannot change the status line already sent: `close(file_fd)`, return -1 | Assignment hint; Lec04 slide 13; Lab 9 lines 134-146; APUE 3.9 p. 72-73 |
| 8 | `close(file_fd)`; return 0 | Check the `close` | Lab 9 lines 148-151 |
- *The body is the file's exact bytes.* Only the status line, headers and the blank line use `\r\n` (Quiz Q5; Nov 5 lines 853-866). The five text files contain no `\r` (measured, `tr -cd '\r'`) and the binary files are compared byte for byte by `diff -q`, so nothing may rewrite any byte.
- *`write` to a closed client.* APUE p. 319 says SIGPIPE is also generated on a disconnected `SOCK_STREAM` socket. (measured) A C server writing 4096 bytes twice to a socket whose peer had closed exited with status 141 on the second write; with SIGPIPE ignored the same `write` returned -1 with `EPIPE` and the server lived. This is why Task 1 step 2 ignores SIGPIPE.
- *Unspecified requests:* methods other than GET, `..` in a path, and an unreadable file are in no Assignment, test or lecture. Decision 3 gives a rule for each.
## Part 1: connection_queue.h and connection_queue.c, line by line
==The queue is Lab 8's `queue.c` rebuilt on a fixed array, plus one `shutdown` flag that every wait loop tests; the lab is the proof the pattern works.== "You'll build one again in Project 3" (Lab 8 deck slide 3); "producer-consumer ... a thread-safe queue" (Nov 5 lines 695-705).
### connection_queue.h
| Lines | What the line is | What it means for your code | Sources |
|---|---|---|---|
| 3-4, 63 | Include guard | Keep | |
| 6 | `#include <pthread.h>` | Needed for `pthread_mutex_t` and `pthread_cond_t` | Lec13 slides 17 and 28; APUE p. 400 and 414 |
| 8 | `#define CAPACITY 5` | The fixed maximum; equals `N_THREADS`, so five clients can be in service and five waiting | Assignment "Thread-Safe Queue Data Structure" |
| 12-19 | `connection_queue_t` | You may add fields but not change any function declaration | Assignment |
| 13 | `int client_fds[CAPACITY]` | Ring-buffer storage for descriptors | Lab 8 deck slide 5 (`out = (out + 1) % N`) |
| 14-16 | `length`, `read_idx`, `write_idx` | `length` counts under the lock; indices advance modulo `CAPACITY`. When `length == CAPACITY` the indices are equal, so test `length`, not the indices | Lec13 slides 24 and 31-32 |
| 17 | `int shutdown` | Set once by `connection_queue_shutdown`, read in every wait loop | Assignment "connection_queue_shutdown()" |
| 18 | TODO: add synchronization fields | One `pthread_mutex_t`, two `pthread_cond_t` (not full, not empty): the trio in Lab 8 `queue.h` lines 19-21 | Lec13 slide 27; Oct 22 lines 778-818; APUE 11.6.6 p. 413 |
| 21-27 | Contract for `init` | Returns 0 or -1 (Lab 8's returned 1 because that lab said so) | Lab 8 deck slide 6 versus this header |
| 29-37 | Contract for `enqueue` | Blocks while full; after shutdown no addition and -1 | Lec13 slides 24 and 31 |
| 39-47 | Contract for `dequeue` | Blocks while empty. Its sentence "If the queue is shut down, then no removal ... is returned" is superseded by Decision 4 | Lec13 slides 24 and 32 |
| 49-55 | Contract for `shutdown` | Wakes every blocked thread | Assignment hint (`pthread_cond_broadcast`) |
| 57-61 | Contract for `free` | Destroy the mutex and both conditions, after every thread is joined | APUE p. 400 and 414; Lec13 slides 17 and 28 |
### connection_queue.c
The five functions are stubs returning 0 (lines 6-9, 11-14, 16-19, 21-24, 26-29); lines 3-4 include `stdio.h` and `string.h`, which Lab 8's `queue.c` also uses for `fprintf` and `strerror` (lines 3-5 and 14).

| Function | Holds the lock for | Waits while | State change | Wakes | Returns |
|---|---|---|---|---|---|
| `init` | Not needed yet | Never | `length`, indices, `shutdown` set to 0; `pthread_mutex_init`, two `pthread_cond_init` with `NULL` attributes | Nobody | 0; -1 after printing the failing call's `strerror` text, **after destroying whatever was already initialized** |
| `enqueue(fd)` | Whole body | `length == CAPACITY` and not shut down, on "not full" | Store at `write_idx`, advance it modulo `CAPACITY`, `length` plus one | One waiting dequeuer, via "not empty" | 0; -1 if shut down (before or while waiting) |
| `dequeue()` | Whole body | `length == 0` and not shut down, on "not empty" | Take from `read_idx`, advance, `length` minus one | One waiting enqueuer, via "not full" | The descriptor; -1 only when shut down **and** empty |
| `shutdown` | Whole body | Never | `shutdown = 1` | **Every** waiter on both conditions, `pthread_cond_broadcast` | 0 |
| `free` | Not needed after join | Never | Destroy the mutex and both conditions | Nobody | 0, or -1 |
- *Why a loop, not an `if`:* a notified thread is only runnable, another thread can take the slot first, and the wait can return with nobody having signaled (Lec13 slide 33; Oct 22 lines 957-1011; Lab 8 deck slide 5; Nov 10 lines 740-750, which says the same for Python; APUE 11.6.6 p. 415). [[20_Progress/Degree/CSCI 4061/Labs/Lab - 8|Lab - 8]] recorded 6 of 6 crashes with `if` and 10 of 10 clean runs with `while`.
- *Why `shutdown` is part of both loop conditions:* a thread that wakes after shutdown must see the flag and leave, or it sleeps again and `pthread_join` hangs. That is the failure the Assignment names as the second cause of a test 2 timeout.
- *Why signal while holding the lock:* Lec13 slide 29 and the Assignment hint. APUE p. 416 allows signaling after unlocking when the loop tolerates a thief; follow the professor. The woken thread still waits for your unlock (Oct 22 lines 936-956).
- *Why unlock on every return:* Lab 8 deck slide 5 ("Every early return must unlock first, including when wait or signal fails") and `queue.c` lines 37-41 and 70-74.
- *Why `strerror`, not `perror`:* `pthread_*` functions return an error number and do not set `errno` (Lec12 slide 24; Oct 20 lines 595-632; APUE 11.4 p. 386; Lab 7 deck slide 3 and QUESTIONS; Lab 7 lines 46-55).
- *Locking order:* one mutex means no deadlock from lock order (Lec13 slides 38-39; APUE 11.6.2 p. 402). Call no queue function while holding another lock.
- *Invariants to state in the oral exam:* `0 <= length <= CAPACITY`; every access to `length`, the indices, the array and `shutdown` is under the one lock; `shutdown` only goes 0 to 1; `pthread_cond_wait` releases and reacquires the lock atomically (APUE p. 414; Lec13 slide 29).
## concurrent_open.c, line by line (both parts)
==`concurrent_open.so` makes the file open the one place where the test proves your server runs five clients at once: every `open` of a path containing `server_files/` waits until five threads are inside an open call, then all five go.== The two copies are byte-identical. No lecture or lab covers `LD_PRELOAD`; its sources are `man 8 ld.so` ("A list of additional, user-specified, ELF shared objects to be loaded before all others. This feature can be used to selectively override functions in other shared objects"), `man 3 dlsym` (`RTLD_NEXT` "allows one to provide a wrapper around a function in another shared object"), and APUE 7.7 p. 206 for shared libraries in general ("library functions can be replaced with new versions without having to relink edit every program"). The barrier logic is Lab 10's `Barrier` class.

| Lines | What the line does | Sources and consequences |
|---|---|---|
| 3 | `#define _GNU_SOURCE` | `man 3 dlsym`: required for `RTLD_NEXT` |
| 5-10 | `dlfcn.h`, `fcntl.h`, `pthread.h`, `semaphore.h`, `stdio.h`, `string.h` | Mutex: Lec13 slides 16-18. Semaphore: Lec14 slides 14-17; Lec18 slides 24-25 for the Python spelling; APUE 15.10 p. 579-582 |
| 12 | `SERVER_FILE_INDICATOR "server_files/"` | Only paths containing this text are held; `serve_dir` of `server_files` plus `/quote.txt` qualifies |
| 13 | `CONCURRENCY_DEGREE 5` | The pool must have at least 5 workers (`N_THREADS`, `N_WORKERS` are 5) |
| 15-17 | Static mutex (`PTHREAD_MUTEX_INITIALIZER`), a waiter count, a `sem_t` | Lec13 slide 17; Lec14 slides 14-19 |
| 28-33 | Constructor runs at library load: `sem_init(&semaphore, 0, 0)` | `pshared` 0: Lec14 slide 15 ("We'll always use 0"); initial 0: Lab 10 quiz answer |
| 35-38 | `is_server_file` uses `strstr(pathname, "server_files/")` | Plain substring match |
| 40-74 | `barrier()`: lock; if four others wait, post four times, reset the count, unlock; else count this thread, unlock, `sem_wait` | Same shape as Lab 10 `sema_barrier.py` lines 24-38 (count under a lock, last arrival releases the rest, give up the lock before blocking). APUE 11.6.8 p. 418 describes barriers. Error paths print and return -1, which makes the wrapped `open` return -1 |
| 76-97 | `open`: fetch the real function with `dlsym(RTLD_NEXT, "open")`, pass other paths through, else `barrier()` then the real call | Forwards only `pathname` and `flags`; harmless for `O_RDONLY` |
| 99-166 | `open64`, `openat`, `openat64` | Same pattern; which one a program reaches depends on glibc and Python |
| 168-212 | `__openat_2`, `__openat64_2` | glibc fortified entry points; no course source |
| 214-235 | `fopen` | `fopen("server_files/...")` is held too |
- *Rounds:* the fifth arrival releases the four that waited. Test 2 issues 10 requests: two rounds. A server with four workers, or workers that cannot all reach `open` together, leaves the first four waiting forever.
- *Not intercepted:* `stat`, `read`, `write`, `close`, `accept`. A `stat` before the `open` does not count.
- (measured, Part 2 side) With the library preloaded, five Python threads each running `open(path, "rb")`, `pathlib.Path(path).read_bytes()` or `os.open` completed together; five threads calling only `os.stat`, `Path.exists` and `Path.stat` never reached the barrier; four threads calling `open` completed 0 of 4 after 12 seconds.
- *Manual run:* `LD_PRELOAD=./concurrent_open.so ./http_server <serve_dir> <port>` (Assignment).
## Makefiles, line by line
==The top-level Makefile has a port bug and the Part 1 Makefile has a stale-object trap, and neither file is yours to change.== Both were confirmed in the container.
### Top-level Makefile (37 lines)
| Lines | What it does | Notes and sources |
|---|---|---|
| 3-4 | `AN = proj3`, `SHELL = /bin/bash` | Bash is needed for the `$((...))` on line 8 and the `(( ))` tests in `zip` |
| 5 | `CWD` is the current folder's name | Used by `zip` |
| 7 | `port_base ?= 8000` | `make test port_base=9001` is Quiz Q17's answer; Q16: defaults start at 8000 |
| 8 | `py_port_base := $(shell echo $$(($(primary_port) + 3)))` | **Bug.** `primary_port` exists only in the part Makefiles, so here it is empty and the sum is 3. (measured) `make test` ran `make -C part2 test port_base=3`: Part 2 uses ports 3 and 4, which works only because the container user is root, and a `port_base` given at the top never reaches Part 2. Run Part 2 with `make -C part2 test port_base=9101` |
| 10-18 | `.PHONY`, `all`, `part1`, `part2` run `$(MAKE) -C` | |
| 20-22 | `test: all clean clean-tests`, then both part tests | `test` cleans first, so every top-level test run rebuilds from scratch (measured) |
| 24-30 | `clean`, `clean-tests` forward to both parts | |
| 32-37 | `zip`: clean, then `zip -r` excluding `server_files` and `test_cases`; warns above 10 MiB or 256 files | The archive carries only your sources |
### part1/Makefile (62 lines)
| Lines | What it does | Notes and sources |
|---|---|---|
| 3-4 | `CFLAGS = -Wall -Werror -g -pthread`; `TSAN_CFLAGS` adds `-fno-omit-frame-pointer -fsanitize=thread` | Lab 7 deck slide 5 and Lab 7 Makefile line 2 |
| 8-10 | `port_base ?= 8000`, `primary_port`, `secondary_port` is plus 1 | `PORT1` and `PORT2` in the tests |
| 14 | `all: http_server http_server_tsan concurrent_open.so` | Plain `make` builds the TSAN twin, so both must compile clean |
| 16-20 | Link the three objects with and without TSAN | |
| 22-38 | One `.o` rule per source, built twice | **Trap (measured).** `http_server.o: http_server.c` lists no header. After appending a line to `connection_queue.h`, `make -n http_server` planned to rebuild only `connection_queue.c`; touching `http_server.c` was needed to rebuild `http_server.o`. Adding fields to `connection_queue_t` (required) therefore leaves `http_server.o` with the old `sizeof(connection_queue_t)` for the queue declared in `main`: silent stack corruption. Run `make clean` after any header edit |
| 40-41 | `concurrent_open.so` with `-shared -fpic ... -ldl` | `-ldl` supplies `dlsym` |
| 43-52 | `test-setup` deletes `downloaded_files`; `testnum` selects one test with `-v -n` | `make test testnum=2` |
| 54-62 | `clean`, `clean-tests`, `zip` prints an error | Run `make zip` from the top folder only |
### part2/Makefile (37 lines)
Nothing compiles for Python. `all` builds only `concurrent_open.so` (lines 13-16); `test` depends on it (lines 21-27); `clean` also removes `__pycache__` (line 30); `zip` prints the same error (lines 36-37); `primary_port` and `secondary_port` are defined as in Part 1 (lines 7-9), so `make -C part2 test port_base=N` uses N and N plus 1.
## The test harness
==Both parts run the same two tests: test 1 needs a correct sequential server, test 2 needs five concurrent opens and a server that exits by itself after SIGINT.== `testius` runs each input file's commands in a shell and compares the transcript with the output file.

| Test | Points | What it does | Sources and notes |
|---|---|---|---|
| Part 1 test 1, `sequential_test.txt` | 5 | Starts `./http_server server_files $PORT1` in the background, `sleep 2`, 11 `curl -s -S` downloads (quote, headers, index, courses, mt2_practice, gatsby, africa, ocelot, hard_drive, Lec01, rain) each followed by a silent `diff -q`, one request for `affordable_gpu.txt` printed with `-w "Response Status Code: %{http_code}\n"`, then `pkill -INT http_server` | The expected transcript has the commands and one line `Response Status Code: 404`. A 404 with a body would print the body first |
| Part 1 test 2, `tests.json` sequence | 10 | `dir_setup`, start the server on `$PORT2` with `LD_PRELOAD=./concurrent_open.so`, `sleep 2`, 10 `curl` downloads launched together, wait for all, `pkill -INT http_server`, wait for the server to finish, 10 `diff -q` checks | The step list is the truth: the description mentions a missing file but none of the 10 requests is for one; `courses.txt` is diffed twice; `rain.mp3` is not requested. Ten-second limit (Assignment) |
| Part 2 tests 1 and 2 | 5 and 5 | Same inputs with `python3 http_server.py server_files $PORT2`; the signal step is `pkill -INT -f "python3 http_server.py"` because the process name is `python3` | The two `tests.json` differ only in names and the points on the concurrent sequence (10 versus 5) |
- *Output rule:* (measured) a background server's stdout and stderr land in the transcript. Print only on error.
- *Exit rule:* after `pkill -INT` the harness waits for the server to end. A server stuck in `accept`, in a join, or in a lost wakeup is the "timeout" of Quiz Q13 and Q14.
- *`pkill` matches by pattern:* (measured) `pkill -INT http_server` also signaled `http_server_tsan`.
- *Baseline:* (measured) on the untouched stubs both parts score 0.0; Part 1 test 1 shows `curl: (7) ... Connection refused` for every request.
- *Hidden checks:* extra tests exist and a TSAN run is possible; run `setarch -R ./http_server_tsan server_files 4061` yourself.
## Part 2: the Python server, line by line
==Part 2 is the same design as Part 1, and after the Week 10 and 11 lectures every Python piece has a lecture slide, a lecture code file and a transcript passage behind it.== The sources, in the order you will use them:
- *Lec18 (Nov 10), Python threading:* slides 9-10 (`threading.Thread(target=..., args=...)`, explicit `start()`, `join()` returns no value), 11-12 (the GIL; threads suit I/O-bound work and a web server is the example), 13-14 (`Lock`, `acquire`/`release`, `with`), 20-23 (`Condition`, `wait`, `notify`, `notify_all`, `Condition(lock=...)` needed when two conditions share a lock), 26-27 (the producer and consumer queue), 28-29 (`queue.Queue`, whose shutdown arrives only in Python 3.13, "not available in our class container for Project 3"). Code: lecture18-code/array_sum.py and producer_consumer_queue.py.
- *Lec19 (Nov 17), Python networking:* slides 4 (bytes versus strings), 6 (`socketserver` is not allowed), 7 (`create_connection`, `sendall`), 8 (`create_server(("", port))`, port must be an `int`, `accept` is still explicit, `while data := conn.recv(BUFSIZE)`), 9-13 (signals: the broken server, PEP 475, the timeout fix, the interpreter's own handler). Code: lecture19-code/question_server_tcp.py, question_server_tcp_signal.py, question_server_tcp_signal_fixed.py.
- *Transcripts:* Nov 10 lines 267-278 and 640-651 (threads for I/O-bound servers; error style), 683-757 (Condition), 807-906 (the queue and the shutdown remark); Nov 17 lines 59-95 (`encode`, `decode(errors="replace")`, `with`), 316-446 (TCP server, walrus, `send` versus `sendall`), 461-612 (signals, the timeout).
- *Lab 10 `sema_barrier.py`:* `threading.Lock`, `threading.Semaphore(0)`, `Thread(target=, args=)`, `start`, `join` (lines 18-19, 56-65).
### http_server.py, line by line
| Lines | What it is | What you do | Sources |
|---|---|---|---|
| 1-4 | `import signal, socket, sys, threading` | The only libraries allowed in this file | Assignment "HTTP Server"; Lec19 slide 6 |
| 6-7 | `import http_handler`; `from connection_queue import ConnectionQueue, ShutDownException` | Your two other EDIT files | |
| 9-10 | `QUEUE_SIZE = 5`, `N_WORKERS = 5` | Keep both | Part 1 `CAPACITY`, `N_THREADS`; `concurrent_open.c` line 13 |
| 11 | `keep_going = True` | Written by the handler, read by the accept loop | lecture19-code/question_server_tcp_signal.py line 9 |
| 14-16 | `handle_sigint(_signo, _frame)` sets `keep_going = False` through `global` | Leave it. Identical to lecture19-code line 12-14. It runs in the main thread: Python delivers every signal to the main thread only | Lec19 slides 9 and 13; Nov 17 lines 595-601; (measured) `signal.signal` off the main thread raises `ValueError`; APUE 12.8 p. 453 for the C-level rule |
| 19-28 | `main()`: `len(sys.argv) < 3` usage exit, `serve_dir`, `int(port)` with `except ValueError` and `sys.exit(1)` | Keep. The error style matches lecture19-code lines 36-43 | Lec11 slide 12; lecture11-code/my_cat.py lines 5-8 |
| 30 | `# TODO Complete the implementation ...` | Everything below | |
| 33-34 | `if __name__ == "__main__": main()` | Keep | lecture19-code/question_server_tcp_signal_fixed.py line 57 |
- *Steps to put at line 30, in order:*

| Step | Python call | Failure and edge handling | Sources |
|---|---|---|---|
| 1 | `signal.signal(signal.SIGINT, handle_sigint)` | No mask, no `sigaction` (Assignment). Python replaces the default `KeyboardInterrupt` behavior with your handler | lecture19-code/question_server_tcp_signal.py line 45; Lec19 slides 9-13; Lec05 slides 31-35 is the C analogue |
| 2 | `queue = ConnectionQueue(QUEUE_SIZE)` | The constructor takes the capacity | `connection_queue.py` line 14 |
| 3 | `server = socket.create_server(("", port))` | `OSError` on failure (for example `EADDRINUSE`): print it and `sys.exit(1)`, as lecture19-code lines 52-54 does. (measured) it sets `SO_REUSEADDR`, which is why Python has no linger-period failure; APUE Fig 16.22 p. 625 is the same helper (`socket`, `setsockopt`, `bind`, `listen`) | Lec19 slide 8; lecture19-code line 18; Nov 17 lines 350-362; APUE 16.4-16.6 |
| 4 | `server.settimeout(1.0)` | A timeout makes `accept` return to your loop. (measured) Without it the blocked call is syscall 288 (`accept4`) and the loop sees the flag only when a client connects (flag set at 1.5 s, loop exit at 5.0 s); with it the call is syscall 7 (`poll`) and the loop ended at 2.0 s | lecture19-code/question_server_tcp_signal_fixed.py line 19; Lec19 slides 10-12; Nov 17 lines 461-555 (including the 1 second versus 100 second trade-off); APUE 14.4.2 p. 506-508 (`poll` timeout, `EINTR`) |
| 5 | Start `N_WORKERS` threads: `threading.Thread(target=worker, args=(...))`, then `start()`, keep each in a list | `start()` is required, unlike `pthread_create`. Do not use daemon threads: "it's usually good to join" | Lec18 slides 9-10; lecture18-code/array_sum.py lines 38-53; Nov 10 lines 366-381 and 429-455; APUE 11.4-11.5 p. 385-389 |
| 6 | `while keep_going:` `try: conn, _ = server.accept()` `except TimeoutError: continue`, then `queue.enqueue(conn)` | `TimeoutError` is the right name on 3.10 (measured: `socket.timeout is TimeoutError`). The accepted socket is blocking even though the listener has a timeout (measured: 1.0 versus `None`). The address is ignored with `_` | lecture19-code question_server_tcp_signal_fixed.py lines 21-27; Nov 17 lines 366-390 |
| 7 | After the loop: `queue.shut_down()`, `join` every worker, `server.close()` | Shut down first so workers leave `dequeue`, then join | Assignment "HTTP Server" last bullet |
- *Worker function (you add it):* loop on `queue.dequeue()`; catch `ShutDownException` and `break`. Per connection: `read_request`, join `serve_dir` and the name, `write_response`, and close `conn` in a `finally` or a `with`. Catch `OSError` around the request work and print it; do not let an exception escape. (measured) An exception that escapes a thread prints `Exception in thread ...` and the thread ends, so one failed request shrinks the pool below the five the barrier needs. This is stricter than the lecture's remark that "the spirit's a little more lax about error handling" (Nov 10 lines 640-651); the Assignment's rubric overrides it.
- *A client that disconnects:* (measured) `sendall` to a closed client raised `BrokenPipeError`, an `OSError` subclass like `ConnectionResetError`, because Python ignores SIGPIPE at startup (measured: `SIG_IGN`). That covers the C server's SIGPIPE problem without extra code.
- *Quiz Q19:* Lec19 slide 12 states the mechanism: the interpreter's C handler resumes an interrupted call, otherwise it records the signal and runs your handler after a Python operation. (measured) the handler ran promptly (1.5 s) while `accept` stayed blocked, then `accept` was restarted. Either wording leads to `settimeout`.
### http_handler.py, line by line
| Lines | What it is | What you do | Sources |
|---|---|---|---|
| 1 | `import socket` | The starter's only import. Add `import pathlib`: the Assignment names `pathlib` for existence and size under "HTTP Utility Functions", and the "not allowed" sentences cover only the other two files (Decision 7). Do not import `os` | Assignment "HTTP Utility Functions" and "HTTP Server" |
| 3-10 | `MIME_TYPES` dictionary | `".jpg"` is `"text/jpeg"`, a starter bug (`http.c` line 19 and Nov 5 lines 898-904 say `image/jpeg`); fix that one token. Look types up with a default of `application/octet-stream` | `http.c` lines 13-29; Lec17 slide 19; RFC 1945 section 7.2.1 |
| 13-17 | `read_request(conn) -> str` | Accumulate with `conn.recv(...)` until `b"\r\n\r\n"` is in the buffer (`in` on bytes searches the accumulated data, so a split terminator is safe), then `split` the first line and return the resource as a `str`. `recv` returning `b""` means the client closed: raise or return an error, never loop. Decode with `errors="replace"` | lecture19-code/question_server_tcp.py lines 18-19; Lec19 slides 4 and 8; Nov 17 lines 59-84 and 328-346; Lec11 slide 10; APUE 16.5 p. 612 and 615 |
| 20-25 | `write_response(conn, file_path) -> None` | 404 or 200 as in C; header text built as a `str`, sent as `header.encode("utf-8")` with `conn.sendall`, then `with open(file_path, "rb") as f: conn.sendfile(f)` | Quiz Q18; Lec19 slide 7; Nov 17 lines 249-312 (why `sendall` loops); py3.10 `sendfile` docstring; APUE 3.8 p. 72 and 16.5 p. 610 ("With a byte-stream protocol, send will block until the entire amount of data has been transmitted") |
- *Header text is identical to C:* status line, `Content-Type`, `Content-Length`, blank line, each ending `\r\n` (Quiz Q5; Lec17 slides 18-19). The 404 carries `Content-Length: 0` (Quiz Q8; Nov 5 lines 992-999).
- *Existence and size with `pathlib` (measured):* a missing path gives `Path.exists()` False and `Path.stat()` raises `FileNotFoundError`; a directory gives `Path.is_file()` False; `Path("server_files/quote.txt").suffix` is `".txt"` and feeds the dictionary. Equivalent C: `stat` and `S_ISREG` (APUE 4.2-4.3 p. 93-96).
- *`sendfile`:* (py3.10 docstring) the file must be a regular file opened in binary mode, it returns the bytes sent, non-blocking sockets are unsupported. The same loop written by hand is `read` a chunk, `sendall` it (Lec04 slide 13). `open(path, "rb")` reaches the barrier once per request (measured).
- *Closing the request first:* the reset behavior measured for C applies here too; consume the whole request before replying.
### connection_queue.py, line by line
| Lines | What it is | What you do | Sources |
|---|---|---|---|
| 1-3 | `import collections, socket, threading` | The allowed set; `socket` is only for type hints. `queue.Queue` is not imported and may not be used | Assignment "Connection Queue"; Lec18 slides 28-29 |
| 6-8 | `class ShutDownException(Exception)` | Raise it from `enqueue` and `dequeue` instead of returning -1 | Assignment "Connection Queue" |
| 11-12 | `class ConnectionQueue` | | |
| 14-18 | `__init__(self, capacity)`: `elements = collections.deque()`, `shutdown = False`, `capacity`; line 18 is the TODO | Add `self.lock = threading.Lock()` and two `threading.Condition(lock=self.lock)` objects, as lecture18-code/producer_consumer_queue.py lines 9-11 does. Passing `lock=` is required when two conditions share a lock | Lec18 slides 21 and 26; Nov 10 lines 807-820 and 700-728 |
| 20-29 | `enqueue(conn)` | `with self.lock:` then `while len(self.elements) == self.capacity and not self.shutdown:` wait on the full condition; if shut down raise `ShutDownException`; `append`; `notify()` the empty condition | lecture18-code lines 14-19; Lec18 slide 27 |
| 31-40 | `dequeue()` | `with self.lock:` then `while` empty and not shut down: wait on the empty condition; if empty (so shut down) raise `ShutDownException`; `popleft`; `notify()` the full condition; return it | lecture18-code lines 21-27; Lec18 slide 27 |
| 42-46 | `shut_down()` | Under the lock set `shutdown = True` and `notify_all()` on **both** conditions | Lec18 slide 20 (`pthread_cond_broadcast` is `notify_all`); lecture18-code/read_write_lock.py line 44 |
- *Shutdown semantics (Decision 4):* the professor points at Python 3.13's `Queue.shutdown` as the model ("it actually does a lot of the shutdown logic for you"; Nov 10 lines 893-906; Lec18 slide 29). Its documented default, `immediate=False`, is: `put` raises `ShutDown`, blocked `put` callers are unblocked with `ShutDown`, `get` keeps returning queued items and raises `ShutDown` only once the queue is empty (py3.13 `queue` documentation). That is exactly the Assignment's "dequeue until the queue becomes empty".
- *Condition API (py3.10 docstrings):* `wait()` and `notify()` raise `RuntimeError` unless the caller holds the lock; `wait` releases the lock, blocks, reacquires it. `with cond:` or `with self.lock:` acquires and releases the shared lock, and does so when an exception such as `ShutDownException` leaves the block (Nov 10 lines 297-322). `deque.popleft()` on an empty deque raises `IndexError` (measured), so the empty check is not optional.
- *Keep the C rules:* check the condition in a `while` (Lec18 slide 22-23; Nov 10 lines 740-750 "loops are still just as necessary in Python"), include `shutdown` in the wait condition, use `notify_all` for shutdown, hold the lock when notifying (Lec13 slide 29; the Python methods raise `RuntimeError` otherwise).
- *The GIL does not make this safe:* it serializes bytecodes, not your check-then-act sequences; "critical sections are still critical sections even with concurrency" (Nov 10 lines 652-679).
## Error handling
==Projects 1 and 2 graded error handling at minus one point per missed check or missed cleanup step, and Project 3's text asks for the same review, so the working rule is: every call that can fail is checked, every failure prints a message that names the call, and every path out releases what it holds.== The rubric text, from [[20_Progress/Degree/CSCI 4061/Projects/Project - 1 Assignment|Project - 1 Assignment]] ("Error Checking Criteria"): "your relevant code must check all necessary return values and print informative messages if an error occurs. Your code should also release/close all allocated resources on all possible error paths. -1 point per missed check or cleanup step." Project 2 applied it again (Project - 2 Assignment, Deadlines and grading). Project 3's Grading Criteria says only "properly check for and deal with errors whenever using a C or Python function that may indicate an error"; treating Project 1's per-miss rule as the scale is an assumption, not a statement in the Project 3 text.
### The three rules
1. **Check**
	Compare every return value that can signal failure: system calls against -1, `getaddrinfo` and every `pthread_*` call against nonzero, `snprintf` against a negative or too-large result, short counts from `read` and `write`, and in Python every call that raises `OSError`. A `close` is a call too (Lab 9 lines 148-151; lecture17-code lines 112-114).
2. **Report**
	The message names the failing call. System calls: `perror("<call>")`, the convention Project 1 sets (`perror("getcwd")`, `perror("chdir")`, Project 1 Assignment lines 122-128). `pthread_*`: `fprintf(stderr, "<call>: %s\n", strerror(ret))` because they return an error number and leave `errno` alone (Lec12 slides 24-25; Lab 7 deck slide 3; Lab 8 `queue.c`). `getaddrinfo`: `gai_strerror` (Lec16 slides 14 and 16; lecture17-code line 52). Python: print the exception to stderr (lecture19-code line 53; lecture11-code/python_pipes.py line 25).
3. **Release**
	Free what you hold on every path out, in reverse order of acquisition: the lab solutions do this by early `return` after explicit cleanup, with no `goto` (Lab 4 `pipeline_commands.c` lines 17-25 and 54-59; Lab 2 `redirect_child.c` lines 39-43; Lab 5 `square_numbers.c` lines 45-51, which waits for the children already started before unmapping, the same shape as unwinding a failed `pthread_create`).
### Two kinds of failure
Project 1's strategy, applied to a server: when one user's command fails the shell "should print an error message to the user, do any cleanup local to that user command, and then re-prompt"; when the failure is "unrelated to a user command, the shell process should clean up and return an error value from `main()`" (Project 1 Assignment lines 132-134).

| Kind | Examples here | What to do |
|---|---|---|
| Request-level | A client hangs up early, sends a malformed or over-long request, asks for a missing or unreadable file, or disconnects mid-download; `read` or `write` on one connection fails | Report, release the connection's descriptors and file, and **keep the server (and the worker thread) running** |
| Process-level | `sigaction`, `getaddrinfo`, `socket`, `bind`, `listen`, `connection_queue_init`, `pthread_create`, a fatal `accept` error, a failed `enqueue` | Report, release everything created so far in reverse order, return 1 from `main` (Python: `sys.exit(1)`) |
### C ledger: main(), Task 2 (what is held when each step fails)
| Step that fails | Held at that moment | Release before returning 1 |
|---|---|---|
| `sigaction` (SIGINT or SIGPIPE) | Nothing | Nothing |
| `connection_queue_init` | Nothing (init undoes its own partial work) | Nothing |
| `getaddrinfo` | The queue | `connection_queue_free` |
| `socket` | Queue, address list | `freeaddrinfo`, `connection_queue_free` |
| `bind` | Queue, address list, `sock_fd` | `close(sock_fd)`, `freeaddrinfo`, `connection_queue_free` |
| `listen` | Queue, `sock_fd` | `close(sock_fd)`, `connection_queue_free` |
| `sigfillset` or `sigprocmask(SIG_BLOCK)` | Queue, `sock_fd` | `close(sock_fd)`, `connection_queue_free` |
| `pthread_create` at worker i | Queue, `sock_fd`, i running workers, mask blocked | Restore the mask, `connection_queue_shutdown`, `pthread_join` the i workers, `connection_queue_free`, `close(sock_fd)` |
| `sigprocmask(SIG_SETMASK)` (restore) | Queue, `sock_fd`, all workers | `connection_queue_shutdown`, join all, free, close |
| `accept` fails with an errno other than `EINTR` | All of the above | The normal exit path below, then return 1 |
| `connection_queue_enqueue` returns -1 | `client_fd`, all of the above | `close(client_fd)`, then the normal exit path, return 1 |
| Normal exit after SIGINT | All of the above | `shutdown`, then `pthread_join` **every** worker (if one join fails, report it and keep joining the rest, as Lab 8 `threads_main.c` lines 80-90 does), then `free`, then `close(sock_fd)`; return 1 if any step failed |
- *Every `close` is checked* and a failed close is reported, but it does not abort the cleanup that follows (lecture17-code lines 112-114 and 119-124).
- *Never `exit()` from a worker.* A worker that calls `exit(1)` ends the whole server (APUE 11.5 p. 388: "If any thread within a process calls exit, ... the entire process terminates"). Lab 8's `threads_main.c` does `exit(1)` on a queue failure because it is a toy; a server must not.
### C ledger: the worker and one request
| Event | Held | Action |
|---|---|---|
| `connection_queue_dequeue` returns -1 | Nothing | Return `NULL`; this is the normal end (the queue already printed anything abnormal) |
| `read_http_request` returns -1 | `client_fd` | `close(client_fd)` (check it), continue the loop |
| Path building truncates | `client_fd` | `close(client_fd)`, continue |
| `write_http_response` returns -1 | `client_fd` | `close(client_fd)`, continue |
| `close(client_fd)` fails | Nothing | `perror("close")`, continue |
### C ledger: http.c
| Function and event | Held | Action |
|---|---|---|
| `read_http_request`: `read` returns -1 | Nothing (stack buffer) | `perror("read")`, return -1 (`EINTR` here only in Task 1; it means shutdown) |
| `read_http_request`: `read` returns 0 before `\r\n\r\n` | Nothing | Message ("client closed before the request ended"), return -1 |
| `read_http_request`: request longer than the buffer, or first line not `GET <resource> HTTP/1.x` | Nothing | Message, return -1; never write past `resource_name` |
| `write_http_response`: `stat` fails with `ENOENT` or the path is not a regular file | Nothing | Send the 404; return 0 |
| `write_http_response`: `stat` fails with another errno | Nothing | `perror("stat")`, return -1 |
| `write_http_response`: `open` fails | Nothing | `perror("open")`, return -1. Do the `open` before sending the header, so a failure here leaves no half-sent 200 behind (my ordering; the measured barrier is indifferent to it) |
| `write_http_response`: header `snprintf` truncates (the header is built before the `open`) | Nothing | Message, return -1 |
| `write_http_response`: `write` fails (header or body, including `EPIPE`) | `file_fd` | `perror("write")`, `close(file_fd)`, return -1 |
| `write_http_response`: `read` of the file fails | `file_fd` | `perror("read")`, `close(file_fd)`, return -1 |
| `write_http_response`: final `close(file_fd)` fails | Nothing | `perror("close")`, return -1 |
- *Both functions loop on short counts.* A single `read` or `write` is wrong whenever the count can be partial (Lec04 slide 12; Lab 9 lines 70-79; APUE 3.7-3.8 p. 71-72). Project 2's drills list "no short-read handling, no `EINTR` retry" as a weak spot a TA can find.
### C ledger: connection_queue.c
| Function and event | Held | Action |
|---|---|---|
| `init`: `pthread_mutex_init` fails | Nothing | Message, return -1 |
| `init`: first `pthread_cond_init` fails | The mutex | `pthread_mutex_destroy`, message, return -1 |
| `init`: second `pthread_cond_init` fails | Mutex, first condition | Destroy both, message, return -1. Lab 8's `queue_init` stopped at the message because that lab has no destroy function; here `connection_queue_free` exists, so destroy |
| `enqueue` or `dequeue`: `pthread_mutex_lock` fails | Nothing | Message, return -1 |
| `enqueue` or `dequeue`: `pthread_cond_wait` fails | The lock | `pthread_mutex_unlock`, message, return -1 (Lab 8 `queue.c` lines 37-41) |
| `enqueue` or `dequeue`: sees `shutdown` (enqueue, or dequeue with the queue empty) | The lock | `pthread_mutex_unlock`, return -1 |
| `enqueue` or `dequeue`: `pthread_cond_signal` fails | The lock | `pthread_mutex_unlock`, message, return -1 (Lab 8 lines 70-74) |
| `enqueue` or `dequeue`: final `pthread_mutex_unlock` fails | Nothing | Message, return -1 |
| `shutdown`: lock, broadcast or unlock fails | The lock (after the lock succeeded) | Try the second broadcast anyway, unlock, return -1 |
| `free`: a `destroy` call returns nonzero | Nothing | Report, keep destroying the others, return -1 |
- *Shutdown must never leave a waiter asleep.* If the first `pthread_cond_broadcast` fails, still try the second: a worker left waiting makes `pthread_join` hang, which the harness reports as a timeout (Quiz Q14).
### Python ledger
| Where and event | Held | Action |
|---|---|---|
| `main`: `int(port)` raises `ValueError` | Nothing | Given code prints and exits 1 |
| `main`: `create_server` raises `OSError` | Nothing | `print(e)`, `sys.exit(1)` (lecture19-code lines 52-54) |
| `main`: `Thread.start()` raises `RuntimeError` (no thread available) | Server socket, queue, i started workers | `queue.shut_down()`, join the started workers, close the socket, `sys.exit(1)` |
| `main`: `accept` raises `TimeoutError` | Nothing | `continue` (not an error: lecture19-code fixed server line 25) |
| `main`: `accept` raises another `OSError` | Server socket, queue, all workers | Print it, leave the loop, run the shutdown and join below, exit 1 |
| `main`: `enqueue` raises `ShutDownException` or another exception | `conn` | `conn.close()`, leave the loop, run the shutdown below |
| `main`: shutdown and join, **placed in a `finally`** | All workers | `queue.shut_down()` then `join` each. Without a `finally`, any unexpected exception in the accept loop leaves non-daemon workers blocked in `dequeue` and the interpreter never exits (Nov 10 lines 429-455 on thread cleanup; `finally` pattern: lecture11-code/python_pipes.py lines 26-28) |
| Worker: `dequeue` raises `ShutDownException` | Nothing | `break` (normal end) |
| Worker: request work raises `OSError` (including `BrokenPipeError`, `ConnectionResetError`, a `ConnectionError` your handler raises on early close) | `conn` | Print to stderr, `conn.close()` in a `finally` or `with`, continue the loop |
| `http_handler.read_request`: `recv` returns `b""` before the blank line | Nothing | Raise `ConnectionError` (an `OSError`) so the worker's one `except` covers it; never loop on `b""` |
| `http_handler.write_response`: `open` raises `FileNotFoundError` or `PermissionError` | Nothing | Check with `pathlib` first for the 404; open **before** sending the 200 header; a failed open after the check propagates as `OSError` |
| `connection_queue`: `ShutDownException` raised inside `with self.lock:` | The lock | Nothing to do: `with` releases it when the exception leaves the block (Nov 10 lines 297-322) |
- *The lecture is more relaxed than the rubric.* Nov 10 lines 640-651: errors in thread code often just print a stack trace "in the spirit of Python". That is acceptable teaching style but not for a worker pool, because (measured) an escaped exception ends that worker.
### Call-by-call worklist
| Call | Failure signal | Message and recovery | Sources |
|---|---|---|---|
| `sigaction`, `sigemptyset`, `sigfillset`, `sigaddset`, `sigprocmask` | -1 with `errno` | `perror`; cleanup per ledger | Lec05 slides 19, 21, 31; lecture05-code/block_sigint.c lines 9-20 |
| `getaddrinfo` | Nonzero code | `gai_strerror`; `freeaddrinfo` after use | Lec16 slide 14; APUE p. 600 |
| `socket`, `bind`, `listen` | -1 | `perror`; close what you opened | lecture17-code lines 56-75 |
| `accept` | -1 | `EINTR`: stop serving. Else `perror` | Nov 3 lines 861-894; Quiz Q2 |
| `read`, `write` on a socket | -1, 0 on a closed peer, or a short count | Loop; 0 before the blank line is a failed request; `EPIPE` is a request failure | Lab 9 QUESTIONS; Lec04 slide 12; APUE 3.7 p. 71 |
| `stat`, `open`, `read`, `close` on the file | -1 | `ENOENT` is a 404; others `perror` | Lec07 slide 7; Lab 9 lines 128-151 |
| `snprintf` | Below 0, or at least the buffer size | Treat as an error | APUE 5.11 p. 159; Lab 9 line 65 |
| `pthread_create`, `pthread_join` | Nonzero | `strerror`; unwind per ledger; keep joining | Lec12 slide 25; Lab 7 lines 71-90 |
| `pthread_mutex_*`, `pthread_cond_*` | Nonzero | `strerror`; unlock first | Lab 8 `queue.c` |
| Python socket, file and thread calls | `OSError`, `TimeoutError`, `RuntimeError`, `ShutDownException` | Catch where the ledger says | Lec19 slides 8-11; Nov 17 lines 461-520 |
### Misses seen in the earlier projects
- *No handling of short reads and writes, no `EINTR` retry, no bound on a value read from the peer* (Project 2 Oral Exam Drills lines 195-196). The server reads a peer-controlled request length: bound it.
- *A failed `munmap` replaced an earlier error* (same file, line 199). Here: a failed `close` at the end must not hide the failure that started the cleanup.
- *`assert` aborting the whole process on bad input* (line 198). A bad request must not abort the server.
- *Generic messages* (line 200). Name the call and the cause.
- *Waiting for already-started children before freeing what they use* (Project 2 Oral Exam Drills lines 169-170), which is the rule for joining started workers before freeing the queue.
## Resolved decisions
==Each question below blocked an implementation choice; each now has one answer and the source that settles it.==
1. **Request reading in C**
	A plain `read` loop that accumulates and searches for `\r\n\r\n`: it holds no extra descriptor or `FILE`, so it has the fewest cleanup steps to miss. The Lab 9 `dup`, `fdopen`, `fgets` route is the fallback (Assignment hint). Sources: APUE 3.7 p. 71 and 16.5 p. 615; Lec04 slides 12-13.
2. **Buffer size contract**
	`http.h` has no size parameter and cannot change. Use one constant for the accumulating buffer and `resource_name`, defined in both `http_server.c` and `http.c` with the same value (512 matches `http.c`'s `BUFSIZE`). The resource is shorter than the request, so a copy bounded by that value cannot overflow. The captured requests were 88 and 139 bytes. Sources: `http.h` lines 6-12; APUE 5.11 p. 159.
3. **Policies the spec does not state**
	Only `ENOENT` is a specified 404. Rules: a path that is not a regular file is a 404; a `stat` or `open` failure with any other errno is `perror` plus return -1; a request whose method is not `GET` is return -1 with a message; a file type with no MIME entry is sent as `application/octet-stream`, which RFC 1945 section 7.2.1 names as the default for an unknown type; a handled 404 returns 0 and prints nothing. Sources: Assignment; APUE 4.3 p. 96; RFC 1945; Quiz Q15.
4. **Queue behavior after shutdown**
	Drain: `dequeue` keeps returning queued descriptors and returns -1 only when the queue is empty and shut down; `enqueue` returns -1 once shut down; shutdown wakes everyone. Sources: the Assignment ("Threads can continue to perform a dequeue operation until the queue becomes empty"); Lec18 slide 29 and Nov 10 lines 893-906 point to Python 3.13's `Queue.shutdown`, whose default `immediate=False` does exactly this (py3.13 documentation); Python's version also unblocks waiting `put` callers. This also closes every descriptor still queued. The header comment at `connection_queue.h` lines 39-47 is the looser wording.
5. **`SO_REUSEADDR` in C**
	Do not add it. The Assignment's answer to `address already in use` is "use a different port"; the staff's final run uses a free port; `setsockopt` is not on the Midterm 2 function list; it adds a call to check and explain. APUE 16.6 p. 625 shows the option (Fig 16.22) and Python's `create_server` sets it (measured), so know both. Use `port_base` to dodge the linger period.
6. **SIGPIPE in C**
	Ignore it once in `main`, before the threads, with `sigaction(SIGPIPE, SIG_IGN)`, and treat `write` returning -1 with `EPIPE` as a request-level failure. Sources: APUE p. 319 (SIGPIPE on a disconnected `SOCK_STREAM`) and p. 537 (an ignored SIGPIPE makes `write` return -1 with `EPIPE`); Lab 4 deck slide 3; Lec05 slides 32 and 34; APUE 12.8 p. 453 (dispositions are shared by every thread, so one call covers all workers); (measured) the unignored server died with status 141. APUE Fig 16.13 p. 611 lists `MSG_NOSIGNAL` as the per-call alternative with `send`; the course teaches `write`.
7. **Python existence and size**
	Use `pathlib` in `http_handler.py` (add `import pathlib`). The Assignment's "HTTP Utility Functions" section names it for exactly this job, and its library-restriction sentences cover only `http_server.py` and `connection_queue.py`. Do not import `os`.
8. **Restoring the signal mask**
	Use `sigprocmask`, as the Assignment says. APUE p. 346 and p. 453 say `sigprocmask` is defined for single-threaded processes and threads use `pthread_sigmask` (an error number, so `strerror`); (measured) restoring with `sigprocmask` after the workers existed worked. Know the textbook point for the oral exam.
9. **Transient `accept` errors**
	Follow the lecture: `EINTR` ends the loop, any other failure is reported and fatal (lecture17-code lines 83-89). `man 2 accept` says some pending network errors should be retried; the course gives no rule, so the sourced one wins.
10. **The `keep_going` type**
	Change line 19 to `volatile sig_atomic_t`. Lab 3 deck slide 9 says the plain `int` "works only because `fgetc()` forces a re-read. Use the right type anyway"; APUE p. 361 declares its flag that way. It is the only provided line this note recommends editing.
11. **`strerror` or `strerror_r`**
	Use `strerror`, as every lecture, lab and the Lab 7 deck do. (measured) `man 3 strerror` marks it `MT-Unsafe race:strerror` and `strerror_r` `MT-Safe`, and APUE Fig 12.9 p. 442 lists `strerror` as not guaranteed thread-safe. The risk is a garbled message in an error path, not a crash. `connection_queue.c` and `http.c` do not define `_GNU_SOURCE`, which picks the other `strerror_r` signature, so switching adds a compile trap under `-Werror`. Be ready to explain the trade in the oral exam.
12. **Python request reading**
	`recv` into a growing `bytes` buffer until `b"\r\n\r\n"` appears, the pattern of lecture19-code/question_server_tcp.py lines 18-19. `makefile` also works but is in no lecture.
13. **Python worker exception policy**
	Catch `OSError` per request, print it, close the connection, continue; only `ShutDownException` ends a worker.
## Lab coverage map
==All ten labs were read (code, QUESTIONS, tests and the TA decks), and the early labs mostly teach the error-handling shape the last projects are graded on.==

| Lab | What it teaches | Where Project 3 uses it | Lines and slides |
|---|---|---|---|
| Lab 1 (fork, exec, wait) | Check `fork` and `wait`, report with `perror` | The check-then-report habit; this folder's Lab 1 code and quiz are unsolved templates | `fork_wait.c` line 16; Lab 1 deck slides 3, 5, 7 |
| Lab 2 (signals, `dup2`) | `open` flags with a mode, `dup2`, close the descriptor when a later call fails, `wait` and `WIFEXITED` | Release-on-error template; sockets are descriptors like these | `redirect_child.c` lines 34-44 and 55-62; Lab 2 deck slides 7-9 |
| Lab 3 (SIGINT) | `sigaction`, `sigfillset`, handler sets a flag, `SA_RESTART` versus `EINTR`, `volatile sig_atomic_t` | The SIGINT handler (with `sa_flags = 0`) | `wc_signal.c` lines 15-34; Lab 3 deck slides 7-9 |
| Lab 4 (pipes) | Read and write semantics, SIGPIPE and `EPIPE`, close every unused end, an error ladder that closes what is held | SIGPIPE decision; the cleanup-ledger style | `pipeline_commands.c` lines 11-75; Lab 4 deck slide 3 |
| Lab 5 (shared memory) | `mmap`; on a failed `fork` wait for started children and unmap; check `wait` | Unwinding a failed `pthread_create` | `square_numbers.c` lines 45-51 and 65-71 |
| Lab 6 (C extensions) | Release the object before reporting an error and returning `NULL`; exceptions as the error channel | The Python half's "exception is the error return" idea; not otherwise used | `square_root.c` lines 52-57; Lab 6 deck slides 8-10 |
| Lab 7 (pthreads, TSAN) | `pthread_create` and `join` loops with `strerror`, a mutex around shared state, TSAN flags and `setarch -R` | Worker creation, join, error text, the TSAN run | `sum_files.c` lines 46-55 and 71-90; Lab 7 deck slides 3 and 5-6 |
| Lab 8 (queue) | The bounded queue with `while`, signal, unlock-on-error | `connection_queue.c` almost line for line | `queue.c` lines 7-116; Lab 8 deck slides 3-6 |
| Lab 9 (HTTP client) | `getaddrinfo` to `connect`, request format, write loop, `fgets` header skipping, `close` ladder | The write loop, the `snprintf` bound, the header syntax | `simple_http_client.c` lines 23-179; Lab 9 deck slides 3-6 |
| Lab 10 (Python barrier) | `Lock`, `Semaphore`, `Thread`, `start`, `join` | The barrier in `concurrent_open.c`; Python threading style | `sema_barrier.py` lines 11-65 |
## Textbook coverage audit
==APUE explains every mechanism the project uses except HTTP, the C string and Python-library details, `LD_PRELOAD`, and a few kernel behaviors, and for each of those the table after the index names the next best source.== Page numbers are the book's printed pages (PDF page minus 34).
### APUE citation index (C and the Python equivalents)
| Project element | APUE section and printed pages | What the page gives | Python equivalent |
|---|---|---|---|
| Every error check | 1.7, p. 14-16 | `errno` per thread; `perror`, `strerror`; set only on failure; `EINTR` can be nonfatal | `except OSError` |
| Descriptors, `open`, `close` | 3.2-3.3, p. 61-62; 3.5, p. 66 | Descriptors are small integers; `open` flags | `with open(...)` closes on any exit |
| `read`, `write` and short counts | 3.7-3.8, p. 71-72 | A network `read` may return less; `write` normally returns the count asked | `recv`, `sendall` (Lec19 slide 7) |
| 512 or 4096 byte chunks | 3.9, p. 72-73 | 4096 equals `st_blksize`; bigger buffers add little | `sendfile` loops internally |
| Existence, size, regular file | 4.2, p. 93-94; 4.3, p. 95-96 | `stat`, `st_size`, `S_ISREG` | `pathlib` `exists`, `stat`, `is_file` |
| `fdopen`, `setvbuf`, `fgets`, `snprintf` | 5.4-5.5, 5.7, p. 145-148 and 152; 5.11, p. 159-160 | Buffering modes; return value and truncation of `snprintf`; `sscanf` | `bytes` and `str` methods |
| Replacing library functions | 7.7, p. 206 | Shared libraries let functions be replaced without relinking | `LD_PRELOAD` applies the same idea (man 8 ld.so) |
| SIGPIPE, signal names | 10.2, p. 316 and 319 | SIGPIPE also fires on a disconnected `SOCK_STREAM` socket | Python ignores SIGPIPE at startup (measured) |
| Why `accept` returns `EINTR` | 10.5, p. 327-330 | Slow calls, `EINTR`, restart only with `SA_RESTART` | PEP 475 restarts for you (Lec19 slides 10-12) |
| Handler rules | 10.6, p. 330-332; p. 356 and 361 | `malloc` and `printf` unsafe in handlers; `volatile sig_atomic_t` flag | `global keep_going` (lecture19-code) |
| Blocking SIGINT around thread creation | 10.12, p. 346 | `sigprocmask`, `SIG_BLOCK`, `SIG_SETMASK`; single-threaded only | Not needed; Python delivers signals to the main thread (Lec19 slide 13) |
| The SIGINT handler | 10.14, p. 349-355 | `struct sigaction`, `sa_mask`, Fig 10.16 `SA_RESTART`, Fig 10.18 `sigemptyset` | `signal.signal` |
| Worker creation | 11.4, p. 385-386; Fig 11.1 p. 386 | `pthread_create`; new thread inherits the signal mask; pthread errors are return values; work-queue picture | `threading.Thread`, `start` (Lec18 slides 9-10) |
| Joining, argument lifetime, `exit` | 11.5, p. 388-392 | `pthread_join`; a stack structure goes stale; `exit` from any thread ends the process | `join`; daemon threads (Nov 10 lines 429-455) |
| Queue mutex and deadlock | 11.6.1-11.6.2, p. 399-402 | Lock and unlock on every path; consistent lock order | `threading.Lock`, `with` (Lec18 slides 13-14) |
| Queue conditions | 11.6.6, p. 413-416 | `pthread_cond_wait` unlocks atomically; re-evaluate after return; signal versus broadcast; Fig 11.15 | `Condition.wait`, `notify`, `notify_all` (Lec18 slide 20) |
| The `concurrent_open.c` barrier | 11.6.8, p. 418; 15.10, p. 579-584 | Barriers; POSIX semaphores | `threading.Semaphore` (Lec18 slides 24-25; Lab 10) |
| Why not `strtok` | 12.5, p. 442-443 | Fig 12.9 lists `strtok`, `strerror`; Fig 12.10 the `_r` forms | Not applicable |
| One thread takes SIGINT | 12.8, p. 453-457 | Per-thread masks, shared dispositions, `pthread_sigmask`, inherited mask | Python does it for you |
| The accept timeout | 14.4.2, p. 506-508; 16.6, Fig 16.21 p. 624 | `poll` timeout and `EINTR`; `SO_RCVTIMEO` | `settimeout` (measured: `poll` under the hood) |
| SIGPIPE on a pipe | 15.2, p. 534-537 | `write` to a pipe with no reader: SIGPIPE, else `EPIPE` | `BrokenPipeError` |
| Sockets | 16.2, p. 590-593 | `socket()`, `SOCK_STREAM` is a byte stream with no boundaries | `socket.socket`, `create_server` |
| `bind`, ports | 16.3.4, p. 604-605 | Port below 1024 needs privilege; one socket per address | `create_server(("", port))` |
| `getaddrinfo` | 16.3.3, p. 597-601 | `hints`, `AI_PASSIVE`, `gai_strerror`, `freeaddrinfo` | Hidden inside `create_server` (Nov 17 lines 350-362) |
| `listen`, `accept` | 16.4, p. 605-609 | Backlog is a hint; the accepted descriptor is new | `accept`; `create_server(backlog=)` (Nov 17 lines 420-424) |
| Reading and writing a connection | 16.5, p. 610-615 | `send` blocks until a byte stream's data is out; `recv` returns 0 at the end; repeat until 0; Fig 16.13 `MSG_NOSIGNAL` | `recv` returning `b""`; `sendall` |
| Address reuse | 16.6, p. 623-625 | `SO_REUSEADDR`, Fig 16.22 (`initserver`) | Set by `create_server` |
### What APUE does not cover, and the source that does
| Element | Gap | Best source |
|---|---|---|
| HTTP | Not in APUE | RFC 1945 (request line, status line, `Content-Length`, unknown type); Lec17 slides 17-19; Nov 5 lines 759-1008; Lab 9 deck slide 5 |
| String helpers (`strrchr`, `strtok_r` usage, `strstr`) | APUE only lists which functions are thread-safe | `man 3 string`, `man 3 strtok`; Lec03 slide 5; Sep 24 lines 507-531 |
| `LD_PRELOAD`, `dlsym` | APUE 7.7 gives only the shared-library idea | `man 8 ld.so`, `man 3 dlsym` (quoted above) |
| Closing with unread data resets the connection | Not in APUE | (measured) client got `ConnectionResetError` |
| Python threading, sockets, signals, `pathlib` | Not in APUE | Lec18, Lec19, Nov 10, Nov 17, lecture18-code, lecture19-code, py3.10 docstrings; APUE rows above give the C mechanism each one wraps |
| Python 3.13 `Queue.shutdown` semantics | Not in APUE | py3.13 `queue` documentation, named by Lec18 slide 29 |
| `sendfile` | Not in APUE | The `read` and write loop of APUE 3.9 p. 72-73 does the same job |
| TCP linger length | APUE p. 625 says "several minutes" only | Not measured; use `port_base` |
| Format-on-save rewriting starter lines | Not a textbook topic | (measured) clang-format diffs above |
## Known conflicts and remaining gaps
==Most open questions from the first pass are now settled by the Week 10 and 11 material; the items below are what still disagrees or is still unsupported.==
1. **Quiz Q19 against measurement.** The quiz answer says the Python handler runs only after the blocking call returns. Lec19 slide 12 gives the mechanism (the interpreter's C handler resumes the call, otherwise records the signal) and (measured) the handler ran at 1.5 s while `accept` stayed blocked and was then restarted. Both lead to `settimeout`.
2. **Function name.** The Assignment hint says `write_http_request()`; the function is `write_http_response()`.
3. **Sample text.** The Assignment's response example spells "Premature Optimization"; the file has "optimization". The file is 48 plus 20 bytes, the `Content-Length: 68` shown (measured).
4. **Python ports in the top-level Makefile.** `py_port_base` is 3 (measured).
5. **Test 2 description.** It mentions a missing file; the step list requests ten existing files.
6. **Linger period.** The Assignment says about two minutes; Nov 3 lines 949-954 say "within the last minute or so"; APUE p. 625 says "several minutes". I measured only that the port is unusable right after a server-side close.
7. **`SA_RESTART`.** Lec05 slide 38 and Lab 3 say to use it; Project 3 requires none.
8. **Status lines.** The lecture servers print "Waiting for client to connect"; Quiz Q15 says print nothing on success.
9. **`strerror` and threads.** APUE Fig 12.9 and (measured) `man 3 strerror` mark it thread-unsafe; every course sample uses it (Decision 11).
10. **`sigprocmask` and threads.** APUE p. 346 and p. 453 against the Assignment (Decision 8).
11. **Starter `int keep_going`.** The starter and two lecture servers use a plain `int`; the Lab 3 deck and APUE use `volatile sig_atomic_t` (Decision 10).
12. **Lecture error style.** Nov 10 lines 640-651 call stack traces acceptable in thread code; the rubric does not.
13. **Course gaps that stay.** Closing with unread data, the length of the linger period, `strerror_r`, `strrchr`, `strtok_r`, `snprintf`, `sscanf` and `setsockopt` are outside the Midterm 2 function list; `LD_PRELOAD` is documented only in man pages.
14. **The lost signal.** SIGINT between `while (keep_going)` and `accept` is missed, in the lecture server too. The course shows the analogous race for `pause` (Lec06 slides 18-21) with no `accept` fix.
15. **External sources.** Two decisions (Decision 3's `application/octet-stream`, Decision 4's drain semantics) rest on RFC 1945 and py3.13's documentation, which the course points at but does not contain.
16. **Vault notes behind the course.** [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]] still says "No chapter note yet" for Chapters 11 and 16, which exist; there is no vault note for APUE Chapters 5, 7, 12 or 14; the Weekly notes stop at Week 4.
17. **Still unmeasured.** valgrind on the finished threaded server; ruff's effect on the Python starter (not installed in the container shell); which style the editor applies on save.
## Second-pass change log
==This list is the final check of the first version against the material added or missed.==

| Topic | First pass said | Now | Evidence |
|---|---|---|---|
| Part 2 sources | The course teaches almost none of the Python | Every Part 2 line has a slide, lecture code file and transcript passage | Lec18, Lec19, lecture18-code, lecture19-code, Nov 10, Nov 17 |
| Transcripts | None after Nov 5 | Nov 10, 17, 19 read | Source inventory |
| Labs | Only Labs 3, 7, 8, 9, 10 | All ten, plus TA decks 1-9 | Lab coverage map |
| Quiz Q19 | Quiz disagreed with measurement | Mechanism stated in Lec19 slide 12 | Known conflicts, item 1 |
| Dequeue after shutdown | Open conflict | Decision 4 (drain) | Lec18 slide 29; py3.13 documentation |
| `pathlib` | Ambiguous | Decision 7 (allowed) | Assignment "HTTP Utility Functions" |
| SIGPIPE | Unwritten requirement | Decision 6, textbook p. 319 and p. 537 | APUE; Lab 4 deck slide 3 |
| `keep_going` type | Plain `int` left alone | Decision 10 | Lab 3 deck slide 9 |
| Header dependency trap | Inferred from the Makefile | Measured | Makefiles section |
| `strerror` | Used without comment | Measured `MT-Unsafe`; Decision 11 | `man 3 strerror` |
| Why the whole request is consumed | Spec statement only | Measured reset | `http.c` section |
| Format-on-save | Not examined | Measured; Edit surface added | File map section |
| Error handling | One call-by-call table | Rubric, two failure kinds, ledgers for every function | Error handling section |
| Part 2 library limits | Not stated | `queue.Queue` and `socketserver` are off limits | Lec18 slides 28-29; Lec19 slide 6 |
| Unknown MIME type | Unspecified | `application/octet-stream` | RFC 1945 section 7.2.1 |
| Counts and numbers | Test file counts and one byte range wrong | Corrected: 15 input and 16 output files; 88 and 139 byte requests | Source inventory |
| Project folder | Identical | Still identical (hashes) | Note callout |
## How to verify each step
| Step | Command | What you should see |
|---|---|---|
| Edit surface | `make clean clean-tests` in both parts, then `diff -rq proj3-original proj3-code` from `Projects` | Only the EDIT files you changed; no other path |
| Build | `make` in `part1` | No warnings; `http_server`, `http_server_tsan`, `concurrent_open.so` |
| Task 1 test | `cd part1`, `make test testnum=1 port_base=9001` | Test 1 passes |
| By hand | `./http_server server_files 9001`, then `curl -v localhost:9001/quote.txt` and `wget localhost:9001/quote.txt` | `200 OK`, `Content-Type: text/plain`, `Content-Length: 68` |
| 404 | `curl -s -S -w "Response Status Code: %{http_code}\n" http://localhost:9001/affordable_gpu.txt` | `Response Status Code: 404` and nothing before it |
| Large binary | `curl -s -S http://localhost:9001/Lec01.pdf > /tmp/x.pdf`, then `cmp` with `server_files/Lec01.pdf` | No output |
| Early disconnect | `curl -m 0.01 http://localhost:9001/Lec01.pdf`, then request again | Server still alive; the next request works (SIGPIPE ignored) |
| SIGINT | `pkill -INT http_server`, then check the server's exit status | Server exits by itself, no output |
| Task 2 test | `make test testnum=2 port_base=9001` | Test 2 passes within ten seconds (PORT2 is 9002) |
| Five at once | `LD_PRELOAD=./concurrent_open.so ./http_server server_files 9003`, five `curl` calls started together | All five finish; with four workers they hang |
| Races | `setarch -R ./http_server_tsan server_files 9004`, send traffic, then SIGINT | No `WARNING: ThreadSanitizer` |
| Descriptors | `valgrind --track-fds=yes ./http_server server_files 9005`, traffic, SIGINT | No open descriptors beyond 0, 1, 2 (not yet run for this project) |
| Part 2 | `cd part2`, `make test port_base=9101` | Both tests pass. Not the top-level `make test` |
| Package | `make zip` at the top level, `unzip -l proj3-code.zip` | Only sources; under 256 entries |
- *Do not leave debug output in.* Quiz Q15 and the stray-output measurement make this a test failure.
- *Run `make clean` after any header edit* (Makefile trap).
## Oral exam question bank
The oral exam is 40 percent and the TAs ask about your submitted code. Answer from the sources, not from the code.
1. Why two kinds of socket descriptor? (Lec17 slide 6; Nov 5 lines 171-194; APUE p. 608)
2. What does `listen` do, and what is its second argument? (Nov 5 lines 143-165)
3. Why `AI_PASSIVE` and a `NULL` host? (Lec16 slide 21; Nov 3 lines 850-864; `man 3 getaddrinfo`)
4. Why can `bind` fail with `address already in use`, and why does the Python server not hit the linger case? (Quiz Q3; Nov 3 lines 931-956; APUE p. 625; measured `create_server` source)
5. Why no `SA_RESTART`? What happens with it? (Assignment hint; Lec05 slide 38; Lab 3 deck slide 8; `man 7 signal`; measured hang)
6. What happens to a signal that arrives while `accept` is blocked? (Lec05 slide 37; Nov 3 lines 874-894; APUE p. 327-329)
7. Why does the handler only set a flag, and why `volatile sig_atomic_t`? (Lec05 slide 26; Lab 3 deck slide 9; APUE p. 361)
8. Why block signals before creating workers, and why restore afterward? (Assignment; APUE p. 386 and 453; Oct 22 lines 756-776)
9. Why is `sigprocmask` fine before creating threads but questionable after? (APUE p. 346 and 453)
10. Why does a request take more than one `read`, and where does it end? (APUE p. 591; Lec04 slide 12)
11. Why consume the whole request before closing? (Assignment; measured reset)
12. Why `\r\n` in headers but the file's bytes in the body? (Quiz Q5; Nov 5 lines 853-866)
13. Why `Content-Length` on a 404? (Quiz Q8; Nov 5 lines 992-999)
14. Why not `strtok`? What instead? (Quiz Q7; Lec06 slide 15; APUE p. 442-443)
15. Why read in chunks and write each chunk in a loop? (Assignment hint; Lec04 slides 12-13; APUE p. 72-73)
16. What if a client disconnects mid-download, in C and in Python? (APUE p. 319; Lab 4 deck slide 3; measured exit 141 and `BrokenPipeError`)
17. What are the queue's invariants, and why one mutex with two conditions? (Lec13 slides 27-32; Lec18 slide 21; APUE p. 413-416)
18. Why `while` and not `if` around the wait, in C and in Python? (Lec13 slide 33; Nov 10 lines 740-750; Lab 8 recorded 6 of 6 crashes)
19. Why `broadcast` and `notify_all` for shutdown? (Assignment hint; Oct 22 lines 854-860; Lec18 slide 20)
20. What does a worker do after shutdown if items are still queued? (Decision 4; py3.13 documentation)
21. Why free the queue only after joining? (Assignment; APUE p. 389)
22. How does `concurrent_open.so` prove concurrency, and why do four workers fail? (`concurrent_open.c` lines 40-74; Lab 10; measured)
23. Why does the Python server need `settimeout`? What does it cost? (Lec19 slides 10-12; Nov 17 lines 530-555; measured `accept4` versus `poll`)
24. What did you do when `pthread_create` (or `Thread.start`) failed partway? (Error handling ledger; Lab 5 lines 45-51)
25. What is in your error-handling ledger for `write_http_response`, and who closes `file_fd`? (Error handling ledger)
26. Why does the Python version get away with fewer lines, and what did it cost? (Lec15 slides 6-7; Nov 17 lines 601-609; Assignment introduction)
## Concept Links
- [[20_Progress/Degree/CSCI 4061/Projects/Project - 3 Assignment|Project - 3 Assignment]] and [[20_Progress/Degree/CSCI 4061/Projects/Project - 3 Quiz|Project - 3 Quiz]]: the spec and the 20 questions used as a checklist.
- [[20_Progress/Degree/CSCI 4061/Projects/Project - 1 Assignment|Project - 1 Assignment]]: the error-checking rubric and the two-kinds-of-failure strategy.
- [[20_Progress/Degree/CSCI 4061/Labs/Lab - 8|Lab - 8]]: the solved bounded queue with TSAN evidence.
- [[20_Progress/Degree/CSCI 4061/Labs/Lab - 9|Lab - 9]]: the HTTP client and its write loop.
- [[20_Progress/Degree/CSCI 4061/Labs/Lab - 7|Lab - 7]]: pthread error handling and the `setarch -R` TSAN fix.
- [[20_Progress/Degree/CSCI 4061/Labs/Lab - 3|Lab - 3]] and [[20_Progress/Degree/CSCI 4061/Labs/Lab - 4|Lab - 4]]: `sigaction` and the flag; SIGPIPE and the cleanup ladder.
- [[20_Progress/Degree/CSCI 4061/Labs/Lab - 10|Lab - 10]]: the Python lock and semaphore barrier.
- [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 11|Chapter - 11]], [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 16|Chapter - 16]], [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]]: vault notes on threads, sockets and signals; the page numbers here were checked against the PDF.
- [[20_Progress/Degree/CSCI 4061/Projects/Project - 2 Implementation|Project - 2 Implementation]]: the format precedent.
## Open Questions
- [ ] Run valgrind on the finished threaded server and record the descriptor count.
- [ ] Measure how long a port stays unusable after a server-side close and settle the "two minutes" versus "a minute" wording.
- [ ] After the code exists, re-run `diff -rq proj3-original proj3-code` and record that only the seven EDIT files differ.
