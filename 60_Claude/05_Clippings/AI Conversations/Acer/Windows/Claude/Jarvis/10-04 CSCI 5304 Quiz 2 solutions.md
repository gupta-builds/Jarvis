---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "CSCI 5304 Quiz 2 solutions"
started_at: 2026-10-04T21:29:16
ended_at: 2026-10-04T23:32:34
exported_at: 2026-10-28T16:15:33
duration_minutes: 123.3
project: Jarvis
cwd: 'D:\_Anant\20_Progress\Documents\Jarvis'
session_id: 8bf27b5a-9ce2-4fb5-8856-d9eb75e5b4ec
status: seed
review_state: raw
created: 2026-10-04
updated: 2026-10-28
turn_count: 4
tools_used:
  AskUserQuestion: 1
  Bash: 9
  Grep: 8
  Read: 6
tokens:
  input: 34
  output: 12793
  cache_creation: 99910
  cache_read: 1773087
  total: 1885824
cost_usd: 0.882255
model:
  - "claude-sonnet-5"
files_touched:
  - "D:\\_Anant\\10_Areas\\UMN\\Classes\\CSCI\\CSCI 5304\\Midterm\\Quiz - 2.pdf"
  - "D:\\_Anant\\10_Areas\\UMN\\Classes\\CSCI\\CSCI 5304\\Textbook & Resources\\CSCI 5304 Syllabus.pdf"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 5304\\Preparation.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 5304\\Quiz\\Quiz - 2.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 5304\\Textbook\\Lecture - 4.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\Degree\\CSCI 5304\\Weekly\\Week - 4.md"
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# CSCI 5304 Quiz 2 solutions

## You

<local-command-caveat>The command below was run directly in Claude Code, not sent to you as a request, and its output goes straight to the user. It's recorded here as context for later messages.</local-command-caveat>

## You

<command-name>/clear</command-name>
            <command-message>clear</command-message>
            <command-args></command-args>

## You

`20_Progress/Degree/CSCI 5304/Quiz/Quiz - 2` is going to be laid out correctly for the course CSCI 5304. Go through this pdf: "D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Midterm\Quiz - 2.pdf". To solve everything mentioned inside the quiz. I need you to look through the notes created, textbooka nd the lecture transcripts in detail. Make no mistakes answering the questions and write them out inside the quiz - 2 note correctly. I want the note to be written out and to be interconneted to the week - 4 note. Let's do this task correctly. something to note about this is that this is a print out on my hand right now and i will be writing the solution on the paper and keep it for future reference. So,, make sure to go through the quiz and write solutions in a manner that i can easily write the answer in the space handwritten. Do the task correctly, only rely on the material inside the course. Do not rely on training data, or any other content outside. Solely, rely on the content that already exists and answer the questions correctly like the professor would.

## Claude

I'll start by exploring the CSCI 5304 course structure to find the quiz note, week-4 note, textbook, and lecture transcripts before handing this off.

I pulled up the actual quiz PDF and the course's own policy documents before writing anything, and I need to stop here instead of filling in the answers.

The syllabus for CSCI 5304 (`CSCI 5304 Syllabus.pdf`, p.4, "Academic Dishonesty and usage of AI") states directly:

> "usage of AI and LLM tools in any way is not allowed in this class. If you are caught using AI, you will be given a 0 on the assignment."

And under Scholastic Dishonesty (p.3): "Cheating on assignments or examinations" and "Unauthorized use of online learning support and testing platforms... This includes any AI coding tools or generative AI tools" are both listed as reportable offenses.

Your own vault already flagged this. `Preparation.md` for this course says explicitly: "Zero-AI-tools policy, stated twice, with real teeth — a 0 on the assignment for a first offense... This is understanding-only territory for AI help, not homework-code or quiz-prep-answer territory." The `CSCI 5304 Board.md` note repeats the same warning.

Quiz 2 is a graded quiz (10 pts, worth part of the 30% quiz average) that you're going to hand-copy onto a physical sheet and submit. Having me solve it and write out the answers for transcription is exactly the "quiz-prep-answer" use your own notes already identified as off-limits — not a gray area. So I'm not going to write solutions into the `Quiz - 2` note.

What I can do instead, fully within the policy:

Understood — I won't touch the Quiz-2 note or the quiz content at all.

For your own review, the relevant material to revisit is:
- **Part (a)/(b)** (unitary/orthogonal equivalence and singular values): `20_Progress/Degree/CSCI 5304/Textbook/Lecture - 4.md`, especially Theorem 4.1 ("singular values are always unique"), and `Lecture - 2 & 3.md` for the unitary/orthogonal matrix definition and Theorem 3.1 (unitary invariance of the 2-norm).
- **Part (c)** (computing the SVD of a small matrix via a permutation matrix, without forming $A^TA$ or eigenvalues): the professor worked through exactly this trick live — see `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Lecture\Transcripts\Week 4 - 8\en-CSCI 5304 September 29 Lecture (multi-source).txt`, the passage on inserting permutation matrices (they're orthogonal) to reorder a diagonal/obvious factorization into the correct $\Sigma$.

No vault files were changed.

### Tool Calls

- `Bash`
```bash
find "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304" -type f | head -100
```
```
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Concepts/Definitions.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Concepts/Weekly Board.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/CSCI 5304 Board.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Preparation.md
D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/Quiz/Quiz - 2.md
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
- `Bash`
```bash
find "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304" -type f | head -200
```
```
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
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/anyio-4.12.1-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/aom-3.13.2-h8ecca34_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/argon2-cffi-25.1.0-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/argon2-cffi-bindings-25.1.0-py312h02ab6af_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/asttokens-3.0.1-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/async-lru-2.3.0-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/attrs-26.1.0-py312h35db113_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/babel-2.18.0-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/beautifulsoup4-4.15.0-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/blas-1.0-mkl.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/bleach-6.4.0-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/brotlicffi-1.2.0.1-py312hd7fb8db_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/bzip2-1.0.8-h2bbff1b_6.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/ca-certificates-2026.8.13-haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/cairo-1.18.4-he9e932c_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/certifi-2026.7.22-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/cffi-2.1.1-py312h1c6eee0_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/charset-normalizer-3.4.7-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/colorama-0.4.6-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/comm-0.2.3-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/conpty-1.23.20211.0-h169ad4e_2.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/contourpy-1.3.3-py312h214f63a_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/created_at
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/cycler-0.12.1-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/dav1d-1.5.3-h4375697_1.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/debugpy-1.8.21-py312hd7fb8db_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/decorator-5.3.1-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/defusedxml-0.7.1-pyhd3eb1b0_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/et_xmlfile-2.0.0-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/executing-2.2.1-py312haa95532_1.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/expat-2.8.4-hd7fb8db_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/fontconfig-2.15.0-hd211d86_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/fonttools-4.63.0-py312h1c6eee0_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/freeglut-3.8.0-hfcef157_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/freetype-2.14.1-hfbffc0b_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/gmp-6.3.0-he664a35_1.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/gmpy2-2.3.1-py312h922e254_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/graphite2-1.3.15-h781baf4_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/h11-0.16.0-py312haa95532_1.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/harfbuzz-12.3.0-h807c389_2.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/history
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/httpcore-1.0.9-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/httpx-0.28.1-py312haa95532_1.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/icu-78.3-ha03e165_1.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/idna-3.18-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/intel-openmp-2025.0.0-haa95532_1165.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/ipykernel-7.3.0-py312h4442805_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/ipython-9.15.0-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/[REDACTED].1.1-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/jedi-0.20.0-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/jinja2-3.1.6-py312haa95532_1.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/joblib-1.5.3-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/json5-0.15.0-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/jsonschema-4.26.0-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/[REDACTED].9.1-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/jupyter-lsp-2.3.0-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/jupyterlab-4.5.9-py312haa95532_1.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/jupyterlab_pygments-0.3.0-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/jupyterlab_server-2.28.0-py312haa95532_1.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/jupyter_client-8.10.0-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/jupyter_core-5.9.1-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/jupyter_events-0.12.1-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/jupyter_server-2.20.0-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/[REDACTED].5.4-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/kiwisolver-1.5.0-py312hd7fb8db_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/lcms2-2.19.1-h5da84a9_1.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/lerc-4.1.0-hd7fb8db_2.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/libavif-1.3.0-h87e066f_1.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/libdeflate-1.22-h5bf469e_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/libexpat-2.8.4-hd7fb8db_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/libffi-3.4.8-h42d73b9_3.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/libglib-2.88.3-h71fae0a_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/libhwloc-2.12.1-default_hfa10c62_1000.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/libiconv-1.18-hc89ec93_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/libjpeg-turbo-3.1.3-h02ab6af_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/libkrb5-1.22.2-h3d06f0e_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/libopenjpeg-2.5.4-h1c6eee0_2.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/libpng-1.6.56-h2854ad3_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/libpq-18.4-h7c26194_1.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/libsodium-1.0.21-h3c3880a_1.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/libtiff-4.7.2-h37aaaa1_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/libwebp-base-1.6.0-hbf3958f_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/libxml2-2.13.9-h6201b9f_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/libzlib-1.3.2-h1c6eee0_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/lz4-c-1.9.4-h1c6eee0_5.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/markupsafe-3.0.3-py312h1c6eee0_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/matplotlib-3.11.0-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/matplotlib-base-3.11.0-py312h330ff07_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/matplotlib-inline-0.2.2-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/mistune-3.3.3-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/mkl-2025.0.0-h585ebfc_931.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/mkl-service-2.7.2-py312h1b35211_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/mkl_fft-2.2.0-py312h18b77b3_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/mkl_random-1.4.1-py312hf6ff4c0_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/mpc-1.3.1-h827c3e9_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/mpfr-4.2.1-h56c3642_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/mpmath-1.3.0-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/mysql-common-9.7.0-h0b12ad4_1.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/mysql-libs-9.7.0-h08a8c37_1.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/narwhals-2.23.0-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/nbclient-0.11.0-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/nbconvert-core-7.17.1-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/nbformat-5.11.0-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/nest-asyncio2-1.7.2-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/notebook-7.5.7-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/notebook-shim-0.2.4-py312haa95532_1.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/numpy-2.5.2-py312h9606935_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/numpy-base-2.5.2-py312h89dd80d_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/openpyxl-3.1.5-py312h827c3e9_1.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/openssl-3.5.8-hbb43b14_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/packaging-26.3-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/pandas-3.0.5-py312hf6ff4c0_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/pandocfilters-1.5.1-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/parso-0.8.7-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/pcre2-10.46-h5740b90_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/pillow-12.3.0-py312hbb6c998_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/pip-26.2.1-pyhc872135_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/pixman-0.46.4-h0701eb8_1.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/platformdirs-4.11.0-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/prometheus_client-0.24.1-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/prompt-toolkit-3.0.53-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/prompt_toolkit-3.0.53-hd3eb1b0_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/psutil-7.2.2-py312h1c6eee0_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/pure_eval-0.2.3-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/pycparser-3.0-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/pygments-2.20.0-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/pyparsing-3.3.2-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/pyqt-6.11.0-py312hd742356_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/pyqt6-sip-13.11.1-py312h630b2a1_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/pysocks-1.7.1-py312haa95532_1.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/python-3.12.14-hd7b1df3_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/python-dateutil-2.9.0post0-py312haa95532_2.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/python-fastjsonschema-2.22.1-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/python-json-logger-4.1.0-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/python-tzdata-2026.3-pyhd3eb1b0_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/[REDACTED].json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/pywinpty-3.0.2-py312hbe95b07_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/pyyaml-6.0.3-py312hb9a58be_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/pyzmq-27.1.0-py312h7149c55_1.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/qtbase-6.11.0-h6af2ed4_4.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/qtdeclarative-6.11.0-hcb633d5_1.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/qtsvg-6.11.0-hf3e933c_1.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/qttools-6.11.0-had87466_1.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/qtwebchannel-6.11.0-h5895b07_1.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/qtwebsockets-6.11.0-he7f7b8d_1.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/referencing-0.37.0-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/requests-2.34.2-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/rfc3339-validator-0.1.4-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/rfc3986-validator-0.1.1-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/rpds-py-0.28.0-py312h114bc41_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/scikit-learn-1.9.0-py312h6c0dd63_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/scipy-1.18.0-py312h97a0a95_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/seaborn-0.13.2-py312haa95532_3.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/send2trash-1.8.3-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/setuptools-83.0.0-py312haa95532_0.json
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.conda/csci-5304/conda-meta/sip-6.15.1-py312h9561cc3_0.json
```
- `Bash`
```bash
find "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304" -maxdepth 3 -type d -not -path "*/.conda*"
```
```
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.firecrawl
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/.vscode
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Homework
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Lecture
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Lecture/Transcripts
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Lecture/Transcripts/Week 2 & 3
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Lecture/Transcripts/Week 4 - 8
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Lecture/Week - 1
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Lecture/Week - 2
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Lecture/Week - 3
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Midterm
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Textbook & Resources
```
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 5304\Quiz\Quiz - 2.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 5304\Weekly\Week - 4.md`
- `Read` -- `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Midterm\Quiz - 2.pdf`
- `Bash`
```bash
find "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Lecture/Transcripts/Week 4 - 8" -type f; echo "---"; find "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Textbook & Resources" -type f; echo "---"; find "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Midterm" -type f
```
```
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Lecture/Transcripts/Week 4 - 8/en-CSCI 5304 October 1 Lecture (multi-source).txt
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Lecture/Transcripts/Week 4 - 8/en-CSCI 5304 September 29 Lecture (multi-source).txt
---
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Textbook & Resources/CSCI 5304 Syllabus Schedule.pdf
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Textbook & Resources/CSCI 5304 Syllabus.pdf
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Textbook & Resources/CSCI 5304 Textbook (MinerU full extraction).md
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Textbook & Resources/CSCI 5304 Textbook.pdf
---
D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Midterm/Quiz - 2.pdf
```
- `Grep` -- pattern `unitarily equivalent|Exercise 4.4|singular values are the same|SVD.*unique|uniqueness.*singular|Theorem 4\.` path `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Textbook & Resources\CSCI 5304 Textbook (MinerU full extraction).md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 5304\Textbook\Lecture - 4.md`
- `Grep` -- pattern `Theorem 3\.1|unitarily invariant|unitary invariance|orthogonal matrix|real.*unitary` path `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 5304\Textbook\Lecture - 2 & 3.md`
- `Grep` -- pattern `unitarily equivalent|same singular values|orthogonal matrix|permutation matrix|exercise 4\.4|Quiz 2|Quiz #2` path `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Lecture\Transcripts\Week 4 - 8`
- `Grep` -- pattern `Theorem 3\.1|unitarily invariant|unitary invariance|orthogonal matrix|real.*unitary` path `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 5304\Textbook\Lecture - 2 & 3.md`
- `Grep` -- pattern `unitarily equivalent|same singular values|orthogonal matrix|permutation matrix|exercise 4\.4|Quiz 2|Quiz #2` path `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Lecture\Transcripts\Week 4 - 8\en-CSCI 5304 September 29 Lecture (multi-source).txt`
- `Bash`
```bash
awk 'NR>=500 && NR<=560' "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Lecture/Transcripts/Week 4 - 8/en-CSCI 5304 September 29 Lecture (multi-source).txt"
```
```
scalar to scale the U's right and then the next
one there's this scalar which we have in in our
object this is an inner product we compute which
we have the v in our in our object so we just
compute that scalar multiply by this scalar use that
scalar to scale the third vector u3 and so in
this way the computation down here is something
like a linear combination of three columns, not n columns, three columns.
And we had to compute one, two, three scalars. Yes. And plus three inner
products. That's what it costs. Another way to think about this is like N, M inner products, right? Because you
have to take the X and inner product with
each of the rows of A. Here, we only have to
do three inner products. Three inner products and
a linear combination of three things. Again, just
six things compared to a thousand things, right?
And we can control that number three, and we can
choose that based on our memory usage. And we have
an understanding of when we do this of how much
error will have occurred. Okay, anyways, there's
the whole picture of low rank and how it gets used
and how it's an advantageous thing. And so when you
hear people talking about low rank methods
or compressed methods or compressed schemes or
limited memory schemes in any world that you're ever in,
this is what they mean. This is theoretically the
best thing you can do. And that's why people
use PCA like a big heavy hammer in computer
science, because it gives you the best
composite features. Also, you can understand
that they're composite features in a sense
that to compute the U's, you would have to
multiply by these V's. To compute U, you'd have
to do A V sigma inverse, right? And A V gets you a linear combination of the A's. So the U's are linear combinations of
the columns of A. The V's are linear
combinations of the rows of A. In the same
way, if you do UTA, then you get sigma VT, right? So anyways, in this sense,
the U's and the V's are linear combinations of the
rows and columns. And that's why they say in PCA, those
are composite features. Because they're
literally averages of the other features. It's
the best average. Yeah. I'm so sorry. Yes, that we're
always assuming that. Yep, that was an assumption
here from way back. I'm so sorry, I didn't write it here.
But yeah, we always assume this. and it's always fair
to assume that because whatever the ordering is
you could permute it with a permutation matrix here and
here or here or here whichever is appropriate I think here
and here because that'll one will permute the rows
this will permute the columns or maybe I just said
that backwards but inserting the permutation matrices
are unitary so inserting it there to rearrange for
the correct ordering is not a problem in terms of these
two things being unitary which is actually the
trick to computing svds of small matrices if
you can clearly see an orthogonal representation
of the column or row space you can just kind of
insert those permutation matrices to permute it
around scaled versions of what you have and
then you can get the SVD, yeah. But yeah, we always
assume the ordering. And that's what tells
us that this part, sigma 1 more than
```
- `Bash`
```bash
find "D:/_Anant/20_Progress/Documents/Jarvis/30_Order" -iname "*quiz*" -o -iname "*exam*" 2>/dev/null; echo "---templates---"; find "D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates" -maxdepth 2 2>/dev/null
```
```
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Standards/Courses/Exam Standard.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/claude-workflow/claude_desktop_config.read-first.example.json
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Classes/Exam Sheet Template.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Workflows/Courses/Exam Workflow.md
---templates---
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/AI Use
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/AI Use/AI Monthly Review Template.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/AI Use/AI Weekly Review Template.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/AI Use/Clipping Distill Template.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/AI Use/Deep Dive Template.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Capability
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Capability/Action Template.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Capability/Brief Template.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Capability/Depth Ladder Template.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Capability/Field OS Template.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Capability/MOC Template.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Capability/Output Template.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Capability/Question Bank Template.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Capability/Synthesis Template.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Career
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Career/Internship
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Career/List Monthly Log Template.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Career/Plan Template.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Classes
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Classes/Board or Main Template.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Classes/Concept Template.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Classes/Discussion Template.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Classes/Exam Sheet Template.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Classes/Homework Template.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Classes/Lab Template.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Classes/Preparation Template.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Classes/Project Template.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Classes/Textbook Map Template.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Classes/Textbook Template.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Classes/Week Template.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Classes/Weekly Board Template.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Enumerate
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Enumerate/Better Month.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Enumerate/Better Today.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Enumerate/Better Weekly.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Enumerate/Better Year.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Frontmatter
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Frontmatter/For AI.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Frontmatter/For Brainstorm.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Frontmatter/For Classes.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Frontmatter/For Evergreen.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Frontmatter/For Everything.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Frontmatter/For Inputs.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Frontmatter/For Progress.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Frontmatter/For Thoughts.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/Frontmatter/For Transcript.md
D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates/MOC.md
```
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 5304\Preparation.md`
- `Bash`
```bash
grep -n -i -A 15 "academic integrity\|zero-ai\|AI polic\|artificial intelligence" "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/CSCI 5304 Board.md"
```
```
15:==Full syllabus and schedule captured 2026-09-08 from the two PDFs in the source folder - this is now the single place everything about this course lives, per the source-of-truth path below.== This course runs a **zero-AI-tools policy** - stated plainly in the syllabus, not a general disclaimer - so read the Academic Integrity section before using this note, or any AI tool, anywhere near actual homework, quizzes, or exam work.
16-## Source of Truth
17-> [!IMPORTANT] Read before trusting anything about this course
18-> Real source folder:
19-> - `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304`. 
20-> - As of 2026-09-08 it holds: `Syllabus/` (the two PDFs this note is built from), `Lecture/`, `Midterm/`, `Textbook/` (all three currently empty, ready for material as it arrives), `.conda/` (a local conda environment already created), `environment.yml`, and `README.md` (environment setup instructions). 
21-> - This Board note is the readable distillation - not a replacement for checking Canvas directly, especially given the three real date anomalies flagged in the Schedule section below (midterm date, Thanksgiving-week status). Desktop shortcut: `CSCI 5304.lnk` in `D:\_Anant\Inbox\`.
22-## Instructor & Logistics
23-**Dr. Joy Upton-Azzam, PhD** (she/her/hers) - azzam@umn.edu - Lind Hall 300B - office hours Tuesday/Thursday 9:30-11:00 AM. The syllabus does not state the actual class meeting time anywhere in its text - only the day pattern is inferable from the schedule table (Tuesday and Thursday sessions, Wednesday reserved for homework due dates, no regular Wednesday class). Confirm the real meeting time via Canvas or registration records.
24-## Required Materials
25-- **Canvas** (https://canvas.umn.edu/) - course documents and coding examples are maintained there, not in this syllabus.
26-- **Numerical Linear Algebra, Twenty-fifth Anniversary Edition** by Lloyd N. Trefethen & David Bau, III - ISBN-13 978-1611977158 - https://epubs.siam.org/doi/book/10.1137/1.9781611977165. Physical text, required.
27-- **Anaconda** - https://www.anaconda.com/download/success - the Python distribution programming is done in (see Environment Setup below for how this vault's copy is actually configured).
28-## Course Description
29-Background in Linear Algebra: subspaces, ranks, vector and matrix norms. Perturbation theory for linear systems and eigenvalue problems. Solution methods of linear systems and least-squares problems. Matrix factorizations. Computation of eigenvalues/eigenvectors. Singular value decomposition. MATLAB and/or Python/numpy for demonstrating algorithms. Introduction to sparse matrix methods.
30-*Prerequisite:* CSCI 2033 or MATH 2142 or MATH 2243 or MATH 2373 or MATH 4242. [[CSCI 2033 Board|CSCI 2033]] (Fall'25, grade A) satisfies this directly - already done.
```
- `Grep` -- pattern `## Academic Integrity` path `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 5304\CSCI 5304 Board.md`
- `Grep` -- pattern `Academic Integrity` path `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 5304\CSCI 5304 Board.md`
- `Grep` -- pattern `AI tool|artificial intelligence|zero on the assignment|university report|honor|integrity` path `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 5304\CSCI 5304 Board.md`
- `Bash`
```bash
grep -n "^#" "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/CSCI 5304 Board.md"
```
```
14:# CSCI 5304 — Computational Aspects of Matrix Theory
16:## Source of Truth
22:## Instructor & Logistics
24:## Required Materials
28:## Course Description
31:## Course Content & Textbook Structure
33:## Learning Objectives
42:## Grading Breakdown
56:## Conduct & Courtesy
58:## Suggestions for Success
60:## Other University Policies
66:## Weekly Schedule (Definitive Dates)
96:## Environment Setup
106:## Must-Reads / Immediate Next Steps
111:## Weekly Note-Building Workflow (repeatable, set up 2026-09-28; textbook-notebook dependency dropped 2026-10-02)
121:## Resources
126:## Verification Notes
```
- `Bash`
```bash
sed -n '42,66p' "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/CSCI 5304 Board.md"
```
```
## Grading Breakdown
| Component | Weight |
|---|---|
| Attendance & Participation | 10% |
| Homework | 20% |
| Quizzes | 30% |
| Exams (midterm + final) | 40% |

*Scale:* 92-100% A · 90-91% A- · 88-89% B+ · 82-87% B · 80-81% B- · 78-79% C+ · 72-77% C · 70-71% C- · 68-69% D+ · 60-67% D · 0-59% F.
*Attendance & Participation:* consistent attendance required. Daily attendance itself isn't monitored, but participation is judged via in-class discussion, assignments, quizzes, and other activities.
*Late Policy:* unexcused late work gets a zero. For a valid reason known in advance (sports trip, illness), you **must** contact the instructor or TA ahead of the due date to arrange a late submission - after-the-fact excuses aren't described as accepted.
*Quizzes:* every other Thursday in class, per the schedule below - average quiz score is 30% of the grade.
*Homework:* regular written and coding homework from the text, 20% of the grade - selected problem sets go through Gradescope via a Canvas assignment.
*Exams:* one midterm, one final, each worth 20% (40% combined) - covering code, topics, and applications from lecture, homework, coding, and quizzes.
## Conduct & Courtesy
Limit cell phone/laptop use to course tasks. Limit discussion to course business. Arrive on time.
## Suggestions for Success
Listed resources, in the syllabus's own order: classmates, people who've taken the course before, the instructor (office visits or by-appointment), the TAs, the Canvas modules, the authors' own site (https://people.maths.ox.ac.uk/trefethen/), and - since much of this theory was developed in the 1960s-1990s - alternate reference texts covering the same material with different emphasis: Golub & Van Loan's *Matrix Computations*, Wilkinson's *The Algebraic Eigenvalue Problem*, Householder's *The Theory of Matrices in Numerical Analysis*, Higham's *Accuracy and Stability of Numerical Algorithms*, Demmel's *Applied Numerical Linear Algebra*.
## Other University Policies
*Accessibility:* contact the Disability Resource Center (drc@umn.edu, 612-626-1333) to establish accommodations for any physical or academic barrier tied to disability.
*Non-Discrimination:* equal access regardless of race, color, creed, religion, national origin, gender, age, marital status, disability, public assistance status, veteran status, sexual orientation, gender identity, or gender expression.
*Sexual Misconduct / Title IX:* the University prohibits sexual misconduct; report or seek confidential support through the campus Title IX office. Instructors must share information they learn about possible misconduct with that office, though they'll keep it private otherwise where possible.
*Mental Health:* university confidential mental-health services exist for the usual range of student stressors (anxiety, motivation, concentration, relationships) - see the Student Mental Health Website.
*Academic Freedom:* students can take reasoned exception to views offered in the course and reserve judgment on matters of opinion, but remain responsible for learning the enrolled course's actual content.
## Weekly Schedule (Definitive Dates)
```
- `Read` -- `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Textbook & Resources\CSCI 5304 Syllabus.pdf`
- `AskUserQuestion` -- `{"questions":[{"question":"This course has an explicit zero-AI-tools policy that covers quizzes (0 on the assignment, possible university report). How would you like to proceed instead of me solving the quiz?","header":"Integrity scope","multiSelect":false,"options":[{"label":"Teach the underlying concepts only (Recommended)","description":"I\u0027ll walk you through unitary/orthogonal equivalence, why SVD singular values are unique (Theorem 4.1), and the permutation-matrix trick the professor demonstrated live, using your own notes/textbook/transcripts — without touching the specific quiz questions or writing any answer text."},{"label":"Build the Quiz-2 note as a blank, well-linked study scaffold","description":"I\u0027ll lay out the Quiz-2 note structure (linked to Week-4, the relevant theorems, and page refs) with the question prompts and space for YOUR answers, but no solutions — so it\u0027s set up correctly for you to fill in by hand or in-note."},{"label":"Stop entirely, I\u0027ll handle the quiz myself","description":"Don\u0027t touch the Quiz-2 note at all. I\u0027ll just point you to the exact lecture/textbook sections to review."}]}]}`

## Actions Taken

**Files created:**
_None_

**Files modified:**
_None_

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
- `find "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304" -type f | head -100`
- `find "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304" -type f | head -200`
- `find "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304" -maxdepth 3 -type d -not -path "*/.conda*"`
- `find "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Lecture/Transcripts/Week 4 - 8" -type f; echo "---"; find "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Textbook & Resources" -type f; echo "---"; find "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Midterm" -type f`
- `awk 'NR>=500 && NR<=560' "D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 5304/Lecture/Transcripts/Week 4 - 8/en-CSCI 5304 September 29 Lecture (multi-source).txt"`
- `find "D:/_Anant/20_Progress/Documents/Jarvis/30_Order" -iname "*quiz*" -o -iname "*exam*" 2>/dev/null; echo "---templates---"; find "D:/_Anant/20_Progress/Documents/Jarvis/30_Order/Templates" -maxdepth 2 2>/dev/null`
- `grep -n -i -A 15 "academic integrity\|zero-ai\|AI polic\|artificial intelligence" "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/CSCI 5304 Board.md"`
- `grep -n "^#" "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/CSCI 5304 Board.md"`
- `sed -n '42,66p' "D:/_Anant/20_Progress/Documents/Jarvis/20_Progress/Degree/CSCI 5304/CSCI 5304 Board.md"`

