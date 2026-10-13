<#
11-node-lts-swap.ps1 - Dell only, by hand. Replaces Node.js 22 (winget OpenJS.NodeJS.22) with Node.js LTS (OpenJS.NodeJS.LTS, 24.x).
Default is a DRY RUN. Add -Apply to change anything. Run in a NORMAL shell; Windows asks for UAC twice (uninstall, install).
Before -Apply: close VS Code, Cursor, Kiro, Antigravity, Claude Desktop and every terminal that runs node, npm or a dev server.
npm global packages live in %APPDATA%\npm and survive; the script lists them before and after to prove it.
Exit codes are printed (1605 = already gone, 3010 = reboot needed).
#>
param([switch]$Apply, [switch]$IgnoreRunning, [ValidateSet('dell', 'acer')][string]$Machine)

. "$PSScriptRoot\_lib.ps1"
$ErrorActionPreference = 'Stop'
Initialize-Toolkit -Name '11-node-lts-swap' -DryRun (-not $Apply.IsPresent) -Machine $Machine | Out-Null
$dry = $global:TK.DryRun
$tool = $global:TK.Manifest.tools | Where-Object { $_.id -eq 'node' }

function Get-NpmGlobals {
    $npm = Resolve-Cmd 'npm'
    if (-not $npm) { return @() }
    $r = Invoke-Native -File $npm -Arguments @('ls', '-g', '--depth=0', '--json') -TimeoutSec 120
    try {
        $j = $r.Output | ConvertFrom-Json
        if ($j.dependencies) { return @($j.dependencies.PSObject.Properties | ForEach-Object { '{0}@{1}' -f $_.Name, $_.Value.version }) }
    } catch { }
    return @()
}

try {
    $v22 = Get-WingetInstalledVersion 'OpenJS.NodeJS.22'
    $vLts = Get-WingetInstalledVersion 'OpenJS.NodeJS.LTS'
    Add-Result 'node-state' 'INFO' ("OpenJS.NodeJS.22 = {0}; OpenJS.NodeJS.LTS = {1}" -f $v22, $vLts)
    $before = Get-NpmGlobals
    Add-Result 'npm-globals-before' 'INFO' ($before -join ', ') @{ globals = $before }

    if (-not $v22 -and $vLts) { Add-Result 'node-swap' 'OK' ("Node LTS {0} already installed and Node 22 is gone" -f $vLts); Complete-Toolkit }
    if (-not $v22 -and -not $vLts) { Add-Result 'node-swap' 'MANUAL' 'Neither Node 22 nor LTS was installed through winget. Run 10-install-toolkit.ps1 to install LTS.'; Complete-Toolkit }

    $running = @(Get-Process -Name node -ErrorAction SilentlyContinue)
    if ($running.Count -gt 0) {
        $names = ($running | ForEach-Object { 'node.exe pid ' + $_.Id }) -join ', '
        if ($IgnoreRunning) { Add-Result 'node-running' 'WARN' ("{0} (continuing because -IgnoreRunning)" -f $names) }
        else { Add-Result 'node-running' 'FAIL' ("{0}. Close editors, Claude Desktop and terminals running node, then re-run." -f $names); Complete-Toolkit }
    } else { Add-Result 'node-running' 'PASS' 'no node.exe running' }

    if ($dry) {
        Add-Result 'node-swap' 'PLAN' '[DRYRUN] would: winget uninstall OpenJS.NodeJS.22, then winget install OpenJS.NodeJS.LTS, then verify major 24 and the npm globals. Re-run with -Apply.'
        Complete-Toolkit
    }

    Write-Log 'Uninstalling Node 22 (a UAC prompt appears).' 'STEP'
    $r1 = Invoke-WingetAction -Action 'uninstall' -Id 'OpenJS.NodeJS.22' -Version $null
    Update-SessionPath
    $still = Get-WingetInstalledVersion 'OpenJS.NodeJS.22'
    if ($still) { Add-Result 'node22-uninstall' 'FAIL' ("Node 22 is still installed ({0}); winget exit {1}. Nothing else was changed." -f $still, $r1.ExitCode); Complete-Toolkit }
    Add-Result 'node22-uninstall' 'PASS' ("Node 22 removed (winget exit {0})" -f $r1.ExitCode)

    Write-Log 'Installing Node LTS (a UAC prompt appears).' 'STEP'
    $r2 = Invoke-WingetAction -Action 'install' -Id 'OpenJS.NodeJS.LTS' -Version $null
    Update-SessionPath
    $st = Get-ToolState $tool
    if ($st.installed -and $st.version -and ([int](($st.version -split '\.')[0]) -eq 24)) { Add-Result 'node-lts-install' 'PASS' ("node {0} at {1} (winget exit {2})" -f $st.version, $st.path, $r2.ExitCode) }
    else { Add-Result 'node-lts-install' 'FAIL' ("expected Node 24, found '{0}' (winget exit {1}). Open a new shell and run 10-install-toolkit.ps1 -Only node." -f $st.version, $r2.ExitCode) }

    $after = Get-NpmGlobals
    $lost = @($before | Where-Object { $after -notcontains $_ })
    if ($lost.Count -eq 0) { Add-Result 'npm-globals-after' 'PASS' ("all {0} global packages survived: {1}" -f $after.Count, ($after -join ', ')) @{ globals = $after } }
    else { Add-Result 'npm-globals-after' 'FAIL' ("missing after swap: {0}" -f ($lost -join ', ')) @{ globals = $after } }
} catch {
    Add-Result 'node-swap-error' 'FAIL' $_.Exception.Message
}
Complete-Toolkit
