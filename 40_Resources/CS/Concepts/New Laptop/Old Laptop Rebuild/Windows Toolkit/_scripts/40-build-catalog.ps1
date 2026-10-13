<#
40-build-catalog.ps1 - builds the machine catalog: catalog\Tool Catalog - <host>.md and catalog\tool-catalog-<host>.json.
Read-only on the machine. Reads WSL state only through version probes and file hashes (never prints .bashrc or environment values, never shuts WSL down).
  -DryRun    gather and print counts, write no catalog files
  -SkipWsl   skip the WSL probe
Run in a NORMAL shell after 99-verify.ps1 passes.
#>
param([switch]$DryRun, [switch]$SkipWsl, [ValidateSet('dell', 'acer')][string]$Machine)

. "$PSScriptRoot\_lib.ps1"
$ErrorActionPreference = 'Stop'
Initialize-Toolkit -Name '40-build-catalog' -DryRun $DryRun.IsPresent -Machine $Machine | Out-Null
$m = $global:TK.Manifest
$role = $global:TK.Role
$hostName = $global:TK.Host
$catDir = Join-Path $global:TK.Root 'catalog'
$lock = Read-ToolkitLock

function MdCell { param($S) if ($null -eq $S) { return '' }; return (([string]$S) -replace '\|', '\|' -replace '\r?\n', ' ') }

# ------------------------------------------------------------------ tools
Write-Log '--- Tools' 'STEP'
$toolRows = New-Object System.Collections.Generic.List[object]
foreach ($t in $m.tools) {
    $onMachine = Test-ToolOnMachine $t $role
    if (-not $onMachine -and $t.policy -ne 'catalog-only') { continue }
    $state = $null
    if ($t.policy -ne 'catalog-only') { $state = Get-ToolState $t }
    $info = $null; if ($state -and $state.path) { $info = Get-InstallInfo $state.path }
    $toolRows.Add([pscustomobject]@{
            id = $t.id; name = $t.name; category = $t.category; policy = $t.policy
            installed = $(if ($state) { $state.installed } else { $null })
            version = $(if ($state) { $state.version } else { $null })
            path = $(if ($state) { $state.path } else { $null })
            drive = $(if ($info) { $info.drive } else { $null })
            sizeMB = $(if ($info) { $info.sizeMB } else { $null })
            location = $t.location; configs = @($t.configs); purpose = $t.purpose; when = $t.when
            keyCommands = @($t.keyCommands); runsWhere = $t.runsWhere; agentNotes = $t.agentNotes
        })
    Write-Log ("{0,-18} installed={1} version={2}" -f $t.id, $(if ($state) { $state.installed } else { 'n/a' }), $(if ($state) { $state.version } else { '' }))
}
Add-Result 'tools' 'INFO' ("{0} manifest tools catalogued" -f $toolRows.Count)

# ------------------------------------------------------------------ unmanifested
Write-Log '--- Unmanifested software' 'STEP'
$manifestWinget = @($m.tools | Where-Object { $_.wingetId } | ForEach-Object { $_.wingetId })
$wingetRows = New-Object System.Collections.Generic.List[object]
$w = Resolve-Cmd 'winget'
if ($w) {
    $r = Invoke-Native -File $w -Arguments @('list', '--accept-source-agreements', '--disable-interactivity') -TimeoutSec 180
    $lines = @($r.Output -split "`r?`n")
    $h = -1
    for ($i = 0; $i -lt $lines.Count; $i++) { if ($lines[$i] -match '^Name\s+Id\s+Version') { $h = $i; break } }
    if ($h -ge 0) {
        $hdr = $lines[$h]
        $iId = $hdr.IndexOf('Id'); $iVer = $hdr.IndexOf('Version'); $iAv = $hdr.IndexOf('Available'); $iSrc = $hdr.IndexOf('Source')
        $end = $iSrc; if ($end -lt 0) { $end = 1000 }
        $vEnd = $iAv; if ($vEnd -lt 0) { $vEnd = $end }
        for ($i = $h + 2; $i -lt $lines.Count; $i++) {
            $ln = $lines[$i]
            if ($ln.Length -le $iVer) { continue }
            $name = $ln.Substring(0, $iId).Trim()
            $id = $ln.Substring($iId, $iVer - $iId).Trim()
            $ver = $ln.Substring($iVer, [math]::Min($vEnd, $ln.Length) - $iVer).Trim()
            if ($manifestWinget -contains $id) { continue }
            $wingetRows.Add([pscustomobject]@{ name = (ConvertTo-Ascii $name); id = (ConvertTo-Ascii $id); version = (ConvertTo-Ascii $ver) })
        }
    }
}
$npmGlobals = @()
$npm = Resolve-Cmd 'npm'
if ($npm) {
    $r = Invoke-Native -File $npm -Arguments @('ls', '-g', '--depth=0', '--json') -TimeoutSec 120
    try { $j = $r.Output | ConvertFrom-Json; if ($j.dependencies) { $npmGlobals = @($j.dependencies.PSObject.Properties | ForEach-Object { [pscustomobject]@{ name = $_.Name; version = $_.Value.version } }) } } catch { }
}
$localBin = @()
$lb = Join-Path $env:USERPROFILE '.local\bin'
if (Test-Path -LiteralPath $lb) { $localBin = @(Get-ChildItem -LiteralPath $lb -File | ForEach-Object { $_.Name }) }
$uvTools = @()
$uvExe = [Environment]::ExpandEnvironmentVariables('%USERPROFILE%\.local\bin\uv.exe')
if (Test-Path -LiteralPath $uvExe) {
    $r = Invoke-Native -File $uvExe -Arguments @('tool', 'list') -TimeoutSec 60
    $uvTools = @($r.Output -split "`r?`n" | Where-Object { $_ -and $_ -notmatch '^\s*-' -and $_ -notmatch 'No tools' })
}
$chocoList = @()
$ch = Resolve-Cmd 'choco'
if ($ch) {
    $r = Invoke-Native -File $ch -Arguments @('list', '--limit-output') -TimeoutSec 120
    $chocoList = @($r.Output -split "`r?`n" | Where-Object { $_ -match '\|' })
}
Add-Result 'unmanifested' 'INFO' ("winget rows {0}, npm globals {1}, ~/.local/bin files {2}, uv tools {3}, choco packages {4}" -f $wingetRows.Count, $npmGlobals.Count, $localBin.Count, $uvTools.Count, $chocoList.Count)

# ------------------------------------------------------------------ MCP, configs, env, path
Write-Log '--- MCP, configs, environment' 'STEP'
$mcp = @(Get-McpInventory)
Add-Result 'mcp' 'INFO' ("{0} MCP entries (names and command names only)" -f $mcp.Count)
$cfgRows = New-Object System.Collections.Generic.List[object]
foreach ($cfg in $m.configs) {
    if ($cfg.kind -eq 'copy') {
        $src = Join-Path $global:TK.Root $cfg.source; $tgt = Expand-ToolkitPath $cfg.target $global:TK.Vault
        $sh = Get-FileSha256 $src; $th = Get-FileSha256 $tgt
        $st = 'MISSING'; if ($th -and $th -eq $sh) { $st = 'MATCH' } elseif ($th) { $st = 'DIFF' }
        $cfgRows.Add([pscustomobject]@{ id = $cfg.id; kind = 'copy'; target = $tgt; sha256 = $th; sourceSha256 = $sh; status = $st })
    } elseif ($cfg.kind -eq 'profile-block') {
        $tgt = Expand-ToolkitPath $cfg.target $global:TK.Vault
        $th = Get-FileSha256 $tgt
        $has = $false; if ($th) { $has = ([IO.File]::ReadAllText($tgt)).Contains($global:TKBlockBegin) }
        $st = 'MISSING'; if ($has) { $st = 'BLOCK-PRESENT' } elseif ($th) { $st = 'NO-BLOCK' }
        $cfgRows.Add([pscustomobject]@{ id = $cfg.id; kind = 'profile'; target = $tgt; sha256 = $th; sourceSha256 = $null; status = $st })
    }
}
$envRows = New-Object System.Collections.Generic.List[object]
foreach ($e in @($m.env.set) + @($m.env.verify)) {
    $envRows.Add([pscustomobject]@{ name = $e.name; value = [Environment]::GetEnvironmentVariable($e.name, 'User') })
}
$pathRows = @(($env:Path -split ';') | Where-Object { $_ } | Select-Object -First 25)
$driveRows = @(Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Name -in 'C', 'D' } | ForEach-Object { [pscustomobject]@{ drive = $_.Name + ':'; freeGiB = [math]::Round($_.Free / 1GB, 1); usedGiB = [math]::Round($_.Used / 1GB, 1) } })

# ------------------------------------------------------------------ WSL (read only)
$wsl = [ordered]@{ probed = $false; distro = $null; tools = @(); localBin = @(); aptManualCount = $null; aptManual = ''; hashes = @(); note = '' }
if (-not $SkipWsl) {
    Write-Log '--- WSL read-only probe' 'STEP'
    $distros = @()
    try {
        $distros = @(Get-ChildItem 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Lxss' -ErrorAction Stop | ForEach-Object { (Get-ItemProperty $_.PSPath).DistributionName } | Where-Object { $_ -and $_ -notmatch '^docker-desktop' })
    } catch { }
    if ($distros.Count -eq 0) { $wsl.note = 'no WSL distro registered'; Add-Result 'wsl' 'INFO' $wsl.note }
    else {
        $distro = $distros[0]
        $wsl.distro = $distro
        $hashList = @()
        $snap = Join-Path $global:TK.Root '..\Acer Dotfile Snapshot\hashes-wsl.txt'
        $expected = @{}
        if (Test-Path -LiteralPath $snap) {
            foreach ($line in (Get-Content -LiteralPath $snap | Select-Object -Skip 1)) {
                $c = $line -split "`t"
                if ($c.Count -ge 6 -and $c[1] -like '/home/anant_gupta/*' -and $c[1] -notmatch '\.gitconfig$' -and $c[5] -eq 'MATCH') {
                    $rel = $c[1].Substring('/home/anant_gupta/'.Length)
                    if ($rel -notmatch '\s') { $expected[$rel] = $c[3].ToLower() }
                }
            }
        }
        $sb = New-Object System.Text.StringBuilder
        [void]$sb.Append("export PATH=`"`$HOME/.local/bin:`$HOME/.cargo/bin:`$PATH`"`n")
        [void]$sb.Append("for t in starship yazi lazygit delta zoxide atuin sesh tmux ncdu fd fdfind bat batcat fzf rg jq git gh node npm pnpm bun uv pwsh claude codex kiro-cli agy ollama semgrep ruff shfmt shellcheck direnv chafa tailscale docker; do`n")
        [void]$sb.Append("  p=`$(command -v `$t 2>/dev/null) || continue`n")
        [void]$sb.Append("  v=`$(timeout 10 `$t --version 2>/dev/null < /dev/null | head -n1)`n")
        [void]$sb.Append("  echo `"TOOL|`$t|`$p|`$v`"`n")
        [void]$sb.Append("done`n")
        [void]$sb.Append("echo `"APTCOUNT|`$(apt-mark showmanual 2>/dev/null | wc -l)`"`n")
        [void]$sb.Append("echo `"APT|`$(apt-mark showmanual 2>/dev/null | tr '\n' ' ')`"`n")
        [void]$sb.Append("ls -1 `"`$HOME/.local/bin`" 2>/dev/null | sed 's/^/LOCALBIN|/'`n")
        foreach ($rel in ($expected.Keys | Sort-Object)) {
            [void]$sb.Append(("if [ -f `"`$HOME/{0}`" ]; then echo `"HASH|{0}|`$(sha256sum `"`$HOME/{0}`" | cut -d' ' -f1)`"; else echo `"HASH|{0}|MISSING`"; fi`n" -f $rel))
        }
        $b64 = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($sb.ToString()))
        $wslExe = Join-Path $env:SystemRoot 'System32\wsl.exe'
        $r = Invoke-Native -File $wslExe -Arguments @('-d', $distro, '--', 'bash', '-lc', ("echo {0} | base64 -d | bash" -f $b64)) -TimeoutSec 180
        $out = ($r.Output -replace "`0", '')
        if ($r.ExitCode -ne 0 -and -not $out) { $wsl.note = ("wsl probe failed (exit {0}): {1}" -f $r.ExitCode, (ConvertTo-Ascii ($r.Error -replace "`0", '')).Trim()); Add-Result 'wsl' 'WARN' $wsl.note }
        else {
            $tools = @(); $hashes = @(); $lbin = @()
            foreach ($line in ($out -split "`r?`n")) {
                $p = $line -split '\|', 4
                if ($p[0] -eq 'TOOL' -and $p.Count -ge 4) { $tools += [pscustomobject]@{ tool = $p[1]; path = (ConvertTo-Ascii $p[2]); version = (ConvertTo-Ascii $p[3]) } }
                elseif ($p[0] -eq 'LOCALBIN' -and $p.Count -ge 2) { $lbin += $p[1] }
                elseif ($p[0] -eq 'APTCOUNT' -and $p.Count -ge 2) { $wsl.aptManualCount = $p[1].Trim() }
                elseif ($p[0] -eq 'APT' -and $p.Count -ge 2) { $wsl.aptManual = (ConvertTo-Ascii ($line.Substring(4)).Trim()) }
                elseif ($p[0] -eq 'HASH' -and $p.Count -ge 3) {
                    $rel = $p[1]; $got = $p[2].Trim().ToLower()
                    $st = 'DIFF'; if ($got -eq 'missing') { $st = 'MISSING' } elseif ($got -eq $expected[$rel]) { $st = 'MATCH' }
                    $hashes += [pscustomobject]@{ file = $rel; status = $st; sha256 = $got; acerSha256 = $expected[$rel] }
                }
            }
            $wsl.probed = $true; $wsl.tools = $tools; $wsl.localBin = $lbin; $wsl.hashes = $hashes
            $match = @($hashes | Where-Object { $_.status -eq 'MATCH' }).Count
            Add-Result 'wsl' 'INFO' ("distro {0}: {1} tools found, {2} config files compared with the Acer snapshot ({3} match, {4} differ, {5} missing)" -f $distro, $tools.Count, $hashes.Count, $match, @($hashes | Where-Object { $_.status -eq 'DIFF' }).Count, @($hashes | Where-Object { $_.status -eq 'MISSING' }).Count)
        }
    }
}

# ------------------------------------------------------------------ write
$generated = Get-Date
$facts = [ordered]@{
    host = $hostName; machine = $role; label = $m.machines.$role.label; generated = $generated.ToString('s')
    manifestSha256 = $global:TK.ManifestHash; lockHost = $(if ($lock) { $lock.host } else { $null }); lockCreated = $(if ($lock) { $lock.created } else { $null })
    vaultRoot = $global:TK.Vault; drives = $driveRows
}
$json = [ordered]@{
    facts = $facts; tools = $toolRows.ToArray(); unmanifested = [ordered]@{ winget = $wingetRows.ToArray(); npmGlobals = $npmGlobals; localBin = $localBin; uvTools = $uvTools; choco = $chocoList }
    mcp = $mcp; configs = $cfgRows.ToArray(); env = $envRows.ToArray(); path = $pathRows; wsl = $wsl
}

$sbm = New-Object System.Text.StringBuilder
$day = $generated.ToString('yyyy-MM-dd')
[void]$sbm.Append("---`ntype: note`nstatus: sprout`ncreated: $day`nupdated: $day`ncourse: Life`ntrack:`n  - laptop`n  - windows`ntags:`n  - note`n  - laptop`nrelated:`n  - `"[[Old Laptop Rebuild - Build 4 Windows Toolkit Findings]]`"`n  - `"[[Installations]]`"`n---`n")
[void]$sbm.Append("# Tool Catalog - $hostName`n`n")
[void]$sbm.Append("Generated by ``40-build-catalog.ps1`` on $($generated.ToString('yyyy-MM-dd HH:mm')). Machine: **$($m.machines.$role.label)** (``$role``). Regenerate with the script; do not hand-edit.`n`n")
[void]$sbm.Append("## Facts`n| Item | Value |`n|---|---|`n")
[void]$sbm.Append("| Host | $hostName |`n| Vault root | ``$(MdCell $global:TK.Vault)`` |`n| Manifest SHA-256 | ``$($global:TK.ManifestHash.Substring(0,16))...`` |`n")
if ($lock) { [void]$sbm.Append("| Lock | written on $(MdCell $lock.host) at $(MdCell $lock.created) |`n") } else { [void]$sbm.Append("| Lock | none yet |`n") }
foreach ($d in $driveRows) { [void]$sbm.Append("| $($d.drive) free | $($d.freeGiB) GiB (used $($d.usedGiB) GiB) |`n") }
[void]$sbm.Append("`n")
$cats = @($toolRows | ForEach-Object { $_.category } | Select-Object -Unique)
foreach ($cat in $cats) {
    [void]$sbm.Append("## $cat`n")
    [void]$sbm.Append("| Tool | Version | Where (drive, size) | Config | Purpose | When to reach for it | Key commands | Runs where | Agent notes |`n|---|---|---|---|---|---|---|---|---|`n")
    foreach ($t in ($toolRows | Where-Object { $_.category -eq $cat })) {
        $ver = $t.version; if (-not $ver) { if ($t.policy -eq 'catalog-only') { $ver = 'WSL only' } elseif ($t.installed) { $ver = 'installed' } else { $ver = 'not installed' } }
        $where = $t.path; if (-not $where) { $where = $t.location }
        $dr = ''; if ($t.drive) { $dr = " ($($t.drive)$(if ($t.sizeMB) { ', ' + $t.sizeMB + ' MB' }))" }
        $cmds = (@($t.keyCommands) | ForEach-Object { '`' + (MdCell $_) + '`' }) -join '<br>'
        [void]$sbm.Append("| **$(MdCell $t.name)** | $(MdCell $ver) | $(MdCell $where)$(MdCell $dr) | $(MdCell ($t.configs -join ', ')) | $(MdCell $t.purpose) | $(MdCell $t.when) | $cmds | $(MdCell $t.runsWhere) | $(MdCell $t.agentNotes) |`n")
    }
    [void]$sbm.Append("`n")
}
[void]$sbm.Append("## MCP servers (names and launch commands only)`n| Config | Server | Command | Resolves | Purpose |`n|---|---|---|---|---|`n")
foreach ($r in $mcp) {
    $res = ''; if ($null -ne $r.resolves) { $res = $(if ($r.resolves) { 'yes' } else { 'NO' }) }
    $cmdTxt = ''; if ($r.command) { $cmdTxt = '`' + (MdCell $r.command) + '`' } else { $cmdTxt = MdCell $r.note }
    [void]$sbm.Append("| $(MdCell $r.file) | $(MdCell $r.name) | $cmdTxt | $res | $(MdCell $r.purpose) |`n")
}
[void]$sbm.Append("`n## Config files and hashes`n| Config | Kind | Target | Status | SHA-256 |`n|---|---|---|---|---|`n")
foreach ($c in $cfgRows) { $hs = ''; if ($c.sha256) { $hs = '`' + $c.sha256.Substring(0, 16) + '...`' }; [void]$sbm.Append("| $(MdCell $c.id) | $(MdCell $c.kind) | $(MdCell $c.target) | $(MdCell $c.status) | $hs |`n") }
[void]$sbm.Append("`n## Environment variables (user scope)`n| Name | Value |`n|---|---|`n")
foreach ($e in $envRows) { $v = $e.value; if (-not $v) { $v = '(unset)' }; [void]$sbm.Append("| $(MdCell $e.name) | ``$(MdCell $v)`` |`n") }
[void]$sbm.Append("`n## PATH order (first 25)`n")
$n = 0; foreach ($p in $pathRows) { $n++; [void]$sbm.Append("$n. ``$(MdCell $p)```n") }
[void]$sbm.Append("`n## Unmanifested software`nEverything found on the machine that the manifest does not manage. Listed so nothing is invisible.`n`n")
[void]$sbm.Append("### winget (not in the manifest)`n| Name | Id | Version |`n|---|---|---|`n")
foreach ($r in $wingetRows) { [void]$sbm.Append("| $(MdCell $r.name) | $(MdCell $r.id) | $(MdCell $r.version) |`n") }
[void]$sbm.Append("`n### npm globals`n")
foreach ($r in $npmGlobals) { [void]$sbm.Append("- $(MdCell $r.name) $(MdCell $r.version)`n") }
[void]$sbm.Append("`n### ~/.local/bin`n$(MdCell ($localBin -join ', '))`n`n### uv tools`n")
foreach ($r in $uvTools) { [void]$sbm.Append("- $(MdCell $r)`n") }
[void]$sbm.Append("`n### Chocolatey`n")
foreach ($r in $chocoList) { [void]$sbm.Append("- $(MdCell $r)`n") }
[void]$sbm.Append("`n## WSL (read-only probe)`n")
if ($wsl.probed) {
    [void]$sbm.Append("Distro ``$($wsl.distro)``. apt manual packages: $($wsl.aptManualCount). WSL configs are replaced by Build 5; this table is the before picture.`n`n")
    [void]$sbm.Append("| Tool | Version | Path |`n|---|---|---|`n")
    foreach ($t in $wsl.tools) { [void]$sbm.Append("| $(MdCell $t.tool) | $(MdCell $t.version) | $(MdCell $t.path) |`n") }
    [void]$sbm.Append("`n| WSL config file | Versus Acer snapshot |`n|---|---|`n")
    foreach ($h in ($wsl.hashes | Sort-Object file)) { [void]$sbm.Append("| ~/$(MdCell $h.file) | $($h.status) |`n") }
    [void]$sbm.Append("`n### apt manual packages`n$(MdCell $wsl.aptManual)`n")
} else { [void]$sbm.Append("Not probed: $(MdCell $wsl.note)`n") }

if ($DryRun) {
    Add-Result 'catalog-write' 'PLAN' ("[DRYRUN] would write 'Tool Catalog - {0}.md' ({1} chars) and tool-catalog-{0}.json" -f $hostName, $sbm.Length)
} else {
    New-Item -ItemType Directory -Force -Path $catDir | Out-Null
    $mdPath = Join-Path $catDir ("Tool Catalog - {0}.md" -f $hostName)
    $jsPath = Join-Path $catDir ("tool-catalog-{0}.json" -f $hostName)
    $mdText = $sbm.ToString()
    if ((Get-SecretHitCount $mdText) -gt 0) { Add-Result 'catalog-write' 'FAIL' 'catalog text matches a secret pattern; not written (text not shown)' }
    else {
        Write-Utf8NoBom -Path $mdPath -Text $mdText
        Write-Utf8NoBom -Path $jsPath -Text ((ConvertTo-Json -InputObject ([pscustomobject]$json) -Depth 8) + "`n")
        Add-Result 'catalog-write' 'PASS' ("wrote {0} and {1}" -f $mdPath, $jsPath) @{ md = $mdPath; json = $jsPath }
    }
}
Complete-Toolkit
