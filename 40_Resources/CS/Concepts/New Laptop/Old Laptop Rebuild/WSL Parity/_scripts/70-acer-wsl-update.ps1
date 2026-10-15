# 70-acer-wsl-update.ps1 (Acer, 2026-10-15). Updates the WSL platform (not the distro) from Windows PowerShell and verifies the result.
# Run it from Windows PowerShell, NOT from inside WSL: the update shuts WSL down, which ends every WSL session, editor server and Docker Desktop's WSL backend.
# Usage:  powershell.exe -NoProfile -ExecutionPolicy Bypass -File D:\WSL\ops\70-acer-wsl-update.ps1            (dry run, changes nothing)
#         powershell.exe -NoProfile -ExecutionPolicy Bypass -File D:\WSL\ops\70-acer-wsl-update.ps1 -Apply     (asks YES, then updates)
# ASCII only. PowerShell 5.1 safe. Writes a transcript to D:\WSL\ops\windows\logs\.
param([switch]$Apply, [string]$Distro = 'Ubuntu-24.04')
$ErrorActionPreference = 'Continue'
$env:WSL_UTF8 = '1'
$env:PSModulePath = [Environment]::GetEnvironmentVariable('PSModulePath', 'Machine')
$logDir = 'D:\WSL\ops\windows\logs'
if (-not (Test-Path -LiteralPath $logDir)) { New-Item -ItemType Directory -Force -Path $logDir | Out-Null }
$log = Join-Path $logDir ('70-acer-wsl-update-{0}.log' -f (Get-Date -Format 'yyyyMMdd-HHmmss'))
Start-Transcript -Path $log | Out-Null

function Show-State([string]$label) {
    Write-Host ('--- ' + $label)
    wsl.exe --version
    wsl.exe -l -v
}

Write-Host ('70-acer-wsl-update on ' + $env:COMPUTERNAME + '  apply=' + $Apply.IsPresent + '  distro=' + $Distro)
Show-State 'BEFORE'
Write-Host '--- wslconfig (non-secret keys)'
Get-Content -LiteralPath (Join-Path $env:USERPROFILE '.wslconfig') | ForEach-Object { Write-Host ('  ' + $_) }
$swap = 'D:\WSL\wsl-swap.vhdx'
if (Test-Path -LiteralPath $swap) { Write-Host ('swap file present: ' + $swap) } else { Write-Host ('WARNING: ' + $swap + ' is missing (WSL will create it on start)') }

if (-not $Apply) {
    Write-Host ''
    Write-Host 'DRY RUN: nothing changed. With -Apply this script will:'
    Write-Host '  1. ask you to type YES after you closed VS Code/Cursor windows attached to WSL, Docker Desktop and every WSL terminal'
    Write-Host '  2. run: wsl --update'
    Write-Host '  3. run: wsl --shutdown   (ends this WSL VM; the distro data is untouched)'
    Write-Host ('  4. start ' + $Distro + ' again and check: version, systemd, memory, CPUs, swap, no tailscale in WSL')
    Stop-Transcript | Out-Null
    exit 0
}

$answer = Read-Host 'Everything attached to WSL is closed? Type YES to update WSL'
if ($answer -cne 'YES') { Write-Host 'Cancelled.'; Stop-Transcript | Out-Null; exit 1 }

Write-Host '--- wsl --update'
wsl.exe --update
Write-Host ('update exit code: ' + $LASTEXITCODE)

Write-Host '--- wsl --shutdown (host step; ends the VM)'
wsl.exe --shutdown
Start-Sleep -Seconds 8

Write-Host ('--- starting ' + $Distro)
wsl.exe -d $Distro --exec true
Write-Host ('start exit code: ' + $LASTEXITCODE)
Start-Sleep -Seconds 5
Show-State 'AFTER'

Write-Host '--- checks inside the distro'
wsl.exe -d $Distro --exec bash -c 'echo "systemd: $(systemctl is-system-running)"; echo "failed units: $(systemctl --failed --no-legend | wc -l)"; free -h | sed -n 1,2p; echo "cpus: $(nproc)"; cat /proc/swaps; echo "tailscale in WSL: $(command -v tailscale || echo none)"; df -h / | tail -n 1'
Write-Host '--- tailscale on the Windows side'
tailscale.exe status 2>&1 | Select-Object -First 4

Write-Host ''
Write-Host ('Done. Log: ' + $log)
Write-Host 'Next: open Docker Desktop and your editors again, then tell the Claude session so it can verify and record the result.'
Stop-Transcript | Out-Null
