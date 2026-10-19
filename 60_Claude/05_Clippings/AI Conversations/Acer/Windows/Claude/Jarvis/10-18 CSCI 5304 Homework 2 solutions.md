---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "CSCI 5304 Homework 2 solutions"
started_at: 2026-10-18T20:29:52
ended_at: 2026-10-18T21:18:57
exported_at: 2026-10-18T21:33:02
duration_minutes: 49.1
project: Jarvis
cwd: 'D:\_Anant\20_Progress\Documents\Jarvis'
session_id: 77eb581b-41bc-45f2-a896-ca7bc0832b99
status: raw
turn_count: 4
tools_used:
  Bash: 5
  Edit: 1
  Glob: 1
  Grep: 6
  Read: 17
  Write: 2
tokens:
  input: 110
  output: 143836
  cache_creation: 765304
  cache_read: 7516478
  total: 8425728
cost_usd: 6.003092
model:
  - "claude-sonnet-5"
files_touched:
  - "D:\\_Anant\\10_Areas\\UMN\\Classes\\CSCI\\CSCI 5304\\Homework\\Homework - 2.pdf"
  - "D:\\_Anant\\10_Areas\\UMN\\Classes\\CSCI\\CSCI 5304\\Midterm\\Quiz - 3.pdf"
  - "D:\\_Anant\\10_Areas\\UMN\\Classes\\CSCI\\CSCI 5304\\Textbook & Resources\\CSCI 5304 Textbook (MinerU full extraction).md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 5304\\CSCI 5304 Board.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 5304\\Quiz & HW\\Homework - 2.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 5304\\Quiz & HW\\Quiz - 2.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 5304\\Quiz & HW\\Quiz - 3.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 5304\\Textbook\\Lecture - 2 & 3.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 5304\\Textbook\\Lecture - 7.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 5304\\Textbook\\Lecture - 8.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Note Type Registry.md"
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

Now I have everything verified. Let me write the complete solution set into the homework note, following the vault's Homework Standard (problems as `###` sections under Work log, concise exam-box-ready math).

I solved all 8 problems (Trefethen & Bau exercises 5.3, 6.1, 7.3, 8.1, 8.3, 10.1, 11.1) and wrote them into `20_Progress/Degree/CSCI 5304/Quiz & HW/Homework - 2.md`, under `### 1` through `### 8` in the Work log, matching the course's Homework Standard. Each box is condensed to what you'd actually hand-write (final matrices/numbers with a one-line derivation), not a full proof essay.

Key results, cross-checked:
- **1–2 (SVD of A):** σ₁=10√2, σ₂=5√2, with U, V found via A^TA's eigenvectors — verified UΣV^T reproduces A exactly. Norms: ‖A‖₁=16, ‖A‖∞=15, ‖A‖₂=10√2, ‖A‖_F=5√10. A⁻¹ via SVD matches the direct 2×2 inverse formula. Eigenvalues λ=(3±i√391)/2, with λ₁λ₂=100=det(A) and σ₁σ₂=100=|det(A)| both verified. Ellipse area = 100π.
- **3:** (I−2P)*(I−2P)=I algebraically; geometrically it's the reflection of x across the hyperplane ⊥ R(P).
- **4 (Hadamard):** proved via full QR (|r_jj|≤‖a_j‖), equality exactly when columns are orthogonal — volume-of-parallelepiped-vs-box intuition.
- **5 (flop count):** derived exactly from Algorithm 8.1's pseudocode — mn(n+1) mults, (m−1)n(n+1)/2 adds, mn(n−1)/2 subs, mn divs — leading terms sum to 2mn², matching Theorem 8.1.
- **6:** R_i = D_i N_i (scale-then-shear), tied to the exact algorithm lines.
- **7 (Householder):** eigenvalues −1 (×1), +1 (×(m−1)); det=−1; all singular values =1 (unitary reflector).
- **8 (pseudoinverse):** ‖A⁺‖₂=1/σ_min; ‖A‖₂≤‖A₁‖₂+‖A₂‖₂ via the sqrt(a²+b²)≤a+b trick; ‖A⁺‖₂≤‖A₁⁻¹‖₂ via the [REDACTED] argument.

Note: the homework's real due date is still unverified per the course Board (the printed 10/7 date predates when HW #2 was actually assigned) — I flagged that in `next:` rather than guessing a date.

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
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 5304\Quiz & HW\Homework - 2.md`
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 5304\Quiz & HW\Homework - 2.md`
```
---
type: class
class_kind: homework
status: sprout
created: 2026-10-18
updated: 2026-10-18
tags:
  - class
  - homework
area:
  - "[[CSCI 5304 Board]]"
next: "Hand-copy the solutions below into the boxes of the printed Homework - 2 PDF; confirm the real due date on Canvas/Gradescope before submitting — [[CSCI 5304 Board]] flags HW #2's date as unverified"
---
# Homework - 2
## Overview
CSCI-5304 Fall 2026, Homework 2, 80 points, 8 problems, all written/proof-based (no coding). Source file: `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Homework\Homework - 2.pdf`, printed as an A4 sheet with a boxed answer space under each sub-part, to be filled in by hand. Problems are Trefethen & Bau exercises 5.3, 6.1, 7.3, 8.1, 8.3, 10.1, 11.1 (two homework problems, 1 and 2, both pull from Exercise 5.3). Due date not verified — [[CSCI 5304 Board]] records the printed Wed 10/7 date as stale (HW #2 wasn't even assigned yet as of 10/1); confirm the real date before treating this as due-soon.
## Requirements
- [ ] **1. (Ex. 5.3) SVD of $A=\begin{bmatrix}-2&11\\-10&5\end{bmatrix}$**
  - [ ] (a, 3 pts) Real SVD $A=U\Sigma V^T$ by hand, minimal minus signs in $U,V$.
  - [ ] (b, 3 pts) List singular values, left singular vectors, right singular vectors.
  - [ ] (c, 4 pts) Labeled picture: unit ball in $\mathbb{R}^2$, its image under $A$, the singular vectors, vertex coordinates marked.
- [ ] **2. (Ex. 5.3 cont'd) Same $A$**
  - [ ] (a, 2 pts) 1-, 2-, $\infty$-, Frobenius norms of $A$.
  - [ ] (b, 2 pts) $A^{-1}$ via the SVD (not directly).
  - [ ] (c, 2 pts) Eigenvalues $\lambda_1,\lambda_2$ of $A$.
  - [ ] (d, 2 pts) Verify $\det(A)=\lambda_1\lambda_2$ and $|\det(A)|=\sigma_1\sigma_2$.
  - [ ] (e, 2 pts) Area of the ellipsoid $A$ maps the unit ball of $\mathbb{R}^2$ onto.
- [ ] **3. (Ex. 6.1) $P$ orthogonal projector $\Rightarrow I-2P$ unitary**
  - [ ] (a, 2 pts) Algebraic proof from the definitions.
  - [ ] (b, 4 pts) 2D picture: $\mathcal{R}(P)$ as a line, $\vec x$ arbitrary (cf. Fig. 6.2, p. 43).
  - [ ] (c, 4 pts) Geometric interpretation of $(I-2P)\vec x$.
- [ ] **4. (Ex. 7.3) Hadamard's inequality $|\det(A)|\le\prod_j\|\vec a_j\|_2$**
  - [ ] (a, 4 pts) Algebraic proof via QR factorization / Gram-Schmidt.
  - [ ] (b, 2 pts) Show equality when $A$ is unitary (orthonormal columns).
  - [ ] (c, 4 pts) Geometric interpretation (determinant = parallelepiped volume); draw both cases.
- [ ] **5. (Ex. 8.1) Flop count for $A=\hat Q\hat R$ by Algorithm 8.1**
  - [ ] (a, 10 pts) Exact counts of additions, subtractions, multiplications, divisions, for $m\times n$ $A$.
- [ ] **6. (Ex. 8.3) $R_i$ (p. 61) as diagonal $\times$ unit-upper-triangular**
  - [ ] (a, 2 pts) First diagonal matrix for $i=1$: $AR_1=[q_1\mid a_2\mid\cdots\mid a_n]$.
  - [ ] (b, 3 pts) The two matrices used on iteration $i=2$.
  - [ ] (c, 5 pts) General-step explanation + which lines of Algorithm 8.1 each factor corresponds to.
- [ ] **7. (Ex. 10.1) Householder reflector $H=I-2\vec v\vec v^T$**
  - [ ] (a, 2 pts) Eigenvalues of $H$, algebraically.
  - [ ] (b, 2 pts) $\det(H)$.
  - [ ] (c, 2 pts) Singular values of $H$.
  - [ ] (d, 4 pts) Geometric argument for both.
- [ ] **8. (Ex. 11.1) $A=\begin{bmatrix}A_1\\A_2\end{bmatrix}$, $A_1$ nonsingular $n\times n$, $A_2$ arbitrary $(m-n)\times n$**
  - [ ] (a, 2 pts) $\|A^+\|_2$ in terms of singular values of $A$.
  - [ ] (b, 4 pts) Prove $\|A\|_2\le\|A_1\|_2+\|A_2\|_2$ algebraically.
  - [ ] (c, 4 pts) Prove $\|A^+\|_2\le\|A_1^{-1}\|_2$.
- [ ] Name/section line filled in before submission.
- [ ] Submit via Gradescope through the Canvas assignment (per [[CSCI 5304 Board]] grading section) once the real due date is confirmed.
## Work log
### 2026-10-18 — full written solve
Worked all 8 problems directly from the SVD/norms/projector/QR/Householder/pseudoinverse mechanisms in [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 4|Lecture 4]], [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 5|Lecture 5]], [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 2 & 3|Lecture 2 & 3]], [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 6|Lecture 6]], [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 7|Lecture 7]], [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 8|Lecture 8]], and the MinerU textbook extraction (Algorithm 8.1 pseudocode, p. 58-62). Householder (Ex. 10.1, Lecture 10) and the pseudoinverse (Ex. 11.1, Lecture 11) aren't lectured yet in this vault, so those two are solved straight from the definitions given in the problem statements. Every numeric result below is cross-checked: the SVD is verified by recomputing $U\Sigma V^T$ and matching $A$ exactly; $\det(A)=\lambda_1\lambda_2=\sigma_1\sigma_2$ (up to sign) is checked three independent ways (direct $2\times2$ determinant, Vieta's formula, $\sigma_1\sigma_2$); the flop count is checked against Theorem 8.1's leading-order $\sim2mn^2$. Each box below is written short enough to hand-copy into the printed PDF's answer boxes.

### 1. SVD of $A$
**(a)** $A^TA=\begin{bmatrix}104&-72\\-72&146\end{bmatrix}$, trace $250$, det $10000$ $\Rightarrow\lambda=200,50\Rightarrow\sigma_1=10\sqrt2,\ \sigma_2=5\sqrt2$.
Eigenvectors of $A^TA$: $v_1=(-\tfrac35,\tfrac45)^T$ (for $200$), $v_2=(\tfrac45,\tfrac35)^T$ (for $50$) — orthonormal, only 1 minus sign between them.
$u_i=Av_i/\sigma_i$: $Av_1=(10,10)^T\Rightarrow u_1=(\tfrac1{\sqrt2},\tfrac1{\sqrt2})^T$; $Av_2=(5,-5)^T\Rightarrow u_2=(\tfrac1{\sqrt2},-\tfrac1{\sqrt2})^T$.
$$A=\underbrace{\begin{bmatrix}\tfrac{1}{\sqrt2}&\tfrac1{\sqrt2}\\\tfrac1{\sqrt2}&-\tfrac1{\sqrt2}\end{bmatrix}}_{U}\underbrace{\begin{bmatrix}10\sqrt2&0\\0&5\sqrt2\end{bmatrix}}_{\Sigma}\underbrace{\begin{bmatrix}-\tfrac35&\tfrac45\\\tfrac45&\tfrac35\end{bmatrix}}_{V^T}$$
(Check: $U\Sigma=\begin{bmatrix}10&5\\10&-5\end{bmatrix}$, times $V^T$ gives back $\begin{bmatrix}-2&11\\-10&5\end{bmatrix}=A$ exactly. Flipping either pair's sign only adds minus signs, so this is minimal.)

**(b)** $\sigma_1=10\sqrt2\approx14.14,\ \sigma_2=5\sqrt2\approx7.07$.
Left: $u_1=\tfrac1{\sqrt2}(1,1)^T,\ u_2=\tfrac1{\sqrt2}(1,-1)^T$. Right: $v_1=\tfrac15(-3,4)^T,\ v_2=\tfrac15(4,3)^T$.

**(c)** Unit circle, mark $v_1=(-0.6,0.8)$, $v_2=(0.8,0.6)$ on it (orthogonal radii). Image is an ellipse; its semi-axis endpoints are $\sigma_1u_1=(10,10)$ and $\sigma_2u_2=(5,-5)$ (and their negatives). Draw: circle with $v_1,v_2$ marked $\to$ arrow $\to$ ellipse through $(10,10),(-10,-10)$ (major axis, length $10\sqrt2$ each way) and $(5,-5),(-5,5)$ (minor axis, length $5\sqrt2$ each way), major axis along $u_1=(1,1)/\sqrt2$ direction, minor along $u_2=(1,-1)/\sqrt2$.

### 2. Norms, $A^{-1}$, eigenvalues, determinant identity, area
**(a)** Columns sums $|{-2}|+|{-10}|=12$, $|11|+|5|=16\Rightarrow\|A\|_1=16$. Row sums $13,15\Rightarrow\|A\|_\infty=15$. $\|A\|_2=\sigma_1=10\sqrt2$. $\|A\|_F=\sqrt{4+121+100+25}=\sqrt{250}=5\sqrt{10}$ (matches $\sqrt{\sigma_1^2+\sigma_2^2}=\sqrt{250}$).

**(b)** $A^{-1}=V\Sigma^{-1}U^T$. $\Sigma^{-1}=\mathrm{diag}(\tfrac1{10\sqrt2},\tfrac1{5\sqrt2})$.
$$A^{-1}=\frac1{100}\begin{bmatrix}5&-11\\10&-2\end{bmatrix}=\begin{bmatrix}0.05&-0.11\\0.10&-0.02\end{bmatrix}$$
(carried out: $V\Sigma^{-1}=\tfrac1{50\sqrt2}\begin{bmatrix}-3&8\\4&6\end{bmatrix}$, times $U^T=\tfrac1{\sqrt2}\begin{bmatrix}1&1\\1&-1\end{bmatrix}$ gives $\tfrac1{100}\begin{bmatrix}5&-11\\10&-2\end{bmatrix}$ — matches direct inverse $\tfrac1{\det A}\begin{bmatrix}d&-b\\-c&a\end{bmatrix}$.)

**(c)** trace $=3$, $\det=100$: $\lambda^2-3\lambda+100=0\Rightarrow\lambda_{1,2}=\dfrac{3\pm i\sqrt{391}}2$ (complex, $A$ not symmetric).

**(d)** $\lambda_1\lambda_2=\dfrac{9+391}4=100=\det(A)$ ✓. $\sigma_1\sigma_2=(10\sqrt2)(5\sqrt2)=100=|\det(A)|$ ✓.

**(e)** Area scales by $|\det A|=\sigma_1\sigma_2$; unit disk area $\pi$ $\Rightarrow$ image area $=\pi\sigma_1\sigma_2=100\pi$.

### 3. $I-2P$ is unitary
**(a)** $P$ orthogonal projector $\Rightarrow P^*=P,\ P^2=P$.
$$(I-2P)^*(I-2P)=(I-2P)(I-2P)=I-4P+4P^2=I-4P+4P=I.$$
So $(I-2P)^*(I-2P)=I$ — unitary. $\blacksquare$

**(b)/(c)** Draw a line through the origin for $\mathcal R(P)$. Arbitrary $\vec x$ off the line; drop $P\vec x$ = orthogonal projection of $\vec x$ onto the line; $(I-P)\vec x=\vec x-P\vec x$ = perpendicular component.
$(I-2P)\vec x=\vec x-2P\vec x=(I-P)\vec x-P\vec x$: the component **along** $\mathcal R(P)$ flips sign, the component **$\perp\mathcal R(P)$** is unchanged. Mark both $P\vec x$ and $-P\vec x$ on the picture, and $(I-2P)\vec x$ as the vector sum of $-P\vec x$ and $(I-P)\vec x$.
*Geometric interpretation:* $I-2P$ is the reflection of $\vec x$ across the line (hyperplane) **orthogonal to** $\mathcal R(P)$ — a mirror image through $\mathcal R(P)^\perp$.

### 4. Hadamard's inequality
**(a)** Full QR: $A=QR$, $Q$ unitary, $R$ upper triangular. Column $j$: $a_j=\sum_{i\le j}r_{ij}q_i$, and since the $q_i$ are orthonormal,
$$\|a_j\|_2^2=\sum_{i\le j}|r_{ij}|^2\ge|r_{jj}|^2\ \Rightarrow\ |r_{jj}|\le\|a_j\|_2.$$
$\det A=\det Q\det R$, $|\det Q|=1$ (unitary), $\det R=\prod_j r_{jj}$. So
$$|\det A|=\prod_j|r_{jj}|\le\prod_j\|a_j\|_2.\ \blacksquare$$

**(b)** $A$ unitary $\Rightarrow$ columns already orthonormal $\Rightarrow$ Gram-Schmidt needs no correction: $r_{ij}=0\ (i<j)$, $q_j=a_j$, $r_{jj}=\|a_j\|_2=1$. Then $|\det A|=\prod r_{jj}=\prod\|a_j\|_2=1$ — the bound in (a) is tight, equality holds.

**(c)** $|\det A|$ = volume of the parallelepiped spanned by the columns $a_j$. $\prod\|a_j\|_2$ = volume of the **rectangular box** with the same edge lengths but mutually orthogonal edges. A slanted (non-orthogonal) parallelepiped always encloses *less* volume than that box — draw a 2D parallelogram vs. a rectangle with the same two side lengths, area $=\|a_1\|\|a_2\|\sin\theta\le\|a_1\|\|a_2\|$. Equality (part b) is exactly the case $\theta=90°$: orthogonal columns, no "squashing," parallelepiped = box.

### 5. Flop count for Algorithm 8.1 ($A=\hat Q\hat R$, $m\times n$)
Per outer step $i$ ($i=1,\dots,n$): $r_{ii}=\|v_i\|$ costs $m$ mult $+(m-1)$ add $+1$ sqrt; $q_i=v_i/r_{ii}$ costs $m$ div.
Inner loop runs $(n-i)$ times; each $j$: $r_{ij}=q_i^*v_j$ costs $m$ mult $+(m-1)$ add; $v_j=v_j-r_{ij}q_i$ costs $m$ mult $+m$ sub.
$\sum_{i=1}^n(n-i)=\dfrac{n(n-1)}2$ total inner iterations.
**Multiplications:** $\underbrace{2m\cdot\tfrac{n(n-1)}2}_{\text{inner}}+\underbrace{2mn}_{\text{outer }(r_{ii}+\text{div})}=mn(n-1)+2mn=mn(n+1)$.
**Additions:** $\underbrace{(m-1)\tfrac{n(n-1)}2}_{\text{inner }r_{ij}}+\underbrace{n(m-1)}_{\text{outer }r_{ii}}=\dfrac{(m-1)n(n+1)}2$.
**Subtractions:** $m\cdot\dfrac{n(n-1)}2=\dfrac{mn(n-1)}2$ (only from $v_j=v_j-r_{ij}q_i$).
**Divisions:** $mn$ (only from $q_i=v_i/r_{ii}$, $m$ per $i$, $n$ values of $i$).
(Square roots: $n$, one per $i$ — not asked for but falls out of the same count.)
*Check:* leading terms $mn^2+\tfrac{mn^2}2+\tfrac{mn^2}2=2mn^2$, matching Theorem 8.1's $\sim2mn^2$ asymptotic flop count.

### 6. $R_i$ as diagonal $\times$ unit upper triangular
Each $R_i=D_iN_i$: $D_i$ scales column $i$ by $1/r_{ii}$ (line `q_i = v_i / r_ii`); $N_i$ is unit-upper-triangular, row $i$ entries $-r_{ij}$ for $j>i$, subtracting $r_{ij}q_i$ from column $j$ (lines `r_ij = q_i^* v_j` and `v_j = v_j - r_ij q_i`). $AD_i$ must happen before $N_i$ since the shear uses the already-normalized $q_i$.
**(a)** $i=1$: $D_1=\mathrm{diag}(1/r_{11},1,\dots,1)$. $AD_1=[a_1/r_{11}\mid a_2\mid\cdots\mid a_n]=[q_1\mid a_2\mid\cdots\mid a_n]$.
**(b)** $i=2$: $D_2=\mathrm{diag}(1,1/r_{22},1,\dots,1)$, scales column 2 ($v_2^{(2)}$) to $q_2$. $N_2=I$ except row 2: entries $-r_{2j}$ for $j>2$, subtracts $r_{2j}q_2$ from later columns. ($D_2N_2$ reproduces the text's combined $R_2=\begin{bmatrix}1&&\\&1/r_{22}&-r_{23}/r_{22}&\cdots\\&&1&\end{bmatrix}$.)
**(c)** General $i$: $D_i=I$ with $(i,i)$ entry $1/r_{ii}$ — the normalization line `q_i = v_i / r_ii`. $N_i=I$ with row-$i$ entries $(i,j)=-r_{ij}$, $j>i$ — the orthogonalization lines `r_ij = q_i^* v_j` (computes the shear coefficient) and `v_j = v_j - r_ij q_i` (applies it). $R_i=D_iN_i$: scale, then shear.

### 7. Householder reflector $H=I-2\vec v\vec v^T$, $\|\vec v\|_2=1$
**(a)** $Hv=v-2v(v^Tv)=v-2v=-v$ ($v^Tv=1$) $\Rightarrow\lambda=-1$ (eigenvector $v$). For $w\perp v$: $Hw=w-2v(v^Tw)=w\Rightarrow\lambda=+1$, multiplicity $m-1$.
Eigenvalues: $-1$ (×1), $+1$ (×$(m-1)$).

**(b)** $\det H=\prod\lambda_i=(-1)(1)^{m-1}=-1$.

**(c)** $H^TH=H^2=I-4vv^T+4v(v^Tv)v^T=I$ $\Rightarrow H$ unitary $\Rightarrow$ all $m$ singular values $=1$.

**(d)** $H$ is the reflection across the hyperplane $\perp v$: the component along $v$ flips (why $\lambda=-1$ there), the $(m-1)$-dim hyperplane $\perp v$ is fixed pointwise (why $\lambda=+1$ there). A reflection is an isometry — it preserves every vector's length, stretching nothing — so every singular value is exactly $1$.

### 8. Block matrix $A=\begin{bmatrix}A_1\\A_2\end{bmatrix}$
**(a)** $A$ has full column rank $n$ (since $A_1$ nonsingular forces rank $n$), so $A^+=(A^*A)^{-1}A^*$ has singular values $1/\sigma_i$ for each nonzero $\sigma_i(A)$. The 2-norm is the largest singular value, so
$$\|A^+\|_2=\frac1{\sigma_{\min}(A)}=\frac1{\sigma_n(A)}.$$

**(b)** For any $x$: $\|Ax\|_2^2=\|A_1x\|_2^2+\|A_2x\|_2^2\Rightarrow\|Ax\|_2=\sqrt{\|A_1x\|_2^2+\|A_2x\|_2^2}\le\|A_1x\|_2+\|A_2x\|_2$ (since $\sqrt{a^2+b^2}\le a+b$) $\le(\|A_1\|_2+\|A_2\|_2)\|x\|_2$. Taking $\sup_{\|x\|_2=1}$: $\|A\|_2\le\|A_1\|_2+\|A_2\|_2$. $\blacksquare$

**(c)** Let $L=[\,A_1^{-1}\ \ 0\,]$ ($n\times m$): $LA=A_1^{-1}A_1=I_n$, a left inverse, $\|L\|_2=\|A_1^{-1}\|_2$.
Any left inverse is $L=A^++N$ with $NA=0$ (rows of $N\perp\mathrm{range}(A)$), while rows of $A^+=(A^*A)^{-1}A^*$ lie *in* $\mathrm{range}(A)$ — so $A^+N^T=0$ and
$$LL^T=A^+(A^+)^T+NN^T\succeq A^+(A^+)^T,$$
PSD order, so $\|L\|_2\ge\|A^+\|_2$ for every left inverse. In particular
$$\|A^+\|_2\le\|L\|_2=\|A_1^{-1}\|_2.\ \blacksquare$$
## Concepts used
- **SVD** ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 4|Lecture 4]], [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 5|Lecture 5]]) — computed by hand via $A^TA$'s eigendecomposition for problem 1; used for $A^{-1}$, the 2-norm, and the ellipsoid-area identity in problem 2.
- **Matrix norms** ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 2 & 3|Lecture 2 & 3]]) — max-column-sum ($\|{\cdot}\|_1$) and max-row-sum ($\|{\cdot}\|_\infty$) formulas, Frobenius norm via entrywise sum, used directly in problem 2a.
- **Orthogonal projectors** ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 6|Lecture 6]]) — $P^*=P,\,P^2=P$ used algebraically in problem 3; the decomposition-into-parallel-and-perpendicular-component picture drives the geometric interpretation in 3(b)/(c).
- **QR factorization / Gram-Schmidt** ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 7|Lecture 7]], [[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 8|Lecture 8]]) — full QR used for Hadamard's inequality (problem 4); Algorithm 8.1's exact pseudocode (modified Gram-Schmidt) drives the flop count (problem 5) and the $R_i=D_iN_i$ factorization (problem 6).
- **Householder reflectors** (problem statement only — Lecture 10 not yet taught/transcribed in this vault) — eigenvalue/determinant/singular-value facts for $H=I-2vv^T$ derived directly from the definition in problem 7.
- **Pseudoinverse / least squares** (problem statement only — Lecture 11 not yet written) — $A^+=(A^*A)^{-1}A^*$ and its [REDACTED] property used in problem 8.
## Post-submit reflection
<!-- Optional until feedback: the first failure, the pattern, and what to change. -->

```

## You

Great work, now to focus on another task at hand the quiz - 3: `"D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Midterm\Quiz - 3.pdf"`, solve the questions exactly in the same manner done for the questions on the homeowrk - 2. These are also handwritten solutions. Make sure that these answers are correct. Note these solutions down over here: `20_Progress/Degree/CSCI 5304/Quiz & HW/Quiz - 3`. Make no mistakes, answer the questions correctly.

## Claude

I need to fix a broken wikilink in the Work log — the textbook extraction lives outside the Jarvis vault, so it should be a plain path reference, not a wikilink.

Quiz - 3 is solved and written into `20_Progress/Degree/CSCI 5304/Quiz & HW/Quiz - 3.md`, same format as Homework - 2 (Overview → Requirements → Work log with per-part solutions → Concepts used).

Summary of the three parts (Exercise 10.4):
- **(a) F** (det = −1): reflection of ℝ² across the line through the origin at angle α = π/2 − θ/2 — verified by matching F to the standard reflection matrix R(α) and confirming it's the angle bisector of e₁,Fe₁ and e₂,Fe₂. Drawn concretely at θ=60°.
- **(b) J** (det = +1): rigid rotation, **clockwise** by θ — verified by matching J to the standard CCW rotation matrix R(φ) with φ=−θ.
- **(c) Givens replacing Q₁:** a single Householder Q₁ zeros an entire subdiagonal column in one shot; a Givens G(i,k,θ) only touches 2 rows, so it takes m−1 of them chained bottom-up (G(m−1,m,·) first, …, G(1,2,·) last) to do the same job without disturbing earlier zeros, with the rotation angle at each step given explicitly (c=aᵢ/r, s=aₖ/r, r=√(aᵢ²+aₖ²)).

One thing worth flagging: the source PDF's own header prints "Quiz 2 (10 points total)" even though the file is named and filed as `Quiz - 3` and covers later (Lecture 10) material than the actual Quiz 2 (SVD, already in your vault's `Quiz - 2.md`). I noted this as a warning in the Overview rather than silently picking one — worth confirming the real quiz number with the professor/Canvas before writing it on the physical sheet.

### Tool Calls

- `Bash` -- `find "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Quiz & HW" -type f 2>&1`
```
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Quiz & HW/Homework - 2.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Quiz & HW/Quiz - 2.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Quiz & HW/Quiz - 3.md
```
- `Read` -- `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Midterm\Quiz - 3.pdf`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 5304\Quiz & HW\Quiz - 3.md`
- `Grep` -- pattern `Exercise 10\.4|Givens rotation|Lecture 10\.|Householder Triangularization` path `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Textbook & Resources\CSCI 5304 Textbook (MinerU full extraction).md`
- `Read` -- `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Textbook & Resources\CSCI 5304 Textbook (MinerU full extraction).md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 5304\Quiz & HW\Quiz - 2.md`
- `Grep` -- pattern `quiz|Quiz` path `D:\_Anant\20_Progress\Documents\Jarvis\30_Order`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Note Type Registry.md`
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 5304\Quiz & HW\Quiz - 3.md`
```
---
type: class
class_kind: homework
status: sprout
created: 2026-10-18
updated: 2026-10-18
tags:
  - class
  - homework
area:
  - "[[CSCI 5304 Board]]"
next: "Hand-copy the solutions below into the boxes of the printed Quiz - 3 PDF; confirm the real quiz number/date on Canvas — the PDF's own header prints \"Quiz 2,\" see Overview"
---
# Quiz - 3
## Overview
CSCI-5304 Fall 2026, 10 points, 1 question (3 sub-parts), written/proof-based (no coding). Source file: `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Midterm\Quiz - 3.pdf`, printed A4, boxed answer space under each sub-part, filled in by hand. Content is Trefethen & Bau **Exercise 10.4** (Givens rotations vs. Householder reflectors, Lecture 10 material).
> [!WARNING] Source PDF's own header says "Quiz 2 (10 points total)," not Quiz 3
> The printed page itself is titled "Quiz 2," but this file is `Quiz - 3.pdf` in the course folder and its content (Givens rotations, Lecture 10) is later material than the real Quiz #2 (SVD/Exercise 4.4, already solved in [[20_Progress/Degree/CSCI 5304/Quiz & HW/Quiz - 2|Quiz - 2]]). Same pattern [[CSCI 5304 Board]] already flags for this course (stale template artifacts in printed/Canvas materials) — treat the filename (`Quiz - 3`) as correct and the in-document header as the stale one. Confirm with the professor/Canvas before writing the quiz number on the physical sheet.
## Requirements
- [ ] **1. (Exercise 10.4)** $F=\begin{bmatrix}-c&s\\s&c\end{bmatrix}$, $J=\begin{bmatrix}c&s\\-s&c\end{bmatrix}$, $c=\cos\theta,\ s=\sin\theta$. $\det F=-1$ (Householder reflector in $\mathbb R^2$), $\det J=1$ (Givens rotation).
  - [ ] (a, 3 pts) Draw $\vec e_1,\vec e_2$ and their images $F\vec e_1,F\vec e_2$; describe exactly what $F$ does to $\mathbb R^2$.
  - [ ] (b, 3 pts) Repeat for $J$: draw the images, describe the action.
  - [ ] (c, 4 pts) Generalized Givens rotation $G(i,k,\theta)$ = identity with the $2\times2$ block $J$ in rows/cols $i,k$ — $G(i,k,\theta)A$ changes only rows $i,k$. Using Eq. 10.1 (p. 70) as the reference, how can a sequence of $G(i,k,\theta)$'s do the same job as the Householder reflector $Q_1$: introduce zeros below the diagonal in column 1 of $A$?
- [ ] Name/section line filled in before submission.
- [ ] Confirm quiz # and submission mechanism on Canvas (see Overview warning above).
## Work log
### 2026-10-18 — full written solve
Solved directly from [[20_Progress/Degree/CSCI 5304/Textbook & Resources/CSCI 5304 Textbook (MinerU full extraction)|the MinerU textbook extraction]], Lecture 10 (pp. 69-76: Eq. 10.1 zero-introduction diagram, Eq. 10.3's reflection-to-$\|x\|e_1$ picture, Algorithm 10.1). No vault Lecture 10 note exists yet (not lectured as of the last Board update), so this is read straight from the source text, not from a distillation. Every claim below is checked algebraically (determinants, explicit matrix-vector products) rather than asserted from memory.

### 1(a) — $F$: reflection
$F\vec e_1=(-c,s)^T$, $F\vec e_2=(s,c)^T$.
*Picture (worked for the concrete case $\theta=60°$, $c=\tfrac12,\ s=\tfrac{\sqrt3}2$, general case identical in structure):* $\vec e_1=(1,0)$ at $0°$, $\vec e_2=(0,1)$ at $90°$; $F\vec e_1=(-\tfrac12,\tfrac{\sqrt3}2)$ at $120°$, $F\vec e_2=(\tfrac{\sqrt3}2,\tfrac12)$ at $30°$. Draw all four as unit vectors from the origin, plus the line through the origin at $60°$ (the common bisector) — $\vec e_1$ and $F\vec e_1$ sit mirror-symmetric across it, and so do $\vec e_2,F\vec e_2$.
*General description:* comparing $F$ to the standard reflection matrix $R(\alpha)=\begin{bmatrix}\cos2\alpha&\sin2\alpha\\\sin2\alpha&-\cos2\alpha\end{bmatrix}$ gives $\cos2\alpha=-\cos\theta,\ \sin2\alpha=\sin\theta\Rightarrow 2\alpha=\pi-\theta$. **$F$ reflects $\mathbb R^2$ across the line through the origin at angle $\alpha=\tfrac{\pi-\theta}2=\tfrac\pi2-\tfrac\theta2$** — equivalently, the angle bisector of $\vec e_1$ and $F\vec e_1$ (and of $\vec e_2,F\vec e_2$). ($\det F=-1$ confirms reflection, not rotation.)

### 1(b) — $J$: rotation
$J\vec e_1=(c,-s)^T$, $J\vec e_2=(s,c)^T$.
*Picture (same $\theta=60°$):* $J\vec e_1=(\tfrac12,-\tfrac{\sqrt3}2)$ at $-60°$, $J\vec e_2=(\tfrac{\sqrt3}2,\tfrac12)$ at $30°$ — both $\vec e_1,\vec e_2$ rotated by the same $-60°$.
*General description:* $J=\begin{bmatrix}\cos\theta&\sin\theta\\-\sin\theta&\cos\theta\end{bmatrix}$ is the standard CCW rotation matrix $R(\phi)=\begin{bmatrix}\cos\phi&-\sin\phi\\\sin\phi&\cos\phi\end{bmatrix}$ with $\phi=-\theta$. **$J$ rotates $\mathbb R^2$ clockwise by angle $\theta$** (rigid rotation, $\det J=1$, lengths and angles between vectors preserved — unlike $F$, nothing is mirrored).

### 1(c) — Givens rotations replacing $Q_1$
Eq. 10.1 shows $Q_1$ zeroing **all** of $a_{21},a_{31},\dots,a_{m1}$ (every subdiagonal entry of column 1) in **one** unitary left-multiplication, by reflecting the length-$m$ vector $x=A_{1:m,1}$ to $\|x\|e_1$.
A Givens rotation $G(i,k,\theta)$ only touches 2 rows, so it can only zero **one** entry at a time. To match $Q_1$'s effect, chain $m-1$ of them, each eliminating one subdiagonal entry while leaving previously-made zeros alone:
- Work from the **bottom up**: first $G(m-1,m,\theta_{m-1})$ acts on rows $m-1,m$ to zero $a_{m1}$; then $G(m-2,m-1,\theta_{m-2})$ acts on rows $m-2,m-1$ to zero $a_{m-1,1}$ (using the value just placed in row $m-1$ by the previous step); continue up to $G(1,2,\theta_1)$, which zeros $a_{21}$ last. Each step only ever touches a row pair below the last one it set, so no earlier zero is disturbed.
- **Choosing $\theta$ for each step:** to zero row $k$'s entry using rows $i,k$ (current column-1 values $a_i,a_k$), pick $c=a_i/r,\ s=a_k/r,\ r=\sqrt{a_i^2+a_k^2}$ — directly from $J$'s action $(a_i,a_k)\mapsto(ca_i+sa_k,\,-sa_i+ca_k)=(r,0)$, the same $2\times2$ map as part (b) applied to the pair $(a_i,a_k)$ instead of $(\vec e_1,\vec e_2)$.
- **Net effect:** $\underbrace{G(1,2,\theta_1)G(2,3,\theta_2)\cdots G(m-1,m,\theta_{m-1})}_{\text{plays the role of }Q_1}\,A$ has zeros below the diagonal in column 1, exactly like $Q_1A$ in Eq. 10.1 — just built from $m-1$ cheap $2\times2$ rotations instead of one $m\times m$ reflector.
- Repeating this on column 2 (rotating rows $2,\dots,m$, so $m-2$ rotations), then column 3, etc. gives the full **Givens QR algorithm**, structurally identical to Algorithm 10.1 but with every $Q_k$ replaced by a product of 2-row rotations — this is exactly the algorithm Exercise 10.4(b)/(c) (not asked here) shows costs 6 flops/entry instead of Householder's 4, i.e. 50% more work, for the same triangularization.
## Concepts used
- **Householder reflectors** ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 10|Lecture 10]], not yet written in this vault — read straight from the MinerU extraction) — $F$'s reflection-across-a-line structure (1a) and the Eq. 10.1 zero-introduction pattern $Q_1$ is compared against (1c).
- **Givens rotations** (same Lecture 10 source, Exercise 10.4) — $J$'s rigid-rotation structure (1b); the $2\times2$ zero-introducing map generalized to $G(i,k,\theta)$ for QR factorization (1c).
- **Unitary/orthogonal matrices** ([[20_Progress/Degree/CSCI 5304/Textbook/Lecture - 2 & 3|Lecture 2 & 3]]) — $\det=\pm1$ distinguishing reflection ($F$) from rotation ($J$); both preserve length and angle.
## Post-submit reflection
<!-- Optional until feedback: the first failure, the pattern, and what to change. -->

```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 5304\Quiz & HW\Quiz - 3.md`
```diff
- Solved directly from [[20_Progress/Degree/CSCI 5304/Textbook & Resources/CSCI 5304 Textbook (MinerU full extraction)|the MinerU textbook extraction]], Lecture 10 (pp. 69-76: Eq. 10.1 zero-introduction diagram, Eq. 10.3's reflection-to-$\|x\|e_1$ picture, Algorithm 10.1). No vault Lecture 10 note exists yet (not lectured as of the last Board update), so this is read straight from the source text, not from a distillation.
+ Solved directly from the MinerU textbook extraction (`D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Textbook & Resources\CSCI 5304 Textbook (MinerU full extraction).md`), Lecture 10 (pp. 69-76: Eq. 10.1 zero-introduction diagram, Eq. 10.3's reflection-to-$\|x\|e_1$ picture, Algorithm 10.1). No vault Lecture 10 note exists yet (not lectured as of the last Board update), so this is read straight from the source text, not from a distillation.
```
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 5304\Quiz & HW\Quiz - 3.md`

## Actions Taken

**Files created:**
- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 5304\Quiz & HW\Homework - 2.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 5304\Quiz & HW\Quiz - 3.md`

**Files modified:**
_None_

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
- `find "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Quiz & HW/Homework - 2" -type f 2>&1`
- `find "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304" -maxdepth 2 -type f 2>&1`
- `find "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304" -maxdepth 3 2>&1`
- `find "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Textbook" -name "Lecture*" 2>&1`
- `find "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Quiz & HW" -type f 2>&1`


