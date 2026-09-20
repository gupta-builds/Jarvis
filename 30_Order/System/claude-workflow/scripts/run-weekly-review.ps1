# Runs the /weekly-review skill headlessly via Claude Code's print mode.
# Registered as the Jarvis-WeeklyReview Scheduled Task (Fridays), independently
# on each laptop - the skill itself checks the Weekly Synthesis Index for this
# week's entry before doing real work, so a duplicate fire from the other
# laptop (both registered, both machines on) is a safe no-op, not an error.
# ASCII-only: Windows PowerShell 5.1 reads .ps1 files using the system
# codepage, not UTF-8 - a non-ASCII character (em dashes included) can corrupt
# into a stray quote and break string literals with cascading parse errors.

$ErrorActionPreference = "Stop"
$VaultRoot = "D:\Users\_Anant\10_Areas\Documents\Jarvis"
$LogFile = Join-Path $PSScriptRoot "..\logs\weekly-review.log"

function Write-Log {
    param([string]$Message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $LogFile -Value "$timestamp  $Message" -Encoding UTF8
}

$lockFile = Join-Path $PSScriptRoot ".weekly-review.lock"
if (Test-Path $lockFile) {
    $lockAge = (Get-Date) - (Get-Item $lockFile).LastWriteTime
    if ($lockAge.TotalMinutes -lt 120) {
        Write-Log "SKIPPED  lock held, age $([math]::Round($lockAge.TotalMinutes,1)) min"
        exit 0
    }
    Write-Log "Stale lock ($([math]::Round($lockAge.TotalMinutes,1)) min) - removing and proceeding"
    Remove-Item $lockFile -Force
}
New-Item -ItemType File -Path $lockFile -Force | Out-Null

try {
    Set-Location $VaultRoot
    Write-Log "Starting headless /weekly-review run"

    $output = & claude -p "/weekly-review" --permission-mode auto --output-format text 2>&1
    $exitCode = $LASTEXITCODE

    if ($exitCode -eq 0) {
        Write-Log "OK  exit=0"
    } else {
        Write-Log "FAILED  exit=$exitCode"
        Write-Log "Output: $($output -join ' | ')"
    }
}
catch {
    Write-Log "EXCEPTION  $($_.Exception.Message)"
}
finally {
    Remove-Item $lockFile -Force -ErrorAction SilentlyContinue
}
