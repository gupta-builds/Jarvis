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
  - "[[20_Progress/Degree/CSCI 4061/Labs/Lab - 7|Lab - 7]]"
  - "[[20_Progress/Degree/CSCI 4061/Labs/Lab - 8|Lab - 8]]"
  - "[[20_Progress/Degree/CSCI 4061/Labs/Lab - 9|Lab - 9]]"
  - "[[20_Progress/Degree/CSCI 4061/Labs/Lab - 10|Lab - 10]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 11|Chapter - 11]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 16|Chapter - 16]]"
next: "Read Decisions to make before coding and Known conflicts and gaps, then build Part 1 Task 1 (sequential server) against the http_server.c and http.c tables, then Task 2, then Part 2."
---
# Project - 3 Code Explaination
This note holds no solutions. It maps every line of the Project 3 starter code, and every behavior the tests check, to the lecture slide, transcript line, lab code, textbook page, or container measurement that explains it, and it says plainly where the course says nothing. The assignment text lives in [[20_Progress/Degree/CSCI 4061/Projects/Project - 3 Assignment|Project - 3 Assignment]]. The format follows [[20_Progress/Degree/CSCI 4061/Projects/Project - 2 Implementation|Project - 2 Implementation]], with line-level tables added.
> [!NOTE]
> Items marked (measured) were run in the course container (Ubuntu 22.04, gcc 11.4.0, Python 3.10.12) on 2026-11-20, in scratch copies under `/tmp` that were deleted afterwards. `proj3-code` and `proj3-original` are byte-identical (hashes compared), so the working copy is still the untouched starter.

## How to read the citations
==Every claim carries a source in one of seven forms, and "measured" means I ran it rather than read it.==
- **Lec N, slide k**: `Lecture/Week - X/LecNN.pdf`, read through MinerU. The slide number is the PDF page of the deck. Lec08's printed footers run 4 higher than the PDF page (page 9 prints "13"); I use the PDF page.
- **Nov 5, lines a-b**: the transcript `Lecture/Transcripts/Week 9 - 14/en-CSCI 4061 November 5 lecture (multi-source).txt`. The same form is used for Nov 3, Oct 20, Oct 22, Oct 29, Sep 22 and Sep 24 in their own folders. Line numbers are file lines.
- **lectureNN-code/file.c line n**: under `csci4061-fa26/Lecture/`. **labNN-code/file line n** is under `csci4061-fa26/Labs/`. These are the professor's patterns, and the labs hold your own solved versions.
- **APUE p. N**: *Advanced Programming in the UNIX Environment*, 3rd ed., printed page. PDF page equals printed page plus 34. Extracted with MinerU from the PDF itself, not from the vault chapter notes.
- **man**: the manual page inside the container (`man 7 signal`, `man 2 accept`, `man 3 getaddrinfo`, `man 2 send`, `man 3 dlsym`).
- **py3.10**: `inspect.getdoc` or source read from the container's Python 3.10.12, the version the autograder uses.
- **(measured)**: an experiment I ran. The raw results are in the sections that use them.
## Source inventory
Registered means the path is already named in [[CSCI 4061 Board]]. Only the course root folder is named there, so none of these paths is individually registered.

| Material | Where | How deeply I read it |
|---|---|---|
| Project files | `csci4061-fa26/Projects/proj3-code` (identical to `proj3-original`) | Every source file, all three Makefiles, `tests.json` for both parts, every test input and output, the file list and sizes in `server_files` |
| Assignment and quiz | Vault `Project - 3 Assignment`, `Project - 3 Quiz` | Fully. The 20 quiz questions are used as a checklist throughout |
| Networking slides | `Lecture/Week - 9/Lec16.pdf`, `Lec17.pdf`; `Week - 8/Lec15.pdf` | Fully |
| Thread slides | `Week - 7/Lec12.pdf`, `Lec13.pdf`; `Week - 8/Lec14.pdf` | Fully |
| Signal slides | `Week - 3/Lec05.pdf`; `Lec06.pdf` | Lec05 fully. Lec06 pages 1-35 (pages 36-39 are file-system topics) |
| I/O and file slides | `Lec03.pdf`, `Lec04.pdf`, `Lec07.pdf` | Lec04 pages 7-20, Lec03 pages 5-7, Lec07 pages 7 and 21-22. The rest by keyword search |
| Pipe slides | `Lec08.pdf` | Pages 9-17 (close discipline, read and write table, SIGPIPE row) |
| Python slides | `Lec11.pdf` | Pages 1-20 (the C-extension half is not used by this project) |
| Other slides | `Lec01.pdf`, `Lec02.pdf`, `Lec09.pdf`, `Lec10.pdf` | Keyword search only: sockets appear on Lec01 slide 6, Lec09 slide 33, Lec10 slides 18 and 27 |
| Transcripts | `Lecture/Transcripts` | Nov 3 and Nov 5 fully. Oct 22 lines 640-1019, Oct 20 lines 440-700, Oct 29 lines 120-310, Sep 24 lines 55-304 and 440-769, Sep 22 lines 730-1144. Others by keyword search |
| Lecture code | `Lecture/lecture16-code`, `lecture17-code`, `lecture12-code`, `lecture13-code`, `lecture11-code`, `lecture05-code/block_sigint.c`, `lecture03-code/strtok_demo.c` | The files named in the tables below, in full |
| Labs | `Labs/lab03-code`, `lab07-code`, `lab08-code`, `lab09-code`, `lab10-code`; TA decks `CSCI 4061 Lab 07.pdf`, `Lab 08.pdf`, `Lab 09.pptx.pdf` | Code, QUESTIONS and decks in full. Vault notes [[20_Progress/Degree/CSCI 4061/Labs/Lab - 7\|Lab - 7]] and [[20_Progress/Degree/CSCI 4061/Labs/Lab - 8\|Lab - 8]] read for the recorded TSAN findings |
| Exam practice | `Midterm/csci4061_fa26_Midterm_2_Practice.pdf` and `_Solutions.pdf` | Fully. Its function list shows what the professor treats as core API |
| Textbook | `Textbook/Advanced Programming in the UNIX Environment, 3rd Edition.pdf` | Ch 1.7, 3.7-3.9, 4.2-4.3, 5.4-5.5 and 5.11, 10.5-10.14, 11.4-11.6.8, 12.5 and 12.8, 15.10, 16.2-16.6, read from the extracted pages |
| Container facts | Running dev container `vsc-csci4061-fa26-...` | The experiments reported below |
- *Not covered:* Lec01, Lec02, Lec09 and Lec10 beyond keyword hits; Labs 1, 2, 4, 5, 6 (processes, pipes, shared memory, C extensions), none of which Project 3 uses; the Weekly notes, which stop at Week 4; the Kleppmann text. No transcript after Nov 5 exists on disk, `Lecture/Week - 10` is empty, and the Oct 8 transcript is 107 bytes (the exam).
## What the project is
==Project 3 is a TCP file server that speaks only HTTP GET, built twice: once in C with a thread pool and a hand-written bounded queue, once in Python with the same shape.== Part 1 is graded by 15 visible points (test 1 sequential 5, test 2 concurrent 10) and Part 2 by 10 (5 and 5). Hidden tests exist (Assignment, Grading Criteria). The whole project is 6.25 percent of the course grade, split 10 quiz, 40 automated, 40 oral exam, 10 manual error-checking review.
```text
curl x10 ---> accept() in main thread ---> connection_queue (CAPACITY 5) ---> 5 worker threads
                  |                              ^   enqueue blocks when full       |
                  |                              |   dequeue blocks when empty      v
              SIGINT ends the loop ---> shutdown(queue) wakes all ---> join workers ---> close server socket
```
- *Task 1* is the sequential server: the main thread does accept, read request, write response, close. It must pass test 1.
- *Task 2* inserts the queue and `N_THREADS` workers between accept and the request work. Test 2 only passes if five workers are inside `open()` at the same moment, because `concurrent_open.so` holds each caller until five have arrived.
- *Part 2* repeats Task 2 in Python 3.10 with `threading`, `socket`, `signal` and a `collections.deque`.
## Environment facts (measured)
The `.devcontainer` files are the course's environment rules: `Dockerfile` installs the toolchain and downloads `testius` and `socrates`; `devcontainer.json` sets `--ulimit=nofile=1024:1024`, `SYS_PTRACE`, `seccomp=unconfined`, clang-format and ruff on save, and `chat.disableAIFeatures`.

| Fact | Value | Why it matters here |
|---|---|---|
| Compiler and flags | gcc 11.4.0 with `-Wall -Werror -g -pthread` (Part 1 Makefile line 3) | An unused variable fails the build. This is why the starter comments out `serve_dir` and `port` (lines 33-34) |
| Python | 3.10.12 | `socket.timeout is TimeoutError` is True here, so `except TimeoutError` is correct |
| User | `root` | Binding ports below 1024 succeeds in the container but fails for a normal user (APUE p. 605; Assignment "Port Reservation Issues"; Nov 5, lines 357-367 notes root is needed) |
| Open-file limit | `ulimit -n` is 1024 | A leaked client descriptor per request would exhaust the server after about 1000 requests |
| Cores | 18 | The five-way concurrency test is not limited by hardware |
| Client tools | `curl` 7.81.0, `wget` 1.21.2, `valgrind`, `xxd`, `zip`; **no `nc`** | The professor's netcat demo (Nov 5, lines 943-985) cannot be repeated here without installing it. Use `curl -v` or a Python one-liner instead |
| Real client bytes | curl sends `GET /quote.txt HTTP/1.1\r\nHost: localhost:PORT\r\nUser-Agent: curl/7.81.0\r\nAccept: */*\r\n\r\n`; wget adds `Accept-Encoding: identity` and `Connection: Keep-Alive` | Both clients send **HTTP/1.1** request lines. Your parser must accept `HTTP/1.x`, and the server still replies `HTTP/1.0` |
| `getaddrinfo(NULL,"8000",AI_PASSIVE,AF_UNSPEC,SOCK_STREAM)` | First result `AF_INET` (0.0.0.0), second `AF_INET6` | Using only the first result, as Nov 3 lines 566-569 says to, binds IPv4 |
| TSAN binary | Plain `./http_server_tsan` exits 66 with `FATAL: ThreadSanitizer: unexpected memory mapping`; `setarch -R ./http_server_tsan ...` runs | Same WSL2 kernel issue recorded in [[20_Progress/Degree/CSCI 4061/Labs/Lab - 7\|Lab - 7]]. `make test` never runs the TSAN binary, so only your manual runs need `setarch -R` |
| Stray output | A line printed to stdout or stderr by the background server appeared inside the test 1 actual transcript | Quiz Q15 is literal: print nothing on success. A debug `printf` fails test 1 |
| `pkill` | `pkill -INT http_server` also killed a process named `http_server_tsan` | Do not leave your own TSAN server running while `make test` runs |
## File map
Only the files marked EDIT are graded as yours. The autograder replaces every other file with the standard copy (Assignment, Starter Code).

| File | Status | Lines | Role |
|---|---|---|---|
| `Makefile` (top) | Provided | 37 | `make`, `make test`, `make clean`, `make clean-tests`, `make zip` for both parts |
| `part1/Makefile` | Provided | 62 | Builds `http_server`, `http_server_tsan`, `concurrent_open.so`; runs `testius` |
| `part1/http.h` | Provided | 22 | Two function contracts (`read_http_request`, `write_http_response`) |
| `part1/http.c` | **EDIT** | 39 | `get_mime_type` is given; the two HTTP functions are stubs |
| `part1/http_server.c` | **EDIT** | 37 | `main` is a stub: argument check then `return 0` |
| `part1/connection_queue.h` | **EDIT** | 63 | Struct with a TODO for synchronization fields; five function contracts you may not change |
| `part1/connection_queue.c` | **EDIT** | 29 | Five stubs that return 0 |
| `part1/concurrent_open.c` | Provided (test only) | 235 | Source of `concurrent_open.so`, the `LD_PRELOAD` barrier |
| `part1/server_files/`, `part2/server_files/` | Provided | 11 files each | `quote.txt` 68 bytes, `index.html` 359, `headers.html` 229, `courses.txt` 2655, `gatsby.txt` 299452, `mt2_practice.pdf` 147103, `africa.jpg` 987613, `ocelot.jpg` 1186359, `hard_drive.png` 1681872, `Lec01.pdf` 2216288, `rain.mp3` 282282 |
| `part1/test_cases/`, `part2/test_cases/` | Provided | `tests.json`, 15 input files and 16 output files each | The two tests per part |
| `part2/http_server.py` | **EDIT** | 34 | Argument handling given; the rest is a TODO |
| `part2/http_handler.py` | **EDIT** | 25 | MIME dictionary given; two functions raise `NotImplementedError` |
| `part2/connection_queue.py` | **EDIT** | 46 | `ShutDownException`, constructor with a TODO, three methods raise `NotImplementedError` |
| `part2/Makefile` | Provided | 37 | Builds only `concurrent_open.so`; runs `testius` |
| `part2/concurrent_open.c` | Provided (test only) | 235 | Byte-identical to Part 1's |
## Part 1: http_server.c, line by line
==The starter gives you a flag, a handler, a pool size and an argument check; everything that touches a socket, a signal mask or a thread is yours.== The file is 37 lines. The first table covers every provided line, the next two cover what you add for Task 1 and Task 2.
### Provided lines
| Lines | What the line is | What you do with it | Sources |
|---|---|---|---|
| 1 | `#define _GNU_SOURCE` | Keep it first, before every include. I did not test which symbols fail without it | Every professor networking file starts with it: lecture17-code/question_server_tcp.c line 3, lecture16-code line 3, Lab 9 `simple_http_client.c` line 1. `man 3 dlsym` shows the same macro is required for `RTLD_NEXT`, which is why `concurrent_open.c` line 3 has it |
| 3 | `errno.h` | `errno`, `EINTR` for accept; `ENOENT` is used in `http.c` | Quiz Q2; Lec05 slide 37; lecture17-code line 83; APUE 1.7 p. 14-16 and 10.5 p. 327-329 |
| 4 | `netdb.h` | `getaddrinfo`, `freeaddrinfo`, `gai_strerror`, `struct addrinfo` | Lec16 slides 12-16; Nov 3 lines 453-523; APUE 16.3.3 p. 599-600 |
| 5 | `pthread.h` | `pthread_create`, `pthread_join`, `pthread_t` | Lec12 slides 19-25; Oct 20 lines 533-570; APUE 11.4-11.5 p. 385-389 |
| 6 | `signal.h` | `sigaction`, `sigset_t`, `sigfillset`, `sigprocmask`, `SIGINT` | Lec05 slides 19-21 and 31-35; APUE 10.12 p. 346 and 10.14 p. 349-351 |
| 7 | `stdio.h` | `perror`, `fprintf`, `snprintf` | APUE 1.7 p. 15; 5.11 p. 159 |
| 8 | `string.h` | `memset` to zero the `hints`, `strerror` for pthread errors | Nov 3 lines 575-577; Lec12 slide 24; Lab 7 deck slide 3 |
| 9 | `sys/socket.h` | `socket`, `bind`, `listen`, `accept` | Lec16 slide 11; Lec17 slides 5-7; APUE 16.2-16.4 p. 590-609 |
| 10 | `sys/stat.h` | Listed, but `main` as specified needs no `stat`. `http.c` is where `stat` lives | Lec06 slide 34; Lec07 slide 7; APUE 4.2 p. 93-94 |
| 11 | `sys/types.h` | Portable types such as `ssize_t` | lecture17-code line 11 |
| 12 | `unistd.h` | `close`, and `read` and `write` if you call them here | Lec04 slides 8-9; APUE 3.7-3.8 p. 71-72 |
| 14-15 | `connection_queue.h`, `http.h` | The two interfaces you may not change | Assignment, Task 2 and Task 1 |
| 17 | `#define N_THREADS 5` | Keep 5. `concurrent_open.c` line 13 holds callers until five are inside `open()`, so fewer workers means a timeout | Assignment "Testing Your Server"; Quiz Q13; Lec17 slide 13; Nov 5 lines 684-704 |
| 19 | `int keep_going = 1;` | Written by the handler, read by the accept loop, nothing else | lecture17-code line 16 and Lab 3 line 12 use a plain `int`. APUE p. 361 declares its quit flag `volatile sig_atomic_t`. Workers never read it |
| 20 | `const char *serve_dir;` | Assign once in `main` before the first thread exists, never again. Workers then read it without a lock | Lec13 slides 3-11 (a race needs a write); Lec12 slide 13 |
| 22-24 | `handle_sigint` sets `keep_going = 0` | Leave it alone. No `printf`, no `malloc`, no `strtok` here | Lec05 slide 26; Lec06 slide 15; Sep 24 lines 559-569; Lab 3 lines 15-18 and its QUESTIONS (change a global); APUE 10.6 p. 330-332 |
| 26-31 | `argc != 3` prints usage and returns 1 | Keep. Tests always pass two arguments | lecture17-code lines 25-28 |
| 32-34 | Commented `serve_dir = argv[1];` and `const char *port = argv[2];` | Uncomment both. `port` is a `const char *` because `getaddrinfo` takes the service as a string, so never convert it to an `int` in C. The starter hides them because `-Werror` rejects an unused variable | Part 1 Makefile line 3; [[20_Progress/Degree/CSCI 4061/Labs/Lab - 8\|Lab - 8]] Errors and fixes; Lec16 slide 13; Nov 3 lines 465-480 |
| 36-37 | `return 0;` then the closing brace | Replace with the real flow and a real return code | lecture17-code lines 119-124 |
### Task 1: what main() does, in order
| Step | Call | Failure signal and what to do | Sources |
|---|---|---|---|
| 1 | `sigaction(SIGINT, &act, NULL)` with `sa_handler = handle_sigint`, `sigfillset(&act.sa_mask)`, `sa_flags = 0` | Returns -1: `perror("sigaction")`, return 1. Zero the struct first (`= {0}` as in Lab 3 line 26), because APUE p. 354 says never assume a zeroed mask is an empty set | Assignment "Signal Handling"; lecture17-code lines 31-39; Lec05 slides 31-35; Lec06 slides 4-7; Nov 5 lines 306-311; APUE 10.14 p. 349-351 |
| 2 | Fill `hints`: `memset` to 0, `ai_family = AF_UNSPEC`, `ai_socktype = SOCK_STREAM`, `ai_flags = AI_PASSIVE` | No call, no failure | Lec16 slides 14-16 and 21; Lec17 slide 5; lecture17-code lines 41-47; Nov 3 lines 575-583 and 850-864; APUE p. 600 |
| 3 | `getaddrinfo(NULL, port, &hints, &server)` | A **nonzero error code, not errno**: print with `gai_strerror`, return 1 | Lec16 slides 12-14; Nov 3 lines 510-524; lecture17-code lines 49-54; APUE p. 600 |
| 4 | `socket(server->ai_family, server->ai_socktype, server->ai_protocol)` | -1: `perror("socket")`, `freeaddrinfo(server)`, return 1 | Lec16 slides 11 and 17; lecture17-code lines 55-61; APUE 16.2 p. 590-591 |
| 5 | `bind(sock_fd, server->ai_addr, server->ai_addrlen)` | -1: `perror("bind")`, `freeaddrinfo`, `close(sock_fd)`, return 1. `address already in use` has three causes (Quiz Q3 answer: all of them) | Lec16 slide 22; Nov 3 lines 931-956; lecture17-code lines 62-68; APUE 16.3.4 p. 604-605 |
| 6 | `freeaddrinfo(server)` right after `bind` | No return value | lecture17-code line 69; Lab 9 deck slide 4 (free on every path); APUE p. 599 |
| 7 | `listen(sock_fd, backlog)` | -1: `perror`, `close`, return 1. The project fixes no backlog value; the lecture uses 5 | Lec17 slide 6; Nov 5 lines 143-165; lecture17-code lines 15 and 70-75; APUE p. 608 |
| 8 | `while (keep_going)` around `accept(sock_fd, NULL, NULL)` | -1 with `errno == EINTR`: leave the loop and clean up. Any other errno: `perror`, clean up, nonzero return | Lec17 slide 7; Nov 5 lines 171-194 and 321-323; Nov 3 lines 861-894 and 902-907; lecture17-code lines 77-91; Quiz Q2; APUE p. 608-609 |
| 9 | `read_http_request(client_fd, resource_name)` | -1: close `client_fd`, keep serving | Quiz Q1 (read then write); Assignment main-loop step 1 |
| 10 | Join `serve_dir` and `resource_name` into a path with `snprintf` | Negative return, or a return at least the buffer size, means truncation: treat as an error | Assignment main-loop step 2 and hint; Quiz Q6; Lab 9 lines 63-68; Lab 9 deck slide 6; APUE 5.11 p. 159 |
| 11 | `write_http_response(client_fd, path)` | -1: report it, keep the server alive | Assignment main-loop step 3 |
| 12 | `close(client_fd)` | -1: `perror` | Assignment step 4; lecture17-code lines 112-114; Lec08 slide 10 |
| 13 | After the loop: `close(sock_fd)`, `return 0` | -1: `perror`, return 1 | Assignment "Signal Handling"; lecture17-code lines 119-124; Nov 3 lines 909-923 |
- *Why the accept loop ends on SIGINT:* `sa_flags = 0` means no `SA_RESTART`, so a signal that lands while `accept` is blocked makes it return -1 with `EINTR` (APUE p. 327-329 and p. 351, Fig 10.16). `man 7 signal` lists `accept` as restarted only when `SA_RESTART` is set. (measured) With `sa_flags = 0`, `accept` returned -1 with `EINTR` and the handler ran on the main thread in 3 of 3 runs; with `SA_RESTART` the process never exited in 3 of 3.
- *Why this breaks the professor's usual advice:* Lec05 slide 38 says "Use SA_RESTART in your code and you will usually be fine" and Lab 3 required it. Project 3 is the stated exception (Assignment hint), and the lecture code for this exact server writes `sa_flags = 0` with the comment "Note the lack of SA_RESTART" (lecture17-code line 35).
- *Why print nothing on success:* (measured) lines the background server wrote to stdout and stderr appeared inside the recorded transcript of test 1. Quiz Q15 says the same. The lecture servers print "Waiting for client to connect" (lecture17-code line 80); do not copy those lines.
### Task 2: what changes
| Step | Change | Why this position | Sources |
|---|---|---|---|
| 1 | Declare `connection_queue_t queue;` in `main` and call `connection_queue_init(&queue)` first. On -1, clean up and return 1 | The queue must exist before any worker or accept call uses it | Assignment "Modifying the Server Implementation" |
| 2 | Keep `sigaction` at the top of `main` | The handler is a process-wide setting; only the mask is per thread | APUE 12.8 p. 453 ("each thread has its own signal mask, but the signal disposition is shared") |
| 3 | `sigfillset(&all)` then `sigprocmask(SIG_BLOCK, &all, &old)` before creating any thread | A new thread inherits the creator's signal mask, so blocked-before-create means blocked in every worker | Assignment steps 1-3; APUE 11.4 p. 386; Lec05 slides 19-21; Sep 22 lines 786-806 (the third argument saves the old mask); Lec06 slide 16 (a child inherits the mask, same idea) |
| 4 | Create `N_THREADS` workers with `pthread_create(&threads[i], NULL, worker, &queue)` | Workers start running at once and block in `dequeue` on the empty queue | Lec12 slides 21-25; Oct 20 lines 533-570; APUE p. 385-386; Lab 7 `sum_files.c` lines 71-80 |
| 5 | `sigprocmask(SIG_SETMASK, &old, NULL)` right after the last create | Only the main thread should be able to take SIGINT | Assignment step 3 |
| 6 | In the accept loop, replace the request work with `connection_queue_enqueue(&queue, client_fd)`. On -1 close `client_fd` | Main now only produces; it may block on a full queue, which is the intended cap on active clients | Nov 5 lines 684-704; Lec13 slide 22; Assignment "Modifying the Server" |
| 7 | After the loop: `connection_queue_shutdown`, `pthread_join` every worker, `connection_queue_free`, `close(sock_fd)` | Free the queue only after every thread that uses it has been joined | Assignment "Cleanly Shutting Down"; Oct 20 lines 633-638; APUE 11.5 p. 389; Lab 7 `sum_files.c` lines 84-90 |
- *Worker body (you add the function):* loop on `connection_queue_dequeue`; a return of -1 means shutdown, so leave the loop and return `NULL`. Otherwise `read_http_request`, build the path, `write_http_response`, `close(fd)`. A failed request is logged (only when something went wrong) and the loop continues, so one bad client never kills a worker. The lecture describes the workers closing the connection: "they take a file descriptor, they read or write on it, and then they close when they're done" (Nov 5 lines 697-702).
- *Per-thread state:* `resource_name` and the path buffer must be locals inside the worker, never `static` or global. Threads share the heap and globals but not stacks (Lec12 slides 11-13; Lec13 slides 3-11).
- *What `arg` points to:* the queue lives in `main`'s frame and `main` joins every worker before returning, which is what keeps the pointer valid. APUE p. 391-392 shows what goes wrong when a thread's data outlives its stack; lecture12-code/pthreads_exercise_v2.c lines 14-17 and 38-82 is the same shape.
- *If `pthread_create` fails at worker i:* the i workers already running are blocked in `dequeue`, so joining them without first calling `connection_queue_shutdown` would hang. lecture12-code/pthreads_exercise_v2.c lines 50-60 joins the started threads and frees memory, but its threads finish on their own; yours do not. This ordering is my inference from the two code shapes, not something a source states.
- *Signal edge cases:* a SIGINT that arrives while main is blocked inside `enqueue` on a full queue runs the handler, but `pthread_cond_wait` is restarted (`man 7 signal` lists it), so main stays blocked until a worker dequeues. A SIGINT that lands between `while (keep_going)` and `accept` is lost; the course shows the same race for `pause` (Lec06 slides 18-21) and has no `accept` fix, and the professor's server has the same window (lecture17-code lines 77-81). (measured) With workers left unblocked, the handler still ran on the main thread in 3 of 3 runs on this kernel, but `man 7 signal` says delivery goes to an arbitrary unblocked thread, so keep the mask step.
## Part 1: http.h and http.c, line by line
==`read_http_request` and `write_http_response` are the two halves of one HTTP/1.0 exchange, and the only thing connecting them is the `resource_name` string the first one produces.== `http.h` is not an EDIT file, so its prototypes are fixed.
### http.h
| Lines | What the line is | What it means for your code | Sources |
|---|---|---|---|
| 1-2 | SPDX license comments | Nothing | |
| 3-4 and 22 | Include guard `HTTP_H` | Lets `http.c` and `http_server.c` both include it. Same pattern in `connection_queue.h` lines 3-4 and 63, and in Lab 8 `queue.h` lines 3-4 and 30 | |
| 6-12 | Contract for `read_http_request(int fd, char *resource_name)` | `fd` is the connection socket from `accept`. On success `resource_name` holds only the resource, such as `/quote.txt`, and the function returns 0; -1 on error. **There is no size parameter**, so the buffer size is an unwritten agreement between caller and callee | Assignment "Reading HTTP Requests"; Quiz Q6 |
| 14-20 | Contract for `write_http_response(int fd, const char *resource_path)` | `resource_path` is a real filesystem path, `serve_dir` joined to the name, such as `server_files/quote.txt`. Returns 0 or -1 | Quiz Q6. The Assignment hint calls this function `write_http_request`, a typo |
### http.c
| Lines | What the line is | What it means for your code | Sources |
|---|---|---|---|
| 1 | `#include "http.h"` | Brings in the contract | |
| 3 | `assert.h` | Unused by the starter. An `assert` aborts the whole server, which is the wrong response to one bad client (my reasoning; no course source) | |
| 4 | `errno.h` | `ENOENT` after a failed `stat` | Assignment hint; Quiz Q2; APUE 1.7 p. 14-16 |
| 5 | `fcntl.h` | `open` and `O_RDONLY` for the file body | Lec04 slide 7; Lab 9 line 128 |
| 6 | `stdio.h` | `snprintf` for the header, `perror` for failures | APUE 5.11 p. 159; Lab 9 line 64 |
| 7 | `string.h` | `strcmp` (already used by line 14), plus whatever you parse with | Lec03 slide 5; Lec06 slide 15; Sep 24 lines 507-531; APUE 12.5 p. 442-443 |
| 8 | `sys/stat.h` | `struct stat` and `stat` for existence and size | Lec06 slide 34; Lec07 slides 7 and 21; APUE 4.2 p. 93-94 |
| 9 | `unistd.h` | `read`, `write`, `close` | Lec04 slides 8-9 and 12-13; APUE 3.7-3.8 p. 71-72 |
| 11 | `#define BUFSIZE 512` | Chunk size for the body copy and an implied bound for the request buffer. The Assignment suggests 512 or 4096; 4096 matches the 4096-byte blocks the course describes | Lec06 slide 22; APUE 3.9 p. 72-73 (`BUFFSIZE` 4096 equals `st_blksize` on ext4); Lab 9 line 12 |
| 13-29 | `get_mime_type(const char *file_extension)` | Provided. Exact, case-sensitive match on an extension **with its dot**. Returns `NULL` for anything unlisted. Passing it a `NULL` pointer dereferences null inside `strcmp` | Assignment "Writing HTTP Responses"; Lec17 slide 19 and Nov 5 lines 898-904 (MIME types) |
| 31-34 | `read_http_request` stub returns 0 | You write the body | |
| 36-39 | `write_http_response` stub returns 0 | You write the body | |
### What read_http_request must do
- *Loop on `read()` until the request is complete.* TCP is a byte stream with no message boundaries, so one `read` can return half a request (APUE 16.2 p. 591; 3.7 p. 71 "when reading from a network ... less than the requested amount"; Lec04 slide 12; Lab 9 deck slide 3). The request ends at the first `\r\n\r\n` (Assignment hint). Search the accumulated buffer, not just the newest chunk, because those four bytes can arrive split across two reads.
- *Bound everything.* There is no size argument, so pick one constant used by both `http_server.c` and `http.c` (Decision 2 below) and never write past it. A request line longer than the buffer is an error, not an overflow.
- *Parse only the first line.* It is `GET`, a space, the resource, a space, the version. curl and wget send `HTTP/1.1` here (measured), so accept any `HTTP/1.x`. Ignore every header but still consume them (Assignment: "you should still use `read()` to consume the entirety of the client's submitted request"). Quiz Q4 gives the line shape.
- *Do not use `strtok`.* It keeps hidden static state, modifies the string, and is not safe across threads (Quiz Q7, all three statements true; Lec03 slide 5; Lec06 slide 15; Sep 24 lines 507-531 on `strtok_r`; APUE p. 442 lists `strtok` as not thread-safe and p. 443 gives the `_r` form). The Assignment says the same. `strtok_r`, `sscanf` (APUE 5.11 p. 160) or plain pointer scanning all work; the course teaches only `strtok`.
- *Return -1 when the peer closes early.* `read` returning 0 before the terminator means the client hung up (Lab 9 QUESTIONS; Lec08 slide 14; Nov 5 lines 80-83). A negative return is an error; in Task 1 an `EINTR` from SIGINT is also possible because the handler has no `SA_RESTART`.
- *The lab's technique is also allowed.* `read_http_response` in Lab 9 (lines 90-125) uses `dup`, `fdopen`, `setvbuf(..., _IONBF, 0)` and `fgets` until a line equal to `"\r\n"`. The Assignment points to it and warns about stdio buffering. Closing the `FILE` closes only the duplicate (Lab 9 lines 122-125). Unbuffered means one `read` per byte (APUE 5.4 p. 145-147). The Assignment's fallback is plain `read()`.
### What write_http_response must do
| Order | Action | Failure and edge handling | Sources |
|---|---|---|---|
| 1 | `stat(resource_path, &sb)` | -1 with `errno == ENOENT` means 404. Any other errno is your decision (Decision 3). `stat` also succeeds on a directory, so test `S_ISREG(sb.st_mode)` if you want `GET /` to be a 404 (my addition; not tested) | Assignment hint; Lec06 slide 34; Lec07 slide 7; APUE 4.2 p. 93-94 and 4.3 p. 96 |
| 2 | For a missing file write exactly `HTTP/1.0 404 Not Found\r\nContent-Length: 0\r\n\r\n` and no body | Write fully (loop). A 404 is a handled request, not an error (Decision 3) | Assignment examples; Quiz Q8 (a 404 also needs `Content-Length`); Nov 5 lines 992-999 ("zero also works and is easier for the project") |
| 3 | Pick the type: `get_mime_type(strrchr(path, '.'))` | `strrchr` returns `NULL` with no dot, and `get_mime_type` returns `NULL` for unlisted types; handle both before using the string. `strrchr` is in the string manual, not in any course slide | Starter lines 13-29 |
| 4 | Build `HTTP/1.0 200 OK\r\nContent-Type: <type>\r\nContent-Length: <n>\r\n\r\n` with `snprintf` | `n` is `st_size`, an `off_t`; print with `%ld` and a `(long)` cast so `-Wall -Werror` (`-Wformat`) stays quiet. A return below 0 or at least the buffer size is truncation | Assignment "Writing HTTP Responses"; Lec07 slide 21; APUE 4.2 p. 94 and 5.11 p. 159; Lab 9 lines 63-68 |
| 5 | Send the header with a loop on `write` | A `write` can return fewer bytes than asked (Lec04 slide 12; APUE 3.8 p. 72). On a blocking socket a short count appears when a signal interrupts a partly finished write (`man 7 signal`; APUE 10.5 p. 328), which only Task 1 can hit | Lab 9 lines 70-79; Quiz Q5 |
| 6 | `open(resource_path, O_RDONLY)` | -1: `perror`, return -1. **This is the call `concurrent_open.so` intercepts**, so make exactly one `open` per request and nothing else that opens a `server_files/` path | `concurrent_open.c` lines 76-97; measured in Part 2 below |
| 7 | Copy in chunks: `read` a chunk, `write` all of it, repeat until `read` returns 0 | Write `nread` bytes, never `strlen`, because JPEG, PNG, PDF and MP3 bodies contain zero bytes. A read or write error here cannot change the status line already sent, so close and return -1 | Assignment hint (512 or 4096 bytes, not all at once); Lec04 slide 13; Lab 9 lines 134-146; APUE 3.9 p. 72-73 |
| 8 | `close(file_fd)`, then return 0 | Check the `close`. The caller closes the socket | Lab 9 lines 148-151 |
- *The body must be the file's exact bytes.* Only the status line, headers and the blank line use `\r\n`; the body keeps whatever the file has (Quiz Q5; Nov 5 lines 853-866). The five text files (`quote.txt`, `courses.txt`, `gatsby.txt`, `headers.html`, `index.html`) contain no `\r` at all (measured, `tr -cd '\r'`), and the binary files are compared byte for byte, so the `diff -q` checks pass only if nothing rewrites a line ending or any other byte.
- *`write` to a closed client.* A client that disconnects mid-download makes the second `write` raise SIGPIPE, which kills the process by default (Lec08 slides 15-16 show the pipe version). (measured) A C server writing 4096 bytes twice to a socket whose peer had closed exited with status 141 on the second write; with SIGPIPE ignored the same `write` returned -1 with `EPIPE` and the server lived. The spec does not mention it (Decision 6). `man 2 send` documents `MSG_NOSIGNAL` as the per-call alternative.
- *Unspecified requests:* methods other than GET, `GET /`, a path containing `..`, and an unreadable file are not covered by the Assignment, the tests, or any lecture. Decide and be ready to explain.
## Part 1: connection_queue.h and connection_queue.c, line by line
==The queue is Lab 8's `queue.c` rebuilt on a fixed array with a shutdown flag, so the lab is the proof that the pattern works and the new part is only shutdown.== The professor said so twice: "You'll build one again in Project 3" (Lab 8 deck slide 3) and "this is producer-consumer ... a thread-safe queue" (Nov 5 lines 695-705).
### connection_queue.h
| Lines | What the line is | What it means for your code | Sources |
|---|---|---|---|
| 3-4 and 63 | Include guard | Keep | |
| 6 | `#include <pthread.h>` | Needed once the struct holds a `pthread_mutex_t` and `pthread_cond_t` | Lec13 slides 17 and 28; APUE p. 400 and 414 |
| 8 | `#define CAPACITY 5` | The fixed maximum; the Assignment says the queue must keep it. It also equals `N_THREADS`, so five clients can be in service and five waiting | Assignment "Thread-Safe Queue Data Structure" |
| 12-19 | `connection_queue_t` | You may add fields but not change any function declaration | Assignment, same section |
| 13 | `int client_fds[CAPACITY]` | Ring-buffer storage for socket descriptors | Lab 8 deck slide 5 shows the ring (`out = (out + 1) % N`) |
| 14-16 | `length`, `read_idx`, `write_idx` | `length` is the count under the lock; the indices advance modulo `CAPACITY`. When `length == CAPACITY` the two indices are equal, so test `length`, not the indices | Lec13 slides 24 and 31-32 |
| 17 | `int shutdown` | Set once by `connection_queue_shutdown`, read in every wait loop | Assignment "connection_queue_shutdown()" |
| 18 | TODO: add synchronization fields | Add one `pthread_mutex_t` and two `pthread_cond_t` (not full, not empty). Same trio as Lab 8 `queue.h` lines 19-21 | Lec13 slide 27 ("one mutex ... one condition variable per condition"); Oct 22 lines 778-818 |
| 21-27 | Contract for `init` | Returns 0 or -1. Lab 8's `queue_init` returned 1 on failure, because that lab said so; this header says -1 | Lab 8 deck slide 6 versus this header |
| 29-37 | Contract for `enqueue` | Blocks while full; after shutdown no addition happens and -1 is returned | Lec13 slides 24 and 31 |
| 39-47 | Contract for `dequeue` | Blocks while empty. The sentence "If the queue is shut down, then no removal ... is returned" conflicts with the Assignment text (see Known conflicts, item 1) | Lec13 slides 24 and 32 |
| 49-55 | Contract for `shutdown` | Wakes every blocked thread; they get an error | Assignment hint (`pthread_cond_broadcast`) |
| 57-61 | Contract for `free` | Destroy the mutex and both condition variables. Call only after every thread is joined | APUE p. 400 and 414; Lec13 slides 17 and 28 |
### connection_queue.c
The five functions are stubs that return 0 (lines 6-9, 11-14, 16-19, 21-24, 26-29); lines 3-4 include `stdio.h` and `string.h`, which Lab 8's `queue.c` also uses for `fprintf` and `strerror` (lab08-code/queue.c lines 3-5 and 14).

| Function | Holds the lock for | Waits while | State change | Wakes | Returns |
|---|---|---|---|---|---|
| `init` | Not needed yet | Never | `length`, both indices and `shutdown` set to 0; `pthread_mutex_init` and two `pthread_cond_init` with `NULL` attributes | Nobody | 0, or -1 after printing the `strerror` text of the failing call |
| `enqueue(fd)` | The whole body | `length == CAPACITY` and not shut down, on the "not full" condition | Store at `write_idx`, advance it modulo `CAPACITY`, `length` plus one | One waiting dequeuer, via "not empty" | 0; -1 if the queue is shut down (before or while waiting) |
| `dequeue()` | The whole body | `length == 0` and not shut down, on the "not empty" condition | Take from `read_idx`, advance it, `length` minus one | One waiting enqueuer, via "not full" | The descriptor; -1 only when shut down **and** empty (Decision 4) |
| `shutdown` | The whole body | Never | `shutdown = 1` | **Every** waiter on both conditions, with `pthread_cond_broadcast` | 0 |
| `free` | Not needed after join | Never | Destroy the mutex and both condition variables | Nobody | 0, or -1 |
- *Why a loop and not an `if`:* a notified thread is only runnable, and another thread can take the slot first, and the wait can return with nobody having signaled (Lec13 slide 33; Oct 22 lines 957-1011; Lab 8 deck slide 5; APUE 11.6.6 p. 415). [[20_Progress/Degree/CSCI 4061/Labs/Lab - 8|Lab - 8]] recorded 6 of 6 crashes with `if` and 10 of 10 clean runs with `while`.
- *Why the shutdown flag is part of both loop conditions:* a thread that wakes after shutdown must see the flag and leave, or it goes back to sleep and `pthread_join` hangs. This is the failure the Assignment names as the second cause of a test 2 timeout.
- *Why signal while holding the lock:* Lec13 slide 29 says to call `pthread_cond_signal` only while holding the mutex, and the Assignment hint repeats it. APUE p. 416 says signaling after unlocking is acceptable when the `while` loop tolerates a thief; follow the professor. `pthread_cond_signal` does not release the lock, so the woken thread still waits for your unlock (Oct 22 lines 936-956).
- *Why unlock on every return:* Lab 8 deck slide 5 ("Every early return must unlock first, including when wait or signal fails") and `queue.c` lines 37-41 and 70-74 show the pattern. A leaked lock freezes the pool, which test 2 reports as a timeout.
- *Why `strerror`, not `perror`:* the `pthread_*` functions return an error number and do not set `errno` (Lec12 slide 24; Oct 20 lines 595-632; APUE 11.4 p. 386; Lab 7 deck slide 3 and QUESTIONS; Lab 7 `sum_files.c` lines 46-55).
- *Locking order:* one mutex means no deadlock from lock order (Lec13 slides 38-39; APUE 11.6.2 p. 402). Do not call the queue functions while holding any other lock.
- *Invariants to state in the oral exam:* `0 <= length <= CAPACITY`; every read or write of `length`, the indices, the array and `shutdown` happens under the one lock; `shutdown` only goes from 0 to 1; the lock is held across the check and the wait, and `pthread_cond_wait` releases and reacquires it atomically (APUE p. 414; Lec13 slide 29).
## concurrent_open.c, line by line (both parts)
==`concurrent_open.so` makes the file open the one place where the test can prove your server really runs five clients at once: every `open` of a path containing `server_files/` waits until five threads are inside an open call, then all five go.== The two copies (`part1/` and `part2/`) are byte-identical (hashes compared). No lecture, lab or textbook section covers `LD_PRELOAD` or `dlsym` (keyword search of every deck and transcript); `man 8 ld.so` and `man 3 dlsym` exist in the container. The barrier logic itself is Lab 10's `Barrier` class, which you already wrote in Python.

| Lines | What the line does | Sources and consequences |
|---|---|---|
| 3 | `#define _GNU_SOURCE` | `man 3 dlsym`: this macro is required to get `RTLD_NEXT` from `dlfcn.h` |
| 5-10 | `dlfcn.h` (`dlsym`), `fcntl.h`, `pthread.h`, `semaphore.h` (`sem_t`), `stdio.h`, `string.h` | Mutex: Lec13 slides 16-18. Semaphore: Lec14 slides 14-17; APUE 15.10 p. 579-582 |
| 12 | `SERVER_FILE_INDICATOR "server_files/"` | Only paths containing this text are held. Your path must contain it, which `serve_dir` of `server_files` plus `/quote.txt` does |
| 13 | `CONCURRENCY_DEGREE 5` | The pool size must be at least 5 (`N_THREADS` is 5, `http_server.py` `N_WORKERS` is 5) |
| 15-17 | Static mutex with `PTHREAD_MUTEX_INITIALIZER`, a waiter count, a `sem_t` | Lec13 slide 17 (static initializer); Lec14 slides 14-19 (counter, wait, post) |
| 28-33 | A constructor runs when the library loads and calls `sem_init(&semaphore, 0, 0)` | `pshared` 0 means threads of one process (Lec14 slide 15: "We'll always use 0"). Initial value 0 is the same answer as Lab 10's quiz |
| 35-38 | `is_server_file` uses `strstr(pathname, "server_files/")` | Plain substring match; `./server_files/x` and `server_files//x` both match |
| 40-74 | `barrier()`: lock; if four others already wait, post the semaphore four times, reset the count to 0, unlock; otherwise count this thread, unlock, `sem_wait` | Same shape as Lab 10 `sema_barrier.py` lines 24-38 (lock around the count, last arrival releases the rest, give the lock up before blocking). Every error path prints and returns -1, which makes the wrapped `open` return -1 |
| 76-97 | `open`: fetch the real function with `dlsym(RTLD_NEXT, "open")`, call straight through for other paths, else `barrier()` then the real call | Forwards only `pathname` and `flags`, so a `mode` argument is dropped; harmless for `O_RDONLY` |
| 99-120, 122-143, 145-166 | `open64`, `openat`, `openat64` | Same pattern. Which one your program reaches depends on glibc and Python, so all are covered |
| 168-189, 191-212 | `__openat_2`, `__openat64_2` | glibc fortified entry points; no course source |
| 214-235 | `fopen` | `fopen("server_files/...")` is held too, so a server using stdio also meets the barrier |
- *Rounds:* the fifth arrival releases the four that waited, so opens pass in groups of five. Test 2 issues 10 requests: two full rounds. A server with four workers, or one whose workers cannot all reach `open` together, leaves the first four waiting forever.
- *Not intercepted:* `stat`, `fstat`, `access`, `read`, `write`, `close`, `accept`. A `stat` before the `open` does not count.
- (measured, Part 2 side) With `LD_PRELOAD=./concurrent_open.so`, five Python threads each running `open(path, "rb")`, `pathlib.Path(path).read_bytes()` or `os.open` all completed together in under a second; five threads calling only `os.stat`, `Path.exists` and `Path.stat` never reached the barrier; four threads calling `open` completed 0 of 4 and had to be abandoned after 12 seconds. So Python's file `open` releases the interpreter lock while blocked and the barrier works against it.
- *Manual run:* `LD_PRELOAD=./concurrent_open.so ./http_server <serve_dir> <port>` (Assignment).
## Makefiles, line by line
==The top-level Makefile has a port bug, and the Part 1 Makefile has a stale-object trap, and neither is in a file you can change.== Both were found by reading, then confirmed in the container.
### Top-level Makefile (37 lines)
| Lines | What it does | Notes and sources |
|---|---|---|
| 3-4 | `AN = proj3`, `SHELL = /bin/bash` | Bash is needed for the `$((...))` arithmetic on line 8 and the `(( ))` tests in `zip` |
| 5 | `CWD` is the current folder's name, taken with `pwd` and `sed` | Used by `zip` |
| 7 | `port_base ?= 8000` | `make test port_base=9001` is the form Quiz Q17 accepts. Q16: default ports start at 8000 |
| 8 | `py_port_base := $(shell echo $$(($(primary_port) + 3)))` | **Bug.** `primary_port` exists only in `part1/Makefile` and `part2/Makefile`. Here it expands to nothing, so the sum is 3. (measured) `make test` printed `make -C part1 test port_base=8000` and `make -C part2 test port_base=3`. Part 2 therefore runs on ports 3 and 4, which only works because the container user is root, and `port_base=...` on the top-level command never reaches Part 2. Run Part 2 yourself with `make -C part2 test port_base=9101` |
| 10-12 | `.PHONY`, `all: part1 part2` | |
| 14-18 | `part1` and `part2` call `$(MAKE) -C part1` and `-C part2` | |
| 20-22 | `test: all clean clean-tests`, then the two part tests | `test` cleans first, so every top-level test run rebuilds from scratch (measured) |
| 24-30 | `clean`, `clean-tests` forward to both parts | |
| 32-37 | `zip`: clean, then `zip -r` excluding `server_files` and `test_cases`; warns above 10 MiB or 256 files | The archive carries only your source files. Gradescope overwrites non-EDIT files anyway (Assignment) |
### part1/Makefile (62 lines)
| Lines | What it does | Notes and sources |
|---|---|---|
| 3-4 | `CFLAGS = -Wall -Werror -g -pthread`; `TSAN_CFLAGS` adds `-fno-omit-frame-pointer -fsanitize=thread` | `-pthread` is required for the threads. Lab 7 deck slide 5 and Lab 7 Makefile line 2 use the same sanitizer flags |
| 8-10 | `port_base ?= 8000`, `primary_port := $(port_base)`, `secondary_port` is that plus 1 | `PORT1` and `PORT2` in the tests come from these |
| 14 | `all: http_server http_server_tsan concurrent_open.so` | Plain `make` builds the TSAN twin too, so both compilations must be clean |
| 16-20 | Link the 3 objects with and without TSAN | |
| 22-38 | One `.o` rule per source, built twice (normal and TSAN) | **Trap.** `http_server.o: http_server.c` (line 22) lists no header, while `http.o` and `connection_queue.o` list theirs. Editing `connection_queue.h` (you must, to add fields) does not rebuild `http_server.o`, which still holds the old `sizeof(connection_queue_t)` for the queue declared in `main`. The result is silent stack corruption. After any header edit run `make clean` or touch `http_server.c`. This follows from the Makefile text; I did not trigger it |
| 40-41 | `concurrent_open.so` built with `-shared -fpic ... -ldl` | `-ldl` supplies `dlsym` |
| 43-52 | `test-setup` deletes `downloaded_files`; `testnum` selects one test with `-v -n` | `make test testnum=2` for verbose test 2 |
| 54-59 | `clean`, `clean-tests` | |
| 61-62 | `zip` prints an error | Run `make zip` from the top folder only |
### part2/Makefile (37 lines)
There is nothing to compile for Python. `all` builds only `concurrent_open.so` (lines 13-16); `test` depends on it (lines 21-27); `clean` also removes `__pycache__` (line 30); `zip` prints the same error (lines 36-37). The file defines `primary_port` and `secondary_port` the same way (lines 7-9), so `make -C part2 test port_base=N` uses N and N plus 1.
## The test harness
==Both parts run the same two tests; test 1 needs a correct sequential server, and test 2 needs five concurrent opens and a server that exits by itself after SIGINT.== `testius` runs each input file's commands in a shell and compares the transcript with the output file (the side-by-side diff shown in `test_results`).

| Test | Points | What it does | Sources and notes |
|---|---|---|---|
| Part 1 test 1, `sequential_test.txt` | 5 | Starts `./http_server server_files $PORT1` in the background, `sleep 2`, then 11 `curl -s -S` downloads (quote, headers, index, courses, mt2_practice, gatsby, africa, ocelot, hard_drive, Lec01, rain) each followed by a silent `diff -q`, then one request for `affordable_gpu.txt` printed with `-w "Response Status Code: %{http_code}\n"`, then `pkill -INT http_server` | Expected transcript has no output beyond the commands and one line `Response Status Code: 404`. A 404 body must be empty or the line would not follow cleanly |
| Part 1 test 2, `tests.json` sequence | 10 | `dir_setup`, start the server on `$PORT2` with `LD_PRELOAD=./concurrent_open.so`, `sleep 2`, launch 10 `curl` downloads at once, wait for all, `pkill -INT http_server`, wait for the server to finish, run 10 `diff -q` checks | The step list, not the description, is the truth: the description mentions a missing file but none of the 10 requests is for one, `courses.txt` is diffed twice, and `rain.mp3` is not requested. The Assignment states a ten-second limit |
| Part 2 test 1 and 2 | 5 and 5 | Same inputs with `python3 http_server.py server_files $PORT2`; the signal step is `pkill -INT -f "python3 http_server.py"` because the process name is `python3` | `diff` of the two `tests.json` files: only names and the points on the concurrent sequence (10 versus 5) differ |
- *Output rule:* (measured) a background server's stdout and stderr land in the transcript; the two stray lines I injected appeared in the actual output of test 1. Print only on error.
- *Exit rule:* after `pkill -INT`, the harness waits for the server process to end. A server stuck in `accept`, in a join, or in a lost wakeup is the "timeout" the Assignment and Quiz Q13 and Q14 describe.
- *`pkill` matches by pattern:* (measured) `pkill -INT http_server` also signaled a process named `http_server_tsan`. Do not run your own TSAN server on the side while `make test` runs.
- *Baseline:* (measured) on the untouched stubs both parts score 0.0 (0 of 15 and 0 of 10). Part 1 test 1's transcript shows `curl: (7) Failed to connect ... Connection refused` for every request; I did not open Part 2's failure files.
- *Hidden checks:* the Assignment says extra tests exist and that a TSAN run is possible. Run `setarch -R ./http_server_tsan server_files 4061` yourself (measured: plain execution exits 66 on this kernel).
## Part 2: the Python server, line by line
==Part 2 is the same design as Part 1, but the course teaches almost none of the Python it needs: Lec11, Lec15 and Lab 10 cover Python threads, exceptions and bytes, while `socket.create_server`, `settimeout`, `makefile`, `sendfile`, `threading.Condition` and `pathlib` appear in no lecture, lab or textbook page.== For those the sources below are the Python 3.10.12 docstrings and source read in the container, plus experiments. What the course does give you:
- *Lec11 slides 8-12:* the Python `os` and `struct` versions of the C patterns, "Python hides bytes from the programmer" (slide 10), and exceptions instead of return codes (slide 12: "Catch exceptions when you don't want them to propagate further up the stack").
- *Lec15 slides 6-7 and Oct 29 lines 144-172 and 209-215:* Python threads give concurrency but not parallelism because of the global interpreter lock, "you'll see that in project three", and Go would make Part 2 "an afternoon".
- *Lab 10 `sema_barrier.py`:* the only Python synchronization code: `threading.Lock()` with explicit `acquire` and `release` (lines 18, 26, 33, 37), `threading.Semaphore(0)` (line 19), and `threading.Thread(target=..., args=...)` then `start` then `join` (lines 56-65). Its QUESTIONS (lines 68-70) say `with` is normally better for locks.
- *lecture11-code:* `my_cat.py` lines 5-8 (usage message and exit), `python_pipes.py` lines 18-28 (`try`, `except OSError`, `finally` close).
### http_server.py, line by line
| Lines | What it is | What you do | Sources |
|---|---|---|---|
| 1-4 | `import signal, socket, sys, threading` | These four are the only libraries allowed in this file | Assignment "HTTP Server" |
| 6-7 | `import http_handler`; `from connection_queue import ConnectionQueue, ShutDownException` | Your two other EDIT files | |
| 9-10 | `QUEUE_SIZE = 5`, `N_WORKERS = 5` | Keep both. Five workers satisfy the barrier in `concurrent_open.c` line 13 | Part 1 `CAPACITY` and `N_THREADS` |
| 11 | `keep_going = True` | Written by the handler, read by the accept loop | Lec05 slide 26 (same flag idea) |
| 14-16 | `handle_sigint(_signo, _frame)` sets `keep_going = False` through `global` | Leave it. Python calls a handler with two arguments, the signal number and the interrupted frame. It runs in the main thread; `signal.signal` called from another thread raises `ValueError: signal only works in main thread of the main interpreter` (measured) | Assignment "Python Signal Handling"; py3.10 `signal.signal` docstring |
| 19-28 | `main()` checks `len(sys.argv) < 3`, reads `serve_dir`, converts the port with `int()` and exits 1 on `ValueError` | Keep. Note `< 3` accepts extra arguments while the C code requires exactly 3 | lecture11-code/my_cat.py lines 5-8; Lec11 slide 12 |
| 30 | `# TODO Complete the implementation of the rest of this function` | Everything below | |
| 33-34 | `if __name__ == "__main__": main()` | Keep | lecture11-code/my_cat.py line 5 |
- *Steps to put at line 30, in order:*

| Step | Python call | Failure and edge handling | Sources |
|---|---|---|---|
| 1 | `signal.signal(signal.SIGINT, handle_sigint)` | No mask, no `sigaction`, no flags: Python only delivers to the main thread (Assignment) | Assignment "Python Signal Handling"; Lec05 slides 31-35 is the C analogue |
| 2 | `queue = ConnectionQueue(QUEUE_SIZE)` | The constructor takes the capacity | `connection_queue.py` line 14 |
| 3 | Server socket: `socket.create_server(("", port))` (or `getaddrinfo`, `socket`, `bind`, `listen` as in C) | Raises `OSError` on failure, for example `EADDRINUSE`: print to stderr, exit 1. (measured, py3.10 source) `create_server` sets `SO_REUSEADDR` on POSIX, so the linger-period `bind` failure of Part 1 does not appear here | Assignment "HTTP Server" ("find and use this alternative"); py3.10 `socket.create_server` source |
| 4 | `server.settimeout(1)` before the loop | Without it a signal does not end the loop. (measured) With no timeout the handler ran at 1.5 s but `accept` kept blocking until a connection arrived at 5.0 s; with `settimeout(1)` the loop ended at 2.0 s. The reason: Python restarts an interrupted system call after running the handler | Assignment "Python Signal Handling" steps 1-3; Quiz Q19 |
| 5 | Start `N_WORKERS` threads: `threading.Thread(target=worker, args=(queue, serve_dir))`, `start()` | Keep the thread objects for `join`. Do not mark them daemon or the join step means nothing | Lab 10 lines 56-65; Lec12 slides 19-25 for the thread lifecycle |
| 6 | `while keep_going:` `try: conn, _ = server.accept()` `except TimeoutError: continue`, then `queue.enqueue(conn)` | `TimeoutError` is the right name on 3.10 because `socket.timeout is TimeoutError` (measured). The accepted socket is blocking even though the listener has a timeout: listener 1.0 s, accepted `None` (measured, matching the comment in py3.10 `socket.accept`). Close `conn` if `enqueue` raises `ShutDownException` or any other error | Assignment "HTTP Server" bullets 3-5 |
| 7 | After the loop: `queue.shut_down()`, `join` every worker, `server.close()` | Order matters: shut down first so workers leave `dequeue`, then join | Assignment "HTTP Server" last bullet |
- *Worker function (you add it):* loop on `queue.dequeue()`; catch `ShutDownException` and `break`. For each connection call `http_handler.read_request(conn)`, join `serve_dir` to the name, call `http_handler.write_response`, and close `conn` in a `finally`. Catch `OSError` around the request work. (measured) An exception that escapes a thread prints `Exception in thread ...` and the thread ends, so one failed request would permanently shrink the pool below the five the barrier needs.
- *A client that disconnects:* (measured) `sendall` to a client that had closed raised `BrokenPipeError`, which is an `OSError` subclass like `ConnectionResetError`, because Python ignores `SIGPIPE` at startup (measured: the disposition is `SIG_IGN`). C has no such protection (see Part 1, Decision 6).
- *Print nothing on success.* The same transcript rule applies to Python (Part 1 measurement; Quiz Q15 names the C server but the harness is shared).
### http_handler.py, line by line
| Lines | What it is | What you do | Sources |
|---|---|---|---|
| 1 | `import socket` | The only import. The Assignment recommends `pathlib` for existence and size, but `pathlib` is not imported here and the "not allowed" sentences name only `http_server.py` and `connection_queue.py`. Ask on Piazza, or stay with `socket` and built-ins (Decision 7) | Assignment "HTTP Utility Functions" and "HTTP Server" |
| 3-10 | `MIME_TYPES` dictionary | `".jpg"` maps to `"text/jpeg"`, a starter bug: the C table says `image/jpeg` (`http.c` line 19) and the lecture gives `image/jpeg` as the example type (Nov 5 lines 898-904). The tests save bodies with `curl -s` and never check the type, but a browser would not render the cat photo. This file is EDIT, so fix it | `http.c` lines 13-29; Lec17 slide 19 |
| 13-17 | `read_request(conn) -> str` raises `NotImplementedError` | Read the request line by line until the blank line, return only the resource as a `str`. Options: `conn.makefile("rb")` then `readline()` (the Assignment's hint) or a `recv` loop. `readline` returns `b""` at end of stream, so a loop that does not test for it spins forever on a client that hangs up. Decode bytes to `str` | Assignment "Reading input ... one line at a time"; py3.10 `makefile` docstring; Lec11 slide 10; Lab 9 lines 108-115 for the same blank-line rule |
| 20-25 | `write_response(conn, file_path) -> None` raises `NotImplementedError` | 404 when the file is absent, else a 200 with headers and the bytes. Build the header as a `str` and send `header.encode("utf-8")` (Quiz Q18: `s.encode("utf-8")`) with `conn.sendall`, then `with open(file_path, "rb") as f: conn.sendfile(f)` | Assignment "HTTP Utility Functions"; Quiz Q18; py3.10 `sendall` and `sendfile` docstrings |
- *Header text is identical to C:* `HTTP/1.0 200 OK`, `Content-Type`, `Content-Length`, blank line, each ended with `\r\n` (Quiz Q5; Lec17 slides 18-19). The 404 carries `Content-Length: 0` (Quiz Q8; Nov 5 lines 992-999).
- *Existence and size:* (measured) `pathlib.Path("/nonexistent/x.txt").exists()` is False and `.stat()` raises `FileNotFoundError`; `Path("/tmp").is_file()` is False, so `is_file()` also rejects directories; `Path("server_files/quote.txt").suffix` is `".txt"` and feeds the MIME dictionary. `os.stat` exists in the course (Lec11 slide 14, `python_pipes.py` line 9) but `os` is not imported here.
- *`sendfile`:* (py3.10 docstring) the file must be a regular file opened in binary mode, it returns the bytes sent, and non-blocking sockets are unsupported. `open(path, "rb")` reaches the barrier exactly once per request (measured).
### connection_queue.py, line by line
| Lines | What it is | What you do | Sources |
|---|---|---|---|
| 1-3 | `import collections, socket, threading` | The allowed set for this file. `socket` is only for the type hints | Assignment "Connection Queue" |
| 6-8 | `class ShutDownException(Exception)` | Raise it from `enqueue` and `dequeue` instead of returning -1 | Assignment "Connection Queue" |
| 11-12 | `class ConnectionQueue` | | |
| 14-18 | `__init__(self, capacity)`: `elements = collections.deque()`, `shutdown = False`, `capacity`; line 18 is the TODO | Add one `threading.Lock()` and two `threading.Condition(lock)` objects (not full, not empty), the same trio as the C struct | Lab 10 lines 18-19; py3.10 `threading.Condition` docstring |
| 20-29 | `enqueue(conn)` | Block while `len(elements) == capacity`; if shut down, raise `ShutDownException`; `append`; notify one dequeuer | Lec13 slides 24 and 31; Assignment "Connection Queue" |
| 31-40 | `dequeue()` | Block while empty; `popleft`; notify one enqueuer; raise `ShutDownException` when shut down and empty (Decision 4) | Lec13 slides 24 and 32 |
| 42-46 | `shut_down()` | Under the lock set `shutdown = True` and `notify_all()` on **both** conditions | Assignment "Connection Queue"; py3.10 `notify_all` docstring |
- *Condition API (py3.10 docstrings):* `wait()` raises `RuntimeError` if the caller does not hold the lock, releases the lock, blocks until notified, then reacquires it. `notify(n=1)` wakes at most `n` waiters, does nothing if nobody waits, and also raises `RuntimeError` without the lock. `notify_all()` wakes everyone. `wait_for(predicate)` exists and loops for you. `with cond:` acquires and releases the shared lock.
- *Keep the C rules:* check the condition in a `while` (Lec13 slide 33; the interpreter does not promise there is no spurious wakeup, and another thread can still take the slot); include `shutdown` in the wait condition; use `notify_all` for shutdown. `deque.popleft()` on an empty deque raises `IndexError` (measured), so the empty check is not optional.
- *The GIL does not make this safe:* it serializes bytecodes, not your check-then-act sequences. The course says threads give concurrency, not parallelism, in Python (Lec15 slide 6); it says nothing about races surviving it, so treat the lock and conditions as required.
- *What changes from C:* no return codes to check on lock calls, so `with` blocks replace the "unlock on every return" rule from Part 1 (the lock releases when the block exits, even on an exception); the shutdown signal is an exception, not -1.
## Error handling worklist (10 percent plus the oral exam)
==A check on every call that can fail, and a cleanup on every path that leaves early, is what the manual review looks for.== The rule behind it: `errno` is meaningful only right after a call that reported failure, and no function ever resets it to 0 (APUE 1.7 p. 15). The Assignment says: "Make sure that you properly check for and deal with errors whenever using a C or Python function that may indicate an error."

| Call | Failure signal | How to report and recover | Sources |
|---|---|---|---|
| `sigaction`, `sigemptyset`, `sigfillset`, `sigaddset`, `sigprocmask` | -1 with `errno` | `perror`, clean up, return 1. `sigprocmask` after threads exist: restore the mask even if later steps failed | Lec05 slides 19, 21 and 31; lecture05-code/block_sigint.c lines 9-20; lecture17-code lines 36-39 |
| `getaddrinfo` | Nonzero code, **not** `errno` | `gai_strerror`, never `perror`; `freeaddrinfo` after use | Lec16 slide 14; Nov 3 lines 510-524; APUE p. 600 |
| `socket`, `bind`, `listen` | -1 | `perror`; `freeaddrinfo` and `close(sock_fd)` on the way out | lecture17-code lines 56-75 |
| `accept` | -1 | `EINTR`: stop serving and clean up. Anything else: `perror` and clean up | Nov 3 lines 861-894; Quiz Q2 |
| `read` on the socket | -1, or 0 for a closed peer, or a short count | Loop for more data; 0 before the blank line is a failed request | Lab 9 QUESTIONS; Lec04 slide 12; APUE 3.7 p. 71 |
| `write` on the socket | -1 or a short count | Loop until all bytes are out; `EPIPE` or SIGPIPE if the client left | Lab 9 lines 70-79; Lec08 slides 15-16 |
| `stat` | -1 | `ENOENT`: 404. Other errno: your decision (Decision 3) | Lec07 slide 7; Assignment hint |
| `open`, `read`, `close` on the file | -1 | `perror`; close what you opened | Lab 9 lines 128-151 |
| `snprintf` | Below 0, or at least the buffer size | Treat as an error | APUE 5.11 p. 159; Lab 9 line 65 |
| `close(client_fd)` | -1 | `perror` | lecture17-code lines 112-114 |
| `pthread_create` | Nonzero error number | `strerror`; shut down the queue, join the started workers, free, return 1 | Lec12 slide 25; Oct 20 lines 595-632 |
| `pthread_join` | Nonzero | `strerror`; keep joining the others | Lab 7 `sum_files.c` lines 84-90; Lab 8 `threads_main.c` lines 80-90 |
| `pthread_mutex_init`, `pthread_cond_init`, `lock`, `unlock`, `cond_wait`, `cond_signal`, `cond_broadcast`, `destroy` | Nonzero | `strerror`; unlock before returning from any path that holds the lock | Lab 8 `queue.c` lines 13-24, 32-41, 70-78; Lab 8 deck slide 5 |
| Queue functions | -1 | The caller closes the descriptor it could not hand off | `connection_queue.h` lines 21-61 |
| Python `int(port)`, `accept`, socket calls | `ValueError`, `TimeoutError`, `OSError` | Catch per request so a worker survives; only `ShutDownException` ends a worker | Lec11 slide 12; python_pipes.py lines 18-28; measured thread death |
## Decisions to make before coding
==Each decision below has more than one defensible answer in the course material, so choose on purpose and be ready to defend it in the oral exam.==
1. **Request reading in C**
	Option A: a plain `read` loop that accumulates and searches for `\r\n\r\n`. Option B: Lab 9's `dup` plus `fdopen` plus `setvbuf(..., _IONBF, 0)` plus `fgets` loop, the professor's own code. B is easy to source and cannot over-read, at one `read` per byte. A needs care for the split terminator. Either needs you to explain stdio versus system-call buffering (Lec04 slides 15-17; APUE 5.4 p. 145-147; Assignment warning).
2. **Buffer size contract**
	`http.h` has no size parameter and cannot change. Define one constant for `resource_name` in `http_server.c` and honor it in `http.c`. If you accumulate the whole request, size that buffer for the headers too (the captured requests for `/quote.txt` were 88 bytes from curl and 139 from wget, headers included); if you read line by line, only the resource must fit.
3. **What counts as an error**
	Only `ENOENT` is specified (404). Choose what a directory, a permissions failure or a bad request line does. Recommended: a 404 is a handled request, so `write_http_response` returns 0 and prints nothing; real I/O failures return -1 (Quiz Q15).
4. **Queue behavior after shutdown**
	Follow the Assignment text: dequeue keeps returning items until the queue is empty, then -1; enqueue returns -1 at once. This also closes every descriptor that was already queued. The header comment says dequeue refuses once shut down (Known conflicts, item 1).
5. **`SO_REUSEADDR` in C**
	Not taught, not on the Midterm 2 function list, and the Assignment's answer is "use a different port". APUE 16.6 p. 625 recommends it for a restartable server (Fig 16.22). (measured) Without it, `bind` failed with `EADDRINUSE` right after the server closed a connection first; with it, `bind` succeeded. Add it only if you check its return value and can explain it.
6. **SIGPIPE in C**
	Not mentioned by the Assignment. (measured) A disconnecting client kills a C server that ignores nothing (exit status 141). Options: `sigaction(SIGPIPE, SIG_IGN)` once in `main` (disposition is shared by all threads, APUE p. 453; `man 2 send` says the same) or `send(..., MSG_NOSIGNAL)`. The Midterm 2 function list has `write` but not `send`.
7. **Python existence and size**
	`pathlib` (the Assignment's suggestion) versus `open(path, "rb")` with `except FileNotFoundError` and `seek` and `tell` for the size. The library restriction wording is ambiguous for `http_handler.py` (Known conflicts, item 12). Safest is to ask first; the built-in route uses no extra import.
8. **Restoring the signal mask**
	The Assignment says `sigprocmask`. APUE p. 346 and p. 453 say `sigprocmask` is defined for single-threaded processes and threads use `pthread_sigmask` (returns an error number, so `strerror`). (measured) Restoring with `sigprocmask` after the workers existed worked here: the handler ran on the main thread. Follow the Assignment and know the textbook point.
9. **Transient `accept` errors**
	The lecture server treats any non-`EINTR` failure as fatal (lecture17-code lines 83-89). `man 2 accept` says some pending network errors should be retried. The course gives no rule; the lecture version is the safe sourced one.
## Known conflicts and gaps
==Several places in the material disagree with each other or say nothing, and each one is a place where a guess would be wrong or unsupported.==
1. **Dequeue after shutdown.** `connection_queue.h` lines 39-47: after shutdown "no removal from the queue takes place and an error is returned". Assignment: "Threads can continue to perform a dequeue operation until the queue becomes empty, at which point they receive a return value indicating an unsuccessful dequeue." These are different behaviors. The Assignment text is the more detailed one.
2. **Function name.** The Assignment's hint says `write_http_request()`; the real function is `write_http_response()` (Quiz Q1 and Q6).
3. **Sample text.** The Assignment's response example spells "Premature Optimization"; the file has "optimization". The file is 48 plus 20 bytes, which is the `Content-Length: 68` shown (measured with `cat -A` and `ls -l`).
4. **Python ports in the top-level Makefile.** `py_port_base` evaluates to 3 (measured), so top-level `make test` puts Part 2 on ports 3 and 4 and ignores `port_base`.
5. **Test 2 description.** It says the server serves "one non-existent file"; the step list requests ten existing files.
6. **Quiz Q19 against measurement.** The quiz answer says the handler runs only after the blocking call returns. (measured, Python 3.10.12) the handler ran at once (1.5 s) while `accept` was blocked, and `accept` was then restarted, so the loop could not see the flag until the call returned. The practical advice, `settimeout` plus `except TimeoutError`, is the same.
7. **Linger period.** The Assignment says about two minutes; Nov 3 lines 949-954 say "within the last minute or so"; APUE p. 625 says "several minutes". I measured that the port is unusable right after a server-side close, not for how long.
8. **`SA_RESTART`.** Lec05 slide 38 says to use it, and Lab 3 required it; Project 3 requires its absence.
9. **Status lines.** The lecture servers print "Waiting for client to connect" (lecture17-code line 80); Quiz Q15 says print nothing on success.
10. **`strerror` and threads.** APUE Fig 12.9 (p. 442) lists `strerror` among functions not guaranteed thread-safe, while every course sample uses `strerror` for `pthread_*` errors (Lec12 slide 24; Lab 7 deck slide 3). `strerror_r` is not taught. I did not test glibc's behavior.
11. **`sigprocmask` and threads.** APUE p. 453 says its behavior is undefined in a multithreaded process; the Assignment tells you to use it (Decision 8).
12. **Libraries in Part 2.** The Assignment recommends `pathlib` for `http_handler.py` but the starter imports only `socket`, and the "not allowed beyond those already imported" sentences appear only for `http_server.py` and `connection_queue.py`.
13. **MIME bug.** `MIME_TYPES[".jpg"]` is `"text/jpeg"` in `http_handler.py`; the C table has `image/jpeg`.
14. **Unwritten requirements.** SIGPIPE, `GET /`, `..` in a path, a client that never sends a request, and an unreadable file appear nowhere in the Assignment, tests or lectures.
15. **A lost signal.** SIGINT arriving between `while (keep_going)` and `accept` is missed, as in the lecture server. The course shows the analogous race for `pause` (Lec06 slides 18-21) and offers no fix for `accept`.
16. **Material the course does not teach for this project.** `LD_PRELOAD` and `dlsym`; Python `threading.Condition`, `socket.create_server`, `settimeout`, `makefile`, `sendfile` and `pathlib`; and, in C, `strtok_r`, `snprintf`, `sscanf`, `setsockopt`, `strrchr`, `pthread_sigmask`. The Midterm 2 reference list has `strtok` but not `strtok_r`, and has `sigprocmask` but not `pthread_sigmask` or `setsockopt`.
17. **Vault notes behind the course.** [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]] still says "No chapter note yet" for Chapters 11 and 16, which now exist; there is no vault note for APUE Chapters 5 and 12; the Weekly notes stop at Week 4.
18. **Formatter.** The dev container sets format-on-save with clang-format 19 and ruff, and no `.clang-format` file exists anywhere in `csci4061-fa26` (searched three levels). I did not test what style that produces on the starter files.
## How to verify each step
| Step | Command | What you should see |
|---|---|---|
| Build | `make` in `part1` | No warnings. All three targets build: `http_server`, `http_server_tsan`, `concurrent_open.so` |
| Task 1 test | `cd part1` then `make test testnum=1 port_base=9001` | Test 1 passes. The `testnum` form prints the full transcript |
| By hand | `./http_server server_files 9001`, then `curl -v localhost:9001/quote.txt` and `wget localhost:9001/quote.txt` | `200 OK`, `Content-Type: text/plain`, `Content-Length: 68` |
| 404 | `curl -s -S -w "Response Status Code: %{http_code}\n" http://localhost:9001/affordable_gpu.txt` | `Response Status Code: 404` and nothing before it |
| Large binary | `curl -s -S http://localhost:9001/Lec01.pdf > /tmp/x.pdf`, then `cmp` with `server_files/Lec01.pdf` | No output from `cmp` |
| SIGINT | `pkill -INT http_server`, then check `echo $?` of the server | Server exits by itself, no output |
| Task 2 test | `make test testnum=2 port_base=9001` | Test 2 passes within ten seconds (PORT2 is 9002) |
| Five at once | `LD_PRELOAD=./concurrent_open.so ./http_server server_files 9003`, then five `curl` calls started together | All five finish; with four workers they hang |
| Races | `setarch -R ./http_server_tsan server_files 9004` and send traffic, then SIGINT | No `WARNING: ThreadSanitizer` |
| Descriptors | `valgrind --track-fds=yes ./http_server server_files 9005`, send traffic, SIGINT | No leaked descriptors beyond 0, 1, 2. I did not run valgrind on a threaded server for this note |
| Part 2 | `cd part2` then `make test port_base=9101` | Both tests pass. Do not use the top-level `make test` for Part 2 |
| Package | `make zip` at the top level, then `unzip -l proj3-code.zip` | Only source files; fewer than 256 entries |
- *Do not leave debug output in.* Quiz Q15 and the stray-output measurement make this a test failure, not a style point.
- *Re-run after header edits.* `make clean` first (Makefile trap above).
## Oral exam question bank
The oral exam is 40 percent and the TAs ask about your submitted code. Answer from the sources, not from the code.
1. Why does the server need two kinds of socket descriptors? (Lec17 slide 6; Nov 5 lines 171-194; APUE p. 608)
2. What does `listen` actually do, and what does its second argument mean? (Nov 5 lines 143-165; Lec17 slide 6)
3. Why `AI_PASSIVE` and a `NULL` host? (Lec16 slide 21; Nov 3 lines 850-864; `man 3 getaddrinfo`)
4. Why can `bind` fail with `address already in use`, and why does the Python server not hit the linger case? (Quiz Q3; Nov 3 lines 931-956; measured `SO_REUSEADDR`; py3.10 `create_server` source)
5. Why is there no `SA_RESTART` on the SIGINT handler? What would happen with it? (Assignment hint; Lec05 slide 38; `man 7 signal`; measured hang)
6. What happens to a signal that arrives while `accept` is blocked, and what does `EINTR` mean? (Lec05 slide 37; Nov 3 lines 874-894; APUE p. 327-329)
7. Why does the handler only set a flag? (Lec05 slide 26; Lec06 slide 15; Sep 24 lines 559-569)
8. In Task 2, why block signals before creating threads, and why restore afterward? (Assignment; APUE 11.4 p. 386 and 12.8 p. 453; Oct 22 lines 756-776)
9. Why is `sigprocmask` fine before creating threads but questionable after? (APUE p. 346 and p. 453)
10. Why does a request take more than one `read`, and where does the request end? (APUE p. 591; Lec04 slide 12; Assignment hint)
11. Why `\r\n` in headers but the file's own bytes in the body? (Quiz Q5; Nov 5 lines 853-866)
12. Why must `Content-Length` appear on a 404? (Quiz Q8; Nov 5 lines 992-999)
13. Why not `strtok` here, and what is the alternative? (Quiz Q7; Lec06 slide 15; Sep 24 lines 507-531; APUE p. 442-443)
14. Why read the file in chunks and write each chunk in a loop? (Assignment hint; Lec04 slides 12-13; APUE p. 72-73; `man 7 signal` on partial writes)
15. What are the invariants of the queue, and why one mutex with two condition variables? (Lec13 slides 27-32; Oct 22 lines 778-818; APUE p. 413-416)
16. Why `while` and not `if` around `pthread_cond_wait`? (Lec13 slide 33; Oct 22 lines 957-1011; Lab 8 recorded 6 of 6 crashes with `if`)
17. Why `pthread_cond_broadcast` for shutdown and not `signal`? (Assignment hint; Oct 22 lines 854-860; APUE p. 415)
18. Why must the queue be freed only after the workers are joined? (Assignment; APUE 11.5 p. 389)
19. How does `concurrent_open.so` prove concurrency, and why do four workers fail? (`concurrent_open.c` lines 40-74; Lab 10; measured)
20. What if a client disconnects mid-download in C, and in Python? (Lec08 slides 15-16; measured SIGPIPE and `BrokenPipeError`)
21. Why does the Python server need `settimeout`? (Assignment; Quiz Q19; measured 1.5 s versus 5.0 s)
22. Why does Python get away with fewer lines, and what did it cost? (Lec15 slides 6-7; Lec17 slide 12; Assignment introduction on abstraction versus control)
## APUE citation index
Page numbers are the book's printed pages (PDF page minus 34). HTTP itself is not in APUE; its sources are Lec17 slides 17-23, Nov 5 lines 759-1008, the Lab 9 deck slide 5 and the quiz.

| Project element | APUE section and printed pages | What the page gives |
|---|---|---|
| Every error check | 1.7, p. 14-16 | `errno` is per thread; `perror` and `strerror`; set only on failure; `EINTR` can be nonfatal |
| `read`, `write` on files and sockets | 3.7-3.8, p. 71-72 | Short reads from a network; `write` normally returns the requested count |
| 512 or 4096 byte chunks | 3.9, p. 72-73 | 4096 matches `st_blksize`; larger buffers add little |
| Existence and `Content-Length` | 4.2, p. 93-94 | `stat` and `st_size`; `-1` on failure |
| Regular file test | 4.3, p. 95-96 | `S_ISREG` |
| Lab 9 style reading (`fdopen`, `setvbuf`, `fgets`) | 5.4-5.5 and 5.7, p. 145-148 and 152 | Buffering modes; `_IONBF` ignores the buffer; `fdopen` wraps a descriptor |
| Header and path building | 5.11, p. 159-160 | `snprintf` return value and truncation; `sscanf` |
| Why `accept` returns `EINTR` | 10.5, p. 327-330 | Slow system calls, `EINTR`, restart only with `SA_RESTART` |
| Handler and thread-safe string rules | 10.6, p. 330-332 | `malloc` and `printf` are not async-signal safe |
| Blocking SIGINT around thread creation | 10.12, p. 346 | `sigprocmask`, `SIG_BLOCK`, `SIG_SETMASK`; single-threaded only |
| The SIGINT handler | 10.14, p. 349-355 | `struct sigaction`; `sa_mask`; Fig 10.16 `SA_RESTART`; Fig 10.18 initialize `sa_mask` with `sigemptyset` |
| Worker creation | 11.4, p. 385-386 | `pthread_create`; new thread inherits the signal mask; pthread errors are return values |
| Joining workers, argument lifetime | 11.5, p. 388-392 | `pthread_join`; a stack structure goes stale once its thread is gone |
| Queue mutex | 11.6.1-11.6.2, p. 399-402 | Lock and unlock; consistent lock order avoids deadlock |
| Queue conditions | 11.6.6, p. 413-416 | `pthread_cond_wait` unlocks atomically, re-evaluate after return, signal versus broadcast, Fig 11.15 work queue |
| `concurrent_open.c` barrier | 11.6.8, p. 418 and 15.10, p. 579-584 | Barriers; POSIX semaphores `sem_init`, `sem_wait`, `sem_post` |
| No `strtok` | 12.5, p. 442-443 | Figure 12.9 lists `strtok`; Figure 12.10 gives the `_r` forms |
| Why only the main thread takes SIGINT | 12.8, p. 453-457 | Per-thread masks, shared dispositions, `pthread_sigmask`, inherited mask |
| Socket descriptors | 16.2, p. 590-593 | `socket()`, `SOCK_STREAM` is a byte stream with no boundaries |
| `bind` and ports | 16.3.4, p. 604-605 | Port below 1024 needs privilege; one socket per address |
| `getaddrinfo` | 16.3.3, p. 597-601 | `hints`, `AI_PASSIVE`, `gai_strerror`, `freeaddrinfo` |
| `listen`, `accept` | 16.4, p. 605-609 | Backlog is a hint; the accepted descriptor is new; the original keeps listening |
| `read` returning 0 at a closed peer | 16.5, p. 610-615 | Repeat the receive until it returns 0 |
| Address reuse | 16.6, p. 623-625 | `SO_REUSEADDR` and Fig 16.22 |
## Concept Links
- [[20_Progress/Degree/CSCI 4061/Projects/Project - 3 Assignment|Project - 3 Assignment]] and [[20_Progress/Degree/CSCI 4061/Projects/Project - 3 Quiz|Project - 3 Quiz]]: the spec and the 20 questions used as a checklist.
- [[20_Progress/Degree/CSCI 4061/Labs/Lab - 8|Lab - 8]]: the solved bounded queue with TSAN evidence, the pattern for `connection_queue.c`.
- [[20_Progress/Degree/CSCI 4061/Labs/Lab - 9|Lab - 9]]: the HTTP client; its `read_http_response` is the request-reading technique the Assignment points to.
- [[20_Progress/Degree/CSCI 4061/Labs/Lab - 7|Lab - 7]]: pthread error handling, mutexes, and the `setarch -R` TSAN fix.
- [[20_Progress/Degree/CSCI 4061/Labs/Lab - 10|Lab - 10]]: the Python lock and semaphore barrier, the model for `concurrent_open.c` and for Python threading style.
- [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 11|Chapter - 11]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 16|Chapter - 16]]: the vault notes on threads and sockets; page numbers here were checked against the PDF itself.
- [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]]: signals; the `sigaction` and `EINTR` material.
- [[20_Progress/Degree/CSCI 4061/Projects/Project - 2 Implementation|Project - 2 Implementation]]: the format precedent and the earlier error-checking worklist.
## Open Questions
- [ ] Ask whether `pathlib` may be imported in `http_handler.py` (Decision 7).
- [ ] Ask which dequeue-after-shutdown behavior the hidden tests assume (Known conflicts, item 1).
- [ ] Decide on `SO_REUSEADDR` and SIGPIPE handling and note the reason for the oral exam (Decisions 5 and 6).
- [ ] Run valgrind on the finished threaded server, which this note did not do.
- [ ] Measure how long the port stays unusable after a server-side close (Known conflicts, item 7).
