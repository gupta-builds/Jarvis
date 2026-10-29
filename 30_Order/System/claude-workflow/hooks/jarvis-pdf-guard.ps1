# Claude Code PreToolUse hook. Runs under Windows PowerShell 5.1.
#
# Keeps PDFs out of the context. Reading a PDF with the Read tool stores the whole
# file in the transcript as base64 (25 to 50 MB per PDF, stored twice), and the
# fallbacks (pdftotext, pypdf and friends) give worse text than MinerU. This hook
# denies those calls and tells Claude the MinerU command to run instead.
#
# Denies:
#   Read of a file ending in .pdf
#   Bash or PowerShell commands that RUN pdftotext, pdftoppm, pdfimages, pdftohtml,
#   mutool, or a python/py command using pypdf, PyPDF2, pdfplumber, fitz, pymupdf,
#   pdfminer, or the retired extract_pdf.py. Searching for those words (grep, rg) is
#   not blocked: only a command that starts with the tool counts.
# Allows everything else, including mineru itself.
#
# Registered in ~/.claude/settings.json (user level, so every project and every
# subagent is covered), with an "if" filter so the shell only starts for PDF-ish calls.
# It also re-checks the call itself, so a loose filter cannot cause a wrong deny.
#
# Fails open: any error ends in exit 0 and the call goes ahead. Each deny appends one
# line to the activity log: {timestamp, event: "pdf_guard", session_id, tool, rule}
# (never a path or command text), so the weekly review can count how often it fired.
#
# Environment:
#   JARVIS_ALLOW_PDF_READ=1  the owner sets this on purpose before starting claude to
#                            switch the guard off for that session.
#   JARVIS_ACTIVITY_LOG      TEST ONLY, replaces the activity log path.
param()

$ErrorActionPreference = "Stop"
trap { exit 0 }

if ($env:JARVIS_ALLOW_PDF_READ -eq "1") { exit 0 }

$rawInput = [Console]::In.ReadToEnd()
if ([string]::IsNullOrWhiteSpace($rawInput)) { exit 0 }
try { $hook = $rawInput | ConvertFrom-Json } catch { exit 0 }

$tool = [string]$hook.tool_name
$wrapper = "D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/claude-workflow/scripts/mineru-pdf.ps1"
$rule = ""
$target = "<path to the PDF>"

if ($tool -eq "Read") {
    $p = [string]$hook.tool_input.file_path
    if ($p -match '(?i)\.pdf\s*$') { $rule = "read_pdf"; $target = $p }
}
elseif ($tool -eq "Bash" -or $tool -eq "PowerShell") {
    $cmd = [string]$hook.tool_input.command
    $blockedTools = @("pdftotext", "pdftoppm", "pdfimages", "pdftohtml", "mutool")
    # split into simple commands and look at what each one runs
    foreach ($seg in ($cmd -split '\|\||&&|[|;&\r\n]')) {
        $s = $seg.Trim()
        if (-not $s) { continue }
        $s = $s -replace '^[\(\{]+\s*', '' -replace '^\$\(\s*', ''
        $first = if ($s -match '^["'']([^"'']+)["'']') { $Matches[1] } else { ($s -split '\s+')[0] }
        $leaf = ($first -split '[\\/]')[-1].ToLowerInvariant() -replace '\.exe$', ''
        if ($leaf -in $blockedTools) { $rule = "run_$leaf"; break }
        if ($leaf -in @("python", "python3", "py", "uv", "uvx", "pipx") -and $s -match '(?i)\b(pypdf2?|pdfplumber|fitz|pymupdf|pdfminer|extract_pdf)\b') { $rule = "python_pdf_library"; break }
        if ($s -match '(?i)extract_pdf\.py') { $rule = "python_pdf_library"; break }
    }
    if ($rule) {
        $m = [regex]::Match($cmd, '(?i)["'']?([A-Za-z]:[\\/][^"''|;&]*?\.pdf)["'']?')
        if ($m.Success) { $target = $m.Groups[1].Value }
    }
}

if (-not $rule) { exit 0 }

# trace (never a path or command text); must not block the deny if it fails
try {
    $logPath = if ($env:JARVIS_ACTIVITY_LOG) { $env:JARVIS_ACTIVITY_LOG } else { Join-Path (Join-Path $env:USERPROFILE ".claude") "jarvis-session-activity.jsonl" }
    $dir = Split-Path -Parent $logPath
    if ($dir -and -not (Test-Path -LiteralPath $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
    ([ordered]@{
            timestamp = (Get-Date).ToString("o")
            event = "pdf_guard"
            session_id = [string]$hook.session_id
            tool = $tool
            rule = $rule
        } | ConvertTo-Json -Compress) | Add-Content -LiteralPath $logPath -Encoding UTF8
}
catch { }

$reason = @"
BLOCKED by the Jarvis PDF guard ($rule). Do not read a PDF directly or with pdftotext, pypdf or similar: Read puts the whole file in the transcript as base64 (25 to 50 MB per PDF) and the extractors lose math and tables. Vault rule: MinerU only.
Run this instead (it starts the MinerU server if it is stopped and prints the Markdown file to read):
powershell -NoProfile -ExecutionPolicy Bypass -File $wrapper "$target"
Useful options: -Pages 120-135 (one chapter, much faster than the whole book), -Tier advanced (old scan or dense math). For a long document it may print STILL PARSING (exit 3): run the same command again, the work is kept. Then use Read on the Markdown path it prints, in pieces with offset and limit.
For a figure or a page image: mineru read doc:ID/tier:standard/page:N --format image --output page-N.png, then Read the PNG (a PNG is fine).
If MinerU itself fails, show the user the error text. Do not fall back to another PDF reader.
"@

@{
    hookSpecificOutput = @{
        hookEventName = "PreToolUse"
        permissionDecision = "deny"
        permissionDecisionReason = $reason
    }
} | ConvertTo-Json -Depth 5 -Compress

exit 0
