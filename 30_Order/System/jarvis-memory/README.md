---
type: system
status: sprout
created: 2026-06-02
updated: 2026-10-17
tags:
  - system
  - tooling
  - memory
system_kind: spec
trigger: On demand with registry.py, and as the jarvis-memory MCP server when Claude Code starts it (the server is not registered in the project .mcp.json today).
owner: Anant, who decides when to reindex and when to add the next capability.
notes:
  - "[[Memory Management]]"
  - "[[Conversations]]"
---
# Jarvis Memory
## Purpose
A local SQLite registry of every vault note, exposed to AI tools as an MCP server, so an agent finds the few right notes by metadata instead of loading the vault. Today it is a working skeleton: it indexes the `notes` table and offers keyword search over titles and paths. If it is missing, agents fall back to Obsidian search and the `jarvis` MCP. Planned and not built: a chunk index, semantic search, a link graph, conversation rows, an answer engine, and a benchmark. Their tables exist in `schema.sql` (notes, headings, links, chunks, conversations, enrichment_events, benchmarks); only `notes` is filled. Each step adds one function and one MCP tool without restructuring.
## Trigger
CLI, from this folder:
```powershell
python registry.py index
python registry.py status
python registry.py search "observability"
```
MCP: `server.py` runs `FastMCP("jarvis-memory")` with three tools, `jarvis_status`, `jarvis_search`, and `jarvis_reindex`. It needs `pip install mcp`; the CLI needs only the standard library, with Python 3.10 or newer. The vault's `.mcp.json` registers only the `jarvis` server on 2026-10-17, so register `jarvis-memory` (`command: python`, `args: [server.py]`, `env: JARVIS_VAULT_ROOT`) before expecting Claude Code to start it.
## Inputs and Outputs
Reads every Markdown note under the vault root and writes rows to `registry.sqlite` next to `registry.py`. The root comes from `JARVIS_VAULT_ROOT`, then from the first parent folder that holds `00_Dashboard.md` and `.obsidian`, then the working directory. These top-level folders are skipped: `.git`, `.obsidian`, `.claude`, `.cursor`, `.kiro`, `.codex`, `50_Archive`. Conversation text stays in `60_Claude/05_Clippings/AI Conversations/` ([[Conversations]]); the registry will store only pointers and metadata.
## State
`registry.sqlite` (and its `-wal` and `-shm` files) is derived state, ignored by this folder's `.gitignore` and by the root `.gitignore`. Delete it and run `index` again at any time; nothing is lost. On 2026-10-17 the file dates from 2026-09-20, so the index is a month stale.
## Failure Behavior
Read-heavy: the registry never edits a note, and note writes go through the normal workflows and the Write Contract. The CLI works without the `mcp` package; the server does not start without it. A stale index returns old paths rather than an error, so a search result that points to a missing note means reindex.
## Verify
```powershell
python registry.py index
python registry.py status
```
`index` prints a note count that matches the number of `.md` files outside the skipped folders. `status` shows counts by type and track. I did not run these on 2026-10-17 because Python was unusable in this shell (the Microsoft Store shim).
## Retire
Remove the `jarvis-memory` entry from the MCP settings and delete this folder in one commit that states the reason. The database is regenerable, so nothing needs backing up.
