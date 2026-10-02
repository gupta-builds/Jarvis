---
type: class
input_kind: book
status: seed
created: 2026-10-01
updated: 2026-10-02
area:
  - "[[CSCI 4061 Board]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]]"
tags:
  - "#class"
  - "#Textbook"
next: "Feed this chapter into Week - 4's Textbook integration section"
---
# Chapter - 15 — Interprocess Communication
**Source:** W. Richard Stevens and Stephen A. Rago, *Advanced Programming in the UNIX Environment*, 3rd ed. (Addison-Wesley, 2013), Chapter 15, §15.1-15.2 (pp. 533-540) and §15.9 (pp. 571-579).
**Read from:** `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\Textbook\Advanced Programming in the UNIX Environment, 3rd Edition.pdf`
**Course role:** Week 4 reading is §15.1-15.2 (Pipes); Week 5 extends the same chapter note with §15.9 (Shared Memory), per [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]]. §15.3-15.8 (popen/pclose, Coprocesses, FIFOs, XSI IPC, Message Queues, Semaphores) and §15.10-15.12 are **not** assigned reading for this course and are deliberately skipped - do not treat their absence as incomplete coverage. Lec08 (10/1) teaches §15.1-15.2's pipe mechanics directly, and separately previews FIFOs (book §15.5) a full chapter-and-a-half ahead of any assigned reading - flagged below rather than silently folded in.
## Chapter Summary
UNIX pipes and shared memory are both kernel-mediated channels for exchanging data between related processes, but they sit at opposite ends of a real tradeoff: ==a pipe moves bytes through the kernel one read/write call at a time with built-in flow control, while shared memory skips the kernel entirely after setup, trading that safety net for raw speed and the obligation to synchronize access yourself==.
*Mechanism:* `pipe()` hands back two file descriptors backed by one kernel buffer - write to one end, read from the other, and the kernel blocks a reader with nothing to read or a writer with a full buffer, so the processes naturally throttle each other. `shmget()`/`shmat()` instead map a raw region of memory directly into a process's address space; once attached, ordinary pointer reads and writes touch the shared bytes with zero system-call overhead per access, which is exactly why shared memory is the fastest IPC mechanism APUE covers, and exactly why it needs an external synchronization primitive (semaphores, record locks, or a mutex with `PTHREAD_PROCESS_SHARED`) that pipes get for free from the kernel's own buffering.
## Key Concepts
- **interprocess communication (IPC)**: Techniques letting independent processes exchange data and coordinate actions (p. 533).
- **half-duplex pipe**: A unidirectional kernel-buffered channel; data flows only from the write end to the read end (p. 534).
- **full-duplex pipe**: A pipe whose two ends can both read and write; POSIX.1 permits but does not require it (p. 534).
- **common ancestor limitation**: A pipe can only be shared between processes descended from the one that called `pipe()` before `fork()`-ing (p. 534-535).
- **pipe**: `int pipe(int fd[2]);` - creates an unnamed pipe; `fd[0]` is the read end, `fd[1]` is the write end (p. 535).
- **S_ISFIFO**: Macro testing `fstat()`'s `st_mode` to confirm a descriptor is a pipe (p. 535).
- **PIPE_BUF**: The kernel's per-pipe atomicity threshold (queried via `fpathconf`); writes at or under this size never interleave with another writer's bytes (p. 537).
- **SIGPIPE / EPIPE**: Writing to a pipe with no open read end raises `SIGPIPE` (default: terminate); if caught or ignored, `write()` instead returns -1 with `errno == EPIPE` (p. 537).
- **TELL_WAIT family**: The `TELL_PARENT`/`TELL_CHILD`/`WAIT_PARENT`/`WAIT_CHILD` synchronization API from Chapter 8/10, rebuilt here on two pipes instead of signals (p. 539-540).
- **shared memory**: A region of memory two or more processes map into their own address spaces, read/written with no kernel copy once attached (p. 571).
- **shmid_ds**: Kernel struct holding a shared-memory segment's size, owner, creator PID, attach count, and timestamps (p. 572).
- **shmget**: `int shmget(key_t key, size_t size, int flag);` - creates or references a segment, returns its ID (p. 572).
- **shmctl**: `int shmctl(int shmid, int cmd, struct shmid_ds *buf);` - `IPC_STAT`/`IPC_SET`/`IPC_RMID` plus Linux/Solaris-only `SHM_LOCK`/`SHM_UNLOCK` (p. 573).
- **shmat / shmdt**: Attach (`void *shmat(int shmid, const void *addr, int flag);`) and detach (`int shmdt(const void *addr);`) a segment from the calling process's address space (p. 574).
- **/dev/zero mapping**: Memory-mapping this character device with `mmap()` creates an anonymous, zero-filled shared region inherited across `fork()` (p. 576).
- **anonymous mapping (MAP_ANON)**: The same idea without even opening `/dev/zero` - pass `fd = -1` and `MAP_ANON|MAP_SHARED` directly to `mmap()` (p. 578).
## Full Reading Notes
### 15.1 Introduction
UNIX divides IPC into three families covered across three chapters: this chapter's "classical" mechanisms (pipes, FIFOs, message queues, semaphores, shared memory), network sockets (Chapter 16), and advanced descriptor-passing features (Chapter 17) (p. 533-534). Figure 15.1 cross-references which of ten classical IPC forms each of FreeBSD 8.0, Linux 3.2.0, Mac OS X 10.6.8, and Solaris 10 actually implements - the two forms that work *between* hosts, not just between processes on one machine, are sockets and the now-obsolescent STREAMS (p. 534). The Single UNIX Specification requires only half-duplex pipes but permits full-duplex ones; code written assuming half-duplex still works correctly on a full-duplex implementation, which is why portable code never assumes more than half-duplex (p. 533-534).
### 15.2 Pipes
Pipes are the oldest UNIX IPC mechanism and exist on every UNIX system, but carry two real limitations: historically half-duplex, and usable only between processes sharing a common ancestor that called `pipe()` before forking (p. 534). FIFOs (§15.5, not assigned this course) remove the second limitation; UNIX domain sockets remove both (p. 535).
```c
#include <unistd.h>
int pipe(int fd[2]);
                              Returns: 0 if OK, -1 on error
```
`fd[0]` opens for reading, `fd[1]` for writing; the output of `fd[1]` is the input of `fd[0]` (p. 535). `fstat()` on either end reports file type `FIFO`, testable with `S_ISFIFO(statbuf.st_mode)` - POSIX.1 leaves `st_size` undefined for pipes, but many systems store the bytes currently available for reading there anyway (nonportable) (p. 535).
A pipe inside a single process is useless on its own; the normal pattern is `pipe()` then `fork()`, giving parent and child each a copy of both ends (p. 535). For parent-to-child flow, the parent closes `fd[0]` and the child closes `fd[1]`; for child-to-parent flow, close the opposite pair (p. 536). Two rules govern a closed end: reading from a pipe whose write end is fully closed returns 0 (EOF) once buffered data is drained; writing to a pipe whose read end is fully closed raises `SIGPIPE`, and if that's caught or ignored, `write()` returns -1 with `errno == EPIPE` instead (p. 536-537). `PIPE_BUF` (queried via `pathconf`/`fpathconf`) is the write size under which the kernel guarantees no interleaving between concurrent writers to the same pipe - exceed it with multiple writers and bytes can genuinely interleave (p. 537).
```c
#include "apue.h"
int main(void) {
    int n;
    int fd[2];
    pid_t pid;
    char line[MAXLINE];
    if (pipe(fd) < 0)
        err_sys("pipe error");
    if ((pid = fork()) < 0) {
        err_sys("fork error");
    } else if (pid > 0) {       /* parent */
        close(fd[0]);
        write(fd[1], "hello world\n", 12);
    } else {                    /* child */
        close(fd[1]);
        n = read(fd[0], line, MAXLINE);
        write(STDOUT_FILENO, line, n);
    }
    exit(0);
}
```
A second worked example pipes a file's contents into the user's pager program without ever writing a temp file: open the file, create a pipe, fork, have the parent stream every line from the file into `fd[1]` with `fgets`/`write` then close `fd[1]` once EOF is reached (signaling the child), while the child closes `fd[1]`, `dup2`s `fd[0]` onto `STDIN_FILENO`, and `execl`s `$PAGER` (defaulting to `/bin/more`) - the pager reads its "stdin" never knowing it's really a pipe (p. 538-539). A third example reimplements the `TELL_WAIT`/`TELL_PARENT`/`TELL_CHILD`/`WAIT_PARENT`/`WAIT_CHILD` synchronization functions from Chapter 8/10 using two pipes (`pfd1` carries the parent's "go" byte to the child, `pfd2` carries the child's "go" byte back) instead of signals - the same rendezvous contract, a different mechanism underneath (p. 539-540).
### 15.9 Shared Memory
Shared memory is the fastest IPC form because, unlike every mechanism in this chapter so far, no data is copied through the kernel at all once the segment is attached - all a process does is read or write ordinary memory (p. 571). That speed is also the whole difficulty: nothing stops two processes from touching the region at the same instant, so access has to be synchronized externally - typically with semaphores, record locking, or a mutex placed inside the shared segment itself with the `PTHREAD_PROCESS_SHARED` attribute set (p. 571). Unlike a memory-mapped file, an XSI shared memory segment is **anonymous** - there is no backing file anywhere in the filesystem (p. 572).
```c
struct shmid_ds {
    struct ipc_perm  shm_perm;    /* owner/permissions */
    size_t           shm_segsz;   /* size of segment in bytes */
    pid_t            shm_lpid;    /* pid of last shmop() */
    pid_t            shm_cpid;    /* pid of creator */
    shmatt_t         shm_nattch;  /* number of current attaches */
    time_t           shm_atime;   /* last-attach time */
    time_t           shm_dtime;   /* last-detach time */
    time_t           shm_ctime;   /* last-change time */
    ...
};
```
`shmget(key, size, flag)` creates or references a segment and returns its ID; `size` gets rounded up to a page-size multiple, and a brand-new segment is zero-initialized (p. 572-573). `shmctl(shmid, cmd, buf)` is the catch-all control call: `IPC_STAT` reads the struct above into `buf`, `IPC_SET` writes ownership/permission fields back (owner or superuser only), `IPC_RMID` removes the segment's *identifier* immediately - but the actual storage isn't freed until every attached process detaches or exits, since `shm_nattch` has to reach zero first (p. 573).
```c
void *shmat(int shmid, const void *addr, int flag);
int   shmdt(const void *addr);
```
`shmat` attaches a segment into the caller's address space; passing `addr == 0` is the recommended, portable choice and lets the kernel pick the address itself (p. 574). `shmdt` detaches - note explicitly that detaching is **not** removing: the segment persists until a `shmctl(..., IPC_RMID, ...)` call actually deletes it (p. 574). A worked example (Fig. 15.31-15.32) prints the addresses of a global array, a `malloc`'d block, and a `shmat`'d segment in the same process to show where the kernel actually places shared memory relative to the heap and stack on a real 64-bit Linux box - the shared segment lands well below the stack, confirming it's a distinct mapped region, not stack or heap space (p. 574-576).
A second pair of examples builds shared memory on top of `mmap()` instead of the XSI calls: mapping the special device `/dev/zero` with `MAP_SHARED` creates a zero-filled region that `fork()` shares with a child exactly like XSI shared memory would, and the same program can drop the `/dev/zero` open/close entirely by passing `fd = -1` with `MAP_ANON|MAP_SHARED` instead - **anonymous mapping** (p. 576-578). Both variants reuse the Chapter 8/10 `TELL_WAIT` family (now pipe-based, per §15.2 above) to alternate turns between parent and child incrementing one shared `long` 1,000 times each, proving the writes are genuinely visible across the fork (p. 577-578). The chapter's closing contrast: for **related** processes, `/dev/zero`/anonymous `mmap` is simplest; for **unrelated** processes, the choice is XSI shared memory or a `mmap()`'d real file with `MAP_SHARED` (p. 578).
## Worked Example
The pager-via-pipe program (Fig. 15.6) ties `pipe()`, `fork()`, `dup2()`, and `exec()` into one real tool: (1) open the target file and create a pipe; (2) `fork()`; (3) the parent closes `fd[0]`, streams every line of the file into `fd[1]` via `fgets`/`write`, then closes `fd[1]` the moment it hits EOF - that close is what tells the child "no more data is coming"; (4) the child closes `fd[1]`, `dup2(fd[0], STDIN_FILENO)`, closes the now-redundant `fd[0]`, reads `$PAGER` (or defaults to `/bin/more`), and `execl`s it; (5) the pager runs completely unmodified, reading from what it believes is its terminal's stdin but is really the read end of the pipe. ==The entire mechanism is one `close()` call doing double duty as both resource cleanup and the EOF signal that tells the reading process when to stop.==
## Connections
- **Lecture (Lec08, 10/1):** Matches §15.2 closely - `pipe()`'s signature and two limitations, the parent/child close-the-end-you-don't-use pattern, `SIGPIPE`/EPIPE, `PIPE_BUF` atomicity (Lec08 gives the exact numbers: 512 bytes on any POSIX system, 4096 on Linux specifically - sharper than the book's "query `PIPE_BUF`" framing). Lec08 adds a precise **read/write behavior table** the book states only in prose (blocking vs. returning 0 vs. `SIGPIPE`, cross-referenced by which end is open/closed and whether data/space is available) and a worked **array-of-pipes** pattern (`pipe_fds + 2*i` pointer arithmetic for pipe `i`'s read/write pair) that has no equivalent in §15.1-15.2 at all - flagged for Project 2, which the slides say explicitly requires it.
- **Lecture coverage gap, flagged rather than folded in:** Lec08 also covers **FIFOs** in real depth (`mkfifo`, the open-blocks-until-both-ends-are-open behavior, inode-but-no-disk-blocks implementation) - that's book §15.5, not assigned reading for this course and intentionally absent from Full Reading Notes above. Treat FIFO material as lecture-only until/unless a later week's reading assignment actually covers it.
- **Textbook:** §15.3-15.8 (popen/pclose, Coprocesses, FIFOs, XSI IPC, Message Queues, Semaphores) sit between the two assigned ranges in this chapter and are deliberately unread - the chapter jumps from §15.2 straight to §15.9 because that's the real reading assignment, not an oversight.
- **Forward (Chapter 11/12):** §15.9's synchronization problem (two processes touching shared memory at once) is exactly what Chapter 11's mutexes and Chapter 12's advanced synchronization formalize - this chapter names the need, those chapters supply the tool.
## Open Questions
- [ ] Trace the pager-via-pipe example's descriptor table by hand across the `fork()`: which `close()` calls happen in which process, and in what order, before `exec()` runs?
- [ ] Verify on the course container: does writing more than `PIPE_BUF` bytes from two concurrent writers actually interleave, or does Linux's real pipe implementation happen to be more forgiving than the guarantee requires?
- [ ] Reproduce Fig. 15.31's address-inspection program and compare where shared memory lands relative to the heap/stack against the book's own sample run.
- [ ] Why does `shmdt()` deliberately *not* remove the segment - what real use case depends on a detached-but-still-alive segment?
## Flashcards
#cards/csci4061
What are the two real limitations of a classic UNIX pipe, and which IPC mechanisms remove each one?::Half-duplex (data flows one direction only) and common-ancestor-only (only processes descended from the one that called `pipe()` before `fork()` can share it). FIFOs remove the ancestor limitation; UNIX domain sockets remove both.
Why does the parent in the pager-via-pipe example close `fd[1]` specifically after its last `write()`, rather than just letting the program exit?::Closing the write end is what generates the EOF the child's `read()` (and the pager program reading from stdin) is waiting for - without that close, the child would block forever expecting more data that is never coming.
What's the actual difference between a pipe write failing with `SIGPIPE` versus `EPIPE`?::They're the same underlying event - writing to a pipe with no open read end. `SIGPIPE`'s default action terminates the writer; if the process catches or ignores `SIGPIPE` instead, the `write()` call returns -1 with `errno == EPIPE`, letting the program handle the failure in code.
Why is shared memory faster than every other IPC mechanism in this chapter, and what does that speed cost?::No data is copied through the kernel after the segment is attached - processes read/write it with ordinary memory access. The cost is that the kernel provides zero synchronization; two processes can race on the same bytes unless the program adds its own locking (semaphores, record locks, or a `PTHREAD_PROCESS_SHARED` mutex).
Calling `shmdt()` on an attached segment - does this delete the shared memory?::No. `shmdt()` only detaches it from the calling process's address space and decrements `shm_nattch`; the segment itself persists until an explicit `shmctl(shmid, IPC_RMID, NULL)` call removes it (and even then, removal is deferred until every attached process has detached).
What does `MAP_ANON` let a program skip compared to the `/dev/zero`-mapping technique for shared memory?::`MAP_ANON` (with `fd = -1`) creates the same zero-filled, `fork()`-inheritable shared region directly, without ever calling `open()`/`close()` on `/dev/zero` first - one fewer real file descriptor in play for the identical result.
Project 2 requires an array of pipes rather than one shared pipe - what's the actual indexing pattern?::For `n` pipes, allocate `2*n` file descriptors; initializing pipe `i` is `pipe(pipe_fds + 2*i)`, after which `pipe_fds[2*i]` is that pipe's read end and `pipe_fds[2*i + 1]` is its write end - pointer arithmetic selecting which two-slot block belongs to pipe `i`.
