---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "CSCI 4061 textbook notes refinement build 1"
started_at: 2026-09-29T13:24:27
ended_at: 2026-09-29T17:15:08
exported_at: 2026-10-17T21:07:00
duration_minutes: 230.7
project: Jarvis
cwd: 'D:\_Anant\20_Progress\Documents\Jarvis'
session_id: d25f538d-985d-4fa1-bd5a-07daac3a197b
status: raw
turn_count: 6
tools_used:
  AskUserQuestion: 1
  Bash: 81
  Edit: 22
  Glob: 12
  Read: 48
  Write: 11
tokens:
  input: 614
  output: 459122
  cache_creation: 2722381
  cache_read: 117353159
  total: 120535276
cost_usd: 38.952604
model:
  - "claude-sonnet-5"
files_touched:
  - "C:\\Users\\anant\\.claude\\projects\\D---Anant-20-Progress-Documents-Jarvis\\d25f538d-985d-4fa1-bd5a-07daac3a197b\\tool-results\\b8g8fjvxm.txt"
  - "C:\\Users\\anant\\AppData\\Local\\Temp\\apue\\Lec01.txt"
  - "C:\\Users\\anant\\AppData\\Local\\Temp\\apue\\Lec02.txt"
  - "C:\\Users\\anant\\AppData\\Local\\Temp\\apue\\Lec03.txt"
  - "C:\\Users\\anant\\AppData\\Local\\Temp\\apue\\Lec04.txt"
  - "C:\\Users\\anant\\AppData\\Local\\Temp\\apue\\Lec05.txt"
  - "C:\\Users\\anant\\AppData\\Local\\Temp\\apue\\Lec06.txt"
  - "D:\\_Anant\\10_Areas\\UMN\\Classes\\CSCI\\CSCI 4061\\csci4061-fa26\\.devcontainer\\devcontainer.json"
  - "D:\\_Anant\\10_Areas\\UMN\\Classes\\CSCI\\CSCI 4061\\csci4061-fa26\\Labs\\lab01-code\\QUESTIONS.txt"
  - "D:\\_Anant\\10_Areas\\UMN\\Classes\\CSCI\\CSCI 4061\\Lecture\\Transcripts\\Week 1 - 3\\en-CSCI 4061 September 8 lecture (multi-source).txt"
  - "D:\\_Anant\\10_Areas\\UMN\\Classes\\CSCI\\CSCI 4061\\Textbook\\Advanced Programming in the UNIX Environment, 3rd Edition.pdf"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4061\\CSCI 4061 Board.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4061\\Labs\\Lab - 2.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4061\\Preparation.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4061\\Textbook\\Chapter - 1.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4061\\Textbook\\Chapter - 10.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4061\\Textbook\\Chapter - 3.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4061\\Textbook\\Chapter - 4.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4061\\Textbook\\Chapter - 7.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4061\\Textbook\\Chapter - 8.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4061\\Textbook\\Textbook Map.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4061\\Weekly\\Week - 1.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4061\\Weekly\\Week - 2.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4061\\Weekly\\Week - 3.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4061\\Weekly\\Week - 4.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4061\\Weekly\\Weekly Board.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4511W\\Textbook\\Chapter - 2.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4511W\\Weekly\\Week - 2.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4511W\\Weekly\\Week - 3.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\Repetitive Things.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Documents\\Jarvis\\PLACEHOLDER.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Standards\\Courses\\Textbook Standard.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Standards\\Courses\\Weekly Board Standard.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Standards\\Courses\\Weekly Standard.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Templates\\Classes\\Textbook Template.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Templates\\Classes\\Week Template.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Workflows\\Courses\\Course Production Workflow.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Workflows\\Courses\\Textbook Workflow.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Workflows\\Courses\\Weekly Workflow.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\40_Resources\\UMN\\Previous Classes\\Minor\\MGMT 3001\\Week - 9.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\60_Claude\\07_AI_Information\\Jarvis Writing and Formatting.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\HUMAN_WRITING.md"
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# CSCI 4061 textbook notes refinement build 1

## You

Working on the class CSCI 4061 in detail now. We are currently on week - 4. We do not have any of the weekly notes listed out at all so far. All the textbook notes have landed correctly for the weeks 1 - 3 over here from notebook: `20_Progress/Degree/CSCI 4061/Textbook`. I need you to go through the files over here in detail and analyze the textbook which is in the original folder mentioned over here: `20_Progress/Degree/CSCI 4061/CSCI 4061 Board`. Gather all the content required for this task to run. There are tons of builds going to take place in this session regarding this course. Laying out everything till week - 4 entirely. make sure to do this task correctly for all the weekly notes. I want everything done perfectly. Go through the code, pdf (slides & textbook), dev container, etc. Go through everything that has taken place the week and lay out the weekly note correctly based on the perfected textbook notes. So for this build to take place perfectly. We are going to first make sure that all the content that is written out inside the textbook folder is written out to be perfect content. We do not rewrite the entire file. We use the content that is already in the file and make sure to check it with the textbook. Add certain explanations at places which might be confusing with styling (`> [!NOTE]`). There are other things to make note of while perfecting these files created based of the prompt that was run in notebook. For this build to take place, you go through the textbook in detail yourself and make sure that the content is perfectly written out. Another thing to note is that we have run a lot of prompts to make these chapter notes. So there might be too many repeated headers in the file that needed to shortened out: flashcards, connections, etc. I need to at the max have 10 flashcards for each textbook note that is created. Rest all the other content that has been landed from the textbook remains exactly as it is with clear explanations where they belong and rephrasing some pargaraphs to be more direct. These notes are sort of a hlighlight of the textbook and explanations are thoughts written down by me for what has been copied from the textbook (almost the same way). We need to make sure that we write the content inside all the textbook folder notes correctly and laid out perfectly based on the system that has been established over here: `30_Order/Standards/Courses`, `30_Order/Workflows/Courses`. Go through the styling and human writing files to write and edit these files. I want you to only work on these files after gathering concrete content from the textbook regarding all the chapters that have been mentioned over here. There are in total 6 chapter notes that are created so far. So, this build is going to be done in 2 sessions. The first session (this one), is going to do only 2 chapters, focuses more on the research part of the textbook to gather content. Also, goes through the lecture slides. Skims through the content that is also provided to notebook to write these prompts. All the lectures have already landed, something that is going to be seen at later in detail is the code for labs and lecture. Let's do this in detail making sure that we relay everything correctly in the weekly note and some concept notes later on. Now, for the second build that will run - focus on the rest 4 chapter notes that are created. You have to do the same thing but make note of all the fixes that were done to first two files that were written out so far. After understanding exactly how these files need to be written out. Run through the next 4 textbook nootes. Go ahead and do the build 1 now. Make no mistakes, do not begin the task till you have gathered all the required content for this task. Execute it till you have reached the end goal of this build. The limit to this build first now is - build 1. Build 2 is done after some review is landed back to you. Execute the task perfectly without making mistakes, following rules and not shrinking the existing the content written out but making it more rich.

## Claude

I'll start by exploring the vault structure to understand what exists — the course folders, the standards docs, and the writing style guide — before touching any content.

Now I have enough grounding to write the perfected Chapter 1 note. Let me write it directly.

I made an errant file write — let me delete that immediately.

Good — cleaned up. Now writing Week 2's note properly.

Found one broken link — fixing it now.

All frontmatter is clean and valid. Build 1 is complete. Here's a summary of what landed:

**Chapters perfected (source-checked against the actual APUE PDF, page by page):**
- `Chapter - 1.md` — restored the missing `## Full Reading Notes` heading, removed duplicate template stubs, fixed frontmatter (real dates, correct `area:` links), added content that was genuinely missing from the original NotebookLM pass (the `ls`/error-output examples, the PID/shell-demo runs, the `time -p grep` numbers), added 3 `> [!NOTE]` explanations at the genuinely confusing spots (fork's "called once, returns twice," the thread-local `errno` macro, `malloc`/`sbrk`), trimmed to 7 flashcards under `#cards/csci4061`.
- `Chapter - 7.md` — same structural fixes, plus two **entire missing sections** restored from the book: §7.10 (`setjmp`/`longjmp`, the volatile-variable gotcha, the returned-stack-buffer bug) and §7.11 (`getrlimit`/`setrlimit`) — both had zero coverage in the original note despite being listed in Key Concepts. 8 flashcards.

**Weekly notes built from scratch** (none existed before except an empty Week‑1 scaffold), sourced from all 6 lecture PDFs and cross-checked against the actual reading:
- Week 1–3: fully captured and reconciled against lecture + textbook, each with the required six-part synthesis section.
- Week 4: honestly built as a **pre-lecture scaffold**, since today is 9/29 and that week's lectures haven't happened yet — no fabricated content.

**Index notes updated:** `Weekly Board.md` and `Textbook Map.md` now reflect real status, and `CSCI 4061 Board.md`'s `next:` field points at the real next action. Every place citing Chapters 3, 4, 8, or 10 (not touched this session) is flagged as provisional pending Build 2.

I also caught and fixed a couple of my own mistakes along the way: an accidental stray file (deleted), a broken wikilink in Week 4, and a missing required highlight in Chapter 7's summary.

Ready for your review before Build 2 (Chapters 3, 4, 8, 10).

### Tool Calls

- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && find "20_Progress/Degree/CSCI 4061" -type f | sort`
```
20_Progress/Degree/CSCI 4061/CSCI 4061 Board.md
20_Progress/Degree/CSCI 4061/Labs/Lab - 2.md
20_Progress/Degree/CSCI 4061/Preparation.md
20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1.md
20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10.md
20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3.md
20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4.md
20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7.md
20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8.md
20_Progress/Degree/CSCI 4061/Textbook/Textbook Map.md
20_Progress/Degree/CSCI 4061/Weekly/Week - 1.md
20_Progress/Degree/CSCI 4061/Weekly/Weekly Board.md
```
- `Glob` -- pattern `30_Order/Standards/Courses/**` path ``
- `Glob` -- pattern `30_Order/Workflows/Courses/**` path ``
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\CSCI 4061 Board.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Preparation.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Weekly Board.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Week - 1.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Textbook Map.md`
- `Bash` -- `find "D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061" -maxdepth 4 2>&1 | sort`
```
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/Labs
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/Labs/CSCI 4061 Lab 02.pdf
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/Labs/CSCI 4061 Lab 03.pdf
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/Labs/Lab 01.pdf
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/Lecture
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/Lecture/Transcripts
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/Lecture/Transcripts/Week 1 - 3
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/Lecture/Transcripts/Week 1 - 3/en-CSCI 4061 September 8 lecture (multi-source).txt
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/Lecture/Transcripts/Week 1 - 3/en-CSCI 4061-10 September 10 Lecture (multi-source).txt
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/Lecture/Transcripts/Week 1 - 3/en-CSCI 4061-10 September 15 Lecture (multi-source).txt
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/Lecture/Transcripts/Week 1 - 3/en-CSCI 4061-10 September 17 Lecture (multi-source).txt
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/Lecture/Transcripts/Week 1 - 3/en-CSCI 4061-10 September 22 Lecture (multi-source).txt
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/Lecture/Transcripts/Week 1 - 3/en-CSCI 4061-10 September 24 Lecture (multi-source).txt
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/Lecture/Week - 1
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/Lecture/Week - 1/Lec01.pdf
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/Lecture/Week - 1/Lec02.pdf
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/Lecture/Week - 2
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/Lecture/Week - 2/Lec03.pdf
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/Lecture/Week - 2/Lec04.pdf
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/Lecture/Week - 3
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/Lecture/Week - 3/Lec05.pdf
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/Lecture/Week - 3/Lec06.pdf
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/Midterm
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/Textbook
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/Textbook/Advanced Programming in the UNIX Environment, 3rd Edition.pdf
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/.devcontainer
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/.devcontainer/Dockerfile
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/.devcontainer/devcontainer.json
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/.devcontainer/postCreate.sh
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Labs
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Labs/lab01-code
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Labs/lab01-code/Makefile
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Labs/lab01-code/QUESTIONS.txt
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Labs/lab01-code/QUESTIONS.txt.bak
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Labs/lab01-code/fork_exec.c
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Labs/lab01-code/fork_wait.c
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Labs/lab01-code/sample.txt
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Labs/lab01-code/test_cases
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Labs/lab02-code
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Labs/lab02-code/Makefile
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Labs/lab02-code/QUESTIONS.txt
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Labs/lab02-code/QUESTIONS.txt.bak
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Labs/lab02-code/print_nums.c
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Labs/lab02-code/redirect_child.c
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Labs/lab02-code/test_cases
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Labs/lab03-code
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Labs/lab03-code/Makefile
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Labs/lab03-code/QUESTIONS.txt
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Labs/lab03-code/QUESTIONS.txt.bak
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Labs/lab03-code/test_cases
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Labs/lab03-code/wc_signal.c
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Lecture
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Lecture/lecture01-code
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Lecture/lecture01-code/Makefile
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Lecture/lecture01-code/array_threads_v1.c
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Lecture/lecture01-code/array_threads_v2.c
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Lecture/lecture01-code/hello_asm.s
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Lecture/lecture01-code/hello_print.c
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Lecture/lecture01-code/hello_write.c
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Lecture/lecture02-code
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Lecture/lecture02-code/Makefile
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Lecture/lecture02-code/fork_print.c
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Lecture/lecture03-code
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Lecture/lecture03-code/Makefile
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Lecture/lecture03-code/mini_shell.c
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Lecture/lecture03-code/strtok_demo.c
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Lecture/lecture03-code/write_points_stdio.c
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Lecture/lecture03-code/write_points_unix.c
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Lecture/lecture04-code
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Lecture/lecture04-code/Makefile
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Lecture/lecture04-code/fork_io.c
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Lecture/lecture04-code/test.txt
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Lecture/lecture05-code
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Lecture/lecture05-code/Makefile
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Lecture/lecture05-code/block_sigint.c
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Lecture/lecture05-code/ls_redirection.c
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Practice
D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061/csci4061-fa26/Projects
```
- `Glob` -- pattern `20_Progress/Degree/Repetitive Things*` path ``
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\Repetitive Things.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards\Courses\Textbook Standard.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards\Courses\Weekly Standard.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Workflows\Courses\Textbook Workflow.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Workflows\Courses\Weekly Workflow.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\HUMAN_WRITING.md`
- `Glob` -- pattern `30_Order/Templates/Courses/**` path ``
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Workflows\Courses\Course Production Workflow.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Labs\Lab - 2.md`
- `AskUserQuestion` -- `{"questions":[{"question":"Build 1 perfects 2 of the 6 existing chapter notes. Which 2 should this session prioritize?","header":"Chapter order","options":[{"label":"Chapter 1 + Chapter 7 (Recommended)","description":"Week 1\u0027s two core chapters (syscalls/intro + process management) — earliest in the reading order, and Week 1\u0027s weekly note already has a scaffold to build on."},{"label":"Chapter 1 + Chapter 8","description":"The other two Week 1 chapters, if you\u0027d rather finish Week 1\u0027s full chapter set before touching Week 2 material."},{"label":"Chapter 7 + Chapter 3","description":"The Week 2 pair, if Chapter 1 is already close enough to good and doesn\u0027t need a deep redo."},{"label":"Let me specify","description":"Name the two chapters directly (e.g. by number) if none of the above matches what you want."}]}]}`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Chapter - 1.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Chapter - 7.md`
- `Glob` -- pattern `**/Textbook Template*` path ``
- `Glob` -- pattern `**/Week Template*` path ``
- `Glob` -- pattern `**/Weekly Board Standard*` path ``
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards\Courses\Weekly Board Standard.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Templates\Classes\Textbook Template.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Templates\Classes\Week Template.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Chapter - 3.md`
- `Glob` -- pattern `20_Progress/Degree/CSCI 4511W/Textbook/**` path ``
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4511W\Textbook\Chapter - 2.md`
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && echo "--- Chapter 1 first commit ---" && git log --follow --diff-filter=A --format="%ad %h" --date=short -- "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1.md" && echo "--- Chapter 7 first commit ---" && git log --follow --diff-filter=A --format="%ad %h" --date=short -- "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7.md" && echo "--- last commits touching these ---" && git log -3 --format="%ad %h %s" --date=short -- "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1.md" "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7.md"`
```
--- Chapter 1 first commit ---
2026-09-26 ae08204e
--- Chapter 7 first commit ---
2026-09-26 ae08204e
--- last commits touching these ---
2026-09-26 ae08204e auto: 2026-09-26 14:54 | 139 files
```
- `Read` -- `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\Textbook\Advanced Programming in the UNIX Environment, 3rd Edition.pdf`
- `Bash` -- `which pdftotext pdftoppm python3 python 2>&1; python3 -c "import fitz" 2>&1; python3 -c "import pypdf" 2>&1; python3 -c "import PyPDF2" 2>&1`
```
The server-side auto mode classifier gave no verdict (error), so auto mode cannot determine the safety of Bash. This is a transient failure of the check, not a judgment about the action: a later response may get a verdict. You may try the action again once, as-is. Repeated attempts are slowed by a growing delay, and after 10 responses in a row without a verdict the turn stops. If it keeps failing, continue with other tasks that don't require this action and come back to it later. Note: reading files, searching code, and other read-only operations do not require the classifier and can still be used.
```
- `Bash` -- `which pdftotext pdftoppm python3 python 2>&1; python3 -c "import fitz" 2>&1; python3 -c "import pypdf" 2>&1; python3 -c "import PyPDF2" 2>&1`
```
Exit code 49
which: no pdftoppm in (/c/Users/anant/bin:/mingw64/bin:/usr/local/bin:/usr/bin:/bin:/mingw64/bin:/usr/bin:/c/Users/anant/bin:/c/WINDOWS/system32:/c/WINDOWS:/c/WINDOWS/System32/Wbem:/c/WINDOWS/System32/WindowsPowerShell/v1.0:/c/WINDOWS/System32/OpenSSH:/c/Program Files/NVIDIA Corporation/NVIDIA App/NvDLISR:/c/Program Files (x86)/NVIDIA Corporation/PhysX/Common:/c/Program Files/starship/bin:/c/Program Files/nodejs:/cmd:/c/Program Files/GitHub CLI:/c/Users/anant/.local/bin:/d/Apps/Hermes/bin:/c/Users/anant/AppData/Local/agy/bin:/c/Users/anant/AppData/Local/Programs/Jan/resources/bin:/c/Users/anant/AppData/Local/Microsoft/WindowsApps:/c/Users/anant/AppData/Local/PowerToys/DSCModules:/d/Apps/Microsoft VS Code/bin:/d/Apps/Cursor/resources/app/bin:/c/Users/anant/AppData/Local/Microsoft/WinGet/Packages/BurntSushi.ripgrep.MSVC_Microsoft.Winget.Source_8wekyb3d8bbwe/ripgrep-15.2.[REDACTED]:/c/Users/anant/AppData/Local/Microsoft/WinGet/Packages/Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe/ffmpeg-9.0.1-full_build/bin:/c/Users/anant/AppData/Local/Programs/Cua/cua-driver/bin:/c/Users/anant/AppData/Local/Programs/DockerDesktop/resources/bin:/c/Users/anant/AppData/Local/Programs/Ollama:/c/Users/anant/AppData/Local/Microsoft/WinGet/Links:/c/Users/anant/AppData/Roaming/npm:/d/Apps/Hermes/git/cmd:/d/Apps/Hermes/git/bin:/d/Apps/Hermes/git/usr/bin:/c/Users/anant/AppData/Local/Microsoft/WinGet/Packages/jqlang.jq_Microsoft.Winget.Source_8wekyb3d8bbwe:/d/AI/npm-global:/d/Apps/Obsidian:/usr/bin/vendor_perl:/usr/bin/core_perl)
/mingw64/bin/pdftotext
/c/Users/anant/AppData/Local/Microsoft/WindowsApps/python3
/c/Users/anant/AppData/Local/Microsoft/WindowsApps/python
Python was not found; run without arguments to install from the Microsoft Store, or disable this shortcut from Settings > Apps > Advanced app settings > App execution aliases.
Python was not found; run without arguments to install from the Microsoft Store, or disable this shortcut from Settings > Apps > Advanced app settings > App execution aliases.
Python was not found; run without arguments to install from the Microsoft Store, or disable this shortcut from Settings > Apps > Advanced app settings > App execution aliases.
```
- `Bash` -- `cd "D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\Textbook" && pdftotext -f 20 -l 30 -layout "Advanced Programming in the UNIX Environment, 3rd Edition.pdf" - | head -c 3000`
```
xviii Contents

21.5            Source Code 795

21.6            Summary 843

Appendix A. Function Prototypes              845

Appendix B. Miscellaneous Source Code        895

B.1             Our Header File 895

B.2             Standard Error Routines 898

Appendix C. Solutions to Selected Exercises  905

Bibliography                                 947

Index                                        955
Foreword to the Second Edition

At some point during nearly every interview I give, as well as in question periods after
talks, I get asked some variant of the same question: ``Did you expect Unix to last for so
long?'' And of course the answer is always the same: No, we didn't quite anticipate
what has happened. Even the observation that the system, in some form, has been
around for well more than half the lifetime of the commercial computing industry is
now dated.

     The course of developments has been turbulent and complicated. Computer
technology has changed greatly since the early 1970s, most notably in universal
networking, ubiquitous graphics, and readily available personal computing, but the
system has somehow managed to accommodate all of these phenomena. The
commercial environment, although today dominated on the desktop by Microsoft and
Intel, has in some ways moved from single-supplier to multiple sources and, in recent
years, to increasing reliance on public standards and on freely available source.

     Fortunately, Unix, considered as a phenomenon and not just a brand, has been able
to move with and even lead this wave. AT&T in the 1970s and 1980s was protective of
the actual Unix source code, but encouraged standardization efforts based on the
system's interfaces and languages. For example, the SVID--the System V Interface
Definition--was published by AT&T, and it became the basis for the POSIX work and
its follow-ons. As it happened, Unix was able to adapt rather gracefully to a networked
environment and, perhaps less elegantly, but still adequately, to a graphical one. And as
it also happened, the basic Unix kernel interface and many of its characteristic user-level
tools were incorporated into the technological foundations of the open-source
movement.

     It is important that papers and writings about the Unix system were always
encouraged, even while the software of the system itself was proprietary, for example
Maurice Bach's book, The Design of the Unix Operating System. In fact, I would claim that

                                                                                                                               xix
xx Foreword to the Second Edition

a central reason for the system's longevity has been that it has attracted remarkably
talented writers to explain its beauties and mysteries. Brian Kernighan is one of these;
Rich Stevens is certainly another. The first edition of this book, along with his series of
books about networking, are rightful
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash` -- `cd "D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\Textbook" && mkdir -p /tmp/apue 2>/dev/null; pdftotext -layout "Advanced Programming in the UNIX Environment, 3rd Edition.pdf" "/tmp/apue/full.txt" && wc -l /tmp/apue/full.txt && grep -n "UNIX Architecture" /tmp/apue/full.txt | head -5`
```
58298 /tmp/apue/full.txt
180:1.2         UNIX Architecture 1
1203:1.2 UNIX Architecture
57958:ttyname function, 137, 276, 442, 452, 695-696, 699  UNIX Architecture, 1-2
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash` -- `sed -n '1150,1260p' /tmp/apue/full.txt`
```
                I am especially grateful to Brian Kernighan for his help in the book. His numerous
          thorough reviews of the entire manuscript and his gentle prodding for better prose
          hopefully show in the final result. Steve Rago was also a great resource, both in
          reviewing the entire manuscript and answering many questions about the details and
          history of System V. My thanks to the other technical reviewers used by Addison-
          Wesley, who provided valuable comments on various portions of the manuscript:
          Maury Bach, Mark Ellis, Jeff Gitlin, Peter Honeyman, John Linderman, Doug McIlroy,
          Evi Nemeth, Craig Partridge, Dave Presotto, Gary Wilson, and Gary Wright.

                Keith Bostic and Kirk McKusick at the U.C. Berkeley CSRG provided an account
          that was used to test the examples on the latest BSD system. (Many thanks to Peter
          Salus too.) Sam Nataros and Joachim Sacksen at UHC provided the copy of SVR4 used
          to test the examples. Trent Hein helped obtain the alpha and beta copies of BSD/386.

                Other friends have helped in many small, but significant ways over the past few
          years: Paul Lucchina, Joe Godsil, Jim Hogue, Ed Tankus, and Gary Wright. My editor at
          Addison-Wesley, John Wait, has been a great friend through it all. He never complained
          when the due date slipped and the page count kept increasing. A special thanks to the
          National Optical Astronomy Observatories (NOAO), especially Sidney Wolff, Richard
          Wolff, and Steve Grandi, for providing computer time.

                Real Unix books are written using troff and this book follows that time-honored
          tradition. Camera-ready copy of the book was produced by the author using the groff
          package written by James Clark. Many thanks to James Clark for providing this
          excellent system and for his rapid response to bug fixes. Perhaps someday I will really
          understand troff footer traps.

                I welcome electronic mail from any readers with comments, suggestions, or bug
          fixes.

Tucson, Arizona                                                   W. Richard Stevens
April 1992                                               rstevens@kohala.com
                                    http://www.kohala.com/~rstevens
   1

    UNIX System Overview

1.1 Introduction

          All operating systems provide services for programs they run. Typical services include
          executing a new program, opening a file, reading a file, allocating a region of memory,
          getting the current time of day, and so on. The focus of this text is to describe the
          services provided by various versions of the UNIX operating system.

                Describing the UNIX System in a strictly linear fashion, without any forward
          references to terms that haven't been described yet, is nearly impossible (and would
          probably be boring). This chapter provides a whirlwind tour of the UNIX System from
          a programmer's perspective. We'll give some brief descriptions and examples of terms
          and concepts that appear throughout the text. We describe these features in much more
          detail in later chapters. This chapter also provides an introduction to and overview of
          the services provided by the UNIX System for programmers new to this environment.

1.2 UNIX Architecture

          In a strict sense, an operating system can be defined as the software that controls the
          hardware resources of the computer and provides an environment under which
          programs can run. Generally, we call this software the kernel, since it is relatively small
          and resides at the core of the environment. Figure 1.1 shows a diagram of the UNIX
          System architecture.

                The interface to the kernel is a layer of software called the system calls (the shaded
          portion in Figure 1.1). Libraries of common functions are built on top of the system call

                                                                                                                                             1
2 UNIX System Overview  Chapter 1

                                                                               applications

                                                                        shell
                                                                               system calls

                                                                                   kernel

                                                                             library routines

                                                  Figure 1.1 Architecture of the UNIX operating system

          interface, but applications are free to use both. (We talk more about system calls and
          library functions in Section 1.11.) The shell is a special application that provides an
          interface for running other applications.

                In a broad sense, an operating system consists of the kernel and all the other
          software that makes a computer useful and gives the computer its personality. This
          other software includes system utilities, applications, shells, libraries of common
          functions, and so on.

                For example, Linux is the kernel used by the GNU operating system. Some people
          refer to this combination as the GNU/Linux operating system, but it is more commonly
          referred to as simply Linux. Although this usage may not be correct in a strict sense, it
          is understandable, given the dual meaning of the phrase operating system. (It also has
          the advantage of being more succinct.)

1.3 Logging In

Login Name

          When we log in to a UNIX system, we enter our login name, followed by our password.
          The system then looks up our login name in its password file, usually the file
          /etc/passwd. If we look at our entry in the password file, we see that it's composed
          of seven colon-separated fields: the login name, encrypted password, numeric user ID
          (205), numeric group ID (105), a comment field, home directory (/home/sar), and shell
          program (/bin/ksh).

                  sar:x:205:105:Stephen Rago:/home/sar:/bin/ksh
                All contemporary systems have moved the encrypted password to a different file.
          In Chapter 6, we'll look at these files and some functions to access them.
Section 1.3                                                                             Logging In 3

Shells
```
- `Bash` -- `grep -n "^1\.[0-9]* \|^7\.[0-9]* \|^Chapter 2$\|^Chapter 8$\|System Calls and Library Functions\|Summary$" /tmp/apue/full.txt | sed -n '1,60p'`
```
178:1.1         Introduction 1
180:1.2         UNIX Architecture 1
182:1.3         Logging In 2
184:1.4         Files and Directories 4
186:1.5         Input and Output 8
188:1.6         Programs and Processes 10
190:1.7         Error Handling 14
192:1.8         User Identification 16
194:1.9         Signals 18
196:1.10        Time Values 20
198:1.11        System Calls and Library Functions 21
200:1.12        Summary 23
364:7.1           Introduction 197
366:7.2           main Function 197
368:7.3           Process Termination 198
370:7.4           Command-Line Arguments 203
372:7.5           Environment List 203
374:7.6           Memory Layout of a C Program 204
376:7.7           Shared Libraries 206
378:7.8           Memory Allocation 207
380:7.9           Environment Variables 210
382:7.10          setjmp and longjmp Functions 213
384:7.11          getrlimit and setrlimit Functions 220
386:7.12          Summary 225
1128:1. Unix System V/386 Release 4.0 Version 2.0 (``vanilla SVR4'') from U.H. Corp.
1188:1.1 Introduction
1203:1.2 UNIX Architecture
1243:1.3 Logging In
1330:1.4 Files and Directories
1548:1.5 Input and Output
1687:1.6 Programs and Processes
1896:1.7 Error Handling
2018:1.8 User Identification
2101:1.9 Signals
2220:1.10 Time Values
2224:1. Calendar time. This value counts the number of seconds since the Epoch:
2274:Section 1.11  System Calls and Library Functions 21
2276:1.11 System Calls and Library Functions
2395:1.12 Summary
2409:1.1 Verify on your system that the directories dot and dot-dot are not the same, except in the
2412:1.2 In the output from the program in Figure 1.6, what happened to the processes with process
2415:1.3 In Section 1.7, the argument to perror is defined with the ISO C attribute const, whereas
2418:1.4 If the calendar time is stored as a signed 32-bit integer, in which year will it overflow? How
2422:1.5 If the process time is stored as a signed 32-bit integer, and if the system counts 100 ticks per
4470:2.10 Summary
4680:1. The path parameter specifies an absolute pathname. In this case, the fd parameter is
6049:3.17  Summary
8867:4.26 Summary
10747:5.16  Summary
11820:6.11 Summary
11852:7.1 Introduction
11863:7.2 main Function
11883:7.3 Process Termination
12129:7.4 Command-Line Arguments
12173:7.5 Environment List
12219:7.6 Memory Layout of a C Program
12311:7.7 Shared Libraries
12358:7.8 Memory Allocation
12524:7.9 Environment Variables
12705:7.10 setjmp and longjmp Functions
```
- `Bash` -- `grep -n "^7\.1[12] \|^7\.12 Summary\|^Exercises$" /tmp/apue/full.txt | sed -n '1,10p'; echo "---"; sed -n '12705,12900p' /tmp/apue/full.txt`
```
384:7.11          getrlimit and setrlimit Functions 220
386:7.12          Summary 225
2407:Exercises
4483:Exercises
8878:Exercises
11831:Exercises
13091:7.11 getrlimit and setrlimit Functions
13401:7.12 Summary
13418:Exercises
16676:Exercises
---
7.10 setjmp and longjmp Functions

          In C, we can't goto a label that's in another function. Instead, we must use the setjmp
          and longjmp functions to perform this type of branching. As we'll see, these two
          functions are useful for handling error conditions that occur in a deeply nested function
          call.

                Consider the skeleton in Figure 7.9. It consists of a main loop that reads lines from
          standard input and calls the function do_line to process each line. This function then
          calls get_token to fetch the next token from the input line. The first token of a line is
          assumed to be a command of some form, and a switch statement selects each
          command. For the single command shown, the function cmd_add is called.

                The skeleton in Figure 7.9 is typical for programs that read commands, determine
          the command type, and then call functions to process each command. Figure 7.10
          shows what the stack could look like after cmd_add has been called.
214 Process Environment                                                              Chapter 7

#include "apue.h"

#define TOK_ADD 5

void       do_line(char *);
void       cmd_add(void);
int        get_token(void);

int          line[MAXLINE];
main(void)
{

       char

       while (fgets(line, MAXLINE, stdin) != NULL)
              do_line(line);

       exit(0);
}

char *tok_ptr;               /* global pointer for get_token() */

void

do_line(char *ptr)       /* process one line of input */

{

      int    cmd;

       tok_ptr = ptr;
       while ((cmd = get_token()) > 0) {

              switch (cmd) { /* one case for each command */
              case TOK_ADD:

                             cmd_add();
                             break;
              }
       }
}

void

cmd_add(void)

{

      int    token;

       token = get_token();
       /* rest of processing for this command */
}

int
get_token(void)
{

       /* fetch next token from line pointed to by tok_ptr */
}

                         Figure 7.9 Typical program skeleton for command processing
Section 7.10                   setjmp and longjmp Functions 215

              bottom of stack               higher address

                               stack frame
                                for main

               direction of    stack frame
              stack growth     for do_line

                               stack frame
                               for cmd_add

                                                      lower address

                                   Figure 7.10 Stack frames after cmd_add has been called

Storage for the automatic variables is within the stack frame for each function. The
array line is in the stack frame for main, the integer cmd is in the stack frame for
do_line, and the integer token is in the stack frame for cmd_add.

     As we've said, this type of arrangement of the stack is typical, but not required.
Stacks do not have to grow toward lower memory addresses. On systems that don't
have built-in hardware support for stacks, a C implementation might use a linked list
for its stack frames.

     The coding problem that's often encountered with programs like the one shown in
Figure 7.9 is how to handle nonfatal errors. For example, if the cmd_add function
encounters an error--say, an invalid number--it might want to print an error message,
ignore the rest of the input line, and return to the main function to read the next input
line. But when we're deeply nested numerous levels down from the main function, this
is difficult to do in C. (In this example, the cmd_add function is only two levels down
from main, but it's not uncommon to be five or more levels down from the point to
which we want to return.) It becomes messy if we have to code each function with a
special return value that tells it to return one level.

     The solution to this problem is to use a nonlocal goto: the setjmp and longjmp
functions. The adjective ``nonlocal'' indicates that we're not doing a normal C goto
statement within a function; instead, we're branching back through the call frames to a
function that is in the call path of the current function.

      #include <setjmp.h>

      int setjmp(jmp_buf env);

                             Returns: 0 if called directly, nonzero if returning from a call to longjmp

      void longjmp(jmp_buf env, int val);
216 Process Environment                                             Chapter 7

     We call setjmp from the location that we want to return to, which in this example
is in the main function. In this case, setjmp returns 0 because we called it directly. In
the call to setjmp, the argument env is of the special type jmp_buf. This data type is
some form of array that is capable of holding all the information required to restore the
status of the stack to the state when we call longjmp. Normally, the env variable is a
global variable, since we'll need to reference it from another function.

     When we encounter an error--say, in the cmd_add function--we call longjmp
with two arguments. The first is the same env that we used in a call to setjmp, and the
second, val, is a nonzero value that becomes the return value from setjmp. The second
argument allows us to use more than one longjmp for each setjmp. For example, we
could longjmp from cmd_add with a val of 1 and also call longjmp from get_token
with a val of 2. In the main function, the return value from setjmp is either 1 or 2, and
we can test this value, if we want, and determine whether the longjmp was from
cmd_add or get_token.

     Let's return to the example. Figure 7.11 shows both the main and cmd_add
functions. (The other two functions, do_line and get_token, haven't changed.)

#include "apue.h"
#include <setjmp.h>

#define TOK_ADD 5

jmp_buf jmpbuffer;

int          line[MAXLINE];
main(void)
{

       char

       if (setjmp(jmpbuffer) != 0)
              printf("error");

       while (fgets(line, MAXLINE, stdin) != NULL)
              do_line(line);

       exit(0);
}

...

void

cmd_add(void)

{

      int    token;

      token = get_token();

      if (token < 0)     /* an error has occurred */

           longjmp(jmpbuffer, 1);

      /* rest of processing for this command */

}

                         Figure 7.11 Example of setjmp and longjmp
Section 7.10                   setjmp and longjmp Functions 217

When main is executed, we call setjmp, which records whatever information it needs
to in the variable jmpbuffer and returns 0. We then call do_line, which calls
```
- `Bash` -- `sed -n '2101,2276p' /tmp/apue/full.txt`
```
1.9 Signals

          Signals are a technique used to notify a process that some condition has occurred. For
          example, if a process divides by zero, the signal whose name is SIGFPE (floating-point
          exception) is sent to the process. The process has three choices for dealing with the
          signal.

                1. Ignore the signal. This option isn't recommended for signals that denote a
                     hardware exception, such as dividing by zero or referencing memory outside
                     the address space of the process, as the results are undefined.

                2. Let the default action occur. For a divide-by-zero condition, the default is to
                     terminate the process.

                3. Provide a function that is called when the signal occurs (this is called ``catching''
                     the signal). By providing a function of our own, we'll know when the signal
                     occurs and we can handle it as we wish.

                Many conditions generate signals. Two terminal keys, called the interrupt key--
          often the DELETE key or Control-C--and the quit key--often Control-backslash--are
          used to interrupt the currently running process. Another way to generate a signal is by
          calling the kill function. We can call this function from a process to send a signal to
          another process. Naturally, there are limitations: we have to be the owner of the other
          process (or the superuser) to be able to send it a signal.

Example

          Recall the bare-bones shell example (Figure 1.7). If we invoke this program and press
          the interrupt key, the process terminates because the default action for this signal,
          named SIGINT, is to terminate the process. The process hasn't told the kernel to do
          anything other than the default with this signal, so the process terminates.

                To catch this signal, the program needs to call the signal function, specifying the
          name of the function to call when the SIGINT signal is generated. The function is
          named sig_int; when it's called, it just prints a message and a new prompt. Adding
Section 1.9                                                                               Signals 19

11 lines to the program in Figure 1.7 gives us the version in Figure 1.10. (The 11 new
lines are indicated with a plus sign at the beginning of the line.)

             #include "apue.h"
             #include <sys/wait.h>

+ static void sig_int(int);                    /* our signal-catching function */
                                        /* from apue.h */
+

             int

             main(void)

             {

                  char buf[MAXLINE];

                  pid_t pid;

                  int       status;

+                 if (signal(SIGINT, sig_int) == SIG_ERR)

+                      err_sys("signal error");

+

                  printf("%% "); /* print prompt (printf requires %% to print %) */

                  while (fgets(buf, MAXLINE, stdin) != NULL) {

                       if (buf[strlen(buf) - 1] == '\n')

                            buf[strlen(buf) - 1] = 0; /* replace newline with null */

                       if ((pid = fork()) < 0) {

                            err_sys("fork error");

                       } else if (pid == 0) {       /* child */

                            execlp(buf, buf, (char *)0);

                            err_ret("couldn't execute: %s", buf);

                            exit(127);

                       }

                       /* parent */

                       if ((pid = waitpid(pid, &status, 0)) < 0)

                            err_sys("waitpid error");

                       printf("%% ");

                  }

                  exit(0);

             }

+

+ void

+ sig_int(int signo)

+{

+                 printf("interrupt\n%% ");

+}

                          Figure 1.10 Read commands from standard input and execute them

     In Chapter 10, we'll take a long look at signals, as most nontrivial applications deal
with them.
20 UNIX System Overview                                                Chapter 1

1.10 Time Values

Historically, UNIX systems have maintained two different time values:

1. Calendar time. This value counts the number of seconds since the Epoch:
    00:00:00 January 1, 1970, Coordinated Universal Time (UTC). (Older manuals
    refer to UTC as Greenwich Mean Time.) These time values are used to record
    the time when a file was last modified, for example.

    The primitive system data type time_t holds these time values.

2. Process time. This is also called CPU time and measures the central processor
    resources used by a process. Process time is measured in clock ticks, which
    have historically been 50, 60, or 100 ticks per second.

    The primitive system data type clock_t holds these time values. (We'll show
    how to obtain the number of clock ticks per second with the sysconf function
    in Section 2.5.4.)

     When we measure the execution time of a process, as in Section 3.9, we'll see that
the UNIX System maintains three values for a process:

� Clock time
� User CPU time
� System CPU time

The clock time, sometimes called wall clock time, is the amount of time the process takes
to run, and its value depends on the number of other processes being run on the system.
Whenever we report the clock time, the measurements are made with no other activities
on the system.

     The user CPU time is the CPU time attributed to user instructions. The system CPU
time is the CPU time attributed to the kernel when it executes on behalf of the process.
For example, whenever a process executes a system service, such as read or write, the
time spent within the kernel performing that system service is charged to the process.
The sum of user CPU time and system CPU time is often called the CPU time.

     It is easy to measure the clock time, user time, and system time of any process:
simply execute the time(1) command, with the argument to the time command being
the command we want to measure. For example:

      $ cd /usr/include
      $ time -p grep _POSIX_SOURCE */*.h > /dev/null

real  0m0.81s
user  0m0.11s
sys   0m0.07s

The output format from the time command depends on the shell being used, because
some shells don't run /usr/bin/time, but instead have a separate built-in function to
measure the time it takes commands to run.

     In Section 8.17, we'll see how to obtain these three times from a running process.
The general topic of times and dates is covered in Section 6.10.
Section 1.11  System Calls and Library Functions 21

1.11 System Calls and Library Functions
```
- `Bash` -- `sed -n '2276,2410p' /tmp/apue/full.txt`
```
1.11 System Calls and Library Functions

          All operating systems provide service points through which programs request services
          from the kernel. All implementations of the UNIX System provide a well-defined,
          limited number of entry points directly into the kernel called system calls (recall
          Figure 1.1). Version 7 of the Research UNIX System provided about 50 system calls,
          4.4BSD provided about 110, and SVR4 had around 120. The exact number of system
          calls varies depending on the operating system version. More recent systems have seen
          incredible growth in the number of supported system calls. Linux 3.2.0 has 380 system
          calls and FreeBSD 8.0 has over 450.

                The system call interface has always been documented in Section 2 of the UNIX
          Programmer's Manual. Its definition is in the C language, no matter which
          implementation technique is actually used on any given system to invoke a system call.
          This differs from many older operating systems, which traditionally defined the kernel
          entry points in the assembly language of the machine.

                The technique used on UNIX systems is for each system call to have a function of
          the same name in the standard C library. The user process calls this function, using the
          standard C calling sequence. This function then invokes the appropriate kernel service,
          using whatever technique is required on the system. For example, the function may put
          one or more of the C arguments into general registers and then execute some machine
          instruction that generates a software interrupt in the kernel. For our purposes, we can
          consider the system calls to be C functions.

                Section 3 of the UNIX Programmer's Manual defines the general-purpose library
          functions available to programmers. These functions aren't entry points into the kernel,
          although they may invoke one or more of the kernel's system calls. For example, the
          printf function may use the write system call to output a string, but the strcpy
          (copy a string) and atoi (convert ASCII to integer) functions don't involve the kernel at
          all.

                From an implementor's point of view, the distinction between a system call and a
          library function is fundamental. From a user's perspective, however, the difference is
          not as critical. From our perspective in this text, both system calls and library functions
          appear as normal C functions. Both exist to provide services for application programs.
          We should realize, however, that we can replace the library functions, if desired,
          whereas the system calls usually cannot be replaced.

                Consider the memory allocation function malloc as an example. There are many
          ways to do memory allocation and its associated garbage collection (best fit, first fit, and
          so on). No single technique is optimal for all programs. The UNIX system call that
          handles memory allocation, sbrk(2), is not a general-purpose memory manager. It
          increases or decreases the address space of the process by a specified number of bytes.
          How that space is managed is up to the process. The memory allocation function,
          malloc(3), implements one particular type of allocation. If we don't like its operation,
          we can define our own malloc function, which will probably use the sbrk system call.
          In fact, numerous software packages implement their own memory allocation
          algorithms with the sbrk system call. Figure 1.11 shows the relationship between the
          application, the malloc function, and the sbrk system call.
22 UNIX System Overview                                   Chapter 1

                              application   user process
                                  code

                         memory allocation
                          function malloc

                            sbrk
                         system call

                                            kernel

                             Figure 1.11 Separation of malloc function and sbrk system call

     Here we have a clean separation of duties: the system call in the kernel allocates an
additional chunk of space on behalf of the process. The malloc library function
manages this space from user level.

     Another example to illustrate the difference between a system call and a library
function is the interface the UNIX System provides to determine the current time and
date. Some operating systems provide one system call to return the time and another to
return the date. Any special handling, such as the switch to or from daylight saving
time, is handled by the kernel or requires human intervention. The UNIX System, in
contrast, provides a single system call that returns the number of seconds since the
Epoch: midnight, January 1, 1970, Coordinated Universal Time. Any interpretation of
this value, such as converting it to a human-readable time and date using the local time
zone, is left to the user process. The standard C library provides routines to handle
most cases. These library routines handle such details as the various algorithms for
daylight saving time.

     An application can either make a system call or call a library routine. Also realize
that many library routines invoke a system call. This is shown in Figure 1.12.

     Another difference between system calls and library functions is that system calls
usually provide a minimal interface, whereas library functions often provide more
elaborate functionality. We've seen this already in the difference between the sbrk
system call and the malloc library function. We'll see this difference again later, when
Section 1.12                                           Summary 23

                                  application  user process
                                      code

              C library
              functions

              system calls

                                               kernel

                                         Figure 1.12 Difference between C library functions and system calls

          we compare the unbuffered I/O functions (Chapter 3) and the standard I/O functions
          (Chapter 5).

                The process control system calls (fork, exec, and waitpid) are usually invoked
          by the user's application code directly. (Recall the bare-bones shell in Figure 1.7.) But
          some library routines exist to simplify certain common cases: the system and popen
          library routines, for example. In Section 8.13, we'll show an implementation of the
          system function that invokes the basic process control system calls. We'll enhance this
          example in Section 10.18 to handle signals correctly.

                To define the interface to the UNIX System that most programmers use, we have to
          describe both the system calls and some of the library functions. If we described only
          the sbrk system call, for example, we would skip the more programmer-friendly
          malloc library function that many applications use. In this text, we'll use the term
          function to refer to both system calls and library functions, except when the distinction is
          necessary.

1.12 Summary

          This chapter has provided a short tour of the UNIX System. We've described some of
          the fundamental terms that we'll encounter over and over again. We've seen numerous
          small examples of UNIX programs to give us a feel for what the remainder of the text
          talks about.
24 UNIX System Overview  Chapter 1

     The next chapter is about standardization of the UNIX System and the effect of
work in this area on current systems. Standards, particularly the ISO C standard and
the POSIX.1 standard, will affect the rest of the text.

Exercises

1.1 Verify on your system that the directories dot and dot-dot are not the same, except in the
       root directory.
```
- `Bash` -- `sed -n '1330,1548p' /tmp/apue/full.txt`
```
1.4 Files and Directories

File System

          The UNIX file system is a hierarchical arrangement of directories and files. Everything
          starts in the directory called root, whose name is the single character /.

                A directory is a file that contains directory entries. Logically, we can think of each
          directory entry as containing a filename along with a structure of information
          describing the attributes of the file. The attributes of a file are such things as the type of
          file (regular file, directory), the size of the file, the owner of the file, permissions for the
          file (whether other users may access this file), and when the file was last modified. The
          stat and fstat functions return a structure of information containing all the
          attributes of a file. In Chapter 4, we'll examine all the attributes of a file in great detail.

                                  We make a distinction between the logical view of a directory entry and the way it is actually
                                  stored on disk. Most implementations of UNIX file systems don't store attributes in the
                                  directory entries themselves, because of the difficulty of keeping them in synch when a file has
                                  multiple hard links. This will become clear when we discuss hard links in Chapter 4.

Filename

          The names in a directory are called filenames. The only two characters that cannot
          appear in a filename are the slash character (/) and the null character. The slash
          separates the filenames that form a pathname (described next) and the null character
          terminates a pathname. Nevertheless, it's good practice to restrict the characters in a
          filename to a subset of the normal printing characters. (If we use some of the shell's
          special characters in the filename, we have to use the shell's quoting mechanism to
          reference the filename, and this can get complicated.) Indeed, for portability, POSIX.1
          recommends restricting filenames to consist of the following characters: letters (a-z,
          A-Z), numbers (0-9), period (.), dash (-), and underscore ( _ ).

                Two filenames are automatically created whenever a new directory is created: .
          (called dot) and .. (called dot-dot). Dot refers to the current directory, and dot-dot refers
          to the parent directory. In the root directory, dot-dot is the same as dot.
Section 1.4                                                         Files and Directories 5

             The Research UNIX System and some older UNIX System V file systems restricted a filename
             to 14 characters. BSD versions extended this limit to 255 characters. Today, almost all
             commercial UNIX file systems support at least 255-character filenames.

Pathname

          A sequence of one or more filenames, separated by slashes and optionally starting with
          a slash, forms a pathname. A pathname that begins with a slash is called an absolute
          pathname; otherwise, it's called a relative pathname. Relative pathnames refer to files
          relative to the current directory. The name for the root of the file system (/) is a
          special-case absolute pathname that has no filename component.

Example

Listing the names of all the files in a directory is not difficult. Figure 1.3 shows a
bare-bones implementation of the ls(1) command.

#include "apue.h"
#include <dirent.h>

int                   *argv[])
main(int argc, char
{                     *dp;
                      *dirp;
       DIR
       struct dirent

             if (argc != 2)
                    err_quit("usage: ls directory_name");

             if ((dp = opendir(argv[1])) == NULL)
                    err_sys("can't open %s", argv[1]);

             while ((dirp = readdir(dp)) != NULL)
                    printf("%s\n", dirp->d_name);

       closedir(dp);
       exit(0);
}

                      Figure 1.3 List all the files in a directory

     The notation ls(1) is the normal way to reference a particular entry in the UNIX
system manuals. It refers to the entry for ls in Section 1. The sections are normally
numbered 1 through 8, and all the entries within each section are arranged
alphabetically. Throughout this text, we assume that you have a copy of the manuals
for your UNIX system.

                    Historically, UNIX systems lumped all eight sections together into what was called the UNIX
                    Programmer's Manual. As the page count increased, the trend changed to distributing the
                    sections among separate manuals: one for users, one for programmers, and one for system
                    administrators, for example.
6 UNIX System Overview  Chapter 1

                    Some UNIX systems further divide the manual pages within a given section, using an
                    uppercase letter. For example, all the standard input/output (I/O) functions in AT&T [1990e]
                    are indicated as being in Section 3S, as in fopen(3S). Other systems have replaced the
                    numeric sections with alphabetic ones, such as C for commands.

     Today, most manuals are distributed in electronic form. If your manuals are online,
the way to see the manual pages for the ls command would be something like

      man 1 ls

or

      man -s1 ls

     Figure 1.3 is a program that just prints the name of every file in a directory, and
nothing else. If the source file is named myls.c, we compile it into the default a.out
executable file by running

      cc myls.c

                    Historically, cc(1) is the C compiler. On systems with the GNU C compilation system, the C
                    compiler is gcc(1). Here, cc is usually linked to gcc.

Some sample output is

      $ ./a.out /dev
      .
      ..
      cdrom
      stderr
      stdout
      stdin
      fd
      sda4
      sda3
      sda2
      sda1
      sda
      tty2
      tty1
      console
      tty
      zero
      null

                                          many more lines that aren't shown
      mem
      $ ./a.out /etc/ssl/private
      can't open /etc/ssl/private: Permission denied
      $ ./a.out /dev/tty
      can't open /dev/tty: Not a directory

Throughout this text, we'll show commands that we run and the resulting output in this
fashion: Characters that we type are shown in this font, whereas output from
programs is shown like this. If we need to add comments to this output, we'll show
Section 1.4  Files and Directories 7

the comments in italics. The dollar sign that precedes our input is the prompt that is
printed by the shell. We'll always show the shell prompt as a dollar sign.

     Note that the directory listing is not in alphabetical order. The ls command sorts
the names before printing them.

     There are many details to consider in this 20-line program.

� First, we include a header of our own: apue.h. We include this header in almost
    every program in this text. This header includes some standard system headers and
    defines numerous constants and function prototypes that we use throughout the
    examples in the text. A listing of this header is in Appendix B.

� Next, we include a system header, dirent.h, to pick up the function prototypes for
    opendir and readdir, in addition to the definition of the dirent structure. On
    some systems, the definitions are split into multiple header files. For example, in the
    Ubuntu 12.04 Linux distribution, /usr/include/dirent.h declares the function
    prototypes and includes bits/dirent.h, which defines the dirent structure (and
    is actually stored in /usr/include/x86_64-linux-gnu/bits).

� The declaration of the main function uses the style supported by the ISO C
    standard. (We'll have more to say about the ISO C standard in the next chapter.)

� We take an argument from the command line, argv[1], as the name of the directory
    to list. In Chapter 7, we'll look at how the main function is called and how the
    command-line arguments and environment variables are accessible to the program.

� Because the actual format of directory entries varies from one UNIX system to
    another, we use the functions opendir, readdir, and closedir to manipulate the
    directory.

� The opendir function returns a pointer to a DIR structure, and we pass this pointer
    to the readdir function. We don't care what's in the DIR structure. We then call
    readdir in a loop, to read each directory entry. The readdir function returns a
    pointer to a dirent structure or, when it's finished with the directory, a null pointer.
    All we examine in the dirent structure is the name of each directory entry
    (d_name). Using this name, we could then call the stat function (Section 4.2) to
    determine all the attributes of the file.

� We call two functions of our own to handle the errors: err_sys and err_quit. We
    can see from the preceding output that the err_sys function prints an informative
    message describing what type of error was encountered (``Permission denied'' or
    ``Not a directory''). These two error functions are shown and described in
    Appendix B. We also talk more about error handling in Section 1.7.

� When the program is done, it calls the function exit with an argument of 0. The
    function exit terminates a program. By convention, an argument of 0 means OK,
    and an argument between 1 and 255 means that an error occurred. In Section 8.5, we
    show how any program, such as a shell or a program that we write, can obtain the
    exit status of a program that it executes.
8 UNIX System Overview  Chapter 1

Working Directory

          Every process has a working directory, sometimes called the current working directory.
          This is the directory from which all relative pathnames are interpreted. A process can
          change its working directory with the chdir function.

                For example, the relative pathname doc/memo/joe refers to the file or directory
          joe, in the directory memo, in the directory doc, which must be a directory within the
          working directory. From looking just at this pathname, we know that both doc and
          memo have to be directories, but we can't tell whether joe is a file or a directory. The
          pathname /usr/lib/lint is an absolute pathname that refers to the file or directory
          lint in the directory lib, in the directory usr, which is in the root directory.

Home Directory

          When we log in, the working directory is set to our home directory. Our home directory
          is obtained from our entry in the password file (Section 1.3).

1.5 Input and Output
```
- `Bash` -- `sed -n '1548,1896p' /tmp/apue/full.txt`
```
1.5 Input and Output

File Descriptors

          File descriptors are normally small non-negative integers that the kernel uses to identify
          the files accessed by a process. Whenever it opens an existing file or creates a new file,
          the kernel returns a file descriptor that we use when we want to read or write the file.

Standard Input, Standard Output, and Standard Error

          By convention, all shells open three descriptors whenever a new program is run:
          standard input, standard output, and standard error. If nothing special is done, as in
          the simple command

                  ls
          then all three are connected to the terminal. Most shells provide a way to redirect any
          or all of these three descriptors to any file. For example,

                  ls > file.list
          executes the ls command with its standard output redirected to the file named
          file.list.

Unbuffered I/O

          Unbuffered I/O is provided by the functions open, read, write, lseek, and close.
          These functions all work with file descriptors.

Example

          If we're willing to read from the standard input and write to the standard output, then
          the program in Figure 1.4 copies any regular file on a UNIX system.
Section 1.5                                                           Input and Output 9

#include "apue.h"

#define BUFFSIZE 4096

int              n;
main(void)       buf[BUFFSIZE];
{

       int
       char

             while ((n = read(STDIN_FILENO, buf, BUFFSIZE)) > 0)
                    if (write(STDOUT_FILENO, buf, n) != n)
                           err_sys("write error");

             if (n < 0)
                    err_sys("read error");

       exit(0);
}

                   Figure 1.4 Copy standard input to standard output

The <unistd.h> header, included by apue.h, and the two constants STDIN_FILENO
and STDOUT_FILENO are part of the POSIX standard (about which we'll have a lot
more to say in the next chapter). This header contains function prototypes for many of
the UNIX system services, such as the read and write functions that we call.

     The constants STDIN_FILENO and STDOUT_FILENO are defined in <unistd.h>
and specify the file descriptors for standard input and standard output. These values
are 0 and 1, respectively, as required by POSIX.1, but we'll use the names for readability.

     In Section 3.9, we'll examine the BUFFSIZE constant in detail, seeing how various
values affect the efficiency of the program. Regardless of the value of this constant,
however, this program still copies any regular file.

     The read function returns the number of bytes that are read, and this value is used
as the number of bytes to write. When the end of the input file is encountered, read
returns 0 and the program stops. If a read error occurs, read returns -1. Most of the
system functions return -1 when an error occurs.

     If we compile the program into the standard name (a.out) and execute it as

      ./a.out > data

standard input is the terminal, standard output is redirected to the file data, and
standard error is also the terminal. If this output file doesn't exist, the shell creates it by
default. The program copies lines that we type to the standard output until we type the
end-of-file character (usually Control-D).

     If we run

      ./a.out < infile > outfile

then the file named infile will be copied to the file named outfile.

             In Chapter 3, we describe the unbuffered I/O functions in more detail.
10 UNIX System Overview                                                                 Chapter 1

Standard I/O

          The standard I/O functions provide a buffered interface to the unbuffered I/O
          functions. Using standard I/O relieves us from having to choose optimal buffer sizes,
          such as the BUFFSIZE constant in Figure 1.4. The standard I/O functions also simplify
          dealing with lines of input (a common occurrence in UNIX applications). The fgets
          function, for example, reads an entire line. The read function, in contrast, reads a
          specified number of bytes. As we shall see in Section 5.4, the standard I/O library
          provides functions that let us control the style of buffering used by the library.

                The most common standard I/O function is printf. In programs that call
          printf, we'll always include <stdio.h>--normally by including apue.h--as this
          header contains the function prototypes for all the standard I/O functions.

Example

The program in Figure 1.5, which we'll examine in more detail in Section 5.8, is like the
previous program that called read and write. This program copies standard input to
standard output and can copy any regular file.

#include "apue.h"

int

main(void)

{

         int     c;

         while ((c = getc(stdin)) != EOF)
                if (putc(c, stdout) == EOF)
                       err_sys("output error");

         if (ferror(stdin))
                err_sys("input error");

       exit(0);
}

                 Figure 1.5 Copy standard input to standard output, using standard I/O

The function getc reads one character at a time, and this character is written by putc.
After the last byte of input has been read, getc returns the constant EOF (defined in
<stdio.h>). The standard I/O constants stdin and stdout are also defined in the
<stdio.h> header and refer to the standard input and standard output.

1.6 Programs and Processes

Program

          A program is an executable file residing on disk in a directory. A program is read into
          memory and is executed by the kernel as a result of one of the seven exec functions.
          We'll cover these functions in Section 8.10.
Section 1.6  Programs and Processes 11

Processes and Process ID

          An executing instance of a program is called a process, a term used on almost every page
          of this text. Some operating systems use the term task to refer to a program that is being
          executed.

                The UNIX System guarantees that every process has a unique numeric identifier
          called the process ID. The process ID is always a non-negative integer.

Example

          The program in Figure 1.6 prints its process ID.

            #include "apue.h"

            int
            main(void)
            {

                   printf("hello world from process ID %ld\n", (long)getpid());
                   exit(0);
            }

                                                                  Figure 1.6 Print the process ID

          If we compile this program into the file a.out and execute it, we have

                  $ ./a.out
                  hello world from process ID 851
                  $ ./a.out
                  hello world from process ID 854

          When this program runs, it calls the function getpid to obtain its process ID. As we
          shall see later, getpid returns a pid_t data type. We don't know its size; all we know
          is that the standards guarantee that it will fit in a long integer. Because we have to tell
          printf the size of each argument to be printed, we have to cast the value to the largest
          data type that it might use (in this case, a long integer). Although most process IDs will
          fit in an int, using a long promotes portability.

Process Control

          There are three primary functions for process control: fork, exec, and waitpid. (The
          exec function has seven variants, but we often refer to them collectively as simply the
          exec function.)

Example

          The process control features of the UNIX System are demonstrated using a simple
          program (Figure 1.7) that reads commands from standard input and executes the
          commands. This is a bare-bones implementation of a shell-like program.
12 UNIX System Overview                                                      Chapter 1

#include "apue.h"
#include <sys/wait.h>

int           buf[MAXLINE];  /* from apue.h */
main(void)    pid;
{             status;

       char
       pid_t
       int

printf("%% "); /* print prompt (printf requires %% to print %) */
while (fgets(buf, MAXLINE, stdin) != NULL) {

       if (buf[strlen(buf) - 1] == '\n')
              buf[strlen(buf) - 1] = 0; /* replace newline with null */

if ((pid = fork()) < 0) {

              err_sys("fork error");

} else if (pid == 0) {                /* child */

              execlp(buf, buf, (char *)0);

              err_ret("couldn't execute: %s", buf);

              exit(127);

}

              /* parent */
              if ((pid = waitpid(pid, &status, 0)) < 0)

                     err_sys("waitpid error");
              printf("%% ");
       }
       exit(0);
}

              Figure 1.7 Read commands from standard input and execute them

There are several features to consider in this 30-line program.

     � We use the standard I/O function fgets to read one line at a time from the
         standard input. When we type the end-of-file character (which is often
         Control-D) as the first character of a line, fgets returns a null pointer, the loop
         stops, and the process terminates. In Chapter 18, we describe all the special
         terminal characters--end of file, backspace one character, erase entire line, and
         so on--and how to change them.

     � Because each line returned by fgets is terminated with a newline character,
         followed by a null byte, we use the standard C function strlen to calculate the
         length of the string, and then replace the newline with a null byte. We do this
         because the execlp function wants a null-terminated argument, not a
         newline-terminated argument.

     � We call fork to create a new process, which is a copy of the caller. We say that
         the caller is the parent and that the newly created process is the child. Then
         fork returns the non-negative process ID of the new child process to the parent,
Section 1.6                                   Programs and Processes 13

                 and returns 0 to the child. Because fork creates a new process, we say that it is
                 called once--by the parent--but returns twice--in the parent and in the child.

             � In the child, we call execlp to execute the command that was read from the
                 standard input. This replaces the child process with the new program file. The
                 combination of fork followed by exec is called spawning a new process on
                 some operating systems. In the UNIX System, the two parts are separated into
                 individual functions. We'll say a lot more about these functions in Chapter 8.

             � Because the child calls execlp to execute the new program file, the parent
                 wants to wait for the child to terminate. This is done by calling waitpid,
                 specifying which process to wait for: the pid argument, which is the process ID
                 of the child. The waitpid function also returns the termination status of the
                 child--the status variable--but in this simple program, we don't do anything
                 with this value. We could examine it to determine how the child terminated.

             � The most fundamental limitation of this program is that we can't pass
                 arguments to the command we execute. We can't, for example, specify the name
                 of a directory to list. We can execute ls only on the working directory. To allow
                 arguments would require that we parse the input line, separating the arguments
                 by some convention, probably spaces or tabs, and then pass each argument as a
                 separate parameter to the execlp function. Nevertheless, this program is still a
                 useful demonstration of the UNIX System's process control functions.

If we run this program, we get the following results. Note that our program has a
different prompt--the percent sign--to distinguish it from the shell's prompt.

             $ ./a.out

             % date

             Sat Jan 21 19:42:07 EST 2012

             % who

             sar        console Jan 1 14:59

             sar        ttys000 Jan 1 14:59

             sar        ttys001 Jan 15 15:28

             % pwd

             /home/sar/bk/apue/3e

             % ls

             Makefile

             a.out

             shell1.c

             % ^D                             type the end-of-file character
                                              the regular shell prompt
             $

                     The notation ^D is used to indicate a control character. Control characters are special
                     characters formed by holding down the control key--often labeled Control or Ctrl--on
                     your keyboard and then pressing another key at the same time. Control-D, or ^D, is the
                     default end-of-file character. We'll see many more control characters when we discuss
                     terminal I/O in Chapter 18.
14 UNIX System Overview  Chapter 1

Threads and Thread IDs

          Usually, a process has only one thread of control--one set of machine instructions
          executing at a time. Some problems are easier to solve when more than one thread of
          control can operate on different parts of the problem. Additionally, multiple threads of
          control can exploit the parallelism possible on multiprocessor systems.

                All threads within a process share the same address space, file descriptors, stacks,
          and process-related attributes. Each thread executes on its own stack, although any
          thread can access the stacks of other threads in the same process. Because they can
          access the same memory, the threads need to synchronize access to shared data among
          themselves to avoid inconsistencies.

                Like processes, threads are identified by IDs. Thread IDs, however, are local to a
          process. A thread ID from one process has no meaning in another process. We use
          thread IDs to refer to specific threads as we manipulate the threads within a process.

                Functions to control threads parallel those used to control processes. Because
          threads were added to the UNIX System long after the process model was established,
          however, the thread model and the process model have some complicated interactions,
          as we shall see in Chapter 12.

1.7 Error Handling
```
- `Bash` -- `sed -n '1896,2101p' /tmp/apue/full.txt`
```
1.7 Error Handling

          When an error occurs in one of the UNIX System functions, a negative value is often
          returned, and the integer errno is usually set to a value that tells why. For example,
          the open function returns either a non-negative file descriptor if all is OK or -1 if an
          error occurs. An error from open has about 15 possible errno values, such as file
          doesn't exist, permission problem, and so on. Some functions use a convention other
          than returning a negative value. For example, most functions that return a pointer to an
          object return a null pointer to indicate an error.

                The file <errno.h> defines the symbol errno and constants for each value that
          errno can assume. Each of these constants begins with the character E. Also, the first
          page of Section 2 of the UNIX system manuals, named intro(2), usually lists all these
          error constants. For example, if errno is equal to the constant EACCES, this indicates a
          permission problem, such as insufficient permission to open the requested file.

                                  On Linux, the error constants are listed in the errno(3) manual page.

                POSIX and ISO C define errno as a symbol expanding into a modifiable lvalue of
          type integer. This can be either an integer that contains the error number or a function
          that returns a pointer to the error number. The historical definition is

                  extern int errno;

          But in an environment that supports threads, the process address space is shared among
          multiple threads, and each thread needs its own local copy of errno to prevent one
          thread from interfering with another. Linux, for example, supports multithreaded
          access to errno by defining it as
Section 1.7                                                  Error Handling 15

      extern int *_ _errno_location(void);
      #define errno (*_ _errno_location())

     There are two rules to be aware of with respect to errno. First, its value is never
cleared by a routine if an error does not occur. Therefore, we should examine its value
only when the return value from a function indicates that an error occurred. Second,
the value of errno is never set to 0 by any of the functions, and none of the constants
defined in <errno.h> has a value of 0.

     Two functions are defined by the C standard to help with printing error messages.

      #include <string.h>

      char *strerror(int errnum);

                                                                               Returns: pointer to message string

This function maps errnum, which is typically the errno value, into an error message
string and returns a pointer to the string.

     The perror function produces an error message on the standard error, based on
the current value of errno, and returns.

      #include <stdio.h>

      void perror(const char *msg);

It outputs the string pointed to by msg, followed by a colon and a space, followed by the
error message corresponding to the value of errno, followed by a newline.

Example

Figure 1.8 shows the use of these two error functions.

#include "apue.h"
#include <errno.h>

int                              %s\n",  strerror(EACCES));
main(int argc, char *argv[])
{

       fprintf(stderr, "EACCES:
       errno = ENOENT;
       perror(argv[0]);
       exit(0);
}

             Figure 1.8 Demonstrate strerror and perror

If this program is compiled into the file a.out, we have

      $ ./a.out
      EACCES: Permission denied
      ./a.out: No such file or directory
16 UNIX System Overview  Chapter 1

          Note that we pass the name of the program--argv[0], whose value is ./a.out--as
          the argument to perror. This is a standard convention in the UNIX System. By doing
          this, if the program is executed as part of a pipeline, as in

                  prog1 < inputfile | prog2 | prog3 > outputfile

          we are able to tell which of the three programs generated a particular error message.

                Instead of calling either strerror or perror directly, the examples in this text use
          the error functions shown in Appendix B. These functions let us use the variable
          argument list facility of ISO C to handle error conditions with a single C statement.

Error Recovery

          The errors defined in <errno.h> can be divided into two categories: fatal and nonfatal.
          A fatal error has no recovery action. The best we can do is print an error message on the
          user's screen or to a log file, and then exit. Nonfatal errors, on the other hand, can
          sometimes be dealt with more robustly. Most nonfatal errors are temporary, such as a
          resource shortage, and might not occur when there is less activity on the system.

                Resource-related nonfatal errors include EAGAIN, ENFILE, ENOBUFS, ENOLCK,
          ENOSPC, EWOULDBLOCK, and sometimes ENOMEM. EBUSY can be treated as nonfatal
          when it indicates that a shared resource is in use. Sometimes, EINTR can be treated as a
          nonfatal error when it interrupts a slow system call (more on this in Section 10.5).

                The typical recovery action for a resource-related nonfatal error is to delay and retry
          later. This technique can be applied in other circumstances. For example, if an error
          indicates that a network connection is no longer functioning, it might be possible for the
          application to delay a short time and then reestablish the connection. Some applications
          use an exponential backoff algorithm, waiting a longer period of time in each
          subsequent iteration.

                Ultimately, it is up to the application developer to determine the cases where an
          application can recover from an error. If a reasonable recovery strategy can be used, we
          can improve the robustness of our application by avoiding an abnormal exit.

1.8 User Identification

User ID

          The user ID from our entry in the password file is a numeric value that identifies us to
          the system. This user ID is assigned by the system administrator when our login name
          is assigned, and we cannot change it. The user ID is normally assigned to be unique for
          every user. We'll see how the kernel uses the user ID to check whether we have the
          appropriate permissions to perform certain operations.

                We call the user whose user ID is 0 either root or the superuser. The entry in the
          password file normally has a login name of root, and we refer to the special privileges
          of this user as superuser privileges. As we'll see in Chapter 4, if a process has superuser
          privileges, most file permission checks are bypassed. Some operating system functions
          are restricted to the superuser. The superuser has free rein over the system.
Section 1.8  User Identification 17

                                  Client versions of Mac OS X ship with the superuser account disabled; server versions ship
                                  with the account already enabled. Instructions are available on Apple's Web site describing
                                  how to enable it. See http://support.apple.com/kb/HT1528.

Group ID

          Our entry in the password file also specifies our numeric group ID. This, too, is assigned
          by the system administrator when our login name is assigned. Typically, the password
          file contains multiple entries that specify the same group ID. Groups are normally used
          to collect users together into projects or departments. This allows the sharing of
          resources, such as files, among members of the same group. We'll see in Section 4.5 that
          we can set the permissions on a file so that all members of a group can access the file,
          whereas others outside the group cannot.

                There is also a group file that maps group names into numeric group IDs. The
          group file is usually /etc/group.

                The use of numeric user IDs and numeric group IDs for permissions is historical.
          With every file on disk, the file system stores both the user ID and the group ID of a
          file's owner. Storing both of these values requires only four bytes, assuming that each is
          stored as a two-byte integer. If the full ASCII login name and group name were used
          instead, additional disk space would be required. In addition, comparing strings
          during permission checks is more expensive than comparing integers.

                Users, however, work better with names than with numbers, so the password file
          maintains the mapping between login names and user IDs, and the group file provides
          the mapping between group names and group IDs. The ls -l command, for example,
          prints the login name of the owner of a file, using the password file to map the numeric
          user ID into the corresponding login name.

                                  Early UNIX systems used 16-bit integers to represent user and group IDs. Contemporary
                                  UNIX systems use 32-bit integers.

Example

          The program in Figure 1.9 prints the user ID and the group ID.

            #include "apue.h"

            int
            main(void)
            {

                   printf("uid = %d, gid = %d\n", getuid(), getgid());
                   exit(0);
            }

                                                             Figure 1.9 Print user ID and group ID

          We call the functions getuid and getgid to return the user ID and the group ID.
          Running the program yields

                  $ ./a.out
                  uid = 205, gid = 105
18 UNIX System Overview  Chapter 1

Supplementary Group IDs

          In addition to the group ID specified in the password file for a login name, most
          versions of the UNIX System allow a user to belong to other groups. This practice
          started with 4.2BSD, which allowed a user to belong to up to 16 additional groups.
          These supplementary group IDs are obtained at login time by reading the file
          /etc/group and finding the first 16 entries that list the user as a member. As we shall
          see in the next chapter, POSIX requires that a system support at least 8 supplementary
          groups per process, but most systems support at least 16.

1.9 Signals
```
- `Bash` -- `sed -n '11852,12130p' /tmp/apue/full.txt`
```
7.1 Introduction

          Before looking at the process control primitives in the next chapter, we need to examine
          the environment of a single process. In this chapter, we'll see how the main function is
          called when the program is executed, how command-line arguments are passed to the
          new program, what the typical memory layout looks like, how to allocate additional
          memory, how the process can use environment variables, and various ways for the
          process to terminate. Additionally, we'll look at the longjmp and setjmp functions
          and their interaction with the stack. We finish the chapter by examining the resource
          limits of a process.

7.2 main Function

          A C program starts execution with a function called main. The prototype for the main
          function is

                  int main(int argc, char *argv[]);
          where argc is the number of command-line arguments, and argv is an array of pointers
          to the arguments. We describe these arguments in Section 7.4.

                When a C program is executed by the kernel--by one of the exec functions, which
          we describe in Section 8.10--a special start-up routine is called before the main
          function is called. The executable program file specifies this routine as the starting
          address for the program; this is set up by the link editor when it is invoked by the C
          compiler. This start-up routine takes values from the kernel--the command-line
          arguments and the environment--and sets things up so that the main function is called
          as shown earlier.

                                                                                                                                          197
198 Process Environment  Chapter 7

7.3 Process Termination

          There are eight ways for a process to terminate. Normal termination occurs in five
          ways:

                1. Return from main
                2. Calling exit
                3. Calling _exit or _Exit
                4. Return of the last thread from its start routine (Section 11.5)
                5. Calling pthread_exit (Section 11.5) from the last thread

          Abnormal termination occurs in three ways:

                6. Calling abort (Section 10.17)
                7. Receipt of a signal (Section 10.2)
                8. Response of the last thread to a cancellation request (Sections 11.5 and 12.7)

                                           For now, we'll ignore the three termination methods specific to threads until we discuss
                                           threads in Chapters 11 and 12.

          The start-up routine that we mentioned in the previous section is also written so that if
          the main function returns, the exit function is called. If the start-up routine were
          coded in C (it is often coded in assembly language) the call to main could look like

                  exit(main(argc, argv));

Exit Functions

          Three functions terminate a program normally: _exit and _Exit, which return to the
          kernel immediately, and exit, which performs certain cleanup processing and then
          returns to the kernel.

                  #include <stdlib.h>
                  void exit(int status);
                  void _Exit(int status);
                  #include <unistd.h>
                  void _exit(int status);

          We'll discuss the effect of these three functions on other processes, such as the children
          and the parent of the terminating process, in Section 8.5.

                                  The reason for the different headers is that exit and _Exit are specified by ISO C, whereas
                                  _exit is specified by POSIX.1.
Section 7.3                                        Process Termination 199

     Historically, the exit function has always performed a clean shutdown of the
standard I/O library: the fclose function is called for all open streams. Recall from
Section 5.5 that this causes all buffered output data to be flushed (written to the file).

     All three exit functions expect a single integer argument, which we call the exit
status. Most UNIX System shells provide a way to examine the exit status of a process.
If (a) any of these functions is called without an exit status, (b) main does a return
without a return value, or (c) the main function is not declared to return an integer, the
exit status of the process is undefined. However, if the return type of main is an integer
and main ``falls off the end'' (an implicit return), the exit status of the process is 0.

                    This behavior is new with the 1999 version of the ISO C standard. Historically, the exit status
                    was undefined if the end of the main function was reached without an explicit return
                    statement or a call to the exit function.

     Returning an integer value from the main function is equivalent to calling exit
with the same value. Thus

      exit(0);

is the same as

      return(0);

from the main function.

Example

          The program in Figure 7.1 is the classic ``hello, world'' example.

            #include <stdio.h>

            main()
            {

                   printf("hello, world\n");
            }

                                                                   Figure 7.1 Classic C program

When we compile and run the program in Figure 7.1, we see that the exit code is
random. If we compile the same program on different systems, we are likely to get
different exit codes, depending on the contents of the stack and register contents at the
time that the main function returns:

             $ gcc hello.c  print the exit status
             $ ./a.out
             hello, world
             $ echo $?
             13
200 Process Environment                                             Chapter 7

Now if we enable the 1999 ISO C compiler extensions, we see that the exit code changes:

$ gcc -std=c99 hello.c          enable gcc's 1999 ISO C extensions
hello.c:4: warning: return  type defaults to 'int'
$ ./a.out
hello, world                    print the exit status
$ echo $?
0

Note the compiler warning when we enable the 1999 ISO C extensions. This warning is
printed because the type of the main function is not explicitly declared to be an integer. If we
were to add this declaration, the message would go away. However, if we were to enable all
recommended warnings from the compiler (with the -Wall flag), then we would see a
warning message something like ``control reaches end of nonvoid function.''

The declaration of main as returning an integer and the use of exit instead of return
produces needless warnings from some compilers and the lint(1) program. The problem is
that these compilers don't know that an exit from main is the same as a return. One way
around these warnings, which become annoying after a while, is to use return instead of
exit from main. But doing this prevents us from using the UNIX System's grep utility to
locate all calls to exit from a program. Another solution is to declare main as returning
void, instead of int, and continue calling exit. This gets rid of the compiler warning but
doesn't look right (especially in a programming text), and can generate other compiler
warnings, since the return type of main is supposed to be a signed integer. In this text, we
show main as returning an integer, since that is the definition specified by both ISO C and
POSIX.1.

Different compilers vary in the verbosity of their warnings. Note that the GNU C compiler
usually doesn't emit these extraneous compiler warnings unless additional warning options
are used.

In the next chapter, we'll see how any process can cause a program to be executed, wait
for the process to complete, and then fetch its exit status.

atexit Function

          With ISO C, a process can register at least 32 functions that are automatically called by
          exit. These are called exit handlers and are registered by calling the atexit function.

                  #include <stdlib.h>

                  int atexit(void (*func)(void));

                                                                                           Returns: 0 if OK, nonzero on error

          This declaration says that we pass the address of a function as the argument to atexit.
          When this function is called, it is not passed any arguments and is not expected to
          return a value. The exit function calls these functions in reverse order of their
          registration. Each function is called as many times as it was registered.
Section 7.3                                                                      Process Termination 201

                    These exit handlers first appeared in the ANSI C Standard in 1989. Systems that predate ANSI
                    C, such as SVR3 and 4.3BSD, did not provide these exit handlers.

                    ISO C requires that systems support at least 32 exit handlers, but implementations often
                    support more (see Figure 2.15). The sysconf function can be used to determine the
                    maximum number of exit handlers supported by a given platform, as illustrated in Figure 2.14.

     With ISO C and POSIX.1, exit first calls the exit handlers and then closes (via
fclose) all open streams. POSIX.1 extends the ISO C standard by specifying that any
exit handlers installed will be cleared if the program calls any of the exec family of
functions. Figure 7.2 summarizes how a C program is started and the various ways it
can terminate.

             _exit     userreturn   es n (do exit                      call      exit handler
                or  functions call                                       return
                                           ot retu                                 ...
             _Exit    main                        rn)   exit         call
                    function                           function                  exit handler
             _exit                      exit                         return
                or                                          _exit                standard I/O
                                    (does not return)          or      call         cleanup
             _Exit                                                 return
                                                            _Exit
                                                                                               user process

                    return           exit rn) retu
                              call
                                        s not
                    C start-up      (doe
                     routine

                    exec

                                                       kernel

                                Figure 7.2 How a C program is started and how it terminates

The only way a program can be executed by the kernel is if one of the exec functions is
called. The only way a process can voluntarily terminate is if _exit or _Exit is called,
either explicitly or implicitly (by calling exit). A process can also be involuntarily
terminated by a signal (not shown in Figure 7.2).
202 Process Environment                                                 Chapter 7

Example

The program in Figure 7.3 demonstrates the use of the atexit function.

#include "apue.h"

static void my_exit1(void);
static void my_exit2(void);

int                                    my_exit2");
main(void)
{

       if (atexit(my_exit2) != 0)
              err_sys("can't register

         if (atexit(my_exit1) != 0)
                err_sys("can't register my_exit1");

         if (atexit(my_exit1) != 0)
                err_sys("can't register my_exit1");

       printf("main is done\n");
       return(0);
}

static void              exit  handler\n");
my_exit1(void)
{

       printf("first
}

static void              exit  handler\n");
my_exit2(void)
{

       printf("second
}

                               Figure 7.3 Example of exit handlers

Executing the program in Figure 7.3 yields

      $ ./a.out
      main is done
      first exit handler
      first exit handler
      second exit handler

An exit handler is called once for each time it is registered. In Figure 7.3, the first exit
handler is registered twice, so it is called two times. Note that we don't call exit;
instead, we return from main.
Section 7.5                                              Environment List 203

7.4 Command-Line Arguments
```
- `Bash` -- `sed -n '12219,12311p' /tmp/apue/full.txt`
```
7.6 Memory Layout of a C Program

          Historically, a C program has been composed of the following pieces:

                � Text segment, consisting of the machine instructions that the CPU executes.
                    Usually, the text segment is sharable so that only a single copy needs to be in
                    memory for frequently executed programs, such as text editors, the C compiler,
                    the shells, and so on. Also, the text segment is often read-only, to prevent a
                    program from accidentally modifying its instructions.
Section 7.6  Memory Layout of a C Program 205

     � Initialized data segment, usually called simply the data segment, containing
         variables that are specifically initialized in the program. For example, the C
         declaration

                 int maxcount = 99;

         appearing outside any function causes this variable to be stored in the initialized
         data segment with its initial value.

     � Uninitialized data segment, often called the ``bss'' segment, named after an
         ancient assembler operator that stood for ``block started by symbol.'' Data in
         this segment is initialized by the kernel to arithmetic 0 or null pointers before the
         program starts executing. The C declaration

                 long sum[1000];

         appearing outside any function causes this variable to be stored in the
         uninitialized data segment.

     � Stack, where automatic variables are stored, along with information that is saved
         each time a function is called. Each time a function is called, the address of
         where to return to and certain information about the caller's environment, such
         as some of the machine registers, are saved on the stack. The newly called
         function then allocates room on the stack for its automatic and temporary
         variables. This is how recursive functions in C can work. Each time a recursive
         function calls itself, a new stack frame is used, so one set of variables doesn't
         interfere with the variables from another instance of the function.

     � Heap, where dynamic memory allocation usually takes place. Historically, the
         heap has been located between the uninitialized data and the stack.

Figure 7.6 shows the typical arrangement of these segments. This is a logical picture of
how a program looks; there is no requirement that a given implementation arrange its
memory in this fashion. Nevertheless, this gives us a typical arrangement to describe.
With Linux on a 32-bit Intel x86 processor, the text segment starts at location
0x08048000, and the bottom of the stack starts just below 0xC0000000. (The stack
grows from higher-numbered addresses to lower-numbered addresses on this particular
architecture.) The unused virtual address space between the top of the heap and the top
of the stack is large.

                    Several more segment types exist in an a.out, containing the symbol table, debugging
                    information, linkage tables for dynamic shared libraries, and the like. These additional
                    sections don't get loaded as part of the program's image executed by a process.

     Note from Figure 7.6 that the contents of the uninitialized data segment are not
stored in the program file on disk, because the kernel sets the contents to 0 before the
program starts running. The only portions of the program that need to be saved in the
program file are the text segment and the initialized data.
206 Process Environment                                                                   Chapter 7

                         high address                          command-line arguments
                                                               and environment variables

                                       stack

                                                    heap       initialized to
                                                               zero by exec
                                           uninitialized data
                                                    (bss)      read from
                                                               program file
                                             initialized data  by exec

                                                     text
                         low address

                         Figure 7.6 Typical memory arrangement

     The size(1) command reports the sizes (in bytes) of the text, data, and bss
segments. For example:

$ size /usr/bin/cc /bin/sh

text data                bss           dec       hex           filename
                                              57337            /usr/bin/cc
346919 3576 6680 357175                       1c1ee            /bin/sh

102134 1776 11272 115182

The fourth and fifth columns are the total of the three sizes, displayed in decimal and
hexadecimal, respectively.

7.7 Shared Libraries
```
- `Bash` -- `sed -n '12358,12524p' /tmp/apue/full.txt`
```
7.8 Memory Allocation

          ISO C specifies three functions for memory allocation:
                1. malloc, which allocates a specified number of bytes of memory. The initial
                     value of the memory is indeterminate.
                2. calloc, which allocates space for a specified number of objects of a specified
                     size. The space is initialized to all 0 bits.
                3. realloc, which increases or decreases the size of a previously allocated area.
                     When the size increases, it may involve moving the previously allocated area
                     somewhere else, to provide the additional room at the end. Also, when the size
                     increases, the initial value of the space between the old contents and the end of
                     the new area is indeterminate.

                  #include <stdlib.h>

                  void *malloc(size_t size);

                  void *calloc(size_t nobj, size_t size);

                  void *realloc(void *ptr, size_t newsize);

                                                                All three return: non-null pointer if OK, NULL on error

                  void free(void *ptr);

          The pointer returned by the three allocation functions is guaranteed to be suitably
          aligned so that it can be used for any data object. For example, if the most restrictive
          alignment requirement on a particular system requires that doubles must start at
          memory locations that are multiples of 8, then all pointers returned by these three
          functions would be so aligned.
208 Process Environment  Chapter 7

     Because the three alloc functions return a generic void * pointer, if we
#include <stdlib.h> (to obtain the function prototypes), we do not explicitly have
to cast the pointer returned by these functions when we assign it to a pointer of a
different type. The default return value for undeclared functions is int, so using a cast
without the proper function declaration could hide an error on systems where the size
of type int differs from the size of a function's return value (a pointer in this case).

     The function free causes the space pointed to by ptr to be deallocated. This freed
space is usually put into a pool of available memory and can be allocated in a later call
to one of the three alloc functions.

     The realloc function lets us change the size of a previously allocated area. (The
most common usage is to increase an area's size.) For example, if we allocate room for
512 elements in an array that we fill in at runtime but later find that we need more
room, we can call realloc. If there is room beyond the end of the existing region for
the requested space, then realloc simply allocates this additional area at the end and
returns the same pointer that we passed it. But if there isn't room, realloc allocates
another area that is large enough, copies the existing 512-element array to the new area,
frees the old area, and returns the pointer to the new area. Because the area may move,
we shouldn't have any pointers into this area. Exercise 4.16 and Figure C.3 show the
use of realloc with getcwd to handle a pathname of any length. Figure 17.27 shows
an example that uses realloc to avoid arrays with fixed, compile-time sizes.

     Note that the final argument to realloc is the new size of the region, not the
difference between the old and new sizes. As a special case, if ptr is a null pointer,
realloc behaves like malloc and allocates a region of the specified newsize.

                    Older versions of these routines allowed us to realloc a block that we had freed since the
                    last call to malloc, realloc, or calloc. This trick dates back to Version 7 and exploited the
                    search strategy of malloc to perform storage compaction. Solaris still supports this feature,
                    but many other platforms do not. This feature is deprecated and should not be used.

     The allocation routines are usually implemented with the sbrk(2) system call. This
system call expands (or contracts) the heap of the process. (Refer to Figure 7.6.) A
sample implementation of malloc and free is given in Section 8.7 of Kernighan and
Ritchie [1988].

     Although sbrk can expand or contract the memory of a process, most versions of
malloc and free never decrease their memory size. The space that we free is
available for a later allocation, but the freed space is not usually returned to the kernel;
instead, that space is kept in the malloc pool.

     Most implementations allocate more space than requested and use the additional
space for record keeping--the size of the block, a pointer to the next allocated block,
and the like. As a consequence, writing past the end or before the start of an allocated
area could overwrite this record-keeping information in another block. These types of
errors are often catastrophic, but difficult to find, because the error may not show up
until much later.

     Writing past the end or before the beginning of a dynamically allocated buffer can
corrupt more than internal record-keeping information. The memory before and after a
dynamically allocated buffer can potentially be used for other dynamically allocated
Section 7.8  Memory Allocation 209

          objects. These objects can be unrelated to the code corrupting them, making it even
          more difficult to find the source of the corruption.

                Other possible errors that can be fatal are freeing a block that was already freed and
          calling free with a pointer that was not obtained from one of the three alloc
          functions. If a process calls malloc but forgets to call free, its memory usage will
          continually increase; this is called leakage. If we do not call free to return unused
          space, the size of a process's address space will slowly increase until no free space is left.
          During this time, performance can degrade from excess paging overhead.

                Because memory allocation errors are difficult to track down, some systems provide
          versions of these functions that do additional error checking every time one of the three
          alloc functions or free is called. These versions of the functions are often specified
          by including a special library for the link editor. There are also publicly available
          sources that you can compile with special flags to enable additional runtime checking.

                                  FreeBSD, Mac OS X, and Linux support additional debugging through the setting of
                                  environment variables. In addition, options can be passed to the FreeBSD library through the
                                  symbolic link /etc/malloc.conf.

Alternate Memory Allocators

          Many replacements for malloc and free are available. Some systems already include
          libraries providing alternative memory allocator implementations. Other systems
          provide only the standard allocator, leaving it up to software developers to download
          alternatives, if desired. We discuss some of the alternatives here.

libmalloc

          SVR4-based systems, such as Solaris, include the libmalloc library, which provides a
          set of interfaces matching the ISO C memory allocation functions. The libmalloc
          library includes mallopt, a function that allows a process to set certain variables that
          control the operation of the storage allocator. A function called mallinfo is also
          available to provide statistics on the memory allocator.

vmalloc

          Vo [1996] describes a memory allocator that allows processes to allocate memory using
          different techniques for different regions of memory. In addition to the functions
          specific to vmalloc, the library provides emulations of the ISO C memory allocation
          functions.

quick-fit

          Historically, the standard malloc algorithm used either a best-fit or a first-fit memory
          allocation strategy. Quick-fit is faster than either, but tends to use more memory.
          Weinstock and Wulf [1988] describe the algorithm, which is based on splitting up
          memory into buffers of various sizes and maintaining unused buffers on different free
          lists, depending on the buffer sizes. Most modern allocators are based on quick-fit.
210 Process Environment  Chapter 7

jemalloc

          The jemalloc implementation of the malloc family of library functions is the default
          memory allocator in FreeBSD 8.0. It was designed to scale well when used with
          multithreaded applications running on multiprocessor systems. Evans [2006] describes
          the implementation and evaluates its performance.

TCMalloc

          TCMalloc was designed as a replacement for the malloc family of functions to
          provide high performance, scalability, and memory efficiency. It uses thread-local
          caches to avoid locking overhead when allocating buffers from and releasing buffers to
          the cache. It also has a heap checker and a heap profiler built in to aid in debugging
          and analyzing dynamic memory usage. The TCMalloc library is available as open
          source from Google. It is briefly described by Ghemawat and Menage [2005].

alloca Function

          One additional function is also worth mentioning. The function alloca has the same
          calling sequence as malloc; however, instead of allocating memory from the heap, the
          memory is allocated from the stack frame of the current function. The advantage is that
          we don't have to free the space; it goes away automatically when the function returns.
          The alloca function increases the size of the stack frame. The disadvantage is that
          some systems can't support alloca, if it's impossible to increase the size of the stack
          frame after the function has been called. Nevertheless, many software packages use it,
          and implementations exist for a wide variety of systems.

                                  All four platforms discussed in this text provide the alloca function.

7.9 Environment Variables
```
- `Bash` -- `sed -n '12900,13091p' /tmp/apue/full.txt`
```
to in the variable jmpbuffer and returns 0. We then call do_line, which calls
cmd_add, and assume that an error of some form is detected. Before the call to
longjmp in cmd_add, the stack looks like that in Figure 7.10. But longjmp causes the
stack to be ``unwound'' back to the main function, throwing away the stack frames for
cmd_add and do_line (Figure 7.12). Calling longjmp causes the setjmp in main to
return, but this time it returns with a value of 1 (the second argument for longjmp).

              bottom of stack               higher address

                               stack frame
                                for main

               direction of                 lower address
              stack growth

              Figure 7.12 Stack frame after longjmp has been called

Automatic, Register, and Volatile Variables

          We've seen what the stack looks like after calling longjmp. The next question is, ``What
          are the states of the automatic variables and register variables in the main function?''
          When we return to main as a result of the longjmp, do these variables have values
          corresponding to those when the setjmp was previously called (i.e., are their values
          rolled back), or are their values left alone so that their values are whatever they were
          when do_line was called (which caused cmd_add to be called, which caused
          longjmp to be called)? Unfortunately, the answer is ``It depends.'' Most
          implementations do not try to roll back these automatic variables and register variables,
          but the standards say only that their values are indeterminate. If you have an automatic
          variable that you don't want rolled back, define it with the volatile attribute.
          Variables that are declared as global or static are left alone when longjmp is executed.

Example

          The program in Figure 7.13 demonstrates the different behavior that can be seen with
          automatic, global, register, static, and volatile variables after calling longjmp.
218 Process Environment                                                               Chapter 7

#include "apue.h"
#include <setjmp.h>

static void f1(int, int, int, int);
static void f2(void);

static jmp_buf jmpbuffer;

static int               globval;

int                      autoval;
main(void)               regival;
{                        volaval;
                         statval;
       int
       register int
       volatile int
       static int

globval = 1; autoval = 2; regival = 3; volaval = 4; statval = 5;

if (setjmp(jmpbuffer) != 0) {
       printf("after longjmp:\n");
       printf("globval = %d, autoval = %d, regival = %d,"
              " volaval = %d, statval = %d\n",
              globval, autoval, regival, volaval, statval);
       exit(0);

}

/*          variables after setjmp, but  before longjmp.
 * Change                                97; volaval = 98;
 */         95; autoval = 96; regival =
            99;
globval =
statval =

       f1(autoval, regival, volaval, statval); /* never returns */
       exit(0);
}

static void
f1(int i, int j, int k, int l)
{

       printf("in f1():\n");
       printf("globval = %d, autoval = %d, regival = %d,"

              " volaval = %d, statval = %d\n", globval, i, j, k, l);
       f2();
}

static void
f2(void)
{

       longjmp(jmpbuffer, 1);
}

                         Figure 7.13 Effect of longjmp on various types of variables
Section 7.10                      setjmp and longjmp Functions 219

If we compile and test the program in Figure 7.13, with and without compiler
optimizations, the results are different:

              $ gcc testjmp.c     compile without any optimization

              $ ./a.out

              in f1():

              globval = 95, autoval = 96, regival = 97, volaval = 98, statval = 99

              after longjmp:

              globval = 95, autoval = 96, regival = 97, volaval = 98, statval = 99

              $ gcc -O testjmp.c  compile with full optimization

              $ ./a.out

              in f1():

              globval = 95, autoval = 96, regival = 97, volaval = 98, statval = 99

              after longjmp:

              globval = 95, autoval = 2, regival = 3, volaval = 98, statval = 99

Note that the optimizations don't affect the global, static, and volatile variables; their
values after the longjmp are the last values that they assumed. The setjmp(3) manual
page on one system states that variables stored in memory will have values as of the
time of the longjmp, whereas variables in the CPU and floating-point registers are
restored to their values when setjmp was called. This is indeed what we see when we
run the program in Figure 7.13. Without optimization, all five variables are stored in
memory (the register hint is ignored for regival). When we enable optimization,
both autoval and regival go into registers, even though the former wasn't declared
register, and the volatile variable stays in memory. The important thing to realize
with this example is that you must use the volatile attribute if you're writing
portable code that uses nonlocal jumps. Anything else can change from one system to
the next.

     Some printf format strings in Figure 7.13 are longer than will fit comfortably for
display in a programming text. Instead of making multiple calls to printf, we rely on
ISO C's string concatenation feature, where the sequence

      "string1" "string2"

is equivalent to
      "string1string2"

     We'll return to these two functions, setjmp and longjmp, in Chapter 10 when we
discuss signal handlers and their signal versions: sigsetjmp and siglongjmp.

Potential Problem with Automatic Variables

          Having looked at the way stack frames are usually handled, it is worth looking at a
          potential error in dealing with automatic variables. The basic rule is that an automatic
          variable can never be referenced after the function that declared it returns. Numerous
          warnings about this can be found throughout the UNIX System manuals.

                Figure 7.14 shows a function called open_data that opens a standard I/O stream
          and sets the buffering for the stream.
220 Process Environment                                                        Chapter 7

#include <stdio.h>

FILE *                        /* setvbuf makes this the stdio buffer */
open_data(void)
{

       FILE *fp;
       char databuf[BUFSIZ];

   if ((fp = fopen("datafile", "r")) == NULL)

   return(NULL);

   if (setvbuf(fp, databuf, _IOLBF, BUFSIZ) != 0)

   return(NULL);

   return(fp);           /* error */

}

                         Figure 7.14 Incorrect usage of an automatic variable

The problem is that when open_data returns, the space it used on the stack will be
used by the stack frame for the next function that is called. But the standard I/O library
will still be using that portion of memory for its stream buffer. Chaos is sure to result.
To correct this problem, the array databuf needs to be allocated from global memory,
either statically (static or extern) or dynamically (one of the alloc functions).

7.11 getrlimit and setrlimit Functions
```
- `Bash` -- `sed -n '13091,13418p' /tmp/apue/full.txt`
```
7.11 getrlimit and setrlimit Functions

          Every process has a set of resource limits, some of which can be queried and changed by
          the getrlimit and setrlimit functions.

                  #include <sys/resource.h>
                  int getrlimit(int resource, struct rlimit *rlptr);
                  int setrlimit(int resource, const struct rlimit *rlptr);

                                                                                              Both return: 0 if OK, -1 on error

   These two functions are defined in the XSI option in the Single UNIX Specification. The
   resource limits for a process are normally established by process 0 when the system is
   initialized and then inherited by each successive process. Each implementation has its own
   way of tuning the various limits.

     Each call to these two functions specifies a single resource and a pointer to the
following structure:

   struct rlimit {       /* soft limit: current limit */
      rlim_t rlim_cur;   /* hard limit: maximum value for rlim_cur */
      rlim_t rlim_max;

   };
Section 7.11     getrlimit and setrlimit Functions 221

Three rules govern the changing of the resource limits.

              1. A process can change its soft limit to a value less than or equal to its hard limit.
              2. A process can lower its hard limit to a value greater than or equal to its soft

                  limit. This lowering of the hard limit is irreversible for normal users.
              3. Only a superuser process can raise a hard limit.

An infinite limit is specified by the constant RLIM_INFINITY.
     The resource argument takes on one of the following values. Figure 7.15 shows

which limits are defined by the Single UNIX Specification and supported by each
implementation.

RLIMIT_AS        The maximum size in bytes of a process's total available
RLIMIT_CORE      memory. This affects the sbrk function (Section 1.11) and the
RLIMIT_CPU       mmap function (Section 14.8).
RLIMIT_DATA
RLIMIT_FSIZE     The maximum size in bytes of a core file. A limit of 0 prevents
RLIMIT_MEMLOCK   the creation of a core file.
RLIMIT_MSGQUEUE
RLIMIT_NICE      The maximum amount of CPU time in seconds. When the
RLIMIT_NOFILE    soft limit is exceeded, the SIGXCPU signal is sent to the
                 process.
RLIMIT_NPROC
RLIMIT_NPTS      The maximum size in bytes of the data segment: the sum of
                 the initialized data, uninitialized data, and heap from
                 Figure 7.6.

                 The maximum size in bytes of a file that may be created.
                 When the soft limit is exceeded, the process is sent the
                 SIGXFSZ signal.

                 The maximum amount of memory in bytes that a process can
                 lock into memory using mlock(2).

                 The maximum amount of memory in bytes that a process can
                 allocate for POSIX message queues.

                 The limit to which a process's nice value (Section 8.16) can be
                 raised to affect its scheduling priority.

                 The maximum number of open files per process. Changing
                 this limit affects the value returned by the sysconf function
                 for its _SC_OPEN_MAX argument (Section 2.5.4). See
                 Figure 2.17 also.

                 The maximum number of child processes per real user ID.
                 Changing this limit affects the value returned for
                 _SC_CHILD_MAX by the sysconf function (Section 2.5.4).

                 The maximum number of pseudo terminals (Chapter 19) that
                 a user can have open at one time.
222 Process Environment                                                              Chapter 7

RLIMIT_RSS               Maximum resident set size (RSS) in bytes. If available
                         physical memory is low, the kernel takes memory from
RLIMIT_SBSIZE            processes that exceed their RSS.
RLIMIT_SIGPENDING
                         The maximum size in bytes of socket buffers that a user can
RLIMIT_STACK             consume at any given time.
RLIMIT_SWAP
RLIMIT_VMEM              The maximum number of signals that can be queued for a
                         process. This limit is enforced by the sigqueue function
                         (Section 10.20).

                         The maximum size in bytes of the stack. See Figure 7.6.

                         The maximum amount of swap space in bytes that a user can
                         consume.

                         This is a synonym for RLIMIT_AS.

Limit                    XSI  FreeBSD  Linux                      Mac OS X  Solaris
                                 8.0   3.2.0                        10.6.8    10
RLIMIT_AS                �                                                     �
                                  �       �                            �       �
RLIMIT_CORE              �        �       �                            �       �
                                  �       �                            �       �
RLIMIT_CPU               �        �       �                            �       �
                                  �       �                            �
RLIMIT_DATA              �        �       �                                    �
                                          �                            �
RLIMIT_FSIZE             �        �       �                            �       �
                                  �       �                                    �
RLIMIT_MEMLOCK                    �       �                            �
                                  �
RLIMIT_MSGQUEUE                   �       �                            �

RLIMIT_NICE                       �       �
                                  �       �
RLIMIT_NOFILE            �

RLIMIT_NPROC

RLIMIT_NPTS

RLIMIT_RSS

RLIMIT_SBSIZE

RLIMIT_SIGPENDING

RLIMIT_STACK             �

RLIMIT_SWAP

RLIMIT_VMEM

                         Figure 7.15 Support for resource limits

                The resource limits affect the calling process and are inherited by any of its children.
          This means that the setting of resource limits needs to be built into the shells to affect all
          our future processes. Indeed, the Bourne shell, the GNU Bourne-again shell, and the
          Korn shell have the built-in ulimit command, and the C shell has the built-in limit
          command. (The umask and chdir functions also have to be handled as shell built-ins.)

Example

          The program in Figure 7.16 prints out the current soft limit and hard limit for all the
          resource limits supported on the system. To compile this program on all the various
Section 7.11  getrlimit and setrlimit Functions 223

implementations, we have conditionally included the resource names that differ. Note
that some systems define rlim_t to be an unsigned long long instead of an
unsigned long. This definition can even change on the same system, depending on
whether we compile the program to support 64-bit files. Some limits apply to file size,
so the rlim_t type has to be large enough to represent a file size limit. To avoid
compiler warnings that use the wrong format specification, we first copy the limit into a
64-bit integer so that we have to deal with only one format.

#include "apue.h"
#include <sys/resource.h>

#define doit(name) pr_limits(#name, name)

static void pr_limits(char *, int);

int
main(void)
{
#ifdef RLIMIT_AS

       doit(RLIMIT_AS);
#endif

       doit(RLIMIT_CORE);
       doit(RLIMIT_CPU);
       doit(RLIMIT_DATA);
       doit(RLIMIT_FSIZE);

#ifdef RLIMIT_MEMLOCK
       doit(RLIMIT_MEMLOCK);

#endif

#ifdef RLIMIT_MSGQUEUE
       doit(RLIMIT_MSGQUEUE);

#endif

#ifdef RLIMIT_NICE
       doit(RLIMIT_NICE);

#endif

       doit(RLIMIT_NOFILE);

#ifdef RLIMIT_NPROC
       doit(RLIMIT_NPROC);

#endif

#ifdef RLIMIT_NPTS
       doit(RLIMIT_NPTS);

#endif

#ifdef RLIMIT_RSS
       doit(RLIMIT_RSS);

#endif

#ifdef RLIMIT_SBSIZE
       doit(RLIMIT_SBSIZE);
224 Process Environment                                                 Chapter 7

#endif

#ifdef RLIMIT_SIGPENDING
       doit(RLIMIT_SIGPENDING);

#endif

   doit(RLIMIT_STACK);

#ifdef RLIMIT_SWAP
       doit(RLIMIT_SWAP);

#endif

#ifdef RLIMIT_VMEM
       doit(RLIMIT_VMEM);

#endif

       exit(0);
}

static void

pr_limits(char *name, int resource)

{

   struct rlimit           limit;

   unsigned long long lim;

       if (getrlimit(resource, &limit) < 0)
              err_sys("getrlimit error for %s", name);

       printf("%-14s ", name);
       if (limit.rlim_cur == RLIM_INFINITY) {

              printf("(infinite) ");
       } else {

              lim = limit.rlim_cur;
              printf("%10lld ", lim);
       }
       if (limit.rlim_max == RLIM_INFINITY) {
              printf("(infinite)");
       } else {
              lim = limit.rlim_max;
              printf("%10lld", lim);
       }
       putchar((int)'\n');
}

                         Figure 7.16 Print the current resource limits

     Note that we've used the ISO C string-creation operator (#) in the doit macro, to
generate the string value for each resource name. When we say

      doit(RLIMIT_CORE);

the C preprocessor expands this into
      pr_limits("RLIMIT_CORE", RLIMIT_CORE);
Section 7.12                                                       Summary 225

Running this program under FreeBSD gives us the following output:

              $ ./a.out       (infinite)       (infinite)
              RLIMIT_AS       (infinite)       (infinite)
              RLIMIT_CORE     (infinite)       (infinite)
              RLIMIT_CPU
              RLIMIT_DATA      536870912        536870912
              RLIMIT_FSIZE    (infinite)       (infinite)
              RLIMIT_MEMLOCK  (infinite)       (infinite)
              RLIMIT_NOFILE
              RLIMIT_NPROC              3520             3520
              RLIMIT_NPTS               1760             1760
              RLIMIT_RSS      (infinite)       (infinite)
              RLIMIT_SBSIZE   (infinite)       (infinite)
              RLIMIT_STACK    (infinite)       (infinite)
              RLIMIT_SWAP        67108864         67108864
              RLIMIT_VMEM     (infinite)       (infinite)
                              (infinite)       (infinite)

Solaris gives us the following results:

              $ ./a.out       (infinite)       (infinite)
              RLIMIT_AS       (infinite)       (infinite)
              RLIMIT_CORE     (infinite)       (infinite)
              RLIMIT_CPU      (infinite)       (infinite)
              RLIMIT_DATA     (infinite)       (infinite)
              RLIMIT_FSIZE
              RLIMIT_NOFILE               256           65536
              RLIMIT_STACK         8388608     (infinite)
              RLIMIT_VMEM     (infinite)       (infinite)

Exercise 10.11 continues the discussion of resource limits, after we've covered signals.

7.12 Summary

          Understanding the environment of a C program within a UNIX system's environment is
          a prerequisite to understanding the process control features of the UNIX System. In this
          chapter, we've looked at how a process is started, how it can terminate, and how it's
          passed an argument list and an environment. Although both the argument list and the
          environment are uninterpreted by the kernel, it is the kernel that passes both from the
          caller of exec to the new process.

                We've also examined the typical memory layout of a C program and seen how a
          process can dynamically allocate and free memory. It is worthwhile to look in detail at
          the functions available for manipulating the environment, since they involve memory
          allocation. The functions setjmp and longjmp were presented, providing a way to
          perform nonlocal branching within a process. We finished the chapter by describing the
          resource limits that various implementations provide.
226 Process Environment                Chapter 7

Exercises
```
- `Bash` -- `cd "D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\Lecture" && for f in "Week - 1/Lec01.pdf" "Week - 1/Lec02.pdf" "Week - 2/Lec03.pdf" "Week - 2/Lec04.pdf" "Week - 3/Lec05.pdf" "Week - 3/Lec06.pdf"; do
  out="/tmp/apue/$(basename "$f" .pdf).txt"
  pdftotext -layout "$f" "$out" 2>&1
  echo "$f -> $out ($(wc -l < "$out") lines)"
done`
```
Week - 1/Lec01.pdf -> /tmp/apue/Lec01.txt (926 lines)
Week - 1/Lec02.pdf -> /tmp/apue/Lec02.txt (643 lines)
Week - 2/Lec03.pdf -> /tmp/apue/Lec03.txt (770 lines)
Week - 2/Lec04.pdf -> /tmp/apue/Lec04.txt (640 lines)
Week - 3/Lec05.pdf -> /tmp/apue/Lec05.txt (635 lines)
Week - 3/Lec06.pdf -> /tmp/apue/Lec06.txt (700 lines)
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash` -- `grep -il "setjmp\|rlimit\|longjmp" /tmp/apue/Lec0*.txt; echo "---none found means no matches---"`
```
---none found means no matches---
```
- `Read` -- `C:\Users\anant\AppData\Local\Temp\apue\Lec01.txt`
- `Read` -- `C:\Users\anant\AppData\Local\Temp\apue\Lec02.txt`
- `Bash` -- `grep -n "PATH\|LD_PRELOAD\|LD_LIBRARY_PATH\|environ\|getenv\|setenv" /tmp/apue/Lec03.txt | head -40`
```
101: called environment variables
103:� Each environment variable has a name and a value
109:� Each process has its own environment (values for env. vars)
111:� A process inherits the environment of its parent
114:The PATH Environment Variable
118:    � LD_PRELOAD: Look for custom libraries to interpose
119:    � LD_LIBRARY_PATH: Look for libraries to use for linking (besides default folders)
121:� PATH is arguably the most important environment variable
127:      through the folders in PATH to find program with matching name
132:    � But they are stored in a directory listed in the PATH environment variable
138: variable char **environ
143:    � setenv()
144:    � getenv()
145:    � unsetenv()
162:     � execlp/execvp: p is for PATH -- search for program name in PATH folders
163:     � execvpe: Use PATH for search, specify environment
180:      � New arguments, (possibly) new environment
```
- `Bash` -- `cd "D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\Lecture\Transcripts\Week 1 - 3" && for f in *.txt; do echo "$f: $(wc -l < "$f") lines, $(wc -c < "$f") bytes"; done`
```
en-CSCI 4061 September 8 lecture (multi-source).txt: 1286 lines, 63296 bytes
en-CSCI 4061-10 September 10 Lecture (multi-source).txt: 1123 lines, 54862 bytes
en-CSCI 4061-10 September 15 Lecture (multi-source).txt: 1089 lines, 53244 bytes
en-CSCI 4061-10 September 17 Lecture (multi-source).txt: 1073 lines, 52860 bytes
en-CSCI 4061-10 September 22 Lecture (multi-source).txt: 1143 lines, 57330 bytes
en-CSCI 4061-10 September 24 Lecture (multi-source).txt: 1062 lines, 52322 bytes
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Read` -- `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\Lecture\Transcripts\Week 1 - 3\en-CSCI 4061 September 8 lecture (multi-source).txt`
- `Read` -- `C:\Users\anant\AppData\Local\Temp\apue\Lec03.txt`
- `Read` -- `C:\Users\anant\AppData\Local\Temp\apue\Lec04.txt`
- `Read` -- `C:\Users\anant\AppData\Local\Temp\apue\Lec05.txt`
- `Read` -- `C:\Users\anant\AppData\Local\Temp\apue\Lec06.txt`
- `Read` -- `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\csci4061-fa26\.devcontainer\devcontainer.json`
- `Read` -- `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\csci4061-fa26\Labs\lab01-code\QUESTIONS.txt`
- `Glob` -- pattern `**/Jarvis Writing and Formatting*` path ``
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\60_Claude\07_AI_Information\Jarvis Writing and Formatting.md`
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Chapter - 1.md`
```
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
next: "Feed this chapter into Week - 1's Textbook integration section, then build Week - 1"
---
# Chapter - 1 — UNIX System Overview
**Source:** W. Richard Stevens and Stephen A. Rago, *Advanced Programming in the UNIX Environment*, 3rd ed. (Addison-Wesley, 2013), Chapter 1, pp. 1-24.
**Read from:** `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\Textbook\Advanced Programming in the UNIX Environment, 3rd Edition.pdf`
**Course role:** Week 1 reading, paired with Chapters 7 and 8. Lec01 (9/8) uses this chapter only for orientation vocabulary (referee/illusionist/glue, the layer diagram, the three-program Hello World exercise) - it does not walk the chapter section by section, so several sections below (1.3, 1.4, 1.7, 1.8, 1.9, 1.10) are textbook-only content with no matching slide.
## Chapter Summary
UNIX exposes hardware and kernel services to every program through one disciplined boundary, the ==system call interface==, and everything else in this chapter (shell, files, processes, signals, time, error codes) is a convention built on top of that boundary (p. 1).
*Mechanism:* The kernel is the only software allowed to touch hardware directly. System calls are the sole entry points into it (p. 1). The C standard library wraps those calls in more convenient functions, and the shell is just another application that uses those library and system-call layers to launch other applications (p. 1-2). Course framing (Lec01) restates this as three OS roles: **referee** (enforces isolation and shares CPU/memory safely between processes), **illusionist** (fakes a dedicated, infinite machine for each process via virtual memory/virtual CPUs), and **glue** (unifies wildly different hardware behind one file/process/socket API).
## Key Concepts
- **operating system**: Software that controls hardware resources and provides an environment under which programs run (p. 1).
- **kernel**: Software that provides the core operating system environment and resource control (p. 1).
- **system call**: Direct software layer interface providing entry points into the kernel (p. 1).
- **shell**: Command-line interpreter application that provides an interface to execute other applications (p. 2).
- **referee**: OS role managing hardware resources, enforcing isolation, and protecting processes (Lec01).
- **illusionist**: OS role providing virtualized abstractions such as virtual memory and processors (Lec01).
- **glue**: OS role offering unified system services, file systems, and device abstractions (Lec01).
- **login name**: User identifier entered at login to look up user account records (p. 2).
- **password file**: System database located at `/etc/passwd` storing user account fields (p. 2).
- **user ID**: Numeric value identifying a user to the kernel for permission checks (p. 2).
- **root** / **superuser**: Special user ID 0 possessing full privileges to bypass permission checks (p. 16).
- **group ID**: Numeric value assigning users to shared departmental/project resources (p. 2).
- **home directory**: Initial working directory set upon login from `/etc/passwd` (p. 2).
- **shell script**: File containing shell commands executed by an interpreter (p. 3).
- **file system**: Hierarchical tree arrangement of directories and files (p. 4).
- **root directory**: The top-level directory of the file system hierarchy, designated as `/` (p. 4).
- **directory**: File containing directory entries linking filenames to file attribute structures (p. 4).
- **directory entry**: Record inside a directory linking a filename to an i-node/stat structure (p. 4).
- **stat** / **fstat**: Functions returning file attributes and metadata (p. 4).
- **dot**: Directory entry `.` referring to the current directory (p. 4).
- **dot-dot**: Directory entry `..` referring to the parent directory (p. 4).
- **pathname**: Sequence of slash-separated filenames resolving a file location (p. 5).
- **absolute pathname**: Pathname starting with `/` that resolves relative to root (p. 5).
- **relative pathname**: Pathname not starting with `/` that resolves relative to current working directory (p. 5).
- **working directory**: Current process directory context used to evaluate relative pathnames (p. 8).
- **file descriptor**: Non-negative integer used by the kernel to identify open process files (p. 8).
- **standard input**: Default input file descriptor 0 (`STDIN_FILENO`) (p. 8).
- **standard output**: Default output file descriptor 1 (`STDOUT_FILENO`) (p. 8).
- **standard error**: Default error output file descriptor 2 (`STDERR_FILENO`) (p. 8).
- **unbuffered I/O**: Direct I/O system calls (`read`, `write`) executing immediately in kernel (p. 8).
- **standard I/O**: High-level C library I/O functions providing user-level buffering (p. 10).
- **program**: Executable file residing on disk (p. 10).
- **process**: An executing instance of a program in memory (p. 11).
- **process ID**: Unique non-negative integer identifying an active process (p. 11).
- **parent process**: Calling process that spawns a new process via `fork()` (p. 11).
- **child process**: Newly created process produced by `fork()` (p. 11).
- **thread**: Thread of control executing within a process address space, sharing that process's address space and file descriptors (p. 14).
- **errno**: Global/thread-local variable holding system call error codes (p. 14).
- **fatal error**: Unrecoverable system error requiring termination (p. 16).
- **nonfatal error**: Recoverable temporary error eligible for retry (p. 16).
- **supplementary group ID**: Additional group membership assigned to a user process (p. 18).
- ==**signal**==: Asynchronous software notification delivered to a process by the kernel (p. 18).
- **signal handler**: Function registered by a process to catch and process specific signals (p. 19).
- **calendar time**: Seconds elapsed since the Epoch, represented by `time_t` (p. 20).
- **Epoch**: Starting point of calendar time: 00:00:00 Jan 1, 1970 UTC (p. 20).
- **process time** / **CPU time**: Central processor resource time consumed by a process in clock ticks (p. 20).
- **clock tick**: Hardware frequency unit measuring CPU time intervals (p. 20).
- **clock time** / **wall clock time**: Real elapsed time required to execute a process (p. 20).
- **user CPU time**: CPU execution time spent in user code instructions (p. 21).
- **system CPU time**: CPU execution time spent in kernel code for system calls (p. 21).
## Full Reading Notes
### 1.1 Introduction
An **operating system** provides services for running programs: executing a new program, opening and reading a file, allocating a region of memory, retrieving the current time of day, and similar tasks (p. 1). The chapter is a whirlwind tour of UNIX terminology from a programmer's perspective, described here in much more compressed form than any later chapter treats it (p. 1).
### 1.2 UNIX Architecture
In a strict sense, an operating system is the software that controls the hardware resources of the computer and provides an environment under which programs can run - the **kernel** (p. 1). The interface to the kernel is a layer of software called **system calls** (p. 1). Libraries of common functions are built on top of the system-call interface, but applications are free to use either layer directly (p. 1-2). The **shell** is a special application that provides an interface for running other applications - not part of the OS itself, just a regular program (p. 2).
In a broad sense, an operating system consists of the kernel plus all the other software that gives a computer its personality: utilities, applications, shells, and common-function libraries (p. 2). Linux is technically only the kernel of the GNU/Linux combination, but "Linux" is commonly used for the whole broad-sense system - not strictly correct, but understandable given the two meanings of "operating system" (p. 2).
*Course Framing (Lec01):* The System-Call-API layer sits directly between user application code and the kernel; contemporary systems adhere to open standardization, so APUE "would more accurately be titled POSIX Systems Programming" (Lec01). ==In a strict sense, an operating system is the software called the kernel that controls hardware resources and provides an environment under which programs run, accessible only via system calls.==
> [!NOTE]
> "UNIX" and "POSIX" get used almost interchangeably in this course, and that is not fully precise. POSIX is the standardized API that Linux (and most modern UNIX-derived systems) implements; UNIX is the older lineage POSIX was standardized from. Lec01 flags this directly: you will hear people say "UNIX" when they mean "POSIX," and you have to get used to it rather than expect strict terminology.
### 1.3 Logging In
*Login Name:* Logging in requires entering a **login name** and password, which the system looks up in the **password file**, usually stored at `/etc/passwd` (p. 2). Password file entries consist of seven colon-separated fields: login name, encrypted password, numeric **user ID** (e.g. 205), numeric **group ID** (e.g. 105), a comment field, **home directory** (e.g. `/home/sar`), and login shell program (e.g. `/bin/ksh`) - shown concretely as `sar:x:205:105:Stephen Rago:/home/sar:/bin/ksh` (p. 2). All contemporary systems have moved the encrypted password itself to a different, more restricted file (p. 2).
*Shells:* A shell is a command-line interpreter reading user input interactively from a terminal or from a **shell script** file (p. 3). Common shell implementations include Bourne shell (`sh`), C shell (`csh`), Korn shell (`ksh`), Bourne-again shell (`bash`), TENEX C shell (`tcsh`), and Z shell (`zsh`) (p. 3).
### 1.4 Files and Directories
*File System:* The UNIX **file system** is a hierarchical arrangement of directories and files starting at the **root directory**, designated by `/` (p. 4). A **directory** is a file containing **directory entries**, each logically linking a filename to a structure describing that file's attributes (type, size, owner, permissions, modification time), retrieved via the **stat** and **fstat** functions (p. 4). Most real UNIX file systems don't actually store attributes inside the directory entry itself - that becomes clear once hard links are covered in Chapter 4, since one file can have several directory entries pointing at the same attributes (p. 4).
*Filenames:* The only two characters that cannot appear in a filename are `/` and the null character, but POSIX.1 recommends restricting filenames to letters, numbers, `.`, `-`, and `_` for portability and to avoid shell quoting headaches (p. 4). Historical UNIX limited filenames to 14 characters; BSD extended this to 255, and essentially all modern UNIX file systems support at least 255-character filenames (p. 5).
Creating a directory automatically generates two entries: **dot** (`.`, the current directory) and **dot-dot** (`..`, the parent directory); in the root directory, `..` is identical to `.` (p. 4).
*Pathnames:* A **pathname** is a slash-separated sequence of filenames. An **absolute pathname** begins with `/` and resolves from root; a **relative pathname** does not begin with `/` and resolves relative to the current working directory (p. 5).
*Example Code (ls implementation):* A bare-bones `ls(1)`-style directory listing program (p. 5-7):
```c
#include "apue.h"
#include <dirent.h>

int main(int argc, char *argv[]) {
    DIR *dp;
    struct dirent *dirp;
    if (argc != 2)
        err_quit("usage: ls directory_name");
    if ((dp = opendir(argv[1])) == NULL)
        err_sys("can't open %s", argv[1]);
    while ((dirp = readdir(dp)) != NULL)
        printf("%s\n", dirp->d_name);
    closedir(dp);
    exit(0);
}
```
Program details: includes the book's own header `apue.h` (Appendix B) and `<dirent.h>`, calls `opendir()` to get a `DIR *`, loops with `readdir()` to read `struct dirent` records and print `d_name`, closes the stream with `closedir()`, and handles errors via `err_sys`/`err_quit` (p. 7). Compiled with `cc myls.c` (or `gcc` on systems where `cc` is linked to it) into `a.out` (p. 6). Running it produces unsorted output, because this program doesn't sort - `ls` itself sorts before printing (p. 7):
```text
$ ./a.out /dev
.
..
cdrom
stderr
...
$ ./a.out /etc/ssl/private
can't open /etc/ssl/private: Permission denied
$ ./a.out /dev/tty
can't open /dev/tty: Not a directory
```
The notation `ls(1)` refers to the `ls` entry in Section 1 of the UNIX manual pages; sections run 1 through 8, alphabetized within each (p. 5-6). `man 1 ls` or `man -s1 ls` looks it up directly (p. 6). By convention, `exit(0)` means success and 1-255 means an error occurred - Section 8.5 covers how a calling program retrieves that exit status (p. 7).
*Working and Home Directories:* Every process has a **working directory** from which relative pathnames are evaluated, changed via `chdir` (p. 8). `doc/memo/joe` (relative) requires `doc` and `memo` to be directories, but the pathname alone doesn't reveal whether `joe` is a file or directory; `/usr/lib/lint` is absolute and always resolves from root (p. 8). Upon login, the working directory is set to the home directory from `/etc/passwd` (p. 8).
### 1.5 Input and Output
*File Descriptors:* **File descriptors** are small non-negative integers the kernel uses to identify files a process has open (p. 8). By convention every shell opens **standard input** (fd 0, `STDIN_FILENO`), **standard output** (fd 1, `STDOUT_FILENO`), and **standard error** (fd 2, `STDERR_FILENO`) for a new program, all connected to the terminal unless redirected - `ls > file.list` redirects only standard output (p. 8-9).
*Unbuffered I/O:* Provided directly by the system calls `open`, `read`, `write`, `lseek`, `close` (p. 8). Copying standard input to standard output with raw system calls (p. 8-9):
```c
#include "apue.h"
#define BUFFSIZE 4096
int main(void) {
    int n;
    char buf[BUFFSIZE];
    while ((n = read(STDIN_FILENO, buf, BUFFSIZE)) > 0)
        if (write(STDOUT_FILENO, buf, n) != n)
            err_sys("write error");
    if (n < 0)
        err_sys("read error");
    exit(0);
}
```
`read` returns the number of bytes read (0 at end of file, -1 on error), and that count is reused directly as the byte count to `write` (p. 9). Running `./a.out > data` copies typed lines to `data` until Ctrl-D (end of file); `./a.out < infile > outfile` copies one file to another entirely through this loop (p. 9).
*Standard I/O:* The **standard I/O** functions buffer the unbuffered calls above, sparing the caller from picking a buffer size and simplifying line-based input like `fgets` (p. 10). Character-at-a-time copy using `getc`/`putc` (p. 10):
```c
#include "apue.h"
int main(void) {
    int c;
    while ((c = getc(stdin)) != EOF)
        if (putc(c, stdout) == EOF)
            err_sys("output error");
    if (ferror(stdin))
        err_sys("input error");
    exit(0);
}
```
*Course Framing (Lec01 Hello World Exercise):* Lec01 contrasts three implementations of printing "Hello, World!" that map directly onto the unbuffered-vs-buffered distinction above:
1. C standard library call: `printf("Hello, World!\n");` - buffered C stdio.
2. Direct system call wrapper: `write(STDOUT_FILENO, message, strlen(message));` - unbuffered kernel write.
3. Hand-written x86-64 assembly: loads 1 into `%rax` (syscall number for `write`), 1 into `%rdi` (`STDOUT_FILENO`), the message address into `%rsi`, length 14 into `%rdx`, then executes `syscall` directly (Lec01).
### 1.6 Programs and Processes
*Program:* A **program** is an executable file on disk, read into memory and executed by the kernel via one of seven `exec` functions (p. 10).
*Process and Process ID:* A **process** is an executing instance of a program (p. 11). Every process has a unique non-negative **process ID**, obtained via `getpid()` and cast to `long` for portable printing (p. 11):
```c
#include "apue.h"
int main(void) {
    printf("hello world from process ID %ld\n", (long)getpid());
    exit(0);
}
```
Running this twice in a row gives two different PIDs, e.g. `851` then `854` (p. 11) - each run is a fresh process.
*Process Control:* The three primary process-control functions are `fork`, `exec`, and `waitpid` (p. 11). `fork` creates a new process where the caller is the **parent process** and the new process is the **child process**; it is called once but returns twice (child PID to the parent, 0 to the child) (p. 11-13). A bare-bones shell that reads and runs commands (p. 11-13):
```c
#include "apue.h"
#include <sys/wait.h>
int main(void) {
    char buf[MAXLINE];
    pid_t pid;
    int status;
    printf("%% ");
    while (fgets(buf, MAXLINE, stdin) != NULL) {
        if (buf[strlen(buf) - 1] == '\n')
            buf[strlen(buf) - 1] = 0;
        if ((pid = fork()) < 0) {
            err_sys("fork error");
        } else if (pid == 0) {
            execlp(buf, buf, (char *)0);
            err_ret("couldn't execute: %s", buf);
            exit(127);
        }
        if ((pid = waitpid(pid, &status, 0)) < 0)
            err_sys("waitpid error");
        printf("%% ");
    }
    exit(0);
}
```
Program details: `fgets` reads a line at a time and the trailing newline is replaced with a null byte so `execlp` gets a proper C string; `fork` spawns the child; the child calls `execlp` to replace itself with the requested program (fork+exec together is what some other OSes call "spawn," but UNIX keeps them as two separate calls); the parent calls `waitpid` and blocks until the child finishes (p. 12-13). Running it shows the custom `%` prompt distinguishing it from the real shell (p. 13):
```text
$ ./a.out
% date
Sat Jan 21 19:42:07 EST 2012
% who
sar        console Jan 1 14:59
% pwd
/home/sar/bk/apue/3e
% ^D
$
```
`^D` denotes Control-D, the default end-of-file character (p. 13). This toy shell's biggest limitation is that it can't pass arguments to the command it runs - only bare commands like `ls` work, never `ls -l somedir` - because the input line isn't parsed into separate argv entries (p. 13).
> [!NOTE]
> "Called once, returns twice" is the single most confusing sentence in this chapter on a first read. `fork()` really does execute one time in the parent's code, but the kernel then makes a second, near-identical process and both processes resume running from the exact same point right after the `fork()` call - so the *call* happens once, but *control returns from it* twice, once per process, distinguished only by the return value (child PID in the parent, 0 in the child).
*Threads:* **Threads** let multiple threads of control run within one process, sharing the same address space, file descriptors, and process attributes while each keeps its own stack, exploiting multiprocessor parallelism (p. 14).
### 1.7 Error Handling
UNIX functions signal failure with a negative return value (often -1) or a null pointer, and set the integer **errno** to indicate why (p. 14-15). `<errno.h>` defines `errno` and symbolic constants beginning with `E`; the man page `intro(2)` (or `errno(3)` on Linux) lists them (p. 15). POSIX and ISO C define `errno` as a modifiable lvalue - historically `extern int errno;`, but under threading each thread needs its own copy, so Linux expands it to a function-pointer macro: `#define errno (*__errno_location())` (p. 15).
Two rules govern `errno`: it is never cleared on success (check it only right after an error return), and no system function ever sets it to 0 (p. 15).
*Error Message Functions:* `strerror(int errnum)` (`<string.h>`) maps an error number to a message string; `perror(const char *msg)` (`<stdio.h>`) writes `msg`, a colon, a space, the message for the *current* `errno`, and a newline to standard error (p. 15).
```c
#include "apue.h"
#include <errno.h>
int main(int argc, char *argv[]) {
    fprintf(stderr, "EACCES: %s\n", strerror(EACCES));
    errno = ENOENT;
    perror(argv[0]);
    exit(0);
}
```
Running it produces (p. 16):
```text
$ ./a.out
EACCES: Permission denied
./a.out: No such file or directory
```
`argv[0]` is passed to `perror` by convention specifically so that a program running inside a pipeline (`prog1 < inputfile | prog2 | prog3 > outputfile`) can identify which of the three programs produced a given error message (p. 16).
*Error Recovery:* Errors split into **fatal errors** (no recovery action beyond printing a message and exiting) and **nonfatal errors** - usually temporary resource shortages like `EAGAIN`, `ENFILE`, `ENOBUFS`, `ENOLCK`, `ENOSPC`, `EWOULDBLOCK`, sometimes `ENOMEM`, `EBUSY` (shared resource busy), or `EINTR` (interrupted system call) - which can be retried, often with a delay or exponential backoff (p. 16-17).
> [!NOTE]
> The thread-local `errno` macro is worth sitting with. `errno` looks like an ordinary global variable everywhere in the code you write (`errno = ENOENT;`, `if (errno == EACCES)`), but under the hood `#define errno (*__errno_location())` means every reference is secretly a function call that returns a pointer into *that specific thread's* storage. Without this trick, two threads hitting errors at once would stomp on the same shared `errno`, and whichever thread checked it last would see the wrong error.
### 1.8 User Identification
*User ID:* A **user ID** is a numeric value the system administrator assigns; a process cannot change its own (p. 16). **User ID 0** is **root** or the **superuser**, whose processes bypass most file permission checks and can run restricted operations (p. 16-17).
*Group ID:* Assigned the same way in `/etc/passwd`, and used to collect users into shared-resource projects/departments via the group file, usually `/etc/group` (p. 17). Both IDs are stored numerically on disk (historically 2 bytes each, 4 bytes total; 32-bit on modern systems) because integer comparisons for permission checks are cheap and take less disk space than storing full ASCII names - `ls -l` maps the numeric IDs back to names using the password and group files for display (p. 17).
```c
#include "apue.h"
int main(void) {
    printf("uid = %d, gid = %d\n", getuid(), getgid());
    exit(0);
}
```
Sample run: `uid = 205, gid = 105` (p. 18).
*Supplementary Group IDs:* Introduced in 4.2BSD, letting a user belong to up to 16 additional groups at once (POSIX requires supporting at least 8); read from `/etc/group` at login (p. 18).
### 1.9 Signals
**Signals** notify a process that some condition occurred - dividing by zero raises `SIGFPE`, for example (p. 18). A process has three options: (1) ignore the signal (unwise for hardware-exception signals like divide-by-zero, since the result is undefined), (2) take the default action (often termination), or (3) catch it with a registered **signal handler** (p. 18-19). Signals are generated by terminal keys (interrupt key, often Ctrl-C, sends `SIGINT`; quit key, often Ctrl-\, sends `SIGQUIT`), hardware exceptions, or the `kill` function - which requires owning the target process, or being superuser (p. 18).
Adding an 11-line signal handler to the bare-bones shell from Section 1.6 so Ctrl-C prints a message instead of killing the shell (p. 19):
```c
#include "apue.h"
#include <sys/wait.h>
static void sig_int(int);
int main(void) {
    char buf[MAXLINE];
    pid_t pid;
    int status;
    if (signal(SIGINT, sig_int) == SIG_ERR)
        err_sys("signal error");
    printf("%% ");
    while (fgets(buf, MAXLINE, stdin) != NULL) {
        if (buf[strlen(buf) - 1] == '\n')
            buf[strlen(buf) - 1] = 0;
        if ((pid = fork()) < 0) {
            err_sys("fork error");
        } else if (pid == 0) {
            execlp(buf, buf, (char *)0);
            err_ret("couldn't execute: %s", buf);
            exit(127);
        }
        if ((pid = waitpid(pid, &status, 0)) < 0)
            err_sys("waitpid error");
        printf("%% ");
    }
    exit(0);
}
void sig_int(int signo) {
    printf("interrupt\n%% ");
}
```
Without the handler, Ctrl-C terminates the toy shell because `SIGINT`'s default action is termination; with it installed, the shell prints `interrupt` and a fresh prompt instead (p. 18-19). Chapter 10 covers signals in depth, since most nontrivial applications have to deal with them (p. 19).
### 1.10 Time Values
UNIX has historically tracked two time values (p. 20): **calendar time** (`time_t`), seconds since the **Epoch** (00:00:00 January 1, 1970 UTC), used for things like file modification timestamps; and **process time** / **CPU time** (`clock_t`), measured in **clock ticks** (historically 50, 60, or 100 per second).
When actually measuring a running process, UNIX tracks three separate values: **clock time** (wall clock time - total elapsed real time, which depends on what else the system is doing), **user CPU time** (time spent in the process's own instructions), and **system CPU time** (time the kernel spends on the process's behalf, e.g. inside `read`/`write`); user + system is often just called "the CPU time" (p. 20). The `time(1)` command measures all three for any command (p. 21):
```text
$ cd /usr/include
$ time -p grep _POSIX_SOURCE */*.h > /dev/null
real  0m0.81s
user  0m0.11s
sys   0m0.07s
```
### 1.11 System Calls and Library Functions
Every UNIX implementation exposes a fixed, well-defined set of kernel entry points - **system calls** - and that count has grown enormously: roughly 50 in Version 7 Research UNIX, about 110 in 4.4BSD, about 120 in SVR4, 380 in Linux 3.2.0, and over 450 in FreeBSD 8.0 (p. 21). System calls are documented in Section 2 of the UNIX manuals and are always defined in terms of C, regardless of the underlying implementation technique - each has a same-named wrapper function in the standard C library that the user process calls normally, which then invokes the kernel service however the platform requires (p. 21).
Section 3 of the manuals covers **library functions**: normal user-space code that may or may not call a system call underneath. `printf` calls `write`; `strcpy` and `atoi` never touch the kernel at all (p. 21-22). The practical difference: library functions can be replaced by an application (write your own `malloc`), but system calls cannot be replaced (p. 22).
*malloc vs. sbrk:* `malloc(3)` is a library function implementing one particular allocation strategy on top of the `sbrk(2)` system call, which only grows or shrinks the process's address space by some number of bytes and has no opinion about how that space gets managed - a program dissatisfied with `malloc`'s policy can write its own allocator on top of the same `sbrk` (p. 22).
*Time as another example:* rather than separate system calls for "the time" and "the date," UNIX has one system call returning seconds since the Epoch, and leaves date/timezone/daylight-saving interpretation entirely to library routines in user space (p. 22).
Because the distinction between a system call and a library function matters to implementors but barely matters to the programmer using both as ordinary C functions, this text (and this vault, following it) uses "function" loosely for either unless the distinction is the actual point (p. 23). Process-control system calls (`fork`, `exec`, `waitpid`) are typically called directly by application code, but convenience library routines like `system` and `popen` wrap them for common cases - Section 8.13 implements `system` from scratch, and Section 10.18 fixes its signal handling (p. 23).
> [!NOTE]
> The `malloc`/`sbrk` split is the same shape as `fopen`/`open` from earlier in this chapter: a system call gives the kernel a minimal, general primitive, and a library function builds a specific, convenient policy on top of it in user space, without needing kernel changes. Once this pattern clicks for one pair (`sbrk`/`malloc`), it explains the buffered-vs-unbuffered I/O split too.
## Worked Example
The three-program Hello World exercise (Lec01) contrasts three execution layers on the same one-line goal:
1. *C Standard Library (`printf`):* `printf("Hello, World!\n")` formats the string into a user-space stdio buffer for `stdout`. The library flushes that buffer by calling the low-level `write()` wrapper, which sets up registers and triggers the transition into kernel mode.
2. *Direct System Call (`write`):* `write(STDOUT_FILENO, message, strlen(message))` skips stdio buffering entirely. The C library wrapper places `STDOUT_FILENO` (1), the string pointer, and the byte count into the architecture's calling-convention registers and executes the CPU trap instruction straight into the kernel.
3. *Hand-written Assembly (`syscall`):* ==`movq $1, %rax` loads the system-call number for `sys_write` into `%rax`, `movq $1, %rdi` sets file descriptor 1, `movq $msg, %rsi` sets the message address, `movq $14, %rdx` sets the byte length, and the `syscall` instruction triggers an immediate hardware transition into the kernel's dispatcher without going through any C runtime function at all.==
All three print the identical output; the difference is entirely in how many layers of convenience sit between the programmer's intent and the actual `write` system call.
## Connections
- **Lecture (Lec01, 9/8):** Orientation-level only, does not walk Chapter 1 section by section. Supplies the referee/illusionist/glue framing, the layer diagram (User Application -> C Standard Library -> System Call API -> Kernel -> Hardware), the POSIX/UNIX naming caveat, and the three-program Hello World exercise. **No slide coverage exists** for Section 1.3 (`/etc/passwd`), 1.4's directory APIs (`opendir`/`readdir`), 1.7 (`errno`/`strerror`/`perror`), 1.8 (user/group IDs), 1.9 (`signal()`), or 1.10 (`time_t`/`clock_t`) - those five sections are textbook-only for this course so far.
- **Textbook (Chapter 7):** Chapter 7 continues exactly where 1.6 and 1.11 leave off - `main`'s real entry sequence (`_start()` before `main()`), the process memory segments only sketched here, `exit`/`atexit` mechanics beyond the one signal-handler example in 1.9, and the `malloc`/`sbrk` split from 1.11 described in full with `calloc`/`realloc`/`free`.
- **Lab:** Lab 1's `fork_exec.c`/`fork_wait.c` exercises are a direct, hands-on repeat of the bare-bones-shell pattern in Section 1.6 (fork, then either exec in the child or wait in the parent).
## Open Questions
- [ ] Verify on the course's Docker environment how `errno` is actually defined in `<errno.h>` (thread-local macro vs plain `extern int`).
- [ ] Compare the performance of unbuffered `read`/`write` against standard I/O `getc`/`putc` on a large file copy, and explain the gap using the buffering mechanism from 1.5/1.11.
- [ ] ==Test what a shell does when `SIGINT` is sent to a process catching the signal versus one that ignores it versus one that takes the default action.==
- [ ] Inspect `/etc/passwd` and `/etc/group` on the course container to trace real numeric UID/GID mappings back to login names.
- [ ] Why does `malloc` never return memory to the kernel even after `free` is called - what would have to change for it to do so?
## Flashcards
What is the fundamental difference between a system call and a C library function?::A system call enters kernel mode directly to perform a privileged hardware operation, whereas a library function executes in user space and may or may not invoke a system call underneath (`strcpy` never does; `printf` calls `write`). #cards/csci4061
Why is `errno` defined as a thread-local macro on modern POSIX systems?::==Expanding `errno` into `*__errno_location()` gives each thread its own isolated error slot, so one thread's error doesn't overwrite another thread's `errno` between the failing call and the check.== #cards/csci4061
`fork()` is described as "called once, returns twice." What does that actually mean?::The parent calls `fork()` a single time, but both the parent and the newly created child resume executing right after that call - the parent sees the child's PID as the return value, the child sees 0. #cards/csci4061
Why can't a program replace a system call the way it can replace a library function like `malloc`?::System calls are the kernel's own fixed entry points, implemented inside the kernel itself; a library function is ordinary user-space code sitting on top of those calls, so it can be swapped for a different implementation without touching the kernel. #cards/csci4061
What are the three time values `time(1)` reports for a command, and what does each one actually measure?::Clock (wall) time is total elapsed real time and depends on system load; user CPU time is time spent in the process's own instructions; system CPU time is time the kernel spends on the process's behalf, e.g. inside a `read` or `write`. #cards/csci4061
A signal handler is installed for `SIGINT` with `signal()`. What happens when the user presses Ctrl-C now, versus with no handler installed?::With no handler, `SIGINT`'s default action (terminate) runs. With a handler installed, the kernel suspends normal execution, runs the handler in user space, and resumes where the process left off once the handler returns - the process is not terminated unless the handler itself calls `exit`. #cards/csci4061
What is the actual relationship between `malloc` and `sbrk`?::`sbrk` is the system call that grows or shrinks a process's heap by a raw byte count with no policy attached; `malloc` is a library function that implements one specific allocation strategy (tracking free blocks, alignment, etc.) on top of repeated `sbrk` calls. #cards/csci4061

```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Chapter - 7.md`
```
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
next: "Feed this chapter into Week - 1/Week - 2's Textbook integration sections, then build the weekly notes"
---
# Chapter - 7 — Process Environment
**Source:** W. Richard Stevens and Stephen A. Rago, *Advanced Programming in the UNIX Environment*, 3rd ed. (Addison-Wesley, 2013), Chapter 7, pp. 197-226.
**Read from:** `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\Textbook\Advanced Programming in the UNIX Environment, 3rd Edition.pdf`
**Course role:** Week 1-2 reading, the single-process picture that Chapter 8 (process control: `fork`/`exec`/`wait`) builds on. Lec02 (9/10) and Lec03 (9/15) supply the course framing for `main()`/`_start()`, memory layout, and environment variables; Sections 7.10 (`setjmp`/`longjmp`) and 7.11 (`getrlimit`/`setrlimit`) have **no matching lecture coverage anywhere in Lec01-06** - they are textbook-only for this course so far.
## Chapter Summary
A C process runs inside an environment the kernel and C runtime build for it before `main` ever executes, and that same environment - memory layout, command-line arguments, environment variables, resource limits - determines how the process can allocate memory, read configuration, and eventually terminate (p. 197).
*Mechanism:* When a process is launched via `exec`, the kernel loads its text and data segments into virtual memory, sets up the stack, and transfers control to a **C start-up routine** (`_start()`) rather than to `main` directly. `_start()` extracts `argc`/`argv` and the environment from what the kernel handed it, calls `main`, and - if `main` returns - passes its return value to `exit()`. Normal termination flushes standard I/O buffers and runs any registered `atexit` handlers; dynamic memory comes from the heap via `sbrk`/`malloc`; environment variables live in a heap-relocatable pointer array; and `setjmp`/`longjmp` let code jump back through several stack frames at once, bypassing the normal one-frame-at-a-time function return.
## Key Concepts
- **main**: The function a C program appears to start at, prototyped `int main(int argc, char *argv[])` (p. 197).
- **argc**: Non-negative count of command-line arguments (p. 197).
- **argv**: Array of pointers to null-terminated argument strings; POSIX/ISO C guarantee `argv[argc]` is `NULL` (p. 197, 203).
- **C start-up routine** / **_start()**: The kernel-designated real entry point, which sets up arguments/environment and calls `main()` (p. 197; Lec02).
- **exit**: ISO C function that flushes standard I/O buffers, runs `atexit` handlers, then returns to the kernel (p. 198-199).
- **_exit** / **_Exit**: POSIX/ISO C functions that return to the kernel immediately, skipping cleanup and handlers (p. 198).
- **exit status**: The integer argument to an exit function, retrievable by the parent process (p. 198).
- **exit handler**: A function registered with `atexit()`, run in reverse registration order when `exit()` is called (p. 200).
- **atexit**: ISO C function registering at least 32 exit handlers (p. 200).
- **command-line arguments**: Strings passed to a program by whichever process called `exec` (p. 203).
- **environment list** / **environ**: The array of `name=value` C strings passed to every process, reachable through the global `extern char **environ;` (p. 203-204).
- **text segment**: Read-only, sharable machine instructions loaded from the executable (p. 204).
- **initialized data segment**: Global/static variables explicitly given a value in source code (p. 204).
- **uninitialized data segment** / **bss**: Global/static variables with no explicit initializer, zero-filled by `exec` at load time, never stored on disk (p. 204-205).
- **heap**: Region for dynamic allocation, between bss and the stack, growing upward (p. 205).
- **stack**: Region holding automatic variables and call frames, growing downward toward the heap (p. 205).
- ==**stack overflow**==: What happens when the growing stack and growing heap collide in virtual address space (Lec02).
- **ELF**: Executable and Linkable Format, the binary layout the OS loader reads into memory (Lec02).
- **shared library**: Library code kept once in memory/disk and referenced by every process that links against it, instead of copied into each executable (p. 206).
- **malloc** / **calloc** / **realloc** / **free**: The ISO C dynamic-memory functions - allocate uninitialized, allocate zeroed, resize, and release, respectively (p. 207-208).
- **sbrk**: System call that grows or shrinks a process's heap boundary; what `malloc` is built on (p. 208).
- **memory leak**: Allocated memory that is never `free`d, so the process's address space keeps growing (p. 209).
- **alloca**: Allocates directly on the current function's stack frame, freed automatically on return (p. 210).
- **getenv** / **setenv** / **putenv** / **unsetenv**: Library functions to read, add/replace, add, and remove a single environment variable (p. 210-212).
- **setjmp** / **longjmp**: Nonlocal-goto functions that save and later restore stack/register state across multiple function-call frames (p. 213, 215).
- **jmp_buf**: The opaque type `setjmp`/`longjmp` use to hold saved execution state (p. 216).
- **volatile**: Type qualifier telling the compiler not to keep a variable only in a register across a `setjmp`/`longjmp` boundary (p. 219).
- **resource limit**: A per-process ceiling (soft and hard) on things like open files, CPU time, or stack size, read/set with `getrlimit`/`setrlimit` (p. 220).
- **soft limit** / **hard limit**: The currently enforced ceiling versus the maximum the soft limit can be raised to without superuser privilege (p. 221).
## Full Reading Notes
### 7.1 Introduction
Before Chapter 8's process-control primitives (`fork`/`exec`/`wait`), this chapter covers the environment a single process runs in: how `main` gets called, how command-line arguments and the environment reach it, the typical memory layout, dynamic memory allocation, the several ways a process can terminate, `setjmp`/`longjmp` nonlocal branching, and per-process resource limits (p. 197).
### 7.2 main Function
Execution starts at `int main(int argc, char *argv[]);`, where `argc` is the argument count and `argv` points to the argument array (p. 197). When the kernel runs a program via one of the `exec` functions (Section 8.10), it does not call `main` directly - a special **start-up routine** runs first, set as the program's entry point by the link editor. This routine takes the raw command-line arguments and environment from the kernel and arranges the call to `main` (p. 197).
*Course Framing (Lec02):* `main()` is "just another C function," not the true entry point. The real entry point is **`_start()`**, which the C runtime/compiler provides automatically (you can write your own, as in Lecture 1's assembly Hello World). `_start()` sets up the stack and heap, issues the `call` instruction into `main()`, and handles cleanup once `main` returns (Lec02). ==When a C program is executed by the kernel, `_start()` is the true entry point - it takes command-line arguments and the environment from the kernel, sets up the runtime, and only then calls `main()`.==
### 7.3 Process Termination
There are eight ways a process can terminate - five normal, three abnormal (p. 198):
- Normal: (1) returning from `main`, (2) calling `exit`, (3) calling `_exit`/`_Exit`, (4) the last thread returning from its start routine, (5) the last thread calling `pthread_exit`.
- Abnormal: (6) calling `abort`, (7) receiving a signal, (8) the last thread responding to a cancellation request.
If the start-up routine were written in C, the call to `main` would effectively look like `exit(main(argc, argv));` (p. 198).
*Exit Functions:* `exit` and `_Exit` are ISO C (`<stdlib.h>`); `_exit` is POSIX.1 (`<unistd.h>`). Historically `exit` performs a clean shutdown of the standard I/O library - `fclose` on every open stream, flushing buffered output - before returning to the kernel; `_exit`/`_Exit` return immediately with none of that cleanup (p. 198-199). All three take a single integer **exit status**. If that status is omitted, or `main` does a bare `return` with no value, or `main` isn't declared to return `int`, the exit status is undefined - **except** that ISO C99 specifically made an implicit fall-off-the-end-of-`main` exit status default to 0 (this was undefined before C99) (p. 199).
```c
#include <stdio.h>
main() {
    printf("hello, world\n");
}
```
Compiled and run the ordinary way, the exit code is whatever garbage happened to be in a register/stack slot - `echo $?` might print `13` (p. 199). Compiled with `gcc -std=c99 hello.c` instead, the same program prints `0` for `echo $?`, because C99's explicit fall-off-the-end rule now applies (p. 200).
> [!NOTE]
> This "hello, world with a random exit code" example is easy to misread as a compiler bug. It isn't - it's a direct, visible consequence of the ISO C89 vs C99 rule change described just above. Before C99, "falling off the end of `main`" left the exit status genuinely undefined (whatever garbage was sitting in the return-value register), so `echo $?` could print anything. C99 nailed this down to 0. The takeaway for this course: always give `main` an explicit `return 0;` (or call `exit(0);`) rather than relying on either behavior.
*Exit Handlers:* ISO C guarantees at least 32 **exit handlers** via `atexit(void (*func)(void));` (returns 0 on success). `exit()` calls them in reverse order of registration, and a handler registered twice is called twice (p. 200-201).
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
static void my_exit1(void) { printf("first exit handler\n"); }
static void my_exit2(void) { printf("second exit handler\n"); }
```
Output: `main is done`, `first exit handler`, `first exit handler`, `second exit handler` - `my_exit1` runs twice because it was registered twice, and reverse order puts `my_exit1` before `my_exit2` (p. 201-202).
*Program Lifecycle:* The only way a program starts is via one of the `exec` functions; the only way it voluntarily ends is `_exit`/`_Exit`, called either directly or implicitly through `exit`; a process can also be involuntarily ended by a signal (p. 202).
### 7.4 Command-Line Arguments
Whichever process calls `exec` supplies the new program's command-line arguments (p. 203). ISO C and POSIX.1 guarantee `argv[argc]` is `NULL`, so an argument loop can stop on `argv[i] == NULL` without consulting `argc` at all (p. 203).
```c
#include "apue.h"
int main(int argc, char *argv[]) {
    int i;
    for (i = 0; i < argc; i++)
        printf("argv[%d]: %s\n", i, argv[i]);
    exit(0);
}
```
`./echoarg arg1 TEST foo` prints each argument on its own line, `argv[0]` through `argv[3]` (p. 203).
### 7.5 Environment List
Each program receives an **environment list**: an array of character pointers, each pointing to a null-terminated `name=value` string (p. 203-204). The address of that array lives in the global `environ`: `extern char **environ;` (p. 203-204). Historically `main` took a third argument, `char *envp[]`, but ISO C only specifies two arguments and POSIX.1 says to use `environ` instead, since `envp` adds nothing `environ` doesn't already give (p. 204). Iterating the *entire* environment requires `environ` directly; reading one specific variable normally goes through `getenv`/`putenv`/`setenv` instead (Section 7.9) (p. 204).
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
### 7.6 Memory Layout of a C Program
A C program has historically been laid out in these pieces, low address to high (p. 204-206):
- **text**: machine instructions, usually shareable and read-only.
- **initialized data**: globals/statics with an explicit initializer (`int maxcount = 99;`), read from the executable file at load time.
- **uninitialized data (bss)**: globals/statics with no initializer (`long sum[1000];`), zeroed by the kernel before the program runs - never actually stored on disk in the executable, only the text and initialized data are.
- **heap**: dynamic allocation, sitting between bss and the stack, growing upward.
- **stack**: automatic variables and call frames, growing downward toward the heap.
On 32-bit Linux/x86, the text segment historically starts at `0x08048000` and the bottom of the stack starts just below `0xC0000000`, with a large unused virtual-address gap in between where the heap grows upward and the stack grows downward toward each other (p. 205).
*Course Framing & Executable Inspection (Lec02):* The **ELF** loader pipeline reads the executable off disk into memory. If the growing stack and growing heap collide, that's a **stack overflow**. Process-info getters `getcwd()`, `getpid()`, `getppid()` round out this picture of "what a running process actually has" (Lec02).
The `size(1)` command reports the byte sizes of the text/data/bss segments:
```text
$ size /usr/bin/cc /bin/sh
   text    data     bss     dec     hex  filename
 346919    3576    6680  357175   57337  /usr/bin/cc
 102134    1776   11272  115182   1c1ee  /bin/sh
```
The `dec`/`hex` columns are just the total of the three sizes in decimal and hex (p. 206).
### 7.7 Shared Libraries
**Shared libraries** keep one copy of common library routines in memory/on disk that every linked process references, instead of copying the routine into every executable file - this shrinks executables dramatically and lets a library be patched without relinking every program that uses it, at the cost of a small load-time and first-call overhead (p. 206). Example on one system: a statically linked `hello.c` is 879,443 bytes on disk (787,775 text / 6,128 data / 11,272 bss); the same program dynamically linked drops to 8,378 bytes (1,176 text / 504 data / 16 bss) (p. 206-207).
### 7.8 Memory Allocation
ISO C's three allocation functions (`<stdlib.h>`), all returning a non-null `void *` on success or `NULL` on error:
```c
void *malloc(size_t size);
void *calloc(size_t nobj, size_t size);
void *realloc(void *ptr, size_t newsize);
void free(void *ptr);
```
`malloc` gives `size` bytes of indeterminate content; `calloc` zero-fills space for `nobj` objects of `size` bytes each; `realloc` grows or shrinks a previously allocated block, moving it (copying old contents, freeing the old block) only if there isn't room to extend in place - passing `ptr == NULL` to `realloc` makes it behave exactly like `malloc(newsize)` (p. 207-208). All three guarantee alignment suitable for any data type (p. 207). `free` returns a block to the process's own free-memory pool - not to the kernel - so most implementations of `malloc`/`free` never actually shrink the process (p. 208).
These are usually built on the `sbrk(2)` system call, which grows/shrinks the heap directly (p. 208). Common, hard-to-debug mistakes: freeing an already-freed block, calling `free` on a pointer not obtained from one of the three alloc functions, and writing past the allocated region's bounds - the last of these can silently corrupt an unrelated object's record-keeping data or contents, with a crash that shows up much later and far from the actual bug (p. 208-209). A **memory leak** is simply `malloc` without a matching `free`, growing the process's address space and eventually degrading performance from paging overhead (p. 209).
*Alternate Allocators:* **libmalloc** (SVR4/Solaris, `mallopt`/`mallinfo`), **vmalloc** (per-region allocation strategy), **quick-fit** (faster than best-fit/first-fit, more memory use - most modern allocators build on this idea), **jemalloc** (FreeBSD 8.0 default, multithreaded-scalable), **TCMalloc** (Google, thread-local caches to avoid lock contention) (p. 209-210).
*alloca:* Same call signature as `malloc`, but allocates from the *current function's stack frame* instead of the heap - freed automatically on return, no `free` needed, but not universally supported and dangerous if the stack frame can't grow after the fact (p. 210).
### 7.9 Environment Variables
Environment strings are `name=value`; the kernel never interprets them, only applications and shells do (p. 210). `getenv(const char *name)` returns the value for `name` or `NULL` (p. 210-211). To modify: `putenv(char *str)` (XSI - inserts a `name=value` string directly, removing any old definition of `name`; passing a stack-allocated string is a bug because that memory is reused on return), `setenv(const char *name, const char *value, int rewrite)` (POSIX.1 - allocates its own storage for the string, replaces only if `rewrite` is nonzero), `unsetenv(const char *name)`, and `clearenv()` (wipes the whole list) (p. 212).
Mechanically: the initial environment array sits above the stack, where there's no room to grow. Changing an existing variable's value in place works only if the new value is no longer than the old one; otherwise `setenv` mallocs new storage and updates that one pointer. Adding a brand-new variable the first time requires mallocing an entirely new pointer array on the heap, copying the old pointers over, appending the new pointer and a `NULL` sentinel, and repointing `environ` at the new heap array; later additions just `realloc` that same heap array (p. 212-213).
*Inheritance (Lec02, Lec03, APUE):* Each process has its own environment; a child inherits a copy from its parent at `fork()`, and `exec()` propagates it into the new program image (via `environ` or explicitly via `execve`/`execle`). Changing a variable in a child affects only that child and any processes it later creates - never its parent (p. 203, 211).
*Course Framing - PATH and friends (Lec02, recapped at the start of Lec03):* Built-in-looking commands (`ls`, `make`) are ordinary programs, not shell magic - `which ls` reveals `/usr/bin/ls`. The **PATH** environment variable is what lets you type a bare command name: the shell splits `PATH` on `:` and searches each directory in order for a matching executable. `LD_PRELOAD` (force-load custom libraries first) and `LD_LIBRARY_PATH` (extra search directories) are sibling variables used by the dynamic linker/loader to find *shared libraries* rather than *programs* - a different search problem from `PATH`, solved the same way (Lec02).
### 7.10 setjmp and longjmp Functions
C's `goto` cannot jump into another function, so error handling that needs to unwind several stack frames at once (say, from `cmd_add`, two levels below `main`, but sometimes five or more levels down in real code) needs a different tool: **`setjmp`**/**`longjmp`**, a *nonlocal* goto that branches back through the call chain to a function still on the current call path (p. 213-215).
```c
#include <setjmp.h>
int setjmp(jmp_buf env);      // Returns: 0 if called directly, nonzero if returning from longjmp
void longjmp(jmp_buf env, int val);
```
`setjmp` is called from the point you want to return *to* (returns 0 there, since it's called directly); `longjmp(env, val)` is called later, from deep in the call chain, with the same `env` and a nonzero `val` that becomes `setjmp`'s *apparent* return value back at the original call site - a nonzero `val` argument lets one `setjmp` distinguish which of several possible `longjmp` sites triggered the jump (p. 215-217).
```c
#include "apue.h"
#include <setjmp.h>
jmp_buf jmpbuffer;
main(void) {
    if (setjmp(jmpbuffer) != 0)
        printf("error");
    while (fgets(line, MAXLINE, stdin) != NULL)
        do_line(line);
    exit(0);
}
...
void cmd_add(void) {
    int token = get_token();
    if (token < 0)
        longjmp(jmpbuffer, 1);
    /* rest of processing */
}
```
When `longjmp` fires, the stack is "unwound" straight back to `main`'s frame, discarding the `cmd_add` and `do_line` frames entirely, and `setjmp` in `main` returns as if it had just been called again - except this time with the value `1` (p. 216-217).
*Automatic, Register, and Volatile Variables:* After a `longjmp`, what happens to `main`'s automatic and register variables? The standards only say their values are **indeterminate** - most implementations don't try to roll them back, but nothing guarantees it either way. Global and static variables are always left alone (unaffected) by `longjmp` (p. 217-218). A demonstration compiles the same program with and without optimization (p. 218-219):
```c
static jmp_buf jmpbuffer;
static int globval;
int main(void) {
    int autoval; register int regival; volatile int volaval; static int statval;
    globval=1; autoval=2; regival=3; volaval=4; statval=5;
    if (setjmp(jmpbuffer) != 0) {
        printf("after longjmp: globval=%d autoval=%d regival=%d volaval=%d statval=%d\n",
               globval, autoval, regival, volaval, statval);
        exit(0);
    }
    globval=95; autoval=96; regival=97; volaval=98; statval=99;
    f1(autoval, regival, volaval, statval); /* calls f2(), which calls longjmp(jmpbuffer, 1) */
}
```
Without optimization, all five variables print `95 96 97 98 99` after the jump - everything was actually stored in memory. **With** `-O` optimization on, only `globval`, `volaval`, and `statval` still show `95 98 99`; `autoval` and `regival` roll back to their pre-jump values `2` and `3`, because the optimizer moved them into CPU registers, and register contents get restored to their state at the time `setjmp` was called, while memory contents reflect their state at the time `longjmp` was called (p. 219).
> [!NOTE]
> This is the entire practical reason `volatile` exists in this chapter. If you need an automatic variable's *post-jump* value to reliably be whatever it was right before the `longjmp` (not rolled back to its pre-`setjmp` value), you must declare it `volatile` - otherwise an optimizing compiler is free to keep it in a register, and registers get restored to the `setjmp`-time snapshot, silently discarding whatever you did to that variable in between. This is exactly the kind of bug that only appears with optimization flags on, which makes it brutal to debug from lecture alone.
*Potential Problem with Automatic Variables:* A related, more common bug: an automatic variable can never be referenced once the function that declared it has returned (p. 219-220).
```c
FILE *open_data(void) {
    FILE *fp;
    char databuf[BUFSIZ];      // on open_data's stack frame
    if ((fp = fopen("datafile", "r")) == NULL)
        return(NULL);
    if (setvbuf(fp, databuf, _IOLBF, BUFSIZ) != 0)
        return(NULL);
    return(fp);
}
```
`setvbuf` tells stdio to use `databuf` as `fp`'s buffer - but `databuf` lives on `open_data`'s stack frame, which is reclaimed the moment `open_data` returns. The next function called reuses that same stack space for its own frame, and stdio is still writing into what it thinks is `databuf`. The fix is to make `databuf` come from outside the stack entirely: `static`/`extern` storage, or one of the heap allocators (p. 220).
Chapter 10 revisits `setjmp`/`longjmp` in the context of signal handlers, via their signal-safe variants `sigsetjmp`/`siglongjmp` (p. 219).
### 7.11 getrlimit and setrlimit Functions
Every process has a set of **resource limits**, queried/changed with:
```c
#include <sys/resource.h>
int getrlimit(int resource, struct rlimit *rlptr);
int setrlimit(int resource, const struct rlimit *rlptr);
struct rlimit {
    rlim_t rlim_cur;  /* soft limit: currently enforced */
    rlim_t rlim_max;  /* hard limit: ceiling rlim_cur can be raised to */
};
```
Limits are normally set up by process 0 at boot and inherited by every descendant process (p. 220-221). Three rules govern changing them: (1) a process may lower its own soft limit to anything up to its hard limit, (2) a process may lower its own hard limit, but that lowering is **irreversible** for a normal (non-superuser) process, and (3) only a superuser process may *raise* a hard limit (p. 221). `RLIM_INFINITY` marks "no limit."
Selected resources: `RLIMIT_CORE` (max core-dump file size; 0 disables core dumps), `RLIMIT_CPU` (max CPU seconds - `SIGXCPU` on the soft limit), `RLIMIT_DATA` (max data-segment size: initialized + uninitialized data + heap, from Figure 7.6), `RLIMIT_FSIZE` (max file size a process may create - `SIGXFSZ` on the soft limit), `RLIMIT_NOFILE` (max open files per process), `RLIMIT_NPROC` (max child processes per real user ID), `RLIMIT_STACK` (max stack size) (p. 221-222). Shells expose these through built-ins (`ulimit` in Bourne/bash/Korn, `limit` in csh) since limits have to be set once and inherited by every future process the shell launches (p. 222).
```c
#include "apue.h"
#include <sys/resource.h>
static void pr_limits(char *, int);
int main(void) {
    pr_limits("RLIMIT_CORE", RLIMIT_CORE);
    pr_limits("RLIMIT_CPU", RLIMIT_CPU);
    pr_limits("RLIMIT_DATA", RLIMIT_DATA);
    pr_limits("RLIMIT_NOFILE", RLIMIT_NOFILE);
    pr_limits("RLIMIT_STACK", RLIMIT_STACK);
    exit(0);
}
static void pr_limits(char *name, int resource) {
    struct rlimit limit;
    if (getrlimit(resource, &limit) < 0)
        err_sys("getrlimit error for %s", name);
    printf("%-14s ", name);
    limit.rlim_cur == RLIM_INFINITY ? printf("(infinite) ") : printf("%10lld ", (long long)limit.rlim_cur);
    limit.rlim_max == RLIM_INFINITY ? printf("(infinite)\n") : printf("%10lld\n", (long long)limit.rlim_max);
}
```
Sample FreeBSD output shows most limits `(infinite)` except `RLIMIT_DATA` (536,870,912 bytes soft/hard) and `RLIMIT_NPROC`/`RLIMIT_NPTS` (3,520/1,760); sample Solaris output caps `RLIMIT_NOFILE` at 256 soft / 65,536 hard and `RLIMIT_STACK` at 8,388,608 soft / infinite hard (p. 223-224).
> [!NOTE]
> The soft/hard split is easy to blur together. The **soft limit** is what's actually enforced right now - hit it and you get an error or a signal (`SIGXCPU`, `SIGXFSZ`). The **hard limit** is just a ceiling on how high the soft limit is allowed to go without superuser privilege. A normal process can freely move its soft limit anywhere up to its hard limit (e.g. raise `RLIMIT_NOFILE`'s soft limit toward its hard limit to open more files), but it can never push the soft limit past the hard limit, and lowering its own hard limit is a one-way door.
### 7.12 Summary
Understanding a process's environment - startup, termination, argument/environment passing, memory layout, dynamic allocation, `setjmp`/`longjmp`, and resource limits - is the prerequisite for Chapter 8's process-control functions (p. 225).
## Worked Example
Resolving a bare command name like `ls` at the shell, tracing through the environment/library concepts above:
1. *Shell Parsing:* The shell sees `ls` has no `/` in it, unlike `./ls` or `/bin/ls`.
2. *PATH Lookup:* It reads its own `PATH` environment variable (e.g. `PATH=/usr/local/bin:/usr/bin:/bin`), a colon-separated list of directories.
3. *Directory Iteration:* It checks each directory in order for an executable named `ls`; finding it at `/usr/bin/ls`, it calls `execve("/usr/bin/ls", ...)`.
4. *Contrast with library lookup:* ==`LD_PRELOAD` and `LD_LIBRARY_PATH` solve a different problem for the dynamic linker at load/link time - locating shared object (`.so`) files - not locating the executable program itself, which is entirely `PATH`'s job.==
## Connections
- **Lecture (Lec02, 9/10; Lec03, 9/15):** Lec02 covers the compile/link pipeline (source -> assembly -> object -> linked executable), the ELF loader, the process memory picture (text/data/bss/heap/stack, heap and stack growing toward each other), `_start()` as the real entry point calling `main()`, and process-info getters (`getcwd`, `getpid`, `getppid`). The `PATH`/`LD_PRELOAD`/`LD_LIBRARY_PATH`/environment-inheritance material actually first appears in Lec02 (lines covering "Environment Variables" and "The PATH Environment Variable"), then gets recapped at the start of Lec03 before Lec03 moves on to low-level I/O - both lectures cite the same slides, so either citation is defensible, but Lec02 is the primary source.
- **Lecture coverage gaps:** Sections 7.3's full eight-termination-path list, 7.4's `argv[argc] == NULL` guarantee, 7.7 (shared libraries), 7.8's alternate allocators, 7.10 (`setjmp`/`longjmp`), and 7.11 (`getrlimit`/`setrlimit`) have no slide coverage in Lec01-06 - textbook-only for this course so far, and worth flagging if a quiz question draws only from lecture.
- **Textbook (Chapter 1):** Chapter 1 introduces `main`, processes, and `malloc`/`sbrk` at a sketch level (Sections 1.6, 1.11); this chapter is where each of those gets its full mechanism - the real startup sequence, the concrete memory-segment layout, and the complete `malloc`/`calloc`/`realloc`/`free` picture.
- **Forward (Chapter 8):** Chapter 8's `fork`/`exec`/`waitpid` rely directly on this chapter's termination taxonomy (Section 7.3) to define what a parent actually observes when a child exits normally vs. abnormally.
## Open Questions
- [ ] Write a test program that calls `setenv()` to add a new environment variable, and print the `environ` pointer's address before and after to actually observe the heap relocation described in 7.9.
- [ ] ==Verify experimentally how `atexit()` handlers interact with `exit()` versus `_exit()` - register a handler, then terminate via both paths and compare.==
- [ ] Reproduce the `-O` vs. no-optimization `setjmp`/`longjmp` variable-rollback example from 7.10 on the course's own container and confirm which variables actually change.
- [ ] Run `ulimit -a` inside the course Docker container and compare the real soft/hard limits against the book's FreeBSD/Solaris sample output.
- [ ] Why does declaring an automatic variable `volatile` fix the register-rollback problem in 7.10, but not the separate stack-lifetime bug in Figure 7.14?
## Flashcards
What is the real entry point of a C program, and what does it do before calling `main()`?::`_start()`, provided by the compiler/runtime, not `main()` itself. It takes `argc`/`argv` and the environment from the kernel, sets up the stack and heap, then calls `main()`, and passes `main`'s return value to `exit()` when it returns. #cards/csci4061
How do `exit()` and `_exit()` differ in what they do before the process actually terminates?::`exit()` flushes standard I/O buffers (`fclose` on every open stream) and runs registered `atexit()` handlers in reverse order; `_exit()`/`_Exit()` return to the kernel immediately, skipping all of that. #cards/csci4061
Why can `echo $?` print a different exit code for the exact same "hello, world" `main()` depending on the compiler standard used?::Before C99, falling off the end of `main` with no explicit `return` left the exit status genuinely undefined (whatever was in a register/stack slot); C99 specifically defines that case to be 0, so `-std=c99` changes the observed exit code from garbage to 0. #cards/csci4061
What structural memory reallocation happens the first time `setenv()` adds a brand-new environment variable to a process?::The initial environment array sits just above the stack with no room to grow, so `setenv()` mallocs a whole new pointer array on the heap, copies the old pointers into it, appends the new pointer and a `NULL` sentinel, and repoints the global `environ` at that heap array. #cards/csci4061
After a `longjmp`, why can an automatic variable's value differ between an unoptimized build and one compiled with `-O`?::The standard leaves automatic/register variable values after `longjmp` indeterminate. Without optimization, everything is stored in memory and reflects its state at `longjmp` time; with optimization, a variable the compiler moved into a register gets restored to its value at `setjmp` time instead - `volatile` is the fix, forcing memory storage. #cards/csci4061
Why does returning a `FILE *` from a function that called `setvbuf(fp, databuf, ...)` on a local `char databuf[BUFSIZ]` corrupt output later?::`databuf` lives on that function's stack frame, which is reclaimed the instant the function returns; stdio keeps writing through a pointer into memory that the next function call's stack frame now owns. Fix: make the buffer `static`/`extern` or heap-allocated. #cards/csci4061
What's the actual difference between a resource's soft limit and its hard limit?::The soft limit is what's enforced right now (exceeding it triggers an error or a signal like `SIGXCPU`); the hard limit is the ceiling the soft limit can be raised to. A normal process can move its soft limit anywhere up to the hard limit, but only a superuser process can raise the hard limit itself. #cards/csci4061
How do `LD_PRELOAD`/`LD_LIBRARY_PATH` differ from `PATH` in what they help resolve?::`PATH` tells the shell where to find an executable *program* by bare name. `LD_PRELOAD`/`LD_LIBRARY_PATH` tell the dynamic linker/loader where to find *shared libraries* (`.so` files) a program depends on - a different search happening at a different stage (load/link time vs. shell command lookup). #cards/csci4061

```
- `Glob` -- pattern `20_Progress/Degree/CSCI 4511W/Weekly/**` path ``
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4511W\Weekly\Week - 3.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4511W\Weekly\Week - 2.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\40_Resources\UMN\Previous Classes\Minor\MGMT 3001\Week - 9.md`
- `Glob` -- pattern `20_Progress/Degree/CSCI 4061/**` path ``
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Week - 1.md`
```
---
type: class
input_kind: lecture
status: seed
created: 2026-09-08
updated: 2026-09-29
area:
  - "[[CSCI 4061 Board]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]]"
tags:
  - "#class"
  - "#Lecture"
next: "[[Week - 2]]"
---
# Week - 1
## What you must be able to do
- Using [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]], explain the referee/illusionist/glue framing and give a concrete example of each role.
- Trace the same "Hello, World!" output through three layers: `printf`, `write`, and hand-written `syscall` assembly, and say what changes at each layer.
- Explain why `main()` is not a program's real entry point, and what `_start()` does before `main()` runs.
- Name the five memory segments of a running C program (text, initialized data, bss, heap, stack) and say what happens if the heap and stack collide.
- Distinguish `fork()`'s two return values and explain why it's described as "called once, returns twice."
- Trace what a child process inherits from its parent at `fork()` (address space contents, working directory, open files) versus what changes after `exec()`.
- Explain how a shell resolves a bare command name (`ls`) using the `PATH` environment variable, and how that differs from `LD_PRELOAD`/`LD_LIBRARY_PATH`.
- State the difference between `wait()` and `waitpid()`, and what `WNOHANG` changes.
## Key ideas (short)
- **System calls** are the only door into the kernel; everything else (shell, libraries, `printf`) is a convenience layer stacked on top of that one door.
- A process's environment is set up by **`_start()`**, not `main()` - `main()` is "just another C function" the runtime calls for you.
- **`fork()`** clones a process wholesale (memory, fds, cwd) except for one value: the return code, which tells parent from child.
- **`exec()`** throws away everything about the calling process's code and replaces it in place, keeping the same PID and open files.
- Programming with the **weakest possible assumptions** matters most right after `fork()`: there is no guarantee which process (parent or child) runs first.
## Concepts created today
None created. This week's material - system calls, `fork`/`exec`/`wait`, memory layout, environment variables - is fully captured inside [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]]. A cross-cutting "process lifecycle" concept note (fork/exec/wait/zombie/orphan/daemon, spanning Chapters 1, 7, and 8) is a reasonable Build 2 candidate once [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8|Chapter - 8]] gets the same perfecting pass.
## Examples worth keeping
- The **three-program Hello World** (Lec01): `printf`, then raw `write(STDOUT_FILENO, ...)`, then hand-assembled x86-64 `syscall` with `%rax=1` (write), `%rdi=1` (stdout), `%rsi`=message address, `%rdx=14` (length) - same visible output, decreasing layers of convenience.
- The **`fork()` "brain melting" exercises** (Lec02): three variants of a `for (i = 0; i < 3; i++) { fork(); ... }` loop (plain, `break` on child, `break` on parent) that produce wildly different process trees depending on where the `break` sits - a direct test of understanding "called once, returns twice."
- The **shared-variable-after-fork example** (Lec02): `int x = 4061;` before `fork()`, then parent sets `x = 200` and child sets `x = 100` - both see the *same address* `&x` print, but different values, because `fork()` copies the memory, it doesn't share it.
- **`which ls` → `/usr/bin/ls`** (Lec02/Lec03): built-in-looking commands are ordinary programs found by searching `PATH`, not shell magic.
- **Zombie processes staying around** (Lec02, previewed for Chapter 8): a child that exits before its parent calls `wait()` isn't fully removed - the kernel keeps its exit status around until the parent collects it.
## Lecture
### 1. Course Mechanics and Why This Class Exists (Lec01, 9/8)
Instructor Jack Kolb (jhkolb@umn.edu, 300F Lind Hall, Wednesdays 2-3pm). The course frames itself against the 2021 view of the world (`C -> assembly -> machine code -> hardware`) as an incomplete picture: 4061 adds the **operating system** layer that sits between a process and the raw hardware, and this offering is new in structure - roughly 65% traditional OS material, 35% distributed systems, because "this may be the last systems course you ever take."
### 2. What Is an Operating System? Referee, Illusionist, Glue (Lec01, 9/8)
No single accepted definition exists - it depends on whether you're a user, application programmer, systems programmer, or hardware engineer. Lec01's working definition: the lowest, foundational software layer; the only software allowed to talk directly to hardware; it manages every other running program and exposes a consistent API all of them must go through. Three roles tie this together: **referee** (supervises processes, shares CPU time and RAM space, keeps processes isolated from each other), **illusionist** (gives every process the feeling of owning a dedicated machine with "infinite" memory and no other running programs, by building higher-level objects like files and virtual memory out of raw hardware), and **glue** (offers common services - storage, networking, graphical interface - uniformly across wildly different hardware).
### 3. System Calls and the Three-Program Hello World (Lec01, 9/8)
User programs never touch hardware directly - they ask the OS to do it via a **system call**. Unlike an ordinary function call, a system call hands control to the kernel, which runs in supervisor mode (like `sudo`, conceptually), then returns control once the work is done or an error is reported. Strictly, only assembly can issue the raw `syscall` instruction; library functions like `write` are C wrappers that do that setup for you, but "everybody, including the textbooks, calls a call to `write` a system call anyway" - that's the convention this course follows too. The three-program Hello World exercise (`printf`, `write`, raw assembly `syscall`) makes the layering concrete: see Examples worth keeping.
### 4. Systems Programming as a Discipline (Lec01, 9/8)
Systems programming means writing software that other software depends on (a Python interpreter, a web server) rather than software an end user directly touches (a word processor). It comes with an ethos: systems programmers stay aware of hardware because it affects correctness and efficiency, and they're paranoid about errors - "almost all system operations can result in an error," and this course grades error handling directly: **-1 point per missed error check, -1 point per missed cleanup step** on every project, starting with Project 1. C is the language for this because it's the least filtered path to the real OS API - Python, Java, and even Rust ultimately sit on top of `libc`.
### 5. What Happens When We Run a Program: `_start()`, Linking, Memory Layout (Lec02, 9/10)
Every executable declares an entry point, and for a normal C program that entry point is **`_start()`**, not `main()`. `_start()` sets up the heap and stack, then issues a `call` into `main()`, which is "really just like any other C function" (matches [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter 7]] §7.2 exactly). Producing an executable is a pipeline: source + headers -> compiler -> assembly -> assembler -> machine code -> linker (combining in any library files) -> executable. A running program's memory divides into **text** (instructions), **global**/static data, **heap** (manual allocation), and **stack** (automatic variables, pushed/popped with each function call) - stack and heap grow toward each other, and colliding is a **stack overflow**.
### 6. Processes, Multiprogramming, and Process States (Lec02, 9/10)
If the OS is the referee, processes are the players; if the OS is the illusionist, processes are the clueless audience. A **process** is an actively executing program plus the live resources supporting it: its own address space, an execution state (register values including the program counter), and a view of the file system (working directory, open files and their positions). A typical machine runs far more processes (~500-1000) than it has CPU cores, so the OS gives each one a finite turn (a **quantum**, typically 5-10 msec) before switching - a switch also happens early if a process blocks on something like disk I/O. Process states: **New**, **Ready**, **Running**, **Blocked**, **Done**. `getcwd()`, `getpid()`, `getppid()` are the first system calls introduced for querying this state about the current process.
### 7. `fork()`: Creating New Processes (Lec02, 9/10)
`pid_t fork();` creates a complete copy of the calling process - address space contents (stack, heap, code, register state), current working directory, and open files - with exactly one difference: the **return value**. The parent gets the new child's PID back; the child gets 0; a negative value means `fork` failed and no child exists. This is why `fork` is described as "called once, but returns twice": both processes resume from the same point in the code, and only the return value tells them apart. The **super important systems programming principle** the lecture draws from this: program with the weakest set of assumptions possible, because there's no guarantee which process the OS scheduler runs first.
### 8. Environment Variables and `exec()` (Lec02, 9/10)
Every process gets its own **environment**: a list of `name=value` configuration pairs (e.g. `EDITOR`, used by tools like `git` when it needs to launch a text editor), inherited from its parent at creation. **`PATH`** is the most important one - it's what lets a bare command like `ls` resolve to `/usr/bin/ls` without typing the full path; `LD_PRELOAD` and `LD_LIBRARY_PATH` solve the analogous problem for the *dynamic linker* finding shared libraries, not for the shell finding programs. `environ` is the raw global variable holding this list, but `setenv()`/`getenv()`/`unsetenv()` are the safer way to touch it. `exec()` (six variants: `execl`, `execle`/`execve`, `execlp`/`execvp`, `execvpe` - the letters mean list-vs-array arguments, custom **e**nvironment, and **p**ATH search) overwrites the calling process's memory image entirely with a new program: new code, new program counter, new stack, possibly new environment - but the process keeps its PID and, notably, its open files survive the `exec()`.
### 9. Ending and Waiting for a Process (Lec02, 9/10)
A process ends by returning from `main()` or by calling `exit(int status)` from anywhere - `0` means success, nonzero means an error occurred (`echo $?` shows the last command's exit code in bash). `abort()` bails out immediately with no chance to reach a clean stopping point. A parent collects that exit code with `pid_t wait(int *status);` (blocks until *any* child exits) or the more targeted `pid_t waitpid(pid_t pid, int *status, int opt);`, where the `WNOHANG` option lets the parent check without blocking - if the child isn't done yet, `waitpid` returns 0 and execution continues. This sets up Chapter 8's zombie/orphan/daemon vocabulary, previewed but not yet formally covered this week.
## Textbook integration
> [!IMPORTANT]
> Main chapters: [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]] (UNIX System Overview) and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]] (Process Environment); [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8|Chapter - 8]] (Process Control - `fork`/`exec`/`wait` in full) is assigned reading too but has not been through the same source-checking pass this session did for Chapters 1 and 7, so treat its citations below as provisional until Build 2.
Lec01 stays at orientation level and never walks Chapter 1 section by section - Chapter 1's own §1.3 (`/etc/passwd`), §1.4's directory APIs, §1.7 (`errno`), §1.8 (user/group IDs), §1.9 (`signal()`), and §1.10 (`time_t`/`clock_t`) have no matching slide anywhere in Lec01-06 and are textbook-only for this course so far. What lecture adds beyond Chapter 1: the referee/illusionist/glue framing itself isn't in the book at all - it's Lec01's own mental model laid on top of Chapter 1's plainer "kernel controls hardware, system calls are the interface" definition. Chapter 7 fills in what Lec02 only sketches: the full eight-way termination taxonomy (§7.3), the complete `malloc`/`calloc`/`realloc`/`free` picture (§7.8) versus Lec02's silence on memory allocation entirely, and two sections with zero lecture coverage at all - §7.10 (`setjmp`/`longjmp`) and §7.11 (`getrlimit`/`setrlimit`).
## Takeaways (questions to resolve)
- [ ] Run the three `fork()` "brain melting" loop variants from Lec02 on the course container and confirm the process-tree predictions against real output.
- [ ] Once [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8|Chapter - 8]] gets its own perfecting pass, confirm the zombie/orphan/daemon vocabulary Lec02 previews matches the book's own definitions exactly.
- [ ] Trace through the shared-`int x`-after-`fork()` example on paper: why does `&x` print the same address in parent and child, but the values diverge?
- [ ] Verify on the course Docker container: does `execlp` search `PATH` the same way the shell itself does?
## Lecture-to-textbook synthesis
- ==A system call is the only doorway from user-space code into the kernel; every other UNIX abstraction this week - the shell, `fork`, `exec`, environment variables, even `printf` - is a convention built on top of that one doorway.==
- *Mechanism:* `_start()` sets up a process's memory and calls `main()`, which then reaches the kernel only through system-call wrappers. `fork()` clones that whole memory image and hands back one differing value so two now-separate processes can tell themselves apart; `exec()` throws the clone's code away and loads a new program in its place, without changing the process's identity (PID) or its open files.
- Lecture example/scenario: the three-program Hello World traces one output through three layers of that doorway (`printf` -> `write` -> raw `syscall`); the `fork()` brain-melting exercises make "called once, returns twice" concrete by forcing you to draw the actual process tree.
- Textbook connection: [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]] supplies the vocabulary (system call, kernel, file descriptor, process, thread) that Lec01's referee/illusionist/glue framing sits on top of; [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]] supplies the mechanism behind `_start()`, memory layout, and environment variables that Lec02 only sketches on slides.
- Concept links: none yet - see Concepts created today above.
> [!WARNING]
> Treating `fork()` as "the child runs after the parent" (or vice versa) is the single most common wrong assumption this week. The OS scheduler decides which process gets the next CPU turn, and the course's own principle is to program assuming either order is possible - code that only works if the parent happens to run first will pass on your machine and fail on Gradescope's.
> [!SUMMARY]
> Week 1 is about the one real boundary in this whole course - user space versus kernel space, crossed only through system calls - and the two operations (`fork`, `exec`) that let one process become two, or become something entirely different, without ever needing a new kind of boundary crossing.
## Flashcards
#cards/csci4061
Why is `fork()` described as "called once, returns twice"?::The parent calls it a single time in its code, but the kernel creates a near-identical second process, and both processes resume execution right after that same call - distinguished only by the return value (child's PID in the parent, 0 in the child).
What survives an `exec()` call that everything else about the process does not?::The process ID and its open file descriptors survive; the code, program counter, stack, and (possibly) the environment are all replaced by the new program image.
Why do `&x` addresses match but values diverge between parent and child after `fork()` and separate assignments to `x`?::`fork()` copies the entire address space, so both processes have `x` at the identical virtual address, but they are now separate physical memory - each process's write to `x` only changes its own copy.
What's the actual difference between `LD_PRELOAD`/`LD_LIBRARY_PATH` and `PATH`?::`PATH` is how the shell finds an executable *program* by bare name; `LD_PRELOAD`/`LD_LIBRARY_PATH` are how the *dynamic linker* finds shared *libraries* a program depends on - a different search, at a different stage.
`waitpid(pid, &status, WNOHANG)` is called on a child that hasn't exited yet. What happens?::It returns 0 immediately instead of blocking, letting the parent continue executing and check again later - this is what makes non-blocking waits possible.

```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Documents\Jarvis\PLACEHOLDER.md`
```
placeholder
```
- `Bash` -- `rm "D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Documents\Jarvis\PLACEHOLDER.md" && rmdir "D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Documents\Jarvis" 2>/dev/null; rmdir "D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Documents" 2>/dev/null; ls "D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\" | head -5`
```
Exit code 2
/usr/bin/bash: eval: line 1: unexpected EOF while looking for matching `"'
```
- `Bash` -- `rm -f "D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Documents\Jarvis\PLACEHOLDER.md"
rmdir "D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Documents\Jarvis" 2>/dev/null
rmdir "D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Documents" 2>/dev/null
ls "D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\"`
```
Exit code 2
/usr/bin/bash: eval: line 4: unexpected EOF while looking for matching `"'
```
- `Bash` -- `rm -f "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Documents/Jarvis/PLACEHOLDER.md"
rmdir "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Documents/Jarvis" 2>/dev/null
rmdir "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Documents" 2>/dev/null
ls "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/"`
```
AI
Degree
Internship
Mentorship Program
Projects
```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Week - 2.md`
```
---
type: class
input_kind: lecture
status: seed
created: 2026-09-15
updated: 2026-09-29
area:
  - "[[CSCI 4061 Board]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter - 3]]"
tags:
  - "#class"
  - "#Lecture"
next: [[20_Progress/Degree/CSCI 4061/Weekly/Week - 3]]]"
---
# Week - 2
## What you must be able to do
- Explain why the shell is "just a regular program" and trace how it turns typed input into a running child process (`fork` + `exec`).
- Distinguish a zombie, an orphan, and a daemon process, and say what has (or hasn't) happened for each label to apply.
- Convert between `fopen`-style flags (`"w"`) and low-level `open()` flags (`O_CREAT|O_WRONLY|O_TRUNC`), and explain why `open()` needs a third `mode` argument when `O_CREAT` is set.
- Encode a UNIX permission triple (user/group/other x read/write/execute) as both symbolic (`rwxrwxrwx`) and octal notation, and use `chmod` to change it.
- Explain why a naive `read()`/`write()` copy loop is wrong when the file might not fill the whole buffer, and how a `while ((nbytes = read(...)) > 0)` loop fixes it.
- Distinguish a process's file descriptor table, the kernel's system file table, and the inode table, and say which of the three a `fork()` actually duplicates.
- Explain what `dup2(source_fd, target_fd)` does to the target's existing entry, and how that implements shell output redirection (`>`).
- Explain why `stdout` is line-buffered but `stderr` is unbuffered, using the `printf`/`fprintf(stderr, ...)` interleaving example.
## Key ideas (short)
- The shell's whole job is **read input, `fork` + `exec` a program, repeat** - nothing about it is special OS machinery.
- **Zombie**, **orphan**, and **daemon** are all about the *timing* of exit versus `wait()`, not different kinds of processes.
- `open()`'s flags (`O_CREAT|O_WRONLY|O_TRUNC`, permission bits) give precise control that `fopen()`'s mode strings only approximate.
- A file descriptor is just an index into a **per-process table** that points at a **shared system-wide table**, which points at an **inode** - `fork()` duplicates only the first of those three.
- **Buffering exists purely for performance**: a system call and a disk write are both expensive, so both stdio and the kernel coalesce many small operations into fewer big ones.
## Concepts created today
None created. Low-level I/O (`open`/`read`/`write`/`dup2`), file permissions, and the descriptor/system-file/inode table chain are captured directly in [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]] (environment/memory pieces) and the course's existing [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter - 3]] note, which was **not** part of this session's perfecting pass (only Chapters 1 and 7 were source-checked in Build 1) - treat Chapter 3 citations below as provisional until Build 2 gives it the same treatment.
## Examples worth keeping
- **`ls -l | sort`** (Lec04): the shell forks children for `ls -l` and `sort`, then uses a pipe plus `dup2()` to make `ls`'s stdout become `sort`'s stdin - "printing" is the entire mechanism, no special IPC syntax involved.
- **Knuth vs. McIlroy** (Lec04): Donald Knuth's word-frequency-counter solution ran ~10 book pages with a custom data structure; Doug McIlroy's UNIX-philosophy answer to the identical problem is six piped commands (`tr | tr | sort | uniq -c | sort -rn | head -n 10`) - composing small, sharply focused tools beats one big bespoke program.
- **`file_list.c` permissions** (Lec03/04): `-rw------- 1 jhkolb cs-faculty ... file_list.c` - owner read/write, nothing for group or other, read directly off a real `ls -l` on Prof. Kolb's course-solution files.
- **The `points.bin` exercise** (Lec03): tracing exactly which system calls a `fopen`/`fwrite`/`fclose` program actually issues - `exec`, several `open`/`read`/`mmap` calls just to load shared-library code, one `open` for the real file, one `write` covering *all* the point data at once (not one `write` per struct), one `close`, then `exit`.
- **`dup2` fd-table diagram** (Lec04): after `int out_fd = open(...)` returns fd 3, `dup2(3, STDOUT_FILENO)` makes fd 1 point at the same system-file-table entry as fd 3 - "the process thinks it's printing to the screen, it's really just appending to a file."
## Lecture
### 1. Warmup: Scripting a Program Runner (Lec03, 9/15)
Continuing from Week 1's exit/wait material, the warmup exercise (read a program name and args, run it, print its exit code, repeat) names the actual tools needed: `scanf()`/`strtok()` to parse input, `fork()`/`exec()` to run the program, `wait()` to collect its exit code. **`strtok(char *str, const char *delim)`** splits a string into tokens between delimiter characters: call it once with the real string to get the first token, then repeatedly with `NULL` as the first argument to keep parsing the *same* string (it "remembers" state internally, via a hidden `static` variable) until it returns `NULL`.
### 2. The Shell Is Just a Program (Lec03, 9/15)
Using a terminal means talking to a shell process (`bash` by default on Ubuntu) whose entire job is: read input, launch a program, repeat - "no magic here," and the shell is not part of the OS, just an ordinary program like any other. This reframes the built-in-vs-external-command question from Week 1: `which ls` reveals `/usr/bin/ls`, so even "built-in-feeling" commands are regular programs found via `PATH`; environment variables (recap from Lec02) are how the OS tells programs where to look for things (`PATH` for programs, `LD_PRELOAD`/`LD_LIBRARY_PATH` for shared libraries), and `exec`'s six variants (`execl`, `execle`/`execve`, `execlp`/`execvp`, `execvpe`) differ only in whether arguments come as a list or array, whether a custom environment is given, and whether `PATH` gets searched.
### 3. Zombies, Daemons, and Orphans (Lec03, 9/15)
Waiting for a child can happen in two orders: the parent calls `wait()` and blocks until the child later `exit()`s, or the child `exit()`s first and the parent calls `wait()` later. The second order needs the kernel to **keep a dead process around** so its exit code is still retrievable when the parent finally waits - that dead-but-not-yet-collected state is a **zombie**. A **daemon** is a process whose parent forks it and never waits for it at all, because it's never expected to exit (a web server, `httpd`; a print server, `lpd`; `sshd`) - it just sits, handles input, and repeats. An **orphan** is a child whose parent terminated *without* waiting for it; orphans get adopted by **`init`** (or `systemd` on modern Linux) - the root of the whole process tree, guaranteed PID 1, un-killable, generously adopting every orphan and then acting as a "reaper" (waiting for them) once they finish, so an orphan does not automatically become a zombie the way it might sound.
### 4. Threads vs. Processes, One More Time (Lec03, 9/15)
Both threads and processes let multiple streams of execution run at once. Threads in the same process **share an address space** (cheap cooperation, weaker isolation - this is what made the Week 1 array-summing exercise's threads able to read the same array directly). Each process gets its **own** address space (stronger isolation, more overhead). One application can legitimately be several cooperating processes - a web browser running one process per tab is the lecture's example - which is exactly why interprocess communication becomes necessary later in the course.
### 5. Predicting System Calls from stdio Code (Lec03, 9/15)
Given a small C program that builds an array of `point_t` structs and writes them with `fopen`/`fwrite`/`fclose`, the actual system-call trace (via `strace`-style reasoning) is: `exec` to start the program; several `open`/`read`/`mmap` calls just to bring in shared-library code; one `open` for `points.bin`; **exactly one `write`** covering the entire array at once (not one per element - this is stdio's buffering doing its job already); one `close`; then `exit`. This sets up the low-level-I/O material that follows: dropping to `open`/`read`/`write` directly trades that convenience for byte-exact control.
### 6. From stdio to Low-Level I/O: `open`/`read`/`write` (Lec03-04, 9/15-17)
Moving off stdio means dropping the leading `f` (`fopen` -> `open`), trading mode strings ("w") for explicit bit-flags (`O_CREAT|O_TRUNC|O_WRONLY`), and giving byte counts instead of "elements." `int open(const char *pathname, int flags, ...mode_t mode)` returns a file descriptor; flags combine with bitwise OR: `O_RDONLY`/`O_WRONLY`/`O_RDWR`, `O_CREAT` (create if missing - requires the `mode` argument), `O_TRUNC` (truncate existing contents to zero), `O_APPEND`, `O_EXCL` (fail if the file already exists, useful with `O_CREAT` to guarantee a fresh file). `fopen(..., "w")` is exactly equivalent to `O_CREAT|O_WRONLY|O_TRUNC`. `ssize_t read(int fd, void *buf, size_t count)` and `ssize_t write(int fd, const void *buf, size_t count)` mirror `fread`/`fwrite` in spirit but return raw byte counts, and two classic bugs come from skipping error handling here: an uninitialized pointer `buf` with no allocated space behind it (segfault waiting to happen), and copying with a single `read`+`write` pair that silently writes trailing garbage if `read` didn't fill the whole buffer.
### 7. UNIX File Permissions and `chmod` (Lec03-04, 9/15-17)
Three operations (**read**, **write**, **execute**) apply to three entities (**user**/owner, **group**, **other**), giving the familiar `rwxrwxrwx` bit vector, customarily written in octal: user read/write/execute = 400/200/100, group = 040/020/010, other = 004/002/001. `chmod` sets permissions absolutely by octal (`chmod 700 secret_script.py` - owner gets everything, nobody else gets anything; `chmod 640 project_grades.csv` - owner read/write, group read only) or incrementally (`chmod u+x testius`, `chmod og+r lab02-code.zip`, `chmod o-rw points.bin`). `open()`'s third argument, when `O_CREAT` is set, is exactly this same bit vector expressed with symbolic constants: `S_IRUSR`, `S_IWUSR`, `S_IXUSR`, and the matching `_GRP`/`_OTH` forms (each mapping to the same numeric values as above) - e.g. `open("points.bin", O_CREAT|O_WRONLY|O_TRUNC, S_IRUSR|S_IWUSR)` creates a file only its owner can read or write.
> [!NOTE]
> This lecture's permission-bit and `chmod` material technically belongs to APUE §4.5-4.9, not to Chapter 3 (per the [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]]'s own 2026-09-24 correction) - the professor pulled file-permission content forward into the "Chapter 3 week" lecture even though the book assigns it to Chapter 4's later sections. Worth remembering when Chapter 4 gets its own perfecting pass in Build 2: don't be surprised that this content is "missing" from Chapter 3's note and shows up in Chapter 4 instead.
### 8. Reading and Writing Safely in Chunks (Lec03-04, 9/15-17)
`read()` and `write()` are **not** guaranteed to process the full byte count requested - asking to read 512 bytes but hitting end-of-file after 40 is normal, not an error; only a `-1` return means an actual error. Reading an entire file into one giant `malloc`'d buffer up front is a bad idea for the same reason it always is - a large enough file (the lecture's joke: `open_ai_secret_model.bin`) just runs the process out of memory. The correct pattern reads in a fixed-size loop: `while ((nbytes = read(fd, buf, BUFSIZE)) > 0) { ...use only the first nbytes bytes... }`, stopping naturally when `read` returns 0.
### 9. Buffering: stdio vs. the Kernel (Lec03-04, 9/15-17)
A **buffer** is a temporary chunk of memory holding data that was just read or is about to be written; **buffering** is deferring I/O operations until there's a worthwhile chunk to move at once. Three styles: **fully buffered** (files on disk - wait for a full kernel buffer), **line buffered** (`stdin`/`stdout` - flush on `\n`), **unbuffered** (`stderr` - write immediately). This is exactly why interleaving `printf(...)` and `fprintf(stderr, ...)` calls can print out of the order they were called in: `stderr`'s bytes reach the screen first even when the matching `stdout` calls happened earlier in the code, because `stdout` is still waiting for a newline to flush. `write()` returning success only guarantees the data reached a **kernel-maintained buffer**, not the physical disk (`fsync(int fd)` forces that, but "almost never" needed); `fwrite()` returning success only guarantees the data reached stdio's **own user-space buffer**, not even the kernel yet (`fflush(FILE *f)` forces that hand-off). Both layers buffer for the same reason: a system call costs hundreds of nanoseconds and disks write in fixed chunks (often 4096 bytes), so coalescing many small operations into one big one is a real performance win, not premature optimization. Default advice: use stdio unless you have a specific reason not to.
> [!NOTE]
> This buffering material (fully/line/unbuffered, `fflush`, `fsync`) is APUE Chapter 5 content, not Chapter 3, per the same Textbook Map correction referenced above - it doesn't have a home in any of this course's six currently-landed chapter notes yet, since Chapter 5 was never assigned as its own reading. Worth flagging as an actual gap, not just a misfiled section, when Build 2 reviews the Textbook Map.
### 10. File Descriptor Tables, System File Table, and I-nodes (Lec04, 9/17)
The value `open()` returns is an index into that **process's own file descriptor table**; each entry points into a single, kernel-wide **system file table**. Each system-file-table entry (created fresh by each independent `open()` call, even on the same file) holds the file's offset/position, its access mode, and a pointer into the **inode table** - the layer where the file's actual on-disk metadata lives. Two *unrelated* processes that both `open()` the same file get two separate file-descriptor-table entries and two separate system-file-table entries (each with its own independent offset), but both point at the *same* inode-table entry.
### 11. `fork()` and Shared File Offsets (Lec04, 9/17)
`fork()` gives the child a copy of the parent's entire address space, including its file descriptor table - so the same fd number in parent and child refers to the *same* system-file-table entry, which means they share the same file offset. A read, write, or seek in either process moves that shared offset for both. Worked example: `open()` then `fork()`, then both processes `read(fd, buf, 8)` followed by `write(fd, buf, 8)` on an 8-byte file - one real outcome is the parent reads all 8 bytes (offset now at EOF), writes them right back (offset advances further), and the child's `read` then fails (already at EOF), so the child's `write` appends whatever garbage was left in its uninitialized `buf`. The lecture's own verdict: "possible but not recommended - gets confusing."
### 12. `dup()` and `dup2()`: Redirection Under the Hood (Lec04, 9/17)
`int new_fd = dup(old_fd);` makes a new descriptor pointing at the *same* system-file-table entry as `old_fd` (so they share an offset too). `int dup2(int source_fd, int target_fd);` is the targeted version: it turns `target_fd` into a copy of `source_fd`, automatically closing whatever `target_fd` used to point at first. Built-in descriptors get no special treatment - `dup2(regular_fd, STDOUT_FILENO)` redirects a process's stdout to wherever `regular_fd` points, and the process has no idea it isn't printing to the terminal, because both are fundamentally the same `write()` system call aimed at a different destination. This is also why file descriptors survive `exec()`: it's what lets a shell set up redirection in the child *before* calling `exec`, and have it stick.
### 13. Pipes and the Unix Philosophy (Lec04, 9/17)
Shell "pipes" (`|`) get their name from the OS **pipe**, an interprocess-communication feature covered in full later in the course; `ls -l | sort` connects `ls`'s stdout to `sort`'s stdin by forking children and wiring them together with a pipe plus `dup2()` - "printing" is genuinely the whole mechanism. The Knuth-vs-McIlroy word-frequency story (see Examples worth keeping) frames this as the actual "Unix philosophy": compose small, sharply focused tools instead of writing one large bespoke program. Two closing recipes: `du -d 1 -h . | sort -h -r` (find which subdirectories eat the most disk quota) and `git status | grep modified | awk '{print $2}' | xargs git checkout` (revert every file modified since the last commit) - useful, if not the most idiomatic, demonstrations of the same composability.
## Textbook integration
> [!IMPORTANT]
> Main chapters: [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]] (already source-checked this session) and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter - 3]] (Files and Directories - low-level I/O, assigned this week but not yet source-checked; treat as provisional until Build 2).
The two lectures' file-descriptor-table/system-file-table/inode-table picture and the `dup`/`dup2` mechanics match what Chapter 3 is expected to cover in depth (open/read/write/lseek/close, atomic operations, `dup`, `fcntl`), but that chapter note has not been verified against the actual textbook PDF this session - only Chapters 1 and 7 got that treatment in Build 1. As already flagged in the [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]], two real gaps sit outside all six landed chapter notes: the file-permission-bits material (APUE §4.5-4.9, actually Chapter 4) and the buffering material (APUE Chapter 5, never assigned as its own reading) - both were taught this week even though neither has a proper textbook-note home yet.
## Takeaways (questions to resolve)
- [ ] Once Chapter 3 gets its own perfecting pass, confirm its treatment of the "lowest available fd" rule and the atomic-append (`O_APPEND`) guarantee against this week's lecture claims.
- [ ] Trace the shared-file-offset-after-`fork()` example by hand for a different interleaving (child reads first) and predict the resulting file contents.
- [ ] Why does `dup2()` closing the target descriptor first matter - what would go wrong if it left the old target fd open instead?
- [ ] Confirm on the course container: does `fsync()` actually block until the physical write completes, or just until the kernel buffer is queued?
## Lecture-to-textbook synthesis
- ==A file descriptor is not the file - it's an index into a process-private table that points at a kernel-wide system file table, which in turn points at the inode holding the file's real metadata, and `fork()` duplicates only the first of those three layers.==
- *Mechanism:* Because `fork()` copies the file descriptor table but not the system file table or inode table, parent and child end up sharing the same open-file offset after `fork()` - and `dup2()` exploits that same indirection deliberately, repointing one process's own descriptor slot at another slot's system-file-table entry to implement redirection without the exec'd program ever knowing.
- Lecture example/scenario: the `points.bin` fork-then-read-then-write exercise, where the parent's read/write leaves the child reading past EOF and writing garbage - a direct, concrete demonstration of the shared-offset consequence.
- Textbook connection: [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter - 3]] is expected to formalize this exact table chain (provisional - not yet source-checked); [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]] supplies the process-environment groundwork (fd inheritance across `fork`/`exec`) this week's lecture builds on.
- Concept links: none yet - see Concepts created today above.
> [!WARNING]
> Assuming two *unrelated* processes that both `open()` the same file automatically share an offset is wrong - that sharing only happens across a `fork()` (same system-file-table entry, inherited). Two independent `open()` calls, even on the identical path, create two independent system-file-table entries with two independent offsets, even though both ultimately point at the same inode.
> [!SUMMARY]
> Week 2 is about what a file descriptor actually is - a three-layer indirection, not a magic handle - and how `fork()`'s sharing of exactly one of those three layers is what makes both shared-offset surprises and `dup2()`-based redirection possible.
## Flashcards
#cards/csci4061
What three tables does an open file descriptor pass through, and which of them does `fork()` actually duplicate?::Process file descriptor table -> system file table -> inode table. `fork()` duplicates only the process's file descriptor table; parent and child then share the same system-file-table entry (and its offset), which points at the same inode either way.
Why does `dup2(source_fd, target_fd)` close whatever `target_fd` used to point at first?::So `target_fd` cleanly becomes a copy of `source_fd`'s system-file-table entry with no dangling reference to its old target left open - this is also why it's safe to call on an already-open `target_fd` like `STDOUT_FILENO`.
Two unrelated processes both call `open()` on the same file path. Do they share a file offset?::No. Each independent `open()` call creates its own system-file-table entry with its own offset, even though both entries point at the same inode. Offset sharing only happens across `fork()`, where the child inherits the parent's existing file-descriptor-table entries.
Why is a copy loop that does one `read()` then one `write()` of a fixed size potentially wrong?::`read()` isn't guaranteed to fill the whole buffer - it can return fewer bytes than requested (e.g. hitting EOF early) - so writing the full buffer anyway can append trailing garbage from a previous iteration past the real data.
What's the actual mechanical difference between `write()` returning and the data being safely on disk?::`write()` only guarantees the bytes reached a kernel-maintained buffer; the physical write to disk is deferred and batched for performance. `fsync(fd)` forces the flush to disk, but is almost never needed since the OS buffers for good reason.
A zombie process, an orphan process, and a daemon process are all children whose parents didn't wait for them right away. What actually distinguishes the three?::A zombie has exited but its parent hasn't called `wait()` yet, so the kernel keeps its exit status around. An orphan's parent terminated first, so `init`/`systemd` adopts and eventually reaps it. A daemon's parent deliberately never waits, because the daemon isn't expected to exit at all.

```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Week - 3.md`
```
---
type: class
input_kind: lecture
status: seed
created: 2026-09-22
updated: 2026-09-29
area:
  - "[[CSCI 4061 Board]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]]"
  - "[[20_Progress/Degree/CSCI 4061/Labs/Lab - 2|Lab - 2]]"
tags:
  - "#class"
  - "#Lecture"
next: [[20_Progress/Degree/CSCI 4061/Weekly/Week - 4]]]"
---
# Week - 3
## What you must be able to do
- Distinguish the three things a process can do with an incoming signal (default action, ignore, catch with a handler) and name the two signals that cannot be blocked, caught, or ignored.
- Trace a signal's lifecycle: generated -> pending -> (optionally blocked) -> delivered, and explain what happens if a second instance of the same signal arrives while the first is still pending.
- Use `sigprocmask()` correctly to block and unblock a set of signals around a critical section.
- Explain why `sigaction()` replaced `signal()` as the correct way to install a handler, and what `SA_RESTART` actually changes.
- Explain the specific race condition that makes plain `pause()` unsafe, and why `sigsuspend()` fixes it.
- Identify a non-reentrant function and explain why calling one inside a signal handler is dangerous.
- Trace how `open("/home/sun/hello.txt")` actually resolves, i-node lookup by i-node lookup, from the root directory down.
## Key ideas (short)
- A **signal** is a software notification, asynchronous by nature - it can arrive at literally any point in a process's execution, including mid-system-call.
- **Blocking** a signal defers its delivery; it does not discard it (except `SIGKILL`/`SIGSTOP`, which can never be blocked at all).
- `sigaction()` is strictly better than the old `signal()` - more portable, more reliable, and the only way to get `SA_RESTART` behavior.
- Two dangers recur constantly with signal handlers: **non-reentrant functions** (`printf`, `malloc`, `strtok`) and **clobbering `errno`** underneath the main code path.
- A **file system** turns an array of fixed-size disk blocks into the hierarchical files-and-directories picture users actually see, using **i-nodes** to store metadata separately from file names.
## Concepts created today
None created. Signals are captured in the course's existing [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]] note and file systems in [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]] - **neither chapter has been through this session's source-checking pass** (Build 1 only perfected Chapters 1 and 7), so treat both citations below as provisional until Build 2.
## Examples worth keeping
- **The pause-race exercise** (Lec06): `sigprocmask(SIG_BLOCK, ...)`, do work, `sigprocmask(SIG_UNBLOCK, ...)`, then `pause()` - if the signal arrives in the gap between the unblock and the `pause()` call, the program misses it and can wait forever. `sigsuspend()` collapses unblock-and-wait into one atomic operation to close that gap.
- **The `errno` clobbering exercise** (Lec05): a handler that calls `stat()` (which fails and sets `errno`) can silently corrupt the main code's own `errno` from an unrelated failed `read()`, unless the handler saves and restores `errno` itself.
- **The reentrancy trick question** (Lec06): a global `int z` and a function `f()` that both `main()` and a signal handler call - if the signal interrupts `f()` mid-execution in `main()` and the handler calls `f()` again, `z` can end up with the handler's value even after control returns to `main()`'s own call to `f()`.
- **Classic Unix filesystem tree** (Lec06): `/bin`, `/dev`, `/etc`, `/home`, `/lib`, `/usr`, `/tmp`, `/var` under root - `/home/jhkolb/csci4061/syllabus.txt` as the running path example, resolved i-node by i-node in the lecture's own worked walkthrough.
- **Disk block units** (Lec06): "1 Terabyte" advertised as $10^{12}$ bytes is really $2^{40}$ = 1,099,511,627,776 bytes (a **tebibyte**) - part of why a drive never seems to hold quite as much as the box says, alongside the disk space i-nodes themselves consume.
## Lecture
### 1. Signals: What They Are and How They're Handled (Lec05, 9/22)
A **signal** is a *software* notification of an event, in contrast to a hardware interrupt. The OS "delivers" a signal to a recipient process, which can respond in one of several ways: terminate, pause/resume execution, defer it (leave it pending) to handle later, or ignore it entirely. Signals are asynchronous - they can be delivered at any point during a process's execution - which is exactly what makes them hard to reason about.
### 2. Standardizing Signals: Names, Numbers, Default Actions (Lec05, 9/22)
POSIX standardizes signals the same way it standardizes everything else: an agreed set of signal types, a number and symbolic name for each (`kill -L` prints the full table), and a default response per type. A few concretes: `SIGINT` (2, Ctrl-C, default terminate), `SIGFPE` (8, divide by zero, default usually terminate), `SIGKILL` (9, default terminate, cannot be caught/blocked/ignored), `SIGTERM` (15, default terminate), `SIGCHLD` (17, child terminated, default ignore), `SIGCONT` (18, default resume execution), `SIGSTOP` (19, default pause execution, cannot be caught/blocked/ignored). `SIGUSR1` and `SIGUSR2` exist specifically as blank slots for application-defined meaning - e.g. a child notifying its parent of a custom event - without reusing a name whose meaning is already fixed.
### 3. Sending Signals: `kill()` and the Signal Lifecycle (Lec05, 9/22)
`int kill(pid_t pid, int sig);` sends `sig` to process `pid` (0 on success, -1 on failure) - the name is misleading, since the recipient can react in several different ways, not just die. The terminal equivalent is `kill -s TERM 1234` (dropping the leading `SIG` from the name). A signal's lifecycle: **generated** (e.g. by `kill()` or an event) -> **pending** (generated but not yet delivered) -> **delivered** (process terminates, pauses, is ignored, or - once a handler exists - is caught). A signal stays pending until the receiving process gets a CPU turn; if a *second* instance of the same signal type arrives while the first is still pending, it's simply thrown away - so a process can never tell, after the fact, how many times a given signal actually fired while it was pending.
### 4. Blocking Signals and Critical Sections (Lec05, 9/22)
A process can **block** certain signal types: a blocked signal that arrives stays pending (not discarded) until either the process unblocks it (delivered then) or the process exits (thrown away then). Blocking uses a `sigset_t` data structure and its manipulation calls: `sigemptyset`, `sigfillset`, `sigaddset`, `sigdelset`, `sigismember`. Each process has a **mask** - its current set of blocked signals - changed via `int sigprocmask(int how, sigset_t *set, sigset_t *old_set);`, where `how` is `SIG_BLOCK` (add to the mask), `SIG_UNBLOCK` (remove from the mask), or `SIG_SETMASK` (replace the mask outright); passing `NULL` for `set` with a real `old_set` just inspects the current mask without changing it. `SIGKILL` and `SIGSTOP` can never be blocked - the OS won't let a process become un-terminable, either silently ignoring the attempt or returning an error. The reason to block signals at all: a **critical section** is a chunk of code that must run start-to-finish without a signal interrupting it (closely related to an atomic operation) - the general shape is block, run the critical section, unblock.
### 5. Catching Signals with `sigaction()` (Lec05, 9/22)
A signal handler is any `void` function taking a single `int` (the signal number received). The old way to install one, `signal()`, is now considered bad practice - `sigaction()` is POSIX-standardized, more portable, more reliable, and closes off entire categories of bugs. `int sigaction(int sig, const struct sigaction *act, struct sigaction *oact);` returns 0/-1 as usual; passing `NULL` for `act` with a real `oact` inspects current settings without changing them. Key `struct sigaction` fields: `sa_handler` (a function pointer, or the built-ins `SIG_DFL` for default behavior or `SIG_IGN` to discard the signal entirely), `sa_mask` (signals to additionally block *while this handler is running*, since a new signal can still arrive mid-handler), and `sa_flags` (options, most importantly `SA_RESTART`).
### 6. Tricky Item 1: Signals During System Calls (Lec05-06, 9/22-24)
A signal can arrive while a process is mid-system-call, including one that could otherwise block "forever" (e.g. `read()` from an idle terminal). Historically, system calls were split into "fast" (auto-restarted after a signal) and "slow" (not restarted, requiring hand-written retry loops like `do { ret = read(...); } while (ret == -1 && errno == EINTR);`, where `EINTR` means "interrupted by signal"). Every POSIX system in real use today restarts interrupted system calls automatically - but only if `sa_flags` includes **`SA_RESTART`** when the handler is installed. Practical bottom line: set `SA_RESTART` and this mostly stops being a problem.
### 7. Tricky Item 2: `errno` and Signal Handlers (Lec05-06, 9/22-24)
`errno` is a single global (or thread-local, per Chapter 1 §1.7) variable, and a signal handler runs *inside* whatever code was executing when the signal arrived - so if the handler calls a function that sets `errno` (e.g. `stat()` failing), it can silently clobber the value the main code path was about to check after its own failed call (e.g. `read()`). The fix: save `errno` at the top of the handler and restore it before returning. The lecture's framing of why this "unlikely" sequence matters: "a one-in-a-million chance becomes significant if your code is used by a billion people, or for a billion collective hours" - systems-programming code has to be robust to the genuinely rare case, not just the common one.
### 8. Tricky Item 3: Non-Reentrant Functions (Lec06, 9/24)
A function is **reentrant** if it's safe to start a new call to it while a previous call to the *same* function is still in progress partway through - and this scenario is only possible at all because of signal-handler asynchrony (threads raise the identical concern later in the course). Many common functions are **not** reentrant: `printf`, `malloc`, `free`, `strtok`. The trick-question worked example: a global `int z` and a function `f(x, y)` that sets `z = (x+y)*2+1` and returns it, called from both `main()` and a `SIGINT` handler - if the signal interrupts `f()`'s call from `main()` partway through and the handler calls `f()` again to completion, the handler's call finishes and overwrites `z` before the original, interrupted call to `f()` from `main()` resumes and returns *its own* now-stale computation of `z`, producing two prints that don't match the values you'd naively expect. General guidance: don't call non-reentrant functions from a handler, unless you can guarantee the main code never calls them concurrently and you block every other signal while the handler runs (`sigfillset` on `sa_mask`) - and even then, it's usually not worth the risk.
### 9. Signals and `fork()`/`exec()` (Lec06, 9/24)
At `fork()`, a child inherits its parent's current signal mask, its dispositions (what happens on receipt) for every signal type, and any installed handlers - but the two processes are now independent, so signaling one no longer affects the other. `exec()` changes this differently: the signal mask carries over unchanged, and signals set to be ignored stay ignored, but any signal that was set to a **custom handler** resets to its default response - the new program's code doesn't exist anymore in the old process image, so the old handler function address would be meaningless. A process that wants specific signal behavior to survive into a program it's about to `exec()` needs to set that up explicitly beforehand with `sigprocmask()`/`sigaction()`.
### 10. Waiting for a Signal: `sleep()`, `pause()`, `sigsuspend()` (Lec06, 9/24)
`int sleep(x)` suspends execution until either `x` seconds elapse or a signal is delivered (returning the remaining time if interrupted early; `nanosleep()` gives finer precision). `int pause()` suspends until *any* signal is received (must not be blocked or ignored) - the handler runs first, then `pause()` returns -1, without telling the caller which signal actually arrived. The classic bug: block a signal, do some work, unblock it, then call `pause()` - if the signal arrives in the gap between the unblock and the `pause()` call itself, it's missed entirely and the process can wait forever, because unblocking and starting to wait are two separate, non-atomic steps. `int sigsuspend(const sigset_t *sigmask);` fixes this by doing both atomically: it sets the process mask to `sigmask` *and* suspends execution for a caught signal in one indivisible operation, restoring the old mask once the handler returns (always returns -1). Even `sigsuspend()` isn't a magic universal fix - a signal that arrives *before* this line of code executes at all is still a real possibility that has to be reasoned about separately.
### 11. Storage Devices and File Systems: The Big Picture (Lec06, 9/24)
A storage device offers only a bare-bones interface: an array of fixed-size blocks (historically 512 bytes, now usually 4096, chosen to make a good `read()` size), read or written by block number, via a **device driver** - a kernel module that knows how to talk to one specific hardware component (e.g. a Samsung SSD's microcontroller). A **file system** is the OS component that turns this raw block array into the convenient, hierarchical files-and-directories abstraction users actually see; without one, reading a file means manually tracking which (not-necessarily-contiguous) disk blocks belong to it and following them one at a time.
### 12. Paths, Working Directories, and Home Directories (Lec06, 9/24)
Files live in a hierarchy of directories, identified by a **path** with nodes separated by `/` (e.g. `/home/jhkolb/csci4061/syllabus.txt`). An **absolute path** always starts with `/` and is resolved from root ("drive to a specific street address"); a **relative path** does not, and resolves from the process's current **working directory** ("drive N miles from here") - `cd` changes a shell's own working directory, and a child inherits its parent's working directory at `fork()`. Inside a relative path, `.` means the current directory and `..` means one level up (`../swish.sh` looks one directory up for `swish.sh`). Two system calls tie directly to this: `char *getcwd(char *buf, size_t size);` and `int chdir(char *path);`. Every user also has a **home directory** (`/home/jhkolb`, e.g.), shorthand `~` in the shell only - `~` is not valid inside C code, where the equivalent is reading the `HOME` environment variable with `getenv("HOME")`.
### 13. I-nodes and How `open()` Really Works (Lec06, 9/24)
An **i-node** (index node) stores a file's metadata - size, permissions, owner/group, and (conspicuously not its name) the disk-block indexes holding its actual contents, organized as a tree (direct pointers, then single/double/triple indirect pointers as a file grows large enough to need more leaf capacity). I-nodes originated in the original Unix file system and persist into ext4 (Linux's most common file system) and APFS (Apple's). `stat(char *path, struct stat *statbuf)` and `fstat(int fd, struct stat *statbuf)` retrieve this metadata by path or by descriptor respectively (0 on success, -1 with `errno` set on failure). A directory is itself just a special kind of file whose contents are a list of (filename, i-node number) entries - which is why `open("/home/sun/hello.txt")` is really a chain of directory lookups: read `/`'s known i-node to find the entry for `home` (getting its i-node number), read `/home`'s i-node to find the entry for `sun`, read `/home/sun`'s i-node to find the entry for `hello.txt`, and only then reach the i-node that actually describes the target file. Run `ls -li` to see real i-node numbers directly.
## Textbook integration
> [!IMPORTANT]
> Main chapters: [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]] (Signals) and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]] (Files and Directories - i-nodes, paths, permissions in depth) - **neither has been source-checked against the actual textbook PDF this session**; Build 1 only perfected Chapters 1 and 7, so treat every claim below as provisional until Build 2 verifies these two chapters directly.
Lec06 previewing file-system material (storage devices, i-nodes, paths, directories) a full week before Chapter 4's own scheduled Week 4 reading is already flagged in the [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]]'s 2026-09-24 correction - this week's Lecture section above captures that preview honestly rather than pretending it belongs to Week 4 alone. What lecture likely adds beyond the book on signals: the `SA_RESTART`/fast-vs-slow-syscall history and the `errno`-clobbering worked example read like course-specific emphasis rather than verbatim textbook prose, but this can't be confirmed precisely until Chapter 10 gets its own perfecting pass.
## Takeaways (questions to resolve)
- [ ] Once Chapter 10 is source-checked, confirm its treatment of `SA_RESTART` and the fast/slow system-call history against this week's lecture claims.
- [ ] Once Chapter 4 is source-checked, confirm the direct/single-indirect/double-indirect/triple-indirect i-node pointer structure against the book's own figures.
- [ ] Work through the reentrancy trick question (`f(x,y)` called from both `main()` and a `SIGINT` handler) by hand and predict both possible printed outputs.
- [ ] Why exactly can't `SIGKILL`/`SIGSTOP` be blocked, caught, or ignored - what would break if a process could block them?
## Lecture-to-textbook synthesis
- ==A signal's danger comes entirely from timing, not content: it can be delivered at any point in a process's execution, including mid-system-call, which is why blocking, `SA_RESTART`, and `errno`-saving all exist as direct countermeasures to that one property.==
- *Mechanism:* `sigprocmask()`/`sigaction()` give a process explicit control over *when* it's willing to be interrupted (blocking) and *how* it responds when it is (a handler) - but a handler is really just ordinary code forced to run at an unpredictable point inside whatever else was already executing, which is exactly why non-reentrant functions and shared state like `errno` become dangerous inside one.
- Lecture example/scenario: the `pause()` race (signal arrives in the gap between unblocking and calling `pause()`, missed forever) and the reentrancy trick question (`f()` called from both `main()` and a handler) both demonstrate the same underlying problem - code that assumes it runs start-to-finish without interruption, when signals guarantee no such thing.
- Textbook connection: [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]] is expected to formalize the signal lifecycle and `sigaction()` API this week's lecture walks through hands-on (provisional - not yet source-checked); [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]] is expected to formalize the i-node/directory-lookup chain this week's lecture previews (also provisional).
- Concept links: none yet - see Concepts created today above.
> [!WARNING]
> Assuming `pause()` alone is a safe way to wait for a signal after unblocking it is a real, demonstrated bug pattern this week's lecture built an entire exercise around - the unblock and the wait are two separate calls, and a signal delivered in between is simply lost. `sigsuspend()` exists specifically because this gap is real, not theoretical.
> [!SUMMARY]
> Week 3 is about learning to distrust the assumption that your code runs uninterrupted - signals can land anywhere, including inside a system call or another function call - and the specific tools (`sigprocmask`, `sigaction`, `SA_RESTART`, `sigsuspend`, saving `errno`) that exist to make that unpredictability survivable, right before the course pivots into how a file system turns a flat array of disk blocks into the hierarchy every program takes for granted.
## Flashcards
#cards/csci4061
A second `SIGINT` arrives while the first `SIGINT` is still pending. What happens to it?::It is discarded - a process can never tell after the fact how many times a signal type actually fired while it was pending, since only "pending or not" is tracked, not a count.
Why does `SA_RESTART` matter for a system call like `read()` that's interrupted by a signal?::Without it, an interrupted "slow" system call returns -1 with `errno == EINTR`, requiring a manual retry loop. With `SA_RESTART` set on the handler's `sigaction`, the system call restarts automatically after the handler returns.
What specific race condition makes `sigprocmask(SIG_UNBLOCK, ...)` followed by `pause()` unsafe, and what fixes it?::A signal delivered in the gap between the unblock call and the `pause()` call is simply lost, since the process wasn't yet waiting for it. `sigsuspend()` fixes this by unblocking and waiting in one atomic operation.
Why is `printf()` considered unsafe to call from inside a signal handler?::It is non-reentrant - if the signal interrupts a `printf()` call already in progress in the main code and the handler calls `printf()` again, the two calls can corrupt each other's internal state (buffers, static data).
What changes about a process's signal handlers across a `fork()` versus across an `exec()`?::`fork()`: the child inherits the exact same mask, dispositions, and installed handler functions as the parent. `exec()`: the mask and ignored-signal set carry over unchanged, but any signal set to a *custom handler* resets to its default action, since that handler's code no longer exists in the new program image.
How does `open("/home/sun/hello.txt")` actually resolve to the target file's i-node?::By walking the path one directory at a time: read root's i-node to find `home`'s i-node number from root's directory entries, read `/home`'s i-node to find `sun`'s entry, read `/home/sun`'s i-node to find `hello.txt`'s entry - only the final lookup reaches the target file's own i-node.

```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Week - 4.md`
```
---
type: class
input_kind: lecture
status: seed
created: 2026-09-29
updated: 2026-09-29
area:
  - "[[CSCI 4061 Board]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]]"
tags:
  - "#class"
  - "#Lecture"
next: "Live-capture the Tue 9/29 and Thu 10/1 lectures here once they happen, then fill Textbook integration and the synthesis section"
---
# Week - 4
> [!WARNING]
> This week has not happened yet as of 2026-09-29 (today is the Tuesday of Week 4; lectures run 9/29 and 10/1). No `Lec07`/`Lec08` PDF exists yet in the source folder (`D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\Lecture\`), and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]] has not been through this session's source-checking pass (Build 1 only perfected Chapters 1 and 7). This note is a **pre-lecture scaffold** built from the verified schedule and from what Lec06 already previewed - not a post-lecture synthesis. Fill in the real `## Lecture` capture live, per [[Weekly Standard]]'s lifecycle rule: preserve whatever gets written here first, add to it, never silently replace it with an imagined transcript.
## What you must be able to do
- Per the [[CSCI 4061 Board]] schedule, this week finishes file systems (Stevens Ch 4) and starts IPC with pipes (Stevens §15.1-15.2) - confirm these exact objectives once the real lecture slides land, but expect: name the standard UNIX file types (regular, directory, character special, block special, FIFO, socket, symbolic link) and what distinguishes each.
- Explain hard links versus symbolic links, and why a hard link can't cross file systems while a symbolic link can.
- Read and set permission and special-mode bits (`chmod`, `umask`, set-user-ID/set-group-ID/sticky bit) beyond the basic `rwx` triple Week 2 already covered.
- Explain what a `pipe()` creates (two connected file descriptors) and how a parent/child pair uses it plus `dup2()` to build a one-directional communication channel - directly extending Week 2's `dup2()`/redirection mechanism to interprocess use.
## Key ideas (short)
- Deferred - no real lecture content exists yet to compress into short claims. Fill this in after Tuesday/Thursday's lecture per [[Weekly Standard]].
## Concepts created today
None yet - no lecture has happened. Revisit once this week's real content lands.
## Examples worth keeping
None yet - no lecture has happened. Revisit once this week's real content lands.
## Lecture
### Pre-lecture source notes
Per the [[CSCI 4061 Board]] schedule and the [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]], this week's reading is Stevens Ch 4 (Files and Directories, continued) and §15.1-15.2 (Pipes) of Chapter 15 (Interprocess Communication). [[Lecture - 6|Lec06]] (9/24, captured in[[20_Progress/Degree/CSCI 4061/Weekly/Week - 3|Week 3]]]) already previewed a meaningful slice of Chapter 4 a full week early - storage devices as fixed-size block arrays, device drivers, the file-system abstraction over them, absolute/relative paths, working/home directories, and the i-node/directory-lookup chain behind `open()`. What Week 4's own lectures most likely add on top of that preview, based on the reading assignment alone (not yet confirmed against slides): the full UNIX file-type taxonomy, hard vs. symbolic links, `umask`, and the special permission bits (setuid/setgid/sticky) - then a pivot into `pipe()` and the two-descriptor mechanism that turns Week 2's `dup2()`-based redirection trick into genuine interprocess communication.
> [!WARNING]
> Everything in this `## Lecture` section is inferred from the syllabus reading assignment and last week's preview, not from an actual lecture. Do not treat it as lecture-verified content, and do not let it get cited elsewhere in the vault as if it were.
## Textbook integration
> [!IMPORTANT]
> Main chapters: [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]] (Files and Directories) - not yet source-checked against the actual textbook PDF this session; Stevens §15.1-15.2 (Pipes) has no landed chapter note in this course's `Textbook/` folder at all yet.
Deferred until Chapter 4 gets its own perfecting pass (Build 2) and the real Week 4 lecture happens. Once both exist, this section should state the actual delta - what the book covers beyond lecture, and vice versa - the way Weeks 1-3 do above, not just repeat the reading list.
## Takeaways (questions to resolve)
- [ ] Once Tuesday's lecture (9/29) happens, confirm whether it continues directly from Lec06's i-node preview or restarts the file-systems topic from scratch.
- [ ] Does this course's Chapter 4 note (once perfected in Build 2) cover §15.1-15.2 pipes at all, or does that need its own separate reading/note since it's technically Chapter 15 content?
- [ ] Project 1 is due 10/2, right after this week's Thursday lecture - confirm whether Project 1's spec actually depends on this week's pipe material, or is scoped entirely to Weeks 1-3's fork/exec/I/O/redirection content.
## Lecture-to-textbook synthesis
Deferred - the [[Weekly Standard]]'s six-part synthesis (highlight, mechanism, lecture example, textbook connection, concept links, warning/summary) requires real lecture content to fuse with the textbook, and no lecture has happened yet this week. Fill this in once Thursday's lecture (10/1) lands, following the exact shape used in [[Week - 1]], [[Week - 2]], and[[20_Progress/Degree/CSCI 4061/Weekly/Week - 3]]] above.
## Flashcards
#cards/csci4061
Deferred - flashcards belong after real lecture and textbook content exist to test, not before. Revisit once this week's material actually lands.

```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Weekly Board.md`
```diff
- ---
type: index
status: seed
created: 2026-09-08
updated: 2026-09-08
tags:
  - moc
notes:
  - "[[CSCI 4061 Board]]"
next: "Fill Week - 1.md for real once the week's three lectures (Intro, System Calls, Process Management) are all done"
---
# CSCI 4061 — Weekly Board
Index of this course's week-by-week synthesis notes. [[CSCI 4061 Board]] is the full syllabus, grading, and schedule source - this note tracks only the weekly-note layer as it fills in over the semester.
## Map
`Week - 1.md` exists as an untouched template scaffold (the raw [[Week Template]] content, not real lecture capture yet) - Week 1's three lectures span 9/7 (Labor Day, no class) through 9/10, so there's real content to add once that week finishes. Each week from here follows [[Weekly Standard]], cross-referenced against the reading assignments in [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]].
## Status
0 of 15 weeks actually written as of 2026-09-08, despite the Week 1 scaffold existing. Week numbering should follow the Board note's Schedule table directly - that table already holds the real reading and due-date pairing per week.
+ ---
type: index
status: sprout
created: 2026-09-08
updated: 2026-09-29
tags:
  - moc
notes:
  - "[[CSCI 4061 Board]]"
next: "Live-capture Week 4's real lectures (9/29, 10/1) once they happen; source-check Chapters 3, 4, 8, 10 in Build 2 and reconcile Weeks 2-4's provisional citations against them"
---
# CSCI 4061 — Weekly Board
Index of this course's week-by-week synthesis notes. [[CSCI 4061 Board]] is the full syllabus, grading, and schedule source - this note tracks only the weekly-note layer as it fills in over the semester.
## Map
- [[Week - 1]] - captured and reconciled. Lec01 (9/8, course intro/OS framing) and Lec02 (9/10, `_start()`/memory layout/`fork`/`exec`/`wait`), synthesized against [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]], both source-checked this session.
- [[Week - 2]] - captured and reconciled. Lec03 (9/15) and Lec04 (9/17), low-level I/O (`open`/`read`/`write`), file permissions, the fd-table/system-file-table/inode chain, `dup2`/redirection, and pipes. Cites [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter - 3]], which is **not yet source-checked** - treat those citations as provisional until Build 2.
- [[Week - 3]] - captured and reconciled. Lec05 (9/22) and Lec06 (9/24), signals end-to-end plus an early preview of file systems/i-nodes. Cites [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]], **neither source-checked yet** - provisional until Build 2.
- [[Week - 4]] - **pre-lecture scaffold only**, built 2026-09-29 before that week's lectures (9/29, 10/1) happen. No `Lec07`/`Lec08` exists in the source folder yet. Fill the real `## Lecture` capture live once class happens, per [[Weekly Standard]]'s lifecycle rule.
Each week follows [[Weekly Standard]], cross-referenced against the reading assignments in [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]].
## Status
4 of 15 weeks now have notes as of 2026-09-29 - Weeks 1-3 captured and reconciled, Week 4 a pre-lecture scaffold awaiting real lecture. The weekly layer is **current, not ahead**: it tracks exactly through the last lecture that has actually happened (9/24), with Week 4 honestly marked incomplete rather than backfilled. The earliest real gap is Week 4's live lecture capture, due once 9/29's and 10/1's lectures happen. A second, separate gap: only [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]] have been source-checked against the textbook PDF (this session's Build 1) - Chapters 3, 4, 8, and 10 remain in their original, unverified state, and every weekly note above that cites them flags this explicitly.
```
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Textbook Map.md`
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Textbook Map.md`
```diff
- status: seed
created: 2026-09-08
updated: 2026-09-08
area:
  - "[[CSCI 4061 Board]]"
tags:
  - "#class"
  - "#Textbook"
next: "Create the first Stevens chapter note once Week 1's Chs 1, 7, 8 are actually covered"
---
+ status: sprout
created: 2026-09-08
updated: 2026-09-29
area:
  - "[[CSCI 4061 Board]]"
tags:
  - "#class"
  - "#Textbook"
next: "Build 2: source-check Chapters 3, 4, 8, and 10 against the textbook PDF the same way Chapters 1 and 7 were source-checked in Build 1"
---
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Textbook Map.md`
```diff
- - **Ch 1, 7, 8** - Week 1: System calls, process management basics.
- **Ch 7, 3** - Week 2: Process management continued, low-level and advanced I/O.
- **Ch 10, 4** - Week 3: Signals, intro file systems.
- **Ch 4, 15.1-15.2** - Week 4: File systems continued, IPC pipes.
- **15.1, 15.2, 15.9** - Week 5: IPC pipes and shared memory.
- **15.9, 14.4** - Week 6: Finish IPC/multiplexed I/O, systems programming in Python and C/Python interop.
- **Ch 11** - Week 7: Threads, basic synchronization.
- **Ch 11, 12, 16** - Week 8: Advanced synchronization, start networking.
- **Ch 16** - Week 9: Sockets, UDP/TCP, HTTP.
None of these have an individual chapter note yet - each gets created as its week is actually covered, per [[Weekly Standard]].
+ - **Ch 1, 7, 8** - Week 1: System calls, process management basics. [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter 1]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter 7]] are landed and **source-checked against the textbook PDF** (2026-09-29). [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8|Chapter 8]] is landed but not yet source-checked.
- **Ch 7, 3** - Week 2: Process management continued, low-level and advanced I/O. [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter 3]] is landed but not yet source-checked.
- **Ch 10, 4** - Week 3: Signals, intro file systems. [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter 10]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter 4]] are landed but not yet source-checked.
- **Ch 4, 15.1-15.2** - Week 4: File systems continued, IPC pipes. Chapter 4 is landed (not source-checked); no note exists yet for §15.1-15.2.
- **15.1, 15.2, 15.9** - Week 5: IPC pipes and shared memory. No chapter note yet.
- **15.9, 14.4** - Week 6: Finish IPC/multiplexed I/O, systems programming in Python and C/Python interop. No chapter note yet.
- **Ch 11** - Week 7: Threads, basic synchronization. No chapter note yet.
- **Ch 11, 12, 16** - Week 8: Advanced synchronization, start networking. No chapter note yet.
- **Ch 16** - Week 9: Sockets, UDP/TCP, HTTP. No chapter note yet.
Six chapter notes exist as of 2026-09-29 (Chapters 1, 3, 4, 7, 8, 10), covering Weeks 1-4's reading in full - only Chapters 1 and 7 have been checked against the actual textbook PDF so far (Build 1 of the current perfecting pass); Chapters 3, 4, 8, and 10 remain in their original, unverified state until Build 2. Chapters for Weeks 5+ are created as their weeks are actually covered, per [[Weekly Standard]].
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Textbook Map.md`
```diff
- ## Status
Zero chapter notes written as of 2026-09-08 - the course is in Week 1 (started 9/8). This map exists so the reading-to-week mapping is planned before individual chapter notes start getting created piecemeal.
+ ## Status
Six chapter notes exist as of 2026-09-29, matching Weeks 1-4's full reading list. Two (Chapters 1 and 7) are source-checked against the actual textbook PDF, restructured to this vault's real Textbook Standard shape (`Full Reading Notes` heading restored, duplicate template stubs removed, frontmatter fixed, flashcards capped at 10 under `#cards/csci4061`), and enriched with worked examples the original NotebookLM pass had dropped - see each chapter's own Connections section for the lecture-coverage-gap detail. The remaining four (Chapters 3, 4, 8, 10) still carry the original pass's structural issues (missing `Full Reading Notes` heading, duplicate stub sections, blank frontmatter dates, `area:` pointing at `[[UMN Board]]` instead of this course's own Board) and are the explicit target of Build 2.
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\CSCI 4061 Board.md`
```diff
- next: "Complete the Docker environment setup during Lab 1 (Mon 2026-09-14) - the first real graded action in this course"
+ next: "Attend and live-capture Week 4's lectures (Tue 9/29, Thu 10/1) into [[Week - 4]], then finish Project 1 before its 10/2 deadline"
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && git status --short -- "20_Progress/Degree/CSCI 4061"`
```
 M "20_Progress/Degree/CSCI 4061/CSCI 4061 Board.md"
 M "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1.md"
 M "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7.md"
 M "20_Progress/Degree/CSCI 4061/Textbook/Textbook Map.md"
 M "20_Progress/Degree/CSCI 4061/Weekly/Week - 1.md"
 M "20_Progress/Degree/CSCI 4061/Weekly/Weekly Board.md"
?? "20_Progress/Degree/CSCI 4061/Weekly/Week - 2.md"
?? "20_Progress/Degree/CSCI 4061/Weekly/Week - 3.md"
?? "20_Progress/Degree/CSCI 4061/Weekly/Week - 4.md"
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && grep -n '^$' "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1.md"`
```
94:
```
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Chapter - 1.md`
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && for f in "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7.md" "20_Progress/Degree/CSCI 4061/Weekly/Week - 1.md" "20_Progress/Degree/CSCI 4061/Weekly/Week - 2.md" "20_Progress/Degree/CSCI 4061/Weekly/Week - 3.md" "20_Progress/Degree/CSCI 4061/Weekly/Week - 4.md"; do echo "=== $f ==="; grep -n '^$' "$f"; done`
```
Exit code 1
=== 20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7.md ===
=== 20_Progress/Degree/CSCI 4061/Weekly/Week - 1.md ===
=== 20_Progress/Degree/CSCI 4061/Weekly/Week - 2.md ===
=== 20_Progress/Degree/CSCI 4061/Weekly/Week - 3.md ===
=== 20_Progress/Degree/CSCI 4061/Weekly/Week - 4.md ===
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && grep -n '\[\[Lecture\|\[\[Lab' "20_Progress/Degree/CSCI 4061/Weekly/Week - 1.md" "20_Progress/Degree/CSCI 4061/Weekly/Week - 2.md" "20_Progress/Degree/CSCI 4061/Weekly/Week - 3.md" "20_Progress/Degree/CSCI 4061/Weekly/Week - 4.md"`
```
20_Progress/Degree/CSCI 4061/Weekly/Week - 4.md:31:Per the [[CSCI 4061 Board]] schedule and the [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]], this week's reading is Stevens Ch 4 (Files and Directories, continued) and §15.1-15.2 (Pipes) of Chapter 15 (Interprocess Communication). [[Lecture - 6|Lec06]] (9/24, captured in [[Week - 3|Week 3]]) already previewed a meaningful slice of Chapter 4 a full week early - storage devices as fixed-size block arrays, device drivers, the file-system abstraction over them, absolute/relative paths, working/home directories, and the i-node/directory-lookup chain behind `open()`. What Week 4's own lectures most likely add on top of that preview, based on the reading assignment alone (not yet confirmed against slides): the full UNIX file-type taxonomy, hard vs. symbolic links, `umask`, and the special permission bits (setuid/setgid/sticky) - then a pivot into `pipe()` and the two-descriptor mechanism that turns Week 2's `dup2()`-based redirection trick into genuine interprocess communication.
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Week - 4.md`
```diff
- [[Lecture - 6|Lec06]] (9/24, captured in [[Week - 3|Week 3]]) already previewed
+ Lec06 (9/24, captured in [[Week - 3|Week 3]]) already previewed
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && grep -ohE '\[\[[^]]+\]\]' "20_Progress/Degree/CSCI 4061/Weekly/Week - 1.md" "20_Progress/Degree/CSCI 4061/Weekly/Week - 2.md" "20_Progress/Degree/CSCI 4061/Weekly/Week - 3.md" "20_Progress/Degree/CSCI 4061/Weekly/Week - 4.md" "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1.md" "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7.md" "20_Progress/Degree/CSCI 4061/Weekly/Weekly Board.md" "20_Progress/Degree/CSCI 4061/Textbook/Textbook Map.md" | sort -u`
```
[[20_Progress/Degree/CSCI 4061/Labs/Lab - 2|Lab - 2]]
[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]]
[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter 10]]
[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]]
[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter 1]]
[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter - 3]]
[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter 3]]
[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]]
[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter 4]]
[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]]
[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter 7]]
[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8|Chapter - 8]]
[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8|Chapter 8]]
[[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]]
[[20_Progress/Degree/Repetitive Things|Repetitive Things]]
[[CSCI 4061 Board]]
[[UMN Board]]
[[Week - 1]]
[[Week - 2]]
[[Week - 3]]
[[Week - 3|Week 3]]
[[Week - 4]]
[[Weekly Standard]]
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && grep -n '\[\[UMN Board\]\]' "20_Progress/Degree/CSCI 4061/Weekly/Week - 1.md" "20_Progress/Degree/CSCI 4061/Weekly/Week - 2.md" "20_Progress/Degree/CSCI 4061/Weekly/Week - 3.md" "20_Progress/Degree/CSCI 4061/Weekly/Week - 4.md" "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1.md" "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7.md" "20_Progress/Degree/CSCI 4061/Weekly/Weekly Board.md" "20_Progress/Degree/CSCI 4061/Textbook/Textbook Map.md"`
```
20_Progress/Degree/CSCI 4061/Textbook/Textbook Map.md:35:Six chapter notes exist as of 2026-09-29, matching Weeks 1-4's full reading list. Two (Chapters 1 and 7) are source-checked against the actual textbook PDF, restructured to this vault's real Textbook Standard shape (`Full Reading Notes` heading restored, duplicate template stubs removed, frontmatter fixed, flashcards capped at 10 under `#cards/csci4061`), and enriched with worked examples the original NotebookLM pass had dropped - see each chapter's own Connections section for the lecture-coverage-gap detail. The remaining four (Chapters 3, 4, 8, 10) still carry the original pass's structural issues (missing `Full Reading Notes` heading, duplicate stub sections, blank frontmatter dates, `area:` pointing at `[[UMN Board]]` instead of this course's own Board) and are the explicit target of Build 2.
```
- `Glob` -- pattern `**/UMN Board.md` path ``
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && echo "--- Chapter 1 highlight count ---" && grep -c '==' "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1.md" && echo "--- Chapter 7 highlight count ---" && grep -c '==' "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7.md"`
```
--- Chapter 1 highlight count ---
14
--- Chapter 7 highlight count ---
10
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && grep -n '==' "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1.md"`
```
20:UNIX exposes hardware and kernel services to every program through one disciplined boundary, the ==system call interface==, and everything else in this chapter (shell, files, processes, signals, time, error codes) is a convention built on top of that boundary (p. 1).
64:- ==**signal**==: Asynchronous software notification delivered to a process by the kernel (p. 18).
79:*Course Framing (Lec01):* The System-Call-API layer sits directly between user application code and the kernel; contemporary systems adhere to open standardization, so APUE "would more accurately be titled POSIX Systems Programming" (Lec01). ==In a strict sense, an operating system is the software called the kernel that controls hardware resources and provides an environment under which programs run, accessible only via system calls.==
100:    if ((dp = opendir(argv[1])) == NULL)
147:        if (putc(c, stdout) == EOF)
179:        if (buf[strlen(buf) - 1] == '\n')
183:        } else if (pid == 0) {
234:> The thread-local `errno` macro is worth sitting with. `errno` looks like an ordinary global variable everywhere in the code you write (`errno = ENOENT;`, `if (errno == EACCES)`), but under the hood `#define errno (*__errno_location())` means every reference is secretly a function call that returns a pointer into *that specific thread's* storage. Without this trick, two threads hitting errors at once would stomp on the same shared `errno`, and whichever thread checked it last would see the wrong error.
258:    if (signal(SIGINT, sig_int) == SIG_ERR)
262:        if (buf[strlen(buf) - 1] == '\n')
266:        } else if (pid == 0) {
304:3. *Hand-written Assembly (`syscall`):* ==`movq $1, %rax` loads the system-call number for `sys_write` into `%rax`, `movq $1, %rdi` sets file descriptor 1, `movq $msg, %rsi` sets the message address, `movq $14, %rdx` sets the byte length, and the `syscall` instruction triggers an immediate hardware transition into the kernel's dispatcher without going through any C runtime function at all.==
313:- [ ] ==Test what a shell does when `SIGINT` is sent to a process catching the signal versus one that ignores it versus one that takes the default action.==
318:Why is `errno` defined as a thread-local macro on modern POSIX systems?::==Expanding `errno` into `*__errno_location()` gives each thread its own isolated error slot, so one thread's error doesn't overwrite another thread's `errno` between the failing call and the check.== #cards/csci4061
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && grep -n '==[^=]' "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7.md" | grep -v '== *NULL\|== *-1\|== *0\|== *EOF\|== *SIG_ERR\|=='\''\\n'\'''`
```
39:- ==**stack overflow**==: What happens when the growing stack and growing heap collide in virtual address space (Lec02).
57:*Course Framing (Lec02):* `main()` is "just another C function," not the true entry point. The real entry point is **`_start()`**, which the C runtime/compiler provides automatically (you can write your own, as in Lecture 1's assembly Hello World). `_start()` sets up the stack and heap, issues the `call` instruction into `main()`, and handles cleanup once `main` returns (Lec02). ==When a C program is executed by the kernel, `_start()` is the true entry point - it takes command-line arguments and the environment from the kernel, sets up the runtime, and only then calls `main()`.==
244:    limit.rlim_cur == RLIM_INFINITY ? printf("(infinite) ") : printf("%10lld ", (long long)limit.rlim_cur);
245:    limit.rlim_max == RLIM_INFINITY ? printf("(infinite)\n") : printf("%10lld\n", (long long)limit.rlim_max);
258:4. *Contrast with library lookup:* ==`LD_PRELOAD` and `LD_LIBRARY_PATH` solve a different problem for the dynamic linker at load/link time - locating shared object (`.so`) files - not locating the executable program itself, which is entirely `PATH`'s job.==
266:- [ ] ==Verify experimentally how `atexit()` handlers interact with `exit()` versus `_exit()` - register a handler, then terminate via both paths and compare.==
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && grep -n '==' "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7.md" | grep -E '^(1[0-9]|2[0-9]):|system call interface|Chapter Summary|#cards'`
```
(Bash completed with no output)
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Chapter - 7.md`
```diff
- ## Chapter Summary
A C process runs inside an environment the kernel and C runtime build for it before `main` ever executes, and that same environment - memory layout, command-line arguments, environment variables, resource limits - determines how the process can allocate memory, read configuration, and eventually terminate (p. 197).
+ ## Chapter Summary
A C process runs inside an environment the kernel and C runtime build for it before `main` ever executes, and that same environment - memory layout, command-line arguments, environment variables, resource limits - determines ==how the process can allocate memory, read configuration, and eventually terminate== (p. 197).
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && echo "=== Ch1 sections and highlight check ===" && awk '/^## /{print NR": "$0}' "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1.md" && echo "=== Ch7 sections ===" && awk '/^## /{print NR": "$0}' "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7.md"`
```
=== Ch1 sections and highlight check ===
19: ## Chapter Summary
22: ## Key Concepts
73: ## Full Reading Notes
300: ## Worked Example
306: ## Connections
310: ## Open Questions
316: ## Flashcards
=== Ch7 sections ===
19: ## Chapter Summary
22: ## Key Concepts
52: ## Full Reading Notes
253: ## Worked Example
259: ## Connections
264: ## Open Questions
270: ## Flashcards
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && for f in "Week - 1" "Week - 2" "Week - 3" "Week - 4"; do echo "=== $f ==="; grep -n '==' "20_Progress/Degree/CSCI 4061/Weekly/$f.md"; done`
```
Exit code 1
=== Week - 1 ===
69:- ==A system call is the only doorway from user-space code into the kernel; every other UNIX abstraction this week - the shell, `fork`, `exec`, environment variables, even `printf` - is a convention built on top of that one doorway.==
=== Week - 2 ===
81:- ==A file descriptor is not the file - it's an index into a process-private table that points at a kernel-wide system file table, which in turn points at the inode holding the file's real metadata, and `fork()` duplicates only the first of those three layers.==
=== Week - 3 ===
52:A signal can arrive while a process is mid-system-call, including one that could otherwise block "forever" (e.g. `read()` from an idle terminal). Historically, system calls were split into "fast" (auto-restarted after a signal) and "slow" (not restarted, requiring hand-written retry loops like `do { ret = read(...); } while (ret == -1 && errno == EINTR);`, where `EINTR` means "interrupted by signal"). Every POSIX system in real use today restarts interrupted system calls automatically - but only if `sa_flags` includes **`SA_RESTART`** when the handler is installed. Practical bottom line: set `SA_RESTART` and this mostly stops being a problem.
77:- ==A signal's danger comes entirely from timing, not content: it can be delivered at any point in a process's execution, including mid-system-call, which is why blocking, `SA_RESTART`, and `errno`-saving all exist as direct countermeasures to that one property.==
89:Why does `SA_RESTART` matter for a system call like `read()` that's interrupted by a signal?::Without it, an interrupted "slow" system call returns -1 with `errno == EINTR`, requiring a manual retry loop. With `SA_RESTART` set on the handler's `sigaction`, the system call restarts automatically after the handler returns.
=== Week - 4 ===
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && for f in "Textbook/Chapter - 1" "Textbook/Chapter - 7" "Weekly/Week - 1" "Weekly/Week - 2" "Weekly/Week - 3" "Weekly/Week - 4"; do echo "=== $f ==="; sed -n '1,14p' "20_Progress/Degree/CSCI 4061/$f.md"; done`
```
=== Textbook/Chapter - 1 ===
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
next: "Feed this chapter into Week - 1's Textbook integration section, then build Week - 1"
---
=== Textbook/Chapter - 7 ===
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
next: "Feed this chapter into Week - 1/Week - 2's Textbook integration sections, then build the weekly notes"
---
=== Weekly/Week - 1 ===
---
type: class
input_kind: lecture
status: seed
created: 2026-09-08
updated: 2026-09-29
area:
  - "[[CSCI 4061 Board]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]]"
tags:
  - "#class"
  - "#Lecture"
next: "[[Week - 2]]"
=== Weekly/Week - 2 ===
---
type: class
input_kind: lecture
status: seed
created: 2026-09-15
updated: 2026-09-29
area:
  - "[[CSCI 4061 Board]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter - 3]]"
tags:
  - "#class"
  - "#Lecture"
next: "[[Week - 3]]"
=== Weekly/Week - 3 ===
---
type: class
input_kind: lecture
status: seed
created: 2026-09-22
updated: 2026-09-29
area:
  - "[[CSCI 4061 Board]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]]"
  - "[[20_Progress/Degree/CSCI 4061/Labs/Lab - 2|Lab - 2]]"
tags:
  - "#class"
  - "#Lecture"
=== Weekly/Week - 4 ===
---
type: class
input_kind: lecture
status: seed
created: 2026-09-29
updated: 2026-09-29
area:
  - "[[CSCI 4061 Board]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]]"
tags:
  - "#class"
  - "#Lecture"
next: "Live-capture the Tue 9/29 and Thu 10/1 lectures here once they happen, then fill Textbook integration and the synthesis section"
---
```

## You

Go aheead and build out the build 2 for the rest of textbook notes exactly same way. Follow everything that has been mentioned correctly.

## Claude

API Error: The response stopped arriving. The response above may be incomplete.

### Tool Calls

- `Bash` -- `ls -la /tmp/apue/ 2>&1 | head -20`
```
total 3488
drwxr-xr-x 1 anant 197609       0 Sep 29 13:30 .
drwxr-xr-x 1 anant 197609       0 Sep 29 14:05 ..
-rw-r--r-- 1 anant 197609   32012 Sep 29 13:30 Lec01.txt
-rw-r--r-- 1 anant 197609   22186 Sep 29 13:30 Lec02.txt
-rw-r--r-- 1 anant 197609   25136 Sep 29 13:30 Lec03.txt
-rw-r--r-- 1 anant 197609   22853 Sep 29 13:30 Lec04.txt
-rw-r--r-- 1 anant 197609   20842 Sep 29 13:30 Lec05.txt
-rw-r--r-- 1 anant 197609   25279 Sep 29 13:30 Lec06.txt
-rw-r--r-- 1 anant 197609 2745126 Sep 29 13:28 full.txt
```
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Chapter - 3.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Chapter - 4.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Chapter - 8.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Chapter - 10.md`
- `Bash` -- `grep -n "^3\.[0-9]* \|^4\.[0-9]* \|^8\.[0-9]* \|^10\.[0-9]* " /tmp/apue/full.txt | sed -n '1,90p'`
```
390:8.1           Introduction 227
393:8.3          fork Function 229                         313
395:8.4          vfork Function 234
397:8.5          exit Functions 236
399:8.6          wait and waitpid Functions 238
401:8.7          waitid Function 244
403:8.8          wait3 and wait4 Functions 245
405:8.9          Race Conditions 245
407:8.10         exec Functions 249
409:8.11         Changing User IDs and Group IDs 255
411:8.12         Interpreter Files 260
413:8.13         system Function 264
415:8.14         Process Accounting 269
417:8.15         User Identification 275
419:8.16         Process Scheduling 276
421:8.17         Process Times 280
423:8.18         Summary 282
453:10.8          Reliable-Signal Terminology and Semantics 335
454:10.9          kill and raise Functions 336
455:10.10         alarm and pause Functions 338
456:10.11         Signal Sets 344
457:10.12         sigprocmask Function 346
458:10.13         sigpending Function 347
459:10.14         sigaction Function 349
460:10.15         sigsetjmp and siglongjmp Functions 355
461:10.16         sigsuspend Function 359
462:10.17         abort Function 365
463:10.18         system Function 367
464:10.19         sleep, nanosleep, and clock_nanosleep
466:10.20              Functions 373
467:10.21         sigqueue Function 376
468:10.22         Job-Control Signals 377
469:10.23         Signal Names and Numbers 379
1134:3. BSD/386 (a derivative of the BSD Net 2 release) from Berkeley Software Design,
1138:4. SunOS 4.1.1 and 4.1.2 (systems with a strong Berkeley heritage but many
4499:3.1 Introduction
4519:3.2 File Descriptors
4550:3.3 open and openat Functions
4742:3.4 creat Function
4768:3.5 close Function
4784:3.6 lseek Function
5035:3.7 read Function
5092:3.8 write Function
5111:3.9 I/O Efficiency
5223:3.10 File Sharing
5392:3.11 Atomic Operations
5492:3.12 dup and dup2 Functions
5576:3.13  sync, fsync, and fdatasync Functions
5614:3.14 fcntl Function
5925:3.15  ioctl Function
5985:3.16  /dev/fd
6049:3.17  Summary
6108:3.6 If you open a file for read-write with the append flag, can you still read from anywhere in
6116:4.1 Introduction
6128:4.2 stat, fstat, fstatat, and lstat Functions
6219:4.3 File Types
6396:4.4 Set-User-ID and Set-Group-ID
6460:4.5 File Access Permissions
6577:4.6 Ownership of New Files and Directories
6612:4.7 access and faccessat Functions
6731:4.8 umask Function
6847:4.9 chmod, fchmod, and fchmodat Functions
7002:4.10  Sticky Bit
7044:4.11  chown, fchown, fchownat, and lchown Functions
7113:4.12  File Size
7202:4.13  File Truncation
7231:4.14 File Systems
7389:4.15 link, linkat, unlink, unlinkat, and remove Functions
7570:4.16 rename and renameat Functions
7627:4.17 Symbolic Links
7777:4.18 Creating and Reading Symbolic Links
7824:4.19 File Times
7919:4.20 futimens, utimensat, and utimes Functions
8115:4.21 mkdir, mkdirat, and rmdir Functions
8185:4.22  Reading Directories
8539:4.23 chdir, fchdir, and getcwd Functions
8680:4.24  Device Special Files
8816:4.25  Summary of File Access Permission Bits
8867:4.26 Summary
8880:4.1 Modify the program in Figure 4.3 to use stat instead of lstat. What changes if one of the
8883:4.2 What happens if the file mode creation mask is set to 777 (octal)? Verify the results using
8886:4.3 Verify that turning off user-read permission for a file that you own denies your access to
8889:4.4 Run the program in Figure 4.9 after creating the files foo and bar. What happens?
8891:4.5 In Section 4.12, we said that a file size of 0 is valid for a regular file. We also said that the
8895:4.6 Write a utility like cp(1) that copies a file containing holes, without writing the bytes of 0 to
8898:4.7 Note in the output from the ls command in Section 4.12 that the files core and
8902:4.8 When running the program in Figure 4.16, we check the available disk space with the df(1)
8905:4.9 In Figure 4.20, we show the unlink function as modifying the changed-status time of the
8908:4.10 In Section 4.22, how does the system's limit on the number of open files affect the myftw
8911:4.11 In Section 4.22, our version of ftw never changes its directory. Modify this routine so that
```
- `Bash` -- `grep -n "^10\.[0-9]* " /tmp/apue/full.txt | sed -n '1,20p'`
```
453:10.8          Reliable-Signal Terminology and Semantics 335
454:10.9          kill and raise Functions 336
455:10.10         alarm and pause Functions 338
456:10.11         Signal Sets 344
457:10.12         sigprocmask Function 346
458:10.13         sigpending Function 347
459:10.14         sigaction Function 349
460:10.15         sigsetjmp and siglongjmp Functions 355
461:10.16         sigsuspend Function 359
462:10.17         abort Function 365
463:10.18         system Function 367
464:10.19         sleep, nanosleep, and clock_nanosleep
466:10.20              Functions 373
467:10.21         sigqueue Function 376
468:10.22         Job-Control Signals 377
469:10.23         Signal Names and Numbers 379
18178:10.1 Introduction
18199:10.2 Signal Concepts
18734:10.3 signal Function
18932:10.4 Unreliable Signals
```
- `Bash` -- `sed -n '18930,18940p' /tmp/apue/full.txt; grep -n "^10\.[4-8] " /tmp/apue/full.txt | sed -n '1,10p'`
```
          signal-catching function has meaning in the child.

10.4 Unreliable Signals

In earlier versions of the UNIX System (such as Version 7), signals were unreliable. By
this we mean that signals could get lost: a signal could occur and the process would
never know about it. Also, a process had little control over a signal: a process could
catch the signal or ignore it. Sometimes, we would like to tell the kernel to block a
signal: don't ignore it, just remember if it occurs, and tell us later when we're ready.

             Changes were made with 4.2BSD to provide what are called reliable signals. A different set of
453:10.8          Reliable-Signal Terminology and Semantics 335
18932:10.4 Unreliable Signals
19026:10.5  Interrupted System Calls
19162:10.6 Reentrant Functions
19302:10.7  SIGCLD Semantics
19449:10.8 Reliable-Signal Terminology and Semantics
22127:10.4 In Figure 10.11, we showed a technique that's often used to set a timeout on an I/O
22141:10.5 Using only a single timer (either alarm or the higher-precision setitimer), provide a set
22144:10.6 Write the following program to test the parent-child synchronization functions in
22150:10.7 In the function shown in Figure 10.25, if the caller catches SIGABRT and returns from the
```
- `Bash` -- `sed -n '4784,5035p' /tmp/apue/full.txt`
```
3.6 lseek Function

          Every open file has an associated ``current file offset,'' normally a non-negative integer
          that measures the number of bytes from the beginning of the file. (We describe some
          exceptions to the ``non-negative'' qualifier later in this section.) Read and write
          operations normally start at the current file offset and cause the offset to be incremented
          by the number of bytes read or written. By default, this offset is initialized to 0 when a
          file is opened, unless the O_APPEND option is specified.
Section 3.6  lseek Function 67

                An open file's offset can be set explicitly by calling lseek.

                  #include <unistd.h>

                  off_t lseek(int fd, off_t offset, int whence);

                                                                                  Returns: new file offset if OK, -1 on error

          The interpretation of the offset depends on the value of the whence argument.

                � If whence is SEEK_SET, the file's offset is set to offset bytes from the beginning of
                    the file.

                � If whence is SEEK_CUR, the file's offset is set to its current value plus the offset.
                    The offset can be positive or negative.

                � If whence is SEEK_END, the file's offset is set to the size of the file plus the offset.
                    The offset can be positive or negative.

          Because a successful call to lseek returns the new file offset, we can seek zero bytes
          from the current position to determine the current offset:

                  off_t currpos;

                  currpos = lseek(fd, 0, SEEK_CUR);

          This technique can also be used to determine if a file is capable of seeking. If the file
          descriptor refers to a pipe, FIFO, or socket, lseek sets errno to ESPIPE and returns -1.

                                  The three symbolic constants--SEEK_SET, SEEK_CUR, and SEEK_END--were introduced
                                  with System V. Prior to this, whence was specified as 0 (absolute), 1 (relative to the current
                                  offset), or 2 (relative to the end of file). Much software still exists with these numbers hard
                                  coded.
                                  The character l in the name lseek means ``long integer.'' Before the introduction of the
                                  off_t data type, the offset argument and the return value were long integers. lseek was
                                  introduced with Version 7 when long integers were added to C. (Similar functionality was
                                  provided in Version 6 by the functions seek and tell.)

Example

          The program in Figure 3.1 tests its standard input to see whether it is capable of seeking.

            #include "apue.h"

            int
            main(void)
            {

                   if (lseek(STDIN_FILENO, 0, SEEK_CUR) == -1)
                          printf("cannot seek\n");

                   else
                          printf("seek OK\n");

                   exit(0);
            }

                                              Figure 3.1 Test whether standard input is capable of seeking
68 File I/O                                                        Chapter 3

If we invoke this program interactively, we get

      $ ./a.out < /etc/passwd
      seek OK
      $ cat < /etc/passwd | ./a.out
      cannot seek
      $ ./a.out < /var/spool/cron/FIFO
      cannot seek

     Normally, a file's current offset must be a non-negative integer. It is possible,
however, that certain devices could allow negative offsets. But for regular files, the
offset must be non-negative. Because negative offsets are possible, we should be careful
to compare the return value from lseek as being equal to or not equal to -1, rather
than testing whether it is less than 0.

                    The /dev/kmem device on FreeBSD for the Intel x86 processor supports negative offsets.

                    Because the offset (off_t) is a signed data type (Figure 2.21), we lose a factor of 2 in the
                    maximum file size. If off_t is a 32-bit integer, the maximum file size is 231-1 bytes.

     lseek only records the current file offset within the kernel--it does not cause any
I/O to take place. This offset is then used by the next read or write operation.

     The file's offset can be greater than the file's current size, in which case the next
write to the file will extend the file. This is referred to as creating a hole in a file and is
allowed. Any bytes in a file that have not been written are read back as 0.

     A hole in a file isn't required to have storage backing it on disk. Depending on the
file system implementation, when you write after seeking past the end of a file, new
disk blocks might be allocated to store the data, but there is no need to allocate disk
blocks for the data between the old end of file and the location where you start writing.

Example

The program shown in Figure 3.2 creates a file with a hole in it.

#include "apue.h"
#include <fcntl.h>

char          buf1[] = "abcdefghij";
char          buf2[] = "ABCDEFGHIJ";

int

main(void)

{

         int  fd;

         if ((fd = creat("file.hole", FILE_MODE)) < 0)
                err_sys("creat error");

         if (write(fd, buf1, 10) != 10)
                err_sys("buf1 write error");

         /* offset now = 10 */
Section 3.6                                                                 lseek Function 69

       if (lseek(fd, 16384, SEEK_SET) == -1)
              err_sys("lseek error");

       /* offset now = 16384 */

       if (write(fd, buf2, 10) != 10)
              err_sys("buf2 write error");

       /* offset now = 16394 */

       exit(0);
}

                                Figure 3.2 Create a file with a hole in it

Running this program gives us

             $ ./a.out

             $ ls -l file.hole      check its size

             -rw-r--r-- 1 sar       16394 Nov 25 01:01 file.hole

             $ od -c file.hole      let's look at the actual contents

             0000000 a b c d e f g h i j \0 \0 \0 \0 \0 \0

             0000020 \0 \0 \0 \0 \0 \0 \0 \0 \0 \0 \0 \0 \0 \0 \0 \0

             *

             0040000 A B C D E F G H I J

             0040012

We use the od(1) command to look at the contents of the file. The -c flag tells it to print
the contents as characters. We can see that the unwritten bytes in the middle are read
back as zero. The seven-digit number at the beginning of each line is the byte offset in
octal.

     To prove that there is really a hole in the file, let's compare the file we just created
with a file of the same size, but without holes:

             $ ls -ls file.hole file.nohole compare sizes

                8 -rw-r--r-- 1 sar  16394 Nov 25 01:01 file.hole

             20 -rw-r--r-- 1 sar    16394 Nov 25 01:03 file.nohole

Although both files are the same size, the file without holes consumes 20 disk blocks,
whereas the file with holes consumes only 8 blocks.

     In this example, we call the write function (Section 3.8). We'll have more to say
about files with holes in Section 4.12.

     Because the offset address that lseek uses is represented by an off_t,
implementations are allowed to support whatever size is appropriate on their particular
platform. Most platforms today provide two sets of interfaces to manipulate file offsets:
one set that uses 32-bit file offsets and another set that uses 64-bit file offsets.

     The Single UNIX Specification provides a way for applications to determine which
environments are supported through the sysconf function (Section 2.5.4). Figure 3.3
summarizes the sysconf constants that are defined.
70 File I/O                                                                                 Chapter 3

             Name of option                   Description                    name argument
                                                                      _SC_V7_ILP32_OFF32
_POSIX_V7_ILP32_OFF32        int, long, pointer, and off_t types      _SC_V7_ILP32_OFFBIG
_POSIX_V7_ILP32_OFFBIG             are 32 bits.
                                                                      _SC_V7_LP64_OFF64
_POSIX_V7_LP64_OFF64         int, long, and pointer types are         _SC_V7_LP64_OFFBIG
_POSIX_V7_LP64_OFFBIG              32 bits; off_t types are at least
                                   64 bits.

                             int types are 32 bits; long, pointer,
                                   and off_t types are 64 bits.

                             int types are at least 32 bits; long,
                                   pointer, and off_t types are at
                                   least 64 bits.

             Figure 3.3 Data size options and name arguments to sysconf

     The c99 compiler requires that we use the getconf(1) command to map the
desired data size model to the flags necessary to compile and link our programs.
Different flags and libraries might be needed, depending on the environments
supported by each platform.

                    Unfortunately, this is one area in which implementations haven't caught up to the standards.
                    If your system does not match the latest version of the standard, the system might support the
                    option names from the previous version of the Single UNIX Specification:
                    _POSIX_V6_ILP32_OFF32, _POSIX_V6_ILP32_OFFBIG, _POSIX_V6_LP64_OFF64, and
                    _POSIX_V6_LP64_OFFBIG.

                    To get around this, applications can set the _FILE_OFFSET_BITS constant to 64 to enable
                    64-bit offsets. Doing so changes the definition of off_t to be a 64-bit signed integer. Setting
                    _FILE_OFFSET_BITS to 32 enables 32-bit file offsets. Be aware, however, that although all
                    four platforms discussed in this text support both 32-bit and 64-bit file offsets, setting
                    _FILE_OFFSET_BITS is not guaranteed to be portable and might not have the desired effect.

                    Figure 3.4 summarizes the size in bytes of the off_t data type for the platforms covered in
                    this book when an application doesn't define _FILE_OFFSET_BITS, as well as the size when
                    an application defines _FILE_OFFSET_BITS to have a value of either 32 or 64.

                                Operating          CPU       _FILE_OFFSET_BITS value
                                   system
                                               architecture  Undefined  32              64
                             FreeBSD 8.0
                             Linux 3.2.0        x86 32-bit   8          8               8
                             Mac OS X 10.6.8    x86 64-bit
                             Solaris 10         x86 64-bit   8          8               8
                                              SPARC 64-bit
                                                             8          8               8

                                                             8          4               8

                             Figure 3.4 Size in bytes of off_t for different platforms

     Note that even though you might enable 64-bit file offsets, your ability to create a
file larger than 2 GB (231-1 bytes) depends on the underlying file system type.
Section 3.7  read Function 71

3.7 read Function
```
- `Bash` -- `sed -n '5111,5223p' /tmp/apue/full.txt`
```
3.9 I/O Efficiency

The program in Figure 3.5 copies a file, using only the read and write functions.

#include "apue.h"

#define BUFFSIZE 4096

int          n;
main(void)   buf[BUFFSIZE];
{

       int
       char

while ((n = read(STDIN_FILENO, buf, BUFFSIZE)) > 0)
       if (write(STDOUT_FILENO, buf, n) != n)
              err_sys("write error");

if (n < 0)
       err_sys("read error");

       exit(0);
}

                    Figure 3.5 Copy standard input to standard output

The following caveats apply to this program.

     � It reads from standard input and writes to standard output, assuming that these
         have been set up by the shell before this program is executed. Indeed, all
         normal UNIX system shells provide a way to open a file for reading on standard
         input and to create (or rewrite) a file on standard output. This prevents the
         program from having to open the input and output files, and allows the user to
         take advantage of the shell's I/O redirection facilities.
Section 3.9                                                   I/O Efficiency 73

     � The program doesn't close the input file or output file. Instead, the program
         uses the feature of the UNIX kernel that closes all open file descriptors in a
         process when that process terminates.

     � This example works for both text files and binary files, since there is no
         difference between the two to the UNIX kernel.

     One question we haven't answered, however, is how we chose the BUFFSIZE
value. Before answering that, let's run the program using different values for
BUFFSIZE. Figure 3.6 shows the results for reading a 516,581,760-byte file, using 20
different buffer sizes.

             BUFFSIZE     User CPU   System CPU   Clock time   Number
                          (seconds)    (seconds)  (seconds)     of loops
                       1
                       2     20.03       117.50      138.73   516,581,760
                       4      9.69        58.76       68.60   258,290,880
                       8      4.60        36.47       41.27   129,145,440
                      16      2.47        15.44       18.38    64,572,720
                      32      1.07          7.93        9.38   32,286,360
                      64      0.56          4.51        8.82   16,143,180
                    128       0.34          2.72        8.66
                    256       0.34          1.84        8.69     8,071,590
                    512       0.15          1.30        8.69     4,035,795
                  1,024       0.09          0.95        8.63     2,017,898
                  2,048       0.02          0.78        8.58     1,008,949
                  4,096       0.04          0.66        8.68
                  8,192       0.03          0.58        8.62       504,475
                16,384        0.00          0.54        8.52       252,238
                32,768        0.01          0.56        8.69       126,119
                65,536        0.00          0.56        8.51
               131,072        0.01          0.56        9.12        63,060
               262,144        0.00          0.58        9.08        31,530
               524,288        0.00          0.60        8.70        15,765
                              0.01          0.58        8.58
                                                                      7,883
                                                                      3,942
                                                                      1,971

                                                                        986

             Figure 3.6 Timing results for reading with different buffer sizes on Linux

     The file was read using the program shown in Figure 3.5, with standard output
redirected to /dev/null. The file system used for this test was the Linux ext4 file
system with 4,096-byte blocks. (The st_blksize value, which we describe in
Section 4.12, is 4,096.) This accounts for the minimum in the system time occurring at
the few timing measurements starting around a BUFFSIZE of 4,096. Increasing the
buffer size beyond this limit has little positive effect.

     Most file systems support some kind of read-ahead to improve performance. When
sequential reads are detected, the system tries to read in more data than an application
requests, assuming that the application will read it shortly. The effect of read-ahead can
be seen in Figure 3.6, where the elapsed time for buffer sizes as small as 32 bytes is as
good as the elapsed time for larger buffer sizes.
74 File I/O  Chapter 3

                We'll return to this timing example later in the text. In Section 3.14, we show the
          effect of synchronous writes; in Section 5.8, we compare these unbuffered I/O times
          with the standard I/O library.

                                  Beware when trying to measure the performance of programs that read and write files. The
                                  operating system will try to cache the file incore, so if you measure the performance of the
                                  program repeatedly, the successive timings will likely be better than the first. This
                                  improvement occurs because the first run causes the file to be entered into the system's cache,
                                  and successive runs access the file from the system's cache instead of from the disk. (The term
                                  incore means in main memory. Back in the day, a computer's main memory was built out of
                                  ferrite core. This is where the phrase ``core dump'' comes from: the main memory image of a
                                  program stored in a file on disk for diagnosis.)

                                  In the tests reported in Figure 3.6, each run with a different buffer size was made using a
                                  different copy of the file so that the current run didn't find the data in the cache from the
                                  previous run. The files are large enough that they all don't remain in the cache (the test system
                                  was configured with 6 GB of RAM).

3.10 File Sharing
```
- `Bash` -- `sed -n '5576,5925p' /tmp/apue/full.txt`
```
3.13  sync, fsync, and fdatasync Functions

      Traditional implementations of the UNIX System have a buffer cache or page cache in
      the kernel through which most disk I/O passes. When we write data to a file, the data
      is normally copied by the kernel into one of its buffers and queued for writing to disk at
      some later time. This is called delayed write. (Chapter 3 of Bach [1986] discusses this
      buffer cache in detail.)

           The kernel eventually writes all the delayed-write blocks to disk, normally when it
      needs to reuse the buffer for some other disk block. To ensure consistency of the file
      system on disk with the contents of the buffer cache, the sync, fsync, and fdatasync
      functions are provided.

              #include <unistd.h>     Returns: 0 if OK, -1 on error
              int fsync(int fd);
              int fdatasync(int fd);

              void sync(void);

      The sync function simply queues all the modified block buffers for writing and returns;
      it does not wait for the disk writes to take place.

           The function sync is normally called periodically (usually every 30 seconds) from a
      system daemon, often called update. This guarantees regular flushing of the kernel's
      block buffers. The command sync(1) also calls the sync function.

           The function fsync refers only to a single file, specified by the file descriptor fd,
      and waits for the disk writes to complete before returning. This function is used when
      an application, such as a database, needs to be sure that the modified blocks have been
      written to the disk.

           The fdatasync function is similar to fsync, but it affects only the data portions of
      a file. With fsync, the file's attributes are also updated synchronously.

                          All four of the platforms described in this book support sync and fsync. However, FreeBSD
                          8.0 does not support fdatasync.
82 File I/O                                                                   Chapter 3

3.14 fcntl Function

The fcntl function can change the properties of a file that is already open.

#include <fcntl.h>
int fcntl(int fd, int cmd, ... /* int arg */ );

                                        Returns: depends on cmd if OK (see following), -1 on error

In the examples in this section, the third argument is always an integer, corresponding
to the comment in the function prototype just shown. When we describe record locking
in Section 14.3, however, the third argument becomes a pointer to a structure.

     The fcntl function is used for five different purposes.

     1. Duplicate an existing descriptor (cmd = F_DUPFD or F_DUPFD_CLOEXEC)
     2. Get/set file descriptor flags (cmd = F_GETFD or F_SETFD)
     3. Get/set file status flags (cmd = F_GETFL or F_SETFL)
     4. Get/set asynchronous I/O ownership (cmd = F_GETOWN or F_SETOWN)
     5. Get/set record locks (cmd = F_GETLK, F_SETLK, or F_SETLKW)

We'll now describe the first 8 of these 11 cmd values. (We'll wait until Section 14.3 to
describe the last 3, which deal with record locking.) Refer to Figure 3.7, as we'll discuss
both the file descriptor flags associated with each file descriptor in the process table
entry and the file status flags associated with each file table entry.

F_DUPFD              Duplicate the file descriptor fd. The new file descriptor is
                     returned as the value of the function. It is the lowest-numbered
F_DUPFD_CLOEXEC      descriptor that is not already open, and that is greater than or
F_GETFD              equal to the third argument (taken as an integer). The new
F_SETFD              descriptor shares the same file table entry as fd. (Refer to
                     Figure 3.9.) But the new descriptor has its own set of file
                     descriptor flags, and its FD_CLOEXEC file descriptor flag is
                     cleared. (This means that the descriptor is left open across an
                     exec, which we discuss in Chapter 8.)

                     Duplicate the file descriptor and set the FD_CLOEXEC file
                     descriptor flag associated with the new descriptor. Returns the
                     new file descriptor.

                     Return the file descriptor flags for fd as the value of the function.
                     Currently, only one file descriptor flag is defined: the
                     FD_CLOEXEC flag.

                     Set the file descriptor flags for fd. The new flag value is set from
                     the third argument (taken as an integer).
Section 3.14                                                             fcntl Function 83

              Be aware that some existing programs that deal with the file descriptor flags don't
              use the constant FD_CLOEXEC. Instead, these programs set the flag to either 0 (don't
              close-on-exec, the default) or 1 (do close-on-exec).

F_GETFL       Return the file status flags for fd as the value of the function. We described
              the file status flags when we described the open function. They are listed
              in Figure 3.10.

              File status flag                                Description

              O_RDONLY          open for reading only
              O_WRONLY          open for writing only
              O_RDWR            open for reading and writing
              O_EXEC            open for execute only
              O_SEARCH          open directory for searching only

              O_APPEND          append on each write
              O_NONBLOCK        nonblocking mode
              O_SYNC            wait for writes to complete (data and attributes)
              O_DSYNC           wait for writes to complete (data only)
              O_RSYNC           synchronize reads and writes
              O_FSYNC           wait for writes to complete (FreeBSD and Mac OS X only)
              O_ASYNC           asynchronous I/O (FreeBSD and Mac OS X only)

                                Figure 3.10 File status flags for fcntl

F_SETFL       Unfortunately, the five access-mode flags--O_RDONLY, O_WRONLY,
F_GETOWN      O_RDWR, O_EXEC, and O_SEARCH--are not separate bits that can be
F_SETOWN      tested. (As we mentioned earlier, the first three often have the values 0, 1,
              and 2, respectively, for historical reasons. Also, these five values are
              mutually exclusive; a file can have only one of them enabled.) Therefore,
              we must first use the O_ACCMODE mask to obtain the access-mode bits and
              then compare the result against any of the five values.

              Set the file status flags to the value of the third argument (taken as an
              integer). The only flags that can be changed are O_APPEND, O_NONBLOCK,
              O_SYNC, O_DSYNC, O_RSYNC, O_FSYNC, and O_ASYNC.

              Get the process ID or process group ID currently receiving the SIGIO and
              SIGURG signals. We describe these asynchronous I/O signals in
              Section 14.5.2.

              Set the process ID or process group ID to receive the SIGIO and SIGURG
              signals. A positive arg specifies a process ID. A negative arg implies a
              process group ID equal to the absolute value of arg.

     The return value from fcntl depends on the command. All commands return -1
on an error or some other value if OK. The following four commands have special
return values: F_DUPFD, F_GETFD, F_GETFL, and F_GETOWN. The first command
returns the new file descriptor, the next two return the corresponding flags, and the
final command returns a positive process ID or a negative process group ID.
84 File I/O                                                                   Chapter 3

Example

The program in Figure 3.11 takes a single command-line argument that specifies a file
descriptor and prints a description of selected file flags for that descriptor.

#include "apue.h"
#include <fcntl.h>

int

main(int argc, char *argv[])

{

         int  val;

         if (argc != 2)
                err_quit("usage: a.out <descriptor#>");

         if ((val = fcntl(atoi(argv[1]), F_GETFL, 0)) < 0)
                err_sys("fcntl error for fd %d", atoi(argv[1]));

         switch (val & O_ACCMODE) {
         case O_RDONLY:

                printf("read only");
                break;

         case O_WRONLY:
                printf("write only");
                break;

         case O_RDWR:
                printf("read write");
                break;

         default:
                err_dump("unknown access mode");

         }

         if (val & O_APPEND)
                printf(", append");

         if (val & O_NONBLOCK)
                printf(", nonblocking");

         if (val & O_SYNC)
                printf(", synchronous writes");

#if !defined(_POSIX_C_SOURCE) && defined(O_FSYNC) && (O_FSYNC != O_SYNC)
       if (val & O_FSYNC)
              printf(", synchronous writes");

#endif

       putchar('\n');
       exit(0);
}

                       Figure 3.11 Print file flags for specified descriptor

Note that we use the feature test macro _POSIX_C_SOURCE and conditionally compile
the file access flags that are not part of POSIX.1. The following script shows the
Section 3.14                                          fcntl Function 85

operation of the program, when invoked from bash (the Bourne-again shell). Results
will vary, depending on which shell you use.

      $ ./a.out 0 < /dev/tty
      read only
      $ ./a.out 1 > temp.foo
      $ cat temp.foo
      write only
      $ ./a.out 2 2>>temp.foo
      write only, append
      $ ./a.out 5 5<>temp.foo
      read write

The clause 5<>temp.foo opens the file temp.foo for reading and writing on file
descriptor 5.

Example

When we modify either the file descriptor flags or the file status flags, we must be
careful to fetch the existing flag value, modify it as desired, and then set the new flag
value. We can't simply issue an F_SETFD or an F_SETFL command, as this could turn
off flag bits that were previously set.

     Figure 3.12 shows a function that sets one or more of the file status flags for a
descriptor.

#include "apue.h"
#include <fcntl.h>

void

set_fl(int fd, int flags) /* flags are file status flags to turn on */

{

              int  val;

              if ((val = fcntl(fd, F_GETFL, 0)) < 0)
                     err_sys("fcntl F_GETFL error");

              val |= flags;   /* turn on flags */

       if (fcntl(fd, F_SETFL, val) < 0)
              err_sys("fcntl F_SETFL error");

}

                   Figure 3.12 Turn on one or more of the file status flags for a descriptor

If we change the middle statement to

              val &= ~flags;  /* turn flags off */

we have a function named clr_fl, which we'll use in some later examples. This
statement logically ANDs the one's complement of flags with the current val.
86 File I/O                                                                                  Chapter 3

     If we add the line

      set_fl(STDOUT_FILENO, O_SYNC);

to the beginning of the program shown in Figure 3.5, we'll turn on the synchronous-
write flag. This causes each write to wait for the data to be written to disk before
returning. Normally in the UNIX System, a write only queues the data for writing; the
actual disk write operation can take place sometime later. A database system is a likely
candidate for using O_SYNC, so that it knows on return from a write that the data is
actually on the disk, in case of an abnormal system failure.

     We expect the O_SYNC flag to increase the system and clock times when the
program runs. To test this, we can run the program in Figure 3.5, copying 492.6 MB of
data from one file on disk to another and compare this with a version that does the
same thing with the O_SYNC flag set. The results from a Linux system using the ext4
file system are shown in Figure 3.13.

                                        Operation             User CPU   System CPU   Clock time
                                                              (seconds)    (seconds)  (seconds)
             read time from Figure 3.6 for BUFFSIZE = 4,096
             normal write to disk file                            0.03        0.58         8.62
             write to disk file with O_SYNC set                   0.00        1.05         9.70
             write to disk followed by fdatasync                  0.02        1.09       10.28
             write to disk followed by fsync                      0.02        1.14       17.93
             write to disk with O_SYNC set followed by fsync      0.00        1.19       18.17
                                                                  0.02        1.15       17.88

             Figure 3.13 Linux ext4 timing results using various synchronization mechanisms

     The six rows in Figure 3.13 were all measured with a BUFFSIZE of 4,096 bytes. The
results in Figure 3.6 were measured while reading a disk file and writing to
/dev/null, so there was no disk output. The second row in Figure 3.13 corresponds to
reading a disk file and writing to another disk file. This is why the first and second
rows in Figure 3.13 are different. The system time increases when we write to a disk
file, because the kernel now copies the data from our process and queues the data for
writing by the disk driver. We expect the clock time to increase as well when we write
to a disk file.

     When we enable synchronous writes, the system and clock times should increase
significantly. As the third row shows, the system time for writing synchronously is not
much more expensive than when we used delayed writes. This implies that the Linux
operating system is doing the same amount of work for delayed and synchronous
writes (which is unlikely), or else the O_SYNC flag isn't having the desired effect. In this
case, the Linux operating system isn't allowing us to set the O_SYNC flag using fcntl,
instead failing without returning an error (but it would have honored the flag if we
were able to specify it when the file was opened).

     The clock time in the last three rows reflects the extra time needed to wait for all of
the writes to be committed to disk. After writing a file synchronously, we expect that a
call to fsync will have no effect. This case is supposed to be represented by the last
Section 3.15                                                              ioctl Function 87

      row in Figure 3.13, but since the O_SYNC flag isn't having the intended effect, the last
      row behaves the same way as the fifth row.

           Figure 3.14 shows timing results for the same tests run on Mac OS X 10.6.8, which
      uses the HFS file system. Note that the times match our expectations: synchronous
      writes are far more expensive than delayed writes, and using fsync with synchronous
      writes makes very little difference. Note also that adding a call to fsync at the end of
      the delayed writes makes little measurable difference. It is likely that the operating
      system flushed previously written data to disk as we were writing new data to the file,
      so by the time that we called fsync, very little work was left to be done.

                                         Operation             User CPU   System CPU   Clock time
                                                               (seconds)    (seconds)  (seconds)
              write to /dev/null
              normal write to disk file                            0.14         1.02        5.28
              write to disk file with O_SYNC set                   0.14         3.21      17.04
              write to disk followed by fsync                      0.39       16.89       60.82
              write to disk with O_SYNC set followed by fsync      0.13         3.07      17.10
                                                                   0.39       18.18       62.39

              Figure 3.14 Mac OS X HFS timing results using various synchronization mechanisms

           Compare fsync and fdatasync, both of which update a file's contents when we
      say so, with the O_SYNC flag, which updates a file's contents every time we write to the
      file. The performance of each alternative will depend on many factors, including the
      underlying operating system implementation, the speed of the disk drive, and the type
      of the file system.

           With this example, we see the need for fcntl. Our program operates on a
      descriptor (standard output), never knowing the name of the file that was opened on
      that descriptor. We can't set the O_SYNC flag when the file is opened, since the shell
      opened the file. With fcntl, we can modify the properties of a descriptor, knowing
      only the descriptor for the open file. We'll see another need for fcntl when we
      describe nonblocking pipes (Section 15.2), since all we have with a pipe is a descriptor.

3.15  ioctl Function
```
- `Bash` -- `sed -n '5925,6049p' /tmp/apue/full.txt`
```
3.15  ioctl Function

      The ioctl function has always been the catchall for I/O operations. Anything that
      couldn't be expressed using one of the other functions in this chapter usually ended up
      being specified with an ioctl. Terminal I/O was the biggest user of this function.
      (When we get to Chapter 18, we'll see that POSIX.1 has replaced the terminal I/O
      operations with separate functions.)

              #include <unistd.h>  /* System V */

              #include <sys/ioctl.h> /* BSD and Linux */

              int ioctl(int fd, int request, ...);

                                                    Returns: -1 on error, something else if OK
88 File I/O                                                        Chapter 3

                          The ioctl function was included in the Single UNIX Specification only as an extension for
                          dealing with STREAMS devices [Rago 1993], but it was moved to obsolescent status in SUSv4.
                          UNIX System implementations use ioctl for many miscellaneous device operations. Some
                          implementations have even extended it for use with regular files.

           The prototype that we show corresponds to POSIX.1. FreeBSD 8.0 and Mac OS X
      10.6.8 declare the second argument as an unsigned long. This detail doesn't matter,
      since the second argument is always a #defined name from a header.

           For the ISO C prototype, an ellipsis is used for the remaining arguments. Normally,
      however, there is only one more argument, and it's usually a pointer to a variable or a
      structure.

           In this prototype, we show only the headers required for the function itself.
      Normally, additional device-specific headers are required. For example, the ioctl
      commands for terminal I/O, beyond the basic operations specified by POSIX.1, all
      require the <termios.h> header.

           Each device driver can define its own set of ioctl commands. The system,
      however, provides generic ioctl commands for different classes of devices. Examples
      of some of the categories for these generic ioctl commands supported in FreeBSD are
      summarized in Figure 3.15.

                Category   Constant            Header   Number of
                             names                        ioctls
             disk labels             <sys/disklabel.h>
             file I/O      DIOxxx    <sys/filio.h>             4
             mag tape I/O  FIOxxx    <sys/mtio.h>            14
             socket I/O    MTIOxxx   <sys/sockio.h>           11
             terminal I/O  SIOxxx    <sys/ttycom.h>          73
                           TIOxxx                            43

             Figure 3.15 Common FreeBSD ioctl operations

           The mag tape operations allow us to write end-of-file marks on a tape, rewind a
      tape, space forward over a specified number of files or records, and the like. None of
      these operations is easily expressed in terms of the other functions in the chapter (read,
      write, lseek, and so on), so the easiest way to handle these devices has always been
      to access their operations using ioctl.

           We use the ioctl function in Section 18.12 to fetch and set the size of a terminal's
      window, and in Section 19.7 when we access the advanced features of pseudo terminals.

3.16  /dev/fd

      Newer systems provide a directory named /dev/fd whose entries are files named 0, 1,
      2, and so on. Opening the file /dev/fd/n is equivalent to duplicating descriptor n,
      assuming that descriptor n is open.

                          The /dev/fd feature was developed by Tom Duff and appeared in the 8th Edition of the
                          Research UNIX System. It is supported by all of the systems described in this book: FreeBSD
                          8.0, Linux 3.2.0, Mac OS X 10.6.8, and Solaris 10. It is not part of POSIX.1.
Section 3.16  /dev/fd 89

     In the function call

      fd = open("/dev/fd/0", mode);

most systems ignore the specified mode, whereas others require that it be a subset of the
mode used when the referenced file (standard input, in this case) was originally opened.
Because the previous open is equivalent to

      fd = dup(0);

the descriptors 0 and fd share the same file table entry (Figure 3.9). For example, if
descriptor 0 was opened read-only, we can only read on fd. Even if the system ignores
the open mode and the call

      fd = open("/dev/fd/0", O_RDWR);

succeeds, we still can't write to fd.

                    The Linux implementation of /dev/fd is an exception. It maps file descriptors into symbolic
                    links pointing to the underlying physical files. When you open /dev/fd/0, for example, you
                    are really opening the file associated with your standard input. Thus the mode of the new file
                    descriptor returned is unrelated to the mode of the /dev/fd file descriptor.

     We can also call creat with a /dev/fd pathname argument as well as specify
O_CREAT in a call to open. This allows a program that calls creat to still work if the
pathname argument is /dev/fd/1, for example.

                    Beware of doing this on Linux. Because the Linux implementation uses symbolic links to the
                    real files, using creat on a /dev/fd file will result in the underlying file being truncated.

     Some systems provide the pathnames /dev/stdin, /dev/stdout, and
/dev/stderr. These pathnames are equivalent to /dev/fd/0, /dev/fd/1, and
/dev/fd/2, respectively.

     The main use of the /dev/fd files is from the shell. It allows programs that use
pathname arguments to handle standard input and standard output in the same
manner as other pathnames. For example, the cat(1) program specifically looks for an
input filename of - and uses it to mean standard input. The command

      filter file2 | cat file1 - file3 | lpr

is an example. First, cat reads file1, then its standard input (the output of the
filter program on file2), and then file3. If /dev/fd is supported, the special
handling of - can be removed from cat, and we can enter

      filter file2 | cat file1 /dev/fd/0 file3 | lpr

     The special meaning of - as a command-line argument to refer to the standard
input or the standard output is a kludge that has crept into many programs. There are
also problems if we specify - as the first file, as it looks like the start of another
command-line option. Using /dev/fd is a step toward uniformity and cleanliness.
90 File I/O  Chapter 3

3.17  Summary
```
- `Bash` -- `sed -n '6396,6847p' /tmp/apue/full.txt`
```
4.4 Set-User-ID and Set-Group-ID

          Every process has six or more IDs associated with it. These are shown in Figure 4.5.

real user ID                                 who we really are
real group ID                                used for file access permission checks
                                             saved by exec functions
effective user ID
effective group ID
supplementary group IDs

saved set-user-ID
saved set-group-ID

                          Figure 4.5 User IDs and group IDs associated with each process

     � The real user ID and real group ID identify who we really are. These two fields
         are taken from our entry in the password file when we log in. Normally, these
         values don't change during a login session, although there are ways for a
         superuser process to change them, which we describe in Section 8.11.

     � The effective user ID, effective group ID, and supplementary group IDs
         determine our file access permissions, as we describe in the next section. (We
         defined supplementary group IDs in Section 1.8.)

     � The saved set-user-ID and saved set-group-ID contain copies of the effective
         user ID and the effective group ID, respectively, when a program is executed.
         We describe the function of these two saved values when we describe the
         setuid function in Section 8.11.

                           The saved IDs are required as of the 2001 version of POSIX.1. They were optional in older
                           versions of POSIX. An application can test for the constant _POSIX_SAVED_IDS at
                           compile time or can call sysconf with the _SC_SAVED_IDS argument at runtime, to see
                           whether the implementation supports this feature.

Normally, the effective user ID equals the real user ID, and the effective group ID equals
the real group ID.

     Every file has an owner and a group owner. The owner is specified by the st_uid
member of the stat structure; the group owner, by the st_gid member.
Section 4.5                               File Access Permissions 99

     When we execute a program file, the effective user ID of the process is usually the
real user ID, and the effective group ID is usually the real group ID. However, we can
also set a special flag in the file's mode word (st_mode) that says, ``When this file is
executed, set the effective user ID of the process to be the owner of the file (st_uid).''
Similarly, we can set another bit in the file's mode word that causes the effective group
ID to be the group owner of the file (st_gid). These two bits in the file's mode word
are called the set-user-ID bit and the set-group-ID bit.

     For example, if the owner of the file is the superuser and if the file's set-user-ID bit
is set, then while that program file is running as a process, it has superuser privileges.
This happens regardless of the real user ID of the process that executes the file. As an
example, the UNIX System program that allows anyone to change his or her password,
passwd(1), is a set-user-ID program. This is required so that the program can write the
new password to the password file, typically either /etc/passwd or /etc/shadow,
files that should be writable only by the superuser. Because a process that is running
set-user-ID to some other user usually assumes extra permissions, it must be written
carefully. We'll discuss these types of programs in more detail in Chapter 8.

     Returning to the stat function, the set-user-ID bit and the set-group-ID bit are
contained in the file's st_mode value. These two bits can be tested against the
constants S_ISUID and S_ISGID, respectively.

4.5 File Access Permissions

          The st_mode value also encodes the access permission bits for the file. When we say
          file, we mean any of the file types that we described earlier. All the file
          types--directories, character special files, and so on--have permissions. Many people
          think of only regular files as having access permissions.

                There are nine permission bits for each file, divided into three categories. They are
          shown in Figure 4.6.

             st_mode mask     Meaning

                S_IRUSR    user-read
                S_IWUSR    user-write
                S_IXUSR    user-execute

                S_IRGRP    group-read
                S_IWGRP    group-write
                S_IXGRP    group-execute

                S_IROTH    other-read
                S_IWOTH    other-write
                S_IXOTH    other-execute

             Figure 4.6 The nine file access permission bits, from <sys/stat.h>

The term user in the first three rows in Figure 4.6 refers to the owner of the file. The
chmod(1) command, which is typically used to modify these nine permission bits,
allows us to specify u for user (owner), g for group, and o for other. Some books refer
to these three as owner, group, and world; this is confusing, as the chmod command
100 Files and Directories  Chapter 4

uses o to mean other, not owner. We'll use the terms user, group, and other, to be
consistent with the chmod command.

     The three categories in Figure 4.6--read, write, and execute--are used in various
ways by different functions. We'll summarize them here, and return to them when we
describe the actual functions.

� The first rule is that whenever we want to open any type of file by name, we must
    have execute permission in each directory mentioned in the name, including the
    current directory, if it is implied. This is why the execute permission bit for a
    directory is often called the search bit.

    For example, to open the file /usr/include/stdio.h, we need execute
    permission in the directory /, execute permission in the directory /usr, and execute
    permission in the directory /usr/include. We then need appropriate permission
    for the file itself, depending on how we're trying to open it: read-only, read-write,
    and so on.

    If the current directory is /usr/include, then we need execute permission in the
    current directory to open the file stdio.h. This is an example of the current
    directory being implied, not specifically mentioned. It is identical to our opening the
    file ./stdio.h.

    Note that read permission for a directory and execute permission for a directory
    mean different things. Read permission lets us read the directory, obtaining a list of
    all the filenames in the directory. Execute permission lets us pass through the
    directory when it is a component of a pathname that we are trying to access. (We
    need to search the directory to look for a specific filename.)

    Another example of an implicit directory reference is if the PATH environment
    variable, described in Section 8.10, specifies a directory that does not have execute
    permission enabled. In this case, the shell will never find executable files in that
    directory.

� The read permission for a file determines whether we can open an existing file for
    reading: the O_RDONLY and O_RDWR flags for the open function.

� The write permission for a file determines whether we can open an existing file for
    writing: the O_WRONLY and O_RDWR flags for the open function.

� We must have write permission for a file to specify the O_TRUNC flag in the open
    function.

� We cannot create a new file in a directory unless we have write permission and
    execute permission in the directory.

� To delete an existing file, we need write permission and execute permission in the
    directory containing the file. We do not need read permission or write permission
    for the file itself.

� Execute permission for a file must be on if we want to execute the file using any of
    the seven exec functions (Section 8.10). The file also has to be a regular file.
Section 4.6  Ownership of New Files and Directories 101

                The file access tests that the kernel performs each time a process opens, creates, or
          deletes a file depend on the owners of the file (st_uid and st_gid), the effective IDs
          of the process (effective user ID and effective group ID), and the supplementary group
          IDs of the process, if supported. The two owner IDs are properties of the file, whereas
          the two effective IDs and the supplementary group IDs are properties of the process.
          The tests performed by the kernel are as follows:

                1. If the effective user ID of the process is 0 (the superuser), access is allowed. This
                     gives the superuser free rein throughout the entire file system.

                2. If the effective user ID of the process equals the owner ID of the file (i.e., the
                     process owns the file), access is allowed if the appropriate user access
                     permission bit is set. Otherwise, permission is denied. By appropriate access
                     permission bit, we mean that if the process is opening the file for reading, the
                     user-read bit must be on. If the process is opening the file for writing, the
                     user-write bit must be on. If the process is executing the file, the user-execute bit
                     must be on.

                3. If the effective group ID of the process or one of the supplementary group IDs of
                     the process equals the group ID of the file, access is allowed if the appropriate
                     group access permission bit is set. Otherwise, permission is denied.

                4. If the appropriate other access permission bit is set, access is allowed.
                     Otherwise, permission is denied.

                These four steps are tried in sequence. Note that if the process owns the file
          (step 2), access is granted or denied based only on the user access permissions; the
          group permissions are never looked at. Similarly, if the process does not own the file
          but belongs to an appropriate group, access is granted or denied based only on the
          group access permissions; the other permissions are not looked at.

4.6 Ownership of New Files and Directories

          When we described the creation of a new file in Chapter 3 using either open or creat,
          we never said which values were assigned to the user ID and group ID of the new file.
          We'll see how to create a new directory in Section 4.21 when we describe the mkdir
          function. The rules for the ownership of a new directory are identical to the rules in this
          section for the ownership of a new file.

                The user ID of a new file is set to the effective user ID of the process. POSIX.1
          allows an implementation to choose one of the following options to determine the
          group ID of a new file:

                1. The group ID of a new file can be the effective group ID of the process.

                2. The group ID of a new file can be the group ID of the directory in which the file
                     is being created.
102 Files and Directories                                       Chapter 4

                    FreeBSD 8.0 and Mac OS X 10.6.8 always copy the new file's group ID from the directory.
                    Several Linux file systems allow the choice between the two options to be selected using a
                    mount(1) command option. The default behavior for Linux 3.2.0 and Solaris 10 is to determine
                    the group ID of a new file depending on whether the set-group-ID bit is set for the directory in
                    which the file is created. If this bit is set, the new file's group ID is copied from the directory;
                    otherwise, the new file's group ID is set to the effective group ID of the process.

     Using the second option--inheriting the directory's group ID--assures us that all
files and directories created in that directory will have the same group ID as the
directory. This group ownership of files and directories will then propagate down the
hierarchy from that point. This is used in the Linux directory /var/mail, for example.

                    As we mentioned earlier, this option for group ownership is the default for FreeBSD 8.0 and
                    Mac OS X 10.6.8, but an option for Linux and Solaris. Under Solaris 10, and by default under
                    Linux 3.2.0, we have to enable the set-group-ID bit, and the mkdir function has to propagate a
                    directory's set-group-ID bit automatically for this to work. (This is described in Section 4.21.)

4.7 access and faccessat Functions

As we described earlier, when we open a file, the kernel performs its access tests based
on the effective user and group IDs. Sometimes, however, a process wants to test
accessibility based on the real user and group IDs. This is useful when a process is
running as someone else, using either the set-user-ID or the set-group-ID feature. Even
though a process might be set-user-ID to root, it might still want to verify that the real
user can access a given file. The access and faccessat functions base their tests on
the real user and group IDs. (Replace effective with real in the four steps at the end of
Section 4.5.)

#include <unistd.h>
int access(const char *pathname, int mode);
int faccessat(int fd, const char *pathname, int mode, int flag);

                                                                            Both return: 0 if OK, -1 on error

The mode is either the value F_OK to test if a file exists, or the bitwise OR of any of the
flags shown in Figure 4.7.

                           mode            Description

                           R_OK  test for read permission
                           W_OK  test for write permission
                           X_OK  test for execute permission

Figure 4.7 The mode flags for access function, from <unistd.h>

     The faccessat function behaves like access when the pathname argument is
absolute or when the fd argument has the value AT_FDCWD and the pathname argument
is relative. Otherwise, faccessat evaluates the pathname relative to the open directory
referenced by the fd argument.
Section 4.7                                  access and faccessat Functions 103

     The flag argument can be used to change the behavior of faccessat. If the
AT_EACCESS flag is set, the access checks are made using the effective user and group
IDs of the calling process instead of the real user and group IDs.

Example

Figure 4.8 shows the use of the access function.

#include "apue.h"
#include <fcntl.h>

int
main(int argc, char *argv[])
{

       if (argc != 2)
              err_quit("usage: a.out <pathname>");

       if (access(argv[1], R_OK) < 0)
              err_ret("access error for %s", argv[1]);

       else
              printf("read access OK\n");

       if (open(argv[1], O_RDONLY) < 0)
              err_ret("open error for %s", argv[1]);

       else
              printf("open for reading OK\n");

       exit(0);
}

                              Figure 4.8 Example of access function

Here is a sample session with this program:

             $ ls -l a.out

             -rwxrwxr-x 1 sar       15945 Nov 30 12:10 a.out

             $ ./a.out a.out

             read access OK

             open for reading OK

             $ ls -l /etc/shadow

             -r-------- 1 root      1315 Jul 17 2002 /etc/shadow

             $ ./a.out /etc/shadow

             access error for /etc/shadow: Permission denied

             open error for /etc/shadow: Permission denied

             $ su                            become superuser

             Password:                       enter superuser password

             # chown root a.out              change file's user ID to root

             # chmod u+s a.out               and turn on set-user-ID bit

             # ls -l a.out                   check owner and SUID bit

             -rwsrwxr-x 1 root      15945 Nov 30 12:10 a.out

             # exit                          go back to normal user

             $ ./a.out /etc/shadow

             access error for /etc/shadow: Permission denied

             open for reading OK
104 Files and Directories                                         Chapter 4

In this example, the set-user-ID program can determine that the real user cannot
normally read the file, even though the open function will succeed.

                    In the preceding example and in Chapter 8, we'll sometimes switch to become the superuser to
                    demonstrate how something works. If you're on a multiuser system and do not have
                    superuser permission, you won't be able to duplicate these examples completely.

4.8 umask Function

Now that we've described the nine permission bits associated with every file, we can
describe the file mode creation mask that is associated with every process.

     The umask function sets the file mode creation mask for the process and returns the
previous value. (This is one of the few functions that doesn't have an error return.)

         #include <sys/stat.h>
         mode_t umask(mode_t cmask);

                                      Returns: previous file mode creation mask

The cmask argument is formed as the bitwise OR of any of the nine constants from
Figure 4.6: S_IRUSR, S_IWUSR, and so on.

     The file mode creation mask is used whenever the process creates a new file or a
new directory. (Recall from Sections 3.3 and 3.4 our description of the open and creat
functions. Both accept a mode argument that specifies the new file's access permission
bits.) We describe how to create a new directory in Section 4.21. Any bits that are on in
the file mode creation mask are turned off in the file's mode.

Example

The program in Figure 4.9 creates two files: one with a umask of 0 and one with a
umask that disables all the group and other permission bits.

#include "apue.h"
#include <fcntl.h>

#define RWRWRW (S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH)

int                                            S_IWOTH);
main(void)
{

       umask(0);
       if (creat("foo", RWRWRW) < 0)

              err_sys("creat error for foo");
       umask(S_IRGRP | S_IWGRP | S_IROTH |
       if (creat("bar", RWRWRW) < 0)

              err_sys("creat error for bar");
       exit(0);
}

                           Figure 4.9 Example of umask function
Section 4.8                                                  umask Function 105

If we run this program, we can see how the permission bits have been set.

             $ umask            first print the current file mode creation mask
             002

             $ ./a.out

             $ ls -l foo bar

             -rw------- 1 sar             0 Dec 7 21:20 bar

             -rw-rw-rw-  1 sar   0 Dec 7 21:20 foo
             $ umask            see if the file mode creation mask changed
             002

     Most users of UNIX systems never deal with their umask value. It is usually set
once, on login, by the shell's start-up file, and never changed. Nevertheless, when
writing programs that create new files, if we want to ensure that specific access
permission bits are enabled, we must modify the umask value while the process is
running. For example, if we want to ensure that anyone can read a file, we should set
the umask to 0. Otherwise, the umask value that is in effect when our process is
running can cause permission bits to be turned off.

     In the preceding example, we use the shell's umask command to print the file mode
creation mask both before we run the program and after it completes. This shows us
that changing the file mode creation mask of a process doesn't affect the mask of its
parent (often a shell). All of the shells have a built-in umask command that we can use
to set or print the current file mode creation mask.

     Users can set the umask value to control the default permissions on the files they
create. This value is expressed in octal, with one bit representing one permission to be
masked off, as shown in Figure 4.10. Permissions can be denied by setting the
corresponding bits. Some common umask values are 002 to prevent others from
writing your files, 022 to prevent group members and others from writing your files,
and 027 to prevent group members from writing your files and others from reading,
writing, or executing your files.

                                Mask bit     Meaning

                                  0400    user-read
                                  0200    user-write
                                  0100    user-execute
                                  0040    group-read
                                  0020    group-write
                                  0010    group-execute
                                  0004    other-read
                                  0002    other-write
                                  0001    other-execute

                                        Figure 4.10 The umask file access permission bits

     The Single UNIX Specification requires that the umask command support a
symbolic mode of operation. Unlike the octal format, the symbolic format specifies
which permissions are to be allowed (i.e., clear in the file creation mask) instead of
which ones are to be denied (i.e., set in the file creation mask). Compare both forms of
the command, shown below.
106 Files and Directories                                                                 Chapter 4

$ umask                                  first print the current file mode creation mask
002
$ umask -S                               print the symbolic form
u=rwx,g=rwx,o=rx
$ umask 027                              change the file mode creation mask
$ umask -S                               print the symbolic form
u=rwx,g=rx,o=

4.9 chmod, fchmod, and fchmodat Functions
```
- `Bash` -- `sed -n '6847,7231p' /tmp/apue/full.txt`
```
4.9 chmod, fchmod, and fchmodat Functions

          The chmod, fchmod, and fchmodat functions allow us to change the file access
          permissions for an existing file.

                  #include <sys/stat.h>

                  int chmod(const char *pathname, mode_t mode);

                  int fchmod(int fd, mode_t mode);

                  int fchmodat(int fd, const char *pathname, mode_t mode, int flag);

                                                                                         All three return: 0 if OK, -1 on error

          The chmod function operates on the specified file, whereas the fchmod function
          operates on a file that has already been opened. The fchmodat function behaves like
          chmod when the pathname argument is absolute or when the fd argument has the value
          AT_FDCWD and the pathname argument is relative. Otherwise, fchmodat evaluates the
          pathname relative to the open directory referenced by the fd argument. The flag
          argument can be used to change the behavior of fchmodat--when the
          AT_SYMLINK_NOFOLLOW flag is set, fchmodat doesn't follow symbolic links.

                To change the permission bits of a file, the effective user ID of the process must be
          equal to the owner ID of the file, or the process must have superuser permissions.

                The mode is specified as the bitwise OR of the constants shown in Figure 4.11.

                                mode                        Description

                           S_ISUID       set-user-ID on execution
                           S_ISGID       set-group-ID on execution
                           S_ISVTX       saved-text (sticky bit)

                           S_IRWXU       read, write, and execute by user (owner)
                                S_IRUSR  read by user (owner)
                                S_IWUSR  write by user (owner)
                                S_IXUSR  execute by user (owner)

                           S_IRWXG       read, write, and execute by group
                                S_IRGRP  read by group
                                S_IWGRP  write by group
                                S_IXGRP  execute by group

                           S_IRWXO       read, write, and execute by other (world)
                                S_IROTH  read by other (world)
                                S_IWOTH  write by other (world)
                                S_IXOTH  execute by other (world)

Figure 4.11 The mode constants for chmod functions, from <sys/stat.h>
Section 4.9                    chmod, fchmod, and fchmodat Functions 107

          Note that nine of the entries in Figure 4.11 are the nine file access permission bits from
          Figure 4.6. We've added the two set-ID constants (S_ISUID and S_ISGID), the
          saved-text constant (S_ISVTX), and the three combined constants (S_IRWXU, S_IRWXG,
          and S_IRWXO).

                                  The saved-text bit (S_ISVTX) is not part of POSIX.1. It is defined in the XSI option in the
                                  Single UNIX Specification. We describe its purpose in the next section.

Example

Recall the final state of the files foo and bar when we ran the program in Figure 4.9 to
demonstrate the umask function:

             $ ls -l foo bar   0 Dec 7 21:20 bar
             -rw------- 1 sar  0 Dec 7 21:20 foo
             -rw-rw-rw- 1 sar

The program shown in Figure 4.12 modifies the mode of these two files.

#include "apue.h"

int                 statbuf;
main(void)
{

       struct stat

             /* turn on set-group-ID and turn off group-execute */

             if (stat("foo", &statbuf) < 0)
                    err_sys("stat error for foo");

             if (chmod("foo", (statbuf.st_mode & ~S_IXGRP) | S_ISGID) < 0)
                    err_sys("chmod error for foo");

             /* set absolute mode to "rw-r--r--" */

             if (chmod("bar", S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH) < 0)
                    err_sys("chmod error for bar");

       exit(0);
}

                               Figure 4.12 Example of chmod function

After running the program in Figure 4.12, we see that the final state of the two files is

             $ ls -l foo bar   0 Dec 7 21:20 bar
             -rw-r--r-- 1 sar  0 Dec 7 21:20 foo
             -rw-rwSrw- 1 sar

In this example, we have set the permissions of the file bar to an absolute value,
regardless of the current permission bits. For the file foo, we set the permissions
relative to their current state. To do this, we first call stat to obtain the current
permissions and then modify them. We have explicitly turned on the set-group-ID bit
and turned off the group-execute bit. Note that the ls command lists the group-execute
permission as S to signify that the set-group-ID bit is set without the group-execute bit
being set.
108 Files and Directories  Chapter 4

                          On Solaris, the ls command displays an l instead of an S to indicate that mandatory file and
                          record locking has been enabled for this file. This behavior applies only to regular files, but
                          we'll discuss this more in Section 14.3.

           Finally, note that the time and date listed by the ls command did not change after
      we ran the program in Figure 4.12. We'll see in Section 4.19 that the chmod function
      updates only the time that the i-node was last changed. By default, the ls -l lists the
      time when the contents of the file were last modified.

           The chmod functions automatically clear two of the permission bits under the
      following conditions:

           � On systems, such as Solaris, that place special meaning on the sticky bit when
               used with regular files, if we try to set the sticky bit (S_ISVTX) on a regular file
               and do not have superuser privileges, the sticky bit in the mode is automatically
               turned off. (We describe the sticky bit in the next section.) To prevent malicious
               users from setting the sticky bit and adversely affecting system performance,
               only the superuser can set the sticky bit of a regular file.

                          In FreeBSD 8.0 and Solaris 10, only the superuser can set the sticky bit on a regular file.
                          Linux 3.2.0 and Mac OS X 10.6.8 place no such restriction on the setting of the sticky bit,
                          because the bit has no meaning when applied to regular files on these systems. Although the
                          bit also has no meaning when applied to regular files on FreeBSD, everyone except the
                          superuser is prevented from setting it on a regular file.

           � The group ID of a newly created file might potentially be a group that the calling
               process does not belong to. Recall from Section 4.6 that it's possible for the
               group ID of the new file to be the group ID of the parent directory. Specifically,
               if the group ID of the new file does not equal either the effective group ID of the
               process or one of the process's supplementary group IDs and if the process does
               not have superuser privileges, then the set-group-ID bit is automatically turned
               off. This prevents a user from creating a set-group-ID file owned by a group that
               the user doesn't belong to.

                          FreeBSD 8.0 fails an attempt to set the set-group-ID in this case. The other systems silently
                          turn the bit off, but don't fail the attempt to change the file access permissions.

                          FreeBSD 8.0, Linux 3.2.0, Mac OS X 10.6.8, and Solaris 10 add another security feature to try to
                          prevent misuse of some of the protection bits. If a process that does not have superuser
                          privileges writes to a file, the set-user-ID and set-group-ID bits are automatically turned off. If
                          malicious users find a set-group-ID or a set-user-ID file they can write to, even though they can
                          modify the file, they lose the special privileges of the file.

4.10  Sticky Bit

      The S_ISVTX bit has an interesting history. On versions of the UNIX System that
      predated demand paging, this bit was known as the sticky bit. If it was set for an
      executable program file, then the first time the program was executed, a copy of the
      program's text was saved in the swap area when the process terminated. (The text
Section 4.11  chown, fchown, fchownat, and lchown Functions 109

      portion of a program is the machine instructions.) The program would then load into
      memory more quickly the next time it was executed, because the swap area was
      handled as a contiguous file, as compared to the possibly random location of data
      blocks in a normal UNIX file system. The sticky bit was often set for common
      application programs, such as the text editor and the passes of the C compiler.
      Naturally, there was a limit to the number of sticky files that could be contained in the
      swap area before running out of swap space, but it was a useful technique. The name
      sticky came about because the text portion of the file stuck around in the swap area until
      the system was rebooted. Later versions of the UNIX System referred to this as the
      saved-text bit; hence the constant S_ISVTX. With today's newer UNIX systems, most of
      which have a virtual memory system and a faster file system, the need for this
      technique has disappeared.

           On contemporary systems, the use of the sticky bit has been extended. The Single
      UNIX Specification allows the sticky bit to be set for a directory. If the bit is set for a
      directory, a file in the directory can be removed or renamed only if the user has write
      permission for the directory and meets one of the following criteria:

           � Owns the file
           � Owns the directory
           � Is the superuser

      The directories /tmp and /var/tmp are typical candidates for the sticky bit--they are
      directories in which any user can typically create files. The permissions for these two
      directories are often read, write, and execute for everyone (user, group, and other). But
      users should not be able to delete or rename files owned by others.

                          The saved-text bit is not part of POSIX.1. It is part of the XSI option defined in the Single
                          UNIX Specification, and is supported by FreeBSD 8.0, Linux 3.2.0, Mac OS X 10.6.8, and
                          Solaris 10.

                          Solaris 10 places special meaning on the sticky bit if it is set on a regular file. In this case, if
                          none of the execute bits is set, the operating system will not cache the contents of the file.

4.11  chown, fchown, fchownat, and lchown Functions

      The chown functions allow us to change a file's user ID and group ID, but if either of
      the arguments owner or group is -1, the corresponding ID is left unchanged.

            #include <unistd.h>
            int chown(const char *pathname, uid_t owner, gid_t group);
            int fchown(int fd, uid_t owner, gid_t group);
            int fchownat(int fd, const char *pathname, uid_t owner, gid_t group,

                                   int flag);
            int lchown(const char *pathname, uid_t owner, gid_t group);

                                                                                    All four return: 0 if OK, -1 on error
110 Files and Directories  Chapter 4

These four functions operate similarly unless the referenced file is a symbolic link. In
that case, lchown and fchownat (with the AT_SYMLINK_NOFOLLOW flag set) change
the owners of the symbolic link itself, not the file pointed to by the symbolic link.

     The fchown function changes the ownership of the open file referenced by the fd
argument. Since it operates on a file that is already open, it can't be used to change the
ownership of a symbolic link.

     The fchownat function behaves like either chown or lchown when the pathname
argument is absolute or when the fd argument has the value AT_FDCWD and the
pathname argument is relative. In these cases, fchownat acts like lchown if the
AT_SYMLINK_NOFOLLOW flag is set in the flag argument, or it acts like chown if
the AT_SYMLINK_NOFOLLOW flag is clear. When the fd argument is set to the file
descriptor of an open directory and the pathname argument is a relative pathname,
fchownat evaluates the pathname relative to the open directory.

     Historically, BSD-based systems have enforced the restriction that only the
superuser can change the ownership of a file. This is to prevent users from giving away
their files to others, thereby defeating any disk space quota restrictions. System V,
however, has allowed all users to change the ownership of any files they own.

                    POSIX.1 allows either form of operation, depending on the value of
                    _POSIX_CHOWN_RESTRICTED.

                    With Solaris 10, this functionality is a configuration option, whose default value is to enforce
                    the restriction. FreeBSD 8.0, Linux 3.2.0, and Mac OS X 10.6.8 always enforce the chown
                    restriction.

Recall from Section 2.6 that the _POSIX_CHOWN_RESTRICTED constant can optionally
be defined in the header <unistd.h>, and can always be queried using either the
pathconf function or the fpathconf function. Also recall that this option can
depend on the referenced file; it can be enabled or disabled on a per file system basis.
We'll use the phrase ``if _POSIX_CHOWN_RESTRICTED is in effect,'' to mean ``if it
applies to the particular file that we're talking about,'' regardless of whether this actual
constant is defined in the header.

     If _POSIX_CHOWN_RESTRICTED is in effect for the specified file, then

     1. Only a superuser process can change the user ID of the file.

     2. A nonsuperuser process can change the group ID of the file if the process owns
          the file (the effective user ID equals the user ID of the file), owner is specified as
          -1 or equals the user ID of the file, and group equals either the effective group ID
          of the process or one of the process's supplementary group IDs.

This means that when _POSIX_CHOWN_RESTRICTED is in effect, you can't change the
user ID of your files. You can change the group ID of files that you own, but only to
groups that you belong to.

     If these functions are called by a process other than a superuser process, on
successful return, both the set-user-ID and the set-group-ID bits are cleared.
Section 4.12                                                File Size 111

4.12  File Size

      The st_size member of the stat structure contains the size of the file in bytes. This
      field is meaningful only for regular files, directories, and symbolic links.

                   FreeBSD 8.0, Mac OS X 10.6.8, and Solaris 10 also define the file size for a pipe as the number of
                   bytes that are available for reading from the pipe. We'll discuss pipes in Section 15.2.

           For a regular file, a file size of 0 is allowed. We'll get an end-of-file indication on the
      first read of the file. For a directory, the file size is usually a multiple of a number, such
      as 16 or 512. We talk about reading directories in Section 4.22.

           For a symbolic link, the file size is the number of bytes in the filename. For
      example, in the following case, the file size of 7 is the length of the pathname usr/lib:

              lrwxrwxrwx 1 root  7 Sep 25 07:14 lib -> usr/lib

      (Note that symbolic links do not contain the normal C null byte at the end of the name,
      as the length is always specified by st_size.)

           Most contemporary UNIX systems provide the fields st_blksize and
      st_blocks. The first is the preferred block size for I/O for the file, and the latter is the
      actual number of 512-byte blocks that are allocated. Recall from Section 3.9 that we
      encountered the minimum amount of time required to read a file when we used
      st_blksize for the read operations. The standard I/O library, which we describe in
      Chapter 5, also tries to read or write st_blksize bytes at a time, for efficiency.

                   Be aware that different versions of the UNIX System use units other than 512-byte blocks for
                   st_blocks. Use of this value is nonportable.

Holes in a File

      In Section 3.6, we mentioned that a regular file can contain ``holes.'' We showed an
      example of this in Figure 3.2. Holes are created by seeking past the current end of file
      and writing some data. As an example, consider the following:

              $ ls -l core

              -rw-r--r-- 1 sar   8483248 Nov 18 12:18 core

              $ du -s core

              272  core

      The size of the file core is slightly more than 8 MB, yet the du command reports that
      the amount of disk space used by the file is 272 512-byte blocks (139,264 bytes).
      Obviously, this file has many holes.

                   The du command on many BSD-derived systems reports the number of 1,024-byte blocks.
                   Solaris reports the number of 512-byte blocks. On Linux, the units reported depend on the
                   whether the POSIXLY_CORRECT environment is set. When it is set, the du command reports
                   1,024-byte block units; when it is not set, the command reports 512-byte block units.

           As we mentioned in Section 3.6, the read function returns data bytes of 0 for any
      byte positions that have not been written. If we execute the following command, we
      can see that the normal I/O operations read up through the size of the file:
112 Files and Directories                              Chapter 4

      $ wc -c core
       8483248 core

           The wc(1) command with the -c option counts the number of characters (bytes) in the file.

           If we make a copy of this file, using a utility such as cat(1), all these holes are
      written out as actual data bytes of 0:

      $ cat core > core.copy

      $ ls -l core*

      -rw-r--r-- 1 sar 8483248 Nov 18 12:18 core

      -rw-rw-r-- 1 sar 8483248 Nov 18 12:27 core.copy

      $ du -s core*

      272  core

      16592 core.copy

      Here, the actual number of bytes used by the new file is 8,495,104 (512 � 16,592). The
      difference between this size and the size reported by ls is caused by the number of
      blocks used by the file system to hold pointers to the actual data blocks.

           Interested readers should refer to Section 4.2 of Bach [1986], Sections 7.2 and 7.3 of
      McKusick et al. [1996] (or Sections 8.2 and 8.3 in McKusick and Neville-Neil [2005]),
      Section 15.2 of McDougall and Mauro [2007], and Chapter 12 in Singh [2006] for
      additional details on the physical layout of files.

4.13  File Truncation

      Sometimes we would like to truncate a file by chopping off data at the end of the file.
      Emptying a file, which we can do with the O_TRUNC flag to open, is a special case of
      truncation.

            #include <unistd.h>

            int truncate(const char *pathname, off_t length);

            int ftruncate(int fd, off_t length);

                                                                                        Both return: 0 if OK, -1 on error

      These two functions truncate an existing file to length bytes. If the previous size of the
      file was greater than length, the data beyond length is no longer accessible. Otherwise, if
      the previous size was less than length, the file size will increase and the data between
      the old end of file and the new end of file will read as 0 (i.e., a hole is probably created
      in the file).

                          BSD releases prior to 4.4BSD could only make a file smaller with truncate.

                          Solaris also includes an extension to fcntl (F_FREESP) that allows us to free any part of a
                          file, not just a chunk at the end of the file.

           We use ftruncate in the program shown in Figure 13.6 when we need to empty a
      file after obtaining a lock on the file.
Section 4.14                                                                               File Systems 113

4.14 File Systems
```
- `Bash` -- `sed -n '7389,7824p' /tmp/apue/full.txt`
```
4.15 link, linkat, unlink, unlinkat, and remove Functions

          As we saw in the previous section, a file can have multiple directory entries pointing to
          its i-node. We can use either the link function or the linkat function to create a link
          to an existing file.

                  #include <unistd.h>

                  int link(const char *existingpath, const char *newpath);

                  int linkat(int efd, const char *existingpath, int nfd, const char *newpath,
                                      int flag);

                                                                                              Both return: 0 if OK, -1 on error

          These functions create a new directory entry, newpath, that references the existing file
          existingpath. If the newpath already exists, an error is returned. Only the last component
          of the newpath is created. The rest of the path must already exist.

                With the linkat function, the existing file is specified by both the efd and
          existingpath arguments, and the new pathname is specified by both the nfd and newpath
          arguments. By default, if either pathname is relative, it is evaluated relative to the
          corresponding file descriptor. If either file descriptor is set to AT_FDCWD, then the
          corresponding pathname, if it is a relative pathname, is evaluated relative to the current
          directory. If either pathname is absolute, then the corresponding file descriptor
          argument is ignored.

                When the existing file is a symbolic link, the flag argument controls whether the
          linkat function creates a link to the symbolic link or to the file to which the symbolic
          link points. If the AT_SYMLINK_FOLLOW flag is set in the flag argument, then a link is
          created to the target of the symbolic link. If this flag is clear, then a link is created to the
          symbolic link itself.

                The creation of the new directory entry and the increment of the link count must be
          an atomic operation. (Recall the discussion of atomic operations in Section 3.11.)
Section 4.15  link, linkat, unlink, unlinkat, and remove Functions 117

     Most implementations require that both pathnames be on the same file system,
although POSIX.1 allows an implementation to support linking across file systems. If
an implementation supports the creation of hard links to directories, it is restricted to
only the superuser. This constraint exists because such hard links can cause loops in the
file system, which most utilities that process the file system aren't capable of handling.
(We show an example of a loop introduced by a symbolic link in Section 4.17.) Many
file system implementations disallow hard links to directories for this reason.

     To remove an existing directory entry, we call the unlink function.

      #include <unistd.h>

      int unlink(const char *pathname);

      int unlinkat(int fd, const char *pathname, int flag);

                                                                                  Both return: 0 if OK, -1 on error

These functions remove the directory entry and decrement the link count of the file
referenced by pathname. If there are other links to the file, the data in the file is still
accessible through the other links. The file is not changed if an error occurs.

     As mentioned earlier, to unlink a file, we must have write permission and execute
permission in the directory containing the directory entry, as it is the directory entry
that we will be removing. Also, as mentioned in Section 4.10, if the sticky bit is set in
this directory we must have write permission for the directory and meet one of the
following criteria:

     � Own the file

     � Own the directory

     � Have superuser privileges

     Only when the link count reaches 0 can the contents of the file be deleted. One
other condition prevents the contents of a file from being deleted: as long as some
process has the file open, its contents will not be deleted. When a file is closed, the
kernel first checks the count of the number of processes that have the file open. If this
count has reached 0, the kernel then checks the link count; if it is 0, the file's contents are
deleted.

     If the pathname argument is a relative pathname, then the unlinkat function
evaluates the pathname relative to the directory represented by the fd file descriptor
argument. If the fd argument is set to the value AT_FDCWD, then the pathname is
evaluated relative to the current working directory of the calling process. If the
pathname argument is an absolute pathname, then the fd argument is ignored.

     The flag argument gives callers a way to change the default behavior of the
unlinkat function. When the AT_REMOVEDIR flag is set, then the unlinkat function
can be used to remove a directory, similar to using rmdir. If this flag is clear, then
unlinkat operates like unlink.
118 Files and Directories                                                      Chapter 4

Example

          The program shown in Figure 4.16 opens a file and then unlinks it. The program then
          goes to sleep for 15 seconds before terminating.

            #include "apue.h"
            #include <fcntl.h>

            int
            main(void)
            {

                   if (open("tempfile", O_RDWR) < 0)
                          err_sys("open error");

                   if (unlink("tempfile") < 0)
                          err_sys("unlink error");

                   printf("file unlinked\n");
                   sleep(15);
                   printf("done\n");
                   exit(0);
            }

                           Figure 4.16 Open a file and then unlink it

Running this program gives us

$ ls -l tempfile               look at how big the file is

-rw-r----- 1 sar           413265408 Jan 21 07:14 tempfile

$ df /home                     check how much free space is available

Filesystem 1K-blocks           Used Available Use% Mounted on

/dev/hda4                  11021440 1956332 9065108 18% /home

$ ./a.out &                    run the program in Figure 4.16 in the background

1364                           the shell prints its process ID

$ file unlinked                the file is unlinked

ls -l tempfile                 see if the filename is still there

ls: tempfile: No such file or directory the directory entry is gone

$ df /home                     see if the space is available yet

Filesystem 1K-blocks           Used Available Use% Mounted on

/dev/hda4                  11021440 1956332 9065108 18% /home

$ done                         the program is done, all open files are closed

df /home                       now the disk space should be available

Filesystem 1K-blocks           Used Available Use% Mounted on

/dev/hda4                  11021440 1552352 9469088 15% /home

                               now the 394.1 MB of disk space are available

     This property of unlink is often used by a program to ensure that a temporary file
it creates won't be left around in case the program crashes. The process creates a file
using either open or creat and then immediately calls unlink. The file is not deleted,
however, because it is still open. Only when the process either closes the file or
terminates, which causes the kernel to close all its open files, is the file deleted.

     If pathname is a symbolic link, unlink removes the symbolic link, not the file
referenced by the link. There is no function to remove the file referenced by a symbolic
link given the name of the link.
Section 4.16                                     rename and renameat Functions 119

     The superuser can call unlink with pathname specifying a directory if the file
system supports it, but the function rmdir should be used instead to unlink a directory.
We describe the rmdir function in Section 4.21.

     We can also unlink a file or a directory with the remove function. For a file,
remove is identical to unlink. For a directory, remove is identical to rmdir.

              #include <stdio.h>
              int remove(const char *pathname);

                                                 Returns: 0 if OK, -1 on error

              ISO C specifies the remove function to delete a file. The name was changed from the historical
              UNIX name of unlink because most non-UNIX systems that implement the C standard didn't
              support the concept of links to a file at the time.

4.16 rename and renameat Functions

          A file or a directory is renamed with either the rename or renameat function.

                  #include <stdio.h>

                  int rename(const char *oldname, const char *newname);

                  int renameat(int oldfd, const char *oldname, int newfd,
                                         const char *newname);

                                                                                              Both return: 0 if OK, -1 on error

                                  The rename function is defined by ISO C for files. (The C standard doesn't deal with
                                  directories.) POSIX.1 expanded the definition to include directories and symbolic links.

                There are several conditions to describe for these functions, depending on whether
          oldname refers to a file, a directory, or a symbolic link. We must also describe what
          happens if newname already exists.

                1. If oldname specifies a file that is not a directory, then we are renaming a file or a
                     symbolic link. In this case, if newname exists, it cannot refer to a directory. If
                     newname exists and is not a directory, it is removed, and oldname is renamed to
                     newname. We must have write permission for the directory containing oldname
                     and the directory containing newname, since we are changing both directories.

                2. If oldname specifies a directory, then we are renaming a directory. If newname
                     exists, it must refer to a directory, and that directory must be empty. (When we
                     say that a directory is empty, we mean that the only entries in the directory are
                     dot and dot-dot.) If newname exists and is an empty directory, it is removed, and
                     oldname is renamed to newname. Additionally, when we're renaming a directory,
                     newname cannot contain a path prefix that names oldname. For example, we
                     can't rename /usr/foo to /usr/foo/testdir, because the old name
                     (/usr/foo) is a path prefix of the new name and cannot be removed.
120 Files and Directories  Chapter 4

                3. If either oldname or newname refers to a symbolic link, then the link itself is
                     processed, not the file to which it resolves.

                4. We can't rename dot or dot-dot. More precisely, neither dot nor dot-dot can
                     appear as the last component of oldname or newname.

                5. As a special case, if oldname and newname refer to the same file, the function
                     returns successfully without changing anything.

          If newname already exists, we need permissions as if we were deleting it. Also, because
          we're removing the directory entry for oldname and possibly creating a directory entry
          for newname, we need write permission and execute permission in the directory
          containing oldname and in the directory containing newname.

                The renameat function provides the same functionality as the rename function,
          except when either oldname or newname refers to a relative pathname. If oldname
          specifies a relative pathname, it is evaluated relative to the directory referenced by oldfd.
          Similarly, newname is evaluated relative to the directory referenced by newfd if newname
          specifies a relative pathname. Either the oldfd or newfd arguments (or both) can be set to
          AT_FDCWD to evaluate the corresponding pathname relative to the current directory.

4.17 Symbolic Links

          A symbolic link is an indirect pointer to a file, unlike the hard links described in the
          previous section, which pointed directly to the i-node of the file. Symbolic links were
          introduced to get around the limitations of hard links.

                � Hard links normally require that the link and the file reside in the same file
                    system.

                � Only the superuser can create a hard link to a directory (when supported by the
                    underlying file system).

          There are no file system limitations on a symbolic link and what it points to, and anyone
          can create a symbolic link to a directory. Symbolic links are typically used to ``move'' a
          file or an entire directory hierarchy to another location on a system.

                When using functions that refer to a file by name, we always need to know whether
          the function follows a symbolic link. If the function follows a symbolic link, a
          pathname argument to the function refers to the file pointed to by the symbolic link.
          Otherwise, a pathname argument refers to the link itself, not the file pointed to by the
          link. Figure 4.17 summarizes whether the functions described in this chapter follow a
          symbolic link. The functions mkdir, mkfifo, mknod, and rmdir do not appear in this
          figure, as they return an error when the pathname is a symbolic link. Also, the
          functions that take a file descriptor argument, such as fstat and fchmod, are not
          listed, as the function that returns the file descriptor (usually open) handles the
          symbolic link. Historically, implementations have differed in whether chown follows
          symbolic links. In all modern systems, however, chown does follow symbolic links.
Section 4.17                                             Symbolic Links 121

              Symbolic links were introduced with 4.2BSD. Initially, chown didn't follow symbolic links, but
              this behavior was changed in 4.4BSD. System V included support for symbolic links in SVR4,
              but diverged from the original BSD behavior by implementing chown to follow symbolic links.
              In older versions of Linux (those before version 2.1.81), chown didn't follow symbolic links.
              From version 2.1.81 onward, chown follows symbolic links. With FreeBSD 8.0, Mac OS X
              10.6.8, and Solaris 10, chown follows symbolic links. All of these platforms provide
              implementations of lchown to change the ownership of symbolic links themselves.

              Function  Does not follow      Follows
                         symbolic link    symbolic link
              access
              chdir              �                �
              chmod              �                �
              chown                               �
              creat              �                �
              exec               �                �
              lchown             �                �
              link               �
              lstat                               �
              open
              opendir                             �
              pathconf                            �
              readlink                            �
              remove
              rename                              �
              stat                                �
              truncate
              unlink

              Figure 4.17 Treatment of symbolic links by various functions

     One exception to the behavior summarized in Figure 4.17 occurs when the open
function is called with both O_CREAT and O_EXCL set. In this case, if the pathname
refers to a symbolic link, open will fail with errno set to EEXIST. This behavior is
intended to close a security hole so that privileged processes can't be fooled into writing
to the wrong files.

Example

It is possible to introduce loops into the file system by using symbolic links. Most
functions that look up a pathname return an errno of ELOOP when this occurs.
Consider the following commands:

              $ mkdir foo                     make a new directory
              $ touch foo/a                   create a 0-length file
              $ ln -s ../foo foo/testdir      create a symbolic link
              $ ls -l foo
              total 0                     0 Jan 22 00:16 a
              -rw-r----- 1 sar            6 Jan 22 00:16 testdir -> ../foo
              lrwxrwxrwx 1 sar
122 Files and Directories                   Chapter 4

This creates a directory foo that contains the file a and a symbolic link that points to
foo. We show this arrangement in Figure 4.18, drawing a directory as a circle and a file
as a square.

                              foo

                           a       testdir

                                    Figure 4.18 Symbolic link testdir that creates a loop

If we write a simple program that uses the standard function ftw(3) on Solaris to
descend through a file hierarchy, printing each pathname encountered, the output is

      foo
      foo/a
      foo/testdir
      foo/testdir/a
      foo/testdir/testdir
      foo/testdir/testdir/a
      foo/testdir/testdir/testdir
      foo/testdir/testdir/testdir/a

           (many more lines until we encounter an ELOOP error)

In Section 4.22, we provide our own version of the ftw function that uses lstat
instead of stat, to prevent it from following symbolic links.

                    Note that on Linux, the ftw and nftw functions record all directories seen and avoid
                    processing a directory more than once, so they don't display this behavior.

     A loop of this form is easy to remove. We can unlink the file foo/testdir, as
unlink does not follow a symbolic link. But if we create a hard link that forms a loop
of this type, its removal is much more difficult. This is why the link function will not
form a hard link to a directory unless the process has superuser privileges.

                    Indeed, Rich Stevens did this on his own system as an experiment while writing the original
                    version of this section. The file system got corrupted and the normal fsck(1) utility couldn't
                    fix things. The deprecated tools clri(8) and dcheck(8) were needed to repair the file system.

                    The need for hard links to directories has long since passed. With symbolic links and the
                    mkdir function, there is no longer any need for users to create hard links to directories.

     When we open a file, if the pathname passed to open specifies a symbolic link,
open follows the link to the specified file. If the file pointed to by the symbolic link
doesn't exist, open returns an error saying that it can't open the file. This response can
confuse users who aren't familiar with symbolic links. For example,
Section 4.18                                Creating and Reading Symbolic Links 123

              $ ln -s /no/such/file myfile            create a symbolic link

              $ ls myfile                             ls says it's there
                                                      so we try to look at it
              myfile
                                                      try -l option
              $ cat myfile                            myfile -> /no/such/file

              cat: myfile: No such file or directory

              $ ls -l myfile

              lrwxrwxrwx 1 sar  13 Jan 22 00:26

The file myfile does exist, yet cat says there is no such file, because myfile is a
symbolic link and the file pointed to by the symbolic link doesn't exist. The -l option
to ls gives us two hints: the first character is an l, which means a symbolic link, and
the sequence -> also indicates a symbolic link. The ls command has another option
(-F) that appends an at-sign (@) to filenames that are symbolic links, which can help us
spot symbolic links in a directory listing without the -l option.

4.18 Creating and Reading Symbolic Links

          A symbolic link is created with either the symlink or symlinkat function.

                  #include <unistd.h>

                  int symlink(const char *actualpath, const char *sympath);

                  int symlinkat(const char *actualpath, int fd, const char *sympath);

                                                                                              Both return: 0 if OK, -1 on error

          A new directory entry, sympath, is created that points to actualpath. It is not required
          that actualpath exist when the symbolic link is created. (We saw this in the example at
          the end of the previous section.) Also, actualpath and sympath need not reside in the
          same file system.

                The symlinkat function is similar to symlink, but the sympath argument is
          evaluated relative to the directory referenced by the open file descriptor for that
          directory (specified by the fd argument). If the sympath argument specifies an absolute
          pathname or if the fd argument has the special value AT_FDCWD, then symlinkat
          behaves the same way as symlink.

                Because the open function follows a symbolic link, we need a way to open the link
          itself and read the name in the link. The readlink and readlinkat functions do this.

                  #include <unistd.h>

                  ssize_t readlink(const char* restrict pathname, char *restrict buf,
                                                 size_t bufsize);

                  ssize_t readlinkat(int fd, const char* restrict pathname,
                                                    char *restrict buf, size_t bufsize);

                                                                   Both return: number of bytes read if OK, -1 on error
124 Files and Directories                                                                   Chapter 4

These functions combine the actions of open, read, and close. If successful, they
return the number of bytes placed into buf. The contents of the symbolic link that are
returned in buf are not null terminated.

     The readlinkat function behaves the same way as the readlink function when
the pathname argument specifies an absolute pathname or when the fd argument has the
special value AT_FDCWD. However, when the fd argument is a valid file descriptor of an
open directory and the pathname argument is a relative pathname, then readlinkat
evaluates the pathname relative to the open directory represented by fd.

4.19 File Times
```
- `Bash` -- `sed -n '7824,8185p' /tmp/apue/full.txt`
```
4.19 File Times

          In Section 4.2, we discussed how the 2008 version of the Single UNIX Specification
          increased the resolution of the time fields in the stat structure from seconds to seconds
          plus nanoseconds. The actual resolution stored with each file's attributes depends on
          the file system implementation. For file systems that store timestamps in second
          granularity, the nanoseconds fields will be filled with zeros. For file systems that store
          timestamps in a resolution higher than seconds, the partial seconds value will be
          converted into nanoseconds and returned in the nanoseconds fields.

                Three time fields are maintained for each file. Their purpose is summarized in
          Figure 4.19.

  Field                                  Description                 Example  ls(1) option

st_atim                    last-access time of file data        read                -u
st_mtim                    last-modification time of file data  write            default
st_ctim                    last-change time of i-node status    chmod, chown
                                                                                    -c

                           Figure 4.19 The three time values associated with each file

Note the difference between the modification time (st_mtim) and the changed-status
time (st_ctim). The modification time indicates when the contents of the file were last
modified. The changed-status time indicates when the i-node of the file was last
modified. In this chapter, we've described many operations that affect the i-node
without changing the actual contents of the file: changing the file access permissions,
changing the user ID, changing the number of links, and so on. Because all the
information in the i-node is stored separately from the actual contents of the file, we
need the changed-status time, in addition to the modification time.

     Note that the system does not maintain the last-access time for an i-node. This is
why the functions access and stat, for example, don't change any of the three times.

     The access time is often used by system administrators to delete files that have not
been accessed for a certain amount of time. The classic example is the removal of files
named a.out or core that haven't been accessed in the past week. The find(1)
command is often used for this type of operation.

     The modification time and the changed-status time can be used to archive only
those files that have had their contents modified or their i-node modified.
Section 4.19                                                                  File Times 125

     The ls command displays or sorts only on one of the three time values. By default,
when invoked with either the -l or the -t option, it uses the modification time of a file.
The -u option causes the ls command to use the access time, and the -c option causes
it to use the changed-status time.

     Figure 4.20 summarizes the effects of the various functions that we've described on
these three times. Recall from Section 4.14 that a directory is simply a file containing
directory entries: filenames and associated i-node numbers. Adding, deleting, or
modifying these directory entries can affect the three times associated with that
directory. This is why Figure 4.20 contains one column for the three times associated
with the file or directory and another column for the three times associated with the
parent directory of the referenced file or directory. For example, creating a new file
affects the directory that contains the new file, and it affects the i-node for the new file.
Reading or writing a file, however, affects only the i-node of the file and has no effect on
the directory.

                 Function    Referenced file     Parent directory    Section                 Note
                               or directory      of referenced file
chmod, fchmod                                                          4.9    O_CREAT new file
chown, fchown                amc                    or directory       4.11   O_TRUNC existing file
creat                                             amc                  3.4
creat                                         �                        3.4    parent of second argument
exec                                          �            ��          8.10
lchown                       ���                                       4.11   O_CREAT new file
link                                 ��                    ��          4.15   O_TRUNC existing file
mkdir                        �                             ��          4.21
mkfifo                                        �            ��         15.5    remove file = unlink
open                                          �            ��          3.3    remove directory = rmdir
open                         ���                                       3.3    for both arguments
pipe                         ���                           ��         15.2
read                         ���                           ��          3.7
remove                               ��                    ��          4.15
remove                       ���                           ��          4.15
rename                       �                             ��          4.16
rmdir                                         �                        4.21
truncate, ftruncate                                                    4.13
unlink                                        �                        4.15
utimes, utimensat, futimens                                            4.20
write                                ��                                3.8
                                              �

                             ���
                                     ��

              Figure 4.20 Effect of various functions on the access, modification, and changed-status times

(The mkdir and rmdir functions are covered in Section 4.21. The utimes,
utimensat, and futimens functions are covered in the next section. The seven exec
functions are described in Section 8.10. We describe the mkfifo and pipe functions in
Chapter 15.)
126 Files and Directories  Chapter 4

4.20 futimens, utimensat, and utimes Functions

          Several functions are available to change the access time and the modification time of a
          file. The futimens and utimensat functions provide nanosecond granularity for
          specifying timestamps, using the timespec structure (the same structure used by the
          stat family of functions; see Section 4.2).

                  #include <sys/stat.h>

                  int futimens(int fd, const struct timespec times[2]);

                  int utimensat(int fd, const char *path, const struct timespec times[2],
                                           int flag);

                                                                                              Both return: 0 if OK, -1 on error

                In both functions, the first element of the times array argument contains the access
          time, and the second element contains the modification time. The two time values are
          calendar times, which count seconds since the Epoch, as described in Section 1.10.
          Partial seconds are expressed in nanoseconds.

                Timestamps can be specified in one of four ways:

                1. The times argument is a null pointer. In this case, both timestamps are set to the
                     current time.

                2. The times argument points to an array of two timespec structures. If either
                     tv_nsec field has the special value UTIME_NOW, the corresponding timestamp
                     is set to the current time. The corresponding tv_sec field is ignored.

                3. The times argument points to an array of two timespec structures. If either
                     tv_nsec field has the special value UTIME_OMIT, then the corresponding
                     timestamp is unchanged. The corresponding tv_sec field is ignored.

                4. The times argument points to an array of two timespec structures and the
                     tv_nsec field contains a value other than UTIME_NOW or UTIME_OMIT. In this
                     case, the corresponding timestamp is set to the value specified by the
                     corresponding tv_sec and tv_nsec fields.

                The privileges required to execute these functions depend on the value of the times
          argument.

                � If times is a null pointer or if either tv_nsec field is set to UTIME_NOW, either
                    the effective user ID of the process must equal the owner ID of the file, the
                    process must have write permission for the file, or the process must be a
                    superuser process.

                � If times is a non-null pointer and either tv_nsec field has a value other than
                    UTIME_NOW or UTIME_OMIT, the effective user ID of the process must equal the
                    owner ID of the file, or the process must be a superuser process. Merely having
                    write permission for the file is not adequate.
Section 4.20                                futimens, utimensat, and utimes Functions 127

              � If times is a non-null pointer and both tv_nsec fields are set to UTIME_OMIT,
                  no permissions checks are performed.

     With futimens, you need to open the file to change its times. The utimensat
function provides a way to change a file's times using the file's name. The pathname
argument is evaluated relative to the fd argument, which is either a file descriptor of an
open directory or the special value AT_FDCWD to force evaluation relative to the current
directory of the calling process. If pathname specifies an absolute pathname, then the fd
argument is ignored.

     The flag argument to utimensat can be used to further modify the default
behavior. If the AT_SYMLINK_NOFOLLOW flag is set, then the times of the symbolic link
itself are changed (if the pathname refers to a symbolic link). The default behavior is to
follow a symbolic link and modify the times of the file to which the link refers.

     Both futimens and utimensat are included in POSIX.1. A third function,
utimes, is included in the Single UNIX Specification as part of the XSI option.

      #include <sys/time.h>

      int utimes(const char *pathname, const struct timeval times[2]);

                                                                                       Returns: 0 if OK, -1 on error

     The utimes function operates on a pathname. The times argument is a pointer to
an array of two timestamps--access time and modification time--but they are
expressed in seconds and microseconds:

              struct timeval {              /* seconds */
                            time_t tv_sec;  /* microseconds */
                            long tv_usec;

              };

     Note that we are unable to specify a value for the changed-status time,
st_ctim--the time the i-node was last changed--as this field is automatically updated
when the utime function is called.

     On some versions of the UNIX System, the touch(1) command uses one of these
functions. Also, the standard archive programs, tar(1) and cpio(1), optionally call
these functions to set a file's times to the time values saved when the file was archived.

Example

          The program shown in Figure 4.21 truncates files to zero length using the O_TRUNC
          option of the open function, but does not change their access time or modification time.
          To do this, the program first obtains the times with the stat function, truncates the file,
          and then resets the times with the futimens function.

            #include "apue.h"
            #include <fcntl.h>

            int
            main(int argc, char *argv[])
128 Files and Directories                                                               Chapter 4

{

   int                     i, fd;

   struct stat             statbuf;

   struct timespec times[2];

   for (i = 1; i < argc; i++) {

        if (stat(argv[i], &statbuf) < 0) { /* fetch current times */

             err_ret("%s: stat error", argv[i]);

             continue;

        }

        if ((fd = open(argv[i], O_RDWR | O_TRUNC)) < 0) { /* truncate */

             err_ret("%s: open error", argv[i]);

             continue;

        }

        times[0] = statbuf.st_atim;

        times[1] = statbuf.st_mtim;

        if (futimens(fd, times) < 0)      /* reset times */

             err_ret("%s: futimens error", argv[i]);

        close(fd);

   }

   exit(0);

}

                           Figure 4.21 Example of futimens function

We can demonstrate the program in Figure 4.21 on Linux with the following commands:

   $ ls -l changemod times                   look at sizes and last-modification times
                                          22 01:26 changemod
   -rwxr-xr-x 1 sar 13792 Jan             22 01:26 times

   -rwxr-xr-x 1 sar 13824 Jan                look at last-access times
                                          22 22:22 changemod
   $ ls -lu changemod times               22 22:22 times

   -rwxr-xr-x 1 sar 13792 Jan                print today's date

   -rwxr-xr-x 1 sar 13824 Jan                run the program in Figure 4.21
                                             and check the results
   $ date                                 22 01:26 changemod
                                          22 01:26 times
   Fri Jan 27 20:53:46 EST 2012              check the last-access times also
                                          22 22:22 changemod
   $ ./a.out changemod times              22 22:22 times
                                             and the changed-status times
   $ ls -l changemod times                27 20:53 changemod
                                          27 20:53 times
   -rwxr-xr-x 1 sar                0 Jan

   -rwxr-xr-x 1 sar                0 Jan

   $ ls -lu changemod times

   -rwxr-xr-x 1 sar                0 Jan

   -rwxr-xr-x 1 sar                0 Jan

   $ ls -lc changemod times

   -rwxr-xr-x 1 sar                0 Jan

   -rwxr-xr-x 1 sar                0 Jan

As we would expect, the last-modification times and the last-access times have not
changed. The changed-status times, however, have changed to the time that the
program was run.
Section 4.21  mkdir, mkdirat, and rmdir Functions 129

4.21 mkdir, mkdirat, and rmdir Functions

          Directories are created with the mkdir and mkdirat functions, and deleted with the
          rmdir function.

                  #include <sys/stat.h>

                  int mkdir(const char *pathname, mode_t mode);

                  int mkdirat(int fd, const char *pathname, mode_t mode);

                                                                                              Both return: 0 if OK, -1 on error

          These functions create a new, empty directory. The entries for dot and dot-dot are
          created automatically. The specified file access permissions, mode, are modified by the
          file mode creation mask of the process.

                A common mistake is to specify the same mode as for a file: read and write
          permissions only. But for a directory, we normally want at least one of the execute bits
          enabled, to allow access to filenames within the directory. (See Exercise 4.16.)

                The user ID and group ID of the new directory are established according to the
          rules we described in Section 4.6.

                                  Solaris 10 and Linux 3.2.0 also have the new directory inherit the set-group-ID bit from the
                                  parent directory. Files created in the new directory will then inherit the group ID of that
                                  directory. With Linux, the file system implementation determines whether this behavior is
                                  supported. For example, the ext2, ext3, and ext4 file systems allow this behavior to be
                                  controlled by an option to the mount(1) command. With the Linux implementation of the UFS
                                  file system, however, the behavior is not selectable; it inherits the set-group-ID bit to mimic the
                                  historical BSD implementation, where the group ID of a directory is inherited from the parent
                                  directory.

                                  BSD-based implementations don't propagate the set-group-ID bit; they simply inherit the
                                  group ID as a matter of policy. Because FreeBSD 8.0 and Mac OS X 10.6.8 are based on 4.4BSD,
                                  they do not require inheriting the set-group-ID bit. On these platforms, newly created files and
                                  directories always inherit the group ID of the parent directory, regardless of whether the
                                  set-group-ID bit is set.

                                  Earlier versions of the UNIX System did not have the mkdir function; it was introduced with
                                  4.2BSD and SVR3. In the earlier versions, a process had to call the mknod function to create a
                                  new directory--but use of the mknod function was restricted to superuser processes. To
                                  circumvent this constraint, the normal command that created a directory, mkdir(1), had to be
                                  owned by root with the set-user-ID bit on. To create a directory from a process, the mkdir(1)
                                  command had to be invoked with the system(3) function.

                The mkdirat function is similar to the mkdir function. When the fd argument has
          the special value AT_FDCWD, or when the pathname argument specifies an absolute
          pathname, mkdirat behaves exactly like mkdir. Otherwise, the fd argument is an
          open directory from which relative pathnames will be evaluated.

                An empty directory is deleted with the rmdir function. Recall that an empty
          directory is one that contains entries only for dot and dot-dot.
130 Files and Directories  Chapter 4

            #include <unistd.h>

            int rmdir(const char *pathname);

                                                                                             Returns: 0 if OK, -1 on error

      If the link count of the directory becomes 0 with this call, and if no other process has the
      directory open, then the space occupied by the directory is freed. If one or more
      processes have the directory open when the link count reaches 0, the last link is
      removed and the dot and dot-dot entries are removed before this function returns.
      Additionally, no new files can be created in the directory. The directory is not freed,
      however, until the last process closes it. (Even though some other process has the
      directory open, it can't be doing much in the directory, as the directory had to be empty
      for the rmdir function to succeed.)

4.22  Reading Directories
```
- `Bash` -- `sed -n '8185,8539p' /tmp/apue/full.txt`
```
4.22  Reading Directories

      Directories can be read by anyone who has access permission to read the directory. But
      only the kernel can write to a directory, to preserve file system sanity. Recall from
      Section 4.5 that the write permission bits and execute permission bits for a directory
      determine if we can create new files in the directory and remove files from the
      directory--they don't specify if we can write to the directory itself.

           The actual format of a directory depends on the UNIX System implementation and
      the design of the file system. Earlier systems, such as Version 7, had a simple structure:
      each directory entry was 16 bytes, with 14 bytes for the filename and 2 bytes for the
      i-node number. When longer filenames were added to 4.2BSD, each entry became
      variable length, which means that any program that reads a directory is now system
      dependent. To simplify the process of reading a directory, a set of directory routines
      were developed and are part of POSIX.1. Many implementations prevent applications
      from using the read function to access the contents of directories, thereby further
      isolating applications from the implementation-specific details of directory formats.

            #include <dirent.h>

            DIR *opendir(const char *pathname);

            DIR *fdopendir(int fd);
                                                                            Both return: pointer if OK, NULL on error

            struct dirent *readdir(DIR *dp);
                                                        Returns: pointer if OK, NULL at end of directory or error

            void rewinddir(DIR *dp);

            int closedir(DIR *dp);
                                                                                             Returns: 0 if OK, -1 on error

            long telldir(DIR *dp);
                                                        Returns: current location in directory associated with dp

            void seekdir(DIR *dp, long loc);
Section 4.22                  Reading Directories 131

     The fdopendir function first appeared in version 4 of the Single UNIX
Specification. It provides a way to convert an open file descriptor into a DIR structure
for use by the directory handling functions.

     The telldir and seekdir functions are not part of the base POSIX.1 standard.
They are included in the XSI option in the Single UNIX Specification, so all conforming
UNIX System implementations are expected to provide them.

     Recall our use of several of these functions in the program shown in Figure 1.3, our
bare-bones implementation of the ls command.

     The dirent structure defined in <dirent.h> is implementation dependent.
Implementations define the structure to contain at least the following two members:

              ino_t d_ino;    /* i-node number */
              char d_name[];  /* null-terminated filename */

              The d_ino entry is not defined by POSIX.1, because it is an implementation feature, but it is
              defined as part of the XSI option in POSIX.1. POSIX.1 defines only the d_name entry in this
              structure.

     Note that the size of the d_name entry isn't specified, but it is guaranteed to hold at
least NAME_MAX characters, not including the terminating null byte (recall Figure 2.15.)
Since the filename is null terminated, however, it doesn't matter how d_name is defined
in the header, because the array size doesn't indicate the length of the filename.

     The DIR structure is an internal structure used by these seven functions to maintain
information about the directory being read. The purpose of the DIR structure is similar
to that of the FILE structure maintained by the standard I/O library, which we describe
in Chapter 5.

     The pointer to a DIR structure returned by opendir and fdopendir is then used
with the other five functions. The opendir function initializes things so that the first
readdir returns the first entry in the directory. When the DIR structure is created by
fdopendir, the first entry returned by readdir depends on the file offset associated
with the file descriptor passed to fdopendir. Note that the ordering of entries within
the directory is implementation dependent and is usually not alphabetical.

Example

          We'll use these directory routines to write a program that traverses a file hierarchy. The
          goal is to produce a count of the various types of files shown in Figure 4.4. The
          program shown in Figure 4.22 takes a single argument--the starting pathname--and
          recursively descends the hierarchy from that point. Solaris provides a function, ftw(3),
          that performs the actual traversal of the hierarchy, calling a user-defined function for
          each file. The problem with this function is that it calls the stat function for each file,
          which causes the program to follow symbolic links. For example, if we start at the root
          and have a symbolic link named /lib that points to /usr/lib, all the files in the
          directory /usr/lib are counted twice. To correct this problem, Solaris provides an
          additional function, nftw(3), with an option that stops it from following symbolic links.
          Although we could use nftw, we'll write our own simple file walker to show the use of
          the directory routines.
132 Files and Directories                                            Chapter 4

          In SUSv4, nftw is included as part of the XSI option. Implementations are included in
          FreeBSD 8.0, Linux 3.2.0, Mac OS X 10.6.8, and Solaris 10. (In SUSv4, the ftw function has
          been marked as obsolescent.) BSD-based systems have a different function, fts(3), that
          provides similar functionality. It is available in FreeBSD 8.0, Linux 3.2.0, and Mac OS X 10.6.8.

#include "apue.h"
#include <dirent.h>
#include <limits.h>

/* function type that is called for each filename */
typedef int Myfunc(const char *, const struct stat *, int);

static Myfunc              myfunc;
static int                 myftw(char *, Myfunc *);
static int                 dopath(Myfunc *);

static long nreg, ndir, nblk, nchr, nfifo, nslink, nsock, ntot;

int

main(int argc, char *argv[])

{

     int  ret;

     if (argc != 2)
            err_quit("usage: ftw <starting-pathname>");

     ret = myftw(argv[1], myfunc);  /* does it all */

     ntot = nreg + ndir + nblk + nchr + nfifo + nslink + nsock;

     if (ntot == 0)

          ntot = 1;        /* avoid divide by 0; print 0 for all counts */

     printf("regular files = %7ld, %5.2f %%\n", nreg,

     nreg*100.0/ntot);

     printf("directories = %7ld, %5.2f %%\n", ndir,

     ndir*100.0/ntot);

     printf("block special = %7ld, %5.2f %%\n", nblk,

     nblk*100.0/ntot);

     printf("char special = %7ld, %5.2f %%\n", nchr,

     nchr*100.0/ntot);

     printf("FIFOs         = %7ld, %5.2f %%\n", nfifo,

     nfifo*100.0/ntot);

     printf("symbolic links = %7ld, %5.2f %%\n", nslink,

     nslink*100.0/ntot);

     printf("sockets       = %7ld, %5.2f %%\n", nsock,

     nsock*100.0/ntot);

     exit(ret);

}

/*                         hierarchy, starting       at "pathname".
 * Descend through the     is called for every       file.
 * The caller's func()
 */                         /* file other than       directory */
                            /* directory */
#define FTW_F 1
#define FTW_D 2
Section 4.22                                        Reading Directories 133

#define FTW_DNR 3          /* directory that can't be read */
#define FTW_NS 4           /* file that we can't stat */

static char *fullpath;               /* contains full pathname for every file */
static size_t pathlen;

static int                           /* we return whatever func() returns */

myftw(char *pathname, Myfunc *func)

{

              fullpath = path_alloc(&pathlen); /* malloc PATH_MAX+1 bytes */

                                                    /* (Figure 2.16) */

              if (pathlen <= strlen(pathname)) {

                   pathlen = strlen(pathname) * 2;

                   if ((fullpath = realloc(fullpath, pathlen)) == NULL)

                   err_sys("realloc failed");

              }

              strcpy(fullpath, pathname);

              return(dopath(func));

}

/*

* Descend through the hierarchy, starting at "fullpath".

* If "fullpath" is anything other than a directory, we lstat() it,

* call func(), and return. For a directory, we call ourself

* recursively for each name in the directory.

*/

static int                           /* we return whatever func() returns */

dopath(Myfunc* func)

{

              struct stat  statbuf;

              struct dirent *dirp;

              DIR          *dp;

              int          ret, n;

              if (lstat(fullpath, &statbuf) < 0) /* stat error */
                     return(func(fullpath, &statbuf, FTW_NS));

              if (S_ISDIR(statbuf.st_mode) == 0) /* not a directory */
                     return(func(fullpath, &statbuf, FTW_F));

              /*
               * It's a directory. First call func() for the directory,
               * then process each filename in the directory.
               */

              if ((ret = func(fullpath, &statbuf, FTW_D)) != 0)
                     return(ret);

              n = strlen(fullpath);
              if (n + NAME_MAX + 2 > pathlen) { /* expand path buffer */

                     pathlen *= 2;
                     if ((fullpath = realloc(fullpath, pathlen)) == NULL)

                            err_sys("realloc failed");
              }
              fullpath[n++] = '/';
134 Files and Directories                                                               Chapter 4

   fullpath[n] = 0;

   if ((dp = opendir(fullpath)) == NULL) /* can't read directory */
          return(func(fullpath, &statbuf, FTW_DNR));

   while ((dirp = readdir(dp)) != NULL) {

      if (strcmp(dirp->d_name, ".") == 0 ||

            strcmp(dirp->d_name, "..") == 0)

                           continue;  /* ignore dot and dot-dot */

      strcpy(&fullpath[n], dirp->d_name); /* append name after "/" */

      if ((ret = dopath(func)) != 0)          /* recursive */

            break; /* time to leave */

   }

   fullpath[n-1] = 0; /* erase everything from slash onward */

       if (closedir(dp) < 0)
              err_ret("can't close directory %s", fullpath);

       return(ret);
}

static int

myfunc(const char *pathname, const struct stat *statptr, int type)

{

   switch (type) {

   case FTW_F:

      switch (statptr->st_mode & S_IFMT) {

      case S_IFREG: nreg++;           break;

      case S_IFBLK: nblk++;           break;

      case S_IFCHR: nchr++;           break;

      case S_IFIFO: nfifo++; break;

      case S_IFLNK: nslink++; break;

      case S_IFSOCK: nsock++; break;

      case S_IFDIR: /* directories should have type = FTW_D */

            err_dump("for S_IFDIR for %s", pathname);

      }

      break;

   case FTW_D:

      ndir++;

      break;

   case FTW_DNR:

      err_ret("can't read directory %s", pathname);

      break;

   case FTW_NS:

      err_ret("stat error for %s", pathname);

      break;

   default:

      err_dump("unknown type %d for pathname %s", type, pathname);

   }

   return(0);

}

            Figure 4.22 Recursively descend a directory hierarchy, counting file types
Section 4.23  chdir, fchdir, and getcwd Functions 135

                To illustrate the ftw and nftw functions, we have provided more generality in this
          program than needed. For example, the function myfunc always returns 0, even
          though the function that calls it is prepared to handle a nonzero return.

                For additional information on descending through a file system and using this
          technique in many standard UNIX System commands--find, ls, tar, and so
          on--refer to Fowler, Korn, and Vo [1989].

4.23 chdir, fchdir, and getcwd Functions
```
- `Bash` -- `sed -n '8680,8867p' /tmp/apue/full.txt`
```
4.24  Device Special Files

      The two fields st_dev and st_rdev are often confused. We'll need to use these fields
      in Section 18.9 when we write the ttyname function. The rules for their use are simple.

           � Every file system is known by its major and minor device numbers, which are
               encoded in the primitive system data type dev_t. The major number identifies
               the device driver and sometimes encodes which peripheral board to
               communicate with; the minor number identifies the specific subdevice. Recall
               from Figure 4.13 that a disk drive often contains several file systems. Each file
               system on the same disk drive would usually have the same major number, but
               a different minor number.
138 Files and Directories                       Chapter 4

         � We can usually access the major and minor device numbers through two macros
             defined by most implementations: major and minor. Consequently, we don't
             care how the two numbers are stored in a dev_t object.

                             Early systems stored the device number in a 16-bit integer, with 8 bits for the major
                             number and 8 bits for the minor number. FreeBSD 8.0 and Mac OS X 10.6.8 use a 32-bit
                             integer, with 8 bits for the major number and 24 bits for the minor number. On 32-bit
                             systems, Solaris 10 uses a 32-bit integer for dev_t, with 14 bits designated as the major
                             number and 18 bits designated as the minor number. On 64-bit systems, Solaris 10
                             represents dev_t as a 64-bit integer, with 32 bits for each number. On Linux 3.2.0,
                             although dev_t is a 64-bit integer, only 12 bits are used for the major number and 20 bits
                             are used for the minor number.

                             POSIX.1 states that the dev_t type exists, but doesn't define what it contains or how to
                             get at its contents. The macros major and minor are defined by most implementations.
                             Which header they are defined in depends on the system. They can be found in
                             <sys/types.h> on BSD-based systems. Solaris defines their function prototypes in
                             <sys/mkdev.h>, because the macro definitions in <sys/sysmacros.h> are considered
                             obsolete in Solaris. Linux defines these macros in <sys/sysmacros.h>, which is
                             included by <sys/types.h>.

         � The st_dev value for every filename on a system is the device number of the
             file system containing that filename and its corresponding i-node.

         � Only character special files and block special files have an st_rdev value. This
             value contains the device number for the actual device.

Example

The program in Figure 4.25 prints the device number for each command-line argument.
Additionally, if the argument refers to a character special file or a block special file, the
st_rdev value for the special file is printed.

#include "apue.h"
#ifdef SOLARIS
#include <sys/mkdev.h>
#endif

int

main(int argc, char *argv[])

{

         int               i;

         struct stat buf;

         for (i = 1; i < argc; i++) {
                printf("%s: ", argv[i]);
                if (stat(argv[i], &buf) < 0) {
                       err_ret("stat error");
                       continue;
                }

              printf("dev = %d/%d", major(buf.st_dev), minor(buf.st_dev));
Section 4.24                                               Device Special Files 139

              if (S_ISCHR(buf.st_mode) || S_ISBLK(buf.st_mode)) {
                     printf(" (%s) rdev = %d/%d",
                                    (S_ISCHR(buf.st_mode)) ? "character" : "block",
                                    major(buf.st_rdev), minor(buf.st_rdev));

              }
              printf("\n");
       }

       exit(0);
}

                            Figure 4.25 Print st_dev and st_rdev values

Running this program on Linux gives us the following output:

              $ ./a.out / /home/sar /dev/tty[01]

              /: dev = 8/3

              /home/sar: dev = 8/4

              /dev/tty0: dev = 0/5 (character) rdev = 4/0

              /dev/tty1: dev = 0/5 (character) rdev = 4/1

              $ mount               which directories are mounted on which devices?

              /dev/sda3 on / type ext3 (rw,errors=remount-ro,commit=0)

              /dev/sda4 on /home type ext3 (rw,commit=0)

              $ ls -l /dev/tty[01] /dev/sda[34]

              brw-rw---- 1 root     8, 3 2011-07-01 11:08 /dev/sda3

              brw-rw---- 1 root     8, 4 2011-07-01 11:08 /dev/sda4

              crw--w---- 1 root     4, 0 2011-07-01 11:08 /dev/tty0

              crw------- 1 root     4, 1 2011-07-01 11:08 /dev/tty1

The first two arguments to the program are directories (/ and /home/sar), and the
next two are the device names /dev/tty[01]. (We use the shell's regular expression
language to shorten the amount of typing we need to do. The shell will expand the
string /dev/tty[01] to /dev/tty0 /dev/tty1.)

     We expect the devices to be character special files. The output from the program
shows that the root directory has a different device number than does the /home/sar
directory, which indicates that they are on different file systems. Running the mount(1)
command verifies this.

     We then use ls to look at the two disk devices reported by mount and the two
terminal devices. The two disk devices are block special files, and the two terminal
devices are character special files. (Normally, the only types of devices that are block
special files are those that can contain random-access file systems--disk drives, floppy
disk drives, and CD-ROMs, for example. Some older UNIX systems supported
magnetic tapes for file systems, but this was never widely used.)

     Note that the filenames and i-nodes for the two terminal devices (st_dev) are on
device 0/5--the devtmpfs pseudo file system, which implements the /dev--but that
their actual device numbers are 4/0 and 4/1.
140 Files and Directories                                                         Chapter 4

4.25  Summary of File Access Permission Bits

      We've covered all the file access permission bits, some of which serve multiple
      purposes. Figure 4.26 summarizes these permission bits and their interpretation when
      applied to a regular file and a directory.

      Constant   Description            Effect on regular file                    Effect on directory
      S_ISUID   set-user-ID
      S_ISGID   set-group-ID  set effective user ID on execution    (not used)
                              if group-execute set, then set        set group ID of new files created in
      S_ISVTX sticky bit
      S_IRUSR user-read           effective group ID on execution;      directory to group ID of directory
                                  otherwise, enable mandatory
                                  record locking (if supported)     restrict removal and renaming of files in
                              control caching of file contents          directory
                                  (if supported)
                              user permission to read file          user permission to read directory
                                                                        entries
      S_IWUSR user-write      user permission to write file
                                                                    user permission to remove and create
      S_IXUSR user-execute user permission to execute file              files in directory

      S_IRGRP group-read      group permission to read file         user permission to search for given
                                                                        pathname in directory
      S_IWGRP group-write     group permission to write file
                                                                    group permission to read directory
      S_IXGRP group-execute group permission to execute file            entries

      S_IROTH other-read      other permission to read file         group permission to remove and create
                                                                        files in directory
      S_IWOTH other-write     other permission to write file
                                                                    group permission to search for given
      S_IXOTH other-execute other permission to execute file            pathname in directory

                                                                    other permission to read directory
                                                                        entries

                                                                    other permission to remove and create
                                                                        files in directory

                                                                    other permission to search for given
                                                                        pathname in directory

                              Figure 4.26 Summary of file access permission bits

      The final nine constants can also be grouped into threes, as follows:

            S_IRWXU = S_IRUSR | S_IWUSR | S_IXUSR
            S_IRWXG = S_IRGRP | S_IWGRP | S_IXGRP
            S_IRWXO = S_IROTH | S_IWOTH | S_IXOTH

4.26 Summary
```
- `Bash` -- `grep -n "^8\.1[1-8] " /tmp/apue/full.txt`
```
409:8.11         Changing User IDs and Group IDs 255
411:8.12         Interpreter Files 260
413:8.13         system Function 264
415:8.14         Process Accounting 269
417:8.15         User Identification 275
419:8.16         Process Scheduling 276
421:8.17         Process Times 280
423:8.18         Summary 282
15047:8.11 Changing User IDs and Group IDs
15292:8.12  Interpreter Files
15548:8.13  system Function
15830:8.14 Process Accounting
16208:8.15 User Identification
16246:8.16 Process Scheduling
16478:8.17 Process Times
16657:8.18 Summary
```
- `Bash` -- `sed -n '15047,15548p' /tmp/apue/full.txt`
```
8.11 Changing User IDs and Group IDs

          In the UNIX System, privileges, such as being able to change the system's notion of the
          current date, and access control, such as being able to read or write a particular file, are
          based on user and group IDs. When our programs need additional privileges or need
          to gain access to resources that they currently aren't allowed to access, they need to
          change their user or group ID to an ID that has the appropriate privilege or access.
          Similarly, when our programs need to lower their privileges or prevent access to certain
          resources, they do so by changing either their user ID or group ID to an ID without the
          privilege or ability access to the resource.
256 Process Control     Chapter 8

     In general, we try to use the least-privilege model when we design our applications.
According to this model, our programs should use the least privilege necessary to
accomplish any given task. This reduces the risk that security might be compromised
by a malicious user trying to trick our programs into using their privileges in
unintended ways.

     We can set the real user ID and effective user ID with the setuid function.
Similarly, we can set the real group ID and the effective group ID with the setgid
function.

#include <unistd.h>
int setuid(uid_t uid);
int setgid(gid_t gid);

                        Both return: 0 if OK, -1 on error

There are rules for who can change the IDs. Let's consider only the user ID for now.
(Everything we describe for the user ID also applies to the group ID.)

1. If the process has superuser privileges, the setuid function sets the real user
    ID, effective user ID, and saved set-user-ID to uid.

2. If the process does not have superuser privileges, but uid equals either the real
    user ID or the saved set-user-ID, setuid sets only the effective user ID to uid.
    The real user ID and the saved set-user-ID are not changed.

3. If neither of these two conditions is true, errno is set to EPERM and -1 is
    returned.

Here, we are assuming that _POSIX_SAVED_IDS is true. If this feature isn't provided,
then delete all preceding references to the saved set-user-ID.

The saved IDs are a mandatory feature in the 2001 version of POSIX.1. They were optional in
older versions of POSIX. To see whether an implementation supports this feature, an
application can test for the constant _POSIX_SAVED_IDS at compile time or call sysconf
with the _SC_SAVED_IDS argument at runtime.

We can make a few statements about the three user IDs that the kernel maintains.

1. Only a superuser process can change the real user ID. Normally, the real user
    ID is set by the login(1) program when we log in and never changes. Because
    login is a superuser process, it sets all three user IDs when it calls setuid.

2. The effective user ID is set by the exec functions only if the set-user-ID bit is set
    for the program file. If the set-user-ID bit is not set, the exec functions leave the
    effective user ID as its current value. We can call setuid at any time to set the
    effective user ID to either the real user ID or the saved set-user-ID. Naturally,
    we can't set the effective user ID to any random value.

3. The saved set-user-ID is copied from the effective user ID by exec. If the file's
    set-user-ID bit is set, this copy is saved after exec stores the effective user ID
    from the file's user ID.
Section 8.11                                    Changing User IDs and Group IDs 257

Figure 8.18 summarizes the various ways these three user IDs can be changed.

         ID                               exec                                 setuid(uid)
                                                                    superuser unprivileged user
real user ID       set-user-ID bit off          set-user-ID bit on
effective user ID
                   unchanged              unchanged                 set to uid  unchanged
saved set-user ID  unchanged              set from user ID of       set to uid  set to uid

                   copied from effective      program file          set to uid unchanged
                       user ID            copied from effective

                                              user ID

                   Figure 8.18 Ways to change the three user IDs

Note that we can obtain only the current value of the real user ID and the effective user
ID with the functions getuid and geteuid from Section 8.2. We have no portable way
to obtain the current value of the saved set-user-ID.

                    FreeBSD 8.0 and LINUX 3.2.0 provide the getresuid and getresgid functions, which can
                    be used to get the saved set-user-ID and saved set-group-ID, respectively.

setreuid and setregid Functions

          Historically, BSD supported the swapping of the real user ID and the effective user ID
          with the setreuid function.

                  #include <unistd.h>

                  int setreuid(uid_t ruid, uid_t euid);

                  int setregid(gid_t rgid, gid_t egid);

                                                                                              Both return: 0 if OK, -1 on error

          We can supply a value of -1 for any of the arguments to indicate that the corresponding
          ID should remain unchanged.

                The rule is simple: an unprivileged user can always swap between the real user ID
          and the effective user ID. This allows a set-user-ID program to swap to the user's
          normal permissions and swap back again later for set-user-ID operations. When the
          saved set-user-ID feature was introduced with POSIX.1, the rule was enhanced to also
          allow an unprivileged user to set its effective user ID to its saved set-user-ID.

                                  Both setreuid and setregid are included in the XSI option in POSIX.1. As such, all UNIX
                                  System implementations are expected to provide support for them.

                                  4.3BSD didn't have the saved set-user-ID feature described earlier; it used setreuid and
                                  setregid instead. This allowed an unprivileged user to swap back and forth between the
                                  two values. Be aware, however, that when programs that used this feature spawned a shell,
                                  they had to set the real user ID to the normal user ID before the exec. If they didn't do this,
                                  the real user ID could be privileged (from the swap done by setreuid) and the shell process
                                  could call setreuid to swap the two and assume the permissions of the more privileged user.
                                  As a defensive programming measure to solve this problem, programs set both the real user ID
                                  and the effective user ID to the normal user ID before the call to exec in the child.
258 Process Control                                                                          Chapter 8

seteuid and setegid Functions

POSIX.1 includes the two functions seteuid and setegid. These functions are
similar to setuid and setgid, but only the effective user ID or effective group ID is
changed.

#include <unistd.h>
int seteuid(uid_t uid);
int setegid(gid_t gid);

                                                               Both return: 0 if OK, -1 on error

An unprivileged user can set its effective user ID to either its real user ID or its saved
set-user-ID. For a privileged user, only the effective user ID is set to uid. (This behavior
differs from that of the setuid function, which changes all three user IDs.)

     Figure 8.19 summarizes all the functions that we've described here that modify the
three user IDs.

         superuser                             superuser                           superuser
setreuid(ruid, euid)                         setuid(uid)                        seteuid(uid)

                              euideuid  uid               uid                uid
          ruid
                                             uid

  real               unprivileged            effective         unprivileged                     saved
user ID               setreuid               user ID            setreuid                     set-user-ID

                                                                  exec of
                                                                set-user-ID

                          unprivileged                              unprivileged
                     setuid or seteuid                         setuid or seteuid

                     Figure 8.19 Summary of all the functions that set the various user IDs

Group IDs

          Everything that we've said so far in this section also applies in a similar fashion to
          group IDs. The supplementary group IDs are not affected by setgid, setregid, or
          setegid.
Section 8.11  Changing User IDs and Group IDs 259

Example

          To see the utility of the saved set-user-ID feature, let's examine the operation of a
          program that uses it. We'll look at the at(1) program, which we can use to schedule
          commands to be run at some time in the future.

                                  On Linux 3.2.0, the at program is installed set-user-ID to user daemon. On FreeBSD 8.0, Mac
                                  OS X 10.6.8, and Solaris 10, the at program is installed set-user-ID to user root. This allows
                                  the at command to write privileged files owned by the daemon that will run the commands
                                  on behalf of the user running the at command. On Linux 3.2.0, the programs are run by the
                                  atd(8) daemon. On FreeBSD 8.0 and Solaris 10, the programs are run by the cron(1M)
                                  daemon. On Mac OS X 10.6.8, the programs are run by the launchd(8) daemon.

                To prevent being tricked into running commands that we aren't allowed to run, or
          reading or writing files that we aren't allowed to access, the at command and the
          daemon that ultimately runs the commands on our behalf have to switch between sets
          of privileges: ours and those of the daemon. The following steps take place.

                1. Assuming that the at program file is owned by root and has its set-user-ID bit
                     set, when we run it, we have

                                       real user ID = our user ID (unchanged)
                                 effective user ID = root
                                saved set-user-ID = root

                2. The first thing the at command does is reduce its privileges so that it runs with
                     our privileges. It calls the seteuid function to set the effective user ID to our
                     real user ID. After this, we have

                                       real user ID = our user ID (unchanged)
                                 effective user ID = our user ID
                                saved set-user-ID = root (unchanged)

                3. The at program runs with our privileges until it needs to access the
                     configuration files that control which commands are to be run and the time at
                     which they need to run. These files are owned by the daemon that will run the
                     commands for us. The at command calls seteuid to set the effective user ID
                     to root. This call is allowed because the argument to seteuid equals the
                     saved set-user-ID. (This is why we need the saved set-user-ID.) After this, we
                     have

                                       real user ID = our user ID (unchanged)
                                 effective user ID = root
                                saved set-user-ID = root (unchanged)

                     Because the effective user ID is root, file access is allowed.

                4. After the files are modified to record the commands to be run and the time at
                     which they are to be run, the at command lowers its privileges by calling
260 Process Control  Chapter 8

                seteuid to set its effective user ID to our user ID. This prevents any accidental
                misuse of privilege. At this point, we have

                                   real user ID = our user ID (unchanged)
                            effective user ID = our user ID
                           saved set-user-ID = root (unchanged)

           5. The daemon starts out running with root privileges. To run commands on our
                behalf, the daemon calls fork and the child calls setuid to change its user ID
                to our user ID. Because the child is running with root privileges, this changes
                all of the IDs. We have

                                   real user ID = our user ID
                            effective user ID = our user ID
                           saved set-user-ID = our user ID

                Now the daemon can safely execute commands on our behalf, because it can
                access only the files to which we normally have access. We have no additional
                permissions.

      By using the saved set-user-ID in this fashion, we can use the extra privileges granted to
      us by the set-user-ID of the program file only when we need elevated privileges. Any
      other time, however, the process runs with our normal permissions. If we weren't able
      to switch back to the saved set-user-ID at the end, we might be tempted to retain the
      extra permissions the whole time we were running (which is asking for trouble).

8.12  Interpreter Files

      All contemporary UNIX systems support interpreter files. These files are text files that
      begin with a line of the form

            #! pathname [ optional-argument ]

      The space between the exclamation point and the pathname is optional. The most
      common of these interpreter files begin with the line

            #!/bin/sh

      The pathname is normally an absolute pathname, since no special operations are
      performed on it (i.e., PATH is not used). The recognition of these files is done within the
      kernel as part of processing the exec system call. The actual file that gets executed by
      the kernel is not the interpreter file, but rather the file specified by the pathname on the
      first line of the interpreter file. Be sure to differentiate between the interpreter file--a
      text file that begins with #!--and the interpreter, which is specified by the pathname on
      the first line of the interpreter file.

           Be aware that systems place a size limit on the first line of an interpreter file. This
      limit includes the #!, the pathname, the optional argument, the terminating newline, and
      any spaces.

                          On FreeBSD 8.0, this limit is 4,097 bytes. On Linux 3.2.0, the limit is 128 bytes. Mac OS X
                          10.6.8 supports a limit of 513 bytes, whereas Solaris 10 places the limit at 1,024 bytes.
Section 8.12                                                                        Interpreter Files 261

Example

Let's look at an example to see what the kernel does with the arguments to the exec
function when the file being executed is an interpreter file and the optional argument on
the first line of the interpreter file. The program in Figure 8.20 execs an interpreter file.

#include "apue.h"
#include <sys/wait.h>

int                     pid;
main(void)
{

       pid_t

              if ((pid = fork()) < 0) {

                 err_sys("fork error");

              } else if (pid == 0) {             /* child */

                 if (execl("/home/sar/bin/testinterp",

                              "testinterp", "myarg1", "MY ARG2", (char *)0) < 0)

                        err_sys("execl error");

              }

              if (waitpid(pid, NULL, 0) < 0) /* parent */

                 err_sys("waitpid error");

              exit(0);

}

                              Figure 8.20 A program that execs an interpreter file

The following shows the contents of the one-line interpreter file that is executed and the
result from running the program in Figure 8.20:

      $ cat /home/sar/bin/testinterp
      #!/home/sar/bin/echoarg foo
      $ ./a.out
      argv[0]: /home/sar/bin/echoarg
      argv[1]: foo
      argv[2]: /home/sar/bin/testinterp
      argv[3]: myarg1
      argv[4]: MY ARG2

The program echoarg (the interpreter) just echoes each of its command-line
arguments. (This is the program from Figure 7.4.) Note that when the kernel execs the
interpreter (/home/sar/bin/echoarg), argv[0] is the pathname of the interpreter,
argv[1] is the optional argument from the interpreter file, and the remaining
arguments are the pathname (/home/sar/bin/testinterp) and the second and third
arguments from the call to execl in the program shown in Figure 8.20 (myarg1 and MY
ARG2). Both argv[1] and argv[2] from the call to execl have been shifted right two
positions. Note that the kernel takes the pathname from the execl call instead of the
first argument (testinterp), on the assumption that the pathname might contain more
information than the first argument.
262 Process Control                                                     Chapter 8

Example

A common use for the optional argument following the interpreter pathname is to
specify the -f option for programs that support this option. For example, an awk(1)
program can be executed as

      awk -f myfile

which tells awk to read the awk program from the file myfile.

         Systems derived from UNIX System V often include two versions of the awk language. On
         these systems, awk is often called ``old awk'' and corresponds to the original version
         distributed with Version 7. In contrast, nawk (new awk) contains numerous enhancements and
         corresponds to the language described in Aho, Kernighan, and Weinberger [1988]. This newer
         version provides access to the command-line arguments, which we need for the example that
         follows. Solaris 10 provides both versions.

         The awk program is one of the utilities included by POSIX in its 1003.2 standard, which is now
         part of the base POSIX.1 specification in the Single UNIX Specification. This utility is also
         based on the language described in Aho, Kernighan, and Weinberger [1988].

         The version of awk in Mac OS X 10.6.8 is based on the Bell Laboratories version, which has
         been placed in the public domain. FreeBSD 8.0 and some Linux distributions ship with GNU
         awk, called gawk, which is linked to the name awk. gawk conforms to the POSIX standard, but
         also includes other extensions. Because they are more up-to-date, gawk and the version of awk
         from Bell Laboratories are preferred to either nawk or old awk. (The Bell Labs version of awk
         is available at http://cm.bell-labs.com/cm/cs/awkbook/index.html.)

Using the -f option with an interpreter file lets us write

         #!/bin/awk -f
         (awk program follows in the interpreter file)

For example, Figure 8.21 shows /usr/local/bin/awkexample (an interpreter file).

#!/usr/bin/awk -f                                       ARGV[i]
# Note: on Solaris, use nawk instead
BEGIN {

       for (i = 0; i < ARGC; i++)
              printf "ARGV[%d] = %s\n", i,

       exit
}

                     Figure 8.21 An awk program as an interpreter file

If one of the path prefixes is /usr/local/bin, we can execute the program in
Figure 8.21 (assuming that we've turned on the execute bit for the file) as

      $ awkexample file1 FILENAME2 f3
      ARGV[0] = awk
      ARGV[1] = file1
      ARGV[2] = FILENAME2
      ARGV[3] = f3
Section 8.12                                               Interpreter Files 263

When /bin/awk is executed, its command-line arguments are

              /bin/awk -f /usr/local/bin/awkexample file1 FILENAME2 f3

The pathname of the interpreter file (/usr/local/bin/awkexample) is passed to the
interpreter. The filename portion of this pathname (what we typed to the shell) isn't
adequate, because the interpreter (/bin/awk in this example) can't be expected to use
the PATH variable to locate files. When it reads the interpreter file, awk ignores the first
line, since the pound sign is awk's comment character.

     We can verify these command-line arguments with the following commands:

              $ /bin/su                                become superuser
                                                       enter superuser password
              Password:                                save the original program
                                                       and replace it temporarily
              # mv /usr/bin/awk /usr/bin/awk.save      suspend the superuser shell
                                                       using job control
              # cp /home/sar/bin/echoarg /usr/bin/awk
                                                       resume superuser shell using job control
              # suspend                                restore the original program
                                                       and exit the superuser shell
              [1] + Stopped       /bin/su

              $ awkexample file1 FILENAME2 f3

              argv[0]: /bin/awk

              argv[1]: -f

              argv[2]: /usr/local/bin/awkexample

              argv[3]: file1

              argv[4]: FILENAME2

              argv[5]: f3

              $ fg

              /bin/su

              # mv /usr/bin/awk.save /usr/bin/awk

              # exit

In this example, the -f option for the interpreter is required. As we said, this tells awk
where to look for the awk program. If we remove the -f option from the interpreter
file, an error message usually results when we try to run it. The exact text of the
message varies, depending on where the interpreter file is stored and whether the
remaining arguments represent existing files. This is because the command-line
arguments in this case are

              /bin/awk /usr/local/bin/awkexample file1 FILENAME2 f3

and awk is trying to interpret the string /usr/local/bin/awkexample as an awk
program. If we couldn't pass at least a single optional argument to the interpreter (-f
in this case), these interpreter files would be usable only with the shells.

     Are interpreter files required? Not really. They provide an efficiency gain for the
user at some expense in the kernel (since it's the kernel that recognizes these files).
Interpreter files are useful for the following reasons.

     1. They hide that certain programs are scripts in some other language. For
          example, to execute the program in Figure 8.21, we just say

                 awkexample optional-arguments
264 Process Control  Chapter 8

                instead of needing to know that the program is really an awk script that we
                would otherwise have to execute as

                       awk -f awkexample optional-arguments

           2. Interpreter scripts provide an efficiency gain. Consider the previous example
                again. We could still hide that the program is an awk script, by wrapping it in a
                shell script:

                       awk 'BEGIN {
                              for (i = 0; i < ARGC; i++)
                                      printf "ARGV[%d] = %s\n", i, ARGV[i]
                              exit

                       }' $*

                The problem with this solution is that more work is required. First, the shell
                reads the command and tries to execlp the filename. Because the shell script is
                an executable file but isn't a machine executable, an error is returned and
                execlp assumes that the file is a shell script (which it is). Then /bin/sh is
                executed with the pathname of the shell script as its argument. The shell
                correctly runs our script, but to run the awk program, the shell does a fork,
                exec, and wait. Thus there is more overhead involved in replacing an
                interpreter script with a shell script.

           3. Interpreter scripts let us write shell scripts using shells other than /bin/sh.
                When it finds an executable file that isn't a machine executable, execlp has to
                choose a shell to invoke, and it always uses /bin/sh. Using an interpreter
                script, however, we can simply write

                       #!/bin/csh
                       (C shell script follows in the interpreter file)

                Again, we could wrap all of this in a /bin/sh script (that invokes the C shell),
                as we described earlier, but more overhead is required.

      None of this would work as we've shown here if the three shells and awk didn't use the
      pound sign as their comment character.

8.13  system Function
```
- `Bash` -- `sed -n '15548,15830p' /tmp/apue/full.txt`
```
8.13  system Function

      It is convenient to execute a command string from within a program. For example,
      assume that we want to put a time-and-date stamp into a certain file. We could use the
      functions described in Section 6.10 to do this: call time to get the current calendar time,
      then call localtime to convert it to a broken-down time, then call strftime to format
      the result, and finally write the result to the file. It is much easier, however, to say

            system("date > file");

      ISO C defines the system function, but its operation is strongly system dependent.
      POSIX.1 includes the system interface, expanding on the ISO C definition to describe
      its behavior in a POSIX environment.
Section 8.13                                      system Function 265

              #include <stdlib.h>
              int system(const char *cmdstring);

                                                  Returns: (see below)

     If cmdstring is a null pointer, system returns nonzero only if a command processor
is available. This feature determines whether the system function is supported on a
given operating system. Under the UNIX System, system is always available.

     Because system is implemented by calling fork, exec, and waitpid, there are
three types of return values.

     1. If either the fork fails or waitpid returns an error other than EINTR, system
          returns -1 with errno set to indicate the error.

     2. If the exec fails, implying that the shell can't be executed, the return value is as
          if the shell had executed exit(127).

     3. Otherwise, all three functions--fork, exec, and waitpid--succeed, and the
          return value from system is the termination status of the shell, in the format
          specified for waitpid.

                           Some older implementations of system returned an error (EINTR) if waitpid was
                           interrupted by a caught signal. Because there is no strategy that an application can use to
                           recover from this type of error (the process ID of the child is hidden from the caller),
                           POSIX later added the requirement that system not return an error in this case. (We
                           discuss interrupted system calls in Section 10.5.)

     Figure 8.22 shows an implementation of the system function. The one feature that
it doesn't handle is signals. We'll update this function with signal handling in
Section 10.18.

     The shell's -c option tells it to take the next command-line argument--cmdstring, in
this case--as its command input instead of reading from standard input or from a given
file. The shell parses this null-terminated C string and breaks it up into separate
command-line arguments for the command. The actual command string that is passed
to the shell can contain any valid shell commands. For example, input and output
redirection using < and > can be used.

     If we didn't use the shell to execute the command, but tried to execute the
command ourself, it would be more difficult. First, we would want to call execlp,
instead of execl, to use the PATH variable, like the shell. We would also have to break
up the null-terminated C string into separate command-line arguments for the call to
execlp. Finally, we wouldn't be able to use any of the shell metacharacters.

     Note that we call _exit instead of exit. We do this to prevent any standard I/O
buffers, which would have been copied from the parent to the child across the fork,
from being flushed in the child.
266 Process Control                                                               Chapter 8

#include             <sys/wait.h>
#include             <errno.h>
#include             <unistd.h>

int

system(const char *cmdstring)      /* version without signal handling */

{

     pid_t pid;

     int             status;

     if (cmdstring == NULL)

          return(1);            /* always a command processor with UNIX */

     if ((pid = fork()) < 0) {

          status = -1; /* probably out of processes */

     } else if (pid == 0) {                 /* child */

          execl("/bin/sh", "sh", "-c", cmdstring, (char *)0);

          _exit(127);           /* execl error */

     } else {                               /* parent */

          while (waitpid(pid, &status, 0) < 0) {

                     if (errno != EINTR) {

                        status = -1; /* error other than EINTR from waitpid() */

                        break;

                     }

          }

     }

       return(status);
}

                        Figure 8.22 The system function, without signal handling

     We can test this version of system with the program shown in Figure 8.23. (The
pr_exit function was defined in Figure 8.5.) Running the program in Figure 8.23
gives us

     $ ./a.out

     Sat Feb 25 19:36:59 EST 2012

     normal termination, exit status = 0           for date
                                                   for nosuchcommand
     sh: nosuchcommand: command not found
                                                   for exit
     normal termination, exit status = 127

     sar             console Jan 1 14:59

     sar             ttys000 Feb 7 19:08

     sar             ttys001 Jan 15 15:28

     sar             ttys002 Jan 15 21:50

     sar             ttys003 Jan 21 16:02

     normal termination, exit status = 44

     The advantage in using system, instead of using fork and exec directly, is that
system does all the required error handling and (in our next version of this function in
Section 10.18) all the required signal handling.
Section 8.13                                                             system Function 267

#include "apue.h"
#include <sys/wait.h>

int           status;
main(void)
{

       int

              if ((status = system("date")) < 0)
                     err_sys("system() error");

              pr_exit(status);

              if ((status = system("nosuchcommand")) < 0)
                     err_sys("system() error");

              pr_exit(status);

              if ((status = system("who; exit 44")) < 0)
                     err_sys("system() error");

              pr_exit(status);

       exit(0);
}

                                Figure 8.23 Calling the system function

     Earlier systems, including SVR3.2 and 4.3BSD, didn't have the waitpid function
available. Instead, the parent waited for the child, using a statement such as

             while ((lastpid = wait(&status)) != pid && lastpid != -1)
                    ;

A problem occurs if the process that calls system has spawned its own children before
calling system. Because the while statement above keeps looping until the child that
was generated by system terminates, if any children of the process terminate before the
process identified by pid, then the process ID and termination status of these other
children are discarded by the while statement. Indeed, this inability to wait for a
specific child is one of the reasons given in the POSIX.1 Rationale for including the
waitpid function. We'll see in Section 15.3 that the same problem occurs with the
popen and pclose functions if the system doesn't provide a waitpid function.

Set-User-ID Programs

          What happens if we call system from a set-user-ID program? Doing so creates a
          security hole and should never be attempted. Figure 8.24 shows a simple program that
          just calls system for its command-line argument.
268 Process Control                                                              Chapter 8

#include "apue.h"

int

main(int argc, char *argv[])

{

     int             status;

     if (argc < 2)
            err_quit("command-line argument required");

     if ((status = system(argv[1])) < 0)
            err_sys("system() error");

     pr_exit(status);

       exit(0);
}

                     Figure 8.24 Execute the command-line argument using system

We'll compile this program into the executable file tsys.
     Figure 8.25 shows another simple program that prints its real and effective user IDs.

#include "apue.h"

int
main(void)
{

       printf("real uid = %d, effective uid = %d\n", getuid(), geteuid());
       exit(0);
}

                                            Figure 8.25 Print real and effective user IDs

We'll compile this program into the executable file printuids. Running both
programs gives us the following:

     $ tsys printuids                     normal execution, no special privileges

     real uid = 205, effective uid = 205

     normal termination, exit status = 0

     $ su                                 become superuser

     Password:                            enter superuser password

     # chown root tsys                    change owner

     # chmod u+s tsys                     make set-user-ID

     # ls -l tsys                         verify file's permissions and owner

     -rwsrwxr-x 1 root 7888 Feb 25 22:13 tsys

     # exit                               leave superuser shell

     $ tsys printuids

     real uid = 205, effective uid = 0    oops, this is a security hole

     normal termination, exit status = 0
Section 8.14  Process Accounting 269

The superuser permissions that we gave the tsys program are retained across the fork
and exec that are done by system.

                    Some implementations have closed this security hole by changing /bin/sh to reset the
                    effective user ID to the real user ID when they don't match. On these systems, the previous
                    example doesn't work as shown. Instead, the same effective user ID will be printed regardless
                    of the status of the set-user-ID bit on the program calling system.

     If it is running with special permissions--either set-user-ID or set-group-ID--and
wants to spawn another process, a process should use fork and exec directly, being
certain to change back to normal permissions after the fork, before calling exec. The
system function should never be used from a set-user-ID or a set-group-ID program.

                    One reason for this admonition is that system invokes the shell to parse the command string,
                    and the shell uses its IFS variable as the input field separator. Older versions of the shell
                    didn't reset this variable to a normal set of characters when invoked. As a result, a malicious
                    user could set IFS before system was called, causing system to execute a different program.

8.14 Process Accounting
```
- `Bash` -- `sed -n '15830,16657p' /tmp/apue/full.txt`
```
<persisted-output>
Output too large (33.5KB). Full output saved to: C:\Users\anant\.claude\projects\[REDACTED]\[REDACTED]\tool-results\b8g8fjvxm.txt

Preview (first 2KB):
8.14 Process Accounting

          Most UNIX systems provide an option to do process accounting. When enabled, the
          kernel writes an accounting record each time a process terminates. These accounting
          records typically contain a small amount of binary data with the name of the command,
          the amount of CPU time used, the user ID and group ID, the starting time, and so on.
          We'll take a closer look at these accounting records in this section, as it gives us a chance
          to look at processes again and to use the fread function from Section 5.9.

                                  Process accounting is not specified by any of the standards. Thus all the implementations have
                                  annoying differences. For example, the I/O counts maintained on Solaris 10 are in units of
                                  bytes, whereas FreeBSD 8.0 and Mac OS X 10.6.8 maintain units of blocks, although there is no
                                  distinction between different block sizes, making the counter effectively useless. Linux 3.2.0,
                                  on the other hand, doesn't try to maintain I/O statistics at all.

                                  Each implementation also has its own set of administrative commands to process raw
                                  accounting data. For example, Solaris provides runacct(1m) and acctcom(1), whereas
                                  FreeBSD provides the sa(8) command to process and summarize the raw accounting data.

                A function we haven't described (acct) enables and disables process accounting.
          The only use of this function is from the accton(8) command (which happens to be one
          of the few similarities among platforms). A superuser executes accton with a
          pathname argument to enable accounting. The accounting records are written to the
...
</persisted-output>
```
- `Read` -- `C:\Users\anant\.claude\projects\D---Anant-20-Progress-Documents-Jarvis\d25f538d-985d-4fa1-bd5a-07daac3a197b\tool-results\b8g8fjvxm.txt`
- `Bash` -- `sed -n '19449,19550p' /tmp/apue/full.txt`
```
10.8 Reliable-Signal Terminology and Semantics

          We need to define some of the terms used throughout our discussion of signals. First, a
          signal is generated for a process (or sent to a process) when the event that causes the
          signal occurs. The event could be a hardware exception (e.g., divide by 0), a software
          condition (e.g., an alarm timer expiring), a terminal-generated signal, or a call to the
          kill function. When the signal is generated, the kernel usually sets a flag of some
          form in the process table.

                We say that a signal is delivered to a process when the action for a signal is taken.
          During the time between the generation of a signal and its delivery, the signal is said to
          be pending.

                A process has the option of blocking the delivery of a signal. If a signal that is
          blocked is generated for a process, and if the action for that signal is either the default
          action or to catch the signal, then the signal remains pending for the process until the
          process either (a) unblocks the signal or (b) changes the action to ignore the signal. The
          system determines what to do with a blocked signal when the signal is delivered, not
          when it's generated. This allows the process to change the action for the signal before
          it's delivered. The sigpending function (Section 10.13) can be called by a process to
          determine which signals are blocked and pending.
336 Signals  Chapter  10

                What happens if a blocked signal is generated more than once before the process
          unblocks the signal? POSIX.1 allows the system to deliver the signal either once or
          more than once. If the system delivers the signal more than once, we say that the
          signals are queued. Most UNIX systems, however, do not queue signals unless they
          support the real-time extensions to POSIX.1. Instead, the UNIX kernel simply delivers
          the signal once.

                                  With SUSv4, the real-time signal functionality moved from the real-time extensions to the base
                                  specification. As time goes on, more systems will support queueing signals even if they don't
                                  support the real-time extensions. We discuss queueing signals further in Section 10.20.

                                  The manual pages for SVR2 claimed that the SIGCLD signal was queued while the process was
                                  executing its SIGCLD signal handler. Although this might have been true on a conceptual
                                  level, the actual implementation was different. Instead, the signal was regenerated by the
                                  kernel as we described in Section 10.7. In SVR3, the manual was changed to indicate that the
                                  SIGCLD signal was ignored while the process was executing its signal handler for SIGCLD.
                                  The SVR4 manual removed any mention of what happens to SIGCLD signals that are
                                  generated while a process is executing its SIGCLD signal handler.

                                  The SVR4 sigaction(2) manual page in AT&T [1990e] claims that the SA_SIGINFO flag
                                  (Figure 10.16) causes signals to be reliably queued. This is wrong. Apparently, this feature
                                  was partially implemented within the kernel, but it is not enabled in SVR4. Curiously, the
                                  SVID didn't make the same claims of reliable queuing.

                What happens if more than one signal is ready to be delivered to a process?
          POSIX.1 does not specify the order in which the signals are delivered to the process.
          The Rationale for POSIX.1 does suggest, however, that signals related to the current
          state of the process be delivered before other signals. (SIGSEGV is one such signal.)

                Each process has a signal mask that defines the set of signals currently blocked from
          delivery to that process. We can think of this mask as having one bit for each possible
          signal. If the bit is on for a given signal, that signal is currently blocked. A process can
          examine and change its current signal mask by calling sigprocmask, which we
          describe in Section 10.12.

                Since it is possible for the number of signals to exceed the number of bits in an
          integer, POSIX.1 defines a data type, called sigset_t, that holds a signal set. The
          signal mask, for example, is stored in one of these signal sets. We describe five
          functions that operate on signal sets in Section 10.11.

10.9 kill and raise Functions

          The kill function sends a signal to a process or a group of processes. The raise
          function allows a process to send a signal to itself.

                                  The raise function was originally defined by ISO C. POSIX.1 includes it to align itself with
                                  the ISO C standard, but POSIX.1 extends the specification of raise to deal with threads (we
                                  discuss how threads interact with signals in Section 12.8). Since ISO C does not deal with
                                  multiple processes, it could not define a function, such as kill, that requires a process ID
                                  argument.
Section 10.9  kill and raise Functions 337

      #include <signal.h>
      int kill(pid_t pid, int signo);
      int raise(int signo);

                                                                                  Both return: 0 if OK, -1 on error
The call

      raise(signo);
is equivalent to the call

      kill(getpid(), signo);
There are four different conditions for the pid argument to kill.

pid > 0       The signal is sent to the process whose process ID is pid.
pid == 0
              The signal is sent to all processes whose process group ID equals the
pid < 0       process group ID of the sender and for which the sender has permission
pid == -1     to send the signal. Note that the term all processes excludes an
              implementation-defined set of system processes. For most UNIX
              systems, this set of system processes includes the kernel processes and
              init (pid 1).

              The signal is sent to all processes whose process group ID equals the
              absolute value of pid and for which the sender has permission to send the
              signal. Again, the set of all processes excludes certain system processes,
              as described earlier.
```
- `Bash` -- `grep -n "^10\.10 alarm and pause" /tmp/apue/full.txt | tail -1`
```
19581:10.10 alarm and pause Functions
```
- `Bash` -- `sed -n '19581,19720p' /tmp/apue/full.txt`
```
10.10 alarm and pause Functions

The alarm function allows us to set a timer that will expire at a specified time in the
future. When the timer expires, the SIGALRM signal is generated. If we ignore or don't
catch this signal, its default action is to terminate the process.

#include <unistd.h>
unsigned int alarm(unsigned int seconds);

                                        Returns: 0 or number of seconds until previously set alarm

The seconds value is the number of clock seconds in the future when the signal should
be generated. When that time occurs, the signal is generated by the kernel, although
additional time could elapse before the process gets control to handle the signal,
because of processor scheduling delays.

             Earlier UNIX System implementations warned that the signal could also be sent up to 1 second
             early. POSIX.1 does not allow this behavior.

     There is only one of these alarm clocks per process. If, when we call alarm, a
previously registered alarm clock for the process has not yet expired, the number of
seconds left for that alarm clock is returned as the value of this function. That
previously registered alarm clock is replaced by the new value.

     If a previously registered alarm clock for the process has not yet expired and if the
seconds value is 0, the previous alarm clock is canceled. The number of seconds left for
that previous alarm clock is still returned as the value of the function.

     Although the default action for SIGALRM is to terminate the process, most processes
that use an alarm clock catch this signal. If the process then wants to terminate, it can
perform whatever cleanup is required before terminating. If we intend to catch
SIGALRM, we need to be careful to install its signal handler before calling alarm. If we
call alarm first and are sent SIGALRM before we can install the signal handler, our
process will terminate.

     The pause function suspends the calling process until a signal is caught.

#include <unistd.h>
int pause(void);

                                 Returns: -1 with errno set to EINTR
Section 10.10                    alarm and pause Functions 339

The only time pause returns is if a signal handler is executed and that handler returns.
In that case, pause returns -1 with errno set to EINTR.

Example

Using alarm and pause, we can put a process to sleep for a specified amount of time.
The sleep1 function in Figure 10.7 appears to do this (but it has problems, as we shall
see shortly).

#include       <signal.h>
#include       <unistd.h>

static void
sig_alrm(int signo)
{

       /* nothing to do, just return to wake up the pause */
}

unsigned int

sleep1(unsigned int seconds)

{

               if (signal(SIGALRM, sig_alrm) == SIG_ERR)

               return(seconds);

               alarm(seconds);  /* start the timer */

               pause();          /* next caught signal wakes us up */

               return(alarm(0)); /* turn off timer, return unslept time */

}

                         Figure 10.7 Simple, incomplete implementation of sleep

This function looks like the sleep function, which we describe in Section 10.19, but this
simple implementation has three problems.

     1. If the caller already has an alarm set, that alarm is erased by the first call to
          alarm. We can correct this by looking at alarm's return value. If the number
          of seconds until some previously set alarm is less than the argument, then we
          should wait only until the existing alarm expires. If the previously set alarm
          will go off after ours, then before returning we should reset this alarm to occur
          at its designated time in the future.

     2. We have modified the disposition for SIGALRM. If we're writing a function for
          others to call, we should save the disposition when our function is called and
          restore it when we're done. We can correct this by saving the return value from
          signal and resetting the disposition before our function returns.

     3. There is a race condition between the first call to alarm and the call to pause.
          On a busy system, it's possible for the alarm to go off and the signal handler to
          be called before we call pause. If that happens, the caller is suspended forever
          in the call to pause (assuming that some other signal isn't caught).
340 Signals                                                                     Chapter  10

Earlier implementations of sleep looked like our program, with problems 1 and 2
corrected as described. There are two ways to correct problem 3. The first uses
setjmp, which we show in the next example. The other uses sigprocmask and
sigsuspend, and we describe it in Section 10.19.

Example

The SVR2 implementation of sleep used setjmp and longjmp (Section 7.10) to avoid
the race condition described in problem 3 of the previous example. A simple version of
this function, called sleep2, is shown in Figure 10.8. (To reduce the size of this
example, we don't handle problems 1 and 2 described earlier.)

#include     <setjmp.h>
#include     <signal.h>
#include     <unistd.h>

static jmp_buf env_alrm;

static void
sig_alrm(int signo)
{

       longjmp(env_alrm, 1);
}

unsigned int

sleep2(unsigned int seconds)

{

         if (signal(SIGALRM, sig_alrm) == SIG_ERR)

             return(seconds);

         if (setjmp(env_alrm) == 0) {
```
- `Bash` -- `sed -n '20800,21050p' /tmp/apue/full.txt | grep -n "10\.1[5-8]" `
```
17:Section 10.16  sigsuspend Function 359
19:10.16 sigsuspend Function
139:Section 10.16                                            sigsuspend Function 361
```
- `Bash` -- `grep -n "^10\.15 sigsetjmp\|^10\.17 abort\|^10\.18  system" /tmp/apue/full.txt`
```
20626:10.15 sigsetjmp and siglongjmp Functions
21202:10.17 abort Function
```
- `Bash` -- `sed -n '20626,20800p' /tmp/apue/full.txt`
```
10.15 sigsetjmp and siglongjmp Functions

          In Section 7.10, we described the setjmp and longjmp functions, which can be used
          for nonlocal branching. The longjmp function is often called from a signal handler to
          return to the main loop of a program, instead of returning from the handler. We saw
          this approach in Figures 10.8 and 10.11.

                There is a problem in calling longjmp, however. When a signal is caught, the
          signal-catching function is entered, with the current signal automatically being added to
          the signal mask of the process. This prevents subsequent occurrences of that signal
          from interrupting the signal handler. If we longjmp out of the signal handler, what
          happens to the signal mask for the process?

                                  Under FreeBSD 8.0 and Mac OS X 10.6.8, setjmp and longjmp save and restore the signal
                                  mask. Linux 3.2.0 and Solaris 10, however, do not do this, although Linux supports an option
                                  to provide BSD behavior. FreeBSD and Mac OS X provide the functions _setjmp and
                                  _longjmp, which do not save and restore the signal mask.

                To allow either form of behavior, POSIX.1 does not specify the effect of setjmp and
          longjmp on signal masks. Instead, two new functions, sigsetjmp and siglongjmp,
          are defined by POSIX.1. These two functions should always be used when branching
          from a signal handler.
356 Signals                                                 Chapter  10

      #include <setjmp.h>

      int sigsetjmp(sigjmp_buf env, int savemask);

                       Returns: 0 if called directly, nonzero if returning from a call to siglongjmp

      void siglongjmp(sigjmp_buf env, int val);

The only difference between these functions and the setjmp and longjmp functions is
that sigsetjmp has an additional argument. If savemask is nonzero, then sigsetjmp
also saves the current signal mask of the process in env. When siglongjmp is called, if
the env argument was saved by a call to sigsetjmp with a nonzero savemask, then
siglongjmp restores the saved signal mask.

Example

The program in Figure 10.20 demonstrates how the signal mask that is installed by the
system when a signal handler is invoked automatically includes the signal being
caught. This program also illustrates the use of the sigsetjmp and siglongjmp
functions.

#include "apue.h"
#include <setjmp.h>
#include <time.h>

static void                           sig_usr1(int);
static void                           sig_alrm(int);
static sigjmp_buf                     jmpbuf;
static volatile sig_atomic_t          canjump;

int
main(void)
{

       if (signal(SIGUSR1, sig_usr1) == SIG_ERR)
              err_sys("signal(SIGUSR1) error");

       if (signal(SIGALRM, sig_alrm) == SIG_ERR)
              err_sys("signal(SIGALRM) error");

         pr_mask("starting main: ");    /* Figure 10.14 */

         if (sigsetjmp(jmpbuf, 1)) {

             pr_mask("ending main: ");

                exit(0);  /* now sigsetjmp() is OK */
         }
         canjump = 1;

       for ( ; ; )
              pause();

}

static void
sig_usr1(int signo)
Section 10.15                           sigsetjmp and siglongjmp Functions 357

{
       time_t starttime;

               if (canjump == 0)

               return;      /* unexpected signal, ignore */

               pr_mask("starting sig_usr1: ");

               alarm(3);                /* SIGALRM in 3 seconds */

               starttime = time(NULL);

               for ( ; ; )              /* busy wait for 5 seconds */

               if (time(NULL) > starttime + 5)

               break;

               pr_mask("finishing sig_usr1: ");

       canjump = 0;
       siglongjmp(jmpbuf, 1); /* jump back to main, don't return */
}

static void
sig_alrm(int signo)
{

       pr_mask("in sig_alrm: ");
}

               Figure 10.20 Example of signal masks, sigsetjmp, and siglongjmp

     This program demonstrates another technique that should be used whenever
siglongjmp is called from a signal handler. We set the variable canjump to a nonzero
value only after we've called sigsetjmp. This variable is examined in the signal
handler, and siglongjmp is called only if the flag canjump is nonzero. This technique
provides protection against the signal handler being called at some earlier or later time,
when the jump buffer hasn't been initialized by sigsetjmp. (In this trivial program,
we terminate quickly after the siglongjmp, but in larger programs, the signal handler
may remain installed long after the siglongjmp.) Providing this type of protection
usually isn't required with longjmp in normal C code (as opposed to a signal handler).
Since a signal can occur at any time, however, we need the added protection in a signal
handler.

     Here, we use the data type sig_atomic_t, which is defined by the ISO C standard
to be the type of variable that can be written without being interrupted. By this we
mean that a variable of this type should not extend across page boundaries on a system
with virtual memory and can be accessed with a single machine instruction, for
example. We always include the ISO type qualifier volatile for these data types as
well, since the variable is being accessed by two different threads of control: the main
function and the asynchronously executing signal handler. Figure 10.21 shows a
timeline for this program. We can divide Figure 10.21 into three parts: the left part
(corresponding to main), the center part (sig_usr1), and the right part (sig_alrm).
While the process is executing in the left part, its signal mask is 0 (no signals are
blocked). While executing in the center part, its signal mask is SIGUSR1. While
executing in the right part, its signal mask is SIGUSR1|SIGALRM.
358 Signals                                                                  Chapter      10

                   main                      sig_usr1

               signal()                      pr_mask()
               signal()                       alarm()
              pr_mask()                        time()
             sigsetjmp()                       time()
                pause()                        time()

                          SIGUSR1 delivered

                                                 SIGALRM delivered       sig_alrm
                                             return from signal handler
                                                                         pr_mask()
                                                                         return()

             sigsetjmp()                       pr_mask()
              pr_mask()                      siglongjmp()
                 exit()

             Figure 10.21 Timeline for example program handling two signals

Let's examine the output when the program in Figure 10.20 is executed:

$ ./a.out &                                  start process in background
starting main:                               the job-control shell prints its process ID
[1] 531                                      send the process SIGUSR1
$ kill -USR1 531
starting sig_usr1: SIGUSR1                   just press RETURN
$ in sig_alrm: SIGUSR1 SIGALRM
finishing sig_usr1: SIGUSR1
ending main:
```
- `Bash` -- `sed -n '21202,21500p' /tmp/apue/full.txt`
```
10.17 abort Function

We mentioned earlier that the abort function causes abnormal program termination.

               #include <stdlib.h>
               void abort(void);

                                    This function never returns

This function sends the SIGABRT signal to the caller. (Processes should not ignore this
signal.) ISO C states that calling abort will deliver an unsuccessful termination
notification to the host environment by calling raise(SIGABRT).

     ISO C requires that if the signal is caught and the signal handler returns, abort still
doesn't return to its caller. If this signal is caught, the only way the signal handler can't
return is if it calls exit, _exit, _Exit, longjmp, or siglongjmp. (Section 10.15
discusses the differences between longjmp and siglongjmp.) POSIX.1 also specifies
that abort overrides the blocking or ignoring of the signal by the process.

     The intent of letting the process catch the SIGABRT is to allow it to perform any
cleanup that it wants to do before the process terminates. If the process doesn't
terminate itself from this signal handler, POSIX.1 states that, when the signal handler
returns, abort terminates the process.

     The ISO C specification of this function leaves it up to the implementation as to
whether output streams are flushed and whether temporary files (Section 5.13) are
deleted. POSIX.1 goes further and allows an implementation to call fclose on open
standard I/O streams before terminating if the call to abort terminates the process.

               Earlier versions of System V generated the SIGIOT signal from the abort function.
               Furthermore, it was possible for a process to ignore this signal or to catch it and return from
               the signal handler, in which case abort returned to its caller.
366 Signals                                                           Chapter        10

             4.3BSD generated the SIGILL signal. Before doing this, the 4.3BSD function unblocked the
             signal and reset its disposition to SIG_DFL (terminate with core file). This prevented a
             process from either ignoring the signal or catching it.

             Historically, implementations of abort have differed in how they deal with standard I/O
             streams. For defensive programming and improved portability, if we want standard I/O
             streams to be flushed, we specifically do it before calling abort. We do this in the err_dump
             function (Appendix B).

             Since most UNIX System implementations of tmpfile call unlink immediately after creating
             the file, the ISO C warning about temporary files does not usually concern us.

Example

Figure 10.25 shows an implementation of the abort function as specified by POSIX.1.

#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void

abort(void)             /* POSIX-style abort() function */

{

         sigset_t           mask;

         struct sigaction action;

         /* Caller can't ignore SIGABRT, if so reset to default */

         sigaction(SIGABRT, NULL, &action);

         if (action.sa_handler == SIG_IGN) {

             action.sa_handler = SIG_DFL;

             sigaction(SIGABRT, &action, NULL);

         }

         if (action.sa_handler == SIG_DFL)

             fflush(NULL);             /* flush all open stdio streams */

         /* Caller can't block SIGABRT; make sure it's unblocked */
         sigfillset(&mask);
         sigdelset(&mask, SIGABRT); /* mask has only SIGABRT turned off */
         sigprocmask(SIG_SETMASK, &mask, NULL);
         kill(getpid(), SIGABRT); /* send the signal */

         /* If we're here, process caught SIGABRT and returned */

         fflush(NULL);                 /* flush all open stdio streams */

         action.sa_handler = SIG_DFL;

         sigaction(SIGABRT, &action, NULL); /* reset to default */

         sigprocmask(SIG_SETMASK, &mask, NULL); /* just in case ... */

         kill(getpid(), SIGABRT);                /* and one more time */

         exit(1); /* this should never be executed ... */

}

                        Figure 10.25 Implementation of POSIX.1 abort
Section 10.18                            system Function 367

We first see whether the default action will occur; if so, we flush all the standard I/O
streams. This is not equivalent to calling fclose on all the open streams (since it just
flushes them and doesn't close them), but when the process terminates, the system
closes all open files. If the process catches the signal and returns, we flush all the
streams again, since the process could have generated more output. The only condition
we don't handle is the case where the process catches the signal and calls _exit or
_Exit. In this case, any unflushed standard I/O buffers in memory are discarded. We
assume that a caller that does this doesn't want the buffers flushed.

     Recall from Section 10.9 that if calling kill causes the signal to be generated for the
caller, and if the signal is not blocked (which we guarantee in Figure 10.25), then the
signal (or some other pending, unlocked signal) is delivered to the process before kill
returns. We block all signals except SIGABRT, so we know that if the call to kill
returns, the process caught the signal and the signal handler returned.

10.18 system Function

In Section 8.13, we showed an implementation of the system function. That version,
however, did not do any signal handling. POSIX.1 requires that system ignore SIGINT
and SIGQUIT and block SIGCHLD. Before showing a version that handles these signals
correctly, let's see why we need to worry about signal handling.

Example

The program shown in Figure 10.26 uses the version of system from Section 8.13 to
invoke the ed(1) editor. (This editor has been part of UNIX systems for a long time. We
use it here because it is an interactive program that catches the interrupt and quit
signals. If we invoke ed from a shell and type the interrupt character, it catches the
interrupt signal and prints a question mark. The ed program also sets the disposition of
the quit signal so that it is ignored.) The program in Figure 10.26 catches both SIGINT
and SIGCHLD. If we invoke the program, we get

               $ ./a.out                 append text to the editor's buffer
               a
               Here is one line of text  period on a line by itself stops append mode
               .                         print first through last lines of buffer to see what's there
               1,$p
               Here is one line of text  write the buffer to a file
               w temp.foo                editor says it wrote 25 bytes
               25                        and leave the editor
               q
               caught SIGCHLD

When the editor terminates, the system sends the SIGCHLD signal to the parent (the
a.out process). We catch it and return from the signal handler. But if it is catching the
SIGCHLD signal, the parent should be doing so because it has created its own children,
so that it knows when its children have terminated. The delivery of this signal in the
368 Signals                                                                Chapter  10

#include "apue.h"

static void            SIGINT\n");
sig_int(int signo)
{

       printf("caught
}

static void
sig_chld(int signo)
{

       printf("caught SIGCHLD\n");
}

int
main(void)
{

       if (signal(SIGINT, sig_int) == SIG_ERR)
              err_sys("signal(SIGINT) error");

       if (signal(SIGCHLD, sig_chld) == SIG_ERR)
              err_sys("signal(SIGCHLD) error");

       if (system("/bin/ed") < 0)
              err_sys("system() error");

       exit(0);
}

                       Figure 10.26 Using system to invoke the ed editor

parent should be blocked while the system function is executing. Indeed, this is what
POSIX.1 specifies. Otherwise, when the child created by system terminates, it would
fool the caller of system into thinking that one of its own children terminated. The
caller would then use one of the wait functions to get the termination status of the
child, thereby preventing the system function from being able to obtain the child's
termination status for its return value.

     If we run the program again, this time sending the editor an interrupt signal, we get

$ ./a.out              append text to the editor's buffer
a
hello, world           period on a line by itself stops append mode
.                      print first through last lines to see what's there
1,$p
hello, world           write the buffer to a file
w temp.foo             editor says it wrote 13 bytes
13                     type the interrupt character
^C                     editor catches signal, prints question mark
?                      and so does the parent process
caught SIGINT          leave editor
q
caught SIGCHLD
Section 10.18                                                        system Function 369

Recall from Section 9.6 that typing the interrupt character causes the interrupt signal to
be sent to all the processes in the foreground process group. Figure 10.27 shows the
arrangement of the processes when the editor is running.

                    login shell  fork          a.out  fork  /bin/sh  fork       /bin/ed
                                 exec                 exec           exec

               background process group               foreground process group

                      Figure 10.27 Foreground and background process groups for Figure 10.26

     In this example, SIGINT is sent to all three foreground processes. (The shell ignores
it.) As we can see from the output, both the a.out process and the editor catch the
signal. But when we're running another program with the system function, we
shouldn't have both the parent and the child catching the two terminal-generated
signals: interrupt and quit. Instead, these two signals should be sent to the program
that is running: the child. Since the command that is executed by system can be an
interactive command (as is the ed program in this example) and since the caller of
system gives up control while the program executes, waiting for it to finish, the caller
of system should not be receiving these two terminal-generated signals. For this
reason, POSIX.1 specifies that the system function should ignore these two signals
while waiting for the command to complete.

Example

Figure 10.28 shows an implementation of the system function with the required signal
handling.

#include              <sys/wait.h>
#include              <errno.h>
#include              <signal.h>
#include              <unistd.h>

int

system(const char *cmdstring) /* with appropriate signal handling */

{

               pid_t                     pid;

               int                       status;

               struct sigaction ignore, saveintr, savequit;

               sigset_t                  chldmask, savemask;

               if (cmdstring == NULL)

                    return(1);           /* always a command processor with UNIX */

               ignore.sa_handler = SIG_IGN;           /* ignore SIGINT and SIGQUIT */
               sigemptyset(&ignore.sa_mask);
               ignore.sa_flags = 0;
370 Signals                                                                     Chapter  10

if (sigaction(SIGINT, &ignore, &saveintr) < 0)

             return(-1);

if (sigaction(SIGQUIT, &ignore, &savequit) < 0)

             return(-1);

sigemptyset(&chldmask);             /* now block SIGCHLD */

sigaddset(&chldmask, SIGCHLD);

if (sigprocmask(SIG_BLOCK, &chldmask, &savemask) < 0)

             return(-1);

if ((pid = fork()) < 0) {

             status = -1; /* probably out of processes */

} else if (pid == 0) {              /* child */

             /* restore previous signal actions & reset signal mask */

             sigaction(SIGINT, &saveintr, NULL);

             sigaction(SIGQUIT, &savequit, NULL);

             sigprocmask(SIG_SETMASK, &savemask, NULL);
```
- `Bash` -- `sed -n '18932,19026p' /tmp/apue/full.txt; echo "---10.7---"; sed -n '19302,19449p' /tmp/apue/full.txt`
```
10.4 Unreliable Signals

In earlier versions of the UNIX System (such as Version 7), signals were unreliable. By
this we mean that signals could get lost: a signal could occur and the process would
never know about it. Also, a process had little control over a signal: a process could
catch the signal or ignore it. Sometimes, we would like to tell the kernel to block a
signal: don't ignore it, just remember if it occurs, and tell us later when we're ready.

             Changes were made with 4.2BSD to provide what are called reliable signals. A different set of
             changes was then made in SVR3 to provide reliable signals under System V. POSIX.1 chose the
             BSD model to standardize.

     One problem with these early versions was that the action for a signal was reset to
its default each time the signal occurred. (In the previous example, when we ran the
program in Figure 10.2, we avoided this detail by catching each signal only once.) The
classic example from programming books that described these earlier systems concerns
how to handle the interrupt signal. The code that was described usually looked like

             int sig_int();  /* my signal handling function */

             ...

             signal(SIGINT, sig_int); /* establish handler */

             ...

sig_int()

{

             signal(SIGINT, sig_int); /* reestablish handler for next time */

             ...             /* process the signal ... */

}

(The reason the signal handler is declared as returning an integer is that these early
systems didn't support the ISO C void data type.)

     The problem with this code fragment is that there is a window of time--after the
signal has occurred, but before the call to signal in the signal handler--when the
interrupt signal could occur another time. This second signal would cause the default
Section 10.5                                Interrupted System Calls 327

      action to occur, which for this signal terminates the process. This is one of those
      conditions that works correctly most of the time, causing us to think that it is correct,
      when it isn't.

           Another problem with these earlier systems was that the process was unable to turn
      a signal off when it didn't want the signal to occur. All the process could do was ignore
      the signal. There are times when we would like to tell the system ``prevent the
      following signals from interrupting me, but remember if they do occur.'' The classic
      example that demonstrates this flaw is shown by a piece of code that catches a signal
      and sets a flag for the process that indicates that the signal occurred:

              int sig_int();                /* my signal handling function */
              int sig_int_flag;             /* set nonzero when signal occurs */

              main()

              {

                 signal(SIGINT, sig_int); /* establish handler */

                      ...

                 while (sig_int_flag == 0)

                           pause();         /* go to sleep, waiting for signal */

                      ...

              }

              sig_int()

              {

                 signal(SIGINT, sig_int); /* reestablish handler for next time */

                 sig_int_flag = 1;          /* set flag for main loop to examine */

              }

      Here, the process is calling the pause function to put it to sleep until a signal is caught.
      When the signal is caught, the signal handler just sets the flag sig_int_flag to a
      nonzero value. The process is automatically awakened by the kernel after the signal
      handler returns, notices that the flag is nonzero, and does whatever it needs to do. But
      there is a window of time when things can go wrong. If the signal occurs after the test
      of sig_int_flag but before the call to pause, the process could go to sleep forever
      (assuming that the signal is never generated again). This occurrence of the signal is lost.
      This is another example of some code that isn't right, yet it works most of the time.
      Debugging this type of problem can be difficult.

10.5  Interrupted System Calls
---10.7---
10.7  SIGCLD Semantics

      Two signals that continually generate confusion are SIGCLD and SIGCHLD. The name
      SIGCLD (without the H) is from System V, and this signal has different semantics from
      the BSD signal, named SIGCHLD. The POSIX.1 signal is also named SIGCHLD.
Section 10.7  SIGCLD Semantics 333

                The semantics of the BSD SIGCHLD signal are normal, in the sense that its semantics
          are similar to those of all other signals. When the signal occurs, the status of a child has
          changed, and we need to call one of the wait functions to determine what has
          happened.

                System V, however, has traditionally handled the SIGCLD signal differently from
          other signals. SVR4-based systems continue this questionable tradition (i.e.,
          compatibility constraint) if we set its disposition using either signal or sigset (the
          older, SVR3-compatible functions to set the disposition of a signal). This older handling
          of SIGCLD consists of the following behavior:

                1. If the process specifically sets its disposition to SIG_IGN, children of the calling
                     process will not generate zombie processes. Note that this is different from its
                     default action (SIG_DFL), which from Figure 10.1 is to be ignored. Instead, on
                     termination, the status of these child processes is discarded. If it subsequently
                     calls one of the wait functions, the calling process will block until all its
                     children have terminated, and then wait returns -1 with errno set to ECHILD.
                     (The default disposition of this signal is to be ignored, but this default will not
                     cause the preceding semantics to occur. Instead, we specifically have to set its
                     disposition to SIG_IGN.)

                                        POSIX.1 does not specify what happens when SIGCHLD is ignored, so this behavior is
                                        allowed. The XSI option requires this behavior to be supported for SIGCHLD.

                                        4.4BSD always generates zombies if SIGCHLD is ignored. If we want to avoid zombies,
                                        we have to wait for our children. With SVR4, if either signal or sigset is called to set
                                        the disposition of SIGCHLD to be ignored, zombies are never generated. All four
                                        platforms described in this book follow SVR4 in this behavior.

                                        With sigaction, we can set the SA_NOCLDWAIT flag (Figure 10.16) to avoid zombies.
                                        This action is also supported on all four platforms.

                2. If we set the disposition of SIGCLD to be caught, the kernel immediately checks
                     whether any child processes are ready to be waited for and, if so, calls the
                     SIGCLD handler.

          Item 2 changes the way we have to write a signal handler for this signal, as illustrated in
          the following example.

Example

          Recall from Section 10.4 that the first thing to do on entry to a signal handler is to call
          signal again, to reestablish the handler. (This action is intended to minimize the
          window of time when the signal is reset back to its default and could get lost.) We show
          this in Figure 10.6. This program doesn't work on traditional System V platforms. The
          output is a continual string of SIGCLD received lines. Eventually, the process runs
          out of stack space and terminates abnormally.
334 Signals                                                                    Chapter  10

#include      "apue.h"
#include      <sys/wait.h>

static void sig_cld(int);

int           pid;
main()
{

       pid_t

   if (signal(SIGCLD, sig_cld) == SIG_ERR)

             perror("signal error");

   if ((pid = fork()) < 0) {

             perror("fork error");

   } else if (pid == 0) {             /* child */

             sleep(2);

             _exit(0);

   }

       pause();  /* parent */
       exit(0);
}

static void

sig_cld(int signo) /* interrupts pause() */

{

   pid_t pid;

   int        status;

   printf("SIGCLD received\n");

   if (signal(SIGCLD, sig_cld) == SIG_ERR) /* reestablish handler */
          perror("signal error");

   if ((pid = wait(&status)) < 0)     /* fetch child status */
          perror("wait error");

       printf("pid = %d\n", pid);
}

                        Figure 10.6 System V SIGCLD handler that doesn't work

              FreeBSD 8.0 and Mac OS X 10.6.8 don't exhibit this problem, because BSD-based systems
              generally don't support historical System V semantics for SIGCLD. Linux 3.2.0 also doesn't
              exhibit this problem, because it doesn't call the SIGCHLD signal handler when a process
              arranges to catch SIGCHLD and child processes are ready to be waited for, even though
              SIGCLD and SIGCHLD are defined to be the same value. Solaris 10, on the other hand, does
              call the signal handler in this situation, but includes extra code in the kernel to avoid this
              problem.

              Although the four platforms described in this book solve this problem, realize that platforms
              (such as AIX) still exist that haven't addressed it.
Section 10.8  Reliable-Signal Terminology and Semantics 335

     The problem with this program is that the call to signal at the beginning of the
signal handler invokes item 2 from the preceding discussion--the kernel checks
whether a child needs to be waited for (which is the case, since we're processing a
SIGCLD signal), so it generates another call to the signal handler. The signal handler
calls signal, and the whole process starts over again.

     To fix this program, we have to move the call to signal after the call to wait. By
doing this, we call signal after fetching the child's termination status; the signal is
generated again by the kernel only if some other child has since terminated.

                    POSIX.1 states that when we establish a signal handler for SIGCHLD and there exists a
                    terminated child we have not yet waited for, it is unspecified whether the signal is generated.
                    This allows the behavior described previously. But since POSIX.1 does not reset a signal's
                    disposition to its default when the signal occurs (assuming that we're using the POSIX.1
                    sigaction function to set its disposition), there is no need for us to ever establish a signal
                    handler for SIGCHLD within that handler.

     Be cognizant of the SIGCHLD semantics for your implementation. Be especially
aware of some systems that #define SIGCHLD to be SIGCLD, or vice versa. Changing
the name may allow you to compile a program that was written for another system, but
if that program depends on the other semantics, it may not work.

                    Of the four platforms described in this text, only Linux 3.2.0 and Solaris 10 define SIGCLD. On
                    these platforms, SIGCLD is equivalent to SIGCHLD.

10.8 Reliable-Signal Terminology and Semantics
```
- `Bash` -- `grep -n "^10\.21 sigqueue\|^10\.22  Job-Control\|^10\.23 Signal Names" /tmp/apue/full.txt`
```
(Bash completed with no output)
```
- `Bash` -- `grep -n "^10\.2[1-3]" /tmp/apue/full.txt`
```
467:10.21         sigqueue Function 376
468:10.22         Job-Control Signals 377
469:10.23         Signal Names and Numbers 379
21890:10.21 Job-Control Signals
22021:10.22 Signal Names and Numbers
22107:10.23 Summary
```
- `Bash` -- `sed -n '21700,21890p' /tmp/apue/full.txt`
```
            static void
            sig_alrm(int signo)
            {

                   /* nothing to do, just returning wakes up sigsuspend() */
            }

            unsigned int
374 Signals                                                     Chapter  10

sleep(unsigned int seconds)

{

   struct sigaction newact, oldact;

   sigset_t             newmask, oldmask,  suspmask;

   unsigned int         unslept;

   /* set our handler, save previous information */
   newact.sa_handler = sig_alrm;
   sigemptyset(&newact.sa_mask);
   newact.sa_flags = 0;
   sigaction(SIGALRM, &newact, &oldact);

   /* block SIGALRM and save current signal mask */
   sigemptyset(&newmask);
   sigaddset(&newmask, SIGALRM);
   sigprocmask(SIG_BLOCK, &newmask, &oldmask);

   alarm(seconds);
   suspmask = oldmask;

   /* make sure SIGALRM isn't blocked */
   sigdelset(&suspmask, SIGALRM);

   /* wait for any signal to be caught */
   sigsuspend(&suspmask);

   /* some signal has been caught, SIGALRM is now blocked */

   unslept = alarm(0);

   /* reset previous action */
   sigaction(SIGALRM, &oldact, NULL);

       /* reset signal mask, which unblocks SIGALRM */
       sigprocmask(SIG_SETMASK, &oldmask, NULL);
       return(unslept);
}

                 Figure 10.29 Reliable implementation of sleep

It takes more code to write this reliable implementation than what is shown in
Figure 10.7. We don't use any form of nonlocal branching (as we did in Figure 10.8 to
avoid the race condition between alarm and pause), so there is no effect on other
signal handlers that may be executing when the SIGALRM is handled.

     The nanosleep function is similar to the sleep function, but provides
nanosecond-level granularity.

      #include <time.h>

      int nanosleep(const struct timespec *reqtp, struct timespec *remtp);
                                                         Returns: 0 if slept for requested time or -1 on error

This function suspends the calling process until either the requested time has elapsed or
the function is interrupted by a signal. The reqtp parameter specifies the amount of time
Section 10.19  sleep, nanosleep, and clock_nanosleep Functions 375

to sleep in seconds and nanoseconds. If the sleep interval is interrupted by a signal and
the process doesn't terminate, the timespec structure pointed to by the remtp
parameter will be set to the amount of time left in the sleep interval. We can set this
parameter to NULL if we are uninterested in the time unslept.

     If the system doesn't support nanosecond granularity, the requested time is
rounded up. Because the nanosleep function doesn't involve the generation of any
signals, we can use it without worrying about interactions with other functions.

                    The nanosleep function used to belong to the Timers option in the Single UNIX Specification,
                    but was moved to the base in SUSv4.

     With the introduction of multiple system clocks (recall Section 6.10), we need a way
to suspend the calling thread using a delay time relative to a particular clock. The
clock_nanosleep function provides us with this capability.

 #include <time.h>

 int clock_nanosleep(clockid_t clock_id, int flags,
                                     const struct timespec *reqtp, struct timespec *remtp);

                                             Returns: 0 if slept for requested time or error number on failure

The clock_id argument specifies the clock against which the time delay is evaluated.
Identifiers for clocks are listed in Figure 6.8. The flags argument is used to control
whether the delay is absolute or relative. When flags is set to 0, the sleep time is relative
(i.e., how long we want to sleep). When it is set to TIMER_ABSTIME, the sleep time is
absolute (i.e., we want to sleep until the clock reaches the specified time).

     The other arguments, reqtp and remtp, are the same as in the nanosleep function.
However, when we use an absolute time, the remtp argument is unused, because it isn't
needed; we can reuse the same value for the reqtp argument for additional calls to
clock_nanosleep until the clock reaches the specified absolute time value.

     Note that except for error returns, the call

      clock_nanosleep(CLOCK_REALTIME, 0, reqtp, remtp);

has the same effect as the call

      nanosleep(reqtp, remtp);

The problem with using a relative sleep is that some applications require precision with
how long they sleep, and a relative sleep time can lead to sleeping longer than desired.
For example, if an application wants to perform a task at regular intervals, it would
have to get the current time, calculate the amount of time until the next time to execute
the task, and then call nanosleep. Between the time that the current time is obtained
and the call to nanosleep is made, processor scheduling and preemption can result in
the relative sleep time extending past the desired interval. Using an absolute time
improves the precision, even though a time-sharing process scheduler makes no
guarantee that our task will execute immediately after our sleep time has ended.

                    In older versions of the Single UNIX Specification, the clock_nanosleep function belonged
                    to the Clock Selection option. In SUSv4, it was moved to the base.
376 Signals                                                                   Chapter     10

10.20 sigqueue Function

          In Section 10.8 we said that most UNIX systems don't queue signals. With the real-time
          extensions to POSIX.1, some systems began adding support for queueing signals. With
          SUSv4, the queued signal functionality has moved from the real-time extensions to the
          base specification.

                Generally a signal carries one bit of information: the signal itself. In addition to
          queueing signals, these extensions allow applications to pass more information along
          with the delivery (recall Section 10.14). This information is embedded in a siginfo
          structure. Along with system-provided information, applications can pass an integer or
          a pointer to a buffer containing more information to the signal handler.

                To use queued signals we have to do the following:

                1. Specify the SA_SIGINFO flag when we install a signal handler using the
                     sigaction function. If we don't specify this flag, the signal will be posted, but
                     it is left up to the implementation whether the signal is queued.

                2. Provide a signal handler in the sa_sigaction member of the sigaction
                     structure instead of using the usual sa_handler field. Implementations might
                     allow us to use the sa_handler field, but we won't be able to obtain the extra
                     information sent with the sigqueue function.

                3. Use the sigqueue function to send signals.

      #include <signal.h>

      int sigqueue(pid_t pid, int signo, const union sigval value)

                                                                                       Returns: 0 if OK, -1 on error

     The sigqueue function is similar to the kill function, except that we can only
direct signals to a single process with sigqueue, and we can use the value argument to
transmit either an integer or a pointer value to the signal handler.

     Signals can't be queued infinitely. Recall the SIGQUEUE_MAX limit from Figure 2.9
and Figure 2.11. When this limit is reached, sigqueue can fail with errno set to
EAGAIN.

     With the real-time signal enhancements, a separate set of signals was introduced for
application use. These are the signal numbers between SIGRTMIN and SIGRTMAX,
inclusive. Be aware that the default action for these signals is to terminate the process.

     Figure 10.30 summarizes the way queued signals differ in behavior among the
implementations covered in this text.

                                    Behavior                  SUS FreeBSD Linux Mac OS X Solaris
                                                                           8.0 3.2.0 10.6.8 10
supports sigqueue
queues other signals besides SIGRTMIN to SIGRTMAX             �  �         �           �
queues signals even if the caller doesn't use the SA_SIGINFO
                                                              optional �               �
      flag
                                                              optional �   �

             Figure 10.30 Behavior of queued signals on various platforms
Section 10.21  Job-Control Signals 377

                                  Mac OS X 10.6.8 doesn't support sigqueue or real-time signals. On Solaris 10, sigqueue is
                                  in the real-time library, librt.

10.21 Job-Control Signals
```
- `Bash` -- `sed -n '21890,22107p' /tmp/apue/full.txt`
```
10.21 Job-Control Signals

          Of the signals shown in Figure 10.1, POSIX.1 considers six to be job-control signals:

                SIGCHLD Child process has stopped or terminated.

                SIGCONT Continue process, if stopped.

                SIGSTOP Stop signal (can't be caught or ignored).

                SIGTSTP Interactive stop signal.

                SIGTTIN Read from controlling terminal by background process group member.

                SIGTTOU Write to controlling terminal by a background process group member.

                Except for SIGCHLD, most application programs don't handle these signals:
          interactive shells usually do all the work required to handle them. When we type the
          suspend character (usually Control-Z), SIGTSTP is sent to all processes in the
          foreground process group. When we tell the shell to resume a job in the foreground or
          background, the shell sends all the processes in the job the SIGCONT signal. Similarly, if
          SIGTTIN or SIGTTOU is delivered to a process, the process is stopped by default, and
          the job-control shell recognizes this and notifies us.

                An exception is a process that is managing the terminal--the vi(1) editor, for
          example. It needs to know when the user wants to suspend it so that it can restore the
          terminal's state to the way it was when vi was started. Also, when it resumes in the
          foreground, the vi editor needs to set the terminal state back to the way it wants it, and
          it needs to redraw the terminal screen. We see how a program such as vi handles this
          in the example that follows.

                There are some interactions between the job-control signals. When any of the four
          stop signals (SIGTSTP, SIGSTOP, SIGTTIN, or SIGTTOU) is generated for a process,
          any pending SIGCONT signal for that process is discarded. Similarly, when the
          SIGCONT signal is generated for a process, any pending stop signals for that same
          process are discarded.

                Note that the default action for SIGCONT is to continue the process, if it is stopped;
          otherwise, the signal is ignored. Normally, we don't have to do anything with this
          signal. When SIGCONT is generated for a process that is stopped, the process is
          continued, even if the signal is blocked or ignored.

Example

          The program in Figure 10.31 demonstrates the normal sequence of code used when a
          program handles job control. This program simply copies its standard input to its
          standard output, but comments are given in the signal handler for typical actions
          performed by a program that manages a screen.
378 Signals                                            Chapter    10

#include "apue.h"

#define BUFFSIZE 1024

static void
sig_tstp(int signo) /* signal handler for SIGTSTP */
{

       sigset_t mask;

/* ... move cursor to lower left corner, reset tty mode ... */

/*
 * Unblock SIGTSTP, since it's blocked while we're handling it.
 */

sigemptyset(&mask);
sigaddset(&mask, SIGTSTP);
sigprocmask(SIG_UNBLOCK, &mask, NULL);

signal(SIGTSTP, SIG_DFL); /* reset disposition to default */

kill(getpid(), SIGTSTP); /* and send the signal to ourself */

/* we won't return from the kill until we're continued */

signal(SIGTSTP, sig_tstp); /* reestablish signal handler */

       /* ... reset tty mode, redraw screen ... */
}

int              n;
main(void)       buf[BUFFSIZE];
{

       int
       char

/*
 * Only catch SIGTSTP if we're running with a job-control shell.
 */

if (signal(SIGTSTP, SIG_IGN) == SIG_DFL)
       signal(SIGTSTP, sig_tstp);

while ((n = read(STDIN_FILENO, buf, BUFFSIZE)) > 0)
       if (write(STDOUT_FILENO, buf, n) != n)
              err_sys("write error");

if (n < 0)
       err_sys("read error");

       exit(0);
}

                   Figure 10.31 How to handle SIGTSTP

When the program in Figure 10.31 starts, it arranges to catch the SIGTSTP signal only if
the signal's disposition is SIG_DFL. The reason is that when the program is started by a
shell that doesn't support job control (/bin/sh, for example), the signal's disposition
Section 10.22  Signal Names and Numbers 379

          should be set to SIG_IGN. In fact, the shell doesn't explicitly ignore this signal; init
          sets the disposition of the three job-control signals (SIGTSTP, SIGTTIN, and SIGTTOU)
          to SIG_IGN. This disposition is then inherited by all login shells. Only a job-control
          shell should reset the disposition of these three signals to SIG_DFL.

                When we type the suspend character, the process receives the SIGTSTP signal and
          the signal handler is invoked. At this point, we would do any terminal-related
          processing: move the cursor to the lower-left corner, restore the terminal mode, and so
          on. We then send ourself the same signal, SIGTSTP, after resetting its disposition to its
          default (stop the process) and unblocking the signal. We have to unblock it since we're
          currently handling that same signal, and the system blocks it automatically while it's
          being caught. At this point, the system stops the process. It is continued only when it
          receives (usually from the job-control shell, in response to an interactive fg command) a
          SIGCONT signal. We don't catch SIGCONT. Its default disposition is to continue the
          stopped process; when this happens, the program continues as though it returned from
          the kill function. When the program is continued, we reset the disposition for the
          SIGTSTP signal and do whatever terminal processing we want (we could redraw the
          screen, for example).

10.22 Signal Names and Numbers

          In this section, we describe how to map between signal numbers and names. Some
          systems provide the array

                  extern char *sys_siglist[];

          The array index is the signal number, giving a pointer to the character string name of
          the signal.

                                  FreeBSD 8.0, Linux 3.2.0, and Mac OS X 10.6.8 all provide this array of signal names. Solaris 10
                                  does, too, but it uses the name _sys_siglist instead.

                To print the character string corresponding to a signal number in a portable manner,
          we can use the psignal function.

                  #include <signal.h>

                  void psignal(int signo, const char *msg);

          The string msg (which normally includes the name of the program) is output to the
          standard error, followed by a colon and a space, followed by a description of the signal,
          followed by a newline. If msg is NULL, then only the description is written to the
          standard error. This function is similar to perror (Section 1.7).

                If you have a siginfo structure from an alternative sigaction signal handler,
          you can print the signal information with the psiginfo function.

                  #include <signal.h>

                  void psiginfo(const siginfo_t *info, const char *msg);
380 Signals                                 Chapter                                10

It operates in a similar manner to the psignal function. Although this function has
access to more information than just the signal number, platforms vary in exactly what
additional information is printed.

     If you only need the string description of the signal and don't necessarily want to
write it to standard error (you might want to write it to a log file, for example), you can
use the strsignal function. This function is similar to strerror (also described in
Section 1.7).

#include <string.h>
char *strsignal(int signo);

                             Returns: a pointer to a string describing the signal

Given a signal number, strsignal will return a string that describes the signal. This
string can be used by applications to print error messages about signals received.

             All the platforms discussed in this book provide the psignal and strsignal functions, but
             differences do occur. On Solaris 10, strsignal will return a null pointer if the signal number
             is invalid, whereas FreeBSD 8.0, Linux 3.2.0, and Mac OS X 10.6.8 return a string indicating
             that the signal number is unrecognized.

             Only Linux 3.2.0 and Solaris 10 support the psiginfo function.

     Solaris provides a couple of functions to map a signal number to a signal name, and
vice versa.

#include <signal.h>
int sig2str(int signo, char *str);
int str2sig(const char *str, int *signop);

                                            Both return: 0 if OK, -1 on error

These functions are useful when writing interactive programs that need to accept and
print signal names and numbers.

     The sig2str function translates the given signal number into a string and stores
the result in the memory pointed to by str. The caller must ensure that the memory is
large enough to hold the longest string, including the terminating null byte. Solaris
provides the constant SIG2STR_MAX in <signal.h> to define the maximum string
length. The string consists of the signal name without the ``SIG'' prefix. For example,
translating SIGKILL would result in the string ``KILL'' being stored in the str memory
buffer.

     The str2sig function translates the given name into a signal number. The signal
number is stored in the integer pointed to by signop. The name can be either the signal
name without the ``SIG'' prefix or a string representation of the decimal signal number
(i.e., ``9'').

     Note that sig2str and str2sig depart from common practice and don't set
errno when they fail.
Chapter 10  Exercises 381

10.23 Summary
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && git log --follow --diff-filter=A --format="%ad %h" --date=short -- "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3.md" "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4.md" "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8.md" "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10.md" 2>&1 | sort -u`
```
fatal: --follow requires exactly one pathspec
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && for f in "Chapter - 3" "Chapter - 4" "Chapter - 8" "Chapter - 10"; do echo "=== $f ==="; git log --follow --diff-filter=A --format="%ad %h" --date=short -- "20_Progress/Degree/CSCI 4061/Textbook/$f.md"; done`
```
=== Chapter - 3 ===
2026-04-23 2d03e0cf
=== Chapter - 4 ===
2026-04-23 2d03e0cf
=== Chapter - 8 ===
2026-09-26 ae08204e
=== Chapter - 10 ===
2026-04-23 2d03e0cf
```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Chapter - 3.md`
```
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

```

## You

Go aheead and build out the build 2 for the rest of textbook notes exactly same way. Follow everything that has been mentioned correctly.

## Claude

Continuing Build 2 — now writing the perfected Chapter 4, which had the largest content gap (only 6 of 26 subsections were covered).

All four now match the clean, gold structure with no duplicated headings. Let me check blank-line compliance and flashcard counts.

All four chapters have exactly one highlight in Chapter Summary and zero leftover `#cards/ai` tags. Now let's verify all wikilinks used resolve to real notes, and check frontmatter validity.

Now updating the Textbook Map to reflect Build 2's completion.

Let me update these two spots in Week 1 as well, and add Chapter 8 to its `area` field since it's now perfected.

Clean — all expected files modified, no formatting violations introduced. Build 2 is complete.

**Build 2 is done.** All four remaining chapter notes — Chapters 3, 4, 8, and 10 — are now perfected the exact same way Build 1 handled Chapters 1 and 7:

**Chapter 3 (File I/O):** restored 6 entirely missing subsections — `lseek` and file holes, the real I/O-efficiency benchmark table, `sync`/`fsync`/`fdatasync`, `fcntl`, `ioctl`, and `/dev/fd` — plus the usual structural fixes (real `Full Reading Notes` heading, frontmatter, 7 flashcards under `#cards/csci4061`).

**Chapter 4 (Files and Directories):** this was the biggest gap in the whole course — only 6 of 26 subsections existed. Added the other 20: setuid/setgid bits, the full permission-check algorithm, ownership rules, `access`, `umask`, `chmod`, the sticky bit, `chown`, file truncation, hard links, `rename`, symbolic links, file times, `mkdir`/`rmdir`, directory reading, and device special files.

**Chapter 8 (Process Control):** added the back half of the chapter (§8.11–8.17) — changing UIDs/GIDs with the saved-set-user-ID privilege dance, interpreter files, a full `system()` walkthrough including the set-user-ID security hole, process accounting, `getlogin`, scheduling/`nice`, and process times.

**Chapter 10 (Signals):** added unreliable-signal history, `SIGCLD` vs `SIGCHLD` semantics, formal reliable-signal terminology, `alarm()` (previously only `pause()` was covered), `sigsetjmp`/`siglongjmp` (the direct sequel to Chapter 7's `setjmp`), `abort`, the signal-aware version of `system()`, `sigqueue`, formal job-control signals, and signal name/number utilities.

I also went back and removed the "provisional — not yet source-checked" caveats that Weeks 1–3 had flagged against these four chapters, since that language is now stale, and updated the Textbook Map and Weekly Board to reflect that all six chapter notes for Weeks 1–4 are source-checked. Verified across all four files: no duplicate headings, no stray blank lines, exactly one highlight per Chapter Summary, flashcards capped well under 10, and every wikilink resolves to a real note.

The only thing left un-perfected in this course's textbook layer is Chapter 15 (Pipes, §15.1–15.2), which has no note yet — that's genuinely new territory for Week 4/5, not part of either build.

### Tool Calls

- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && git status --short -- "20_Progress/Degree/CSCI 4061" && echo "---apue scratch---" && ls /tmp/apue/ 2>&1`
```
---apue scratch---
Lec01.txt
Lec02.txt
Lec03.txt
Lec04.txt
Lec05.txt
Lec06.txt
full.txt
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && git log -3 --format="%ad %h %s" --date=short -- "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3.md"`
```
2026-09-29 6b70c44d Auto-sync: 2026-09-29 16:48,  4 files changed, 169 insertions(+), 244 deletions(-)
2026-09-28 fb624b53 Auto-sync: 2026-09-28 21:03,  42 files changed, 334 insertions(+), 9911 deletions(-)
2026-09-27 1afffa8f Auto-sync: 2026-09-27 23:33,  84 files changed, 3164 insertions(+), 963 deletions(-)
```
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Chapter - 4.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Chapter - 8.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Chapter - 10.md`
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Chapter - 4.md`
```
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

```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Chapter - 8.md`
```
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

```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Chapter - 10.md`
```
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
next: "Feed this chapter into Week - 3's Textbook integration section"
---
# Chapter - 10 — Signals
**Source:** W. Richard Stevens and Stephen A. Rago, *Advanced Programming in the UNIX Environment*, 3rd ed. (Addison-Wesley, 2013), Chapter 10, pp. 313-382.
**Read from:** `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\Textbook\Advanced Programming in the UNIX Environment, 3rd Edition.pdf`
**Course role:** Week 3 reading. Lec05 (9/22) and Lec06 (9/24) teach the working core of this chapter in depth - signal concepts, `sigaction`, blocking/masks, the three "tricky items" (interrupted system calls, `errno` corruption, reentrancy), and `sigsuspend`. Sections 10.4, 10.7, 10.8 (unreliable-signal history, `SIGCLD` vs `SIGCHLD`, reliable-signal terminology), `alarm` specifically within §10.10, §10.15 (`sigsetjmp`/`siglongjmp`), §10.17 (`abort`), §10.18 (`system` with signal handling), §10.19-20's `sigqueue` half, and §10.21-22 (job-control signals, signal name/number utilities) have **no matching lecture coverage anywhere in Lec01-06** - textbook-only for this course so far.
## Chapter Summary
A **signal** is a software notification that can land on a process at any instruction boundary, and ==almost every hard part of this chapter is really the same problem restated: code written assuming uninterrupted, sequential execution breaks the moment a signal handler can run in the middle of it== (p. 313).
*Mechanism:* The kernel tracks each pending signal and each process's blocking mask; `sigaction` lets a process choose per-signal whether to take the default action, ignore it, or run a handler, and `sigprocmask` lets it defer delivery entirely. Because a handler genuinely interrupts whatever the main code was doing, three real hazards follow directly: a slow system call can be caught mid-block (`EINTR`, fixed by `SA_RESTART`), a handler that touches `errno` can silently corrupt the main code's own error state (fixed by save/restore), and a handler that calls a non-reentrant function like `malloc` or `printf` can corrupt data structures the main code was already mutating. `sigsuspend` closes the one race none of the individual pieces can close alone: the gap between unblocking a signal and actually going to sleep waiting for it.
## Key Concepts
- **signal**: Asynchronous software interrupt delivered by the OS to notify a process of an event (p. 313; Lec05).
- **interrupt**: Hardware-generated CPU notification, distinguished from software signals (Lec05).
- **null signal**: Signal number 0, used by `kill` for process existence and permission checks only, never actually delivered (p. 314).
- **disposition**: A signal's configured response - default action, ignore, or catch (p. 315).
- **signal handler**: Custom user function registered to run when a caught signal is delivered (p. 315; Lec05).
- **core file**: Memory-image file written to disk on abnormal termination, for debugging (p. 315).
- **SIGINT** / **SIGFPE** / **SIGKILL** / **SIGTERM** / **SIGCHLD** / **SIGCONT** / **SIGSTOP**: The seven signals Lec05's `kill -L` table walks through by number and default action (pp. 316-321; Lec05).
- **SIGUSR1** / **SIGUSR2**: Signal names explicitly reserved for application-defined meaning (p. 322; Lec05).
- **SIGALRM**: Signal generated when an `alarm()` timer expires; default action terminate (p. 316-317).
- **SIGABRT**: Signal generated by `abort()`; default action terminate with core (p. 316-317).
- **pending** / **delivered**: The two key states in a signal's lifecycle between generation and disposition (p. 335; Lec05).
- **pending-signal coalescing**: A second instance of an already-pending signal type is silently dropped, not queued (p. 336; Lec05).
- **jobs** / **fg** / **bg** / **kill**: Shell job-control commands managing background/stopped processes (Lab 02).
- **signal()**: Deprecated, platform-inconsistent way to install a handler; superseded by `sigaction` (p. 323; Lec05).
- **SIG_ERR** / **SIG_DFL** / **SIG_IGN**: The three special `sa_handler`/`signal()`-return constants (p. 323, 325).
- **unreliable signals**: The pre-4.2BSD model where a caught signal's disposition reset to default on every delivery, creating a real window to miss a second occurrence (p. 326).
- **SIGCLD**: System V's historically different-semantics name for what BSD/POSIX call `SIGCHLD` - a frequent source of portability bugs (p. 332).
- **kill** / **raise**: Send a signal to another process/process-group, or to oneself (p. 336-337).
- **slow system call** / **fast system call**: Calls that can block indefinitely (terminal `read`, `pause`, `wait`) versus calls that return quickly regardless (p. 328; Lec06).
- **EINTR**: Error code set when a slow system call is interrupted by a caught signal (p. 327; Lec06).
- **SA_RESTART**: `sigaction` flag telling the kernel to auto-restart an interrupted slow system call (p. 329, 351; Lec06).
- ==**reentrant** / **async-signal safe**==: A function safe to re-enter from a handler while a prior call to it is already in progress in main-line code (p. 330; Lec06).
- **printf** / **malloc** / **free** / **strtok** / **getpwnam**: Named non-reentrant functions unsafe inside a handler (pp. 330-331; Lec06).
- **sigset_t**: Bitmask data type holding a set of signals (p. 344; Lec05).
- **sigemptyset** / **sigfillset** / **sigaddset** / **sigdelset** / **sigismember**: The five signal-set manipulation functions (p. 344; Lec05).
- **process mask**: The set of signals currently blocked from delivery to a process (p. 346; Lec05).
- **sigprocmask** / **SIG_BLOCK** / **SIG_UNBLOCK** / **SIG_SETMASK**: The function and its three block/unblock/replace modes (p. 346; Lec05).
- **critical section**: Code protected from signal interruption by temporarily blocking signals around it (p. 359; Lec05).
- **sigpending**: Retrieves the set of signals currently blocked and pending (p. 347).
- **sigaction** / **struct sigaction** / **sa_handler** / **sa_mask** / **sa_flags**: The POSIX-reliable signal-configuration API and its fields (pp. 349-351; Lec06).
- **alarm**: Sets a one-shot future `SIGALRM` timer, replacing any previous one (p. 338).
- **pause**: Suspends execution until any caught signal's handler runs and returns (p. 338; Lec06).
- **sigsetjmp** / **siglongjmp**: The signal-mask-aware, portable versions of `setjmp`/`longjmp` for branching out of a handler (p. 355).
- **sig_atomic_t**: The ISO C type guaranteed safe to read/write without interruption, always paired with `volatile` for a flag a handler sets (p. 357).
- **sigsuspend**: Atomically sets the process mask and suspends for a caught signal, closing the unblock-then-pause race (p. 359; Lec06).
- **abort**: Sends `SIGABRT` to the caller; never returns even if the signal is caught and the handler returns (p. 365).
- **sleep** / **nanosleep** / **clock_nanosleep**: Functions suspending execution for a relative or absolute duration, at second, nanosecond, or clock-relative precision (pp. 373-375; Lec06).
- **sigqueue**: Real-time-extension function that queues a signal (instead of coalescing it) and attaches an integer or pointer value (p. 376).
- **job-control signals**: The six POSIX signals (`SIGCHLD`, `SIGCONT`, `SIGSTOP`, `SIGTSTP`, `SIGTTIN`, `SIGTTOU`) an interactive shell manages on a program's behalf (p. 377).
- **psignal** / **strsignal** / **sys_siglist**: Portable ways to map a signal number to a human-readable description (pp. 379-380).
## Full Reading Notes
### 10.1 Introduction
A **signal** is an asynchronous software notification the OS delivers to a process when some event occurs (p. 313). *Course Framing (Lec05):* unlike a hardware **interrupt** (a CPU-level notification), a signal is software-level and can interrupt normal execution at any arbitrary instruction. ==Signals are asynchronous - they can arrive at random times during execution, interrupting whatever instruction stream the recipient process was running.==
### 10.2 Signal Concepts
Every signal has a `SIG`-prefixed symbolic name, a positive integer constant in `<signal.h>` (pp. 313-314). Signal 0 is the **null signal** - carries no real condition, used only by `kill` to test process existence/permission (p. 314). Signals are generated by terminal keys (Ctrl-C → `SIGINT`, Ctrl-\ → `SIGQUIT`, Ctrl-Z → `SIGTSTP`), hardware exceptions (divide-by-zero, bad memory reference), the `kill` function/command, or software conditions (timer expiry, writing to a readerless pipe) (p. 314). Three **dispositions**: ignore (everything except `SIGKILL`/`SIGSTOP` can be), catch with a handler, or take the default action - often termination, sometimes termination-with-**core-file**, ignore, pause, or resume (p. 315). Core dumps can be restricted by set-user-ID permissions, write permission, or `RLIMIT_CORE` (pp. 315-317). *Numbered signal table (Lec05 / `kill -L`):* `SIGINT`=2 (terminate), `SIGFPE`=8 (terminate+core), `SIGKILL`=9 (terminate, uncatchable/unblockable), `SIGTERM`=15 (terminate, `kill`'s default), `SIGCHLD`=17 (ignore by default), `SIGCONT`=18 (resume), `SIGSTOP`=19 (pause, uncatchable/unblockable) - always use the symbolic names, never hardcode numbers. `SIGUSR1`/`SIGUSR2` are reserved purely for application-defined use (p. 322). Other named signals: `SIGABRT`, `SIGALRM`, `SIGBUS`, `SIGHUP` (daemons often reload config on it), `SIGILL`, `SIGINFO`, `SIGIOT`, `SIGPIPE`, `SIGQUIT`, `SIGSEGV`, `SIGSYS`, `SIGTSTP`, `SIGTTIN`, `SIGTTOU`, `SIGURG`, `SIGWINCH` (pp. 317-322). *Lifecycle:* generated → **pending** (not yet delivered, either awaiting a CPU turn or blocked) → **delivered** (kernel takes the disposition's action) → disposition executed (p. 335; Lec05). **Pending-signal coalescing:** a second instance of an already-pending signal type is silently dropped - after the fact, a handler can never tell how many times it actually fired (p. 336; Lec05). *Lab 02 job control:* `jobs` lists background/stopped jobs; `fg %1` resumes job 1 in the foreground via `SIGCONT`; `bg %1` resumes in the background; `kill %1` sends `SIGTERM` by default. `print_nums`'s `while(1){printf; sleep(1);}` demo: Ctrl-C (`SIGINT`) kills it, Ctrl-Z (`SIGTSTP`) stops it (shell prints "Stopped"), `fg %1` resumes exactly where it left off (`SIGCONT`).
### 10.3 signal Function
```c
void (*signal(int signo, void (*func)(int)))(int);
```
Or with a typedef: `typedef void Sigfunc(int); Sigfunc *signal(int, Sigfunc *);` (pp. 323-324). Returns the previous disposition or `SIG_ERR` (p. 323). Special values: `SIG_ERR` = `(void(*)())-1`, `SIG_DFL` = `(void(*)())0`, `SIG_IGN` = `(void(*)())1` (pp. 323, 325). Because ISO C's `signal` was never given real multiprocess semantics, System V's original implementation was unreliable and BSD had to build it on top of `sigaction` instead - *modern code should call `sigaction` directly and skip `signal` entirely* (p. 323; Lec05); `signal` also can't inspect a disposition without changing it (p. 326). *exec/fork semantics:* `exec` resets every *caught* signal to `SIG_DFL` (the handler's code doesn't exist in the new image) but leaves `SIG_IGN` signals ignored; a background command a non-job-control shell launches (`cc main.c &`) automatically gets `SIGINT`/`SIGQUIT` set to ignored, so a terminal interrupt doesn't kill it (p. 325). `fork` gives the child an exact copy of the parent's dispositions, since the child starts as a copy of the same address space where handler addresses are still valid (p. 326).
### 10.4 Unreliable Signals
Pre-4.2BSD UNIX signals were **unreliable**: a caught signal's disposition reset to `SIG_DFL` on *every* delivery, so the classic idiom `signal(SIGINT, sig_int); ... sig_int() { signal(SIGINT, sig_int); /* handle it */ }` has a real window - between the signal firing and the handler re-registering itself - where a second `SIGINT` hits the *default* action and kills the process outright, "working correctly most of the time" while being genuinely broken (p. 326). A second flaw: these older systems could only *ignore* a signal, never *block* it (remember-but-defer) - code that sets a flag in a handler and `pause()`s in a loop checking that flag has a matching race: if the signal fires between the flag check and the `pause()` call, it's lost and the process sleeps forever (p. 327).
### 10.5 Interrupted System Calls
A caught signal that arrives while a process is blocked in a "slow" system call interrupts it, returning -1 with `errno == EINTR` (p. 327). **Slow** calls can block indefinitely: `read`/`write` on pipes/terminals/network devices, `open` on FIFOs or terminal devices, `pause`, `wait`/`waitpid`, some `ioctl` operations - everything else, including disk I/O, is "fast" and returns quickly regardless (p. 328). *Tricky Item 1:* before automatic restart existed, every interrupted slow call needed a manual retry loop (`do { ret = read(...); } while (ret==-1 && errno==EINTR);`); today, setting `SA_RESTART` in `sigaction` makes the kernel restart the interrupted call automatically once the handler returns (p. 328-329; Lec06).
### 10.6 Reentrant Functions
A function is **reentrant** (async-signal safe) if a handler can safely call it while a prior call from main-line code is still mid-execution (p. 330; Lec06). Non-reentrant functions typically use static internal state, touch the heap (`malloc`/`free`), or belong to buffered stdio - `printf`, `malloc`, `free`, `strtok`, `getpwnam` are explicitly named unsafe (pp. 330-331; Lec06). *Tricky Item 3:* calling one from a handler while main-line code is mid-call to the same function corrupts its internal structures (a `malloc` free-list, say), producing unpredictable behavior up to `SIGSEGV` (pp. 331-332). *Tricky Item 2:* because `errno` is one global (or thread-local) slot, a handler that calls anything touching `errno` (like `stat` or `wait`) can silently overwrite the value main-line code was about to check after its own failed call - the fix is always save-then-restore at handler entry/exit:
```c
void my_handler(int signo) {
    int errno_save = errno;
    /* handler execution */
    errno = errno_save;
}
```
### 10.7 SIGCLD Semantics
`SIGCLD` (System V, no H) and `SIGCHLD` (BSD/POSIX) name the same event but have historically had *different* semantics, a real source of portability confusion (p. 332). Setting `SIGCLD`'s disposition to `SIG_IGN` on SVR4-tradition systems specifically suppresses zombie creation entirely - child status is discarded on termination, and a later `wait` call blocks until all children are gone, then fails with `ECHILD` (p. 333). Setting a *handler* for `SIGCLD` on those same systems makes the kernel immediately re-invoke the handler if a child is already waitable when the handler gets (re-)installed - meaning the classic "reinstall myself first thing in the handler" pattern from §10.4 actually causes infinite re-entry and stack exhaustion on true System V semantics; the fix is calling `signal()`/reinstalling *after* `wait()`, not before (pp. 333-335). FreeBSD, Mac OS X, and Linux don't reproduce this trap; Solaris does but works around it internally (p. 334).
### 10.8 Reliable-Signal Terminology and Semantics
Precise vocabulary this chapter relies on throughout (pp. 335-336): a signal is **generated**/**sent** when its triggering event occurs; it's **delivered** when the disposition's action actually runs; between the two it's **pending**. A **blocked** signal that's generated stays pending until the process either unblocks it or switches its disposition to ignore - crucially, the kernel decides what to do with a blocked signal *at delivery time*, not generation time, which is exactly what lets a process change its mind before the signal actually lands. POSIX.1 allows (but doesn't require) queuing a blocked signal generated multiple times before it's unblocked; ordinary UNIX signals just deliver once (real queuing needs the real-time extensions, §10.20). When several different signal types are all ready to deliver at once, POSIX doesn't define the order, though signals tied to the process's current state (like `SIGSEGV`) are suggested to go first. The **signal mask** - the set of currently blocked signals - is stored in a `sigset_t`, since the signal count can exceed the bits in a plain integer.
### 10.9 kill and raise Functions
```c
int kill(pid_t pid, int signo);
int raise(int signo);
```
Both return 0 or -1 (p. 337). `raise(signo)` is exactly `kill(getpid(), signo)` (p. 337). *pid rules for `kill`:* `pid > 0` → that specific process; `pid == 0` → every process in the sender's own process group; `pid < 0` → every process in group `|pid|`; `pid == -1` → broadcast to every process the sender has permission to signal (excluding certain system processes) (p. 337). `signo == 0` (the null signal) tests existence/permission without actually delivering anything - fails with `ESRCH` if the target doesn't exist, and this check is *not* atomic (p. 337-338). Sender needs superuser privilege, or its real/effective UID must match the target's (p. 337). *Course Framing (Lec05):* the name "kill" is a misnomer, since the recipient's disposition decides what actually happens - terminal syntax: `kill -s TERM 1234` or `kill -9 1234`.
### 10.10 alarm and pause Functions
```c
unsigned int alarm(unsigned int seconds);
```
Returns 0, or the number of seconds remaining on a previously set (and now replaced) alarm (p. 338). Sets a one-shot future **SIGALRM**; only one alarm clock exists per process, so a second call always replaces the first and returns what was left of it. Passing `seconds == 0` cancels any pending alarm, still returning its remaining time. Because the default action for `SIGALRM` is termination, most real uses catch it deliberately - and the handler must be installed *before* calling `alarm`, or a very fast-firing timer could terminate the process before the handler exists (p. 338-339).
```c
int pause(void);
```
Always returns -1 with `errno == EINTR`; only returns at all once some caught signal's handler has run and returned (p. 338; Lec06).
*Worked example - a naive `sleep` and its three real bugs:*
```c
static void sig_alrm(int signo) { /* nothing to do, just wake the pause */ }
unsigned int sleep1(unsigned int seconds) {
    if (signal(SIGALRM, sig_alrm) == SIG_ERR) return(seconds);
    alarm(seconds);
    pause();
    return(alarm(0));
}
```
Three problems (p. 339): (1) it clobbers any alarm the caller already had running; (2) it overwrites `SIGALRM`'s disposition without saving/restoring it for the caller; (3) - the real race - if `SIGALRM` fires and the handler runs *between* the `alarm()` call and the `pause()` call, `pause()` then blocks forever waiting for a signal that already happened. The historical SVR2 fix for problem 3 used `setjmp`/`longjmp` (§7.10) instead of `pause` at all - see the `sleep2` worked example in §10.15/10.19 below; the modern fix uses `sigprocmask`+`sigsuspend` (§10.19).
### 10.11 Signal Sets
`sigset_t` holds a bitmask of signals (p. 344; Lec05): `sigemptyset(set)` clears it (mandatory before first use), `sigfillset(set)` fills it, `sigaddset(set, signo)`/`sigdelset(set, signo)` add/remove one, `sigismember(set, signo)` tests membership - all return 0/-1 except the boolean-returning `sigismember`.
### 10.12 sigprocmask Function
```c
int sigprocmask(int how, const sigset_t *restrict set, sigset_t *restrict oset);
```
Returns 0 or -1 (p. 346). `how`: `SIG_BLOCK` (union `set` into the current mask), `SIG_UNBLOCK` (remove `set` from the current mask), `SIG_SETMASK` (replace outright) (p. 346; Lec05). `set == NULL` with a real `oset` just inspects the current mask (p. 346). `SIGKILL`/`SIGSTOP` can never be blocked - attempts are silently ignored or rejected (p. 346). *Critical-section pattern:*
```c
sigset_t newmask, oldmask;
sigemptyset(&newmask); sigaddset(&newmask, SIGINT);
sigprocmask(SIG_BLOCK, &newmask, &oldmask);
/* critical section */
sigprocmask(SIG_SETMASK, &oldmask, NULL);
```
### 10.13 sigpending Function
```c
int sigpending(sigset_t *set);
```
Returns 0 or -1 (p. 347). Fills `set` with whichever signals are currently both blocked and pending - lets a process check what happened while it was deliberately not listening, before it unblocks (p. 347-348).
### 10.14 sigaction Function
`signal()` is deprecated and unreliable across platforms; **`sigaction`** is the real, POSIX-standardized way to install or inspect a handler, closing an entire category of race conditions `signal()` leaves open (pp. 349-350; Lec06).
```c
int sigaction(int signo, const struct sigaction *restrict act, struct sigaction *restrict oact);
```
Returns 0 or -1 (p. 350). `struct sigaction` fields (p. 350): `sa_handler` (a handler function, or `SIG_DFL`/`SIG_IGN`); `sa_mask` (extra signals to block *while this handler runs* - the signal currently being handled is auto-blocked too, so it can't recursively interrupt itself); `sa_flags` (`SA_RESTART` for auto-restart, `SA_SIGINFO` to use the richer `sa_sigaction` callback instead); `sa_sigaction` (the `SA_SIGINFO`-mode handler, taking a `siginfo_t *`). Course-slide examples: ignoring `SIGINT` (`sa_handler = SIG_IGN`, mask filled, `SA_RESTART` set) and installing a custom handler the same way with `sa_handler = my_handler`.
### 10.15 sigsetjmp and siglongjmp Functions
`longjmp` (§7.10) is often called from a handler to jump back to a program's main loop instead of returning normally - but plain `setjmp`/`longjmp` leave the *signal mask* undefined across the jump: some platforms (FreeBSD, Mac OS X) restore it, others (Linux, Solaris) don't, so POSIX deliberately left it unspecified and instead defined a pair that lets the caller choose:
```c
int sigsetjmp(sigjmp_buf env, int savemask);
void siglongjmp(sigjmp_buf env, int val);
```
Identical to `setjmp`/`longjmp` except for the extra `savemask` argument - nonzero means `sigsetjmp` also captures the current signal mask into `env`, and `siglongjmp` restores it on the way back (p. 355-356). *Worked example:* a program installs handlers for `SIGUSR1` and `SIGALRM`, calls `sigsetjmp(jmpbuf, 1)` in `main`, then `pause()`s in a loop. `SIGUSR1`'s handler busy-waits 5 seconds (during which it sets a 3-second `alarm()`, so `SIGALRM` fires *during* `SIGUSR1`'s own handler - proving signals really do nest), then calls `siglongjmp(jmpbuf, 1)` back to `main`, which prints the restored signal mask and exits (pp. 356-357). A `volatile sig_atomic_t canjump` flag, set only *after* `sigsetjmp` returns, guards the handler's `siglongjmp` call so a signal arriving before the jump buffer is actually initialized doesn't jump into garbage - `sig_atomic_t` is ISO C's guarantee of a type that can be read/written without interruption, always paired with `volatile` because it's shared between the "two threads of control" that are main-line code and an asynchronously-firing handler (p. 357-358). The three-way timeline (main → `sig_usr1` → `sig_alrm` → back through `sig_usr1` → back to `main`) traces exactly which signals are in the mask during each segment: none in `main`, `SIGUSR1` blocked while inside its own handler, `SIGUSR1|SIGALRM` blocked while `SIGALRM`'s handler nests inside that (p. 358).
### 10.16 sigsuspend Function
```c
int sigsuspend(const sigset_t *sigmask);
```
Always returns -1 with `errno == EINTR` (p. 359; Lec06). Sets the process mask to `sigmask` **and** suspends for a caught signal, as one atomic, indivisible kernel operation - closing exactly the race §10.10's naive `sleep1` and the classic block/work/unblock/`pause()` idiom both leave open, where a signal delivered in the gap between unblocking and actually sleeping is simply lost (p. 359; Lec06). The handler runs first; once it returns, `sigsuspend` restores the prior mask and returns (p. 359). This is also the safe way to wait on a flag a handler sets (`volatile sig_atomic_t quitflag`) without a lost-wakeup race (pp. 361-362).
### 10.17 abort Function
```c
void abort(void);
```
Never returns (p. 365). Delivers `SIGABRT` to the caller via `raise`; ISO C requires that even if the process catches it and the handler *returns*, `abort` still doesn't return to its own caller - the only escape from inside the handler is `exit`, `_exit`, `_Exit`, `longjmp`, or `siglongjmp` (p. 365). POSIX further requires `abort` to override blocking or ignoring of `SIGABRT` entirely - a process cannot suppress its own `abort()` (p. 365). A reference POSIX implementation (Figure 10.25) resets `SIGABRT` to `SIG_DFL` if it was set to `SIG_IGN`, flushes all stdio streams before signaling if the default action will fire, unblocks `SIGABRT` explicitly (guaranteeing it can't be masked away), and sends the signal via `kill(getpid(), SIGABRT)` - if execution somehow returns (the caller caught and returned), it flushes again, forces `SIG_DFL`, and signals a second time as a final guarantee (pp. 365-366).
### 10.18 system Function
Chapter 8's `system()` implementation didn't do any signal handling; POSIX actually *requires* `system` to ignore `SIGINT` and `SIGQUIT` and block `SIGCHLD` for the duration of the command it runs (p. 367). Why this matters: running an interactive program like `ed` via `system()` means both the calling program *and* the child editor are in the same foreground process group, so a Ctrl-C hits both - without the fix, the caller's own `SIGINT` handler fires pointlessly (or terminates it) at the same moment the child program is legitimately handling the interrupt itself; and if `SIGCHLD` isn't blocked, the caller's own unrelated `SIGCHLD` handler (installed to track *its own* children) can spuriously fire when `system`'s own internal child - the shell it spawned - exits, confusing which "child" actually terminated (pp. 367-369). The corrected implementation (Figure 10.28) ignores `SIGINT`/`SIGQUIT` via `sigaction` (saving the old dispositions), blocks `SIGCHLD` via `sigprocmask` (saving the old mask), `fork`s, restores all three to their pre-`system()` state *in the child* before it execs `/bin/sh -c cmdstring`, and restores them in the parent after `waitpid` returns (p. 369-370).
### 10.19 sleep, nanosleep, and clock_nanosleep Functions
```c
unsigned int sleep(unsigned int seconds);
```
Returns 0 if the full duration elapsed, or the remaining unslept seconds if interrupted by a caught signal (p. 373; Lec06). Modern implementations build `sleep` on `nanosleep` specifically to avoid interfering with a caller's own `alarm`/`SIGALRM` usage (pp. 373-374). *Worked example - a truly reliable `sleep` (Figure 10.29):* installs a `SIGALRM` handler that does nothing but return (waking `sigsuspend`), blocks `SIGALRM` and saves the old mask, calls `alarm(seconds)`, then `sigsuspend`s on a mask with `SIGALRM` specifically unblocked - the atomicity of `sigsuspend` closes the same race `sleep1` (§10.10) had, without using `setjmp`/`longjmp` at all, so it doesn't disturb any other signal handler that might be mid-execution (p. 374).
```c
int nanosleep(const struct timespec *reqtp, struct timespec *remtp);
```
Returns 0 or -1 (p. 374). Nanosecond-precision relative sleep via `struct timespec` (`tv_sec`, `tv_nsec`); generates no signal of its own, so it composes cleanly with anything else using `alarm`; `remtp` (if non-null) gets the unslept remainder if interrupted (pp. 374-375).
```c
int clock_nanosleep(clockid_t clock_id, int flags, const struct timespec *reqtp, struct timespec *remtp);
```
Returns 0 or an error number (p. 375). Same idea, but relative to a specific clock (`CLOCK_REALTIME`, `CLOCK_MONOTONIC`, ...), and `flags = TIMER_ABSTIME` sleeps until an absolute target time rather than for a relative duration - important for periodic tasks, since a relative sleep recomputed each iteration accumulates drift from scheduling delays, while sleeping to an absolute, advancing target doesn't (p. 375).
### 10.20 sigqueue Function
Real-time extensions let some systems actually **queue** signals instead of coalescing them (p. 376). To use this: install the handler with `SA_SIGINFO` set (otherwise queuing is implementation-defined); use `sa_sigaction` instead of the plain `sa_handler`; and send with:
```c
int sigqueue(pid_t pid, int signo, const union sigval value);
```
Returns 0 or -1 (p. 376). Like `kill`, but targets exactly one process and lets the sender attach an integer or pointer `value`, retrievable by the handler through its `siginfo_t` argument. Queuing isn't infinite - hitting `SIGQUEUE_MAX` fails with `EAGAIN`. The signal numbers between `SIGRTMIN` and `SIGRTMAX` are reserved specifically for this kind of application-defined, queued use, and default to terminating the process if never handled (p. 376).
### 10.21 Job-Control Signals
POSIX names six signals as **job-control signals**: `SIGCHLD`, `SIGCONT`, `SIGSTOP`, `SIGTSTP`, `SIGTTIN`, `SIGTTOU` (p. 377). Ordinary applications mostly don't need to handle any of these themselves - the interactive shell does the real work: Ctrl-Z sends `SIGTSTP` to the whole foreground process group, resuming a job sends the whole group `SIGCONT`, and a background process that tries to read (`SIGTTIN`) or write (`SIGTTOU`) the controlling terminal gets stopped by default, with the shell surfacing that to the user (p. 377). The exception is a program that actively manages the terminal itself (`vi`, say) - it needs to know when it's being suspended, to restore terminal state cleanly, and when it's resumed, to reset that state and redraw (p. 377). Generating any of the four stop signals (`SIGTSTP`/`SIGSTOP`/`SIGTTIN`/`SIGTTOU`) discards a pending `SIGCONT` for that process, and vice versa - they can't usefully coexist as pending at once (p. 377). *Worked example (Figure 10.31):* a screen-managing program's `SIGTSTP` handler does terminal cleanup, then deliberately *unblocks* `SIGTSTP` (it's auto-blocked while its own handler runs), resets the disposition to `SIG_DFL`, and sends itself `SIGTSTP` again via `kill(getpid(), SIGTSTP)` - only *this* second, default-disposition delivery actually stops the process; once a later `SIGCONT` resumes it, execution continues right after that `kill` call, the handler is reinstalled, and terminal state gets redrawn (pp. 377-379). The program only installs this handler at all if `SIGTSTP`'s incoming disposition was `SIG_DFL` - if it's `SIG_IGN` (inherited from a non-job-control shell via `init`), it deliberately leaves it alone (p. 378-379).
### 10.22 Signal Names and Numbers
Portable ways to turn a signal number into a human-readable description (pp. 379-380): the `sys_siglist[]` array (indexed by signal number); `void psignal(int signo, const char *msg);` (writes `msg: description\n` to stderr, `perror`-style); `void psiginfo(const siginfo_t *info, const char *msg);` (same idea with a richer `siginfo_t`); `char *strsignal(int signo);` (returns the description string directly, `strerror`-style, for logging rather than printing to stderr). Solaris additionally provides `sig2str`/`str2sig` for round-tripping between a signal's number and its bare name (without the `SIG` prefix) - handy for interactive tools that accept signal names as text input.
## Worked Example
A robust `SIGCHLD` handler that reaps every terminated child without ever leaving a zombie or blocking the main program, tying together reentrancy, `errno`-safety, and pending-signal coalescing all at once:
```c
void sigchld_handler(int signo) {
    int errno_save = errno;
    pid_t pid; int status;
    while ((pid = waitpid(-1, &status, WNOHANG)) > 0) {
        /* child pid reaped; process status if needed */
    }
    errno = errno_save;
}
int main(void) {
    struct sigaction sa;
    sa.sa_handler = sigchld_handler;
    sigemptyset(&sa.sa_mask);
    sa.sa_flags = SA_RESTART;
    sigaction(SIGCHLD, &sa, NULL);
    for (;;) pause();
}
```
==The `while ((pid = waitpid(-1, &status, WNOHANG)) > 0)` loop exists specifically because signals coalesce: if several children exit at once while `SIGCHLD` is already blocked (inside its own handler), only one `SIGCHLD` delivery is guaranteed, so the handler has to drain every *actually* dead child, not just react once.== `SA_RESTART` keeps any slow system call in `main` from failing with `EINTR` every time a child happens to exit. Saving/restoring `errno` matters because the loop's own terminating call, `waitpid(-1, ...)` returning -1 with `errno = ECHILD` once nothing's left to reap, would otherwise silently overwrite whatever `errno` the interrupted main-line code cared about.
## Connections
- **Lecture (Lec05, 9/22; Lec06, 9/24):** Lec05 covers signal definitions, the numbered `kill -L` table, the four-state lifecycle, and signal masks/blocking. Lec06 covers the three "tricky items" (interrupted system calls + `SA_RESTART`, `errno` corruption + save/restore, non-reentrant functions), `sigaction` in depth, and the `pause()`-race motivation for `sigsuspend()`.
- **Lecture coverage gaps:** §10.4 (unreliable-signal history), §10.7 (`SIGCLD`), §10.8 (reliable-signal terminology), `alarm()` specifically within §10.10 (only `pause()` got slide time), §10.15 (`sigsetjmp`/`siglongjmp`), §10.17 (`abort`), §10.18 (`system` with signal handling), §10.20 (`sigqueue`), and §10.21-22 (formal job-control-signal treatment, name/number utilities) have no matching slide in Lec01-06 - textbook-only for this course so far.
- **Lab 02:** provides the hands-on shell-level complement to this chapter's low-level API - `jobs`/`fg`/`bg`/`kill`, and the `print_nums` Ctrl-C/Ctrl-Z/`fg` demo, are job control (§10.21) experienced from the outside before this chapter explains the six signals making it work from the inside.
- **Textbook ([[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter 7]]):** §10.15's `sigsetjmp`/`siglongjmp` is the direct signal-safe sequel to Chapter 7 §7.10's plain `setjmp`/`longjmp` - the exact same nonlocal-branch mechanism, extended to also save/restore the signal mask across the jump, which plain `setjmp` never defined.
- **Textbook (pending [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter 4]]):** this chapter previews file-system material (i-nodes, paths, directories) via Lec06, already captured in Chapter 4's own note rather than duplicated here.
## Open Questions
- [ ] Implement a test program demonstrating real `errno` corruption: modify `errno` inside a `SIGINT` handler without saving/restoring it, and confirm a main-line error check reads the wrong value afterward.
- [ ] Write a parent-child program using `sigsuspend()` and `SIGUSR1`/`SIGUSR2` to alternate turns deterministically between the two processes.
- [ ] ==Benchmark interrupted slow system calls with `SA_RESTART` enabled versus disabled, catching `SIGINT` during a blocking `read()`.==
- [ ] Reproduce the §10.15 `sigsetjmp` timeline example on the course container and confirm the signal mask really does differ across the three code regions (main / `sig_usr1` / `sig_alrm`).
- [ ] Test pending-signal coalescing directly: spawn 10 children that all exit simultaneously and count how many `SIGCHLD` deliveries the parent's handler actually observes.
## Flashcards
#cards/csci4061
Why must a `SIGCHLD` handler call `waitpid(-1, &status, WNOHANG)` in a loop rather than calling `wait()` once?::Because UNIX signals coalesce - multiple children exiting while `SIGCHLD` is blocked can still generate only one delivery - looping with `WNOHANG` reaps every actually-dead child until none remain, instead of assuming one delivery means one dead child.
How does `sigsuspend(&mask)` eliminate the race condition that a separate `sigprocmask()`-then-`pause()` sequence leaves open?::==It sets the process signal mask and suspends execution for a caught signal in one atomic, indivisible kernel operation, so no signal can arrive in an unblocked-but-not-yet-sleeping gap and get lost.==
Why does `abort()` never return to its caller, even if the calling process catches `SIGABRT` and the handler itself returns normally?::ISO C and POSIX both require this - the only way out of an `abort()`-triggered handler is to call `exit`/`_exit`/`_Exit`/`longjmp`/`siglongjmp` from inside it; if the handler just returns, `abort()` forces termination anyway rather than resuming the original caller.
What extra guarantee does `sigsetjmp`/`siglongjmp` provide over plain `setjmp`/`longjmp` that matters specifically inside a signal handler?::Plain `setjmp`/`longjmp` leave the process's signal mask undefined across the jump - platforms disagree on whether it's restored. `sigsetjmp(env, 1)` explicitly saves the mask, and `siglongjmp` explicitly restores it, so code branching out of a handler can rely on consistent mask behavior everywhere.
Why does POSIX require `system()` to block `SIGCHLD` and ignore `SIGINT`/`SIGQUIT` while its command runs?::Blocking `SIGCHLD` stops the caller's own child-tracking handler from misfiring when `system()`'s internal shell child exits; ignoring `SIGINT`/`SIGQUIT` stops the caller from also reacting to a terminal interrupt that's really meant for the interactive program `system()` just launched, which shares the same foreground process group.
Why does the classic block-then-work-then-unblock-then-`pause()` pattern for waiting on a signal have a real bug, not just a theoretical one?::If the signal arrives in the gap between the unblock call and the `pause()` call, the kernel delivers it immediately - the handler runs, but by the time `pause()` actually executes, that signal is already gone, and `pause()` can block forever waiting for one that already happened.

```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && for f in "Chapter - 3" "Chapter - 4" "Chapter - 8" "Chapter - 10"; do echo "=== $f ==="; awk '/^## /{print}' "20_Progress/Degree/CSCI 4061/Textbook/$f.md"; done`
```
=== Chapter - 3 ===
## Chapter Summary
## Key Concepts
## Full Reading Notes
## Worked Example
## Connections
## Open Questions
## Flashcards
=== Chapter - 4 ===
## Chapter Summary
## Key Concepts
## Full Reading Notes
## Worked Example
## Connections
## Open Questions
## Flashcards
=== Chapter - 8 ===
## Chapter Summary
## Key Concepts
## Full Reading Notes
## Worked Example
## Connections
## Open Questions
## Flashcards
=== Chapter - 10 ===
## Chapter Summary
## Key Concepts
## Full Reading Notes
## Worked Example
## Connections
## Open Questions
## Flashcards
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && for f in "Chapter - 3" "Chapter - 4" "Chapter - 8" "Chapter - 10"; do
echo "=== $f ==="
echo "blank lines outside code fences:"
awk '/^```/{f=!f} f{next} /^$/{print NR}' "20_Progress/Degree/CSCI 4061/Textbook/$f.md"
echo "flashcard count:"
awk '/^## Flashcards/{c=1;next} c && /^#cards\//{next} c && NF{n++} END{print n}' "20_Progress/Degree/CSCI 4061/Textbook/$f.md"
done`
```
=== Chapter - 3 ===
blank lines outside code fences:
flashcard count:
7
=== Chapter - 4 ===
blank lines outside code fences:
flashcard count:
7
=== Chapter - 8 ===
blank lines outside code fences:
flashcard count:
7
=== Chapter - 10 ===
blank lines outside code fences:
flashcard count:
6
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && for f in "Chapter - 3" "Chapter - 4" "Chapter - 8" "Chapter - 10"; do
echo "=== $f ==="
echo "-- Chapter Summary highlight check --"
awk '/^## Chapter Summary/{f=1;next} /^## /{f=0} f && /==/{print}' "20_Progress/Degree/CSCI 4061/Textbook/$f.md"
echo "-- stray #cards/ai check --"
grep -c '#cards/ai' "20_Progress/Degree/CSCI 4061/Textbook/$f.md"
done`
```
Exit code 1
=== Chapter - 3 ===
-- Chapter Summary highlight check --
UNIX file I/O gives every process one uniform, integer-indexed handle - the ==file descriptor== - for reading, writing, and controlling anything from a regular file to a pipe or a terminal, with unbuffered system calls doing the real work underneath the buffered stdio layer (p. 61).
-- stray #cards/ai check --
0
=== Chapter - 4 ===
-- Chapter Summary highlight check --
The UNIX file system abstracts a raw array of disk blocks into a hierarchical tree of named files and directories, and almost everything a program needs to know about a file - its size, type, owner, permissions, link count, timestamps - lives in one place: ==the file's i-node, addressed by number, never by name== (p. 93).
-- stray #cards/ai check --
0
=== Chapter - 8 ===
-- Chapter Summary highlight check --
Every UNIX process is created, replaced, and reaped through exactly three primitives - `fork`, `exec`, `wait`/`waitpid` - and ==almost everything else in this chapter is either a variation on one of those three or a consequence of the fact that a running process has an identity (PIDs, UIDs, GIDs) that outlives any single program image running inside it== (p. 227).
-- stray #cards/ai check --
0
=== Chapter - 10 ===
-- Chapter Summary highlight check --
A **signal** is a software notification that can land on a process at any instruction boundary, and ==almost every hard part of this chapter is really the same problem restated: code written assuming uninterrupted, sequential execution breaks the moment a signal handler can run in the middle of it== (p. 313).
-- stray #cards/ai check --
0
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && grep -ohE '\[\[[^]]+\]\]' "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3.md" "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4.md" "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8.md" "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10.md" | sort -u`
```
[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter 10]]
[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter 1]]
[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter 3]]
[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter 4]]
[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter 7]]
[[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]]
[[CSCI 4061 Board]]
```
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Textbook Map.md`
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Textbook Map.md`
```diff
- next: "Build 2: source-check Chapters 3, 4, 8, and 10 against the textbook PDF the same way Chapters 1 and 7 were source-checked in Build 1"
---
+ next: "All six landed chapter notes are now source-checked - create Chapter 15 (Pipes, §15.1-15.2) once Week 4's real lectures happen"
---
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Textbook Map.md`
```diff
- - **Ch 1, 7, 8** - Week 1: System calls, process management basics. [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter 1]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter 7]] are landed and **source-checked against the textbook PDF** (2026-09-29). [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8|Chapter 8]] is landed but not yet source-checked.
- **Ch 7, 3** - Week 2: Process management continued, low-level and advanced I/O. [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter 3]] is landed but not yet source-checked.
- **Ch 10, 4** - Week 3: Signals, intro file systems. [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter 10]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter 4]] are landed but not yet source-checked.
- **Ch 4, 15.1-15.2** - Week 4: File systems continued, IPC pipes. Chapter 4 is landed (not source-checked); no note exists yet for §15.1-15.2.
- **15.1, 15.2, 15.9** - Week 5: IPC pipes and shared memory. No chapter note yet.
- **15.9, 14.4** - Week 6: Finish IPC/multiplexed I/O, systems programming in Python and C/Python interop. No chapter note yet.
- **Ch 11** - Week 7: Threads, basic synchronization. No chapter note yet.
- **Ch 11, 12, 16** - Week 8: Advanced synchronization, start networking. No chapter note yet.
- **Ch 16** - Week 9: Sockets, UDP/TCP, HTTP. No chapter note yet.
Six chapter notes exist as of 2026-09-29 (Chapters 1, 3, 4, 7, 8, 10), covering Weeks 1-4's reading in full - only Chapters 1 and 7 have been checked against the actual textbook PDF so far (Build 1 of the current perfecting pass); Chapters 3, 4, 8, and 10 remain in their original, unverified state until Build 2. Chapters for Weeks 5+ are created as their weeks are actually covered, per [[Weekly Standard]].
+ - **Ch 1, 7, 8** - Week 1: System calls, process management basics. [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter 1]], [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter 7]], and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8|Chapter 8]] are all landed and **source-checked against the textbook PDF**.
- **Ch 7, 3** - Week 2: Process management continued, low-level and advanced I/O. [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter 3]] is landed and source-checked.
- **Ch 10, 4** - Week 3: Signals, intro file systems. [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter 10]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter 4]] are landed and source-checked.
- **Ch 4, 15.1-15.2** - Week 4: File systems continued, IPC pipes. Chapter 4 (source-checked) covers the file-systems half; no note exists yet for §15.1-15.2 (Pipes) - Chapter 15 is the next chapter note this course needs, once Week 4's own lectures actually happen.
- **15.1, 15.2, 15.9** - Week 5: IPC pipes and shared memory. No chapter note yet.
- **15.9, 14.4** - Week 6: Finish IPC/multiplexed I/O, systems programming in Python and C/Python interop. No chapter note yet.
- **Ch 11** - Week 7: Threads, basic synchronization. No chapter note yet.
- **Ch 11, 12, 16** - Week 8: Advanced synchronization, start networking. No chapter note yet.
- **Ch 16** - Week 9: Sockets, UDP/TCP, HTTP. No chapter note yet.
All six landed chapter notes (Chapters 1, 3, 4, 7, 8, 10) are now source-checked against the textbook PDF as of 2026-09-29 (Build 1 covered Chapters 1 and 7; Build 2 covered Chapters 3, 4, 8, and 10), matching Weeks 1-4's reading in full. Chapters for Weeks 5+ are created as their weeks are actually covered, per [[Weekly Standard]].
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Textbook Map.md`
```diff
- ## Status
Six chapter notes exist as of 2026-09-29, matching Weeks 1-4's full reading list. Two (Chapters 1 and 7) are source-checked against the actual textbook PDF, restructured to this vault's real Textbook Standard shape (`Full Reading Notes` heading restored, duplicate template stubs removed, frontmatter fixed, flashcards capped at 10 under `#cards/csci4061`), and enriched with worked examples the original NotebookLM pass had dropped - see each chapter's own Connections section for the lecture-coverage-gap detail. The remaining four (Chapters 3, 4, 8, 10) still carry the original pass's structural issues (missing `Full Reading Notes` heading, duplicate stub sections, blank frontmatter dates, `area:` pointing at `[[UMN Board]]` instead of this course's own Board) and are the explicit target of Build 2.
+ ## Status
All six chapter notes (Chapters 1, 3, 4, 7, 8, 10) are now source-checked against the actual textbook PDF as of 2026-09-29, matching Weeks 1-4's full reading list. Every chapter was restructured to this vault's real Textbook Standard shape (`Full Reading Notes` heading restored where missing, duplicate template stubs removed, frontmatter fixed - real `created`/`updated` dates and `area:` pointing at this course's own Board and Map instead of `[[UMN Board]]`, flashcards capped at 10 under `#cards/csci4061`), and enriched with real content the original NotebookLM pass had dropped entirely: Chapter 3 gained `lseek`, I/O-efficiency benchmarks, `sync`/`fsync`/`fdatasync`, `fcntl`, `ioctl`, and `/dev/fd`; Chapter 4 gained roughly twenty missing subsections (setuid/setgid, `umask`, `chmod`, the sticky bit, `chown`, file truncation, hard and symbolic links, `rename`, file times, `mkdir`/`rmdir`, directory reading, and device special files - previously only 6 of 26 subsections existed); Chapter 7 gained the entire `setjmp`/`longjmp` section (§7.10) and `getrlimit`/`setrlimit` (§7.11); Chapter 8 gained changing UIDs/GIDs, interpreter files, `system`, process accounting, `getlogin`, scheduling, and process times (§8.11-8.17); Chapter 10 gained unreliable-signal history, `SIGCLD` semantics, reliable-signal terminology, `alarm()`, `sigsetjmp`/`siglongjmp`, `abort`, signal-aware `system`, `sigqueue`, formal job-control signals, and signal name/number utilities. See each chapter's own Connections section for exactly which sections still have no matching lecture slide (mostly textbook-only material Lec01-06 never touched).
```
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Weekly Board.md`
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Weekly Board.md`
```diff
- next: "Live-capture Week 4's real lectures (9/29, 10/1) once they happen; source-check Chapters 3, 4, 8, 10 in Build 2 and reconcile Weeks 2-4's provisional citations against them"
---
# CSCI 4061 — Weekly Board
Index of this course's week-by-week synthesis notes. [[CSCI 4061 Board]] is the full syllabus, grading, and schedule source - this note tracks only the weekly-note layer as it fills in over the semester.
## Map
- [[Week - 1]] - captured and reconciled. Lec01 (9/8, course intro/OS framing) and Lec02 (9/10, `_start()`/memory layout/`fork`/`exec`/`wait`), synthesized against [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]], both source-checked this session.
- [[Week - 2]] - captured and reconciled. Lec03 (9/15) and Lec04 (9/17), low-level I/O (`open`/`read`/`write`), file permissions, the fd-table/system-file-table/inode chain, `dup2`/redirection, and pipes. Cites [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter - 3]], which is **not yet source-checked** - treat those citations as provisional until Build 2.
- [[Week - 3]] - captured and reconciled. Lec05 (9/22) and Lec06 (9/24), signals end-to-end plus an early preview of file systems/i-nodes. Cites [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]], **neither source-checked yet** - provisional until Build 2.
- [[Week - 4]] - **pre-lecture scaffold only**, built 2026-09-29 before that week's lectures (9/29, 10/1) happen. No `Lec07`/`Lec08` exists in the source folder yet. Fill the real `## Lecture` capture live once class happens, per [[Weekly Standard]]'s lifecycle rule.
Each week follows [[Weekly Standard]], cross-referenced against the reading assignments in [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]].
## Status
4 of 15 weeks now have notes as of 2026-09-29 - Weeks 1-3 captured and reconciled, Week 4 a pre-lecture scaffold awaiting real lecture. The weekly layer is **current, not ahead**: it tracks exactly through the last lecture that has actually happened (9/24), with Week 4 honestly marked incomplete rather than backfilled. The earliest real gap is Week 4's live lecture capture, due once 9/29's and 10/1's lectures happen. A second, separate gap: only [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]] have been source-checked against the textbook PDF (this session's Build 1) - Chapters 3, 4, 8, and 10 remain in their original, unverified state, and every weekly note above that cites them flags this explicitly.
+ next: "Live-capture Week 4's real lectures (9/29, 10/1) once they happen - all six chapter notes are now source-checked, so no textbook-side gap remains"
---
# CSCI 4061 — Weekly Board
Index of this course's week-by-week synthesis notes. [[CSCI 4061 Board]] is the full syllabus, grading, and schedule source - this note tracks only the weekly-note layer as it fills in over the semester.
## Map
- [[Week - 1]] - captured and reconciled. Lec01 (9/8, course intro/OS framing) and Lec02 (9/10, `_start()`/memory layout/`fork`/`exec`/`wait`), synthesized against [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]], both source-checked.
- [[Week - 2]] - captured and reconciled. Lec03 (9/15) and Lec04 (9/17), low-level I/O (`open`/`read`/`write`), file permissions, the fd-table/system-file-table/inode chain, `dup2`/redirection, and pipes. Cites [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter - 3]], now source-checked in Build 2.
- [[Week - 3]] - captured and reconciled. Lec05 (9/22) and Lec06 (9/24), signals end-to-end plus an early preview of file systems/i-nodes. Cites [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]], both now source-checked in Build 2.
- [[Week - 4]] - **pre-lecture scaffold only**, built 2026-09-29 before that week's lectures (9/29, 10/1) happen. No `Lec07`/`Lec08` exists in the source folder yet. Fill the real `## Lecture` capture live once class happens, per [[Weekly Standard]]'s lifecycle rule.
Each week follows [[Weekly Standard]], cross-referenced against the reading assignments in [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]].
## Status
4 of 15 weeks now have notes as of 2026-09-29 - Weeks 1-3 captured and reconciled, Week 4 a pre-lecture scaffold awaiting real lecture. The weekly layer is **current, not ahead**: it tracks exactly through the last lecture that has actually happened (9/24), with Week 4 honestly marked incomplete rather than backfilled. The earliest real gap is Week 4's live lecture capture, due once 9/29's and 10/1's lectures happen. The textbook-side gap flagged after Build 1 is now closed: all six landed chapter notes ([[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]], [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter - 3]], [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]], [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]], [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8|Chapter - 8]], [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]]) are source-checked against the textbook PDF as of Build 2 (2026-09-29) - the "provisional" language in Weeks 2-3's own Connections sections is now stale and should be read as resolved.
```
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Week - 2.md`
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Week - 2.md`
```diff
- None created. Low-level I/O (`open`/`read`/`write`/`dup2`), file permissions, and the descriptor/system-file/inode table chain are captured directly in [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]] (environment/memory pieces) and the course's existing [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter - 3]] note, which was **not** part of this session's perfecting pass (only Chapters 1 and 7 were source-checked in Build 1) - treat Chapter 3 citations below as provisional until Build 2 gives it the same treatment.
+ None created. Low-level I/O (`open`/`read`/`write`/`dup2`), file permissions, and the descriptor/system-file/inode table chain are captured directly in [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]] (environment/memory pieces) and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter - 3]], both now source-checked against the textbook PDF.
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Week - 2.md`
```diff
- > Main chapters: [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]] (already source-checked this session) and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter - 3]] (Files and Directories - low-level I/O, assigned this week but not yet source-checked; treat as provisional until Build 2).
The two lectures' file-descriptor-table/system-file-table/inode-table picture and the `dup`/`dup2` mechanics match what Chapter 3 is expected to cover in depth (open/read/write/lseek/close, atomic operations, `dup`, `fcntl`), but that chapter note has not been verified against the actual textbook PDF this session - only Chapters 1 and 7 got that treatment in Build 1. As already flagged in the [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]], two real gaps sit outside all six landed chapter notes: the file-permission-bits material (APUE §4.5-4.9, actually Chapter 4) and the buffering material (APUE Chapter 5, never assigned as its own reading) - both were taught this week even though neither has a proper textbook-note home yet.
+ > Main chapters: [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter - 3]] (Files and Directories - low-level I/O), both source-checked against the textbook PDF.
The two lectures' file-descriptor-table/system-file-table/inode-table picture and the `dup`/`dup2` mechanics match Chapter 3's own §3.10-3.12 in full detail, now confirmed against the actual textbook PDF, which also fills in real gaps the lectures alone left open: `lseek`/file holes (§3.6), I/O-efficiency benchmarks (§3.9), and `sync`/`fsync`/`fcntl`/`ioctl`/`/dev/fd` (§3.13-3.16), none of which either lecture covered. As already flagged in the [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]], two real gaps still sit outside all six landed chapter notes: the file-permission-bits material (APUE §4.5-4.9, actually Chapter 4, now captured in full in Chapter 4's own note) and the buffering material (APUE Chapter 5, never assigned as its own reading and still genuinely homeless) - both were taught this week regardless.
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Week - 2.md`
```diff
- - [ ] Once Chapter 3 gets its own perfecting pass, confirm its treatment of the "lowest available fd" rule and the atomic-append (`O_APPEND`) guarantee against this week's lecture claims.
- [ ] Trace the shared-file-offset-after-`fork()` example by hand for a different interleaving (child reads first) and predict the resulting file contents.
+ - [ ] Reproduce Chapter 3's §3.6 file-hole example (`lseek` past EOF, then write) on the course container and confirm `st_size` vs. actual disk usage diverge the way the book predicts.
- [ ] Trace the shared-file-offset-after-`fork()` example by hand for a different interleaving (child reads first) and predict the resulting file contents.
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Week - 2.md`
```diff
- - Textbook connection: [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter - 3]] is expected to formalize this exact table chain (provisional - not yet source-checked); [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]] supplies the process-environment groundwork (fd inheritance across `fork`/`exec`) this week's lecture builds on.
+ - Textbook connection: [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter - 3]] formalizes this exact table chain in full, now source-checked; [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]] supplies the process-environment groundwork (fd inheritance across `fork`/`exec`) this week's lecture builds on.
```
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Week - 3.md`
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Week - 3.md`
```diff
- None created. Signals are captured in the course's existing [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]] note and file systems in [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]] - **neither chapter has been through this session's source-checking pass** (Build 1 only perfected Chapters 1 and 7), so treat both citations below as provisional until Build 2.
+ None created. Signals are captured in [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]] and file systems in [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]], both now source-checked against the textbook PDF.
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Week - 3.md`
```diff
- > Main chapters: [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]] (Signals) and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]] (Files and Directories - i-nodes, paths, permissions in depth) - **neither has been source-checked against the actual textbook PDF this session**; Build 1 only perfected Chapters 1 and 7, so treat every claim below as provisional until Build 2 verifies these two chapters directly.
Lec06 previewing file-system material (storage devices, i-nodes, paths, directories) a full week before Chapter 4's own scheduled Week 4 reading is already flagged in the [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]]'s 2026-09-24 correction - this week's Lecture section above captures that preview honestly rather than pretending it belongs to Week 4 alone. What lecture likely adds beyond the book on signals: the `SA_RESTART`/fast-vs-slow-syscall history and the `errno`-clobbering worked example read like course-specific emphasis rather than verbatim textbook prose, but this can't be confirmed precisely until Chapter 10 gets its own perfecting pass.
+ > Main chapters: [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]] (Signals) and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]] (Files and Directories - i-nodes, paths, permissions in depth), both now source-checked against the actual textbook PDF.
Lec06 previewing file-system material (storage devices, i-nodes, paths, directories) a full week before Chapter 4's own scheduled Week 4 reading is already flagged in the [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]]'s 2026-09-24 correction - this week's Lecture section above captures that preview honestly rather than pretending it belongs to Week 4 alone. What lecture adds beyond the book on signals, now confirmed against Chapter 10's own note: the `SA_RESTART`/fast-vs-slow-syscall history and the `errno`-clobbering worked example genuinely are course-specific emphasis, not verbatim textbook prose - the book itself covers the same ground more formally across §10.4-10.8, none of which either lecture touched (unreliable-signal history, `SIGCLD` vs. `SIGCHLD`, and the precise pending/blocked/delivered terminology).
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Week - 3.md`
```diff
- - [ ] Once Chapter 10 is source-checked, confirm its treatment of `SA_RESTART` and the fast/slow system-call history against this week's lecture claims.
- [ ] Once Chapter 4 is source-checked, confirm the direct/single-indirect/double-indirect/triple-indirect i-node pointer structure against the book's own figures.
+ - [ ] Reproduce Chapter 10's §10.15 `sigsetjmp`/`siglongjmp` timeline example (§10.15) on the course container and confirm the signal mask really differs across the three code regions the book traces.
- [ ] Confirm the direct/single-indirect/double-indirect/triple-indirect i-node pointer structure this week's lecture sketches matches Chapter 4's own §4.14 figures exactly.
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Week - 3.md`
```diff
- - Textbook connection: [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]] is expected to formalize the signal lifecycle and `sigaction()` API this week's lecture walks through hands-on (provisional - not yet source-checked); [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]] is expected to formalize the i-node/directory-lookup chain this week's lecture previews (also provisional).
+ - Textbook connection: [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]] formalizes the signal lifecycle and `sigaction()` API this week's lecture walks through hands-on, now source-checked; [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]] formalizes the i-node/directory-lookup chain this week's lecture previews, also source-checked.
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && grep -n "provisional\|not yet source-checked\|not been through\|Build 2" "20_Progress/Degree/CSCI 4061/Weekly/Week - 1.md"`
```
33:None created. This week's material - system calls, `fork`/`exec`/`wait`, memory layout, environment variables - is fully captured inside [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]]. A cross-cutting "process lifecycle" concept note (fork/exec/wait/zombie/orphan/daemon, spanning Chapters 1, 7, and 8) is a reasonable Build 2 candidate once [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8|Chapter - 8]] gets the same perfecting pass.
61:> Main chapters: [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]] (UNIX System Overview) and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]] (Process Environment); [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8|Chapter - 8]] (Process Control - `fork`/`exec`/`wait` in full) is assigned reading too but has not been through the same source-checking pass this session did for Chapters 1 and 7, so treat its citations below as provisional until Build 2.
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Week - 1.md`
```diff
- None created. This week's material - system calls, `fork`/`exec`/`wait`, memory layout, environment variables - is fully captured inside [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]]. A cross-cutting "process lifecycle" concept note (fork/exec/wait/zombie/orphan/daemon, spanning Chapters 1, 7, and 8) is a reasonable Build 2 candidate once [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8|Chapter - 8]] gets the same perfecting pass.
+ None created. This week's material - system calls, `fork`/`exec`/`wait`, memory layout, environment variables - is fully captured inside [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]], [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]], and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8|Chapter - 8]], all three now source-checked. A cross-cutting "process lifecycle" concept note (fork/exec/wait/zombie/orphan/daemon, spanning all three) remains a reasonable future candidate, just not created this session.
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Week - 1.md`
```diff
- > Main chapters: [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]] (UNIX System Overview) and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]] (Process Environment); [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8|Chapter - 8]] (Process Control - `fork`/`exec`/`wait` in full) is assigned reading too but has not been through the same source-checking pass this session did for Chapters 1 and 7, so treat its citations below as provisional until Build 2.
+ > Main chapters: [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]] (UNIX System Overview), [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]] (Process Environment), and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8|Chapter - 8]] (Process Control - `fork`/`exec`/`wait` in full), all three now source-checked against the textbook PDF.
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Week - 1.md`
```diff
- area:
  - "[[CSCI 4061 Board]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]]"
tags:
  - "#class"
  - "#Lecture"
next: "[[Week - 2]]"
+ area:
  - "[[CSCI 4061 Board]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8|Chapter - 8]]"
tags:
  - "#class"
  - "#Lecture"
next: "[[Week - 2]]"
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && echo "=== git status ===" && git status --short -- "20_Progress/Degree/CSCI 4061" && echo "=== blank line check on edited weekly notes ===" && for f in "Week - 1" "Week - 2" "Week - 3"; do echo "-- $f --"; awk '/^```/{f=!f} f{next} /^$/{print NR}' "20_Progress/Degree/CSCI 4061/Weekly/$f.md"; done`
```
=== git status ===
 M "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10.md"
 M "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4.md"
 M "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8.md"
 M "20_Progress/Degree/CSCI 4061/Textbook/Textbook Map.md"
 M "20_Progress/Degree/CSCI 4061/Weekly/Week - 1.md"
 M "20_Progress/Degree/CSCI 4061/Weekly/Week - 2.md"
 M "20_Progress/Degree/CSCI 4061/Weekly/Week - 3.md"
 M "20_Progress/Degree/CSCI 4061/Weekly/Weekly Board.md"
=== blank line check on edited weekly notes ===
-- Week - 1 --
-- Week - 2 --
-- Week - 3 --
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && for f in "Chapter - 3" "Chapter - 4" "Chapter - 8" "Chapter - 10"; do echo "$f: $(wc -l < "20_Progress/Degree/CSCI 4061/Textbook/$f.md") lines"; done`
```
Chapter - 3: 184 lines
Chapter - 4: 207 lines
Chapter - 8: 184 lines
Chapter - 10: 223 lines
```

## Actions Taken

**Files created:**
- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Chapter - 1.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Chapter - 10.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Chapter - 3.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Chapter - 4.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Chapter - 7.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Chapter - 8.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Week - 1.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Week - 2.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Week - 3.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Week - 4.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Documents\Jarvis\PLACEHOLDER.md`

**Files modified:**
- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\CSCI 4061 Board.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Textbook\Textbook Map.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4061\Weekly\Weekly Board.md`

**Files deleted (heuristic, from Bash commands):**
- `rm "D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Documents\Jarvis\PLACEHOLDER.md" && rmdir "D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Documents\Jarvis" 2>/dev/null; rmdir "D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Documents" 2>/dev/null; ls "D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\" | head -5`
- `rm -f "D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Documents\Jarvis\PLACEHOLDER.md"
rmdir "D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Documents\Jarvis" 2>/dev/null
rmdir "D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Documents" 2>/dev/null
ls "D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\"`
- `rm -f "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Documents/Jarvis/PLACEHOLDER.md"
rmdir "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Documents/Jarvis" 2>/dev/null
rmdir "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Documents" 2>/dev/null
ls "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/"`

**Commands run:**
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && find "20_Progress/Degree/CSCI 4061" -type f | sort`
- `find "D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061" -maxdepth 4 2>&1 | sort`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && echo "--- Chapter 1 first commit ---" && git log --follow --diff-filter=A --format="%ad %h" --date=short -- "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1.md" && echo "--- Chapter 7 first commit ---" && git log --follow --diff-filter=A --format="%ad %h" --date=short -- "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7.md" && echo "--- last commits touching these ---" && git log -3 --format="%ad %h %s" --date=short -- "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1.md" "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7.md"`
- `which pdftotext pdftoppm python3 python 2>&1; python3 -c "import fitz" 2>&1; python3 -c "import pypdf" 2>&1; python3 -c "import PyPDF2" 2>&1`
- `cd "D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\Textbook" && pdftotext -f 20 -l 30 -layout "Advanced Programming in the UNIX Environment, 3rd Edition.pdf" - | head -c 3000`
- `cd "D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\Textbook" && mkdir -p /tmp/apue 2>/dev/null; pdftotext -layout "Advanced Programming in the UNIX Environment, 3rd Edition.pdf" "/tmp/apue/full.txt" && wc -l /tmp/apue/full.txt && grep -n "UNIX Architecture" /tmp/apue/full.txt | head -5`
- `sed -n '1150,1260p' /tmp/apue/full.txt`
- `grep -n "^1\.[0-9]* \|^7\.[0-9]* \|^Chapter 2$\|^Chapter 8$\|System Calls and Library Functions\|Summary$" /tmp/apue/full.txt | sed -n '1,60p'`
- `grep -n "^7\.1[12] \|^7\.12 Summary\|^Exercises$" /tmp/apue/full.txt | sed -n '1,10p'; echo "---"; sed -n '12705,12900p' /tmp/apue/full.txt`
- `sed -n '2101,2276p' /tmp/apue/full.txt`
- `sed -n '2276,2410p' /tmp/apue/full.txt`
- `sed -n '1330,1548p' /tmp/apue/full.txt`
- `sed -n '1548,1896p' /tmp/apue/full.txt`
- `sed -n '1896,2101p' /tmp/apue/full.txt`
- `sed -n '11852,12130p' /tmp/apue/full.txt`
- `sed -n '12219,12311p' /tmp/apue/full.txt`
- `sed -n '12358,12524p' /tmp/apue/full.txt`
- `sed -n '12900,13091p' /tmp/apue/full.txt`
- `sed -n '13091,13418p' /tmp/apue/full.txt`
- `cd "D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\Lecture" && for f in "Week - 1/Lec01.pdf" "Week - 1/Lec02.pdf" "Week - 2/Lec03.pdf" "Week - 2/Lec04.pdf" "Week - 3/Lec05.pdf" "Week - 3/Lec06.pdf"; do
  out="/tmp/apue/$(basename "$f" .pdf).txt"
  pdftotext -layout "$f" "$out" 2>&1
  echo "$f -> $out ($(wc -l < "$out") lines)"
done`
- `grep -il "setjmp\|rlimit\|longjmp" /tmp/apue/Lec0*.txt; echo "---none found means no matches---"`
- `grep -n "PATH\|LD_PRELOAD\|LD_LIBRARY_PATH\|environ\|getenv\|setenv" /tmp/apue/Lec03.txt | head -40`
- `cd "D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\Lecture\Transcripts\Week 1 - 3" && for f in *.txt; do echo "$f: $(wc -l < "$f") lines, $(wc -c < "$f") bytes"; done`
- `rm "D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Documents\Jarvis\PLACEHOLDER.md" && rmdir "D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Documents\Jarvis" 2>/dev/null; rmdir "D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Documents" 2>/dev/null; ls "D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\" | head -5`
- `rm -f "D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Documents\Jarvis\PLACEHOLDER.md"
rmdir "D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Documents\Jarvis" 2>/dev/null
rmdir "D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Documents" 2>/dev/null
ls "D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\"`
- `rm -f "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Documents/Jarvis/PLACEHOLDER.md"
rmdir "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Documents/Jarvis" 2>/dev/null
rmdir "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Documents" 2>/dev/null
ls "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/"`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && git status --short -- "20_Progress/Degree/CSCI 4061"`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && grep -n '^$' "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1.md"`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && for f in "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7.md" "20_Progress/Degree/CSCI 4061/Weekly/Week - 1.md" "20_Progress/Degree/CSCI 4061/Weekly/Week - 2.md" "20_Progress/Degree/CSCI 4061/Weekly/Week - 3.md" "20_Progress/Degree/CSCI 4061/Weekly/Week - 4.md"; do echo "=== $f ==="; grep -n '^$' "$f"; done`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && grep -n '\[\[Lecture\|\[\[Lab' "20_Progress/Degree/CSCI 4061/Weekly/Week - 1.md" "20_Progress/Degree/CSCI 4061/Weekly/Week - 2.md" "20_Progress/Degree/CSCI 4061/Weekly/Week - 3.md" "20_Progress/Degree/CSCI 4061/Weekly/Week - 4.md"`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && grep -ohE '\[\[[^]]+\]\]' "20_Progress/Degree/CSCI 4061/Weekly/Week - 1.md" "20_Progress/Degree/CSCI 4061/Weekly/Week - 2.md" "20_Progress/Degree/CSCI 4061/Weekly/Week - 3.md" "20_Progress/Degree/CSCI 4061/Weekly/Week - 4.md" "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1.md" "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7.md" "20_Progress/Degree/CSCI 4061/Weekly/Weekly Board.md" "20_Progress/Degree/CSCI 4061/Textbook/Textbook Map.md" | sort -u`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && grep -n '\[\[UMN Board\]\]' "20_Progress/Degree/CSCI 4061/Weekly/Week - 1.md" "20_Progress/Degree/CSCI 4061/Weekly/Week - 2.md" "20_Progress/Degree/CSCI 4061/Weekly/Week - 3.md" "20_Progress/Degree/CSCI 4061/Weekly/Week - 4.md" "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1.md" "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7.md" "20_Progress/Degree/CSCI 4061/Weekly/Weekly Board.md" "20_Progress/Degree/CSCI 4061/Textbook/Textbook Map.md"`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && echo "--- Chapter 1 highlight count ---" && grep -c '==' "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1.md" && echo "--- Chapter 7 highlight count ---" && grep -c '==' "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7.md"`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && grep -n '==' "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1.md"`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && grep -n '==[^=]' "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7.md" | grep -v '== *NULL\|== *-1\|== *0\|== *EOF\|== *SIG_ERR\|=='\''\\n'\'''`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && grep -n '==' "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7.md" | grep -E '^(1[0-9]|2[0-9]):|system call interface|Chapter Summary|#cards'`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && echo "=== Ch1 sections and highlight check ===" && awk '/^## /{print NR": "$0}' "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1.md" && echo "=== Ch7 sections ===" && awk '/^## /{print NR": "$0}' "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7.md"`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && for f in "Week - 1" "Week - 2" "Week - 3" "Week - 4"; do echo "=== $f ==="; grep -n '==' "20_Progress/Degree/CSCI 4061/Weekly/$f.md"; done`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && for f in "Textbook/Chapter - 1" "Textbook/Chapter - 7" "Weekly/Week - 1" "Weekly/Week - 2" "Weekly/Week - 3" "Weekly/Week - 4"; do echo "=== $f ==="; sed -n '1,14p' "20_Progress/Degree/CSCI 4061/$f.md"; done`
- `ls -la /tmp/apue/ 2>&1 | head -20`
- `grep -n "^3\.[0-9]* \|^4\.[0-9]* \|^8\.[0-9]* \|^10\.[0-9]* " /tmp/apue/full.txt | sed -n '1,90p'`
- `grep -n "^10\.[0-9]* " /tmp/apue/full.txt | sed -n '1,20p'`
- `sed -n '18930,18940p' /tmp/apue/full.txt; grep -n "^10\.[4-8] " /tmp/apue/full.txt | sed -n '1,10p'`
- `sed -n '4784,5035p' /tmp/apue/full.txt`
- `sed -n '5111,5223p' /tmp/apue/full.txt`
- `sed -n '5576,5925p' /tmp/apue/full.txt`
- `sed -n '5925,6049p' /tmp/apue/full.txt`
- `sed -n '6396,6847p' /tmp/apue/full.txt`
- `sed -n '6847,7231p' /tmp/apue/full.txt`
- `sed -n '7389,7824p' /tmp/apue/full.txt`
- `sed -n '7824,8185p' /tmp/apue/full.txt`
- `sed -n '8185,8539p' /tmp/apue/full.txt`
- `sed -n '8680,8867p' /tmp/apue/full.txt`
- `grep -n "^8\.1[1-8] " /tmp/apue/full.txt`
- `sed -n '15047,15548p' /tmp/apue/full.txt`
- `sed -n '15548,15830p' /tmp/apue/full.txt`
- `sed -n '15830,16657p' /tmp/apue/full.txt`
- `sed -n '19449,19550p' /tmp/apue/full.txt`
- `grep -n "^10\.10 alarm and pause" /tmp/apue/full.txt | tail -1`
- `sed -n '19581,19720p' /tmp/apue/full.txt`
- `sed -n '20800,21050p' /tmp/apue/full.txt | grep -n "10\.1[5-8]" `
- `grep -n "^10\.15 sigsetjmp\|^10\.17 abort\|^10\.18  system" /tmp/apue/full.txt`
- `sed -n '20626,20800p' /tmp/apue/full.txt`
- `sed -n '21202,21500p' /tmp/apue/full.txt`
- `sed -n '18932,19026p' /tmp/apue/full.txt; echo "---10.7---"; sed -n '19302,19449p' /tmp/apue/full.txt`
- `grep -n "^10\.21 sigqueue\|^10\.22  Job-Control\|^10\.23 Signal Names" /tmp/apue/full.txt`
- `grep -n "^10\.2[1-3]" /tmp/apue/full.txt`
- `sed -n '21700,21890p' /tmp/apue/full.txt`
- `sed -n '21890,22107p' /tmp/apue/full.txt`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && git log --follow --diff-filter=A --format="%ad %h" --date=short -- "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3.md" "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4.md" "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8.md" "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10.md" 2>&1 | sort -u`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && for f in "Chapter - 3" "Chapter - 4" "Chapter - 8" "Chapter - 10"; do echo "=== $f ==="; git log --follow --diff-filter=A --format="%ad %h" --date=short -- "20_Progress/Degree/CSCI 4061/Textbook/$f.md"; done`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && git status --short -- "20_Progress/Degree/CSCI 4061" && echo "---apue scratch---" && ls /tmp/apue/ 2>&1`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && git log -3 --format="%ad %h %s" --date=short -- "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3.md"`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && for f in "Chapter - 3" "Chapter - 4" "Chapter - 8" "Chapter - 10"; do echo "=== $f ==="; awk '/^## /{print}' "20_Progress/Degree/CSCI 4061/Textbook/$f.md"; done`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && for f in "Chapter - 3" "Chapter - 4" "Chapter - 8" "Chapter - 10"; do
echo "=== $f ==="
echo "blank lines outside code fences:"
awk '/^```/{f=!f} f{next} /^$/{print NR}' "20_Progress/Degree/CSCI 4061/Textbook/$f.md"
echo "flashcard count:"
awk '/^## Flashcards/{c=1;next} c && /^#cards\//{next} c && NF{n++} END{print n}' "20_Progress/Degree/CSCI 4061/Textbook/$f.md"
done`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && for f in "Chapter - 3" "Chapter - 4" "Chapter - 8" "Chapter - 10"; do
echo "=== $f ==="
echo "-- Chapter Summary highlight check --"
awk '/^## Chapter Summary/{f=1;next} /^## /{f=0} f && /==/{print}' "20_Progress/Degree/CSCI 4061/Textbook/$f.md"
echo "-- stray #cards/ai check --"
grep -c '#cards/ai' "20_Progress/Degree/CSCI 4061/Textbook/$f.md"
done`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && grep -ohE '\[\[[^]]+\]\]' "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3.md" "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4.md" "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8.md" "20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10.md" | sort -u`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && grep -n "provisional\|not yet source-checked\|not been through\|Build 2" "20_Progress/Degree/CSCI 4061/Weekly/Week - 1.md"`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && echo "=== git status ===" && git status --short -- "20_Progress/Degree/CSCI 4061" && echo "=== blank line check on edited weekly notes ===" && for f in "Week - 1" "Week - 2" "Week - 3"; do echo "-- $f --"; awk '/^```/{f=!f} f{next} /^$/{print NR}' "20_Progress/Degree/CSCI 4061/Weekly/$f.md"; done`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && for f in "Chapter - 3" "Chapter - 4" "Chapter - 8" "Chapter - 10"; do echo "$f: $(wc -l < "20_Progress/Degree/CSCI 4061/Textbook/$f.md") lines"; done`


