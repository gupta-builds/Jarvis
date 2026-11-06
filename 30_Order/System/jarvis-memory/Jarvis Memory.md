---
type: system
status: sprout
created: 2026-06-02
updated: 2026-11-05
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
A local SQLite registry of every vault note, with an MCP server file that can expose it to AI tools, so an agent could find the few right notes by metadata instead of loading the vault. What exists today, checked on 2026-11-05: `registry.py` with three commands (`index`, `status`, `search`), and `server.py` with three tools (`jarvis_status`, `jarvis_search`, `jarvis_reindex`). `index` fills only the `notes` table (7,151 rows in the current database), and `search` is a `LIKE` match on titles and paths. The other six tables in `schema.sql` (headings, links, chunks, conversations, enrichment_events, benchmarks) exist and have 0 rows, and no code writes to them. There is no semantic search, link graph, chunk index, answer engine or benchmark. The server is not registered anywhere, so no AI tool calls it today. If it is missing, agents already fall back to Obsidian search and the `jarvis` MCP.
## Trigger
CLI, from this folder:
```powershell
python registry.py index
python registry.py status
python registry.py search "observability"
```
MCP: `server.py` runs `FastMCP("jarvis-memory")` with three tools, `jarvis_status`, `jarvis_search`, and `jarvis_reindex`. It needs `pip install mcp`; the CLI needs only the standard library, with Python 3.10 or newer. The vault's `.mcp.json` registers only the `jarvis` server (checked by listing its server names on 2026-10-17 and again on 2026-11-04), so register `jarvis-memory` (`command: python`, `args: [server.py]`, `env: JARVIS_VAULT_ROOT`) before expecting Claude Code to start it. The `mcp` package is not installed in the Python 3.13 on this machine, so `python server.py` there exits with "jarvis-memory requires the 'mcp' package".
## Inputs and Outputs
Reads every Markdown note under the vault root and writes rows to `registry.sqlite` next to `registry.py`. The root comes from `JARVIS_VAULT_ROOT`, then from the first parent folder that holds `00_Dashboard.md` and `.obsidian`, then the working directory. These top-level folders are skipped: `.git`, `.obsidian`, `.claude`, `.cursor`, `.kiro`, `.codex`, `50_Archive`. `.stversions` (Syncthing's old copies, 1,202 `.md` files on 2026-11-04) is now on that list too (added 2026-11-04), so the next `index` will not add them. `index` only inserts and updates rows and never deletes one, so a path that was indexed before a skip rule existed stays until the database file is deleted. Template and clipping notes are indexed (52 and 586 rows). Conversation text stays in `60_Claude/05_Clippings/AI Conversations/` ([[Conversations]]); the registry will store only pointers and metadata.
## State
`registry.sqlite` (and its `-wal` and `-shm` files) is derived state, 3.0 MB after the 2026-11-05 rebuild, ignored by this folder's `.gitignore` (line 2, `*.sqlite`) and by the root `.gitignore` (lines 81 to 83); `git ls-files` does not list it. Delete it and run `index` again at any time; nothing is lost. The index is only as fresh as its last `index` run and nothing schedules it: on 2026-11-04 the file was six weeks old and `search "Vault Lint"` found nothing; after the rebuild it finds `30_Order/System/vault-lint/Vault Lint.md`. The old index also held junk `type` and `track` values (for example a type named `# thought | input | evergreen | class | project | template` and a track of `[]`), because the frontmatter reader kept a template's inline comment as part of the value. The reader was fixed on 2026-11-04 (`clean_scalar` in `registry.py` drops an inline `#` comment and the empty markers `[]`, `{}`, `null` and `~`; a quoted value keeps a `#` inside it). I rebuilt the index on 2026-11-05: confirmed no process held `registry.sqlite` (an exclusive open succeeded) and that it is git-ignored and untracked, copied it to the session scratchpad, deleted it, and ran `index`. Before: 6,265 notes, 32 distinct types including one junk type (`# thought | input | evergreen | class | project | template`) and two junk tracks (`# ai | systems | ...` and `[]`), none under `.stversions`. After: 7,151 notes, 37 distinct types, no junk type or track, none under `.stversions`, and the other six tables still at 0 rows. The 886 extra notes are files written since 2026-09-20. A track of `C Refresher` (10 notes) now appears, which is a real value from course notes.
## Failure Behavior
Read-heavy: the registry never edits a note, and note writes go through the normal workflows and the Write Contract. The CLI works without the `mcp` package; the server does not start without it. A stale index returns old paths rather than an error, so a search result that points to a missing note means reindex.
## Verify
```powershell
python registry.py index
python registry.py status
```
`index` prints a note count that matches the number of `.md` files outside the skipped folders. `status` shows counts by type and track. On 2026-11-05 I ran `index` (7,151 notes), `status` and `search "Vault Lint"` with `%USERPROFILE%\.local\bin\python3.13.exe` (plain `python` is the Microsoft Store shim here), and read the row counts of all seven tables through a read-only SQLite connection. If `index` ever fails, copy the backup back; the rebuild script did that automatically on failure and was not needed.
## Retire
Remove the `jarvis-memory` entry from the MCP settings and delete this folder in one commit that states the reason. The database is regenerable, so nothing needs backing up.
