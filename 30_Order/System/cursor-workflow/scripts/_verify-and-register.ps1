$ErrorActionPreference = "Continue"
$vaultRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..\..\..")).Path
$aiConvRoot = Join-Path $vaultRoot "60_Claude\05_Clippings\AI Conversations"
$reg = Join-Path $PSScriptRoot "register-cursor-export-task.ps1"
& $reg
Write-Host "=== verify counts ==="
$wsl = (Get-ChildItem -Path (Join-Path $aiConvRoot "WSL\Cursor") -Recurse -Filter "*.md" | Where-Object { $_.Name -notlike "00 -*" -and $_.FullName -notmatch "_archive" }).Count
$win = (Get-ChildItem -Path (Join-Path $aiConvRoot "Windows\Cursor") -Recurse -Filter "*.md" | Where-Object { $_.Name -notlike "00 -*" -and $_.FullName -notmatch "_archive" }).Count
Write-Host "WSL notes: $wsl"
Write-Host "Windows notes: $win"
Write-Host "=== sample Windows note head ==="
Get-ChildItem (Join-Path $aiConvRoot "Windows\Cursor") -Recurse -Filter "*.md" |
  Where-Object { $_.Name -notlike "00 -*" -and $_.FullName -notmatch "_archive" } |
  Select-Object -First 1 |
  ForEach-Object { Write-Host $_.FullName; Get-Content $_.FullName -TotalCount 35 }
Write-Host "=== junctions? ==="
Get-ChildItem (Join-Path $aiConvRoot "Windows\Cursor") -Directory |
  ForEach-Object {
    $raw = Join-Path $_.FullName "_raw_jsonl"
    if (Test-Path $raw) {
      $item = Get-Item $raw
      Write-Host ("{0} attributes={1} target={2}" -f $raw, $item.Attributes, $item.Target)
    }
  }
