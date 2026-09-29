---
type: class
input_kind: book
status: seed
created: 2026-04-23
updated: 2026-09-29
area:
  - "[[CSCI 4061 Board]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]]"
tags:
  - "#class"
  - "#Textbook"
next: "Feed this chapter into Week - 2's Textbook integration section"
---
# Chapter - 3 — File I/O
**Source:** W. Richard Stevens and Stephen A. Rago, *Advanced Programming in the UNIX Environment*, 3rd ed. (Addison-Wesley, 2013), Chapter 3, pp. 61-91.
**Read from:** `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\Textbook\Advanced Programming in the UNIX Environment, 3rd Edition.pdf`
**Course role:** Week 2 reading, paired with Chapter 7. Lec03 (9/15) and Lec04 (9/17) teach `open`/`read`/`write`, the fd-table chain, and `dup2` in detail - but the file-permission-bit material they also cover (octal modes, `chmod`) actually belongs to APUE §4.5-4.9, and the buffering material belongs to APUE Chapter 5, both flagged in the [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]]'s 2026-09-24 correction. Sections 3.6 (`lseek`), 3.9 (I/O efficiency benchmarks), 3.13-3.16 (`sync`/`fsync`, `fcntl`, `ioctl`, `/dev/fd`) have **no matching lecture coverage** - textbook-only for this course so far.
## Chapter Summary
UNIX file I/O gives every process one uniform, integer-indexed handle - the ==file descriptor== - for reading, writing, and controlling anything from a regular file to a pipe or a terminal, with unbuffered system calls doing the real work underneath the buffered stdio layer (p. 61).
*Mechanism:* Kernel-maintained structures - a per-process file descriptor table, a system-wide file table, and the i-node table - decouple the small integer a program holds from the physical file on disk, which is what lets `fork()` share offsets, `O_APPEND` guarantee atomic appends, and `dup2()` redirect a stream without touching a single line of the program that uses it.
## Key Concepts
- **unbuffered I/O**: Direct I/O operations (`open`, `read`, `write`, `lseek`, `close`) executing immediate kernel system calls without user-space buffering (p. 61; Lec03).
- **file descriptor**: Non-negative integer index used by a process to identify an open file in kernel structures (p. 61).
- **STDIN_FILENO** / **STDOUT_FILENO** / **STDERR_FILENO**: The three descriptors (0, 1, 2) every process starts with (p. 62; Lec03).
- **lowest-numbered unused descriptor rule**: Kernel allocation policy guaranteeing that `open` or `dup` returns the lowest available numeric descriptor index (p. 64).
- **open** / **openat**: System calls opening or creating files, returning a file descriptor (pp. 62-65; Lec03).
- **O_RDONLY** / **O_WRONLY** / **O_RDWR** / **O_EXEC** / **O_SEARCH**: The five mutually exclusive access-mode flags, exactly one required per `open` call (p. 62).
- **O_CREAT** / **O_TRUNC** / **O_APPEND** / **O_EXCL**: Optional status flags to create a missing file, truncate to zero, force every write to append, and enforce atomic creation (pp. 63-64; Lec04).
- **creat**: System call creating a write-only file, equivalent to `open` with `O_WRONLY|O_CREAT|O_TRUNC` (p. 66).
- **close**: System call closing an open file descriptor and releasing process locks (p. 66).
- **current file offset**: Per-open-file byte position that `read`/`write` advance automatically, and `lseek` can reposition explicitly (p. 66).
- **lseek**: System call repositioning a file's current offset by `SEEK_SET`/`SEEK_CUR`/`SEEK_END` (p. 66).
- **hole**: A gap in a file created by seeking past end-of-file and writing, read back as zero bytes without necessarily consuming disk blocks (p. 68).
- **read**: System call reading up to `count` bytes from a descriptor into a buffer, returning `ssize_t` bytes read or 0 on EOF (p. 71; Lec03).
- **ssize_t** / **size_t**: Signed and unsigned integer types used for byte counts and system call return values (p. 71; Lec03).
- **write**: System call writing `count` bytes from a buffer to a descriptor, copying data into kernel buffers (p. 72; Lec03).
- ==**process file descriptor table**==: Per-process kernel vector mapping numeric file descriptors to global system file table entries (p. 74; Lec04).
- **system file table**: Global kernel table holding open-file status flags, reference counts, current offsets, and i-node pointers (p. 74; Lec04).
- **i-node table**: Kernel memory table representing physical files on disk, storing file metadata, permissions, and block pointers shared across processes (pp. 74-75; Lec04).
- **atomic operation**: Operation executed by the kernel completely or not at all, preventing multi-process race conditions (p. 77, 79).
- **pread** / **pwrite**: Atomic read and write system calls that execute at a specified offset without modifying the system file table offset (pp. 78-79).
- **dup** / **dup2**: System calls duplicating an existing file descriptor to the lowest available index (`dup`) or a targeted descriptor index (`dup2`) (pp. 79-81; Lec04).
- **sync** / **fsync** / **fdatasync**: Functions forcing kernel-buffered writes out to disk, at the whole-system, single-file, or data-only granularity (p. 81).
- **fcntl**: System call reading or changing properties of an already-open file descriptor - duplication, descriptor/status flags, async-I/O ownership, record locks (p. 82).
- **FD_CLOEXEC**: The one defined file descriptor flag, controlling whether a descriptor survives `exec` (p. 83).
- **O_SYNC** / **O_DSYNC** / **O_RSYNC**: File status flags forcing `write` to wait for physical I/O (data+attributes, data only, or read/write sync) before returning (p. 83).
- **ioctl**: Catchall system call for device operations that don't fit `open`/`read`/`write`/`lseek`/`close`, historically dominated by terminal I/O (p. 87).
- **/dev/fd**: Directory whose numbered entries (`/dev/fd/0`, `/dev/fd/1`, ...) are equivalent to `dup`-ing the matching descriptor, letting pathname-taking programs treat stdin/stdout uniformly with real files (p. 88).
- **file access permissions**: The 9-bit `rwxrwxrwx` access control model governing User, Group, and Other permissions (APUE Ch4 pp. 99-100; Lec03/Lec04).
- **octal representation**: Base-8 numeric encoding of permission bit vectors (`400` user read through `001` other execute) (APUE Ch4 p. 105; Lec03/Lec04).
- **chmod**: Utility and system call modifying file access permissions via octal or symbolic modes (APUE Ch4 pp. 105-106; Lec04).
- **standard I/O library**: ISO C high-level stream interface (`FILE *`) providing user-space buffering above system calls (APUE Ch5 p. 143; Lec03).
- **fully buffered** / **line buffered** / **unbuffered**: Standard I/O buffer management strategies governing when accumulated data triggers a `write()` system call (APUE Ch5 pp. 145-146; Lec03/Lec04).
- **pipe**: Inter-process communication channel connecting the standard output of one command to the standard input of another (Lec04).
## Full Reading Notes
### 3.1 Introduction
UNIX file I/O runs through five functions - **open**, **read**, **write**, **lseek**, **close** - each a direct system call and thus **unbuffered I/O**, in contrast to the buffered ISO C stdio routines (p. 61). The chapter's other topics: **atomic operation** guarantees, the kernel structures behind file sharing, and control functions **dup**, **fcntl**, **sync**, **fsync**, **ioctl** (p. 61). *Course Framing (Lec03/Lec04):* the lecture pair frames this as low-level POSIX-specific control (`open`/`read`/`write`/`lseek`/`close`) versus portable, auto-buffered C stdio (`fopen`/`fread`/`fwrite`/`fseek`/`ftell`/`fclose`).
### 3.2 File Descriptors
The kernel identifies every open file by a non-negative integer **file descriptor** (p. 61). By convention every shell opens three on process start: 0 (**STDIN_FILENO**, `stdin`), 1 (**STDOUT_FILENO**, `stdout`), 2 (**STDERR_FILENO**, `stderr`), all defined in `<unistd.h>` (p. 62). Descriptors range 0 through `OPEN_MAX - 1`, and the kernel is guaranteed to hand back the **lowest-numbered unused descriptor** on `open`/`dup` (pp. 62, 64).
### 3.3 open and openat Functions
```c
int open(const char *path, int oflag, ... /* mode_t mode */ );
int openat(int fd, const char *path, int oflag, ... /* mode_t mode */ );
```
Both return a descriptor on success or -1 on error (p. 63). Exactly one access-mode flag is required: `O_RDONLY`, `O_WRONLY`, `O_RDWR`, `O_EXEC`, `O_SEARCH` (pp. 62-63). Optional flags OR in on top: `O_APPEND`, `O_CLOEXEC`, `O_CREAT` (needs the `mode` third argument), `O_DIRECTORY`, `O_EXCL` (atomic existence-check-plus-create with `O_CREAT`), `O_NOCTTY`, `O_NOFOLLOW`, `O_NONBLOCK`, `O_SYNC`/`O_DSYNC`/`O_RSYNC`, `O_TRUNC`, `O_TTY_INIT` (pp. 63-64). `fopen(path, "w")` is exactly `open(path, O_CREAT|O_WRONLY|O_TRUNC, mode)` (Lec03/Lec04). `openat` resolves a relative `path` starting from the open directory `fd` (or the working directory if `fd == AT_FDCWD`) instead of always the process's own working directory - this lets a multithreaded program with several "current directories" avoid a **TOCTTOU** (time-of-check-to-time-of-use) race that a plain `open` on a relative path would be exposed to (p. 65). File permission constants for the `mode` argument live in `<sys/stat.h>`: `S_IRUSR`/`S_IWUSR`/`S_IXUSR` (0400/0200/0100), and the matching `_GRP`/`_OTH` forms (Lec03/Lec04).
### 3.4 creat Function
```c
int creat(const char *path, mode_t mode);
```
Returns a write-only descriptor or -1 (p. 66). Exactly equivalent to `open(path, O_WRONLY|O_CREAT|O_TRUNC, mode)` (p. 66). It exists because early UNIX `open` couldn't create a file at all; its write-only limitation means creating a file meant to be both read and written required `creat`, `close`, then a second `open` - modern code just uses `open` with `O_RDWR|O_CREAT|O_TRUNC` directly (p. 66).
### 3.5 close Function
```c
int close(int fd);
```
Returns 0 or -1 (p. 66). Closes the descriptor and releases any record locks the process held on it; the kernel automatically closes every open descriptor when a process terminates, which is why the chapter's small example programs never bother calling `close` explicitly (p. 66).
### 3.6 lseek Function
Every open file has a **current file offset**, a non-negative byte count from the start, initialized to 0 unless `O_APPEND` is set (p. 66).
```c
off_t lseek(int fd, off_t offset, int whence);
```
Returns the new offset or -1 (p. 67). `whence` interprets `offset`: `SEEK_SET` (from the start), `SEEK_CUR` (relative to the current offset, `offset` may be negative), `SEEK_END` (relative to end-of-file, `offset` may be negative). `lseek(fd, 0, SEEK_CUR)` is the standard trick to read the current offset without moving it, and it also detects whether `fd` supports seeking at all - pipes, FIFOs, and sockets fail with `errno == ESPIPE` (p. 67). `lseek` only updates the kernel's record of the offset; it causes zero I/O by itself (p. 68).
*Holes:* Setting the offset past the current end of file and then writing extends the file with a **hole** - unwritten bytes in the gap read back as 0, and depending on the file system, no disk blocks are actually allocated for them (p. 68). Worked example: a program writes 10 bytes, `lseek`s to offset 16384, writes 10 more bytes; `ls -l` reports a 16,394-byte file, but `du` shows it consumes only 8 disk blocks, versus 20 blocks for a same-size file with no hole (pp. 68-69). Since `off_t` is signed, a 32-bit `off_t` caps maximum file size at $2^{31}-1$ bytes; the `_POSIX_V7_*` `sysconf` constants and the `_FILE_OFFSET_BITS` compile-time switch (32 vs. 64) let an application choose (p. 69-70).
### 3.7 read Function
```c
ssize_t read(int fd, void *buf, size_t count);
```
Returns bytes read, 0 at EOF, or -1 (p. 71; Lec03). `ssize_t` is signed (can represent -1); `size_t` is unsigned. Unlike `fread`, byte counts in and out, not "elements" (Lec03). ==`read` and `write` are not guaranteed to transfer exactly `count` bytes== - fewer come back at EOF, or when reading from a terminal or network socket (p. 71). Classic bug: an uninitialized `char *buf;` with no backing storage writes into garbage memory (Lec03). Standard chunk-reading pattern, traced for a 10-byte file `"ABCDEFGHIJ"` with `BUFSIZE=4`: reads return 4, 4, 2, then 0 (EOF), printing `"ABCD"`, `"EFGH"`, `"IJ"` before the loop exits (Lec03 walkthrough).
### 3.8 write Function
```c
ssize_t write(int fd, const void *buf, size_t count);
```
Returns bytes written or -1 (p. 72; Lec03). Writes begin at the current offset; if `O_APPEND` was set at `open` time, the offset is reset to the file's current size immediately before every write, atomically (p. 72). A successful return guarantees the data reached a kernel buffer, not that it has physically reached disk yet (Lec03).
### 3.9 I/O Efficiency
Copying a file with a plain `read`/`write` loop (Figure 3.5) raises the question of what `BUFSIZE` to pick. A real 516,581,760-byte file, copied with 20 different buffer sizes, shows clock time dropping sharply up to `BUFSIZE = 4096` (matching the ext4 file system's `st_blksize`) and then flattening out - larger buffers barely help further (p. 72-73). Most file systems also do **read-ahead**, prefetching more than requested when they detect sequential access, which is why even small buffers (32 bytes) can perform nearly as well as the optimum in the same benchmark (p. 73). The kernel caches file contents in memory (**incore**, the origin of the phrase "core dump"), so repeated timing runs on the same file get faster after the first - real benchmarks use a fresh copy of the file per run to avoid this (p. 74).
### 3.10 File Sharing
Three kernel-maintained structures make open-file sharing across processes work (p. 74): the **process file descriptor table** (per process, holding descriptor flags like `FD_CLOEXEC` plus a pointer into the system file table), the **system file table** (global, one entry per `open()` call, holding status flags, current offset, a reference count, and a pointer to the i-node), and the **i-node table** (one entry per physical file, shared by every process that ends up pointing at it). Two exercises make the sharing rules concrete (Lec04):
- *Two unrelated processes independently `open()` the same file:* each gets its own process-table entry and its own system-file-table entry (independent offsets, both starting at 0), but they share one i-node. If both read then write 8 bytes on an initially 8-byte file, each extends the file independently at its own offset 8 - the second writer's bytes overwrite the first's.
- *One process `open()`s a file, then `fork()`s:* parent and child get separate process-table entries but **share the single system-file-table entry** created by the one `open()` call - meaning they share one offset. A `read`, `write`, or `lseek` in either process moves the position for both; if the parent reads and writes the whole file first, the child's subsequent read hits EOF and writes uninitialized garbage.
### 3.11 Atomic Operations
An **atomic operation** is a multi-step kernel operation guaranteed to complete entirely or not at all, with no other process able to interleave in the middle (pp. 77, 79). *Appending:* two separate calls - `lseek(fd, 0, SEEK_END); write(fd, buf, 100);` - have a race: if Process A seeks to offset 1500 and is preempted before writing, Process B can seek to 1500, write 100 bytes (now offset 1600), and when A resumes its stale `write` at 1500 overwrites B's data (p. 78). Opening with `O_APPEND` fixes this atomically - the kernel sets the offset to the file's current size straight from the i-node immediately before *every* write, with no window for another process to interleave (p. 78). `pread`/`pwrite` (`<unistd.h>`) combine an `lseek`+`read`/`write` into one atomic call that also leaves the file's real offset untouched (pp. 78-79). `O_CREAT|O_EXCL` together make file creation atomic: the existence check and the creation happen as one kernel operation, so two processes racing to create the same file can't both "win" (p. 79).
### 3.12 dup and dup2 Functions
```c
int dup(int fd);
int dup2(int fd, int fd2);
```
Both return a new descriptor or -1 (p. 79). `dup` returns the lowest available descriptor pointing at the same system-file-table entry as `fd` (shared offset, status flags), but with its own fresh `FD_CLOEXEC` flag (cleared) (pp. 79-80). `dup2(fd, fd2)` targets a specific index: if `fd2` is already open it's closed first; if `fd == fd2` it returns immediately with no close; otherwise `FD_CLOEXEC` is cleared on the result (p. 79). `dup2` is atomic - unlike manually doing `close(fd2); fcntl(fd, F_DUPFD, fd2);`, which leaves a race window where a signal or another thread could grab `fd2` in between (pp. 80-81). *Redirection (Lec04):* `dup2(regular_fd, STDOUT_FILENO)` repoints fd 1 at whatever `regular_fd` points to; every subsequent `printf`, `write(1, ...)`, or an `exec`'d program's own output writes into that file without any code change - "the process thinks it's printing to the screen" (p. 80).
### 3.13 sync, fsync, and fdatasync Functions
The kernel normally defers disk writes (**delayed write**), queuing modified blocks in a buffer/page cache until it needs to reuse the buffer for something else (p. 81).
```c
int fsync(int fd);
int fdatasync(int fd);
void sync(void);
```
`sync` (no error return) just queues every modified buffer for writing and returns immediately - it doesn't wait; a system daemon usually calls it every ~30 seconds, and `sync(1)` calls it too. `fsync` waits for one file's writes to actually complete, updating its attributes too - what a database uses to be sure data survived a crash. `fdatasync` is the same but skips attribute updates, touching only the data (p. 81).
### 3.14 fcntl Function
```c
int fcntl(int fd, int cmd, ... /* int arg */ );
```
Return value depends on `cmd` (p. 82). Five purposes: duplicate a descriptor (`F_DUPFD`/`F_DUPFD_CLOEXEC`), get/set descriptor flags (`F_GETFD`/`F_SETFD` - the only one defined is `FD_CLOEXEC`), get/set file status flags (`F_GETFL`/`F_SETFL` - reads back the same `O_*` flags from `open`, though the five access-mode flags aren't independently testable bits and need the `O_ACCMODE` mask first), get/set async-I/O signal ownership (`F_GETOWN`/`F_SETOWN`), and get/set record locks (`F_GETLK`/`F_SETLK`/`F_SETLKW`, covered in Chapter 14) (pp. 82-84). Worked example: turning on `O_SYNC` for stdout via `fcntl(fd, F_SETFL, val | O_SYNC)` and re-timing the Section 3.9 copy benchmark shows synchronous writes costing noticeably more system and clock time on Mac OS X (HFS); on the tested Linux/ext4 system the flag didn't actually take effect through `fcntl`, illustrating that `fcntl`'s effect is genuinely platform-dependent (pp. 85-87). The essential reason `fcntl` exists at all: a program that only has a descriptor (say, stdout, opened by the shell, not by the program itself) still needs a way to change that descriptor's properties without knowing what file backs it (p. 87).
### 3.15 ioctl Function
```c
int ioctl(int fd, int request, ...);
```
Returns -1 on error, something else on success (p. 87). The catchall for device operations that don't fit the other functions in this chapter - historically dominated by terminal I/O (later given its own POSIX.1 functions, Chapter 18) and magnetic-tape operations (write an end-of-file mark, rewind, space over N records) that have no natural expression as `read`/`write`/`lseek` (p. 87-88). Each device driver defines its own `ioctl` command set on top of a few generic categories the system itself provides.
### 3.16 /dev/fd
Opening `/dev/fd/n` is equivalent to `dup`-ing descriptor `n`, so `fd = open("/dev/fd/0", mode)` behaves like `fd = dup(0)` - the two descriptors share a file table entry, so a read-only original stays read-only even if the `open` call's mode claims otherwise (p. 88-89). `/dev/stdin`, `/dev/stdout`, `/dev/stderr` alias `/dev/fd/0`/`1`/`2` on some systems. Its main use: shell pipelines where a program expects a *pathname* argument but the data is really standard input - `filter file2 | cat file1 /dev/fd/0 file3 | lpr` avoids `cat`'s special-cased `-` convention for "read stdin here," which is fragile (e.g. ambiguous as the first argument) (p. 89).
### 4.5-4.9 File Access Permissions (APUE Ch4, taught in the Ch3 week)
*rwxrwxrwx Model:* three user classes - **user** (owner), **group**, **other** - each with **read**/**write**/**execute** (APUE Ch4 pp. 99-100; Lec03/Lec04). For directories, read lists entries, write creates/removes entries, execute (the "search bit") lets a pathname component be traversed (APUE Ch4 p. 100).
*Octal Representation:* user read/write/execute = 400/200/100, group = 040/020/010, other = 004/002/001 (APUE Ch4 p. 105; Lec03/Lec04).
*chmod Command:* absolute (`chmod 700 secret_script.py`) or symbolic (`chmod u+x testius`, `chmod og+r lab02.zip`, `chmod o-rw points.bin`) (APUE Ch4 pp. 105-106; Lec04).
*open() Mode Argument Constants:* `<sys/stat.h>` constants `S_IRUSR`(0400)/`S_IWUSR`(0200)/`S_IXUSR`(0100) and the matching `_GRP`/`_OTH` forms, e.g. `open("points.bin", O_CREAT|O_WRONLY|O_TRUNC, S_IRUSR|S_IWUSR)` (APUE Ch4 p. 99; Lec04).
> [!NOTE]
> This block genuinely belongs to Chapter 4 §4.5-4.9, not Chapter 3 - it's captured here only because Lec03/Lec04 taught it during the "Chapter 3 week." The full, book-order version - including `umask`, ownership rules, the sticky bit, and `chmod`'s automatic bit-clearing behavior - lives in [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter 4]]'s own §4.5-4.10.
### Buffering (APUE Ch5, taught in the Ch3 week)
*Three Standard I/O Buffering Modes:* **fully buffered** (disk files - flush when the buffer fills), **line buffered** (`stdin`/`stdout` on a terminal - flush on `\n`), **unbuffered** (`stderr` - every write goes straight to the kernel) (APUE Ch5 pp. 145-146; Lec03/Lec04).
*Flushing vs. Syncing:* `fflush` pushes a stdio buffer down to the kernel via `write()`, but doesn't guarantee disk persistence; `fsync` (§3.13) forces the kernel's own buffers to disk (APUE Ch5 p. 147; Lec03/Lec04).
*Interleaving Walkthrough (Lec03/Lec04):* `printf("A"); printf("B"); fprintf(stderr,"Z"); printf("C\n"); fprintf(stderr,"Y"); printf("D\n"); fprintf(stderr,"X"); printf("E\n");` prints `"ZABC YD XE"` - `stdout`'s `"A"`/`"B"` sit in the line buffer doing nothing, `stderr`'s unbuffered `"Z"` hits the screen immediately, and only the `\n` after `"C"` flushes the accumulated `"ABC"` in one `write()` (Lec03/Lec04).
> [!NOTE]
> This buffering block belongs to APUE Chapter 5, which isn't one of this course's six landed chapter notes and was never separately assigned - it's a real gap in the Textbook Map, not just a misfiling, flagged for Build 2's review of the Map itself.
## Worked Example
A full output-redirection simulation ties `fork`/`open`/`dup2`/`exec` together (Lec04):
```c
#include "apue.h"
#include <fcntl.h>
#include <sys/wait.h>
int main(void) {
    pid_t pid = fork();
    if (pid < 0) {
        err_sys("fork error");
    } else if (pid == 0) {
        int fd = open("ls_out.txt", O_CREAT | O_WRONLY | O_TRUNC, S_IRUSR | S_IWUSR);
        if (fd < 0) err_sys("open error");
        dup2(fd, STDOUT_FILENO);
        close(fd);
        execlp("ls", "ls", "-l", (char *)0);
        err_sys("execlp error");
    }
    if (wait(NULL) < 0) err_sys("wait error");
    printf("Command Done\n");
    exit(0);
}
```
`dup2(fd, STDOUT_FILENO)` in the child repoints fd 1 to `ls_out.txt`'s system-file-table entry before `execlp` even runs; when `ls -l` calls `write(STDOUT_FILENO, buf, count)`, ==because both screen printing and file writing are fundamentally the same `write()` system call to file descriptor 1, `ls` "thinks it's printing to the screen" when it's really appending bytes to `ls_out.txt`, achieving redirection without touching a single line of `ls`'s own source.== Extending this with a pipe (`ls -l | sort`) is the same mechanism twice, connecting `ls`'s stdout to `sort`'s stdin - the "Unix philosophy" example: Donald Knuth's from-scratch, 10-page word-frequency counter versus Doug McIlroy's six-command pipeline, `tr -cs A-Za-z '\n' | tr A-Z a-z | sort | uniq -c | sort -rn | head -n 10` (Lec04).
## Connections
- **Lecture (Lec03, 9/15; Lec04, 9/17):** Lec03 covers low-level vs. stdio I/O, standard stream descriptors, `open()` flags, the `read()` chunk-loop pattern, and `stdout`/`stderr` buffering interleaving - and, as flagged above, also teaches file permissions (really §4.5-4.9) and stdio buffering (really Ch5). Lec04 covers the three-level kernel table chain, shared offsets across `fork()`, atomic operations, `dup`/`dup2`, output redirection, and the Unix-philosophy pipeline example.
- **Lecture coverage gaps:** Sections 3.6 (`lseek`), 3.9 (I/O efficiency benchmarks), 3.13 (`sync`/`fsync`/`fdatasync`), 3.14 (`fcntl`), 3.15 (`ioctl`), and 3.16 (`/dev/fd`) have no matching lecture slide anywhere in Lec01-06 - textbook-only for this course so far.
- **Textbook ([[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter 7]]):** Chapter 7's `_exit`/`exit` termination taxonomy and memory-layout material sit one level above this chapter's file-descriptor mechanics - a process's open files (this chapter) and its memory segments (Chapter 7) are the two halves of "what a process actually has."
- **Textbook (pending [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter 10]]):** signals interacting with slow system calls like `read`/`write` (§10.5, `EINTR`) directly affects code written against this chapter's functions - not yet cross-checked against Chapter 10's own note.
## Open Questions
- [ ] Test `dup2()` output redirection in a C program by redirecting `STDOUT_FILENO` to a file and verifying `printf()` output lands on disk.
- [ ] Reproduce the Section 3.9 buffer-size benchmark on the course's own container and check whether `st_blksize` still lands near the same sweet spot.
- [ ] ==Verify how `umask` masks file-creation permission bits when calling `open()` with `O_CREAT` and mode `S_IRUSR|S_IWUSR`== - this crosses into [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter 4]] §4.8.
- [ ] Confirm on the course container whether `O_SYNC` actually changes measured write time via `fcntl(F_SETFL, ...)`, the way the book's Linux test showed it silently not taking effect.
- [ ] Create a file with a real hole (seek-then-write) and confirm `st_size` versus `st_blocks * 512` diverge as the book's example predicts.
## Flashcards
#cards/csci4061
How does `dup2(oldfd, newfd)` atomically redirect standard output to a file?::`dup2()` closes `newfd` first if it's open, then repoints `newfd` in the process file descriptor table to the same system file table entry as `oldfd`, so subsequent `write(newfd, ...)` calls land in the underlying file.
What happens when a parent process opens a file and then invokes `fork()`?::Parent and child get separate process file descriptor table entries that point to the same system file table entry, so they share one file offset - a read, write, or seek in either process advances position for both.
What mechanism makes `O_CREAT|O_EXCL` together in `open()` guarantee atomic file creation?::==The kernel performs the existence check and the file creation as a single, uninterruptible operation, failing with an error if the file already exists - closing the race window a separate check-then-create would leave open.==
Why is a hole in a file not the same as writing actual zero bytes?::A hole is created by seeking past end-of-file and writing further out; the unwritten gap reads back as zeros, but the file system generally doesn't allocate disk blocks to store it, so `st_size` can be far larger than the space `du` reports as actually used.
Why does `dup2()` beat manually calling `close(fd2)` then `fcntl(fd, F_DUPFD, fd2)`?::`dup2()` performs the close-and-duplicate as one atomic system call; the manual two-step version leaves a race window between the close and the duplicate where a signal handler or another thread could grab descriptor `fd2` first.
What's the actual difference between what `fsync()` and `O_SYNC` each guarantee?::`O_SYNC` makes every single `write()` call block until that write's data (and attributes) physically reach disk; `fsync()` is called on demand to flush everything written so far for one file, without changing how ordinary writes behave in between.
Why can't a program call `fopen()` to change a descriptor's synchronous-write behavior after the fact?::`fopen()` only opens a new stream - a program that has only a descriptor (stdout, opened by the shell before the program even started) can't re-open it by pathname. `fcntl(fd, F_SETFL, ...)` is what lets a program change an already-open descriptor's properties.
