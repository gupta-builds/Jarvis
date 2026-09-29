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
next: "Feed this chapter into Week - 1/Week - 2's Textbook integration sections, then build the weekly notes"
---
# Chapter - 7 — Process Environment
**Source:** W. Richard Stevens and Stephen A. Rago, *Advanced Programming in the UNIX Environment*, 3rd ed. (Addison-Wesley, 2013), Chapter 7, pp. 197-226.
**Read from:** `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\Textbook\Advanced Programming in the UNIX Environment, 3rd Edition.pdf`
**Course role:** Week 1-2 reading, the single-process picture that Chapter 8 (process control: `fork`/`exec`/`wait`) builds on. Lec02 (9/10) and Lec03 (9/15) supply the course framing for `main()`/`_start()`, memory layout, and environment variables; Sections 7.10 (`setjmp`/`longjmp`) and 7.11 (`getrlimit`/`setrlimit`) have **no matching lecture coverage anywhere in Lec01-06** - they are textbook-only for this course so far.
## Chapter Summary
A C process runs inside an environment the kernel and C runtime build for it before `main` ever executes, and that same environment - memory layout, command-line arguments, environment variables, resource limits - determines ==how the process can allocate memory, read configuration, and eventually terminate== (p. 197).
*Mechanism:* When a process is launched via `exec`, the kernel loads its text and data segments into virtual memory, sets up the stack, and transfers control to a **C start-up routine** (`_start()`) rather than to `main` directly. `_start()` extracts `argc`/`argv` and the environment from what the kernel handed it, calls `main`, and - if `main` returns - passes its return value to `exit()`. Normal termination flushes standard I/O buffers and runs any registered `atexit` handlers; dynamic memory comes from the heap via `sbrk`/`malloc`; environment variables live in a heap-relocatable pointer array; and `setjmp`/`longjmp` let code jump back through several stack frames at once, bypassing the normal one-frame-at-a-time function return.
## Key Concepts
- **main**: The function a C program appears to start at, prototyped `int main(int argc, char *argv[])` (p. 197).
- **argc**: Non-negative count of command-line arguments (p. 197).
- **argv**: Array of pointers to null-terminated argument strings; POSIX/ISO C guarantee `argv[argc]` is `NULL` (p. 197, 203).
- **C start-up routine** / **_start()**: The kernel-designated real entry point, which sets up arguments/environment and calls `main()` (p. 197; Lec02).
- **exit**: ISO C function that flushes standard I/O buffers, runs `atexit` handlers, then returns to the kernel (p. 198-199).
- **_exit** / **_Exit**: POSIX/ISO C functions that return to the kernel immediately, skipping cleanup and handlers (p. 198).
- **exit status**: The integer argument to an exit function, retrievable by the parent process (p. 198).
- **exit handler**: A function registered with `atexit()`, run in reverse registration order when `exit()` is called (p. 200).
- **atexit**: ISO C function registering at least 32 exit handlers (p. 200).
- **command-line arguments**: Strings passed to a program by whichever process called `exec` (p. 203).
- **environment list** / **environ**: The array of `name=value` C strings passed to every process, reachable through the global `extern char **environ;` (p. 203-204).
- **text segment**: Read-only, sharable machine instructions loaded from the executable (p. 204).
- **initialized data segment**: Global/static variables explicitly given a value in source code (p. 204).
- **uninitialized data segment** / **bss**: Global/static variables with no explicit initializer, zero-filled by `exec` at load time, never stored on disk (p. 204-205).
- **heap**: Region for dynamic allocation, between bss and the stack, growing upward (p. 205).
- **stack**: Region holding automatic variables and call frames, growing downward toward the heap (p. 205).
- ==**stack overflow**==: What happens when the growing stack and growing heap collide in virtual address space (Lec02).
- **ELF**: Executable and Linkable Format, the binary layout the OS loader reads into memory (Lec02).
- **shared library**: Library code kept once in memory/disk and referenced by every process that links against it, instead of copied into each executable (p. 206).
- **malloc** / **calloc** / **realloc** / **free**: The ISO C dynamic-memory functions - allocate uninitialized, allocate zeroed, resize, and release, respectively (p. 207-208).
- **sbrk**: System call that grows or shrinks a process's heap boundary; what `malloc` is built on (p. 208).
- **memory leak**: Allocated memory that is never `free`d, so the process's address space keeps growing (p. 209).
- **alloca**: Allocates directly on the current function's stack frame, freed automatically on return (p. 210).
- **getenv** / **setenv** / **putenv** / **unsetenv**: Library functions to read, add/replace, add, and remove a single environment variable (p. 210-212).
- **setjmp** / **longjmp**: Nonlocal-goto functions that save and later restore stack/register state across multiple function-call frames (p. 213, 215).
- **jmp_buf**: The opaque type `setjmp`/`longjmp` use to hold saved execution state (p. 216).
- **volatile**: Type qualifier telling the compiler not to keep a variable only in a register across a `setjmp`/`longjmp` boundary (p. 219).
- **resource limit**: A per-process ceiling (soft and hard) on things like open files, CPU time, or stack size, read/set with `getrlimit`/`setrlimit` (p. 220).
- **soft limit** / **hard limit**: The currently enforced ceiling versus the maximum the soft limit can be raised to without superuser privilege (p. 221).
## Full Reading Notes
### 7.1 Introduction
Before Chapter 8's process-control primitives (`fork`/`exec`/`wait`), this chapter covers the environment a single process runs in: how `main` gets called, how command-line arguments and the environment reach it, the typical memory layout, dynamic memory allocation, the several ways a process can terminate, `setjmp`/`longjmp` nonlocal branching, and per-process resource limits (p. 197).
### 7.2 main Function
Execution starts at `int main(int argc, char *argv[]);`, where `argc` is the argument count and `argv` points to the argument array (p. 197). When the kernel runs a program via one of the `exec` functions (Section 8.10), it does not call `main` directly - a special **start-up routine** runs first, set as the program's entry point by the link editor. This routine takes the raw command-line arguments and environment from the kernel and arranges the call to `main` (p. 197).
*Course Framing (Lec02):* `main()` is "just another C function," not the true entry point. The real entry point is **`_start()`**, which the C runtime/compiler provides automatically (you can write your own, as in Lecture 1's assembly Hello World). `_start()` sets up the stack and heap, issues the `call` instruction into `main()`, and handles cleanup once `main` returns (Lec02). ==When a C program is executed by the kernel, `_start()` is the true entry point - it takes command-line arguments and the environment from the kernel, sets up the runtime, and only then calls `main()`.==
### 7.3 Process Termination
There are eight ways a process can terminate - five normal, three abnormal (p. 198):
- Normal: (1) returning from `main`, (2) calling `exit`, (3) calling `_exit`/`_Exit`, (4) the last thread returning from its start routine, (5) the last thread calling `pthread_exit`.
- Abnormal: (6) calling `abort`, (7) receiving a signal, (8) the last thread responding to a cancellation request.
If the start-up routine were written in C, the call to `main` would effectively look like `exit(main(argc, argv));` (p. 198).
*Exit Functions:* `exit` and `_Exit` are ISO C (`<stdlib.h>`); `_exit` is POSIX.1 (`<unistd.h>`). Historically `exit` performs a clean shutdown of the standard I/O library - `fclose` on every open stream, flushing buffered output - before returning to the kernel; `_exit`/`_Exit` return immediately with none of that cleanup (p. 198-199). All three take a single integer **exit status**. If that status is omitted, or `main` does a bare `return` with no value, or `main` isn't declared to return `int`, the exit status is undefined - **except** that ISO C99 specifically made an implicit fall-off-the-end-of-`main` exit status default to 0 (this was undefined before C99) (p. 199).
```c
#include <stdio.h>
main() {
    printf("hello, world\n");
}
```
Compiled and run the ordinary way, the exit code is whatever garbage happened to be in a register/stack slot - `echo $?` might print `13` (p. 199). Compiled with `gcc -std=c99 hello.c` instead, the same program prints `0` for `echo $?`, because C99's explicit fall-off-the-end rule now applies (p. 200).
> [!NOTE]
> This "hello, world with a random exit code" example is easy to misread as a compiler bug. It isn't - it's a direct, visible consequence of the ISO C89 vs C99 rule change described just above. Before C99, "falling off the end of `main`" left the exit status genuinely undefined (whatever garbage was sitting in the return-value register), so `echo $?` could print anything. C99 nailed this down to 0. The takeaway for this course: always give `main` an explicit `return 0;` (or call `exit(0);`) rather than relying on either behavior.
*Exit Handlers:* ISO C guarantees at least 32 **exit handlers** via `atexit(void (*func)(void));` (returns 0 on success). `exit()` calls them in reverse order of registration, and a handler registered twice is called twice (p. 200-201).
```c
#include "apue.h"
static void my_exit1(void);
static void my_exit2(void);
int main(void) {
    if (atexit(my_exit2) != 0)
        err_sys("can't register my_exit2");
    if (atexit(my_exit1) != 0)
        err_sys("can't register my_exit1");
    if (atexit(my_exit1) != 0)
        err_sys("can't register my_exit1");
    printf("main is done\n");
    return(0);
}
static void my_exit1(void) { printf("first exit handler\n"); }
static void my_exit2(void) { printf("second exit handler\n"); }
```
Output: `main is done`, `first exit handler`, `first exit handler`, `second exit handler` - `my_exit1` runs twice because it was registered twice, and reverse order puts `my_exit1` before `my_exit2` (p. 201-202).
*Program Lifecycle:* The only way a program starts is via one of the `exec` functions; the only way it voluntarily ends is `_exit`/`_Exit`, called either directly or implicitly through `exit`; a process can also be involuntarily ended by a signal (p. 202).
### 7.4 Command-Line Arguments
Whichever process calls `exec` supplies the new program's command-line arguments (p. 203). ISO C and POSIX.1 guarantee `argv[argc]` is `NULL`, so an argument loop can stop on `argv[i] == NULL` without consulting `argc` at all (p. 203).
```c
#include "apue.h"
int main(int argc, char *argv[]) {
    int i;
    for (i = 0; i < argc; i++)
        printf("argv[%d]: %s\n", i, argv[i]);
    exit(0);
}
```
`./echoarg arg1 TEST foo` prints each argument on its own line, `argv[0]` through `argv[3]` (p. 203).
### 7.5 Environment List
Each program receives an **environment list**: an array of character pointers, each pointing to a null-terminated `name=value` string (p. 203-204). The address of that array lives in the global `environ`: `extern char **environ;` (p. 203-204). Historically `main` took a third argument, `char *envp[]`, but ISO C only specifies two arguments and POSIX.1 says to use `environ` instead, since `envp` adds nothing `environ` doesn't already give (p. 204). Iterating the *entire* environment requires `environ` directly; reading one specific variable normally goes through `getenv`/`putenv`/`setenv` instead (Section 7.9) (p. 204).
```c
#include "apue.h"
extern char **environ;
int main(void) {
    char **ptr;
    for (ptr = environ; *ptr != NULL; ptr++)
        printf("%s\n", *ptr);
    exit(0);
}
```
### 7.6 Memory Layout of a C Program
A C program has historically been laid out in these pieces, low address to high (p. 204-206):
- **text**: machine instructions, usually shareable and read-only.
- **initialized data**: globals/statics with an explicit initializer (`int maxcount = 99;`), read from the executable file at load time.
- **uninitialized data (bss)**: globals/statics with no initializer (`long sum[1000];`), zeroed by the kernel before the program runs - never actually stored on disk in the executable, only the text and initialized data are.
- **heap**: dynamic allocation, sitting between bss and the stack, growing upward.
- **stack**: automatic variables and call frames, growing downward toward the heap.
On 32-bit Linux/x86, the text segment historically starts at `0x08048000` and the bottom of the stack starts just below `0xC0000000`, with a large unused virtual-address gap in between where the heap grows upward and the stack grows downward toward each other (p. 205).
*Course Framing & Executable Inspection (Lec02):* The **ELF** loader pipeline reads the executable off disk into memory. If the growing stack and growing heap collide, that's a **stack overflow**. Process-info getters `getcwd()`, `getpid()`, `getppid()` round out this picture of "what a running process actually has" (Lec02).
The `size(1)` command reports the byte sizes of the text/data/bss segments:
```text
$ size /usr/bin/cc /bin/sh
   text    data     bss     dec     hex  filename
 346919    3576    6680  357175   57337  /usr/bin/cc
 102134    1776   11272  115182   1c1ee  /bin/sh
```
The `dec`/`hex` columns are just the total of the three sizes in decimal and hex (p. 206).
### 7.7 Shared Libraries
**Shared libraries** keep one copy of common library routines in memory/on disk that every linked process references, instead of copying the routine into every executable file - this shrinks executables dramatically and lets a library be patched without relinking every program that uses it, at the cost of a small load-time and first-call overhead (p. 206). Example on one system: a statically linked `hello.c` is 879,443 bytes on disk (787,775 text / 6,128 data / 11,272 bss); the same program dynamically linked drops to 8,378 bytes (1,176 text / 504 data / 16 bss) (p. 206-207).
### 7.8 Memory Allocation
ISO C's three allocation functions (`<stdlib.h>`), all returning a non-null `void *` on success or `NULL` on error:
```c
void *malloc(size_t size);
void *calloc(size_t nobj, size_t size);
void *realloc(void *ptr, size_t newsize);
void free(void *ptr);
```
`malloc` gives `size` bytes of indeterminate content; `calloc` zero-fills space for `nobj` objects of `size` bytes each; `realloc` grows or shrinks a previously allocated block, moving it (copying old contents, freeing the old block) only if there isn't room to extend in place - passing `ptr == NULL` to `realloc` makes it behave exactly like `malloc(newsize)` (p. 207-208). All three guarantee alignment suitable for any data type (p. 207). `free` returns a block to the process's own free-memory pool - not to the kernel - so most implementations of `malloc`/`free` never actually shrink the process (p. 208).
These are usually built on the `sbrk(2)` system call, which grows/shrinks the heap directly (p. 208). Common, hard-to-debug mistakes: freeing an already-freed block, calling `free` on a pointer not obtained from one of the three alloc functions, and writing past the allocated region's bounds - the last of these can silently corrupt an unrelated object's record-keeping data or contents, with a crash that shows up much later and far from the actual bug (p. 208-209). A **memory leak** is simply `malloc` without a matching `free`, growing the process's address space and eventually degrading performance from paging overhead (p. 209).
*Alternate Allocators:* **libmalloc** (SVR4/Solaris, `mallopt`/`mallinfo`), **vmalloc** (per-region allocation strategy), **quick-fit** (faster than best-fit/first-fit, more memory use - most modern allocators build on this idea), **jemalloc** (FreeBSD 8.0 default, multithreaded-scalable), **TCMalloc** (Google, thread-local caches to avoid lock contention) (p. 209-210).
*alloca:* Same call signature as `malloc`, but allocates from the *current function's stack frame* instead of the heap - freed automatically on return, no `free` needed, but not universally supported and dangerous if the stack frame can't grow after the fact (p. 210).
### 7.9 Environment Variables
Environment strings are `name=value`; the kernel never interprets them, only applications and shells do (p. 210). `getenv(const char *name)` returns the value for `name` or `NULL` (p. 210-211). To modify: `putenv(char *str)` (XSI - inserts a `name=value` string directly, removing any old definition of `name`; passing a stack-allocated string is a bug because that memory is reused on return), `setenv(const char *name, const char *value, int rewrite)` (POSIX.1 - allocates its own storage for the string, replaces only if `rewrite` is nonzero), `unsetenv(const char *name)`, and `clearenv()` (wipes the whole list) (p. 212).
Mechanically: the initial environment array sits above the stack, where there's no room to grow. Changing an existing variable's value in place works only if the new value is no longer than the old one; otherwise `setenv` mallocs new storage and updates that one pointer. Adding a brand-new variable the first time requires mallocing an entirely new pointer array on the heap, copying the old pointers over, appending the new pointer and a `NULL` sentinel, and repointing `environ` at the new heap array; later additions just `realloc` that same heap array (p. 212-213).
*Inheritance (Lec02, Lec03, APUE):* Each process has its own environment; a child inherits a copy from its parent at `fork()`, and `exec()` propagates it into the new program image (via `environ` or explicitly via `execve`/`execle`). Changing a variable in a child affects only that child and any processes it later creates - never its parent (p. 203, 211).
*Course Framing - PATH and friends (Lec02, recapped at the start of Lec03):* Built-in-looking commands (`ls`, `make`) are ordinary programs, not shell magic - `which ls` reveals `/usr/bin/ls`. The **PATH** environment variable is what lets you type a bare command name: the shell splits `PATH` on `:` and searches each directory in order for a matching executable. `LD_PRELOAD` (force-load custom libraries first) and `LD_LIBRARY_PATH` (extra search directories) are sibling variables used by the dynamic linker/loader to find *shared libraries* rather than *programs* - a different search problem from `PATH`, solved the same way (Lec02).
### 7.10 setjmp and longjmp Functions
C's `goto` cannot jump into another function, so error handling that needs to unwind several stack frames at once (say, from `cmd_add`, two levels below `main`, but sometimes five or more levels down in real code) needs a different tool: **`setjmp`**/**`longjmp`**, a *nonlocal* goto that branches back through the call chain to a function still on the current call path (p. 213-215).
```c
#include <setjmp.h>
int setjmp(jmp_buf env);      // Returns: 0 if called directly, nonzero if returning from longjmp
void longjmp(jmp_buf env, int val);
```
`setjmp` is called from the point you want to return *to* (returns 0 there, since it's called directly); `longjmp(env, val)` is called later, from deep in the call chain, with the same `env` and a nonzero `val` that becomes `setjmp`'s *apparent* return value back at the original call site - a nonzero `val` argument lets one `setjmp` distinguish which of several possible `longjmp` sites triggered the jump (p. 215-217).
```c
#include "apue.h"
#include <setjmp.h>
jmp_buf jmpbuffer;
main(void) {
    if (setjmp(jmpbuffer) != 0)
        printf("error");
    while (fgets(line, MAXLINE, stdin) != NULL)
        do_line(line);
    exit(0);
}
...
void cmd_add(void) {
    int token = get_token();
    if (token < 0)
        longjmp(jmpbuffer, 1);
    /* rest of processing */
}
```
When `longjmp` fires, the stack is "unwound" straight back to `main`'s frame, discarding the `cmd_add` and `do_line` frames entirely, and `setjmp` in `main` returns as if it had just been called again - except this time with the value `1` (p. 216-217).
*Automatic, Register, and Volatile Variables:* After a `longjmp`, what happens to `main`'s automatic and register variables? The standards only say their values are **indeterminate** - most implementations don't try to roll them back, but nothing guarantees it either way. Global and static variables are always left alone (unaffected) by `longjmp` (p. 217-218). A demonstration compiles the same program with and without optimization (p. 218-219):
```c
static jmp_buf jmpbuffer;
static int globval;
int main(void) {
    int autoval; register int regival; volatile int volaval; static int statval;
    globval=1; autoval=2; regival=3; volaval=4; statval=5;
    if (setjmp(jmpbuffer) != 0) {
        printf("after longjmp: globval=%d autoval=%d regival=%d volaval=%d statval=%d\n",
               globval, autoval, regival, volaval, statval);
        exit(0);
    }
    globval=95; autoval=96; regival=97; volaval=98; statval=99;
    f1(autoval, regival, volaval, statval); /* calls f2(), which calls longjmp(jmpbuffer, 1) */
}
```
Without optimization, all five variables print `95 96 97 98 99` after the jump - everything was actually stored in memory. **With** `-O` optimization on, only `globval`, `volaval`, and `statval` still show `95 98 99`; `autoval` and `regival` roll back to their pre-jump values `2` and `3`, because the optimizer moved them into CPU registers, and register contents get restored to their state at the time `setjmp` was called, while memory contents reflect their state at the time `longjmp` was called (p. 219).
> [!NOTE]
> This is the entire practical reason `volatile` exists in this chapter. If you need an automatic variable's *post-jump* value to reliably be whatever it was right before the `longjmp` (not rolled back to its pre-`setjmp` value), you must declare it `volatile` - otherwise an optimizing compiler is free to keep it in a register, and registers get restored to the `setjmp`-time snapshot, silently discarding whatever you did to that variable in between. This is exactly the kind of bug that only appears with optimization flags on, which makes it brutal to debug from lecture alone.
*Potential Problem with Automatic Variables:* A related, more common bug: an automatic variable can never be referenced once the function that declared it has returned (p. 219-220).
```c
FILE *open_data(void) {
    FILE *fp;
    char databuf[BUFSIZ];      // on open_data's stack frame
    if ((fp = fopen("datafile", "r")) == NULL)
        return(NULL);
    if (setvbuf(fp, databuf, _IOLBF, BUFSIZ) != 0)
        return(NULL);
    return(fp);
}
```
`setvbuf` tells stdio to use `databuf` as `fp`'s buffer - but `databuf` lives on `open_data`'s stack frame, which is reclaimed the moment `open_data` returns. The next function called reuses that same stack space for its own frame, and stdio is still writing into what it thinks is `databuf`. The fix is to make `databuf` come from outside the stack entirely: `static`/`extern` storage, or one of the heap allocators (p. 220).
Chapter 10 revisits `setjmp`/`longjmp` in the context of signal handlers, via their signal-safe variants `sigsetjmp`/`siglongjmp` (p. 219).
### 7.11 getrlimit and setrlimit Functions
Every process has a set of **resource limits**, queried/changed with:
```c
#include <sys/resource.h>
int getrlimit(int resource, struct rlimit *rlptr);
int setrlimit(int resource, const struct rlimit *rlptr);
struct rlimit {
    rlim_t rlim_cur;  /* soft limit: currently enforced */
    rlim_t rlim_max;  /* hard limit: ceiling rlim_cur can be raised to */
};
```
Limits are normally set up by process 0 at boot and inherited by every descendant process (p. 220-221). Three rules govern changing them: (1) a process may lower its own soft limit to anything up to its hard limit, (2) a process may lower its own hard limit, but that lowering is **irreversible** for a normal (non-superuser) process, and (3) only a superuser process may *raise* a hard limit (p. 221). `RLIM_INFINITY` marks "no limit."
Selected resources: `RLIMIT_CORE` (max core-dump file size; 0 disables core dumps), `RLIMIT_CPU` (max CPU seconds - `SIGXCPU` on the soft limit), `RLIMIT_DATA` (max data-segment size: initialized + uninitialized data + heap, from Figure 7.6), `RLIMIT_FSIZE` (max file size a process may create - `SIGXFSZ` on the soft limit), `RLIMIT_NOFILE` (max open files per process), `RLIMIT_NPROC` (max child processes per real user ID), `RLIMIT_STACK` (max stack size) (p. 221-222). Shells expose these through built-ins (`ulimit` in Bourne/bash/Korn, `limit` in csh) since limits have to be set once and inherited by every future process the shell launches (p. 222).
```c
#include "apue.h"
#include <sys/resource.h>
static void pr_limits(char *, int);
int main(void) {
    pr_limits("RLIMIT_CORE", RLIMIT_CORE);
    pr_limits("RLIMIT_CPU", RLIMIT_CPU);
    pr_limits("RLIMIT_DATA", RLIMIT_DATA);
    pr_limits("RLIMIT_NOFILE", RLIMIT_NOFILE);
    pr_limits("RLIMIT_STACK", RLIMIT_STACK);
    exit(0);
}
static void pr_limits(char *name, int resource) {
    struct rlimit limit;
    if (getrlimit(resource, &limit) < 0)
        err_sys("getrlimit error for %s", name);
    printf("%-14s ", name);
    limit.rlim_cur == RLIM_INFINITY ? printf("(infinite) ") : printf("%10lld ", (long long)limit.rlim_cur);
    limit.rlim_max == RLIM_INFINITY ? printf("(infinite)\n") : printf("%10lld\n", (long long)limit.rlim_max);
}
```
Sample FreeBSD output shows most limits `(infinite)` except `RLIMIT_DATA` (536,870,912 bytes soft/hard) and `RLIMIT_NPROC`/`RLIMIT_NPTS` (3,520/1,760); sample Solaris output caps `RLIMIT_NOFILE` at 256 soft / 65,536 hard and `RLIMIT_STACK` at 8,388,608 soft / infinite hard (p. 223-224).
> [!NOTE]
> The soft/hard split is easy to blur together. The **soft limit** is what's actually enforced right now - hit it and you get an error or a signal (`SIGXCPU`, `SIGXFSZ`). The **hard limit** is just a ceiling on how high the soft limit is allowed to go without superuser privilege. A normal process can freely move its soft limit anywhere up to its hard limit (e.g. raise `RLIMIT_NOFILE`'s soft limit toward its hard limit to open more files), but it can never push the soft limit past the hard limit, and lowering its own hard limit is a one-way door.
### 7.12 Summary
Understanding a process's environment - startup, termination, argument/environment passing, memory layout, dynamic allocation, `setjmp`/`longjmp`, and resource limits - is the prerequisite for Chapter 8's process-control functions (p. 225).
## Worked Example
Resolving a bare command name like `ls` at the shell, tracing through the environment/library concepts above:
1. *Shell Parsing:* The shell sees `ls` has no `/` in it, unlike `./ls` or `/bin/ls`.
2. *PATH Lookup:* It reads its own `PATH` environment variable (e.g. `PATH=/usr/local/bin:/usr/bin:/bin`), a colon-separated list of directories.
3. *Directory Iteration:* It checks each directory in order for an executable named `ls`; finding it at `/usr/bin/ls`, it calls `execve("/usr/bin/ls", ...)`.
4. *Contrast with library lookup:* ==`LD_PRELOAD` and `LD_LIBRARY_PATH` solve a different problem for the dynamic linker at load/link time - locating shared object (`.so`) files - not locating the executable program itself, which is entirely `PATH`'s job.==
## Connections
- **Lecture (Lec02, 9/10; Lec03, 9/15):** Lec02 covers the compile/link pipeline (source -> assembly -> object -> linked executable), the ELF loader, the process memory picture (text/data/bss/heap/stack, heap and stack growing toward each other), `_start()` as the real entry point calling `main()`, and process-info getters (`getcwd`, `getpid`, `getppid`). The `PATH`/`LD_PRELOAD`/`LD_LIBRARY_PATH`/environment-inheritance material actually first appears in Lec02 (lines covering "Environment Variables" and "The PATH Environment Variable"), then gets recapped at the start of Lec03 before Lec03 moves on to low-level I/O - both lectures cite the same slides, so either citation is defensible, but Lec02 is the primary source.
- **Lecture coverage gaps:** Sections 7.3's full eight-termination-path list, 7.4's `argv[argc] == NULL` guarantee, 7.7 (shared libraries), 7.8's alternate allocators, 7.10 (`setjmp`/`longjmp`), and 7.11 (`getrlimit`/`setrlimit`) have no slide coverage in Lec01-06 - textbook-only for this course so far, and worth flagging if a quiz question draws only from lecture.
- **Textbook (Chapter 1):** Chapter 1 introduces `main`, processes, and `malloc`/`sbrk` at a sketch level (Sections 1.6, 1.11); this chapter is where each of those gets its full mechanism - the real startup sequence, the concrete memory-segment layout, and the complete `malloc`/`calloc`/`realloc`/`free` picture.
- **Forward (Chapter 8):** Chapter 8's `fork`/`exec`/`waitpid` rely directly on this chapter's termination taxonomy (Section 7.3) to define what a parent actually observes when a child exits normally vs. abnormally.
## Open Questions
- [ ] Write a test program that calls `setenv()` to add a new environment variable, and print the `environ` pointer's address before and after to actually observe the heap relocation described in 7.9.
- [ ] ==Verify experimentally how `atexit()` handlers interact with `exit()` versus `_exit()` - register a handler, then terminate via both paths and compare.==
- [ ] Reproduce the `-O` vs. no-optimization `setjmp`/`longjmp` variable-rollback example from 7.10 on the course's own container and confirm which variables actually change.
- [ ] Run `ulimit -a` inside the course Docker container and compare the real soft/hard limits against the book's FreeBSD/Solaris sample output.
- [ ] Why does declaring an automatic variable `volatile` fix the register-rollback problem in 7.10, but not the separate stack-lifetime bug in Figure 7.14?
## Flashcards
What is the real entry point of a C program, and what does it do before calling `main()`?::`_start()`, provided by the compiler/runtime, not `main()` itself. It takes `argc`/`argv` and the environment from the kernel, sets up the stack and heap, then calls `main()`, and passes `main`'s return value to `exit()` when it returns. #cards/csci4061
How do `exit()` and `_exit()` differ in what they do before the process actually terminates?::`exit()` flushes standard I/O buffers (`fclose` on every open stream) and runs registered `atexit()` handlers in reverse order; `_exit()`/`_Exit()` return to the kernel immediately, skipping all of that. #cards/csci4061
Why can `echo $?` print a different exit code for the exact same "hello, world" `main()` depending on the compiler standard used?::Before C99, falling off the end of `main` with no explicit `return` left the exit status genuinely undefined (whatever was in a register/stack slot); C99 specifically defines that case to be 0, so `-std=c99` changes the observed exit code from garbage to 0. #cards/csci4061
What structural memory reallocation happens the first time `setenv()` adds a brand-new environment variable to a process?::The initial environment array sits just above the stack with no room to grow, so `setenv()` mallocs a whole new pointer array on the heap, copies the old pointers into it, appends the new pointer and a `NULL` sentinel, and repoints the global `environ` at that heap array. #cards/csci4061
After a `longjmp`, why can an automatic variable's value differ between an unoptimized build and one compiled with `-O`?::The standard leaves automatic/register variable values after `longjmp` indeterminate. Without optimization, everything is stored in memory and reflects its state at `longjmp` time; with optimization, a variable the compiler moved into a register gets restored to its value at `setjmp` time instead - `volatile` is the fix, forcing memory storage. #cards/csci4061
Why does returning a `FILE *` from a function that called `setvbuf(fp, databuf, ...)` on a local `char databuf[BUFSIZ]` corrupt output later?::`databuf` lives on that function's stack frame, which is reclaimed the instant the function returns; stdio keeps writing through a pointer into memory that the next function call's stack frame now owns. Fix: make the buffer `static`/`extern` or heap-allocated. #cards/csci4061
What's the actual difference between a resource's soft limit and its hard limit?::The soft limit is what's enforced right now (exceeding it triggers an error or a signal like `SIGXCPU`); the hard limit is the ceiling the soft limit can be raised to. A normal process can move its soft limit anywhere up to the hard limit, but only a superuser process can raise the hard limit itself. #cards/csci4061
How do `LD_PRELOAD`/`LD_LIBRARY_PATH` differ from `PATH` in what they help resolve?::`PATH` tells the shell where to find an executable *program* by bare name. `LD_PRELOAD`/`LD_LIBRARY_PATH` tell the dynamic linker/loader where to find *shared libraries* (`.so` files) a program depends on - a different search happening at a different stage (load/link time vs. shell command lookup). #cards/csci4061
