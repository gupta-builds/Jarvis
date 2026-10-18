# 06-ollama-check.ps1  (Build 4b, A4, 2026-10-15)  ASCII only. PowerShell 5.1 and 7 safe. No admin needed.
#   powershell -ExecutionPolicy Bypass -File D:\WSL\ops\windows\06-ollama-check.ps1            (dry run: only reports, starts nothing)
#   powershell -ExecutionPolicy Bypass -File D:\WSL\ops\windows\06-ollama-check.ps1 -Apply     (starts the Windows Ollama server if it is not running, then checks it)
# Checks: OLLAMA_MODELS is D:\AI\ollama-models, ollama.exe is the D:\Apps\Ollama one, port 11434 is owned by that Windows process, 'ollama list' answers.
# Ollama is started for this session only. Its Startup-folder shortcut stays disabled (StartupApproved = 03); the Dell has no discrete GPU, so heavy models belong on the Acer.
param([switch]$Apply)
$ErrorActionPreference = 'Stop'
$dry = -not $Apply
$logDir = 'D:\WSL\ops\windows\logs'
if (-not (Test-Path $logDir)) { New-Item -ItemType Directory -Path $logDir -Force | Out-Null }
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$log = Join-Path $logDir ('ollama-check-' + $stamp + '.log')
try { Start-Transcript -Path (Join-Path $logDir ('ollama-check-' + $stamp + '.transcript.txt')) -Force | Out-Null } catch { }
function Log([string]$m) { $l = (Get-Date -Format 'HH:mm:ss') + ' ' + $m; Write-Host $l; Add-Content -Path $log -Value $l -Encoding ASCII }
Log ("ollama check. DryRun={0}  Log: {1}" -f $dry, $log)

$exe = 'D:\Apps\Ollama\ollama.exe'
$models = [Environment]::GetEnvironmentVariable('OLLAMA_MODELS', 'User')
Log ("  OLLAMA_MODELS (user env): {0}   expected D:\AI\ollama-models   {1}" -f $models, $(if ($models -eq 'D:\AI\ollama-models') { 'OK' } else { 'MISMATCH' }))
Log ("  models folder exists: {0}" -f (Test-Path 'D:\AI\ollama-models'))
Log ("  {0} exists: {1}" -f $exe, (Test-Path $exe))

function Get-Listener { Get-NetTCPConnection -LocalPort 11434 -State Listen -ErrorAction SilentlyContinue | Select-Object -First 1 }
$l = Get-Listener
if ($l) { Log ("  port 11434 already listening, owner pid {0}" -f $l.OwningProcess) }
else {
  Log '  nothing listens on 11434'
  if ($dry) { Log ("  [dry run] would start: {0} serve (hidden), wait up to 30 s" -f $exe) }
  else {
    # the server inherits OLLAMA_MODELS from the user environment; set it for this process too in case this shell predates the variable
    if ($models) { $env:OLLAMA_MODELS = $models }
    Start-Process -FilePath $exe -ArgumentList 'serve' -WindowStyle Hidden | Out-Null
    for ($i = 0; $i -lt 30 -and -not (Get-Listener); $i++) { Start-Sleep -Seconds 1 }
    $l = Get-Listener
    if ($l) { Log ("  started; port 11434 owner pid {0}" -f $l.OwningProcess) } else { Log '  FAILED: nothing listening after 30 s' }
  }
}
if ($l) {
  $p = Get-CimInstance Win32_Process -Filter ("ProcessId={0}" -f $l.OwningProcess)
  Log ("  owner process: {0}  path: {1}" -f $p.Name, $p.ExecutablePath)
  Log ("  owned by the Windows D:\Apps\Ollama binary: {0}" -f ($p.ExecutablePath -like 'D:\Apps\Ollama\*'))
  Log ("  bound address: {0}" -f $l.LocalAddress)
  try { $v = Invoke-RestMethod -Uri 'http://127.0.0.1:11434/api/version' -TimeoutSec 10; Log ("  API version: {0}" -f $v.version) } catch { Log ("  API call failed: {0}" -f $_.Exception.Message) }
  $prev = $ErrorActionPreference; $ErrorActionPreference = 'Continue'
  $out = @(& $exe list 2>&1 | ForEach-Object { "$_" })
  $ErrorActionPreference = $prev
  Log ("  'ollama list' exit code {0}, {1} line(s):" -f $LASTEXITCODE, $out.Count)
  $out | Select-Object -First 15 | ForEach-Object { Log ('    ' + $_) }
}
Log ("  Startup shortcut state (03 = disabled): {0}" -f (((Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\StartupFolder' -Name 'Ollama.lnk' -ErrorAction SilentlyContinue).'Ollama.lnk')[0]))
if ($dry) { Log 'DRY RUN: nothing changed.' }
Log "DONE. Log: $log"
try { Stop-Transcript | Out-Null } catch { }
