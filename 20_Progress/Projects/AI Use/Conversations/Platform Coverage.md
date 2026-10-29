---
type: project
status: active
created: 2026-10-21
updated: 2026-10-21
tags:
  - project
  - ai
  - conversations
  - coverage
project_kind: spec
next: Keep this table honest as platforms are added; the research plan keeps Claude Code first and the rest after.
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Layer|Conversation Layer]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Capture Pipeline - As Built|Capture Pipeline]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Legacy Layout and Archives|Legacy Layout and Archives]]"
  - "[[30_Order/System/cursor-workflow/README|Cursor Workflow]]"
  - "[[10_Areas/AI/Setup/Conversation Map|Conversation Map]]"
---
# Platform Coverage
## What This Is
==Two of nine AI surfaces on this machine are exported, and the data for at least two more already sits on disk with no exporter.==
For each platform: what exists on the Acer as source data (existence and counts only; no session content was read), whether an exporter exists, and what the archive holds. Checked 2026-10-21. Dell columns come from synced notes.

| Platform | Source data on the Acer | Exporter | Notes in the archive | State |
|---|---|---|---|---|
| Claude Code, Windows | 122 top-level transcripts in `~/.claude/projects` (92 with an assistant turn), plus 96 subagent files | `export-claude-session.ps1`, hook and 30-minute task | Acer 108, Dell 179 | Live; subagent files not exported |
| Claude Code, WSL | Acer distro `Ubuntu-24.04` is Stopped; 22 transcripts counted on 2026-10-17 | `wsl-session-export.ps1`, systemd timer | Acer 18, Dell 142 | Acer last note 2026-10-18; Dell last 2026-10-18 |
| Cowork (Claude Desktop agent mode) | `%APPDATA%\Claude\local-agent-mode-sessions` (not read here) | Sweep on `SessionEnd` inside the hook | 64 under Dell, 63 legacy | No session after 2026-07-24 |
| Cursor | 0 agent-transcript JSONL under `~/.cursor/projects` on this Acer | `export-cursor-sessions.py`, Dell task every 15 min | 78 (Dell only) | Newest note 2026-10-08; `Acer/WSL/Cursor` empty and `Acer/Windows/Cursor` does not exist |
| Codex | 44 JSONL files in `~/.codex/sessions`, dated 2026-10-13 to 2026-10-21 | none | 0 | Not captured; `Acer/Windows/Codex/Home` and `Acer/WSL/Codex` empty |
| Antigravity | `~/.gemini/antigravity` has `conversations` (0 files), `brain` (0 folders), `knowledge`, `bin`, `crashes`, `antigravity_state.pbtxt`, `conversation_summaries.db` | none | 0 | Conversation store looks empty here; not examined further |
| Kiro | `~/.kiro` holds 228 files in `agents`, `crew`, `crew-auth-staging`; no sessions folder | none | 0 | Looks like configuration, not sessions; not examined further |
| Local models | `~/.ollama/models` exists; Ollama and Jan have profile notes under `20_Progress/Projects/AI Use/` | none | 0 | Nothing logs a local run |
| claude.ai chat, ChatGPT | none on disk | none | 0 | No pipeline; the README lists `Claude App/` and `OpenCode/` folders that do not exist |
`~/.config/opencode` also exists on this machine; it is not in any folder or note.
## What the table says
- Claude Code is the only platform with a working path on both OSes, and it is the one this build covers.
- Cursor and Cowork were wired and have stopped; their notes are history.
- Codex has the freshest unexported data: 44 session files, 9 days. Nothing reads them.
- A platform's presence in the archive tree is not coverage: every Acer scaffold folder for Codex, Kiro, AGY, and Local is empty, and the Dell has none of them.
## Non-Goals
This does not rank platforms or say which to wire next. The research plan puts the other platforms after Claude Code.
