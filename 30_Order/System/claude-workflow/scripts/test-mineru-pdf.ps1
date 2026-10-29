# Tests the fast failure exits of scripts\mineru-pdf.ps1 without touching the
# MinerU server: a path that is not a file (exit 2) and mineru missing from PATH
# (exit 4). The parse itself needs the server and models, so it is checked by hand
# (see PDF Extraction in 30_Order/Workflows/Ingestion), not here.

$ErrorActionPreference = "Stop"

$wrapper = (Resolve-Path (Join-Path $PSScriptRoot "mineru-pdf.ps1")).Path
$exe = (Get-Process -Id $PID).Path
$work = Join-Path $env:TEMP "mineru-wrapper-test-$(Get-Random)"
New-Item -ItemType Directory -Path $work -Force | Out-Null

$fail = 0
function Assert($label, [bool]$ok) {
    if ($ok) { Write-Output "PASS: $label" }
    else { Write-Output "FAIL: $label"; $script:fail++ }
}

$dummy = Join-Path $work "dummy.pdf"
[System.IO.File]::WriteAllText($dummy, "not really a pdf")

# not a file: exit 2 (mineru is on PATH here, so the check order is also covered)
$out = (& $exe -NoProfile -ExecutionPolicy Bypass -File $wrapper (Join-Path $work "missing.pdf") | Out-String)
Assert "missing file: exit 2" ($LASTEXITCODE -eq 2)
Assert "missing file: says NOT A FILE" ($out -match "NOT A FILE")

# a folder is not a file either
$null = & $exe -NoProfile -ExecutionPolicy Bypass -File $wrapper $work
Assert "folder: exit 2" ($LASTEXITCODE -eq 2)

# mineru not on PATH: exit 4 with the install pointer
$oldPath = $env:PATH
try {
    $env:PATH = $work
    $out = (& $exe -NoProfile -ExecutionPolicy Bypass -File $wrapper $dummy | Out-String)
    $code = $LASTEXITCODE
}
finally {
    $env:PATH = $oldPath
}
Assert "mineru missing: exit 4" ($code -eq 4)
Assert "mineru missing: points at the install steps" ($out -match "MINERU MISSING" -and $out -match "PDF Extraction")

# an invalid tier is rejected by the parameter check, not passed to mineru
$ErrorActionPreference = "Continue"   # 5.1 turns the child's stderr into an error record
$null = & $exe -NoProfile -ExecutionPolicy Bypass -File $wrapper $dummy -Tier bogus 2>&1
$ErrorActionPreference = "Stop"
Assert "bad -Tier: non-zero exit" ($LASTEXITCODE -ne 0)

Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue

if ($fail -eq 0) { Write-Output "=== ALL MINERU WRAPPER CHECKS PASSED ==="; exit 0 }
else { Write-Output "=== $fail MINERU WRAPPER CHECK(S) FAILED ==="; exit 1 }
