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
# Chapter - 7
## Chapter Summary
<!-- State the chapter's one-sentence claim and use exactly one ==highlight== anchor. -->
== ==
*Mechanism:*
<!-- Explain how the chapter's claim works. -->
### 7.1 Introduction
An operating system process requires a structured environment before process control primitives can be invoked (p. 197). Chapter 7 examines how the **main** function is executed when a program starts, how **command-line arguments** and **environment variables** are passed, the typical **memory layout** of a process, methods for dynamic memory allocation, voluntary and involuntary **process termination**, non-local branching via **setjmp** and **longjmp**, and process **resource limits** (p. 197).
### 7.2 main Function
*Function Prototype:* A C program starts execution with the `main` function, prototyped as `int main(int argc, char *argv[]);` where **argc** specifies the non-negative count of command-line arguments, and **argv** is an array of pointers to null-terminated argument strings (p. 197).
*Execution Pipeline:* When a C program is executed by the kernel via an **exec** function, a special **C start-up routine** is called before `main` is invoked (p. 197). The executable file designates this routine as its starting address, which is configured by the **link editor** during compilation (p. 197). The start-up routine extracts argument lists and environment pointers from the kernel and sets up the call to `main` (p. 197).
*Course Framing (Lec02):* Contrary to the common misconception that `main()` is the program entry point, Lec02 clarifies that `main()` is "just another C function" called by the C runtime. ==When a C program is executed by the kernel, a special C start-up routine (**_start()**) serves as the program's true entry point, taking command-line arguments and environment lists from the kernel to set up the runtime environment before calling main().== The compiler-provided `_start()` routine initializes stack/heap memory, executes a `call` instruction to `main()`, and handles post-`main()` cleanup (Lec02).
### 7.3 Process Termination
*Termination Categories:* There are eight distinct ways for a process to terminate (p. 198). Normal termination occurs through five paths: (1) returning from `main`; (2) calling **exit**; (3) calling **_exit** or **_Exit**; (4) returning from the start routine of the last thread; or (5) calling **pthread_exit** from the last thread (p. 198). Abnormal termination occurs through three paths: (6) calling **abort**; (7) receiving a **signal**; or (8) responding to a cancellation request in the last thread (p. 198).
*Exit Functions:* Three primary functions terminate a program normally:
- `void exit(int status);` (ISO C, defined in `<stdlib.h>`): Performs a clean shutdown of the standard I/O library by calling **fclose** on all open streams (flushing output buffers), invokes all registered exit handlers, and returns to the kernel (p. 198–199).
- `void _Exit(int status);` (ISO C, defined in `<stdlib.h>`): Returns to the kernel immediately without running exit handlers or signal handlers (p. 198).
- `void _exit(int status);` (POSIX.1, defined in `<unistd.h>`): Returns directly to the kernel immediately; implemented as a system call on UNIX systems (p. 198).
*Exit Status:* The `status` integer argument passed to `exit`, `_exit`, or `_Exit` defines the process **exit status** (p. 198). Returning an integer from `main` is functionally equivalent to calling `exit` with that value (e.g., the start-up routine executes `exit(main(argc, argv))`) (p. 198). Returning from `main` without an explicit return statement yields an undefined exit status in C89, whereas ISO C99 defaults the return status to 0 (p. 199–200).
*Exit Handlers:* Under ISO C, a process can register up to at least 32 **exit handlers** via the **atexit** function, prototyped as `int atexit(void (*func)(void));` (returns 0 if OK, nonzero on error) (p. 200). Exit handlers take no parameters and return no values (p. 200). The `exit` function invokes registered exit handlers in reverse order of registration, calling a handler as many times as it was registered (p. 200–201).
*Program Lifecycle Diagram:* The following diagram illustrates program startup and termination paths (p. 201):
```
Kernel ──exec──> C start-up routine ──call──> main() ──call──> User Functions │ │ │ │ └───return / exit()────┘ │ │ ▼ ▼ _exit / _Exit <───exit() ◄────────────┘ │ │ │ ├──> Exit Handlers (atexit) │ └──> Standard I/O Cleanup (fclose) ▼ Kernel (Process Terminates)
```
*Exit Handler Example Code:*
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

static void my_exit1(void) {
    printf("first exit handler\n");
}

static void my_exit2(void) {
    printf("second exit handler\n");
}
```

Program output: `main is done`, followed by `first exit handler`, `first exit handler`, and `second exit handler` (p. 201).

### 7.4 Command-Line Arguments

_Argument Passing:_ When an executable is executed, the process calling `exec` passes command-line arguments to the new program image (p. 203). _Null Termination Guarantee:_ ISO C and POSIX.1 guarantee that `argv[argc]` is always a null pointer (`NULL`), allowing argument iteration loops to terminate on `argv[i] == NULL` without checking `argc` explicitly (p. 203). _Echo Example Code:_ The following program echoes all command-line arguments to standard output (p. 203):

```
#include "apue.h"

int main(int argc, char *argv[]) {
    int i;
    for (i = 0; i < argc; i++)
        printf("argv[%d]: %s\n", i, argv[i]);
    exit(0);
}
```

Executing `./echoarg arg1 TEST foo` outputs `argv: ./echoarg`, `argv: arg1`, `argv: TEST`, and `argv: foo` (p. 203).

### 7.6 Memory Layout of a C Program

_Memory Segments:_ Historically, a C program consists of five primary logical memory segments (p. 204–205):

- **text segment**: Machine instructions executed by the CPU, read from the executable file by `exec`; marked read-only to prevent accidental modification and shared among processes executing the same binary (p. 204).
- **initialized data segment**: Global and static variables explicitly initialized in C source code (e.g., `int val = 100;`), read from the executable file by `exec` (p. 204).
- **uninitialized data segment** (or **bss**, "block started by symbol"): Global and static variables not explicitly initialized in C source code (e.g., `long array;`), initialized to zero by `exec` before execution; not stored on disk within the executable binary (p. 204–205).
- **heap**: Memory region used for dynamic memory allocation via **malloc**, **calloc**, or **realloc**, located between the bss segment and the stack (p. 205).
- **stack**: Region holding **automatic variables**, function call stack frames, parameters, and return addresses (p. 205). _Memory Layout Diagram:_ Typical logical arrangement of program memory segments (p. 206):

```
High Address  ┌─────────────────────────────────────────┐
              │ Command-line arguments & environment   │
              ├─────────────────────────────────────────┤
              │ Stack (grows downward ──────────┐)      │
              │                                 │       │
              │                                 ▼       │
              │                                         │
              │                                 ▲       │
              │                                 │       │
              │ Heap (grows upward ─────────────┘)      │
              ├─────────────────────────────────────────┤
              │ Uninitialized data (bss) [zeroed]       │
              ├─────────────────────────────────────────┤
              │ Initialized data (Data)                 │
              ├─────────────────────────────────────────┤
Low Address   │ Text (read-only machine code)           │
              └─────────────────────────────────────────┘
```

_Course Framing & Executable Inspection (Lec02):_ The **ELF** (Executable and Linkable Format) **loader** pipeline reads the executable from disk into memory (Lec02). The stack and heap grow toward each other; if they collide, a **stack overflow** error occurs (Lec02). The **size** utility (`size /usr/bin/cc /bin/sh`) measures byte sizes of text, data, and bss segments in disk binaries (p. 206). Standard process information queries include **getcwd** (current working directory), **getpid** (process ID), and **getppid** (parent process ID) (Lec02).
### 7.5 Environment List
*Definition & Structure:* Each program is passed an **environment list**, which is an array of character pointers where each pointer contains the address of a null-terminated C string (p. 203).
*Global Variable:* The address of the array of pointers is stored in the global variable `environ`: `extern char **environ;` (p. 203–204).
*Terminology:* The `environ` variable is called the **environment pointer**, the array of pointers is the environment list, and the strings pointed to are **environment strings** (p. 204).
*Convention:* By convention, environment strings take the form `name=value` (p. 204).
*Historical Third Argument:* Historically, UNIX systems provided a third argument to `main`: `int main(int argc, char *argv[], char *envp[]);` (p. 204). ISO C specifies `main` with two arguments, and POSIX.1 specifies using `environ` instead of `envp[]` because `envp` offers no benefit over the global variable (p. 204).
*Access Methods:* Direct access to `environ` is required to iterate through the entire environment list, whereas accessing specific environment variables is normally done via `getenv` and `putenv`/`setenv` (p. 204).
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

### 7.7 Shared Libraries

_Purpose & Mechanism:_ **Shared libraries** remove common library routines from executable files on disk, maintaining a single copy of the library routine somewhere in memory that all processes reference (p. 206). _Advantages:_ Greatly reduces the disk file size of executables and allows library functions to be replaced or updated without relinking programs that use the library, provided function parameters remain unchanged (p. 206). _Trade-offs:_ Adds minor runtime overhead when a program is executed or when a shared library function is called for the first time (p. 206). _Executable Size Comparison Example:_

- Statically linked binary (`gcc -static hello.c`): executable file size is 879,443 bytes; `size` command reports 787,775 bytes text, 6,128 bytes data, 11,272 bytes bss (p. 206–207).
- Dynamically linked binary (`gcc hello.c` default with shared libraries): executable file size drops to 8,378 bytes; `size` command reports 1,176 bytes text, 504 bytes data, 16 bytes bss (p. 207).

### 7.8 Memory Allocation

_ISO C Allocation Functions:_ ISO C defines three dynamic memory allocation functions in `<stdlib.h>` (p. 207):

- `void *malloc(size_t size);`: Allocates `size` bytes of memory whose initial value is indeterminate (p. 207).
- `void *calloc(size_t nobj, size_t size);`: Allocates space for `nobj` objects of size `size` bytes, initializing all bits to zero (p. 207).
- `void *realloc(void *ptr, size_t newsize);`: Increases or decreases the size of a previously allocated block `ptr` to `newsize` bytes (p. 207). If `ptr` is `NULL`, `realloc` behaves like `malloc(newsize)` (p. 208).
- All three return a non-null `void *` pointer if successful, or `NULL` on error (p. 207). _Deallocation:_ `void free(void *ptr);`: Deallocates the space pointed to by `ptr`, returning it to a pool of available memory for later allocation (p. 207–208). _Pointer Alignment:_ Pointers returned by `malloc`, `calloc`, and `realloc` are guaranteed to be suitably aligned for any data object (p. 207). _realloc Behavior Details:_ If adjacent space exists beyond the current block, `realloc` expands in place and returns `ptr`; otherwise, it allocates a new region elsewhere, copies existing data, frees the old block, and returns the new pointer (p. 208). Pointers into the old block become invalid if the region moves (p. 208). _System Call Primitive:_ Memory allocation routines are usually implemented using the **sbrk** system call, which expands or contracts the process heap (p. 208). Freed memory is kept in the user-level `malloc` pool rather than being returned to the kernel (p. 208). _Memory Errors & Leakage:_
- **memory leak**: Occurs when a process calls `malloc` but fails to call `free`, causing address space size to continually increase over time (p. 209).
- Fatal errors include freeing an already freed block, calling `free` with an unallocated pointer, or writing past array bounds (p. 208–209). _Stack Allocation:_ The **alloca** function allocates memory directly on the stack frame of the current function, automatically freeing memory upon return (p. 210). _Alternate Memory Allocators:_
- **libmalloc**: SVR4 library providing `mallopt` (control variables) and `mallinfo` (statistics) (p. 209).
- **vmalloc**: Allocates memory using different region-specific techniques (p. 209).
- **quick-fit**: Maintains free lists of fixed buffer sizes; faster than best-fit or first-fit (p. 209).
- **jemalloc**: Default FreeBSD 8.0 allocator, designed for multithreaded scalability on multiprocessor systems (p. 210).
- **TCMalloc**: Google open-source thread-caching allocator using thread-local caches to eliminate locking overhead (p. 210).

### 7.9 Environment Variables

_Format & Interpretation:_ Environment strings take the form `name=value`. The UNIX kernel never interprets environment strings; interpretation is performed entirely by applications and shells (p. 210). _Fetching Environment Variables:_ `char *getenv(const char *name);` (defined in `<stdlib.h>`): Returns a pointer to the `value` associated with `name`, or `NULL` if not found (p. 210–211). _Modifying Environment Variables:_

- `int putenv(char *str);` (XSI): Places a `name=value` string into the environment list. If `name` exists, its old definition is removed. Passing a stack-allocated string is an error because stack memory is reused upon return (p. 212).
- `int setenv(const char *name, const char *value, int rewrite);` (POSIX.1): Sets `name` to `value`. If `rewrite` is non-zero, existing definitions are replaced; if `0`, no change occurs. `setenv` allocates memory for the `name=value` string (p. 212).
- `int unsetenv(const char *name);` (POSIX.1): Removes any definition of `name` (p. 212).
- `clearenv()`: Removes all entries from the environment list (p. 212). _Environment Manipulation Mechanics:_
- Initial environment lists and strings reside at the top of the process address space above the stack (p. 212–213).
- Modifying existing variables: If the new `value` length \(\le\) old `value` length, copy in place; if larger, call `malloc` for new memory and update the pointer in the environment list (p. 213).
- Adding new variables: Call `malloc` for the `name=value` string. When adding a variable for the first time, `malloc` a new pointer array on the heap, copy old pointers, append the new pointer and `NULL` sentinel, and set `environ` to point to the heap array (p. 213). Subsequent additions call `realloc` on the heap array (p. 213). _Inheritance & Fork/Exec Behavior (Lec02, Lec03, APUE):_ Each process maintains its own environment (Lec03). A child process inherits its parent's environment list during `fork()` (Lec03). During `exec()`, the environment is propagated to the new image (via `environ` or explicitly via `execve`/`execle`) (p. 203, 211; Lec03). Modifying an environment variable in a child process affects only that process and its future children, never its parent (p. 211).

## Chapter Summary

A C process executes within an operating system environment initialized by a C start-up routine, managed through virtual memory segment abstractions, and configured by environment variables inherited across process boundaries. _Mechanism:_ ==When a process is launched via exec, the kernel loads its text and data segments into virtual memory, sets up stack frames and environment lists, and transfers execution to the start-up routine (_start) which initializes the C runtime before calling main().== Normal process termination flushes standard I/O buffers and executes `atexit` handlers, while dynamic memory is allocated on the heap via `sbrk`/`malloc`, environment variables are modified by manipulating heap-relocated pointer lists, and nonlocal jumps (`setjmp`/`longjmp`) bypass standard stack frame returns.

## Key Concepts

- **main**: Program entry point function prototyped as `int main(int argc, char *argv[])` (p. 197).
- **argc**: Non-negative integer count of command-line arguments (p. 197).
- **argv**: Array of pointers to null-terminated command-line argument strings (p. 197).
- **C start-up routine** / **_start()**: Kernel-designated entry point that sets up arguments and environment before calling `main()` (p. 197; Lec02).
- **exit**: ISO C function performing standard I/O buffer cleanup and running `atexit` handlers before returning to kernel (p. 198).
- **_exit** / **_Exit**: POSIX/ISO C functions returning immediately to kernel without running exit handlers or flushing I/O buffers (p. 198).
- **exit status**: Integer parameter passed to exit functions indicating normal completion or error codes (p. 198).
- **exit handler**: User function registered via `atexit()` invoked in reverse order during `exit()` (p. 200).
- **atexit**: ISO C function registering up to 32 exit handlers (p. 200).
- **command-line arguments**: Array of strings passed to a program by the process calling `exec` (p. 203).
- **text segment**: Read-only, sharable CPU machine instructions loaded from binary (p. 204).
- **initialized data segment**: Global and static variables explicitly initialized in source code (p. 204).
- **uninitialized data segment** / **bss**: Global and static variables not explicitly initialized, zero-filled by `exec` (p. 204).
- **heap**: Dynamic memory allocation region located between bss and stack, growing upward (p. 205).
- **stack**: Region holding automatic variables, function stack frames, parameters, and return addresses, growing downward (p. 205).
- ==**stack overflow**==: Error occurring when stack and heap grow toward each other and collide in virtual address space (Lec02).
- **size**: Command utility reporting byte sizes of text, data, and bss segments in binaries (p. 206).
- **ELF**: Executable and Linkable Format binary file standard loaded into memory by the OS loader pipeline (Lec02).
- **environment list**: Array of character pointers containing addresses of null-terminated `name=value` strings (p. 203).
- **environ**: Global environment pointer variable `extern char **environ;` pointing to environment list (p. 203).
- **environment string**: C string formatted as `name=value` containing configuration settings (p. 204).
- **getenv**: ISO C function searching environment list for a specific variable name (p. 210).
- **setenv**: POSIX function allocating memory to set or rewrite an environment variable (p. 212).
- **putenv**: XSI function placing a `name=value` string directly into the environment list (p. 212).
- **unsetenv**: POSIX function removing an environment variable definition (p. 212).
- **shared library**: Library routines held in a single memory location shared across all running processes to reduce binary disk size (p. 206).
- **malloc**: Function allocating specified uninitialized bytes from heap (p. 207).
- **calloc**: Function allocating zero-initialized memory for objects (p. 207).
- **realloc**: Function resizing a previously allocated memory region (p. 207).
- **free**: Function deallocating dynamic memory and returning it to malloc pool (p. 207–208).
- **sbrk**: System call expanding or contracting process heap boundary (p. 208).
- **memory leak**: Defect where allocated memory is not freed, expanding process address space over time (p. 209).
- **alloca**: Function allocating temporary memory directly on the stack frame (p. 210).
- **setjmp**: Function saving stack frame environment into `jmp_buf` for nonlocal branching (p. 213, 215).
- **longjmp**: Function restoring saved stack frame state from `jmp_buf` and returning a non-zero value to `setjmp` (p. 213, 215).
- **getrlimit** / **setrlimit**: Functions querying and modifying per-process resource limits (p. 220).

## Worked Example

The resolution of a bare command like `ls` follows a defined environment lookup sequence:

1. _Shell Parsing:_ When a user types `ls` into a terminal, the shell parses the string and identifies that `ls` contains no slash (`/`) characters, distinguishing it from explicit pathnames like `./ls` or `/bin/ls`.
2. _PATH Environment Lookup:_ The shell reads its `PATH` environment variable (e.g., `PATH=/usr/local/bin:/usr/bin:/bin`), which contains a colon-separated list of directory path prefixes.
3. _Directory Iteration:_ The shell iterates through each directory prefix in order (`/usr/local/bin`, then `/usr/bin`), checking for an executable file named `ls`. Upon searching `/usr/bin`, it locates the binary at `/usr/bin/ls` and invokes `execve("/usr/bin/ls", ...)` to execute the program.
4. _Contrast with Shared Library Lookup Variables:_ As Lec03 emphasizes, built-in commands are regular programs resolved via `PATH`. ==In contrast, `LD_PRELOAD` and `LD_LIBRARY_PATH` are sibling lookup variables used by the dynamic linker/loader during program execution to locate shared object libraries (`.so` files)—where `LD_PRELOAD` forces the loader to interpose custom library functions before standard libraries, and `LD_LIBRARY_PATH` specifies additional search directories for linking—rather than resolving executable program names.==

## Connections

_Lecture Framing:_ Lec02 and Lec03 frame process environments in systems programming:

- Lec02 covers the compilation and linking pipeline (C source -> Assembly -> Object -> Linked Executable), the ELF loader pipeline, process memory layout (Text, Global/Data/BSS, Heap, Stack growing toward each other), `_start()` as the true compiler entry point calling `main()`, and process metadata getters `getcwd()`, `getpid()`, `getppid()`.
- Lec03 details shell command execution, environment variable inheritance across `fork`/`exec`, and `PATH` folder search mechanics. _Term Provenance:_
- _From Slides (Lec02/Lec03):_ `_start()`, `LD_PRELOAD`, `LD_LIBRARY_PATH`, `PATH` search mechanics, stack/heap collision stack overflow.
- _From APUE Book Only:_ `environ` global variable declaration (`extern char **environ;`), `setenv()`/`putenv()`/`unsetenv()` detailed memory reallocation mechanics (moving pointer array to heap on first add), `atexit()` exit handlers, `setjmp()`/`longjmp()` nonlocal branching, `getrlimit()`/`setrlimit()` resource limits, and `alloca()`. _Textbook Connections:_ (pending Chapter 8).

## Open Questions

- [ ] Write a test C program using `setenv()` to add new environment variables and inspect `environ` pointer memory addresses before and after addition to observe heap relocation.
- [ ] ==Verify how `atexit()` handlers interact with `exit()` versus `_exit()` by registering exit functions and terminating via both paths.==
- [ ] Benchmark memory allocation overhead between standard `malloc()`/`free()` and `alloca()` on large recursive function calls.
- [ ] Trace shared library loading for binaries compiled with `-static` vs default dynamic linking using `size` and `ldd`.

## Flashcards

What is the execution mechanism of the program entry point `_start()` before `main()` runs?::`_start()` is the compiler-provided entry point invoked by the ELF loader that extracts command-line arguments and environment pointers from the kernel, sets up stack and heap memory, calls `main(argc, argv)`, and passes `main`'s return status to `exit()`. #cards/ai How do `exit()` and `_exit()` differ in their execution mechanisms during process termination?::`exit()` performs standard I/O library buffer flushing (`fclose` on open streams) and executes registered `atexit()` handlers in reverse order before returning to the kernel, whereas `_exit()` immediately triggers the kernel system call to terminate the process without cleanup. #cards/ai ==What structural memory reallocation occurs when `setenv()` adds a new environment variable to a process for the first time?==::==Because initial environment arrays reside above the stack where space cannot expand, `setenv()` calls `malloc()` to allocate a new pointer array on the heap, copies the existing pointer list and new `name=value` string pointer into it, and updates global `environ` to point to the heap array.== #cards/ai How does the system resolve a bare command name like `ls` to an executable file location?::The shell or `execlp()` reads the `PATH` environment variable, splits it by colons into ordered directory prefixes, and sequentially searches each directory for an executable matching the command name until found. #cards/ai What happens inside `realloc()` when there is insufficient adjacent memory beyond an allocated block?::`realloc()` allocates a completely new memory region elsewhere on the heap, copies the existing data from the old block to the new region, frees the old block, and returns a pointer to the new address. #cards/ai How do `LD_PRELOAD` and `LD_LIBRARY_PATH` affect dynamic linking compared to `PATH`?::While `PATH` directs the OS where to search for executable binaries, `LD_PRELOAD` forces the dynamic linker to interpose custom shared library functions before standard libraries, and `LD_LIBRARY_PATH` specifies additional directory search paths for loading shared object libraries (`.so`). #cards/ai
## Examples Worth Keeping
<!-- Keep concrete examples, numbers, cases, or worked reasoning that makes the mechanism memorable. -->
- 
## Connections
<!-- Link the matching lecture/week, course map, and only concept notes that actually exist or were created. -->
- Lecture:
- Concept:
## Flashcards
<!-- Add 3–8 atomic cards testing mechanisms and contrasts to #cards/<course-slug>. -->
