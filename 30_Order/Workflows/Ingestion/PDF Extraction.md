---
type: system
status: sprout
created: 2026-09-29
updated: 2026-10-29
tags:
  - system
  - workflow
system_kind: workflow
serves: "[[PDF Extraction Standard]]"
trigger: A PDF needs its content pulled into the vault before a source summary or textbook note is written.
notes:
  - "[[Source Summary Standard]]"
  - "[[.claude/skills/ingesting-clipping/SKILL|ingesting-clipping]]"
---
# PDF Extraction
Turn a PDF into clean Markdown with real LaTeX and tables using MinerU, and stop once clean text exists. The note itself is written afterward.
## Use when
Any PDF is about to become a summary ([[Source Summary Standard]]) or a course textbook note ([[Textbook Standard]]).
## Steps
1. Run the wrapper, never bare `mineru parse`. It starts the server if it is stopped, waits out the model load, keeps resuming a long parse, and prints a few lines instead of the document.
2. Choose the scope. A whole short document: no option. A chapter of a long book: `-Pages 120-135`, which is much faster than parsing the book. An old scan or dense math: `-Tier advanced`. A clean modern PDF: the default `standard`.
3. If it exits 3 (still parsing), run the same command again. MinerU keeps the work.
4. `Read` the Markdown path it prints, in pieces (`offset`, `limit`). Page markers read `<!-- page N of M -->`; use them for the `Pages:` line and for citations.
5. Spot-check two or three of the hardest pages (a matrix, a multi-line derivation, a table, a figure) with `mineru read` (one page from the cache, no re-parse) and, for a figure, the page image.
6. Hand the Markdown to the note-writing step. Claude reads MinerU's text and never the raw PDF pages.
7. State the tier in the note and name every page, formula, or table that is still wrong.
8. Add `- Extraction: mineru, tier <tier>` to the session-log entry.
```powershell
# 1-3: parse (the Markdown goes to %TEMP%\mineru-out unless -OutFile is given)
powershell -NoProfile -ExecutionPolicy Bypass -File D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/claude-workflow/scripts/mineru-pdf.ps1 "FULL_PATH_TO_PDF" [-Pages 120-135] [-Tier advanced]
# 5: one page and its neighbours from the cache; a page image to read
mineru read "doc:{short_id}/tier:standard/page:{n}" --context 1
mineru read "doc:{short_id}/tier:standard/page:{n}" --format image --output "page-n.png"
# find a term across everything parsed so far
mineru search "terms" --json
```
`{short_id}` is printed by the wrapper. The wrapper's exit codes: 0 done, 1 MinerU error (show the user the text), 2 not a file, 3 still parsing (rerun), 4 `mineru` not installed.
## The guard
A PreToolUse hook, `hooks/jarvis-pdf-guard.ps1`, is registered in `C:\Users\anant\.claude\settings.json` (user level, so every project and every subagent). It denies `Read` on a `.pdf`, and a shell command that runs `pdftotext`, `pdftoppm`, `pdfimages`, `pdftohtml`, `mutool`, or python with `pypdf`, `PyPDF2`, `pdfplumber`, `fitz`, `pymupdf`, `pdfminer` or `extract_pdf.py`. The denial message carries the wrapper command with the PDF path filled in, so the next call is already the right one. Each denial appends a `pdf_guard` line (tool and rule only, no path) to `jarvis-session-activity.jsonl`; the weekly review counts them. The owner can switch it off for one session by starting `claude` with `JARVIS_ALLOW_PDF_READ=1`. It works for Claude Code only; Codex, Cursor and Kiro are covered by the rule in `AGENTS.md`, not by a hook.
## When it fails
| What you see | Meaning | Do |
|---|---|---|
| `server_not_running` (bare `mineru parse`) | The server is stopped. This is what sent earlier sessions to `pdftotext`. | Use the wrapper; it runs `mineru server start` (about 10 s) and retries. |
| `engine_unavailable` | The server is up and the models are still loading. | Wait; the wrapper does. |
| `parse_wait_timeout` or exit 3 | The parse is longer than one wait. | Run the same command again. A 37-slide deck took about 60 s on the Acer; a book takes minutes, so parse a chapter. |
| exit 1, `MINERU ERROR: ...` | MinerU itself failed. | Show the user the text and the log paths in `mineru server status --json`. Do not use another PDF reader. |
| exit 4 | `mineru` is not on PATH. | New machine steps below. |
## Facts about the installed CLI
- Installed with `uv tool`, version 4.0.10 on 2026-10-29. Its commands are `parse`, `read`, `search`, `find`, `list`, `scan`, `watch`, `server`, `config`, `invalidate`, `forget`, `cleanup`. The pages at opendatalab.github.io describe the older 3.x command (`mineru -p input -o output`), which does not exist here; trust `mineru --help`.
- `parse` reads only the first 10 pages unless `--pages` is given. The wrapper always passes `--pages` (default `all`).
- Results are cached by file content. Repeating a parse takes about 1.5 s; `--force` re-parses.
- Its document library also lists `.docx`, `.pptx`, `.xlsx`, `.epub` and `.html` as supported types (`mineru search --help`). Only PDFs were tested here; try the wrapper on course slides before relying on it.
- A parsed file is recorded in the document library (data directory `D:/_Anant/00_Inbox/MinerU`).
- **The server writes a `blobs\` folder into the directory it was started from.** Started inside the vault, it litters the vault: the vault root holds 17 tracked blob files from earlier sessions (2026-09-29 and 2026-10-23), and empty `blobs` folders sit in `20_Progress/Degree/CSCI 4061/Labs` and `20_Progress/Mentorship Program`. The wrapper starts the server from `C:\Users\anant\.mineru`, where `blobs` belongs. If you start it by hand, `cd` there first.
*New machine only:*
```powershell
uv python install 3.12
uv tool install --python 3.12 "mineru>=4.0,<5"
mineru server start
mineru-kit models download --tier standard --vlm-engine llama-cpp
mineru-kit models verify --tier standard
mineru config set parse_server.local.managed_tier standard
mineru config set parse_server.local.mode managed
mineru server restart
```
## Do not
Do not omit `--vlm-engine llama-cpp` on the model download, or managed mode fails on missing GGUF weights. Do not install `mineru[full]` on Windows. There is no fallback reader: no `pdftotext`, no `pypdf`, no `Read` on the PDF. If MinerU fails, report it. Do not run bare `mineru parse` without `--pages`, which silently stops at page 10. Do not run `mineru server start` from inside the vault or a project folder; let the wrapper start it.
## Done when
- The wrapper reported `OK`, and the pages the note needs were parsed (the whole document, or the chapter being written).
- Hard pages were spot-checked and remaining gaps are named.
- The tier is recorded in the note and the log.
