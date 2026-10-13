# 50-wsl-export-verify.ps1  (Build 5, E8)  ASCII only, PowerShell 5.1 and 7 safe.
# Takes a FRESH export of the Ubuntu distro to D:\Backup\WSL and verifies it (size, tar listing, SHA-256, manifest).
# Run from a normal (non-admin) PowerShell on the Dell, NOT from inside WSL:   powershell -ExecutionPolicy Bypass -File D:\WSL\ops\50-wsl-export-verify.ps1
# DOWNTIME: the distro is terminated for the export (about 10 to 25 minutes). Tailscale inside WSL goes offline, so the Acer loses SSH
# until the script restarts the distro at the end. Close editors and Codex sessions first. Use -NoTerminate to export a running distro (not recommended).
param(
  [string]$Distro = 'Ubuntu',
  [string]$OutDir = 'D:\Backup\WSL',
  [switch]$NoTerminate
)
$ErrorActionPreference = 'Stop'
$log = 'D:\WSL\ops\windows\logs\wsl-export-' + (Get-Date -Format 'yyyyMMdd-HHmmss') + '.log'
if (-not (Test-Path (Split-Path $log))) { New-Item -ItemType Directory -Path (Split-Path $log) -Force | Out-Null }
function Log([string]$m) { $line = (Get-Date -Format 'HH:mm:ss') + ' ' + $m; Write-Host $line; Add-Content -Path $log -Value $line -Encoding ASCII }

$vhdx = 'D:\WSL\Ubuntu\ext4.vhdx'
if (-not (Test-Path $vhdx)) { throw "VHDX not found: $vhdx" }
$free = (Get-PSDrive D).Free
$need = 80GB
Log ('D: free {0:N1} GiB, need at least {1} GiB' -f ($free/1GB), ($need/1GB))
if ($free -lt $need) { throw 'Not enough free space on D:' }
if (-not (Test-Path $OutDir)) { New-Item -ItemType Directory -Path $OutDir | Out-Null }
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$tar = Join-Path $OutDir ("ubuntu-" + $stamp + ".tar")
Log "Target: $tar"
if (-not $NoTerminate) {
  Write-Host 'This stops the Ubuntu distro (Tailscale SSH goes offline) until the export finishes.'
  $a = Read-Host 'Type YES to continue'
  if ($a -ne 'YES') { Log 'Cancelled by user'; return }
  Log 'wsl --terminate'
  wsl.exe --terminate $Distro
  Start-Sleep -Seconds 8
}
$sw = [System.Diagnostics.Stopwatch]::StartNew()
Log 'wsl --export (this takes a while)'
wsl.exe --export $Distro $tar
if ($LASTEXITCODE -ne 0) { throw "wsl --export failed with exit code $LASTEXITCODE" }
Log ('export finished in {0:N1} min' -f $sw.Elapsed.TotalMinutes)

$size = (Get-Item $tar).Length
Log ('size {0:N0} bytes ({1:N2} GiB)' -f $size, ($size/1GB))
if ($size -lt 20GB) { throw 'Export is suspiciously small' }
$sw.Restart()
$entries = 0
& tar.exe -tf $tar 2>$null | ForEach-Object { $entries++ }
if ($LASTEXITCODE -ne 0) { throw "tar -tf failed with exit code $LASTEXITCODE" }
Log ('tar -tf OK, {0:N0} entries, {1:N1} min' -f $entries, $sw.Elapsed.TotalMinutes)
$sw.Restart()
$hash = (Get-FileHash -Algorithm SHA256 -Path $tar).Hash.ToLower()
Log ('SHA-256 {0} ({1:N1} min)' -f $hash, $sw.Elapsed.TotalMinutes)
$manifest = $tar + '.manifest.txt'
$lines = @(
  'file=' + $tar, 'bytes=' + $size, 'entries=' + $entries, 'sha256=' + $hash,
  'verified=tar-listing+sha256 (no import test)', 'created=' + (Get-Date -Format 's'),
  'distro=' + $Distro, 'vhdx_bytes=' + (Get-Item $vhdx).Length
)
[System.IO.File]::WriteAllLines($manifest, $lines, [System.Text.Encoding]::ASCII)
[System.IO.File]::WriteAllText($tar + '.sha256', ($hash + '  ' + (Split-Path $tar -Leaf) + "`n"), [System.Text.Encoding]::ASCII)
Log "Manifest: $manifest"

Log 'Restarting the distro so Tailscale and services come back'
wsl.exe -d $Distro --exec true
Start-Sleep -Seconds 10
$state = wsl.exe -d $Distro --exec systemctl is-system-running 2>&1
Log ('systemd: ' + ($state -join ' '))
Log 'DONE. Next: run 51-quarantine-old-tar.ps1 (dry run by default).'
