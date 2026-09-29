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
next: "Feed this chapter into Week - 3/Week - 4's Textbook integration sections"
---
# Chapter - 4 — Files and Directories
**Source:** W. Richard Stevens and Stephen A. Rago, *Advanced Programming in the UNIX Environment*, 3rd ed. (Addison-Wesley, 2013), Chapter 4, pp. 93-141.
**Read from:** `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\Textbook\Advanced Programming in the UNIX Environment, 3rd Edition.pdf`
**Course role:** Week 3-4 reading. Lec06 (9/24) previews the start of this chapter - storage devices, i-nodes, paths, directories - a full week before its own scheduled Week 4 slot, per the [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]]'s 2026-09-24 correction; Lec03/Lec04 separately teach the permission-bit material (§4.5-4.9) during the Week 2 "Chapter 3" lectures, captured in full in [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter 3]]'s own §4.5-4.9 block. Most of this chapter's own sections (4.4, 4.6-4.11, 4.13, 4.15-4.22, 4.24-4.25) have **no matching lecture coverage anywhere in Lec01-06** - textbook-only so far, since Week 4's own lectures (9/29, 10/1) had not yet happened as of this session.
## Chapter Summary
The UNIX file system abstracts a raw array of disk blocks into a hierarchical tree of named files and directories, and almost everything a program needs to know about a file - its size, type, owner, permissions, link count, timestamps - lives in one place: ==the file's i-node, addressed by number, never by name== (p. 93).
*Mechanism:* `stat`/`fstat`/`lstat`/`fstatat` pull a file's i-node contents into a `struct stat`. A directory is nothing more than a file whose data blocks hold (filename, i-node number) pairs, so opening a file by pathname means walking that chain of directories one i-node lookup at a time. Because names live only in directory entries and never in the i-node itself, many different names (**hard links**) can point at one i-node, permissions and ownership are checked against the process's IDs on every access, and an entire second addressing scheme - **symbolic links** - exists to point at a pathname instead of an i-node, sidestepping hard links' same-file-system restriction.
## Key Concepts
- **storage device**: Hardware peripheral exposing persistent memory as an indexed array of fixed-size data blocks (Lec06).
- **device driver**: Kernel software module translating uniform block read/write commands into hardware-specific microcontroller instructions (Lec06).
- **file system**: Operating system component managing persistent storage structures to provide hierarchical directory abstractions (p. 93; Lec06).
- **i-node**: Fixed-length disk and memory structure storing all file metadata and data block pointers except the filename (p. 114; Lec06).
- **i-node number**: Non-negative integer index uniquely identifying an i-node within a file system partition (pp. 94, 114; Lec06).
- **directory entry**: Record inside a directory file mapping a filename string to its corresponding i-node number (pp. 4, 114; Lec06).
- **struct stat**: C structure populated by the `stat` family, holding every attribute a file has (p. 94; Lec06).
- **set-user-ID bit / set-group-ID bit**: `st_mode` flags that make a process running the file assume the file owner's (or group's) privileges instead of the caller's (pp. 98-99).
- ==**file access permissions**==: The 9-bit `rwxrwxrwx` model - user/group/other × read/write/execute - checked in a strict four-step order against the process's effective IDs (p. 99).
- **umask**: Per-process bitmask that turns off permission bits at file/directory creation time, regardless of what `open`/`creat`/`mkdir` asked for (p. 104).
- **sticky bit**: `S_ISVTX` - historically kept a program's text resident in the swap area; on a directory today, restricts file deletion/rename to the owner, the directory's owner, or root (p. 108).
- **access** / **umask** / **chmod** / **chown**: The four permission/ownership-manipulation function families this chapter covers (pp. 102-110).
- **file hole**: A gap in a file created by seeking past EOF and writing, read back as zero bytes without consuming disk blocks for the gap (p. 111).
- **cylinder group**: A file system's internal subdivision holding a superblock copy, an i-node array, a block bitmap, and data blocks (p. 113).
- **hard link**: A second directory entry pointing at the same i-node as an existing file, sharing one `st_nlink`-tracked identity (p. 116).
- **symbolic link**: A special file whose contents are a pathname string pointed at another file, resolved by an extra lookup layer instead of pointing at an i-node directly (p. 120).
- **rename**: Atomically moves/renames a file or directory, with different rules depending on whether the target exists (p. 119).
- **file times**: Three separate timestamps per file - access, modification, changed-status - tracking different kinds of change (p. 124).
- **opendir**/**readdir**/**closedir**: The POSIX directory-reading API that hides each file system's actual on-disk directory format (p. 130).
- **device special file**: A character or block file whose `st_rdev` (major/minor device numbers) identifies the actual hardware device, distinct from `st_dev` (the file system it lives on) (p. 137).
- **direct data block pointer**: i-node field storing the disk block index of file data directly (Lec06).
- **single indirect pointer**: i-node pointer referencing a disk block that contains an array of data block pointers (Lec06).
- **double indirect pointer**: i-node pointer referencing a disk block containing an array of single indirect block pointers (Lec06).
- **triple indirect pointer**: i-node pointer referencing a disk block containing an array of double indirect block pointers (Lec06).
- **tebibyte**: Binary capacity unit (1 TiB = $2^{40}$ bytes = 1,099,511,627,776 bytes) distinguished from marketing terabytes ($10^{12}$ bytes) (Lec06).
- **chdir**: System call changing the current working directory of the calling process (p. 135; Lec06).
- **getcwd**: Function reconstructing the absolute pathname of the current working directory (p. 136; Lec06).
- **HOME**: Environment variable specifying the user's home directory path (p. 210; Lec06).
## Full Reading Notes
### 4.1 Introduction
The `stat` family exposes a file's properties and attributes, letting a program inspect metadata (permissions, ownership, link counts, timestamps) and understand which operations modify which parts of it (p. 93).
### 4.2 stat, fstat, fstatat, and lstat Functions
```c
int stat(const char *restrict pathname, struct stat *restrict buf);
int fstat(int fd, struct stat *buf);
int lstat(const char *restrict pathname, struct stat *restrict buf);
int fstatat(int fd, const char *restrict pathname, struct stat *restrict buf, int flag);
```
All four return 0 or -1 (pp. 93-94). `stat` resolves `pathname` normally; `fstat` works on an already-open descriptor; `lstat` reports on a symbolic link itself, not its target; `fstatat` resolves `pathname` relative to directory descriptor `fd` (or the working directory if `fd == AT_FDCWD`) (p. 94). Key `struct stat` members: `st_mode` (type + permissions), `st_ino` (i-node number), `st_dev` (file system device number), `st_rdev` (device number, for special files only), `st_nlink` (hard link count), `st_uid`/`st_gid` (owner), `st_size` (bytes, regular files/directories/symlinks), `st_atim`/`st_mtim`/`st_ctim` (access/modify/change times), `st_blksize` (preferred I/O size), `st_blocks` (512-byte blocks allocated) (p. 94). `ls -l` is built on `stat` (p. 95).
### 4.3 File Types
Seven `st_mode`-encoded types, tested with `S_IS*` macros (p. 95): regular file (`S_ISREG`, arbitrary bytes, no kernel text/binary distinction), directory (`S_ISDIR`, holds directory entries, readable by any process but writable only by the kernel), character special file (`S_ISCHR`, unbuffered variable-sized device I/O), block special file (`S_ISBLK`, buffered fixed-size-block device I/O), FIFO (`S_ISFIFO`, named pipe for IPC), socket (`S_ISSOCK`, network/local IPC endpoint), symbolic link (`S_ISLNK`, a pathname reference to another file).
### 4.4 Set-User-ID and Set-Group-ID
Every process carries six-plus IDs: **real** user/group ID (who you really are, from the password file), **effective** user/group ID plus **supplementary group IDs** (what determines file-access permission - Section 4.5), and **saved set-user-ID**/**saved set-group-ID** (a copy of the effective IDs taken at `exec` time, used later by `setuid` in Chapter 8) (p. 98). Every file also has an owner (`st_uid`) and group owner (`st_gid`). Two special `st_mode` bits - **set-user-ID** and **set-group-ID** - tell the kernel "when this file executes, set the process's effective user/group ID to the file's owner/group," regardless of who actually ran it (p. 98-99). Classic example: `passwd(1)` runs set-user-ID to root so an ordinary user can write a new password into a file only root should normally be able to write - a program written this way must be careful, since it's granting itself elevated privilege for the whole run (p. 99). Tested against the constants `S_ISUID`/`S_ISGID` in `st_mode` (p. 99).
### 4.5 File Access Permissions
Nine permission bits, three categories of three (`S_IRUSR`/`S_IWUSR`/`S_IXUSR`, `S_IRGRP`/`S_IWGRP`/`S_IXGRP`, `S_IROTH`/`S_IWOTH`/`S_IXOTH`), from `<sys/stat.h>` (p. 99). `chmod` uses `u`/`g`/`o` for user/group/other - not "owner/group/world," since `o` means other, not owner (p. 100). Rules that recur throughout the chapter (p. 100): opening *any* file by name requires execute ("search") permission on every directory component in the path, including an implied current directory; read on a directory lists its entries, execute lets you traverse through it as a path component - the two are genuinely different permissions; `O_RDONLY`/`O_RDWR` need read, `O_WRONLY`/`O_RDWR` need write, `O_TRUNC` needs write; creating or deleting a file needs write+execute on its *directory*, not on the file itself; running a file via `exec` needs its execute bit and needs it to be a regular file. The kernel checks access in a strict four-step order (p. 100): (1) effective UID 0 (superuser) → always allowed; (2) effective UID == file's owner → allowed only if the matching *user* bit is set, full stop, group/other bits never even get checked; (3) effective GID or a supplementary GID == file's group → allowed only if the matching *group* bit is set; (4) otherwise, allowed only if the matching *other* bit is set.
### 4.6 Ownership of New Files and Directories
A new file's user ID is always the creating process's effective user ID. POSIX.1 lets an implementation choose the new file's group ID as either the process's effective group ID, or the parent directory's group ID - the second option (common with the set-group-ID bit set on the directory) makes every file created underneath automatically inherit that directory's group, which is how shared mail spools and shared-group project directories keep consistent ownership without users manually managing it (p. 101).
### 4.7 access and faccessat Functions
```c
int access(const char *pathname, int mode);
int faccessat(int fd, const char *pathname, int mode, int flag);
```
Both return 0 or -1 (p. 102). Unlike `open`, these test against the *real* user/group IDs, not the effective ones - useful for a set-user-ID program that wants to check "could the real user actually do this?" before using its elevated privilege (p. 102). `mode` is `F_OK` (existence) or an OR of `R_OK`/`W_OK`/`X_OK` (p. 102). `faccessat` with `AT_EACCESS` set switches back to effective-ID checks (p. 103). Worked example: a program that is `set-user-ID root` still reports `access error for /etc/shadow: Permission denied` via `access()`, even though the same program's `open()` call on that file succeeds - because `access` is honestly answering "can the real user do this," which `open`'s effective-ID-based check doesn't (pp. 103-104).
### 4.8 umask Function
```c
mode_t umask(mode_t cmask);
```
Returns the *previous* mask - one of the few functions with no error return at all (p. 104). Any bit set in the **umask** gets turned *off* in a newly created file's or directory's mode, no matter what `open`/`creat`/`mkdir` requested (p. 104). Worked example: `umask(0)` then `creat("foo", RWRWRW)` yields `-rw-rw-rw-`; `umask(S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH)` then the same `creat` call on `bar` yields `-rw-------` (p. 105). A process's `umask` doesn't affect its parent's (typically the shell) - each shell has its own `umask` built-in, usually set once at login and never touched again (p. 105). Common values: `002` (block others' writes), `022` (block group+other writes), `027` (block group writes, block other entirely). The symbolic form (`umask -S` → `u=rwx,g=rx,o=`) states what's *allowed*, the inverse of the octal form's "what's denied" framing (pp. 105-106).
### 4.9 chmod, fchmod, and fchmodat Functions
```c
int chmod(const char *pathname, mode_t mode);
int fchmod(int fd, mode_t mode);
int fchmodat(int fd, const char *pathname, mode_t mode, int flag);
```
All return 0 or -1 (p. 106). Caller must own the file or be superuser. `mode` adds three more constants beyond the nine basic bits: `S_ISUID`, `S_ISGID`, `S_ISVTX` (sticky), plus the combined `S_IRWXU`/`S_IRWXG`/`S_IRWXO` (p. 106). Worked example: `chmod("foo", (statbuf.st_mode & ~S_IXGRP) | S_ISGID)` turns on set-group-ID and off group-execute *relative* to the current mode (fetched via `stat` first), while `chmod("bar", S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH)` sets an *absolute* mode - `ls -l` then shows the set-group-ID bit as a capital `S` where group-execute would otherwise be an `x` (pp. 106-107). `chmod` also automatically clears two bits under certain conditions, both defensive: a non-superuser trying to set the sticky bit on a regular file has it silently cleared on systems that give the bit meaning there; and a non-superuser process writing to a file it doesn't own the group of, or that isn't superuser-privileged, has any set-user-ID/set-group-ID bit automatically cleared on write, so a malicious user who finds a writable privileged file can't retain its special powers just by modifying it (pp. 107-108).
### 4.10 Sticky Bit
Historically (pre-demand-paging UNIX), `S_ISVTX` marked an executable's text segment to be kept in the swap area after the process exited, so a frequently-run program (a compiler pass, an editor) loaded faster next time - virtual memory made this obsolete (p. 108). On contemporary systems the bit is repurposed for **directories**: with it set, a file inside can be removed or renamed only by the file's owner, the directory's owner, or superuser - `/tmp` and `/var/tmp` are the classic case, world-writable directories where nobody should be able to delete someone else's files (p. 108-109).
### 4.11 chown, fchown, fchownat, and lchown Functions
```c
int chown(const char *pathname, uid_t owner, gid_t group);
int fchown(int fd, uid_t owner, gid_t group);
int fchownat(int fd, const char *pathname, uid_t owner, gid_t group, int flag);
int lchown(const char *pathname, uid_t owner, gid_t group);
```
All return 0 or -1; passing -1 for either `owner` or `group` leaves that one unchanged (p. 109). `lchown` and `fchownat` (with `AT_SYMLINK_NOFOLLOW`) act on a symbolic link itself, not its target - `fchown` can't touch a symlink at all, since you can't `open` one directly (p. 109-110). Whether an ordinary (non-superuser) user can give away a file's ownership at all depends on `_POSIX_CHOWN_RESTRICTED` - when it's in effect (the common case), only superuser can change a file's user ID, and a non-superuser can change the group ID only to a group they actually belong to, and only on a file they own (pp. 110). Calling any of these as a non-superuser process clears the set-user-ID and set-group-ID bits on success, for the same defensive reason as §4.9 (p. 111).
### 4.12 File Size
`st_size` is meaningful for regular files, directories, and symbolic links (p. 111). A regular file's size can be 0 (immediate EOF). For a symlink, `st_size` is the length of the pathname string it holds - no trailing null byte is counted. `st_blksize` is the preferred I/O chunk size for efficient reads/writes (commonly 4096 on ext4); `st_blocks` counts actual 512-byte blocks allocated (p. 111). *Holes:* seeking past EOF and writing (`lseek` then `write`) creates a **hole** - unwritten bytes there read back as 0 without necessarily being allocated on disk, so `st_size` can be dramatically larger than the disk space `du` reports (`st_blocks * 512`) (pp. 111-112). Worked example: an 8+ MB core file reports only 272 512-byte blocks used (139,264 bytes) via `du`; copying it with `cat` (which reads and rewrites every zero byte explicitly) turns those holes into real allocated space, jumping usage to 16,592 blocks even though `ls -l` reports the identical `st_size` for both files (p. 112).
### 4.13 File Truncation
```c
int truncate(const char *pathname, off_t length);
int ftruncate(int fd, off_t length);
```
Both return 0 or -1 (p. 112). Shrinks a file to `length` bytes (data beyond that point becomes inaccessible), or - if `length` is larger than the current size - grows it, with the gap becoming a hole (p. 112). Opening with `O_TRUNC` is the special case of truncating to exactly 0.
### 4.14 File Systems
A disk partition holds a file system organized into **cylinder groups**, each with its own superblock copy, group info, i-node bitmap, block bitmap, i-node array, and data blocks (p. 113). Each i-node is a fixed-length record holding type, permissions, owner, size, link count, timestamps, and block pointers - explicitly **never** the filename (p. 114; Lec06). *I-node data pointer tree (Lec06):* direct pointers address small files' data blocks directly; single/double/triple indirect pointers add tree levels (a block of pointers, a block of pointers-to-blocks-of-pointers, and so on) so the same fixed-size i-node can still address multi-gigabyte files (Lec06). A directory is just a file whose data blocks hold directory entries - (filename, i-node number) pairs (p. 114; Lec06). `st_nlink` counts how many directory entries point at an i-node; **unlinking** decrements it, and the underlying data blocks are freed only once `st_nlink` reaches 0 *and* no process still has the file open (p. 114). A freshly created leaf directory has `st_nlink == 2` - its own entry inside its parent, plus the `.` entry inside itself; creating a subdirectory bumps the *parent's* `st_nlink` by 1 too, via the child's `..` entry (pp. 115-116).
### 4.15 link, linkat, unlink, unlinkat, and remove Functions
```c
int link(const char *existingpath, const char *newpath);
int linkat(int efd, const char *existingpath, int nfd, const char *newpath, int flag);
```
Both return 0 or -1 (p. 116). Creates a new directory entry `newpath` pointing at the same i-node as `existingpath` - a **hard link**. The new-entry creation and the `st_nlink` increment happen atomically (p. 116). Most implementations require both paths on the *same* file system; only superuser can hard-link a directory (where supported at all), since that risks creating loops most file-system tools can't handle (p. 117).
```c
int unlink(const char *pathname);
int unlinkat(int fd, const char *pathname, int flag);
```
Both return 0 or -1 (p. 117). Removes a directory entry and decrements the i-node's link count; the file's data survives as long as either another link exists or some process still has it open (p. 117). This is exactly the classic **"create, unlink, keep using the fd"** idiom for guaranteed-cleanup temp files: `open`/`unlink` immediately, use the descriptor normally, and the file's storage vanishes the instant the last process closes it or exits - even a crash can't leave the temp file behind (p. 118). Worked-example numbers: unlinking an open 413 MB file leaves the filename gone from `ls` immediately, but `df` shows *no* space freed until the program that still has it open actually finishes and closes it - at which point ~394 MB reappears as available (p. 118). `remove(pathname)` (`<stdio.h>`) is ISO C's portable name for the same idea: `unlink` for a file, `rmdir` for a directory (p. 119).
### 4.16 rename and renameat Functions
```c
int rename(const char *oldname, const char *newname);
int renameat(int oldfd, const char *oldname, int newfd, const char *newname);
```
Both return 0 or -1 (p. 119). Renaming a **file**: if `newname` exists and isn't a directory, it's removed and replaced. Renaming a **directory**: `newname`, if it exists, must be an *empty* directory, and `newname` can't be a path prefix of `oldname` (can't rename `/usr/foo` to `/usr/foo/testdir`) (p. 119-120). Renaming `dot`/`dot-dot` is disallowed; renaming a file onto itself is a successful no-op (p. 120).
### 4.17 Symbolic Links
A **symbolic link** is an indirect pointer - a pathname string - unlike a hard link's direct i-node pointer, invented to sidestep hard links' two limitations: same-file-system requirement, and superuser-only directory linking (p. 120). No file system restrictions apply to what a symlink can point at, and anyone can symlink a directory. Whether a given function follows a symlink (resolves through to the target) or operates on the link itself varies per function - `stat`, `chown`, `open` follow it; `lstat`, `unlink` do not (p. 121). One special case: `open` with both `O_CREAT` and `O_EXCL` on a path that's actually a symlink fails with `EEXIST`, specifically to close a security hole where a privileged process could otherwise be tricked into writing through an attacker-planted symlink (p. 122). *Loops:* a symlink can point back at its own containing directory (`ln -s ../foo foo/testdir`), and a naive recursive directory walk following it produces infinite `foo/testdir/testdir/testdir/...` output until an `ELOOP` error - the fix is walking with `lstat`, not `stat`, so links are never followed during traversal (§4.22) (p. 122-123). Opening a symlink whose target doesn't exist gives the confusing-if-you-don't-know-symlinks `cat: myfile: No such file or directory`, even though `ls myfile` shows the link itself exists fine - `ls -l` or `ls -F` reveal it's a link (p. 123).
### 4.18 Creating and Reading Symbolic Links
```c
int symlink(const char *actualpath, const char *sympath);
int symlinkat(const char *actualpath, int fd, const char *sympath);
```
Both return 0 or -1 (p. 124). `actualpath` need not exist yet, and need not share a file system with `sympath`.
```c
ssize_t readlink(const char *restrict pathname, char *restrict buf, size_t bufsize);
ssize_t readlinkat(int fd, const char *restrict pathname, char *restrict buf, size_t bufsize);
```
Both return bytes read or -1 (p. 124). Because `open` would just follow the link, these combine `open`+`read`+`close` on the link itself; the returned content is **not** null-terminated (p. 124).
### 4.19 File Times
Three timestamps per file: **st_atim** (last data access, e.g. by `read`), **st_mtim** (last data modification, e.g. by `write`), **st_ctim** (last i-node status change - permissions, ownership, link count, anything that changes metadata without necessarily touching the actual bytes) (p. 125). The system never tracks a directory's own "last accessed" separately in a way `access`/`stat` themselves would disturb. `ls -l`/`-t` sort/display `st_mtim` by default; `-u` switches to `st_atim`; `-c` to `st_ctim` (p. 125). A large table in the book (Figure 4.20) cross-references every function in the chapter against which of the three timestamps it touches, on the referenced file/directory versus its parent (p. 125-126) - e.g. `creat`ing a new file touches the new file's own times *and* its parent directory's times (a new entry was added there too).
### 4.20 futimens, utimensat, and utimes Functions
```c
int futimens(int fd, const struct timespec times[2]);
int utimensat(int fd, const char *path, const struct timespec times[2], int flag);
```
Both return 0 or -1 (p. 126). `times[0]` is the new access time, `times[1]` the new modification time - both calendar time, nanosecond-resolution `timespec`. Four modes: `times == NULL` sets both to now; a `tv_nsec` of `UTIME_NOW` sets that one field to now; `UTIME_OMIT` leaves that field untouched; any other value sets it explicitly (p. 126). Changing to "now" needs only write permission (or ownership/superuser); setting an explicit arbitrary time needs ownership or superuser - write permission alone isn't enough (p. 126-127). The older XSI function `utimes(const char *pathname, const struct timeval times[2])` (`<sys/time.h>`) works the same way at microsecond resolution instead of nanosecond, and - like all of these - can never set `st_ctim` directly, since that field is *itself* automatically updated the moment any of these functions runs (p. 127). Worked example: a program truncates a file to zero length with `O_TRUNC` but first saves, then restores, the original access/modification times via `stat` + `futimens`, so only the changed-status time visibly updates afterward - a real demonstration that content, access-time, and change-time are three genuinely independent things (pp. 127-128).
### 4.21 mkdir, mkdirat, and rmdir Functions
```c
int mkdir(const char *pathname, mode_t mode);
int mkdirat(int fd, const char *pathname, mode_t mode);
```
Both return 0 or -1 (p. 129). Creates an empty directory (`.` and `..` auto-populated), with `mode` still filtered through `umask` as usual - the common beginner mistake is requesting only read/write and forgetting at least one execute bit is needed for the directory to actually be enterable (p. 129).
```c
int rmdir(const char *pathname);
```
Returns 0 or -1 (p. 130). Only works on an *empty* directory (containing only `.`/`..`). If some process still has it open when the link count hits 0, the space isn't reclaimed until that process closes it, but no new files can be created inside in the meantime (p. 130).
### 4.22 Reading Directories
Readable by anyone with directory-read permission, but only the kernel ever writes to one directly (p. 130). Directory *format* is implementation-specific (early UNIX: fixed 16-byte entries, 14 for name + 2 for i-node number; 4.2BSD onward: variable-length for longer names), which is exactly why POSIX standardized a portable API instead of letting programs `read()` raw directory bytes (p. 131):
```c
DIR *opendir(const char *pathname);
DIR *fdopendir(int fd);
struct dirent *readdir(DIR *dp);
void rewinddir(DIR *dp);
int closedir(DIR *dp);
long telldir(DIR *dp);
void seekdir(DIR *dp, long loc);
```
`struct dirent` guarantees at minimum `ino_t d_ino` and a null-terminated `char d_name[]` (p. 131). Entry order within a directory is implementation-defined, generally *not* alphabetical (p. 131). Worked example: a hand-written recursive directory walker (`myftw`/`dopath`, modeled on the standard `ftw`/`nftw`) uses `lstat` rather than `stat` specifically so it doesn't follow symlinks into infinite loops (§4.17), calling a user function once per entry and tallying counts of each of the seven file types from §4.3 (pp. 131-134).
### 4.23 chdir, fchdir, and getcwd Functions
Every process has a working directory that anchors relative-pathname resolution (pp. 8, 135; Lec06).
```c
int chdir(const char *pathname);
int fchdir(int fd);
char *getcwd(char *buf, size_t size);
```
`chdir`/`fchdir` return 0 or -1; `getcwd` returns `buf` or `NULL` (pp. 135-136). `chdir` only ever changes the *calling* process's own working directory - a child can never change its parent's, which is exactly why a shell's `cd` has to be a shell built-in rather than an external program: an external `cd` would `chdir` itself, then exit, leaving the shell's own working directory unchanged (p. 136). `getcwd` reconstructs the absolute path by starting at `.`, walking upward through successive `..` entries, and at each level reading the parent's directory entries to match child i-node numbers back to names, until reaching `/` (p. 136). Login sets the initial working directory from `/etc/passwd`; the shell's `~` shorthand for home has no equivalent in C - a C program instead reads the `HOME` environment variable via `getenv("HOME")` (p. 8, 135, 210; Lec06).
### 4.24 Device Special Files
`st_dev` and `st_rdev` are easy to confuse: **st_dev** identifies the file system a given filename/i-node lives on (every file has one); **st_rdev** identifies the actual device a character- or block-special file refers to (only special files have this) (p. 137-138). Both are encoded in `dev_t` as a major number (identifies the device driver) and minor number (identifies the specific subdevice) - accessed portably via the `major`/`minor` macros rather than assuming a bit layout, since that layout varies wildly by platform (p. 138). Worked example: on Linux, `/` and `/home/sar` report different `st_dev` values (different file systems, confirmed via `mount`); `/dev/tty0` and `/dev/tty1` share one `st_dev` (both live on the `devtmpfs` pseudo file system) but have different `st_rdev` values (`4/0`, `4/1`) identifying them as distinct character devices (p. 139).
### 4.25 Summary of File Access Permission Bits
A consolidated table (Figure 4.26) restates every constant from this chapter and what it means on a regular file versus a directory (p. 140): `S_ISUID` (set effective UID on exec; unused on directories), `S_ISGID` (set effective GID on exec, or - if group-execute is off - enable mandatory record locking; on a directory, new files inherit the directory's group), `S_ISVTX` (control file-content caching where supported; on a directory, restrict deletion/rename per §4.10), plus the nine ordinary `rwx` bits, each meaning something functionally different on a file (read/write/execute the content) versus a directory (list entries / add-remove entries / search through as a path component). The nine can be grouped in threes: `S_IRWXU = S_IRUSR|S_IWUSR|S_IXUSR` (and the matching `_G`/`_O` forms).
## Worked Example
`open("/home/sun/hello.txt")` resolves through a chain of i-node lookups, not one shortcut (Lec06):
1. *Root Lookup:* The kernel starts from root `/`'s known, fixed i-node number (p. 115; Lec06).
2. *Reading Root's Directory:* ==The kernel reads `/`'s data blocks, searching its directory entries for `"home"`, finding it mapped to i-node number 8.==
3. *Reading `/home`:* Opens i-node 8, searches its entries for `"sun"`, finds i-node 15.
4. *Reading `/home/sun`:* Opens i-node 15, searches its entries for `"hello.txt"`, finds i-node 16.
5. *File Access:* The kernel opens i-node 16, checks permissions, loads its data block pointer tree into a fresh system-file-table entry, and hands back a file descriptor (p. 74, 114; Lec06).
Every `/` in a pathname is one more directory-entry lookup, not a free jump - this is why deep paths and long directories cost real I/O.
## Connections
- **Lecture (Lec06, 9/24):** Storage devices as block arrays (512-byte historical vs. 4096-byte modern preferred `read()` size), device drivers as a uniform block interface, marketing terabytes vs. binary **tebibytes**, the i-node pointer-tree diagram (direct/single/double/triple indirect), `ls -li` i-node inspection, shell `~` vs. C `getenv("HOME")`, and the step-by-step `open("/home/sun/hello.txt")` walkthrough above.
- **Lecture coverage gaps:** Nearly the entire permission/ownership/link machinery of this chapter - §4.4 (setuid/setgid bits), §4.6-4.11 (ownership rules, `access`, `umask`, `chmod`, sticky bit, `chown`), §4.13 (truncation), §4.15-4.18 (hard/symbolic links), §4.19-4.20 (file times), §4.21-4.22 (`mkdir`/`rmdir`/directory reading), and §4.24-4.25 (device special files, the permission-bit summary table) - has no matching slide in Lec01-06. Week 4's own lectures (9/29, 10/1) had not yet happened as of this session; cross-check this note against them once they land.
- **Textbook ([[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter 3]]):** §4.5-4.9's permission-bit material is captured a second time, more briefly, inside Chapter 3's note because Lec03/Lec04 taught it during the Week 2 lectures - this chapter's own version above is the complete, book-order treatment, including `umask`, ownership rules, and the sticky bit that Chapter 3's version never covers.
- **Forward:** §15.1-15.2 (Pipes), assigned alongside this chapter's back half for Week 4, has no chapter note yet in this course's `Textbook/` folder at all.
## Open Questions
- [ ] Inspect file i-node numbers on the course container using `ls -li` and trace a real hard link across two directory entries.
- [ ] Write a C program that calls `stat()` on a file with a real hole and compares `st_size` against `st_blocks * 512`.
- [ ] ==Verify that calling `chdir()` in a C child process does not alter the parent shell's current working directory.==
- [ ] Reproduce the `umask(0)` vs. restrictive-`umask` `creat()` example and confirm the resulting `ls -l` output matches the book's.
- [ ] Once Week 4's real lectures land, confirm which of this chapter's un-lectured sections (hard links, symbolic links, `mkdir`/directory reading) actually get taught, versus staying textbook-only for this course.
## Flashcards
#cards/csci4061
Why does an i-node explicitly omit the filename of a file?::==Omitting filenames from i-nodes lets multiple directory entries (hard links), even in different directories, point at the same physical i-node without needing to replicate or synchronize the file's metadata across copies.==
Why does `access()` sometimes report "permission denied" for a path that a subsequent `open()` call on the same path succeeds on?::`access()` checks against the process's *real* user/group IDs; `open()` checks against the *effective* IDs. A set-user-ID-root program's effective ID can open a file the real user genuinely couldn't - `access()` is answering a different, more honest question.
A process calls `umask(022)` then creates a file requesting mode 0666. What mode does the file actually get?::0644 - `umask` turns off any bit that's set in the mask, so the group-write and other-write bits requested get cleared, leaving owner read/write and group/other read only.
Why does `chmod()` automatically clear a file's set-user-ID and set-group-ID bits when an unprivileged process writes to it?::To prevent a malicious user who finds a writable privileged file from retaining that file's special execution privileges just by modifying its contents - the bits only survive being set by someone with the authority to set them deliberately.
What's the actual mechanical difference between a hard link and a symbolic link?::A hard link is a second directory entry pointing directly at the same i-node - no distinction from the "original," same `st_nlink` count, must share a file system. A symbolic link is its own file whose contents are a pathname string, resolved through an extra lookup step, and can point anywhere, on any file system, at something that may not even exist yet.
Why does deleting an open file's directory entry not free its disk space right away?::`unlink()` only removes the directory entry and decrements the i-node's link count; disk space is reclaimed only once the link count reaches zero *and* no process still has the file open - this is exactly the mechanism the classic open-then-unlink temp-file trick relies on.
What's the actual difference between `st_mtim` and `st_ctim`, and why do both exist?::`st_mtim` (modification time) tracks when the file's *contents* last changed; `st_ctim` (changed-status time) tracks when the file's *i-node metadata* last changed - permissions, ownership, link count - which can change without the content ever being touched, so one timestamp alone can't represent both kinds of change.
