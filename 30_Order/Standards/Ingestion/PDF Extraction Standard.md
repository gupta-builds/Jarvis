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
==Which tool reads a PDF is a quality decision, not a convenience decision — an old, photographed textbook run through the wrong extractor produces garbled formulas that look plausible enough to trust and are actually wrong, which is worse than an honest "couldn't read this."== This is the standard for **PDF extraction specifically** — one layer beneath [[30_Order/Standards/Enrich/Source Summary Standard|Source Summary Standard]] (which governs what the resulting *note* looks like once text exists to summarize). Read this before choosing a tool; read that once you have clean text. **Scope note:** this Standard covers PDFs only. Web, video, GitHub, and other ingestion types keep their own separate standards/workflows — this is not a general ingestion policy.

## Decision, 2026-09-29: MinerU is the standing default for every PDF
Installed globally on this machine (`uv tool install --python 3.12 "mineru>=4.0,<5"`, verified working — see [[PDF Extraction]] for the full install record and the real dead-end hit along the way). **Every PDF this vault or this laptop ingests from here on routes through `mineru`, not just scanned/old ones** — the tiers below now describe *MinerU's own* quality dial (`flash`/`basic`/`standard`/`advanced`), not a choice between different external tools. `pypdf` and Claude's multimodal `Read` are no longer the default path for any PDF; they stay documented below only as what MinerU itself falls back to internally, and as manual escape hatches if MinerU is ever genuinely unavailable.

## Why this exists
The ingestion skill (`.claude/skills/ingesting-clipping/`) had exactly one fallback for a sparse/scanned PDF: hand the file to Claude's own multimodal `Read` tool and read every page as an image. That was reasonable for the PDFs this vault had actually ingested so far (short guides, clean modern scans) but breaks on two real, verified failure modes, discovered running CSCI 5304's textbook (Trefethen & Bau, *Numerical Linear Algebra*, a photographed old edition) through it:
1. **The fallback itself can be unavailable.** Claude's `Read` tool renders PDF pages to images via `pdftoppm` (poppler). On at least one real machine in this vault's rotation, poppler's `pdftotext` is installed but `pdftoppm` is not — so the documented fallback fails with a hard tool error, not a graceful degrade. **Verify `pdftoppm` is on PATH before trusting this fallback exists at all** (`which pdftoppm` / `Get-Command pdftoppm`); if it's missing, install a full poppler-utils build (the mingw64/git-bash bundle here shipped `pdftotext.exe` alone, which is not the full package) before relying on this tier.
2. **Even when it works, per-page vision reads don't scale and don't specialize.** Reading a 300+ page scanned math textbook 5 pages at a time through Claude's own context burns a large, real token budget on every run, and general-purpose multimodal reading is not tuned for dense formula/matrix layouts the way a document-specific model is — real matrices and equations degrade into glyph soup that reads as plausible prose, which is a worse failure than a clean error, because it doesn't announce itself.

## Why MinerU over the alternatives (research record, still valid)
- **vs. Marker (Datalab)** — Marker is faster at scale but its own published benchmark result is in the low 50s (%) on olmOCR-Bench's "old scans" category specifically — the exact failure mode of an old, photographed textbook. Wrong tool for this job despite being popular.
- **vs. dots.ocr / dots.mocr** (previously researched in this vault, see [[60_Claude/10_Source_Summaries/Github Ingestion/AI Starred/dots.ocr|dots.ocr]]) — genuinely strong (79-84% on olmOCR-Bench depending on version) and previously rejected only because "Claude already handles this," a premise this exact textbook disproves. Re-litigated here: on the benchmark category that matches this use case most directly (textbooks), MinerU2.5 scores a 0.0499 edit distance versus dots.ocr's 0.0788 — meaningfully better for this specific job. dots.ocr stays the documented fallback if MinerU is ever removed.
- **vs. Docling (IBM)** — reasonable, pluggable OCR backends, but MinerU's formula-to-LaTeX and table-to-HTML conversion plus its own hardware breadth (NVIDIA, AMD, CPU-only) made it the stronger default.

## MinerU's own quality tiers (the real dial now — not a tool choice)
Four tiers within MinerU itself, selected with `--tier`:
- `flash` — fastest, lowest quality. Discovery/preview/indexing only, never final reading quality.
- `basic` — moderate quality/speed.
- `standard` — the default for normal reading, including most textbook material. This vault's local managed parse server runs at `standard` startup tier.
- `advanced` — slowest, best on genuinely difficult documents (old scans, dense math) — uses the same `standard` model set, just spends more inference compute per page. Reach for this on hard scanned material before concluding MinerU "can't" read something.
Omit `--tier` for normal reading. Use `--tier advanced` explicitly on documents already known to be hard (old scans, heavy matrices) rather than discovering mid-run that `standard` under-performed.

## Legacy fallback path (kept only for when MinerU is genuinely unavailable)
The pre-2026-09-29 approach — `scripts/extract_pdf.py` (pypdf) first, then Claude's multimodal `Read` for scanned PDFs — stays documented as a manual escape hatch, not the default:
1. **The `Read`-tool fallback depends on `pdftoppm` (poppler)**, which was confirmed missing on this machine (`pdftotext.exe` present, `pdftoppm.exe` absent). Don't assume it works — verify (`which pdftoppm` / `Get-Command pdftoppm`) before ever relying on it.
2. **Even when available, it doesn't scale or specialize** — per-page vision reads burn real tokens on long documents and aren't tuned for dense formula/matrix layouts, which is exactly why this Standard moved to MinerU as the default rather than keeping this as the answer.

## Validate before trusting output on a new hard document
Before batch-processing a newly-seen difficult PDF, spot-check 2-3 of its hardest real pages (a matrix, a multi-line equation, a table) against the MinerU output before trusting the whole run. If MinerU's `advanced` tier still can't read something acceptably, say so honestly in the resulting note rather than forcing a low-confidence extraction through — a labeled gap is better than confident garbage, same principle as [[Brief Standard]]'s Open Questions rule for garbled transcript passages.

## Token/cost discipline
The entire point of routing every PDF through MinerU is that Claude never reads the raw pages — MinerU (a small, specialized, locally-run model) does that work outside Claude's context, and Claude only ever ingests the resulting clean Markdown/LaTeX. If a tool under consideration requires piping page images through an LLM API per page (including Claude's own vision) for a long document, it is not solving the problem this Standard exists for — it is just moving the expensive step somewhere else.

## Done Conditions (extraction phase, before any summary is written)
- MinerU was the tool used, and which quality tier (`standard` vs `advanced`) was chosen deliberately — state it in the resulting summary note's own framing.
- For a newly-seen hard document, output was spot-checked against a few known-hard source pages (a matrix, a multi-line equation, a table) before being trusted.
- Any page, formula, or table that still comes out wrong after `advanced` tier's best effort is named explicitly in the summary's own text, never silently smoothed over or guessed into something plausible-looking.
- Nothing here duplicates [[30_Order/Standards/Enrich/Source Summary Standard|Source Summary Standard]]'s own Done Conditions for the note body itself — both gates apply, in order: extraction gate first, then the note-content gate.

## Gold Standard Example
- [[20_Progress/Degree/CSCI 5304/Textbook/Textbook Map|CSCI 5304 Textbook Map]]'s own Methodology section — the honest, dated account of exactly this failure mode being hit and logged rather than papered over, which is what prompted this Standard to be written.
