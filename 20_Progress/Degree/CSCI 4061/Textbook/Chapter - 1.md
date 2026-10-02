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
# Chapter - 1
## Chapter Summary
<!-- State the chapter's one-sentence claim and use exactly one ==highlight== anchor. -->
== ==
*Mechanism:*
<!-- Explain how the chapter's claim works. -->
### 1.1 Introduction
An **operating system** provides services for running programs, such as executing a new program, opening and reading files, allocating memory regions, and retrieving the current time of day (p. 1). Chapter 1 provides a whirlwind programmer's tour of fundamental UNIX concepts and terminology (p. 1).
### 1.2 UNIX Architecture
In a strict sense, an operating system is defined as software that controls hardware resources and provides an environment under which programs run, termed the **kernel** (p. 1).
The interface to the kernel is a software layer called **system calls** (p. 1).
Common function libraries are built on top of the system call interface, though applications are free to use both (p. 1–2).
A **shell** is a special application providing an interface to run other applications (p. 2).
In a broad sense, an operating system encompasses the kernel plus all system software, utilities, applications, shells, and libraries that make a computer useful (p. 2).
*Course Framing (Lec01):* The operating system acts as a **referee** (managing hardware resources, enforcing isolation, and protecting processes), an **illusionist** (providing virtual abstractions such as virtual memory and virtual processors), and **glue** (providing unified system services, file systems, and device abstractions). The System-Call-API layer sits directly between user application code and the kernel. Given that contemporary systems adhere to open standardization, APUE "would more accurately be titled POSIX Systems Programming" (Lec01). ==In a strict sense, an operating system is defined as the software called the kernel that controls hardware resources and provides an environment under which programs run, accessible via system calls.==
### 1.3 Logging In
*Login Name:* Logging in requires entering a **login name** and password, which the system looks up in the **password file**, usually stored at `/etc/passwd` (p. 2).
Password file entries consist of seven colon-separated fields: login name, encrypted password, numeric **user ID**, numeric **group ID**, comment field, **home directory**, and login shell program (p. 2).
*Shells:* A shell is a command-line interpreter reading user input interactively from a terminal or from a **shell script** file (p. 3).
Common shell implementations summarized in Figure 1.2 include Bourne shell (`sh`), C shell (`csh`), Korn shell (`ksh`), Bourne-again shell (`bash`), TENEX C shell (`tcsh`), and Z shell (`zsh`) (p. 3).
### 1.4 Files and Directories
*File System:* The UNIX **file system** is a hierarchical arrangement of directories and files starting at the **root** directory, designated by `/` (p. 4).
*Directories:* A **directory** is a file containing **directory entries**, each logically linking a filename to a structure containing file attributes (file type, size, owner, permissions, modification time) retrieved via the **stat** and **fstat** functions (p. 4).
Creating a directory automatically generates two entries: **dot** (`.`, referring to the current directory) and **dot-dot** (`..`, referring to the parent directory); in root, `..` is identical to `.` (p. 4).
*Pathnames:* A **pathname** is a slash-separated sequence of filenames. An **absolute pathname** begins with `/` and resolves from root, whereas a **relative pathname** does not begin with `/` and resolves relative to the current working directory (p. 5).
*Working and Home Directories:* Every process has a **working directory** (or current working directory) from which relative pathnames are evaluated, which a process can change using `chdir` (p. 8). Upon login, the working directory is set to the user's home directory from `/etc/passwd` (p. 8).
*Example Code (ls implementation):* The following code lists all files in a directory, demonstrating directory traversal APIs (p. 5–7):
```c
#include "apue.h"
#include <dirent.h>

int main(int argc, char *argv[]) {
    DIR *dp;
    struct dirent *dirp;
    if (argc != 2)
        err_quit("usage: ls directory_name");
    if ((dp = opendir(argv)) == NULL)
        err_sys("can't open %s", argv);
    while ((dirp = readdir(dp)) != NULL)
        printf("%s\n", dirp->d_name);
    closedir(dp);
    exit(0);
}
```

Program details: includes custom header `apue.h` (Appendix B) and `<dirent.h>`, calls `opendir()` to obtain a `DIR` pointer, loops with `readdir()` to read `struct dirent` records and print `d_name`, closes the stream with `closedir()`, handles errors via `err_sys` and `err_quit`, and exits with status 0 (p. 7). The notation `ls(1)` references Section 1 (user commands) of the system manual pages (p. 5).

### 1.5 Input and Output

_File Descriptors:_ **File descriptors** are small non-negative integers used by the kernel to identify files accessed by a process (p. 8). _Standard Streams:_ Shells associate file descriptor 0 with **standard input** (`STDIN_FILENO`), descriptor 1 with **standard output** (`STDOUT_FILENO`), and descriptor 2 with **standard error** (`STDERR_FILENO`), defined in `<unistd.h>` (p. 8–9). _Unbuffered I/O:_ Unbuffered I/O is provided by system calls `read` and `write` (p. 8–9). The following program copies standard input to standard output using buffer size `BUFFSIZE` (4096 bytes) (p. 8–9):

```
#include "apue.h"

#define BUFFSIZE 4096

int main(void) {
    int n;
    char buf[BUFFSIZE];
    while ((n = read(STDIN_FILENO, buf, BUFFSIZE)) > 0)
        if (write(STDOUT_FILENO, buf, n) != n)
            err_sys("write error");
    if (n < 0)
        err_sys("read error");
    exit(0);
}
```

_Course Framing (Lec01 Hello World Exercise):_ Lec01 contrasts three distinct implementations of printing "Hello, World!":

1. C standard library call: `printf("Hello, World!\n");` (uses buffered C stdio functions).
2. Direct system call wrapper: `write(STDOUT_FILENO, message, strlen(message));` (invokes unbuffered kernel write).
3. Hand-written x86-64 assembly: loads 1 into `%rax` (syscall number for `write`), 1 into `%rdi` (`STDOUT_FILENO`), message label address into `%rsi`, length 14 into `%rdx`, and executes `syscall` instruction (Lec01). _Standard I/O:_ **Standard I/O** functions provide a buffered interface to unbuffered system calls, handling automatic buffer allocation and line reading routines like `fgets` (p. 10). Example copying standard input to standard output character-by-character (p. 10):

```
#include "apue.h"

int main(void) {
    int c;
    while ((c = getc(stdin)) != EOF)
        if (putc(c, stdout) == EOF)
            err_sys("output error");
    if (ferror(stdin))
        err_sys("input error");
    exit(0);
}
```

### 1.6 Programs and Processes

_Program:_ A **program** is an executable file residing on disk in a directory, read into memory and executed by the kernel via one of seven `exec` functions (p. 10). _Process and Process ID:_ A **process** is an executing instance of a program (p. 11). Every process has a unique non-negative integer **process ID** obtained via `getpid()` and cast to `long` for portable printing (p. 11):

```
#include "apue.h"

int main(void) {
    printf("hello world from process ID %ld\n", (long)getpid());
    exit(0);
}
```

_Process Control:_ Primary process control functions are `fork`, `exec`, and `waitpid` (p. 11). The `fork` function creates a new process where the caller is the **parent process** and the newly created process is the **child process**; `fork` is called once but returns twice (returning the child PID to the parent, and 0 to the child) (p. 11–13). _Shell Implementation Example:_ A bare-bones shell program reading commands from standard input and executing them (p. 11–13):

```
#include "apue.h"
#include <sys/wait.h>

int main(void) {
    char buf[MAXLINE];
    pid_t pid;
    int status;

    printf("%% ");
    while (fgets(buf, MAXLINE, stdin) != NULL) {
        if (buf[strlen(buf) - 1] == '\n')
            buf[strlen(buf) - 1] = 0;
        if ((pid = fork()) < 0) {
            err_sys("fork error");
        } else if (pid == 0) {
            execlp(buf, buf, (char *)0);
            err_ret("couldn't execute: %s", buf);
            exit(127);
        }
        if ((pid = waitpid(pid, &status, 0)) < 0)
            err_sys("waitpid error");
        printf("%% ");
    }
    exit(0);
}
```

Program details: `fgets` reads line-by-line; newline is replaced with null byte; `fork` spawns a child process; child invokes `execlp` to execute the command file; parent calls `waitpid` to wait for child completion (p. 12–13). _Threads:_ **Threads** allow multiple threads of control within a single process, sharing the same address space, file descriptors, and process attributes while maintaining individual stacks to exploit multiprocessor parallelism (p. 14).
### 1.7 Error Handling
UNIX system functions indicate failure by returning a negative value (typically -1) or a null pointer, setting the integer variable **errno** to an error code indicating the underlying cause (p. 14).
The header `<errno.h>` defines `errno` and symbolic constants starting with `E` for each error condition, listed in manual page `intro(2)` or `errno(3)` (p. 14–15).
POSIX and ISO C define `errno` as a modifiable lvalue of type integer; in multithreaded environments, `errno` is defined as a thread-local variable via a macro expansion like `#define errno (*__errno_location())` to prevent thread interference (p. 14–15).
Two fundamental rules govern `errno`: its value is never cleared if a function succeeds (it should be examined only after an error return), and it is never set to 0 by any system function (p. 15).
*Error Message Functions:* C standard library functions format error messages: `strerror(int errnum)` maps an error number to a descriptive string pointer (`<string.h>`), while `perror(const char *msg)` outputs `msg`, a colon, space, the string for the current `errno`, and a newline to standard error (`<stdio.h>`) (p. 15).
```c
#include "apue.h"
#include <errno.h>

int main(int argc, char *argv[]) {
    fprintf(stderr, "EACCES: %s\n", strerror(EACCES));
    errno = ENOENT;
    perror(argv);
    exit(0);
}
```

Passing `argv` as the argument to `perror` is a standard UNIX convention allowing error messages in pipelines to identify their source program (p. 16). _Error Recovery:_ System errors fall into **fatal errors** (unrecoverable; print message and exit) and **nonfatal errors** (temporary resource shortages like `EAGAIN`, `ENFILE`, `ENOBUFS`, `ENOLCK`, `ENOSPC`, `EWOULDBLOCK`, `ENOMEM`, `EBUSY`, or `EINTR`; handled by delaying and retrying or applying exponential backoff) (p. 16–17).

### 1.8 User Identification

_User ID:_ A **user ID** is a numeric value assigned by the system administrator that uniquely identifies a user to the kernel for file access permission checks and cannot be changed by the user (p. 16). User ID 0 corresponds to **root** or the **superuser**, whose processes bypass most file permission checks and execute restricted system operations (p. 16–17). _Group ID:_ A **group ID** is a numeric value assigned in `/etc/passwd` that groups users into projects or departments to share resources defined in the group file `/etc/group` (p. 17). _Numeric Storage Rationale:_ The file system stores numeric user and group IDs on disk using 4 bytes (two 2-byte integers historically, 32-bit integers in contemporary systems) to conserve disk space and make permission checks integer comparisons rather than expensive string comparisons; tools like `ls -l` map numeric IDs to ASCII names via `/etc/passwd` and `/etc/group` (p. 17).

```
#include "apue.h"

int main(void) {
    printf("uid = %d, gid = %d\n", getuid(), getgid());
    exit(0);
}
```

_Supplementary Group IDs:_ Introduced in 4.2BSD, **supplementary group IDs** allow a user to belong to up to 16 additional groups simultaneously (POSIX requires supporting at least 8), retrieved from `/etc/group` at login to eliminate explicit group switching (p. 18).

### 1.9 Signals

_Definition:_ **Signals** are asynchronous software notifications delivered to a process by the kernel when a specific condition occurs (p. 18). _Signal Disposition:_ A process has three options for handling a signal: (1) ignore it (unadvisable for hardware exceptions like divide-by-zero or memory faults); (2) allow the default action to occur (typically terminating the process); or (3) catch it by registering a custom **signal handler** function (p. 18–19). _Signal Generation:_ Signals are generated by terminal keys (the interrupt key Ctrl-C/DELETE generates `SIGINT`; the quit key Ctrl-\ generates `SIGQUIT`), hardware exceptions (`SIGFPE`), or system calls like `kill()` (p. 18).

```
#include "apue.h"
#include <sys/wait.h>

static void sig_int(int);

int main(void) {
    char buf[MAXLINE];
    pid_t pid;
    int status;

    if (signal(SIGINT, sig_int) == SIG_ERR)
        err_sys("signal error");
    printf("%% ");
    while (fgets(buf, MAXLINE, stdin) != NULL) {
        if (buf[strlen(buf) - 1] == '\n')
            buf[strlen(buf) - 1] = 0;
        if ((pid = fork()) < 0) {
            err_sys("fork error");
        } else if (pid == 0) {
            execlp(buf, buf, (char *)0);
            err_ret("couldn't execute: %s", buf);
            exit(127);
        }
        if ((pid = waitpid(pid, &status, 0)) < 0)
            err_sys("waitpid error");
        printf("%% ");
    }
    exit(0);
}

void sig_int(int signo) {
    printf("interrupt\n%% ");
}
```

### 1.10 Time Values

_Calendar Time:_ **Calendar time** measures seconds elapsed since the **Epoch** (00:00:00 January 1, 1970, UTC) stored in the primitive system data type `time_t` and used for file timestamps (p. 20). _Process Time:_ **Process time** (or CPU time) measures processor resources consumed by a process in **clock ticks** (historically 50, 60, or 100 ticks per second) stored in primitive type `clock_t` (p. 20–21). _Time Measurements:_ Measuring execution time maintains three values: **clock time** (or **wall clock time**, total elapsed real time affected by system load), **user CPU time** (time spent executing user instructions), and **system CPU time** (time spent executing kernel code during system call execution); total **CPU time** is the sum of user and system CPU times, measurable via the `time(1)` command (p. 20–21).

### 1.11 System Calls and Library Functions

_System Calls:_ **System calls** provide a well-defined, direct entry-point interface into the kernel; total counts expanded from ~50 in V7 Research UNIX to 380 in Linux 3.2.0 and >450 in FreeBSD 8.0 (p. 21). _Library Functions:_ Standard C library functions reside in Section 3 of manuals, execute in user space, and appear syntactically identical to system calls, but may or may not invoke underlying system calls (e.g., `strcpy` and `atoi` perform no system calls, whereas `printf` calls `write`) (p. 21–22). _Difference in Replaceability:_ Library functions can be overridden or replaced by application-specific implementations, whereas kernel system calls cannot be replaced (p. 21). _Memory Allocation Separation:_ The system call `sbrk` expands or contracts process heap memory in the kernel, while the C library function `malloc` manages user-level memory allocation and garbage collection algorithms on top of `sbrk` (p. 21–22). _Time and Process Control Abstractions:_ The kernel `time` system call returns raw Epoch seconds, relying on library functions to handle timezones and daylight saving time; similarly, low-level process system calls (`fork`, `exec`, `waitpid`) are wrapped by convenience library functions like `system` and `popen` (p. 22–23).

## Chapter Summary

UNIX architecture abstracts hardware through a layered system-call interface enforced by the kernel, exposing unified abstractions for process lifecycles, hierarchical file systems, unbuffered and buffered I/O, and asynchronous signal handling. _Mechanism:_ ==System calls act as the fundamental boundary between user space and kernel space, allowing processes to request hardware services, manipulate file descriptors, clone process execution via fork/exec, and handle asynchronous hardware or software notifications.== C standard library functions build on top of these system calls to provide user-level buffering, string formatting, and memory management.

## Key Concepts

- **operating system**: Software that controls hardware resources and provides an environment under which programs run (p. 1).
- **kernel**: Software that provides the core operating system environment and resource control (p. 1).
- **system call**: Direct software layer interface providing entry points into the kernel (p. 1).
- **shell**: Command-line interpreter application that provides an interface to execute other applications (p. 2).
- **referee**: OS role managing hardware resources, enforcing isolation, and protecting processes (Lec01).
- **illusionist**: OS role providing virtualized abstractions such as virtual memory and processors (Lec01).
- **glue**: OS role offering unified system services, file systems, and device abstractions (Lec01).
- **login name**: User identifier entered at login to look up user account records (p. 2).
- **password file**: System database located at `/etc/passwd` storing user account fields (p. 2).
- **user ID**: Numeric value identifying a user to the kernel for permission checks (p. 2).
- **root** / **superuser**: Special user ID 0 possessing full privileges to bypass permission checks (p. 16).
- **group ID**: Numeric value assigning users to shared departmental/project resources (p. 2).
- **home directory**: Initial working directory set upon login from `/etc/passwd` (p. 2).
- **shell script**: File containing shell commands executed by an interpreter (p. 3).
- **file system**: Hierarchical tree arrangement of directories and files (p. 4).
- **root**: The top-level directory of the file system hierarchy, designated as `/` (p. 4).
- **directory**: File containing directory entries linking filenames to file attribute structures (p. 4).
- **directory entry**: Record inside a directory linking a filename to an i-node/stat structure (p. 4).
- **stat** / **fstat**: Functions returning file attributes and metadata (p. 4).
- **dot**: Directory entry `.` referring to the current directory (p. 4).
- **dot-dot**: Directory entry `..` referring to the parent directory (p. 4).
- **pathname**: Sequence of slash-separated filenames resolving a file location (p. 5).
- **absolute pathname**: Pathname starting with `/` that resolves relative to root (p. 5).
- **relative pathname**: Pathname not starting with `/` that resolves relative to current working directory (p. 5).
- **working directory**: Current process directory context used to evaluate relative pathnames (p. 8).
- **file descriptor**: Non-negative integer used by the kernel to identify open process files (p. 8).
- **standard input**: Default input file descriptor 0 (`STDIN_FILENO`) (p. 8).
- **standard output**: Default output file descriptor 1 (`STDOUT_FILENO`) (p. 8).
- **standard error**: Default error output file descriptor 2 (`STDERR_FILENO`) (p. 8).
- **unbuffered I/O**: Direct I/O system calls (`read`, `write`) executing immediately in kernel (p. 8).
- **standard I/O**: High-level C library I/O functions providing user-level buffering (p. 10).
- **program**: Executable file residing on disk (p. 10).
- **process**: An executing instance of a program in memory (p. 11).
- **process ID**: Unique non-negative integer identifying an active process (p. 11).
- **parent process**: Calling process that spawns a new process via `fork()` (p. 11).
- **child process**: Newly created process produced by `fork()` (p. 11).
- **thread**: Thread of control executing within a process address space (p. 14).
- **errno**: Global/thread-local variable holding system call error codes (p. 14).
- **fatal error**: Unrecoverable system error requiring termination (p. 16).
- **nonfatal error**: Recoverable temporary error eligible for retry (p. 16).
- **supplementary group ID**: Additional group membership assigned to a user process (p. 18).
- ==**signal**==: Asynchronous software notification delivered to a process by the kernel (p. 18).
- **signal handler**: Function registered by a process to catch and process specific signals (p. 19).
- **calendar time**: Seconds elapsed since the Epoch, represented by `time_t` (p. 20).
- **Epoch**: Starting point of calendar time: 00:00:00 Jan 1, 1970 UTC (p. 20).
- **process time** / **CPU time**: Central processor resource time consumed by a process in clock ticks (p. 20).
- **clock tick**: Hardware frequency unit measuring CPU time intervals (p. 20).
- **clock time** / **wall clock time**: Real elapsed time required to execute a process (p. 20).
- **user CPU time**: CPU execution time spent in user code instructions (p. 21).
- **system CPU time**: CPU execution time spent in kernel code for system calls (p. 21).

## Worked Example

The three-program Hello World exercise contrasts three execution layers:

1. _C Standard Library (`printf`):_ Program calls `printf("Hello, World!\n")`, which formats the string into a user-space standard I/O buffer associated with `stdout`. The standard I/O library flushes this buffer by calling the low-level `write()` wrapper function, which sets up registers and triggers the hardware transition to kernel mode.
2. _Direct System Call (`write`):_ Program calls `write(STDOUT_FILENO, message, strlen(message))`, bypassing stdio library buffering completely. The C library wrapper places `STDOUT_FILENO` (1), string pointer, and byte count into architecture-defined registers and executes the CPU trap instruction, entering kernel space directly to write bytes to the terminal file description.
3. _Hand-written Assembly (`syscall`):_ Program executes x86-64 assembly instructions directly: ==`movq $1, %rax` loads the system call number for `sys_write` into register `%rax`, `movq $1, %rdi` sets file descriptor 1, `movq $msg, %rsi` sets memory address, `movq $14, %rdx` sets byte length, and the `syscall` instruction triggers an immediate CPU hardware transition into the kernel system-call dispatcher without invoking C runtime functions or compiler wrappers.==

## Connections

_Lecture Framing:_ Lec01 is orientation-level framing only and does not walk Chapter 1 section by section. It introduces overarching mental models: the OS as referee (resource protection/isolation), illusionist (virtual memory/CPUs), and glue (unified device abstractions); the layer diagram (User Application -> C Standard Library -> System Call API -> Kernel -> Hardware); POSIX/Linux naming distinctions; and the three-program Hello World exercise. _Lecture Coverage Gaps:_ The following chapter sections have zero coverage in Lec01 slides: Section 1.3 (Logging In / `/etc/passwd`), Section 1.4 (Files/Directories APIs `opendir`/`readdir`), Section 1.7 (Error Handling `errno`/`strerror`/`perror`), Section 1.8 (User/Group IDs and supplementary groups), Section 1.9 (Signal handling with `signal()`), and Section 1.10 (Time values `time_t`/`clock_t`). _Textbook Connections:_ (pending Chapter 7).

## Open Questions

- [ ] Verify on local Linux environment how `errno` is defined in `<errno.h>` for multithreaded programs vs single-threaded programs.
- [ ] Compare performance of unbuffered `read`/`write` vs standard I/O `getc`/`putc` on large file copies.
- [ ] ==Test shell behavior when `SIGINT` is sent to a process catching the signal versus ignoring the signal.==
- [ ] Inspect `/etc/passwd` and `/etc/group` to trace numeric UID/GID mappings to login names.

## Flashcards

What is the fundamental difference between a system call and a C library function?::A system call enters kernel mode directly to perform privileged hardware operations, whereas a library function executes in user space and may or may not invoke underlying system calls. #cards/ai Why is `errno` defined as a thread-local variable in modern POSIX systems?::==Defining `errno` via a thread-local function pointer ensures each thread maintains an isolated error state, preventing race conditions where one thread overwrites another thread's error code.== #cards/ai How do unbuffered I/O and standard I/O differ in buffering mechanics?::Unbuffered I/O (`read`/`write`) invokes a kernel system call on every operation, whereas standard I/O (`getc`/`putc`/`printf`) accumulates data in a user-space buffer to minimize expensive context switches. #cards/ai What happens when a process receives a signal for which it has registered a custom signal handler?::The kernel temporarily interrupts normal instruction execution, invokes the registered signal handler function in user space, and resumes normal execution upon handler return. #cards/ai What are the three components of process execution time returned by the `time(1)` utility?::Wall clock time (total elapsed real time), user CPU time (time executing user instructions), and system CPU time (time executing kernel code on behalf of the process). #cards/ai
## Examples Worth Keeping
<!-- Keep concrete examples, numbers, cases, or worked reasoning that makes the mechanism memorable. -->
- 
## Connections
<!-- Link the matching lecture/week, course map, and only concept notes that actually exist or were created. -->
- Lecture:
- Concept:
## Flashcards
<!-- Add 3–8 atomic cards testing mechanisms and contrasts to #cards/<course-slug>. -->
