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
next: "Feed this chapter into Week - 1/Week - 2's Textbook integration sections"
---
# Chapter - 8 — Process Control
**Source:** W. Richard Stevens and Stephen A. Rago, *Advanced Programming in the UNIX Environment*, 3rd ed. (Addison-Wesley, 2013), Chapter 8, pp. 227-283.
**Read from:** `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\Textbook\Advanced Programming in the UNIX Environment, 3rd Edition.pdf`
**Course role:** Week 1 reading, paired with Chapters 1 and 7 - the process-control half of the picture those two chapters only sketch. Lec02 (9/10) and Lec03 (9/15) directly teach §8.1-8.10 (`fork`/`vfork`/`exit`/`wait`/`waitpid`/`exec`); Lab 1's `fork_wait.c`/`fork_exec.c` are hands-on practice of the exact same material. Sections 8.11-8.17 (changing UIDs/GIDs, interpreter files, `system`, process accounting, `getlogin`, scheduling, process times) have **no matching lecture coverage anywhere in Lec01-06** - textbook-only for this course so far.
## Chapter Summary
Every UNIX process is created, replaced, and reaped through exactly three primitives - `fork`, `exec`, `wait`/`waitpid` - and ==almost everything else in this chapter is either a variation on one of those three or a consequence of the fact that a running process has an identity (PIDs, UIDs, GIDs) that outlives any single program image running inside it== (p. 227).
*Mechanism:* `fork` clones a process, sharing its read-only text but giving it independent (copy-on-write) data/heap/stack; `exec` throws away everything about the calling process's *code* while keeping its identity (PID, open files, working directory); `wait`/`waitpid` let a parent collect a child's fate before the kernel can fully discard it. Everything from `vfork`'s memory-sharing shortcut to the six-flavor `exec` family to zombie/orphan bookkeeping exists to make that three-step lifecycle fast, safe, or flexible under different constraints.
## Key Concepts
- **process ID**: Unique non-negative integer identifying an active process (p. 227).
- **swapper**: Process ID 0, a kernel system process responsible for process scheduling (p. 227).
- **init** / **systemd**: Process ID 1, the root user process created during system bootstrap that inherits orphaned child processes (p. 228; Lec02).
- **getpid** / **getppid** / **getuid** / **geteuid** / **getgid** / **getegid**: The six no-error identifier-query functions (p. 228).
- **fork**: System call creating a new child process by duplicating the calling process (p. 229).
- **child process** / **parent process**: The two processes that result from one `fork()` call (p. 229).
- **copy-on-write**: Optimization sharing memory pages read-only between parent and child until a write operation triggers page duplication (p. 229).
- **vfork**: Process-creation primitive that runs the child in the parent's own address space without copying, suspending the parent until `exec`/`_exit` (p. 234).
- **clone** / **rfork**: Linux's and FreeBSD's respective generalized, fine-grained process-creation system calls (p. 229).
- **orphan process**: A child process whose parent terminated before it, automatically adopted by `init`/`systemd` (PID 1) (p. 236; Lec03).
- **zombie process**: A child process that has terminated but whose exit status has not yet been fetched by its parent via `wait()`/`waitpid()` (p. 237; Lec03).
- ==**daemon process**==: A long-lived background process whose parent deliberately forks and exits/never waits, detaching from the controlling terminal to run system services like `httpd` or `sshd` (Lec03).
- **wait** / **waitpid**: The blocking and (optionally) non-blocking functions a parent calls to collect a child's termination status (pp. 238, 241-242; Lec02/Lec03).
- **WNOHANG**: `waitpid()` option returning `0` immediately instead of blocking if no child has exited yet (p. 242; Lec03).
- **WIFEXITED**/**WEXITSTATUS**, **WIFSIGNALED**/**WTERMSIG**, **WCOREDUMP**, **WIFSTOPPED**/**WSTOPSIG**, **WIFCONTINUED**: The status-inspection macro family for a `wait`-family status value (p. 239).
- **waitid** / **wait3** / **wait4**: More flexible or resource-usage-reporting variants of `wait` (pp. 244-245).
- **race condition**: Outcome that depends non-deterministically on kernel-scheduled execution order (p. 245).
- **exec**: The six-variant family (`execl`/`execv`/`execle`/`execve`/`execlp`/`execvp`, plus `fexecve`) that replaces a process's memory image with a new program (p. 249; Lec03).
- **close-on-exec**: Descriptor flag (`FD_CLOEXEC`) causing an open file descriptor to be closed automatically during `exec` (p. 252; Lec03).
- **least-privilege model**: Design principle - use only the privilege a task actually needs, to limit the blast radius of a compromised or buggy program (p. 255).
- **setuid** / **setgid**: Functions changing a process's real/effective/saved user or group ID, under strict superuser-vs-unprivileged rules (p. 256).
- **saved set-user-ID**: The copy of the effective UID taken at `exec` time, letting an unprivileged process later `seteuid` back to its elevated identity after temporarily dropping it (p. 256).
- **setreuid** / **setregid**: Historical BSD functions letting an unprivileged process swap its real and effective IDs back and forth (p. 257).
- **seteuid** / **setegid**: POSIX functions changing only the effective ID, leaving real/saved IDs untouched (p. 258).
- **interpreter file**: An executable text file starting with `#!pathname` that the kernel recognizes during `exec` and redirects to run through the named interpreter instead (p. 260).
- **system**: Library function that runs a command string via `fork`/`exec("/bin/sh","-c",cmdstring)`/`waitpid` (p. 264).
- **process accounting**: Kernel-recorded, per-terminated-process resource-usage records (CPU time, UID/GID, command name), enabled/disabled by `accton` (p. 269).
- **getlogin**: Function returning the login name actually used to log in, distinct from the possibly-multiple-names a single UID could have (p. 275).
- **nice value**: A process's scheduling-priority adjustment - higher nice, lower priority - queried/set via `nice`/`getpriority`/`setpriority` (p. 276).
- **times**: Function returning a process's (and its waited-for children's) accumulated user/system CPU time, via `struct tms` (p. 280).
## Full Reading Notes
### 8.1 Introduction
Process control covers creation, program execution, and termination (p. 227), plus process attributes (real/effective/saved UIDs and GIDs and how process-control operations touch them), interpreter files, the `system` function, and process accounting (p. 227).
### 8.2 Process Identifiers
Every process has a unique **process ID**; IDs get reused once a process terminates, but the kernel delays reuse so a fresh process doesn't get mistaken for a recently-dead one (p. 227). **PID 0** is usually the **swapper**, a kernel scheduling process with no on-disk executable. **PID 1** is usually **init**, started by the kernel at the end of boot, reading `/etc/rc*`/`/etc/inittab`/`/etc/init.d` to bring the system up - it's an ordinary user process running with superuser privilege (not a kernel process), never dies, and adopts every orphan (p. 228). *Course Framing (Lec02):* modern Linux uses **systemd** in this same PID-1 role, at the root of the process family tree. Six no-error query functions in `<unistd.h>`: `getpid`, `getppid`, `getuid`, `geteuid`, `getgid`, `getegid` (p. 228).
### 8.3 fork Function
```c
pid_t fork(void);
```
==Called once by the parent, returns twice: the new child's PID to the parent, 0 to the child (or -1 on error).== The child gets duplicate copies of the parent's data, heap, and stack (independent - not shared) but shares the read-only text segment (p. 229). Modern implementations avoid the physical copy via **copy-on-write**: pages stay shared and read-only until either process actually writes to one, at which point only that page gets duplicated - cheap, because `fork` is so often followed immediately by `exec`, which would discard the copy anyway (p. 229). Alternatives exist for different tradeoffs: **vfork** skips copying entirely, running the child directly in the parent's memory until `exec`/`_exit` (§8.4); Linux's **clone** and FreeBSD's **rfork** (from Plan 9) give fine-grained control over exactly what's shared (p. 229). Execution order between parent and child after `fork` is non-deterministic - kernel-scheduler-dependent (pp. 230-231); *Course Framing (Lec02):* "program with the weakest set of assumptions possible," since either could run first. Worked example (Figure 8.1): global `globvar` (6) and local `var` (88) modified only in the child (`globvar++; var++;`) while the parent `sleep(2)`s - child prints `glob=7, var=89`, parent prints `glob=6, var=88`, proving genuinely independent memory (p. 230); *Course Framing (Lec02):* the `int x = 4061;` demo shows parent and child printing the *same* `&x` address but diverging values after each sets it independently, confirming copy-not-share.
*I/O buffering across fork:* unbuffered `write()` calls before `fork` execute once, normally; but a *line-buffered* `printf` connected to a terminal flushes before `fork` too, while the *same* `printf` redirected to a disk file (making stdio fully buffered) can still be sitting unflushed in the buffer at `fork` time - that buffer gets duplicated into the child, so both processes flush it independently at exit and the line prints twice (p. 230).
*File sharing:* every open descriptor in the parent is duplicated into the child exactly as if `dup` had been called - both share the same system-file-table entries, including the current offset (p. 231; Lec04). Two common patterns for what happens next: the parent waits for the child before touching shared descriptors again, or parent and child each close whichever descriptors they don't personally need (typical for network servers) (p. 232). *Inherited:* real/effective UID+GID, supplementary GIDs, process group ID, session ID, controlling terminal, set-user-ID/set-group-ID flags, working directory, root directory, `umask`, signal mask and dispositions, `FD_CLOEXEC` per descriptor, environment, attached shared memory, resource limits (p. 233). *Not inherited:* the `fork` return value itself, PID, parent PID (child's own PPID is the parent's PID), CPU times (reset to 0), the parent's file locks, pending alarms, pending signals (child starts with none) (p. 233). `fork` fails (-1) if the system or per-user process-count limit (**CHILD_MAX**) is exceeded (p. 233). Two canonical uses: run different code in parallel (network servers), or `fork` immediately followed by `exec` (shells) - an OS that fuses the two into one primitive calls it a **spawn** (pp. 233-234).
*Lab 1's canonical error-check pattern:*
```c
pid_t pid = fork();
if (pid < 0) { perror("fork failed"); exit(1); }
else if (pid == 0) { /* child */ }
else { /* parent, pid = child's PID */ }
```
*Lec02's "brain melting" `fork` loop exercises:* unconditional `for (i=0;i<3;i++) fork();` produces $2^3=8$ total processes in a binary tree; adding `if (child_pid == 0) break;` makes each new child leave the loop immediately (1 parent + 3 direct children = 4 total); adding `if (child_pid != 0) break;` instead makes the *parent* leave first while each child keeps looping, producing a linear 4-process chain.
### 8.4 vfork Function
```c
pid_t vfork(void);
```
Built specifically for the fork-then-immediately-exec pattern: no address-space copy at all, the child runs directly inside the parent's own memory until it calls `exec` or `_exit`, and the parent is suspended (guaranteed not to run) until then (p. 234). Undefined behavior results if the child modifies any data besides the `vfork` return value, calls another function, or returns before `exec`/`_exit` - and it must call `_exit`, not `exit`, to avoid flushing stdio buffers that live in the *parent's* shared memory (pp. 234-235).
### 8.5 exit Functions
The five normal / three abnormal termination paths from Chapter 7 apply here too (p. 236). Regardless of how a process ends, the kernel closes its open descriptors, releases its memory, and sends **SIGCHLD** to the parent (pp. 236-237). If the **parent** dies first, its children become **orphan processes**, adopted by `init` (p. 236). If a **child** dies first, the kernel keeps a minimal record (PID, termination status, CPU time) until the parent collects it via `wait`/`waitpid` - that not-yet-collected child is a **zombie process**; if the parent never calls `wait` (because it too exits), `init` inherits and reaps the zombie (p. 237). *Course Framing (Lec03's three-way taxonomy):* zombie = exited before parent's `wait()`; orphan = parent exited first, adopted by `init`/`systemd`; **daemon** = parent deliberately forks and never waits at all, a long-lived background service (`httpd`, `lpd`, `sshd`) detached from any controlling terminal.
### 8.6 wait and waitpid Functions
```c
pid_t wait(int *statloc);
pid_t waitpid(pid_t pid, int *statloc, int options);
```
`wait` blocks until *any* child terminates (or returns immediately if one's already a zombie), storing status in `statloc` (p. 238; Lec02/Lec03). `waitpid` targets who to wait for via `pid`: `-1` (any child, same as `wait`), `>0` (one specific PID), `0` (any child in the caller's process group), `<-1` (any child in process group `|pid|`) (p. 241). **WNOHANG** in `options` makes it return `0` immediately instead of blocking if the target hasn't exited - the basis of non-blocking polling (p. 242; Lec03). Status-inspection macros on `statloc` (p. 239): `WIFEXITED`/`WEXITSTATUS` (normal exit / its low 8 bits), `WIFSIGNALED`/`WTERMSIG`/`WCOREDUMP` (killed by uncaught signal / which one / did it dump core), `WIFSTOPPED`/`WSTOPSIG` (currently job-control-stopped / by which signal), `WIFCONTINUED` (resumed after a stop). *Double-fork technique:* to avoid a lingering zombie without the original process having to block waiting for it, fork twice - the first child immediately forks a second child and exits (so it *is* waited for quickly), leaving the second child orphaned and adopted by `init`, which reaps it automatically when it eventually finishes (pp. 242-243).
### 8.7 waitid Function
```c
int waitid(idtype_t idtype, id_t id, siginfo_t *infop, int options);
```
Separates *what kind* of target (`idtype`: `P_PID`, `P_PGID`, `P_ALL`) from *which one* (`id`), with `options` requiring at least one of `WEXITED`/`WSTOPPED`/`WCONTINUED`, optionally `WNOHANG` or `WNOWAIT` (keep the status available for a later wait call too) (p. 244). Fills a `siginfo_t`, richer than a plain status integer.
### 8.8 wait3 and wait4 Functions
```c
pid_t wait3(int *statloc, int options, struct rusage *rusage);
pid_t wait4(pid_t pid, int *statloc, int options, struct rusage *rusage);
```
Historical BSD functions that additionally report resource usage (CPU time, page faults, signals received) in a `struct rusage` alongside the ordinary termination status (p. 245).
### 8.9 Race Conditions
A **race condition** exists whenever multiple processes touch shared resources and the outcome depends on kernel-scheduled ordering (p. 245). Eliminating races that appear right after `fork()` needs actual synchronization, not hope - the book sketches wrapper functions `TELL_WAIT()`/`TELL_PARENT(pid)`/`TELL_CHILD(pid)`/`WAIT_PARENT()`/`WAIT_CHILD()` built on top of real IPC primitives (signals or pipes) to let parent and child deliberately rendezvous at a known point instead of assuming an order (pp. 246-248).
### 8.10 exec Functions
```c
int execl(const char *pathname, const char *arg0, ... /* (char *)0 */);
int execv(const char *pathname, char *const argv[]);
int execle(const char *pathname, const char *arg0, ... /* (char *)0, char *const envp[] */);
int execve(const char *pathname, char *const argv[], char *const envp[]);
int execlp(const char *filename, const char *arg0, ... /* (char *)0 */);
int execvp(const char *filename, char *const argv[]);
int fexecve(int fd, char *const argv[], char *const envp[]);
```
*Course Framing (Lec03):* adds `execvpe(file, argv[], envp[])` as a sixth named pairing with `execvp`. An `exec` call completely replaces the caller's memory image (text, data, bss, heap, stack, program counter) with a new program loaded from disk - the process ID does **not** change (p. 249; Lec03). Success means `exec` never returns at all; a return value means it failed (-1) (p. 249; Lec03). Mnemonic naming: `l` = list arguments individually (NULL/`(char*)0`-terminated), `v` = vector (`argv[]` array), `p` = search `PATH` by bare filename, `e` = take a custom `envp[]` instead of the global `environ` (p. 250). The new program inherits PID, PPID, UIDs/GIDs, process group, working directory, signal mask, and resource limits; open descriptors stay open by default across `exec` unless individually marked **close-on-exec** (`FD_CLOEXEC`) (p. 252; Lec03). Under the hood, `execve` is the one real kernel system call - every other variant is a C library wrapper built on top of it (p. 253).
### 8.11 Changing User IDs and Group IDs
The **least-privilege model**: use only the privilege a task actually needs, limiting what a tricked or buggy program can do with excess permission (p. 255).
```c
int setuid(uid_t uid);
int setgid(gid_t gid);
```
Both return 0 or -1 (p. 255). Rules (identical for UID/GID) (p. 256): a **superuser** process calling `setuid` sets real, effective, *and* saved UID all to `uid`; a **non-superuser** process can only set the *effective* UID, and only to a value equal to its current real UID or its current saved set-user-ID; anything else fails with `EPERM`. Three practical facts follow: only superuser can change the real UID (normally set once, at login, by `login(1)`); `exec` changes the effective UID only if the executed file's set-user-ID bit is set (otherwise it stays whatever it was); the saved set-user-ID is copied from the effective UID by `exec`, specifically so a process can `setuid` back down to normal *and still recover* its elevated identity later, because that saved copy survives the drop (p. 256).
*setreuid/setregid:*
```c
int setreuid(uid_t ruid, uid_t euid);
int setregid(gid_t rgid, gid_t egid);
```
Historical BSD way to swap real and effective UID back and forth (`-1` leaves an argument unchanged); an unprivileged user can always do this swap, plus (once saved-IDs existed) can set the effective UID to the saved set-user-ID too (p. 257).
*seteuid/setegid:*
```c
int seteuid(uid_t uid);
int setegid(gid_t gid);
```
Change *only* the effective ID - for a privileged caller, that's the sole difference from `setuid` (which changes all three); an unprivileged caller may set it to either the real UID or the saved set-user-ID (p. 258).
*Worked example - `at(1)`'s privilege dance:* a set-user-ID-root `at` program (1) starts with real=you, effective=root, saved=root; (2) immediately calls `seteuid(real_uid)` to drop to your privilege for normal operation; (3) calls `seteuid(0)` (legal because it equals the saved ID) only when it needs to touch root-owned config files; (4) calls `seteuid(real_uid)` again to drop back down once done; (5) the daemon that eventually *runs* your scheduled command calls the full `setuid(your_uid)` (as root, so it changes all three IDs at once) so the command genuinely runs with only your normal permissions (pp. 258-260). The saved set-user-ID is exactly what makes step (3) possible without re-reading `/etc/passwd` or anything else - it's a privilege the process can legitimately reclaim, not regain from nowhere.
### 8.12 Interpreter Files
A text file starting with `#! pathname [optional-argument]` (p. 260). The kernel recognizes this during `exec` and actually runs the named interpreter instead, passing it the interpreter file's own path plus whatever the original caller supplied. Platforms cap the first line's length (128 bytes on Linux, up to ~4KB elsewhere) (p. 260). Worked example: `execl`-ing an interpreter file `#!/home/sar/bin/echoarg foo` shows the interpreter (`echoarg`) getting called with `argv[0]=echoarg`, `argv[1]=foo` (the optional argument), then the interpreter file's own path, then the caller's original extra arguments - everything shifted right by two slots (p. 261). Common real use: `#!/bin/awk -f` lets an awk script be run as `scriptname args` instead of `awk -f scriptname args`, hiding the implementation language entirely (pp. 262-263). Interpreter files exist for three reasons beyond convenience: they hide that a program is "really" a script in another language; they're cheaper than a wrapper shell script (no extra `fork`/`exec`/`wait` just to invoke the real interpreter); and they let a script choose a shell other than `/bin/sh`, which is otherwise `execlp`'s hardcoded fallback when a file isn't a real machine executable (pp. 263-264).
### 8.13 system Function
```c
int system(const char *cmdstring);
```
Runs `cmdstring` via `/bin/sh -c cmdstring`, internally `fork`+`exec`+`waitpid` (p. 264). Return value: -1 if `fork`/`waitpid` themselves failed; "as if `exit(127)`" if the shell couldn't be exec'd; otherwise the shell's own termination status, `waitpid`-formatted (p. 265). `cmdstring == NULL` just tests whether a command processor exists at all - always true on UNIX (p. 265). A from-scratch implementation (Figure 8.22) is exactly `fork` → child does `execl("/bin/sh","sh","-c",cmdstring,(char*)0); _exit(127);` → parent loops `waitpid` past `EINTR` (p. 265-266) - it calls `_exit`, not `exit`, in the child specifically to avoid re-flushing stdio buffers already copied from the parent at `fork` time (§8.3's buffering trap). *Never use `system()` from a set-user-ID/set-group-ID program:* the superuser permissions on the calling program's file carry straight through the `fork`+`exec` it performs, so a set-user-ID-root program that calls `system()` handed real root-level shell access to whatever command string it was given - a direct, well-known security hole; the fix is to `fork`/`exec` directly and explicitly drop privilege before the `exec`, never routing through the shell string-parsing layer at all (pp. 267-268).
### 8.14 Process Accounting
When enabled, the kernel writes one binary `struct acct` record per terminated process - command name, CPU time, UID/GID, start time - to an implementation-specific file, toggled on/off by the superuser via `accton` (p. 269). Records exist only for processes that actually terminate (long-lived daemons like `init` never generate one), and land in the file in *termination* order, not start order (p. 270-271). Records track processes, not programs: a chain `A execs B execs C, then C exits` writes exactly one record, named for `C`, with CPU time summed across all three (p. 271). The `ac_flag` field records events like `AFORK` (forked but never exec'd), `ASU` (used superuser privilege), `ACORE` (dumped core), `AXSIG` (killed by a signal) - useful for after-the-fact forensics on exactly how a process behaved and died (p. 271).
### 8.15 User Identification
```c
char *getlogin(void);
```
Returns the actual login name used at login time, which `getpwuid(getuid())` can't reliably reconstruct if one UID has multiple password-file entries (different login shells, say) under different names (p. 275). Fails for processes with no controlling terminal a user logged into (daemons) (p. 275). The `LOGNAME` environment variable is set by `login(1)` at session start but is user-modifiable afterward, so it should never be trusted for anything security-relevant - `getlogin` is the reliable source (p. 276).
### 8.16 Process Scheduling
Historically coarse control: a process can only ask to be *nicer* (lower its own scheduling priority) via its **nice value**; raising priority needs privilege (p. 276).
```c
int nice(int incr);
int getpriority(int which, id_t who);
int setpriority(int which, id_t who, int value);
```
Nice values run 0 to `2*NZERO-1`; *lower* is higher priority, which reads backwards until you remember "the nicer you are, the less CPU you insist on" (p. 276). `nice(incr)` adjusts only the caller's own value, silently clamped to the legal range if `incr` pushes past it (p. 277). `getpriority`/`setpriority` work on a process, a process group, or every process owned by a user ID (`which` = `PRIO_PROCESS`/`PRIO_PGRP`/`PRIO_USER`), and can read/set several processes' priority in one call, unlike `nice` (p. 277). Worked-example numbers: two otherwise-identical busy-looping processes with equal nice values split CPU roughly 50/50 (50.2%/49.8%); giving the child the worst legal nice value drops its share to about 1.5%, the parent taking 98.5% (pp. 278-280).
### 8.17 Process Times
```c
clock_t times(struct tms *buf);
```
Fills `buf` with `tms_utime`/`tms_stime` (this process's own user/system CPU time) and `tms_cutime`/`tms_cstime` (summed over children the caller has actually `wait`ed for) - the function's own *return value*, not a struct field, gives wall-clock time, measured from an arbitrary fixed point, so only *differences* between two calls are meaningful (p. 280). Every `clock_t` value converts to seconds via `sysconf(_SC_CLK_TCK)` (p. 280). Worked example: timing three commands via `system()` shows `sleep 5` costing 5.01s real/0.00s user/0.00s sys (waiting, not computing); a command with real CPU work (`man bash > /dev/null`) shows its CPU time attributed entirely to the *child* process - the shell and the command it ran, not the timing program itself (pp. 281-282).
## Worked Example
A full `fork`/`exec`/`wait` sequence traced through the five OS process states the course uses (New/Ready/Running/Blocked/Done):
1. *Parent (Running):* executes `pid_t pid = fork();`.
2. *Child Creation (New → Ready):* the OS allocates the child's process control block, duplicates the parent's address space (copy-on-write), and queues it Ready. `fork()` returns the child's PID to the parent, 0 to the child.
3. *Parent Blocks (Running → Blocked):* the parent calls `waitpid(pid, &status, 0)` and, since the child is still alive, gives up the CPU.
4. *Child Runs and execs (Ready → Running):* the scheduler picks the child; it calls `execvp("ls", argv)`. ==The kernel replaces the child's text, data, bss, heap, and stack with `/usr/bin/ls`'s image, keeps its open file descriptors, and resets its program counter to `_start()`.==
5. *Child Terminates (Running → Zombie):* `ls` finishes and calls `exit(0)`; the kernel reclaims its memory but keeps its exit status around as a zombie entry.
6. *Parent Reaps (Blocked → Ready → Running → Done):* the child's exit generates `SIGCHLD`, unblocking the parent, which is scheduled, reads the exit status via `waitpid`, and the child's zombie entry is finally removed.
## Connections
- **Lecture (Lec02, 9/10; Lec03, 9/15):** Lec02 supplies the New/Ready/Running/Blocked/Done state model, `_start()`, the `init`/`systemd`-rooted process tree, and `fork()`'s return-value semantics; Lec03 supplies the six `exec` variant pairs (emphasizing `p` for `PATH`, `e` for custom environment) and the zombie/orphan/daemon taxonomy.
- **Lecture coverage gaps:** §8.11 (`setuid`/`setgid`/saved IDs), §8.12 (interpreter files), §8.13 (`system`), §8.14 (process accounting), §8.15 (`getlogin`), §8.16 (scheduling/`nice`), and §8.17 (`times`) have no matching slide in Lec01-06 - textbook-only for this course so far.
- **Lab 1:** `fork_wait.c`/`fork_exec.c` are hands-on repeats of §8.3's `fork`/`exec`/`wait` error-check pattern and the status macros of §8.6, exactly as taught, not extended beyond it.
- **Textbook ([[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter 1]], [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter 7]]):** Chapter 1 sketches `fork`/`exec`/`wait` at the level of one small shell example; Chapter 7's termination taxonomy (§7.3) is exactly what this chapter's `wait` status macros (§8.6) are built to inspect from the parent's side.
## Open Questions
- [ ] Implement a small shell in C using `fork()`, `execvp()`, and `waitpid()`, following the pattern this chapter and Chapter 1's toy shell both sketch.
- [ ] ==Verify `WNOHANG` non-blocking behavior by polling a deliberately slow-sleeping child in a loop with `waitpid()`.==
- [ ] Demonstrate orphan adoption directly: have a parent `fork()` and exit immediately, then print the child's `getppid()` before and after the parent's exit.
- [ ] Reproduce the `at(1)`-style saved-set-user-ID privilege dance (§8.11) in a small test program: drop with `seteuid`, do privileged work, drop again.
- [ ] Once §8.13's security-hole warning is understood, write the specific `IFS`-manipulation attack the book alludes to and confirm why `system()` in a set-user-ID program is unsafe.
## Flashcards
#cards/csci4061
How do `exec` functions replace a process image while preserving its identity?::An `exec` call overwrites the process's text, data, bss, heap, and stack with a new binary image and resets the program counter, but preserves the original process ID and keeps open file descriptors open unless individually marked `FD_CLOEXEC`.
What's the fundamental difference between `wait()` and `waitpid()` called with `WNOHANG`?::`wait()` unconditionally blocks until any child terminates; `waitpid()` with `WNOHANG` checks a specific target and returns 0 immediately if it hasn't exited yet, enabling non-blocking polling instead of blocking.
What distinguishes a zombie process from an orphan process?::A zombie is a terminated child whose parent hasn't yet called `wait()` to collect its exit status. An orphan is a child (running or terminated) whose parent exited first, so it gets adopted by `init`/`systemd`, which eventually reaps it.
Why does `vfork()` suspend the parent until the child calls `exec()` or `_exit()`?::`vfork()` runs the child directly inside the parent's own address space with no copy at all; suspending the parent prevents the two from corrupting each other's shared memory until the child either replaces its image or terminates.
What does the saved set-user-ID actually let a process do that it couldn't do otherwise?::It preserves a copy of the effective UID from `exec` time, so a process that has voluntarily dropped its effective UID down to the real UID can later `seteuid` back up to that saved, elevated identity - recovering a privilege it legitimately had, not escalating to one it never held.
Why is calling `system()` from a set-user-ID program considered a serious security hole?::`system()`'s internal `fork`+`exec` inherits the calling process's effective privileges straight through to the shell it invokes, so a set-user-ID-root program handed an arbitrary command string effectively hands out root-level shell access - the shell's own environment-variable parsing (like `IFS`) can also be manipulated by the caller beforehand.
Why does an interpreter file's `#!` line shift the original command-line arguments by two positions?::The kernel inserts the interpreter's own pathname as `argv[0]` and the interpreter file's optional argument as `argv[1]` before appending the interpreter file's own path and the caller's original arguments - the interpreter never sees the command the way the user actually typed it.
