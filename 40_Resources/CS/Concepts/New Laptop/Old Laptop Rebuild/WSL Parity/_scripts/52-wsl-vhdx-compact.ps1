# 52-wsl-vhdx-compact.ps1  (Build 5, OPTIONAL, not recommended now)  ASCII only. Needs an elevated PowerShell.
# Compacts D:\WSL\Ubuntu\ext4.vhdx with diskpart after `wsl --shutdown`. Used 56 GiB inside a 107.6 GiB file, so about 50 GiB could return to D:.
# DOWNTIME: the whole WSL VM stops (Tailscale SSH offline, Docker WSL integration offline) for roughly 10 to 30 minutes.
# Before running: inside WSL run `sudo fstrim -av` once (otherwise freed blocks are not marked unused), and take the export from 50-wsl-export-verify.ps1.
# Dry run unless -Apply is given.
param([switch]$Apply)
$ErrorActionPreference = 'Stop'
$id = [Security.Principal.WindowsIdentity]::GetCurrent()
$isAdmin = (New-Object Security.Principal.WindowsPrincipal($id)).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
$vhdx = 'D:\WSL\Ubuntu\ext4.vhdx'
Write-Host ('VHDX now: {0:N2} GiB. Admin: {1}' -f ((Get-Item $vhdx).Length/1GB), $isAdmin)
if (-not $Apply) { Write-Host 'Dry run. Plan: wsl --shutdown; diskpart (select vdisk, attach readonly, compact, detach); restart distro.'; return }
if (-not $isAdmin) { throw 'Run from an elevated PowerShell' }
$backup = Get-ChildItem 'D:\Backup\WSL' -Filter 'ubuntu-*.tar.manifest.txt' -ErrorAction SilentlyContinue
if (-not $backup) { throw 'Refusing to compact without a verified export in D:\Backup\WSL' }
$a = Read-Host 'This shuts down ALL of WSL. Type YES'
if ($a -ne 'YES') { return }
wsl.exe --shutdown
Start-Sleep -Seconds 10
$dp = Join-Path $env:TEMP 'compact-ext4.txt'
$cmds = @("select vdisk file=`"$vhdx`"", 'attach vdisk readonly', 'compact vdisk', 'detach vdisk', 'exit')
[System.IO.File]::WriteAllLines($dp, $cmds, [System.Text.Encoding]::ASCII)
diskpart.exe /s $dp
Remove-Item $dp -Force
Write-Host ('VHDX after: {0:N2} GiB' -f ((Get-Item $vhdx).Length/1GB))
wsl.exe -d Ubuntu --exec true
Write-Host 'Distro restarted.'
