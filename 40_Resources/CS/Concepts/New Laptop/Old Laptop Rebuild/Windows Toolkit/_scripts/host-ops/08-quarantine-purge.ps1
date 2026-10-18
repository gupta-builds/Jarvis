# 08-quarantine-purge.ps1  (Build 4b follow-up, 2026-10-17)  ASCII only. PowerShell 5.1 and 7 safe. No admin needed.
#   powershell -ExecutionPolicy Bypass -File D:\WSL\ops\windows\08-quarantine-purge.ps1            (dry run: checks, inventory, nothing deleted)
#   powershell -ExecutionPolicy Bypass -File D:\WSL\ops\windows\08-quarantine-purge.ps1 -Apply     (verifies, writes the context record, asks YES, deletes)
# Purpose: the Dell quarantine existed only so that, if something broke, there was context on what existed before. Everything is working and
# verified, so the quarantine folders are deleted. The CONTEXT is kept: an inventory record (names, sizes, file counts, READMEs, hashes) is written
# to D:\Backup\Quarantine-record\ before anything is deleted, and the key facts are copied into the vault by Claude afterwards.
# NEVER touched: D:\Backup\WSL (the only WSL backup), D:\Backup\Toolkit, D:\Backup\dotfiles-*, D:\Backup\GameSaves, D:\Backup\Quarantine itself (stays, empty).
# The only extra delete outside the quarantine: the malformed copy of the export manifest (D:\Backup\WSL\*.manifest.txt.malformed).
param([switch]$Apply)
$ErrorActionPreference = 'Stop'
$dry = -not $Apply
$logDir = 'D:\WSL\ops\windows\logs'
if (-not (Test-Path $logDir)) { New-Item -ItemType Directory -Path $logDir -Force | Out-Null }
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$log = Join-Path $logDir ('quarantine-purge-' + $stamp + '.log')
try { Start-Transcript -Path (Join-Path $logDir ('quarantine-purge-' + $stamp + '.transcript.txt')) -Force | Out-Null } catch { }
function Log([string]$m) { $l = (Get-Date -Format 'HH:mm:ss') + ' ' + $m; Write-Host $l; Add-Content -Path $log -Value $l -Encoding ASCII }
Log ("quarantine purge. DryRun={0}  Log: {1}" -f $dry, $log)
$q = 'D:\Backup\Quarantine'
$recDir = 'D:\Backup\Quarantine-record'
$fail = 0

# ---- 1. checks that everything works and the one surviving WSL backup is intact
Log '== 1 checks (all must pass before anything is deleted)'
function Check([string]$name, [bool]$ok, [string]$detail) { if (-not $ok) { $script:fail++ }; Log ("  {0,-4} {1}  {2}" -f $(if ($ok) { 'OK' } else { 'FAIL' }), $name, $detail) }
$man = Get-ChildItem 'D:\Backup\WSL' -Filter 'ubuntu-*.tar.manifest.txt' -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending | Select-Object -First 1
if (-not $man) { Check 'surviving WSL export manifest' $false 'none found in D:\Backup\WSL' }
else {
  $m = @{}; Get-Content $man.FullName | ForEach-Object { $p = $_.Split('=', 2); if ($p.Count -eq 2) { $m[$p[0]] = $p[1] } }
  $okSize = (Test-Path $m['file']) -and ((Get-Item $m['file']).Length -eq [int64]$m['bytes'])
  Check 'surviving WSL export size matches manifest' $okSize ("{0} ({1:N2} GiB)" -f $m['file'], ([int64]$m['bytes'] / 1GB))
  if ($okSize) {
    $sw = [Diagnostics.Stopwatch]::StartNew(); $h = (Get-FileHash -Algorithm SHA256 -Path $m['file']).Hash.ToLower()
    Check 'surviving WSL export SHA-256 matches manifest' ($h -eq $m['sha256']) ("{0:N1} min" -f $sw.Elapsed.TotalMinutes)
  }
}
$sys = ((wsl.exe -d Ubuntu --exec systemctl is-system-running 2>$null) -join '').Trim()
Check 'WSL Ubuntu systemd running' ($sys -eq 'running') $sys
$ts = ((wsl.exe -d Ubuntu --exec tailscale status 2>$null) -join ' ')
Check 'Tailscale lists dell-wsl' ($ts -match 'dell-wsl') ''
$cur = Join-Path $env:LOCALAPPDATA 'Programs\cursor\Cursor.exe'
Check 'Cursor installed' (Test-Path $cur) $(if (Test-Path $cur) { (Get-Item $cur).VersionInfo.ProductVersion } else { 'missing' })
Check 'OpenClaw is gone' (-not (Get-Command openclaw -ErrorAction SilentlyContinue)) ''
Check 'toolkit lock present' (Test-Path 'D:\Users\_Anant\10_Areas\Documents\Jarvis\40_Resources\CS\Concepts\New Laptop\Old Laptop Rebuild\Windows Toolkit\toolkit.lock.json') ''
Check 'no Cursor update in progress' (@(Get-Process -Name inno_updater -ErrorAction SilentlyContinue).Count -eq 0) ''
if ($fail -gt 0) { Log ("STOP: {0} check(s) failed. Nothing was deleted." -f $fail); Log "DONE. Log: $log"; try { Stop-Transcript | Out-Null } catch { }; exit 2 }

# ---- 2. inventory
Log '== 2 inventory of what would be deleted'
$items = @(Get-ChildItem $q -Directory -Force -ErrorAction SilentlyContinue)
$rec = New-Object System.Collections.ArrayList
[void]$rec.Add("Quarantine context record, written " + (Get-Date -Format 's') + " by 08-quarantine-purge.ps1 on " + $env:COMPUTERNAME)
[void]$rec.Add("Purpose: what existed in D:\Backup\Quarantine before it was deleted. The files are gone; this list is the context.")
$total = 0
foreach ($d in $items) {
  $files = @(Get-ChildItem -LiteralPath $d.FullName -Recurse -Force -File -ErrorAction SilentlyContinue)
  $bytes = ($files | Measure-Object Length -Sum).Sum; if (-not $bytes) { $bytes = 0 }
  $total += $bytes
  Log ("  {0,-48} {1,8:N2} GiB {2,8:N0} files" -f $d.Name, ($bytes / 1GB), $files.Count)
  [void]$rec.Add(""); [void]$rec.Add(("== {0}  {1:N2} GiB  {2} files" -f $d.Name, ($bytes / 1GB), $files.Count))
  foreach ($c in (Get-ChildItem -LiteralPath $d.FullName -Force -ErrorAction SilentlyContinue)) {
    $cf = @(Get-ChildItem -LiteralPath $c.FullName -Recurse -Force -File -ErrorAction SilentlyContinue); $cb = ($cf | Measure-Object Length -Sum).Sum; if (-not $cb) { $cb = 0 }
    [void]$rec.Add(("   {0}  {1:N3} GiB  {2} files" -f $c.Name, ($cb / 1GB), $cf.Count))
  }
  foreach ($r in (Get-ChildItem -LiteralPath $d.FullName -Force -File -Filter 'README*' -ErrorAction SilentlyContinue)) { [void]$rec.Add("   README: " + ((Get-Content -LiteralPath $r.FullName -TotalCount 6) -join ' | ')) }
  foreach ($r in (Get-ChildItem -LiteralPath $d.FullName -Force -File -Filter 'undo.txt' -ErrorAction SilentlyContinue)) { [void]$rec.Add("   undo.txt lines: " + @(Get-Content -LiteralPath $r.FullName).Count + " (restore steps for the move that created this folder)") }
}
[void]$rec.Add(""); [void]$rec.Add(("TOTAL {0:N2} GiB in {1} folders" -f ($total / 1GB), $items.Count))
[void]$rec.Add("Old WSL tar (wsl-tar-review-2026-11-14): written 2026-01-15, 39,454,945,280 bytes, 455,976 entries, SHA-256 d4a23e9195a20ffeed82b7eba706de89474935f502f08224c7203eb013eac326; superseded by D:\Backup\WSL\ubuntu-20261014-233219.tar (no import test was ever run on either).")
$malformed = Get-ChildItem 'D:\Backup\WSL' -Filter '*.manifest.txt.malformed' -ErrorAction SilentlyContinue
Log ("  malformed manifest copy to delete: {0}" -f $(if ($malformed) { ($malformed | ForEach-Object Name) -join ', ' } else { 'none' }))
Log ("  TOTAL {0:N2} GiB" -f ($total / 1GB))
Log '  NOTE: c-deep-clean-review includes the Brave and Opera browser profiles (bookmarks and any saved logins; neither browser is installed), JetBrains settings, Outlook/Office caches, Medal, WPS and old installers.'
Log '  NOTE: keep list (not touched): D:\Backup\WSL, D:\Backup\Toolkit, D:\Backup\dotfiles-*, D:\Backup\GameSaves.'

if ($dry) { Log 'DRY RUN: nothing deleted. Re-run with -Apply.'; Log "DONE. Log: $log"; try { Stop-Transcript | Out-Null } catch { }; exit 0 }

# ---- 3. confirm, record, delete
$a = Read-Host ("Delete {0:N2} GiB in {1} quarantine folders? The context record is written first. Type YES to continue" -f ($total / 1GB), $items.Count)
if ($a -ne 'YES') { Log 'Not confirmed. Nothing deleted.'; Log "DONE. Log: $log"; try { Stop-Transcript | Out-Null } catch { }; exit 0 }
if (-not (Test-Path $recDir)) { New-Item -ItemType Directory -Path $recDir -Force | Out-Null }
$recFile = Join-Path $recDir ('quarantine-record-' + (Get-Date -Format 'yyyy-MM-dd') + '.txt')
[IO.File]::WriteAllLines($recFile, [string[]]$rec, (New-Object Text.ASCIIEncoding))
Log ("context record written: {0}" -f $recFile)
$before = (Get-PSDrive D).Free
foreach ($d in $items) {
  Log ("  deleting {0}" -f $d.Name)
  & cmd.exe /c ('rd /s /q "\\?\' + $d.FullName + '"') 2>&1 | Out-Null
  if (Test-Path -LiteralPath $d.FullName) { Log ("    STILL THERE after rd: {0} (locked or protected; re-run or delete by hand)" -f $d.Name) } else { Log '    gone' }
}
foreach ($f in $malformed) { Remove-Item -LiteralPath $f.FullName -Force; Log ("  deleted {0}" -f $f.Name) }
$after = (Get-PSDrive D).Free
Log ("D: free {0:N1} -> {1:N1} GiB (freed {2:N2} GiB)" -f ($before / 1GB), ($after / 1GB), (($after - $before) / 1GB))
Log ("remaining in {0}: {1}" -f $q, @(Get-ChildItem $q -Force -ErrorAction SilentlyContinue).Count)
Log "DONE. Log: $log"
try { Stop-Transcript | Out-Null } catch { }
