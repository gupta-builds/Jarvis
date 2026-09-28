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
# Chapter - 4
## Chapter Summary
<!-- State the chapter's one-sentence claim and use exactly one ==highlight== anchor. -->
== ==
*Mechanism:*
<!-- Explain how the chapter's claim works. -->
# Chapter 4 (Part 1) — Files and Directories: File System Fundamentals
## Chapter Summary
The UNIX file system abstracts raw storage block arrays into a hierarchical tree of named files and directories, decoupling human-readable pathnames from physical disk locations through metadata-bearing index nodes.
*Mechanism:* ==When a process opens a file by pathname, the kernel traverses directory data blocks starting from root or the working directory to resolve name-to-inode mappings, retrieving the file's i-node number to locate its metadata and data block pointer tree.== The file system driver interacts with hardware microcontrollers through a uniform block read/write interface, allowing processes to navigate directory structures via chdir/getcwd and query attributes using stat functions without exposing underlying disk layouts.
## Key Concepts
- **storage device**: Hardware peripheral exposing persistent memory as an indexed array of fixed-size data blocks (Lec06).
- **device driver**: Kernel software module translating uniform block read/write commands into hardware-specific microcontroller instructions (Lec06).
- **file system**: Operating system component managing persistent storage structures to provide hierarchical directory abstractions (p. 4; Lec06).
- **i-node**: Fixed-length disk and memory structure storing all file metadata and data block pointers except the filename (p. 114; Lec06).
- **i-node number**: Non-negative integer index uniquely identifying an i-node within a file system partition (p. 94, 114; Lec06).
- **directory entry**: Record inside a directory file mapping a filename string to its corresponding i-node number (p. 4, 114; Lec06).
- **absolute pathname**: Pathname starting with a slash (`/`) that resolves starting from the root directory (p. 5; Lec06).
- **relative pathname**: Pathname not starting with a slash that resolves relative to the calling process's working directory (p. 5; Lec06).
- **working directory**: Current directory attribute of a process used as the origin for relative pathname resolution (p. 8, 135; Lec06).
- **home directory**: Initial working directory assigned to a user upon login, defined in `/etc/passwd` (p. 8, 135; Lec06).
- **dot**: Special directory entry `.` referring to the current directory itself (p. 4, 115; Lec06).
- **dot-dot**: Special directory entry `..` referring to the parent directory (p. 4, 115; Lec06).
- **stat**: System call retrieving file metadata by pathname into a user-supplied structure (p. 93; Lec06).
- **fstat**: System call retrieving file metadata for an open file descriptor (p. 93).
- **lstat**: System call retrieving file metadata for a symbolic link itself rather than its target (p. 93).
- **fstatat**: System call retrieving file metadata relative to an open directory descriptor (p. 93).
- **struct stat**: C structure containing file attributes populated by stat functions (p. 94; Lec06).
- **st_ino**: Primitive `ino_t` field in `struct stat` holding the file's i-node number (p. 94).
- **st_mode**: Primitive `mode_t` field in `struct stat` encoding file type and access permissions (p. 94).
- **st_size**: Primitive `off_t` field in `struct stat` holding logical file size in bytes (p. 94, 111).
- **st_nlink**: Primitive `nlink_t` field in `struct stat` holding the hard link count (p. 94, 114).
- **st_blksize**: Field in `struct stat` specifying the preferred block size for efficient I/O (p. 73, 94, 111).
- **st_blocks**: Field in `struct stat` storing the number of 512-byte blocks allocated to a file (p. 94, 111).
- **regular file**: File type containing arbitrary user data bytes, binary or text (p. 95).
- **directory**: Special file containing directory entries mapping filenames to i-node numbers (p. 4, 95, 114; Lec06).
- **block special file**: Device file providing buffered I/O access in fixed-size block units (p. 95).
- **character special file**: Device file providing unbuffered I/O access in variable-sized character units (p. 95).
- ==**FIFO**==: Named pipe special file used for interprocess communication (p. 95).
- **socket**: Special file used for network or local interprocess communication (p. 95).
- **symbolic link**: Special file containing a text string pointing to another pathname (p. 95).
- **direct data block pointer**: i-node field storing the disk block index of file data directly (Lec06).
- **single indirect pointer**: i-node pointer referencing a disk block that contains an array of data block pointers (Lec06).
- **double indirect pointer**: i-node pointer referencing a disk block containing an array of single indirect block pointers (Lec06).
- **triple indirect pointer**: i-node pointer referencing a disk block containing an array of double indirect block pointers (Lec06).
- **tebibyte**: Binary capacity unit (1 TiB = \\(2^{40}\\) bytes = 1,099,511,627,776 bytes) distinguished from marketing terabytes (\\(10^{12}\\) bytes) (Lec06).
- **chdir**: System call changing the current working directory of the calling process (p. 135; Lec06).
- **fchdir**: System call changing the working directory using an open directory descriptor (p. 135).
- **getcwd**: Function reconstructing the absolute pathname of the current working directory (p. 136; Lec06).
- **HOME**: Environment variable specifying the user's home directory path (p. 210; Lec06).
## Full Reading Notes
### 4.1 Introduction
The `stat` family of functions exposes properties and attributes of files stored in kernel and disk structures (p. 93).
Inspecting file attributes involves examining members of `struct stat` and understanding operations that modify file metadata, such as permissions, ownership, and link counts (p. 93).
### 4.2 stat, fstat, fstatat, and lstat Functions
*Function Prototypes (`<sys/stat.h>`):*
```c
int stat(const char *restrict pathname, struct stat *restrict buf);
int fstat(int fd, struct stat *buf);
int lstat(const char *restrict pathname, struct stat *restrict buf);
int fstatat(int fd, const char *restrict pathname, struct stat *restrict buf, int flag);
```

All four functions return 0 on success, or -1 on error (p. 93–94). _Behavioral Differences:_ `stat` returns attributes for the file named by `pathname`; `fstat` fetches attributes for an open file descriptor `fd`; `lstat` returns attributes of a symbolic link file itself rather than the target file it references; `fstatat` evaluates pathnames relative to directory descriptor `fd` (or current working directory if `fd == AT_FDCWD`) (p. 94). _struct stat Key Members (`<sys/stat.h>`):_

- `mode_t st_mode`: File type and access permission bits (p. 94).
- `ino_t st_ino`: i-node number (p. 94).
- `dev_t st_dev`: Device number of the file system containing the file (p. 94).
- `dev_t st_rdev`: Device number for character or block special files (p. 94).
- `nlink_t st_nlink`: Number of hard links pointing to the i-node (p. 94).
- `uid_t st_uid`: User ID of file owner (p. 94).
- `gid_t st_gid`: Group ID of file owner (p. 94).
- `off_t st_size`: File size in bytes for regular files, directories, or symbolic links (p. 94, 111).
- `struct timespec st_atim`: Time of last data access (p. 94).
- `struct timespec st_mtim`: Time of last data modification (p. 94).
- `struct timespec st_ctim`: Time of last i-node status change (p. 94).
- `blksize_t st_blksize`: Preferred I/O block size for reading/writing the file (p. 73, 94, 111).
- `blkcnt_t st_blocks`: Number of 512-byte disk blocks allocated to store the file (p. 94, 111). The `ls -l` command relies on `stat` functions to retrieve and display file attributes (p. 95).

### 4.3 File Types

UNIX systems support seven distinct file types encoded in `st_mode` (p. 95):

1. Regular file (`S_ISREG(st_mode)`): Contains data bytes; no kernel distinction is made between text and binary format (p. 95).
2. Directory (`S_ISDIR(st_mode)`): Contains directory entries mapping filenames to i-node numbers; readable by user processes, writable only by kernel (p. 95, 114).
3. Character special file (`S_ISCHR(st_mode)`): Provides unbuffered I/O access in variable-sized units to hardware devices (p. 95).
4. Block special file (`S_ISBLK(st_mode)`): Provides buffered I/O access in fixed-size block units to storage devices (p. 95).
5. FIFO (`S_ISFIFO(st_mode)`): Named pipe used for interprocess communication (p. 95).
6. Socket (`S_ISSOCK(st_mode)`): Endpoint used for network or local interprocess communication (p. 95).
7. Symbolic link (`S_ISLNK(st_mode)`): File containing a pathname reference pointing to another file (p. 95).

### 4.12 File Size

_st_size Field:_ Holds the logical file size in bytes; meaningful for regular files, directories, and symbolic links (p. 111). Regular files can have a size of 0, yielding immediate EOF on `read()` (p. 111). _Block Sizes & I/O Efficiency:_ `st_blksize` indicates the preferred I/O block size (typically 4096 bytes / 4KiB on ext4), which minimizes system call frequency and CPU time during read/write loops (p. 73, 111; Lec06). _Allocated Blocks & Holes:_ `st_blocks` records the number of allocated 512-byte disk blocks (p. 111). Seeking past EOF via `lseek()` and writing creates a file hole; unwritten bytes in holes return zeros on `read()` without allocating disk blocks, causing actual disk usage (`st_blocks * 512`) to be significantly smaller than logical file size (`st_size`) (p. 68, 111–112).

### 4.14 File Systems

_Disk Layout & Partitions:_ A disk drive is divided into partitions, each containing a file system structured into cylinder groups (p. 113). _Cylinder Group Components:_ Contains a superblock copy, group info, i-node map, block bitmap, i-node array, and data blocks (p. 113–114). _i-node Array & Properties:_ Fixed-length records storing file attributes (type, permissions, owner, size, link count, timestamps, block pointers) (p. 114). An i-node explicitly DOES NOT store the file's name (p. 114; Lec06). _i-node Data Pointer Tree (Lec06):_ i-nodes manage disk blocks using a hierarchical tree structure: direct data block pointers for small files, single indirect pointers (pointing to a block of block pointers), double indirect pointers, and triple indirect pointers to support multi-gigabyte or terabyte files (Lec06). _Directory Structure:_ Directories are files whose data blocks store directory entries; each entry contains an ASCII filename and an integer i-node number (`ino_t`) (p. 4, 114; Lec06). _Link Count Mechanics:_ `st_nlink` tracks directory entries referencing an i-node (p. 114). Unlinking decrements `st_nlink`; data blocks are freed only when `st_nlink` reaches 0 and no open file descriptors reference the file (p. 114). _Directory Link Counts:_ A newly created leaf directory (`mkdir testdir`) has `st_nlink = 2` (its parent entry `testdir` + `.` inside `testdir`); creating a subdirectory increases the parent directory's `st_nlink` by 1 due to the child's `..` entry (p. 115–116).

### 4.23 chdir, fchdir, and getcwd Functions

_Working Directory Context:_ Every process maintains a current working directory from which relative pathnames are evaluated (p. 8, 135; Lec06). _Function Prototypes (`<unistd.h>`):_

```
int chdir(const char *pathname);
int fchdir(int fd);
char *getcwd(char *buf, size_t size);
```

Both `chdir` and `fchdir` return 0 on success, or -1 on error; `getcwd` returns `buf` on success, or `NULL` on error (p. 135–136). _Process Isolation:_ `chdir` alters only the calling process's working directory; because child processes cannot alter parent environment attributes, shell `cd` commands must be implemented as shell built-in primitives (p. 136). _getcwd Resolution:_ `getcwd` starts at `.` and traverses upward through `..`, reading parent directory entries to match i-node numbers at each level until reaching `/`, reconstructing the absolute pathname (p. 136). _Home Directory & Environment:_ Login sets the initial working directory to the user's home directory from `/etc/passwd` (p. 8, 135). Shell shorthand `~` corresponds to fetching the `HOME` environment variable via `getenv("HOME")` in C code (p. 210; Lec06).

## Worked Example

The `open("/home/sun/hello.txt")` system call traverses the directory tree step-by-step (Lec06):

1. _Root Lookup:_ The kernel retrieves the root directory `/` using its known fixed i-node number (i-node #2) (p. 115; Lec06).
2. _Reading Root Directory:_ ==The kernel reads `/`'s data blocks to search its directory entries for `"home"`, locating entry `"home"` mapped to i-node number 8 (`0x0008`).==
3. _Reading `/home` Directory:_ The kernel opens i-node #8 (`/home`) and reads its data blocks to search its directory entries for `"sun"`, locating entry `"sun"` mapped to i-node number 15 (`0x000F`).
4. _Reading `/home/sun` Directory:_ The kernel opens i-node #15 (`/home/sun`) and reads its data blocks to search its directory entries for `"hello.txt"`, locating entry `"hello.txt"` mapped to i-node number 16 (`0x0010`).
5. _File Access:_ The kernel accesses i-node #16 (`hello.txt`) to inspect permissions and load its data block pointer tree into a system file table entry, returning a new file descriptor to the process (p. 74, 114; Lec06).

## Connections

_Lecture Framing:_ Lec06 introduces storage hardware abstractions and file system structures:

- Slide-Only Concepts: Storage devices exposed as block arrays (512-byte historical vs 4096-byte modern preferred `read()` size); device drivers as uniform block read/write interfaces over device microcontrollers; marketing Terabytes (\(10^{12}\) bytes) vs binary Tebibytes (1 TiB = \(2^{40}\) bytes = 1,099,511,627,776 bytes); the i-node pointer-tree diagram (direct, single indirect, double indirect, triple indirect pointers); `ls -li` i-node inspection; shell `~` shorthand vs C `getenv("HOME")`; and the step-by-step `open("/home/sun/hello.txt")` i-node traversal walkthrough.
- Book-Only Concepts: `fstatat` function parameters, `fchdir` function, `st_blocks`/`st_blksize` field mechanics, detailed cylinder group layouts (superblock, block bitmap, i-node map), and `getcwd()` internal algorithm using `..` upward i-node matching. _Textbook Connections:_ (pending the rest of Chapter 4 and Chapter 15.1-15.2 — not yet lectured as of 2026-09-24, write that prompt only after Lec07/Lec08 are read).

## Open Questions

- [ ] Inspect file i-node numbers on a local Linux partition using `ls -li` and trace hard links across subdirectories.
- [ ] Write a C program that calls `stat()` on a file with holes and compares `st_size` against `st_blocks * 512`.
- [ ] ==Verify that calling chdir() in a C child process does not alter the parent shell's current working directory.==
- [ ] Benchmark `read()` performance on a 100MB file using a 512-byte buffer versus a 4096-byte (`st_blksize`) buffer.

## Flashcards

Why does an i-node explicitly omit the filename of a file?::==Omitting filenames from i-nodes allows multiple directory entries (hard links) across different directories to point to the same physical i-node without replicating or synchronizing file metadata.== #cards/ai How does a device driver allow the operating system to interact uniformly with diverse storage hardware?::Device drivers encapsulate hardware-specific microcontroller commands, exposing a standardized block-level I/O interface (`read block i`, `write block i`) to the file system. #cards/ai What is the structural difference between an absolute pathname and a relative pathname?::An absolute pathname begins with a leading slash (`/`) and resolves starting from the root directory, whereas a relative pathname lacks a leading slash and resolves starting from the process's working directory. #cards/ai How does `getcwd()` construct the absolute pathname of the current working directory?::`getcwd()` opens `.` and moves upward through `..` level-by-level, reading parent directory entries to match the child directory's i-node number until reaching root (`/`). #cards/ai Why does a newly created leaf directory have a hard link count (`st_nlink`) of 2?::A leaf directory's i-node is referenced by two directory entries: the entry naming it inside its parent directory, and the `.` entry inside the directory itself. #cards/ai How do indirect block pointers in an i-node enable a file system to store very large files?::When direct data block pointers fill up, single, double, and triple indirect pointers reference index blocks containing arrays of block pointers, adding tree levels to address millions of data blocks. #cards/ai
## Examples Worth Keeping
<!-- Keep concrete examples, numbers, cases, or worked reasoning that makes the mechanism memorable. -->
- 
## Connections
<!-- Link the matching lecture/week, course map, and only concept notes that actually exist or were created. -->
- Lecture:
- Concept:
## Flashcards
<!-- Add 3–8 atomic cards testing mechanisms and contrasts to #cards/<course-slug>. -->
