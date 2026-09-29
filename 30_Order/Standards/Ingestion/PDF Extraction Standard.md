---
type: evergreen
status: sprout
created: 2026-09-29
updated: 2026-09-29
tags:
  - system
  - standards
notes:
  - "[[PDF Extraction]]"
  - "[[30_Order/Standards/Enrich/Source Summary Standard|Source Summary Standard]]"
  - "[[.claude/skills/ingesting-clipping/SKILL|ingesting-clipping]]"
  - "[[20_Progress/Degree/CSCI 5304/Textbook/Textbook Map|CSCI 5304 Textbook Map]]"
---
# PDF Extraction Standard
==Which tool reads a PDF is a quality decision, not a convenience decision — an old, photographed textbook run through the wrong extractor produces garbled formulas that look plausible enough to trust and are actually wrong, which is worse than an honest "couldn't read this."== This is the standard for the **extraction method**, one layer beneath [[30_Order/Standards/Enrich/Source Summary Standard|Source Summary Standard]] (which governs what the resulting *note* looks like once text exists to summarize). Read this before choosing a tool; read that once you have clean text.

## Why this exists
The ingestion skill (`.claude/skills/ingesting-clipping/`) had exactly one fallback for a sparse/scanned PDF: hand the file to Claude's own multimodal `Read` tool and read every page as an image. That was reasonable for the PDFs this vault had actually ingested so far (short guides, clean modern scans) but breaks on two real, verified failure modes, discovered running CSCI 5304's textbook (Trefethen & Bau, *Numerical Linear Algebra*, a photographed old edition) through it:
1. **The fallback itself can be unavailable.** Claude's `Read` tool renders PDF pages to images via `pdftoppm` (poppler). On at least one real machine in this vault's rotation, poppler's `pdftotext` is installed but `pdftoppm` is not — so the documented fallback fails with a hard tool error, not a graceful degrade. **Verify `pdftoppm` is on PATH before trusting this fallback exists at all** (`which pdftoppm` / `Get-Command pdftoppm`); if it's missing, install a full poppler-utils build (the mingw64/git-bash bundle here shipped `pdftotext.exe` alone, which is not the full package) before relying on this tier.
2. **Even when it works, per-page vision reads don't scale and don't specialize.** Reading a 300+ page scanned math textbook 5 pages at a time through Claude's own context burns a large, real token budget on every run, and general-purpose multimodal reading is not tuned for dense formula/matrix layouts the way a document-specific model is — real matrices and equations degrade into glyph soup that reads as plausible prose, which is a worse failure than a clean error, because it doesn't announce itself.

## The three-tier decision
Run `scripts/extract_pdf.py` first, always — it is still the correct first move for every PDF, text or scanned.

### Tier 1 — Clean text PDF (`extract_pdf.py` exits 0)
Use the printed pypdf text as-is. No change from current practice. Zero extra cost, instant.

### Tier 2 — Scanned/image PDF, short and/or light on math (`extract_pdf.py` exits 2`, AND** the document is roughly ≤15 pages or clearly prose-dominant with no dense formula/table/matrix content)
Claude's multimodal `Read` tool remains the right call — the token cost of reading a short document is small, and there's no reason to stand up extra infrastructure for a 3-page flyer. **Precondition: confirm `pdftoppm` actually works on this machine first** (see above) — this tier does not exist if it doesn't.

### Tier 3 — Scanned/image PDF, long and/or math-dense (`extract_pdf.py` exits 2, AND either >15 pages or genuinely formula/table/matrix-heavy regardless of length)
Route through a dedicated document-parsing model instead of Claude's own vision — specifically **MinerU** (OpenDataLab, Apache-2.0, actively maintained, `github.com/opendatalab/MinerU`), chosen over the alternatives researched for this exact decision:
- **vs. Marker (Datalab)** — Marker is faster at scale but its own published benchmark result is in the low 50s (%) on olmOCR-Bench's "old scans" category specifically — the exact failure mode of an old, photographed textbook. Wrong tool for this job despite being popular.
- **vs. dots.ocr / dots.mocr** (previously researched in this vault, see [[60_Claude/10_Source_Summaries/Github Ingestion/AI Starred/dots.ocr|dots.ocr]]) — genuinely strong (79-84% on olmOCR-Bench depending on version) and previously rejected only because "Claude already handles this," a premise this exact textbook disproves. Re-litigated here: on the benchmark category that matches this use case most directly (textbooks), MinerU2.5 scores a 0.0499 edit distance versus dots.ocr's 0.0788 — meaningfully better for this specific job. dots.ocr stays the documented fallback if MinerU setup fails.
- **vs. Docling (IBM)** — reasonable, pluggable OCR backends, but MinerU's formula-to-LaTeX and table-to-HTML conversion plus its own hardware breadth (NVIDIA, AMD, and CPU-only pipeline mode) made it the stronger default for this vault's actual hardware (an NVIDIA-equipped laptop, GPU tier unconfirmed for the heavier vLLM engine).
Full setup and CLI: [[PDF Extraction]].

## Validate before installing anything
Before setting up local MinerU, run 2-3 real troublesome pages through MinerU's free Hugging Face Spaces web demo (no install) to confirm it actually handles *this* PDF's specific degradation before committing to a local pip/GPU setup. If the web demo can't read it acceptably either, say so honestly in the resulting source summary rather than forcing a low-confidence extraction through — a labeled gap is better than confident garbage, same principle as [[Brief Standard]]'s Open Questions rule for garbled transcript passages.

## Token/cost discipline
The entire point of Tier 3 is that Claude never reads the raw scanned pages — MinerU (a small, specialized model, run locally or via its free demo) does that work outside Claude's context, and Claude only ever ingests the resulting clean Markdown/LaTeX, exactly the way it already ingests a Tier 1 pypdf text dump. If a tool under consideration requires piping page images through an LLM API per page (including Claude's own vision) for a long document, it is not solving the problem this Standard exists for — it is just moving the expensive step somewhere else.

## Done Conditions (extraction phase, before any summary is written)
- The correct tier was chosen deliberately, not defaulted to Tier 2 out of habit — state which tier and why in the resulting summary note's own framing.
- For Tier 2: `pdftoppm` was confirmed working, not assumed.
- For Tier 3: quality was validated (web demo or a local trial run) before the full document was processed, and the resulting Markdown was spot-checked against a few known-hard source pages (a matrix, a multi-line equation, a table) before being trusted.
- Any page, formula, or table that still comes out wrong after the chosen tier's best effort is named explicitly in the summary's own text, never silently smoothed over or guessed into something plausible-looking.
- Nothing here duplicates [[30_Order/Standards/Enrich/Source Summary Standard|Source Summary Standard]]'s own Done Conditions for the note body itself — both gates apply, in order: extraction gate first, then the note-content gate.

## Gold Standard Example
- [[20_Progress/Degree/CSCI 5304/Textbook/Textbook Map|CSCI 5304 Textbook Map]]'s own Methodology section — the honest, dated account of exactly this failure mode being hit and logged rather than papered over, which is what prompted this Standard to be written.
