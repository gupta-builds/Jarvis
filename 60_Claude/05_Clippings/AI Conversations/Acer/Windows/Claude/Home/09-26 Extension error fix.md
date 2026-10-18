---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "Extension error fix"
started_at: 2026-09-26T19:22:07
ended_at: 2026-09-26T19:22:38
exported_at: 2026-10-17T21:06:39
duration_minutes: 0.5
project: Home
cwd: 'C:\Users\anant'
session_id: b9b13e0a-cfbd-4a89-a228-75992aa6f6a0
status: raw
turn_count: 3
tools_used:
  Edit: 1
  PowerShell: 3
  Read: 1
tokens:
  input: 20
  output: 2841
  cache_creation: 41393
  cache_read: 440175
  total: 484429
cost_usd: null
model:
  - "claude-opus-5-5"
files_touched:
  - "C:\\Users\\anant\\AppData\\Roaming\\Code\\User\\settings.json"
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# Extension error fix

## You

[Image #1], fix this extension error

[image attached]

## You

[Image: source: C:\Users\anant\AppData\Local\Temp\claude\C--Users-anant\[REDACTED]\images\1.png]

## Claude

ripgrep is already installed via winget. I'll point Todo Tree at it in the VS Code user settings.

I fixed it. Newer versions of VS Code no longer bundle ripgrep where Todo Tree looks for it. You already have ripgrep 15.2.0 installed through winget, so I pointed the extension to that copy.

I added this to your VS Code user settings (`%APPDATA%\Code\User\settings.json`), in a new Todo Tree section near the top:

```jsonc
"todo-tree.ripgrep.ripgrep": "C:\\Users\\anant\\AppData\\Local\\Microsoft\\WinGet\\Packages\\BurntSushi.ripgrep.MSVC_Microsoft.Winget.Source_8wekyb3d8bbwe\\ripgrep-15.2.[REDACTED]\\rg.exe"
```

I haven't confirmed the error is gone yet. To check, run **Developer: Reload Window** from the Command Palette (or restart VS Code) and see whether the message comes back.

This path includes the version number (`ripgrep-15.2.0`), so it will break when winget upgrades ripgrep. When that happens, update the path to match the new folder.

### Tool Calls

- `PowerShell` -- `{"command":"(Get-Command rg -ErrorAction SilentlyContinue).Source; Get-ChildItem \"$env:LOCALAPPDATA\\Programs\\Microsoft VS Code\" -Recurse -Filter rg.exe -ErrorAction SilentlyContinue | Select-Object -ExpandProperty FullName; Test-Path \"$env:APPDATA\\Code\\User\\settings.json\"","description":"Locate ripgrep executables and VS Code settings"}`
- `PowerShell` -- `{"command":"Select-String -Path \"$env:APPDATA\\Code\\User\\settings.json\" -Pattern \"todo-tree\" | ForEach-Object { $_.Line }; (Get-Content \"$env:APPDATA\\Code\\User\\settings.json\" -TotalCount 5) -join \"`n\"","description":"Check existing Todo Tree settings"}`
- `Read` -- `C:\Users\anant\AppData\Roaming\Code\User\settings.json`
- `PowerShell` -- `{"command":"Test-Path \"$env:LOCALAPPDATA\\Microsoft\\WinGet\\Links\\rg.exe\"","description":"Check for a version-independent winget link to rg"}`
- `Edit` -- `C:\Users\anant\AppData\Roaming\Code\User\settings.json`
```diff
-     // ---------- Editor ----------
    "editor.formatOnSave": true,
+     // ---------- Todo Tree ----------
    // VS Code no longer ships a ripgrep the extension can find; use the winget install.
    "todo-tree.ripgrep.ripgrep": "C:\\Users\\anant\\AppData\\Local\\Microsoft\\WinGet\\Packages\\BurntSushi.ripgrep.MSVC_Microsoft.Winget.Source_8wekyb3d8bbwe\\ripgrep-15.2.[REDACTED]\\rg.exe",

    // ---------- Editor ----------
    "editor.formatOnSave": true,
```

## Actions Taken

**Files created:**
_None_

**Files modified:**
- `C:\Users\anant\AppData\Roaming\Code\User\settings.json`

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
_None_


