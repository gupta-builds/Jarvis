
# Prompts
## Notebook
Gemini Notebook (the July 2026 rename of NotebookLM) runs on the Gemini 3.5 model family with no user-facing model picker — Google folded the education-tuned LearnLM behavior into the default Gemini Notebook experience rather than exposing it as a setting, which is why there was nothing to configure. [Same tool, new name: NotebookLM is now Gemini Notebook](https://it.rutgers.edu/2026/09/10/same-tool-new-name-notebooklm-is-now-gemini-notebook/), [NotebookLM April 2026 Update: New Features, Gemini Model, and Power-User Guide](https://leadershipinchange.com/p/gemini-notebooklm-ai-research-2026)

Workflow: fresh Gemini Notebook chat per chapter, upload that chapter's sources, paste the filled prompt below, save the output as the chapter note in `20_Progress/Degree/[COURSE]/Textbook/`. No chat memory carries over — if continuity with a prior chapter's terminology matters, upload that prior chapter's saved `.md` note as an extra source and say so in the prompt.

**Character limit, confirmed 2026-09-21:** Gemini Notebook's paste box rejects the single-shot ~5,590-character prompt below the master template's full length. A ~3,798-character version (cutting FORMATTING RULES, VOCABULARY RECONCILIATION, OUTPUT CONTRACT, and the content-density mandate) went through, and the output was noticeably thinner for it. Do not cut instructions to fit — split the chapter into two or three prompts fed into the **same** Gemini Notebook chat instead, each kept under ~3,000 characters. Every rule stays in every part; only the section SCOPE shrinks.

### Master prompt (reusable — fill the brackets each week, for any future course)
```
You are producing a source-grounded study note for a university course, in Obsidian-flavored Markdown, for personal study only — not a graded submission, so course AI-use policy on essays/coding does not apply, but you must still never invent facts beyond the attached sources.

SOURCES AND PRIORITY
1. PRIMARY, load-bearing source: [TEXTBOOK NAME], Chapter [N] — "[CHAPTER TITLE]". The note's structure and depth come from this chapter, in the book's own order.
2. SECONDARY, emphasis source: [LECTURE FILE NAME(S)]. Use this only to decide what to expand, which vocabulary/function names/examples the professor used verbatim, what the professor has NOT yet covered, and — importantly — whether the professor pulled in content that technically belongs to a different chapter (flag this explicitly, don't silently fold it into the wrong chapter's note).
3. BACKGROUND, non-content source: [DISCUSSION/POLICY FILE NAME]. Do not summarize this as chapter content — it is course-policy context only.

SCOPE
Cover every part of this chapter that discusses these real functions/concepts, taken from the actual lecture: [LIST OF REAL FUNCTION NAMES / CONCEPTS]. Find the book's own subsection numbers and titles yourself from the uploaded PDF — do not assume any subsection numbering I give you is correct if it conflicts with what you see in the source.

STRUCTURE — output exactly these headings in this order, nothing added or removed:
# [Chapter Title]
## Chapter Summary
One sentence claim with exactly one ==highlighted== phrase, then "*Mechanism:*" explaining how the claim works.
## Key Concepts
Every named term from the chapter, **bolded** on first use, one line each: what it means and why it matters to the chapter's argument.
## Full Reading Notes
One ### subheading per numbered subsection, using the book's own subsection numbers and titles verbatim. Every distinct claim, example, and piece of reasoning in that subsection must appear in some form — if I could learn something from re-reading the original PDF that isn't in your note, the note has failed. Reproduce named examples, numbered lists, function signatures, and code excerpts in full (as fenced code where the book gives code), don't compress into "etc."
## Worked Example
One end-to-end example (use the chapter's own running example if it has one) that ties the whole section's concepts together.
## Connections
- Lecture: what the lecture(s) emphasized from this material, which real function names/examples appeared on slides vs. only in the book, and whether the lecture pulled in content that technically belongs to a different chapter (name that chapter).
- Textbook: nothing to fill here yet, leave the line as "(pending next chapter)".
## Open Questions
3–5 items as Markdown tasks ("- [ ] ...") — genuine unresolved questions or self-test prompts a student should be able to answer after really understanding this material, not busywork.
## Flashcards
5–8 cards testing mechanisms and contrasts, not labels. Format: "Question::Answer #cards/ai" one per line, or multiline with "?" separator for longer answers.

FORMATTING RULES (violating these is a failure, not a style choice)
- Zero blank lines between a heading and its first line of content, and zero blank lines between consecutive list items or sections.
- ==highlight== markers: exactly one per major ## heading, reserved for the single most important definitional claim in that section.
- **bold**: named concepts/functions/terms on first introduction only, not general emphasis.
- *label:* italics for sub-category intro labels like *Mechanism:* or *Pitfall:*.
- No marketing or filler language: avoid words like "transformative," "powerful," "seamless," "leverage," "comprehensive," "unlock," "landscape," "journey" — say the actual mechanism instead.
- No sentence that could be pasted into a generic study-guide site unchanged. Every sentence should carry a mechanism, example, contrast, or explicit uncertainty.
- Cite page numbers for direct definitions or close paraphrases, in parentheses.

OUTPUT CONTRACT
Return the entire note as a single fenced Markdown code block (```markdown ... ```) so nothing gets reinterpreted by the chat UI when copied into Obsidian. Do not add commentary before or after the code block.

Before answering, silently verify: every numbered subsection in the scope has its own ### heading; every bolded term is actually defined; the highlight count per ## section is exactly one; the code block is the entire response.
```

## CSCI 4061 — Chapter prompts, grounded in the real lecture slides (Lec01–Lec06, Weeks 1–3, reviewed in full 2026-09-24)
Picked as the crucial course because it's the heaviest Fall'26 course (~12 hrs/week per [[20_Progress/Degree/CSCI 4061/CSCI 4061 Board|CSCI 4061 Board]]) and, per [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]], had **zero chapter notes written** as of this pass despite Weeks 1–3 already covering seven chapters/sections of Stevens & Rago. **Unlike the first draft of this file, every prompt below is grounded in the actual lecture PDFs** (`Lecture/Week - 1/Lec01-02.pdf`, `Week - 2/Lec03-04.pdf`, `Week - 3/Lec05-06.pdf`) and both real lab decks (`Labs/Lab 01.pdf` — titled "Lab 3: fork, exec & wait" internally, a numbering mismatch worth flagging to the TAs, not silently fixed here; `Labs/CSCI 4061 Lab 02.pdf` — "Signals & I/O Redirection") read in full this session, not guessed.

**Real, verified discovery that changes the prompt design:** Kolb's lectures do **not** stay inside one textbook chapter per week. The "Ch3 week" lecture (Lec04, 9/17) also teaches file **permission bits** (chmod, octal notation, S_IRUSR/S_IWUSR/S_IXUSR) — that content lives in APUE **Chapter 4** (§4.5–4.9), not Chapter 3 — and teaches **stdio buffering** (fully-buffered/line-buffered/unbuffered, fflush, fsync, the stdout-vs-stderr example) — that lives in APUE **Chapter 5** (Standard I/O Library), not Chapter 3 either. Forcing a strict "only Chapter 3" scope would make Gemini silently drop real, testable lecture content. Every prompt below tells Gemini to flag this cross-chapter blending explicitly rather than hide it.

Primary textbook: *Advanced Programming in the UNIX Environment*, 3rd ed., Stevens & Rago, 2013. Source folder: `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061`. Save each finished note to `20_Progress/Degree/CSCI 4061/Textbook/Chapter - [N].md`, cross-linked from the Textbook Map when done.

> [!WARNING] Week 4 hasn't happened yet — no prompts below for it
> As of 2026-09-24 only `Lecture/Week - 1`, `Week - 2`, `Week - 3` exist (Lec01–Lec06). The Board's Textbook Map plans Ch4 (finish) and Ch15.1–15.2 for Week 4 (9/28–10/2), but those lectures aren't recorded yet — writing a "grounded" prompt for them now would mean fabricating lecture content, which defeats the entire point of this pass. Add those two prompts once `Lec07.pdf`/`Lec08.pdf` land in the source folder, using the same method: read the real slides first, then write the prompt.

### Chapter 1 — UNIX System Overview (Week 1, framed by Lecture 1 — 9/8, "Course Mechanics & Introduction")
Lecture 1 is orientation, not a section-by-section walk through Ch1 — it never cites a page number or subsection. Its real content is framing: the "referee / illusionist / glue" three-role model of an OS, the OS-as-"lowest layer of software that talks to hardware" definition, the layered diagram (User Programs → System Call API → System Call Handlers → {Program Control, I/O & Comms, File System, Security, Virtual Memory} → Hardware), the Unix-vs-POSIX-vs-Linux naming tangle ("our textbook would more accurately be titled *Posix Systems Programming*"), the three-program Hello World exercise (C stdio vs. raw `write()` syscall vs. hand-written x86-64 assembly with the `syscall` instruction), and why register `%rax` holds a syscall number rather than jumping to an address directly (the OS doesn't trust user code). Upload: `APUE Ch1.pdf` (or full book), `Lecture/Week - 1/Lec01.pdf`.
#### Part 1 of 2 — sections 1.1–1.6
```
You are producing a source-grounded personal Obsidian study note, not a graded submission. Never invent facts beyond the attached sources.

SOURCES
PRIMARY: Stevens & Rago, "Advanced Programming in the UNIX Environment," 3rd ed., Chapter 1 "UNIX System Overview."
SECONDARY: "Lec01 — Course Mechanics & Introduction" (2026-09-08). This lecture is orientation-level, not a section-by-section walkthrough — use it only for framing: the OS as "referee, illusionist, and glue," the System-Call-API layer diagram, the Unix/POSIX/Linux naming distinction ("this textbook would more accurately be titled Posix Systems Programming"), and the three-program Hello World exercise (C stdio call vs. direct write() syscall vs. hand-written x86-64 assembly using the syscall instruction and register %rax for the syscall number).

THIS IS PART 1 OF 2. A follow-up prompt covers the rest of the chapter plus the whole-chapter wrap.

SCOPE
Cover every part of Chapter 1 discussing: what a "UNIX architecture" / kernel is, logging in / the shell, files and directories basics, input and output basics, programs and processes basics. Find the book's own subsection numbers yourself from the PDF.

OUTPUT
One ### subheading per numbered subsection, book's own numbers/titles verbatim. Every distinct claim and example must appear in some form. Reproduce code/shell excerpts as fenced blocks. **Bold** named concepts on first use only. Exactly one ==highlight== for the single most important claim in this response. *label:* italics for sub-labels. Cite page numbers for direct definitions, in parentheses. No marketing language. Zero blank lines between heading and content or between list items.

Return the entire response as a single fenced markdown code block, nothing before or after it.
```
#### Part 2 of 2 — remaining sections + whole-chapter wrap
```
PART 2 OF 2 for this chapter, same rules: never invent facts beyond the sources, personal study note not a graded submission.

SCOPE — FIRST HALF
Cover every remaining part of Chapter 1: error handling, user identification, signals (at the overview level only — the full treatment is Chapter 10, don't duplicate it here), time values, system calls vs. library functions. One ### subheading per numbered subsection, every distinct claim/example present.

SCOPE — SECOND HALF: whole-chapter wrap
Using everything from this message and the previous message, add:
## Chapter Summary — one sentence claim, exactly one ==highlight==, then "*Mechanism:*" paragraph.
## Key Concepts — every named term from the whole chapter, **bolded** on first use.
## Worked Example — trace the three-program Hello World exercise from Lec01 end to end: what the C stdio call does, what the direct write() syscall does differently, and what the hand-written assembly's syscall instruction does at the hardware/register level (%rax = syscall number, per Lec01).
## Connections — Lecture: name that Lec01 is framing-only (no section citations), list the real concepts it did supply (referee/illusionist/glue, the layer diagram, Unix/POSIX/Linux naming, the three-program exercise), and note explicitly that it does NOT walk the chapter section by section — flag which sections above have zero lecture backing. Textbook: "(pending Chapter 7)".
## Open Questions — 3–5 Markdown tasks.
## Flashcards — 5–8 cards, mechanisms not labels: "Question::Answer #cards/ai".

RULES
Highlight budget: this part's first-half sections get zero new ==highlights==; Chapter Summary, Key Concepts, Worked Example, Open Questions, Flashcards each get exactly one. Page-cite direct definitions. *label:* italics for sub-labels. No marketing language. Zero blank lines between heading and content or between list items.

Return the entire response as a single fenced markdown code block, nothing before or after it.
```

### Chapter 7 — Process Environment (Week 1–2, grounded in Lecture 2 — 9/10 "Processes" and Lecture 3 — 9/15 "Process Management, I/O")
Real anchors from the slides: the ELF-to-process pipeline (`.text/.data/.bss` → loaded read-only code segment / read-write data segment; runtime heap via `brk`; user stack), `_start()` vs `main()` (your program's real entry point is `_start`, which sets up the stack/heap then calls `main`), the four-region memory image (Text / Global / Heap / Stack, stack and heap growing toward each other, a collision meaning stack overflow), `getcwd()`/`getpid()`/`getppid()`, environment variables as a `char **environ` list with `name=value\0` strings, `setenv()`/`getenv()`/`unsetenv()`, and the `PATH` variable's role in resolving bare commands like `ls` (plus `LD_PRELOAD` and `LD_LIBRARY_PATH` as sibling lookup variables). Upload: `APUE Ch7.pdf`, `Lecture/Week - 1/Lec02.pdf`, `Lecture/Week - 2/Lec03.pdf`.
#### Part 1 of 2 — sections on program-to-process setup and memory layout
```
You are producing a source-grounded personal Obsidian study note, not a graded submission. Never invent facts beyond the attached sources.

SOURCES
PRIMARY: Stevens & Rago, "Advanced Programming in the UNIX Environment," 3rd ed., Chapter 7 "Process Environment."
SECONDARY: "Lec02 — Processes" (2026-09-10) and "Lec03 — Process Management, I/O" (2026-09-15, environment-variable portion only). Real terms/examples from these slides: the ELF/loader pipeline into a process's memory image, _start() as the true entry point (main() is "just another C function" that _start() calls after setting up the stack/heap), the four-region memory layout (Text/Global/Heap/Stack) with stack and heap growing toward each other (collision = stack overflow), getcwd()/getpid()/getppid().

THIS IS PART 1 OF 2. A follow-up prompt covers environment variables plus the whole-chapter wrap.

SCOPE
Cover every part of Chapter 7 discussing: the main function / program entry point, process termination and exit codes, command-line arguments, and memory layout of a C program (text/initialized data/uninitialized data/heap/stack). Find the book's own subsection numbers from the PDF.

OUTPUT
One ### subheading per numbered subsection, book's own numbers/titles verbatim. Every distinct claim/example/function signature must appear in some form. Reproduce code/diagrams as fenced blocks — describe the stack/heap/data/text diagram as a labeled box layout if the book gives one. **Bold** named functions/concepts on first use only. Exactly one ==highlight== for the single most important claim (the _start()-calls-main() relationship is a strong candidate, since Lec02 makes a point of correcting the "main() is the entry point" misconception). *label:* italics for sub-labels. Cite page numbers for direct definitions, in parentheses. No marketing language. Zero blank lines between heading and content or between list items.

Return the entire response as a single fenced markdown code block, nothing before or after it.
```
#### Part 2 of 2 — environment variables + whole-chapter wrap
```
PART 2 OF 2 for this chapter, same rules: never invent facts beyond the sources, personal study note not a graded submission.

SCOPE — FIRST HALF
Cover every part of Chapter 7 discussing shared libraries, memory allocation (malloc family), and environment variables — the char **environ global, setenv()/getenv()/unsetenv(), and how a process's environment is inherited from its parent at fork/exec time. One ### subheading per numbered subsection.

SCOPE — SECOND HALF: whole-chapter wrap
Using everything from this message and the previous message, add:
## Chapter Summary — one sentence claim, exactly one ==highlight==, then "*Mechanism:*" paragraph.
## Key Concepts — every named term from the whole chapter, **bolded** on first use.
## Worked Example — trace how a bare command like "ls" gets resolved to /usr/bin/ls via the PATH environment variable, per Lec03's "Something Else to Consider" slide (built-in commands aren't magic, they're programs found by searching PATH folders) — contrast with LD_PRELOAD and LD_LIBRARY_PATH, which Lec03 names as sibling lookup variables for library loading, not program resolution.
## Connections — Lecture: name Lec02 (memory layout, _start/main) and Lec03 (environment variables, PATH) specifically, and which exact terms (environ, LD_PRELOAD, LD_LIBRARY_PATH) came from slides vs. only the book. Textbook: "(pending Chapter 8)".
## Open Questions — 3–5 Markdown tasks.
## Flashcards — 5–8 cards, mechanisms not labels: "Question::Answer #cards/ai".

RULES
Highlight budget: this part's first-half sections get zero new ==highlights==; the five wrap sections each get exactly one. Page-cite direct definitions. *label:* italics for sub-labels. No marketing language. Zero blank lines between heading and content or between list items.

Return the entire response as a single fenced markdown code block, nothing before or after it.
```

### Chapter 8 — Process Control (Week 1–2, grounded in Lecture 2 — 9/10 and Lecture 3 — 9/15)
Real anchors: `fork()` returning twice (child PID in parent, 0 in child, negative on error), the "program with the weakest set of assumptions possible" principle (fork's scheduling order is never guaranteed — Lec02's three-outcome `#1/#2/#3` exercise), the multi-fork "family tree" exercises (nested forks inside a loop, `break` on child vs. parent branches), copy-on-write inheritance of address space/cwd/open files, the six real `exec` variants Kolb names as **execl, execle/execve, execlp/execvp, execvpe** (not a flat list of six independent names — he groups them in pairs by what "e" and "p" add), `exec` never returning except on error, zombie processes (child exits before parent calls `wait`, must be kept around for its exit code), orphan processes (parent exits first, child is adopted by `init`/`systemd`, PID 1, which can't be killed and acts as a "reaper"), daemon processes (parent forks and never waits, e.g. `httpd`/`lpd`/`sshd`), and `wait()` vs `waitpid()` with `WNOHANG`. Upload: `APUE Ch8.pdf`, `Lecture/Week - 1/Lec02.pdf`, `Lecture/Week - 2/Lec03.pdf`, `Labs/Lab 01.pdf` (titled "Lab 3: fork, exec & wait" internally — a real numbering mismatch in the source folder, not a typo to silently correct).
#### Part 1 of 2 — process creation and identity
```
You are producing a source-grounded personal Obsidian study note, not a graded submission. Never invent facts beyond the attached sources.

SOURCES
PRIMARY: Stevens & Rago, "Advanced Programming in the UNIX Environment," 3rd ed., Chapter 8 "Process Control."
SECONDARY: "Lec02 — Processes" (2026-09-10). Real terms/examples: fork() returns twice (child PID in parent, 0 in child, negative on error), "Program with weakest set of assumptions possible" (fork's scheduling order between parent/child is never guaranteed), the "Brain Melting with fork" family-tree exercises (nested fork() inside a for-loop, with break on child_pid==0 vs. child_pid!=0 producing different process trees), and the demonstration that a forked child gets an independent copy of a variable's value (parent and child print different values for the same variable address after each modifies it).
BACKGROUND: Lab 01 ("fork, exec & wait" — titled "Lab 3" inside the file itself, a real numbering inconsistency, not something to silently fix) — its fork.c example shows the canonical if/else-if/else error-check pattern for fork()'s three return cases.

THIS IS PART 1 OF 2. A follow-up prompt covers exec, wait, zombies/orphans/daemons, and the whole-chapter wrap.

SCOPE
Cover every part of Chapter 8 discussing process identifiers and the fork function. Find the book's own subsection numbers from the PDF.

OUTPUT
One ### subheading per numbered subsection, book's own numbers/titles verbatim. Every distinct claim/example/function signature must appear in some form — fork()'s copy-on-write semantics and the parent/child return-value distinction must be covered in full. Reproduce code excerpts as fenced blocks. **Bold** named functions/concepts on first use only. Exactly one ==highlight== for the single most important claim (fork's dual-return-value semantics is the likely candidate). *label:* italics for sub-labels. Cite page numbers for direct definitions, in parentheses. No marketing language. Zero blank lines between heading and content or between list items.

Return the entire response as a single fenced markdown code block, nothing before or after it.
```
#### Part 2 of 2 — exec, wait, zombies/orphans/daemons + whole-chapter wrap
```
PART 2 OF 2 for this chapter, same rules: never invent facts beyond the sources, personal study note not a graded submission.

SCOPE — FIRST HALF
Cover every part of Chapter 8 discussing the exec function family and wait/waitpid. Real lecture grounding: Lec03 names the real six exec variants in pairs — execl (individual args, not array), execle/execve ("e" adds custom environment), execlp/execvp ("p" searches PATH for the program name), execvpe (PATH search plus custom environment) — and states exec never returns unless an error occurred, overwriting the calling process's code/stack/PC but preserving open file descriptors. Lec02/Lec03 cover wait() as a blocking call (process moves to Blocked state until a child exits) vs. waitpid() with the WNOHANG option to poll instead of block. One ### subheading per numbered subsection.

SCOPE — SECOND HALF: whole-chapter wrap
Using everything from this message and the previous message, add:
## Chapter Summary — one sentence claim, exactly one ==highlight==, then "*Mechanism:*" paragraph.
## Key Concepts — every named term/function from the whole chapter, **bolded** on first use — including zombie process, orphan process, and daemon process (Lec03's three-way distinction: a zombie is a child that exited before its parent called wait; an orphan is a child whose parent exited first and gets adopted by init/systemd, PID 1, which can't be killed; a daemon is a process whose parent deliberately forks and never waits, e.g. httpd/lpd/sshd).
## Worked Example — a full fork/exec/wait sequence tracing process states (New→Ready→Running→Blocked→Done) end to end, using Lec02's state-diagram terms.
## Connections — Lecture: name Lec02 and Lec03 specifically and which real exec-variant grouping/zombie-orphan-daemon distinction came from slides vs. only the book; also flag Lab 01's real fork.c/wait_stat.c code pattern (WIFEXITED/WEXITSTATUS/WIFSIGNALED/WTERMSIG macros) as lab-only content the lecture didn't cover. Textbook: "(pending Chapter 3)".
## Open Questions — 3–5 Markdown tasks.
## Flashcards — 5–8 cards, mechanisms not labels: "Question::Answer #cards/ai".

RULES
Highlight budget: this part's first-half sections get zero new ==highlights==; the five wrap sections each get exactly one. Page-cite direct definitions. *label:* italics for sub-labels. No marketing language. Zero blank lines between heading and content or between list items.

Return the entire response as a single fenced markdown code block, nothing before or after it.
```

### Chapter 3 — File I/O (Week 2, grounded in Lecture 3 — 9/15 and Lecture 4 — 9/17 "More Input/Output") — plus real cross-chapter content from Ch4 §4.5–4.9 and Ch5
**Read the warning above the Chapter list before running this one — it's the prompt most affected by the cross-chapter discovery.** Real anchors: `open()`'s two signatures and its real flag list (`O_RDONLY`/`O_WRONLY`/`O_RDWR`, `O_CREAT`/`O_TRUNC`/`O_APPEND`/`O_EXCL`), `read()`/`write()` as `ssize_t`-returning, byte-counted (not "element"-counted like `fread`/`fwrite`), never guaranteed to process the full requested count, the "reading/writing in chunks" loop pattern, `STDIN_FILENO`/`STDOUT_FILENO`/`STDERR_FILENO` = 0/1/2, the three-level **process file descriptor table → system file table → inode table** model (with reference counts, and the exact worked exercise of two unrelated processes opening the same file getting two independent system-file-table entries vs. a `fork()`'d parent/child sharing one), `dup()`/`dup2()` and the real shell-redirection worked example (`ls -l > ls_out.txt` traced as `fork` + `open` + `dup2(fd, STDOUT_FILENO)` + `exec`), and the pipe/`ls -l | sort` foreshadowing plus the real Doug McIlroy `tr | tr | sort | uniq -c | sort -rn | head` word-frequency pipeline (contrasted against Knuth's from-scratch solution) as the "Unix philosophy" payoff. **Real cross-chapter blending, cite explicitly in the note:** file permission bits (`chmod`, octal `rwxrwxrwx`, `S_IRUSR`/`S_IWUSR`/`S_IXUSR` etc. used as `open()`'s third argument) is APUE **§4.5–4.9**, not Ch3. Buffering (fully-buffered/line-buffered/unbuffered, `fflush()`, `fsync()`, the real `stdout`-vs-`stderr` interleaving example) is APUE **Chapter 5**, not Ch3. Upload: `APUE Ch3.pdf` **plus** `APUE Ch4.pdf` (for the permissions sections only) **plus** `APUE Ch5.pdf` (for the buffering sections only) — three uploads, one Gemini Notebook, since the lecture itself blends all three. `Lecture/Week - 2/Lec03.pdf`, `Lecture/Week - 2/Lec04.pdf`.
#### Part 1 of 3 — open/read/write core (Ch3)
```
You are producing a source-grounded personal Obsidian study note, not a graded submission. Never invent facts beyond the attached sources.

SOURCES
PRIMARY: Stevens & Rago, "Advanced Programming in the UNIX Environment," 3rd ed., Chapter 3 "File I/O."
SECONDARY: "Lec03 — Process Management, I/O" (2026-09-15, I/O portion) and "Lec04 — More Input/Output" (2026-09-17). Real terms: open()'s two signatures (with/without a mode argument), the real flag names O_RDONLY/O_WRONLY/O_RDWR/O_CREAT/O_TRUNC/O_APPEND/O_EXCL, fopen()'s "w" mode being exactly equivalent to O_CREAT|O_WRONLY|O_TRUNC, read()/write() as ssize_t-returning and byte-counted not "element"-counted like fread/fwrite, and the real "reading/writing in chunks" while-loop pattern from the ABCDEFGHIJ buffer-of-4 walkthrough.

THIS IS PART 1 OF 3. Follow-up prompts cover the fd-table/dup2/redirection model, then the real cross-chapter permissions/buffering content plus the whole-chapter wrap.

SCOPE
Cover every part of Chapter 3 discussing the open function and the read/write functions, including STDIN_FILENO/STDOUT_FILENO/STDERR_FILENO. Find the book's own subsection numbers from the PDF.

OUTPUT
One ### subheading per numbered subsection, book's own numbers/titles verbatim. Every distinct claim/example/function signature must appear in some form, including every named flag constant. Reproduce code excerpts as fenced blocks. **Bold** named functions/concepts on first use only. Exactly one ==highlight== for the single most important claim (the file-descriptor-as-small-integer model, or read/write's non-guarantee of processing the full requested count, are strong candidates). *label:* italics for sub-labels. Cite page numbers for direct definitions, in parentheses. No marketing language. Zero blank lines between heading and content or between list items.

Return the entire response as a single fenced markdown code block, nothing before or after it.
```
#### Part 2 of 3 — file descriptor tables, dup2, and redirection (Ch3)
```
PART 2 OF 3 for this chapter, same rules: never invent facts beyond the sources, personal study note not a graded submission. Builds on Part 1 in this same chat.

THIS IS PART 2 OF 3. A follow-up prompt covers the real cross-chapter permissions/buffering content plus the whole-chapter wrap. Do not write those now.

SCOPE
Cover every part of Chapter 3 discussing file sharing between processes, atomic operations, and the dup/dup2 functions. Ground the explanation in the real three-level model the lecture diagrammed explicitly: process file descriptor table → system file table (holds file offset, access mode, reference count) → inode table (holds file metadata, shared by every process that opens that physical file). Cover both worked exercises from the lecture precisely: (a) two unrelated processes independently open() the same file — each gets its own system-file-table entry with reference count 1 and an independent offset; (b) a single process open()s a file then fork()s — parent and child share ONE system-file-table entry and therefore one file offset, so a read() or write() in either process advances the position for both (walk through the exact "ABCDEFGH" 8-byte read-then-write scenario from the slides, including the race-condition outcome where the child's read can fail at end-of-file and its buffer's uninitialized garbage gets written). Also cover dup() vs. dup2() precisely, including that dup2 auto-closes its target fd if occupied.

OUTPUT
One ### subheading per numbered subsection, every distinct claim/example/function present. Reproduce code as fenced blocks. **Bold** named functions on first use. Zero new ==highlights== in this part (Part 1 already used this response's highlight budget). *label:* italics for sub-labels. Page-cite direct definitions. No marketing language. Zero blank lines between heading and content or between list items.

Return the entire response as a single fenced markdown code block, nothing before or after it.
```
#### Part 3 of 3 — real cross-chapter content (permissions from Ch4, buffering from Ch5) + whole-chapter wrap
```
PART 3 OF 3 for this chapter, same rules: never invent facts beyond the sources, personal study note not a graded submission. Builds on Parts 1–2 in this same chat.

SCOPE — FIRST HALF: cross-chapter content the lecture pulled in
The lecture (Lec04) taught two topics that live in different book chapters, not Chapter 3 — cover both here anyway since the professor tested them alongside file I/O, but LABEL each subheading with its real chapter/section so the note stays honest about where the content actually lives:
(a) From APUE Chapter 4, §4.5–4.9 (file access permissions): the rwxrwxrwx user/group/other model, octal representation (400/200/100 for user r/w/x, etc.), the chmod command (both octal form like "chmod 700" and symbolic form like "chmod u+x"), and S_IRUSR/S_IWUSR/S_IXUSR/S_IRGRP/etc. as open()'s third argument when O_CREAT is set.
(b) From APUE Chapter 5 (Standard I/O Library): the three buffering modes (fully buffered — typically files, line buffered — stdin/stdout, unbuffered — stderr), fflush() (flushes a stdio user-space buffer to the kernel) vs. fsync() (forces a kernel buffer to disk), and the real stdout-vs-stderr interleaving example from the slides (printf("A"), printf("B"), fprintf(stderr,"Z"), printf("C\n")... produces "ZABC" because stdout waits for a newline while stderr writes immediately).
Give each its own ### subheading, e.g. "### 4.5-4.9 File Access Permissions (APUE Ch4, taught in the Ch3 week)" and "### Buffering (APUE Ch5, taught in the Ch3 week)".

SCOPE — SECOND HALF: whole-chapter wrap
Using everything from all three messages, add:
## Chapter Summary — one sentence claim, exactly one ==highlight==, then "*Mechanism:*" paragraph.
## Key Concepts — every named term/function from all three parts, **bolded** on first use.
## Worked Example — the real dup2()-based output-redirection exercise from Lec04: sketch code that forks a child, opens ls_out.txt, calls dup2(fd, STDOUT_FILENO), execs "ls -l", and has the parent wait() then print "Command Done" — explain why this makes ls "think it's printing to the screen" when it's really writing to the file, since both are just a write() system call to different destinations. Then note the pipe extension: "ls -l | sort" and the real Doug McIlroy word-frequency one-liner (tr -cs A-Za-z '\n' | tr A-Z a-z | sort | uniq -c | sort -rn | head -n 10) as the "Unix philosophy" payoff of composable small tools, contrasted against Knuth's from-scratch 10-page custom-data-structure solution to the same problem.
## Connections — Lecture: name Lec03 and Lec04 specifically, and explicitly call out that the permissions and buffering content belongs to Ch4/Ch5, not Ch3 — this is the chapter where that distinction matters most. Textbook: "(pending Chapter 10)".
## Open Questions — 3–5 Markdown tasks.
## Flashcards — 5–8 cards, mechanisms not labels: "Question::Answer #cards/ai".

RULES
Highlight budget: this part's cross-chapter sections get zero new ==highlights==; the five wrap sections each get exactly one. Page-cite direct definitions, and cite the correct chapter number for the cross-chapter content. *label:* italics for sub-labels. No marketing language. Zero blank lines between heading and content or between list items.

Return the entire response as a single fenced markdown code block, nothing before or after it.
```

### Chapter 10 — Signals (Week 3, grounded in Lecture 5 — 9/22 "Signals" and Lecture 6 — 9/24 "More Signals, File Systems") — plus Lab 02's shell/job-control framing
Real anchors: signal vs. interrupt (software notification vs. hardware notification), the real signal table Kolb gave — **SIGINT=2 (Ctrl-C, default terminate), SIGFPE=8 (divide by zero, usually terminate), SIGKILL=9 (terminate, un-ignorable), SIGTERM=15 (terminate), SIGCHLD=17 (child terminated, default ignore), SIGCONT=18 (resume), SIGSTOP=19 (pause, un-ignorable)** — explicitly flagged as "don't memorize the numbers, use symbolic names, run `kill -L` for the real table," `SIGUSR1`/`SIGUSR2` as the two names reserved for custom meanings, `kill(pid_t, int)` (misleadingly named — it *sends* a signal, doesn't necessarily kill), the signal lifecycle diagram (Generated → Pending → {Blocked → Delivered} → {Terminates, Pauses, Ignored, Caught}), pending-signal coalescing (a second instance of an already-pending signal type is silently dropped), `sigset_t` + `sigemptyset`/`sigfillset`/`sigaddset`/`sigdelset`/`sigismember`, `sigprocmask()` with `SIG_BLOCK`/`SIG_UNBLOCK`/`SIG_SETMASK`, the "critical section" pattern (block → run → unblock), `sigaction()` replacing the deprecated `signal()` ("signal() is bad — always use sigaction() instead," Batman-slap meme slide), `struct sigaction`'s three fields (`sa_handler`, `sa_mask`, `sa_flags`), `SIG_DFL`/`SIG_IGN`, the three "Tricky Items" — (1) `SA_RESTART` and the historical fast/slow syscall distinction plus the `EINTR`/`errno` restart-loop idiom, (2) saving/restoring `errno` inside a handler since a handler can run mid-way through unrelated code that already set `errno`, (3) non-reentrant functions (`printf`, `malloc`, `free`, `strtok` named explicitly as unsafe to call inside a handler) — signals-and-fork inheritance (mask/dispositions/handlers copied, but delivery is independent per process) vs. signals-and-exec (mask and ignored-set survive, but caught signals reset to default), `sleep()`/`nanosleep()`, `pause()`, and the real motivating bug for `sigsuspend()` (a signal arriving between `sigprocmask(SIG_UNBLOCK)` and `pause()` gets missed — `sigsuspend()` makes unblock-and-wait atomic). Lab 02 adds the shell-level framing: `SIGTSTP` (Ctrl-Z, pause), job control (`jobs`/`fg %1`/`bg %1`/`kill %1`), and the real `print_nums` while-loop demo. Upload: `APUE Ch10.pdf`, `Lecture/Week - 3/Lec05.pdf`, `Lecture/Week - 3/Lec06.pdf`, `Labs/CSCI 4061 Lab 02.pdf`.
#### Part 1 of 3 — signal concepts, sending, and the lifecycle (Lec05)
```
You are producing a source-grounded personal Obsidian study note, not a graded submission. Never invent facts beyond the attached sources.

SOURCES
PRIMARY: Stevens & Rago, "Advanced Programming in the UNIX Environment," 3rd ed., Chapter 10 "Signals" — the longest chapter this course assigns, split into three parts.
SECONDARY: "Lec05 — Signals" (2026-09-22). Real terms: signal vs. interrupt (software vs. hardware notification), the real numbered table (SIGINT=2/SIGFPE=8/SIGKILL=9/SIGTERM=15/SIGCHLD=17/SIGCONT=18/SIGSTOP=19 — flagged in the slide itself as "don't memorize the numbers, use symbolic names from signal.h, run kill -L for the real table"), SIGUSR1/SIGUSR2 as the two reserved-for-custom-use names, kill(pid_t, int) sending (not necessarily killing) a signal, the signal lifecycle diagram (Generated → Pending → Delivered → {Terminates/Pauses/Ignored}), and pending-signal coalescing (a second instance of an already-pending signal type is silently dropped, so you can never know how many times a signal actually fired).
BACKGROUND: Lab 02 ("Signals & I/O Redirection") — its shell-level framing: SIGTSTP (Ctrl-Z, pauses a process), job control commands (jobs, fg %1, bg %1, kill %1), and the print_nums while(1){printf;sleep(1);} demo showing Ctrl-C terminating vs. Ctrl-Z pausing vs. fg resuming exactly where it left off.

THIS IS PART 1 OF 3. Follow-up prompts cover blocking/masks/critical-sections, then sigaction/handlers/the three Tricky Items/sigsuspend, then the whole-chapter wrap.

SCOPE
Cover every part of Chapter 10 discussing the introduction to signals, signal concepts, the (deprecated) signal function, and sending signals with kill/raise. Find the book's own subsection numbers from the PDF.

OUTPUT
One ### subheading per numbered subsection, book's own numbers/titles verbatim. Every distinct claim/example/function signature must appear in some form. Reproduce code excerpts as fenced blocks. **Bold** named functions/concepts on first use only. Exactly one ==highlight== for the single most important claim (signal delivery as asynchronous interruption is a strong candidate). *label:* italics for sub-labels. Cite page numbers for direct definitions, in parentheses. No marketing language. Zero blank lines between heading and content or between list items.

Return the entire response as a single fenced markdown code block, nothing before or after it.
```
#### Part 2 of 3 — blocking, masks, critical sections, sigaction, handlers, and the three Tricky Items (Lec05 + Lec06)
```
PART 2 OF 3 for this chapter, same rules: never invent facts beyond the sources, personal study note not a graded submission. Builds on Part 1 in this same chat.

SOURCES ADDITION
"Lec06 — More Signals, File Systems" (2026-09-24, signals portion). Real terms this part must ground: struct sigaction's three fields (sa_handler — a function pointer of type void(*)(int); sa_mask — signals to block while the handler itself runs; sa_flags), SIG_DFL/SIG_IGN as built-in handler values, and the "signal() is bad, always use sigaction()" framing (more portable, POSIX-standard, eliminates entire bug categories). The three named "Tricky Items": (1) SA_RESTART and the historical fast-vs-slow syscall distinction — before SA_RESTART, a signal arriving mid-syscall could abort it with errno==EINTR, requiring an ugly do/while retry loop; SA_RESTART makes POSIX systems retry automatically. (2) errno is a single global variable, and a handler that calls a function which sets errno (e.g. stat()) can corrupt the errno value the interrupted main-line code was about to check with perror() — the fix is saving/restoring errno at the top/bottom of the handler. (3) Non-reentrant functions: printf(), malloc(), free(), strtok() are all named explicitly as unsafe to call inside a signal handler, because a signal can interrupt a call to one of these functions already in progress in main-line code.

THIS IS PART 2 OF 3. A follow-up prompt covers sleep/pause/sigsuspend, signals+fork/exec, plus the whole-chapter wrap. Do not write those now.

SCOPE
Cover every part of Chapter 10 discussing blocking and unblocking signals (sigprocmask, sigset_t and its manipulation functions sigemptyset/sigfillset/sigaddset/sigdelset/sigismember), signal sets, and installing signal handlers with sigaction — including the "critical section" pattern (block signals, run code that must not be interrupted, unblock) and the three Tricky Items above. Find the real subsection numbers from the PDF.

OUTPUT
One ### subheading per numbered subsection, every distinct claim/example/function present. Reproduce code as fenced blocks, including the "Ignoring SIGINT" and "Running our Own Function" sigaction() examples from the slides verbatim in structure (not copied text, reconstructed from the pattern). **Bold** named functions on first use. Zero new ==highlights== in this part (Part 1 already used this response's highlight budget). *label:* italics for sub-labels. Page-cite direct definitions. No marketing language. Zero blank lines between heading and content or between list items.

Return the entire response as a single fenced markdown code block, nothing before or after it.
```
#### Part 3 of 3 — sleep/pause/sigsuspend, signals+fork/exec, + whole-chapter wrap
```
PART 3 OF 3 for this chapter, same rules: never invent facts beyond the sources, personal study note not a graded submission. Builds on Parts 1–2 in this same chat.

SCOPE — FIRST HALF
Cover every part of Chapter 10 discussing sleep/nanosleep, pause, sigsuspend, and how signals interact with fork() and exec(). Real lecture grounding: fork() gives the child a copy of the parent's signal mask, dispositions, and installed handlers, but the two processes' signal deliveries are then fully independent; exec() keeps the mask and the ignored-set but resets any caught (custom-handler) signal type back to its default response, since the handler function's code no longer exists in the new process image. The real motivating bug for sigsuspend(): the old pattern of sigprocmask(SIG_BLOCK) → do work → sigprocmask(SIG_UNBLOCK) → pause() has a race — if the signal arrives in the gap between the unblock call and pause(), it's missed and pause() can wait forever; sigsuspend(sigmask) makes "restore this mask AND wait for a signal" a single atomic operation.

SCOPE — SECOND HALF: whole-chapter wrap
Using everything from all three messages, add:
## Chapter Summary — one sentence claim, exactly one ==highlight==, then "*Mechanism:*" paragraph.
## Key Concepts — every named term/function from all of Chapter 10, **bolded** on first use.
## Worked Example — a full SIGCHLD-handling reap loop: install a handler with sigaction (SA_RESTART set), have it call waitpid in a loop with WNOHANG, and explain why errno must be saved/restored if the handler calls anything that touches it.
## Connections — Lecture: name Lec05 and Lec06 specifically, and which real terms (the numbered signal table, the three Tricky Items, sigsuspend's race-condition motivation) came from slides vs. only the book. Also note Lab 02's shell-level job-control framing (SIGTSTP, jobs/fg/bg/kill %N) as a practical, non-textbook complement to the syscall-level material. Textbook: "(pending Chapter 4 — File Systems, already previewed by Lec06, see that chapter's note)".
## Open Questions — 3–5 Markdown tasks.
## Flashcards — 5–8 cards, mechanisms not labels: "Question::Answer #cards/ai".

RULES
Highlight budget: this part's first-half sections get zero new ==highlights==; the five wrap sections each get exactly one. Page-cite direct definitions. *label:* italics for sub-labels. No marketing language. Zero blank lines between heading and content or between list items.

Return the entire response as a single fenced markdown code block, nothing before or after it.
```

### Chapter 4 — Files and Directories, Part 1 only (Week 3–4, grounded in Lecture 6 — 9/24, the File Systems half)
**Only Part 1 is promptable right now.** Lec06 previewed the start of Ch4 on 9/24 (storage devices, i-nodes, paths, directories), but the rest of the chapter (symbolic links, file times, `mkdir`/`rmdir`, reading directories with `opendir`/`readdir`) is genuinely Week 4 material that hasn't been lectured yet as of this pass — do not write a "grounded" Part 2 for it until `Lec07`/`Lec08` exist in the source folder; read them first, the same way this pass read Lec01–06. File-permission bits (§4.5–4.9) were already covered inside the Chapter 3 prompt above (Lec04 taught them early) — don't duplicate that content here. Real anchors for what Lec06 did cover: storage devices as arrays of fixed-size blocks (historically 512 bytes, now usually 4096 bytes — "makes for a good `read()` size"), device drivers as the OS's uniform read/write-block-i interface to specific hardware, file systems as the layer that hides "which blocks make up this file" from users, the hierarchical directory tree with `/` at the root, absolute vs. relative paths (`.` and `..`), `getcwd()`/`chdir()`, home directories and the `HOME` environment variable (`~` is shell-only shorthand, not usable in C — `getenv("HOME")` is the real C equivalent), i-nodes (metadata only — size, permissions, owner/group, and disk-block pointers; **not** the filename), the i-node's direct/single-indirect/double-indirect/triple-indirect pointer tree structure, the TB-vs-TiB byte-math aside (1 TB = 10^12 bytes by marketing convention, 1 TiB = 2^40 bytes for real), i-node numbers and the disk layout (`i-node "array"` region followed by `data blocks` region, viewable with `ls -li`), directories as a special kind of file whose contents are literally a list of `{name, i-node number}` entries, and the real step-by-step trace of what `open("/home/sun/hello.txt")` actually does (look up `/`'s known i-node, read `/` to find `home`'s i-node number, read `/home` to find `sun`'s, read `/home/sun` to find `hello.txt`'s). Upload: `APUE Ch4.pdf`, `Lecture/Week - 3/Lec06.pdf`.
#### Single prompt (short enough not to need splitting)
```
You are producing a source-grounded personal Obsidian study note, not a graded submission. Never invent facts beyond the attached sources.

SOURCES
PRIMARY: Stevens & Rago, "Advanced Programming in the UNIX Environment," 3rd ed., Chapter 4 "Files and Directories" — ONLY the file-system-fundamentals portion covered so far (storage devices, the file system's role, paths, i-nodes, directories). Do not cover symbolic links, file times, mkdir/rmdir, or reading directories (opendir/readdir) — those haven't been lectured yet, and file permission bits (§4.5-4.9) were already covered in the Chapter 3 note.
SECONDARY: "Lec06 — More Signals, File Systems" (2026-09-24, file-systems portion). Real terms: storage devices as arrays of fixed-size blocks (historically 512 bytes, now usually 4096 bytes, "makes for a good read() size"), device drivers as the uniform read/write-block-i interface, the hierarchical directory tree rooted at /, absolute vs. relative paths (leading '/' vs. not, '.' and '..'), getcwd()/chdir(), HOME environment variable and '~' as shell-only shorthand (getenv("HOME") is the real C equivalent), i-nodes storing metadata (size, permissions, owner/group, block pointers) but explicitly NOT the filename, the direct/single-indirect/double-indirect/triple-indirect pointer tree, the TB-vs-TiB aside (marketing 10^12 bytes vs. real 2^40 bytes), i-node numbers visible via "ls -li", and directories as files whose contents are {name, i-node number} entry lists.

SCOPE
Cover only: the file system's role relative to storage devices, absolute and relative pathnames, i-nodes and file metadata, and directories as name-to-inode mappings. Find the real subsection numbers from the PDF for whichever of these the book covers in this early part of the chapter.

STRUCTURE — output exactly these headings in this order:
# Chapter 4 (Part 1) — Files and Directories: File System Fundamentals
## Chapter Summary — one sentence claim, exactly one ==highlight==, then "*Mechanism:*" paragraph.
## Key Concepts — every named term, **bolded** on first use, one line each.
## Full Reading Notes — one ### subheading per numbered subsection, book's own numbers/titles verbatim. Every distinct claim/example/function signature must appear in some form.
## Worked Example — the real step-by-step trace of open("/home/sun/hello.txt") from Lec06's slides: known i-node for /, read / to find home's i-node number, read /home to find sun's, read /home/sun to find hello.txt's — reproduce all four steps with their i-node numbers as given in the example.
## Connections — Lecture: name Lec06 specifically and which real terms (the 512-vs-4096-byte aside, the TB-vs-TiB aside, the i-node pointer-tree diagram) came from slides vs. only the book. Textbook: "(pending the rest of Chapter 4 and Chapter 15.1-15.2 — not yet lectured as of 2026-09-24, write that prompt only after Lec07/Lec08 are read)".
## Open Questions — 3-5 Markdown tasks ("- [ ] ...").
## Flashcards — 5-8 cards, mechanisms not labels: "Question::Answer #cards/ai".

FORMATTING RULES
Zero blank lines between a heading and its content or between list items. **Bold** named functions/concepts on first use only. *label:* italics for sub-labels. No marketing language ("powerful," "comprehensive," "unlock," "leverage," "seamless"). Cite page numbers for direct definitions, in parentheses.

OUTPUT CONTRACT
Return the entire note as a single fenced Markdown code block (```markdown ... ```), nothing before or after it.
```

### Open flags — read before running any of the above
- **This file was completely rebuilt 2026-09-24** after the first draft's prompts turned out to be built from generic knowledge of the textbook's structure, not the real course materials. This version is grounded in all six real lecture PDFs and both real lab decks, read in full this session — every SECONDARY-source claim above traces to an actual slide.
- **Lab numbering is inconsistent in the source folder** — `Labs/Lab 01.pdf` is internally titled "Lab 3: fork, exec & wait" (dated 9/14, matching Week 2's first lab session), while `Labs/CSCI 4061 Lab 02.pdf` is internally titled "Lab 02: Signals & I/O Redirection." This is flagged inside the relevant prompts above rather than silently corrected — worth asking a TA about, since it may mean a "Lab 1" and "Lab 2" from an earlier version of the course got renumbered.
- **Subsection numbers still need a final check against your actual PDF.** Every prompt above tells Gemini to find the real numbers itself from the uploaded chapter rather than trusting a number I supply — this is safer than the first draft's guessed numbers, but skim each chapter's table of contents once before pasting, in case the book's own numbering surprises you.
- **Order of operations:** Chapters 1, 7, 8 (Weeks 1-2 lecture-confirmed) are ready to run now. Chapter 3 needs three source PDFs (Ch3 + Ch4 + Ch5) uploaded to the same Gemini Notebook chat because of the real cross-chapter blending — don't skip that setup step. Chapter 10 needs Ch10 plus Lab 02. Chapter 4 Part 1 is short and can run anytime; do not attempt a Part 2 until Lec07/Lec08 exist and get read the same way this pass read Lec01-06.
- **Once all seven prompts are run** and pasted back into their `Textbook/Chapter - [N].md` files, the next pass (separate, later task) is enrichment: reading each generated note against [[20_Progress/Degree/CSCI 4061/Weekly/Weekly Board|Weekly Board]] and re-checking it against the real lecture slides one more time to add any explanatory connective tissue a single Gemini pass won't have — not part of this prompt-writing pass.
- **Next course once CSCI 4061 is caught up:** CSCI 5304 is the strong next candidate — Trefethen & Bau's own chapters are literally called "Lectures" (1-31), and [[20_Progress/Degree/CSCI 5304/CSCI 5304 Board|CSCI 5304 Board]]'s Weekly Schedule already maps every one to a calendar week — but repeat this exact process (read the real lecture slides first) rather than reusing generic textbook knowledge again.
- **Correction, 2026-09-24:** this CSCI 5304 recommendation turned out to be wrong once checked. The real source folder (`D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Lecture`) has exactly **one** real file — `Week - 1\5304_Lecture_1_Notes.pdf` — Week 2 and Week 3 are empty folders, even though the Board's schedule table implies seven lectures should already exist. CSCI 5304 is not actually ready to ground yet. CSCI 4521 was picked instead (see below) and is now done; re-check CSCI 5304's real folder again before ever attempting it.

## CSCI 4521 — Lecture prompts, grounded in the real lecture slides (Lec 0.1, 1.2–1.5, Weeks 1–3, reviewed in full 2026-09-24)
Picked by the same two-part filter used for CSCI 4061: real lecture files actually sitting in the source folder for the target weeks, and zero existing chapter notes in the vault to duplicate. CSCI 5304 failed the first test (see correction above); CSCI 4511W and MGMT 3015 failed the second (both already have chapter/lecture notes written). CSCI 4521 passed both — `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Lectures\` has five real decks across Weeks 1-3, and [[20_Progress/Degree/CSCI 4521/Textbook/Textbook Map|CSCI 4521 Textbook Map]] confirms zero chapter notes exist as of 2026-09-15. All five were read in full this session: `Week - 1\0.1 course logistics, intro to ML.pptx.pdf`, `Week - 2\1.2 kNN, accuracy, overfitting.pptx.pdf`, `Week - 2\1.3 bayes classification, kNN.pptx.pdf`, `Week - 3\1.4 generalization, confusion matrix, accuracy, precision, recall, f1 score .pptx.pdf`, `Week - 3\1.5 kNN wrap up, kd trees, lsh, complexity, bias.pptx.pdf`.

**Real, verified discovery that changes the prompt design.** Unlike APUE for CSCI 4061, this course has no single textbook it walks through chapter by chapter. The slides themselves say "adapted from Stephen Guy and Shelby Ziccardi" — they're the professor's own original teaching material, built around whatever concept is being taught that day (kNN, then confusion matrices, then kd-trees), not a chapter's table of contents. ISL and DLB run alongside as separate background reading, assigned per-week in the Board's own Schedule table (Week 1: ISL 2.1, 2.3 + DLB 2.1-2.8, 3.1-3.3, 5.1 — Week 2: ISL 2.1, 2.2 + DLB 5.1, 5.2 — Week 3: ISL 2.2 only), not mapped one-to-one onto a lecture. So every prompt below treats the **lecture deck as PRIMARY** (it's this course's real "textbook") and cites the matching ISL/DLB sections as SECONDARY depth reading, and asks Gemini to organize "Full Reading Notes" around the **lecture's own real slide-section headings** (e.g., "Accuracy," "Overfitting," "How do we choose k?") rather than book subsection numbers, since a slide deck doesn't have those. This is a deliberate, evidence-based departure from the CSCI 4061 template, not a shortcut — note it in the note-file itself so a future read of this file doesn't assume the two courses' prompts should look identical.

> [!WARNING] Lecture 1.1 is missing from the source folder
> The Board's schedule puts LEC 1.1 ("intro to classification, nearest neighbor, normalization") on Week 1 Thursday, before LEC 1.2. LEC 1.2's own "Last time" recap slide confirms it happened — it references classifying wheat-seed data by nearest neighbor and a caution about distance measurements being sensitive to unit/magnitude scaling — but there is no `1.1*.pdf` anywhere in the local Lectures folder, only 0.1, 1.2, 1.3, 1.4, 1.5. **No grounded prompt is written for LEC 1.1 below** — do not invent one from general kNN knowledge. Find the real deck (Canvas, a classmate, or the professor) before writing that note; until then, LEC 1.2's recap slide is the only real secondhand evidence of what it covered.

> [!WARNING] Two more real artifacts worth knowing about before running these
> The `1.5` deck's title slide still says "Fall 2025" — a recycled-slide leftover, not a sign you have the wrong file. And `1.5` physically lives in the `Week - 3` folder even though the Board's schedule puts LEC 1.5 on Week 4 Tuesday — the professor is running slightly ahead of the printed schedule, or whoever saved the file filed it under the wrong week folder. Either way, don't let the folder name override what the deck itself says it covers.

### Lecture 0.1 — Course Logistics & Intro to ML
**SOURCES AND PRIORITY**
- Primary: `Week - 1\0.1 course logistics, intro to ML.pptx.pdf` — upload this file itself.
- Secondary: ISL 2.1 (what is statistical learning), DLB 2.1-2.8 (linear algebra refresher) — cite only where the deck actually touches these, don't force a link that isn't there.
**SCOPE:** The non-logistics content only — skip grading/policy slides entirely, this note is for course content, not admin. Cover: what machine learning is at the level this deck introduces it, and whatever early preview of unsupervised methods (clustering/PCA) the deck gives before the course dives into supervised classification in 1.1/1.2.
**STRUCTURE:** Lecture Summary, Key Concepts, Full Reading Notes (organized under the deck's own real section headings, found by you in the uploaded PDF — do not use headings I haven't verified), Connections (to ISL 2.1 if genuinely relevant), Open Questions, Flashcards (5-8).
**FORMATTING RULES:** One blank line between every block. Exactly one `==highlight==` per section, on the single most load-bearing sentence. Bold key terms on first use only. No marketing language ("powerful," "game-changing," "revolutionize"). Cite the real slide title/number for any factual claim.
**OUTPUT CONTRACT:** Return everything inside a single fenced markdown code block, nothing outside it.
*(Single part — this deck is short once logistics is excluded.)*

### Lecture 1.2 — kNN, Accuracy, Overfitting (Part 1 of 2)
**SOURCES AND PRIORITY**
- Primary: `Week - 2\1.2 kNN, accuracy, overfitting.pptx.pdf`.
- Secondary: ISL 2.2 (assessing model accuracy), DLB 5.1-5.2 (capacity, overfitting, underfitting) — Week 2's real assigned reading.
**SCOPE (Part 1):** Accuracy as a metric, what overfitting actually is and why it happens, and the standard defenses against it — the train/test split, leave-one-out and cross-validation, and penalizing overly flexible models. Stop before the deck's own kNN-mechanics section; that's Part 2.
**STRUCTURE:** Lecture Summary, Key Concepts, Full Reading Notes (use the deck's real section headings for Accuracy and Overfitting, found by you in the PDF), Worked Example (if the deck has a concrete accuracy/overfitting example, reproduce it faithfully; otherwise state none exists rather than inventing one), Connections (to ISL 2.2 / DLB 5.1-5.2), Open Questions, Flashcards (8-10 — this is dense material).
**FORMATTING RULES:** same as above (blank lines, one highlight per section, bold on first use, no marketing language, cite real slide numbers).
**OUTPUT CONTRACT:** single fenced markdown code block only.

### Lecture 1.2 — kNN, Accuracy, Overfitting (Part 2 of 2)
**SOURCES AND PRIORITY:** same primary/secondary as Part 1 — same chat, same uploaded PDF, no re-upload needed.
**SCOPE (Part 2):** The kNN algorithm itself as this deck introduces it — the classification rule, how k is chosen, what "perfect classifier" and unavoidable/irreducible error mean in this context, and the practical mechanics of automating/visualizing nearest-neighbor classification the deck walks through.
**STRUCTURE:** Full Reading Notes (kNN mechanics and the choosing-k discussion, deck's own headings), Worked Example (the deck's real kNN walkthrough, reproduced faithfully with its real numbers if it has one), Connections (forward to 1.3's Bayes-classifier framing of kNN — flag it as a preview, don't pre-explain Bayes here), Open Questions, Flashcards (6-8).
**FORMATTING RULES / OUTPUT CONTRACT:** identical to Part 1.

### Lecture 1.3 — Bayes Classification & kNN (Part 1 of 2)
**SOURCES AND PRIORITY**
- Primary: `Week - 2\1.3 bayes classification, kNN.pptx.pdf`.
- Secondary: same Week 2 reading (ISL 2.1-2.2, DLB 5.1-5.2) — this lecture and 1.2 share one week's assigned reading, so don't expect a clean one-lecture-to-one-reading mapping.
**SCOPE (Part 1):** The Bayes classifier itself — its derivation/definition as this deck presents it, and the Bayes Error Rate as the theoretical floor no classifier can beat. Stop before the deck connects this back to kNN.
**STRUCTURE:** Lecture Summary, Key Concepts, Full Reading Notes (deck's own Bayes-classifier headings), Worked Example (the deck's real Bayes-classifier example if one exists), Connections, Open Questions, Flashcards (6-8).
**FORMATTING RULES / OUTPUT CONTRACT:** identical to 1.2 Part 1.

### Lecture 1.3 — Bayes Classification & kNN (Part 2 of 2)
**SOURCES AND PRIORITY:** same as Part 1 — same chat.
**SCOPE (Part 2):** How this deck frames **kNN as an empirical estimate of the Bayes classifier**, the practical discussion of how to choose k this deck adds beyond 1.2's version, and the deck's introduction of the **bias-variance tradeoff** — what grows and what shrinks as k changes, and why neither extreme (k=1 vs. k=n) is good.
**STRUCTURE:** Full Reading Notes (kNN-as-empirical-Bayes, choosing k, bias-variance — deck's own headings), Connections (this is the conceptual hinge for 1.4's generalization discussion — flag it as setup, don't duplicate 1.4's content here), Open Questions, Flashcards (8-10 — bias-variance is the single most-tested idea in this course's early unit, be thorough).
**FORMATTING RULES / OUTPUT CONTRACT:** identical to Part 1.

### Lecture 1.4 — Generalization, Confusion Matrix, Precision/Recall/F1 (Part 1 of 2)
**SOURCES AND PRIORITY**
- Primary: `Week - 3\1.4 generalization, confusion matrix, accuracy, precision, recall, f1 score .pptx.pdf`.
- Secondary: ISL 2.2 — Week 3's entire assigned reading is this one section, so this prompt can lean harder on the primary deck than the others.
**SCOPE (Part 1):** What generalization means and the deck's own "dos and don'ts" for building a model that generalizes, the different flavors/variants of kNN this deck distinguishes, and the setup for binary classification as a problem this deck is about to formalize.
**STRUCTURE:** Lecture Summary, Key Concepts, Full Reading Notes (deck's own headings for generalization and kNN variants), Connections (back to 1.3's bias-variance framing), Open Questions, Flashcards (6-8).
**FORMATTING RULES / OUTPUT CONTRACT:** identical to prior lectures.

### Lecture 1.4 — Generalization, Confusion Matrix, Precision/Recall/F1 (Part 2 of 2)
**SOURCES AND PRIORITY:** same as Part 1 — same chat.
**SCOPE (Part 2):** The confusion matrix itself (true/false positive/negative, Type I vs. Type II error), and precision, recall, F1, and F-beta scores built from it — including the deck's real worked example applying these metrics (the deck uses a COVID-testing-style scenario; reproduce its actual numbers and framing rather than a generic substitute).
**STRUCTURE:** Full Reading Notes (confusion matrix and each metric, deck's own headings), Worked Example (the deck's real classification-metrics example, full numbers), Connections (why accuracy alone, from 1.2, is insufficient — this is the direct payoff of that earlier gap), Open Questions, Flashcards (8-10).
**FORMATTING RULES / OUTPUT CONTRACT:** identical to Part 1.

### Lecture 1.5 — kNN Wrap-up, KD-Trees, LSH, Complexity, Bias (Part 1 of 3)
**SOURCES AND PRIORITY**
- Primary: `Week - 3\1.5 kNN wrap up, kd trees, lsh, complexity, bias.pptx.pdf` (see the two warnings above about this file's "Fall 2025" title slide and its Week-3-folder/Week-4-schedule mismatch before uploading it).
- Secondary: none newly assigned — this deck closes out the unit that started in 1.2/1.3, so treat ISL 2.1-2.2 as still-relevant background rather than fresh reading.
**SCOPE (Part 1):** Parametric vs. non-parametric models, and model complexity vs. flexibility as this deck distinguishes them — the conceptual close-out of the kNN unit before the deck turns to kNN's computational cost.
**STRUCTURE:** Lecture Summary, Key Concepts, Full Reading Notes (deck's own headings), Connections (ties together 1.2's overfitting and 1.3's bias-variance into one parametric/non-parametric framing), Open Questions, Flashcards (6-8).
**FORMATTING RULES / OUTPUT CONTRACT:** identical to prior lectures.

### Lecture 1.5 — kNN Wrap-up, KD-Trees, LSH, Complexity, Bias (Part 2 of 3)
**SOURCES AND PRIORITY:** same as Part 1 — same chat.
**SCOPE (Part 2):** kNN's real computational complexity as this deck derives it (the brute-force cost and the improved costs from better data structures), then KD-trees and Locality Sensitive Hashing as the two speedups the deck presents — their actual mechanism, not just their names. Have Gemini extract the real complexity notation from the deck's own slides rather than assuming a specific big-O form.
**STRUCTURE:** Full Reading Notes (complexity, KD-trees, LSH — deck's own headings and notation), Worked Example (the deck's real KD-tree or LSH walkthrough if one exists), Connections, Open Questions, Flashcards (8-10 — this is the most technically dense part of the deck).
**FORMATTING RULES / OUTPUT CONTRACT:** identical to Part 1.

### Lecture 1.5 — kNN Wrap-up, KD-Trees, LSH, Complexity, Bias (Part 3 of 3)
**SOURCES AND PRIORITY:** same as Parts 1-2 — same chat.
**SCOPE (Part 3):** The deck's ethics/bias-in-ML section — the named categories of bias it teaches (the deck names five: Confirmation, Historical, Selection/Sampling, Survivorship, and Availability bias) and whatever real example the deck attaches to each. This is graded material (per the Board, ethics content shows up on quizzes), so completeness here matters more than brevity.
**STRUCTURE:** Full Reading Notes (one subsection per named bias type, each with its real example from the deck — do not substitute a generic example if the deck's own differs), Connections (to earlier data-quality assumptions made casually in 1.2-1.4, e.g. what "representative" training data actually requires), Open Questions, Flashcards (one per bias type minimum, 5-8 total).
**FORMATTING RULES / OUTPUT CONTRACT:** identical to Parts 1-2.

### Open flags — read before running any of the above
- **Naming departs from CSCI 4061 on purpose.** File the generated notes as `Textbook/Lecture - 0.1.md`, `Lecture - 1.2.md`, etc. (matching the professor's own LEC numbering from the Board's schedule table), not `Chapter - N.md` — this course has no chapters to name them after. CSCI 4521's Textbook folder currently has zero notes, so this doesn't collide with anything.
- **Lecture 1.1 has no grounded prompt** — its real deck isn't in the source folder. Track down the actual file before writing that note; don't fill the gap with generic kNN-intro content.
- **Reading assignments are per-week, not per-lecture** — the Board's Schedule table bundles both weekly lectures under one reading list (e.g., Week 2's ISL 2.1-2.2 + DLB 5.1-5.2 covers both 1.2 and 1.3 together), so the SECONDARY sources repeat across a week's two prompts by design, not by mistake.
- **Order of operations:** 0.1 is standalone and can run anytime. 1.2 and 1.3 share Week 2's reading — run them in the same or adjacent sessions so the bias-variance thread stays connected. 1.4 and 1.5 both belong to Week 3; 1.5 needs three parts given how much real technical content (complexity, KD-trees, LSH, five bias types) is packed into one deck.
- **This file now has two courses ready to run in parallel** — CSCI 4061 above and CSCI 4521 here — matching the intent of running two Gemini Notebook chats side by side. No third course has been requested yet; don't get ahead of what's actually been asked.
