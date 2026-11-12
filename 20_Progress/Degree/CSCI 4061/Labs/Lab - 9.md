---
type: class
class_kind: lab
status: sprout
created: 2026-11-11
updated: 2026-11-11
tags:
  - class
  - lab
area:
  - "[[CSCI 4061 Board]]"
deadline: 2026-11-11
next: "Upload lab09-code.zip to Gradescope before 11:59pm tonight (Wed 2026-11-11), then confirm the remote autograder matches the local 1.0/1.0 and that lab attendance was recorded."
---
# Lab - 9
==Lab 9 is the first lab that talks to another machine: `simple_http_client.c` opens a TCP connection to a web server at `44.203.146.22:80`, sends a hand-written HTTP/1.0 `GET`, and saves the reply body to disk, three times, for `index.html`, `gatsby.txt` and `ocelot.jpg`.== Two functions are blank (`connect_to_server`, `write_http_request`). `main` and `read_http_response` are given.
**Sources read:** the lab slides (`Lab 09.pptx.pdf`, 7 pages: TCP vs UDP, the client setup steps, HTTP 1.0 request and response, hints, testing); `csci4061-fa26/Labs/lab09-code/` in full (`QUESTIONS.txt`, `QUESTIONS.txt.bak`, `simple_http_client.c`, `Makefile`, and `test_cases/` with `tests.json`, the input script, both expected outputs, the quiz hash and the three reference files); Lecture 16 (`Lec16.pdf`, 3 Nov, slides 11 to 17: `socket()`, `getaddrinfo()`, `struct addrinfo`, client use); Lecture 17 (`Lec17.pdf`, 5 Nov, slides 3 to 4 for the TCP client steps and 17 to 21 for HTTP) and its transcript (the passages on `read` returning zero and on `\r\n`); the lecture code `lecture17-code/question_client_tcp.c`; Stevens and Rago, *APUE* 3e, §16.4 and the start of §16.5, printed pp. 605 to 612 (PDF pp. 639 to 646); [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 16|Chapter - 16]] for `getaddrinfo` and `gai_strerror` (printed p. 600); [[20_Progress/Degree/CSCI 4061/Labs/Lab - 8|Lab - 8]] for the container and the note shape; [[CSCI 4061 Board]] for the lab policy.
> [!NOTE] No week note backs this lab yet
> `Weekly/` stops at Week - 4, so there is no Week 10 note to link, and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 16|Chapter - 16]] has notes for 16.1 to 16.4 but an empty 16.5. I read §16.5 directly for `read`, `write` and the `recv` return of 0. Nothing in this lab uses `bind`, `listen` or `accept`.

## Goal
==Build the client half of a web request by hand: resolve the server, connect a TCP socket, send `GET /<file> HTTP/1.0` with CRLF line endings and a closing blank line, and let the given reader copy the body to a file.==
### Submission checklist (what actually gets graded)
- **Attendance** in the assigned lab section.
- **`QUESTIONS.txt`**: change `( )` to `(X)` on 5 quiz answers, nothing else. `socrates` hashes the whole file against `test_cases/resources/quiz_sum.json`. Test 1, 0.5 pt.
- **`simple_http_client.c`**: fill in `connect_to_server` and `write_http_request` at their `TODO` comments. Test 2 runs `./simple_http_client`, then `diff -q` of each downloaded file against `test_cases/resources/`. Silence means identical. 0.5 pt.
- `make test`, then `make zip` creates `lab09-code.zip` (the Makefile leaves out `test_cases/`), then upload to **Gradescope**. Groups may submit once and add names.
- Due 11:59pm Wednesday 2026-11-11 (stated in the lab prompt, available from 2026-11-09).
- Not edited: `Makefile`, `QUESTIONS.txt.bak`, `main`, `read_http_response`, `test_cases/`.
- Test 2 needs a live connection from the container to an outside server. The autograder's network access is outside my control.
## Procedure / key steps
- Setup: the course container `modest_ganguly` (Ubuntu 22.04.5, gcc 11.4.0, kernel `6.18.58.1-microsoft-standard-WSL2`) was running. The host folder and `/workspaces/csci4061-fa26/Labs/lab09-code` are one mount. This is a different container name from Lab 8's `cranky_pasteur`, so check `docker ps` before assuming the name.
- The Makefile builds with `-Wall -Werror -g` and no sanitizer, so no `setarch` workaround is needed (contrast Labs 7 and 8). An unused variable still fails the build.
- Before changing anything I ran the untouched starter in a scratch copy to see the failure first (Errors + fixes, first entry). Every experiment below ran in a scratch copy under `/tmp` in the container that I deleted afterwards.
### The TCP client sequence (Lab slide 4, Lecture 17 slides 3 and 4)
==`getaddrinfo` with `SOCK_STREAM`, then `socket`, then `connect`, then `freeaddrinfo`, then ordinary `write` and `read`, then `close`.== The only call that UDP did not need is `connect`. After it succeeds the socket is a byte stream like a pipe, and `read` returning 0 means the server closed (Lecture 17 transcript: "Read returns zero if the other side has closed").
### Code: `connect_to_server`
Decisions, in the order they came up:
1. **Hints:** `memset` to zero, then `ai_family = AF_UNSPEC` and `ai_socktype = SOCK_STREAM`. The zeroing matters because `getaddrinfo` reads every field of `hints` (APUE p. 600: the others must be 0 or NULL).
2. **`getaddrinfo` failure goes through `gai_strerror`, not `perror`.** It returns an error code and does not set `errno` (Lecture 16 slide 14, APUE p. 600).
3. **Use the first result only.** No walk over `ai_next`. `HOST` is an IPv4 literal, so there is one candidate, and the slide hints use the result directly.
4. **`socket(ai_family, ai_socktype, ai_protocol)`**, then **`connect(sock_fd, ai_addr, ai_addrlen)`**, all taken from the result so the code does not care whether it got IPv4 or IPv6.
5. **Cleanup on every path.** `freeaddrinfo` is called whether we succeed or fail (slide 4). If `connect` fails, the socket is also closed, because `main` only closes `sock_fd` when a later call fails. If `connect_to_server` returns `-1`, `main` just returns.
6. **Return the connected fd.** `-1` on any failure, which is what `main` tests.
### Code: `write_http_request`
1. **Build the request in a `BUFSIZE` buffer with `snprintf`:** `"GET /%s HTTP/1.0\r\n\r\n"`. The leading `/` is part of the path. `\r\n` ends the request line and a second `\r\n` is the empty line that ends the header block. No headers are needed (lab text).
2. **Check `snprintf`'s return.** A negative value or one `>= BUFSIZE` means truncation, so print and return `-1` instead of sending half a request.
3. **Write `len` bytes, not `BUFSIZE`** (slide 6: "Write `strlen(buf)` bytes, not BUFSIZE"). `len` is what `snprintf` returned, which equals `strlen(buf)`.
4. **Loop until all `len` bytes are written.** This loop is my addition, not from the slides: `write` may accept fewer bytes than asked. With a request of about 30 bytes I do not expect a short write and did not trigger one.
5. **The function does not close `sock_fd`.** `main` owns it and closes it on failure.
```c
// connect_to_server
getaddrinfo(host, port, &hints, &server);          // hints: AF_UNSPEC, SOCK_STREAM; on error gai_strerror
sock_fd = socket(server->ai_family, server->ai_socktype, server->ai_protocol);
connect(sock_fd, server->ai_addr, server->ai_addrlen);   // on error: perror, close, freeaddrinfo, return -1
freeaddrinfo(server);
return sock_fd;
// write_http_request
len = snprintf(buf, BUFSIZE, "GET /%s HTTP/1.0\r\n\r\n", file);   // reject len < 0 or len >= BUFSIZE
while (total < len) { n = write(sock_fd, buf + total, len - total); /* -1: perror, return -1 */ total += n; }
```
The block is condensed to the decisions. The error branches are written out in the real file.
### Why `read_http_response` works as given (reading it, not changing it)
It `dup`s the socket, wraps the copy in a `FILE *` with buffering turned off, and calls `fgets` until it sees the line `"\r\n"`, the end of the headers. Then it `read`s the original fd to end of stream and writes everything to the file. My reading of why `_IONBF` is there: a buffered `FILE` would pull body bytes into its own buffer while hunting for the blank line, and the later `read(sock_fd)` would never see them. I did not test that. The loop ends because the HTTP/1.0 server closes after one response (Lecture 17 slide 21), which is also why `main` makes a new connection per file. The reader never looks at the status line (see Errors + fixes).
### Quiz answers (5 total, 5 flipped)
1. **`ai_socktype` for TCP: `SOCK_STREAM`.** UDP is `SOCK_DGRAM` (Lecture 16 slide 11, lab slide 3). `SOCK_UDP` does not exist, because UDP is a protocol and not a socket type (APUE Figure 16.2, p. 590, lists `SOCK_DGRAM`, `SOCK_RAW`, `SOCK_SEQPACKET`, `SOCK_STREAM`).
2. **Extra call a TCP client needs: `connect()`.** `bind`, `listen` and `accept` are the server side (Lecture 17 slides 5 to 7), and the UDP client used `sendto` with no connection.
3. **Detecting a disconnect: `read()` returns 0.** `-1` is an error. APUE p. 612 says the same for `recv`: 0 when the peer has done an orderly shutdown.
4. **Format of HTTP messages: just text.** Lab slide 5, Lecture 17 slide 17: 4061 goes out as the characters `4 0 6 1`, not as a 4-byte integer with an endianness. One nuance I observed: the request and the response head are text, but the body of the `ocelot.jpg` response is raw JPEG bytes (1186359 bytes). The body is whatever the file holds, so the client must copy it without interpreting it.
5. **`GET`: retrieve a particular resource.** Lecture 17 slide 18 and the transcript ("just means give me this thing I'm identifying"). `POST` and `PUT` upload.
`socrates` checks the file as one hash, so it confirms the five together and not each on its own. The reasoning above is mine, and I picked the answers before running `make test-quiz`.
### Reproduce in the course dev container
```sh
cd /workspaces/csci4061-fa26/Labs/lab09-code
make test                  # both tests; needs a connection to 44.203.146.22:80
make zip                   # cleans build output and downloads, then creates lab09-code.zip
unzip -l lab09-code.zip
```
`make test-quiz` and `make test-code` run each half on its own. `make clean-tests` removes the downloaded files and `test_results/`.
## Results
==Observed in `modest_ganguly` on 2026-11-11: `make test` passed 2/2 for 1.0/1.0.==
```text
gcc -Wall -Werror -g -o simple_http_client simple_http_client.c
testius test_cases/tests.json
== Lab 09
== Running 2/2 tests
Test 1) Quiz - QUESTIONS.txt: Passed
Test 2) Code - HTTP Client: Passed

Ran 2/2 Requested Tests
Passed 2/2 Tests
Total Score: 1.0/1.0
```
- Before the edits, in a scratch copy, `make test` gave `Test 1: Failed`, `Test 2: Failed` and `Total Score: 0.0/1.0`.
- `cmp -l QUESTIONS.txt.bak QUESTIONS.txt` lists exactly 5 differing bytes (offsets 1391, 1636, 1777, 2128, 2231), each a space (octal 40) turned into `X` (octal 130). `diff` shows the five lines `SOCK_STREAM`, `connect()`, `read() returns 0`, `Just text data...` and `Retrieve a particular resource...`. Neither edited file has a CR byte.
- The three downloads are byte identical to the references (`cmp`): `index.html` 359 bytes, `gatsby.txt` 299452 bytes, `ocelot.jpg` 1186359 bytes. `file` reports `ocelot.jpg` as a 3658x2400 baseline JPEG.
- On the wire, in scratch: with `HOST` and `PORT` swapped for a local Python listener on `127.0.0.1:8099`, the three requests the client sent were exactly `GET /index.html HTTP/1.0\r\n\r\n`, `GET /gatsby.txt HTTP/1.0\r\n\r\n` and `GET /ocelot.jpg HTTP/1.0\r\n\r\n`.
- `valgrind --leak-check=full --show-leak-kinds=all --track-fds=yes` against the real server printed nothing and exited 0. Against a closed local port it printed `connect: Connection refused`, exited 1, and valgrind still reported no leak and no open fd, so the `freeaddrinfo` and `close` on that path ran. A host of `no-such-host.invalid` printed `getaddrinfo failed: Name or service not known` and exited 1.
- `Makefile` and `QUESTIONS.txt.bak` kept their original md5 and their 19:50 timestamps. The two `Edit`s on the C file replaced only the two stub bodies, so the `TODO` comments, `main` and `read_http_response` are untouched by construction.
- `make zip` produced `lab09-code.zip` with 4 files plus the directory entry: `Makefile`, `QUESTIONS.txt`, `QUESTIONS.txt.bak`, `simple_http_client.c`. Extracting it into a temp folder gave byte identical copies of all four, and `socrates` on the extracted `QUESTIONS.txt` printed `All quiz answers correct.` SHA256 `4198e7e02210a7f20c6daec9fc78beef45832a09a56b3963247fac7d5e0dcdb3`. The lab folder holds only the submission files, the zip and `test_cases/`.
- **Not yet verified:** the Gradescope upload, the remote autograder score (it must also reach `44.203.146.22` from its own network), group membership, attendance, the short-write branch of `write_http_request`, and a hostname that resolves to IPv6 (the lab's host is an IPv4 literal).
## Errors + fixes
==The server never says "your request was wrong" in a way the client program notices: a malformed request comes back as a normal HTML error page, `read_http_response` saves it as the file, and the program exits 0.==
### The starter fails at the first connect
- Problem: the untouched starter built and ran, but `make test` gave 0.0/1.0. Both stub functions return `-1`, so `main` returns 1 at the first `connect_to_server` and no file is ever created.
- Fix: implement `connect_to_server` and `write_http_request`, and flip the five quiz answers.
- Why: `main` checks each step for `-1` and stops, so the first stub decides the whole run. The test then has nothing to diff.
- Evidence: baseline `Total Score: 0.0/1.0`, then 1.0/1.0 after the edits.
### Request lines ending in `\n` instead of `\r\n` (reproduced on purpose, not in the submitted file)
- Problem: in a scratch copy I sent `GET /%s HTTP/1.0\n\n`. The run finished in under a second with exit 0, and `index.html`, `gatsby.txt` and `ocelot.jpg` were each 358 bytes of `<title>400 Bad Request</title>`.
- Fix: keep `\r\n` after the request line and after the blank line.
- Why: HTTP line endings are CRLF, the server rejects bare `\n` (Lecture 17 slide 18: "Watch out: HTTP line endings are `\r\n` in C"). The failure is quiet because `read_http_response` skips the status line and saves whatever body arrives, so a 400 page looks like a successful download. The exit code is not evidence of success here. The `diff` is.
- Evidence: three 358-byte files with a 400 title, exit 0.
### Missing leading slash (reproduced on purpose)
- Problem: with `"GET %s HTTP/1.0\r\n\r\n"` all three files were again 358-byte `400 Bad Request` pages and the exit code was 0.
- Fix: `"GET /%s ..."`. The lab slide says it directly: "Don't forget the leading `/` in the path".
- Why: the first token after `GET` is the resource path, and the server only accepts it starting with `/`. The `file` names in the array have no slash, so the client has to add it.
- Evidence: three `400 Bad Request` files, exit 0.
### Missing the closing blank line (reproduced on purpose)
- Problem: with only `GET /%s HTTP/1.0\r\n` the client hung. `index.html` ended up as a 353-byte `408 Request Timeout` page, `gatsby.txt` and `ocelot.jpg` were never created, and my `timeout 20` killed the run during the second request (exit 124).
- Fix: add the second `\r\n`.
- Why: an empty line is what ends the header block. Without it the server keeps waiting for more headers while the client sits in `fgets` waiting for the reply, so both sides wait on each other until the server's own timeout fires. I did not time how long that took.
- Evidence: the 353-byte 408 page, no `gatsby.txt`, exit 124.
### Writing `BUFSIZE` bytes instead of `strlen(buf)` (reproduced on purpose, and it passes)
- Problem: with `len = BUFSIZE` the program still downloaded all three files byte identical, exit 0. The lab tests cannot catch this mistake.
- Fix: write only the `len` bytes `snprintf` produced.
- Why: the 512 bytes sent are the request plus the stale contents of an uninitialized stack buffer. This server stops reading at the blank line and discards the rest, so it did not mind. A stricter server, or one that reused the connection, could misparse the leftover bytes. That second part is my inference and I did not test it.
- Evidence: `valgrind` on the mutated copy reports `Syscall param write(buf) points to uninitialised byte(s)` in `write_http_request`, exit 9. The correct version is clean.
### A mutation that "passed" because it never applied
- Problem: I scripted the three mutations above with `sed` and the first run printed identical, correct files for the no-blank-line and bare-`\n` variants, which would have suggested both mistakes are harmless. A `grep` of the mutated source showed line 64 unchanged.
- Fix: redo the replacements with a Python `str.replace` guarded by an `assert` that the old text exists, then `grep` the mutated line before running.
- Why: the escaping of `\\r\\n` through `bash -c` and `sed` is easy to get wrong, and a `sed` with no match exits 0. A "no failure observed" result proves nothing until the mutation is confirmed in the file.
- Evidence: after the fix the same two variants gave the 408 hang and the 400 pages above.
### `nc` is not installed in the container
- Problem: my probe for the raw server response, `printf ... | nc 44.203.146.22 80`, failed with `failed to run command 'nc'`.
- Fix: for raw HTTP in the container use `python3` sockets or bash's `/dev/tcp`. The `/dev/tcp` check (`echo > /dev/tcp/44.203.146.22/80`) is how I confirmed the server was reachable before testing.
- Why: the course image is minimal. The wire-format check above used a Python listener on localhost instead.
- Evidence: `NET_OK` from the `/dev/tcp` probe and the captured request lines in Results.
## Flashcards
#cards/csci4061
How does a TCP client know the server has finished sending, and what does the lab's `read` loop depend on?::`read()` returns 0 once the server has closed its end and everything buffered has been read. The loop ends on that 0, and it works because an HTTP/1.0 server closes after each response.
A downloader exits 0 and the file is 358 bytes of HTML with a `400` title. What happened and where do you look?::The request was malformed (bare `\n`, no leading `/`, or a missing `\r\n`) and the server answered with an error page, which the reader saved as the file. Exit status only reports socket errors, not HTTP status. Compare the file with the reference, or read the status line.
Which three things end an HTTP/1.0 request, and what happens if the last is missing?::`\r\n` after the request line, optional headers each ending in `\r\n`, and an empty `\r\n`. Without the empty line the server waits for more headers, the client waits for the reply, and the server eventually answers `408 Request Timeout`.
After `socket()` succeeds and `connect()` fails inside a helper that returns an fd, what must the helper release before returning `-1`?::`freeaddrinfo(result)` and `close(sock_fd)`. The caller only cleans up after later failures, so the helper has to close the fd itself.
Why can a bug like `write(sock_fd, buf, BUFSIZE)` instead of `strlen(buf)` pass every test?::The server stops reading at the blank line and drops the extra bytes, so the output is correct. The extra bytes are uninitialized stack memory, which valgrind reports. A passing test is not proof the bytes sent were right.
