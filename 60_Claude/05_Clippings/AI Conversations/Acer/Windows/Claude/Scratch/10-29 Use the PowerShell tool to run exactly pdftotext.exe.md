---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "Use the PowerShell tool to run exactly pdftotext.exe"
started_at: 2026-10-29T01:15:55
ended_at: 2026-10-29T01:16:03
exported_at: 2026-10-29T01:33:04
duration_minutes: 0.1
project: Scratch
cwd: 'C:\Users\anant\AppData\Local\Temp\claude\d---Anant-20-Progress-Documents-Jarvis\68c513bc-f671-4b52-b1ef-e2eeebb9f750\scratchpad\e2e'
session_id: feed1d5a-9276-452c-9d9b-daa6b46c8f84
status: seed
review_state: raw
created: 2026-10-29
updated: 2026-10-29
turn_count: 2
tools_used:
  PowerShell: 1
tokens:
  input: 4
  output: 415
  cache_creation: 19742
  cache_read: 52828
  total: 72989
cost_usd: 0.004685
model:
  - "claude-haiku-5-5"
files_touched: []
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# Use the PowerShell tool to run exactly pdftotext.exe

## You

Use the PowerShell tool to run exactly: pdftotext.exe faq.pdf out.txt . If it is blocked, reply with only the word BLOCKED and the rule name in parentheses.

## Claude

BLOCKED (run_pdftotext)

### Tool Calls

- `PowerShell`
```powershell
pdftotext.exe faq.pdf out.txt
```
```
PreToolUse:PowerShell hook error: BLOCKED by the Jarvis PDF guard (run_pdftotext). Do not read a PDF directly or with pdftotext, pypdf or similar: Read puts the whole file in the transcript as base64 (25 to 50 MB per PDF) and the extractors lose math and tables. Vault rule: MinerU only.
Run this instead (it starts the MinerU server if it is stopped and prints the Markdown file to read):
powershell -NoProfile -ExecutionPolicy Bypass -File D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/claude-workflow/scripts/mineru-pdf.ps1 "<path to the PDF>"
Useful options: -Pages 120-135 (one chapter, much faster than the whole book), -Tier advanced (old scan or dense math). For a long document it may print STILL PARSING (exit 3): run the same command again, the work is kept. Then use Read on the Markdown path it prints, in pieces with offset and limit.
For a figure or a page image: mineru read doc:ID/tier:standard/page:N --format image --output page-N.png, then Read the PNG (a PNG is fine).
If MinerU itself fails, show the user the error text. Do not fall back to another PDF reader.
```

## Actions Taken

**Files created:**
_None_

**Files modified:**
_None_

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
_None_

