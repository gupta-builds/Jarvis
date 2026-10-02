---
type: class
input_kind: book
status: seed
created:
updated:
area:
  - "[[UMN Board]]"
tags:
  - "#class"
  - "#Textbook"
next:
---
# Chapter - 15
## Chapter Summary
<!-- State the chapter's one-sentence claim and use exactly one ==highlight== anchor. -->
== ==
*Mechanism:*
<!-- Explain how the chapter's claim works. -->
# Chapter - 15 — Interprocess Communication
## Chapter Summary
UNIX interprocess communication relies on kernel-managed channels to pass data between process address spaces, with half-duplex pipes providing the fundamental stream abstraction for related processes sharing a common ancestor.
*Mechanism:* ==Half-duplex pipes represent the oldest form of UNIX interprocess communication, establishing a kernel-buffered data stream between related processes via two file descriptors.== Calling pipe() allocates a pair of file descriptors pointing to a unified kernel buffer, where fd is opened for reading and fd for writing (p. 535). When a parent process forks, child processes inherit these file descriptors, allowing unidirectional byte-stream data transfer; closing unused read/write ends enforces clean end-of-file detection and prevents write-side SIGPIPE errors (p. 536–537).
## Key Concepts
- **interprocess communication** (IPC): Techniques allowing independent processes to exchange data and synchronize actions (p. 533).
- **half-duplex pipe**: A unidirectional kernel data channel where data flows in only one direction from write end to read end (p. 534).
- **full-duplex pipe**: A bidirectional IPC pipe where both descriptor ends can support reading and writing simultaneously (p. 534).
- **common ancestor**: A shared parent or ancestor process that creates an IPC channel before calling fork(), enabling descriptor inheritance (p. 534).
- **FIFOs**: Named pipes residing in the file system that allow communication between unrelated processes (p. 534).
- **UNIX domain sockets**: Socket-based IPC mechanism providing efficient bidirectional local communication (p. 534).
- **STREAMS**: Obsolescent kernel-level framework for character-based I/O devices and networking (p. 534).
- **XSI IPC**: System V IPC mechanisms comprising message queues, semaphores, and shared memory (p. 534).
- **pipe**: System call int pipe(int fd) creating an unnamed pipe and returning read descriptor fd and write descriptor fd (p. 535).
- ==**S_ISFIFO**==: POSIX macro used with fstat() on a pipe file descriptor to verify its file type as a FIFO/pipe (p. 535).
- **fstat**: System call retrieving file status and attributes for an open file descriptor (p. 535).
- **fork**: System call creating a duplicate child process that inherits open file descriptors (p. 535).
- **read**: System call reading bytes from a file descriptor into a user buffer (p. 535).
- **write**: System call writing bytes from a user buffer to a file descriptor (p. 535).
- **close**: System call closing an open file descriptor and releasing process references (p. 536).
- **SIGPIPE**: Signal generated when a process attempts to write to a pipe or FIFO whose read ends have all been closed (p. 537).
- **EPIPE**: Error code returned by write() when SIGPIPE is caught or ignored after writing to a readerless pipe (p. 537).
- **PIPE_BUF**: Constant defining the kernel pipe buffer limit for guaranteed atomic non-interleaved write operations (p. 537).
- **fpathconf**: System call querying file-system-dependent limits like PIPE_BUF at runtime (p. 537).
- **pager**: A utility program (e.g., /bin/more) that displays text output one page at a time on a terminal (p. 538).
- **PAGER**: Environment variable specifying the user's preferred pagination utility (p. 538).
- **getenv**: C library function retrieving the string value of an environment variable (p. 538).
- **STDIN_FILENO**: Symbolic constant representing standard input file descriptor 0 (p. 538).
- **STDOUT_FILENO**: Symbolic constant representing standard output file descriptor 1 (p. 537).
- **dup2**: System call duplicating an open file descriptor onto a target descriptor index like STDIN_FILENO (p. 539).
- **execl**: Exec family function replacing the current process image with a new executable (p. 539).
- **waitpid**: System call suspending parent execution until a specific child process terminates (p. 539).
- **TELL_WAIT**: Synchronization initialization routine setting up IPC channels between parent and child processes (p. 539).
## Full Reading Notes
### 15.1 Introduction
UNIX interprocess communication comprises classical local mechanisms (pipes, FIFOs, XSI message queues, semaphores, shared memory), network sockets, and advanced descriptor passing (p. 533–534).
The Single UNIX Specification (SUS) requires half-duplex pipes but permits implementations to provide full-duplex pipes; applications assuming half-duplex operate correctly on full-duplex systems (p. 533–534).
Figure 15.1 summarizes UNIX System IPC support across SUS, FreeBSD 8.0, Linux 3.2.0, Mac OS X 10.6.8, and Solaris 10:
- Half-duplex pipes: SUS required; Linux and Solaris implement full-duplex pipes under the hood; FreeBSD and Mac OS X support standard half-duplex pipes (p. 534).
- FIFOs (named pipes): Supported across SUS and all four platforms (p. 534).
- Full-duplex pipes allowed: Supported via UNIX domain sockets (UDS) or native implementations (p. 534).
- Named full-duplex pipes: Marked obsolescent in SUS, supported via mounted STREAMS in Solaris (p. 534).
- XSI IPC (message queues, semaphores, shared memory): System V mechanisms supported across SUS and all four platforms (p. 534).
- POSIX Real-Time Extensions: Message queues (MSG option), semaphores (moved to base specification in SUSv4), and shared memory (SHM option) (p. 534).
- Sockets and STREAMS: The only IPC forms generally supporting network communication across different host computers (p. 534).
### 15.2 Pipes
Pipes are the oldest form of UNIX IPC, provided by all UNIX systems (p. 534).
Pipes possess two fundamental limitations:
1. Historically half-duplex: Data flows in only one direction from write end to read end (p. 534).
2. Common ancestor required: A pipe can only be used between processes that share a common ancestor that called pipe() prior to fork() (p. 534–535). FIFOs eliminate the common ancestor requirement, and UNIX domain sockets eliminate both limitations (p. 535).
Shell command pipelines (e.g., command1 | command2) use pipes created by the shell to connect standard output of command1 to standard input of command2 (p. 535).
Function Prototype (<unistd.h>):
```c
int pipe(int fd);
```

Returns 0 if OK, -1 on error (p. 535). Returns two file descriptors in array fd: fd opened for reading, fd opened for writing. The output of fd is the input for fd (p. 535). BSD 4.3/4.4 implemented pipes using UNIX domain sockets hobbled to half-duplex mode (p. 535). POSIX.1 permits full-duplex implementations where fd and fd are readable and writable (p. 535). Figure 15.2 illustrates two views of a half-duplex pipe: two descriptor ends in a single process versus a kernel-buffered data channel. Calling fstat() on either end of a pipe returns file type FIFO, verifiable via the S_ISFIFO(st_mode) macro (p. 535). POSIX.1 leaves st_size undefined for pipes, but many implementations store available readable bytes in st_size when queried on fd (p. 535). Pipe creation across fork() (Figure 15.3 & Figure 15.4):

- After fork(), parent and child inherit both descriptors fd and fd (p. 535).
- For parent-to-child data flow: Parent closes read end close(fd); child closes write end close(fd) (p. 536).
- For child-to-parent data flow: Parent closes write end close(fd); child closes read end close(fd) (p. 536). Pipe closure operational rules (p. 536–537):

1. Reading from a pipe whose write ends are all closed: read() returns 0 (EOF) once all remaining buffered data is consumed (p. 536).
2. Writing to a pipe whose read ends are all closed: Kernel generates SIGPIPE signal for writer (p. 537). ==If SIGPIPE is caught or ignored, write() returns -1 with errno set to EPIPE.== PIPE_BUF atomicity: Constant PIPE_BUF (queried via fpathconf(fd, _PC_PIPE_BUF)) specifies the kernel pipe buffer size (p. 537). Writes of PIPE_BUF bytes or less are guaranteed atomic and non-interleaved with concurrent writers (p. 537). Writes exceeding PIPE_BUF bytes may be interleaved (p. 537). Code Example 1 — Parent-to-Child Pipe (Figure 15.5):

```
#include "apue.h"

int main(void) {
    int n;
    int fd;
    pid_t pid;
    char line[MAXLINE];

    if (pipe(fd) < 0)
        err_sys("pipe error");
    if ((pid = fork()) < 0) {
        err_sys("fork error");
    } else if (pid > 0) { /* parent */
        close(fd);
        write(fd, "hello world\n", 12);
    } else { /* child */
        close(fd);
        n = read(fd, line, MAXLINE);
        write(STDOUT_FILENO, line, n);
    }
    exit(0);
}
```

Code Example 2 — Copy File to Pager Program via dup2 and exec (Figure 15.6):

```
#include "apue.h"
#include <sys/wait.h>

#define DEF_PAGER "/bin/more" /* default pager program */

int main(int argc, char *argv[]) {
    int n;
    int fd;
    pid_t pid;
    char *pager, *argv0;
    char line[MAXLINE];
    FILE *fp;

    if (argc != 2)
        err_quit("usage: a.out <pathname>");

    if ((fp = fopen(argv, "r")) == NULL)
        err_sys("can't open %s", argv);

    if (pipe(fd) < 0)
        err_sys("pipe error");

    if ((pid = fork()) < 0) {
        err_sys("fork error");
    } else if (pid > 0) { /* parent */
        close(fd); /* close read end */

        /* parent copies argv to pipe */
        while (fgets(line, MAXLINE, fp) != NULL) {
            n = strlen(line);
            if (write(fd, line, n) != n)
                err_sys("write error to pipe");
        }
        if (ferror(fp))
            err_sys("fgets error");

        close(fd); /* close write end of pipe for reader */

        if (waitpid(pid, NULL, 0) < 0)
            err_sys("waitpid error");
        exit(0);
    } else { /* child */
        close(fd); /* close write end */
        if (fd != STDIN_FILENO) {
            if (dup2(fd, STDIN_FILENO) != STDIN_FILENO)
                err_sys("dup2 error to stdin");
            close(fd); /* don't need this after dup2 */
        }

        /* get arguments for execl() */
        if ((pager = getenv("PAGER")) == NULL)
            pager = DEF_PAGER;
        if ((argv0 = strrchr(pager, '/')) != NULL)
            argv0++; /* step past rightmost slash */
        else
            argv0 = pager; /* no slash in pager */

        if (execl(pager, argv0, (char *)0) < 0)
            err_sys("execl error for %s", pager);
    }
    exit(0);
}
```

Code Example 3 — Parent/Child Synchronization using Pipes (Figure 15.7 & Figure 15.8):

- Reimplements TELL_WAIT, TELL_PARENT, TELL_CHILD, WAIT_PARENT, WAIT_CHILD from Section 8.9 using two pipes (pfd1 and pfd2) instead of signals (p. 539–540).
- pfd1 carries character "p" from parent to child; pfd2 carries character "c" from child to parent (p. 540).

```
#include "apue.h"

static int pfd1, pfd2;

void TELL_WAIT(void) {
    if (pipe(pfd1) < 0 || pipe(pfd2) < 0)
        err_sys("pipe error");
}

void TELL_PARENT(pid_t pid) {
    if (write(pfd2, "c", 1) != 1)
        err_sys("write error");
}

void WAIT_PARENT(void) {
    char c;
    if (read(pfd1, &c, 1) != 1)
        err_sys("read error");
    if (c != 'p')
        err_quit("WAIT_PARENT: incorrect data");
}

void TELL_CHILD(pid_t pid) {
    if (write(pfd1, "p", 1) != 1)
        err_sys("write error");
}

void WAIT_CHILD(void) {
    char c;
    if (read(pfd2, &c, 1) != 1)
        err_sys("read error");
    if (c != 'c')
        err_quit("WAIT_CHILD: incorrect data");
}
```

## Worked Example

The pager-via-pipe program (Figure 15.6) demonstrates how a parent process streams data directly into an exec'd child utility without temporary files:

1. Parent setup: The program validates command-line arguments, opens file argv via fopen(), and creates a pipe via pipe(fd), initializing fd (read descriptor) and fd (write descriptor) (p. 538–539).
2. Process creation: Calling fork() spawns a child process; both parent and child inherit descriptors fd and fd (p. 539).
3. Parent stream writing: Parent closes fd (unused read end), loops reading lines from input file fp using fgets(), and writes line bytes to fd. Upon encountering EOF on fp, parent closes fd (closing the sole remaining write end and signaling EOF to child) and calls waitpid() to await child termination (p. 539).
4. Child stream redirection: Child closes fd (unused write end). If fd is not STDIN_FILENO, child invokes dup2(fd, STDIN_FILENO) to duplicate the pipe read descriptor onto standard input, then closes original fd (p. 539). Child queries getenv("PAGER") to obtain user's preferred pager (defaulting to /bin/more) and executes execl(pager, argv0, (char *)0) (p. 539).
5. Execution result: ==The pager program inherits descriptor 0 connected to the pipe, reading paged input directly from the parent process without intermediate disk file creation.==

## Connections

Lecture Framing: Lec08 (Oct 1) covers pipes as interprocess communication channels, building directly on APUE 15.1–15.2. Note that Lec08 slides were not present in the provided notebook text files (which cover lectures up to Sept 24), but textbook concepts align with core systems programming pipe mechanics. Book vs. Slide Coverage:

- Book-only concepts: fstat()/S_ISFIFO file type verification on pipes, PIPE_BUF atomicity rules, fpathconf() limit queries, Figure 15.1 IPC summary matrix across operating systems, and pipe-based TELL_WAIT synchronization routines.
- ==Later-section pull-in: APUE 15.3 (popen/pclose), 15.4 (Coprocesses), 15.5 (FIFOs), and 15.6+ (XSI/POSIX IPC) are explicitly deferred to subsequent weeks and omitted from this note.== Textbook: "(pending next chapter)".

## Open Questions

- [ ] ==Verify what happens when write() is called on a pipe whose read end has been closed without setting a SIGPIPE handler.==
- [ ] Trace descriptor inheritance across fork() and dup2() when piping stdout to stdin between sibling processes.
- [ ] Test the atomicity threshold of PIPE_BUF by attempting concurrent multi-process writes exceeding PIPE_BUF bytes.
- [ ] Contrast process synchronization performance using pipe-based TELL_WAIT routines versus signal-based handlers.

## Flashcards

What system call creates an unnamed pipe and what file descriptors are returned?::pipe(int fd) creates a pipe where fd is opened for reading and fd is opened for writing. #cards/csci4061 What two fundamental limitations apply to traditional UNIX pipes?::Pipes are half-duplex (unidirectional data flow) and can only be shared between processes that have a common ancestor. #cards/csci4061 What occurs when a process attempts to read from a pipe whose write ends have all been closed?::The read() system call returns 0 after all remaining buffered data has been read, indicating end-of-file. #cards/csci4061 ==What kernel signal and error code are triggered when writing to a pipe with no open read descriptors?==::The kernel generates SIGPIPE; if SIGPIPE is caught or ignored, write() returns -1 with errno set to EPIPE. #cards/csci4061 How does PIPE_BUF dictate the behavior of concurrent write operations to a pipe?::Writes of PIPE_BUF bytes or less are guaranteed atomic without interleaving, whereas writes exceeding PIPE_BUF bytes may be interleaved. #cards/csci4061 How does a child process redirect its standard input to read from a pipe before invoking exec()?::The child calls dup2(fd, STDIN_FILENO) and closes fd, redirecting descriptor 0 to the pipe's read end. #cards/csci4061
### 15.9 Shared Memory
Shared memory allows two or more processes to share a given region of memory (p. 571). ==Shared memory represents the fastest form of interprocess communication because processes share a common region of virtual memory directly without copying data through the kernel.== The primary technical challenge in using shared memory is synchronizing access among participating processes so that readers do not access memory while a writer is modifying it (p. 571). Synchronization is typically achieved using semaphores, advisory record locking, or POSIX mutexes stored within the shared memory segment using the `PTHREAD_PROCESS_SHARED` attribute (p. 571; Figure 15.29). Unlike memory-mapped files created via `mmap()`, XSI shared memory segments are anonymous memory regions that are not backed by any file in the file system (p. 572).
The kernel maintains a **shmid_ds** structure for each **shared memory** segment containing segment metadata, owner permissions, byte size, attach counters, and execution timestamps (p. 572):
```c
struct shmid_ds {
    struct ipc_perm shm_perm;   /* see Section 15.6.2 */
    size_t          shm_segsz;  /* size of segment in bytes */
    pid_t           shm_lpid;   /* pid of last shmop() */
    pid_t           shm_cpid;   /* pid of creator */
    shmatt_t        shm_nattch; /* number of current attaches */
    time_t          shm_atime;  /* last-attach time */
    time_t          shm_dtime;  /* last-detach time */
    time_t          shm_ctime;  /* last-change time */
    ...
};
```

System limits governing shared memory segments across platforms include `SHMMAX` (maximum segment size in bytes), `SHMMIN` (minimum segment size in bytes), `SHMMNI` (maximum systemwide segment count), and `SHMSEG` (maximum segments per process) as summarized in Figure 15.30 (p. 572). Function Prototype (<sys/shm.h>):

```
int shmget(key_t key, size_t size, int flag);
```

The **shmget** system call returns a shared memory identifier on success, or -1 on error (p. 572). The `size` parameter specifies the requested segment size in bytes, which the kernel rounds up to an integral multiple of the system page size; any remaining bytes in the final page are unavailable to the process (p. 573). When creating a new segment, `size` must be specified and the kernel initializes the new segment bytes to zero; when referencing an existing segment, `size` can be specified as 0 (p. 573). Function Prototype (<sys/shm.h>):

```
int shmctl(int shmid, int cmd, struct shmid_ds *buf);
```

The **shmctl** function returns 0 on success, or -1 on error (p. 573). Operates on the segment identified by `shmid` using command `cmd` (p. 573):

- `IPC_STAT`: Fetches the `shmid_ds` structure for `shmid` into `buf` (p. 573).
- `IPC_SET`: Copies user/group ownership and permission modes from `buf` into the kernel `shmid_ds` structure (requires superuser or creator/owner privileges) (p. 573).
- `IPC_RMID`: Removes the shared memory identifier from the system immediately so subsequent `shmat()` calls fail; however, physical segment deallocation is deferred until the last process detaches the segment (`shm_nattch` reaches 0) or terminates (p. 573).
- **SHM_LOCK**: Locks the shared memory segment into physical memory to prevent paging (superuser only on Linux and Solaris) (p. 573).
- **SHM_UNLOCK**: Unlocks the shared memory segment from physical memory (superuser only on Linux and Solaris) (p. 573). Function Prototype (<sys/shm.h>):

```
void *shmat(int shmid, const void *addr, int flag);
```

The **shmat** system call returns the starting attach address on success, or `(void *)-1` on error (p. 574). Attaches the shared memory segment `shmid` into the calling process's address space based on `addr` and `flag` (p. 574):

- Recommended technique: Specifying `addr == 0` causes the kernel to automatically select the first available attach address, ensuring maximum system portability (p. 574).
- Specifying `addr != 0` without **SHM_RND**: Attaches segment at exact address `addr` (p. 574).
- Specifying `addr != 0` with **SHM_RND** ("round"): Rounds address down to the nearest multiple of **SHMLBA** (`addr - (addr % SHMLBA)`), where **SHMLBA** represents Low Boundary Address Multiple (p. 574).
- Specifying **SHM_RDONLY** in `flag`: Attaches segment as read-only; otherwise attached as read-write (p. 574).
- Upon successful attach, kernel increments `shm_nattch` counter in `shmid_ds` (p. 574). Function Prototype (<sys/shm.h>):

```
int shmdt(const void *addr);
```

The **shmdt** system call returns 0 on success, or -1 on error (p. 574). Detaches the shared memory segment attached at `addr` (returned previously by `shmat`) and decrements `shm_nattch` in `shmid_ds` (p. 574). Note that calling `shmdt()` does NOT remove the segment identifier or destroy the segment; the segment remains in existence until explicitly removed via `shmctl(shmid, IPC_RMID, NULL)` (p. 574). Code Example 1 — Address Inspection of Program Memory Segments (Figure 15.31):

```
#include "apue.h"
#include <sys/shm.h>

#define ARRAY_SIZE 40000
#define MALLOC_SIZE 100000
#define SHM_SIZE 100000
#define SHM_MODE 0600 /* user read/write */

char array[ARRAY_SIZE]; /* uninitialized data = bss */

int main(void) {
    int shmid;
    char *ptr, *shmptr;

    printf("array[] from %p to %p\n", (void *)&array, (void *)&array[ARRAY_SIZE]);
    printf("stack around %p\n", (void *)&shmid);

    if ((ptr = malloc(MALLOC_SIZE)) == NULL)
        err_sys("malloc error");
    printf("malloced from %p to %p\n", (void *)ptr, (void *)ptr+MALLOC_SIZE);

    if ((shmid = shmget(IPC_PRIVATE, SHM_SIZE, SHM_MODE)) < 0)
        err_sys("shmget error");
    if ((shmptr = shmat(shmid, 0, 0)) == (void *)-1)
        err_sys("shmat error");
    printf("shared memory attached from %p to %p\n", (void *)shmptr, (void *)shmptr+SHM_SIZE);

    if (shmctl(shmid, IPC_RMID, 0) < 0)
        err_sys("shmctl error");

    exit(0);
}
```

Execution output on 64-bit Intel Linux demonstrates memory placement (Figure 15.32): `array[]` (bss) occupies low memory (`0x6020c0`–`0x60bd00`), `malloc` heap resides at `0x9e3010`–`0x9fb6b0`, shared memory is attached below the stack at `0x7fba578ab000`–`0x7fba578c36a0`, and the stack frame sits at high memory `0x7fff957b146c` (p. 575–576). Code Example 2 — Memory-Mapped IPC via **/dev/zero** (Figure 15.33): The character device `/dev/zero` acts as an infinite source of zero bytes when read and discards all written data (p. 576). Mapping `/dev/zero` via `mmap()` creates an unnamed zero-filled shared memory region that can be inherited across `fork()` (p. 576–578).

```
#include "apue.h"
#include <fcntl.h>
#include <sys/mman.h>

#define NLOOPS 1000
#define SIZE sizeof(long) /* size of shared memory area */

static int update(long *ptr) {
    return((*ptr)++); /* return value before increment */
}

int main(void) {
    int fd, i, counter;
    pid_t pid;
    void *area;

    if ((fd = open("/dev/zero", O_RDWR)) < 0)
        err_sys("open error");

    if ((area = mmap(0, SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0)) == MAP_FAILED)
        err_sys("mmap error");
    close(fd); /* can close /dev/zero now that it's mapped */

    TELL_WAIT();

    if ((pid = fork()) < 0) {
        err_sys("fork error");
    } else if (pid > 0) { /* parent */
        for (i = 0; i < NLOOPS; i += 2) {
            if ((counter = update((long *)area)) != i)
                err_quit("parent: expected %d, got %d", i, counter);
            TELL_CHILD(pid);
            WAIT_CHILD();
        }
    } else { /* child */
        for (i = 1; i < NLOOPS + 1; i += 2) {
            WAIT_PARENT();
            if ((counter = update((long *)area)) != i)
                err_quit("child: expected %d, got %d", i, counter);
            TELL_PARENT(getppid());
        }
    }

    exit(0);
}
```

**anonymous memory mapping**: Modern UNIX systems support anonymous memory mapping without opening `/dev/zero` by specifying `MAP_ANON` (or `MAP_ANONYMOUS` on Linux) and passing descriptor `-1` to `mmap()`: `mmap(0, SIZE, PROT_READ | PROT_WRITE, MAP_ANON | MAP_SHARED, -1, 0)` (p. 578). Architectural Contrast: For related processes, `/dev/zero` or anonymous `mmap` mappings provide simple shared memory; for unrelated processes, applications must choose between XSI shared memory (`shmget`/`shmat`) or file-backed `mmap()` using `MAP_SHARED` (p. 578). NEW KEY CONCEPTS

- **shared memory**: Form of IPC allowing multiple processes to attach and access a common region of virtual memory directly without data copying (p. 571).
- **shmget**: System call allocating an XSI shared memory segment or referencing an existing segment key (p. 572).
- **shmid_ds**: Kernel data structure maintaining metadata, permissions, byte size, attached process count, and timestamps for an XSI shared memory segment (p. 572).
- **shmctl**: Control function performing administrative operations on shared memory segments including status retrieval, permission updates, locking, and removal (p. 573).
- **SHM_LOCK**: Non-standard Linux/Solaris command for shmctl locking a shared memory segment into physical RAM (p. 573).
- **SHM_UNLOCK**: Non-standard Linux/Solaris command for shmctl unlocking a shared memory segment from physical RAM (p. 573).
- **shmat**: System call attaching an existing XSI shared memory segment into the calling process's address space (p. 574).
- **SHM_RND**: Flag bit in shmat rounding a specified non-zero attach address down to the nearest multiple of SHMLBA (p. 574).
- **SHMLBA**: Constant defining the low boundary address multiple required for hardware page-alignment during shmat calls (p. 574).
- **SHM_RDONLY**: Flag bit in shmat attaching a shared memory segment with read-only access permissions (p. 574).
- **shmdt**: System call detaching a previously attached shared memory segment from the calling process's address space (p. 574).
- **/dev/zero**: Character device providing an infinite source of zero bytes when read and discarding written bytes, used with mmap for anonymous shared memory creation (p. 576).
- **anonymous memory mapping**: Memory mapping facility using mmap with MAP_ANON/MAP_ANONYMOUS and descriptor -1 to create unbacked shared memory between related processes (p. 578). UPDATED WORKED EXAMPLE (optional) (keep existing) NEW FLASHCARDS Why does XSI shared memory provide faster interprocess data transfer than pipes or message queues?::Shared memory maps a common kernel-managed memory region directly into the virtual address spaces of participating processes, allowing direct read/write access without copying data across the user-kernel boundary. #cards/csci4061 What happens to a shared memory segment when a process calls shmdt(), and how is it permanently deleted?::shmdt() detaches the segment and decrements its attachment count (shm_nattch) without destroying it; the segment persists in the kernel until explicitly removed by calling shmctl() with IPC_RMID after all attaches detach. #cards/csci4061 How does memory-mapping /dev/zero with MAP_SHARED enable shared memory IPC between related processes?::Mapping /dev/zero via mmap() creates a zero-initialized memory region unbacked by any disk file; calling fork() inherits the MAP_SHARED memory mapping so parent and child read and write to the same physical RAM pages. #cards/csci4061 How does anonymous memory mapping (MAP_ANON) simplify shared memory creation compared to /dev/zero?::MAP_ANON (or MAP_ANONYMOUS) instructs mmap() to allocate zero-filled shared memory directly without requiring open() or close() system calls on a /dev/zero file descriptor. #cards/csci4061
## Examples Worth Keeping
<!-- Keep concrete examples, numbers, cases, or worked reasoning that makes the mechanism memorable. -->
- 
## Connections
<!-- Link the matching lecture/week, course map, and only concept notes that actually exist or were created. -->
- Lecture:
- Concept:
## Flashcards
<!-- Add 3–8 atomic cards testing mechanisms and contrasts to #cards/<course-slug>. -->
