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
# Chapter - 11
**Source:**
**Read from:**
**Course role:**
## Chapter Summary
<!-- The chapter's one-sentence claim with exactly one ==highlight==, then a *Mechanism:* line. -->
## Key Concepts
<!-- Each concept defined in context, with its role and the condition that prevents misuse. -->
## Full Reading Notes
# 11.1 to 11.5
````
# Chapter - 11: Threads
## Chapter Summary
==Threads introduce multiple concurrent execution streams within a single process address space, sharing heap memory, global data, and file descriptors while retaining private stacks and CPU registers.==
*Mechanism:* Rather than incurring the kernel overhead of duplicating entire virtual address spaces and process tables via fork(), a process invokes pthread_create() to instantiate a new thread of control executing a target function (pp. 383–385). Each thread maintains its own thread ID (pthread_t), CPU register set (including program counter), and execution stack, while sharing the process text segment, initialized data, bss, dynamic heap, file descriptors, and signal dispositions (p. 383). Threads terminate independently by returning from their start routine, calling pthread_exit(), or responding to pthread_cancel(), allowing companion threads to synchronize and harvest typeless return pointers via pthread_join() (pp. 388–389).
## Key Concepts
- **thread**: An independent execution stream of machine instructions running within the context of a shared process environment (p. 383; Lec12).
- **uniprocessor threading**: Concurrency model where multiple threads interleave execution on a single CPU core, improving responsiveness and simplifying asynchronous event handling into synchronous models (p. 384; Lec12).
- **_POSIX_THREADS**: POSIX feature test macro defined in `<unistd.h>` (value `200809L` under SUSv4) indicating system compile-time thread support (p. 384).
- **_SC_THREADS**: Configuration constant passed to sysconf() to query POSIX thread runtime availability (p. 384).
- **pthread_t**: Opaque data type representing a thread identifier, unique only within its containing process (p. 384).
- **pthread_equal**: Function comparing two pthread_t identifiers for equality, returning non-zero if equal or 0 otherwise (p. 385).
- **pthread_self**: Function returning the pthread_t identifier of the calling thread (p. 385; Lec12).
- **pthread_create**: Function spawning a new thread of control to execute a target function taking and returning `void *` (p. 385; Lec12).
- **pthread_attr_t**: Opaque configuration structure passed to pthread_create() to define custom thread attributes, or NULL for defaults (p. 385).
- **start_rtn**: Function pointer of type `void *(*)(void *)` defining the initial execution entry point of a newly spawned thread (p. 385; Lec12).
- **LinuxThreads**: Legacy Linux 2.4 threads implementation that mapped each thread to a distinct process, complicating POSIX compliance (p. 388).
- **NPTL**: Native POSIX Thread Library introduced in Linux 2.6 supporting 1:1 kernel-supported threads within a single unified process (p. 388).
- **pthread_exit**: Function terminating the calling thread and yielding a typeless pointer (`void *`) exit status without terminating the process (p. 389; Lec12).
- **pthread_join**: Blocking function suspending the caller until a target thread terminates, retrieving its `void *` return value (p. 389; Lec12).
- ==**PTHREAD_CANCELED**==: Special exit status pointer (`(void *)-1`) populated by pthread_join() when a target thread terminates via cancellation (p. 389).
- **pthread_cancel**: Function requesting asynchronous or deferred cancellation of a target thread (p. 393; Lec12).
- **thread cleanup handler**: User routine scheduled via pthread_cleanup_push() to execute during pthread_exit, cancellation, or explicit pop (p. 394).
- **pthread_cleanup_push**: Macro registering an exit cleanup function and argument onto a thread's LIFO cancellation cleanup stack (p. 394).
- **pthread_cleanup_pop**: Macro removing the most recently pushed cleanup handler, executing it if the execute argument is non-zero (p. 394).
- **pthread_detach**: Function placing a thread into the detached state, allowing the OS to immediately reclaim its resources upon termination (p. 396–397).
- **PTHREAD_CREATE_DETACHED**: Thread creation attribute ensuring a thread starts in the detached state so it cannot be joined (p. 396).
## Full Reading Notes
### 11.1 Introduction
Traditional UNIX processes support a single thread of control where each process executes one sequential instruction stream at any instant (p. 383).
Process-level multitasking provides strong isolation but imposes heavy communication and resource-allocation overhead when cooperating tasks require shared memory or file descriptors (p. 383).
Threads provide multiple concurrent instruction streams operating directly within a single shared address space (p. 383).
### 11.2 Thread Concepts
A thread comprises the minimal set of resources necessary to represent an independent execution context within a process (p. 383; Lec12):
- Private to each thread: Thread ID, CPU register set (program counter, stack pointer, general-purpose registers), private execution stack, scheduling priority/policy, signal mask, errno value, and thread-specific data (p. 383; Lec12).
- Shared across all threads in a process: Text segment (instructions), initialized data, uninitialized data (bss), dynamic heap, open file descriptors, file offsets, signal handlers, current working directory, and user/group IDs (p. 383; Lec12).
*Benefits of Multithreading:*
1. Asynchronous Event Simplification: Complex asynchronous code can be modularized by assigning a dedicated thread to each event type, allowing each thread to run a simple, blocking synchronous loop (p. 383).
2. Direct Memory and Descriptor Sharing: Threads automatically share memory and file descriptors without relying on complex IPC primitives like pipes, FIFOs, sockets, or shared memory segments (p. 383–384).
3. Throughput and Response-Time Improvements: Independent subtasks can be interleaved to maximize execution overlap; interactive software decouples long-running background computation from user input/output interfaces (p. 384).
*Uniprocessor Utility:* Even on uniprocessor architectures lacking hardware parallelism, threads improve throughput by overlapping execution during blocking I/O delays and simplifying software structure into synchronous event loops (p. 384; Lec12).
*Standards and Feature Macros:* Pthreads interfaces are standardized by POSIX.1-2001 (moved to base specification in SUSv4) (p. 384). Compile-time availability is tested via `#ifdef _POSIX_THREADS` (defined as `200809L` under SUSv4), and runtime availability is queried via `sysconf(_SC_THREADS)` (p. 384).
### 11.3 Thread Identification
Thread IDs are typed as **pthread_t** and possess uniqueness solely within the enclosing process, unlike process IDs which are globally unique non-negative integers across the operating system (p. 384).
Because implementations may define `pthread_t` as an integer, pointer, or structure, portable software cannot use the `==` operator or print thread IDs directly (p. 384–385).
*Function Prototypes (`<pthread.h>`):*
```c
int pthread_equal(pthread_t tid1, pthread_t tid2);
pthread_t pthread_self(void);
````

`pthread_equal()` returns non-zero if `tid1` and `tid2` refer to the same thread, or 0 otherwise (p. 385). `pthread_self()` returns the thread ID of the calling thread (p. 385). _Master/Worker Work Queue Pattern (Figure 11.1):_ A master thread places job requests onto a shared queue and tags each job with the specific worker's `pthread_t`; worker threads iterate through the queue, calling `pthread_equal(job->j_id, pthread_self())` to locate and dequeue only their assigned work items (p. 385).

### 11.4 Thread Creation

New threads are spawned by invoking `pthread_create()` (p. 385). _Function Prototype (`<pthread.h>`):_

```
int pthread_create(pthread_t *restrict tidp,
                   const pthread_attr_t *restrict attr,
                   void *(*start_rtn)(void *),
                   void *restrict arg);
```

Returns 0 on success, or a positive error number on failure (p. 385). _Parameters and Operational Semantics:_

- `tidp`: Points to a `pthread_t` variable populated with the new thread's ID upon successful creation (p. 385).
- `attr`: Points to a `pthread_attr_t` attributes structure customizing stack size, scheduling, or detach state; passing NULL applies implementation default attributes (p. 385).
- `start_rtn`: Function pointer to the thread's start routine, taking a single `void *` argument and returning `void *` (p. 385).
- `arg`: Single typeless pointer passed directly as the argument to `start_rtn`; passing multiple arguments requires passing a pointer to an allocated struct (p. 385; Lec12). _Scheduling and Execution Guarantees:_ There is no guarantee whether the newly created thread or the calling thread runs first; execution order depends entirely on kernel scheduling (p. 387; Lec12). _Signal Mask Inheritance:_ A newly created thread inherits the calling thread's signal mask, but its pending signal set is cleared (p. 385, 453). _Error Return Convention:_ Pthread functions do not set the global `errno` variable; instead, they return 0 on success or return the integer error number directly as their return value, which can be formatted via `strerror()` (p. 385; Lec12). _Figure 11.2 Code (Printing Thread IDs):_

```
#include "apue.h"
#include <pthread.h>

pthread_t ntid;

void printids(const char *s) {
    pid_t     pid;
    pthread_t tid;

    pid = getpid();
    tid = pthread_self();
    printf("%s pid %lu tid %lu (0x%lx)\n", s, (unsigned long)pid,
      (unsigned long)tid, (unsigned long)tid);
}

void *thr_fn(void *arg) {
    printids("new thread: ");
    return((void *)0);
}

int main(void) {
    int err;

    err = pthread_create(&ntid, NULL, thr_fn, NULL);
    if (err != 0)
        err_exit(err, "can’t create thread");
    printids("main thread:");
    sleep(1);
    exit(0);
}
```

_Two Structural Oddities in Figure 11.2:_

1. Sleep in Main Thread: `main()` must call `sleep(1)` to prevent the process from terminating; if the initial thread exits, the entire process terminates before the child thread gets scheduled (p. 387).
2. Use of `pthread_self()` vs. `ntid`: The child thread must call `pthread_self()` to obtain its ID rather than reading global `ntid`, because if the new thread runs before `pthread_create()` writes to `ntid` in the main thread, the child would read uninitialized garbage (p. 387–388). _Linux Threads Architecture Evolution:_ In Linux 2.4, **LinuxThreads** implemented each thread as a separate clone process, leading to non-standard signal handling and PID discrepancies (p. 388). Linux 2.6 introduced **NPTL** (Native POSIX Thread Library), integrating true 1:1 kernel-supported threads sharing a single unified PID and POSIX compliance (p. 388; Lec15).

### 11.5 Thread Termination

If any thread calls `exit()`, `_Exit()`, `_exit()`, or receives a fatal unhandled signal, the entire process terminates (p. 388). A single thread terminates without ending the process in exactly three ways (p. 388–389):

1. Returning from its start routine (return value serves as its exit status) (p. 388).
2. Being canceled by another thread via `pthread_cancel()` (p. 389).
3. Calling `pthread_exit()` (p. 389). _Function Prototypes (`<pthread.h>`):_

```
void pthread_exit(void *rval_ptr);
int pthread_join(pthread_t thread, void **rval_ptr);
```

`pthread_join()` returns 0 on success, or an error number on failure (p. 389). _Join Semantics:_ The calling thread suspends until `thread` terminates; `rval_ptr` receives the pointer passed to `pthread_exit()` or returned by `start_rtn` (p. 389). If `thread` was canceled, `*rval_ptr` is set to `PTHREAD_CANCELED` (p. 389). Calling `pthread_join()` on a thread automatically detaches it and reclaims its termination resources (p. 396). _Figure 11.3 Code (Fetching Thread Exit Status):_

```
#include "apue.h"
#include <pthread.h>

void *thr_fn1(void *arg) {
    printf("thread 1 returning\n");
    return((void *)1);
}

void *thr_fn2(void *arg) {
    printf("thread 2 exiting\n");
    pthread_exit((void *)2);
}

int main(void) {
    int       err;
    pthread_t tid1, tid2;
    void      *tret;

    err = pthread_create(&tid1, NULL, thr_fn1, NULL);
    if (err != 0)
        err_exit(err, "can’t create thread 1");
    err = pthread_create(&tid2, NULL, thr_fn2, NULL);
    if (err != 0)
        err_exit(err, "can’t create thread 2");
    err = pthread_join(tid1, &tret);
    if (err != 0)
        err_exit(err, "can’t join with thread 1");
    printf("thread 1 exit code %ld\n", (long)tret);
    err = pthread_join(tid2, &tret);
    if (err != 0)
        err_exit(err, "can’t join with thread 2");
    printf("thread 2 exit code %ld\n", (long)tret);
    exit(0);
}
```

_Stack-Allocated Return Bug (Figure 11.4):_ Passing a pointer to an automatic variable allocated on a thread's local stack via `pthread_exit()` or `return` results in undefined behavior (p. 390–391). Once the thread terminates, its stack frame is invalidated and deallocated; subsequent thread creations reuse those memory addresses, causing the joining thread to read corrupted bytes or trigger a `SIGSEGV` segmentation fault (p. 391–393). Correct implementations allocate transfer structures on the heap via `malloc()` or use global/static variables (p. 392).

```
#include "apue.h"
#include <pthread.h>

struct foo {
    int a, b, c, d;
};

void printfoo(const char *s, const struct foo *fp) {
    printf("%s", s);
    printf("  structure at 0x%lx\n", (unsigned long)fp);
    printf("  foo.a = %d\n", fp->a);
    printf("  foo.b = %d\n", fp->b);
    printf("  foo.c = %d\n", fp->c);
    printf("  foo.d = %d\n", fp->d);
}

void *thr_fn1(void *arg) {
    struct foo foo = {1, 2, 3, 4};
    printfoo("thread 1:\n", &foo);
    pthread_exit((void *)&foo);
}

void *thr_fn2(void *arg) {
    printf("thread 2: ID is %lu\n", (unsigned long)pthread_self());
    pthread_exit((void *)0);
}

int main(void) {
    int         err;
    pthread_t   tid1, tid2;
    struct foo  *fp;

    err = pthread_create(&tid1, NULL, thr_fn1, NULL);
    if (err != 0)
        err_exit(err, "can’t create thread 1");
    err = pthread_join(tid1, (void *)&fp);
    if (err != 0)
        err_exit(err, "can’t join with thread 1");
    sleep(1);
    printf("parent starting second thread\n");
    err = pthread_create(&tid2, NULL, thr_fn2, NULL);
    if (err != 0)
        err_exit(err, "can’t create thread 2");
    sleep(1);
    printfoo("parent:\n", fp);
    exit(0);
}
```

_Cancellation Request:_

```
int pthread_cancel(pthread_t tid);
```

Returns 0 on success, or an error number on failure (p. 393). `pthread_cancel()` submits a cancellation request without waiting for `tid` to terminate (p. 393). Under default deferred cancellation, the target terminates when reaching a cancellation point (p. 393, 451). _Thread Cleanup Handlers:_

```
void pthread_cleanup_push(void (*rtn)(void *), void *arg);
void pthread_cleanup_pop(int execute);
```

Cleanup handlers execute in reverse registration order (LIFO stack) when a thread calls `pthread_exit()`, responds to cancellation, or invokes `pthread_cleanup_pop(1)` (p. 394). If `execute` is 0, the handler is removed without execution (p. 394). Because implementations may define push/pop as macros opening `{` and closing `}`, they must appear as syntactically matched pairs within the same lexical scope (p. 394). _Return vs. Exit Trap (Figure 11.5):_ Returning from a start routine does not execute cleanup handlers installed via `pthread_cleanup_push()` on implementations like Linux/Solaris; returning between push and pop causes undefined behavior or stack corruption on FreeBSD/Mac OS X (p. 396). Threads must invoke `pthread_exit()` to ensure portable cleanup execution (p. 396).

```
#include "apue.h"
#include <pthread.h>

void cleanup(void *arg) {
    printf("cleanup: %s\n", (char *)arg);
}

void *thr_fn1(void *arg) {
    printf("thread 1 start\n");
    pthread_cleanup_push(cleanup, "thread 1 first handler");
    pthread_cleanup_push(cleanup, "thread 1 second handler");
    printf("thread 1 push complete\n");
    if (arg)
        return((void *)1);
    pthread_cleanup_pop(0);
    pthread_cleanup_pop(0);
    return((void *)1);
}

void *thr_fn2(void *arg) {
    printf("thread 2 start\n");
    pthread_cleanup_push(cleanup, "thread 2 first handler");
    pthread_cleanup_push(cleanup, "thread 2 second handler");
    printf("thread 2 push complete\n");
    if (arg)
        pthread_exit((void *)2);
    pthread_cleanup_pop(0);
    pthread_cleanup_pop(0);
    pthread_exit((void *)2);
}

int main(void) {
    int       err;
    pthread_t tid1, tid2;
    void      *tret;

    err = pthread_create(&tid1, NULL, thr_fn1, (void *)1);
    if (err != 0)
        err_exit(err, "can’t create thread 1");
    err = pthread_create(&tid2, NULL, thr_fn2, (void *)1);
    if (err != 0)
        err_exit(err, "can’t create thread 2");
    err = pthread_join(tid1, &tret);
    if (err != 0)
        err_exit(err, "can’t join with thread 1");
    printf("thread 1 exit code %ld\n", (long)tret);
    err = pthread_join(tid2, &tret);
    if (err != 0)
        err_exit(err, "can’t join with thread 2");
    printf("thread 2 exit code %ld\n", (long)tret);
    exit(0);
}
```

_Comparison of Process and Thread Primitives (Figure 11.6 vs. Lec12 Table):_

|Process Primitive|Thread Primitive|Description|
|:--|:--|:--|
|`fork`|`pthread_create`|Create a new flow of control (p. 396; Lec12)|
|`exit`|`pthread_exit`|Exit from an existing flow of control (p. 396; Lec12)|
|`waitpid`|`pthread_join`|Wait for and get exit status from flow of control (p. 396; Lec12)|
|`atexit`|`pthread_cleanup_push`|Register function to be called at exit from flow of control (p. 396)|
|`getpid`|`pthread_self`|Get ID for flow of control (p. 396; Lec12)|
|`abort`|`pthread_cancel`|Request abnormal termination of flow of control (p. 396; Lec12)|

_Contrast with Lecture Table:_ Lec12 presents five matching pairs (`fork`/`pthread_create`, `waitpid`/`pthread_join`, `getpid`/`pthread_self`, `exit`/`pthread_exit`, `abort`/`pthread_cancel`). The book's Figure 11.6 includes a sixth entry pairing `atexit` with `pthread_cleanup_push` for registering exit-time callbacks (p. 396). _Detaching Threads:_

```
int pthread_detach(pthread_t tid);
```

Returns 0 on success, or an error number on failure (p. 397). By default, a thread's termination status is preserved until harvested by `pthread_join()`. Detaching via `pthread_detach()` marks the thread so its underlying memory and thread descriptor are released immediately upon termination; calling `pthread_join()` on a detached thread results in undefined behavior (p. 396).

## Worked Example

Tracing Figures 11.3 and 11.4 demonstrates thread return semantics and the stack-variable invalidation defect:

1. _Valid Return via Pointer Cast (Figure 11.3):_ Thread 1 returns `(void *)1` directly from `thr_fn1()`, and Thread 2 calls `pthread_exit((void *)2)` from `thr_fn2()` (p. 389–390). The main thread calls `pthread_join(tid1, &tret)` and `pthread_join(tid2, &tret)`, casting the harvested `void *` pointers to `(long)tret`. Because the integer values `1` and `2` are embedded directly into the 8-byte pointer value itself rather than referencing memory addresses, the values remain intact and print correctly (p. 390).
2. _Stack Variable Allocation (Figure 11.4):_ In `thr_fn1()`, thread 1 defines automatic variable `struct foo foo = {1, 2, 3, 4};` allocated on its private execution stack, printing `structure at 0x7f2c83682ed0` with fields `1, 2, 3, 4`. Thread 1 calls `pthread_exit((void *)&foo)`, returning the memory address of its own stack frame (p. 391–392).
3. _Thread Termination and Stack Invalidation:_ ==When thread 1 calls pthread_exit(), its execution context terminates and the operating system invalidates its local execution stack, leaving pointer fp in the main thread referencing an abandoned memory region.==
4. _Stack Overwrite by Subsequent Threads:_ Main thread joins with thread 1, obtaining `fp` pointing to `0x7f2c83682ed0`. Main then calls `pthread_create(&tid2, NULL, thr_fn2, NULL)`. When thread 2 executes, the thread library assigns it the same virtual memory page previously used by thread 1's stack (p. 392). Thread 2 executes `thr_fn2()`, pushing new stack frames and overwriting the bytes at `0x7f2c83682ed0`.
5. _Corrupted Inspection:_ When the main thread calls `printfoo("parent:\n", fp)`, reading through pointer `fp` accesses thread 2's overwritten stack bytes, printing garbage values (`foo.a = -2090321472`, `foo.b = 32556`, `foo.c = 1`, `foo.d = 0` on Linux) or triggering a `SIGSEGV` segmentation fault (on Mac OS X) (p. 392–393). Correct code fixes this by allocating `foo` dynamically on the shared heap using `malloc(sizeof(struct foo))` or using a global struct (p. 392).

## Connections

_Lecture Framing (Lec12):_

- Lec12 emphasized the architectural transition from heavy isolated processes to lightweight shared-memory threads: threads share heap, code, globals, descriptors, and signal dispositions, but retain private stacks and CPU registers (Program Counter) (Lec12 slides 5–9).
- Lec12 walked through the canonical parallel file processing exercise (`int process_files(char *file_names[], int n)`), contrasting three distinct patterns for passing arguments and collecting results: (1) typecasting integers/strings directly into `void *` pointers, (2) allocating a dedicated `struct thread_args` on the heap containing an input filename and an integer pointer for output, and (3) indexing into global arrays (Lec12 slides 16–27).
- Lec12 stressed that pthread functions do NOT set `errno`; they return an error integer directly that must be passed to `strerror()` rather than using `perror()` (Lec12 slide 15).
- _Skipped Content:_ The professor skipped `pthread_equal()`, custom thread attributes (`pthread_attr_t`), thread cleanup stacks (`pthread_cleanup_push`/`pop`), `pthread_detach()`, and the `LinuxThreads` vs. `NPTL` historical evolution (covered only in the book).
- _Other-Chapter Pull-In:_ Chapter 7 (Process Environment) for `atexit` vs `pthread_cleanup_push`; Chapter 8 (Process Control) for `fork`/`waitpid` process table equivalents; Chapter 10 (Signals) for signal mask inheritance and unhandled signals terminating the entire process; Chapter 14 (Advanced I/O) for `poll()` on pipes vs uniprocessor multi-threaded event monitoring. _Textbook Connections:_ (pending next parts).

## Open Questions

- [ ] Write a C test program that passes a `malloc`'d struct versus a stack-allocated struct through `pthread_exit()` to observe memory corruption under valgrind.
- [ ] ==Verify what happens when pthread_cleanup_pop(1) is called on an empty cleanup stack versus calling return in between a push/pop pair on Linux.==
- [ ] Demonstrate that an unhandled `SIGSEGV` or `SIGINT` arriving in a secondary worker thread terminates the entire multithreaded process immediately.
- [ ] Implement a benchmark comparing the creation and teardown latency of 1,000 POSIX threads against 1,000 forked child processes.

## Flashcards

What resources does a thread own privately versus what does it share with other threads in the process?::A thread privately owns its thread ID, CPU register set (including Program Counter), stack, signal mask, priority, and errno value, while sharing the code segment, heap, global/static variables, file descriptors, and signal dispositions. #cards/csci4061 Why must programmers use `pthread_equal()` rather than the `==` operator to compare thread IDs?::POSIX allows implementations to represent `pthread_t` as an arbitrary data structure, pointer, or unsigned integer; portable code cannot assume `pthread_t` is a primitive scalar type. #cards/csci4061 How do POSIX thread functions report error status compared to traditional UNIX system calls?::==Pthread functions return 0 on success or a positive error number directly as their return value without setting global errno, requiring error strings to be extracted via `strerror(status)`.== #cards/csci4061 What causes the memory corruption bug when a thread returns the address of a local struct via `pthread_exit()`?::Automatic variables reside on the thread's local execution stack, which is destroyed upon thread termination; subsequent thread creations reuse that memory, overwriting the structure with garbage bytes. #cards/csci4061 Under what three specific conditions are thread cleanup handlers executed after being installed by `pthread_cleanup_push()`?::Cleanup handlers execute when the thread calls `pthread_exit()`, when it acts on a cancellation request, or when it explicitly invokes `pthread_cleanup_pop()` with a non-zero argument. #cards/csci4061 Why is calling `return` from a thread start routine between `pthread_cleanup_push` and `pthread_cleanup_pop` non-portable?::Push and pop are often implemented as macros containing matching `{` and `}` braces that store context on the stack; returning prematurely bypasses macro cleanup and leads to stack corruption or compilation failure. #cards/csci4061 What is the effect of calling `pthread_detach()` on an active thread?::It marks the thread so that its termination status and underlying memory resources are reclaimed immediately by the system upon exit, preventing any other thread from joining with it. #cards/csci4061 
# 11.6 to 11.6.3
````
### 11.6 Thread Synchronization
When multiple threads of control share the same virtual address space, operations must be synchronized to ensure that each thread perceives a consistent view of shared data (p. 397). If variables are read-only or confined to private stacks, concurrent access causes no consistency anomalies; when one thread modifies memory that other threads read or modify, memory access must be serialized (p. 397).
*Sequential Consistency & Interleaved Memory Cycles:* In hardware architectures without synchronization, memory access occurs across interleaved bus cycles (Figure 11.7, p. 397). If Thread A reads a variable, writes value 1, and writes value 2 while Thread B reads during an intermediate bus cycle, Thread B can observe an inconsistent or transient state (p. 397–398). To enforce **sequential consistency**, threads must acquire a lock before accessing shared memory, ensuring that concurrent operations execute as atomic transactions (Figure 11.8, p. 397–398).
*The Three-Step Increment Race:* In modern computer architectures, incrementing a memory variable (`*sum += 1` or `var++`) is non-atomic and executes across three discrete machine operations: (1) loading the memory value into a CPU register (`movq (%rax), %rbx`), (2) incrementing the register (`incq %rbx`), and (3) storing the register value back to memory (`movq %rbx, (%rax)`) (Figure 11.9, p. 398–399; Lec13). If Thread 1 loads 0 and increments to 1, but is preempted by the operating system scheduler before storing, Thread 2 runs, loads 0, increments to 1, and stores 1 (p. 398; Lec13). When Thread 1 resumes, it stores its register value 1 into memory; two increments executed, yet the memory value only increased by 1, resulting in a lost update race condition (Figure 11.9, p. 398–399; Lec13).
### 11.6.1 Mutexes
A **mutex** (mutual exclusion lock) is a synchronization primitive used to serialize access to shared resources within a **critical section** (p. 399; Lec13).
*Mutual Exclusion Semantics:* A thread locks a mutex before entering a critical section and unlocks it upon exit (p. 399–400). If a mutex is locked, subsequent threads attempting to lock it block in the kernel until the owner unlocks it (p. 399–400; Lec13). When an unlock occurs, all threads blocked on that mutex are made runnable; the first scheduled thread acquires the lock, while companion threads observe the lock as acquired and return to blocked sleep (p. 399–400; Lec13).
*Cooperative Nature:* The operating system kernel does not enforce serialization automatically; mutual exclusion functions only if all cooperating threads adhere to identical locking protocols prior to reading or modifying shared data (p. 400; Lec13).
*Data Type & Static Initialization:* A mutex is typed as **pthread_mutex_t** (p. 400). Statically allocated mutexes are initialized using the constant **PTHREAD_MUTEX_INITIALIZER** (p. 400; Lec13).
*Function Prototypes (`<pthread.h>`):*
```c
int pthread_mutex_init(pthread_mutex_t *restrict mutex,
                       const pthread_mutexattr_t *restrict attr);
int pthread_mutex_destroy(pthread_mutex_t *mutex);
int pthread_mutex_lock(pthread_mutex_t *mutex);
int pthread_mutex_trylock(pthread_mutex_t *mutex);
int pthread_mutex_unlock(pthread_mutex_t *mutex);
````

All return 0 on success, or an integer error number on failure (p. 400). _Dynamic Management:_

- **pthread_mutex_init**: Dynamically initializes `mutex`; passing `attr = NULL` applies default mutex attributes (p. 400).
- **pthread_mutex_destroy**: Deallocates resources associated with `mutex`; must be called before releasing memory allocated via `malloc()` (p. 400).
- **pthread_mutex_lock**: Acquires `mutex`; blocks calling thread if already locked (p. 400; Lec13).
- **pthread_mutex_trylock**: Attempts conditional acquisition; locks without blocking if free (returning 0), or fails immediately returning **EBUSY** if currently locked (p. 400).
- **pthread_mutex_unlock**: Releases ownership of `mutex`; calling `pthread_mutex_unlock()` without holding the lock or unlocking multiple times causes undefined behavior (p. 400; Lec13). _Figure 11.10 Code (Using a Mutex to Protect a Data Structure):_

```
#include <stdlib.h>
#include <pthread.h>

struct foo {
    int             f_count;
    pthread_mutex_t f_lock;
    int             f_id;
    /* ... more stuff here ... */
};

struct foo *foo_alloc(int id) /* allocate the object */
{
    struct foo *fp;

    if ((fp = malloc(sizeof(struct foo))) != NULL) {
        fp->f_count = 1;
        fp->f_id = id;
        if (pthread_mutex_init(&fp->f_lock, NULL) != 0) {
            free(fp);
            return(NULL);
        }
        /* ... continue initialization ... */
    }
    return(fp);
}

void foo_hold(struct foo *fp) /* add a reference to the object */
{
    pthread_mutex_lock(&fp->f_lock);
    fp->f_count++;
    pthread_mutex_unlock(&fp->f_lock);
}

void foo_rele(struct foo *fp) /* release a reference to the object */
{
    pthread_mutex_lock(&fp->f_lock);
    if (--fp->f_count == 0) { /* last reference */
        pthread_mutex_unlock(&fp->f_lock);
        pthread_mutex_destroy(&fp->f_lock);
        free(fp);
    } else {
        pthread_mutex_unlock(&fp->f_lock);
    }
}
```

_Reference Counting Semantics:_ In Figure 11.10, `f_lock` protects the reference count `f_count`. When a thread allocates an object via `foo_alloc()`, no lock is required to initialize `f_count = 1` because the allocating thread holds the sole pointer (p. 401–402). When multiple threads share the object, `foo_hold()` increments `f_count` under `f_lock`, and `foo_rele()` decrements `f_count` under `f_lock` (p. 401). If `f_count` drops to 0, `foo_rele()` unlocks `f_lock`, destroys the mutex via `pthread_mutex_destroy()`, and frees the allocated memory (p. 401). However, Figure 11.10 leaves a race condition: if an external thread searches for an object and calls `foo_hold()` while `foo_rele()` is blocked or deallocating, a use-after-free fault occurs (p. 402).

### 11.6.2 Deadlock Avoidance

A **deadlock** occurs when execution cannot proceed because threads are blocked waiting for resources held by each other (p. 402; Lec13/Lec14). _Self-Deadlock:_ A thread deadlocks itself if it attempts to acquire a non-recursive mutex it already holds (p. 402; Lec13). _ABBA Deadlock:_ When two threads acquire two mutexes in opposite order (Thread 1 locks mutex A then B; Thread 2 locks mutex B then A), Thread 1 holding A blocks on B, while Thread 2 holding B blocks on A, creating an unresolvable cycle (p. 402; Lec14). _Lock Ordering Rule:_ ==When multiple threads must acquire more than one mutex concurrently, deadlocks are avoided by enforcing a strict lock hierarchy where all threads acquire the mutexes in the exact same predefined order.== _Figure 11.11 Code (Using Two Mutexes with Strict Lock Ordering):_

```
#include <stdlib.h>
#include <pthread.h>

#define NHASH 29
#define HASH(id) (((unsigned long)id)%NHASH)

struct foo *fh[NHASH];
pthread_mutex_t hashlock = PTHREAD_MUTEX_INITIALIZER;

struct foo {
    int             f_count;
    pthread_mutex_t f_lock;
    int             f_id;
    struct foo     *f_next; /* protected by hashlock */
    /* ... more stuff here ... */
};

struct foo *foo_alloc(int id) /* allocate the object */
{
    struct foo *fp;
    int         idx;

    if ((fp = malloc(sizeof(struct foo))) != NULL) {
        fp->f_count = 1;
        fp->f_id = id;
        if (pthread_mutex_init(&fp->f_lock, NULL) != 0) {
            free(fp);
            return(NULL);
        }
        idx = HASH(id);
        pthread_mutex_lock(&hashlock);
        fp->f_next = fh[idx];
        fh[idx] = fp;
        pthread_mutex_lock(&fp->f_lock);
        pthread_mutex_unlock(&hashlock);
        /* ... continue initialization ... */
        pthread_mutex_unlock(&fp->f_lock);
    }
    return(fp);
}

void foo_hold(struct foo *fp) /* add a reference to the object */
{
    pthread_mutex_lock(&fp->f_lock);
    fp->f_count++;
    pthread_mutex_unlock(&fp->f_lock);
}

struct foo *foo_find(int id) /* find an existing object */
{
    struct foo *fp;

    pthread_mutex_lock(&hashlock);
    for (fp = fh[HASH(id)]; fp != NULL; fp = fp->f_next) {
        if (fp->f_id == id) {
            foo_hold(fp);
            break;
        }
    }
    pthread_mutex_unlock(&hashlock);
    return(fp);
}

void foo_rele(struct foo *fp) /* release a reference to the object */
{
    struct foo *tfp;
    int         idx;

    pthread_mutex_lock(&fp->f_lock);
    if (fp->f_count == 1) { /* last reference */
        pthread_mutex_unlock(&fp->f_lock);
        pthread_mutex_lock(&hashlock);
        pthread_mutex_lock(&fp->f_lock);
        /* need to recheck the condition */
        if (fp->f_count != 1) {
            fp->f_count--;
            pthread_mutex_unlock(&fp->f_lock);
            pthread_mutex_unlock(&hashlock);
            return;
        }
        /* remove from list */
        idx = HASH(fp->f_id);
        tfp = fh[idx];
        if (tfp == fp) {
            fh[idx] = fp->f_next;
        } else {
            while (tfp->f_next != fp)
                tfp = tfp->f_next;
            tfp->f_next = fp->f_next;
        }
        pthread_mutex_unlock(&hashlock);
        pthread_mutex_unlock(&fp->f_lock);
        pthread_mutex_destroy(&fp->f_lock);
        free(fp);
    } else {
        fp->f_count--;
        pthread_mutex_unlock(&fp->f_lock);
    }
}
```

_Lock Ordering in Figure 11.11:_ Mutex `hashlock` protects the global hash table `fh` and hash chain pointers `f_next`, while `f_lock` protects the internal fields of individual `struct foo` objects (p. 402–405). The system establishes a lock hierarchy: `hashlock` must always be locked before `f_lock`. In `foo_find()`, `hashlock` is acquired before calling `foo_hold()`, which locks `f_lock`. In `foo_rele()`, if `f_count == 1`, `f_lock` must be unlocked first before acquiring `hashlock` to avoid an out-of-order deadlock with `foo_find()`. Because dropping `f_lock` opens an unlocked window where another thread could call `foo_find()` and `foo_hold()`, `foo_rele()` must re-acquire `f_lock` and explicitly recheck `if (fp->f_count != 1)` before proceeding with deallocation (p. 404–405). _Figure 11.12 Code (Simplified Locking Architecture):_

```
#include <stdlib.h>
#include <pthread.h>

#define NHASH 29
#define HASH(id) (((unsigned long)id)%NHASH)

struct foo *fh[NHASH];
pthread_mutex_t hashlock = PTHREAD_MUTEX_INITIALIZER;

struct foo {
    int             f_count; /* protected by hashlock */
    pthread_mutex_t f_lock;
    int             f_id;
    struct foo     *f_next; /* protected by hashlock */
    /* ... more stuff here ... */
};

struct foo *foo_alloc(int id) /* allocate the object */
{
    struct foo *fp;
    int         idx;

    if ((fp = malloc(sizeof(struct foo))) != NULL) {
        fp->f_count = 1;
        fp->f_id = id;
        if (pthread_mutex_init(&fp->f_lock, NULL) != 0) {
            free(fp);
            return(NULL);
        }
        idx = HASH(id);
        pthread_mutex_lock(&hashlock);
        fp->f_next = fh[idx];
        fh[idx] = fp;
        pthread_mutex_lock(&fp->f_lock);
        pthread_mutex_unlock(&hashlock);
        /* ... continue initialization ... */
        pthread_mutex_unlock(&fp->f_lock);
    }
    return(fp);
}

void foo_hold(struct foo *fp) /* add a reference to the object */
{
    pthread_mutex_lock(&hashlock);
    fp->f_count++;
    pthread_mutex_unlock(&hashlock);
}

struct foo *foo_find(int id) /* find an existing object */
{
    struct foo *fp;

    pthread_mutex_lock(&hashlock);
    for (fp = fh[HASH(id)]; fp != NULL; fp = fp->f_next) {
        if (fp->f_id == id) {
            fp->f_count++;
            break;
        }
    }
    pthread_mutex_unlock(&hashlock);
    return(fp);
}

void foo_rele(struct foo *fp) /* release a reference to the object */
{
    struct foo *tfp;
    int         idx;

    pthread_mutex_lock(&hashlock);
    if (--fp->f_count == 0) { /* last reference, remove from list */
        idx = HASH(fp->f_id);
        tfp = fh[idx];
        if (tfp == fp) {
            fh[idx] = fp->f_next;
        } else {
            while (tfp->f_next != fp)
                tfp = tfp->f_next;
            tfp->f_next = fp->f_next;
        }
        pthread_mutex_unlock(&hashlock);
        pthread_mutex_destroy(&fp->f_lock);
        free(fp);
    } else {
        pthread_mutex_unlock(&hashlock);
    }
}
```

_Why Simplified Locking Wins:_ Figure 11.12 protects both the hash table list pointers (`f_next`) and object reference counts (`f_count`) with a single global `hashlock`, using `f_lock` solely for other payload data (p. 405–407). This redesign completely eliminates the dual-lock release-reacquire-recheck complexity of `foo_rele()`. Managing **locking granularity** requires balancing performance against complexity: locking granularity that is too coarse creates thread contention bottlenecks behind a single lock, whereas locking granularity that is too fine incurs high locking overhead and complex lock-ordering invariants (p. 407).

### 11.6.3 pthread_mutex_timedlock Function

The `pthread_mutex_timedlock()` function allows a thread to bound the duration it blocks waiting to acquire a mutex (p. 407). _Function Prototype (`<pthread.h>`, `<time.h>`):_

```
int pthread_mutex_timedlock(pthread_mutex_t *restrict mutex,
                            const struct timespec *restrict tsptr);
```

Returns 0 on success, or an integer error number on failure (p. 407). _Timeout Specification:_ If the mutex cannot be acquired immediately, the function blocks until the lock becomes available or the absolute time specified by `tsptr` expires, returning **ETIMEDOUT** without acquiring the lock (p. 407). Unlike relative timeout APIs, `tsptr` specifies an absolute wall-clock deadline (`struct timespec` seconds and nanoseconds) computed by adding an offset to the current time retrieved via `clock_gettime(CLOCK_REALTIME, ...)` (p. 407–408). _Figure 11.13 Code (Using pthread_mutex_timedlock):_

```
#include "apue.h"
#include <pthread.h>
#include <time.h>

int main(void)
{
    int             err;
    struct timespec tout;
    struct tm      *tmp;
    char            buf;
    pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;

    pthread_mutex_lock(&lock);
    printf("mutex is locked\n");
    clock_gettime(CLOCK_REALTIME, &tout);
    tmp = localtime(&tout.tv_sec);
    strftime(buf, sizeof(buf), "%r", tmp);
    printf("current time is %s\n", buf);
    tout.tv_sec += 10; /* 10 seconds from now */
    /* caution: this could lead to deadlock */
    err = pthread_mutex_timedlock(&lock, &tout);
    clock_gettime(CLOCK_REALTIME, &tout);
    tmp = localtime(&tout.tv_sec);
    strftime(buf, sizeof(buf), "%r", tmp);
    printf("the time is now %s\n", buf);
    if (err == 0)
        printf("mutex locked again!\n");
    else
        printf("can’t lock mutex again: %s\n", strerror(err));
    exit(0);
}
```

_Platform Support & Delays:_ Supported on Linux 3.2.0, FreeBSD 8.0, and Solaris 10 (via `librt`), but unsupported on Mac OS X 10.6.8 (p. 409). Actual blocking durations vary due to system clock granularity and operating system thread scheduling delays (p. 408–409). NEW KEY CONCEPTS

- **sequential consistency**: Execution model where memory operations across threads appear to execute in a globally agreed sequential order (p. 397).
- **critical section**: Code region accessing shared data that must execute under mutual exclusion to prevent race conditions (p. 398; Lec13).
- **mutex**: Mutual exclusion synchronization object restricting resource access to one thread at a time (p. 399; Lec13).
- **pthread_mutex_t**: POSIX data type representing a mutual exclusion lock (p. 400).
- **PTHREAD_MUTEX_INITIALIZER**: Macro initializing statically allocated mutexes with default attributes (p. 400; Lec13).
- **pthread_mutex_init**: Function dynamically initializing a mutex with specified or default attributes (p. 400; Lec13).
- **pthread_mutex_destroy**: Function deallocating resources of a dynamically allocated mutex (p. 400; Lec13).
- **pthread_mutex_lock**: Function acquiring a mutex, blocking the thread if held by another thread (p. 400; Lec13).
- **pthread_mutex_trylock**: Non-blocking lock function returning 0 if acquired or EBUSY if locked (p. 400).
- **pthread_mutex_unlock**: Function releasing a held mutex and awakening waiting threads (p. 400; Lec13).
- **EBUSY**: Error number returned by pthread_mutex_trylock when the target mutex is currently locked (p. 400).
- **deadlock**: Permanent blocking state where threads wait on resources held by each other (p. 402; Lec13/Lec14).
- **lock ordering**: Architectural discipline requiring all threads to acquire multiple mutexes in an identical sequence (p. 402; Lec13/Lec14).
- **locking granularity**: Scale at which shared data is partitioned under locks, balancing concurrency against overhead (p. 407).
- **pthread_mutex_timedlock**: Function attempting mutex acquisition with an absolute time deadline (p. 407).
- **ETIMEDOUT**: Error number returned by pthread_mutex_timedlock when the timeout threshold expires (p. 407).
- **CLOCK_REALTIME**: POSIX clock identifier representing system-wide real-time wall clock time (p. 408).
- **starvation**: Condition where a runnable thread is perpetually denied resource access while others proceed (Lec13/Lec14). WORKED EXAMPLE ADDITION A step-by-step trace of concurrent execution in Figure 11.11 illustrates how lock ordering prevents deadlock during simultaneous lookup and deallocation:

1. _Setup:_ Object `X` (with `f_count == 1`) resides in hash bucket `fh[idx]`. Thread 1 calls `foo_find(id)` to acquire `X`, while Thread 2 calls `foo_rele(X)` to release the last reference.
2. _Thread 2 Deallocation Path:_ Thread 2 executes `pthread_mutex_lock(&X->f_lock)` and observes `f_count == 1`. To obey the system lock hierarchy (`hashlock` before `f_lock`), Thread 2 releases `X->f_lock` via `pthread_mutex_unlock(&X->f_lock)` and requests `hashlock`.
3. _Thread 1 Lookup Path:_ While Thread 2 waits for `hashlock`, Thread 1 executes `foo_find(id)`: it acquires `pthread_mutex_lock(&hashlock)` and traverses the chain to find `X`.
4. _Thread 1 Reference Addition:_ Inside `foo_find()`, Thread 1 calls `foo_hold(X)`, which executes `pthread_mutex_lock(&X->f_lock)`, increments `X->f_count` from 1 to 2, and releases `X->f_lock`. Thread 1 then releases `hashlock` and safely returns pointer `X`.
5. _Thread 2 Re-evaluation:_ Thread 2 now successfully acquires `hashlock` and re-acquires `pthread_mutex_lock(&X->f_lock)`. Because it dropped `X->f_lock` in Step 2, Thread 2 re-checks `if (fp->f_count != 1)`. Observing `f_count == 2`, Thread 2 decrements `f_count` to 1, releases both `X->f_lock` and `hashlock`, and returns without freeing memory, preventing a use-after-free crash.
6. _What Changes if Lock Order Changes:_ If Thread 2 failed to drop `X->f_lock` and attempted to acquire `hashlock` while holding `X->f_lock` (violating the hierarchy): Thread 1 holds `hashlock` waiting for `X->f_lock`, while Thread 2 holds `X->f_lock` waiting for `hashlock`. Neither thread can proceed, producing an unresolvable circular wait deadlock. CONNECTIONS ADDITION

- _Lecture Emphasis vs. Book Coverage:_ Lec13 and Lec14 skipped APUE's fine-grained dual-lock hash table architecture (Figures 11.11–11.12), `pthread_mutex_trylock()`, and `pthread_mutex_timedlock()`. Instead, lecture prioritized the theoretical foundations of concurrency: breaking down the assembly load-add-store instructions (`movq`/`incq`/`movq`) in an increment race, establishing the Four Coffman Conditions for Deadlock (Mutual Exclusion, Hold and Wait, No Preemption, Circular Wait), analyzing deadlock avoidance via symmetry-breaking in the dining philosophers problem, and exploring one-lane bridge deadlock versus starvation. Lecture also pulled in Chapter 10 (Signals) to contrast thread critical sections with signal mask blocking, and Chapter 15 (IPC) to contrast mutexes with binary semaphores (`sem_init`, `sem_wait`, `sem_post`).
- _Concrete Lab & Code Implementation:_ Lab 07 (`pthreads: Lock and Unlock`) and lecture code `array_threads_sum_fixed.c` made the race condition in APUE Figure 11.9 concrete by demonstrating that accumulating a shared array sum across multiple threads without locks consistently yields corrupted totals, whereas wrapping the shared accumulation under `pthread_mutex_lock` and `pthread_mutex_unlock` forces sequential consistency and guarantees mathematical correctness. NEW FLASHCARDS Why does Figure 11.11's `foo_rele()` function release `f_lock` before acquiring `hashlock`, and why must it recheck `f_count` afterwards?::It releases `f_lock` to preserve the strict `hashlock`-before-`f_lock` hierarchy to prevent deadlock; upon re-acquiring both locks, it must recheck `f_count` because a concurrent `foo_find()` thread may have acquired `hashlock` and incremented `f_count` during the unlocked window. #cards/csci4061 What are the four necessary conditions that must hold simultaneously for a thread deadlock to occur?::Mutual exclusion (unshared resource access), hold and wait (holding resources while requesting others), no preemption (resources only released voluntarily), and circular wait (a closed dependency chain of threads waiting on each other). #cards/csci4061 How does `pthread_mutex_timedlock()` handle its timeout deadline compared to relative sleep functions?::It requires an absolute wall-clock deadline using `struct timespec` (current time plus offset via `CLOCK_REALTIME`), returning `ETIMEDOUT` if the lock cannot be acquired before the specified timestamp. #cards/csci4061 What trade-off governs the choice between coarse-grained and fine-grained locking architectures?::Coarse-grained locking uses fewer locks, reducing code complexity and deadlock risks at the cost of thread contention, while fine-grained locking increases concurrency at the cost of higher locking overhead and complex lock-ordering rules. #cards/csci4061 
# 11.6.4 to 11.6.6
````
### 11.6.4 Reader–Writer Locks
A **reader-writer lock** (also termed a **shared-exclusive lock**) provides higher concurrency than a mutex by supporting three distinct operating states: locked in read mode (shared), locked in write mode (exclusive), and unlocked (p. 409).
*Locking Compatibility Rules:*
- Multiple threads may hold a reader-writer lock in read mode simultaneously (p. 409; Lec13/Lec14).
- Only one thread at a time may hold a reader-writer lock in write mode (p. 409; Lec13/Lec14).
- When write-locked, all threads attempting read or write access block until the write lock is released (p. 409; Lec14).
- When read-locked, additional threads requesting read access proceed immediately, while threads requesting write access block until all readers release their locks (p. 409; Lec14).
*Behavior with a Waiting Writer:*
Although implementations vary, reader-writer lock implementations usually block subsequent reader requests when a writer is blocked waiting to acquire the lock (p. 409; Lec14). If new readers were continuously granted shared locks while an existing reader was active, a constant stream of read operations would cause **writer starvation**, preventing writers from ever executing updates (p. 409; Lec14).
*Optimal Use Case:* Reader-writer locks are suited for shared data structures that are searched or read frequently but modified infrequently (p. 409; Lec13).
*Data Type and Static Initialization:* A reader-writer lock is typed as **pthread_rwlock_t** (p. 409). Statically allocated locks with default attributes are initialized using the Single UNIX Specification XSI constant **PTHREAD_RWLOCK_INITIALIZER** (p. 409).
*Function Prototypes (`<pthread.h>`):*
```c
int pthread_rwlock_init(pthread_rwlock_t *restrict rwlock,
                        const pthread_rwlockattr_t *restrict attr);
int pthread_rwlock_destroy(pthread_rwlock_t *rwlock);
int pthread_rwlock_rdlock(pthread_rwlock_t *rwlock);
int pthread_rwlock_wrlock(pthread_rwlock_t *rwlock);
int pthread_rwlock_unlock(pthread_rwlock_t *rwlock);
int pthread_rwlock_tryrdlock(pthread_rwlock_t *rwlock);
int pthread_rwlock_trywrlock(pthread_rwlock_t *rwlock);
````

All return 0 on success, or an integer error number on failure (pp. 409–410). _API Semantics:_

- **pthread_rwlock_init**: Dynamically initializes `rwlock`; passing `attr = NULL` applies default attributes (p. 409).
- **pthread_rwlock_destroy**: Releases underlying resources allocated to `rwlock`; freeing backing memory before calling destroy results in resource leaks (pp. 409–410).
- **pthread_rwlock_rdlock**: Acquires a shared read lock; blocks if a write lock is held or a writer is pending; return values must be checked because implementations enforce limits on concurrent read locks (p. 410; Lec13).
- **pthread_rwlock_wrlock**: Acquires an exclusive write lock; blocks until all active readers and writers release the lock (p. 410; Lec13).
- **pthread_rwlock_unlock**: Releases read or write ownership; identical function is used regardless of whether the lock was acquired in read or write mode (p. 410; Lec14).
- **pthread_rwlock_tryrdlock** / **pthread_rwlock_trywrlock**: Nonblocking conditional acquisition routines; return 0 if the lock is acquired, or return **EBUSY** if the lock is held in a conflicting mode (p. 410). _Figure 11.14 Code (Queue Protected by a Reader–Writer Lock):_

```
#include <stdlib.h>
#include <pthread.h>

struct job {
    struct job *j_next;
    struct job *j_prev;
    pthread_t   j_id; /* tells which thread handles this job */
    /* ... more stuff here ... */
};

struct queue {
    struct job      *q_head;
    struct job      *q_tail;
    pthread_rwlock_t q_lock;
};

/*
 * Initialize a queue.
 */
int
queue_init(struct queue *qp)
{
    int err;

    qp->q_head = NULL;
    qp->q_tail = NULL;
    err = pthread_rwlock_init(&qp->q_lock, NULL);
    if (err != 0)
        return(err);
    /* ... continue initialization ... */
    return(0);
}

/*
 * Insert a job at the head of the queue.
 */
void
job_insert(struct queue *qp, struct job *jp)
{
    pthread_rwlock_wrlock(&qp->q_lock);
    jp->j_next = qp->q_head;
    jp->j_prev = NULL;
    if (qp->q_head != NULL)
        qp->q_head->j_prev = jp;
    else
        qp->q_tail = jp; /* list was empty */
    qp->q_head = jp;
    pthread_rwlock_unlock(&qp->q_lock);
}

/*
 * Append a job on the tail of the queue.
 */
void
job_append(struct queue *qp, struct job *jp)
{
    pthread_rwlock_wrlock(&qp->q_lock);
    jp->j_next = NULL;
    jp->j_prev = qp->q_tail;
    if (qp->q_tail != NULL)
        qp->q_tail->j_next = jp;
    else
        qp->q_head = jp; /* list was empty */
    qp->q_tail = jp;
    pthread_rwlock_unlock(&qp->q_lock);
}

/*
 * Remove the given job from a queue.
 */
void
job_remove(struct queue *qp, struct job *jp)
{
    pthread_rwlock_wrlock(&qp->q_lock);
    if (jp == qp->q_head) {
        qp->q_head = jp->j_next;
        if (qp->q_tail == jp)
            qp->q_tail = NULL;
        else
            jp->j_next->j_prev = NULL;
    } else if (jp == qp->q_tail) {
        qp->q_tail = jp->j_prev;
        jp->j_prev->j_next = NULL;
    } else {
        jp->j_prev->j_next = jp->j_next;
        jp->j_next->j_prev = jp->j_prev;
    }
    pthread_rwlock_unlock(&qp->q_lock);
}

/*
 * Find a job for a given thread ID.
 */
struct job *
job_find(struct queue *qp, pthread_t id)
{
    struct job *jp;

    if (pthread_rwlock_rdlock(&qp->q_lock) != 0)
        return(NULL);

    for (jp = qp->q_head; jp != NULL; jp = jp->j_next)
        if (pthread_equal(jp->j_id, id))
            break;

    pthread_rwlock_unlock(&qp->q_lock);
    return(jp);
}
```

_Operational Trade-off in Figure 11.14:_ Operations modifying queue links (`job_insert`, `job_append`, `job_remove`) acquire `q_lock` in write mode (`pthread_rwlock_wrlock`), serializing modifications; `job_find` acquires `q_lock` in read mode (`pthread_rwlock_rdlock`), allowing multiple worker threads to traverse the job queue concurrently (pp. 412–413). This architecture improves throughput only if search operations occur significantly more often than additions or removals (p. 413).

### 11.6.5 Reader–Writer Locking with Timeouts

Timed variants bound the duration a calling thread blocks attempting to acquire a reader-writer lock (p. 413). _Function Prototypes (`<pthread.h>`, `<time.h>`):_

```
int pthread_rwlock_timedrdlock(pthread_rwlock_t *restrict rwlock,
                               const struct timespec *restrict tsptr);
int pthread_rwlock_timedwrlock(pthread_rwlock_t *restrict rwlock,
                               const struct timespec *restrict tsptr);
```

Both return 0 on success, or an integer error number on failure (p. 413). _Timeout Semantics:_ The `tsptr` argument points to a `struct timespec` specifying an absolute wall-clock deadline; if the lock cannot be acquired before the deadline expires, the functions return **ETIMEDOUT** without acquiring the lock (p. 413).

### 11.6.6 Condition Variables

A **condition variable** provides a synchronization rendezvous mechanism allowing threads to suspend execution and wait in a race-free manner for an arbitrary shared condition to become true (p. 413; Lec13). _Relationship with Mutexes:_ A condition variable is always used in conjunction with a mutex (p. 413; Lec13). The mutex protects the shared variables comprising the condition predicate; threads evaluate or alter the predicate solely while holding the mutex (p. 413; Lec13). _Data Type and Initialization:_ A condition variable is typed as **pthread_cond_t** (p. 413). Statically allocated condition variables are initialized with **PTHREAD_COND_INITIALIZER** (pp. 413–414; Lec13). Dynamically allocated condition variables use **pthread_cond_init** and are deallocated with **pthread_cond_destroy** (p. 414; Lec13). _Function Prototypes (`<pthread.h>`):_

```
int pthread_cond_init(pthread_cond_t *restrict cond,
                      const pthread_condattr_t *restrict attr);
int pthread_cond_destroy(pthread_cond_t *cond);
int pthread_cond_wait(pthread_cond_t *restrict cond,
                      pthread_mutex_t *restrict mutex);
int pthread_cond_timedwait(pthread_cond_t *restrict cond,
                           pthread_mutex_t *restrict mutex,
                           const struct timespec *restrict tsptr);
int pthread_cond_signal(pthread_cond_t *cond);
int pthread_cond_broadcast(pthread_cond_t *cond);
```

All return 0 on success, or an integer error number on failure (pp. 414–415). _Atomicity of pthread_cond_wait:_ ==The pthread_cond_wait function atomically places the calling thread on the condition's wait list and unlocks the mutex, closing the race window where a condition change could be missed, and automatically reacquires the mutex before returning.== Calling `pthread_cond_timedwait()` behaves identically but aborts with `ETIMEDOUT` if the absolute timestamp in `tsptr` is reached, reacquiring the mutex prior to returning (pp. 414–415). _Signaling Functions:_

- **pthread_cond_signal**: Unblocks at least one thread waiting on `cond`; if no threads are blocked on `cond`, the notification is discarded and does not persist (p. 415; Lec13/Lec14).
- **pthread_cond_broadcast**: Unblocks all threads currently waiting on `cond` (p. 415; Lec13).
- Calling Context: Signaling may occur while holding the mutex or after releasing it; signaling after unlocking reduces lock contention on multiprocessor systems, but awakened threads must still re-evaluate the predicate (p. 416). _Why Predicates Must Be Evaluated in a while Loop:_ Code must always evaluate condition variables inside a `while` loop (`while (condition == FALSE) pthread_cond_wait(...)`), never an `if` block (p. 416; Lec13; Lab 08). Two conditions necessitate this loop:

1. Thread Preemption / State Invalidation: When a waiting thread is signaled, it is made runnable but does not execute immediately; another runnable thread can acquire the mutex first, alter the state (e.g., consume the single item in the queue), and release the mutex before the awakened thread acquires it (p. 416; Lec13; Lab 08).
2. **spurious wakeup**: Implementations and kernel scheduling layers may wake up a thread from `pthread_cond_wait()` even in the absence of a `pthread_cond_signal()` or `pthread_cond_broadcast()` call (p. 416; Lec13; Lab 08). _Figure 11.15 Code (Using a Condition Variable and a Mutex):_

```
#include <pthread.h>

struct msg {
    struct msg *m_next;
    /* ... more stuff here ... */
};

struct msg *workq;

pthread_cond_t qready = PTHREAD_COND_INITIALIZER;
pthread_mutex_t qlock = PTHREAD_MUTEX_INITIALIZER;

void
process_msg(void)
{
    struct msg *mp;

    for (;;) {
        pthread_mutex_lock(&qlock);
        while (workq == NULL)
            pthread_cond_wait(&qready, &qlock);
        mp = workq;
        workq = mp->m_next;
        pthread_mutex_unlock(&qlock);
        /* now process the message mp */
    }
}

void
enqueue_msg(struct msg *mp)
{
    pthread_mutex_lock(&qlock);
    mp->m_next = workq;
    workq = mp;
    pthread_mutex_unlock(&qlock);
    pthread_cond_signal(&qready);
}
```

NEW KEY CONCEPTS

- **reader-writer lock**: Synchronization primitive supporting concurrent shared reads and mutually exclusive writes (p. 409).
- **shared-exclusive lock**: Synonym for reader-writer lock denoting shared read mode versus exclusive write mode (p. 409).
- **writer starvation**: Failure of waiting writers to acquire an exclusive lock due to an unbroken stream of active readers (p. 409; Lec14).
- **pthread_rwlock_t**: POSIX data type representing a reader-writer lock (p. 409).
- **PTHREAD_RWLOCK_INITIALIZER**: Macro statically initializing a reader-writer lock with default attributes (p. 409).
- **pthread_rwlock_init**: Function dynamically initializing a reader-writer lock with specified attributes (p. 409; Lec13).
- **pthread_rwlock_destroy**: Function releasing system resources associated with a reader-writer lock (p. 409; Lec13).
- **pthread_rwlock_rdlock**: Function acquiring a shared read lock, blocking if a write lock is held or pending (p. 410; Lec13).
- **pthread_rwlock_wrlock**: Function acquiring an exclusive write lock, blocking until all readers and writers finish (p. 410; Lec13).
- **pthread_rwlock_unlock**: Function releasing either a read lock or a write lock on a reader-writer lock (p. 410; Lec13).
- **pthread_rwlock_tryrdlock**: Nonblocking variant attempting to acquire a read lock, returning EBUSY if unavailable (p. 410).
- **pthread_rwlock_trywrlock**: Nonblocking variant attempting to acquire a write lock, returning EBUSY if unavailable (p. 410).
- **pthread_rwlock_timedrdlock**: Function attempting to acquire a read lock bounded by an absolute wall-clock deadline (p. 413).
- **pthread_rwlock_timedwrlock**: Function attempting to acquire a write lock bounded by an absolute wall-clock deadline (p. 413).
- **condition variable**: Synchronization object allowing threads to sleep and await notification of predicate state changes (p. 413; Lec13).
- **pthread_cond_t**: POSIX data type representing a condition variable (p. 413).
- **PTHREAD_COND_INITIALIZER**: Macro statically initializing a condition variable with default attributes (p. 413; Lec13).
- **pthread_cond_init**: Function dynamically initializing a condition variable (p. 414; Lec13).
- **pthread_cond_destroy**: Function releasing system resources assigned to a condition variable (p. 414; Lec13).
- **pthread_cond_wait**: Function atomically releasing an associated mutex, sleeping on a condition, and reacquiring the mutex upon return (p. 414; Lec13).
- **pthread_cond_timedwait**: Function waiting on a condition with an absolute wall-clock timeout deadline (p. 414).
- **pthread_cond_signal**: Function unblocking at least one thread waiting on a condition variable (p. 415; Lec13).
- **pthread_cond_broadcast**: Function unblocking all threads waiting on a condition variable (p. 415; Lec13).
- **spurious wakeup**: Event where a thread returns from `pthread_cond_wait` without receiving an explicit signal or broadcast (p. 416; Lec13). WORKED EXAMPLE ADDITION Execution trace of Figure 11.15 illustrating consumer suspension, notification, and loop predicate re-evaluation:

1. _Initial State:_ Global pointer `workq = NULL`. Global mutex `qlock` and condition variable `qready` are initialized.
2. _Consumer 1 Enters:_ Consumer Thread C1 calls `process_msg()` and acquires `qlock` via `pthread_mutex_lock(&qlock)`.
3. _Consumer 1 Evaluates Predicate & Waits:_ C1 evaluates `while (workq == NULL)`. Finding it true, C1 calls `pthread_cond_wait(&qready, &qlock)`. Inside the call, the kernel atomically appends C1 to `qready`'s wait queue and unlocks `qlock`. C1 enters blocked sleep.
4. _Consumer 2 Enters:_ Consumer Thread C2 calls `process_msg()`, acquires `qlock` (now free), evaluates `while (workq == NULL)`, and calls `pthread_cond_wait(&qready, &qlock)`, joining C1 on `qready`'s wait list while releasing `qlock`.
5. _Producer Enters & Enqueues:_ Producer Thread P calls `enqueue_msg(mp)`. P acquires `qlock` via `pthread_mutex_lock(&qlock)`, assigns `mp->m_next = workq; workq = mp;`, and releases `qlock` via `pthread_mutex_unlock(&qlock)`.
6. _Producer Notifies:_ P calls `pthread_cond_signal(&qready)`. The kernel removes Thread C1 from `qready`'s wait list and marks C1 as runnable.
7. _Consumer 1 Lock Contention & Waking:_ Thread C1 awakens inside `pthread_cond_wait` and attempts to reacquire `qlock`. Once `qlock` is granted, `pthread_cond_wait` returns to C1 holding the lock.
8. _Consumer 1 Consumes:_ C1 loops to `while (workq == NULL)`. The predicate is false (`workq == mp`). C1 executes `mp = workq; workq = mp->m_next;`, unlocks `qlock`, and exits the critical section to process message `mp`.
9. _Spurious Wakeup / Broadcast State Theft Trace:_ If P had called `pthread_cond_broadcast(&qready)` instead of `signal`, both C1 and C2 would awaken. C1 acquires `qlock` first and consumes `mp`, setting `workq = NULL`. When C1 unlocks, C2 acquires `qlock` and re-evaluates `while (workq == NULL)`. Because of the `while` loop, C2 detects `workq == NULL` and re-invokes `pthread_cond_wait`, preventing a null-pointer dereference crash that would have occurred under an `if` check. CONNECTIONS ADDITION

- _Lecture Emphasis vs. Book Coverage:_ Lec13 and Lec14 emphasized condition variables as "notification queues" paired with mutexes in monitor-style architectures (Lec13 slides 22–33) and analyzed the trade-offs of reader-writer lock priority policies (Option 1 Readers Preferred vs. Option 2 Writers Preferred, contrasting data freshness against concurrency; Lec14 slides 10–13). The professor skipped nonblocking try-locks (`pthread_rwlock_tryrdlock`/`trywrlock`) and timed variants (`pthread_rwlock_timed*`, `pthread_cond_timedwait`). Lec14 slides 14–23 introduced POSIX semaphores (`sem_init`, `sem_wait`, `sem_post`), contrasting their persistent counting history against condition variable notifications; semaphores belong to APUE Chapter 15 (§15.10) and are explicitly flagged here rather than folded into Chapter 11.
- _Concrete Lab Implementation:_ Lab 08 (`Producer-Consumer Queues` / `queue.c`) makes Figure 11.15 concrete by implementing a bounded thread-safe queue using two condition variables (`queue_full` and `queue_empty`) paired with a single mutex, demonstrating that producers wait on `queue_full` while consumers wait on `queue_empty`, and confirming that `while` loops are required to handle state changes when multiple consumer threads contend for dequeued nodes. NEW FLASHCARDS Why do reader-writer lock implementations usually block new readers when a writer thread is waiting to acquire the lock?::If incoming readers were granted shared access while existing readers held the lock, a continuous stream of readers would perpetually block the writer, resulting in writer starvation. #cards/csci4061 What atomic actions occur inside `pthread_cond_wait()`, and what invariant holds when it returns?::`pthread_cond_wait()` atomically places the calling thread on the condition variable's sleep queue and unlocks the associated mutex; when it returns, the thread is guaranteed to hold the locked mutex again. #cards/csci4061 Why must condition variable predicates be evaluated inside a `while` loop rather than an `if` block?::Threads can experience spurious wakeups without an explicit signal, and another thread may acquire the mutex and invalidate or consume the condition state before the awakened thread reacquires the lock. #cards/csci4061 How does a condition variable notification differ from a semaphore operation regarding history persistence?::Calling `pthread_cond_signal()` is ephemeral and discarded if no threads are currently blocked on the condition variable, whereas calling `sem_post()` permanently increments the semaphore's counter, persisting state for future waiters. #cards/csci4061 
# 11.6.7 to 11.7
````
### 11.6.7 Spin Locks
A **spin lock** is a mutual exclusion primitive modeled on mutexes, but instead of blocking a contending process by sleeping, the process is blocked by busy-waiting (**spinning**) in a loop evaluating lock status until the lock becomes available (p. 417).
*Acceptable Usage Contexts:*
Spin locks are suitable for situations where locks are held for very short durations and threads cannot afford the high latency and overhead of thread descheduling and operating system context switching (p. 417). They serve as low-level primitives to construct higher-level synchronization locks and can be implemented via hardware **test-and-set** instructions (p. 417).
*CPU Resource Waste & Scheduling Caveats:*
While spinning, a thread consumes CPU cycles continuously without performing productive computation; consequently, spin locks should be held only for minimal durations (p. 417).
- Nonpreemptive Kernels: Spin locks provide mutual exclusion while blocking interrupts, preventing interrupt handlers (which cannot sleep) from deadlocking the system on locked resources (p. 417).
- User-Level Limitations: At user level, spin locks are counterproductive unless threads execute under real-time scheduling classes that forbid preemption (p. 417). In standard time-sharing systems, if a thread holding a spin lock is descheduled (due to quantum expiration or a higher-priority thread becoming runnable), other threads attempting to acquire the lock waste CPU cycles spinning for extended durations while the lock holder sleeps (p. 417).
- Comparison with Mutexes: Modern processor architectures perform context switches rapidly, and modern mutex implementations often adaptively spin for a threshold before sleeping, making user-level spin locks unnecessary outside specialized real-time software (p. 417).
*Data Type & Initialization (`<pthread.h>`):*
A spin lock is typed as **pthread_spinlock_t** (p. 417).
```c
int pthread_spin_init(pthread_spinlock_t *lock, int pshared);
int pthread_spin_destroy(pthread_spinlock_t *lock);
````

Both return 0 on success, or an integer error number on failure (p. 417). _The pshared Attribute:_ The `pshared` parameter defines the process-shared scope of the lock (p. 417):

- **PTHREAD_PROCESS_SHARED**: Permits the spin lock to be acquired by threads across different processes if they have access to the lock's underlying shared memory (p. 417).
- **PTHREAD_PROCESS_PRIVATE**: Restricts spin lock access exclusively to threads contained within the initializing process (p. 417). _Locking and Unlocking Primitives (`<pthread.h>`):_

```
int pthread_spin_lock(pthread_spinlock_t *lock);
int pthread_spin_trylock(pthread_spinlock_t *lock);
int pthread_spin_unlock(pthread_spinlock_t *lock);
```

All return 0 on success, or an integer error number on failure (pp. 417–418). _Operational Behavior:_

- **pthread_spin_lock**: Acquires an unlocked spin lock immediately without spinning; if currently locked by another thread, spins until acquired (pp. 417–418). Calling `pthread_spin_lock` on a lock the calling thread already holds causes undefined behavior (may fail with **EDEADLK** or spin indefinitely) (p. 418).
- **pthread_spin_trylock**: Attempts conditional acquisition; acquires without spinning if unlocked (returning 0), or fails immediately returning **EBUSY** if locked (note that `pthread_spin_trylock` never spins) (p. 418).
- **pthread_spin_unlock**: Releases the spin lock; calling unlock on an unheld lock results in undefined behavior (p. 418).
- Sleeping Caveat: Threads must never invoke functions that sleep or block while holding a spin lock, as doing so extends spinning durations and wastes processor cores (p. 418).

### 11.6.8 Barriers

A **barrier** is a synchronization mechanism coordinating multiple concurrent threads working in parallel, suspending each thread until all cooperating threads reach the designated barrier point before allowing any to proceed (p. 418). _Comparison with pthread_join:_ While `pthread_join()` acts as a one-to-one barrier allowing a thread to wait for another to terminate, a barrier coordinates an arbitrary count of running threads that continue executing together without terminating (p. 418). _Data Type & Initialization (`<pthread.h>`):_ A barrier is typed as **pthread_barrier_t** (p. 418).

```
int pthread_barrier_init(pthread_barrier_t *restrict barrier,
                         const pthread_barrierattr_t *restrict attr,
                         unsigned int count);
int pthread_barrier_destroy(pthread_barrier_t *barrier);
```

Both return 0 on success, or an integer error number on failure (pp. 418–419). _Parameters & Reusability:_

- `count`: Specifies the total number of threads that must reach the barrier before any blocked threads are unblocked (p. 419).
- `attr`: Specifies barrier attributes (such as process-shared settings), or NULL for implementation defaults (p. 419).
- **pthread_barrier_destroy**: Releases underlying resources; the barrier count cannot be dynamically modified unless the barrier is destroyed and re-initialized with `pthread_barrier_init` (p. 419).
- Reusability: Once the barrier count is satisfied and threads unblock, the barrier resets automatically and can be reused immediately for subsequent synchronization phases (p. 419). _Barrier Rendezvous Primitive (`<pthread.h>`):_

```
int pthread_barrier_wait(pthread_barrier_t *barrier);
```

Returns 0 or **PTHREAD_BARRIER_SERIAL_THREAD** on success, or an integer error number on failure (p. 419). _Rendezvous Semantics:_ ==When a thread calls pthread_barrier_wait, it blocks until the exact count of threads specified during initialization has entered the barrier, at which point all waiting threads are simultaneously awakened and exactly one arbitrary thread receives the special return code PTHREAD_BARRIER_SERIAL_THREAD.== All other participating threads receive a return value of 0, enabling the single serial thread to act as a master to merge data, log results, or configure the next computing phase (p. 419). _Figure 11.16 Code (Using a Barrier to Sort Numbers):_

```
#include "apue.h"
#include <pthread.h>
#include <limits.h>
#include <sys/time.h>

#define NTHR   8               /* number of threads */
#define NUMNUM 8000000L        /* number of numbers to sort */
#define TNUM   (NUMNUM/NTHR)   /* number to sort per thread */

long nums[NUMNUM];
long snums[NUMNUM];

pthread_barrier_t b;

#ifdef SOLARIS
#define heapsort qsort
#else
extern int heapsort(void *, size_t, size_t,
                    int (*)(const void *, const void *));
#endif

/*
 * Compare two long integers (helper function for heapsort)
 */
int
complong(const void *arg1, const void *arg2)
{
    long l1 = *(long *)arg1;
    long l2 = *(long *)arg2;

    if (l1 == l2)
        return 0;
    else if (l1 < l2)
        return -1;
    else
        return 1;
}

/*
 * Worker thread to sort a subset of the numbers.
 */
void *
thr_fn(void *arg)
{
    long    idx = (long)arg;

    heapsort(&nums[idx], TNUM, sizeof(long), complong);
    pthread_barrier_wait(&b);
    return((void *)0);
}

/*
 * Merge the results of the individual sorted ranges.
 */
void
merge()
{
    long    idx[NTHR];
    long    i, minidx, sidx, num;

    for (i = 0; i < NTHR; i++)
        idx[i] = i * TNUM;
    for (sidx = 0; sidx < NUMNUM; sidx++) {
        num = LONG_MAX;
        for (i = 0; i < NTHR; i++) {
            if ((idx[i] < (i+1)*TNUM) && (nums[idx[i]] < num)) {
                num = nums[idx[i]];
                minidx = i;
            }
        }
        snums[sidx] = nums[idx[minidx]];
        idx[minidx]++;
    }
}

int
main()
{
    unsigned long   i;
    struct timeval  start, end;
    long long       startusec, endusec;
    double          elapsed;
    int             err;
    pthread_t       tid;

    /*
     * Create the initial set of numbers to sort.
     */
    srandom(1);
    for (i = 0; i < NUMNUM; i++)
        nums[i] = random();

    /*
     * Create 8 threads to sort the numbers.
     */
    gettimeofday(&start, NULL);
    pthread_barrier_init(&b, NULL, NTHR+1);
    for (i = 0; i < NTHR; i++) {
        err = pthread_create(&tid, NULL, thr_fn, (void *)(i * TNUM));
        if (err != 0)
            err_exit(err, "can’t create thread");
    }
    pthread_barrier_wait(&b);
    merge();
    gettimeofday(&end, NULL);

    /*
     * Print the sorted list.
     */
    startusec = start.tv_sec * 1000000 + start.tv_usec;
    endusec = end.tv_sec * 1000000 + end.tv_usec;
    elapsed = (double)(endusec - startusec) / 1000000.0;
    printf("sort took %.4f seconds\n", elapsed);
    for (i = 0; i < NUMNUM; i++)
        printf("%ld\n", snums[i]);
    exit(0);
}
```

_Performance Benchmark:_ In Figure 11.16, sorting 8 million numbers on an 8-core system using a single thread required 12.14 seconds, whereas partitioning work across 8 worker threads synchronized by a barrier followed by a single-threaded merge completed in 1.91 seconds—a 6x speedup (p. 422).

### 11.7 Summary

Chapter 11 introduces the POSIX.1 multithreading model, detailing primitives for thread creation (`pthread_create`), termination (`pthread_exit`, `pthread_join`, `pthread_cancel`), identification (`pthread_self`, `pthread_equal`), and detachment (`pthread_detach`) (p. 422). It formalizes concurrent shared-memory hazards and presents five fundamental synchronization primitives:

1. Mutexes (`pthread_mutex_t`): Enforce mutual exclusion across critical sections (p. 422).
2. Reader–Writer Locks (`pthread_rwlock_t`): Provide shared-read and exclusive-write access modes (p. 422).
3. Condition Variables (`pthread_cond_t`): Provide race-free sleep and wakeup notification queues paired with a mutex (p. 422).
4. Spin Locks (`pthread_spinlock_t`): Provide low-latency busy-wait locking for short nonpreemptive critical sections (p. 422).
5. Barriers (`pthread_barrier_t`): Coordinate parallel multi-threaded computation phases through simultaneous rendezvous (p. 422). NEW KEY CONCEPTS

- **spin lock**: Mutual exclusion lock that blocks contending threads by busy-waiting in a loop rather than sleeping (p. 417).
- **spinning**: CPU-bound busy-waiting where a thread repeatedly checks a lock's acquisition condition (p. 417).
- **test-and-set**: Atomic machine instruction evaluating and updating a memory flag, utilized to build spin locks (p. 417).
- **pthread_spinlock_t**: POSIX data type representing a spin lock (p. 417).
- **pthread_spin_init**: Function initializing a spin lock with a specified process-shared attribute (p. 417).
- **pthread_spin_destroy**: Function deallocating system resources associated with a spin lock (p. 417).
- **PTHREAD_PROCESS_SHARED**: Synchronization attribute permitting lock sharing across distinct processes with shared memory access (p. 417).
- **PTHREAD_PROCESS_PRIVATE**: Synchronization attribute restricting lock usage to threads within the initializing process (p. 417).
- **pthread_spin_lock**: Function acquiring a spin lock, spinning in a loop if held by another thread (pp. 417–418).
- **pthread_spin_trylock**: Nonblocking function attempting spin lock acquisition without spinning, returning EBUSY if locked (p. 418).
- **pthread_spin_unlock**: Function releasing ownership of a spin lock (p. 418).
- **EDEADLK**: Error number returned when self-deadlock is detected upon re-locking an already held lock (p. 418).
- **barrier**: Synchronization object that coordinates execution by blocking threads until a specified quota arrives (p. 418).
- **pthread_barrier_t**: POSIX data type representing a thread barrier (p. 418).
- **pthread_barrier_init**: Function initializing a barrier object with an attribute pointer and a target arrival count (p. 418).
- **pthread_barrier_destroy**: Function deallocating resources assigned to a barrier object (p. 418).
- **pthread_barrier_wait**: Function indicating arrival at a barrier, suspending the thread until all threads arrive (p. 419).
- **PTHREAD_BARRIER_SERIAL_THREAD**: Distinct positive constant returned to exactly one arbitrary thread unblocking from a barrier (p. 419). WORKED EXAMPLE ADDITION A step-by-step trace of Figure 11.16 demonstrates barrier coordination and explains why the barrier count is initialized to `NTHR + 1`:

1. _Initialization with Count 9:_ The main thread initializes barrier `b` via `pthread_barrier_init(&b, NULL, 9)`, setting the required arrival threshold to `NTHR + 1` (8 worker threads + 1 main thread).
2. _Worker Spawning:_ The main thread spawns 8 worker threads (`T0` through `T7`), assigning each a partition of 1,000,000 numbers in array `nums` (`T0` gets index 0, `T1` gets index 1,000,000, etc.).
3. _Main Thread Rendezvous:_ The main thread immediately calls `pthread_barrier_wait(&b)`. Because the internal arrival count is currently 1 of 9, the main thread is suspended in sleep waiting for the remaining 8 threads.
4. _Worker Computation & Arrival:_ Each worker thread `Ti` independently sorts its 1,000,000 numbers using `heapsort()`. Upon completion, each calls `pthread_barrier_wait(&b)`, incrementing the barrier arrival count (2 of 9, 3 of 9, up to 8 of 9) and entering blocked sleep.
5. _Final Arrival & Release:_ The final worker thread completes `heapsort()` and invokes `pthread_barrier_wait(&b)`. This call satisfies the required threshold (9 of 9). The kernel atomically unblocks all 9 threads simultaneously.
6. _Serial Execution Selection:_ Exactly one arbitrary thread receives the return value `PTHREAD_BARRIER_SERIAL_THREAD`, while the other 8 receive 0. However, because Figure 11.16 delegates merging exclusively to the main thread (which resumes execution and directly invokes `merge()`), the program does not inspect the return code. The 8 worker threads terminate normally via `return((void *)0)`. CONNECTIONS ADDITION

- _Lecture vs. Book Coverage:_ Sections 11.6.7 (Spin Locks) and 11.6.8 (Barriers) were not lectured in class. The nearest lecture concepts appeared as theoretical counterpoints: Lec13 slide 26 analyzed "busy waiting" (polling loops without sleeping) as a CPU-wasting anti-pattern to motivate condition variables, which contrasts with APUE's explanation of spin locks as intentional low-latency busy-waits for nonpreemptive kernels or sub-quantum critical sections. Lec14 slides 24–34 explored hardware caches, cache coherency, and false sharing, providing the physical architecture perspective on memory contention that APUE abstracts into sequential consistency and spin-lock test-and-set loops. Furthermore, Lec14 slides 14–23 introduced POSIX counting semaphores (`sem_init`, `sem_wait`, `sem_post`), which belong to APUE Chapter 15 (§15.10) rather than Chapter 11.
- _Concrete Threading Model Context:_ Lec15 (October 29) contextualized Chapter 11's pthreads API by contrasting kernel-supported threads (1:1 model, where scheduling and blocking involve system calls) against user-level "green" threads (M:1 model, scheduled cooperatively in user space without kernel awareness). This distinction grounds APUE's warning in §11.6.7 that user-level spin locks under time-sharing schedulers risk pathological CPU waste if the lock-holding thread is descheduled by the operating system. NEW FLASHCARDS Why are spin locks generally counterproductive for user-level threads running under time-sharing operating systems?::If a thread holding a spin lock is preempted upon time-slice expiration, other threads trying to acquire the lock waste CPU cycles spinning uselessly until the scheduler resumes the lock holder. #cards/csci4061 What is the significance of the `PTHREAD_BARRIER_SERIAL_THREAD` return value from `pthread_barrier_wait()`?::It is returned to exactly one arbitrary thread among those unblocking from the barrier (while all others receive 0), enabling that single thread to perform sequential post-processing or master coordination. #cards/csci4061 Why does Figure 11.16 initialize its barrier with a count of `NTHR + 1` instead of `NTHR`?::The main thread participates as a synchronization waiter alongside the `NTHR` worker threads, blocking until all workers finish sorting so it can immediately proceed to merge the results. #cards/csci4061 How do spin locks differ from mutexes in how they block contending threads?::A mutex puts contending threads to sleep via the kernel scheduler to free CPU cores, whereas a spin lock keeps contending threads busy-waiting in a CPU-consuming loop until the lock is released. #cards/csci4061
## Worked Example
<!-- Source-grounded examples, numbers, or code traces, and why each matters. -->
## Connections
<!-- Links to the real lecture week, Textbook Map entry, and concept notes. -->
## Open Questions
<!-- Unverified or missing material as - [ ] tasks. -->
## Flashcards
<!-- Three to eight cards on #cards/<course-slug> testing mechanism, condition, and contrast. -->
