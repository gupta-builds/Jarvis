$ErrorActionPreference = 'Stop'

$Snap = "D:\_Anant\20_Progress\Documents\Jarvis\40_Resources\CS\Concepts\New Laptop\Old Laptop Rebuild\Acer Dotfile Snapshot"
$Win  = Join-Path $Snap "windows"
$Wsl  = Join-Path $Snap "wsl"
$H    = $env:USERPROFILE

New-Item -ItemType Directory -Force -Path $Snap | Out-Null
New-Item -ItemType Directory -Force -Path $Win  | Out-Null
New-Item -ItemType Directory -Force -Path $Wsl  | Out-Null

# --- secret patterns (heuristic) ---
$SecretPatterns = @(
  'AKIA[0-9A-Z]{16}',
  'gh[pousr]_[A-Za-z0-9]{30,}',
  'github_pat_[A-Za-z0-9_]{30,}',
  'sk-[A-Za-z0-9]{20,}',
  'xox[baprs]-[A-Za-z0-9-]{10,}',
  '-----BEGIN[ A-Z]*PRIVATE KEY-----',
  'AIza[0-9A-Za-z\-_]{35}',
  'ya29\.[0-9A-Za-z\-_]+',
  '(?i)\b(api[_-]?key|secret|passwd|password)\b\s*[=:]\s*[''"]?[A-Za-z0-9/_\-\.]{8,}',
  '(?i)Bearer\s+[A-Za-z0-9\-_\.]{15,}'
)

# --- forbidden source paths (AI-tool / credential directories - defense in depth) ---
$ForbiddenMarkers = @('.claude', '.codex', '.cursor', '.kiro', '.ssh', '.mcp.json', '.mcp.env')

function Test-SecretText {
  param([string]$Text)
  foreach ($pat in $SecretPatterns) {
    if ($Text -match $pat) { return $true }
  }
  return $false
}

function Test-SecretFile {
  param([string]$Path)
  try {
    $content = Get-Content -Raw -Path $Path -ErrorAction Stop
  } catch { return $false }
  if ($null -eq $content) { return $false }
  return Test-SecretText $content
}

function Test-ForbiddenPath {
  param([string]$Path)
  foreach ($m in $ForbiddenMarkers) {
    if ($Path -like "*$m*") { return $true }
  }
  return $false
}

# hashes-windows.txt columns: RelDest  Source  SourceSHA256  CopySHA256  Status
$HashLines = New-Object System.Collections.Generic.List[string]
$HashLines.Add("RelDest`tSource`tSourceSHA256`tCopySHA256`tStatus")
# excluded-windows.txt columns: Source  RelDest  Reason
$ExcludedLines = New-Object System.Collections.Generic.List[string]
$ExcludedLines.Add("Source`tRelDest`tReason")

function Add-Excluded {
  param([string]$Source, [string]$RelDest, [string]$Reason)
  $ExcludedLines.Add("$Source`t$RelDest`t$Reason")
}

function Add-Hash {
  param([string]$RelDest, [string]$Source, [string]$SourceHash, [string]$CopyHash, [string]$Status)
  $HashLines.Add("$RelDest`t$Source`t$SourceHash`t$CopyHash`t$Status")
}

# Plain, verbatim, binary-safe copy. Scans the SOURCE before ever writing a copy.
function Export-File {
  param([string]$Source, [string]$RelDest)
  if (Test-ForbiddenPath $Source) {
    Add-Excluded $Source $RelDest "AI-tool or credential directory - excluded by policy"
    return
  }
  if (-not (Test-Path $Source -PathType Leaf)) {
    Add-Excluded $Source $RelDest "not present on this host"
    return
  }
  if (Test-SecretFile $Source) {
    Add-Excluded $Source $RelDest "matched secret heuristic - not copied"
    return
  }
  $destPath = Join-Path $Win $RelDest
  New-Item -ItemType Directory -Force -Path (Split-Path $destPath -Parent) | Out-Null
  Copy-Item -Path $Source -Destination $destPath -Force
  $srcHash = (Get-FileHash -Algorithm SHA256 -Path $Source).Hash
  $dstHash = (Get-FileHash -Algorithm SHA256 -Path $destPath).Hash
  $status = if ($srcHash -eq $dstHash) { "MATCH" } else { "DIFF" }
  Add-Hash "windows/$RelDest" $Source $srcHash $dstHash $status
}

# ---- starship ----
Export-File "$H\.config\starship.toml" "home\.config\starship.toml"

# ---- .config\git dir (non-gitconfig files, e.g. "ignore") ----
$gitDir = "$H\.config\git"
if ((Test-Path $gitDir) -and -not (Test-ForbiddenPath $gitDir)) {
  Get-ChildItem -Path $gitDir -File -Recurse | ForEach-Object {
    $rel = $_.FullName.Substring($gitDir.Length + 1)
    Export-File $_.FullName "home\.config\git\$rel"
  }
}

# ---- .gitconfig: redact [credential ...] and [user] sections, scanning IN MEMORY before any write ----
$gitconfigSrc = "$H\.gitconfig"
if ((Test-Path $gitconfigSrc) -and -not (Test-ForbiddenPath $gitconfigSrc)) {
  $lines = Get-Content $gitconfigSrc
  $kept = New-Object System.Collections.Generic.List[string]
  $skip = $false
  foreach ($line in $lines) {
    if ($line -match '^\s*\[(credential|user)\b') { $skip = $true; continue }
    if ($line -match '^\s*\[') { $skip = $false }
    if (-not $skip) { $kept.Add($line) }
  }
  $redactedText = ($kept -join "`n")
  if (Test-SecretText $redactedText) {
    Add-Excluded $gitconfigSrc "home\.gitconfig" "matched secret heuristic after redaction - not copied"
  } else {
    $destPath = Join-Path $Win "home\.gitconfig"
    New-Item -ItemType Directory -Force -Path (Split-Path $destPath -Parent) | Out-Null
    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($destPath, $redactedText, $utf8NoBom)
    $srcHash = (Get-FileHash -Algorithm SHA256 -Path $gitconfigSrc).Hash
    $dstHash = (Get-FileHash -Algorithm SHA256 -Path $destPath).Hash
    Add-Hash "windows/home/.gitconfig" "$gitconfigSrc (redacted: removed [credential] and [user] sections)" $srcHash $dstHash "DIFF"
  }
}

# ---- Windows Terminal settings.json ----
$wtPkg = Get-ChildItem "$env:LOCALAPPDATA\Packages" -Filter "Microsoft.WindowsTerminal*" -ErrorAction SilentlyContinue | Select-Object -First 1
if ($wtPkg) {
  $wtSettings = Join-Path $wtPkg.FullName "LocalState\settings.json"
  Export-File $wtSettings "terminal\settings.json"
} else {
  Add-Excluded "Microsoft.WindowsTerminal LocalState" "terminal\settings.json" "Windows Terminal package not found"
}

# ---- PowerShell profiles ----
Export-File "$H\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" "powershell\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
Export-File "$H\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" "powershell\PowerShell\Microsoft.PowerShell_profile.ps1"

# ---- .wslconfig: Windows-side file that configures WSL; filed under wsl\windows-host per task grouping ----
$wslconfigSrc = "$H\.wslconfig"
if (Test-ForbiddenPath $wslconfigSrc) {
  Add-Excluded $wslconfigSrc "wsl\windows-host\.wslconfig" "AI-tool or credential directory - excluded by policy"
} elseif (-not (Test-Path $wslconfigSrc -PathType Leaf)) {
  Add-Excluded $wslconfigSrc "wsl\windows-host\.wslconfig" "not present on this host"
} elseif (Test-SecretFile $wslconfigSrc) {
  Add-Excluded $wslconfigSrc "wsl\windows-host\.wslconfig" "matched secret heuristic - not copied"
} else {
  $destPath = Join-Path $Wsl "windows-host\.wslconfig"
  New-Item -ItemType Directory -Force -Path (Split-Path $destPath -Parent) | Out-Null
  Copy-Item -Path $wslconfigSrc -Destination $destPath -Force
  $srcHash = (Get-FileHash -Algorithm SHA256 -Path $wslconfigSrc).Hash
  $dstHash = (Get-FileHash -Algorithm SHA256 -Path $destPath).Hash
  $status = if ($srcHash -eq $dstHash) { "MATCH" } else { "DIFF" }
  Add-Hash "wsl/windows-host/.wslconfig" $wslconfigSrc $srcHash $dstHash $status
}

# ---- tools with no config present on this host: record as not-present (not a secret exclusion) ----
$notPresent = @(
  @{ Tool="yazi"; Note="no yazi binary/config found on Windows side (used only in WSL on this host)" },
  @{ Tool="lazygit"; Note="no lazygit binary/config found on Windows side" },
  @{ Tool="bat"; Note="no bat binary/config found on Windows side" },
  @{ Tool="ripgrep config"; Note="rg.exe present but no custom config file (no RIPGREP_CONFIG_PATH, no ~/.ripgreprc) - uses defaults" },
  @{ Tool="delta"; Note="no delta binary/config found on Windows side" },
  @{ Tool="gh-dash"; Note="no gh-dash config found on Windows side" }
)
foreach ($item in $notPresent) {
  Add-Excluded $item.Tool "(n/a)" $item.Note
}

# ---- winget export (generated output, not a copy of an existing file) ----
$wingetOut = Join-Path $Win "winget\winget-export.json"
New-Item -ItemType Directory -Force -Path (Split-Path $wingetOut -Parent) | Out-Null
winget export -o $wingetOut --accept-source-agreements | Out-Null
if (Test-Path $wingetOut) {
  $dstHash = (Get-FileHash -Algorithm SHA256 -Path $wingetOut).Hash
  Add-Hash "windows/winget/winget-export.json" "winget export (generated)" "n/a" $dstHash "GENERATED"
}

# ---- write hashes and excluded logs into the snapshot folder only ----
Set-Content -Path (Join-Path $Snap "hashes-windows.txt") -Value $HashLines -Encoding ASCII
Set-Content -Path (Join-Path $Snap "excluded-windows.txt") -Value $ExcludedLines -Encoding ASCII

Write-Output "DONE: windows export"
Write-Output "copied: $($HashLines.Count - 1)"
Write-Output "excluded/not-present: $($ExcludedLines.Count - 1)"
