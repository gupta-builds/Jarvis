---
type: evergreen
status: sprout
created: 2026-10-15
updated: 2026-10-15
tags:
  - system
  - standards
notes:
  - "[[Orchestration]]"
  - "[[Vault Rules — Complete AI Ruleset]]"
  - "[[Jarvis Writing and Formatting]]"
  - "[[AGENTS]]"
---
# Tool Calls
==Pick the narrowest tool that does the job, and never open a file only to confirm a secret is there.==
This is the behavior standard for which tool an agent reaches for when it reads, searches, or writes in this vault. It governs a different question than [[Orchestration]]: Tool Calls decides the single call, Orchestration decides when to hand a whole task to a subagent or skill. This section used to live in `Vault Rules — Operational Reference.md`; it moved here on 2026-10-15 so there is one copy.
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
Prefer `Read`, `Edit`, `Write`, `Grep`, `Glob` over `mcp__filesystem__*` equivalents. Use MCP filesystem tools only when the core tools cannot perform the operation. Use the `obsidian-cli` skill when the task needs Obsidian's running state (the open note, backlinks, typed properties, Bases queries), not for ordinary file work.
> [!WARNING]
> Reading a plugin `data.json`, `.env*`, credentials file, or `.mcp.json` to "check it looks right". Existence checks and actions that consume the value without printing it are allowed. Reading the value back is not, on any tool, for any reason. See the Safety section of [[AGENTS]].
## When one call is not enough
If the job needs three or more searches, or reading many notes you will not reference again, stop calling tools one by one and delegate it: see the spawn threshold in [[Orchestration]].
## Done Conditions
- Every write to an existing file was a patch by heading, or was preceded by a `Read` in the same session.
- No search was done with `Bash` when `Grep` or `Glob` fits.
- No secret-bearing file was opened to show its contents.
## Gold Standard Example
None yet. This Standard is a relocation of rules that were already in use, and no session has been reviewed against it. When a review ([[30_Order/Standards/AI Loop/Review System|Review System]]) finds a session that handled a hard case well, name it here.
