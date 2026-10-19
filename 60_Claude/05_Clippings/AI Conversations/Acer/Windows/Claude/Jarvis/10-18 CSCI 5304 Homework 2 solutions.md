---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "CSCI 5304 Homework 2 solutions"
started_at: 2026-10-18T20:29:52
ended_at: 2026-10-18T20:32:55
exported_at: 2026-10-18T20:33:02
duration_minutes: 3.1
project: Jarvis
cwd: 'D:\_Anant\20_Progress\Documents\Jarvis'
session_id: 77eb581b-41bc-45f2-a896-ca7bc0832b99
status: raw
turn_count: 2
tools_used:
  Bash: 4
  Glob: 1
  Grep: 4
  Read: 10
tokens:
  input: 54
  output: 61138
  cache_creation: 592696
  cache_read: 2351878
  total: 3005766
cost_usd: 3.452648
model:
  - "claude-sonnet-5"
files_touched:
  - "D:\\_Anant\\10_Areas\\UMN\\Classes\\CSCI\\CSCI 5304\\Homework\\Homework - 2.pdf"
  - "D:\\_Anant\\10_Areas\\UMN\\Classes\\CSCI\\CSCI 5304\\Textbook & Resources\\CSCI 5304 Textbook (MinerU full extraction).md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 5304\\CSCI 5304 Board.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 5304\\Quiz & HW\\Homework - 2.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 5304\\Textbook\\Lecture - 2 & 3.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 5304\\Textbook\\Lecture - 7.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 5304\\Textbook\\Lecture - 8.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Standards\\Courses\\Homework Standard.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Templates\\Classes\\Homework Template.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Workflows\\Courses\\Homework Workflow.md"
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# CSCI 5304 Homework 2 solutions

## You

Let's work on the homwork - 2 for the course CSCI 5304: `20_Progress/Degree/CSCI 5304/Quiz & HW/Homework - 2`. Make sure to go through all the relevant material to solve this homework correctly: `20_Progress/Degree/CSCI 5304/CSCI 5304 Board`, `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304`, `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Lecture\Transcripts`. Make no mistakes with this task since this is directly related to the concepts discussed in class and the textbook: `"D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Textbook & Resources\CSCI 5304 Textbook (MinerU full extraction).md"`. Go through the required material to solve the questions correctly based of the methods mentioned in lecture and provided in the textbook chapters. Solve the questions correctly make no mistakes. Write the solutions in a manner that it is hand written in that specific space on the homework pdf. This document was printed as an a4 size sheet and will be worked on handwritten to write the solutions. So, make sure to write the solutions to be short but correct. Everything is hand written. Write the solutions inside the note that has been mentioned. Here is the homework: `"D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Homework\Homework - 2.pdf"`. Let's do this correctly making no mistakes on the resources required to complete the task.

## Claude

I'll start by exploring the homework folder structure and locating the target note, then route the actual coursework solving through the `professor` agent as required by this vault's workflow rules.

### Tool Calls

- `Bash` -- `find "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Quiz & HW/Homework - 2" -type f 2>&1`
```
find: 'D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Quiz & HW/Homework - 2': No such file or directory
```
- `Bash` -- `find "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304" -maxdepth 2 -type f 2>&1`
```
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Concepts/Definitions.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Concepts/Weekly Board.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/CSCI 5304 Board.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Preparation.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Quiz & HW/Homework - 2.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Quiz & HW/Quiz - 2.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Textbook/Lecture - 2 & 3.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Textbook/Lecture - 4.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Textbook/Lecture - 5.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Textbook/Lecture - 6.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Textbook/Lecture - 7.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Textbook/Lecture - 8.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Textbook/Textbook Map.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Textbook/_MinerU raw test output (pages 1-25).md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Weekly/Week - 1.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Weekly/Week - 2 & 3 (Prompts).md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Weekly/Week - 2.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Weekly/Week - 3.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Weekly/Week - 4.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Weekly/Weekly Board.md
```
- `Bash` -- `find "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304" -maxdepth 3 2>&1`
```
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/.nonadmin
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/[REDACTED].dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/concrt140.dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/DLLs
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/etc
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/include
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/Lib
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/Library
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/libs
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/LICENSE_PYTHON.txt
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/Menu
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/msvcp140.dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/msvcp140_1.dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/msvcp140_2.dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/msvcp140_atomic_wait.dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/msvcp140_codecvt_ids.dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/opt
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/pylupdate6.bat
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/python.exe
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/python.pdb
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/python3.dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/python312.dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/python312.pdb
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/pythonw.exe
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/pythonw.pdb
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/pyuic6.bat
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/qt6.conf
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/Scripts
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/share
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/Tools
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/ucrtbase.dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/vcamp140.dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/vccorlib140.dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/vcomp140.dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/vcruntime140.dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/vcruntime140_1.dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/vcruntime140_threads.dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/zlib.dll
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.firecrawl
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.firecrawl/schedule.md
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.firecrawl/syllabus.md
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.vscode
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.vscode/settings.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/environment.yml
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Homework
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Homework/Homework - 1.pdf
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Homework/Homework - 2.pdf
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Lecture
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Lecture/Transcripts
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Lecture/Transcripts/Week 2 & 3
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Lecture/Transcripts/Week 4 - 8
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Lecture/Week - 1
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Lecture/Week - 1/5304_Lecture_1_Notes.pdf
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Lecture/Week - 2
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Lecture/Week - 3
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Midterm
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Midterm/Quiz - 2.pdf
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/README.md
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Textbook & Resources
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Textbook & Resources/CSCI 5304 Syllabus Schedule.pdf
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Textbook & Resources/CSCI 5304 Textbook (MinerU full extraction).md
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Textbook & Resources/CSCI 5304 Textbook.pdf
```
- `Read` -- `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Homework\Homework - 2.pdf`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 5304\Quiz & HW\Homework - 2.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 5304\CSCI 5304 Board.md`
- `Grep` -- pattern `Algorithm 8\.1|Modified Gram-Schmidt|Classical Gram-Schmidt` path `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Textbook & Resources\CSCI 5304 Textbook (MinerU full extraction).md`
- `Grep` -- pattern `Figure 6\.2|orthogonal projector|I - 2P|I-2P` path `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Textbook & Resources\CSCI 5304 Textbook (MinerU full extraction).md`
- `Read` -- `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Textbook & Resources\CSCI 5304 Textbook (MinerU full extraction).md`
- `Grep` -- pattern `homework` path `D:\_Anant\20_Progress\Documents\Jarvis\30_Order`
- `Glob` -- pattern `30_Order/**/*Class*` path `D:\_Anant\20_Progress\Documents\Jarvis`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards\Courses\Homework Standard.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Workflows\Courses\Homework Workflow.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Templates\Classes\Homework Template.md`
- `Grep` -- pattern `type: concept` path `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 5304`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 5304\Textbook\Lecture - 7.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 5304\Textbook\Lecture - 8.md`
- `Bash` -- `find "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Textbook" -name "Lecture*" 2>&1`
```
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Textbook/Lecture - 2 & 3.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Textbook/Lecture - 4.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Textbook/Lecture - 5.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Textbook/Lecture - 6.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Textbook/Lecture - 7.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Textbook/Lecture - 8.md
```
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 5304\Textbook\Lecture - 2 & 3.md`

## Actions Taken

**Files created:**
_None_

**Files modified:**
_None_

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
- `find "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Quiz & HW/Homework - 2" -type f 2>&1`
- `find "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304" -maxdepth 2 -type f 2>&1`
- `find "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304" -maxdepth 3 2>&1`
- `find "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Textbook" -name "Lecture*" 2>&1`


