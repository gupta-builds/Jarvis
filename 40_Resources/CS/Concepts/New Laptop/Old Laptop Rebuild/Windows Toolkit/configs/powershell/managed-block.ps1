# >>> TOOLKIT MANAGED BLOCK (Build 4) >>>
# Managed by Windows Toolkit\_scripts\20-apply-configs.ps1. Edit configs\powershell\managed-block.ps1 in the vault, not this copy.
try {
    [Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($false)
    $OutputEncoding = [Console]::OutputEncoding
} catch { }
if (-not $env:STARSHIP_CONFIG) { $env:STARSHIP_CONFIG = Join-Path $HOME '.config\starship.toml' }
if (-not $global:ToolkitStarshipLoaded -and (Get-Command starship -ErrorAction SilentlyContinue)) {
    $global:ToolkitStarshipLoaded = $true
    Invoke-Expression (& starship init powershell)
}
if (-not $global:ToolkitZoxideLoaded -and (Get-Command zoxide -ErrorAction SilentlyContinue)) {
    $global:ToolkitZoxideLoaded = $true
    Invoke-Expression (& { (zoxide init powershell | Out-String) })
}
if (Get-Module -ListAvailable -Name PSFzf) {
    try {
        Import-Module PSFzf -ErrorAction Stop
        Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r' -PSReadlineChordSetLocation 'Alt+c' -TabExpansion -EnableFd -GitKeyBindings
    } catch { }
}
if ($env:TERM_PROGRAM -eq 'vscode') {
    $toolkitVsInit = Join-Path $HOME '.config\vscode-env\init.ps1'
    if (Test-Path $toolkitVsInit) { . $toolkitVsInit }
}
# <<< TOOLKIT MANAGED BLOCK (Build 4) <<<
