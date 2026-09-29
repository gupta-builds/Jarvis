$ErrorActionPreference = "Continue"
$env:PYTHONIOENCODING = "utf-8"
$py = (Get-Command py).Source
$ex = "D:\_Anant\20_Progress\Documents\Jarvis\30_Order\System\cursor-workflow\scripts\export-cursor-sessions.py"
Write-Host "=== FULL BACKFILL ==="
& $py $ex --backfill
Write-Host "EXIT: $LASTEXITCODE"
Write-Host "=== SECOND BACKFILL (expect zero writes) ==="
& $py $ex --backfill
Write-Host "EXIT2: $LASTEXITCODE"
