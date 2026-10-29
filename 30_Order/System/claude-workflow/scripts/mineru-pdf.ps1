# Parses one PDF (or any document MinerU supports) to Markdown through the local
# MinerU 4 server and prints where the Markdown is. Claude then reads the
# Markdown, never the PDF. This is the one command every PDF read goes through.
#
#   mineru-pdf.ps1 "C:\path\file.pdf"                       whole document, standard tier
#   mineru-pdf.ps1 "C:\path\file.pdf" -Pages 120-135        only a chapter (much faster)
#   mineru-pdf.ps1 "C:\path\file.pdf" -Tier advanced        old scan or dense math
#   mineru-pdf.ps1 "C:\path\file.pdf" -OutFile "D:\x\y.md" choose the output file
#
# What it adds over calling `mineru parse` directly:
#   - If the server is stopped (the failure that sent earlier sessions to
#     pdftotext), it starts the server, waits until it runs, and retries once.
#     "engine_unavailable" (server up, models still loading) is waited out. The
#     server is started from ~/.mineru, because it creates a blobs\ folder in the
#     directory it starts from (earlier sessions left one at the vault root).
#   - If a parse outlasts one wait, it keeps resuming (MinerU keeps the work) until
#     the document is done or -MaxWaitSec runs out. Out of time is exit 3, and
#     running the same command again continues where it stopped.
#   - It prints a few lines (output file, pages, tier, how to read pieces), not the
#     document, so a 500-page book does not land in the context.
#
# Exit codes: 0 done, 1 MinerU error, 2 bad input, 3 still parsing (rerun), 4 mineru missing.
# Windows PowerShell 5.1 and pwsh. ASCII only.
param(
    [Parameter(Mandatory = $true, Position = 0)][string]$Path,
    [string]$Pages = "all",
    [ValidateSet("flash", "basic", "standard", "advanced")][string]$Tier = "standard",
    [string]$OutFile = "",
    [int]$MaxWaitSec = 110,
    [switch]$Force
)

$ErrorActionPreference = "Stop"
$sw = [System.Diagnostics.Stopwatch]::StartNew()

if (-not (Get-Command mineru -ErrorAction SilentlyContinue)) {
    Write-Output "MINERU MISSING: the mineru command is not on PATH. Install steps: 30_Order/Workflows/Ingestion/PDF Extraction.md (New machine only)."
    exit 4
}
if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
    Write-Output "NOT A FILE: $Path"
    exit 2
}
$src = (Resolve-Path -LiteralPath $Path).Path

if (-not $OutFile) {
    $outDir = Join-Path ([System.IO.Path]::GetTempPath()) "mineru-out"
    $stem = ([System.IO.Path]::GetFileNameWithoutExtension($src) -replace '[^A-Za-z0-9._-]', '_')
    $pageTag = ($Pages -replace '[^A-Za-z0-9-]', '_')
    $OutFile = Join-Path $outDir "$stem.$Tier.p$pageTag.md"
}

# Runs `mineru <args>` and returns @{ Code; Json } where Json is the parsed stdout
# object (or $null when stdout held no JSON).
function Invoke-Mineru([string[]]$MineruArgs) {
    $raw = & mineru @MineruArgs 2>$null | Out-String
    $code = $LASTEXITCODE
    $json = $null
    $start = $raw.IndexOf("{")
    if ($start -ge 0) {
        try { $json = $raw.Substring($start) | ConvertFrom-Json } catch { $json = $null }
    }
    return @{ Code = $code; Json = $json }
}

function Start-MineruServer {
    # console write, not Write-Output: a function's output stream is its return value
    [Console]::Out.WriteLine("Server is not running. Starting it (about 10 s)...")
    # The server writes a blobs\ folder into the directory it was started from. Start it
    # from MinerU's own home so no project folder or the vault root grows a blobs\ folder.
    $mineruHome = Join-Path $env:USERPROFILE ".mineru"
    if (-not (Test-Path -LiteralPath $mineruHome)) { New-Item -ItemType Directory -Path $mineruHome -Force | Out-Null }
    Push-Location -LiteralPath $mineruHome
    try { & mineru server start 2>$null | Out-Null } finally { Pop-Location }
    for ($i = 0; $i -lt 20; $i++) {
        $st = Invoke-Mineru @("server", "status", "--json")
        if ($st.Json -and $st.Json.running) { return $true }
        Start-Sleep -Seconds 2
    }
    return $false
}

$startedServer = $false
$result = $null
while ($true) {
    $remaining = $MaxWaitSec - [int]$sw.Elapsed.TotalSeconds
    if ($remaining -lt 5) {
        Write-Output "STILL PARSING after $([int]$sw.Elapsed.TotalSeconds) s. MinerU keeps the work. Run the same command again to continue; for a long book add -Pages with the chapter you need."
        exit 3
    }
    $wait = [Math]::Min($remaining, 45)
    $mArgs = @("parse", $src, "--pages", $Pages, "--tier", $Tier, "--wait", "$wait", "--json", "--output", $OutFile)
    if ($Force) { $mArgs += "--force" }
    $r = Invoke-Mineru $mArgs
    $errCode = if ($r.Json -and $r.Json.error) { [string]$r.Json.error.code } else { "" }

    if ($r.Code -eq 0 -and $r.Json -and $r.Json.parse -and $r.Json.parse.status -eq "done") { $result = $r.Json; break }
    if ($errCode -eq "server_not_running" -and -not $startedServer) {
        $startedServer = $true
        if (-not (Start-MineruServer)) {
            Write-Output "MINERU ERROR: the server did not start. Run 'mineru server start', then 'mineru server status --json', and read C:\Users\anant\.mineru\logs\doclib.stderr.log."
            exit 1
        }
        continue
    }
    if ($errCode -eq "parse_wait_timeout") { continue }
    if ($errCode -eq "engine_unavailable") {
        # the server is up but its model engine is still loading (right after a start)
        Start-Sleep -Seconds 4
        continue
    }
    $msg = if ($r.Json -and $r.Json.error) { "$errCode : $($r.Json.error.message)" } else { "exit $($r.Code), no JSON on stdout" }
    Write-Output "MINERU ERROR: $msg"
    exit 1
}

$p = $result.parse
$bytes = if (Test-Path -LiteralPath $OutFile) { (Get-Item -LiteralPath $OutFile).Length } else { 0 }
$locator = "doc:$($p.short_id)/tier:$($p.tier)"
Write-Output "OK  mineru parse done in $([int]$sw.Elapsed.TotalSeconds) s (cache hit: $($p.cache_hit), server started by this run: $startedServer)"
Write-Output "Markdown : $OutFile ($bytes bytes)"
Write-Output "Pages    : $($p.page_range)   Tier: $($p.tier)   Document: $($p.short_id)"
Write-Output "Next     : read the Markdown with the Read tool in pieces (offset and limit); page markers look like '<!-- page N of M -->'."
Write-Output "Pieces   : mineru read $locator/page:N --context 1      one page and its neighbours, from the cache"
Write-Output "Figures  : mineru read $locator/page:N --format image --output page-N.png     then Read the PNG"
Write-Output "Find     : mineru search `"terms`" --json                  across everything parsed so far"
if ($Tier -in @("flash", "basic")) {
    Write-Output "NOTE     : $Tier tier is for previewing. Re-run with -Tier standard before building a note from it."
}
exit 0
