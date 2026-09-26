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
# Chapter - 8
## Chapter Summary
<!-- State the chapter's one-sentence claim and use exactly one ==highlight== anchor. -->
== ==
*Mechanism:*
<!-- Explain how the chapter's claim works. -->
### 8.1 Introduction
UNIX systems provide fundamental **process control** primitives for process creation, program execution, and process termination (p. 227). Chapter 8 examines process attributes—including real, effective, and saved user and group IDs—and how they are affected by process control operations, alongside interpreter files, the `system` function, and process accounting (p. 227).
### 8.2 Process Identifiers
*Definition & Reuse:* Every process is identified by a unique, non-negative integer **process ID** (p. 227). Although process IDs are unique at any given moment, they are reused as processes terminate; systems implement delay algorithms so newly created processes receive different IDs from recently terminated ones, preventing mistaken process identification (p. 227).
*Special Kernel & System Processes:*
- Process ID 0: Usually the scheduler process, known as the **swapper**; a kernel system process with no corresponding executable file on disk (p. 227–228).
- Process ID 1: Usually the **init** process, invoked by the kernel at the end of the bootstrap procedure (historically `/etc/init`, or `/sbin/init` in newer releases) (p. 228). Responsible for reading system initialization files (`/etc/rc*`, `/etc/inittab`, `/etc/init.d`) to bring the system to a specific state (such as multiuser); `init` is a normal user process running with superuser privileges (not a kernel system process), never dies, and inherits all orphaned child processes (p. 228).
- *Course Framing (Lec02):* Modern Linux distributions use **systemd** as the init root process (PID 1) at the root of the **process family tree** (Lec02).
*Identifier Query Functions:* Defined in `<unistd.h>`, these functions query process attributes and return no errors (p. 228):
- `pid_t getpid(void);`: Returns the process ID of the calling process (p. 228).
- `pid_t getppid(void);`: Returns the parent process ID of the calling process (p. 228).
- `uid_t getuid(void);`: Returns the real user ID of the calling process (p. 228).
- `uid_t geteuid(void);`: Returns the effective user ID of the calling process (p. 228).
- `gid_t getgid(void);`: Returns the real group ID of the calling process (p. 228).
- `gid_t getegid(void);`: Returns the effective group ID of the calling process (p. 228).
### 8.3 fork Function
*Function Signature:* `pid_t fork(void);` defined in `<unistd.h>` (p. 229).
*Dual-Return Semantics:* An existing process creates a new process by calling **fork** (p. 229). ==The fork function is called once by the parent process but returns twice: returning the newly created child's process ID to the parent process and returning 0 to the child process (or -1 on error).== The newly created process is the **child process**, and the calling process is the **parent process** (p. 229). `fork` returns 0 to the child because a process has only one parent and can always query its parent PID via `getppid()` (PID 0 is reserved for the kernel swapper); `fork` returns the child's PID to the parent because a parent can have multiple children and no UNIX system call exists to query a process's children (p. 229).
*Address Space & Execution:*
- Both parent and child resume execution at the instruction immediately following the `fork` call (p. 229).
- The child receives duplicate copies of the parent's data space, heap, and stack, but parent and child do not share these memory regions (p. 229).
- Parent and child share the read-only **text segment** containing CPU machine instructions (p. 229).
*Copy-on-Write Optimization:*
- Modern UNIX implementations avoid physically copying the parent's data, heap, and stack immediately because `fork` is frequently followed by an **exec** (p. 229).
- Instead, **copy-on-write** (COW) marks these memory regions as read-only and shares them between parent and child; if either process attempts to write to a shared region, the kernel duplicates only that individual page of virtual memory (p. 229).
*Platform Creation Variants:*
- **vfork** variant creates a process without copying address space, running the child in the parent's address space until `exec` or `_exit` (p. 229, 234).
- Linux provides the **clone** system call, a generalized process creation primitive allowing fine-grained control over what is shared between parent and child (p. 229).
- FreeBSD provides the **rfork** system call derived from Plan 9 (p. 229).
*Scheduling & Race Conditions:*
- The execution order between parent and child after `fork` is non-deterministic, depending entirely on kernel scheduling algorithms and system load (p. 230–231).
- *Course Framing (Lec02):* Systems programmers must design "programs with the weakest set of assumptions possible" because assuming either parent or child runs first creates severe race conditions (Lec02).
*Variable Independence Demonstration:*
- *APUE Example (Figure 8.1):* External variable `globvar` (initialized data, 6) and stack variable `var` (88) are modified by the child (`globvar++`, `var++`) while the parent sleeps for 2 seconds. The child prints `glob = 7, var = 89`, while the parent prints `glob = 6, var = 88`, proving independent memory spaces (p. 230).
- *Course Framing (Lec02):* Lec02 demonstrates variable copy independence in `int x = 4061; pid_t id = fork();`: printing `&x` and `x` in both processes reveals that even though parent and child display identical virtual memory addresses (`&x`), setting `x = 100` in the child alters only the child's copy while the parent retains `4061` (Lec02).
```c
#include "apue.h"

int globvar = 6;
char buf[] = "a write to stdout\n";

int main(void) {
    int var;
    pid_t pid;

    var = 88;
    if (write(STDOUT_FILENO, buf, sizeof(buf)-1) != sizeof(buf)-1)
        err_sys("write error");
    printf("before fork\n");

    if ((pid = fork()) < 0) {
        err_sys("fork error");
    } else if (pid == 0) {
        globvar++;
        var++;
    } else {
        sleep(2);
    }

    printf("pid = %ld, glob = %d, var = %d\n", (long)getpid(), globvar, var);
    exit(0);
}
```
_I/O Buffering Behavior across Redirection:_

- Unbuffered I/O system calls (`write`) execute immediately once before `fork` (p. 230).
- Standard I/O `printf("before fork\n")` is line-buffered when connected to a terminal, flushing before `fork` (p. 230).
- When standard output is redirected to a disk file (`./a.out > temp.out`), standard I/O becomes fully buffered; the unflushed buffer containing "before fork\n" is duplicated into the child's memory image during `fork`, causing "before fork" to be written twice when parent and child flush their buffers at exit (p. 230). _File Sharing Mechanics:_
- All open file descriptors in the parent are duplicated in the child as if `dup` had been called, sharing file table entries in the kernel system file table (p. 231).
- Parent and child share file status flags and the current **file offset**; reading, writing, or seeking in either process advances the offset for both (p. 231; Lec04).
- Standard descriptor handling patterns: (1) Parent waits for child to finish, allowing child writes to update offsets before parent resumes; or (2) Parent and child close unused descriptors independently (e.g., network servers) (p. 232). _Inherited Attributes:_ Real UID/GID, effective UID/GID, supplementary GIDs, process group ID, session ID, controlling terminal, set-user-ID and set-group-ID flags, current working directory, root directory, file mode creation mask (`umask`), signal mask and dispositions, close-on-exec flag (`FD_CLOEXEC`) for open descriptors, environment list, attached shared memory, memory mappings, and resource limits (p. 233). _Non-Inherited Differences:_ Return values from `fork`, process IDs, parent process IDs (child's PPID is parent's PID), child CPU execution times reset to 0, file locks set by parent (not inherited by child), pending alarms cleared for child, and child's pending signal set initialized to empty (p. 233). _Failure Conditions:_ `fork` returns -1 if system process limits are exceeded or if the real user ID process count exceeds **CHILD_MAX** (p. 233). _Primary Uses:_ (1) Duplicating a process so parent and child execute different code sections in parallel (e.g., network servers); or (2) Executing a new program by executing `fork` followed immediately by `exec` (e.g., shells) (p. 233–234). Operating systems combining fork and exec into a single primitive call it a **spawn** (p. 234). _Lab 01 Canonical Error Checking Pattern:_ Lab 01 (titled "Lab 3" inside the file itself, a real numbering inconsistency) provides the canonical three-branch error-check pattern for `fork()` (Lab 01):

```
pid_t pid = fork();
if (pid < 0) {
    perror("fork failed");
    exit(1);
} else if (pid == 0) {
    // child process
} else {
    // parent process (pid contains child's PID)
}
```

_Lec02 "Brain Melting with fork" Loop Exercises:_

- _Exercise #1 (Unconditional fork loop):_ `for (int i = 0; i < 3; i++) { child_pid = fork(); }` results in \(2^3 = 8\) total executing processes forming a binary process tree (Lec02).
- _Exercise #2 (Break on child_pid == 0):_ `for (int i = 0; i < 3; i++) { child_pid = fork(); if (child_pid == 0) break; }` causes each newly created child process to break out of the loop immediately, resulting in 1 parent process spawning 3 direct child processes (4 total processes) (Lec02).
- _Exercise #3 (Break on child_pid != 0):_ `for (int i = 0; i < 3; i++) { child_pid = fork(); if (child_pid != 0) break; }` causes the parent process to break out on the first fork while each child process continues the loop to spawn the next generation, producing a linear parent-child chain of 4 processes (Lec02).
### 8.4 vfork Function
*Function Signature:* `pid_t vfork(void);` defined in `<unistd.h>` (p. 234).
*Purpose & Semantics:* The **vfork** function creates a new process intended to immediately execute a new program via `exec` (p. 234). Unlike `fork`, `vfork` does not copy or duplicate the parent's address space; the child runs directly in the parent's address space until it calls `exec` or `_exit` (p. 234).
*Parent Suspension:* The parent process is suspended and guaranteed not to run until the child calls `exec` or `_exit` (p. 234).
*Restrictions & Hazards:* If the child modifies data (other than the `vfork` return value), makes function calls, or returns from the calling function before calling `exec` or `_exit`, the results are undefined (p. 234–235). The child must call `_exit` rather than `exit` to avoid flushing standard I/O streams in the parent's address space (p. 235).
### 8.5 exit Functions
*Termination Paths:* As introduced in Chapter 7, a process terminates normally in five ways (`main` return, `exit`, `_exit`/`_Exit`, thread return, `pthread_exit`) and abnormally in three ways (`abort`, uncaught signal, thread cancellation) (p. 236).
*Kernel Cleanup:* Regardless of termination method, the kernel executes clean-up code that closes open file descriptors, releases memory, and sends `SIGCHLD` to the parent process (p. 236–237).
*Orphan Processes:* If a parent process terminates before its child processes, those children become **orphan processes** and are automatically adopted by `init` (PID 1) (p. 236).
*Zombie Processes:* If a child terminates before its parent, the kernel retains a minimal entry in the process table storing its PID, termination status, and CPU time. A terminated process whose parent has not yet fetched its status via `wait` or `waitpid` is a **zombie process** (p. 237). If the parent exits without calling `wait`, `init` adopts the zombie child and reaps its exit status (p. 237).
*Course Framing (Lec03 Three-Way Process State Taxonomy):* Lec03 establishes a three-way taxonomy of process termination states:
- A zombie process is a child that exited before its parent called `wait()`, retaining its exit status in the process table.
- An orphan process is a child whose parent exited first, adopted by `init`/`systemd` (PID 1), which periodically reaps terminated children and cannot be killed.
- A **daemon process** is a background process whose parent deliberately forks and exits/never waits, detaching from the controlling terminal to run long-lived background system services (e.g., `httpd`, `lpd`, `sshd`) (Lec03).
### 8.6 wait and waitpid Functions
*Function Signatures:* Defined in `<sys/wait.h>` (p. 238):
- `pid_t wait(int *statloc);`
- `pid_t waitpid(pid_t pid, int *statloc, int options);`
*Functionality & Differences:*
- `wait`: Suspends the calling process until any child process terminates (moving the parent to the Blocked state) (p. 238; Lec02/Lec03). If a child is already a zombie, `wait` returns immediately with that child's PID and stores its termination status in `statloc` (p. 238).
- `waitpid`: Allows waiting for a specific child or process group based on `pid`: `pid == -1` (any child), `pid > 0` (specific child PID), `pid == 0` (any child in calling process group), `pid < -1` (any child in process group equal to `|pid|`) (p. 241).
- `WNOHANG` Option: Passing **WNOHANG** in `options` prevents `waitpid` from blocking if the specified child is not terminated, returning `0` immediately so the caller can poll instead of blocking (p. 242; Lec03).
*Termination Status Inspection Macros (`<sys/wait.h>`):*
- **WIFEXITED**(status): True if child terminated normally. **WEXITSTATUS**(status) fetches the low-order 8 bits of the exit argument (p. 239).
- **WIFSIGNALED**(status): True if child terminated abnormally by an uncaught signal. **WTERMSIG**(status) fetches the signal number (p. 239). **WCOREDUMP**(status) checks if a core file was generated (p. 239–240).
- **WIFSTOPPED**(status): True if child is currently stopped. **WSTOPSIG**(status) fetches the stop signal number (p. 239).
- **WIFCONTINUED**(status): True if child was continued after a job control stop (p. 239).
*Double Fork Technique:* To prevent children from becoming persistent zombies without blocking the parent, a process calls `fork()` twice: the first child forks a second child and exits immediately; the second child executes its task, knowing it has been orphaned and adopted by `init`, which automatically reaps its exit status (p. 242–243).
### 8.7 waitid Function
*Function Signature:* `int waitid(idtype_t idtype, id_t id, siginfo_t *infop, int options);` defined in `<sys/wait.h>` (p. 244).
*Parameters & Options:* Allows waiting for specific child processes using separate `idtype` (`P_PID`, `P_PGID`, `P_ALL`) and `id` arguments (p. 244). The `options` bitmask must include at least one of `WEXITED`, `WSTOPPED`, or `WCONTINUED`, and may include `WNOHANG` (non-blocking) or `WNOWAIT` (keeps child status available for subsequent wait calls) (p. 244). Populates `siginfo_t` structure pointed to by `infop` (p. 244).
### 8.8 wait3 and wait4 Functions
*Function Signatures:* Defined in `<sys/types.h>`, `<sys/wait.h>`, `<sys/time.h>`, `<sys/resource.h>` (p. 245):
- `pid_t wait3(int *statloc, int options, struct rusage *rusage);`
- `pid_t wait4(pid_t pid, int *statloc, int options, struct rusage *rusage);`
*Purpose:* Historical BSD functions that return process resource usage statistics in a `struct rusage` structure (user/system CPU time, page faults, signals received) alongside termination status (p. 245).
### 8.9 Race Conditions
*Definition:* A **race condition** occurs when multiple processes operate on shared resources and the final output depends on the non-deterministic execution order determined by the kernel scheduler (p. 245).
*Synchronization Primitives:* To eliminate race conditions after `fork()`, processes use inter-process communication mechanisms wrapped in synchronization functions: `TELL_WAIT()`, `TELL_PARENT(pid)`, `TELL_CHILD(pid)`, `WAIT_PARENT()`, and `WAIT_CHILD()` (p. 246–248).
### 8.10 exec Functions
*Function Signatures:* Defined in `<unistd.h>` (p. 249):
- `int execl(const char *pathname, const char *arg0, ... /* (char *)0 */ );`
- `int execv(const char *pathname, char *const argv[]);`
- `int execle(const char *pathname, const char *arg0, ... /* (char *)0, char *const envp[] */ );`
- `int execve(const char *pathname, char *const argv[], char *const envp[]);`
- `int execlp(const char *filename, const char *arg0, ... /* (char *)0 */ );`
- `int execvp(const char *filename, char *const argv[]);`
- `int fexecve(int fd, char *const argv[], char *const envp[]);`
- *Course Framing (Lec03):* Lec03 introduces `execvpe(const char *file, char *const argv[], char *const envp[])` as the sixth variant paired with `execvp`.
*Execution Mechanics:* An **exec** function completely replaces the calling process's memory image (text, initialized data, bss, heap, stack, program counter) with a new program loaded from disk (p. 249; Lec03). The process ID does NOT change across `exec` (p. 249).
*Return Value:* `exec` functions NEVER return upon success; they return `-1` only if an error occurs (p. 249; Lec03).
*Mnemonic Naming Rules:*
- `l` (list): Command-line arguments passed as individual function parameters terminated by `NULL` / `(char *)0` (p. 250).
- `v` (vector): Arguments passed as an array of pointers `argv[]` (p. 250).
- `p` (path): Takes a `filename` and searches directories in the `PATH` environment variable (p. 250).
- `e` (environment): Takes a custom array of environment variable pointers `envp[]` instead of using global `environ` (p. 250).
*Preservation & Inherited Properties:* The new program inherits PID, PPID, UIDs/GIDs, process group, working directory, signal mask, and resource limits (p. 252). Open file descriptors remain open across `exec` by default, unless the **close-on-exec** flag (`FD_CLOEXEC`) is set (p. 252; Lec03).
*Kernel System Call Relationship:* In most UNIX implementations, `execve` is the sole kernel system call; the other `exec` variants are C library wrapper functions built on top of `execve` (p. 253).
## Chapter Summary
Process control in UNIX systems provides primitives to spawn new process images, replace running memory contents with new executable binaries, and synchronize parent execution with child termination status.
*Mechanism:* ==The fork() system call creates a duplicate child process with copy-on-write virtual memory, exec() replaces the child's address space with a new executable program while preserving open file descriptors, and wait() or waitpid() suspends the parent until the child terminates and yields its status.== If a parent exits before its child, the child becomes an orphan adopted by PID 1 (`init`/`systemd`), whereas if a child exits before its parent calls `wait()`, it remains a zombie in the process table.
## Key Concepts
- **process ID**: Unique non-negative integer identifying an active process (p. 227).
- **swapper**: Process ID 0, a kernel system process responsible for process scheduling (p. 227).
- **init** / **systemd**: Process ID 1, the root user process created during system bootstrap that inherits orphaned child processes (p. 228; Lec02).
- **getpid**: Function returning the process ID of the calling process (p. 228).
- **getppid**: Function returning the parent process ID of the calling process (p. 228).
- **getuid** / **geteuid**: Functions returning the real and effective user IDs of the calling process (p. 228).
- **getgid** / **getegid**: Functions returning the real and effective group IDs of the calling process (p. 228).
- **fork**: System call creating a new child process by duplicating the calling process (p. 229).
- **child process**: Newly created process produced by `fork()` (p. 229).
- **parent process**: Calling process that spawns a child process via `fork()` (p. 229).
- **copy-on-write**: Optimization sharing memory pages read-only between parent and child until a write operation triggers page duplication (p. 229).
- **vfork**: Process creation primitive that runs the child in the parent's address space without memory copying while suspending the parent (p. 234).
- **clone**: Linux-specific system call allowing fine-grained sharing of process address space and resources (p. 229).
- **rfork**: FreeBSD process creation system call derived from Plan 9 (p. 229).
- **exit** / **_exit** / **_Exit**: Functions terminating a process normally, where `exit()` flushes stdio streams and runs `atexit()` handlers while `_exit()`/`_Exit()` return directly to the kernel (p. 236).
- **exit status**: Integer parameter passed to exit functions indicating exit condition (p. 236).
- **orphan process**: A child process whose parent terminated before it, which is automatically adopted by `init` / `systemd` (PID 1) (p. 236; Lec03).
- **zombie process**: A child process that has terminated but whose exit status has not yet been fetched by its parent via `wait()` / `waitpid()` (p. 237; Lec03).
- ==**daemon process**==: A long-lived background process whose parent deliberately forks and exits/never waits, detaching from the controlling terminal to run system services like `httpd` or `sshd` (Lec03).
- **wait**: System call blocking the parent process until any child process terminates, returning the child PID and termination status (p. 238; Lec02/Lec03).
- **waitpid**: System call allowing a parent to wait for a specific child PID or process group, supporting the non-blocking `WNOHANG` polling option (p. 238, 241–242; Lec03).
- **WNOHANG**: `waitpid()` option flag instructing the function to return `0` immediately if no child has exited (p. 242; Lec03).
- **WIFEXITED** / **WEXITSTATUS**: Status macros evaluating true if a child exited normally and extracting its 8-bit exit code (p. 239).
- **WIFSIGNALED** / **WTERMSIG**: Status macros evaluating true if a child was terminated by an uncaught signal and extracting the signal number (p. 239).
- **WCOREDUMP**: Status macro indicating if a terminated child generated a core dump file (p. 239).
- **WIFSTOPPED** / **WSTOPSIG**: Status macros inspecting whether a child process is currently stopped and fetching the stop signal (p. 239).
- **WIFCONTINUED**: Status macro evaluating true if a stopped child was continued by job control (p. 239).
- **waitid**: POSIX function providing flexible child waiting using explicit `idtype_t` and `id_t` parameters (p. 244).
- **wait3** / **wait4**: Historical BSD wait variants returning resource usage statistics in a `struct rusage` structure (p. 245).
- **race condition**: Flaw where program outcome depends non-deterministically on the execution order scheduled by the OS kernel (p. 245).
- **exec**: Family of functions (`execl`, `execv`, `execle`, `execve`, `execlp`, `execvp`, `execvpe`, `fexecve`) replacing the current process memory image with a new executable program from disk (p. 249; Lec03).
- **close-on-exec**: Descriptor flag (`FD_CLOEXEC`) causing an open file descriptor to be closed automatically during an `exec` call (p. 252; Lec03).
- **interpreter file**: Executable text file starting with `#!` specifying a path to an interpreter binary and optional argument (p. 260).
- **system**: ISO C library function executing a command string by invoking `/bin/sh -c` via `fork`, `exec`, and `waitpid` (p. 264).
## Worked Example
A full `fork`/`exec`/`wait` command sequence traces process state transitions across five OS states:
1. *Parent Execution (Running):* Parent process is in the **Running** state executing user code. It executes `pid_t pid = fork()`.
2. *Child Creation (New → Ready):* The OS allocates a process control block for Child (**New** state), duplicates Parent's address space using copy-on-write, and transitions Child to the **Ready** state in the scheduler run queue. `fork()` returns Child PID to Parent and `0` to Child.
3. *Parent Blocking (Running → Blocked):* Parent calls `waitpid(pid, &status, 0)`. Because Child is still active, Parent transitions from **Running** to **Blocked** state, relinquishing the CPU.
4. *Child Program Replacement (Ready → Running):* The OS scheduler selects Child, moving it from **Ready** to **Running**. Child calls `execvp("ls", argv)`. ==The kernel replaces Child's text, data, bss, heap, and stack segments with the `/usr/bin/ls` binary image while preserving open file descriptors, resets the program counter to `_start()`, and continues execution in the Running state.==
5. *Child Termination (Running → Done / Zombie):* Child finishes listing directory contents and calls `exit(0)`. The kernel reclaims Child's memory address space, saves its exit status (`0`) in the process table, and transitions Child briefly to the Zombie state.
6. *Parent Unblocking & Reaping (Blocked → Ready → Running → Done):* Child's termination generates `SIGCHLD`, unblocking Parent. Parent transitions from **Blocked** to **Ready**, is scheduled to **Running**, reads Child's exit status via `waitpid()`, and reaps Child (transitioning Child to **Done**). Parent continues executing subsequent code.
## Connections
*Lecture Framing:* Lec02 and Lec03 provide foundational process control frameworks and state-machine transitions:
- Lec02 introduces process lifecycle state transitions (**New** → **Ready** → **Running** → **Blocked** → **Done**), `_start()` execution, process tree hierarchies rooted at `init`/`systemd` (PID 1), and `fork()` return value semantics.
- Lec03 introduces the six `exec` variant pairs (`execl`/`execv`, `execle`/`execve`, `execlp`/`execvp`/`execvpe`), emphasizing `p` for `PATH` search and `e` for custom environment arrays. It also establishes the three-way process state taxonomy: **zombie** (child exited before parent `wait`), **orphan** (child whose parent exited first, adopted by PID 1), and **daemon** (intentionally orphaned background process).
- *Lab 01 Content:* Lab 01 provides explicit C code implementations (`fork.c`, `wait_stat.c`) demonstrating canonical error-checking if/else structures and status inspection macros (`WIFEXITED`, `WEXITSTATUS`, `WIFSIGNALED`, `WTERMSIG`), ==which represents lab-only hands-on material that lecture slides introduced conceptually without walking through line-by-line code implementations.==
*Textbook Connections:* (pending Chapter 3).
## Open Questions
- [ ] Implement a custom shell program in C that reads command strings, parses arguments, and executes commands using `fork()`, `execvp()`, and `waitpid()`.
- [ ] ==Verify WNOHANG non-blocking behavior by polling a sleeping child process in a loop using waitpid().==
- [ ] Demonstrate orphan process adoption by having a parent process exit immediately after `fork()` and printing the child's `getppid()` value before and after parent termination.
- [ ] Trace open file descriptor preservation across `exec` by opening a file descriptor in a parent process and writing to it from an `exec`'d child binary.
## Flashcards
How do `exec` functions replace a process image while preserving existing descriptors?::An `exec` call overwrites the process's text, data, bss, heap, and stack segments with a new binary image from disk and resets the program counter, but preserves the original process ID and open file descriptors unless the `FD_CLOEXEC` flag is set. #cards/ai
What is the fundamental difference between `wait()` and `waitpid()` with `WNOHANG`?::`wait()` unconditionally blocks the parent process in the Blocked state until any child terminates, whereas `waitpid()` with `WNOHANG` checks if a specific child has exited and returns `0` immediately if it is still running, allowing non-blocking polling. #cards/ai
==What distinguishes a zombie process from an orphan process in UNIX process management?==::==A zombie is a terminated child whose parent has not yet called `wait()` to collect its exit status, whereas an orphan is a running or terminated child whose parent exited first, causing the child to be adopted by `init`/`systemd` (PID 1) which reaps its exit status.== #cards/ai
Why does `vfork()` suspend the parent process until the child calls `exec()` or `_exit()`?::`vfork()` runs the child directly in the parent's memory address space without copying pages; suspending the parent prevents data corruption or race conditions until the child loads a new program or terminates. #cards/ai
How do status inspection macros `WIFEXITED` and `WEXITSTATUS` evaluate child termination?::`WIFEXITED(status)` checks if the child terminated normally via `exit()`, `_exit()`, or `return` from `main()`, and `WEXITSTATUS(status)` extracts the low-order 8 bits of the integer exit status passed by the child. #cards/ai
What happens to open file descriptors when a process invokes an `exec` family function?::Open file descriptors remain open across `exec` and are inherited by the new program image, sharing file table entries and file offsets, unless individual descriptors have the close-on-exec (`FD_CLOEXEC`) flag set. #cards/ai
## Examples Worth Keeping
<!-- Keep concrete examples, numbers, cases, or worked reasoning that makes the mechanism memorable. -->
- 
## Connections
<!-- Link the matching lecture/week, course map, and only concept notes that actually exist or were created. -->
- Lecture:
- Concept:
## Flashcards
<!-- Add 3–8 atomic cards testing mechanisms and contrasts to #cards/<course-slug>. -->
