---
type: system
status: sprout
created: 2026-06-02
updated: 2026-11-04
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
A local SQLite registry of every vault note, with an MCP server file that can expose it to AI tools, so an agent could find the few right notes by metadata instead of loading the vault. What exists today, checked on 2026-11-04: `registry.py` with three commands (`index`, `status`, `search`), and `server.py` with three tools (`jarvis_status`, `jarvis_search`, `jarvis_reindex`). `index` fills only the `notes` table (6,265 rows in the current database), and `search` is a `LIKE` match on titles and paths. The other six tables in `schema.sql` (headings, links, chunks, conversations, enrichment_events, benchmarks) exist and have 0 rows, and no code writes to them. There is no semantic search, link graph, chunk index, answer engine or benchmark. The server is not registered anywhere, so no AI tool calls it today. If it is missing, agents already fall back to Obsidian search and the `jarvis` MCP.
## Trigger
CLI, from this folder:
```powershell
python registry.py index
python registry.py status
python registry.py search "observability"
```
MCP: `server.py` runs `FastMCP("jarvis-memory")` with three tools, `jarvis_status`, `jarvis_search`, and `jarvis_reindex`. It needs `pip install mcp`; the CLI needs only the standard library, with Python 3.10 or newer. The vault's `.mcp.json` registers only the `jarvis` server (checked by listing its server names on 2026-10-17 and again on 2026-11-04), so register `jarvis-memory` (`command: python`, `args: [server.py]`, `env: JARVIS_VAULT_ROOT`) before expecting Claude Code to start it. The `mcp` package is not installed in the Python 3.13 on this machine, so `python server.py` there exits with "jarvis-memory requires the 'mcp' package".
## Inputs and Outputs
Reads every Markdown note under the vault root and writes rows to `registry.sqlite` next to `registry.py`. The root comes from `JARVIS_VAULT_ROOT`, then from the first parent folder that holds `00_Dashboard.md` and `.obsidian`, then the working directory. These top-level folders are skipped: `.git`, `.obsidian`, `.claude`, `.cursor`, `.kiro`, `.codex`, `50_Archive`. `.stversions` (Syncthing's old copies, 1,202 `.md` files on 2026-11-04) is not on that list, so the next `index` would add them, and the current database predates them (0 rows). Template and clipping notes are indexed (52 and 586 rows). Conversation text stays in `60_Claude/05_Clippings/AI Conversations/` ([[Conversations]]); the registry will store only pointers and metadata.
## State
`registry.sqlite` (and its `-wal` and `-shm` files) is derived state, 2.6 MB, ignored by this folder's `.gitignore` (line 2, `*.sqlite`) and by the root `.gitignore` (lines 81 to 83); `git ls-files` does not list it. Delete it and run `index` again at any time; nothing is lost. The file dates from 2026-09-20, so on 2026-11-04 the index is six weeks stale: `search "Vault Lint"` returned no match for a note created on 2026-10-16. The `type` and `track` counts in `status` include junk values, for example a type named `# thought | input | evergreen | class | project | template`, because the frontmatter reader keeps a template's inline comment as part of the value.
## Failure Behavior
Read-heavy: the registry never edits a note, and note writes go through the normal workflows and the Write Contract. The CLI works without the `mcp` package; the server does not start without it. A stale index returns old paths rather than an error, so a search result that points to a missing note means reindex.
## Verify
```powershell
python registry.py index
python registry.py status
```
`index` prints a note count that matches the number of `.md` files outside the skipped folders. `status` shows counts by type and track. On 2026-11-04 I ran `status` and `search` with `%USERPROFILE%\.local\bin\python3.13.exe` (plain `python` is the Microsoft Store shim here), and the database file did not change. I did not run `index`, because it rewrites the database, and I read the row counts of all seven tables through a read-only SQLite connection.
## Retire
Remove the `jarvis-memory` entry from the MCP settings and delete this folder in one commit that states the reason. The database is regenerable, so nothing needs backing up.
