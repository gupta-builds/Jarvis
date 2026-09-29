---
type: class
input_kind: book
status: seed
created: 2026-09-26
updated: 2026-09-29
area:
  - "[[CSCI 4061 Board]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]]"
tags:
  - "#class"
  - "#Textbook"
next: "Feed this chapter into Week - 1's Textbook integration section, then build Week - 1"
---
# Chapter - 1 — UNIX System Overview
**Source:** W. Richard Stevens and Stephen A. Rago, *Advanced Programming in the UNIX Environment*, 3rd ed. (Addison-Wesley, 2013), Chapter 1, pp. 1-24.
**Read from:** `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\Textbook\Advanced Programming in the UNIX Environment, 3rd Edition.pdf`
**Course role:** Week 1 reading, paired with Chapters 7 and 8. Lec01 (9/8) uses this chapter only for orientation vocabulary (referee/illusionist/glue, the layer diagram, the three-program Hello World exercise) - it does not walk the chapter section by section, so several sections below (1.3, 1.4, 1.7, 1.8, 1.9, 1.10) are textbook-only content with no matching slide.
## Chapter Summary
UNIX exposes hardware and kernel services to every program through one disciplined boundary, the ==system call interface==, and everything else in this chapter (shell, files, processes, signals, time, error codes) is a convention built on top of that boundary (p. 1).
*Mechanism:* The kernel is the only software allowed to touch hardware directly. System calls are the sole entry points into it (p. 1). The C standard library wraps those calls in more convenient functions, and the shell is just another application that uses those library and system-call layers to launch other applications (p. 1-2). Course framing (Lec01) restates this as three OS roles: **referee** (enforces isolation and shares CPU/memory safely between processes), **illusionist** (fakes a dedicated, infinite machine for each process via virtual memory/virtual CPUs), and **glue** (unifies wildly different hardware behind one file/process/socket API).
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
- **root directory**: The top-level directory of the file system hierarchy, designated as `/` (p. 4).
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
- **thread**: Thread of control executing within a process address space, sharing that process's address space and file descriptors (p. 14).
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
## Full Reading Notes
### 1.1 Introduction
An **operating system** provides services for running programs: executing a new program, opening and reading a file, allocating a region of memory, retrieving the current time of day, and similar tasks (p. 1). The chapter is a whirlwind tour of UNIX terminology from a programmer's perspective, described here in much more compressed form than any later chapter treats it (p. 1).
### 1.2 UNIX Architecture
In a strict sense, an operating system is the software that controls the hardware resources of the computer and provides an environment under which programs can run - the **kernel** (p. 1). The interface to the kernel is a layer of software called **system calls** (p. 1). Libraries of common functions are built on top of the system-call interface, but applications are free to use either layer directly (p. 1-2). The **shell** is a special application that provides an interface for running other applications - not part of the OS itself, just a regular program (p. 2).
In a broad sense, an operating system consists of the kernel plus all the other software that gives a computer its personality: utilities, applications, shells, and common-function libraries (p. 2). Linux is technically only the kernel of the GNU/Linux combination, but "Linux" is commonly used for the whole broad-sense system - not strictly correct, but understandable given the two meanings of "operating system" (p. 2).
*Course Framing (Lec01):* The System-Call-API layer sits directly between user application code and the kernel; contemporary systems adhere to open standardization, so APUE "would more accurately be titled POSIX Systems Programming" (Lec01). ==In a strict sense, an operating system is the software called the kernel that controls hardware resources and provides an environment under which programs run, accessible only via system calls.==
> [!NOTE]
> "UNIX" and "POSIX" get used almost interchangeably in this course, and that is not fully precise. POSIX is the standardized API that Linux (and most modern UNIX-derived systems) implements; UNIX is the older lineage POSIX was standardized from. Lec01 flags this directly: you will hear people say "UNIX" when they mean "POSIX," and you have to get used to it rather than expect strict terminology.
### 1.3 Logging In
*Login Name:* Logging in requires entering a **login name** and password, which the system looks up in the **password file**, usually stored at `/etc/passwd` (p. 2). Password file entries consist of seven colon-separated fields: login name, encrypted password, numeric **user ID** (e.g. 205), numeric **group ID** (e.g. 105), a comment field, **home directory** (e.g. `/home/sar`), and login shell program (e.g. `/bin/ksh`) - shown concretely as `sar:x:205:105:Stephen Rago:/home/sar:/bin/ksh` (p. 2). All contemporary systems have moved the encrypted password itself to a different, more restricted file (p. 2).
*Shells:* A shell is a command-line interpreter reading user input interactively from a terminal or from a **shell script** file (p. 3). Common shell implementations include Bourne shell (`sh`), C shell (`csh`), Korn shell (`ksh`), Bourne-again shell (`bash`), TENEX C shell (`tcsh`), and Z shell (`zsh`) (p. 3).
### 1.4 Files and Directories
*File System:* The UNIX **file system** is a hierarchical arrangement of directories and files starting at the **root directory**, designated by `/` (p. 4). A **directory** is a file containing **directory entries**, each logically linking a filename to a structure describing that file's attributes (type, size, owner, permissions, modification time), retrieved via the **stat** and **fstat** functions (p. 4). Most real UNIX file systems don't actually store attributes inside the directory entry itself - that becomes clear once hard links are covered in Chapter 4, since one file can have several directory entries pointing at the same attributes (p. 4).
*Filenames:* The only two characters that cannot appear in a filename are `/` and the null character, but POSIX.1 recommends restricting filenames to letters, numbers, `.`, `-`, and `_` for portability and to avoid shell quoting headaches (p. 4). Historical UNIX limited filenames to 14 characters; BSD extended this to 255, and essentially all modern UNIX file systems support at least 255-character filenames (p. 5).
Creating a directory automatically generates two entries: **dot** (`.`, the current directory) and **dot-dot** (`..`, the parent directory); in the root directory, `..` is identical to `.` (p. 4).
*Pathnames:* A **pathname** is a slash-separated sequence of filenames. An **absolute pathname** begins with `/` and resolves from root; a **relative pathname** does not begin with `/` and resolves relative to the current working directory (p. 5).
*Example Code (ls implementation):* A bare-bones `ls(1)`-style directory listing program (p. 5-7):
```c
#include "apue.h"
#include <dirent.h>

int main(int argc, char *argv[]) {
    DIR *dp;
    struct dirent *dirp;
    if (argc != 2)
        err_quit("usage: ls directory_name");
    if ((dp = opendir(argv[1])) == NULL)
        err_sys("can't open %s", argv[1]);
    while ((dirp = readdir(dp)) != NULL)
        printf("%s\n", dirp->d_name);
    closedir(dp);
    exit(0);
}
```
Program details: includes the book's own header `apue.h` (Appendix B) and `<dirent.h>`, calls `opendir()` to get a `DIR *`, loops with `readdir()` to read `struct dirent` records and print `d_name`, closes the stream with `closedir()`, and handles errors via `err_sys`/`err_quit` (p. 7). Compiled with `cc myls.c` (or `gcc` on systems where `cc` is linked to it) into `a.out` (p. 6). Running it produces unsorted output, because this program doesn't sort - `ls` itself sorts before printing (p. 7):
```text
$ ./a.out /dev
.
..
cdrom
stderr
...
$ ./a.out /etc/ssl/private
can't open /etc/ssl/private: Permission denied
$ ./a.out /dev/tty
can't open /dev/tty: Not a directory
```
The notation `ls(1)` refers to the `ls` entry in Section 1 of the UNIX manual pages; sections run 1 through 8, alphabetized within each (p. 5-6). `man 1 ls` or `man -s1 ls` looks it up directly (p. 6). By convention, `exit(0)` means success and 1-255 means an error occurred - Section 8.5 covers how a calling program retrieves that exit status (p. 7).
*Working and Home Directories:* Every process has a **working directory** from which relative pathnames are evaluated, changed via `chdir` (p. 8). `doc/memo/joe` (relative) requires `doc` and `memo` to be directories, but the pathname alone doesn't reveal whether `joe` is a file or directory; `/usr/lib/lint` is absolute and always resolves from root (p. 8). Upon login, the working directory is set to the home directory from `/etc/passwd` (p. 8).
### 1.5 Input and Output
*File Descriptors:* **File descriptors** are small non-negative integers the kernel uses to identify files a process has open (p. 8). By convention every shell opens **standard input** (fd 0, `STDIN_FILENO`), **standard output** (fd 1, `STDOUT_FILENO`), and **standard error** (fd 2, `STDERR_FILENO`) for a new program, all connected to the terminal unless redirected - `ls > file.list` redirects only standard output (p. 8-9).
*Unbuffered I/O:* Provided directly by the system calls `open`, `read`, `write`, `lseek`, `close` (p. 8). Copying standard input to standard output with raw system calls (p. 8-9):
```c
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
`read` returns the number of bytes read (0 at end of file, -1 on error), and that count is reused directly as the byte count to `write` (p. 9). Running `./a.out > data` copies typed lines to `data` until Ctrl-D (end of file); `./a.out < infile > outfile` copies one file to another entirely through this loop (p. 9).
*Standard I/O:* The **standard I/O** functions buffer the unbuffered calls above, sparing the caller from picking a buffer size and simplifying line-based input like `fgets` (p. 10). Character-at-a-time copy using `getc`/`putc` (p. 10):
```c
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
*Course Framing (Lec01 Hello World Exercise):* Lec01 contrasts three implementations of printing "Hello, World!" that map directly onto the unbuffered-vs-buffered distinction above:
1. C standard library call: `printf("Hello, World!\n");` - buffered C stdio.
2. Direct system call wrapper: `write(STDOUT_FILENO, message, strlen(message));` - unbuffered kernel write.
3. Hand-written x86-64 assembly: loads 1 into `%rax` (syscall number for `write`), 1 into `%rdi` (`STDOUT_FILENO`), the message address into `%rsi`, length 14 into `%rdx`, then executes `syscall` directly (Lec01).
### 1.6 Programs and Processes
*Program:* A **program** is an executable file on disk, read into memory and executed by the kernel via one of seven `exec` functions (p. 10).
*Process and Process ID:* A **process** is an executing instance of a program (p. 11). Every process has a unique non-negative **process ID**, obtained via `getpid()` and cast to `long` for portable printing (p. 11):
```c
#include "apue.h"
int main(void) {
    printf("hello world from process ID %ld\n", (long)getpid());
    exit(0);
}
```
Running this twice in a row gives two different PIDs, e.g. `851` then `854` (p. 11) - each run is a fresh process.
*Process Control:* The three primary process-control functions are `fork`, `exec`, and `waitpid` (p. 11). `fork` creates a new process where the caller is the **parent process** and the new process is the **child process**; it is called once but returns twice (child PID to the parent, 0 to the child) (p. 11-13). A bare-bones shell that reads and runs commands (p. 11-13):
```c
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
Program details: `fgets` reads a line at a time and the trailing newline is replaced with a null byte so `execlp` gets a proper C string; `fork` spawns the child; the child calls `execlp` to replace itself with the requested program (fork+exec together is what some other OSes call "spawn," but UNIX keeps them as two separate calls); the parent calls `waitpid` and blocks until the child finishes (p. 12-13). Running it shows the custom `%` prompt distinguishing it from the real shell (p. 13):
```text
$ ./a.out
% date
Sat Jan 21 19:42:07 EST 2012
% who
sar        console Jan 1 14:59
% pwd
/home/sar/bk/apue/3e
% ^D
$
```
`^D` denotes Control-D, the default end-of-file character (p. 13). This toy shell's biggest limitation is that it can't pass arguments to the command it runs - only bare commands like `ls` work, never `ls -l somedir` - because the input line isn't parsed into separate argv entries (p. 13).
> [!NOTE]
> "Called once, returns twice" is the single most confusing sentence in this chapter on a first read. `fork()` really does execute one time in the parent's code, but the kernel then makes a second, near-identical process and both processes resume running from the exact same point right after the `fork()` call - so the *call* happens once, but *control returns from it* twice, once per process, distinguished only by the return value (child PID in the parent, 0 in the child).
*Threads:* **Threads** let multiple threads of control run within one process, sharing the same address space, file descriptors, and process attributes while each keeps its own stack, exploiting multiprocessor parallelism (p. 14).
### 1.7 Error Handling
UNIX functions signal failure with a negative return value (often -1) or a null pointer, and set the integer **errno** to indicate why (p. 14-15). `<errno.h>` defines `errno` and symbolic constants beginning with `E`; the man page `intro(2)` (or `errno(3)` on Linux) lists them (p. 15). POSIX and ISO C define `errno` as a modifiable lvalue - historically `extern int errno;`, but under threading each thread needs its own copy, so Linux expands it to a function-pointer macro: `#define errno (*__errno_location())` (p. 15).
Two rules govern `errno`: it is never cleared on success (check it only right after an error return), and no system function ever sets it to 0 (p. 15).
*Error Message Functions:* `strerror(int errnum)` (`<string.h>`) maps an error number to a message string; `perror(const char *msg)` (`<stdio.h>`) writes `msg`, a colon, a space, the message for the *current* `errno`, and a newline to standard error (p. 15).
```c
#include "apue.h"
#include <errno.h>
int main(int argc, char *argv[]) {
    fprintf(stderr, "EACCES: %s\n", strerror(EACCES));
    errno = ENOENT;
    perror(argv[0]);
    exit(0);
}
```
Running it produces (p. 16):
```text
$ ./a.out
EACCES: Permission denied
./a.out: No such file or directory
```
`argv[0]` is passed to `perror` by convention specifically so that a program running inside a pipeline (`prog1 < inputfile | prog2 | prog3 > outputfile`) can identify which of the three programs produced a given error message (p. 16).
*Error Recovery:* Errors split into **fatal errors** (no recovery action beyond printing a message and exiting) and **nonfatal errors** - usually temporary resource shortages like `EAGAIN`, `ENFILE`, `ENOBUFS`, `ENOLCK`, `ENOSPC`, `EWOULDBLOCK`, sometimes `ENOMEM`, `EBUSY` (shared resource busy), or `EINTR` (interrupted system call) - which can be retried, often with a delay or exponential backoff (p. 16-17).
> [!NOTE]
> The thread-local `errno` macro is worth sitting with. `errno` looks like an ordinary global variable everywhere in the code you write (`errno = ENOENT;`, `if (errno == EACCES)`), but under the hood `#define errno (*__errno_location())` means every reference is secretly a function call that returns a pointer into *that specific thread's* storage. Without this trick, two threads hitting errors at once would stomp on the same shared `errno`, and whichever thread checked it last would see the wrong error.
### 1.8 User Identification
*User ID:* A **user ID** is a numeric value the system administrator assigns; a process cannot change its own (p. 16). **User ID 0** is **root** or the **superuser**, whose processes bypass most file permission checks and can run restricted operations (p. 16-17).
*Group ID:* Assigned the same way in `/etc/passwd`, and used to collect users into shared-resource projects/departments via the group file, usually `/etc/group` (p. 17). Both IDs are stored numerically on disk (historically 2 bytes each, 4 bytes total; 32-bit on modern systems) because integer comparisons for permission checks are cheap and take less disk space than storing full ASCII names - `ls -l` maps the numeric IDs back to names using the password and group files for display (p. 17).
```c
#include "apue.h"
int main(void) {
    printf("uid = %d, gid = %d\n", getuid(), getgid());
    exit(0);
}
```
Sample run: `uid = 205, gid = 105` (p. 18).
*Supplementary Group IDs:* Introduced in 4.2BSD, letting a user belong to up to 16 additional groups at once (POSIX requires supporting at least 8); read from `/etc/group` at login (p. 18).
### 1.9 Signals
**Signals** notify a process that some condition occurred - dividing by zero raises `SIGFPE`, for example (p. 18). A process has three options: (1) ignore the signal (unwise for hardware-exception signals like divide-by-zero, since the result is undefined), (2) take the default action (often termination), or (3) catch it with a registered **signal handler** (p. 18-19). Signals are generated by terminal keys (interrupt key, often Ctrl-C, sends `SIGINT`; quit key, often Ctrl-\, sends `SIGQUIT`), hardware exceptions, or the `kill` function - which requires owning the target process, or being superuser (p. 18).
Adding an 11-line signal handler to the bare-bones shell from Section 1.6 so Ctrl-C prints a message instead of killing the shell (p. 19):
```c
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
Without the handler, Ctrl-C terminates the toy shell because `SIGINT`'s default action is termination; with it installed, the shell prints `interrupt` and a fresh prompt instead (p. 18-19). Chapter 10 covers signals in depth, since most nontrivial applications have to deal with them (p. 19).
### 1.10 Time Values
UNIX has historically tracked two time values (p. 20): **calendar time** (`time_t`), seconds since the **Epoch** (00:00:00 January 1, 1970 UTC), used for things like file modification timestamps; and **process time** / **CPU time** (`clock_t`), measured in **clock ticks** (historically 50, 60, or 100 per second).
When actually measuring a running process, UNIX tracks three separate values: **clock time** (wall clock time - total elapsed real time, which depends on what else the system is doing), **user CPU time** (time spent in the process's own instructions), and **system CPU time** (time the kernel spends on the process's behalf, e.g. inside `read`/`write`); user + system is often just called "the CPU time" (p. 20). The `time(1)` command measures all three for any command (p. 21):
```text
$ cd /usr/include
$ time -p grep _POSIX_SOURCE */*.h > /dev/null
real  0m0.81s
user  0m0.11s
sys   0m0.07s
```
### 1.11 System Calls and Library Functions
Every UNIX implementation exposes a fixed, well-defined set of kernel entry points - **system calls** - and that count has grown enormously: roughly 50 in Version 7 Research UNIX, about 110 in 4.4BSD, about 120 in SVR4, 380 in Linux 3.2.0, and over 450 in FreeBSD 8.0 (p. 21). System calls are documented in Section 2 of the UNIX manuals and are always defined in terms of C, regardless of the underlying implementation technique - each has a same-named wrapper function in the standard C library that the user process calls normally, which then invokes the kernel service however the platform requires (p. 21).
Section 3 of the manuals covers **library functions**: normal user-space code that may or may not call a system call underneath. `printf` calls `write`; `strcpy` and `atoi` never touch the kernel at all (p. 21-22). The practical difference: library functions can be replaced by an application (write your own `malloc`), but system calls cannot be replaced (p. 22).
*malloc vs. sbrk:* `malloc(3)` is a library function implementing one particular allocation strategy on top of the `sbrk(2)` system call, which only grows or shrinks the process's address space by some number of bytes and has no opinion about how that space gets managed - a program dissatisfied with `malloc`'s policy can write its own allocator on top of the same `sbrk` (p. 22).
*Time as another example:* rather than separate system calls for "the time" and "the date," UNIX has one system call returning seconds since the Epoch, and leaves date/timezone/daylight-saving interpretation entirely to library routines in user space (p. 22).
Because the distinction between a system call and a library function matters to implementors but barely matters to the programmer using both as ordinary C functions, this text (and this vault, following it) uses "function" loosely for either unless the distinction is the actual point (p. 23). Process-control system calls (`fork`, `exec`, `waitpid`) are typically called directly by application code, but convenience library routines like `system` and `popen` wrap them for common cases - Section 8.13 implements `system` from scratch, and Section 10.18 fixes its signal handling (p. 23).
> [!NOTE]
> The `malloc`/`sbrk` split is the same shape as `fopen`/`open` from earlier in this chapter: a system call gives the kernel a minimal, general primitive, and a library function builds a specific, convenient policy on top of it in user space, without needing kernel changes. Once this pattern clicks for one pair (`sbrk`/`malloc`), it explains the buffered-vs-unbuffered I/O split too.
## Worked Example
The three-program Hello World exercise (Lec01) contrasts three execution layers on the same one-line goal:
1. *C Standard Library (`printf`):* `printf("Hello, World!\n")` formats the string into a user-space stdio buffer for `stdout`. The library flushes that buffer by calling the low-level `write()` wrapper, which sets up registers and triggers the transition into kernel mode.
2. *Direct System Call (`write`):* `write(STDOUT_FILENO, message, strlen(message))` skips stdio buffering entirely. The C library wrapper places `STDOUT_FILENO` (1), the string pointer, and the byte count into the architecture's calling-convention registers and executes the CPU trap instruction straight into the kernel.
3. *Hand-written Assembly (`syscall`):* ==`movq $1, %rax` loads the system-call number for `sys_write` into `%rax`, `movq $1, %rdi` sets file descriptor 1, `movq $msg, %rsi` sets the message address, `movq $14, %rdx` sets the byte length, and the `syscall` instruction triggers an immediate hardware transition into the kernel's dispatcher without going through any C runtime function at all.==
All three print the identical output; the difference is entirely in how many layers of convenience sit between the programmer's intent and the actual `write` system call.
## Connections
- **Lecture (Lec01, 9/8):** Orientation-level only, does not walk Chapter 1 section by section. Supplies the referee/illusionist/glue framing, the layer diagram (User Application -> C Standard Library -> System Call API -> Kernel -> Hardware), the POSIX/UNIX naming caveat, and the three-program Hello World exercise. **No slide coverage exists** for Section 1.3 (`/etc/passwd`), 1.4's directory APIs (`opendir`/`readdir`), 1.7 (`errno`/`strerror`/`perror`), 1.8 (user/group IDs), 1.9 (`signal()`), or 1.10 (`time_t`/`clock_t`) - those five sections are textbook-only for this course so far.
- **Textbook (Chapter 7):** Chapter 7 continues exactly where 1.6 and 1.11 leave off - `main`'s real entry sequence (`_start()` before `main()`), the process memory segments only sketched here, `exit`/`atexit` mechanics beyond the one signal-handler example in 1.9, and the `malloc`/`sbrk` split from 1.11 described in full with `calloc`/`realloc`/`free`.
- **Lab:** Lab 1's `fork_exec.c`/`fork_wait.c` exercises are a direct, hands-on repeat of the bare-bones-shell pattern in Section 1.6 (fork, then either exec in the child or wait in the parent).
## Open Questions
- [ ] Verify on the course's Docker environment how `errno` is actually defined in `<errno.h>` (thread-local macro vs plain `extern int`).
- [ ] Compare the performance of unbuffered `read`/`write` against standard I/O `getc`/`putc` on a large file copy, and explain the gap using the buffering mechanism from 1.5/1.11.
- [ ] ==Test what a shell does when `SIGINT` is sent to a process catching the signal versus one that ignores it versus one that takes the default action.==
- [ ] Inspect `/etc/passwd` and `/etc/group` on the course container to trace real numeric UID/GID mappings back to login names.
- [ ] Why does `malloc` never return memory to the kernel even after `free` is called - what would have to change for it to do so?
## Flashcards
What is the fundamental difference between a system call and a C library function?::A system call enters kernel mode directly to perform a privileged hardware operation, whereas a library function executes in user space and may or may not invoke a system call underneath (`strcpy` never does; `printf` calls `write`). #cards/csci4061
Why is `errno` defined as a thread-local macro on modern POSIX systems?::==Expanding `errno` into `*__errno_location()` gives each thread its own isolated error slot, so one thread's error doesn't overwrite another thread's `errno` between the failing call and the check.== #cards/csci4061
`fork()` is described as "called once, returns twice." What does that actually mean?::The parent calls `fork()` a single time, but both the parent and the newly created child resume executing right after that call - the parent sees the child's PID as the return value, the child sees 0. #cards/csci4061
Why can't a program replace a system call the way it can replace a library function like `malloc`?::System calls are the kernel's own fixed entry points, implemented inside the kernel itself; a library function is ordinary user-space code sitting on top of those calls, so it can be swapped for a different implementation without touching the kernel. #cards/csci4061
What are the three time values `time(1)` reports for a command, and what does each one actually measure?::Clock (wall) time is total elapsed real time and depends on system load; user CPU time is time spent in the process's own instructions; system CPU time is time the kernel spends on the process's behalf, e.g. inside a `read` or `write`. #cards/csci4061
A signal handler is installed for `SIGINT` with `signal()`. What happens when the user presses Ctrl-C now, versus with no handler installed?::With no handler, `SIGINT`'s default action (terminate) runs. With a handler installed, the kernel suspends normal execution, runs the handler in user space, and resumes where the process left off once the handler returns - the process is not terminated unless the handler itself calls `exit`. #cards/csci4061
What is the actual relationship between `malloc` and `sbrk`?::`sbrk` is the system call that grows or shrinks a process's heap by a raw byte count with no policy attached; `malloc` is a library function that implements one specific allocation strategy (tracking free blocks, alignment, etc.) on top of repeated `sbrk` calls. #cards/csci4061
