$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$VaultRoot = Resolve-Path (Join-Path $ScriptDir "..\..\..")
$Cli = Join-Path $ScriptDir "jarvis_ops.py"

# Plain `python` on Windows is often the Microsoft Store shim (a stub under
# WindowsApps that opens the Store and runs nothing), so it is tried last and only
# if it is not that stub. Order: a real install (uv's or the python.org one), then
# the py launcher, then python on PATH.
function Resolve-Python {
    $candidates = @()
    foreach ($dir in @((Join-Path $env:USERPROFILE ".local\bin"), (Join-Path $env:LOCALAPPDATA "Programs\Python"))) {
        if (Test-Path -LiteralPath $dir) {
            $candidates += Get-ChildItem -LiteralPath $dir -Recurse -Depth 1 -Filter "python*.exe" -ErrorAction SilentlyContinue |
                Where-Object { $_.Name -match '^python(3(\.\d+)?)?\.exe$' } |
                Sort-Object { $_.FullName } -Descending
        }
    }
    foreach ($c in $candidates) {
        if ($c.FullName -notmatch '\\WindowsApps\\') { return @{ Exe = $c.FullName; Prefix = @() } }
    }
    $py = Get-Command py -ErrorAction SilentlyContinue
    if ($py) {
        & $py.Source -3 -c "import sys" 2>$null
        if ($LASTEXITCODE -eq 0) { return @{ Exe = $py.Source; Prefix = @("-3") } }
    }
    $python = Get-Command python -ErrorAction SilentlyContinue
    if ($python -and $python.Source -notmatch '\\WindowsApps\\') { return @{ Exe = $python.Source; Prefix = @() } }
    return $null
}

$Resolved = Resolve-Python
if (-not $Resolved) {
    Write-Error "No working Python found (checked ~\.local\bin, %LOCALAPPDATA%\Programs\Python, py -3 and python; the Microsoft Store shim is skipped)."
    exit 1
}

& $Resolved.Exe @($Resolved.Prefix) $Cli --root $VaultRoot @args
exit $LASTEXITCODE
