---
type: evergreen
status: sprout
created: 2026-05-29
updated: 2026-10-15
tags:
  - evergreen
  - mcp-hub
  - agent-entry-point
notes:
  - "[[AI_CONTEXT]]"
  - "[[40_Resources/Obsidian/Jarvis Vault Architecture]]"
---
# MCP Hub Index

Entry point for external agents that reach this vault only through an MCP server and cannot read `CLAUDE.md` or `AGENTS.md` from disk.

There is no separate read order for MCP-only agents. Use the same one as every other tool:

1. [[AI_CONTEXT]] for orientation, the single cold-start read order, and live state.
2. [[40_Resources/Obsidian/Jarvis Vault Architecture]] for where every note goes.
3. [[AGENTS.md]] for the Write Contract.

The `/mcp-hub` skill (`.claude/skills/mcp-hub/mcp-hub.md`) lists MCP tools, builds context packs, and checks that tool wrappers have not drifted.

This file previously carried its own folder map and read order, built on folder names that no longer exist. Those were removed so only one copy of each rule remains.
