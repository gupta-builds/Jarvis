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
next: "Fold Tier 3 into .claude/skills/ingesting-clipping/reference.md §2 and extract_pdf.py once this workflow has been run for real on the CSCI 5304 textbook"
---
# PDF Extraction
The operational steps behind [[PDF Extraction Standard]]'s three tiers. This is what `/ingest-clipping` (and any course-specific pipeline, e.g. CSCI 5304's Textbook Map/Lecture notes) should actually do when it hits a PDF, in order.

**Use when:** any PDF needs its content pulled into the vault, before a Source Summary or a course textbook note is written from it.

**Moves:** raw PDF (`05_Clippings/PDFs/` or a course's own `Textbook & Resources/`) → clean Markdown/LaTeX text → handed to [[30_Order/Standards/Enrich/Source Summary Standard|Source Summary Standard]] (or a course's [[Textbook Template]]) for the actual note write-up. This workflow stops once clean text exists; it does not write the summary itself.

## Step 0 — Confirm the fallback tier actually works on this machine
Before trusting Tier 2 exists at all, check once per machine (not per PDF):
```bash
which pdftoppm   # git-bash / WSL
Get-Command pdftoppm   # PowerShell
```
If missing: this machine's poppler install is partial (confirmed once already — `pdftotext.exe` present, `pdftoppm.exe` absent, in `mingw64/bin`). Install a full poppler-utils build (Windows: a prebuilt poppler-windows release, unzipped with its `bin/` added to PATH; WSL2: `sudo apt install poppler-utils`) before assuming Tier 2 is available. Until fixed, treat every scanned PDF as Tier 3 regardless of length, since Tier 2 is not a real option on this machine yet.

## Step 1 — Run the existing extractor
```bash
python .claude/skills/ingesting-clipping/scripts/extract_pdf.py "FULL_PATH_TO_PDF"
```
- **Exit 0** → done. Use the printed text, proceed straight to the Source Summary / Textbook note write-up. This is Tier 1, unchanged from current practice.
- **Exit 1** → fix the reported error (missing file, missing `pypdf`) and re-run.
- **Exit 2** → the PDF is scanned/image-based. Continue to Step 2.

## Step 2 — Decide Tier 2 vs. Tier 3
Ask two questions, per [[PDF Extraction Standard]]:
1. Is it roughly ≤15 pages?
2. Is it prose-dominant, with no dense formulas, matrices, or tables?
**Both yes** → Tier 2. **Either no** → Tier 3. A 3-page proof sheet full of matrices is Tier 3 despite being short — density matters more than length once math is involved.

## Step 3 — Tier 2: multimodal `Read`
Pass the PDF path directly to the `Read` tool (requires Step 0's `pdftoppm` check to have passed). Read ~5 pages at a time, write notes for that batch before reading the next, per the existing `reference.md` §2 guidance — unchanged.

## Step 4 — Tier 3: MinerU
1. **Validate first, no install required.** Take 2-3 of the PDF's hardest real pages (the densest equation or matrix page, a table, a mixed-layout page) and run them through MinerU's Hugging Face Spaces web demo. If the output is clean Markdown/LaTeX that matches the source, proceed. If it's still garbled, say so honestly in the eventual summary rather than forcing the full pipeline — see the Standard's validation rule.
2. **Install locally** (only once validated, for a document worth batch-processing):
   ```bash
   pip install "mineru-vl-utils[transformers]"
   ```
   Use the lighter `[transformers]` backend by default — it runs on more modest GPUs (and CPU, slower) than the throughput-optimized `[vllm]` backend, which recommends 24GB+ VRAM and is built for high-volume production use this vault doesn't need. Confirm actual installed-version CLI syntax via `--help` before scripting against it; packaging for fast-moving OSS tools like this shifts between releases faster than any note can track exactly.
3. **Run it:**
   ```bash
   mineru-kit parse "FULL_PATH_TO_PDF" -o "output.md" --tier standard
   ```
4. **Spot-check** the output against the same 2-3 hard pages used in validation before trusting the whole document — confirm a real matrix rendered as real LaTeX, not as a garbled unicode block.
5. Hand `output.md` to the Source Summary / Textbook note write-up exactly as Tier 1's pypdf text would be handled — Claude never re-reads the raw PDF pages at this point, only the clean text MinerU produced.

## Step 5 — Write the note
Once clean text exists (Tier 1, 2, or 3), proceed with the actual content extraction and note-writing per [[30_Order/Standards/Enrich/Source Summary Standard|Source Summary Standard]] (general PDFs, via `/ingest-clipping`) or the course's own [[Textbook Template]] / Notebook prompt pattern (course textbooks, e.g. [[20_Progress/Degree/Repetitive Things|Repetitive Things]]'s Notebook section). State which tier was used and why, directly in the note — this is part of [[PDF Extraction Standard]]'s Done Conditions, not optional metadata.

## Frontmatter/session-log note
No new frontmatter fields — this workflow produces intermediate text, not a note of its own. Log the tier used in the eventual Source Summary/Textbook note's own body (per the Standard), and in `60_Claude/07_AI_Information/Session Logs/log.md`'s normal ingest entry, add one line: `- Extraction tier: [1/2/3], tool: [pypdf/Read/MinerU]`.

## Done when
- Step 0 was actually checked, not assumed, the first time this workflow runs on a new machine.
- The tier decision in Step 2 was made deliberately and is stated in the resulting note.
- For Tier 3, validation happened before the full local install/run, and a spot-check happened before the output was trusted.
- Any page/formula/table the chosen tier still can't read cleanly is named explicitly, not smoothed over.

## Next (not done yet)
Fold Tier 2/3 routing directly into `.claude/skills/ingesting-clipping/reference.md` §2 and extend `extract_pdf.py`'s exit-2 message to point here instead of unconditionally recommending multimodal `Read` — queued, not done in this pass, since this workflow needs to actually run once for real (CSCI 5304's textbook is the live test case) before hardening it into the skill's own automation.

## Gold Standard Example
- The CSCI 5304 textbook run: `extract_pdf.py` exit 2 (confirmed genuinely garbled pypdf text on a photographed old edition), Step 0 caught a real missing `pdftoppm`, prompting this workflow's Step 0 to exist at all. Full account in [[20_Progress/Degree/CSCI 5304/Textbook/Textbook Map|CSCI 5304 Textbook Map]]'s Methodology note.
