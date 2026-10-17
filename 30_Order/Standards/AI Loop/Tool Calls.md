---
type: system
status: sprout
created: 2026-10-15
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: policy
maps_to: []
used_by: []
gold_standard: none
notes:
  - "[[Orchestration]]"
  - "[[Jarvis Writing and Formatting]]"
  - "[[AGENTS]]"
---
# Tool Calls
==Pick the narrowest tool that does the job, and never open a file only to confirm a secret is there.==
This is the behavior policy for which tool an agent reaches for when it reads, searches, or writes in this vault. It decides the single call. [[Orchestration]] decides when a whole task goes to a subagent or skill.
## Reading files
| Situation | Tool |
|---|---|
| Any text file or Markdown note | `Read` |
| PDF file | Python pypdf via `Bash` |
| Image file | `Read` (multimodal) |
| Live URL | `WebFetch` |
| Search file contents | `Grep` |
| Find files by pattern | `Glob` |
| Directory listing | `Bash` (ls) |
## Writing files
| Situation | Tool |
|---|---|
| Patching an existing file by heading | `Edit` (patch only, do not rewrite) |
| Creating a new file | `Write` |
| Full rewrite of an existing file | `Read` first, then `Write` |
## MCP and filesystem tools
Prefer `Read`, `Edit`, `Write`, `Grep`, and `Glob` over `mcp__filesystem__*` equivalents. Use MCP filesystem tools only when the core tools cannot do the operation. Use the `obsidian-cli` skill when the task needs Obsidian's running state (the open note, backlinks, typed properties, Bases queries), not for ordinary file work.
> [!WARNING]
> Reading a plugin `data.json`, `.env*`, credentials file, or `.mcp.json` to check it looks right. Existence checks and actions that consume the value without printing it are allowed. Reading the value back is not, on any tool, for any reason ([[AGENTS]], Safety).
## When one call is not enough
If the job needs three or more searches, or reading many notes you will not reference again, delegate it. The spawn threshold is in [[Orchestration]].
## Done Conditions
- Every write to an existing file was a patch by heading, or followed a `Read` in the same session.
- No search was done with `Bash` where `Grep` or `Glob` fits.
- No secret-bearing file was opened to show its contents.
## Gold Standard Example
None. This policy relocated rules already in use, and no session has been reviewed against it. When a review ([[Review System]]) finds a session that handled a hard case well, name it here.
