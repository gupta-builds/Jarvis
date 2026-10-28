# Tests for the capture-projects.json router: each rule inside and outside its path,
# rule order, case, trailing slash, sibling-prefix paths, the Scratch rule on a real
# %LOCALAPPDATA%\Temp\claude path, the leaf fallback, an empty cwd, and a missing,
# corrupt or invalid routing file falling back to the built-in behavior.

$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot "export-claude-session.ps1")

$fail = 0
function Check($label, $actual, $expected) {
    if ($actual -eq $expected) { Write-Output "PASS: $label ($actual)" }
    else { Write-Output "FAIL: $label (got '$actual', want '$expected')"; $script:fail++ }
}
function Reset-Router($file) {
    $script:CaptureRoutingFile = $file
    $script:RoutingRules = $null
}

$work = Join-Path $env:TEMP "capture-projects-test-$(Get-Random)"
New-Item -ItemType Directory -Path $work -Force | Out-Null
$realLocalAppData = $env:LOCALAPPDATA

$root = $VaultRoot
for ($i = 0; $i -lt 3; $i++) { $root = Split-Path -Path $root -Parent }
$umn = Join-Path $root "10_Areas\UMN"
$planRoot = Join-Path (Split-Path $VaultRoot -Parent) "The Plan"
$scratch = Join-Path $realLocalAppData "Temp\claude"

# ---- the real routing file -----------------------------------------------------------
$realFile = $script:CaptureRoutingFile
Check "routing file exists" (Test-Path -LiteralPath $realFile) $true
Reset-Router $realFile

Check "vault root -> Jarvis" (Get-ProjectName $VaultRoot) "Jarvis"
Check "vault subfolder -> Jarvis" (Get-ProjectName (Join-Path $VaultRoot "30_Order\System")) "Jarvis"
Check "outside the vault -> not Jarvis" (Get-ProjectName (Split-Path $VaultRoot -Parent)) "Documents"
Check "sibling Jarvis-old is not Jarvis" (Get-ProjectName ($VaultRoot + "-old\x")) "x"

Check "The Plan root -> The Plan" (Get-ProjectName $planRoot) "The Plan"
Check "The Plan subfolder -> The Plan" (Get-ProjectName (Join-Path $planRoot "00_Live\Daily")) "The Plan"
Check "The Plan sibling prefix is not The Plan" (Get-ProjectName ($planRoot + " Old\x")) "x"

Check "UMN root -> UMN Courses" (Get-ProjectName $umn) "UMN Courses"
Check "UMN course folder -> UMN Courses" (Get-ProjectName (Join-Path $umn "Classes\CSCI\CSCI 5304")) "UMN Courses"
Check "UMN deep course repo -> UMN Courses" (Get-ProjectName (Join-Path $umn "Classes\CSCI\CSCI 4061\csci4061-fa26")) "UMN Courses"
Check "UMN sibling prefix is not UMN Courses" (Get-ProjectName ($umn + "-old\Classes")) "Classes"
Check "folder beside UMN is not UMN Courses" (Get-ProjectName (Join-Path $root "10_Areas\Career")) "Career"

Check "home exact -> Home" (Get-ProjectName $env:USERPROFILE) "Home"
Check "home with trailing slash -> Home" (Get-ProjectName ($env:USERPROFILE + "\")) "Home"
Check "folder inside home is its own project" (Get-ProjectName (Join-Path $env:USERPROFILE "some-repo")) "some-repo"

Check "Scratch root -> Scratch" (Get-ProjectName $scratch) "Scratch"
Check "Scratch real-style path -> Scratch" (Get-ProjectName (Join-Path $scratch "D---Anant-20-Progress-Documents-Jarvis\abc123\scratchpad")) "Scratch"
Check "Temp outside claude is not Scratch" (Get-ProjectName (Join-Path $realLocalAppData "Temp\other-run")) "other-run"

Check "case difference in Jarvis path" (Get-ProjectName (Join-Path $VaultRoot "30_Order").ToUpperInvariant()) "Jarvis"
Check "case difference in UMN path" (Get-ProjectName (Join-Path $umn "Classes").ToLowerInvariant()) "UMN Courses"
Check "forward slashes in a UMN path" (Get-ProjectName ((Join-Path $umn "Classes\CSCI") -replace '\\', '/')) "UMN Courses"
Check "trailing slash on a vault path" (Get-ProjectName ((Join-Path $VaultRoot "30_Order") + "\")) "Jarvis"

Check "unmatched directory -> leaf" (Get-ProjectName "E:\code\my-app") "my-app"
Check "empty cwd -> Unknown" (Get-ProjectName "") "Unknown"
Check "null cwd -> Unknown" (Get-ProjectName $null) "Unknown"
Check "drive root -> Unknown, never an empty folder name" (Get-ProjectName "E:\") "Unknown"

# ---- order: first match wins ------------------------------------------------------------
$wide = Join-Path $work "wide"
$narrow = Join-Path $wide "narrow"
$ordered = @{ version = 1; fallback = "leaf"; rules = @(
        @{ project = "Narrow"; match = "under"; path = $narrow },
        @{ project = "Wide"; match = "under"; path = $wide }) }
$orderedFile = Join-Path $work "ordered.json"
[System.IO.File]::WriteAllText($orderedFile, ($ordered | ConvertTo-Json -Depth 5), (New-Object System.Text.UTF8Encoding($false)))
Reset-Router $orderedFile
Check "narrow rule listed first wins inside its path" (Get-ProjectName (Join-Path $narrow "x")) "Narrow"
Check "wide rule catches the rest" (Get-ProjectName (Join-Path $wide "y")) "Wide"

$reversed = @{ version = 1; fallback = "leaf"; rules = @(
        @{ project = "Wide"; match = "under"; path = $wide },
        @{ project = "Narrow"; match = "under"; path = $narrow }) }
$reversedFile = Join-Path $work "reversed.json"
[System.IO.File]::WriteAllText($reversedFile, ($reversed | ConvertTo-Json -Depth 5), (New-Object System.Text.UTF8Encoding($false)))
Reset-Router $reversedFile
Check "wide rule listed first shadows the narrow one" (Get-ProjectName (Join-Path $narrow "x")) "Wide"

# ---- exact vs under, tokens, and the per-run cache ---------------------------------------
$exactCfg = @{ version = 1; fallback = "leaf"; rules = @(
        @{ project = "OnlyHere"; match = "exact"; path = "{home}\exact-test" }) }
$exactFile = Join-Path $work "exact.json"
[System.IO.File]::WriteAllText($exactFile, ($exactCfg | ConvertTo-Json -Depth 5), (New-Object System.Text.UTF8Encoding($false)))
Reset-Router $exactFile
Check "exact rule matches the path itself" (Get-ProjectName (Join-Path $env:USERPROFILE "exact-test")) "OnlyHere"
Check "exact rule does not match a child" (Get-ProjectName (Join-Path $env:USERPROFILE "exact-test\child")) "child"
[System.IO.File]::WriteAllText($exactFile, "{ broken", (New-Object System.Text.UTF8Encoding($false)))
Check "rules are cached for the run (file now corrupt, result unchanged)" (Get-ProjectName (Join-Path $env:USERPROFILE "exact-test")) "OnlyHere"

# ---- missing or bad routing file -> built-in Jarvis / The Plan / Home -----------------------
# LOCALAPPDATA points at the work folder so the fallback's log line stays out of the real log.
$env:LOCALAPPDATA = Join-Path $work "localappdata"
New-Item -ItemType Directory -Path $env:LOCALAPPDATA -Force | Out-Null
$logPath = Join-Path $env:LOCALAPPDATA "claude-capture\routing.log"

function Check-BuiltIn($label, $file) {
    Reset-Router $file
    Check "$label : vault -> Jarvis" (Get-ProjectName (Join-Path $VaultRoot "30_Order")) "Jarvis"
    Check "$label : The Plan -> The Plan" (Get-ProjectName (Join-Path $planRoot "00_Live")) "The Plan"
    Check "$label : home -> Home" (Get-ProjectName $env:USERPROFILE) "Home"
    Check "$label : UMN has no rule, so leaf" (Get-ProjectName (Join-Path $umn "Classes\CSCI 5304")) "CSCI 5304"
    Check "$label : empty -> Unknown" (Get-ProjectName "") "Unknown"
}

Check-BuiltIn "missing file" (Join-Path $work "does-not-exist.json")
Check "missing file wrote one log line" @(Get-Content -LiteralPath $logPath).Count 1

$corrupt = Join-Path $work "corrupt.json"
[System.IO.File]::WriteAllText($corrupt, "{ not json", (New-Object System.Text.UTF8Encoding($false)))
Check-BuiltIn "corrupt file" $corrupt

$badMatch = Join-Path $work "badmatch.json"
[System.IO.File]::WriteAllText($badMatch, '{"version":1,"fallback":"leaf","rules":[{"project":"X","match":"sideways","path":"C:\\x"}]}', (New-Object System.Text.UTF8Encoding($false)))
Check-BuiltIn "invalid match kind" $badMatch

$noRules = Join-Path $work "norules.json"
[System.IO.File]::WriteAllText($noRules, '{"version":1,"fallback":"leaf"}', (New-Object System.Text.UTF8Encoding($false)))
Check-BuiltIn "no rules list" $noRules

$badToken = Join-Path $work "badtoken.json"
[System.IO.File]::WriteAllText($badToken, '{"version":1,"fallback":"leaf","rules":[{"project":"X","match":"under","path":"{nowhere}\\x"}]}', (New-Object System.Text.UTF8Encoding($false)))
Check-BuiltIn "unknown token" $badToken

Check "each bad file logged once per run" @(Get-Content -LiteralPath $logPath).Count 5

# ---- cleanup ----------------------------------------------------------------------------
$env:LOCALAPPDATA = $realLocalAppData
Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue

if ($fail -eq 0) { Write-Output "=== ALL CAPTURE PROJECT CHECKS PASSED ==="; exit 0 }
else { Write-Output "=== $fail CAPTURE PROJECT CHECK(S) FAILED ==="; exit 1 }
