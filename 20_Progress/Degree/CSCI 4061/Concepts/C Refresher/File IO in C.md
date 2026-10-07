---
type: concept
status: sprout
created: 2026-10-01
updated: 2026-10-06
course: "[[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/CSCI 2021 Board|CSCI 2021 Board]]"
track: C Refresher
mastery_level: "0"
prerequisites:
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Pointers and Addresses|Pointers and Addresses]]"
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Structs and Typedef|Structs and Typedef]]"
used_in:
  - "[[CSCI 4061 Board]]"
evidence:
  - "[[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 3|Week - 3]]"
  - "[[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 4|Week - 4]]"
tags:
  - concept
related:
  - "[[20_Progress/Degree/CSCI 4061/Weekly/Week - 2|Week - 2]]"
---
# File IO in C
## One-Line Answer
==C has two genuinely different ways to move file data in and out of a program - text mode, which converts between on-disk characters and in-memory values through a format string, and binary mode, which copies raw bytes straight into a struct's memory layout with no conversion at all.==
## Start Here
Do not collapse two different I/O layers. A `FILE *` is C's buffered stdio handle, used with `fopen`, `fclose`, `fprintf`, and `fscanf`. An `int` file descriptor is Unix's lower-level handle, used with `open`, `close`, `read`, `write`, and `dup2`. Both reach files, but they have different APIs and buffering behavior.

| Buffered C stdio | Low-level Unix I/O used in CSCI 4061 |
|---|---|
| `fopen(path, "r")` | `open(path, O_RDONLY)` |
| `fclose(stream)` | `close(fd)` |
| `fprintf(stream, ...)` | `write(fd, buffer, count)` |
| `stdin` / `stdout` streams | descriptors 0 / 1 |

Project 1 redirection uses `open` and `dup2`, not `fopen`, because it must rewire descriptor 0 or 1 before `execvp` runs another program.
## Mechanism
A C file stream starts as a `FILE *` handle returned by `fopen(path, mode)` - `"r"`/`"w"`/`"a"` for text, `"rb"`/`"wb"` for binary. `fopen` returns `NULL` on failure (missing file, bad permissions), so the very first line after every `fopen` call has to be a null check - this isn't optional cleanup, it's the only way the program finds out the open actually worked.
**Text mode** reads and writes through a *format string*: `fscanf(fh, "%d %d", &w, &h)` parses whitespace-separated tokens into their typed destinations; `fprintf(fh, "%d\n", x)` does the reverse. The file on disk is human-readable ASCII the whole time - `cat` shows you real numbers, not garbage. CSCI 2021's Lab 3 `treasuremap_load_text` is the canonical worked example: `fscanf(file_handle, "%d %d", &tmap->height, &tmap->width);` reads the header, then a loop reads each treasure's `row`/`col`/`description` with `fscanf(file_handle, "%127s", tmap->locations[i].description);` - the `%127s` width limit is load-bearing, not decoration, since an unbounded `%s` would let the file overflow `description[128]`.
**Binary mode** skips parsing entirely: `fread(dest, size, count, fh)` copies `size*count` raw bytes directly from the file into memory, and `fwrite(src, size, count, fh)` does the reverse - no conversion, no whitespace splitting, just a `memcpy`-style byte copy between disk and RAM. The same Lab 3 assignment's `treasuremap_load_binary` reads the identical logical data with `fread(&tmap->height, sizeof(int), 1, file_handle);` - four raw bytes become an `int` with zero parsing work. Because there's no whitespace to mark where one field ends and the next begins, a binary format has to store its own lengths explicitly: the binary treasure map stores a `description_len` integer *before* each description's bytes, specifically because `fread` has no concept of "read until space" the way `%s` does - `fread(tmap->locations[i].description, sizeof(char), description_len, file_handle);` reads exactly that many bytes and nothing more. Critically, `fread` never adds a null terminator - the very next line, `tmap->locations[i].description[description_len] = '\0';`, has to do that by hand, or every later `strlen`/`printf("%s", ...)` call on that buffer reads past the end of real data.
**The two-pass idiom** is the standard way to read an unknown amount of data into exactly the right amount of heap space: HW03's `read_all_doubles()` does one pass counting values with a throwaway read loop (`while (1) { ... fscanf(fin, "%lf", &tmp); if (ret == EOF) break; count++; }`), then `rewind(fin)` resets the file position to byte 0, then a second pass actually `malloc(count * sizeof(double))`s the right-sized array and reads for real. `rewind` is exactly this pattern's enabling move - without it, the second pass would start reading from wherever the first pass's EOF left the file position, which is the end, not the beginning.
*Invariant:* a text-mode value and a binary-mode value can represent the identical logical data (Lab 3's own two loaders prove this - same `treasuremap_t`, two on-disk formats), but they are never byte-compatible with each other; you cannot `fread` a text file or `fscanf` a binary one and get sensible results.
*Complexity/limitation:* binary I/O assumes the reader and writer agree on `sizeof(int)` and endianness - a binary file written on one machine isn't guaranteed portable to a machine with a different word size or byte order, which text I/O sidesteps entirely by going through human-readable digits instead of raw memory layout.
## Contrast / What It Is Not
- **Text I/O vs. binary I/O** is not "slow vs. fast" in some abstract sense - it's "parse cost and portability" (text) traded against "raw speed and exact byte layout, but non-portable and unreadable without the matching struct" (binary). Lab 3's two loaders for the same `treasuremap_t` make this trade concrete rather than theoretical.
- **`fread`/`fwrite` vs. `mmap()`-based parsing** (the technique in Lab 10/HW11): `fread` copies bytes from the file into a buffer you own; `mmap()` instead maps the file's bytes directly into the process's address space and lets you pointer-cast a struct straight onto them (`(file_header_t*)file_bytes`) with no copy at all. `mmap` is faster for large files read many times, but ties the program directly to the on-disk struct layout with even less room for error than `fread`.
- **`scanf`-family functions are not "read a line"** - `%d`/`%s`/`%lf` each stop at the next whitespace or format boundary, not the next newline. Reading a full line (including spaces) needs `fgets`, not `fscanf`.
## Failure Modes / Misconceptions
> [!WARNING]
> Not checking `fopen`'s return value for `NULL` before using the handle. A missing file, a typo'd path, or a permissions error all make `fopen` return `NULL` silently - passing that `NULL` into `fscanf`/`fread` next is a guaranteed crash, and this exact check is one of this course's explicitly graded error-handling requirements (per [[CSCI 4061 Board]]'s "-1 point per missed error check" policy, which applies the same way to `open()` as it does to `fopen()`).

> [!WARNING]
> Forgetting that `fread` does not null-terminate. A buffer read with `fread` is exactly `description_len` bytes of real data and nothing else - treating it as a C string before manually appending `'\0'` reads whatever garbage happens to sit in the next byte of memory.

> [!WARNING]
> Reading a binary file's `int`/`struct` fields on a machine with a different `sizeof(int)` or endianness than the one that wrote it. This is exactly why CSAPP spends a whole section on endianness before this course ever reaches binary file I/O - the bytes are correct, but what they *mean* depends on an assumption text I/O never has to make.

> [!WARNING]
> Forgetting `fclose`. Every open file descriptor is a limited OS resource; a program that `fopen`s in a loop without matching `fclose` calls will eventually exhaust the process's file-descriptor table, and - specific to this course - an open-but-unclosed output file's buffered writes may never actually reach disk at all.
## Evidence From This Vault
- [[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 3|Week - 3]] - Lab 3's full text-vs-binary `treasuremap_t` loader walkthrough, including the `description_len`-before-bytes binary framing pattern and the heap-allocation-ownership rule for `treasuremap_free`.
- [[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 4|Week - 4]] - Lecture 6's `write_people_text`/binary `fwrite` pair and the DIS 2.8 `fopen`/`getc`/`putc`/`rewind`/`fseek` API reference; HW03's two-pass `read_all_doubles()` count-then-malloc-then-read idiom.
## Flashcards
#cards/csci2021
Why does a binary file format need to store an explicit length before a variable-length field, when a text format usually doesn't?::Text formats use whitespace as a natural delimiter that `fscanf`'s `%s` already knows how to stop at. Binary reads with `fread` copy an exact byte count with no concept of "stop at whitespace," so the format has to say how many bytes to read before reading them.
After `fread(buf, 1, len, fh)` fills `buf` with `len` bytes of file data, is `buf` a valid C string yet?::No. `fread` only copies raw bytes - it never appends a null terminator. The caller must write `buf[len] = '\0'` manually before treating `buf` as a string.
What does `rewind(fh)` actually do, and why does the two-pass read idiom depend on it?::It resets the file's current read/write position back to byte 0. The two-pass idiom's first pass reads through to EOF just to count entries, leaving the file position at the end - without `rewind`, the second pass's real read would start from EOF instead of the beginning and read nothing.
Why is checking `fopen`'s return value for `NULL` non-optional rather than defensive extra work?::`fopen` returns `NULL` on any failure (missing file, bad path, permissions) with no other signal. Passing a `NULL` `FILE *` into `fscanf`/`fread`/`fclose` next dereferences a null pointer and crashes - the check is the only way the program finds out the open failed at all.
What's the real tradeoff between text-mode and binary-mode file I/O, beyond "binary is faster"?::Binary I/O is faster because it skips parsing, but it assumes the reading and writing programs agree on exact type sizes and byte order (endianness), making it non-portable across machines. Text I/O is slower to parse but stores human-readable, portable digits instead of raw memory layout.
