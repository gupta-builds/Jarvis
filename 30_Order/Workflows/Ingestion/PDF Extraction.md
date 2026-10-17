---
type: system
status: sprout
created: 2026-09-29
updated: 2026-10-16
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
1. Check the local server is healthy. A request against an unhealthy server fails with `engine_unavailable`, not a silent bad result.
2. Parse the whole document with `--pages all`. Use `--tier advanced` for an old scan or dense math and the default tier for a clean modern PDF.
3. Spot-check two or three of the hardest pages (a matrix, a multi-line derivation, a table, a figure) against the output. Pull a page image with `mineru read` when comparing.
4. Hand the Markdown to the note-writing step. Claude reads MinerU's text and never the raw PDF pages.
5. State the tier in the note and name every page, formula, or table that is still wrong.
6. Add `- Extraction: mineru, tier <tier>` to the session-log entry.
```powershell
mineru server status --json
mineru parse "FULL_PATH_TO_PDF" --pages all --tier advanced --output "output.md" --json
mineru read "doc:{id}/tier:advanced/page:{n}" --format image --output "page-n.png"
```
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
Do not omit `--vlm-engine llama-cpp` on the model download, or managed mode fails on missing GGUF weights. Do not install `mineru[full]` on Windows. Do not rely on the `pypdf` and `Read` fallback unless `pdftoppm` is present.
## Done when
- The server was confirmed healthy and the full document was parsed.
- Hard pages were spot-checked and remaining gaps are named.
- The tier is recorded in the note and the log.
