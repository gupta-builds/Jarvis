---
type: class
class_kind: textbook
status: seed
created: 2026-11-09
updated: 2026-11-09
tags:
  - class
  - textbook
area:
next:
---
# Chapter - 14
**Source:**
**Read from:**
**Course role:**
## Chapter Summary
<!-- The chapter's one-sentence claim with exactly one ==highlight==, then a *Mechanism:* line. -->
## Key Concepts
<!-- Each concept defined in context, with its role and the condition that prevents misuse. -->
## Full Reading Notes
# 14.4
````
# Chapter - 14: Advanced I/O
## Chapter Summary
==I/O multiplexing allows a single process to monitor multiple file descriptors simultaneously, suspending execution until one or more descriptors become ready for nonblocking data transfer.==
*Mechanism:* Instead of committing to a blocking read or write on an individual descriptor or running a CPU-intensive nonblocking polling loop, a process registers a set of descriptors with the kernel via select, pselect, or poll (p. 501). The kernel blocks the calling process until an event occurs on at least one monitored descriptor, a specified timeout expires, or an unblocked signal is caught, returning an exact status mask of ready descriptors so subsequent I/O operations execute without blocking (pp. 501–502).
## Key Concepts
- **I/O multiplexing**: Mechanism where a process builds a descriptor list and invokes a kernel function that blocks until at least one descriptor is ready for I/O (p. 501).
- **telnet**: Bidirectional network utility reading from terminal stdin and writing to a network socket, while concurrently reading from the socket and writing to terminal stdout (p. 500).
- **asynchronous I/O**: Notification model where the kernel delivers a signal (such as SIGPOLL or SIGIO) when a descriptor becomes ready for I/O (p. 501).
- **select**: BSD-derived system call monitoring three descriptor sets for readability, writability, and exceptions across a microsecond-resolution timeout (p. 502).
- **pselect**: POSIX.1 select variant using nanosecond-resolution timespec timeouts and an atomic signal mask installation parameter (p. 506).
- **poll**: System V-derived system call monitoring an array of struct pollfd structures for input, output, and error conditions across a millisecond timeout (p. 506).
- **struct timeval**: Time structure specifying duration in seconds (`tv_sec`) and microseconds (`tv_usec`) (p. 502).
- **struct timespec**: Time structure specifying duration in seconds (`tv_sec`) and nanoseconds (`tv_nsec`) (p. 506).
- **descriptor sets**: Fixed-size bit arrays of type **fd_set** representing collections of file descriptors monitored by select (p. 503).
- **FD_ZERO**: Macro or function clearing all descriptor bits in an fd_set to zero (p. 503).
- **FD_SET**: Macro or function setting the bit corresponding to a specific file descriptor in an fd_set (p. 503).
- **FD_CLR**: Macro or function clearing the bit corresponding to a specific file descriptor in an fd_set (p. 503).
- **FD_ISSET**: Macro or function testing whether the bit for a given descriptor is enabled in an fd_set (p. 503).
- **FD_SETSIZE**: System header constant specifying the maximum number of descriptors representable in an fd_set (p. 504).
- ==**maxfdp1**==: The first argument to select, defined as the highest file descriptor number across all tested sets plus 1, setting the upper bound for the kernel's bit-search loop (p. 504).
- **readfds**: Pointer to an fd_set indicating file descriptors monitored for readable data or EOF (p. 502, 506).
- **writefds**: Pointer to an fd_set indicating file descriptors monitored for nonblocking write space (p. 502).
- **exceptfds**: Pointer to an fd_set indicating file descriptors monitored for pending exceptional conditions like out-of-band data (p. 502).
- **struct pollfd**: Structure containing a monitored file descriptor (`fd`), requested event bitmask (`events`), and returned result bitmask (`revents`) (p. 507).
- **nfds_t**: Unsigned integer type defined by SUS specifying the element count of a struct pollfd array (p. 507).
- **POLLIN**: Event flag indicating regular or priority band data can be read without blocking, equivalent to POLLRDNORM | POLLRDBAND (p. 507).
- **POLLRDNORM**: Event flag indicating normal data can be read without blocking (p. 507).
- **POLLRDBAND**: Event flag indicating priority band data can be read without blocking (p. 507).
- **POLLPRI**: Event flag indicating high-priority data can be read without blocking (p. 507).
- **POLLOUT**: Event flag indicating normal data can be written without blocking (p. 507).
- **POLLWRNORM**: Event flag identical in semantics to POLLOUT (p. 507).
- **POLLWRBAND**: Event flag indicating priority band data can be written without blocking (p. 507).
- **POLLERR**: Kernel-returned revents flag indicating an error has occurred on the device or stream (p. 507).
- **POLLHUP**: Kernel-returned revents flag indicating a hangup or disconnection occurred on the descriptor (p. 507).
- **POLLNVAL**: Kernel-returned revents flag indicating the specified descriptor does not reference an open file (p. 507).
- **INFTIM**: Historical constant defined in `<stropts.h>` representing an infinite timeout (-1) for poll (p. 508).
## Full Reading Notes
### 14.4 I/O Multiplexing
A standard I/O loop copying between one input descriptor and one output descriptor operates with blocking I/O (p. 500):
```c
while ((n = read(STDIN_FILENO, buf, BUFSIZ)) > 0)
    if (write(STDOUT_FILENO, buf, n) != n)
        err_sys("write error");
````

When an application must read from two independent descriptors simultaneously, a blocking read on either descriptor causes the process to freeze, preventing it from servicing the other descriptor even if data arrives on it (p. 500). _The telnet Problem:_ The `telnet(1)` utility reads user keystrokes from standard input (terminal) and writes them across a network connection to `telnetd`, while concurrently reading server output from the network connection and writing it to standard output (terminal screen) (Figure 14.13, p. 500). Because neither input source has predictable timing, committing to a blocking `read()` on stdin blocks the display of incoming network output, and blocking on the network socket freezes terminal input processing (p. 500). _Four Evaluated Alternatives:_

1. _Two Processes via fork (Figure 14.14):_ Splitting execution into parent and child processes (as in System V `cu(1)`) lets each process block on one input stream (p. 500). However, lifecycle termination becomes complex: if the child receives EOF from the network disconnection, it terminates and notifies the parent via `SIGCHLD`; if the parent terminates when the user enters terminal EOF, the parent must explicitly signal the child (e.g., via `SIGUSR1`) to terminate it, introducing coordination bugs (pp. 500–501).
2. _Multiple Threads:_ Individual threads block independently in `read()` calls while progress continues on other threads (p. 501). However, synchronization overhead between threads can introduce race conditions and lock contention that outweigh design simplicity (p. 483, 501).
3. _Nonblocking Polling Loops:_ Setting descriptors to `O_NONBLOCK` allows issuing reads in a tight loop across both descriptors (p. 501). If data is unavailable, `read()` returns immediately with an error (`EWOULDBLOCK`/`EAGAIN`), but thousands of unproductive system calls waste CPU cycles on multi-user systems (p. 483, 501).
4. _Asynchronous I/O via Signals:_ The kernel is configured to deliver a signal (`SIGPOLL` in System V; `SIGIO` in BSD) when a descriptor becomes ready (p. 501). This approach suffers from two severe limitations: (a) portability is limited because System V `SIGPOLL` requires a STREAMS device, while BSD `SIGIO` works only on terminals and network sockets; (b) both systems use only one signal per process, so when multiple descriptors are monitored, the signal's arrival does not indicate which descriptor became ready, forcing the program to set all descriptors to nonblocking mode and poll each sequentially (p. 501). _The I/O Multiplexing Solution:_ The application builds a list of target file descriptors and passes it to a kernel function (`select`, `pselect`, or `poll`) that blocks until one or more descriptors become ready, waking the process and returning the ready set (p. 501). Historical lineage: `select` originated in 4.2BSD for all file descriptors (principally terminals and network sockets); `poll` was added in SVR3 for STREAMS devices and broadened in SVR4 to support any descriptor (pp. 501–502).

### 14.4.1 select and pselect Functions

_Function Prototype (`<sys/select.h>`):_

```
#include <sys/select.h>

int select(int maxfdp1, fd_set *restrict readfds,
           fd_set *restrict writefds, fd_set *restrict exceptfds,
           struct timeval *restrict tvptr);
```

Returns count of ready descriptors across all three sets, 0 on timeout, or -1 on error (p. 502). _Timeout Conditions (`tvptr`):_

1. `tvptr == NULL`: Wait forever. The kernel blocks indefinitely until one of the specified descriptors becomes ready or an unblocked signal is caught; if interrupted by a signal, `select` returns -1 with `errno` set to `EINTR` (p. 502).
2. `tvptr->tv_sec == 0 && tvptr->tv_usec == 0`: Do not wait at all. All descriptors are tested, and `select` returns immediately, providing a nonblocking poll of multiple descriptors (pp. 502–503).
3. `tvptr->tv_sec != 0 || tvptr->tv_usec != 0`: Wait the specified interval in seconds and microseconds. Returns when a descriptor becomes ready, or returns 0 when the timeout interval expires; if microsecond resolution is unsupported, the kernel rounds up to the system clock granularity; can also be interrupted by caught signals (p. 503). _timeval Modification Caveat:_ POSIX.1 allows implementations to modify `struct timeval`; Linux 3.2.0 updates `tvptr` with the unslept time remaining if `select` returns early, whereas FreeBSD 8.0, Mac OS X 10.6.8, and Solaris 10 leave it unchanged (p. 503). _Descriptor Sets (`fd_set`):_ Monitored conditions are grouped into three pointers: `readfds` (test for readability), `writefds` (test for writability), and `exceptfds` (test for exception conditions) (p. 503). An `fd_set` represents an internal bit vector containing one bit for each possible descriptor index (Figure 14.15, p. 503). _Manipulation Interfaces:_

```
#include <sys/select.h>

int FD_ISSET(int fd, fd_set *fdset);
void FD_CLR(int fd, fd_set *fdset);
void FD_SET(int fd, fd_set *fdset);
void FD_ZERO(fd_set *fdset);
```

`FD_ZERO` clears all bits in the set; `FD_SET` enables the bit for `fd`; `FD_CLR` clears the bit for `fd`; `FD_ISSET` returns nonzero if `fd` is present, or 0 otherwise (pp. 503–504). Any of the three descriptor set pointers can be `NULL` if that condition is unneeded; if all three are `NULL`, `select` functions as an accurate sub-second sleep timer (p. 504). _maxfdp1 Calculation:_ The first argument `maxfdp1` ("maximum file descriptor plus 1") specifies the highest descriptor number enabled across all three sets plus 1 (p. 504). Because file descriptors are 0-indexed, `maxfdp1` represents the total count of descriptor bits the kernel must examine starting at bit 0 (Figure 14.16, pp. 504–505). Setting `maxfdp1` prevents the kernel from wasting CPU cycles scanning thousands of unused bits up to `FD_SETSIZE` (typically 1024) (p. 504). _Return Values and Descriptor Modification:_

- `-1`: Error occurred (e.g., interrupted by caught signal); descriptor sets remain unmodified (p. 505).
- `0`: Timeout expired without any descriptor becoming ready; all descriptor sets are cleared to zero (p. 505).
- `> 0`: Number of ready descriptors across all three sets; the kernel modifies the `fd_set` structures in place so that only bits for ready descriptors remain set (p. 505). _Readiness Semantics:_
- A descriptor in `readfds` is ready if a read will not block, or if the connection has reached end-of-file (EOF). ==When a descriptor reaches end-of-file, select considers it readable, and a subsequent read() returns 0 rather than raising an exception condition.==
- A descriptor in `writefds` is ready if a write will not block (p. 502).
- A descriptor in `exceptfds` is ready if an exceptional condition is pending, such as out-of-band data arriving on a network socket (p. 502).
- Descriptor blocking mode does not affect `select`: calling `select` on a descriptor configured with `O_NONBLOCK` still causes `select` to block until the descriptor satisfies the requested condition (p. 506). _The pselect Function:_

```
#include <sys/select.h>

int pselect(int maxfdp1, fd_set *restrict readfds,
            fd_set *restrict writefds, fd_set *restrict exceptfds,
            const struct timespec *restrict tsptr,
            const sigset_t *restrict sigmask);
```

Returns count of ready descriptors, 0 on timeout, or -1 on error (p. 506). _Three Differences from select:_

1. Time resolution: Uses `struct timespec` (seconds and nanoseconds) rather than `struct timeval` (seconds and microseconds) (p. 506).
2. Const timeout: `tsptr` is declared `const`, guaranteeing the system will not modify the structure upon return (p. 506).
3. Atomic signal masking: If `sigmask` is non-null, `pselect` atomically installs the pointed-to signal mask upon entry and restores the prior process signal mask upon return, eliminating race conditions where a signal arriving immediately before blocking would be missed (p. 506).

### 14.4.2 poll Function

_Function Prototype (`<poll.h>`):_

```
#include <poll.h>

int poll(struct pollfd fdarray[], nfds_t nfds, int timeout);
```

Returns count of ready descriptors, 0 on timeout, or -1 on error (p. 506). _struct pollfd Data Structure:_ Instead of allocating three separate bitmasks, `poll` takes an array of `struct pollfd` elements where each element identifies one descriptor and its target conditions (pp. 506–507):

```
struct pollfd {
    int   fd;      /* file descriptor to check, or <0 to ignore */
    short events;  /* events of interest on fd */
    short revents; /* events that occurred on fd */
};
```

The caller sets `fd` and the `events` bitmask; the kernel populates `revents` upon return without altering `events` (p. 507). If `fd` is set to a negative value, `events` is ignored and `revents` is set to 0 upon return (p. 507). The array size is specified by `nfds` of type `nfds_t` (defined by SUS; historically `unsigned long` in SVR3 or `size_t` in SVR4 documentation) (p. 507). _Event Flags (Figure 14.17):_

- Readability: `POLLIN` (data other than high-priority can be read without blocking; equivalent to `POLLRDNORM | POLLRDBAND`), `POLLRDNORM` (normal data readable), `POLLRDBAND` (priority band data readable), `POLLPRI` (high-priority data readable) (p. 507).
- Writability: `POLLOUT` (normal data writable without blocking), `POLLWRNORM` (same as `POLLOUT`), `POLLWRBAND` (priority band data writable) (p. 507).
- Kernel-only status: `POLLERR` (device error), `POLLHUP` (device hangup), `POLLNVAL` (descriptor is not an open file); these three flags are returned in `revents` whenever they occur even if omitted from `events` (p. 507–508). _Timeout Values (Milliseconds):_
- `timeout == -1`: Wait forever until a descriptor becomes ready or a signal is caught (`errno == EINTR`; historically `INFTIM` in `<stropts.h>`) (p. 508).
- `timeout == 0`: Do not wait; tests all descriptors and returns immediately (p. 508).
- `timeout > 0`: Wait up to `timeout` milliseconds (p. 508). _EOF versus POLLHUP Distinction:_ When a process reaches EOF (e.g., user enters terminal EOF or writer closes a pipe), `POLLIN` is enabled so the caller can read the EOF indicator (`read()` returns 0); `POLLHUP` is NOT set (p. 508). Conversely, when a hardware connection drops (e.g., modem line hangup), `POLLHUP` is set in `revents`; while a hung-up descriptor cannot be written, remaining buffered input may still be read (p. 508). _Sidebar: Interruptibility of select and poll:_ When 4.2BSD introduced automatic restart of interrupted system calls (`SA_RESTART`), `select` was intentionally never restarted (p. 508). Most modern operating systems maintain this rule even when `SA_RESTART` is specified; under SVR4, however, specifying `SA_RESTART` caused `select` and `poll` to be restarted (p. 508). None of the four platforms covered in APUE (FreeBSD 8.0, Linux 3.2.0, Mac OS X 10.6.8, Solaris 10) restart `select` or `poll` when a signal is caught; portable software must use `signal_intr()` to handle signal interruptions explicitly (pp. 508–509).

## Worked Example

The `telnet` two-input problem is solved by using `select()` to multiplex standard input (`STDIN_FILENO`) and a network socket descriptor (`sockfd`) within a single process without busy-polling or child-process signaling:

```
#include "apue.h"
#include <sys/select.h>

void telnet_loop(int sockfd) {
    int maxfd;
    fd_set rset;
    char buf[MAXLINE];
    int n, nread;

    for (;;) {
        FD_ZERO(&rset);
        FD_SET(STDIN_FILENO, &rset);
        FD_SET(sockfd, &rset);
        maxfd = (STDIN_FILENO > sockfd ? STDIN_FILENO : sockfd) + 1;

        if ((n = select(maxfd, &rset, NULL, NULL, NULL)) < 0) {
            if (errno == EINTR)
                continue;
            err_sys("select error");
        }

        if (FD_ISSET(STDIN_FILENO, &rset)) {
            if ((nread = read(STDIN_FILENO, buf, MAXLINE)) < 0)
                err_sys("read error from stdin");
            else if (nread == 0)
                break; /* user typed EOF; terminate session */
            if (writen(sockfd, buf, nread) != nread)
                err_sys("writen error to socket");
        }

        if (FD_ISSET(sockfd, &rset)) {
            if ((nread = read(sockfd, buf, MAXLINE)) < 0)
                err_sys("read error from socket");
            else if (nread == 0) {
                err_msg("connection closed by server");
                break; /* server disconnected; EOF reached */
            }
            if (writen(STDOUT_FILENO, buf, nread) != nread)
                err_sys("writen error to stdout");
        }
    }
}
```

_Walkthrough:_

1. Descriptor sets are cleared via `FD_ZERO` and populated with both `STDIN_FILENO` and `sockfd` via `FD_SET` on every iteration, because `select()` modifies the sets in place to reflect only ready descriptors (pp. 503–504).
2. The `maxfd` argument is calculated as the larger descriptor number plus 1, bounding the kernel's descriptor scan range (p. 504).
3. The infinite timeout (`NULL`) suspends the process until data arrives from either the user's keyboard or the remote `telnetd` server (p. 502).
4. ==Testing ready bits with FD_ISSET guarantees that calling read() on either the terminal or the socket consumes available bytes immediately without blocking the processing of the companion stream.==
5. If the server terminates, the socket descriptor signals readability and `read()` returns 0, cleanly breaking the loop without requiring `SIGCHLD` handlers or interprocess signal coordination (p. 500, 506).

## Connections

_Lecture Framing (Lec10):_

- Lec10 emphasized `poll()` as the modern POSIX standard for descriptor monitoring, explicitly presenting it alongside `select()` as "interrupt-style I/O" and cautioning that the name `poll()` is a historical misnomer because the system call does not execute busy-polling (Lec10 slides 20–21).
- The professor skipped `select()` and `pselect()` implementation mechanics entirely in lecture, stating that `select()` is legacy and focusing class time exclusively on `poll()` and `struct pollfd` setup (Lec10 transcript).
- _Slide-Only Concepts:_ Setting `pollfd.fd = -1` to dynamically disable an entry in a persistent `pollfd` array without reallocating or compacting memory; monitoring an array of pipes to process worker child results in completion order rather than sequential order; explicitly registering `POLLIN | POLLHUP` on pipes (Lec10 slides 22–27).
- _Book-Only Concepts:_ The `telnet` two-way I/O architecture analysis; `select` and `pselect` signatures and `fd_set` bitmask macros; `maxfdp1` calculation mechanics; timespec nanosecond resolution; Linux updating `tvptr` with unslept time; STREAMS priority band flags (`POLLRDNORM`, `POLLRDBAND`, `POLLPRI`, `POLLWRBAND`); and the `SA_RESTART` interruptibility sidebar (pp. 500–509).
- _Other-Chapter Pull-In:_ Chapter 10 (Signals) for `EINTR`, `SA_RESTART`, `signal_intr()`, and atomic signal masks in `pselect()`; Chapter 11 (Threads) for the multi-threading concurrency alternative; Chapter 15 (Pipes & IPC) for pipe communication channels monitored by `poll()`; Chapter 4 (Files and Directories) for `struct timespec`.
- Textbook: ==(pending next chapter)==.

## Open Questions

- [ ] Verify on a Linux test system whether `select()` updates the `struct timeval` argument with the remaining unslept time after being interrupted by a signal handler.
- [ ] Write a test program with `poll()` monitoring a pipe read descriptor to confirm that closing the write end triggers both `POLLIN` and `POLLHUP` when unread data remains in the pipe buffer.
- [ ] ==Demonstrate that setting struct pollfd's fd field to -1 causes the kernel to ignore the entry and return 0 in revents without throwing POLLNVAL.==
- [ ] Measure the latency difference between multiplexing 100 pipes using `select()` with `maxfdp1` versus `poll()` with a contiguous array of `struct pollfd`.

## Flashcards

Why does standard I/O in the telnet client fail when implemented as a single-threaded blocking read loop?::Blocking on standard input prevents the process from reading incoming network data from the socket, while blocking on the socket prevents the process from reading user keystrokes from the terminal. #cards/csci4061 What is the purpose of the `maxfdp1` parameter in the `select()` system call?::It specifies the highest file descriptor index among all monitored sets plus 1, telling the kernel the exact number of bits to scan from descriptor 0 and avoiding scanning unused bits up to FD_SETSIZE. #cards/csci4061 How does `select()` treat a file descriptor that has reached the end-of-file (EOF)?::==The descriptor is marked as readable in readfds, and a subsequent read() call returns 0 bytes to indicate EOF rather than raising an exceptional condition.== #cards/csci4061 What three capabilities distinguish `pselect()` from standard `select()`?::pselect uses nanosecond-precision struct timespec, guarantees the timeout structure is not modified by declaring it const, and accepts an atomic signal mask to prevent lost signals before blocking. #cards/csci4061 How do the `events` and `revents` fields in `struct pollfd` operate during a call to `poll()`?::The caller sets events as a bitmask of conditions to monitor (which the kernel leaves unchanged), and the kernel populates revents with the conditions that actually occurred. #cards/csci4061 What is the semantic difference between `POLLIN` and `POLLHUP` when reading from a pipe or terminal?::POLLIN indicates data or an EOF indication (read returning 0) is ready to consume, whereas POLLHUP indicates the remote peer or writer disconnected the device/pipe channel. #cards/csci4061 Why must descriptor sets (`fd_set`) be re-initialized with `FD_ZERO` and `FD_SET` before every call to `select()`?::select modifies the passed fd_set structures in place, clearing all bits except those corresponding to descriptors that are ready for I/O. #cards/csci4061 How can an application instruct `poll()` to ignore a specific element in a `struct pollfd` array without reallocating memory?::Set the pollfd element's fd field to a negative value (such as -1), which causes poll to ignore the events field and set revents to 0. #cards/csci4061
# 14.8
````
### 14.8 Memory-Mapped I/O
==Memory-mapped I/O maps a disk file into a process's virtual memory address space so that fetching bytes from the memory buffer directly reads the file and storing into the buffer automatically writes to the file, bypassing read() and write() system calls.==
Historical Background: Memory-mapped I/O was implemented in 4.1BSD via `vread` and `vwrite`, removed in 4.2BSD, standardized by Version 4 of the Single UNIX Specification, and is required on all POSIX-conforming operating systems (p. 525).
*Function Prototype (`<sys/mman.h>`):*
```c
#include <sys/mman.h>

void *mmap(void *addr, size_t len, int prot, int flag, int fd, off_t off);
````

Returns: starting address of mapped region if OK, **MAP_FAILED** on error (p. 525). _Argument Definitions:_

- `addr`: Preferred starting address. Setting `addr = 0` (or `NULL`) allows the kernel to select the address, providing maximum portability (p. 525).
- `len`: Count of bytes to map into memory (p. 525).
- `prot`: Protection bitmask of mapped region (Figure 14.25): **PROT_READ** (readable), **PROT_WRITE** (writable), **PROT_EXEC** (executable), **PROT_NONE** (inaccessible) (p. 525). `prot` cannot permit more access than the open mode of `fd` (e.g., `PROT_WRITE` fails if `fd` was opened `O_RDONLY`) (p. 525).
- `flag`: Attributes of mapped memory (pp. 526–527):
    - **MAP_SHARED**: Store operations modify the mapped file (equivalent to `write()`). Either `MAP_SHARED` or `MAP_PRIVATE` must be specified, but not both (p. 526).
    - **MAP_PRIVATE**: Store operations create a private copy-on-write copy of the mapped region; successive references access the private copy, leaving the original file unmodified (pp. 526–527).
    - **MAP_FIXED**: Enforces that return value equals `addr`. Discouraged as non-portable; if omitted and `addr != 0`, `addr` is used only as a hint (p. 526).
- `fd`: Open file descriptor of the regular file or device to be mapped (p. 525).
- `off`: Starting byte offset within the file where mapping begins (p. 525). _Search for Specific Features in Section 14.8:_
- **shm_open**: not in book (Section 14.8 covers only file-backed `mmap`; POSIX real-time shared memory objects via `shm_open` are noted on p. 572 as omitted from the text).
- **shm_unlink**: not in book.
- ftruncate-on-shm: not in book (book uses **ftruncate** only on regular disk files in Figure 14.27 to size output files prior to `mmap`).
- **MAP_ANONYMOUS**: not in book in Section 14.8 (Section 15.9 p. 578 notes Linux defines `MAP_ANONYMOUS` as an alias for `MAP_ANON`, but Section 14.8 omits it). _Memory Layout (Figure 14.26):_ The kernel maps file contents into virtual memory between the heap and the stack:

```
High Address  ┌─────────────────────────────────────────┐
              │ Stack (grows downward)                  │
              ├─────────────────────────────────────────┤
              │ Memory-mapped portion of file (len)     │ ◄── start addr (mmap return)
              ├─────────────────────────────────────────┤
              │ Heap (grows upward)                     │
              ├─────────────────────────────────────────┤
              │ Uninitialized data (bss)                │
              ├─────────────────────────────────────────┤
              │ Initialized data                        │
              ├─────────────────────────────────────────┤
Low Address   │ Text                                    │
              └─────────────────────────────────────────┘
```

_Page Alignment and the 12-Byte File Example:_ Both `off` and `addr` (if `MAP_FIXED`) are usually required to be integral multiples of the system virtual memory page size, queried via `sysconf(_SC_PAGESIZE)` (p. 527). If a file size is 12 bytes and page size is 512 bytes, the kernel maps a 512-byte page where the first 12 bytes reflect the file and the final 500 bytes are zeroed (p. 527). Modifying the trailing 500 bytes in memory succeeds without generating an error, but changes to those bytes are not written back to the disk file; `mmap` cannot be used to append data to a file without first growing the file using `ftruncate` (p. 527, 530). _Signal Generation (SIGSEGV vs. SIGBUS):_

- **SIGSEGV**: Generated when a process attempts to access an address not mapped to its virtual address space or stores into a region mapped as read-only (`PROT_READ`) (p. 527).
- **SIGBUS**: Generated when accessing an address inside the mapped virtual memory range that is invalid at access time (e.g., accessing bytes corresponding to a portion of a file that was truncated by another process after mapping, or accessing a newly mapped output file whose size was not pre-allocated with `ftruncate`) (p. 527, 530). _Process Inheritance across fork and exec:_
- `fork()`: Memory-mapped regions are inherited by child processes because they form part of the parent's virtual address space (p. 527).
- `exec()`: Memory-mapped regions are not inherited across `exec()` because the address space is completely replaced by the new binary image (p. 527). _mprotect Function Prototype (`<sys/mman.h>`):_

```
int mprotect(void *addr, size_t len, int prot);
```

Returns: 0 on success, -1 on error (p. 527). Changes access permissions (`prot`) on an existing mapping; `addr` must be page-aligned (p. 527). _msync Function Prototype (`<sys/mman.h>`):_

```
int msync(void *addr, size_t len, int flags);
```

Returns: 0 on success, -1 on error (p. 528). Flushes modified dirty pages in a `MAP_SHARED` mapping to the backing disk file in whole page units (p. 528). _msync Flags (`<sys/mman.h>`):_

- **MS_ASYNC**: Schedules dirty pages to be written asynchronously by kernel daemons and returns immediately (p. 528).
- **MS_SYNC**: Blocks calling process until physical disk writes complete before returning (either `MS_ASYNC` or `MS_SYNC` must be specified) (p. 528).
- **MS_INVALIDATE**: Optional flag instructing operating system to discard cached pages that are out of sync with storage (p. 528). _munmap Function Prototype (`<sys/mman.h>`):_

```
int munmap(void *addr, size_t len);
```

Returns: 0 on success, -1 on error (p. 528). Unmaps memory region from `addr` across `len` bytes (p. 528). Closing the file descriptor (`close(fd)`) does not unmap memory; mapped regions remain intact until `munmap()` or process termination (p. 528). `munmap()` does not write `MAP_SHARED` memory back to disk; file synchronization is managed asynchronously by the kernel's virtual memory subsystem or explicitly by `msync()` (p. 528). _Figure 14.27 Code (File Copy Using Memory-Mapped I/O):_

```
#include "apue.h"
#include <fcntl.h>
#include <sys/mman.h>

#define COPYINCR (1024*1024*1024) /* 1 GB */

int main(int argc, char *argv[]) {
    int fdin, fdout;
    void *src, *dst;
    size_t copysz;
    struct stat sbuf;
    off_t fsz = 0;

    if (argc != 3)
        err_quit("usage: %s <fromfile> <tofile>", argv);

    if ((fdin = open(argv, O_RDONLY)) < 0)
        err_sys("can’t open %s for reading", argv);

    if ((fdout = open(argv, O_RDWR | O_CREAT | O_TRUNC, FILE_MODE)) < 0)
        err_sys("can’t creat %s for writing", argv);

    if (fstat(fdin, &sbuf) < 0) /* need size of input file */
        err_sys("fstat error");

    if (ftruncate(fdout, sbuf.st_size) < 0) /* set output file size */
        err_sys("ftruncate error");

    while (fsz < sbuf.st_size) {
        if ((sbuf.st_size - fsz) > COPYINCR)
            copysz = COPYINCR;
        else
            copysz = sbuf.st_size - fsz;

        if ((src = mmap(0, copysz, PROT_READ, MAP_SHARED, fdin, fsz)) == MAP_FAILED)
            err_sys("mmap error for input");
        if ((dst = mmap(0, copysz, PROT_READ | PROT_WRITE,
          MAP_SHARED, fdout, fsz)) == MAP_FAILED)
            err_sys("mmap error for output");

        memcpy(dst, src, copysz); /* does the file copy */
        munmap(src, copysz);
        munmap(dst, copysz);
        fsz += copysz;
    }
    exit(0);
}
```

_Performance Benchmark Comparison (Figure 14.28):_ Copying a 300 MB file comparing `read`/`write` (8,192-byte buffer) versus `mmap`/`memcpy` without sync (p. 530):

- Linux 3.2.0 (Intel x86): `read`/`write` takes 0.01s user, 0.54s sys, 5.67s clock; `mmap`/`memcpy` takes 0.08s user, 0.65s sys, 22.54s clock. Clock time is ~4x slower for `mmap`/`memcpy` due to page fault overhead (one fault per page read, one per page written) and random page writeout by disk daemons (pp. 530–531).
- Solaris 10 (SPARC): `read`/`write` takes 0.29s user, 10.60s sys, 43.67s clock; `mmap`/`memcpy` takes 1.89s user, 8.56s sys, 38.42s clock. `mmap`/`memcpy` achieves faster clock time on Solaris (p. 530). _Limitations:_ Cannot map special devices like terminals or network interfaces; changing file size post-mapping risks `SIGBUS`; benefits include simplified pointer-based algorithms such as frame buffer manipulation (p. 531). NEW KEY CONCEPTS
- **memory-mapped I/O**: Mechanism mapping disk files into virtual address spaces so memory accesses replace read/write system calls (p. 525).
- **mmap**: System call creating memory-mapped regions in a process's virtual address space (p. 525).
- **MAP_FAILED**: Error return pointer value `((void *) -1)` from `mmap` (p. 525).
- **PROT_READ**: Protection flag allowing read access to a memory-mapped region (p. 525).
- **PROT_WRITE**: Protection flag allowing write access to a memory-mapped region (p. 525).
- **PROT_EXEC**: Protection flag allowing instruction execution in a memory-mapped region (p. 525).
- **PROT_NONE**: Protection flag forbidding all access to a memory-mapped region (p. 525).
- **MAP_SHARED**: Flag directing writes to update the underlying mapped file (p. 526).
- **MAP_PRIVATE**: Flag causing store operations to create private copy-on-write copies (pp. 526–527).
- **MAP_FIXED**: Flag forcing mapped address to match specified `addr` parameter (p. 526).
- **mprotect**: System call modifying protection permissions on existing memory mappings (p. 527).
- **msync**: System call synchronizing dirty memory-mapped pages with backing storage (p. 528).
- **MS_ASYNC**: Flag scheduling asynchronous writes of dirty pages to storage (p. 528).
- **MS_SYNC**: Flag blocking until dirty page writes to storage complete (p. 528).
- **MS_INVALIDATE**: Flag discarding memory-mapped cached pages out of sync with storage (p. 528).
- **munmap**: System call unmapping virtual memory regions without writing private copies to disk (p. 528).
- **memcpy**: Standard C memory copying function used to transfer bytes directly between mapped buffers (p. 530).
- **shm_open**: POSIX real-time call creating or opening named shared memory objects (not in book; Lec09/Lec10).
- **shm_unlink**: POSIX call marking named shared memory objects for deferred deletion (not in book; Lec09/Lec10).
- **MAP_ANONYMOUS**: Linux-specific `mmap` flag allocating zero-filled memory unbacked by files (not in book in 14.8; Lec09/Lec10). CONNECTIONS ADDITION
- _Lecture vs. Book Coverage:_ Lec09 and Lec10 emphasized shared memory setup over file copying, presenting anonymous `mmap` (`MAP_ANONYMOUS` with `fd = -1`) as the primary pattern for related processes on Linux and POSIX named shared memory (`shm_open` + `ftruncate` + `mmap` with descriptor `fd` and `MAP_SHARED`) for unrelated processes; Lec10 stressed that `shm_unlink` must be called once by any process to remove the global name while deferred cleanup keeps existing mappings intact until every process calls `munmap`, none of which is covered in APUE Section 14.8 (which focuses strictly on regular disk file I/O).
- _Cross-Chapter Link:_ APUE Section 14.8 provides the foundational file-mapping primitives (`mmap`, `munmap`, `msync`) referenced in Section 15.9 (Shared Memory), where memory mapping is repurposed for interprocess communication using `/dev/zero` or `MAP_ANON` to create zero-initialized shared memory without disk file storage. NEW FLASHCARDS Why does closing a file descriptor with close(fd) immediately after calling mmap() leave the memory mapping accessible?::mmap() attaches the underlying file and its virtual memory pages directly into the process's address space; the mapping is independent of the descriptor and persists until explicitly released with munmap() or process termination. #cards/csci4061 What distinct conditions cause the kernel to deliver SIGSEGV versus SIGBUS during memory-mapped I/O?::SIGSEGV occurs when attempting to access unmapped memory or storing into a region specified as PROT_READ, whereas SIGBUS occurs when accessing valid mapped virtual addresses that correspond to nonexistent physical file bytes (such as accessing past the end of a file truncated by another process). #cards/csci4061 Why must ftruncate() be called before mapping and copying data into an output file with mmap()?::mmap() cannot automatically extend a file; mapping an empty output file creates a zero-length file map where the first store operation accesses memory beyond physical file bounds, triggering SIGBUS unless ftruncate() pre-allocates file size. #cards/csci4061 How do msync() flags MS_ASYNC and MS_SYNC differ in their synchronization guarantees?::MS_ASYNC schedules modified memory pages for writing by kernel daemons and returns immediately, while MS_SYNC blocks execution until all dirty pages are physically written to backing disk storage. #cards/csci4061 How do memory mappings established by mmap() behave across fork() versus exec() system calls?::Memory-mapped regions are inherited by child processes across fork() because address space memory is duplicated, but are destroyed and unmapped across exec() because the entire process memory image is replaced. #cards/csci4061
## Worked Example
<!-- Source-grounded examples, numbers, or code traces, and why each matters. -->
## Connections
<!-- Links to the real lecture week, Textbook Map entry, and concept notes. -->
## Open Questions
<!-- Unverified or missing material as - [ ] tasks. -->
## Flashcards
<!-- Three to eight cards on #cards/<course-slug> testing mechanism, condition, and contrast. -->
