# 60-build5b-host.ps1  (Build 5b, 2026-10-13)  ASCII only. PowerShell 5.1 and 7 safe. No admin needed.
# ONE script for every Windows-side step of Build 5b. Run it from a WINDOWS PowerShell tab (not from inside WSL):
#   powershell -ExecutionPolicy Bypass -File D:\WSL\ops\60-build5b-host.ps1
# Stages run in this order and each asks you to type YES first:
#   ChatGPT    remove "ChatGPT Classic" (Store package OpenAI.ChatGPT-Desktop); the app now named "ChatGPT" (package OpenAI.Codex) stays
#   Cursor     repair a broken install (already repaired 2026-10-14; do not re-run unless it breaks again). Never force-kills Cursor: waits for its updater, closes windows gracefully.
#   Export     fresh verified export of the Ubuntu distro to D:\Backup\WSL (about 10 to 25 minutes of WSL downtime)
#   Quarantine move the old wsl-ubuntu.tar into D:\Backup\Quarantine for review (only after a verified export exists; never deletes)
# Options:  -Stages Export,Quarantine (required; a comma list works through -File)   -Apply (without it: dry run, prints the plan, changes nothing)
# Everything that is moved goes to D:\Backup\Quarantine\<name>-<date>. Nothing under %APPDATA%\Cursor\User or ~\.cursor is touched.
param(
  [string]$Stages = '',      # comma list as ONE string: -Stages Export,Quarantine (powershell -File passes it unsplit; split below)
  [switch]$Apply,            # without -Apply this is a dry run: prints the plan, changes nothing
  [string]$Distro = 'Ubuntu'
)
$ErrorActionPreference = 'Stop'
$DryRun = -not $Apply
$StageList = @($Stages -split '[,; ]+' | Where-Object { $_ })
$valid = 'ChatGPT', 'Cursor', 'Export', 'Verify', 'Quarantine'
$bad = @($StageList | Where-Object { $valid -notcontains $_ })
if ($StageList.Count -eq 0 -or $bad.Count -gt 0) { Write-Host ('Usage: -Stages <comma list of: ' + ($valid -join ', ') + '> [-Apply]   (no -Apply = dry run). Bad or missing: ' + ($bad -join ',')); exit 2 }
$date = Get-Date -Format 'yyyy-MM-dd'
$logDir = 'D:\WSL\ops\windows\logs'
if (-not (Test-Path $logDir)) { New-Item -ItemType Directory -Path $logDir -Force | Out-Null }
$log = Join-Path $logDir ('build5b-host-' + (Get-Date -Format 'yyyyMMdd-HHmmss') + '.log')
function Log([string]$m) { $l = (Get-Date -Format 'HH:mm:ss') + ' ' + $m; Write-Host $l; Add-Content -Path $log -Value $l -Encoding ASCII }
function Confirm-Stage([string]$what) {
  if ($DryRun) { Log "[dry run] would ask: $what"; return $false }
  $a = Read-Host ("$what  Type YES to continue (anything else skips)")
  return ($a -eq 'YES')
}
$quar = 'D:\Backup\Quarantine'
function Quarantine-Move([string]$src, [string]$name) {
  if (-not (Test-Path $src)) { Log "  absent, skipped: $src"; return }
  $dest = Join-Path $quar ($name + '-' + $date)
  if (-not (Test-Path $dest)) { New-Item -ItemType Directory -Path $dest -Force | Out-Null }
  Move-Item -Path $src -Destination $dest -Force
  Log "  moved $src -> $dest"
}
try { Start-Transcript -Path ($log -replace '\.log$', '.transcript.txt') -Force | Out-Null } catch { }
Log "Build 5b host script. Stages: $($StageList -join ',')  DryRun=$DryRun  Log: $log"
# Cursor's updater state = last 'update#setState' line of the newest main.log. NEVER kill Cursor while it is checking/downloading/downloaded/updating:
# that is what broke the install on 2026-09-06 and 2026-10-14 (force-kill landed during the apply, "Moving: resources ... os error 5").
function Get-CursorUpdaterState {
  $ml = Get-ChildItem (Join-Path $env:APPDATA 'Cursor\logs') -Recurse -Filter main.log -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending | Select-Object -First 1
  if (-not $ml) { return 'unknown' }
  $l = Select-String -Path $ml.FullName -Pattern 'update#setState' -ErrorAction SilentlyContinue | Select-Object -Last 1
  if (-not $l) { return 'unknown' }
  return ($l.Line -replace '^.*update#setState\s*', '').Trim()
}
function Wait-CursorUpdaterIdle([int]$maxSeconds = 600) {
  $busy = 'checking for updates', 'downloading', 'downloaded', 'updating'
  $t = 0
  while ($busy -contains (Get-CursorUpdaterState) -and $t -lt $maxSeconds) { if ($t % 30 -eq 0) { Log ("    waiting for Cursor updater (state: {0})" -f (Get-CursorUpdaterState)) }; Start-Sleep -Seconds 5; $t += 5 }
  return ($busy -notcontains (Get-CursorUpdaterState))
}
# Close every Cursor window gracefully, then wait. Returns $true when no Cursor process is left. Never Stop-Process.
function Close-CursorGracefully([int]$maxSeconds = 90) {
  $t = 0
  while (@(Get-Process -Name Cursor -ErrorAction SilentlyContinue).Count -gt 0 -and $t -lt $maxSeconds) {
    Get-Process -Name Cursor -ErrorAction SilentlyContinue | Where-Object { $_.MainWindowHandle -ne 0 } | ForEach-Object { $_.CloseMainWindow() | Out-Null }
    Start-Sleep -Seconds 5; $t += 5
  }
  return (@(Get-Process -Name Cursor -ErrorAction SilentlyContinue).Count -eq 0)
}

# ---------------------------------------------------------------- ChatGPT
if ($StageList -contains 'ChatGPT') {
  Log '== Stage ChatGPT'
  $classic = Get-AppxPackage -Name 'OpenAI.ChatGPT-Desktop'
  $new = Get-AppxPackage -Name 'OpenAI.Codex'
  if ($new) { Log ("  keeping: {0} {1} (Store name 'ChatGPT', status {2})" -f $new.Name, $new.Version, $new.Status) } else { Log '  WARNING: OpenAI.Codex (the new ChatGPT app) is not installed; removal skipped' }
  if (-not $classic) { Log '  ChatGPT Classic is not installed (already removed)' }
  elseif (-not $new) { Log '  not removing Classic because the replacement app is missing' }
  elseif (Confirm-Stage ("Remove ChatGPT Classic {0}?" -f $classic.Version)) {
    Get-Process | Where-Object { $_.Path -and $_.Path -like ($classic.InstallLocation + '*') } | ForEach-Object { Log ("  stopping pid {0}" -f $_.Id); Stop-Process -Id $_.Id -Force }
    Remove-AppxPackage -Package $classic.PackageFullName
    if (Get-AppxPackage -Name 'OpenAI.ChatGPT-Desktop') { Log '  FAILED: Classic still present' } else { Log '  removed ChatGPT Classic' }
    $after = Get-AppxPackage -Name 'OpenAI.Codex'
    Log ("  new ChatGPT app still installed: {0} status {1}" -f $after.Version, $after.Status)
  }
}

# ---------------------------------------------------------------- Cursor
if ($StageList -contains 'Cursor') {
  Log '== Stage Cursor'
  $inst = Join-Path $env:LOCALAPPDATA 'Programs\cursor'
  $roam = Join-Path $env:APPDATA 'Cursor'
  $broken = -not (Test-Path (Join-Path $inst 'Cursor.exe'))
  Log ("  install dir: {0}  Cursor.exe in root: {1}  staged _\Cursor.exe: {2}" -f $inst, (-not $broken), (Test-Path (Join-Path $inst '_\Cursor.exe')))
  if (-not (Get-Command winget -ErrorAction SilentlyContinue)) { Log '  winget not found; cannot reinstall' }
  elseif (Confirm-Stage 'Repair Cursor (quarantine broken install + stale startup state, reinstall with winget, test launch)?') {
    if (@(Get-Process -Name inno_updater -ErrorAction SilentlyContinue).Count -gt 0) { Log '  inno_updater is running: not touching Cursor. Wait a minute and re-run.'; Log "DONE. Log: $log"; try { Stop-Transcript | Out-Null } catch { }; exit 3 }
    if (-not (Wait-CursorUpdaterIdle)) { Log '  Cursor updater still busy after 10 min: stopping here, nothing changed.'; Log "DONE. Log: $log"; try { Stop-Transcript | Out-Null } catch { }; exit 3 }
    if (-not (Close-CursorGracefully)) { Log '  Cursor did not close by itself (check for a second window, e.g. Cursor Agents). Close it by hand and re-run. Nothing was killed.'; Log "DONE. Log: $log"; try { Stop-Transcript | Out-Null } catch { }; exit 3 }
    # 1. the broken install (3.19.7 files + stranded 3.19.13 in _\ + _bak + empty update journal)
    if ($broken) { Quarantine-Move $inst 'cursor-broken-install' } else { Log '  Cursor.exe is present; quarantining the install anyway for a clean reinstall'; Quarantine-Move $inst 'cursor-old-install' }
    # 2. regenerable startup state; User\, snapshots\, WebStorage\ and ~\.cursor (settings, chats, extensions, rules) are NOT touched
    foreach ($n in 'update-supervisor', 'Crashpad', 'Cache', 'Code Cache', 'GPUCache', 'DawnGraphiteCache', 'DawnWebGPUCache', 'GrpcCache', 'CachedData', 'CachedExtensionVSIXs', 'process-monitor', 'blob_storage') {
      $p = Join-Path $roam $n
      if (Test-Path $p) { Quarantine-Move $p ('cursor-state-' + ($n -replace ' ', '')) }
    }
    $oldLogs = Get-ChildItem (Join-Path $roam 'logs') -Directory -ErrorAction SilentlyContinue | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-7) }
    foreach ($d in $oldLogs) { Quarantine-Move $d.FullName 'cursor-oldlogs' }
    # 3. reinstall
    Log '  winget install Anysphere.Cursor'
    # stale registration (install dir was just quarantined) makes plain install say "already installed": drop it, then force. The $null pipe keeps winget from eating console input.
    $null | winget uninstall --id Anysphere.Cursor --exact --silent 2>&1 | Out-Null
    $null | winget install --id Anysphere.Cursor --exact --silent --force --accept-package-agreements --accept-source-agreements
    Log ("  winget exit code {0}" -f $LASTEXITCODE)
    $exe = Join-Path $inst 'Cursor.exe'
    $alive = 0
    if (-not (Test-Path $exe)) { Log '  FAILED: Cursor.exe missing after install. Download the user installer from cursor.com/download and run it, then re-run this stage.' }
    else {
      Log ("  installed: {0}" -f (Get-Item $exe).VersionInfo.ProductVersion)
      # 4. launch test, with fallbacks that identify the culprit
      $tests = @(@{ n = 'normal'; a = @() }, @{ n = 'no-extensions'; a = @('--disable-extensions') }, @{ n = 'no-gpu'; a = @('--disable-gpu') })
      foreach ($t in $tests) {
        Log ("  launch test: {0}" -f $t.n)
        if ($t.a.Count -gt 0) { $p = Start-Process -FilePath $exe -ArgumentList $t.a -PassThru } else { $p = Start-Process -FilePath $exe -PassThru }
        Start-Sleep -Seconds 60
        $alive = @(Get-Process -ErrorAction SilentlyContinue | Where-Object { $_.Name -eq 'Cursor' }).Count
        Log ("    Cursor processes alive after 60 s: {0}  updater state: {1}" -f $alive, (Get-CursorUpdaterState))
        # let a started self-update finish BEFORE closing; never Stop-Process (a kill mid-apply is the root cause of the 2026-09-06 and 2026-10-14 breakages)
        if (-not (Wait-CursorUpdaterIdle)) { Log '    updater still busy after 10 min; leaving Cursor open. Close it by hand later.'; break }
        if (-not (Close-CursorGracefully)) { Log '    Cursor did not close by itself; leaving it open. Close it by hand.'; break }
        if ($alive -ge 3) {
          Log ("  RESULT: Cursor launches ({0})" -f $t.n)
          if ($t.n -ne 'normal') { Log '  A normal launch failed but this mode works: tell Claude which mode so the cause (extension or GPU) can be isolated.' }
          break
        }
      }
      if ($alive -lt 3) {
        $ml = Get-ChildItem (Join-Path $roam 'logs') -Recurse -Filter main.log -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending | Select-Object -First 1
        if ($ml) { Log ('  newest main.log: ' + $ml.FullName); Get-Content $ml.FullName -Tail 15 | ForEach-Object { Log ('    ' + $_) } }
        Log '  RESULT: Cursor still does not launch. Send this log to Claude.'
      }
    }
  }
}

# Verification of an export tar: GNU tar inside WSL lists every entry (Windows tar.exe cannot read ~56 pax names and exits nonzero, which in PS 5.1 aborted
# the 2026-10-14 run), then SHA-256, then the manifest. No import test is run.
function Write-ExportManifest([string]$tar) {
  $sw = [System.Diagnostics.Stopwatch]::StartNew()
  $size = (Get-Item $tar).Length
  Log ('  verifying {0}  size {1:N0} bytes ({2:N2} GiB)' -f $tar, $size, ($size / 1GB))
  if ($size -lt 20GB) { throw 'Export is suspiciously small' }
  $wslPath = ((wsl.exe -d $Distro --exec wslpath -a $tar) -join '').Trim()
  if (-not $wslPath.StartsWith('/mnt/')) { throw "could not convert path to WSL form: $wslPath" }
  $prev = $ErrorActionPreference; $ErrorActionPreference = 'Continue'
  $helper = ((wsl.exe -d $Distro --exec wslpath -a 'D:\WSL\ops\windows\verify-tar.sh') -join '').Trim()   # helper file: no quotes pass through PS 5.1 argument handling
  $out = @(wsl.exe -d $Distro --exec bash $helper $wslPath 2>$null)
  $ErrorActionPreference = $prev
  $entries = 0; $rc = 'missing'; $notes = '?'
  foreach ($o in $out) { if ($o -match '^entries=(\d+)') { $entries = [int64]$Matches[1] } elseif ($o -match '^rc=(\d+)') { $rc = $Matches[1] } elseif ($o -match '^notes=(\d+)') { $notes = $Matches[1] } }
  Log ('  helper output: ' + ($out -join ' | '))
  if ($rc -ne '0') { throw "GNU tar -tf failed with exit code $rc" }
  if ($entries -lt 100000) { throw "suspiciously few entries: $entries" }
  Log ('  GNU tar -tf OK: {0:N0} entries, exit 0, {1} stderr lines other than xattr notices, {2:N1} min' -f $entries, $notes, $sw.Elapsed.TotalMinutes)
  $sw.Restart(); $hash = (Get-FileHash -Algorithm SHA256 -Path $tar).Hash.ToLower()
  Log ('  SHA-256 {0} ({1:N1} min)' -f $hash, $sw.Elapsed.TotalMinutes)
  $vhdx = 'D:\WSL\Ubuntu\ext4.vhdx'
  $vb = 0; if (Test-Path $vhdx) { $vb = (Get-Item $vhdx).Length }
  $lines = @(('file=' + $tar), ('bytes=' + $size), ('entries=' + $entries), ('sha256=' + $hash), 'verified=GNU tar listing (exit 0) + sha256; NO import test was run', ('created=' + (Get-Date -Format 's')), ('distro=' + $Distro), ('vhdx_bytes=' + $vb))   # parentheses matter: comma binds tighter than +
  [System.IO.File]::WriteAllLines($tar + '.manifest.txt', [string[]]$lines, [System.Text.Encoding]::ASCII)
  [System.IO.File]::WriteAllText($tar + '.sha256', ($hash + '  ' + (Split-Path $tar -Leaf) + "`n"), [System.Text.Encoding]::ASCII)
  Log ('  manifest written: {0}.manifest.txt' -f $tar)
}

# ---------------------------------------------------------------- Export
if ($StageList -contains 'Export') {
  Log '== Stage Export'
  $vhdx = 'D:\WSL\Ubuntu\ext4.vhdx'
  $outDir = 'D:\Backup\WSL'
  $free = (Get-PSDrive D).Free
  Log ('  D: free {0:N1} GiB; need at least 80 GiB' -f ($free / 1GB))
  if ($free -lt 80GB) { Log '  not enough space; skipping Export' }
  elseif (Confirm-Stage 'Export the Ubuntu distro now? WSL stops for 10 to 25 minutes; Tailscale SSH to the Dell goes offline and returns by itself afterwards.') {
    if (-not (Test-Path $outDir)) { New-Item -ItemType Directory -Path $outDir | Out-Null }
    $tar = Join-Path $outDir ('ubuntu-' + (Get-Date -Format 'yyyyMMdd-HHmmss') + '.tar')
    Log '  wsl --terminate'; wsl.exe --terminate $Distro; Start-Sleep -Seconds 8
    $sw = [System.Diagnostics.Stopwatch]::StartNew()
    Log "  wsl --export -> $tar"
    wsl.exe --export $Distro $tar
    if ($LASTEXITCODE -ne 0) { throw "wsl --export failed with exit code $LASTEXITCODE" }
    Log ('  export finished in {0:N1} min' -f $sw.Elapsed.TotalMinutes)
    $size = (Get-Item $tar).Length
    Log ('  size {0:N0} bytes ({1:N2} GiB)' -f $size, ($size / 1GB))
    if ($size -lt 20GB) { throw 'Export is suspiciously small' }
    # restart FIRST so downtime ends now and a verify problem can never leave WSL down
    Log '  restarting the distro so Tailscale and services come back'
    wsl.exe -d $Distro --exec true; Start-Sleep -Seconds 10
    Log ('  systemd: ' + ((wsl.exe -d $Distro --exec systemctl is-system-running 2>&1) -join ' '))
    Write-ExportManifest $tar
  }
}

# ---------------------------------------------------------------- Verify (manifest for an export that has none)
if ($StageList -contains 'Verify') {
  Log '== Stage Verify'
  $cand = Get-ChildItem 'D:\Backup\WSL' -Filter 'ubuntu-*.tar' -ErrorAction SilentlyContinue | Where-Object { -not (Test-Path ($_.FullName + '.manifest.txt')) } | Sort-Object LastWriteTime -Descending | Select-Object -First 1
  if (-not $cand) { Log '  no export without a manifest in D:\Backup\WSL' }
  elseif (Confirm-Stage ('Verify {0} ({1:N2} GiB) and write its manifest? WSL is started if it is stopped.' -f $cand.Name, ($cand.Length / 1GB))) {
    wsl.exe -d $Distro --exec true; Start-Sleep -Seconds 5
    Write-ExportManifest $cand.FullName
  }
}

# ---------------------------------------------------------------- Quarantine
if ($StageList -contains 'Quarantine') {
  Log '== Stage Quarantine (old tar)'
  $old = 'D:\WSL\Installers\wsl-ubuntu.tar'
  if (-not (Test-Path $old)) { Log '  old tar not found (already moved)' }
  else {
    $oldSize = (Get-Item $old).Length
    if ($oldSize -ne 39454945280) { Log "  old tar size changed ($oldSize); expected 39454945280. Stopping this stage." }
    else {
      $newest = Get-ChildItem 'D:\Backup\WSL' -Filter 'ubuntu-*.tar.manifest.txt' -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending | Select-Object -First 1
      if (-not $newest) { Log '  no verified export manifest in D:\Backup\WSL: not moving the old tar' }
      else {
        $m = @{}
        Get-Content $newest.FullName | ForEach-Object { $p = $_.Split('=', 2); if ($p.Count -eq 2) { $m[$p[0]] = $p[1] } }
        if (-not (Test-Path $m['file']) -or ((Get-Item $m['file']).Length -ne [int64]$m['bytes'])) { Log '  newest export does not match its manifest: not moving the old tar' }
        elseif (Confirm-Stage ('A verified newer export exists ({0}). Move the old 36.75 GiB tar into quarantine?' -f $m['file'])) {
          $review = (Get-Date).AddDays(30).ToString('yyyy-MM-dd')
          $dest = "D:\Backup\Quarantine\wsl-tar-review-$review"
          New-Item -ItemType Directory -Path $dest -Force | Out-Null
          Move-Item -Path $old -Destination (Join-Path $dest 'wsl-ubuntu.tar')
          $note = @('Moved by 60-build5b-host.ps1 on ' + (Get-Date -Format 's'),
            'Original: D:\WSL\Installers\wsl-ubuntu.tar, 39,454,945,280 bytes, written 2026-01-15 (wsl --export of the old Ubuntu; 21.7 GB of it is a Rust target/ build folder from the boom project)',
            'Integrity (2026-10-13): tar -tf OK, 455,976 entries, sha256 d4a23e9195a20ffeed82b7eba706de89474935f502f08224c7203eb013eac326',
            'Replaced by verified export: ' + $m['file'],
            'Review date: ' + $review + '. Delete only by hand after review. Rollback: move the file back to D:\WSL\Installers.')
          [System.IO.File]::WriteAllLines((Join-Path $dest 'README.txt'), $note, [System.Text.Encoding]::ASCII)
          Log "  moved to $dest (nothing deleted)"
        }
      }
    }
  }
}
Log "DONE. Log: $log"
try { Stop-Transcript | Out-Null } catch { }
