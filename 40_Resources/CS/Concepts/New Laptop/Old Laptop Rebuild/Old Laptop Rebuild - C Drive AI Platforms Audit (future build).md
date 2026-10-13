---
type: note
status: sprout
created: 2026-10-13
updated: 2026-10-13
course: Life
track:
  - laptop
  - windows
tags:
  - note
related:
  - "[[Old Laptop Rebuild - Index]]"
  - "[[Old Laptop Rebuild - Build 5 WSL and D Drive Findings]]"
  - "[[WSL Toolkit Config Reference]]"
next: "Future build (Build 6 territory): audit and configure the AI platforms on C:. Not worked on in Build 5 or 5b beyond the two fixes below."
---
# Old Laptop Rebuild - C Drive AI Platforms Audit (future build)

## One-Line Answer
==The Dell's C: profile holds about 7 GB of AI-tool state across Cursor, Codex/ChatGPT, Claude Code, Kiro, Gemini and VS Code; Build 5b only repaired Cursor and removed ChatGPT Classic, and everything else here is the checklist for a later build.==

## Done in Build 5b (script `D:\WSL\ops\60-build5b-host.ps1`, run by the user)
| Item | Finding | Action in the script |
|---|---|---|
| Cursor will not launch | Root cause: the in-place update 3.19.7 to 3.19.13 was interrupted on 2026-09-06. `Cursor.exe` sits stranded in `...\Programs\cursor\_\` (873 MB), the install root has no `Cursor.exe`, `_bak` holds the old files, `cursor-update.journal.json` is 0 bytes, the registry says 3.19.13, and the Cursor log stops on 2026-09-06 right after "UpdateSupervisor Armed". No crash reports, no Windows application-error events (it never started). | Quarantine the broken install and the stale startup state to `D:\Backup\Quarantine\cursor-*-<date>`, reinstall with `winget install Anysphere.Cursor`, launch-test three ways (normal, `--disable-extensions`, `--disable-gpu`) to isolate any second cause. Settings, chats (`state.vscdb` 755 MB), `snapshots` and `~\.cursor` (extensions, rules, MCP) are not touched. |
| Two ChatGPT apps | Both are Store-signed MSIX packages, not an installer. "ChatGPT Classic" is `OpenAI.ChatGPT-Desktop` 1.2026.190.0 (274 MB of data). The app now called "ChatGPT" is the package `OpenAI.Codex` 26.1007.2314.0 (Store id 9PLM9XGG6VKS). | `Remove-AppxPackage` for Classic only if the new app is present; the new app is checked afterwards. |

## Inventory (2026-10-13, read-only)
| Folder in `C:\Users\Anant Gupta` | Size | Notes |
|---|---|---|
| `.vscode` | 2,508 MB, 33,800 files | extensions; Settings Sync is live between laptops (Build 6) |
| `.cache` | 1,337 MB | |
| `.codex` | 1,301 MB | `.sandbox`, `.sandbox-bin`, `.sandbox-secrets`, `app-server-daemon`, `bin`, `cache`, `memories`, `plugins`, `packages` (a junction to `D:\Cache\codex\packages`); a Codex app-server and a sandbox service are running now |
| `AppData\Local\OpenAI\Codex` | 658 MB | belongs to the new ChatGPT/Codex app, keep |
| `.local` | 1,030 MB | |
| `.kiro` | 929 MB | |
| `.cursor` | 697 MB | extensions, rules, MCP config |
| `.claude` | 172 MB | agents, hooks, memory, plans, plugins, rules |
| `.gemini` 16 MB, `.copilot` 4 MB | | |
| Empty-looking dot folders | 0 MB | `.adal .agents .aider-desk .augment .hermes .mcp-auth .mcpjam .openhands .qoder .qoder-cn .roo .trae .trae-cn` hold skill junctions only |
| Reparse points | 1,597 found at depth 3, 0 broken | Build 3b reported many junctions into `C:\Users\Anant Gupta\.agents\skills\*`, which does not exist; none were broken at this depth, so recheck deeper |
| Processes | claude x10, codex x2, codex sandbox service x1 | |
| Startup (Run key) | Discord, GoogleDriveFS, Rize, Spotify, Docker Desktop, Voquill, Slack | Docker Desktop still starts although its settings say `AutoStart: false` |

## Checklist for the future build
1. Cursor: confirm the repaired install survives its next auto-update (the previous update is what broke it); consider disabling auto-update and updating by hand through winget.
2. Codex/ChatGPT app: verify `~\.codex\config.toml` (profiles, sandbox mode, MCP servers) against the Acer; check the sandbox service starts cleanly; decide whether `.sandbox-secrets` is expected.
3. Claude Code on Windows: settings, hooks, MCP registry against the Acer (this overlaps Build 6, which owns Windows VS Code, MCP and Claude Code settings).
4. Kiro (929 MB), Gemini, Copilot: keep or remove, per what is actually used.
5. The 13 empty dot folders and their junction targets: confirm where the skills really live, then fix or remove.
6. VS Code `.vscode` extensions (2.5 GB): compare the list with the Acer's 34-extension WSL set and the Windows set.
7. Startup apps and Docker auto-start (already on the Index as Build 7 items).
8. Anything that stores state under `C:\Users\Anant Gupta` that could move to `D:\` through an environment variable (follow the layout contract: set the variable first).
