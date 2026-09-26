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

## Examples Worth Keeping
<!-- Keep concrete examples, numbers, cases, or worked reasoning that makes the mechanism memorable. -->
- 
## Connections
<!-- Link the matching lecture/week, course map, and only concept notes that actually exist or were created. -->
- Lecture:
- Concept:
## Flashcards
<!-- Add 3–8 atomic cards testing mechanisms and contrasts to #cards/<course-slug>. -->
