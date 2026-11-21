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
  - "[[20_Progress/Degree/CSCI 4061/Projects/Project - 3 Code Explaination|Project - 3 Code Explaination]]"
  - "[[20_Progress/Degree/CSCI 4061/Projects/Project - 3 Assignment|Project - 3 Assignment]]"
  - "[[20_Progress/Degree/CSCI 4061/Projects/Project - 3 Quiz|Project - 3 Quiz]]"
  - "[[20_Progress/Degree/CSCI 4061/Projects/Project - 2 Implementation|Project - 2 Implementation]]"
  - "[[20_Progress/Degree/CSCI 4061/Labs/Lab - 7|Lab - 7]]"
  - "[[20_Progress/Degree/CSCI 4061/Labs/Lab - 8|Lab - 8]]"
  - "[[20_Progress/Degree/CSCI 4061/Labs/Lab - 9|Lab - 9]]"
  - "[[20_Progress/Degree/CSCI 4061/Labs/Lab - 10|Lab - 10]]"
next: "Apply the seven files to proj3-code byte for byte with the Edit tool, region by region, then run make clean clean-tests and diff -u against proj3-original. Expected hunks: http.c 1, http_server.c 2, connection_queue.h 1, connection_queue.c 1, http_server.py 2, http_handler.py 3, connection_queue.py 3."
---
# Project - 3 Implementation
This note is the solution to Project 3 explained line by line: the final text of every changed region in the seven EDIT files, and for each line what it does, why it has that form, what it checks, reports and releases, and which source backs it. It is the companion of [[20_Progress/Degree/CSCI 4061/Projects/Project - 3 Code Explaination|Project - 3 Code Explaination]], which holds the map and the 13 resolved decisions this note follows. Someone who reads only this note can rebuild the seven files and defend each line in the oral exam.
> [!NOTE]
> Everything here was built and run on 2026-11-20 in a throwaway copy at `/tmp/p3` inside the course container (Ubuntu 22.04, gcc 11.4.0, Python 3.10.12, user root). (measured) `proj3-code` and `proj3-original` hash identically before and after: SHA-256 `414e8ad9b7feb92116d633a8c3aae70f45013ddb6f6a14ac85594380ed6fb855` over 99 files each (sorted `find . -type f`, relative paths, `sha256sum | sha256sum`). The scratch copy, every scratch file and every server process are gone. Nothing was written to the project folders. Items marked (measured) were run in this session.
## How to read the citations
Citation forms are the ones defined in [[20_Progress/Degree/CSCI 4061/Projects/Project - 3 Code Explaination|Project - 3 Code Explaination]]. Short forms used below:
- *Lec N s k:* slide k (PDF page) of `LecNN.pdf`. *Nov 5 L171-194:* lines of a transcript file. *Lab N file L a-b:* the solved lab code under `csci4061-fa26/Labs/`.
- *APUE p. N:* printed page of Advanced Programming in the UNIX Environment, 3rd ed. *D1-D13:* the numbered resolved decisions of the map. *Dev n:* a deviation listed in the Deviations section.
- *(measured):* a command I ran this session; the command and its output are in the verification log.
## What was built and in what order
==The solution was built in the map's order, with a test after each step, and each step is a state of the scratch copy you can rebuild.== The map's step numbers refer to its table "The solution is a fixed order of work".

| Step | Files touched | Map step | Test run after it | Result |
|---|---|---|---|---|
| 1 | `part1/http.c`, `part1/http_server.c` as a sequential server (final file minus queue, mask and workers, calling `serve_client` straight from the accept loop) | 1, 2 | `make test testnum=1 port_base=9001` | 5.0/5.0 (measured) |
| 2 | `part1/connection_queue.h`, `part1/connection_queue.c`, then the final `part1/http_server.c` | 3, 4 | `make clean` (header edit), `make`, `make test port_base=9011`, then test 2 twenty-five times | 15.0/15.0, 25 of 25 (measured) |
| 3 | `part2/connection_queue.py` | 5 | a direct unit script: fill to capacity, block, drain after shutdown, wake blocked callers | all seven checks true (measured) |
| 4 | `part2/http_handler.py`, `part2/http_server.py` | 6, 7 | `make -C part2 test port_base=9411`, then test 2 twenty-five times | 10.0/10.0, 25 of 25 (measured) |
| 5 | error-handling ledger pass (checks, reports, releases) | 8 | TSAN under load, valgrind, early disconnect, SIGINT idle and serving | clean (measured) |
- Step 1 detail: the sequential variant differs from the final `http_server.c` in exactly one place of logic. Its accept loop body is `serve_client(client_fd);` where the final one calls `connection_queue_enqueue`. It has no `connection_queue_t`, no mask change, no `pthread_create`. The original queue stubs still linked, which proves Task 1 does not depend on the queue.
- The first run of the final Part 1 on `port_base=9001` failed test 1 after step 1 had just used 9001. (measured) The same build on `port_base=9011` passed 15.0/15.0. I did not capture the bind message, so the cause is my inference (the linger period of the previous run, see Assignment "Port Reservation Issues"). Always give each run a fresh base.
## Edit surface and how to apply the solution byte for byte
==Seven files change, every hunk lies in a region the map allows, and the only additions outside the stub bodies are the ones listed as deviations.== (measured) `diff -rq proj3-original /tmp/p3` after `make clean clean-tests` listed exactly these seven files and nothing else.

| File | Regions that change (original line numbers) | Lines after | `diff -u` hunks | Dev |
|---|---|---|---|---|
| `part1/http.c` | insert after line 30 (defines, `write_all`); body of `read_http_request` (lines 32-33); body of `write_http_response` (lines 37-38) | 167 | 1 | 1, 2, 3 |
| `part1/http_server.c` | line 19 (flag type); insert after line 24 (defines, three static functions); lines 33-34 (uncomment); line 36 `return 0;` | 217 | 2 | 4, 5, 6 |
| `part1/connection_queue.h` | line 18 (the TODO) | 65 | 1 | none |
| `part1/connection_queue.c` | the five bodies (lines 7-8, 12-13, 17-18, 22-23, 27-28) | 156 | 1 | 7, 8 |
| `part2/http_server.py` | insert after line 17 (worker); line 30 (the TODO) | 88 | 2 | 9, 10 |
| `part2/http_handler.py` | new line 1 `import pathlib`; line 6 token; lines 17 and 25 (the bodies) | 57 | 3 | 11 |
| `part2/connection_queue.py` | line 18 (the TODO); bodies at lines 29, 40, 46 | 64 | 3 | none |
- *Method:* open each original in the container or on the host, replace one region at a time with the Edit tool, never an editor with format-on-save. If an editor must be used, choose Save without Formatting (Ctrl+K S) because clang-format 19 rewrites untouched starter lines when no style file exists (map, Edit surface).
- *Bytes:* LF line endings, no trailing whitespace, one final newline. (measured) All seven finished files have 0 carriage-return bytes, 0 lines with trailing whitespace, and end in byte `0a`.
- *Before every diff:* `make clean clean-tests` in both parts, because objects, binaries, `test_results/`, `downloaded_files/` and `__pycache__/` count as differences. After any header edit run `make clean` before `make`, because `http_server.o` lists no header (Makefile line 22).
- *Diff:* from `Projects`, `diff -rq proj3-original proj3-code` lists the seven files; `diff -u proj3-original/<file> proj3-code/<file>` gives the hunk counts in the table.
- *Part 2 tests:* always `make -C part2 test port_base=N`, never the top-level `make test` (its `py_port_base` is 3, map Makefiles section).
Checklist for the later application pass:
- [ ] Apply `connection_queue.h` first, then `make clean` before any build.
- [ ] Apply `connection_queue.c`, `http.c`, `http_server.c`; `make` prints no warning in either the normal or the TSAN build.
- [ ] `make test port_base=<fresh>` in `part1` shows 15.0/15.0; run test 2 repeatedly on fresh bases.
- [ ] Apply the three Python files; `make -C part2 test port_base=<fresh>` shows 10.0/10.0.
- [ ] `make clean clean-tests` in both parts; `diff -rq proj3-original proj3-code` lists seven files; hunk counts match the table.
- [ ] Re-run `setarch -R ./http_server_tsan` under load, then valgrind with `--track-fds=yes`, from the verification log.
## The seven EDIT files, line by line
==Each region below is given as its final text, then a table with one row per line or tight group of lines; line numbers are those of the finished file.== Starter lines that do not change are not repeated. The Python files and the C files follow the same ledger rules: check every call that can fail, report with a message that names the call, release what is held on every path out.
### part1/http.c
`read_http_request` and `write_http_response` are the two halves of one HTTP/1.0 exchange. They share only the `resource_name` string, and `http.h` fixes their prototypes (http.h lines 6-20). Lines 1-29 are the starter's and stay byte for byte (`BUFSIZE 512` at line 11 and `get_mime_type` at lines 13-29).
#### Region A: constants and the write loop (original: insert after line 30, new lines 31-49)
```c
// Must equal RESOURCE_NAME_SIZE in http_server.c: http.h has no size parameter
#define RESOURCE_NAME_SIZE 512
// Longest request (request line plus headers) we accept before giving up
#define MAX_REQUEST 8192

// Write all 'len' bytes of 'buf' to 'fd', looping over short writes
// Returns 0 on success or -1 on error
static int write_all(int fd, const char *buf, size_t len) {
    size_t total = 0;
    while (total < len) {
        ssize_t nwritten = write(fd, buf + total, len - total);
        if (nwritten == -1) {
            perror("write");
            return -1;
        }
        total += nwritten;
    }
    return 0;
}
```

| Line | What it does | Why this form and not another | Checks, reports, releases | Sources |
|---|---|---|---|---|
| 31-32 | `RESOURCE_NAME_SIZE 512`: the capacity the caller gives `resource_name` | `http.h` has no size parameter, so the size is an unwritten agreement between the two files (D2). A second name, not `BUFSIZE`, because `BUFSIZE` here means the chunk size for the file copy | Bounds the `memcpy` at line 92 | `http.h` L6-12; D2 |
| 33-34 | `MAX_REQUEST 8192`: size of the accumulating request buffer | 512 would refuse a request with many headers. curl sends 88 bytes and wget 139 (map, measured earlier), but a browser sends more and the Assignment tells you to test with one (Dev 2) | A longer request is an error at line 57, never an overflow | Assignment L321-323; D2 |
| 38 | `static int write_all(int fd, const char *buf, size_t len)` | `static` because it is private to this file and not in `http.h`. `const char *` because it only reads. `size_t len` matches `write`'s count. Returns 0 or -1 like the other two functions (Dev 1) | The one place every socket write goes through, so the short-count loop exists once | Lec04 s12; APUE p. 72 |
| 39 | `size_t total = 0`: bytes already written | `size_t`, so `total < len` compares unsigned with unsigned; no cast warning under `-Wall -Werror` | none | Part 1 Makefile L3 |
| 40 | `while (total < len)` | A `write` may take fewer bytes than asked. On a blocking socket a short count is possible when a signal interrupts a partly finished write. Loop until the total equals the count wanted | Ends only when everything is sent or an error returns | Lec04 s12; Lab 9 L70-79; Nov 17 L297-300; APUE p. 72 and p. 328 |
| 41 | `write(fd, buf + total, len - total)` into an `ssize_t` | Resume at the first unsent byte; `ssize_t` can hold -1 | none | Lec04 s9 |
| 42-45 | On -1: `perror("write")`, `return -1` | `perror` for a system call (errno is set). An `EPIPE` from a vanished client prints "write: Broken pipe", seen in the verification log | Nothing held at this point, so nothing to release | Project 1 Assignment L122-128; Lab 4 deck s3 |
| 46 | `total += nwritten` | `nwritten` is not -1 here, so adding it to a `size_t` is safe | none | none |
| 48 | `return 0` | Whole buffer sent | none | none |
#### Region B: `read_http_request` body (original lines 32-33, new lines 52-102)
```c
    char request[MAX_REQUEST];
    size_t total = 0;
    char *blank_line = NULL;
    // A request may arrive in several reads, so keep going until the blank line
    while (blank_line == NULL) {
        if (total == sizeof(request) - 1) {
            fprintf(stderr, "read_http_request: request longer than %d bytes\n", MAX_REQUEST - 1);
            return -1;
        }
        ssize_t nread = read(fd, request + total, sizeof(request) - 1 - total);
        if (nread == -1) {
            perror("read");
            return -1;
        }
        if (nread == 0) {
            fprintf(stderr, "read_http_request: client closed before the request ended\n");
            return -1;
        }
        total += nread;
        request[total] = '\0';
        blank_line = strstr(request, "\r\n\r\n");
    }

    // Only the request line matters: METHOD SP RESOURCE SP HTTP/1.x
    *strstr(request, "\r\n") = '\0';
    char *method_end = strchr(request, ' ');
    char *resource_end = (method_end == NULL) ? NULL : strchr(method_end + 1, ' ');
    if (resource_end == NULL) {
        fprintf(stderr, "read_http_request: malformed request line \"%s\"\n", request);
        return -1;
    }
    if (method_end - request != 3 || strncmp(request, "GET", 3) != 0) {
        fprintf(stderr, "read_http_request: unsupported method in \"%s\"\n", request);
        return -1;
    }
    if (strncmp(resource_end + 1, "HTTP/1.", 7) != 0) {
        fprintf(stderr, "read_http_request: unsupported version in \"%s\"\n", request);
        return -1;
    }
    size_t resource_len = resource_end - (method_end + 1);
    if (resource_len == 0 || resource_len >= RESOURCE_NAME_SIZE) {
        fprintf(stderr, "read_http_request: resource name has bad length %zu\n", resource_len);
        return -1;
    }
    memcpy(resource_name, method_end + 1, resource_len);
    resource_name[resource_len] = '\0';
    if (resource_name[0] != '/' || strstr(resource_name, "..") != NULL) {
        fprintf(stderr, "read_http_request: refusing resource \"%s\"\n", resource_name);
        return -1;
    }
    return 0;
```

| Line | What it does | Why this form and not another | Checks, reports, releases | Sources |
|---|---|---|---|---|
| 52 | `char request[MAX_REQUEST]` on the stack | A local, never `static` or global, so two workers parsing at once cannot share it. No `malloc`, so there is nothing to free on any path out | Nothing to release | Lec12 s11-13; Lec13 s3-11 |
| 53-54 | `total` bytes held; `blank_line` is where the terminator was found, `NULL` until then | `size_t` for `total` (same reason as line 39) | none | none |
| 55-56 | Loop until `\r\n\r\n` is in the buffer | TCP is a byte stream with no message boundaries, so one `read` can return half a request. The request ends at the first `\r\n\r\n`, and the Assignment says to consume it all (D1) | The loop ends on a complete request or a return | APUE p. 591 and p. 71; Assignment L207-209; Lec04 s12; Lab 9 deck s3 |
| 57-60 | If the buffer is full without a terminator, report and return -1 | One byte stays reserved for the `'\0'` at line 71, hence `sizeof(request) - 1`. An over-long request is an error, never an overflow | Message names the function and the limit; nothing held | D2; Project 2 Oral Exam Drills L195-196 |
| 61 | `read(fd, request + total, sizeof(request) - 1 - total)` | Append after what is already there and ask for no more than the free space minus the terminator byte. Plain `read`, no `fdopen`, so no second descriptor or `FILE` to clean up (D1) | none | Lec04 s8; Lab 9 L90-125 shows the heavier route |
| 62-65 | -1: `perror("read")`, `return -1` | In Task 1 a SIGINT during this `read` gives `EINTR` (no `SA_RESTART`); the request is dropped and the main loop then ends. Workers block all signals so they never see it | Nothing held | Lab 3 deck s8; Nov 3 L865-894 |
| 66-69 | 0: report "client closed before the request ended", `return -1` | `read` returns 0 when the peer closed. Looping on 0 would spin forever | Nothing held | Lab 9 QUESTIONS; Lec08 s14; Nov 5 L80-83 |
| 70-71 | `total += nread`, then `request[total] = '\0'` | The terminator makes `strstr` safe on a buffer `read` did not NUL-terminate | none | none |
| 72 | `blank_line = strstr(request, "\r\n\r\n")` over the whole buffer | Searching everything accumulated, not just the newest chunk, because the four bytes can arrive split across two reads. (measured) Requests split before the final `\r\n`, inside `\r\n\r\n` and inside the method all gave the right 200 and body. A NUL byte in the request hides the rest from `strstr`, which ends as an over-long-request error | none | Lec17 s18; verification log E |
| 76 | `*strstr(request, "\r\n") = '\0'` cuts the buffer after the request line | Safe: line 72 proved a `\r\n\r\n` exists, so the first `\r\n` exists and `strstr` cannot return `NULL`. Cutting avoids `strtok`, which keeps hidden static state, modifies its input and is unsafe across threads | none | Quiz Q7; Lec03 s5; Lec06 s15; Sep 24 L507-531; APUE p. 442-443 |
| 77-78 | `method_end` is the first space; `resource_end` the second, or `NULL` if there is no first | Plain pointer scanning with `strchr`: the format is fixed (`Method SP Request-URI SP HTTP-Version`) so no tokenizer is needed. The ternary avoids passing `NULL + 1` to `strchr` | none | RFC 1945 5.1; Quiz Q4 |
| 79-82 | No second space: report the line, `return -1` | A malformed line is a request-level error, not a reason to stop the server | Nothing held; the caller closes the socket | Project 1 Assignment L132-134 |
| 83-86 | Method must be exactly `GET` | `method_end - request != 3` rejects `GETX` and `GE`; `strncmp` of 3 then compares the letters. Other methods are return -1 with a message (D3) | Nothing held | Assignment L194; D3 |
| 87-90 | Version must start with `HTTP/1.` | curl and wget send `HTTP/1.1` (map, measured earlier) even though the reply says 1.0, so accept any `1.x` | Nothing held | RFC 1945 5.1; Code Explaination Environment facts |
| 91-95 | `resource_len` is the gap between the spaces; zero or at least 512 is rejected | `>=` leaves room for the `'\0'` in `resource_name`. This check, not the 8192 buffer, is what keeps `memcpy` inside the caller's 512 bytes (D2) | Nothing held | `http.h` L6-12; APUE p. 159 |
| 96-97 | `memcpy` the resource, then terminate it | `memcpy` with the measured length, not `strcpy`, because the source sits inside a longer string | Writes at most 512 bytes into `resource_name` | D2 |
| 98-101 | Resource must start with `/` and contain no `..` | Stops `GET /../../etc/passwd` reaching `snprintf`. Any `..` is refused, which also refuses a file named like `a..b`; a stricter segment-by-segment check was not worth the code (Dev 3). (measured) That request got "Empty reply from server" and the log line `refusing resource` | Nothing held | D3 |
| 102 | `return 0` | `resource_name` holds only the resource, for example `/quote.txt` | none | `http.h` L6-12 |
#### Region C: `write_http_response` body (original lines 37-38, new lines 106-166)
```c
    // A missing file, or a path that is not a regular file, is a 404
    struct stat sb;
    int missing = 0;
    if (stat(resource_path, &sb) == -1) {
        if (errno != ENOENT) {
            perror("stat");
            return -1;
        }
        missing = 1;
    } else if (!S_ISREG(sb.st_mode)) {
        missing = 1;
    }
    if (missing) {
        const char *not_found = "HTTP/1.0 404 Not Found\r\nContent-Length: 0\r\n\r\n";
        return write_all(fd, not_found, strlen(not_found));
    }

    const char *file_extension = strrchr(resource_path, '.');
    const char *content_type = NULL;
    if (file_extension != NULL) {
        content_type = get_mime_type(file_extension);
    }
    if (content_type == NULL) {
        content_type = "application/octet-stream";
    }
    char header[BUFSIZE];
    int header_len = snprintf(header, sizeof(header),
                              "HTTP/1.0 200 OK\r\nContent-Type: %s\r\nContent-Length: %ld\r\n\r\n",
                              content_type, (long) sb.st_size);
    if (header_len < 0 || (size_t) header_len >= sizeof(header)) {
        fprintf(stderr, "write_http_response: header does not fit in buffer\n");
        return -1;
    }

    // Open before sending anything so a failure never leaves a half-sent 200
    int file_fd = open(resource_path, O_RDONLY);
    if (file_fd == -1) {
        perror("open");
        return -1;
    }

    int status = 0;
    if (write_all(fd, header, header_len) == -1) {
        status = -1;
    }
    char buf[BUFSIZE];
    ssize_t nread = 0;
    while (status == 0 && (nread = read(file_fd, buf, sizeof(buf))) > 0) {
        if (write_all(fd, buf, nread) == -1) {
            status = -1;
        }
    }
    if (status == 0 && nread == -1) {
        perror("read");
        status = -1;
    }
    if (close(file_fd) == -1) {
        perror("close");
        status = -1;
    }
    return status;
```

| Line | What it does | Why this form and not another | Checks, reports, releases | Sources |
|---|---|---|---|---|
| 107-108 | `struct stat sb` and a `missing` flag | One flag so the 404 is written in one place for both causes (missing, not a regular file) | none | Lec06 s34; Lec07 s7 |
| 109-114 | `stat` fails: only `ENOENT` is a 404; any other errno is `perror("stat")` and -1 | The Assignment names `ENOENT` as the 404 case. Anything else (permission, `ENOTDIR`) is a server-side failure, so no 404 is sent and the caller closes the socket (D3) | Nothing held | Assignment L276; D3; APUE p. 14-16 |
| 115-117 | `stat` worked but `!S_ISREG`: also a 404 | `GET /` stats the directory `server_files/`, which `open` would accept and `read` would then fail on with `EISDIR`. Treating it as missing avoids a half-sent 200 | none | APUE p. 95-96; D3 |
| 118-121 | 404: send exactly `HTTP/1.0 404 Not Found\r\nContent-Length: 0\r\n\r\n` and return `write_all`'s result | `Content-Length: 0` is required on a 404 (Quiz Q8); no body so test 1 prints only the status line. `strlen` here is fine because it is a string literal. A handled 404 returns 0 and prints nothing (Quiz Q15) | `write_all` reports its own failure | Assignment L235-243 and L270; Nov 5 L992-999; RFC 1945 6.1 |
| 123-130 | Content type: extension from the last `.`, looked up, with a default | `strrchr` finds the last dot; `get_mime_type` dereferences its argument, so it must never get `NULL` (line 125 guards it). An unlisted or missing extension gets `application/octet-stream`, RFC 1945's default for an unknown type (D3) | none | Starter L13-29; RFC 1945 7.2.1; Nov 5 L898-904 |
| 131-134 | Build the header with `snprintf` into `char header[BUFSIZE]` | `st_size` is an `off_t`, so print with `%ld` and cast to `long`; without the cast `-Wformat` under `-Werror` fails. `sizeof(header)`, not 512, so the bound follows the array | The result is checked on the next line | APUE p. 94 and p. 159; Lab 9 L63-68 |
| 135-138 | Negative or at least the buffer size means truncation: report, `return -1` | `snprintf` returns the length it wanted to write, so `>=` detects truncation; the cast silences the signed/unsigned compare | Nothing held yet | APUE p. 159; Lab 9 L65 |
| 141-145 | `open(resource_path, O_RDONLY)`, checked | Done before any byte is sent so a failure here leaves no half-sent 200. This is the call `concurrent_open.so` intercepts: exactly one `open` per request, so each worker counts once at the barrier. (measured) five clients passed together, four were held | -1: `perror("open")`, `return -1`; nothing to close yet | `concurrent_open.c` L76-97; Lec04 s7 |
| 147-150 | `status` starts 0; send the header with `write_all` | A header failure (client gone, `EPIPE`) is recorded, not returned at once, because `file_fd` is open and must be closed | A failure is already reported by `write_all`; `file_fd` is released at line 162 | Lab 4 deck s3; D6 |
| 151-152 | `buf[BUFSIZE]` and `nread = 0` | 512-byte chunks, the lecture's and Assignment's size (Dev: the map allowed 4096 too). `nread` starts 0 so the check at line 158 is defined even if the loop never runs | none | Assignment L278; Lec06 s22 |
| 153-157 | Read a chunk, send exactly `nread` bytes, repeat while `status` is 0 and `read` returns above 0 | `nread` bytes, never `strlen`: the JPEG, PNG, PDF and MP3 bodies contain zero bytes. `write_all` loops over short counts. The body is the file's exact bytes, no `\r\n` conversion | A write failure sets `status` and stops the loop | Lec04 s13; Lab 9 L134-146; Nov 5 L853-866; Quiz Q5 |
| 158-161 | After the loop, `nread == -1` with `status` still 0 means the file `read` failed | `status == 0` first so a socket failure is not reported twice. The status line is already sent, so the only choice is to stop and return -1 | `perror("read")` | Lab 9 L142-146 |
| 162-165 | `close(file_fd)` checked | A failed `close` is reported and recorded but does not hide an earlier failure, because it only ever sets `status` to -1 | `perror("close")` | Lab 9 L148-151; Project 2 Oral Exam Drills L199 |
| 166 | `return status` | 0 only if header, every chunk and the close all worked | none | `http.h` L14-20 |
### part1/http_server.c
The starter gives a flag, a handler, a pool size and an argument check. Everything that touches a socket, a signal mask or a thread is added here. Lines 1-18, 20-24 and 28-31 of the starter stay byte for byte (the includes, `N_THREADS 5`, `serve_dir`, `handle_sigint`, the usage check).
#### Region A: the flag type (original line 19, new line 19)
```c
volatile sig_atomic_t keep_going = 1;
```

| Line | What it does | Why this form and not another | Checks, reports, releases | Sources |
|---|---|---|---|---|
| 19 | `keep_going` becomes `volatile sig_atomic_t` | The handler writes it and the accept loop reads it. `sig_atomic_t` is the one type C promises a handler can write safely; `volatile` makes the loop re-read it. The starter's plain `int` works only by luck, as the Lab 3 deck says (D10) | none | Lab 3 deck s9; APUE p. 361; D10 |
#### Region B: constants and three static functions (original: insert after line 24, new lines 26-81)
```c
// Must equal RESOURCE_NAME_SIZE in http.c: http.h has no size parameter
#define RESOURCE_NAME_SIZE 512
#define PATH_SIZE 1024
#define LISTEN_BACKLOG 5

// Serve one request on 'client_fd', then close it. A failed request is reported
// and abandoned; it never stops the server.
static void serve_client(int client_fd) {
    char resource_name[RESOURCE_NAME_SIZE];
    char path[PATH_SIZE];
    if (read_http_request(client_fd, resource_name) == -1) {
        fprintf(stderr, "could not read request from client\n");
    } else {
        int len = snprintf(path, sizeof(path), "%s%s", serve_dir, resource_name);
        if (len < 0 || (size_t) len >= sizeof(path)) {
            fprintf(stderr, "path for resource \"%s\" does not fit in buffer\n", resource_name);
        } else if (write_http_response(client_fd, path) == -1) {
            fprintf(stderr, "could not send response for \"%s\"\n", path);
        }
    }
    if (close(client_fd) == -1) {
        perror("close");
    }
}

// Worker thread: serve connections until the queue is shut down and drained
static void *worker(void *arg) {
    connection_queue_t *queue = (connection_queue_t *) arg;
    int client_fd;
    while ((client_fd = connection_queue_dequeue(queue)) != -1) {
        serve_client(client_fd);
    }
    return NULL;
}

// Shut the queue down, join the first 'n_started' workers, then free the queue
// Returns 0 if every step worked or -1 if any failed (each failure is reported)
static int stop_workers(connection_queue_t *queue, pthread_t *threads, int n_started) {
    if (connection_queue_shutdown(queue) == -1) {
        // Workers may still be asleep in dequeue: joining would hang and
        // freeing would pull the queue out from under them
        return -1;
    }
    int status = 0;
    for (int i = 0; i < n_started; i++) {
        int ret = pthread_join(threads[i], NULL);
        if (ret != 0) {
            fprintf(stderr, "pthread_join: %s\n", strerror(ret));
            status = -1;
        }
    }
    if (connection_queue_free(queue) == -1) {
        status = -1;
    }
    return status;
}
```

| Line | What it does | Why this form and not another | Checks, reports, releases | Sources |
|---|---|---|---|---|
| 26-27 | `RESOURCE_NAME_SIZE 512`, same value as `http.c` | The two files must agree because `http.h` carries no size (D2). The array is 512 and `http.c` rejects any resource of 512 or more | The bound lives in `http.c` line 92 | `http.h` L6-12; D2 |
| 28 | `PATH_SIZE 1024` | `serve_dir` is an arbitrary argument, so the joined path gets a larger buffer; truncation is detected at line 40, not assumed away | none | D2 |
| 29 | `LISTEN_BACKLOG 5` | The lecture's value; a hint to the OS for how many pending clients to queue. (measured) 50 test-2 runs on this value (25 per part) never timed out, so it was not raised (Dev 4) | none | Lec17 s6; Nov 5 L143-165; `lecture17-code` L15 and L70-75; APUE p. 608 |
| 33 | `static void serve_client(int client_fd)` | One function for one request, used by the worker (and by the Task 1 accept loop). `static` and `void`: it handles every failure itself, so the caller has nothing to decide. The `client_fd` is owned by this function from entry to `close` | Closes `client_fd` on every path (line 46) | Assignment L150-153 |
| 34-35 | `resource_name` and `path` are locals | Never `static` or global: five workers run this at once and a shared buffer would be a race (TSAN would report it) | Stack, released on return | Lec12 s11-13; Lec13 s3-11 |
| 36-37 | `read_http_request` failing: print a line, skip the response | The detail is already printed inside `http.c`; this line says the request was abandoned. The server keeps running | Request-level failure, nothing held except `client_fd` | Project 1 Assignment L132-134; Quiz Q1 |
| 39 | `snprintf(path, sizeof(path), "%s%s", serve_dir, resource_name)` | `serve_dir` plus a name that starts with `/` gives `server_files/quote.txt`, the path `write_http_response` expects (not the bare name, Quiz Q6). `snprintf`, not `strcat`, so the bound is enforced | Result checked next line | Assignment L151; Quiz Q6; Lab 9 L63-68 |
| 40-41 | Negative or at least `sizeof(path)`: report and skip the response | Truncation would serve the wrong file, so it is an error | Names the resource | APUE p. 159 |
| 42-43 | `write_http_response` returning -1: print a line naming the path | The function already printed the cause; this names the request. Per-request failure, the loop continues | none | D13 |
| 46-48 | `close(client_fd)` checked, `perror("close")` | The lecture closes the connection after the reply. A failed `close` is reported but cannot be retried; the worker carries on | Releases the connection | `lecture17-code` L112-114; Nov 5 L697-702 |
| 51-59 | `worker`: dequeue, serve, repeat; return `NULL` when dequeue returns -1 | -1 means "shut down and empty" (D4), the normal end, so no message. `static void *` matches `pthread_create`'s `void *(*)(void *)`. It never calls `exit`: that would end the whole server | The queue already printed anything abnormal | Lec12 s21-22; Lec13 s22; APUE p. 388 |
| 53 | `(connection_queue_t *) arg` | The thread function gets one `void *`; the cast tells the compiler what it points to | none | Lec12 s24; Oct 20 L493-516 |
| 61-62 | Comment: what `stop_workers` does and returns | Shared by two paths: a failed `pthread_create` and the normal exit. One copy means the join order cannot drift | none | Project 2 Oral Exam Drills L169-170 |
| 63-68 | `connection_queue_shutdown` failing: return -1 at once | If the lock itself failed, workers may still be asleep in `dequeue`. Joining would hang and freeing would pull the queue from under them, so the function returns and the process exit reclaims everything (Dev 5) | The queue reported the failure | Assignment L437 |
| 69-76 | Join `n_started` workers; a failed join is reported and the loop keeps going | Join the threads that exist, not `N_THREADS`: after a failed create only the started ones have a valid `pthread_t`. Keep joining the rest as `threads_main.c` does | `strerror` because `pthread_join` returns an error number | Lab 8 `threads_main.c` L80-90; Lab 7 `sum_files.c` L84-90; Lec12 s24-25 |
| 77-79 | `connection_queue_free` only after every join | Free the queue only when no thread can touch it | The queue reports its own failures | Assignment L419-420; APUE p. 389 |
#### Region C: uncomment the arguments (original lines 33-34, new lines 90-91)
```c
    serve_dir = argv[1];
    const char *port = argv[2];
```

| Line | What it does | Why this form and not another | Checks, reports, releases | Sources |
|---|---|---|---|---|
| 90 | `serve_dir = argv[1]` | Assigned once, before the first thread exists, never again, so workers read it without a lock: a race needs a write | none | Lec13 s3-11 |
| 91 | `const char *port = argv[2]` | `getaddrinfo` takes the service as a string. The starter hid these two lines only because `-Werror` rejects an unused variable | none | Part 1 Makefile L3; Lec16 s13; Nov 3 L465-480 |
#### Region D: the body of `main` (original line 36 `return 0;`, new lines 93-216)
```c
    // No SA_RESTART: a SIGINT during accept() must make it fail with EINTR
    struct sigaction act = {0};
    act.sa_handler = handle_sigint;
    if (sigfillset(&act.sa_mask) == -1) {
        perror("sigfillset");
        return 1;
    }
    act.sa_flags = 0;
    if (sigaction(SIGINT, &act, NULL) == -1) {
        perror("sigaction");
        return 1;
    }
    // A client that disconnects mid-response must give write() EPIPE, not kill us
    act.sa_handler = SIG_IGN;
    if (sigaction(SIGPIPE, &act, NULL) == -1) {
        perror("sigaction");
        return 1;
    }

    connection_queue_t queue;
    if (connection_queue_init(&queue) == -1) {
        return 1;
    }

    struct addrinfo hints;
    memset(&hints, 0, sizeof(hints));
    hints.ai_family = AF_UNSPEC;
    hints.ai_socktype = SOCK_STREAM;
    hints.ai_flags = AI_PASSIVE;
    struct addrinfo *server;
    int ret = getaddrinfo(NULL, port, &hints, &server);
    if (ret != 0) {
        fprintf(stderr, "getaddrinfo failed: %s\n", gai_strerror(ret));
        connection_queue_free(&queue);
        return 1;
    }
    int sock_fd = socket(server->ai_family, server->ai_socktype, server->ai_protocol);
    if (sock_fd == -1) {
        perror("socket");
        freeaddrinfo(server);
        connection_queue_free(&queue);
        return 1;
    }
    if (bind(sock_fd, server->ai_addr, server->ai_addrlen) == -1) {
        perror("bind");
        freeaddrinfo(server);
        close(sock_fd);
        connection_queue_free(&queue);
        return 1;
    }
    freeaddrinfo(server);
    if (listen(sock_fd, LISTEN_BACKLOG) == -1) {
        perror("listen");
        close(sock_fd);
        connection_queue_free(&queue);
        return 1;
    }

    // Workers inherit the creator's mask, so block every signal around the
    // creates: only the main thread can then take SIGINT
    sigset_t all_signals;
    sigset_t old_mask;
    if (sigfillset(&all_signals) == -1) {
        perror("sigfillset");
        close(sock_fd);
        connection_queue_free(&queue);
        return 1;
    }
    if (sigprocmask(SIG_BLOCK, &all_signals, &old_mask) == -1) {
        perror("sigprocmask");
        close(sock_fd);
        connection_queue_free(&queue);
        return 1;
    }
    pthread_t threads[N_THREADS];
    int n_started = 0;
    for (int i = 0; i < N_THREADS; i++) {
        ret = pthread_create(&threads[i], NULL, worker, &queue);
        if (ret != 0) {
            fprintf(stderr, "pthread_create: %s\n", strerror(ret));
            if (sigprocmask(SIG_SETMASK, &old_mask, NULL) == -1) {
                perror("sigprocmask");
            }
            stop_workers(&queue, threads, n_started);
            close(sock_fd);
            return 1;
        }
        n_started++;
    }
    if (sigprocmask(SIG_SETMASK, &old_mask, NULL) == -1) {
        perror("sigprocmask");
        stop_workers(&queue, threads, n_started);
        close(sock_fd);
        return 1;
    }

    int exit_code = 0;
    while (keep_going) {
        int client_fd = accept(sock_fd, NULL, NULL);
        if (client_fd == -1) {
            if (errno != EINTR) {
                perror("accept");
                exit_code = 1;
            }
            break;
        }
        if (connection_queue_enqueue(&queue, client_fd) == -1) {
            fprintf(stderr, "could not queue client connection\n");
            if (close(client_fd) == -1) {
                perror("close");
            }
            exit_code = 1;
            break;
        }
    }

    if (stop_workers(&queue, threads, n_started) == -1) {
        exit_code = 1;
    }
    if (close(sock_fd) == -1) {
        perror("close");
        exit_code = 1;
    }
    return exit_code;
```

| Line | What it does | Why this form and not another | Checks, reports, releases | Sources |
|---|---|---|---|---|
| 93 | Comment: no `SA_RESTART` | This is the project's stated exception to the usual advice (Lec05 s38, Lab 3). With restart, `accept` is silently resumed and the server never leaves the loop | none | Assignment L177-179; `lecture17-code` L35 |
| 94 | `struct sigaction act = {0}` | Zeroed first so `sa_flags` and every other field start defined; the lecture's code leaves the struct uninitialized | none | Lab 3 L26; Lec06 s4-7 |
| 95 | `act.sa_handler = handle_sigint` | The given handler only sets the flag. No `printf`, `malloc` or `strtok` in a handler | none | Lec05 s26; Lec06 s15; Sep 24 L559-569 |
| 96-99 | `sigfillset(&act.sa_mask)` checked | Blocks every signal while the handler runs, so handlers cannot nest. `sigfillset` can return -1 and must be checked | `perror("sigfillset")`; nothing held yet | Lec05 s19 and s33; Lab 3 L28 |
| 100 | `act.sa_flags = 0` | Written out to make the absence of `SA_RESTART` visible; `accept` then fails with `EINTR` on SIGINT | none | Lab 3 deck s8; APUE p. 351 |
| 101-104 | `sigaction(SIGINT, ...)` checked | Installs the handler process-wide. (measured at the map stage) with `SA_RESTART` the server never exited, without it `accept` returned `EINTR` | `perror("sigaction")`, return 1; nothing held | Lec05 s31-32; APUE p. 349-351 |
| 105-110 | Reuse `act`, set `SIG_IGN`, install for `SIGPIPE`, checked | Without it a `write` to a client that vanished kills the whole process (map measured exit 141). With it `write` returns -1 with `EPIPE`, a request-level failure (D6). Dispositions are shared by all threads, so one call before the threads covers them | `perror("sigaction")`, return 1 | APUE p. 319, p. 537, p. 453; Lab 4 deck s3; Lec05 s32 and s34 |
| 112-115 | `connection_queue_init(&queue)` checked | The queue is a local in `main`, which outlives every worker because `main` joins them before returning. A queue init failure undoes its own partial work and prints its own message, so nothing is held | return 1 | Assignment L392; APUE p. 391-392; Lec12 s11 |
| 117-121 | `hints`: zeroed, `AF_UNSPEC`, `SOCK_STREAM`, `AI_PASSIVE` | `memset` because a stack struct is garbage. `AF_UNSPEC` lets the library pick IPv4 or IPv6 (the first result is IPv4 here). `SOCK_STREAM` is TCP. `AI_PASSIVE` with a `NULL` host asks for an address to bind and listen on | none | Lec16 s14-16 and s21; Nov 3 L575-583 and L853-864; Lec17 s5 |
| 123-128 | `getaddrinfo(NULL, port, &hints, &server)` checked | Returns 0 or an error code, not -1, and does not set `errno`, so `gai_strerror`, not `perror` | Message names the call; frees the queue; `server` is not allocated on failure | Lec16 s14; Nov 3 L510-524; APUE p. 600 |
| 129-135 | `socket(...)` checked | Arguments come straight from `server` (Lec16 s17). One descriptor for listening, a new one per client later | `perror("socket")`; `freeaddrinfo`, queue freed | `lecture17-code` L55-61; APUE p. 590-591 |
| 136-142 | `bind(...)` checked | Reserves the port. Fails with "Address already in use" if another process or the linger period holds it; the answer is another port | `perror("bind")`; releases `server`, `sock_fd`, queue | Assignment L161-169; Nov 3 L931-956; Quiz Q3 |
| 143 | `freeaddrinfo(server)` straight after `bind` | The list is not needed after `bind`; freeing here means it is released on every later path | Releases `server` | `lecture17-code` L69; Lab 9 deck s4 |
| 144-149 | `listen(sock_fd, LISTEN_BACKLOG)` checked | Turns the descriptor into a server socket. It waits for nothing | `perror("listen")`; closes `sock_fd`, frees queue | Lec17 s6; Nov 5 L143-165; APUE p. 608 |
| 151-154 | `sigset_t all_signals`, `old_mask` | A new thread inherits the creating thread's mask. Block everything first so every worker starts with everything blocked, and save the old mask with the third argument | none | Assignment L409-415; APUE p. 386; Lec05 s19-21; Sep 22 L786-806 |
| 155-160 | `sigfillset(&all_signals)` checked | Same reason as line 96 | `perror`; closes `sock_fd`, frees queue | Lec05 s19 |
| 161-166 | `sigprocmask(SIG_BLOCK, &all_signals, &old_mask)` checked | `SIG_BLOCK` unions the set into the mask, and the third argument saves the old one. `sigprocmask` is defined for single-threaded processes and the textbook says use `pthread_sigmask` in a threaded one. The Assignment and the exam list say `sigprocmask`, and (measured at the map stage) it worked with workers present (D8). It runs here before any worker exists | `perror`; closes `sock_fd`, frees queue | Assignment L413; APUE p. 346 and p. 453; D8 |
| 167-168 | `pthread_t threads[N_THREADS]`, `n_started = 0` | `n_started` counts workers that really exist, so a failure at worker `i` joins exactly `i`, never an uninitialized handle | none | Lab 7 `sum_files.c` L71-90; Lab 5 L45-51 |
| 169-181 | Create five workers with `pthread_create(&threads[i], NULL, worker, &queue)` | Five, because `concurrent_open.c` holds callers until five are inside `open`. `NULL` attributes (defaults). `&queue` is the one `void *` argument. Fewer workers would time test 2 out | See next row | `concurrent_open.c` L13; Lec12 s21-25; Quiz Q13 |
| 171-179 | A failed create: print `strerror`, restore the mask, `stop_workers` for the `n_started` already running, close the socket, return 1 | `pthread_create` returns an error number, so `strerror`. The workers are asleep in `dequeue`, so a join without shutdown would hang: shut down first. The mask is restored first so the process is in a sane state while cleaning. The `stop_workers` result is not tested because every failure inside it is already printed and the return value is 1 either way | Releases workers, queue, socket | Lec12 s24-25; Lab 7 deck s3; Lab 5 L45-51; `lecture12-code/pthreads_exercise_v2.c` L50-60 |
| 180 | `n_started++` after a successful create | Counted only after the check, so the count never includes a thread that was not created | none | none |
| 182-187 | `sigprocmask(SIG_SETMASK, &old_mask, NULL)` checked | `SIG_SETMASK` replaces the mask with the saved one, so only the main thread can take SIGINT from here. The workers keep the full mask they inherited. A failure here leaves the main thread unable to see SIGINT, so it is fatal | `perror`; `stop_workers`, closes `sock_fd`, return 1 | Assignment L415; APUE p. 346 |
| 189 | `int exit_code = 0` | One variable carries "did anything fail" to the single exit below, so a failed cleanup step is not lost | none | Project 2 Oral Exam Drills L199 |
| 190 | `while (keep_going)` | The flag the handler clears. A SIGINT that lands between this test and `accept` is lost; the course shows the same race for `pause` and has no fix for `accept` (map, Known conflicts 14) | none | Lec06 s18-21 |
| 191 | `accept(sock_fd, NULL, NULL)` | Returns a new descriptor per client. The address is not needed: writes to that descriptor reach the right client | none | Lec17 s7; Nov 5 L171-212 |
| 192-198 | -1 with `errno == EINTR` just breaks; any other -1 prints `perror("accept")`, sets `exit_code`, breaks | EINTR is the expected way out, not an error, and prints nothing (D9, Quiz Q2). Nov 3 L902-908 says `continue` would be more robust than `break`; both end the loop here because the handler already cleared the flag | `perror("accept")`; nothing held that cleanup does not release | `lecture17-code` L83-89; Nov 3 L861-908; Quiz Q2 |
| 199-206 | `connection_queue_enqueue` returning -1: print, close `client_fd`, set `exit_code`, break | `enqueue` fails only after shutdown or a lock error, both process-level. The descriptor is still ours (the queue undoes a failed insert) so it is closed here; closing is checked | Releases `client_fd` | Nov 5 L684-704; Lec13 s22 |
| 209-211 | `stop_workers` result folded into `exit_code` | Same function as the failed-create path: shutdown, join, free, in that order. Main blocks here until each worker finishes its current request, which is what lets an in-flight download complete | Releases workers, queue | Assignment L417-420; Oct 20 L633-638 |
| 212-215 | `close(sock_fd)` checked | Last, after the queue is gone. A failed close is reported but cannot undo the cleanup that already ran | `perror("close")`; releases `sock_fd` | `lecture17-code` L119-124 |
| 216 | `return exit_code` | 0 after a SIGINT with nothing failed, 1 otherwise. Nothing is printed on success (Quiz Q15) | none | Quiz Q15 |
### Remaining files: final text (line-by-line tables not yet written)
> [!WARNING]
> The final text of the other four files is below so the solution can be rebuilt, but their per-line tables, the error-handling ledger, the oral exam walkthrough and the lint run were not finished in the session that wrote this note (usage limit). The logic follows the map's ledgers and the same rules as the tables above: lock, wait in a `while` that also tests `shutdown`, signal the opposite condition while holding the lock, unlock on every path, `strerror` for `pthread_*`.
#### part1/connection_queue.h (original line 18, new lines 18-20)
```c
    pthread_mutex_t lock;
    pthread_cond_t not_full;
    pthread_cond_t not_empty;
```
#### part1/connection_queue.c (original: the five stub bodies; lines 1-5 and the five signatures stay)
```c
int connection_queue_init(connection_queue_t *queue) {
    queue->length = 0;
    queue->read_idx = 0;
    queue->write_idx = 0;
    queue->shutdown = 0;
    int ret;
    if ((ret = pthread_mutex_init(&queue->lock, NULL)) != 0) {
        fprintf(stderr, "pthread_mutex_init: %s\n", strerror(ret));
        return -1;
    }
    if ((ret = pthread_cond_init(&queue->not_full, NULL)) != 0) {
        fprintf(stderr, "pthread_cond_init: %s\n", strerror(ret));
        if ((ret = pthread_mutex_destroy(&queue->lock)) != 0) {
            fprintf(stderr, "pthread_mutex_destroy: %s\n", strerror(ret));
        }
        return -1;
    }
    if ((ret = pthread_cond_init(&queue->not_empty, NULL)) != 0) {
        fprintf(stderr, "pthread_cond_init: %s\n", strerror(ret));
        if ((ret = pthread_cond_destroy(&queue->not_full)) != 0) {
            fprintf(stderr, "pthread_cond_destroy: %s\n", strerror(ret));
        }
        if ((ret = pthread_mutex_destroy(&queue->lock)) != 0) {
            fprintf(stderr, "pthread_mutex_destroy: %s\n", strerror(ret));
        }
        return -1;
    }
    return 0;
}

int connection_queue_enqueue(connection_queue_t *queue, int connection_fd) {
    int ret;
    if ((ret = pthread_mutex_lock(&queue->lock)) != 0) {
        fprintf(stderr, "pthread_mutex_lock: %s\n", strerror(ret));
        return -1;
    }
    while (queue->length == CAPACITY && !queue->shutdown) {
        if ((ret = pthread_cond_wait(&queue->not_full, &queue->lock)) != 0) {
            fprintf(stderr, "pthread_cond_wait: %s\n", strerror(ret));
            if ((ret = pthread_mutex_unlock(&queue->lock)) != 0) {
                fprintf(stderr, "pthread_mutex_unlock: %s\n", strerror(ret));
            }
            return -1;
        }
    }
    if (queue->shutdown) {
        if ((ret = pthread_mutex_unlock(&queue->lock)) != 0) {
            fprintf(stderr, "pthread_mutex_unlock: %s\n", strerror(ret));
        }
        return -1;
    }
    queue->client_fds[queue->write_idx] = connection_fd;
    queue->write_idx = (queue->write_idx + 1) % CAPACITY;
    queue->length++;
    if ((ret = pthread_cond_signal(&queue->not_empty)) != 0) {
        fprintf(stderr, "pthread_cond_signal: %s\n", strerror(ret));
        // Undo the insert so the caller, who still owns the descriptor, can close it
        queue->write_idx = (queue->write_idx + CAPACITY - 1) % CAPACITY;
        queue->length--;
        if ((ret = pthread_mutex_unlock(&queue->lock)) != 0) {
            fprintf(stderr, "pthread_mutex_unlock: %s\n", strerror(ret));
        }
        return -1;
    }
    if ((ret = pthread_mutex_unlock(&queue->lock)) != 0) {
        fprintf(stderr, "pthread_mutex_unlock: %s\n", strerror(ret));
        return -1;
    }
    return 0;
}

int connection_queue_dequeue(connection_queue_t *queue) {
    int ret;
    if ((ret = pthread_mutex_lock(&queue->lock)) != 0) {
        fprintf(stderr, "pthread_mutex_lock: %s\n", strerror(ret));
        return -1;
    }
    while (queue->length == 0 && !queue->shutdown) {
        if ((ret = pthread_cond_wait(&queue->not_empty, &queue->lock)) != 0) {
            fprintf(stderr, "pthread_cond_wait: %s\n", strerror(ret));
            if ((ret = pthread_mutex_unlock(&queue->lock)) != 0) {
                fprintf(stderr, "pthread_mutex_unlock: %s\n", strerror(ret));
            }
            return -1;
        }
    }
    if (queue->length == 0) {
        // Shut down and nothing left to drain
        if ((ret = pthread_mutex_unlock(&queue->lock)) != 0) {
            fprintf(stderr, "pthread_mutex_unlock: %s\n", strerror(ret));
        }
        return -1;
    }
    int connection_fd = queue->client_fds[queue->read_idx];
    queue->read_idx = (queue->read_idx + 1) % CAPACITY;
    queue->length--;
    if ((ret = pthread_cond_signal(&queue->not_full)) != 0) {
        fprintf(stderr, "pthread_cond_signal: %s\n", strerror(ret));
        if ((ret = pthread_mutex_unlock(&queue->lock)) != 0) {
            fprintf(stderr, "pthread_mutex_unlock: %s\n", strerror(ret));
        }
        return -1;
    }
    if ((ret = pthread_mutex_unlock(&queue->lock)) != 0) {
        fprintf(stderr, "pthread_mutex_unlock: %s\n", strerror(ret));
        return -1;
    }
    return connection_fd;
}

int connection_queue_shutdown(connection_queue_t *queue) {
    int ret;
    int status = 0;
    if ((ret = pthread_mutex_lock(&queue->lock)) != 0) {
        fprintf(stderr, "pthread_mutex_lock: %s\n", strerror(ret));
        return -1;
    }
    queue->shutdown = 1;
    // Try both broadcasts even if the first fails, so no waiter is left asleep
    if ((ret = pthread_cond_broadcast(&queue->not_full)) != 0) {
        fprintf(stderr, "pthread_cond_broadcast: %s\n", strerror(ret));
        status = -1;
    }
    if ((ret = pthread_cond_broadcast(&queue->not_empty)) != 0) {
        fprintf(stderr, "pthread_cond_broadcast: %s\n", strerror(ret));
        status = -1;
    }
    if ((ret = pthread_mutex_unlock(&queue->lock)) != 0) {
        fprintf(stderr, "pthread_mutex_unlock: %s\n", strerror(ret));
        status = -1;
    }
    return status;
}

int connection_queue_free(connection_queue_t *queue) {
    int ret;
    int status = 0;
    if ((ret = pthread_cond_destroy(&queue->not_empty)) != 0) {
        fprintf(stderr, "pthread_cond_destroy: %s\n", strerror(ret));
        status = -1;
    }
    if ((ret = pthread_cond_destroy(&queue->not_full)) != 0) {
        fprintf(stderr, "pthread_cond_destroy: %s\n", strerror(ret));
        status = -1;
    }
    if ((ret = pthread_mutex_destroy(&queue->lock)) != 0) {
        fprintf(stderr, "pthread_mutex_destroy: %s\n", strerror(ret));
        status = -1;
    }
    return status;
}
```
#### part2/connection_queue.py (original line 18 and bodies at lines 29, 40, 46)
```python
        self.lock = threading.Lock()
        self.not_full = threading.Condition(lock=self.lock)
        self.not_empty = threading.Condition(lock=self.lock)
```
```python
        with self.lock:
            while len(self.elements) == self.capacity and not self.shutdown:
                self.not_full.wait()
            if self.shutdown:
                raise ShutDownException()
            self.elements.append(conn)
            self.not_empty.notify()
```
```python
        with self.lock:
            while len(self.elements) == 0 and not self.shutdown:
                self.not_empty.wait()
            if len(self.elements) == 0:
                raise ShutDownException()
            conn = self.elements.popleft()
            self.not_full.notify()
            return conn
```
```python
        with self.lock:
            self.shutdown = True
            self.not_full.notify_all()
            self.not_empty.notify_all()
```
#### part2/http_handler.py (new line 1, line 6 token, lines 17 and 25 bodies)
```python
import pathlib
```
```python
    ".jpg": "image/jpeg",
```
```python
    # A request may arrive in several recv calls, so keep going until the blank line
    request = b""
    while b"\r\n\r\n" not in request:
        data = conn.recv(4096)
        if not data:
            raise ConnectionError("client closed before the request ended")
        request += data
        if len(request) > 8192:
            raise ValueError("request longer than 8192 bytes")
    # Only the request line matters: METHOD SP RESOURCE SP HTTP/1.x
    request_line = request.split(b"\r\n", 1)[0].decode(errors="replace")
    parts = request_line.split(" ")
    if len(parts) != 3 or parts[0] != "GET" or not parts[2].startswith("HTTP/1."):
        raise ValueError(f"unsupported request line: {request_line!r}")
    resource = parts[1]
    if not resource.startswith("/") or ".." in resource:
        raise ValueError(f"refusing resource: {resource!r}")
    return resource
```
```python
    path = pathlib.Path(file_path)
    if not path.is_file():
        conn.sendall(b"HTTP/1.0 404 Not Found\r\nContent-Length: 0\r\n\r\n")
        return
    content_type = MIME_TYPES.get(path.suffix, "application/octet-stream")
    header = (
        "HTTP/1.0 200 OK\r\n"
        f"Content-Type: {content_type}\r\n"
        f"Content-Length: {path.stat().st_size}\r\n"
        "\r\n"
    )
    # Open before sending anything so a failure never leaves a half-sent 200
    with open(file_path, "rb") as f:
        conn.sendall(header.encode("utf-8"))
        conn.sendfile(f)
```
#### part2/http_server.py (worker inserted after line 17, body at line 30)
```python


# Worker thread: serve connections until the queue is shut down and drained
def worker(queue: ConnectionQueue, serve_dir: str) -> None:
    while True:
        try:
            conn = queue.dequeue()
        except ShutDownException:
            break
        # A failed request is reported and abandoned; it must not end the worker
        try:
            with conn:
                resource = http_handler.read_request(conn)
                http_handler.write_response(conn, serve_dir + resource)
        except (OSError, ValueError) as e:
            print(e, file=sys.stderr)
```
```python
    signal.signal(signal.SIGINT, handle_sigint)
    queue = ConnectionQueue(QUEUE_SIZE)
    try:
        server = socket.create_server(("", port))
    except OSError as e:
        print(e, file=sys.stderr)
        sys.exit(1)
    # A timeout lets accept() return so the loop can notice keep_going
    server.settimeout(1.0)

    workers = []
    exit_code = 0
    try:
        for _ in range(N_WORKERS):
            t = threading.Thread(target=worker, args=(queue, serve_dir))
            t.start()
            workers.append(t)
        while keep_going:
            try:
                conn, _ = server.accept()
            except TimeoutError:
                continue
            try:
                queue.enqueue(conn)
            except ShutDownException as e:
                print(e, file=sys.stderr)
                conn.close()
                exit_code = 1
                break
    except (OSError, RuntimeError) as e:
        # accept() failed, or a worker thread could not be started
        print(e, file=sys.stderr)
        exit_code = 1
    finally:
        queue.shut_down()
        for t in workers:
            t.join()
        server.close()
    sys.exit(exit_code)
```
## Verification log (summary)
- (measured) Part 1 test 1 on the sequential build: 5.0/5.0. Final Part 1 `make test port_base=9011`: 15.0/15.0. Test 2 repeated 25 times on fresh bases: 25 of 25 (115 s). Part 2 `make -C part2 test port_base=9411`: 10.0/10.0; test 2 repeated 25 times: 25 of 25.
- (measured) `setarch -R ./http_server_tsan` under 66 requests with 8 at a time, then SIGINT: exit 0, 0 bytes of output, 0 `WARNING` lines. `valgrind --track-fds=yes --leak-check=full`: exit 0, "FILE DESCRIPTORS: 3 open (3 std) at exit", 0 errors, 0 bytes in use at exit.
- (measured) Five concurrent curl under `LD_PRELOAD=./concurrent_open.so`: all five `cmp` identical, in both the C and Python servers. Four clients: all four time out (curl 28); a fifth releases the barrier; the four stale workers print `write: Broken pipe` (C) or `[Errno 32] Broken pipe` (Python) and the server lives and exits 0.
- (measured) 404 prints `Response Status Code: 404` and nothing else, for a missing file and for `/`. `cmp` identical for `Lec01.pdf` and `ocelot.jpg` in both servers. Requests split before the final `\r\n`, inside `\r\n\r\n` and inside the method all got a correct 200 in both servers. A request for `/../../etc/passwd` is refused with an empty reply and one log line.
- (measured) SIGINT while idle and while serving: exit status 0 and no output, in both servers (C 1 ms, Python about 510 ms because of the 1 second `accept` timeout). The in-flight download was intact, but the 1.7 MB file sat in kernel buffers, so this does not prove a worker draining mid-write.
- (measured) Clients that connect and close without sending print `client closed before the request ended` and the server keeps serving. Clients that send a request and drop produced no error, because loopback buffers held the whole file; `EPIPE` was only seen through the barrier experiment above.
- (measured) Python listener timeout 1.0, accepted socket timeout `None`, `socket.timeout is TimeoutError` True; the server holds 6 threads (1 main, 5 workers) after the dropped clients.
## Deviations from the Code Explaination note
- *Dev 1:* `http.c` gains a static `write_all` helper and `RESOURCE_NAME_SIZE`, inserted after line 30. The map allowed only the two stub bodies. Reason: header, 404 and every body chunk need the same short-write loop.
- *Dev 2:* request buffer is `MAX_REQUEST 8192`, not 512 (D2). Reason: browsers send longer headers. The 512 bound still applies to `resource_name`.
- *Dev 3:* the resource must start with `/` and contain no `..`; the map gave no rule. My choice, no course source.
- *Dev 4:* `LISTEN_BACKLOG 5` is a new define; kept at the lecture's value because test 2 never timed out in 50 runs.
- *Dev 5:* `serve_client` and `stop_workers` are new static functions in `http_server.c` (the map named only the worker). `stop_workers` returns without joining or freeing if shutdown itself fails.
- *Dev 6:* `sigaction` runs before `connection_queue_init`, following the map's ledger rather than its Task 2 step 1.
- *Dev 7:* `enqueue` undoes its insert if `pthread_cond_signal` fails, so the caller's `close` cannot double-close. `dequeue` does not undo, so one descriptor would leak on that failure. Neither branch was triggered, because a valid condition variable does not fail here.
- *Dev 8:* every `pthread_mutex_unlock` on an error path is checked and reported.
- *Dev 9:* the Python worker catches `(OSError, ValueError)`, not only `OSError`, because the handler raises `ValueError` for a bad request line.
- *Dev 10:* the Python `create_server` error goes to stderr; the lecture prints it to stdout.
- *Dev 11:* the Python handler uses a literal 4096 and 8192 rather than named constants.
- D9 is kept (`break` on `EINTR`); Nov 3 L902-908 prefers `continue`, with identical behavior here.
## Open items
- [ ] Write the per-line tables, with sources, for `connection_queue.h`, `connection_queue.c` and the three Python files, in the format used above.
- [ ] Write the completed error-handling ledger per function and the oral exam walkthrough (three questions per file).
- [ ] Run `node vault-lint.js --path "20_Progress/Degree/CSCI 4061/Projects/Project - 3 Implementation.md"` from the vault-lint folder and fix every warning; the course-lint hook was clean after each earlier write but the full lint was not run.
- [ ] Apply the seven files to `proj3-code` byte for byte when told to, then re-run the checklist.
- [ ] Not verified: `ruff format` on the Python files (no `ruff` in the container shell), clang-format on save, a real browser, Gradescope.
