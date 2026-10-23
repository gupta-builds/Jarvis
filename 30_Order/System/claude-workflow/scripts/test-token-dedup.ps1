# Regression test for token/cost inflation: one API response is written as several
# 'assistant' JSONL lines (one per content block) sharing message.id and an identical
# message.usage. Usage must be counted once per message.id, not once per line.
# Builds its own synthetic transcript; runs the Windows exporter end to end and the
# WSL exporter's aggregation helpers (extracted by AST, so its main body never runs).

$ErrorActionPreference = "Stop"

$work = Join-Path $env:TEMP "token-dedup-test-$(Get-Random)"
$srcDir = Join-Path $work "src"
$outDir = Join-Path $work "out"
New-Item -ItemType Directory -Path $srcDir, $outDir -Force | Out-Null

$usageA = @{ input_tokens = 100; output_tokens = 50; cache_read_input_tokens = 1000; cache_creation_input_tokens = 200; cache_creation = @{ ephemeral_5m_input_tokens = 200; ephemeral_1h_input_tokens = 0 } }
$usageB = @{ input_tokens = 10; output_tokens = 20; cache_read_input_tokens = 1100 }
$usageC = @{ input_tokens = 1; output_tokens = 2 }
$model = "claude-sonnet-5"

function New-AssistantLine($id, $uuid, $usage, $blocks, $ts) {
    $msg = @{ role = "assistant"; model = $model; content = $blocks; usage = $usage }
    if ($id) { $msg.id = $id }
    (@{ type = "assistant"; uuid = $uuid; timestamp = $ts; cwd = "D:\x"; message = $msg } | ConvertTo-Json -Depth 8 -Compress)
}

$lines = @(
    (@{ type = "user"; uuid = "u1"; timestamp = "2026-10-22T10:00:00Z"; cwd = "D:\x"; message = @{ role = "user"; content = "hello" } } | ConvertTo-Json -Depth 6 -Compress),
    # Response A: 3 lines, 1 message.id, identical usage on each
    (New-AssistantLine "msg_A" "a1" $usageA @(@{ type = "thinking"; thinking = "t" }) "2026-10-22T10:00:01Z"),
    (New-AssistantLine "msg_A" "a2" $usageA @(@{ type = "text"; text = "running it" }) "2026-10-22T10:00:02Z"),
    (New-AssistantLine "msg_A" "a3" $usageA @(@{ type = "tool_use"; id = "toolu_1"; name = "Bash"; input = @{ command = "echo hi" } }) "2026-10-22T10:00:03Z"),
    (@{ type = "user"; uuid = "u2"; timestamp = "2026-10-22T10:00:04Z"; cwd = "D:\x"; message = @{ role = "user"; content = @(@{ type = "tool_result"; tool_use_id = "toolu_1"; content = "hi" }) } } | ConvertTo-Json -Depth 8 -Compress),
    # Response B: single line
    (New-AssistantLine "msg_B" "b1" $usageB @(@{ type = "text"; text = "done" }) "2026-10-22T10:00:05Z"),
    # Response C: no message.id at all, cannot be deduped, counts once
    (New-AssistantLine $null "c1" $usageC @(@{ type = "text"; text = "extra" }) "2026-10-22T10:00:06Z")
)
$transcript = Join-Path $srcDir "test-dedup-001.jsonl"
[System.IO.File]::WriteAllLines($transcript, $lines, (New-Object System.Text.UTF8Encoding($false)))

# Deduped expectation: A once + B + C. A naive per-line sum would count A three times.
$expect = @{ input = 111; output = 72; cache_read = 2100; cache_creation = 200; total = 2483 }
$naive = @{ input = 311; output = 172; cache_read = 4100; cache_creation = 600; total = 5183 }

$fail = 0
function Check($label, $actual, $expected) {
    if ($actual -eq $expected) { Write-Output "PASS: $label ($actual)" }
    else { Write-Output "FAIL: $label (got $actual, want $expected)"; $script:fail++ }
}

# ---- Windows exporter, end to end ----------------------------------------
. (Join-Path $PSScriptRoot "export-claude-session.ps1")
$OutRoot = $outDir
$r = Export-Session -TranscriptPathIn $transcript -SessionIdIn "test-dedup-001" -CwdIn "D:\x" -SourceAppIn "ClaudeCode"
Check "windows exporter status" $r.Status "written"
$md = Get-ChildItem -LiteralPath $r.ProjectDir -Filter "*.md" | Select-Object -First 1
$fm = (Get-Content -LiteralPath $md.FullName -Raw) -split '(?m)^---\s*$' | Select-Object -Skip 1 -First 1
function Field($name) { if ($fm -match "(?m)^\s+${name}: (\d+)\s*$") { [int]$Matches[1] } else { -1 } }
Check "windows tokens.input" (Field "input") $expect.input
Check "windows tokens.output" (Field "output") $expect.output
Check "windows tokens.cache_read" (Field "cache_read") $expect.cache_read
Check "windows tokens.cache_creation" (Field "cache_creation") $expect.cache_creation
Check "windows tokens.total" (Field "total") $expect.total
Check "windows cost_usd" ($(if ($fm -match '(?m)^cost_usd: ([\d.]+)') { $Matches[1] } else { 'missing' })) "0.001862"
if ((Field "total") -eq $naive.total) { Write-Output "FAIL: windows total equals the per-line (inflated) sum"; $fail++ }

# ---- WSL exporter helpers, extracted by AST -------------------------------
$wslPath = Join-Path $PSScriptRoot "wsl-session-export.ps1"
$ast = [System.Management.Automation.Language.Parser]::ParseFile($wslPath, [ref]$null, [ref]$null)
$want = 'Add-ModelUsage', 'Set-ResponseUsage', 'Add-DedupedModelUsage'
$funcText = ($ast.FindAll({ param($n) $n -is [System.Management.Automation.Language.FunctionDefinitionAst] -and $want -contains $n.Name }, $true) | ForEach-Object { $_.Extent.Text }) -join "`n"
Check "wsl exporter defines all 3 helpers" ([regex]::Matches($funcText, '(?m)^function ').Count) 3
$wslUsage = & {
    . ([scriptblock]::Create($funcText))
    $byId = @{}; $mu = @{}
    foreach ($l in [System.IO.File]::ReadAllLines($transcript)) {
        $o = $l | ConvertFrom-Json
        if ($o.type -eq 'assistant' -and $o.message -and $o.message.usage) { Set-ResponseUsage -UsageById $byId -AssistantLine $o }
    }
    Add-DedupedModelUsage -ModelUsage $mu -UsageById $byId
    $mu
}
$u = $wslUsage[$model]
Check "wsl input" $u.input $expect.input
Check "wsl output" $u.output $expect.output
Check "wsl cache_read" $u.cache_read $expect.cache_read
Check "wsl cache_creation" ($u.cache_5m + $u.cache_1h) $expect.cache_creation

# ---- cleanup (remove the junction by itself first, never recurse through it) ----
Get-ChildItem -LiteralPath $outDir -Recurse -Directory -Force -ErrorAction SilentlyContinue | Where-Object { $_.Attributes -band [IO.FileAttributes]::ReparsePoint } | ForEach-Object { [System.IO.Directory]::Delete($_.FullName) }
Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue

if ($fail -eq 0) { Write-Output "=== ALL TOKEN DEDUP CHECKS PASSED ==="; exit 0 }
else { Write-Output "=== $fail TOKEN DEDUP CHECK(S) FAILED ==="; exit 1 }
