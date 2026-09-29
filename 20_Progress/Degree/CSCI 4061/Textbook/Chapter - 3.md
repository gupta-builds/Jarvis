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
# Chapter - 3
## Chapter Summary
<!-- State the chapter's one-sentence claim and use exactly one ==highlight== anchor. -->
== ==
*Mechanism:*
<!-- Explain how the chapter's claim works. -->
### 3.1 Introduction
UNIX file I/O operations are performed using five fundamental functions: **open**, **read**, **write**, **lseek**, and **close** (p. 61).
These functions are described as **unbuffered I/O** because each invocation executes a direct **system call** within the kernel, in contrast to ISO C standard library routines (p. 61).
Unbuffered I/O functions are defined by POSIX.1 and the Single UNIX Specification (p. 61).
Key topics covered include **atomic operation** guarantees, kernel data structures supporting **file sharing**, and control functions including **dup**, **fcntl**, **sync**, **fsync**, and **ioctl** (p. 61).
*Course Framing (Lec03/Lec04):* Lec03 contrasts low-level unbuffered system calls (`open`, `read`, `write`, `lseek`, `close`) with high-level C standard I/O library functions (`fopen`, `fread`, `fwrite`, `fseek`, `ftell`, `fclose`). While C standard I/O functions are portable C standards executing in user space with automatic buffering, low-level system calls provide precise POSIX-specific control and interact directly with kernel-maintained file structures (Lec03).
### 3.2 File Descriptors
To the kernel, all open files are identified by non-negative integers termed **file descriptor** values (p. 61).
When a process opens an existing file or creates a new file, the kernel returns a file descriptor for subsequent read and write operations (p. 61).
By convention, UNIX shells associate three standard file descriptors with every process upon startup (p. 62):
- Descriptor 0: **standard input**, defined by symbolic constant **STDIN_FILENO** in `<unistd.h>` (p. 62); corresponds to C stdio stream **stdin** (Lec03).
- Descriptor 1: **standard output**, defined by symbolic constant **STDOUT_FILENO** in `<unistd.h>` (p. 62); corresponds to C stdio stream **stdout** (Lec03).
- Descriptor 2: **standard error**, defined by symbolic constant **STDERR_FILENO** in `<unistd.h>` (p. 62); corresponds to C stdio stream **stderr** (Lec03).
File descriptors range from 0 through `OPEN_MAX - 1` (p. 62).
Lowest-numbered unused descriptor rule: the kernel is guaranteed to assign the lowest available numeric descriptor index when opening or creating a file (p. 64).
### 3.3 open and openat Functions
*Function Prototypes (`<fcntl.h>`):*
```c
int open(const char *path, int oflag, ... /* mode_t mode */ );
int openat(int fd, const char *path, int oflag, ... /* mode_t mode */ );
```
Both functions return a file descriptor if successful, or -1 on error (p. 63). Course slides present `open()` with two signatures depending on whether `O_CREAT` is specified: `int open(const char *pathname, int flags);` and `int open(const char *path, int flags, mode_t mode);` (Lec03/Lec04). _Required Access Mode Flags:_ Exactly one of the following five access mode constants must be specified in `oflag` (p. 62–63):

- **O_RDONLY**: Open for reading only (historically defined as 0) (p. 62).
- **O_WRONLY**: Open for writing only (historically defined as 1) (p. 62).
- **O_RDWR**: Open for reading and writing (historically defined as 2) (p. 62).
- **O_EXEC**: Open for execute only (p. 62).
- **O_SEARCH**: Open directory for searching only (p. 62). _Optional Flag Constants:_ May be combined with an access mode using bitwise OR (`|`) (p. 63–64):
- **O_APPEND**: Append to the end of file on each write operation (p. 63).
- **O_CLOEXEC**: Set the `FD_CLOEXEC` file descriptor flag (p. 63).
- **O_CREAT**: Create the file if it does not exist; requires the third argument **mode** to set access permissions (p. 63).
- **O_DIRECTORY**: Return an error if `path` does not refer to a directory (p. 63).
- **O_EXCL**: Return an error if `O_CREAT` is specified and the file already exists; performs existence check and creation as an atomic operation (p. 63).
- **O_NOCTTY**: Do not allocate terminal device as controlling terminal (p. 63).
- **O_NOFOLLOW**: Return an error if `path` is a symbolic link (p. 63).
- **O_NONBLOCK**: Set nonblocking mode for FIFO or device files (p. 63).
- **O_SYNC**: Block writes until physical I/O and file attribute updates complete (p. 63).
- **O_DSYNC**: Block writes until physical I/O completes, excluding non-essential attribute updates (p. 63).
- **O_RSYNC**: Synchronize read operations with pending writes (p. 63).
- **O_TRUNC**: Truncate file length to 0 if successfully opened for writing (p. 63).
- **O_TTY_INIT**: Initialize unopened terminal devices to SUS-compliant parameters (p. 64). _Stdio Equivalence:_ Calling `fopen(path, "w")` in standard I/O is exactly equivalent to `open(path, O_CREAT | O_WRONLY | O_TRUNC, mode)` (Lec03/Lec04). _openat Semantics:_ Evaluates relative pathnames starting from directory descriptor `fd` (or current working directory if `fd` is `AT_FDCWD`), enabling multithreaded directory operations and preventing time-of-check-to-time-of-use (**TOCTTOU**) file system race conditions (p. 65). _File Permission Constants (`<sys/stat.h>`):_ Specified via `mode` bitmask when creating files: `S_IRUSR` (0400 owner read), `S_IWUSR` (0200 owner write), `S_IXUSR` (0100 owner execute), `S_IRGRP` (0040 group read), `S_IWGRP` (0020 group write), `S_IXGRP` (0010 group execute), `S_IROTH` (0004 other read), `S_IWOTH` (0002 other write), `S_IXOTH` (0001 other execute) (Lec03/Lec04).

### 3.4 creat Function

_Function Prototype (`<fcntl.h>`):_

```
int creat(const char *path, mode_t mode);
```

Returns a write-only file descriptor if OK, or -1 on error (p. 66). Equivalence: Calling `creat(path, mode)` is exactly equivalent to calling `open(path, O_WRONLY | O_CREAT | O_TRUNC, mode)` (p. 66). Historical Context: Early UNIX systems allowed only 0, 1, or 2 as `open` flags and could not create non-existent files, requiring `creat` as a separate system call (p. 66). Deficiency: `creat` opens files write-only; creating a temporary file for writing and reading required `creat`, `close`, and `open`, whereas modern `open` uses `O_RDWR | O_CREAT | O_TRUNC` directly (p. 66).

### 3.5 close Function

_Function Prototype (`<unistd.h>`):_

```
int close(int fd);
```

Returns 0 if OK, or -1 on error (p. 66). Behavior: Closes an open file descriptor and releases any record locks held by the process on that file (p. 66). Automatic Cleanup: When a process terminates, all of its open file descriptors are closed automatically by the kernel (p. 66).

### 3.7 read Function

_Function Prototype (`<unistd.h>`):_

```
ssize_t read(int fd, void *buf, size_t count);
```

Returns number of bytes read if OK, 0 on end-of-file (EOF), or -1 on error (p. 71; Lec03). Type Semantics: **ssize_t** is a signed integer returning byte counts or -1, while **size_t** is an unsigned integer count (p. 71; Lec03). Distinction from `fread`: Accepts byte counts and returns total bytes transferred rather than object "element" counts (Lec03). ==The read and write system calls are not guaranteed to process the exact number of bytes specified by the count argument, returning fewer bytes if end-of-file is encountered or if reading from devices like terminals and network sockets.== Common Pitfall: Passing an uninitialized pointer `char *buf;` without memory allocation results in writing data into garbage memory addresses (Lec03). _Chunk Reading Pattern (Lec03 Walkthrough):_

```
#define BUFSIZE 4
char buf[BUFSIZE + 1];
int in_fd = open("message.txt", O_RDONLY);
int nbytes;
while ((nbytes = read(in_fd, buf, BUFSIZE)) > 0) {
    buf[nbytes] = '\0';
    printf("%s\n", buf);
}
close(in_fd);
```

Execution trace for file containing `"ABCDEFGHIJ"` (10 bytes) with `BUFSIZE` = 4 (Lec03):

1. Loop iteration 1: `read()` consumes 4 bytes (`"ABCD"`), returns 4; prints `"ABCD"`.
2. Loop iteration 2: `read()` consumes 4 bytes (`"EFGH"`), returns 4; prints `"EFGH"`.
3. Loop iteration 3: `read()` consumes remaining 2 bytes (`"IJ"`), returns 2; prints `"IJ"`.
4. Loop iteration 4: `read()` encounters EOF, returns 0; while loop terminates and closes descriptor (Lec03).

### 3.8 write Function

_Function Prototype (`<unistd.h>`):_

```
ssize_t write(int fd, const void *buf, size_t count);
```

Returns number of bytes written if OK, or -1 on error (p. 72; Lec03). Offset & Execution: Writes begin at the file's current offset; if `O_APPEND` was set at `open`, offset is updated to current file size prior to each write (p. 72). Kernel Buffering: Upon return from `write()`, data is guaranteed to be copied into a kernel-maintained buffer, but is not guaranteed to be physically written to disk until flushed by kernel cache policies (Lec03).
### 3.10 File Sharing
The UNIX System supports the sharing of open files among processes through three kernel-maintained data structures (p. 74).
*Three-Level Kernel Data Structures:*
1. Process File Descriptor Table: Each process table entry contains a vector of open file descriptors (p. 74). Associated with each descriptor are file descriptor flags (such as the close-on-exec flag **FD_CLOEXEC**) and a pointer to an entry in the global system file table (p. 74).
2. System File Table: A global kernel table shared across all processes containing an entry for every open file (p. 74). Each system file table entry holds the file status flags (read, write, append, sync, nonblocking), current file offset, a reference count tracking the number of file descriptors pointing to it, and a pointer to the v-node/i-node table entry (p. 74; Lec04).
3. i-node Table: Maintained in kernel memory, each entry represents a physical file on disk and holds file metadata (file size, owner, permissions, access times, and pointers to on-disk data blocks) alongside a reference count (p. 74–75; Lec04). All processes interacting with the same physical file share the same i-node table entry (p. 75; Lec04).
*Exercise (a) — Two Unrelated Processes Independently open() the Same File:*
Consider two unrelated processes executing the following code simultaneously on file `test.txt` (initial content `"ABCDEFGH"`, 8 bytes) (Lec04):
```c
int fd = open("test.txt", O_RDWR);
char buf;
read(fd, buf, 8);
write(fd, buf, 8);
```
- _Kernel Structure:_ Creates 2 process file descriptor table entries (one per process), 2 independent system file table entries (each with reference count = 1 and an independent file offset initialized to 0), and 1 shared i-node table entry (p. 76; Lec04).
- _Execution Trace:_ Both Process A and Process B invoke **open** independently, receiving separate system file table entries with offsets set to 0. Process A calls **read**, consuming 8 bytes (`"ABCDEFGH"`); Process A's offset advances to 8. Process B calls **read**, consuming the same 8 bytes (`"ABCDEFGH"`); Process B's independent offset advances to 8. Process A calls **write**, appending `"ABCDEFGH"` at offset 8, extending the file to 16 bytes (`"ABCDEFGHABCDEFGH"`). Process B calls **write**, writing `"ABCDEFGH"` at offset 8, overwriting Process A's written bytes. The final file content is `"ABCDEFGHABCDEFGH"` (16 bytes) (Lec04). _Exercise (b) — Single Process open()s a File Then Calls fork():_ Consider a single process opening `test.txt` (initial content `"ABCDEFGH"`, 8 bytes) before calling **fork** (Lec04):

```
int fd = open("test.txt", O_RDWR);
fork();
char buf;
read(fd, buf, 8);
write(fd, buf, 8);
```

- _Kernel Structure:_ Creates 2 process file descriptor table entries (one in parent, one in child), 1 shared system file table entry (reference count = 2, sharing a single file offset), and 1 shared i-node table entry (p. 77; Lec04).
- _Shared Offset Consequence:_ Because parent and child share the same system file table entry, any **read**, **write**, or **lseek** in either process advances the shared file position for both processes (p. 77; Lec04).
- _Race-Condition Trace:_ Process A (e.g., Parent) executes first: (1) `read(fd, buf, 8)` consumes `"ABCDEFGH"`, advancing the shared offset to 8 (EOF). (2) `write(fd, buf, 8)` writes `"ABCDEFGH"` at offset 8, extending the file to 16 bytes and advancing the shared offset to 16 (EOF). Next, Process B (Child) executes: (3) `read(fd, buf, 8)` attempts to read at shared offset 16 (EOF); `read` encounters EOF and returns 0 bytes read, leaving Process B's `buf` filled with uninitialized garbage bytes. (4) Process B calls `write(fd, buf, 8)` at offset 16, writing 8 bytes of uninitialized garbage from `buf` to the file, extending the file size to 24 bytes (Lec04).

### 3.11 Atomic Operations

An **atomic operation** refers to an operation composed of multiple steps that is guaranteed by the kernel to be performed completely or not at all, without interruption from other processes or threads (p. 77, 79). _Appending to a File:_

- Older implementations attempted appending via two separate calls: `lseek(fd, 0L, SEEK_END); write(fd, buf, 100);` (p. 77–78).
- Race Condition: If Process A calls **lseek** to offset 1500 and is context-switched before writing, Process B calls **lseek** to 1500, writes 100 bytes (extending file size to 1600), and updates its offset. When Process A resumes, its **write** executes at its cached offset 1500, overwriting Process B's data (p. 78).
- Atomic Solution: Opening a file with the `O_APPEND` flag forces the kernel to set the file offset to the current file size from the i-node atomically prior to every **write** operation, eliminating the need for `lseek` (p. 78). _pread and pwrite Functions:_
- Function Prototypes (`<unistd.h>`):

```
ssize_t pread(int fd, void *buf, size_t nbytes, off_t offset);
ssize_t pwrite(int fd, const void *buf, size_t nbytes, off_t offset);
```

- Both functions return the number of bytes read or written if OK, 0 on EOF (`pread`), or -1 on error (p. 78–79).
- Calling **pread** is equivalent to calling **lseek** followed by **read**, and calling **pwrite** is equivalent to **lseek** followed by **write**, with two critical exceptions: the operation cannot be interrupted, and the current file offset in the system file table entry is NOT updated (p. 78–79; Lec12/APUE). _Atomic File Creation:_
- Specifying both `O_CREAT` and `O_EXCL` in **open** causes the function to fail if the file already exists (p. 79).
- The existence check and file creation are performed as a single atomic operation in the kernel, preventing race conditions where another process creates and writes to the file between an existence check and a **creat** call (p. 79).

### 3.12 dup and dup2 Functions

Existing file descriptors are duplicated using **dup** or **dup2** (p. 79). _Function Prototypes (`<unistd.h>`):_

```
int dup(int fd);
int dup2(int fd, int fd2);
```

Both return a new file descriptor if OK, or -1 on error (p. 79). _dup Semantics:_ Returns the lowest-numbered available file descriptor (p. 79). The new descriptor points to the exact same system file table entry as `fd`, sharing file status flags, current file offset, and v-node pointer (p. 79–80). However, the new descriptor receives its own distinct set of file descriptor flags, with `FD_CLOEXEC` cleared by default (p. 80). _dup2 Semantics:_ Duplicates `fd` to target descriptor index `fd2` (p. 79).

- If `fd2` is already open, `dup2` closes `fd2` first (p. 79; Lec04).
- Special Case: If `fd` equals `fd2`, `dup2` returns `fd2` immediately without closing it (p. 79).
- Otherwise, the `FD_CLOEXEC` flag is cleared for `fd2`, leaving it open across an **exec** call (p. 79).
- `dup2` is an atomic system call, whereas manually executing `close(fd2); fcntl(fd, F_DUPFD, fd2);` leaves a race window where signals or concurrent threads could alter descriptors between calls (p. 80–81). _Output Redirection Mechanics:_
- Standard stream file descriptors do not receive special kernel treatment and can be manipulated via `dup2` (Lec04).
- Calling `dup2(regular_fd, STDOUT_FILENO)` repoints file descriptor 1 (`STDOUT_FILENO`) to the system file table entry of `regular_fd` (p. 80; Lec04).
- All subsequent standard output operations—including C library `printf`, direct `write(1, ...)`, and programs invoked via **exec**—write directly into the file associated with `regular_fd` without altering program source code (Lec04).
### 4.5-4.9 File Access Permissions (APUE Ch4, taught in the Ch3 week)
*rwxrwxrwx Model:* UNIX file access permissions are categorized across three user classes—**user** (owner), **group**, and **other** (everyone else)—with three distinct access rights for each class: **read** (`r`), **write** (`w`), and **execute** (`x`) (APUE Ch4 pp. 99–100; Lec03/Lec04). For regular files, read permits viewing file contents, write permits modifying file contents, and execute permits running the file as an executable binary or script (APUE Ch4 p. 100; Lec03/Lec04). For directories, read permits listing directory entries, write permits creating or removing files within the directory, and execute (the search bit) permits searching or traversing pathnames through the directory (APUE Ch4 p. 100).
*Octal Representation:* Permissions are encoded as a 9-bit vector customarily represented in **octal**: user read = 400 (`0400`), user write = 200 (`0200`), user execute = 100 (`0100`); group read = 040 (`0040`), group write = 020 (`0020`), group execute = 010 (`0010`); other read = 004 (`0004`), other write = 002 (`0002`), other execute = 001 (`0001`) (APUE Ch4 p. 105; Lec03/Lec04).
*chmod Command:* The **chmod** utility modifies existing file permissions using octal modes (e.g., `chmod 700 secret_script.py` granting owner `rwx` and revoking all group/other access, or `chmod 640 project_grades.csv` granting owner `rw-` and group `r--`) or symbolic modes (e.g., `chmod u+x testius` granting owner execute permission, `chmod og+r lab02.zip` granting group and others read access, or `chmod o-rw points.bin` removing other read/write permissions) (APUE Ch4 pp. 105–106; Lec04).
*open() Mode Argument Constants:* When calling `open()` with `O_CREAT`, initial file permissions must be provided as the third argument using bitwise ORed constants defined in `<sys/stat.h>`: **S_IRUSR** (0400), **S_IWUSR** (0200), **S_IXUSR** (0100), **S_IRGRP** (0040), **S_IWGRP** (0020), **S_IXGRP** (0010), **S_IROTH** (0004), **S_IWOTH** (0002), and **S_IXOTH** (0001) (e.g., `open("points.bin", O_CREAT | O_WRONLY | O_TRUNC, S_IRUSR | S_IWUSR)`) (APUE Ch4 p. 99; Lec04).
### Buffering (APUE Ch5, taught in the Ch3 week)
*Three Standard I/O Buffering Modes:* The C **standard I/O library** (`FILE *`) provides user-space buffering to optimize system call frequency, categorizing streams into three buffering modes (APUE Ch5 pp. 145–146; Lec03/Lec04):
1. **fully buffered**: Physical I/O operations occur only when the user-space buffer becomes completely full; disk files are fully buffered by default (APUE Ch5 p. 145; Lec03/Lec04).
2. **line buffered**: Physical I/O operations occur when a newline character (`\n`) is encountered or the buffer fills; interactive terminal streams like `stdin` and `stdout` are line buffered by default (APUE Ch5 pp. 145–146; Lec03/Lec04).
3. **unbuffered**: Characters are transmitted directly to the kernel without user-space buffering; standard error (`stderr`) is unbuffered by default so error messages display immediately (APUE Ch5 p. 146; Lec03/Lec04).
*Flushing vs. Syncing:* Calling **fflush** flushes a user-space C stdio buffer to the kernel by executing an unbuffered `write()` system call, but does not guarantee bytes are physically written to disk (APUE Ch5 p. 147; Lec03/Lec04). Calling **fsync** forces the kernel's block buffers and file caches to flush physical data to disk storage (APUE Ch3 p. 81; Lec03/Lec04).
*Interleaving Walkthrough (Lec03/Lec04):* Executing `printf("A"); printf("B"); fprintf(stderr, "Z"); printf("C\n"); fprintf(stderr, "Y"); printf("D\n"); fprintf(stderr, "X"); printf("E\n");` outputs `"ZABC YD XE"` (Lec03/Lec04). Because `stdout` is line buffered, calls to `printf("A")` and `printf("B")` accumulate in the user-space buffer without triggering a system call; `fprintf(stderr, "Z")` executes an immediate unbuffered `write()` to descriptor 2, displaying `"Z"` first; `printf("C\n")` encounters a newline, triggering a single `write()` call that flushes `"ABC"` to descriptor 1 (Lec03/Lec04).
## Chapter Summary
UNIX file I/O combines low-level unbuffered system calls with high-level user-space buffered libraries to expose a uniform, integer-indexed file descriptor interface across processes.
*Mechanism:* ==Kernel-maintained data structures—process file descriptor tables, system file tables, and i-node tables—decouple low-level file descriptor integers from physical disk files, enabling shared offsets across fork(), atomic appended writes, and dynamic stream redirection via dup2().== Unbuffered system calls (`open`, `read`, `write`) interact directly with kernel file table entries, whereas standard I/O library streams buffer data in user space until flushed to underlying descriptors.
## Key Concepts
- **unbuffered I/O**: Direct I/O operations (`open`, `read`, `write`, `lseek`, `close`) executing immediate kernel system calls without user-space buffering (APUE Ch3 p. 61; Lec03).
- **system call**: Kernel-level entry point providing direct access to operating system hardware and file abstractions (APUE Ch3 p. 61; Lec03).
- **file descriptor**: Non-negative integer index used by a process to identify an open file in kernel structures (APUE Ch3 p. 61).
- **STDIN_FILENO** / **stdin**: Standard input stream file descriptor 0, mapped to keyboard input by default (APUE Ch3 p. 62; Lec03).
- **STDOUT_FILENO** / **stdout**: Standard output stream file descriptor 1, mapped to terminal screen output by default (APUE Ch3 p. 62; Lec03).
- **STDERR_FILENO** / **stderr**: Standard error stream file descriptor 2, mapped to terminal error output without buffering (APUE Ch3 p. 62; Lec03).
- **lowest-numbered unused descriptor rule**: Kernel allocation policy guaranteeing that `open` or `dup` returns the lowest available numeric descriptor index (APUE Ch3 p. 64).
- **open** / **openat**: System calls opening or creating files, returning a file descriptor (APUE Ch3 pp. 62–65; Lec03).
- **O_RDONLY** / **O_WRONLY** / **O_RDWR**: Access mode flags for read-only, write-only, and read-write open operations (APUE Ch3 p. 62).
- **O_CREAT** / **O_TRUNC** / **O_APPEND** / **O_EXCL**: Status flags to create missing files, truncate existing files to zero bytes, append writes to file end, and enforce atomic creation (APUE Ch3 pp. 63–64; Lec04).
- **creat**: System call creating a write-only file, equivalent to `open` with `O_WRONLY|O_CREAT|O_TRUNC` (APUE Ch3 p. 66).
- **close**: System call closing an open file descriptor and releasing process locks (APUE Ch3 p. 66).
- **read**: System call reading up to `count` bytes from a descriptor into a buffer, returning `ssize_t` bytes read or 0 on EOF (APUE Ch3 p. 71; Lec03).
- **ssize_t** / **size_t**: Signed and unsigned integer types used for byte counts and system call return values (APUE Ch3 p. 71; Lec03).
- **write**: System call writing `count` bytes from a buffer to a descriptor, copying data into kernel buffers (APUE Ch3 p. 72; Lec03).
- ==**process file descriptor table**==: Per-process kernel vector mapping numeric file descriptors to global system file table entries (APUE Ch3 p. 74; Lec04).
- **system file table**: Global kernel table holding open file status flags, reference counts, current offsets, and i-node pointers (APUE Ch3 p. 74; Lec04).
- **i-node table**: Kernel memory table representing physical files on disk, storing file metadata, permissions, and block pointers shared across processes (APUE Ch3 pp. 74–75; Lec04).
- **atomic operation**: Operation executed by the kernel completely or not at all, preventing multi-process race conditions (APUE Ch3 p. 77, 79).
- **pread** / **pwrite**: Atomic read and write system calls that execute at a specified offset without modifying the system file table offset (APUE Ch3 pp. 78–79).
- **dup** / **dup2**: System calls duplicating an existing file descriptor to the lowest available index (`dup`) or a targeted descriptor index (`dup2`) (APUE Ch3 pp. 79–81; Lec04).
- **file access permissions**: The 9-bit `rwxrwxrwx` access control model governing User, Group, and Other permissions (APUE Ch4 pp. 99–100; Lec03/Lec04).
- **octal representation**: Base-8 numeric encoding of permission bit vectors (`400` user read through `001` other execute) (APUE Ch4 p. 105; Lec03/Lec04).
- **chmod**: Utility and system call modifying file access permissions via octal or symbolic modes (APUE Ch4 pp. 105–106; Lec04).
- **S_IRUSR** / **S_IWUSR** / **S_IXUSR**: Standard `<sys/stat.h>` permission bit constants for owner read, write, and execute access (APUE Ch4 p. 99; Lec04).
- **standard I/O library**: ISO C high-level stream interface (`FILE *`) providing user-space buffering above system calls (APUE Ch5 p. 143; Lec03).
- **fully buffered** / **line buffered** / **unbuffered**: Standard I/O buffer management strategies governing when accumulated data triggers a `write()` system call (APUE Ch5 pp. 145–146; Lec03/Lec04).
- **fflush**: C library function flushing user-space stream buffers to the kernel via `write()` (APUE Ch5 p. 147; Lec03/Lec04).
- **fsync**: System call forcing kernel block buffers to physically flush data to disk storage (APUE Ch3 p. 81; Lec03/Lec04).
- **pipe**: Inter-process communication channel connecting the standard output of one command to the standard input of another (Lec04).
- **Unix philosophy**: Design doctrine advocating small, focused, composable tools combined via pipes and I/O redirection (Lec04).
## Worked Example
A full output redirection simulation program executes as follows (Lec04):
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
        if (fd < 0)
            err_sys("open error");
        dup2(fd, STDOUT_FILENO);
        close(fd);
        execlp("ls", "ls", "-l", (char *)0);
        err_sys("execlp error");
    }
    if (wait(NULL) < 0)
        err_sys("wait error");
    printf("Command Done\n");
    exit(0);
}
```
_Redirection Mechanics:_ Standard stream file descriptors receive no special kernel treatment. Calling `dup2(fd, STDOUT_FILENO)` repoints file descriptor 1 in the child's process file descriptor table to `ls_out.txt`'s system file table entry. When `ls -l` executes via `execlp()`, it inherits descriptor 1 and calls `write(STDOUT_FILENO, buf, count)`. ==Because both screen printing and file writing are fundamentally write() system calls to file descriptor 1, ls "thinks it's printing to the screen" when it is really appending bytes to ls_out.txt, allowing output redirection without altering program source code.== _Pipe Extension & Unix Philosophy:_ Command-line pipes (e.g., `ls -l | sort`) extend redirection by connecting stdout of `ls` to stdin of `sort` via an OS pipe and `dup2()`. Doug McIlroy's famous word-frequency one-liner illustrates the Unix philosophy of combining composable tools:

```
tr -cs A-Za-z '\n' | tr A-Z a-z | sort | uniq -c | sort -rn | head -n 10
```

This pipeline converts non-alphabetic characters to newlines (`tr -cs`), normalizes uppercase to lowercase (`tr A-Z`), sorts words (`sort`), counts duplicates (`uniq -c`), sorts numerically in reverse (`sort -rn`), and extracts the top 10 results (`head -n 10`)—achieving in six composed commands what Donald Knuth solved using a from-scratch, 10-page custom data structure implementation (Lec04).

## Connections

_Lecture Framing:_ Lec03 and Lec04 frame file I/O system calls, kernel table structures, permissions, and stream redirection:

- Lec03 introduces low-level system calls vs. high-level C stdio buffering, standard stream descriptors, `open()` flag constants, `read()` loop chunks, and stdout vs stderr buffering interleaving.
- Lec04 details three-level kernel data structures (process file descriptor table, system file table, i-node table), shared file offsets across `fork()`, atomic operations (`O_APPEND`, `O_EXCL`), `dup()` vs `dup2()`, output redirection, and McIlroy's Unix philosophy one-liner.
- ==Lec04 specifically introduced file access permissions (User/Group/Other octal modes) and standard I/O buffering modes (fully, line, unbuffered) alongside Chapter 3 file descriptors, but these topics structurally belong to APUE Chapter 4 (§4.5–4.9) and APUE Chapter 5, respectively.== _Textbook Connections:_ (pending Chapter 10).

## Open Questions

- [ ] Test `dup2()` output redirection in a C program by redirecting `STDOUT_FILENO` to a file and verifying `printf()` outputs directly to disk.
- [ ] Benchmark execution time difference between byte-by-byte `read()` system calls and buffered standard I/O `fgetc()` calls on a 10MB file.
- [ ] ==Verify how umask masks file creation permission bits when calling open() with O_CREAT and mode S_IRUSR|S_IWUSR.==
- [ ] Observe stdout vs stderr buffering interleaving by running an unbuffered stderr program redirected to a file versus a terminal.

## Flashcards

How does `dup2(oldfd, newfd)` atomically redirect standard output to a file?::`dup2()` closes `newfd` if open and repoints `newfd` in the process file descriptor table to the same system file table entry as `oldfd`, allowing subsequent `write(newfd, ...)` calls to target the underlying file. #cards/ai What happens when a parent process opens a file and then invokes `fork()`?::Parent and child receive separate process file descriptor table entries that point to the same system file table entry, sharing a single file offset so I/O in either process advances position for both. #cards/ai ==What mechanism makes O_CREAT and O_EXCL combined in open() guarantee atomic file creation?==::==Combining `O_CREAT` and `O_EXCL` instructs the kernel to perform the file existence check and file creation as a single atomic operation in kernel space, failing if the file exists to prevent race conditions.== #cards/ai How do `read()` and `write()` handle byte counts compared to standard I/O functions?::`read()` and `write()` accept raw byte buffer counts and return `ssize_t` bytes transferred (or fewer on EOF/partial reads), whereas `fread()` and `fwrite()` operate on typed object element counts with user-space buffering. #cards/ai Why does `stdout` output print after `stderr` output in interleaved `printf()` and `fprintf(stderr, ...)` statements?::`stdout` is line buffered and defers physical `write()` system calls until a newline (`\n`) is encountered, whereas `stderr` is unbuffered and executes an immediate `write()` system call for every character. #cards/ai How does `O_APPEND` guarantee atomic appends across concurrent writing processes?::`O_APPEND` causes the kernel to update the file offset to the current physical file size in the i-node atomically prior to every `write()` operation, preventing concurrent processes from overwriting each other's data. #cards/ai
## Examples Worth Keeping
<!-- Keep concrete examples, numbers, cases, or worked reasoning that makes the mechanism memorable. -->
- 
## Connections
<!-- Link the matching lecture/week, course map, and only concept notes that actually exist or were created. -->
- Lecture:
- Concept:
## Flashcards
<!-- Add 3–8 atomic cards testing mechanisms and contrasts to #cards/<course-slug>. -->
