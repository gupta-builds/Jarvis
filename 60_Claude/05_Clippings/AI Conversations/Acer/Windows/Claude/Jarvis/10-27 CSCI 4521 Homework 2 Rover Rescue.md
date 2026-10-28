---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "CSCI 4521 Homework 2 Rover Rescue"
started_at: 2026-10-27T19:50:31
ended_at: 2026-10-27T19:59:11
exported_at: 2026-10-27T20:03:04
duration_minutes: 8.7
project: Jarvis
cwd: 'D:\_Anant\20_Progress\Documents\Jarvis'
session_id: 1b6f8eac-44d0-4860-b243-88b063adb7c7
status: raw
turn_count: 2
tools_used:
  Bash: 35
  Grep: 3
  Read: 16
  Write: 1
tokens:
  input: 70
  output: 41587
  cache_creation: 161979
  cache_read: 4203828
  total: 4407464
cost_usd: null
model:
  - "claude-sonnet-5-5"
files_touched:
  - "C:\\Users\\anant\\AppData\\Local\\Temp\\claude\\D---Anant-20-Progress-Documents-Jarvis\\1b6f8eac-44d0-4860-b243-88b063adb7c7\\scratchpad\\hw2\\hw2_p1.png"
  - "C:\\Users\\anant\\AppData\\Local\\Temp\\claude\\D---Anant-20-Progress-Documents-Jarvis\\1b6f8eac-44d0-4860-b243-88b063adb7c7\\scratchpad\\repo\\2026\\homework-2\\rover-rescue\\README.md"
  - "C:\\Users\\anant\\AppData\\Local\\Temp\\claude\\D---Anant-20-Progress-Documents-Jarvis\\1b6f8eac-44d0-4860-b243-88b063adb7c7\\scratchpad\\repo\\2026\\homework-2\\rover-rescue\\rover_starter.py"
  - "C:\\Users\\anant\\AppData\\Local\\Temp\\claude\\D---Anant-20-Progress-Documents-Jarvis\\1b6f8eac-44d0-4860-b243-88b063adb7c7\\scratchpad\\repo\\2026\\homework-2\\rover-rescue\\rubric.md"
  - "C:\\Users\\anant\\AppData\\Local\\Temp\\claude\\D---Anant-20-Progress-Documents-Jarvis\\1b6f8eac-44d0-4860-b243-88b063adb7c7\\scratchpad\\repo\\2026\\homework-2\\rover-rescue\\run_demo.py"
  - "D:\\_Anant\\10_Areas\\UMN\\Classes\\CSCI\\CSCI 4521\\Code\\Homework\\homework 2.pdf"
  - "D:\\_Anant\\10_Areas\\UMN\\Classes\\CSCI\\CSCI 4521\\Code\\Homework\\Homework2_RoverRescue_student.ipynb"
  - "D:\\_Anant\\10_Areas\\UMN\\Classes\\CSCI\\CSCI 4521\\Code\\Homework\\HW2.pdf"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4521\\CSCI 4521 Board.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4521\\Homework\\Homework - 1.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4521\\Homework\\Homework - 2.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 4521\\Preparation.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Standards\\Courses\\Homework Standard.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Templates\\Classes\\Homework Template.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Workflows\\Courses\\Homework Workflow.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\HUMAN_WRITING.md"
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# CSCI 4521 Homework 2 Rover Rescue

## You

`"D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\[REDACTED].ipynb" - starter code
"D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\HW2.pdf" - example
"D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\homework 2.pdf" - actual assignment` are files that need to be read through in detail to work on the homework - 2. You are required to work on this github repo: `https://github.com/be-prado/csci4521/tree/main/2026/homework-2/rover-rescue`. Make sure to complete the provided assignment in this directory: `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code`, i have this directory open right now along the main actual assignment pdf. Let's walk through each and every single detail for this assingment and lay out the work correctly. Also decide on whether to write this assignment in latex (on overlead) or as a word document like written for the previous homework: `

<pasted_content id="6aca">
"D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\CSCI4521_HW1.ipynb"
"D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\homework 1.docx.pdf"
"D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\hwTemplateML.tex"
"D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\PhiUSIIL_HW1_777.csv"
"D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\PhiUSIIL_Phishing_URL_Dataset.csv"
</pasted_content id="6aca">

`, `"D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Homework\HW-1.docx"
"D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Homework\HW-1.pdf"` - final assignment. I am not sure why i did this but it did earn me extra credit. If we need to work on latex for this one say so and overlead will be created and everything will be worked on correctly stating the use cases of overlead correctly for citations, images, etc. But we need to decide whether to do this or not based on the assignment details. let's go through the assignment details and all the mentioned files first to map out everything required for this homework to be done. Then, i want all the test to be written out over here: `20_Progress/Degree/CSCI 4521/Homework/Homework - 2`, similar to: `20_Progress/Degree/CSCI 4521/Homework/Homework - 1`. Let's not make any mistakes over here and be sure to earn some more extra credit if provided in the assignment. Make no mistakes with this task, do not skip a single step. Let's follow all the required instructions for the course correctly do this assignment: `20_Progress/Degree/CSCI 4521/CSCI 4521 Board`, `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Textbook & Resources`, `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Lectures`. There is a lot of content which is available to you and will come extremely in handy to do this assignment. We only rely on the information that is provided inside the course, the textbooks, the lectures, the notes. There is literally no knowledge gathered which is pre determined from training. Every answer is derived and achieved at so there is no mistakes and everything is a learning curve which is done correctly. Make no mistakes, learn from the previous homework. Make correct decisions after thinking about it in depth, then provide me with clear steps to finish up this homework within 30 minutes.

## Claude

I'll start by reading the three homework files and listing the course folders.

The PDF page renderer isn't installed. Your vault rules say to use mineru for PDFs, so I'll try that.

Mineru's local engine isn't available, so I'm retrying the assignment PDF with its text-only `flash` tier.

The assignment is clear: 40 points, a two-page standalone PDF report, and a notebook. Next I'm reading the example report, the syllabus (it has the AI-use policy), and the starter repo.

The repo has a `rubric.md`, which is the file the assignment points to. I'm reading it with the starter code.

`Homework - 2.md` already exists in the vault. I'm reading it, the HW1 note, and the board.

Miniconda is installed, so there's a `csci-4521` env I can use to run code. I'm finding it and extracting the code cells from the lecture notebooks.

Before drafting, I'm checking your vault notes for any HW2 hints from live lectures, the due date, and the traps recorded in Preparation.

The handout has no color badge. I'm checking the repo's `assignment_student.md` for an AI-policy statement and any due date or extra credit.

The note format is clear. I'm making one quick check of whether the course materials say anything about empty clusters, since the assignment asks you to explain how you handle them.

I have what I need. The remaining step is writing everything into `Homework - 2.md` using the Homework Template headings, with plain prose and no em dashes per your rules.

The note is written. I'm verifying a few claims I made in it: no em or en dashes, the class balance behind "roughly 10 points", whether the conda env really is missing, and the lint result.

Lint says 1 of 2 notes fits. I need to know whether the failing one is mine or HW1, and the dash check failed on regex syntax, so I'm redoing it.

`Homework - 2.md` passes lint with no dashes. The one failing note is Homework - 1 (a legacy shape I didn't touch). I'm stopping the mineru server I started earlier.

I've read all three homework files, the repo (rubric, starter code, demo data), the syllabus, and the lecture 1.1, 1.4, 2.3 and 2.4 decks and notebooks. I filled in `Homework - 2.md` in the vault. Nothing is built or run yet, so there are no results. I have not built the notebook.

## What the assignment requires
- **Grading:** the rubric is out of 100, not the 10, 20 and 10 points printed in the PDF.
- **Report:** a two-page standalone PDF with a comparison table, at least one figure, the 95% PCA component count, an evaluation protocol, sand-risk analysis, and one failure or limitation.
- **Methods:** normalization, nearest-centroid assignment, centroid update and kNN must be written in NumPy. The rubric and the repo's `assignment_student.md` say libraries are fine, but the PDF is stricter, so I'm following the PDF.
- **Extra credit:** there is none in the handout, repo markdown or rubric. The only way to score higher is a full rubric score.

## Word, not LaTeX
The report is two pages with one table and two composite figures. It has no equations or bibliography, and Word is the same flow as HW1. Overleaf would only help with figure placement, and composite matplotlib figures remove that need.

## Things to check before any work
1. **Due date.** The board says HW2 was due 10/20, and the grace day ended 10/21. The repo commit for this folder is dated 10/22 and titled "added dataset for hw 3". Your Week 6 notes describe an earlier text-clustering HW2. This may be a replacement assignment, so check Gradescope.
2. **Dataset.** The repo only has `demo_data`, whose `student_id` is `demo3`. `save_submission` writes that id into every row, so a submission built on it would carry the wrong id. The handout promises a personalized dataset.
3. **AI-use level.** The syllabus requires a green, yellow or red level on each assignment. The handout PDF and repo markdown don't show one. Check Gradescope or Canvas. Whatever the level, the report needs an AI-use disclosure like HW1's.

## Plan
The note has the full notebook design, the report draft with every number left as a blank to fill from notebook output, and the 30-minute plan. The core of it:
- **Configurations:** 8, from a full grid of scaling (raw, z-score) by representation (8 sensors, PCA at 95% variance) by model (k-means with 3 clusters, 1-NN).
- **Selection rule:** highest validation macro F1, ties broken by sand recall, then by fewer dimensions. I fixed it before running so it can't be tuned to the scores.
- **Validation set:** it has only 30 rows, so one error is 3.3 points and ties are likely. The report should say so.

## Questions
- Where is your personalized dataset, or is `demo_data` your assigned one?
- What is the AI-use level for this assignment?

Once I have those, I'll build the notebook in `Code\Homework`, run it, and fill in the report draft from the real output. On this laptop the `csci-4521` env doesn't exist, so I'd run it in Colab, as the starter was, or create the env from `environment.yml`.

### Tool Calls

- `Read` -- `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\homework 2.pdf`
- `Read` -- `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\HW2.pdf`
- `Read` -- `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code\Homework\Homework2_RoverRescue_student.ipynb`
- `Bash` -- `ls -la "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code" "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code/Homework" "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521" "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Lectures" "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Textbook & Resources" 2>&1 | head -150`
```
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521:
total 20
drwxr-xr-x 1 anant 197609 0 Oct  5 22:55 .
drwxr-xr-x 1 anant 197609 0 Sep 17 08:55 ..
drwxr-xr-x 1 anant 197609 0 Oct  5 23:51 Code
drwxr-xr-x 1 anant 197609 0 Oct  6 01:03 Homework
drwxr-xr-x 1 anant 197609 0 Oct 21 20:45 Lectures
drwxr-xr-x 1 anant 197609 0 Oct 21 21:49 Textbook & Resources

D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code:
total 13
drwxr-xr-x 1 anant 197609   0 Oct  5 23:51 .
drwxr-xr-x 1 anant 197609   0 Oct  5 22:55 ..
drwxr-xr-x 1 anant 197609   0 Oct  5 23:26 .vscode
drwxr-xr-x 1 anant 197609   0 Oct 27 19:42 Homework
drwxr-xr-x 1 anant 197609   0 Oct 13 16:19 Lectures
-rw-r--r-- 1 anant 197609 381 Oct  5 23:51 environment.yml

D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code/Homework:
total 32701
drwxr-xr-x 1 anant 197609        0 Oct 27 19:42 .
drwxr-xr-x 1 anant 197609        0 Oct  5 23:51 ..
-rw-r--r-- 1 anant 197609   268188 Oct  6 01:01 CSCI4521_HW1.ipynb
-rw-r--r-- 1 anant 197609   873488 Oct 27 19:40 HW2.pdf
-rw-r--r-- 1 anant 197609   310161 Oct 27 19:38 [REDACTED].ipynb
-rw-r--r-- 1 anant 197609    42284 Oct  5 22:32 PhiUSIIL_HW1_777.csv
-rw-r--r-- 1 anant 197609 56854345 Oct  5 23:46 PhiUSIIL_Phishing_URL_Dataset.csv
-rw-r--r-- 1 anant 197609      492 Oct  6 00:36 README.md
drwxr-xr-x 1 anant 197609        0 Oct  6 00:35 figures
-rw-r--r-- 1 anant 197609    97549 Oct  5 22:26 homework 1.docx.pdf
-rw-r--r-- 1 anant 197609   182575 Oct 27 19:42 homework 2.pdf
-rw-r--r-- 1 anant 197609     4654 Oct  5 22:27 hwTemplateML.tex

D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Lectures:
total 16
drwxr-xr-x 1 anant 197609 0 Oct 21 20:45 .
drwxr-xr-x 1 anant 197609 0 Oct  5 22:55 ..
drwxr-xr-x 1 anant 197609 0 Oct  5 22:56 Week - 1
drwxr-xr-x 1 anant 197609 0 Oct  5 22:56 Week - 2
drwxr-xr-x 1 anant 197609 0 Sep 24 21:48 Week - 3
drwxr-xr-x 1 anant 197609 0 Oct  5 22:57 Week - 4
drwxr-xr-x 1 anant 197609 0 Oct  6 14:41 Week - 5
drwxr-xr-x 1 anant 197609 0 Oct 21 20:45 Week - 6
drwxr-xr-x 1 anant 197609 0 Oct 21 20:45 Week - 7

D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Textbook & Resources:
total 77728
drwxr-xr-x 1 anant 197609        0 Oct 21 21:49 .
drwxr-xr-x 1 anant 197609        0 Oct  5 22:55 ..
-rw-r--r-- 1 anant 197609 21873317 Sep 27 17:55 DLB Textbook CSCI 4521.pdf
-rw-r--r-- 1 anant 197609 12646183 Sep 17 08:50 ENLP Textbook CSCI 4521.pdf
-rw-r--r-- 1 anant 197609 20053984 Sep 17 08:50 ISL Textbook CSCI 4521.pdf
-rw-r--r-- 1 anant 197609  6784966 Oct 21 20:46 Notes 11 - Eigenvalues and Eigenvectors complete.pdf
-rw-r--r-- 1 anant 197609  6074734 Oct 21 20:46 Notes 12 - Diagonalization complete.pdf
-rw-r--r-- 1 anant 197609  7494561 Oct 21 20:46 Notes 13 - Singular Value Decomposition complete.pdf
-rw-r--r-- 1 anant 197609  3663848 Oct 21 20:46 Notes 14 - Singular Value Decomposition 2 complete.pdf
-rw-r--r-- 1 anant 197609  1922643 Oct 21 20:46 Notes 15 - PCA complete.pdf
-rw-r--r-- 1 anant 197609   185312 Sep 17 08:50 Syllabus - CSCI 4521.pdf
-rw-r--r-- 1 anant 197609  1980460 Oct 21 21:49 dlb.txt
-rw-r--r-- 1 anant 197609   451249 Oct 21 21:49 enlp.txt
-rw-r--r-- 1 anant 197609  1829329 Oct 21 21:49 isl.txt
```
- `Bash` -- `mkdir -p "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/1b6f8eac-44d0-4860-b243-88b063adb7c7/scratchpad/hw2" && cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/1b6f8eac-44d0-4860-b243-88b063adb7c7/scratchpad/hw2" && which mineru; mineru --help 2>&1 | head -20`
```
/c/Users/anant/.local/bin/mineru
                                                                               
 Usage: mineru [OPTIONS] COMMAND [ARGS]...                                     
                                                                               
 MinerU — your personal document center, built for agents                      
                                                                               
┌─ Options ───────────────────────────────────────────────────────────────────┐
│ --version          Show the version and exit.                               │
│ --help             Show this message and exit.                              │
└─────────────────────────────────────────────────────────────────────────────┘
┌─ Commands ──────────────────────────────────────────────────────────────────┐
│ parse       Parse a document file.                                          │
│ read        Read parsed document content by locator.                        │
│ scan        Scan a file or directory into the document library.             │
│ watch       Manage directories watched for automatic scanning.              │
│ search      Search parsed document content.                                 │
│ find        Search filenames only (not document content).                   │
│ usage       Show remote parse service usage and limits.                     │
│ list        List document library resources.                                │
│ show        Show document library resource details.                         │
│ telemetry   Manage anonymous usage telemetry.                               │
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash` -- `mineru parse --help 2>&1 | head -40`
```
 Usage: mineru parse [OPTIONS] {path}                                          
                                                                               
 Parse a document file.                                                        
                                                                               
┌─ Arguments ─────────────────────────────────────────────────────────────────┐
│ *    path      <str>  Path to the document file [required]                  │
└─────────────────────────────────────────────────────────────────────────────┘
┌─ Options ───────────────────────────────────────────────────────────────────┐
│ --tier               <flash|basic|standard|adv  Parse tier: flash, basic,   │
│                      anced>                     standard, advanced          │
│                                                 (default: server decides)   │
│ --pages      -p      <str>                      PDF pages: '1-5,8', 'r3-r1' │
│                                                 (counted from the end), or  │
│                                                 'all'; default: first 10    │
│                                                 pages                       │
│ --after              <str>                      Continue reading after a    │
│                                                 content cursor from earlier │
│                                                 output                      │
│ --limit              <int>                      Soft character limit for    │
│                                                 printed content             │
│ --format     -f      <markdown>                 Output format: markdown     │
│                                                 [default: markdown]         │
│ --force                                         Force re-parse, ignore      │
│                                                 cache                       │
│ --remote                                        Use the mineru.net official │
│                                                 remote parse service        │
│ --wait               <int>                      Max seconds to wait for     │
│                                                 parse to complete           │
│                                                 [default: 60]               │
│ --no-wait                                       Don't wait — return         │
│                                                 immediately                 │
│ --output     -o      <str>                      Output path; creates parent │
│                                                 directories                 │
│ --no-marker                                     Omit document structure     │
│                                                 markers from output         │
│ --json                                          JSON output                 │
│ --verbose    -v                                 Verbose output              │
│ --help                                          Show this message and exit. │
└─────────────────────────────────────────────────────────────────────────────┘
```
- `Bash` -- `cd /tmp 2>/dev/null; mineru parse "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code/Homework/homework 2.pdf" --pages all --wait 300 2>&1 | head -400`
```
Error: Local mineru server is not running. Run 'mineru server start'.
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash` -- `mineru server --help 2>&1 | head -20; mineru parse --help >/dev/null; python --version; python -c "import fitz; print('fitz ok')" 2>&1; python -c "import pypdf; print('pypdf ok')" 2>&1`
```
Exit code 49
                                                                               
 Usage: mineru server [OPTIONS] COMMAND [ARGS]...                              
                                                                               
 Start, stop, and inspect the local MinerU server.                             
                                                                               
┌─ Options ───────────────────────────────────────────────────────────────────┐
│ --help          Show this message and exit.                                 │
└─────────────────────────────────────────────────────────────────────────────┘
┌─ Commands ──────────────────────────────────────────────────────────────────┐
│ start    Start the mineru server in the background.                         │
│ stop     Stop the mineru server gracefully.                                 │
│ restart  Restart the mineru server.                                         │
│ status   Show server status.                                                │
└─────────────────────────────────────────────────────────────────────────────┘

Python was not found; run without arguments to install from the Microsoft Store, or disable this shortcut from Settings > Apps > Advanced app settings > App execution aliases.
Python was not found; run without arguments to install from the Microsoft Store, or disable this shortcut from Settings > Apps > Advanced app settings > App execution aliases.
Python was not found; run without arguments to install from the Microsoft Store, or disable this shortcut from Settings > Apps > Advanced app settings > App execution aliases.
```
- `Bash` -- `mineru server start 2>&1 | tail -5; sleep 5; mineru server status 2>&1 | tail -5`
```
Server started (PID 10008).
│                                                                             │
│ --- managed parse-server stdout: start ---                                  │
│                                                                             │
│ --- managed parse-server stdout: start ---                                  │
└─────────────────────────────────────────────────────────────────────────────┘
```
- `Bash` -- `mineru parse "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code/Homework/homework 2.pdf" --pages all --wait 300 2>&1 | head -500`
```
Error: No basic, standard, or advanced engine available. You can start a local 
parse-server, use --remote, or explicitly pass --tier flash for text-only 
preview.
```
- `Bash` -- `mineru parse "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code/Homework/homework 2.pdf" --pages all --tier flash --wait 300 2>&1 | head -600`
```
<!-- page 1 of 4 -->

CSCI 4521 / Homework 2

Rover Rescue

**HOMEWORK 2**

# Rover Rescue

Learning a terrain map from sensor measurements

**Your goal:** build a terrain-learning system, investigate its behavior, and use your evidence to choose a model for a new mission. You wll work in **Colab or local Jupyter Notebook** and choose your code structure and experimental design.

## The challenge

A rover must cross an unfamiliar region using eight surface sensors. The terrain is **firm**, **rough**, or **sand**. Firm terrain is easy to cross, rough terrain is slower, and sand can trap the rover.

Your task is to build a machine-learning system that converts sensor readings into a terrain map by investigating how scaling, dimensionality reduction, and your choice of learning method affect the map. We will supply a simulator that handles movement and path planning.

There is no required notebook layout, set of variable names, or winning model. Your task is to make defensible choices and explain what your results show.

## What you receive

The [**course GitHub repository**](https://github.com/be-prado/csci4521/tree/main/2026/homework-2/rover-rescue) provides rover\_starter.py and installation requirements. The starter contains data loading, a reproducible split, the simulator, and prediction-file export. You build the learning pipeline yourself.

You will receive a personalized dataset containing:

| File | Purpose |
| --- | --- |
| development.csv | Sensor observations from the practice region. |
| calibration.csv | Practice locations with known terrain labels. |
| mission.csv | Unlabeled observations from a new region. |
| config.json | Grid and simulator metadata. |
| practice_truth.bin | Simulator-only state; do not read it directly. |

Use the eight sensor columns as features. Coordinates identify locations and are not sensor features. Keep predictions in the original CSV row order. Hidden mission labels are not distributed.

## Core methods

Implement **data normalization, nearest-centroid assignment, centroid updating, and k-nearestneighbor prediction using NumPy**. Assemble your own k-means iteration loop. Use calibrationtraining labels to give clusters terrain names.

Student assignment

1

<!-- page 2 of 4 -->

CSCI 4521 / Homework 2

Rover Rescue

You may use library PCA, k-means initialization, classification metrics, and plotting tools. Do not replace the required NumPy operations with library implementations. Use three clusters for the terrain classifier; other cluster counts are optional investigations. Explain your initialization, stopping rule, and handling of empty clusters.

## Design your investigation

## 1. Representation (10 points)

Examine sensor scales and use PCA to investigate lower-dimensional structure. Report the number of components needed to retain at least **95% of the variance**, create a plot of number of principal components vs explained variance, and visualize the data set using the top 2 and top 3 principal components. You may include other useful PCA visualizations.

You choose the representation used in your final model. Retaining 95% variance is an analysis requirement, not a required deployment choice.

## 2. Experiments (20 points)

Compare at least **three distinct configurations**. Together, your experiments must: • show the effect of normalization;

• investigate a PCA representation;

• compare a cluster-based classifier with kNN.

Choose the configurations and comparisons yourself. Change enough controlled conditions to support your claims; three configurations are a minimum, and you should include any extra configurations you used for your comparisons.

For your cluster based classifier, you should perform k-means to group your training data into clusters and use those clusters along with the calibration data to attach terrain names (labels) to the different clusters. You should justify the number of clusters chosen and your method to attach labels to those clusters.

For each configuration, record **dimensions, validation accuracy, macro F1, sand recall, and practice rover outcome**. Explain why missing sand matters. Other metrics, timing, cluster diagnostics, or new sensor probes are welcome to support your analysis.

## 3. Deployment (10 points)

Choose one fitted model using your experimental evidence. Reuse it to predict the practice and mission grids, show a practice deployment, and export submission.csv. Explain your choice and analyze one failure, unexpected result, or limitation.

A successful rover run is not required for full credit. An honest, well-supported analysis of imperfect results is valid.

## Keep fitting and evaluation separate

Use split\_data(development, calibration) from the starter without changing its split. It returns calibration-training and validation tables, followed by the corresponding fit, training, and validation row indices.

Student assignment

2

<!-- page 3 of 4 -->

CSCI 4521 / Homework 2

Rover Rescue

| Data | Allowed use |
| --- | --- |
| Fit rows | Fit normalization, PCA, and k-means. |
| Calibration-training labels | Attach terrain names to clusters and train kNN. |
| Validation rows | Evaluate every configuration on the same rows and select a model. Do not use these labels to train or map clusters. |
| Mission observations | Apply stored transformations and the selected fitted predictor. Never fit on mission data or seek hidden labels. |

After selection, retain the fitted model. Do not refit on validation or mission data.

**Interpret evaluation carefully.** A practice rover run demonstrates deployment; it is not an independent estimate of classification accuracy. Once validation results inform model selection, they are not an untouched final test estimate either.

## Deliverables

Submit the following on Gradescope:

1. **Your code.** A **.ipynb** notebook file with your experiments including all code used and all figures added to your report. A fresh run with your assigned dataset must reproduce your results and predictions.

2. **Your evidence.** Include a practice deployment image or animation. If you are using Python locally, you can save the simulator’s HTML output.

3. **submission.csv.** One mission prediction per row, exported using save\_submission from the starter code.

4. **Your report.** A PDF report that should be read as a standalone document. Here are two examples of pdf reports written for previous semester assignments: [**example 1**](https://drive.google.com/file/d/[REDACTED]/view?usp=sharing), [**example 2**](https://drive.google.com/file/d/[REDACTED]/view?usp=sharing).

Include the code and evidence needed to review your work. Do not submit your dataset or simulator truth files.

## Write a clear report

Write an account of your investigation, rather than answers copied into a supplied template. Include a compact comparison table and at least one readable figure. Make sure a reader can understand:

• **Your question and choices:** what you investigated, which configurations you compared, and why.

• **Your evidence:** what scaling and PCA changed, what the supervised/unsupervised comparison showed, and how the metrics support those conclusions. Report the 95% PCA component count.

• **Your decision and limitations:** why you chose the deployed model, how sand errors affect the rover, and what an observed failure, surprise, or tie tells you.

• **Your evaluation protocol:** which observations and labels were used for fitting and validation, and how the fitted model was reused for the mission.

Student assignment

3

<!-- page 4 of 4 -->

CSCI 4521 / Homework 2

Rover Rescue

Use your own numerical results. Distinguish observations from possible explanations. If methods tie, report the tie; you do not need to invent a winner. Full implementation details and extra plots belong in your code/evidence, not the two-page report.

See the accompanying rubric for details. Credit reflects correct methods, fair experiments, supported reasoning, and reproducibility. No points depend solely on hidden mission success.

## Course policy

Follow the collaboration, citation, and AI-use policy described in the syllabus. Disclose assistance as required and be prepared to explain your implementation and conclusions.

## Example: from predictions to a rover route

The figure below illustrates how terrain predictions guide the supplied planner. Each square represents a location. The planner treats predicted sand as blocked and prefers firm terrain over rough terrain when choosing a route.

![Image block](doc:e5d1827/tier:flash/page:4/block:9)

<details>
<summary>image content</summary>

Illustrative predicted terrain map
Goal
Start
Firm    Rough   Sand
Planned rover route
</details>

Figure 1: An illustrative map and route, not output from a supplied dataset. The rover follows a route selected from the predicted terrain. If an apparently safe cell is actually sand, the rover can become stuck despite the planned route.

**Connect the map to your evidence.** In your own project, show a map or deployment produced by your fitted model. Explain how a terrain prediction could affect the rover’s route or outcome. Your map and route may look different from this illustration.

Student assignment

4
```
- `Bash` -- `mineru parse "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code/Homework/HW2.pdf" --pages all --tier flash --wait 300 2>&1 | head -400`
```
<!-- page 1 of 8 -->

CSCI 4521

A. Wyllie

February 25, 2025

1. Binary Clustering

HW 2

Amanda Wyllie

February 2025

After using a TF-IDF vectorizer with stemming on the message data, I used the KMeans cluster function with cluster number set as 2. I classified one cluster as spam and one as ham based on which one had more spam messages than the other. I then have a function that takes in the number of clusters used and the number of runs, and for each run it counts how many spam messages are in the spam cluster and compares it to the total number of spam messages, and the same for ham messages. Over 30 runs, there were on average 96% of the spam messages in the spam cluster and 92% of the ham messsages in the ham cluster. I think this means that the accuracy would be fairly high considering the large amount of ham messages in the dataset. However we have some instances where the cluster inaccurately placed spam data it was trained on in the ham cluster, so I imagine in practice we would have more false negatives (where postive = spam), thus decreasing the recall score and f1 score. For precision, it seems that we end up with some of the ham messages in the spam cluster, creating false positives and decreasing the precision and F1 scores. I think more clusters would be a better way of approaching this problem since it would be able to capture the different types of ham messages and different types of spam messages.

2. Clustering Quality

(a) Different clusters

Clusters With Mostly Ham

![Image block](doc:db21611/tier:flash/page:1/block:12)

i. hi

Some messages:

“Havent planning to buy later. I check already lido only got 530 show in e afternoon. U finish work already?”

1

<!-- page 2 of 8 -->

CSCI 4521

A. Wyllie

February 25, 2025

“Aaooooright are you at work?” “Yo carlos a few friends are already asking me about you you working at all this weekend?” “What Today-sunday..sunday is holiday..so no work..” “Have you finished work yet? :)” Cluster size: 84 Spam percentage: 0%

![Image block](doc:db21611/tier:flash/page:2/block:5)

ii. hi

Some messages:

“Did I forget to tell you ? I want you I need you I crave you ... But most of all... I love you my sweet Arabian steed ... Mmmmmm ... Yummy” “Smile in Pleasure Smile in Pain Smile when trouble pours like Rain Smile when sum1 Hurts U Smile becoz SOMEONE still Loves to see u Smiling!!” “Umma my life and vava umma love you lot dear” “I’m so in love with you. I’m excited each day i spend with you. You make me so happy.” “Hello darlin ive finished college now so txt me when u finish if u can love Kate xxx” Cluster size: 136 Spam percentage: 1.47%

iii. hi

2

<!-- page 3 of 8 -->

CSCI 4521

A. Wyllie

February 25, 2025

![Image block](doc:db21611/tier:flash/page:3/block:4)

Some messages:

“Dear will call Tmorrow.pls accomodate.” “Gud mrng dear hav a nice day” “Dear how is chechi. Did you talk to her” “aathi..where are you dear..” “I wont get concentration dear you know you are my mind and everything :-)” Cluster size: 71 Spam percentage: 1.4%

Clusters With Mostly Spam

![Image block](doc:db21611/tier:flash/page:3/block:8)

i. hi

Some messages:

3

<!-- page 4 of 8 -->

CSCI 4521

A. Wyllie

February 25, 2025

“FREE RINGTONE text FIRST to 87131 for a poly or text GET to 87131 for a true tone! Help? 0845 2814032 16 after 1st free tones are 3x£150pw to e£nd txt stop”

“Boltblue tones for 150p Reply POLY or MONO eg POLY3 1. Cha Cha Slide 2. Yeah 3. Slow Jamz 6. Toxic 8. Come With Me or STOP 4 more tones txt MORE”

“Get ur 1st RINGTONE FREE NOW! Reply to this msg with TONE. Gr8 TOP 20 tones to your phone every week just £1.50 per wk 2 opt out send STOP 08452810071 16”

“FREE for 1st week! No1 Nokia tone 4 ur mobile every week just txt NOKIA to 8077 Get txting and tell ur mates. www.getzed.co.uk POBox 36504 W45WQ 16+ norm150p/tone”

“No. 1 Nokia Tone 4 ur mob every week! Just txt NOK to 87021. 1st Tone FREE ! so get txtin now and tell ur friends. 150p/tone. 16 reply HL 4info”

Cluster size: 32

Spam percentage: 100%

![Image block](doc:db21611/tier:flash/page:4/block:11)

ii. hi

Some messages:

“Free entry in 2 a wkly comp to win FA Cup final tkts 21st May 2005. Text FA to 87121 to receive entry question(std txt rate)TC’s apply 08452810075over18’s” “SIX chances to win CASH! From 100 to 20000 pounds txt¿ CSH11 and send to 87575. Cost 150p/day 6days 16+ TsandCs apply Reply HL 4 info ” “URGENT! You have won a 1 week FREE membership in our £100000 Prize Jackpot! Txt the word: CLAIM to No: 81010 TC www.dbuk.net LCCLTD POBOX 4403LDNW1A7RW18”

“Sunshine Quiz Wkly Q! Win a top Sony DVD player if u know which country the Algarve is in? Txt ansr to 82277. £1.50 SP:Tyrone”

4

<!-- page 5 of 8 -->

CSCI 4521

A. Wyllie

February 25, 2025

Cluster size: 94

Spam percentage: 96.8%

![Image block](doc:db21611/tier:flash/page:5/block:6)

iii. hi

Some messages:

“Your free ringtone is waiting to be collected. Simply text the password MIX to 85069 to verify. Get Usher and Britney. FML PO Box 5249 MK17 92H. 450Ppw 16”

“okmail: Dear Dave this is your final notice to collect your 4\* Tenerife Holiday or 5000 CASH award! Call 09061743806 from landline. TCs SAE Box326 CW25WX 150ppm”

“Urgent! call 09066350750 from your landline. Your complimentary 4\* Ibiza Holiday or 10000 cash await collection SAE TCs PO BOX 434 SK3 8WP 150 ppm 18+ ”

“Shop till u Drop IS IT YOU either 10K 5K £500 Cash or £100 Travel voucher Call now 09064011000. NTT PO Box CR01327BT fixedline Cost 150ppm mobile vary”

Cluster size: 36

Spam percentage: 94%

(b) Outlier messages Ham cluster ii has a 2 spam messages. One of these is “Finished class where are you.”. This reads to me like a ham message, I would not be able to tell it was a spam message. It lacks lots of the word combinations in many of the spam messages as displayed on the word maps for the spam cluster examples showed above, so it makes lots of sense that this would end up in this cluster.

Ham cluster iii had one spam message : “Fine if thats the way u feel. Thats the way its gota b”. This also reads like a ham text to a human, and there are no defining words or word combos that identify it as a spam message.

Spam cluster ii has 3 ham messages, including “Ok i am on the way to home hi hi”.

5

<!-- page 6 of 8 -->

CSCI 4521

A. Wyllie

February 25, 2025

To me this does not read like a spam message. However we do see a lot of common words in this message, so it may not have any strong correlation to any of the clusters in particular.

Spam cluster iii has 2 ham messages, including “I see the letter B on my car”. I think the word “letter” plays influence on the placement of this message.

(c) 4 new messages For each of these messages, I created a vector for it and computed the distance from it and each cluster in order to find the cluster center it was closest to in order to determine which cluster it would be added to.

i. “Do you work on sunday? We are thinking of planning a party. Send me your work schedule when you get it.” Talking about work and planning is associated with ham cluster i. My code said this would be added to ham cluster i.

ii. ”my love I miss you”. Words like ”love” and ”miss” are characteristic of ham cluster ii. My code said this would be added to ham cluster ii.

iii. ”gud morning dear wat r u doin later” has misspellings and words like ”dear” characteristic of messages in ham cluster iii, as my code agreed.

iv. ”get your new free ringtone! reply with tone. 20 tones a week”. Messages about free ringtones and getting ringtones every week are characteristic of spam cluster i. My code did identify this as spam cluster i.

3. PCA

(a) hi

![Image block](doc:db21611/tier:flash/page:6/block:13)

(b) Spam features that are far away from spam:

”How come it takes so little time for a child who is afraid of the dark to become a teenager who wants to stay out all night?” To me this is uncharacteristic of a spam message. There are no words like ”free” or things asking for action like to text or call a number that is characteristic of a spam message.

”Did you hear about the new Divorce Barbie? It comes with all of Ken’s stuff!” I would assume this is far from spam because barbie is not a topic in many of the

6

<!-- page 7 of 8 -->

CSCI 4521

A. Wyllie

February 25, 2025

spam messages, and also in the ham messages. However it is around some ham probably because of the inclusion of words like ”did you” and the name Ken.

(c) There are 6859 features in the dataset. About 310 components are required to capture at least 50% of the data in the variation in the dataset, according to the following figure:

![Image block](doc:db21611/tier:flash/page:7/block:6)

4. Dimensionality Reduction and Classification

I wrote both a 1-NN classifier with all the vectorized features and a top-k PCA component 1-NN classifier. After splitting the data into training and testing sets, I created principle components for the training data. For the top-k PCA, I figured out which k to use similar to how we did in class, by testing the performance of a 1-NN classifier on the testing data over a range of K dimensions. For each k dimension, I generated predicted classification for every element in the testing data and compared the predicted classifications to the actual classifications to get accuracy. A k of 120 had the highest accuracy (around 96%), but I wanted to account for at least 50% of the variance, so I chose a k of 310 principle components, which still had a pretty high accuracy (around 95%).

Then for both classifiers, I split the data into training and testing sets (before generating the PCA on the training set). Then I used each to classify everything in the testing set and

7

<!-- page 8 of 8 -->

CSCI 4521

A. Wyllie

February 25, 2025

compared the predicted to the actual classifications in order to generate accuracy and F1 scores. I also used the %%time function to time the execution. It should be noted that I considered ”spam” classification to be ”positive” when calculating F1 score.

The non PCA classifier had an accuracy of around 93%, an F1 score of about .99, but had a wall time of around 14 minutes to classify everything in the testing set (where the the testing set was 33% of the total data). In comparison, the PCA classifier with 310 principle components had a higher accuracy of 95%, an worse F1 score of .89 (which is still pretty good), with a much faster wall time of 44.8 seconds.

Considering the application of this as a spam filter, it would be more of a problem if the classifier accidentally considered an actual text message to be spam. Thus we would want to eliminate false positives. It would also be a large hinderance if the spam filter took a long time to decide what to classify an incoming message as.

A better way to identify the best number of principle components to use would be to check F1 score over a range of different numbers of principle components rather than the accuracy score.

5. Spam Classification

My spam classifier is identical to my 310 principle component classifier from question 4. I chose to use principle componenets and only find one nearest neighbor to minimize runtime. I did not see any reason to change the vectorization and left it as a TF-IDF because the performance with a TF-IDF was fairly optimum (51% of the variance explained, 95% accuracy, and .89 f1 score). I chose to use stemming in order to lessen the number of features (words) as this would improve performance.

8
```
- `Bash` -- `mineru parse "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Textbook & Resources/Syllabus - CSCI 4521.pdf" --pages all --tier flash --wait 300 2>&1 | head -400`
```
<!-- page 1 of 9 -->

# CSCI 4521: Applied Machine Learning (3 credits)

Fall 2025

Tue/Thu 2:30pm-3:45pm

Amundson Hall B75

**Instructor**: Bernardo Bianco Prado (he/him)

**Email**: [bianc072@umn.edu](mailto:bianc072@umn.edu)

**Office**: Lind Hall 300H (during office hours or by appointment only) **Office Hours:** MWTh 1pm-2pm

| Graduate TA: Ebasa Temesgen | Graduate TA: Zhongxing Zhang |
| --- | --- |
| Email: temes021@umn.edu | Email: zhan8889@umn.edu |
| Undergraduate TA: Eddie Jang | Undergraduate TA: John Palmer |
| Email: zhan8168@umn.edu | Email: palm0545@umn.edu |
| Undergraduate TA: Harini Kuchibhotla | Undergraduate TA: Alistair White |
| Email: kuchi027@umn.edu | Email: whit3491@umn.edu |
| Undergraduate TA: Ethan Phua |  |
| Email: phua0003@umn.edu |  |

Welcome to CSCI 4521 Applied Machine Learning! This course is an introduction to solving problems with machine learning. This includes applications of linear algebra, statistical and non-parametric models, and deep regression & classification models. We will emphasize hands-on experiences using modern machine learning libraries and working with a variety of real-world datasets with numeric, text, and image data. There are many exciting aspects of the field, let me know if there are any particular topics or types of data that you’d like us to cover. I want this course to be interesting and useful to you as you continue in your careers!

<!-- page 2 of 9 -->

## Course Overview

Course Objective This course is intended to serve as an introduction to solving problems with machine learning (ML). We will cover important, practical, foundational aspects of ML including classifying data, supervised vs. unsupervised learning methods, numerical optimization, linear and non-linear regression models, neural networks/deep learning. We will also cover related areas needed to make good practical use of machine learning such as loading and cleaning datasets, data visualization/graphing, discussion and interpretation of models, and ethics in ML. The course will be a mix of in-class discussions, hands-on coding, projects, and quizzes.

Course Materials Machine learning is a rapidly changing area, but there are many good resources that focus on stable, long-lasting mathematical and algorithmic foundations of the field. We will make use of the materials from the following (free online) book:

## An Introduction to Statistical Learning, with applications in Python

G. James, D. Witten, T. Hastie, R. Tibshirani, J. Taylor Available [here](https://www.statlearning.com/)

Other books you may find useful, especially if you intend to use machine learning in an industry position someday:

## Machine Learning System Design Interview

A. Aminian, A. Xu

## Deep Learning Book

I. Goodfellow, Y. Bengio, A. Courville Available [here](https://www.deeplearningbook.org/)

Neither book is required for this course.

Other Resources

\- Piazza is an online discussion platform where students can post questions to each other or privately to instructors. We will have a class Piazza page that the TAs and I will monitor daily. I encourage students to post questions here and collaborate on answers with each other. However, if we see any answers to homework or quiz questions, the post will be deleted. If you have any problems or feedback for the developers, email team@piazza.com.

<!-- page 3 of 9 -->

Prerequisites The most important prerequisite is being comfortable with Python (e.g., creating/using functions, importing packages, debugging issues). You should also be comfortable with introductory calculus (slopes and derivatives), basic probability and statistical concepts (computing probabilities, multivariate gaussian distributions, and standard deviations), and basic linear algebra (vectors and their operations, basis, vector spaces).

Over the first few lectures we’ll cover some important Python libraries including Pandas and Matplotlib that you will use frequently throughout the course. We will only cover the usage of these tools briefly in class, and you are expected to have the software development maturity needed to find tutorials and read necessary documentation.

Relationship to other ML courses

The Computer Science department offers many Machine Learning courses that specialize in different areas of ML. This course serves as a hands-on introduction to the broad field. With a focus on "Applied" ML, we will use modern, powerful ML frameworks such as PyTorch to do the heavy lifting for us. Courses like CSCI 5521 **(ML Fundamentals**) and CSCI 5525 (**ML Analysis & Methods**) focus on students developing the algorithmic and mathematical underpinnings of ML, giving you the skills to build and customize your own models and training methods. Other courses, such as CSCI 5523 (**Data Mining**), CSCI 5527 (**Deep**

**Learning**), CSCI 5541 **(Natural Language Processing**), and CSCI 5561 (**Computer Vision**)

focus on specialized applications of ML and will delve deeply into topics that are only briefly introduced here.

## Expectation of Student

Class Participation I expect you to ask questions. We will be covering very recent work, and not all questions will have clear answers (and I may not know them!), but asking questions is likely to spur good class discussions that will increase learning for all. There will also be many in-class activities, so be ready to talk to your neighbors. These in-class activities will be graded based on completion and demonstration of effort.

In-Class Materials Various in-class activities will involve writing, coding, and drawing. Please bring a pencil or pen to class every day, along with some paper. There will also be some activities that involve coding (either in a group, or following along with me), if possible, bring a laptop to class so you can join. If you don’t have access to an easily portable laptop, many activities

<!-- page 4 of 9 -->

can be done on a tablet or phone, or you can team up with others sitting near you. Please also reach out to me if that’s the case and we can try to find you a device from the school.

Programming Language Most programming in the class will be done with Python, the de facto accepted standard language for machine learning in any computer science-based context.

Plagiarism & Academic Dishonesty

As students in a university community, you are expected to do your own academic work and to cite **prominently** any sources of knowledge that you draw on in completing your academic work (**including any AI assistants; see** [**the libraries guide to citing AI generated content**](https://libguides.umn.edu/c.php?g=1314591&p=9664746)). Failing to do so is scholastic dishonesty, which includes: plagiarism; cheating on assignments or examinations, including the unauthorized use of online learning support and testing platforms; letting another person copy your answers/work; engaging in unauthorized collaboration on academic work, including the posting of student-generated coursework on online learning support and testing platforms not approved for the specific course in question; taking, acquiring, or using course materials without faculty permission, including the posting of faculty-provided course materials on online learning support and testing platforms; submitting false or incomplete records of academic achievement; acting alone or in cooperation with another to falsify records or to obtain dishonestly grades, honors, awards, or professional endorsement; altering, forging, misrepresenting, or misusing a University academic record; or **fabricating or falsifying data, research procedures, or data analysis**.

When it is determined that a student has cheated, the student may be given a penalty which could include an "F" or an "N" for the course, and may face additional sanctions from the University.

In order to be as clear as possible about your scholastic conduct responsibilities and how these relate specifically to the types of courses that we teach in the Department of Computer Science & Engineering, the faculty have prepared the document [Academic Conduct Policies for Students in Computer Science & Engineering Department Classes](https://cse.umn.edu/cs/undergraduate-academic-conduct-policy). Our course will follow this policy, which stands alongside the broader [Board of Regents Student Conduct Code](http://regents.umn.edu/sites/regents.umn.edu/files/policies/Student_Conduct_Code.pdf). Additional resources pertaining to academic integrity can be found through

<small><span class="docvortex-page-footnote" data-block-type="page_footnote" style="color:#6b7280">the [Office for Community Standards](https://communitystandards.umn.edu/avoid-violations/avoiding-scholastic-dishonesty) and the [Center for Educational Innovation](https://docs.google.com/document/d/[REDACTED]/edit?usp=sharing).</span></small>

<small><span class="docvortex-page-footnote" data-block-type="page_footnote" style="color:#6b7280">Beware of websites that advertise themselves as being “tutoring websites.” It is not permissible to upload any course materials to these sites without their permission or copy material for your own homework assignments from these various sites. When you have</span></small>

<!-- page 5 of 9 -->

additional questions and concerns, please speak with or email me (your instructor) to clarify practices expected for the course. I can respond to your specific questions regarding what would constitute scholastic dishonesty in the context of this particular class, for example, when and whether collaboration on assignments is permitted, when citing sources is required and what citation method to use, or when and which electronic aids are permitted or prohibited during an exam.

You are responsible for knowing and following the policies on scholastic conduct that are described here in the syllabus and in the related documents discussed above (see especially the CS&E Academic Conduct Policies for Students in Computer Science & Engineering Department Classes linked above).

Generative AI and other online tools

Generative AI tools (such as ChatGPT, Claude, or Copilot) are powerful resources for you as students and programmers. I encourage you to develop your skills in using these tools as they will most likely become a part of your professional workflow. However, in the classroom, these generative AI tools may work counter to the lea rning objectives of a particular assignment or task. On each assignment or task given to you, I will make it clear what type of AI usage is allowed through the following color coding system:

| AI usage on this | AI usage is technically | Do not use AI tools on |
| --- | --- | --- |
| assignment is | allowed but not | this assignment. It |
| encouraged! Develop | encouraged. You should | goes against the |
| your AI skills! | try this by yourselffirst. | learning objectives. |

Additional considerations you should make if you choose to use generative AI models:

● These generative tools are not infallible. They are not knowledge engines, peer-reviewed, or outputs even checked for accuracy. They are trained to produce human-like content - real or not. Please be very cautious when using them. You will be held responsible for all work you submit so please check and verify your information and citations regularly. Your responses should be your own, no matter if an AI engine helped you develop your response or not.

● The data security of the generative AI models that you work with may not be guaranteed. Some models, such as ChatGPT or Grammarly (if you do not opt-out),

<!-- page 6 of 9 -->

use all inputs as future training for the model. This means that any private or copyrighted information you upload, paste, or type into the tool are now a part of the model itself. This means uploading academic articles, homework questions, artwork, into an unprotected model is an inappropriate use of copyrighted material. Other models, such as Copilot’s enterprise data protection tool, guarantees these inputs are protected from further use. The University of Minnesota now provides access to this model with data protection. More information here: [Copilot enterprise data protection](https://it.umn.edu/services-technologies/copilot-enterprise-data-protection). More university-wide guidance can be found here: [AI appropriate use policy](https://it.umn.edu/services-technologies/resources/artificial-intelligence-appropriate-use)

● The environmental impact of large generative models has been increasingly discussed by both the scientific community and the legislative community. The electricity and rare earth metals that are required to train these models and host them as a service could be significantly detrimental to our world. Check out this opinion piece in Nature: [Generative AI’s environmental costs are soaring](https://www.nature.com/articles/d41586-024-00478-x) and these peer-reviewed journal articles: [Estimating the environmental impact of Generative-AI services using an LCA-based methodology](https://doi.org/10.1016/j.procir.2024.01.098); [A social-environmental impact perspective of generative artificial intelligence](https://doi.org/10.1016/j.ese.2024.100520)

## Assignments and Grading

Course Work This class will have 4 homework assignments, 6 quizzes and a final project. Quizzes will be taken biweekly during class on Thursdays. They will be focused primarily on interpreting results of methods on new datasets - questions you may come across in technical interviews or during research presentations. Homework submissions will be a combination of well-documented python code (via Jupyter notebooks) and short written reports (as a PDF). The final project will be a student-led project involving a short proposal and presentation in addition to the coding work and will count approximately 2x a homework. There will be in-class activities in every lecture in the form of chime-in responses. To receive credit for your answers, you must demonstrate that you were in class and attempted to solve the problem. These activities must be done in-class and cannot be made up. The lowest 3 will be dropped from your final grade. If you believe this to be prohibitive to your learning, please come talk with me and we can discuss alternative options.

Late Policy All assignments will get a grace day for submission. This means you always have an extra 24 hours to submit an assignment without penalty. However, no later submissions will be accepted after those 24 hours.

<!-- page 7 of 9 -->

Special/life circumstances If you have a special or life circumstance that may prevent you from completing an assignment on time, you **must let me know within 72 hours of you being able to contact me via email or in person**. For example, if you lose your laptop, you must email me within 72 hours of you realizing you lost it

Grading Breakdown (approximate)

| Homework 1-4 | 40% |
| --- | --- |
| Quizzes 1-6 | 30% |
| Final project | 20% |
| Participation activities | 10% |

If errors were made in grading your work, we welcome regrade requests for the 7 calendar days after the assignment's grade was released to you. These regrade requests will be submitted to the TA who graded it originally. If needed, regrade requests can be escalated to Shelby and Guanchen (graduate TAs) then me (instructor). We are human and will make mistakes! Please check your graded assignments regularly to make sure mistakes do not perpetuate. Regrade requests that come after the 7 day window will not be accepted.

Quizzes Quizzes will take place on Thursdays at the end of class. For each quiz, you can bring two pages of notes (front and back). **These notes need to be on paper**, but they can be printed from a device if you’d like.

Extra Credit Some assignments or activities will provide opportunities for a small amount of extra credit. These opportunities are meant to encourage students who are particularly interested in some aspect of the class to go into more depth.

Topics The course will cover a variety of topics across various areas of machine learning but will be organized into the sections outlined below:

<!-- page 8 of 9 -->

\- <strong><u>ML Overview</u></strong>**:** An introduction to ML including types of problems (supervised vs unsupervised, regression vs classification) and common tools (NumPy, Pandas, and SKLearn).

\- **Topics include**: Working with CSV files and tabular data, Tools/Libraries, KNN, Classification metrics

\- <strong><u>Unsupervised Learning</u></strong>**:** Algorithmically finding structure in a set of observed data (e.g., clustering customers with similar purchase patterns).

\- **Topics include**: Working with text files, K-Means clustering, PCA, Gaussian Mixture Models (GMMs)

\- <strong><u>Regression</u></strong>**:** Fitting equations, and other numerical models, to datasets in order to make predictions or interpolate/extrapolate data (e.g., linear regression).

\- **Topics include**: Measuring errors and residuals, Numerical optimization with PyTorch

\- <strong><u>Classification</u></strong>**:** Computing which category a piece of data belongs to (e.g., which digit was written, is a message spam or not, what species is a given flower).

\- **Topics include**: Working with images, Logistic Regression, ROC/AUC, Model selection.

\- <strong><u>Neural Networks/Deep Learning</u></strong>**.** Neural networks are a form of non-linear models that can easily represent highly complex data relationships, and work well with large datasets. Deep learning extends these concepts to more complex and even larger datasets.

\- **Topics include**: Multi-Layer Perceptron (MLP), Loss Functions (Cross Entropy, L1/L2 Loss), Convolutional Networks (CNNs), maybe Recurrent Neural Networks (RNNs) if time permits

Additionally, each unit will cover topics relating to ethics in ML, visualizing ML results, and ML in the news. Depending on the pacing of the course and student interest we may cover topics relating to modern applications of AI and machine learning such as generative AI models, working with pre-trained models, zero-shot learning, and large language models.

Access and Accommodations

My goal is to create a learning environment that is accessible and inclusive for all students. If you anticipate any barriers related to the design of the course (such as the format, materials, or structure), please contact me outside of class so we can explore potential options. If you have a disability and want to explore formal accommodations and/or further resources, please contact our campus [Disability Resource Center](https://disability.umn.edu/) (DRC) (drc@umn.edu).

If you have already consulted with our DRC, please share your letter with me as soon as you can to discuss how your accommodations will be implemented in this course.

<!-- page 9 of 9 -->

Programming Tools We will make use of many APIs/libraries that are popular in machine learning including: Jupyter notes, Pandas, Matplotlib, Seaborn, Scikit-Learn, and PyTorch. We will build-up comfort with and exposure to these tools over the course of the semester.

## Additional Information

Important statements covering university policy on disabilities, accommodations, mental health, non-discrimination, and sexual harassment can be found on the course webpage.

Please do not hesitate to contact me if you have any special needs or unique considerations that arise during the course.

**Acknowledgement: this syllabus was adapted from Shelby Ziccardi Spring 2025 course**
```
- `Bash` -- `D="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/1b6f8eac-44d0-4860-b243-88b063adb7c7/scratchpad/repo"; mkdir -p "$D" && git clone --depth 1 https://github.com/be-prado/csci4521.git "$D" 2>&1 | tail -3; ls -R "$D/2026/homework-2" 2>&1 | head -50`
```
Cloning into 'C:/Users/anant/AppData/Local/Temp/claude/[REDACTED]/[REDACTED]/scratchpad/repo'...
C:/Users/anant/AppData/Local/Temp/claude/[REDACTED]/[REDACTED]/scratchpad/repo/2026/homework-2:
rover-rescue

C:/Users/anant/AppData/Local/Temp/claude/[REDACTED]/[REDACTED]/scratchpad/repo/2026/homework-2/rover-rescue:
README.md
assignment_student.md
demo_data
requirements.txt
rover_starter.py
rubric.md
run_demo.py

C:/Users/anant/AppData/Local/Temp/claude/[REDACTED]/[REDACTED]/scratchpad/repo/2026/homework-2/rover-rescue/demo_data:
calibration.csv
config.json
development.csv
mission.csv
practice_truth.bin
```
- `Read` -- `C:\Users\anant\AppData\Local\Temp\claude\D---Anant-20-Progress-Documents-Jarvis\1b6f8eac-44d0-4860-b243-88b063adb7c7\scratchpad\repo\2026\homework-2\rover-rescue\rubric.md`
- `Read` -- `C:\Users\anant\AppData\Local\Temp\claude\D---Anant-20-Progress-Documents-Jarvis\1b6f8eac-44d0-4860-b243-88b063adb7c7\scratchpad\repo\2026\homework-2\rover-rescue\rover_starter.py`
- `Read` -- `C:\Users\anant\AppData\Local\Temp\claude\D---Anant-20-Progress-Documents-Jarvis\1b6f8eac-44d0-4860-b243-88b063adb7c7\scratchpad\repo\2026\homework-2\rover-rescue\README.md`
- `Read` -- `C:\Users\anant\AppData\Local\Temp\claude\D---Anant-20-Progress-Documents-Jarvis\1b6f8eac-44d0-4860-b243-88b063adb7c7\scratchpad\repo\2026\homework-2\rover-rescue\run_demo.py`
- `Bash` -- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/1b6f8eac-44d0-4860-b243-88b063adb7c7/scratchpad/repo/2026/homework-2/rover-rescue"; cat requirements.txt config 2>/dev/null; cat demo_data/config.json | head -40; diff <(cat assignment_student.md) /dev/null | wc -l; head -3 demo_data/*.csv`
```
numpy
pandas
matplotlib
scikit-learn
ipython
{
  "assignment": "HW2 Rover Rescue",
  "student_id": "demo3",
  "grid_shape": [
    28,
    28
  ],
  "sensor_columns": [
    "sensor_1",
    "sensor_2",
    "sensor_3",
    "sensor_4",
    "sensor_5",
    "sensor_6",
    "sensor_7",
    "sensor_8"
  ],
  "terrain_names": [
    "firm",
    "rough",
    "sand"
  ],
  "practice_start_yx": [
    26,
    1
  ],
  "practice_goal_yx": [
    1,
    26
  ],
  "mission_start_yx": [
    26,
    1
  ],
  "mission_goal_yx": [
    1,
    26
  ],
  "n_clusters": 3,
  "assignment_version": 2
31
==> demo_data/calibration.csv <==
x,y,terrain
12,14,firm
25,23,firm

==> demo_data/development.csv <==
y,x,sensor_1,sensor_2,sensor_3,sensor_4,sensor_5,sensor_6,sensor_7,sensor_8
0,0,5.048911738629986,107.10573329296992,-3.3529753073696646,1025.7264827108702,7.036738660687553,20.054096296939857,-36.52709779416116,7.314198994048327
0,1,5.023022001488049,96.06988892973717,-3.7140710343090175,1033.3439957329417,5.783686157763053,20.044978790518492,-45.519834365105574,7.902575146707038

==> demo_data/mission.csv <==
y,x,sensor_1,sensor_2,sensor_3,sensor_4,sensor_5,sensor_6,sensor_7,sensor_8
0,0,5.087812580748816,121.17734097821175,-3.8557651389634895,979.5237421328616,4.405370571137191,20.064798900075672,-53.07414694650245,7.644423964704818
0,1,5.066292053583881,110.07863358643962,-3.988364740552851,1001.0792642726028,7.704208705360154,20.061161176780033,-38.06076013786108,7.753876742754478
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/Jarvis"; ls; echo ---; ls -R "20_Progress/Degree/CSCI 4521" 2>&1 | head -80`
```
00_Dashboard.md
10_Areas
20_Progress
30_Order
40_Resources
50_Archive
60_Claude
AGENTS.md
CLAUDE.md
HUMAN_WRITING.md
Tracker
Untitled.base
__pycache__
blobs
copilot
wa1_template.tex
---
20_Progress/Degree/CSCI 4521:
CSCI 4521 Board.md
Homework
Preparation.md
Textbook
Weekly

20_Progress/Degree/CSCI 4521/Homework:
Homework - 1.md
Homework - 2.md

20_Progress/Degree/CSCI 4521/Textbook:
DLB
ENLP
ISL
Textbook Map.md

20_Progress/Degree/CSCI 4521/Textbook/DLB:
Chapter - 2.md
Chapter - 3.md
Chapter - 5.md

20_Progress/Degree/CSCI 4521/Textbook/ENLP:
Chapter - 1.md
Chapter - 3.md
Chapter - 6.md
Chapter - 7.md

20_Progress/Degree/CSCI 4521/Textbook/ISL:
Chapter - 12.md
Chapter - 2.md
Chapter - 4.md

20_Progress/Degree/CSCI 4521/Weekly:
Week - 1 (Prompts).md
Week - 1.md
Week - 2.md
Week - 3.md
Week - 4.md
Week - 5.md
Week - 6.md
Week - 7.md
Weekly Board.md
```
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4521\Homework\Homework - 2.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4521\Homework\Homework - 1.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4521\CSCI 4521 Board.md`
- `Bash` -- `cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521"; ls -R Lectures | head -80; echo ---; ls -R Code/Lectures | head -60; echo ---; cat Code/environment.yml; echo ---; cat Code/Homework/README.md; echo; ls Code/Homework/figures`
```
Lectures:
Week - 1
Week - 2
Week - 3
Week - 4
Week - 5
Week - 6
Week - 7

Lectures/Week - 1:
0.1 course logistics, intro to ML.pptx.pdf

Lectures/Week - 2:
1.2 kNN, accuracy, overfitting.pptx.pdf
1.3 bayes classification, kNN.pptx.pdf

Lectures/Week - 3:
1.4 generalization, confusion matrix, accuracy, precision, recall, f1 score .pptx.pdf
1.5 kNN wrap up, kd trees, lsh, complexity, bias.pptx.pdf

Lectures/Week - 4:
2.1 text data, intro to nlp.pptx.pdf
2.2 nlp practice.pptx.pdf

Lectures/Week - 5:
2.4 pca.pptx.pdf

Lectures/Week - 6:
2.3 unsupervised learning, k-means clustering.pptx.pdf
2.5 modern text embedding.pptx.pdf
3.1 advanced clustering, lda, gmm.pptx.pdf

Lectures/Week - 7:
3.2 DBSCAN, intro to regression.pptx.pdf
---
Code/Lectures:
Week 6 - 10
Weeks 1 - 5

Code/Lectures/Week 6 - 10:
2.3 k-means clustering - completed.ipynb
2.3 k-means clustering.ipynb
2.5 modern text embeddings.ipynb
3.1 gaussian mixture models.ipynb
[REDACTED].png

Code/Lectures/Weeks 1 - 5:
0.1 intro to colab, pandas, sns.ipynb
1.1 Nearest Neighbor Classifier.ipynb
1.2 NN Classifier.ipynb
1.3 kNN Iris Classification.ipynb
1.3 kNN with SciKit-Learn.ipynb
2.1 tf-idf vectorization, sklearn.ipynb
2.2 text classification.ipynb
2.4 PCA on iris data.ipynb
2.4 PCA on newsgroups.ipynb
Numpy Introduction
Week 1 - practice - Pandas Tutorial (Dimorphism).ipynb
download.png
---
name: csci-4521
channels:
  - conda-forge
  - nodefaults
dependencies:
  - python=3.12
  # OpenBLAS instead of MKL: MKL only finds its DLLs when the env is activated,
  # so a Jupyter kernel launched straight from python.exe crashed on matrix math.
  - libblas=*=*openblas
  - numpy
  - pandas
  - matplotlib
  - seaborn
  - scikit-learn
  - jupyterlab
  - ipykernel
  - nbconvert
---
# CSCI 4521 Homework 1

- `CSCI4521_HW1.ipynb`: the notebook to submit. It answers Q1 and Q2 and computes every number and figure used in the Q3 to Q5 report.
- `PhiUSIIL_HW1_777.csv`: the assignment dataset.
- `figures/`: the three report figures, written by the notebook every time it runs.

Run it in VS Code with the **Python (CSCI 4521)** kernel (conda env `csci-4521`, built from `../environment.yml`) using Restart and Run All. The seed is fixed, so every run gives the same numbers.

fig1_pairplot.png
fig2_f1_vs_k.png
fig3_metrics.png
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/Jarvis"; ls "30_Order/Workflows/Courses/Per Class/" | head; echo ---; cat "30_Order/Workflows/Courses/Per Class/CSCI 4521 Workflow.md"; echo ---; ls 30_Order/Standards | head -60; ls 30_Order/Templates | head -60`
```
CSCI 4061 Workflow.md
CSCI 4511W Workflow.md
CSCI 4521 Workflow.md
CSCI 5304 Workflow.md
Technical Interview Workflow.md
---
---
type: system
system_kind: guide
status: sprout
created: 2026-10-21
updated: 2026-10-21
tags:
  - system
  - workflow
  - CSCI4521
notes:
  - "[[Course Production Workflow]]"
  - "[[Weekly Workflow]]"
  - "[[Textbook Workflow]]"
  - "[[Textbook Map Workflow]]"
  - "[[Concept Workflow]]"
  - "[[Homework Workflow]]"
  - "[[Exam Workflow]]"
  - "[[CSCI 4521 Board]]"
---
# CSCI 4521 Workflow
This is the course-specific routing contract for Applied Machine Learning. It works with the course Board and the generic course standards/workflows. The Board remains the authority for dates, weights, and the Fall-2025-label/ENLP/Linear-Algebra-Notes/PyTorch-series open questions; this note explains how to turn those facts into notes, week after week, without re-deriving the process each time.
## Course shape
No midterm or final exam exists for this course - grading is Homework 1-4 (40%, each a Jupyter notebook paired with a short written PDF report), Quizzes 1-6 (30%, biweekly, in class on Thursdays, two pages of notes allowed), a student-led Final Project (20%, proposal + presentation + code, roughly 2x a single homework in effort), and Participation (10%, graded on completion/effort, lowest 3 chime-in activities dropped automatically, cannot be made up otherwise). The instructor teaches live by writing code in Google Colab rather than presenting pre-built slides for every minute - decks exist and are the primary record of what was *said*, but a non-trivial share of lectures (1.1 is the clearest example: no deck exists, the `.ipynb` notebook is the lecture) live only as a notebook. Three textbooks support the course: *An Introduction to Statistical Learning* (ISL, primary), *Deep Learning* (DLB, Goodfellow/Bengio/Courville, secondary), and *Elements of Natural Language Processing* (ENLP, assigned from Week 4 onward for the NLP unit). The known assessment routing is:

| Course work | Template/workflow | Note purpose |
|---|---|---|
| Weekly lecture | [[Week Template]] / [[Weekly Workflow]] | Pre-lecture source prep (deck + companion notebook), protected live capture, post-lecture reconciliation against the textbook |
| Textbook chapter | [[Textbook Template]] / [[Textbook Workflow]] | Source-checked chapter note built directly from the real ISL/DLB/ENLP PDF, one canonical note per book-and-chapter even when a chapter spans weeks |
| Concept or cross-cutting mechanism | [[Concept Template]] / [[Concept Workflow]] | None exist yet for this course - see Concept-note discipline below before creating the first one |
| Homework | [[Homework Template]] / [[Homework Workflow]] | The notebook's real computed numbers/figures plus the written report's actual claims - never the assignment prompt restated |
| Quiz practice | [[Exam Material Template]] / [[Exam Workflow]] | A drill bank of interpret-the-result questions on an unfamiliar dataset, matching the quiz's real format (see Quiz-period workflow below) - quizzes themselves are not a `class_kind: exam` sheet, since there is no scope-and-format exam day to track, just a recurring graded checkpoint |
| Final Project | [[Project Template]] / [[Projects Workflow]] | Proposal, concept links to the units it draws from, work log - no Project folder exists yet; create one once the interest-form/proposal step (Week 9+) actually starts |
| Course preparation | [[Preparation Template]] / [[Preparation Workflow]] | Grading leverage, weekly time budget, real traps - this course's own [[20_Progress/Degree/CSCI 4521/Preparation|Preparation]] note is the working example |
## Source hierarchy and trust
1. Live Canvas, Piazza, and instructor announcements control dates, requirements, and policy - but confirm the instructor identity, meeting time, and TA roster against Canvas before trusting them: the source syllabus PDF is dated "Fall 2025" and has never been separately checked against this semester's actual page, per [[CSCI 4521 Board]]'s standing warning.
2. The professor's own course-schedule spreadsheet (linked from [[CSCI 4521 Board]]'s Source of Truth section) is the real week-by-week calendar - the syllabus PDF itself has no dates, only five topic units. Trust the spreadsheet over any date inferred from the syllabus's unit list.
3. The local CSCI 4521 source folder (`D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\`) controls the three textbook PDFs, lecture slide decks, companion `.ipynb` notebooks, and homework files. **Correction made 2026-10-21 on the Board:** the ENLP PDF (`Textbook & Resources/ENLP Textbook CSCI 4521.pdf`) is already present locally - the Textbook Map already had this right, but the Board's Source of Truth paragraph still claimed it was missing until this pass fixed it. Don't let a stale "missing" label block building an ENLP chapter note.
4. Per lecture, a real deck outranks a companion notebook for the *concept* framing, but the notebook outranks the deck for *real computed numbers* (accuracy figures, predicted classes, plot behavior) - never invent a number the deck doesn't show when a notebook exists with the real one, and vice versa never flatten a notebook's real narrative arc (e.g. 1.1's normalization-changes-the-prediction finding) into a generic restatement of the deck's framing.
5. Textbook notes are built directly from the real ISL/DLB/ENLP PDF, section by section - this course has no established NotebookLM prompt library the way CSCI 4511W/5304 do, and no local PDF-text-extraction blocker either (confirmed working as of the 2026-10-21 build pass, superseding the Textbook Map's older "needs review - PDF text check pending" status on the four Week 1-2 chapter notes).
6. User live lecture capture in each week note's `## Lecture` section records what was actually said/emphasized in the live-coded Colab session and must be preserved; it does not silently override the textbook, and the textbook does not silently override it either when the two add different things.
7. Existing vault notes provide continuity and style, not authority, when they conflict with a primary source above.
If a live source and an existing note disagree, update the note with the dated correction and keep the source distinction visible, the way this section's ENLP correction is now logged. Never silently choose between two disagreeing primary sources; mark the conflict and ask.
## Weekly operating rhythm
### Before the lecture
1. Read the Board's Schedule row for the week and the matching entry in [[20_Progress/Degree/CSCI 4521/Textbook/Textbook Map|Textbook Map]] - the map states which book-and-section is assigned and whether that chapter's note is landed.
2. If the chapter note doesn't exist yet, that's the week's first production task: read the actual ISL/DLB/ENLP PDF section by section and build the note directly, following [[Textbook Standard]]'s shape (Chapter Summary, Key Concepts, Examples Worth Keeping, Connections, Open Questions, Flashcards).
3. Check the lecture source folder for that week's real deck(s) and companion notebook(s) before assuming only a deck exists - a lecture with no deck (the 1.1 pattern) is not a gap, the notebook is primary; verify this directly rather than concluding "no source" the way an earlier pass on this course once did.
4. Create/update the week note before class from the schedule, textbook note, and whatever source files already exist, under a pre-lecture scaffold labeled `Pre-lecture source notes` in the Lecture area, per [[Course Production Workflow]].
### During the lecture
The user works directly in the week note's `## Lecture` section, capturing what the professor actually writes/says live in Colab - not a polished rebuild of the deck's own slide text. Preserve this live capture exactly; do not have an agent replace it with an invented transcript, and do not assume the deck already covers everything said live, since live-coded sessions regularly add worked detail the deck doesn't show.
### After the lecture
1. Reconcile the live capture against the textbook note(s) and the lecture's own deck/notebook - name what lecture added beyond the source material and what the source covers that lecture skipped, in a `## Textbook integration` section.
2. Write the six-part `## Lecture-to-textbook synthesis` (one highlighted definition, `*Mechanism:*`, a real lecture example/scenario, textbook connection, concept links or `None created` if none exist yet, a closing `[!WARNING]`/`[!SUMMARY]` pair) - this is the section that forces the week's material into one coherent claim rather than a list of topics, per [[Weekly Standard]].
3. Add `## Takeaways (questions to resolve)` as real open items, not rhetorical questions.
4. Update [[20_Progress/Degree/CSCI 4521/Weekly/Weekly Board|Weekly Board]]'s Map and Status and [[20_Progress/Degree/CSCI 4521/Textbook/Textbook Map|Textbook Map]]'s Status once the week's notes actually land - not before, and not for every sentence added afterward.
## Homework and Final Project workflows
### Homework
Each of the four homeworks pairs a real, deterministic Jupyter notebook (fixed random seed - every run gives the same numbers, per the source folder's own `Homework/README.md`) with a short written report. Read the notebook's real computed figures and the report's real written claims directly - per [[Homework Standard]], a homework note records what the submission actually did and found, never a restatement of the assignment prompt. Regrade requests go to the TA who originally graded within 7 calendar days; escalation path is named graduate TAs, then the instructor.
### Final Project
Student-led, proposal + presentation + code, roughly 2x a single homework's weight/effort. No Project folder exists yet as of 2026-10-21 - create `20_Progress/Degree/CSCI 4521/Project/` once the group-interest-form step (Week 9, per the Board's schedule) actually starts, following [[Project Standard]] and [[Projects Workflow]], with a `## Concept Links` section naming the specific units/weeks the proposed project draws from.
## Concept-note discipline
Zero concept notes exist for this course as of 2026-10-21 - the Weekly and Textbook layers have carried the material so far. Create the first one only once a mechanism has recurred across multiple lectures/weeks and genuinely needs its own reusable, cross-referenced treatment beyond what a Weekly or Textbook note already gives it - the strongest early candidates, not yet created, are **bias-variance tradeoff** (the throughline of Lectures 1.2-1.5, directly tested by the kNN-k-sweep notebook) and **the five named bias types in ML data** (Lecture 1.5's ethics unit, which the Board flags as graded quiz material). Follow [[Concept Standard]]'s full bar exactly - no bland restated-fact header, no section kept just because the template has a slot for it; cut anything that would only repeat the Mechanism in different words.
## Quiz-period workflow
Quizzes are biweekly, in class, two pages of notes allowed, and explicitly framed by the syllabus as "interpret this method's results on a new dataset" rather than textbook recall - this changes what counts as useful prep. When a quiz is announced or its date is close:
1. Confirm its real scope from the Board's Schedule row (which lecture range falls in the two-week window since the last quiz) rather than assuming "everything so far."
2. Build the quiz's study material as an [[Exam Material Template]] note (`class_kind: exam-material`) under `20_Progress/Degree/CSCI 4521/Quiz/` (create this folder on first use) - a short Scope paragraph naming the quiz, the weeks it covers, and where the items came from, then numbered interpret-a-result drills grouped by topic (never a plain fact-recall quiz, matching the real format), with an Answer Key kept separate so the bank can be used cold.
3. Deepen any Concepts-layer note that's genuinely load-bearing for that window before drilling - don't turn every Weekly note into a cram note.
4. After the quiz, log what actually tripped you up in [[20_Progress/Degree/CSCI 4521/Preparation|Preparation]]'s traps section, and feed any recurring pattern into the next quiz's drill bank.
5. If a graded quiz copy itself gets filed (not a drill bank, the actual submitted/returned quiz), it stays under [[Homework Standard]] per [[Exam Material Standard]]'s own legacy-shape note - do not create a `class_kind: exam` sheet for it, since there is no single exam-day scope-and-format record to build; that family is reserved for the midterm/final shape this course doesn't have.
## Status and handoff
Use `seed` for a newly created scaffold, `sprout` for a source-grounded working note, `tree` only once a note is stable and unlikely to need further structural change. Every active note should leave a concrete `next`: source to read, lecture to live-capture, assignment step, or link to verify.
## Stop-and-ask conditions
Ask the user or verify the live source when: a Canvas date conflicts with the Board's own schedule-spreadsheet table; a lecture's real source folder has neither a deck nor a notebook for a scheduled topic (don't infer lecture content from the unit list alone); the ENLP, Linear Algebra Notes, or PyTorch-intro-series reading named in the schedule still isn't locatable once actually searched for; a quiz's real in-class scope doesn't match the two-week window the schedule implies; or a proof/result in a landed note conflicts between what a deck shows and what a companion notebook actually computes (state both, source-attributed, rather than picking one silently).
## Done conditions for this course workflow
- The Board is the authority for schedule, grading, and the open Fall-2025-label/ENLP/resource questions.
- A real deck or notebook always outranks inferred content for that lecture; a lecture with no deck is checked for a notebook before being logged as a gap.
- Textbook notes are built directly from the real ISL/DLB/ENLP PDF, section by section, never invented from the syllabus's unit list or a chapter title alone.
- No concept note exists without having earned its place across multiple weeks' worth of recurring use.
- Quiz prep is built as interpret-a-result drill material matching the real quiz format, not a textbook-recall review sheet.
- Unknowns (unconfirmed Fall'26 roster, un-located readings, quiz-scope ambiguity) remain visible instead of being guessed past.
---
AI Loop
Conformance Standard.md
Courses
Decoration Standard.md
Editing Standard.md
Enrich
Frontmatter Standard.md
Generated Output Standard.md
Ingestion
Internship
Log Standard.md
MOC Standard.md
Note Kit Standard.md
Operations
Plan Standard.md
Project Standard.md
Projects
System Component Standard.md
AI Toolkit
Capability
Career
Classes
Enumerate
Frontmatter
Knowledge
MOC.md
Projects
System
```
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/Jarvis/30_Order"; find . -iname "*Homework*" | head; `
```
./Standards/Courses/Homework Standard.md
./Templates/Classes/Homework Template.md
./Workflows/Courses/Homework Workflow.md
```
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards\Courses\Homework Standard.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Templates\Classes\Homework Template.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Workflows\Courses\Homework Workflow.md`
- `Bash` -- `cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code/Lectures"; ls -la "Week 6 - 10" "Weeks 1 - 5" | awk '{print $5, $9, $10, $11, $12}'; echo; cd "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 4521/Weekly"; wc -c *.md; ls /c/Users/anant/miniconda3 /c/Users/anant/anaconda3 /c/ProgramData/miniconda3 /c/Users/anant/miniforge3 2>&1 | head -5; ls /c/Users/anant/AppData/Local/miniconda3 2>&1 | head -3; where python py conda 2>&1 | head`
```
0 .   
0 ..   
465262 2.3 k-means clustering -
53512 2.3 k-means clustering.ipynb 
14928 2.5 modern text embeddings.ipynb
1121732 3.1 gaussian mixture models.ipynb
330286 [REDACTED].png   
    
    
    
0 .   
0 ..   
969012 0.1 intro to colab,
231764 1.1 Nearest Neighbor Classifier.ipynb
392613 1.2 NN Classifier.ipynb 
804 1.3 kNN Iris Classification.ipynb
172154 1.3 kNN with SciKit-Learn.ipynb
6753 2.1 tf-idf vectorization, sklearn.ipynb
48566 2.2 text classification.ipynb 
27639 2.4 PCA on iris
14970 2.4 PCA on newsgroups.ipynb
35790 Numpy Introduction  
468449 Week 1 - practice
66615 download.png   

 47514 Week - 1 (Prompts).md
  6971 Week - 1.md
  7296 Week - 2.md
 10840 Week - 3.md
 15601 Week - 4.md
  8578 Week - 5.md
 17909 Week - 6.md
 15318 Week - 7.md
  3825 Weekly Board.md
133852 total
ls: cannot access '/c/Users/anant/anaconda3': No such file or directory
ls: cannot access '/c/ProgramData/miniconda3': No such file or directory
ls: cannot access '/c/Users/anant/miniforge3': No such file or directory
/c/Users/anant/miniconda3:
DLLs
ls: cannot access '/c/Users/anant/AppData/Local/miniconda3': No such file or directory
C:\Users\anant\AppData\Local\Microsoft\WindowsApps\python.exe
INFO: Could not find "py".
INFO: Could not find "conda".
```
- `Bash` -- `ls /c/Users/anant/miniconda3/envs/ 2>&1; ls /c/Users/anant/miniconda3/envs/csci-4521/python.exe 2>&1; /c/Users/anant/miniconda3/envs/csci-4521/python.exe -c "import numpy,pandas,sklearn,matplotlib,seaborn;print(numpy.__version__,pandas.__version__,sklearn.__version__,matplotlib.__version__)" 2>&1 | tail -2`
```
ls: cannot access '/c/Users/anant/miniconda3/envs/csci-4521/python.exe': No such file or directory
/usr/bin/bash: line 1: /c/Users/anant/miniconda3/envs/csci-4521/python.exe: No such file or directory
```
- `Bash` -- `ls -la /c/Users/anant/miniconda3 | head -20; ls /c/Users/anant/.conda/envs 2>&1 | head; find /c/Users/anant /d/_Anant -maxdepth 4 -name "python.exe" -not -path "*/WindowsApps/*" 2>/dev/null | head`
```
total 76827
drwxr-xr-x 1 anant 197609        0 Sep 21 14:09 .
drwxr-xr-x 1 anant 197609        0 Oct 27 19:42 ..
-rw-r--r-- 1 anant 197609       14 Sep 26 14:16 .condarc
-rw-r--r-- 1 anant 197609       88 Aug 28 12:53 .installer.info
-rw-r--r-- 1 anant 197609        0 Sep 21 14:08 .nonadmin
drwxr-xr-x 1 anant 197609        0 Sep 21 14:08 DLLs
-rw-r--r-- 1 anant 197609     1786 Aug 28 12:50 EULA.txt
-rw-r--r-- 2 anant 197609    13804 Aug  5 05:29 LICENSE_PYTHON.txt
drwxr-xr-x 1 anant 197609        0 Sep 21 14:08 Lib
drwxr-xr-x 1 anant 197609        0 Sep 21 14:08 Library
drwxr-xr-x 1 anant 197609        0 Sep 21 14:09 Menu
drwxr-xr-x 1 anant 197609        0 Sep 21 15:21 Scripts
drwxr-xr-x 1 anant 197609        0 Sep 21 14:08 Tools
-rwxr-xr-x 1 anant 197609   408072 Sep 21 14:09 Uninstall-Miniconda3.exe
-rwxr-xr-x 1 anant 197609 44465952 Aug 28 12:53 _conda.exe
-rwxr-xr-x 2 anant 197609    21984 May  6  2022 [REDACTED].dll
-rwxr-xr-x 2 anant 197609    21976 May  6  2022 [REDACTED].dll
-rwxr-xr-x 2 anant 197609    21984 May  6  2022 [REDACTED].dll
-rwxr-xr-x 2 anant 197609    21984 May  6  2022 [REDACTED].dll
ls: cannot access '/c/Users/anant/.conda/envs': No such file or directory
/c/Users/anant/miniconda3/pkgs/python-3.14.7-h7ce57fb_101_cp314/python.exe
/c/Users/anant/miniconda3/python.exe
```
- `Bash` -- `PY=/c/Users/anant/miniconda3/python.exe; $PY -c "import numpy,pandas,sklearn,matplotlib;print('ok')" 2>&1 | tail -1; cat > "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/1b6f8eac-44d0-4860-b243-88b063adb7c7/scratchpad/hw2/src.py" <<'EOF'
import json,sys
nb=json.load(open(sys.argv[1],encoding='utf-8'))
for i,c in enumerate(nb['cells']):
    s=''.join(c['source'])
    if s.strip(): print(f"--- [{c['cell_type']}] {i}\n{s}")
EOF
$PY -I "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/1b6f8eac-44d0-4860-b243-88b063adb7c7/scratchpad/hw2/src.py" "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code/Lectures/Week 6 - 10/2.3 k-means clustering - completed.ipynb" | head -300`
```
ModuleNotFoundError: No module named 'numpy'
--- [markdown] 0
## Load the data
--- [code] 1
from pathlib import Path
from urllib.request import urlretrieve

archive = Path("20news-bydate.tar.gz")
if not archive.exists():
    urlretrieve("https://raw.githubusercontent.com/be-prado/csci4521/refs/heads/main/20news-bydate.tar.gz", archive)

--- [code] 2
import tarfile

if not Path("20news-bydate-train").exists():
    with tarfile.open(archive, "r:gz") as dataset:
        dataset.extractall(".", filter="data")

--- [code] 3
from sklearn.feature_extraction.text import CountVectorizer, TfidfVectorizer
from sklearn.cluster import KMeans
import numpy as np
import os
--- [code] 4
DIR = "20news-bydate-train/"
catigories = ["comp.graphics","comp.sys.mac.hardware","talk.politics.misc","sci.space","misc.forsale"]
--- [code] 5
posts = []
labels = []
for c in catigories:
  posts += [open(os.path.join(DIR+c, f), encoding="latin-1").read() for f in sorted(os.listdir(DIR+c))]
  labels += [c for f in sorted(os.listdir(DIR+c))]
labels = np.array(labels)
--- [markdown] 6
## Vectorize documents
--- [code] 7
#A TF-IDF Vectorizer with Stemming
import nltk.stem
english_stemmer = nltk.stem.SnowballStemmer('english')
class StemmedTfidfVectorizer(TfidfVectorizer):
   def build_analyzer(self):
     # analyzer callable from TfidfVectorizer that does tokenization
     analyzer = super(StemmedTfidfVectorizer, self).build_analyzer()
     # new analyzer that performs stemming on the tokenization from the analyzer above
     return lambda doc: (english_stemmer.stem(w) for w in analyzer(doc))

vectorizer = StemmedTfidfVectorizer(min_df=1, stop_words='english')
# vectorized tf-idf matrix where each row represents a document and each
# column represents a feature i.e. tf-idf score for each term
X_train = vectorizer.fit_transform(posts)

print(X_train.shape)
--- [markdown] 8
## K-Means Clustering
--- [code] 9
num_clusters = 20
km = KMeans(n_clusters=num_clusters, init="random", n_init=10, random_state=42)
km.fit(X_train)

--- [code] 10
km.labels_ #The labels
--- [code] 11
km.labels_.shape
--- [code] 12
km.cluster_centers_ #The actual cluster centers
--- [markdown] 13
## Using the model
--- [code] 14
# TODO: vectorize the sentence "Used Car for Sale!"
new_post = "Used car for sale!"
new_post_vec = vectorizer.transform([new_post])
--- [code] 15
vectorizer.get_feature_names_out()[29456]
--- [code] 16
# TODO: predict the cluster for the sentence above
new_post_cluster = km.predict(new_post_vec)[0]
print(new_post_cluster)
--- [code] 17
km.cluster_centers_[new_post_cluster] #We can manualy compare feature to cluster centers
--- [markdown] 18
Which posts are also in my cluster?
--- [code] 19
cluster_neighbor_indices = (km.labels_==new_post_cluster).nonzero()[0]
print(cluster_neighbor_indices[0:10]) #first 10 cluster indicies
--- [markdown] 20
Print the labels of the posts in the same cluster:
--- [code] 21
np.random.choice(labels[cluster_neighbor_indices],10) #print the label for 10 random indices
--- [markdown] 22
Ideally, there should be a clear most common topic within this cluster, that well describes the test prompt.

We can also sort, and find the k-nearest neighbors within this cluster:
--- [code] 23
cluster_neighbors = []
# for each post in my cluster
for i in cluster_neighbor_indices:
  # find the distance between new post and posts in the cluster
  dist = np.linalg.norm((new_post_vec - X_train[i]).toarray())
  # save the distance, the post, and the label into the list
  cluster_neighbors.append((dist, posts[i], labels[i]))
  # sort the list
  # NOTE: The sorted() method sorts tuples by default, using the first item in each tuple (our distances!)
  cluster_neighbors = sorted(cluster_neighbors)
print(len(cluster_neighbors))
--- [code] 24
print(cluster_neighbors[0]) #The nearest neighbor within the cluster
--- [code] 25
print(cluster_neighbors[len(cluster_neighbors)//2]) #The median neighbor within the cluster
--- [code] 26
print(cluster_neighbors[-1]) #The furthest away neighbor still in the cluster
--- [markdown] 27
## Word Clouds
--- [code] 28
from wordcloud import WordCloud
import matplotlib.pyplot as plt
--- [code] 29
posts = np.array(posts)
labels = np.array(labels)
--- [code] 30
# for each cluster...
for cluster_id in range(0,num_clusters):
  # grab all the posts in the cluster
  matching_indices = (km.labels_== cluster_id)
  # concatonate them into a single 'document'
  all_text = " ".join(txt for txt in posts[matching_indices.nonzero()[0]])
  # make a word cloud of it
  word_cloud1 = WordCloud(collocations = False, background_color = 'white',
                          width = 2048, height = 1080).generate(all_text)
  plt.imshow(word_cloud1, interpolation='bilinear')
  plt.axis("off")
  plt.show()
  # print how many posts were in that cluster
  print("cluster size: ",posts[matching_indices].size)
  # print the topics of the first 10 posts in the cluster
  print("-"+"\n-".join(txt for txt in labels[matching_indices][0:10]))
--- [markdown] 31
## Word Cloud (TF-IDF)
--- [code] 32
import pandas as pd
--- [code] 33
unstemed_vectorizer = TfidfVectorizer(stop_words='english')
vecs = unstemed_vectorizer.fit_transform(posts)
feature_names = unstemed_vectorizer.get_feature_names_out()
dense = vecs.todense() # brings the vecs sparse matrix into regular matrix format
tfidf_df = pd.DataFrame(dense, columns=feature_names)

for cluster_id in range(0,num_clusters):
  matching_indices = (km.labels_== cluster_id)
  word_tfidf = tfidf_df[matching_indices].T.sum(axis=1)
  word_cloud1 = WordCloud(collocations = False, background_color = 'white', max_words=60,
                          width = 2048, height = 1080).generate_from_frequencies(word_tfidf)
                          # instead of using frequencies, override with the tfidf val
  plt.imshow(word_cloud1, interpolation='bilinear')
  plt.axis("off")
  plt.show()
  print("cluster size: ",posts[matching_indices].size)
  print("-"+"\n-".join(txt for txt in np.random.choice(labels[matching_indices],10)))
--- [code] 34
# same as above but with stems (can be a bit harder to interpret)

feature_names = vectorizer.get_feature_names_out()
dense = X_train.todense() # brings the vecs sparse matrix into regular matrix format
tfidf_df = pd.DataFrame(dense, columns=feature_names)

for cluster_id in range(0,num_clusters):
  matching_indices = (km.labels_== cluster_id)
  word_tfidf = tfidf_df[matching_indices].T.sum(axis=1)
  word_cloud1 = WordCloud(collocations = False, background_color = 'white', max_words=60,
                          width = 2048, height = 1080).generate_from_frequencies(word_tfidf)
                          # instead of using frequencies, override with the tfidf val
  plt.imshow(word_cloud1, interpolation='bilinear')
  plt.axis("off")
  plt.show()
  print("cluster size: ",posts[matching_indices].size)
  print("-"+"\n-".join(txt for txt in np.random.choice(labels[matching_indices],10)))
--- [markdown] 35
## Your turn!
--- [markdown] 36
Predict the cluster of your own sentence and print the word cloud of that cluster to see if your output seems sensible.
--- [code] 37
# Predict a cluster for my own post, then save its word cloud for ChimeIn.
my_post = "I am selling my used car. It is in good condition. Please email me if you are interested."
my_post_vec = vectorizer.transform([my_post])
predicted_cluster = int(km.predict(my_post_vec)[0])
matching_indices = km.labels_ == predicted_cluster

# Use readable, unstemmed words, as in the notebook's TF-IDF section.
cloud_vectorizer = TfidfVectorizer(stop_words="english")
cloud_vectors = cloud_vectorizer.fit_transform(posts)
terms = cloud_vectorizer.get_feature_names_out()
weights = np.asarray(cloud_vectors[matching_indices].sum(axis=0)).ravel()
frequencies = {term: float(weight) for term, weight in zip(terms, weights) if weight > 0}

cloud = WordCloud(collocations=False, background_color="white", max_words=60,
                  width=2048, height=1080, random_state=42).generate_from_frequencies(frequencies)
image_path = f"predicted_cluster_{predicted_cluster}_wordcloud.png"
cloud.to_file(image_path)

print(f"My post: {my_post}")
print(f"Predicted cluster: {predicted_cluster}")
print(f"Posts in this cluster: {int(matching_indices.sum())}")
print(f"Saved image: {image_path}")
plt.figure(figsize=(14, 7))
plt.imshow(cloud, interpolation="bilinear")
plt.axis("off")
plt.show()
```
- `Bash` -- `PY=/c/Users/anant/miniconda3/python.exe; S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/1b6f8eac-44d0-4860-b243-88b063adb7c7/scratchpad/hw2/src.py"; L="D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code/Lectures/Weeks 1 - 5"; $PY -I $S "$L/2.4 PCA on iris data.ipynb"; echo "=========== newsgroups"; $PY -I $S "$L/2.4 PCA on newsgroups.ipynb"`
```
--- [markdown] 0
Going back to the iris dataset, let's pick 3 features so we have 3D data and look at the results.
--- [code] 1
import plotly.express as px

iris_data = px.data.iris() # this dataset is so common, its built into libraries!
features = [ "sepal_length", "petal_width", "petal_length"] #"sepal_width",
--- [markdown] 2
One way to visualize high-dimensional data is to plot pairs of features.
--- [code] 3
fig = px.scatter_matrix(iris_data, dimensions=features, color="species")
fig.update_traces(diagonal_visible=False)
fig.show()
--- [markdown] 4
Where we are using the Plotly visualization library (an alternative to Matplotlib or Seaborn). Plotly lets you interact with its graphs! Hover your mouse over each point to get additional information.
--- [markdown] 5
Because we only have 3 features, we can also plot the data in 3D.
--- [code] 6
fig = px.scatter_3d(iris_data, x = "petal_width", y="petal_length",  z = "sepal_length")
fig.show()
--- [markdown] 7
Again, Plotly lets you interact with the 3D plot!

Imagine you are going to take a 2D screenshot to include in a written report. Zoom in to the graph so that the points fill up the entire width or height of the plot as much as possible.

Then answer the following questions as today's in-class activity:

1.   While staying zoomed in, rotate the graph to find the worst possible angle! That is, find the angle that preserves the *least* amount of information about the true 3D structure of the data.
2.   Find the angle that preserves the *most* amount of information about the true 3D structure of the data.

*(upload both of these images as today's in-class activity)*

What makes a good rotation?

--- [markdown] 8
That's it, you now understand the key idea behind PCA. It's simply a matrix that rotates the data so you can still see as much of the original spread/variance as possible!


---
--- [markdown] 9
Let's try SKLearn's PCA package and see how it compares to your rotation.

Here is how you compute the PCA components for each data sample.
--- [code] 10
from sklearn.decomposition import PCA
import pandas as pd
--- [code] 11
# TODO: perform PCA on iris data


--- [markdown] 12
We can see each sample now as a new 3D point:
--- [code] 13
print(components_df)
--- [markdown] 14
We can plot these points to see the PCA projection. How does it compare to your rotation?
--- [code] 15
fig = px.scatter(components_df, x="PC1", y="PC2")
fig.show()
--- [markdown] 16
(Keep in mind, flipping the axis or rotating the graph around the centre all have the same "spread" - so there is a family of equally good PCA projections)

---

Here is the moment of truth! Our PCA projection never had access to the data labels. It's a completely unsupervised method. But, PCA captures some information about the structure of the underlying data by focusing us on the view of the data where there is the widest variety of features. This will often correlate with meaningful differences in the data, naturally separating different types of data from each other.

Let's view the PCA rotation, but this time color by label.
--- [code] 17
fig = px.scatter(components_df, x="PC1", y="PC2", color = iris_data["species"])
fig.show()
--- [markdown] 18
Voil�! PCA left our datasets split into 3 pretty clean clusters *without ever knowing the labels*!
--- [markdown] 19

---
It's worth remembering that our principal components are just linear combinations of the features (chosen to be orthogonal and maximize variance). Nothing more!

To help emphasize that point, we can look at `pca.components_` to see the actual components of the linear transformation and print out the equations for each principal component.
--- [code] 20
# Create a list of equations for each principal component
for i in range(len(pca.components_)):
  equation = ''
  for j in range(len(features)):
    if j > 0:
      equation += ' + '
    equation += str(round(pca.components_[i][j], 2)) + '*' + features[j]
  print('PC' + str(i+1) + ' = ' + equation)
--- [markdown] 21
---

So, how can we use PCA?

Firstly, PCA is a vital tool if you want to graph high-dimensional data. Even if you have a dataset with dozens or hundreds of features, using PCA to compute a 2D projection still often provides a meaningful way to visualize the dataset.

Secondly, working in the reduced dimension PCA space can be a good first step for other ML algorithms. For example, when implementing KNN, rather than measuring distances between two feature vectors directly, you can take the distance in PCA space. Often the first few PCA components contain most of the meaningful variation. In these cases, ignoring the less important PCA components removes noise from the dataset and focuses the predictor on what matters.
--- [markdown] 22
Let's use scikit-learn's built-in `train_test_split` function to build some training and testing data so we can see how well a classifier does using principal components rather than raw features.
--- [code] 23
from sklearn.model_selection import train_test_split
import numpy as np
np.set_printoptions(suppress=True)
--- [markdown] 24
First we'll try with the raw features:
--- [code] 25
X_train, X_test, y_train, y_test = train_test_split(iris_data[features].to_numpy(),iris_data["species"].to_numpy(),test_size=0.33)
--- [code] 26
#1-nn calssifier
pred = []
for test_feature in X_test:
  dist = [np.linalg.norm((test_feature - train_feature)) for train_feature in X_train]
  best_idx = np.argmin(dist)
  pred += [y_train[best_idx]]

(pred==y_test).sum()/y_test.size
--- [markdown] 27
Next, let's try with PCA, but instead of using all three principal components, let's just use the first (most important) component.
--- [code] 28
X_train, X_test, y_train, y_test = train_test_split(components_df["PC1"].to_numpy(),iris_data["species"].to_numpy(),test_size=0.33)
--- [markdown] 29
Remember, our training data is just a single number for each entry (e.g., `0.36*sepal_length + 0.36*petal_width + 0.86*petal_length`):
--- [code] 30
X_train #Only 1D features!
--- [markdown] 31
How good of a classifier can we make knowing only a single number per entry?
--- [code] 32
pred = []
for test_feature in X_test:
  dist = [np.linalg.norm((test_feature - train_feature)) for train_feature in X_train]
  best_idx = np.argmin(dist)
  pred += [y_train[best_idx]]

(pred==y_test).sum()/y_test.size
--- [markdown] 33
We achieve between 85-95% accuracy using only a 1D, single number feature!
--- [markdown] 34
Let'a ret kNN using the first 2 principal components
--- [code] 35
from sklearn import neighbors
from sklearn.neighbors import KNeighborsClassifier

def knn_classifier(k):
    def knn_classify(x_train, y_train, x_test):
        knn = KNeighborsClassifier(n_neighbors=k)
        knn.fit(x_train, y_train)

        pred = knn.predict(x_test)
        return pred
    return knn_classify


def accuracy(classify, X_train, y_train, X_test, y_test):
  pred = classify(X_train, y_train, X_test)
  correct_pred = (pred == y_test)
  total_preds = y_test.size
  return correct_pred.sum()/total_preds
--- [code] 36
X_train, X_test, y_train, y_test = train_test_split(components_df[["PC1", "PC2"]].to_numpy(),iris_data["species"].to_numpy(),test_size=0.33)
--- [code] 37
knn = knn_classifier(7)
accuracy(knn, X_train, y_train, X_test, y_test)
--- [markdown] 38
## Testing a new feature with PCA
--- [markdown] 39
Let's check out the data a final time to remind us of the raw features:
--- [code] 40
iris_data[features+["species"]]
--- [markdown] 41
We can try to classify a new data point not seen in training. In theory, we can do this manually by computing the equations for the new principal components from the base features. However, SKLearn has a helpful function for us: we can use `pca.transform` to transform this new data into the PCA space fit earlier.
--- [code] 42
#Add a new flower with sepal_length = 5.2, petal_width=0.3, and petal_length=1.4
#This should be a "setosa", but let's see what KNN on just a 1D space says
new_data = pd.DataFrame([[5.2,0.3,1.4]], columns = ["sepal_length", "petal_width", "petal_length"])
new_data_pc = pca.transform(new_data)
print(new_data.to_numpy())
print(new_data_pc)
--- [code] 43
dists = [np.linalg.norm(new_data_pc[:,[0]] - train_feature) for train_feature in X_train[:,[0]]]
best_idx = np.argmin(dists)
print(y_train[best_idx])
=========== newsgroups
--- [markdown] 0
## Download Newsgroup Dataset
--- [code] 1
!wget "https://raw.githubusercontent.com/be-prado/csci4521/refs/heads/main/20news-bydate.tar.gz"
!tar -xf 20news-bydate.tar.gz
--- [markdown] 2
## Load the dataset

Import the Python libraries used for ML, NLP, and data processing. Also, load the data and store the labels (which newsgroup the data was from) and ID number (index we can use to look up a post).
--- [code] 3
from sklearn.feature_extraction.text import CountVectorizer, TfidfVectorizer
from sklearn.model_selection import train_test_split
import seaborn as sns
import pandas as pd
import numpy as np
np.set_printoptions(suppress=True)
import os
--- [code] 4
DIR = "/content/20news-bydate-train/"
catigories = ["comp.graphics","comp.sys.mac.hardware","talk.politics.misc","sci.space","misc.forsale"]
--- [code] 5
posts = []
labels = []
ids = []
for c in catigories:
  posts += [open(os.path.join(DIR+c, f), encoding="latin-1").read() for f in os.listdir(DIR+c)]
  labels += [c for f in os.listdir(DIR+c)]
labels = np.array(labels)
ids = np.arange(0,len(labels))
--- [markdown] 6
Next, we will use a stemmer on the words (to remove endings like "ing" and "ly") and apply TF-IDF to create a document vectorization (to give higher weight to rarer words).
--- [code] 7
#A TF-IDF Vectorizer with Stemming
import nltk.stem
english_stemmer = nltk.stem.SnowballStemmer('english')
class StemmedTfidfVectorizer(TfidfVectorizer):
   def build_analyzer(self):
     analyzer = super(StemmedTfidfVectorizer, self).build_analyzer()
     return lambda doc: (english_stemmer.stem(w) for w in analyzer(doc))

vectorizer = StemmedTfidfVectorizer(min_df=1, stop_words='english')
doc_features = vectorizer.fit_transform(posts).toarray()
--- [markdown] 8
## Nearest Neighbors Classification


--- [markdown] 9
We have thousands of labels across the five newsgroups we loaded. Let's split them into testing and training data.
--- [code] 10
labels.shape
--- [code] 11
X_train, X_test, y_train, y_test = train_test_split(doc_features, labels, test_size=0.33)
--- [code] 12
X_train.shape
--- [markdown] 13
Ok, first, let's run a 1-nn classifier on the Newsgroup dataset to see how well it does.
--- [markdown] 14
I've included a `%%time` directive, which will report how long the block takes to run. `%time` only times the next line, `%%time` times the entire block, and `%%timeit` and `%timeit` run the timing tests multiple times and average the results.
--- [code] 15
%%time
pred = []
for test_feature in X_test:
  dist = [np.linalg.norm((test_feature - train_feature)) for train_feature in X_train]
  best_idx = np.argmin(dist)
  pred += [y_train[best_idx]]

acc = (pred==y_test).sum()/y_test.size
print("Classification accuracy is",acc,"\n")
--- [markdown] 16
Take note of both the accuracy and the time it took to classify the testing data and compute an accuracy. Hopefully, PCA can help us with at least one (maybe both!).
--- [markdown] 17
## Using PCA

We'll use the PCA library as implemented in Scikit-Learn, so we first need to import that.
--- [code] 18
from sklearn.decomposition import PCA
--- [markdown] 19
We can now invoke PCA. We provide PCA with a number of components to fit. By default, it will have as many components as the number of features or the number of data entries, whichever is smaller.

Here, we perform 2D PCA and then utilize `fit_transform` to calculate the new features and retrieve them.
--- [code] 20
pca = PCA(n_components=2) # From 30,000 features down to two!
pc = pca.fit_transform(doc_features)
--- [markdown] 21
Let's put the results in a dataframe along with the information about which cluster each data point came from.
--- [code] 22
pc_df = pd.DataFrame(data = pc, columns = ['PC1', 'PC2'])
pc_df['Cluster'] = labels
pc_df['ID'] = ids
pc_df
--- [markdown] 23
Because we chose a 2D PCA (i.e., a projection down to two features), we can directly plot what the features look like in the PCA space.
--- [code] 24
sns.lmplot( x="PC1", y="PC2", fit_reg=False, data = pc_df, hue = 'Cluster')
--- [markdown] 25
This highlights one of the key uses of PCA. It allows us to easily visualize high-dimensional datasets.

We can see some very natural clustering in the PCA space. Documents from misc.forsale, sci.space, and comp.graphics typically end up in very different parts of the 2D PCA space.
--- [markdown] 26
### Interactive graphs with Plotly

I would like us to be able to interact with this visualization. The Plotly library (https://plotly.com/python/) gives a very easy way to make an interactive plot. Plotly has a lot of nice graphs that are useful in a variety of circumstances, so be sure to check it out.

Here is the interactive 2D scatterplot with Plotly. Note that I used `hover_data=["ID"]` to show the ID of a data point when you hover over it.
--- [code] 27
import plotly.express as px
--- [code] 28
fig = px.scatter(pc_df, x="PC1", y="PC2", color = 'Cluster',hover_data=["ID"])
fig.show()
--- [markdown] 29
We can do the same thing to create an interactive 3D graph:
--- [code] 30
pca = PCA(n_components=3)
pc = pca.fit_transform(doc_features)
--- [code] 31
pc_df = pd.DataFrame(data = pc, columns = ['PC1', 'PC2', 'PC3'])
pc_df['Cluster'] = labels
pc_df['ID'] = ids
pc_df

fig = px.scatter_3d(pc_df, x="PC1", y="PC2", z="PC3", color = 'Cluster',hover_data=["ID"])
fig.show()
--- [markdown] 32
Play around with the visualization and look for some interesting posts that are at the boundary between two clusters (or even posts that seem misplaced).

Let's look at these posts to see why they might have neighbors from different news groups:
--- [code] 33
print(posts[63]) #A graphics post, sitting next to space posts
--- [code] 34
print(posts[2078]) #A space post, sitting in the middle of politics posts
--- [markdown] 35
## Building a classifier with PCA+KNN
--- [markdown] 36
We can run a 1-NN classifier on the PCA space instead of on the features directly.

Remember we have a 30,000 dimensional feature space! KNN is really slow here. It turns out we can represent most of the variance in the data with ~400-600 PCA dimensions.
--- [code] 37
pca = PCA(n_components=500)
X_train_pc = pca.fit_transform(X_train)
X_test_pc = pca.transform(X_test)
exp_var_cumul = np.cumsum(pca.explained_variance_ratio_)

px.area(
    x=range(1, exp_var_cumul.shape[0] + 1),
    y=exp_var_cumul,
    labels={"x": "# Components", "y": "Explained Variance"}
)
--- [code] 38
dims = np.arange(1,502,100)
accuracy = []

for dim in dims:

  pred = []
  for test_feature in X_test_pc[:,0:dim]:
    dist = [np.linalg.norm((test_feature - train_feature)) for train_feature in X_train_pc[:,0:dim]]
    best_idx = np.argmin(dist)
    pred += [y_train[best_idx]]

  acc = (pred==y_test).sum()/y_test.size
  accuracy += [acc]
  print("With",dim,"PCs the accuracy is",acc)
--- [markdown] 39
Interestingly, our accuracy peaks somewhere between 1 and 200 principal components. Let's run the analysis again, but focus in on that range:
--- [code] 40
dims = np.arange(1,202,25)
accuracy = []

for dim in dims:

  pred = []
  for test_feature in X_test_pc[:,0:dim]:
    dist = [np.linalg.norm((test_feature - train_feature)) for train_feature in X_train_pc[:,0:dim]]
    best_idx = np.argmin(dist)
    pred += [y_train[best_idx]]

  acc = (pred==y_test).sum()/y_test.size
  accuracy += [acc]
  print("With",dim,"PCs the accuracy is",acc)
--- [markdown] 41
Wow, it seems like a fairly small number of PCs works pretty well. Lets try focusing on even smaller number of components.
--- [code] 42
dims = np.arange(1,51,5)
accuracy = []

for dim in dims:

  pred = []
  for test_feature in X_test_pc[:,0:dim]:
    dist = [np.linalg.norm((test_feature - train_feature)) for train_feature in X_train_pc[:,0:dim]]
    best_idx = np.argmin(dist)
    pred += [y_train[best_idx]]

  acc = (pred==y_test).sum()/y_test.size
  accuracy += [acc]
  print("With",dim,"PCs the accuracy is",acc)
--- [markdown] 43
The results are getting a bit noisy, but it seems to me that about 15 principal components may be good for this dataset. You can likely make strong arguments for many other values as well.

---

Let's put it all together:
--- [code] 44
%%time
#Split testing a training data
X_train, X_test, y_train, y_test = train_test_split(doc_features, labels, test_size=0.33)

#Fit PCA
n_components=15
pca = PCA(n_components=n_components)
X_train_pc = pca.fit_transform(X_train) #Avoiding leakage, only train PCA on training data!
X_test_pc = pca.transform(X_test)       #Transform the testing data based on the training data's PCA fit
exp_var_cumul = np.cumsum(pca.explained_variance_ratio_)
print("Variance explained by",n_components,"PCA components:", exp_var_cumul[-1])

#1-NN Classifier
pred = []
for test_feature in X_test_pc:
  dist = [np.linalg.norm((test_feature - train_feature)) for train_feature in X_train_pc]
  best_idx = np.argmin(dist)
  pred += [y_train[best_idx]]

#Compute Accuracy
acc = (pred==y_test).sum()/y_test.size
accuracy += [acc]
print("1-NN Classifier ("+str(n_components)+"PCs) -- Accuracy is:",acc)
print("")
--- [markdown] 45
So we are using a very small numbr of PCA components. Our classification is about as good as before, and significantly faster.
--- [markdown] 46
Why do we do well with so few PCA components? Using a small number of PCA components reduces variance in our datasets. Using KNN, especially with a small K (like 1), is very sensitive to overfitting (i.e., KNN with small K is a very flexible model with little bias, so it overfits to the variance in the training data).

Reducing variance in the dataset by using a small number of PCA components, then using KNN with small K is one of my personal go-to strategies for building classifiers on a wide variety of tasks.
```
- `Bash` -- `PY=/c/Users/anant/miniconda3/python.exe; S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/1b6f8eac-44d0-4860-b243-88b063adb7c7/scratchpad/hw2/src.py"; L="D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code/Lectures/Weeks 1 - 5"; $PY -I $S "$L/1.1 Nearest Neighbor Classifier.ipynb" | head -220`
```
--- [code] 0
import pandas as pd
import numpy as np
import seaborn as sns
--- [markdown] 1
# Nearest neighbor classifier

--- [code] 2
df = pd.read_csv("https://raw.githubusercontent.com/be-prado/csci4521/refs/heads/main/Seeds.csv")
df
--- [markdown] 3
Select only the features compactness and area for now
--- [code] 4
df = df[["area", "compactness", "wheat_type"]]
df
--- [code] 5
plt = sns.scatterplot(x = df["area"], y = df["compactness"], hue=df["wheat_type"])
--- [code] 6
def distance_sq(p0, p1):
  '''Computes squared Euclidean distance'''
  return np.sum( (p0-p1)**2 )


def nn_classify_sample(training_set, training_labels, new_example):
  dists = np.array([distance_sq(t,new_example) for t in training_set])
  nearest_idx = dists.argmin()
  return training_labels[nearest_idx]
--- [code] 7
# split data into training set and labels
seeds_array = df.to_numpy()
training_set = seeds_array[:,:-1]
training_labels = seeds_array[:,-1]
--- [code] 8
# classify example 1: Area: 18, Compactness: 0.90
ex1 = np.array([18, 0.9])
pred_type = nn_classify_sample(training_set, training_labels, ex1)
print(f"Predicted type for seed with area 18 and compactness 0.9: {int(pred_type)}")
--- [code] 9
# classify example 2: Area: 13, Compactness: 0.80
ex2 = np.array([13, 0.8])
pred_type2 = nn_classify_sample(training_set, training_labels, ex2)
print(f"Predicted type for seed with area 13 and compactness 0.80: {int(pred_type2)}")
--- [markdown] 10
### Understanding why the second classification turned that way
--- [code] 11
import matplotlib.pyplot as plt
from matplotlib import cm
import matplotlib.cbook as cbook
import matplotlib.colors as colors

# visualizing distances

# point from which we are finding nearest neighbors
point = np.array([13, 0.8])

# make a grid of the distances in a similar range to the data in question
x = np.linspace(10, 22, 101)
y = np.linspace(0.78, 0.92, 101)
xx, yy = np.meshgrid(x, y)
zz = (xx - point[0])**2 + (yy - point[1])**2
--- [code] 12
colormesh = plt.pcolor(x, y, zz, norm=colors.LogNorm(vmin=1e-5, vmax=zz.max()),
                   cmap='PuBu_r', shading='auto')
plt.colorbar(colormesh, label = "distance to point (13, 0.8)")
plt.xlabel("area")
plt.ylabel("compactness")
plt.show()
--- [markdown] 13
## Normalizing the data
--- [code] 14
mean = training_set.mean(axis = 0) # read documentation
std = training_set.std(axis = 0)

print(f"Mean: {mean}")
print(f"Standard deviation: {std}")

# shift by the mean
training_set_normalized = training_set - training_set.mean(axis = 0)
# divide by standard deviation
training_set_normalized /= training_set.std(axis = 0)
--- [code] 15
# visualize the normalized data

sns.scatterplot(x = training_set_normalized[:,0], y = training_set_normalized[:,1], hue=df["wheat_type"])
--- [code] 16
# classify example 1: Area: 18, Compactness: 0.90
ex1 = (np.array([18, 0.9]) - mean) / std
print(f"Normalized area and compactness ex1: {ex1}")
pred_type = nn_classify_sample(training_set_normalized, training_labels, ex1)
print(f"Predicted type for seed with area 18 and compactness 0.9: {int(pred_type)}")
--- [code] 17
# classify example 2: Area: 13, Compactness: 0.80
ex2 = (np.array([13, 0.8]) - mean) / std
print(f"Normalized area and compactness ex2: {ex2}")
pred_type2 = nn_classify_sample(training_set_normalized, training_labels, ex2)
print(f"Predicted type for seed with area 13 and compactness 0.80: {int(pred_type2)}")
--- [markdown] 18
### Understanding why the second classification turned that way with normalized data
--- [code] 19
# visualizing distances

# point from which we are finding nearest neighbors
point = (np.array([13, 0.8]) - mean) / std

print(point)

# make a grid of the distances in a similar range to the data in question
x = np.linspace(-2, 2, 101)
y = np.linspace(-4, 2, 101)
xx, yy = np.meshgrid(x, y)
zz = (xx - point[0])**2 + (yy - point[1])**2
--- [code] 20
colormesh = plt.pcolor(x, y, zz, norm=colors.LogNorm(vmin=1e-5, vmax=zz.max()),
                   cmap='PuBu_r', shading='auto')
plt.colorbar(colormesh, label = "distance to point (13, 0.8)")
plt.xlabel("area")
plt.ylabel("compactness")
plt.show()
```
- `Bash` -- `mineru parse "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Lectures/Week - 6/2.3 unsupervised learning, k-means clustering.pptx.pdf" --pages all --tier flash --wait 300 2>&1 | grep -v "^$" | grep -v "Image block" | head -250`
```
<!-- page 1 of 26 -->
```
CSCI 4521: unsupervised
learning, k-means clustering
Bernardo Bianco Prado
Computer Science & Engineering
Slides adapted from Stephen Guy and Shelby Ziccardi
```
<!-- page 2 of 26 -->
```
Last time
Worked with UseNet data for text similarity.
```
<!-- page 3 of 26 -->
```
Today
Unsupervised learning
K-means clustering
```
<!-- page 4 of 26 -->
```
Unsupervised learning
So far we have only dealt with supervised learning methods.
These are problems when we have a collection of observations of
the features given by x1 , x2 , … , xn in R p and we have a collection
of labels, categories, or values y in R n that we are trying to
predict.
With unsupervised learning, we still have our observations x1 , x2 ,
… , xn in R p but we don't have the response vector y anymore!
```
<!-- page 5 of 26 -->
```
Unsupervised learning
So what can we do if we don't have a value to predict?
We can try to find interesting and meaningful aspects of the
observations themselves.
Example: divide the data into artificial categories, find
informative ways of visualizing it.
```
<!-- page 6 of 26 -->
```
Unsupervised learning
In this class, we will focus on two unsupervised learning
paradigms:
1.  Dimensionality reduction: trying to approximate data with a
    lot of features (p is large) by a smaller subspace of R p . This
    can be done with Principal Component Analysis (PCA). Review
    your linear algebra notes before next class!!
2.  Clustering: dividing unlabeled data into subgroups to
    understand its structure. To do this, we will use the notion
    of distance and group data points that are close to each
    other!
```
<!-- page 7 of 26 -->
```
Clustering
In clustering, we seek to take
unlabeled data and divide it
into subgroups.
We want similar data points to
be in the same group. But we
need to specify what it means
to be similar (we don't have
labels anymore!)                    Plots illustrating unlabeled data (left)
One common way to measure           and clustered data (right) that is divided
similarity is through               into three categories: green, blue and
distance.                           orange.
                                    Source: grammarly
```
<!-- page 8 of 26 -->
```
Clustering
Any ideas about how we could think of an intuitive algorithm to
cluster this dataset?
                           Plot illustrating
                           unlabeled data
```
<!-- page 9 of 26 -->
```
Clustering
Because we have no information about the data, we have to make
some assumptions.
The main assumption we need to make is that groups/clusters of
nearby points in feature space are related.
Clustering finds these related groups algorithmically. A common
algorithm is k-means clustering.
```
<!-- page 10 of 26 -->
```
k-means clustering
The k-means clustering algorithm is as follows:
   0. Choose a value of k
   1. Randomly assign all data points a value from 1 to k
      (randomly assign clusters)
   2. Iterate until clusters stop changing:
    -  For each of the k clusters, compute its centroid
       (average of all points in the cluster)
    -  Assign each data point to the cluster whose centroid is
       closest
```
<!-- page 11 of 26 -->
```
k-means clustering
Clustering gets "better" with every iteration
Stop when algorithm converges (no points change labels)
Doesn't give the "best" possible result (achieves a local minimum
but not a global minimum of a measurement function)
```
<!-- page 12 of 26 -->
```
 k-means clustering visually
   Initial data              Random assignment                Compute centroids
                                                                                         k = 3
Plots illustrating the first two steps of k-means clustering with a chosen value of k=3.
First plot is unlabeled data, second plot has the randomly assigned labels, and third plot
has the centroid computation from the 3 random clusters. The centroids are the big circles
in the center of the plot.
```
<!-- page 13 of 26 -->
```
k-means clustering visually
Re-assign data:          Re-compute centroids             … Convergence!
Plots illustrating the iteration steps of k-means clustering with a chosen value of k=3. First plot
is the data re-grouped after the first centroid computation, the second plot has the new centroid
computation after the re-assignment, and third plot has another reassignment. The last plot is the
convergent cluster since repeating the process will not change the grouping anymore!
```
<!-- page 14 of 26 -->
```
k-means clustering in code
Let's practice with SKLearn!
We will use this jupyter notebook.
SUBMIT A PICTURE OF THE WORLD CLOUD FOR THE PREDICTED CLUSTER ON
CHIMEIN
```
<!-- page 15 of 26 -->
```
k-means with text wrap-up
 -  K-Means clustering with SKLearn's KMeans function
 -  Placing a new point in a cluster with predict function
 -  Clustering for classification
 -  kNN within clusters
 -  Making a word cloud from clusters
HW2 will build off these tools!
```
<!-- page 16 of 26 -->
```
Implementation considerations
We have a couple of choices we need to make when implementing
k-means clustering.
First, for the initial clustering assignment, we can choose:
 -  Random
 -  Somehow estimate likely clusters based on density
 -  Try several random initializations (k-means++)
We then have to decide the stopping criteria which could be:
 -  Maximum number of iterations is reached
 -  Cluster ID change counts/rate is under a threshold
To decide the best k, we can run the algorithm with different k
and test them using nearest neighbors with the clusters.
```
<!-- page 17 of 26 -->
```
The math behind k-means
For a clustering algorithm to be valid, we require that two
assumptions are satisfied:
 -  Every data point belongs to a cluster.
 -  No point belongs to more than one cluster.
Mathematically, we can think of the data organized by their
indices {1, 2,..., n}, and each cluster set C1 , C2 ,..., Ck
specifying which indices belong to each cluster.
In this case the two assumptions can be written as:
 -  C1 ∪ C2 ∪...∪ Ck = {1, 2,..., n}
 -  Ci ∩ Cj = ∅ for all i ≠ j
```
<!-- page 18 of 26 -->
```
Measuring cluster quality
It would be nice to have a way to mathematically measure cluster
quality.
Since we assume that points that are closest to each other should
have the same classification, the distance should be an important
part of the measure.
Usually, we wouldn't want clusters to be too spread out with the
risk of including data that is very distinct in the same
category.
```
<!-- page 19 of 26 -->
```
Measuring cluster quality
One way we could do that is by choosing a point and seeing how
far it is from every other point in the same cluster.
For a point x* in a cluster Cl , this would be
But this is very dependent on which point x* we choose! A more
robust way of doing this would be to average this measurement
over all points in the cluster.
```
<!-- page 20 of 26 -->
```
Measuring cluster quality
But this is very dependent on which point x* we choose! A more
robust way of doing this would be to average this measurement
over all points in the cluster.
This would give us the within-cluster variation function:
Here, we commonly use the squared Euclidean distance to measure
closeness between points.
```
<!-- page 21 of 26 -->
```
Getting the best clusters
After arriving at a measurement of cluster quality, we can then
seek to get a clustering result that gives us the best
measurement.
In this case, we would want to minimize the within-cluster
variation for all clusters:
Which can be expanded to
```
<!-- page 22 of 26 -->
```
k-means as a minimization
problem
We have just framed clustering as a minimization problem!
It turns out that k-means clustering is an iterative algorithm
that solves this problem. However, it only solves it locally!
This is a very complicated problem and k-means is guaranteed to
keep decreasing the value of
with each iteration. But it might get stuck in a local minimum
instead of a global one!
```
<!-- page 23 of 26 -->
```
k-means as a minimization
problem
What does it mean that k-means
finds a local minimum?
It means that different
initializations of k-means can
give different results! With
different values of the
within-cluster variations.
We attempt to solve this by
running it multiple times and
taking the best run of all.
                                      Illustration of the output of k-means with
                                      different random initializations. The numbers
                                      on top of each plot are the values of the sum
                                      of the within cluster variations.
```
<!-- page 24 of 26 -->
```
Choosing the best k
```
- `Bash` -- `mineru parse "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Lectures/Week - 3/1.4 generalization, confusion matrix, accuracy, precision, recall, f1 score .pptx.pdf" --pages all --tier flash --wait 300 2>&1 | grep -v "^$" | grep -v "Image block" | head -200`
```
<!-- page 1 of 21 -->
```
CSCI 4521: generalization,
confusion matrix, accuracy,
precision, recall, f1 score
Bernardo Bianco Prado
Computer Science & Engineering
Slides adapted from Stephen Guy and Shelby Ziccardi
```
<!-- page 2 of 21 -->
```
Last time
We learned what it means to be a statistically perfect
classifier, i.e. Bayes classifier.
The issue with that is that we would need to know the probability
distribution followed by the data.
One way to go about this is try to empirically estimate this
probability distribution by making some assumptions about the
data.
kNN is essentially a way of doing that by estimating the
distribution using the labels of the nearest neighbors.
```
<!-- page 3 of 21 -->
```
Last time
We talked about the bias-variance trade-off.
Bias means how many assumptions a model makes about the data
(approximating the data distribution by a different type function
- usually simpler - than its true distribution).
Variance is how much the model assumes that the training data
represents the real data. Models with high variance would give
different results if they are trained on different data points
from the same data set (which is bad).
```
<!-- page 4 of 21 -->
```
Last time
Usually as a model flexibility increases, the more variance it
will have, making it prone to overfitting.
In practice, we want a model that generalizes well, that is it
performs well on unseen data. For this, we make sure that we have
the smallest combination of the variance and bias errors.
One way to do that is using a train-test split, which we can also
use to control the flexibility of the model by tuning the model
parameters (e.g. k in kNN).
```
<!-- page 5 of 21 -->
```
Today
 -  More on overfitting vs generalizing
 -  Binary classification
 -  Confusion matrix
 -  Accuracy, precision, and recall
 -  F1 score
```
<!-- page 6 of 21 -->
```
Overfitting dos and don'ts
How to overfit - bad!             How to generalize
Use overly flexible models        Avoid overly flexible models
Use extra features to add         Avoid unnecessary features
additional flexibility                Try removing weak features
                                      Don't add features "just in
Use a small amount of data            case"
points in training
                                  Gather lots of training data
Find model parameters using       (and save some for testing)
testing data
                                  Train on training data, assess
                                  on testing data
```
<!-- page 7 of 21 -->
```
Types of kNN
Many practical choices to make when implementing kNN
Finding neighbors:
 -  Option 1: Choose a fixed value of k (e.g., 1,5,10) to choose
    k nearest neighbors
 -  Option 2: Choose a fixed distance, and include any neighbors
    within that distance
Weighing neighbors in voting:
 -  Option 1: Each neighbor counts equally
 -  Option 2: Closer neighbors count more
Speed: kNN is slow, we can use spatial data structures of
approximate neighborhood
```
<!-- page 8 of 21 -->
```
Binary Classification
These are classification
problems with only two
categories.
The two categories are commonly
referred to as positive and
negative.
                                   An image showing a robot representing a binary
                                   classifier between dogs and cats. Source:
                                   Towards Data Science
```
<!-- page 9 of 21 -->
```
Evaluating binary classifiers
The main quantities that are useful in evaluating a binary
classifier are whether positives or negatives are correctly or
incorrectly assigned.
There are four possible outcomes from a binary classification of
a data point:
True Positives (TP): Accurately predicting positive/true      Predicts
False Positives (FP): Incorrectly predicting positive/true    positive
True Negatives (TN): Accurately predicting negative/false     Predicts
False Negatives (TN): Incorrectly predicting negative/false   negative
```
<!-- page 10 of 21 -->
```
Confusion matrix
A way of visualizing the TP, FP, TN, FN rates.
Binary confusion matrix:
                        Actually Positive      Actual Negative
 Predicted Positive     True Positive          False Positive
                                               Type I error - false
                                               alarm, overestimation
 Predicted Negative     False Negative         True Negative
                        Type II error - miss,
                        underestimation
```
<!-- page 11 of 21 -->
```
Confusion matrix
There are many terms and useful quantities related to the
confusion matrix:
```
<!-- page 12 of 21 -->
```
Accuracy
How many data points were correctly labeled.
For multi-class classifiers:
For binary classifiers:
Issues with accuracy:
 -  If data is unbalanced (high percentage have one label and
    small percentage has the other), then a bad model can have
    good accuracy by prioritizing the high percentage label.
 -  Combines type I and type II errors that may have different
    importances. E.g. medical diagnosis.
```
<!-- page 13 of 21 -->
```
Precision (type I error)
Precision measures the accuracy of positive
predictions:
 -  If a classifier says it's positive, is
    it really?
 -  Useful if we don't want to misclassify
    negatives!
For binary classifiers:
Precision focuses on type I error.                                [Wikipedia]
Low precision means we have a high false        Image illustrating the precision by
                                                highlighting the part of the data set it
positive rate (FPR).                            focuses on in green (true positives) and
                                                red (false positives)
```
<!-- page 14 of 21 -->
```
Recall (type II error)
Recall measures the accuracy of positive
samples:
 -  If the data is positive, will the
    classifier say it's positive?
 -  Useful if we don't want to misclassify
    positives!
For binary classifiers:
Recall focuses on type II error.                                  [Wikipedia]
Low recall means we have a high false           Image illustrating the recall by
                                                highlighting the part of the data set it
negative rate (FNR).                            focuses on in green (true positives) and
                                                darker green (false negatives)
```
<!-- page 15 of 21 -->
```
Example
Consider the task of predicting if a patient has COVID-19 based
on their chest x-ray. You test it on 100 patients, 20 of which
have COVID-19. The results correctly say 15 of the 20 subjects
with COVID-19 are COVID positive, and incorrectly says that 5 of
these 20 are negative. The results correctly say 65 of the 80
subjects without COVID-19 are COVID negative, and incorrectly say
that 15 of these 80 are positive.
Lets compute accuracy, precision, and recall!
Between precision and recall, which one is more important for
COVID-19 diagnosis?
SUBMIT YOUR ANSWERS ON CHIMEIN
```
<!-- page 16 of 21 -->
```
Optimizing a classifier
If I'm choosing a classifier, should I …
a)  … maximize accuracy?
b)  … maximize precision?                     SUBMIT YOUR EXAMPLES
c)  … maximize recall?                        FOR THE ANALYSIS
                                              QUESTION ON CHIMEIN
Analysis activity:
```
- `Bash` -- `mineru parse "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Lectures/Week - 5/2.4 pca.pptx.pdf" --pages all --tier flash --wait 300 2>&1 | grep -v "^$" | grep -v "Image block" | head -200`
```
<!-- page 1 of 30 -->
```
CSCI 4521: PCA
Bernardo Bianco Prado
Computer Science & Engineering
Slides adapted from Stephen Guy and Shelby Ziccardi
```
<!-- page 2 of 30 -->
```
Last time
k-means clustering
 -  k-means clustering is an iterative algorithm
 -  Begin with random assignments ➞ find centroids ➞ reassign ➞
    repeat until convergence
 -  Each run can be different
 -  Can measure quality of a clustering using within-cluster
    variation
 -  Sum of distances from points to centroid
 -  Choosing how many clusters is a hard question!
     -  See a method today :)
```
<!-- page 3 of 30 -->
```
Today
Principal Component Analysis
```
<!-- page 4 of 30 -->
```
Dimensionality reduction
Remember that we talked about the curse
of dimensionality!
As the dimension grows, the amount of
data needed to generalize well
increases exponentially!
One way to get around that is through
feature selection by observing plots of
pairs of features.
But what if all the features are
useful? Or maybe a certain combination
of them but no isolated ones?               Plots comparing pairs of features
                                            from our plant variety data
                                            activity.
```
<!-- page 5 of 30 -->
```
Dimensionality reduction
Principal Component Analysis
(PCA) deals with that by
approximating the data with a
lower dimensional subspace of
the feature space.
                                          Plot illustrating how we can
                                          approximate 3D data by a 2D
                                          subspace.
```
<!-- page 6 of 30 -->
```
Dimensionality reduction
Looking at this plot, we have
two directions PC1 and PC2 that
define this plane.
Let's explore how to find PC1:
In this plot, the PC1 direction
is the direction in which the
data is most spread!
This means we are talking about
the direction with largest
sample variance.                          Plot illustrating how we can
                                          approximate 3D data by a 2D
                                          subspace.
```
<!-- page 7 of 30 -->
```
Direction of largest variance
Remember that variance of a random variable X is
    var(X) = E[(X-E[X])2 ]
If we think of each of the p features as a random variable X1 ,
X2 ,..., Xp , then we are interested in the linear combination of
them that has largest variance.
Assume we have centered the data so that all features have mean
0.
```
<!-- page 8 of 30 -->
```
Direction of largest variance
Then, we are looking for constants c1 , c2 ,..., cp so that the
random variable
    Z = c1 X1 + c2 X2 + … + cp X p
That has the largest possible variance:
    var(Z) = E[(Z-E[Z])2 ]  (but E[Z]=c1 E[X1 ]+c2 E[X2 ]+…+cp E[Xp ]=0)
           = E[Z2 ]
We could just make all the ci  as large as possible but we are
actually more interested in what direction increases the variance
the most (we will make c1 2 + … + cp 2 = 1
```
<!-- page 9 of 30 -->
```
Direction of largest variance
Then, we are looking for constants c1 , c2 ,..., cp so that the
random variable
    Z = c1 X1 + c2 X2 + … + cp X p
That has the largest possible variance:
    var(Z) = E[(Z-E[Z])2 ]  (but E[Z]=c1 E[X1 ]+c2 E[X2 ]+…+cp E[Xp ]=0)
           = E[Z2 ]
How can we maximize this using the data we have?
```
<!-- page 10 of 30 -->
```
Direction of largest variance
How can we maximize var(Z) using the data we have?
We use the sample variance! That is, we estimate the variance
using the observations of each feature (the data points).
We can think about the data as a matrix X in R n x p where each row
is an observation of all the random variables X1 , X2 ,..., Xp . In
that case, each observation of Z will be a weighted sum of each
row of X.
We then get an observation vector z = c1 v1 + c2 v2 +...+ c p v p where
where vi is the i-th column of the matrix X. Because we only care
about a direction, we will require that z be a normalized
combination of the columns of X in the sense that c1 2 +c2 2 +.+c p 2 =1
```
<!-- page 11 of 30 -->
```
Direction of largest variance
We can then calculate the sample variance of Z using the
observation vector z:
                                                    Here, xi are the
                                                    row vectors of X
                                                    (the observed data
                                                    points), and c is
                                                    the vectors of the
                                                    coefficients in
                                                    the combination of
                                                    z.
```
<!-- page 12 of 30 -->
```
Direction of largest variance
So finding z means finding the coefficient vector c that solves
the maximization problem
    maxc ||Xc||2 with the constraint that ||c|| = 1
It turns out that this problem is related to the singular value
decomposition of the data matrix X!
We are, in fact, finding the first singular row vector of X.
```
<!-- page 13 of 30 -->
```
SVD and variance maximization
So the first singular row vector of
X represents the direction of
largest spread of the data points
(rows of X).
What about the second singular row
vector?
It will also be the direction of
largest spread but with the
restriction of only looking at
directions orthogonal to the first
singular vector. And similarly with
the third and so on…                      Plot illustrating how we can
                                          approximate 3D data by a 2D
                                          subspace.
```
<!-- page 14 of 30 -->
```
SVD and variance maximization
To find those singular row vectors, we just need to find the
eigenvectors of
    XXT
And order them by the eigenvalue size. We then grab as many of
them as we like (the least the better) to approximate the data by
a subspace of R p .
This is called principal component analysis!
```
<!-- page 15 of 30 -->
```
PCA visually
                                                    Put the data in
                                                    the rows of a
  Y                                                 matrix X and find
                                                    the eigenvectors
                                                    and eigenvalues
                                                    of XXT .
                 X
```
<!-- page 16 of 30 -->
<details>
<summary>image content</summary>
PCA visually
New basis
of first and
second
Put the data in
singular
the rows of a
vectors
matrix
X and find
the eigenvectors
Y
```
- `Bash` -- `mineru parse "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Lectures/Week - 6/2.3 unsupervised learning, k-means clustering.pptx.pdf" --pages 24-26 --tier flash --wait 300 2>&1 | grep -v "^$" | grep -v "Image block"; echo =========PCA; mineru parse "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Lectures/Week - 5/2.4 pca.pptx.pdf" --pages 16-30 --tier flash --wait 300 2>&1 | grep -v "^$" | grep -v "Image block"; echo ======1.4; mineru parse "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Lectures/Week - 3/1.4 generalization, confusion matrix, accuracy, precision, recall, f1 score .pptx.pdf" --pages 16-21 --tier flash --wait 300 2>&1 | grep -v "^$" | grep -v "Image block"`
```
<!-- page 24 of 26 -->
```
Choosing the best k
This is hard! We can't just split into train and test data
because there's labels to test for!
The within-cluster variation doesn't help here either, since
having more cluster will always improve its value.
There are some statistical ways to work with this, but there's no
really good solution unless we assume things about the data.
One heuristic is called the Elbow Method which will be covered in
a future class.
```
<!-- page 25 of 26 -->
```
Summary
Unsupervised learning:
 -  No training or test data, nothing to predict
 -  Try to find interesting things about the data
 -  We will cover two kinds, clustering and dimensionality
    reduction.
Clustering:
 -  Grouping the data into categories
 -  k-means clustering:
        the algorithm
        the implementation
        the mathematical meaning
 -  Choices for initialization and stopping condition
 -  Run k-means many times and choose the best run
 -  Choosing k is hard
```
<!-- page 26 of 26 -->
```
Next time
Principal component analysis
This involves a lot of linear algebra and some statistics!
Make sure to review:
 -  Eigenvalues
 -  Covariance Matrix
 -  SVD
 -  1D Gaussian Distribution
 -  2D Gaussian Distribution
 -  Random variables
Here are some linear algebra notes from 2033.
```
=========PCA
<!-- page 16 of 30 -->
<details>
<summary>image content</summary>
PCA visually
New basis
of first and
second
Put the data in
singular
the rows of a
vectors
matrix
X and find
the eigenvectors
Y
and eigenvalues
T .
of XX
X
</details>
<!-- page 17 of 30 -->
```
The PCA algorithm
Goal: find the best subspace approximation of the data for any
dimension.
Statistical perspective algorithm:
   1.  Center the data (shift it by its mean)
   2.  Fit a multidimensional gaussian distribution to the data
   3.  Pick the axis of largest variance for the first principal
       component
   4.  Pick axis of largest variance perpendicular to the first
       principal component to be the second principal component
   5.  etc...
```
<!-- page 18 of 30 -->
```
The PCA algorithm
Goal: find the best subspace approximation of the data for any
dimension.
Linear algebra perspective algorithm:
   1.  Center the data (shift it by its mean)
   2.  Compute the eigenvectors of XXT (assuming data points are in
       the rows of X, if they are in the columns, do the same with
       X T X instead)
   3.  Order them by the size of the eigenvectors
   4.  Pick the largest k of them
   Note: XXT is known as the covariance matrix of the data as long
   as the data is centered.
```
<!-- page 19 of 30 -->
```
PCA applications
Dimensionality reduction:
 -  Helps filter out data noise
 -  Helps decrease model variance
 -  Better understanding of feature relationships
 -  Reduces amount of data needed
 -  Helps visualize the data
     -  Especially if we reduce to 2 or 3 dimensions
```
<!-- page 20 of 30 -->
```
PCA practice
We'll use this jupyter notebook to pair PCA with kNN on the iris
dataset!
Submit a screenshot of the angles with least and most amount of
information on ChimeIn.
```
<!-- page 21 of 30 -->
```
PCA practice
We see that PCA is connected to finding the best view of the
data!
We saw:
 -  Interactive plots with Plotly's scatter_matrix
 -  Interactive plots with Plotly's scatter_3d
 -  PCA with SKLearn's pca.fit_transform
 -  kNN with PCA features
HW2 will build off these tools to classify text!
```
<!-- page 22 of 30 -->
```
Measuring PCA quality
We want to measure the amount of information preserved by
dimensionality reduction using PCA.
One way to measure that is by determining how much of the
variance is not contained in the used principal component
directions.
```
<!-- page 23 of 30 -->
```
Measuring PCA quality
The total variance present in a data set (assuming features are
centered), is the sum of the variances of each feature:
Where ||X||F is the Frobenius norm of the data matrix.
The variance explained by a principal component cm is
```
<!-- page 24 of 30 -->
```
Measuring PCA quality
The variance explained by a principal component can be then
measured as the ratio between the total variance and the specific
variance of the principal component.
This is called the proportion of variance explained by the m-th
principal component:
You can access this quantity in SKLearn using the command
    pca.explained_variance_ratio_
```
<!-- page 25 of 30 -->
```
Parameters in unsupervised learning
In unsupervised learning, it can be difficult to choose
parameters since we don't have training and test data.
In PCA and k-means, the quality measure we have will always
improve by adding more principal components or more clusters, so
they are not very helpful.
One (non-rigorous) way people deal with this is by observing the
improvement of the quality measure and figuring out at what point
it slows down.
```
<!-- page 26 of 30 -->
```
The elbow test
This is called the elbow test:
               Two plots illustrating the elbow test. On the left, we have principal
               component vs. the cumulative pve, and we see that it starts to slow
               down once the third principal component is added. On the right, we
               have number of clusters vs. within cluster variation, and we see that
               it starts decreasing more slowly once an 8th cluster is added.
```
<!-- page 27 of 30 -->
```
Data leakage
Leakage or data leakage describes a situation in which
information from the test data affects (leaks) into the training
data.
Examples:
 -  If a dataset has multiple copies of the same point, the
    train-test split might put one on training and one on
    testing.
 -  If z-score normalization happens before the train-test split
    (since we would be taking the distribution of the test set
    into account in training process)
 -  If data comes from temporal events that impact each other.
     -  Maybe some future data points made it to the training set
```
<!-- page 28 of 30 -->
```
Data leakage
When performing PCA, we need to make sure that we don't include
the test data in the PCA algorithm, otherwise it would be a leak
of the test information into the training set.
Always make sure to split first and then perform PCA on the
training data!
This is a common interview question!
```
<!-- page 29 of 30 -->
```
More PCA practice
Let's do an example using PCA on newsgroups.
We will use this jupyter notebook.
Topics included are:
 -  Explained variance pca.explained_variance_ratio_
 -  Timing with %%time, %timeit, …
 -  Reducing dimensionality to increase speed!
 -  Reducing dimensionality to increase accuracy!
HW2 will build off these tools to classify text!
```
<!-- page 30 of 30 -->
```
Summary
Principal Component Analysis (PCA)
  -  Find linear combinations of dimensions that maximize variance in that
     direction
  -  Components are ordered so the most variance is first
  -  Can keep only the most important components
       -  Have to decide how many to keep
  -  Math behind PCA
Applications
  -  Nearest Neighbor Classifier in PCA space
  -  PCA for data visualization (interactive)
Tools
  -  Plotly for interactive visualization
  -  Runtime timing
  -  Elbow test
  -  pca.explained_variance_ratio_
  -  kmeans.inertia_
```
======1.4
<!-- page 16 of 21 -->
```
Optimizing a classifier
If I'm choosing a classifier, should I …
a)  … maximize accuracy?
b)  … maximize precision?                     SUBMIT YOUR EXAMPLES
c)  … maximize recall?                        FOR THE ANALYSIS
                                              QUESTION ON CHIMEIN
Analysis activity:
 -  A case where good accuracy but low precision is very bad?
 -  A case where good accuracy but low recall is very bad?
What's the best single number to summarize classifier
performance?
 -  Some combination of Precision and Recall?
 -  Precision + Recall?
 -  Precision * Recall?
```
<!-- page 17 of 21 -->
```
F1 score
The F1 score of a classifier is the harmonic mean of precision
and recall:
The F1 score weights both precision and recall equally.
It ranges from 0 to 1 (1 being a perfect classifier)
```
<!-- page 18 of 21 -->
<details>
<summary>image content</summary>
Fß
score
The Fß
score of a classifier is a weighted harmonic mean of
precision and recall:
Fß
can weigh precision or recall more
β = 2 focuses more on Recall
β = 0.5 focuses more on precision
Fß
is common in document search and retrieval
</details>
<!-- page 19 of 21 -->
```
Example
Consider the task of predicting if a patient has COVID-19 based
on their chest x-ray. You test it on 100 patients, 20 of which
have COVID-19. The results correctly say 15 of the 20 subjects
with COVID-19 are COVID positive, and incorrectly says that 5 of
these 20 are negative. The results correctly say 65 of the 80
subjects without COVID-19 are COVID negative, and incorrectly say
that 15 of these 80 are positive.
Lets compute the F1 score!
SUBMIT YOUR ANSWERS ON CHIMEIN
```
<!-- page 20 of 21 -->
```
Other somewhat popular metrics
Fowlkes-Mallows Index (FMI)
Cohen's Kappa
Confusion Entropy
K measure
Informedness (TPR - TNR) and Markedness (PPR - TN/PN)
Matthews Correlation Coefficient (MCC)
```
<!-- page 21 of 21 -->
```
Summary
Classification:
 -  Confusion Matrix: Prediction vs. Actual for each class
 -  TP, FP, TN, FN: True/False Positives/Negatives
Error Types:
 -  Type I Errors: False Positives
 -  Type II Errors: False Negatives
Metrics:
 -  Accuracy: Percent Correct
 -  Precision (P): Measures False Positives: TP/(TP+FP)
 -  Recall (R): Measures False Negatives: TP/(TP+FN)
 -  F1 Score: Balances Precision & Recall: 2*(P*R)/(P+R)
```
```
- `Grep` -- pattern `HW ?2|Homework 2|Rover|rover` path `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4521`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4521\Preparation.md`
- `Bash` -- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/1b6f8eac-44d0-4860-b243-88b063adb7c7/scratchpad/hw2" && /c/Users/anant/miniconda3/python.exe -m venv venv 2>&1 | tail -2; ./venv/Scripts/python.exe -m pip install -q pymupdf 2>&1 | tail -3; ./venv/Scripts/python.exe -c "import fitz;print(fitz.__doc__)" 2>&1 | tail -2`
```
[notice] A new release of pip is available: 26.2.1 -> 26.2.2
[notice] To update, run: C:\Users\anant\AppData\Local\Temp\claude\[REDACTED]\[REDACTED]\scratchpad\hw2\venv\Scripts\python.exe -m pip install --upgrade pip
Python 3.14 running on win32 (64-bit).
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4521\Weekly
```
- `Bash` -- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/1b6f8eac-44d0-4860-b243-88b063adb7c7/scratchpad/hw2" && ./venv/Scripts/python.exe -I -c "
import fitz
d=fitz.open('D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code/Homework/homework 2.pdf')
for i in (0,3):
    d[i].get_pixmap(dpi=80).save(f'hw2_p{i+1}.png')
print(len(d))
"; ls`
```
C:\Users\anant\AppData\Local\Temp\claude\[REDACTED]\[REDACTED]\scratchpad\hw2\venv\Lib\site-packages\fitz\__init__.py:17: FutureWarning: The `fitz` API is deprecated and will be removed in future. Use `import pymupdf` instead.
  warnings.warn(
4
hw2_p1.png
hw2_p4.png
src.py
venv
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4521\Weekly
```
- `Read` -- `C:\Users\anant\AppData\Local\Temp\claude\D---Anant-20-Progress-Documents-Jarvis\1b6f8eac-44d0-4860-b243-88b063adb7c7\scratchpad\hw2\hw2_p1.png`
- `Grep` -- pattern `AI|green|yellow|red\b|extra|due|Due|deadline|Gradescope|Canvas|bonus` path `C:\Users\anant\AppData\Local\Temp\claude\D---Anant-20-Progress-Documents-Jarvis\1b6f8eac-44d0-4860-b243-88b063adb7c7\scratchpad\repo\2026\homework-2\rover-rescue\assignment_student.md`
- `Bash` -- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/1b6f8eac-44d0-4860-b243-88b063adb7c7/scratchpad/repo"; git log --format='%h %ad %s' --date=short -- 2026/homework-2 | head; ls 2026 | head -20`
```
2d143fe 2026-10-22 added dataset for hw 3 f26
homework-2
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4521\Weekly
```
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 4521/Weekly"; sed -n 55,58p "Week - 6.md" | cut -c1-900; echo ----; sed -n 20,24p "Week - 7.md" | cut -c1-700; echo ----; sed -n 39p "Week - 7.md" | cut -c1-1500`
```
	Covers data leakage explicitly and generally (duplicate points split across train/test, normalizing before the split, temporal leakage), then specifically for PCA: fit only on training data, never on the full dataset including test — flagged directly as "a common interview question."
### 3. LEC 2.5 — Modern Text Embedding (Thu 10/15)
	Opens with specific tips for HW2 (start early given dataset size; use a 10-20% sample for an initial elbow-method ballpark across $k=2$ to $802$; tune `min_df` and `n_init` for speed; problem 2 is easier with many small clusters; the review-score-threshold requirement is simplified to above/below 2.5).
	Recaps PCA (Last time slide, mirrors LEC 2.4's summary) then states today's content: alternatives to the prior vectorization methods (bag-of-words, tf-idf), motivated by those methods' shared shortcomings — ignoring word meaning, order-independence, high dimensionality (tf-idf adds that rarity isn't always importance).
----
- Derive the Linear Discriminant Analysis decision rule from Bayes classification under a shared-covariance Gaussian assumption, using [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 4|ISL Chapter 4]]'s §4.4.1-§4.4.2.
- Contrast LDA and QDA by what covariance assumption each makes and the resulting bias-variance trade-off, citing the real parameter-count argument.
- Explain the Gaussian Mixture Model / Expectation-Maximization algorithm as k-means extended to track per-cluster covariance, and state what "soft"/probabilistic cluster assignment means concretely.
- State HW2's due date (this week, per the Board) and that it builds directly on Weeks 5-6's PCA/k-means tooling.
## Key ideas (short)
----
No protected human live capture is present yet. These notes come directly from `Lectures/Week - 6/3.1 advanced clustering, lda, gmm.pptx.pdf` (filed in the Week-6 source folder but confirmed, per the professor's own schedule, to be real Week 7 Tuesday content — the same known filing-offset pattern as LEC 1.5). A companion notebook `3.1 gaussian mixture models.ipynb` exists under `Code/Lectures/Week 6 - 10/` but has not yet been opened for this build. Quiz 3 is today, Thursday 10/22; HW2 was due this week (Tue 10/20) per the Board's schedule.
```
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\HUMAN_WRITING.md`
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/Jarvis"; f=$(find . -name "Jarvis Writing and Formatting.md" -not -path "./50_Archive/*" | head -1); echo "$f"; sed -n 1,80p "$f" | cut -c1-400; echo ======; g=$(find . -name "Vault Lint.md" -not -path "./50_Archive/*" | head -1); echo "$g"; sed -n 1,40p "$g" | cut -c1-300`
```
./60_Claude/07_AI_Information/Jarvis Writing and Formatting.md
---
type: evergreen
status: sprout
created: 2026-05-15
updated: 2026-05-31
tags:
  - evergreen
  - system
  - writing
  - ai-agents
notes:
  - "[[HUMAN_WRITING]]"
  - "[[60_Claude/07_AI_Information/Plugins]]"
  - "[[40_Resources/Obsidian/Vault Operating System]]"
  - "[[40_Resources/Obsidian/Plugins/00 Plugin Reference Index]]"
---
# Jarvis Writing and Formatting

This file extends [[HUMAN_WRITING]] with Obsidian-specific rules.

[[HUMAN_WRITING]] is still the source of truth for voice. This note explains how that voice should appear inside Jarvis: frontmatter, wikilinks, headings, Dataview-friendly fields, Tasks syntax, flashcards, math, code, boards, and visual notes.

For deeper plugin-specific examples, use [[40_Resources/Obsidian/Plugins/Dataview and Dashboards]], [[40_Resources/Obsidian/Plugins/Tasks Kanban and Project Tracking]], [[40_Resources/Obsidian/Plugins/Spaced Repetition and Learning Loops]], [[40_Resources/Obsidian/Plugins/Visual Thinking with Canvas and Excalidraw]], and [[40_Resources/Obsidian/Plugins/Appearance Code Math and Reading Experience]]

## Relationship To Human Writing

Follow [[HUMAN_WRITING]] before anything here.

The note should sound like someone who understands the thing, not like someone performing expertise. Formatting cannot rescue vague writing.

Good Jarvis writing usually does one of these:

- explains a mechanism
- captures a decision
- contrasts nearby ideas
- names a failure mode
- links a claim to a real source or project
- gives a usable next action
- marks what is still uncertain

If a section only says that something is "important," "powerful," or "useful," rewrite it until it says why.

## Blank Lines Rule

The vault's `headerspace.css` CSS snippet handles visual heading spacing. Blank lines are not needed for visual breathing room.

Rules:
- Zero blank lines between `---` (frontmatter close) and the `#` title
- Zero blank lines between any heading (`##`, `###`) and its first content line
- Zero blank lines between consecutive list items
- Zero blank lines between consecutive sections
- **One blank line is acceptable:** immediately after a callout (`> [!X]`) or blockquote (`> `) before a following paragraph of prose

Extra blank lines are not stylistic — they are an error. They bloat the file and signal that the agent added them instead of relying on CSS.

## Markdown Shape

Write for fast rereading.

- Use short paragraphs.
- Use headings when they help navigation or retrieval.
- Use bullets for comparison, steps, symptoms, examples, and constraints.
- Use tables only when comparison is clearer in rows.
- Use code blocks for code, syntax, commands, data examples, and exact formats.
- Use callouts sparingly for warnings, source notes, definitions, or important caveats.

Headings should name the thing inside the section. Avoid headings like "Overview" if a more precise heading exists.

Better headings:

- `## Why Retrieval Fails`
- `## Heap Construction Trap`
- `## When To Use Kanban`
- `## Source-Grounded Claims`

Weaker headings:

- `## Introduction`
- `## Important Information`
- `## Key Insights`
======
./30_Order/System/vault-lint/Vault Lint.md
---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - tooling
system_kind: spec
trigger: On demand with node, in the weekly review, and after any change to a Standard.
owner: Anant, and any session that changes a Standard or a Spec block.
notes:
  - "[[Conformance Standard]]"
  - "[[Note Kit Standard]]"
  - "[[Conformance on Touch]]"
---
# Vault Lint
## Purpose
Measures how many notes fit their Standard and checks that the kit files (Standards, Templates, Workflows) agree with each other. Without it the goal of 90% fit has no number, and a Standard can drift from its Template unnoticed.
## Trigger
Run by hand: `node vault-lint.js` from this folder. The weekly review records the fit percentage. Run `--kit` after any change to a Standard, Template, or Workflow. No scheduled task exists yet.
## Inputs and Outputs
Reads every `.md` file under the vault root (found three folders up from the script), the Spec blocks in `30_Order/Standards/`, the vocabulary tables in [[Frontmatter Standard]], and `vault-lint.config.json`. It writes nothing into the vault. `--json FILE` writes a report wherever you point it, whic
```powershell
node vault-lint.js                                  # fit %, by tier, by family, top failure reasons
node vault-lint.js --path 30_Order/Standards/       # one folder
node vault-lint.js --family course-concept --list 20   # failing notes in a family
node vault-lint.js --specs                          # Spec blocks, names, empty files
node vault-lint.js --kit                            # Standard, Template, Workflow consistency
```
## State
None. `vault-lint.config.json` is tracked source: `out_of_scope`, `tier4`, and `template_paths` regular expressions. The type and status vocabulary is read from the tables in [[Frontmatter Standard]]; change the tables, not the script.
## Failure Behavior
It never edits a note. A Spec block that is not valid JSON is reported as an error, and notes of that family then fall to `unmapped`. `--kit` exits with status 1 when it finds an error, so it can gate a commit.
## Verify
Run `node vault-lint.js --specs` and compare the Spec count with the number of Spec blocks you wrote. Lint a note you know fits and one you know does not. The scanned count plus the excluded counts equals the number of `.md` files under the root.
## Retire
Delete this folder in one commit and remove the lint step from the weekly review. The fit number then goes back to being unmeasured.
```
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 4521/Textbook"; head -12 "ISL/Chapter - 12.md" | cut -c1-300; grep -n "^## \|^### " "ISL/Chapter - 12.md" | head -30; echo ----; grep -n "^## \|^### " "ISL/Chapter - 2.md" | head -20; echo; head -12 "../Weekly/Week - 5.md" | cut -c1-200`
```
---
type: class
class_kind: textbook
status: sprout
created: 2026-10-22
updated: 2026-10-22
area:
  - "[[CSCI 4521 Board]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/Textbook Map|Textbook Map]]"
tags:
  - class
  - textbook
19:## Chapter Summary
22:## Key Concepts
28:## Full Reading Notes
29:### §12.2 Principal Components Analysis (p. 504)
31:### §12.4 Clustering Methods (p. 520)
33:## Worked Example
36:## Connections
40:## Open Questions
44:## Flashcards
----
16:## Chapter Summary
19:## Key Concepts
20:### §2.1 What Is Statistical Learning?
25:### §2.2 Assessing Model Accuracy
29:### §2.3 Lab: Introduction to Python
33:## Examples Worth Keeping
37:## Connections
41:## Open Questions
44:## Flashcards

---
type: class
class_kind: week
status: seed
created: 2026-10-22
updated: 2026-10-22
area:
  - "[[CSCI 4521 Board]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/Textbook Map|Textbook Map]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 12|ISL Chapter 12]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5|DLB Chapter 5]]"
tags:
```
- `Grep` -- pattern `empty cluster|empty clusters|no points|k-means\+\+|local optimum|local minimum` path `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Textbook & Resources\isl.txt`
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4521\Homework\Homework - 2.md`
```
---
type: class
class_kind: homework
status: sprout
created: 2026-10-26
updated: 2026-10-27
tags:
  - class
  - homework
area:
  - "[[CSCI 4521 Board]]"
next: "Confirm the Gradescope due date and this assignment's AI-use level, get the personalized dataset (the repo only ships demo_data with student_id demo3), then build and run the notebook and fill the report draft below from its output."
---
# Homework - 2
## Overview
Rover Rescue: build a terrain classifier from eight sensor readings (firm, rough, sand), compare scaling, PCA and cluster-based versus 1-NN prediction, deploy one fitted model on a practice grid and a mission grid, and explain the evidence in a standalone report of at most two pages. The grade is the 100-point `rubric.md` in the course repo, not the 10, 20 and 10 points printed in the PDF. Submission is on Gradescope (HW1 was Canvas).
Due date is unverified. The handout says "check Gradescope". The Board's schedule lists HW2 for Tue 10/20, which has passed (the 24-hour grace day ended 10/21). The repo's only commit for this folder is dated 2026-10-22 and is titled "added dataset for hw 3 f26", and the Week 6 note describes an earlier text-clustering HW2. So this may be a replacement or renumbered assignment. Check Gradescope before anything else.
Extra credit: none in the handout, the repo markdown or the rubric. The rubric says extra experiments earn credit only through stronger evidence. The only way to score higher is a full rubric score.
Sources read: `Code\Homework\homework 2.pdf` (assignment), `HW2.pdf` (example, a spam-clustering report from Feb 2025, so a style example only), the starter notebook, and the repo `be-prado/csci4521`, `2026/homework-2/rover-rescue` (README, assignment_student.md, rubric.md, rover_starter.py, run_demo.py, demo_data). Course grounding: lectures 1.1, 1.4, 2.3, 2.4 and the 2.3 and 2.4 notebooks.
## Requirements
### Must submit (Gradescope)
- [ ] Notebook `.ipynb`, saved with outputs, containing all code and every figure used in the report. A fresh run on the assigned dataset must reproduce results and predictions.
- [ ] Practice deployment image or animation (locally: save `show_practice_run(...).data` to an HTML file).
- [ ] `submission.csv` from `save_submission`, one row per mission row in CSV order. The PDF lists it as a deliverable and `assignment_student.md` calls it optional, so produce it.
- [ ] Report PDF, standalone, two pages maximum, with a compact comparison table and at least one readable figure.
### Must demonstrate (rubric, 100 points)
- [ ] Learning system and method choices (25): z-score normalization, k-means (3 clusters), 1-NN and kNN written in NumPy, calibration-based cluster naming, choices explained (initialization, stopping rule, empty clusters).
- [ ] Representation (15): sensor-scale analysis (4), PCA fitted correctly with the 95% component count (6), a useful PCA figure with a supported reading (5).
- [ ] Experiments (25): at least three configurations covering scaling, PCA and cluster versus kNN (8), one common held-out evaluation with correct fit and label boundaries (9), dimensions, accuracy, macro F1, sand recall and practice outcome for every configuration (8).
- [ ] Deployment (10): evidence-based model choice (4), stored transforms and predictor reused on mission plus a predicted mission map (4), documented practice run (2).
- [ ] Report (20): focused question (4), table, figure and conclusions (8), diagnosis including sand risk (5), evaluation protocol (3).
- [ ] Reproducibility (5): dependencies, exact run instructions, fresh run reproduces everything.
### Must not do
- Do not read `practice_truth.bin`; only `evaluate_practice` and `show_practice_run` touch it.
- Do not change `split_data` or its split.
- Do not use x, y as features.
- Do not fit normalization, PCA or k-means on validation rows, and never fit anything on mission data.
- Do not use validation labels to name clusters or train 1-NN.
- Do not replace the four required NumPy operations (normalization, nearest-centroid assignment, centroid update, kNN prediction) with library versions. Allowed from libraries: PCA, k-means initialization, classification metrics, plotting. The rubric says library implementations are eligible, but the PDF is stricter, so follow the PDF.
- Do not call validation scores an untouched test estimate, and do not call the practice run an accuracy estimate.
- Do not submit the dataset or truth files.
### Report must state
- [ ] Question, configurations compared and why.
- [ ] Number of components for 95% variance.
- [ ] What scaling and PCA changed, what cluster versus kNN showed, tied to the metrics. If methods tie, say so.
- [ ] Why the deployed model was chosen, how a missed sand cell changes the route or outcome, one failure, surprise, tie or limitation.
- [ ] Which rows were used for fitting, naming and validation, and how the fitted model was reused on mission.
- [ ] Observations kept apart from explanations.
### Rules
- Syllabus: cite AI assistants prominently and disclose assistance. Each assignment is supposed to carry a green, yellow or red AI level. It is not printed on the handout PDF or in the repo markdown, so it is unconfirmed (check Gradescope or Canvas). HW1 ended with a one-line AI disclosure, reuse that shape.
- Late policy: 24-hour grace day, nothing after.
## Work log
### 2026-10-27 Source reading and plan (no code run yet)
Everything below is reading and planning. No notebook cell has been executed and no result exists.
**Findings that change the plan**
- Dataset: the repo ships only `demo_data` (28x28 grid, 784 rows, `student_id: demo3`). The handout promises a personalized dataset. `save_submission` writes the config's `student_id` into every row, so a submission built on demo data carries the wrong id. Get the personalized bundle first. The starter output in the notebook came from demo data on Colab.
- Validation is only 30 rows (60 labeled training, stratified, `random_state=0`). One error moves accuracy by 3.3 points and sand recall by roughly 10 points, so ties are likely and the report should say so instead of inventing a winner.
- The planner blocks predicted sand, charges 1.0 for firm and 2.4 for rough, and the rover is stuck the first time its path crosses true sand. A missed sand cell (false negative) can end the run. A false sand cell only forces a detour, or NO ROUTE if enough of them wall off the goal. This asymmetry is the answer to "why missing sand matters".
- Lecture 2.3 gives the k-means wording the report must use: random or k-means++ initialization, stop when no label changes or at a maximum iteration count, run several starts and keep the lowest within-cluster variation (`inertia`). Empty-cluster handling is not covered in lecture or ISL, so it is my own choice and the report must say so.
- Lecture 2.4 gives the leakage rule (split first, fit PCA on training rows only), `explained_variance_ratio_`, and the elbow test. Lecture 1.1 gives z-score with training mean and standard deviation applied to new points.
- Macro F1 is not defined in the lectures (1.4 defines binary F1 only). Define it in the report as the unweighted mean of the three per-class F1 scores.
**Decision: Word, not LaTeX.** Two pages, one table, two composite figures, no equations that need typesetting and no bibliography (sources are the course lectures and the AI disclosure). Word reuses the HW1 flow (draft here, Paste Special as unformatted text, PDF export), which took one sitting. LaTeX (Overleaf, `hwTemplateML.tex`) would only help with float placement, and composite matplotlib figures remove that need. Switch to LaTeX only if the table cannot fit two pages in Word.
**Lessons carried from HW1** (Work log of [[20_Progress/Degree/CSCI 4521/Homework/Homework - 1|Homework - 1]]): the first AI-built version was replaced because it used hidden helper pipelines, plots nobody could trace and a report unlike the sample. This time: explicit NumPy loops in lecture style, every plot visible in the notebook, fixed seed, page count checked before polishing, and the environment settled before coding (the conda env `csci-4521` does not exist on this laptop, so Colab or `conda env create -f environment.yml`).
### Notebook design
Build in the supplied `[REDACTED].ipynb`, after the starter cells, with one `BUNDLE_DIR` variable so the personalized data drops in without code changes. Seed `np.random.default_rng(4521)`.
- Cell group 1, scales (rubric 4): per-sensor mean, std, min, max on fit rows, std ratio between the largest and smallest sensor, and each sensor's share of mean squared distance in raw space. Expected finding to verify, not assume: one or two large-scale sensors dominate raw distance.
- Cell group 2, NumPy core: `zscore_fit/apply` (guard std of 0), `assign(X, C)` by broadcasting squared Euclidean distance, `update(X, labels, C)` centroid means, `kmeans(X, k=3, n_init=10, max_iter=300)` with k-means++ start, stop on no label change, keep the lowest inertia, count empty-cluster events, `knn(Xtr, ytr, X, k)` with ties broken by the nearest neighbor.
- Cell group 3, cluster naming: count calibration-training labels per cluster (contingency table), name each cluster by majority, require one-to-one names, otherwise take the best of the 6 permutations using training labels only. Show the table in the notebook and a purity line in the report.
- Cell group 4, PCA (rubric 15): sklearn PCA fitted on fit rows, raw and standardized. Smallest m with cumulative ratio at least 0.95 for both, curve with a 95% line, PC1 versus PC2 (fit rows gray, calibration-training points colored by terrain, so no validation label is plotted), static 3D PC1 to PC3 for the PDF, and an interactive Plotly version in the notebook as in lecture 2.4. Report the 95% count for the standardized data as the headline and the raw count beside it.
- Cell group 5, experiments (rubric 25): full grid of scaling (raw, z-score) by representation (8 sensors, PCA at 95% components) by model (k-means with 3 clusters, 1-NN), which is 8 configurations and changes one factor at a time. Optional extras if time allows: PCA with 2 components, kNN with k=3 and k=5, an elbow plot of inertia for k=2 to 8 on standardized fit rows to support the 3-cluster choice. Per configuration record dimensions, validation accuracy, macro F1, sand recall and `evaluate_practice` outcome with steps and predicted cost, using predictions for all 784 practice cells from the same fitted pipeline.
- Cell group 6, selection and deployment: rule fixed before running, so it cannot be fitted to the scores: highest validation macro F1, ties broken by higher sand recall, then by fewer dimensions. Practice outcome is recorded, not used to select. Keep the selected fitted objects (mean, std, PCA, centroids, names or training set), predict mission by transform then predict only, check mission z-scores against the fit statistics as a shift diagnostic, draw the predicted mission map, save `submission.csv`, save `practice_run.html` and a static route figure.
- Figures saved to `Code\Homework\figures\`: `fig1_pca.png` (variance curves, PC1 versus PC2, optionally PC1 to PC3) and `fig2_deploy.png` (practice map with route, mission map).
### 30-minute plan
The clock starts after the dataset is in place and the notebook is built. Three of these steps are blockers for starting and are not on the clock.
- Before the clock: confirm the Gradescope due date, confirm the AI-use level, get the personalized dataset.
- 0 to 3 min: open the notebook, point `BUNDLE_DIR` at the personalized folder, check the printed shapes (fit 754 if the grid is 28x28, 60 training, 30 validation).
- 3 to 10 min: Restart and Run All. Fix any error before reading numbers. Confirm the 8-row table is complete and the selection rule picked a row.
- 10 to 14 min: copy the numbers into the report draft below. Cross-check each against the notebook output, never from memory.
- 14 to 24 min: Word. Paste Special as unformatted text, set the page, insert the two figures, build the table, check two pages. Export PDF and reopen it.
- 24 to 30 min: upload notebook (with outputs), PDF, `submission.csv`, practice HTML or PNG. Record the timestamp under `### Submission`.
### Report draft (fill every bracket from notebook output, nothing from memory)
HW 2: Rover Rescue
Anant Gupta
October 2026
1. Question and configurations. How much do scaling and PCA change a terrain map built from eight sensors, and does a cluster-based classifier trained with 60 labels match 1-NN? I compared [n] configurations: scaling (raw or z-score), representation (8 sensors or PCA with [m] components), and model (k-means with 3 clusters named from calibration labels, or 1-NN). Each changes one factor from another, so differences can be attributed.
2. Evaluation protocol. Normalization, PCA and k-means were fitted on the [754] fit rows (all practice rows except the 30 validation rows, no labels used). The 60 calibration-training labels named the clusters and trained 1-NN. The same 30 validation rows scored every configuration. I selected the deployed model on these 30 rows, so its score is a selection score, not an untouched test score. The practice rover run only demonstrates deployment. The mission data was transformed with the stored mean, standard deviation and PCA and then predicted, never fitted on.
3. Evidence. Sensor scales differ by [ratio] (sensor [a] std [x], sensor [b] std [y]) and sensor [a] supplies [p]% of raw squared distance, so raw distances mostly measure one sensor. PCA needs [m_std] components for 95% of the variance after z-scoring and [m_raw] on raw data (Figure 1a). Figure 1b shows [observation about class structure in PC1 and PC2]. Table 1 lists all configurations. [Two or three sentences: effect of scaling holding the rest fixed, effect of PCA holding the rest fixed, cluster versus 1-NN holding the rest fixed. Report ties as ties. With 30 validation rows one error is 3.3 points.]
Table 1: dimensions, validation accuracy, macro F1, sand recall and practice outcome for each configuration.
4. Decision and sand risk. I deployed [config] because [rule result]. [Number] of [number] validation sand cells were missed. A missed sand cell is predicted firm or rough, so the planner treats it as passable and the rover is stuck the first time its route crosses it, while a false sand prediction only adds a detour. [Practice outcome with steps and predicted cost, Figure 2.]
5. Failure and limitation. [One real observation from the run: a stuck cell and which sensor values it had, a tie, a cluster that mapped to two terrains, or mission sensor statistics that differ from the fit rows by [x] standard deviations.] Possible explanation, labeled as such: [...]. The 30-row validation set limits how finely models can be ranked.
AI use: [Claude Code (Anthropic) and the course repo's starter helped with the code and the draft. Fill in the actual tools used.] I ran the notebook, checked every number, and am responsible for this work.
### Word assembly
Same flow as HW1 (Times New Roman 12 pt, Letter, 1 inch margins) but check the page count first. If it spills past two pages, shrink Figure 1 and Figure 2 widths, then margins to 0.8 inch, then 11 pt, in that order. Copy the draft from source mode, Paste Special as unformatted text, bold the section titles, center the three title lines, build Table 1 as a real Word table at 9 to 10 pt.
### Blockers
> [!WARNING]
> Three facts only the user can confirm: the due date on Gradescope, the AI-use level for this assignment, and where the personalized dataset lives. Nothing should be built into the final submission until the dataset is found.

### Submission
Not submitted yet.
## Concepts used
Planned, not yet used. Roles are what each will do in this homework.
- [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 12|ISL Chapter 12]]: PCA (§12.2) gives the 95% component count and the variance curve, k-means (§12.4) gives the local-optimum and multiple-start argument.
- [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]]: kNN and the bias-variance trade-off, used to explain 1-NN on raw versus reduced features.
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 5|Week - 5]] and [[20_Progress/Degree/CSCI 4521/Weekly/Week - 6|Week - 6]]: PCA with kNN, the leakage rule, k-means initialization and stopping choices.
- [[20_Progress/Degree/CSCI 4521/Homework/Homework - 1|Homework - 1]]: z-score from training statistics, precision, recall and F1 definitions, and the report format.
## Post-submit reflection
<!-- Optional until feedback: the first failure, the pattern, and what to change. -->

```
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/Jarvis"; echo "dashes:"; grep -nP "\x{2014}|\x{2013}" "20_Progress/Degree/CSCI 4521/Homework/Homework - 2.md" | head; echo "(none above = clean)"; echo; echo "calibration balance:"; tail -n +2 "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/1b6f8eac-44d0-4860-b243-88b063adb7c7/scratchpad/repo/2026/homework-2/rover-rescue/demo_data/calibration.csv" | cut -d, -f3 | sort | uniq -c; echo; echo "conda envs:"; ls -la /c/Users/anant/miniconda3/envs 2>&1 | head -5; ls /c/Users/anant/.conda 2>&1 | head -3; echo; echo "lint:"; cd 30_Order/System/vault-lint && node vault-lint.js --path "20_Progress/Degree/CSCI 4521/Homework/" 2>&1 | head -30`
```
dashes:
grep: character value in \x{} or \o{} is too large
(none above = clean)

calibration balance:
     30 firm
     30 rough
     30 sand

conda envs:
total 24
drwxr-xr-x 1 anant 197609 0 Sep 26 14:16 .
drwxr-xr-x 1 anant 197609 0 Sep 21 14:09 ..
-rw-r--r-- 1 anant 197609 0 Sep 26 14:16 .conda_envs_dir_test
aau_token
aau_token_host
environments.txt

lint:
Scanned 2 notes in scope (excluded: 1 out of scope, 1468 tier 4, 78 templates). Specs: 76. Vocabulary parsed: true
FIT: 1/2 = 50.0%

By tier:
  tier 1: 1/2 = 50.0%

By family (fit / total, near-fit, failing checks):
  course-homework                  1/2      50.0%  near    0  F1:1 F2:1 F5:1 F6:1

Top failure reasons:
      1  6:legacy-shape
      1  1:status-off-vocab
      1  1:missing-key
      1  1:hash-in-tags
      1  2:missing-heading
      1  5:extra-blank-lines
```
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/vault-lint"; node vault-lint.js --path "20_Progress/Degree/CSCI 4521/Homework/" --list 5 2>&1 | tail -15; echo ---dash check; LC_ALL=C grep -nP "\xE2\x80[\x93\x94]" "../../../20_Progress/Degree/CSCI 4521/Homework/Homework - 2.md" | head -5; echo "(end)"; echo ---blank lines; awk 'prev=="" && $0=="" {print NR": double blank"} {prev=$0}' "../../../20_Progress/Degree/CSCI 4521/Homework/Homework - 2.md"; grep -n -B1 -A1 '^$' "../../../20_Progress/Degree/CSCI 4521/Homework/Homework - 2.md" | head -12`
```
  tier 1: 1/2 = 50.0%

By family (fit / total, near-fit, failing checks):
  course-homework                  1/2      50.0%  near    0  F1:1 F2:1 F5:1 F6:1

Top failure reasons:
      1  6:legacy-shape
      1  1:status-off-vocab
      1  1:missing-key
      1  1:hash-in-tags
      1  2:missing-heading
      1  5:extra-blank-lines

First 5 failing notes:
  20_Progress/Degree/CSCI 4521/Homework/Homework - 1.md  [course-homework]  6:legacy-shape; 1:status-off-vocab:active; 1:missing-key:class_kind; 1:hash-in-tags; 2:missing-heading:Requirements; 5:extra-blank-lines:15
---dash check
(end)
---blank lines
96-> Three facts only the user can confirm: the due date on Gradescope, the AI-use level for this assignment, and where the personalized dataset lives. Nothing should be built into the final submission until the dataset is found.
97:
98-### Submission
```
- `Bash` -- `mineru server stop 2>&1 | tail -2`
```
Server stopped.
```

## Actions Taken

**Files created:**
- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4521\Homework\Homework - 2.md`

**Files modified:**
_None_

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
- `ls -la "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code" "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code/Homework" "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521" "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Lectures" "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Textbook & Resources" 2>&1 | head -150`
- `mkdir -p "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/1b6f8eac-44d0-4860-b243-88b063adb7c7/scratchpad/hw2" && cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/1b6f8eac-44d0-4860-b243-88b063adb7c7/scratchpad/hw2" && which mineru; mineru --help 2>&1 | head -20`
- `mineru parse --help 2>&1 | head -40`
- `cd /tmp 2>/dev/null; mineru parse "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code/Homework/homework 2.pdf" --pages all --wait 300 2>&1 | head -400`
- `mineru server --help 2>&1 | head -20; mineru parse --help >/dev/null; python --version; python -c "import fitz; print('fitz ok')" 2>&1; python -c "import pypdf; print('pypdf ok')" 2>&1`
- `mineru server start 2>&1 | tail -5; sleep 5; mineru server status 2>&1 | tail -5`
- `mineru parse "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code/Homework/homework 2.pdf" --pages all --wait 300 2>&1 | head -500`
- `mineru parse "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code/Homework/homework 2.pdf" --pages all --tier flash --wait 300 2>&1 | head -600`
- `mineru parse "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code/Homework/HW2.pdf" --pages all --tier flash --wait 300 2>&1 | head -400`
- `mineru parse "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Textbook & Resources/Syllabus - CSCI 4521.pdf" --pages all --tier flash --wait 300 2>&1 | head -400`
- `D="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/1b6f8eac-44d0-4860-b243-88b063adb7c7/scratchpad/repo"; mkdir -p "$D" && git clone --depth 1 https://github.com/be-prado/csci4521.git "$D" 2>&1 | tail -3; ls -R "$D/2026/homework-2" 2>&1 | head -50`
- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/1b6f8eac-44d0-4860-b243-88b063adb7c7/scratchpad/repo/2026/homework-2/rover-rescue"; cat requirements.txt config 2>/dev/null; cat demo_data/config.json | head -40; diff <(cat assignment_student.md) /dev/null | wc -l; head -3 demo_data/*.csv`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis"; ls; echo ---; ls -R "20_Progress/Degree/CSCI 4521" 2>&1 | head -80`
- `cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521"; ls -R Lectures | head -80; echo ---; ls -R Code/Lectures | head -60; echo ---; cat Code/environment.yml; echo ---; cat Code/Homework/README.md; echo; ls Code/Homework/figures`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis"; ls "30_Order/Workflows/Courses/Per Class/" | head; echo ---; cat "30_Order/Workflows/Courses/Per Class/CSCI 4521 Workflow.md"; echo ---; ls 30_Order/Standards | head -60; ls 30_Order/Templates | head -60`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis/30_Order"; find . -iname "*Homework*" | head; `
- `cd "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code/Lectures"; ls -la "Week 6 - 10" "Weeks 1 - 5" | awk '{print $5, $9, $10, $11, $12}'; echo; cd "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 4521/Weekly"; wc -c *.md; ls /c/Users/anant/miniconda3 /c/Users/anant/anaconda3 /c/ProgramData/miniconda3 /c/Users/anant/miniforge3 2>&1 | head -5; ls /c/Users/anant/AppData/Local/miniconda3 2>&1 | head -3; where python py conda 2>&1 | head`
- `ls /c/Users/anant/miniconda3/envs/ 2>&1; ls /c/Users/anant/miniconda3/envs/csci-4521/python.exe 2>&1; /c/Users/anant/miniconda3/envs/csci-4521/python.exe -c "import numpy,pandas,sklearn,matplotlib,seaborn;print(numpy.__version__,pandas.__version__,sklearn.__version__,matplotlib.__version__)" 2>&1 | tail -2`
- `ls -la /c/Users/anant/miniconda3 | head -20; ls /c/Users/anant/.conda/envs 2>&1 | head; find /c/Users/anant /d/_Anant -maxdepth 4 -name "python.exe" -not -path "*/WindowsApps/*" 2>/dev/null | head`
- `PY=/c/Users/anant/miniconda3/python.exe; $PY -c "import numpy,pandas,sklearn,matplotlib;print('ok')" 2>&1 | tail -1; cat > "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/1b6f8eac-44d0-4860-b243-88b063adb7c7/scratchpad/hw2/src.py" <<'EOF'
import json,sys
nb=json.load(open(sys.argv[1],encoding='utf-8'))
for i,c in enumerate(nb['cells']):
    s=''.join(c['source'])
    if s.strip(): print(f"--- [{c['cell_type']}] {i}\n{s}")
EOF
$PY -I "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/1b6f8eac-44d0-4860-b243-88b063adb7c7/scratchpad/hw2/src.py" "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code/Lectures/Week 6 - 10/2.3 k-means clustering - completed.ipynb" | head -300`
- `PY=/c/Users/anant/miniconda3/python.exe; S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/1b6f8eac-44d0-4860-b243-88b063adb7c7/scratchpad/hw2/src.py"; L="D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code/Lectures/Weeks 1 - 5"; $PY -I $S "$L/2.4 PCA on iris data.ipynb"; echo "=========== newsgroups"; $PY -I $S "$L/2.4 PCA on newsgroups.ipynb"`
- `PY=/c/Users/anant/miniconda3/python.exe; S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/1b6f8eac-44d0-4860-b243-88b063adb7c7/scratchpad/hw2/src.py"; L="D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code/Lectures/Weeks 1 - 5"; $PY -I $S "$L/1.1 Nearest Neighbor Classifier.ipynb" | head -220`
- `mineru parse "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Lectures/Week - 6/2.3 unsupervised learning, k-means clustering.pptx.pdf" --pages all --tier flash --wait 300 2>&1 | grep -v "^$" | grep -v "Image block" | head -250`
- `mineru parse "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Lectures/Week - 3/1.4 generalization, confusion matrix, accuracy, precision, recall, f1 score .pptx.pdf" --pages all --tier flash --wait 300 2>&1 | grep -v "^$" | grep -v "Image block" | head -200`
- `mineru parse "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Lectures/Week - 5/2.4 pca.pptx.pdf" --pages all --tier flash --wait 300 2>&1 | grep -v "^$" | grep -v "Image block" | head -200`
- `mineru parse "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Lectures/Week - 6/2.3 unsupervised learning, k-means clustering.pptx.pdf" --pages 24-26 --tier flash --wait 300 2>&1 | grep -v "^$" | grep -v "Image block"; echo =========PCA; mineru parse "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Lectures/Week - 5/2.4 pca.pptx.pdf" --pages 16-30 --tier flash --wait 300 2>&1 | grep -v "^$" | grep -v "Image block"; echo ======1.4; mineru parse "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Lectures/Week - 3/1.4 generalization, confusion matrix, accuracy, precision, recall, f1 score .pptx.pdf" --pages 16-21 --tier flash --wait 300 2>&1 | grep -v "^$" | grep -v "Image block"`
- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/1b6f8eac-44d0-4860-b243-88b063adb7c7/scratchpad/hw2" && /c/Users/anant/miniconda3/python.exe -m venv venv 2>&1 | tail -2; ./venv/Scripts/python.exe -m pip install -q pymupdf 2>&1 | tail -3; ./venv/Scripts/python.exe -c "import fitz;print(fitz.__doc__)" 2>&1 | tail -2`
- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/1b6f8eac-44d0-4860-b243-88b063adb7c7/scratchpad/hw2" && ./venv/Scripts/python.exe -I -c "
import fitz
d=fitz.open('D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4521/Code/Homework/homework 2.pdf')
for i in (0,3):
    d[i].get_pixmap(dpi=80).save(f'hw2_p{i+1}.png')
print(len(d))
"; ls`
- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/1b6f8eac-44d0-4860-b243-88b063adb7c7/scratchpad/repo"; git log --format='%h %ad %s' --date=short -- 2026/homework-2 | head; ls 2026 | head -20`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 4521/Weekly"; sed -n 55,58p "Week - 6.md" | cut -c1-900; echo ----; sed -n 20,24p "Week - 7.md" | cut -c1-700; echo ----; sed -n 39p "Week - 7.md" | cut -c1-1500`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis"; f=$(find . -name "Jarvis Writing and Formatting.md" -not -path "./50_Archive/*" | head -1); echo "$f"; sed -n 1,80p "$f" | cut -c1-400; echo ======; g=$(find . -name "Vault Lint.md" -not -path "./50_Archive/*" | head -1); echo "$g"; sed -n 1,40p "$g" | cut -c1-300`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 4521/Textbook"; head -12 "ISL/Chapter - 12.md" | cut -c1-300; grep -n "^## \|^### " "ISL/Chapter - 12.md" | head -30; echo ----; grep -n "^## \|^### " "ISL/Chapter - 2.md" | head -20; echo; head -12 "../Weekly/Week - 5.md" | cut -c1-200`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis"; echo "dashes:"; grep -nP "\x{2014}|\x{2013}" "20_Progress/Degree/CSCI 4521/Homework/Homework - 2.md" | head; echo "(none above = clean)"; echo; echo "calibration balance:"; tail -n +2 "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/1b6f8eac-44d0-4860-b243-88b063adb7c7/scratchpad/repo/2026/homework-2/rover-rescue/demo_data/calibration.csv" | cut -d, -f3 | sort | uniq -c; echo; echo "conda envs:"; ls -la /c/Users/anant/miniconda3/envs 2>&1 | head -5; ls /c/Users/anant/.conda 2>&1 | head -3; echo; echo "lint:"; cd 30_Order/System/vault-lint && node vault-lint.js --path "20_Progress/Degree/CSCI 4521/Homework/" 2>&1 | head -30`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/vault-lint"; node vault-lint.js --path "20_Progress/Degree/CSCI 4521/Homework/" --list 5 2>&1 | tail -15; echo ---dash check; LC_ALL=C grep -nP "\xE2\x80[\x93\x94]" "../../../20_Progress/Degree/CSCI 4521/Homework/Homework - 2.md" | head -5; echo "(end)"; echo ---blank lines; awk 'prev=="" && $0=="" {print NR": double blank"} {prev=$0}' "../../../20_Progress/Degree/CSCI 4521/Homework/Homework - 2.md"; grep -n -B1 -A1 '^$' "../../../20_Progress/Degree/CSCI 4521/Homework/Homework - 2.md" | head -12`
- `mineru server stop 2>&1 | tail -2`


