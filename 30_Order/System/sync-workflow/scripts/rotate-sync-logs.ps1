# Trims unbounded append-only Unison Sync-Log.md files down to a retention window,
# moving everything older into a dated archive file next to the source log.
# Nothing is deleted - old lines move to Sync-Log-Archive-<rotation-date>.md.
#
# Targets: 20_Progress/AI/Claude Code/_All-Projects-Sync-Log.md and every
# 20_Progress/AI/Claude Code/*/Sync-Log.md (per-project logs).
#
# Usage:
#   .\rotate-sync-logs.ps1                  # dry run, reports what would move, changes nothing
#   .\rotate-sync-logs.ps1 -Apply           # actually rotates
#   .\rotate-sync-logs.ps1 -Apply -RetentionDays 14
#
# Safety: the source `sync-all.sh` Scheduled Task appends to these files roughly every
# 15 minutes. Run -Apply only when you're not mid-sync (check the file's last-write time
# isn't seconds old), to avoid a write racing this script's rewrite of the same file.

param(
    [string]$ClaudeCodeRoot = "D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\AI\Claude Code",
    [int]$RetentionDays = 7,
    [switch]$Apply
)

$cutoff = (Get-Date).AddDays(-$RetentionDays)
$targets = @(Join-Path $ClaudeCodeRoot "_All-Projects-Sync-Log.md")
# Depth-1 only: each project's Sync-Log.md sits directly under its own folder.
# Deliberately not -Recurse - the bloat subtrees excluded elsewhere (gbrain/gstack node_modules)
# have path depths that blow past Windows MAX_PATH and error out a full recursive walk.
$targets += Get-ChildItem -Path $ClaudeCodeRoot -Directory | ForEach-Object {
    $candidate = Join-Path $_.FullName "Sync-Log.md"
    if (Test-Path -LiteralPath $candidate) { $candidate }
}
$targets = $targets | Select-Object -Unique | Where-Object { Test-Path -LiteralPath $_ }

$rotationDate = Get-Date -Format "yyyy-MM-dd"
$dateLineRegex = '^(\d{4}-\d{2}-\d{2})'

foreach ($path in $targets) {
    $lines = Get-Content -LiteralPath $path -Encoding UTF8
    if ($lines.Count -eq 0) { continue }

    # Preserve a leading YAML frontmatter block + any non-dated header lines as-is.
    $bodyStartIndex = 0
    if ($lines[0] -eq '---') {
        $closeIndex = ($lines | Select-Object -Skip 1 | Select-String -Pattern '^---$' | Select-Object -First 1).LineNumber
        if ($closeIndex) { $bodyStartIndex = $closeIndex + 1 }
    }
    while ($bodyStartIndex -lt $lines.Count -and $lines[$bodyStartIndex] -notmatch $dateLineRegex) {
        $bodyStartIndex++
    }
    $header = $lines[0..([Math]::Max($bodyStartIndex - 1, -1))]
    $body = if ($bodyStartIndex -lt $lines.Count) { $lines[$bodyStartIndex..($lines.Count - 1)] } else { @() }

    $keep = New-Object System.Collections.Generic.List[string]
    $archive = New-Object System.Collections.Generic.List[string]
    foreach ($line in $body) {
        $isOld = $false
        if ($line -match $dateLineRegex) {
            $lineDate = [datetime]::ParseExact($Matches[1], 'yyyy-MM-dd', $null)
            if ($lineDate -lt $cutoff) { $isOld = $true }
        }
        if ($isOld) { $archive.Add($line) } else { $keep.Add($line) }
    }

    if ($archive.Count -eq 0) {
        Write-Output "$path : nothing older than $RetentionDays days, no change"
        continue
    }

    $archivePath = Join-Path (Split-Path $path -Parent) ("Sync-Log-Archive-$rotationDate.md")
    Write-Output "$path : $($archive.Count) lines older than $RetentionDays days -> $archivePath ($($keep.Count) lines stay active)"

    if ($Apply) {
        Add-Content -LiteralPath $archivePath -Value $archive -Encoding UTF8
        $newContent = $header + $keep
        Set-Content -LiteralPath $path -Value $newContent -Encoding UTF8
    }
}

if (-not $Apply) {
    Write-Output "`nDry run only - no files changed. Re-run with -Apply to rotate."
}
