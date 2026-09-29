---
type: evergreen
status: sprout
created: 2026-09-29
updated: 2026-09-29
tags:
  - system
  - workflow
notes:
  - "[[PDF Extraction Standard]]"
  - "[[00_Workflows Index]]"
  - "[[.claude/skills/ingesting-clipping/SKILL|ingesting-clipping]]"
next: "Fold this into .claude/skills/ingesting-clipping/reference.md §2 and extract_pdf.py so /ingest-clipping calls mineru directly instead of pypdf/Read"
---
# PDF Extraction
==MinerU is installed globally on this machine as of 2026-09-29 and is the standing default for every PDF ingested anywhere on this laptop, not only inside Jarvis.== This note is the real, verified install record plus the operational steps behind [[PDF Extraction Standard]]. **Scope: PDFs only** — web, video, and GitHub ingestion keep their own separate workflows.

**Use when:** any PDF needs its content pulled into the vault (or anywhere else on the laptop), before a Source Summary or a course textbook note is written from it.

**Moves:** raw PDF → clean Markdown (with real LaTeX formulas and HTML tables) via `mineru parse` → handed to [[30_Order/Standards/Enrich/Source Summary Standard|Source Summary Standard]] (or a course's [[Textbook Template]]) for the actual note write-up. This workflow stops once clean text exists; it does not write the summary itself.

## Install record (verified working, 2026-09-29)
Installed as a global CLI via `uv` (already present on this machine at `C:\Users\anant\.local\bin\uv.exe`), per the official quickstart (`https://opendatalab.github.io/MinerU/quick_start/`) and the repo's own agent-guide README:
```powershell
uv python install 3.12
uv tool install --python 3.12 "mineru>=4.0,<5"
```
This installs 7 global executables (`mineru`, `mineru-kit`, `mineru-api`, `mineru-webui`, etc.) to `~/.local/bin`, on PATH, usable from any shell or project on the machine — not scoped to Jarvis or any one venv.

**Real dead-end hit and resolved, worth keeping so it isn't re-discovered the hard way:** this machine has a genuine NVIDIA GeForce RTX 5070 Ti Laptop GPU (12GB VRAM — Windows' WMI reports a bogus ~4GB due to a known reporting quirk, `nvidia-smi` gives the real number). That qualifies for MinerU's `full` extra (PyTorch + vLLM/lmdeploy, best throughput). Installing `full` plus a CUDA-enabled `torch` build worked, but the resulting `lmdeploy` engine failed at runtime with `ModuleNotFoundError: No module named 'triton'` — official `triton` has no Windows wheels. Installing the community `triton-windows` package fixed the import but then hit a second, deeper incompatibility (`AttributeError: module 'triton' has no attribute 'language'`, a torch/triton version mismatch) during an interrupted reinstall that also corrupted the tool's venv (`uv tool install --force` failed with `Access is denied` while a leftover process still held file locks — fixed by killing the stray `python.exe` process and doing a full `uv tool uninstall mineru` before reinstalling clean). **Resolution: stay on the base package (no `full` extra).** MinerU's default engine (ONNX + llama.cpp, Vulkan-accelerated) already gets real GPU acceleration on this NVIDIA card without needing CUDA/Triton at all, and is the combination the project's own README recommends for "the vast majority of devices" specifically because the CUDA/lmdeploy/vLLM chain is fragile on Windows. Do not re-attempt `mineru[full]` on this machine without a specific throughput reason and time to debug the same chain again.

## One-time setup (per machine)
```powershell
mineru server start
mineru-kit models download --tier standard --vlm-engine llama-cpp
mineru-kit models verify --tier standard
mineru config set parse_server.local.managed_tier standard
mineru config set parse_server.local.mode managed
mineru server restart
```
**The `--vlm-engine llama-cpp` flag on the download step matters** — without it, the download command may fetch the PyTorch-format weights (needed only for the `full`/lmdeploy path) instead of the GGUF-format weights the base engine actually needs, and `config set parse_server.local.mode managed` will then fail with `model files that are not ready ... MinerU2.5-Pro-2605-1.2B-GGUF missing`. Confirm with `mineru server status --json` that `parse_server.local.healthy` is `true` before parsing anything for real.

## Recommended tier for old/scanned academic PDFs
Use `--tier advanced` — it shares `standard`'s model set and dependencies but spends more inference compute, which is the right trade for a document known in advance to be hard (a photographed old textbook, dense matrices). Reserve `--tier standard` for normal, cleaner-scan documents where speed matters more.

## Step 1 — Confirm the server is up
```powershell
mineru server status --json
```
Start it if not (`mineru server start`). Confirm `parse_server.local.healthy: true` before parsing anything for real — a request against an unhealthy local server errors with `engine_unavailable`, not a silent bad result.

## Step 2 — Parse the whole document
```powershell
mineru parse "FULL_PATH_TO_PDF" --pages all --tier advanced --output "output.md" --json
```
- `--pages all` is required for a full-document read — `mineru parse` defaults to the first 10 pages only (an agent-reading default, not a whole-document default).
- `--tier advanced` for anything already known to be a hard scan (old textbook, dense math); `--tier standard` (the default if `--tier` is omitted) is fine for normal-quality modern PDFs.
- `--json` gives structured status/error fields — parse `error.code` programmatically rather than string-matching `error.message`.
- Large documents: MinerU handles the full-document parse in one call; don't manually chunk into page ranges unless a specific page needs re-inspection (`mineru read "doc:{id}/tier:{tier}/page:{n}"`).

## Step 3 — Spot-check before trusting
Before treating the output as ground truth, open it and check the specific hard cases: a real matrix (are the brackets/alignment intact, not glyph soup?), a multi-line derivation, a table, and a page with an embedded figure. Pull a page image directly for visual comparison if needed:
```powershell
mineru read "doc:{id}/tier:advanced/page:{n}" --format image --output "page-n.png"
```

## Step 4 — Write the note
Hand the resulting Markdown to [[30_Order/Standards/Enrich/Source Summary Standard|Source Summary Standard]] (general PDFs, via `/ingest-clipping`) or the course's own [[Textbook Template]] / Notebook prompt pattern (course textbooks, e.g. [[20_Progress/Degree/Repetitive Things|Repetitive Things]]'s Notebook section) — Claude never re-reads the raw PDF pages, only MinerU's clean text/LaTeX output. State the tier used, directly in the note, per [[PDF Extraction Standard]]'s Done Conditions.

## Legacy fallback (only if MinerU itself is genuinely unavailable)
1. `python .claude/skills/ingesting-clipping/scripts/extract_pdf.py "FULL_PATH_TO_PDF"` — exit 0 means clean text, usable directly; exit 2 means scanned/image-based.
2. If scanned and MinerU can't run for some reason: Claude's multimodal `Read` tool, but only after confirming `pdftoppm` (poppler) actually works on this machine — `which pdftoppm` / `Get-Command pdftoppm`. Confirmed missing here once already (`pdftotext.exe` present, `pdftoppm.exe` absent); a full poppler-utils build would need installing before this path is real. Treat this entire path as an emergency fallback, not a routine option.

## Frontmatter/session-log note
No new frontmatter fields — this workflow produces intermediate text, not a note of its own. In `60_Claude/07_AI_Information/Session Logs/log.md`'s normal ingest entry, add one line: `- Extraction: mineru, tier [standard/advanced]`.

## Done when
- The local MinerU server was confirmed healthy before parsing, not assumed.
- `--pages all` was used for a full-document read (not silently left at the 10-page default).
- Output was spot-checked against real hard pages (matrices, derivations, tables, figures) before being trusted.
- Any page/formula/table that still comes out wrong after `advanced` tier is named explicitly, not smoothed over.

## Next (not done yet)
Fold this directly into `.claude/skills/ingesting-clipping/reference.md` §2 and `extract_pdf.py` so `/ingest-clipping` calls `mineru parse` natively instead of pypdf/Claude-vision — queued, not done in this pass.

## Gold Standard Example
- The CSCI 5304 textbook run (Trefethen & Bau, *Numerical Linear Algebra*, a 371-page photographed old edition): `extract_pdf.py` exit 2 confirmed genuinely garbled pypdf text; `pdftoppm` confirmed missing on this machine, ruling out the legacy fallback entirely; MinerU installed fresh, hit and resolved the triton/lmdeploy dead-end above, then ran for real. Detailed read-through findings (what read clean, what's still garbled, matrix/bracket fidelity, page numbers, embedded images): [[20_Progress/Degree/CSCI 5304/Textbook/Textbook Map|CSCI 5304 Textbook Map]].
