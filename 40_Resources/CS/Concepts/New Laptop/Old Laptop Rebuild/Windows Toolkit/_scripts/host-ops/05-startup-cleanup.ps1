# 05-startup-cleanup.ps1  (Build 4b, 2026-10-14)  ASCII only. PowerShell 5.1 and 7 safe. No admin needed.
#   powershell -ExecutionPolicy Bypass -File D:\WSL\ops\windows\05-startup-cleanup.ps1            (dry run, changes nothing)
#   powershell -ExecutionPolicy Bypass -File D:\WSL\ops\windows\05-startup-cleanup.ps1 -Apply     (does it)
# What it does (all approved by Anant on 2026-10-14):
#   1. E START App: its startup shortcut is dangling (the app folder in %LOCALAPPDATA%\GMO INSIGHT is gone). Shortcut -> quarantine, stale StartupApproved values saved then removed.
#   2. OpenClaw (never used): the startup .cmd -> quarantine; ~\.openclaw -> quarantine (junction links inside are recorded, then unlinked, targets untouched);
#      the global npm package "openclaw" is uninstalled with npm (about 509 MB, regenerable).
#   3. Ollama.lnk in the Startup folder: kept on disk but DISABLED through StartupApproved (reversible; old value saved).
# Undo: D:\Backup\Quarantine\startup-cleanup-<date>\undo.txt lists every restore step. Nothing is deleted except the npm package and junction links.
param(
  [switch]$Apply
)
$ErrorActionPreference = 'Stop'
$dry = -not $Apply
$date = Get-Date -Format 'yyyy-MM-dd'
$logDir = 'D:\WSL\ops\windows\logs'
if (-not (Test-Path $logDir)) { New-Item -ItemType Directory -Path $logDir -Force | Out-Null }
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$log = Join-Path $logDir ('startup-cleanup-' + $stamp + '.log')
try { Start-Transcript -Path (Join-Path $logDir ('startup-cleanup-' + $stamp + '.transcript.txt')) -Force | Out-Null } catch { }
function Log([string]$m) { $l = (Get-Date -Format 'HH:mm:ss') + ' ' + $m; Write-Host $l; Add-Content -Path $log -Value $l -Encoding ASCII }
Log ("startup cleanup. DryRun={0}  Log: {1}" -f $dry, $log)

$startup = Join-Path $env:APPDATA 'Microsoft\Windows\Start Menu\Programs\Startup'
$saKey = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\StartupFolder'
$dest = "D:\Backup\Quarantine\startup-cleanup-$date"
$undo = New-Object System.Collections.ArrayList
function Hex($b) { if ($null -eq $b) { return '(none)' } return (($b | ForEach-Object { $_.ToString('x2') }) -join '') }

function Prepare-Dest { if (-not $dry -and -not (Test-Path $dest)) { New-Item -ItemType Directory -Path $dest -Force | Out-Null } }

# ---- 1 and 2a: startup files
foreach ($name in 'E START App.lnk', 'OpenClaw Gateway.cmd') {
  $p = Join-Path $startup $name
  if (-not (Test-Path -LiteralPath $p)) { Log "  absent: $p"; continue }
  Log ("  quarantine startup item: {0}" -f $p)
  if (-not $dry) { Prepare-Dest; Move-Item -LiteralPath $p -Destination (Join-Path $dest $name) -Force; [void]$undo.Add("move back: $dest\$name -> $startup\$name") }
}

# ---- StartupApproved values: save, then remove stale ones
foreach ($name in 'E START App.lnk', 'OpenClaw Gateway.cmd', 'ECNotifier.lnk') {
  $v = (Get-ItemProperty -Path $saKey -Name $name -ErrorAction SilentlyContinue).$name
  if ($null -eq $v) { Log "  StartupApproved has no value: $name"; continue }
  Log ("  remove stale StartupApproved value '{0}' (was {1})" -f $name, (Hex $v))
  if (-not $dry) { Remove-ItemProperty -Path $saKey -Name $name; [void]$undo.Add(("registry: set {0}\{1} = hex {2} (REG_BINARY)" -f $saKey, $name, (Hex $v))) }
}

# ---- 3: disable Ollama.lnk (keep the file)
$ol = Join-Path $startup 'Ollama.lnk'
if (-not (Test-Path -LiteralPath $ol)) { Log '  Ollama.lnk absent in Startup folder' }
else {
  $old = (Get-ItemProperty -Path $saKey -Name 'Ollama.lnk' -ErrorAction SilentlyContinue).'Ollama.lnk'
  if ($old -and $old[0] -eq 3) { Log ("  Ollama.lnk is already disabled in StartupApproved (value {0}); nothing to do" -f (Hex $old)) }
  else {
  Log ("  disable Ollama.lnk via StartupApproved (old value {0})" -f (Hex $old))
  if (-not $dry) {
    $new = New-Object byte[] 12; $new[0] = 3
    New-ItemProperty -Path $saKey -Name 'Ollama.lnk' -PropertyType Binary -Value $new -Force | Out-Null
    [void]$undo.Add(("registry: set {0}\Ollama.lnk = hex {1} (2 = enabled)" -f $saKey, $(if ($old) { Hex $old } else { '020000000000000000000000' })))
  }
  }
}

# ---- 2b: ~\.openclaw
$oc = Join-Path $env:USERPROFILE '.openclaw'
if (-not (Test-Path -LiteralPath $oc)) { Log "  absent: $oc" }
else {
  $links = @(Get-ChildItem -LiteralPath $oc -Recurse -Force -ErrorAction SilentlyContinue | Where-Object { $_.Attributes -band [IO.FileAttributes]::ReparsePoint })
  $mb = [math]::Round((Get-ChildItem -LiteralPath $oc -Recurse -Force -File -ErrorAction SilentlyContinue | Measure-Object Length -Sum).Sum / 1MB, 2)
  Log ("  quarantine {0}  ({1} MB of real files, {2} junction/symlink entries)" -f $oc, $mb, $links.Count)
  foreach ($l in $links) { Log ("    link: {0} -> {1}" -f $l.FullName, ($l.Target -join ';')) }
  if (-not $dry) {
    Prepare-Dest
    foreach ($l in $links) {
      [void]$undo.Add(("recreate link: {0} -> {1}" -f $l.FullName, ($l.Target -join ';')))
      [IO.Directory]::Delete($l.FullName)   # removes the link only, never the target (non-recursive)
    }
    Move-Item -LiteralPath $oc -Destination (Join-Path $dest 'dot-openclaw') -Force
    [void]$undo.Add("move back: $dest\dot-openclaw -> $oc")
    Log "  moved to $dest\dot-openclaw"
  }
}

# ---- 2c: npm global package
$npm = (Get-Command npm.cmd -ErrorAction SilentlyContinue)
$npmRoot = $null
if ($npm) { $npmRoot = (& npm.cmd root -g 2>$null | Select-Object -First 1) }
if (-not $npm -or -not $npmRoot) { Log '  npm not found: cannot check the global openclaw package' }
else {
  $pkg = Join-Path $npmRoot 'openclaw'
  if (-not (Test-Path -LiteralPath $pkg)) { Log "  npm global openclaw not installed ($npmRoot)" }
  else {
    $ver = ''
    try { $ver = (Get-Content (Join-Path $pkg 'package.json') -Raw | ConvertFrom-Json).version } catch { }
    Log ("  npm uninstall -g openclaw  (version {0}, at {1})" -f $ver, $pkg)
    if (-not $dry) {
      & npm.cmd uninstall -g openclaw 2>&1 | ForEach-Object { Log ('    npm: ' + $_) }
      Log ("  npm exit code {0}" -f $LASTEXITCODE)
      [void]$undo.Add("reinstall (only if ever wanted): npm install -g openclaw@$ver")
    }
  }
}

# ---- verify
Log '== state now'
foreach ($n in 'E START App.lnk', 'OpenClaw Gateway.cmd', 'Ollama.lnk', 'Wispr Flow.lnk') { Log ("  startup folder {0}: {1}" -f $n, $(if (Test-Path -LiteralPath (Join-Path $startup $n)) { 'present' } else { 'absent' })) }
$k = Get-Item $saKey -ErrorAction SilentlyContinue
if ($k) { foreach ($pn in $k.Property) { Log ("  StartupApproved\StartupFolder {0} = {1}" -f $pn, (Hex (Get-ItemProperty -Path $saKey -Name $pn).$pn)) } }
Log ("  ~\.openclaw exists: {0}" -f (Test-Path -LiteralPath $oc))
Log ("  openclaw command resolves: {0}" -f [bool](Get-Command openclaw -ErrorAction SilentlyContinue))
if (-not $dry -and $undo.Count -gt 0) {
  $lines = @('Undo steps for 05-startup-cleanup.ps1 run ' + (Get-Date -Format 's')) + @($undo)
  [IO.File]::WriteAllLines((Join-Path $dest 'undo.txt'), [string[]]$lines, (New-Object Text.ASCIIEncoding))
  Log "  undo steps written: $dest\undo.txt"
}
if ($dry) { Log 'DRY RUN: nothing changed. Re-run with -Apply to do it.' }
Log "DONE. Log: $log"
try { Stop-Transcript | Out-Null } catch { }
