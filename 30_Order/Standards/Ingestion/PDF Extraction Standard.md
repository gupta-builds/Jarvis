---
type: system
status: sprout
created: 2026-09-29
updated: 2026-10-29
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
This governs PDF extraction only, one layer below [[Source Summary Standard]], which governs the note once clean text exists. Web, video, and GitHub sources have their own standards. The procedure and commands are in [[PDF Extraction]].
## Rules
1. **MinerU is the only reader of PDFs** on this vault's machines (installed 2026-09-29, version 4.0.10). Claude never reads raw PDF pages and never uses `pdftotext`, `pypdf` or similar; MinerU runs outside the context and Claude reads its Markdown and LaTeX. A PreToolUse hook enforces this for Claude Code (see [[PDF Extraction]]); every other agent follows it as a rule.
2. **Pick the tier on purpose.** `standard` for clean modern PDFs. `advanced` for old scans and dense math: it uses the same models and spends more compute per page. `flash` and `basic` are for previewing only, never for the text a note is built from.
3. **Parse every page the note needs.** `--pages` is always passed, because the command stops at 10 pages without it. A whole short document uses `all`; a chapter of a long book uses its page range, which is faster and keeps later ranges cached. The wrapper `mineru-pdf.ps1` does this and is the only command used to parse.
4. **Spot-check a new hard document** against two or three of its hardest pages (a matrix, a multi-line equation, a table) before trusting the run.
5. **Name every gap.** A page, formula, or table still wrong after `advanced` is listed in the summary. A labeled gap beats confident garbage.
6. **State the tier** in the resulting note.
7. **There is no fallback reader.** A stopped server is not a reason to switch tools: the wrapper starts it, and `server_not_running` was the failure that sent earlier sessions to `pdftotext`. If MinerU still fails, the session reports the error text to the owner. `Read` on a PDF stores the whole file in the transcript as base64 (25 to 50 MB per PDF; one 115.9 MB transcript was 19 such reads), and the old pypdf script is retired. The owner can switch the hook off for one session with `JARVIS_ALLOW_PDF_READ=1`; nothing else does.
8. **Read the right documentation.** The pages at opendatalab.github.io describe the older 3.x command. For the installed 4.0 CLI, `mineru --help` and [[PDF Extraction]] are the references.
> [!WARNING]
> Installing `mineru[full]` on Windows. The CUDA, lmdeploy, and triton chain failed twice and corrupted the tool's environment. The base package already uses the GPU through Vulkan.
## Why MinerU
On the textbook category of olmOCR-Bench MinerU2.5 scores an edit distance of 0.0499 against 0.0788 for dots.ocr, and Marker scores in the low 50s percent on old scans. dots.ocr stays the documented fallback if MinerU is removed.
## Done Conditions
- MinerU was the tool, the tier was chosen deliberately, and the note says which.
- A new hard document was spot-checked before it was trusted.
- Every remaining gap is named in the summary.
- The note body then meets [[Source Summary Standard]]; both gates apply, extraction first.
## Gold Standard Example
None. A policy has no instance. The run that prompted it is recorded in the Methodology section of [[20_Progress/Degree/CSCI 5304/Textbook/Textbook Map|CSCI 5304 Textbook Map]].
