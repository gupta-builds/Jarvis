---
type: system
status: sprout
created: 2026-09-29
updated: 2026-10-16
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
1. **MinerU is the default for every PDF** on this vault's machines (installed 2026-09-29). Claude never reads raw PDF pages; MinerU runs outside the context and Claude reads its Markdown and LaTeX.
2. **Pick the tier on purpose.** `standard` for clean modern PDFs. `advanced` for old scans and dense math: it uses the same models and spends more compute per page. `flash` and `basic` are for previewing only, never for the text a note is built from.
3. **Parse the whole document.** `--pages all` is required, because the command defaults to 10 pages.
4. **Spot-check a new hard document** against two or three of its hardest pages (a matrix, a multi-line equation, a table) before trusting the run.
5. **Name every gap.** A page, formula, or table still wrong after `advanced` is listed in the summary. A labeled gap beats confident garbage.
6. **State the tier** in the resulting note.
7. **The fallback is an emergency path.** `scripts/extract_pdf.py` then Claude's page-by-page `Read` only works if `pdftoppm` is installed, which was missing on the machine where this was first tried. Check `Get-Command pdftoppm` before relying on it.
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
