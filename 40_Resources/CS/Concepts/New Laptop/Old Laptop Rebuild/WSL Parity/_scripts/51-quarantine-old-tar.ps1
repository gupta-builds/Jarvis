# 51-quarantine-old-tar.ps1  (Build 5, E8)  ASCII only.
# Moves D:\WSL\Installers\wsl-ubuntu.tar into a dated review folder under D:\Quarantine, ONLY if a newer verified export exists.
# Never deletes. Dry run unless -Apply is given.
param([switch]$Apply, [int]$ReviewDays = 30)
$ErrorActionPreference = 'Stop'
$old = 'D:\WSL\Installers\wsl-ubuntu.tar'
if (-not (Test-Path $old)) { throw "Old tar not found: $old" }
$oldSize = (Get-Item $old).Length
if ($oldSize -ne 39454945280) { throw "Old tar size changed ($oldSize); expected 39454945280. Stop and look." }
$newest = Get-ChildItem 'D:\Backup\WSL' -Filter 'ubuntu-*.tar.manifest.txt' -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending | Select-Object -First 1
if (-not $newest) { throw 'No verified export manifest in D:\Backup\WSL. Run 50-wsl-export-verify.ps1 first.' }
$m = @{}
Get-Content $newest.FullName | ForEach-Object { $p = $_.Split('=', 2); if ($p.Count -eq 2) { $m[$p[0]] = $p[1] } }
$newTar = $m['file']
if (-not (Test-Path $newTar)) { throw "Manifest points at a missing file: $newTar" }
if ((Get-Item $newTar).Length -ne [int64]$m['bytes']) { throw 'New export size does not match its manifest' }
Write-Host ('Newer verified export: {0} ({1:N2} GiB, sha256 {2})' -f $newTar, ((Get-Item $newTar).Length/1GB), $m['sha256'])
$review = (Get-Date).AddDays($ReviewDays).ToString('yyyy-MM-dd')
$dest = "D:\Quarantine\wsl-tar-review-$review"
Write-Host "Would move: $old -> $dest\wsl-ubuntu.tar"
if (-not $Apply) { Write-Host 'Dry run only. Re-run with -Apply to move.'; return }
New-Item -ItemType Directory -Path $dest -Force | Out-Null
Move-Item -Path $old -Destination (Join-Path $dest 'wsl-ubuntu.tar')
$note = @(
  'Moved by 51-quarantine-old-tar.ps1 on ' + (Get-Date -Format 's'),
  'Original: D:\WSL\Installers\wsl-ubuntu.tar, 39,454,945,280 bytes, written 2026-01-15, Ubuntu 24.04 rootfs tar',
  'Integrity (Build 5, 2026-10-13): tar -tf OK, 455,976 entries, sha256 d4a23e9195a20ffeed82b7eba706de89474935f502f08224c7203eb013eac326',
  'Replaced by verified export: ' + $newTar,
  'Review date: ' + $review + '. Delete only by hand after review. Rollback: move the file back to D:\WSL\Installers.'
)
[System.IO.File]::WriteAllLines((Join-Path $dest 'README.txt'), $note, [System.Text.Encoding]::ASCII)
Write-Host "Moved. Review by $review. Nothing was deleted."
