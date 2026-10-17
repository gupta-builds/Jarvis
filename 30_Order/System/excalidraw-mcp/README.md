---
type: system
status: sprout
created: 2026-07-05
updated: 2026-10-17
tags:
  - system
  - tooling
  - excalidraw
system_kind: spec
trigger: On demand. The canvas is started by hand with npm run canvas; the MCP server is started by Claude Code over stdio once registered.
owner: Anant, who updates the npm package and re-registers the server on a new machine.
notes:
  - "[[Orchestration]]"
---
# Excalidraw MCP
## Purpose
A local install of the `mcp-excalidraw-server` npm package so Claude Code can draw and edit Excalidraw diagrams element by element instead of generating one in a single shot. If it is missing, `/excalidraw-diagram` cannot build or screenshot a diagram.
## Trigger
Two separate processes. The canvas server holds the live scene in memory and serves a browser UI; you start it yourself with `npm run canvas` from this folder (the script is `node node_modules/mcp-excalidraw-server/dist/server.js`). The MCP server runs over stdio from Claude Code and talks to the canvas server. The drawing workflow is the `/excalidraw-diagram` command and the skill in `.claude/skills/mcp-hub/excalidraw-diagram.md`.
> [!WARNING]
> The vault's `.mcp.json` registers only the `jarvis` server on 2026-10-17. The `excalidraw` server is not registered there, so Claude Code does not start it from the project file. Register it before relying on it.
## Inputs and Outputs
Reads the diagram instructions from Claude Code tool calls. The package documentation says the canvas listens on `http://127.0.0.1:3000` (the `PORT` variable overrides it) and that the MCP server reaches it through `EXPRESS_SERVER_URL`; I could not check this because the package is not installed on this machine. Tools that need a browser (screenshots, viewport, image export) need the canvas open; element tools work without it. The result is exported with `export_scene` as JSON and linked from the note it supports. The plugin setting `useExcalidrawExtension` is `true`, so plain `.excalidraw` files open natively. Today the vault holds three `.excalidraw.md` notes in `10_Areas/Excalidraw/` and one plain `.excalidraw` file in `10_Areas/AI/`, so export has not followed one convention.
## State
`package.json` and `package-lock.json` are tracked. `node_modules/` and `*.log` in this folder are ignored by git, and the canvas keeps its scene only in memory, so a restart clears an unexported drawing. `excalidraw.log` is the server's log.
## Failure Behavior
Not checked: the package is not installed here. A missing canvas does not stop element tools, but screenshot and export calls fail until a browser is open on the canvas URL. The server is third-party code; a crash shows in `excalidraw.log` and nothing in the vault depends on it staying up.
## Verify
```powershell
cd 30_Order\System\excalidraw-mcp
npm install
npm run canvas
```
Open the canvas URL in a browser, then run `/excalidraw-diagram` on a small test and confirm a drawing file appears under `10_Areas/` and is linked from a note. `Test-Path 30_Order\System\excalidraw-mcp\node_modules` is false on a machine that has never run `npm install`.
## Retire
Remove the `excalidraw` entry from the MCP settings, stop the canvas process, then delete this folder in one commit that states the reason. Existing drawing files under `10_Areas/` stay. To update instead of retire, run `npm update mcp-excalidraw-server` from this folder.
