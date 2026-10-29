# Tests hooks\jarvis-pdf-guard.ps1 as Claude Code runs it: a child shell with the
# PreToolUse JSON on stdin; the stdout JSON and the exit code are checked. The
# activity log override keeps the real log untouched. The hook runs in the same
# shell edition as this test (run-all-tests.ps1 runs it under pwsh and 5.1).
# Cases: calls that must pass, calls that must be denied, the deny message, the
# log line, the owner switch, and bad stdin.

$ErrorActionPreference = "Stop"

$hook = (Resolve-Path (Join-Path $PSScriptRoot "..\hooks\jarvis-pdf-guard.ps1")).Path
$exe = if ($PSVersionTable.PSEdition -eq 'Core') { 'pwsh' } else { 'powershell' }
$work = Join-Path $env:TEMP "pdf-guard-test-$(Get-Random)"
New-Item -ItemType Directory -Path $work -Force | Out-Null
$logPath = Join-Path $work "activity.jsonl"

$fail = 0
function Assert($label, [bool]$ok) {
    if ($ok) { Write-Output "PASS: $label" }
    else { Write-Output "FAIL: $label"; $script:fail++ }
}

# Runs the hook; returns @{ Code; Out } where Out is the stdout text.
function Invoke-Guard([string]$Stdin, [hashtable]$ExtraEnv = @{}) {
    $env:JARVIS_ACTIVITY_LOG = $logPath
    foreach ($k in $ExtraEnv.Keys) { Set-Item -Path "Env:$k" -Value $ExtraEnv[$k] }
    try {
        $out = $Stdin | & $exe -NoProfile -ExecutionPolicy Bypass -File $hook | Out-String
        return @{ Code = $LASTEXITCODE; Out = $out.Trim() }
    }
    finally {
        Remove-Item Env:JARVIS_ACTIVITY_LOG -ErrorAction SilentlyContinue
        foreach ($k in $ExtraEnv.Keys) { Remove-Item "Env:$k" -ErrorAction SilentlyContinue }
    }
}
function New-Call($tool, $ti) { @{ hook_event_name = "PreToolUse"; session_id = "guard-test"; tool_name = $tool; tool_input = $ti } | ConvertTo-Json -Depth 5 -Compress }
function Test-Denied($r) { $r.Code -eq 0 -and $r.Out -match '"permissionDecision":"deny"' }
function Test-Passed($r) { $r.Code -eq 0 -and $r.Out -eq "" }

# ---- calls that must pass ---------------------------------------------------
$passCases = [ordered]@{
    "Read a markdown file"           = (New-Call "Read" @{ file_path = "D:\notes\a.md" })
    "Read a PNG"                     = (New-Call "Read" @{ file_path = "C:\Temp\page-3.png" })
    "Read a name that only contains .pdf" = (New-Call "Read" @{ file_path = "C:\Temp\a.pdf.md" })
    "mineru parse of a PDF"          = (New-Call "Bash" @{ command = "mineru parse `"C:\x\a.pdf`" --pages all" })
    "the mineru wrapper"             = (New-Call "Bash" @{ command = "powershell -NoProfile -File D:/x/scripts/mineru-pdf.ps1 `"C:\x\a.pdf`"" })
    "searching for the word pdftotext" = (New-Call "Bash" @{ command = "rg pdftotext D:/notes" })
    "grep after a pipe"              = (New-Call "Bash" @{ command = "cat log.txt | grep pdftotext" })
    "listing PDFs"                   = (New-Call "Bash" @{ command = "ls *.pdf" })
    "a python script with no PDF library" = (New-Call "Bash" @{ command = "python build.py --pdf-output" })
    "another tool"                   = (New-Call "Write" @{ file_path = "C:\x\a.pdf"; content = "x" })
}
foreach ($name in $passCases.Keys) {
    Assert "passes: $name" (Test-Passed (Invoke-Guard $passCases[$name]))
}

# ---- calls that must be denied ---------------------------------------------
$denyCases = [ordered]@{
    "Read of a PDF"                  = (New-Call "Read" @{ file_path = "C:\Users\anant\Course Book.pdf" })
    "Read of a PDF, upper case"      = (New-Call "Read" @{ file_path = "C:\Users\anant\SCAN.PDF" })
    "Read of a PDF with pages"       = (New-Call "Read" @{ file_path = "C:\x\a.pdf"; pages = "1-5" })
    "pdftotext"                      = (New-Call "Bash" @{ command = "pdftotext `"C:\x\a.pdf`" -" })
    "pdftoppm after cd"              = (New-Call "Bash" @{ command = "cd C:\x && pdftoppm -r 100 a.pdf out" })
    "quoted pdftotext.exe with spaces" = (New-Call "Bash" @{ command = "`"C:\Program Files\poppler\bin\pdftotext.exe`" a.pdf" })
    "pdftotext in a PowerShell call" = (New-Call "PowerShell" @{ command = "& pdftotext.exe a.pdf out.txt" })
    "python -c with pypdf"           = (New-Call "Bash" @{ command = "python -c `"import pypdf; print(pypdf.PdfReader('a.pdf'))`"" })
    "py with pdfplumber"             = (New-Call "Bash" @{ command = "py -c `"import pdfplumber`"" })
    "the retired extract_pdf.py"     = (New-Call "Bash" @{ command = "python scripts\extract_pdf.py a.pdf" })
    "mutool"                         = (New-Call "Bash" @{ command = "mutool draw -o p.png a.pdf 1" })
}
foreach ($name in $denyCases.Keys) {
    Assert "denies: $name" (Test-Denied (Invoke-Guard $denyCases[$name]))
}

# ---- the deny message and the log line --------------------------------------
if (Test-Path -LiteralPath $logPath) { Remove-Item -LiteralPath $logPath }
$r = Invoke-Guard (New-Call "Read" @{ file_path = "C:\Users\anant\Private Name.pdf" })
$obj = $null
try { $obj = $r.Out | ConvertFrom-Json } catch { }
Assert "deny output is valid JSON with PreToolUse and deny" ($obj -and $obj.hookSpecificOutput.hookEventName -eq "PreToolUse" -and $obj.hookSpecificOutput.permissionDecision -eq "deny")
$reason = if ($obj) { [string]$obj.hookSpecificOutput.permissionDecisionReason } else { "" }
Assert "deny message names the wrapper script" ($reason -match 'mineru-pdf\.ps1')
Assert "deny message carries the PDF path ready to run" ($reason.Contains('"C:\Users\anant\Private Name.pdf"'))
Assert "deny message tells Claude not to fall back" ($reason -match 'Do not fall back')
$logLines = @(Get-Content -LiteralPath $logPath -Encoding UTF8 | ForEach-Object { $_ | ConvertFrom-Json })
Assert "one log line per deny" ($logLines.Count -eq 1)
Assert "log fields are timestamp,event,session_id,tool,rule" ($logLines.Count -eq 1 -and ($logLines[0].PSObject.Properties.Name -join ",") -eq "timestamp,event,session_id,tool,rule")
Assert "log line has event pdf_guard and rule read_pdf" ($logLines.Count -eq 1 -and $logLines[0].event -eq "pdf_guard" -and $logLines[0].rule -eq "read_pdf")
Assert "log line holds no path or file name" ($logLines.Count -eq 1 -and -not ((Get-Content -LiteralPath $logPath -Raw) -match 'Private Name|anant'))

# ---- owner switch and bad input ----------------------------------------------
Assert "JARVIS_ALLOW_PDF_READ=1 lets a PDF read through" (Test-Passed (Invoke-Guard (New-Call "Read" @{ file_path = "C:\x\a.pdf" }) @{ JARVIS_ALLOW_PDF_READ = "1" }))
Assert "empty stdin: exit 0, no output" (Test-Passed (Invoke-Guard ""))
Assert "garbage stdin: exit 0, no output" (Test-Passed (Invoke-Guard "this is {not json"))
Assert "missing tool_input: exit 0, no output" (Test-Passed (Invoke-Guard '{"tool_name":"Read"}'))

Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue

if ($fail -eq 0) { Write-Output "=== ALL PDF GUARD CHECKS PASSED ==="; exit 0 }
else { Write-Output "=== $fail PDF GUARD CHECK(S) FAILED ==="; exit 1 }
