---
type: system
status: sprout
created: 2026-09-29
updated: 2026-11-07
tags:
  - system
  - standards
system_kind: standard
family: policy
maps_to: []
used_by:
  - "[[PDF Extraction]]"
gold_standard: none
notes:
  - "[[Source Summary Standard]]"
  - "[[20_Progress/Degree/CSCI 5304/Textbook/Textbook Map|CSCI 5304 Textbook Map]]"
---
# PDF Extraction Standard
==Which tool reads a PDF is a quality decision: a wrong extractor turns a scanned formula into text that looks right and is wrong, which is worse than an honest "could not read this."==
This governs PDF extraction only, one layer below [[Source Summary Standard]], which governs the note once clean text exists. It is not the procedure or the commands, which are in [[PDF Extraction]], and web, video, and GitHub sources have their own Standards.
## Rules
| # | Rule | Why | Enforced by |
|---|---|---|---|
| 1 | MinerU is the only reader of PDFs on this vault's machines (version 4.0.10, recorded 2026-10-29). Claude never reads raw PDF pages and never uses `pdftotext`, `pypdf`, or similar | MinerU runs outside the context and Claude reads its Markdown and LaTeX. `Read` on a PDF stores the whole file in the transcript as base64, 25 to 50 MB per PDF | Hook (PreToolUse in `settings.json`) in Claude Code; Reader in every other agent |
| 2 | Pick the tier on purpose: `standard` for clean modern PDFs, `advanced` for old scans and dense math. `flash` and `basic` are for previewing only, never for the text a note is built from | `advanced` uses the same models and spends more compute per page | Reader |
| 3 | Parse every page the note needs. `--pages` is always passed: `all` for a short document, the page range for a chapter of a long book. The wrapper `mineru-pdf.ps1` is the only command used to parse | The command stops at 10 pages without `--pages`, and a chapter range is faster and keeps later ranges cached | Reader |
| 4 | Spot-check a new hard document against two or three of its hardest pages (a matrix, a multi-line equation, a table) before trusting the run | A wrong extractor looks right on easy pages | Reader |
| 5 | Name every gap. A page, formula, or table still wrong after `advanced` is listed in the summary | A labeled gap beats confident garbage | Reader |
| 6 | State the tier in the resulting note | A later reader must know how much to trust a formula | Reader |
| 7 | There is no fallback reader. A stopped server is not a reason to switch tools: the wrapper starts it, and if MinerU still fails the session reports the error text to the owner | `server_not_running` sent earlier sessions to `pdftotext`, and one 115.9 MB transcript held 19 such reads. The owner can lift the hook for one session with `JARVIS_ALLOW_PDF_READ=1`; nothing else does | Hook; Reader |
| 8 | For the installed 4.0 CLI use `mineru --help` and [[PDF Extraction]], not the opendatalab.github.io pages | Those pages describe the older 3.x command | Reader |
| 9 | Do not install `mineru[full]` on Windows | The CUDA, lmdeploy, and triton chain failed twice and corrupted the tool's environment; the base package already uses the GPU through Vulkan | Reader |
## Examples
### Name every gap
- **Right:** `a full MinerU extraction`
- **Wrong:** `both returning corrupted glyph garbage due to this PDF's font encoding`
## Why MinerU
On the textbook category of olmOCR-Bench MinerU2.5 scores an edit distance of 0.0499 against 0.0788 for dots.ocr, and Marker scores in the low 50s percent on old scans. dots.ocr stays the documented fallback if MinerU is removed.
## Done Conditions
- MinerU was the tool, the tier was chosen deliberately, and the note says which.
- A new hard document was spot-checked before it was trusted.
- Every remaining gap is named in the summary.
- The note body then meets [[Source Summary Standard]]; both gates apply, extraction first.
## Gold Standard Example
None. A policy has no instance. The run that prompted it is recorded in the Methodology section of [[20_Progress/Degree/CSCI 5304/Textbook/Textbook Map|CSCI 5304 Textbook Map]]; it names its failed attempts and its fix, but it does not state the tier, so it is not yet the example.
