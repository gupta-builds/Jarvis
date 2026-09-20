---
type: evergreen
status: sprout
created: 2026-09-06
updated: 2026-09-06
tags:
  - claude-kit
  - context
  - internship-research-loop
notes: []
next: "Both files are real but empty — decide whether they get populated (and with what) or removed. Not assumed either way this pass."
---
# internship-research-loop — Context

Real inventory of `.claude/context/` in `gupta-builds/internship-research-loop` (`~/projects/work/internship-research-loop/.claude/context/`), both files read directly this session. **First folder of this project's `.claude/` layer to turn up nothing real inside it** — worth stating plainly rather than padding this note out to look equivalent to the Skills/Agents/Hooks notes. No links out from this note on purpose — this project's Toolkit layer is still being built out.

## MEMORY.md

**File:** `.claude/context/MEMORY.md`

**Confirmed empty — zero bytes, not a stub with a heading or a placeholder comment, genuinely nothing.** Given this repo's 7 agents also declare zero `memory` fields (see the Agents note), this sits exactly where a shared, repo-level memory file *could* eventually feed a `project`-scope agent memory (per `60_Claude/Standards/Agent Standard.md`, second-brain-claudekit) — but nothing in this repo currently reads or writes it, and nothing in any agent or skill file references it by path. Treat as reserved, not active.

## jarvis.md

**File:** `.claude/context/jarvis.md`

**Also confirmed empty.** Notably, this is a real, populated file's exact namesake one directory over — `.claude/rules/jarvis.md` (see the Rules note) is a substantial, real file covering vault-reachability. This empty `context/jarvis.md` is not that file and does not duplicate it; it's a distinct, currently-unused placeholder in a different staging category. Worth flagging so a future session doesn't assume this file already covers vault-reachability guidance because of the shared name — it does not, `rules/jarvis.md` is the real one.

## What this means for the "context" staging category generally

Nothing in this project's own `CLAUDE.md` (its skills/agents/rules/hooks tables) mentions `.claude/context/` at all — it isn't referenced by any real skill or agent file the way `.claude/rules/*.md` is (several rule files cite each other, and `program-writer`/`tracking`/`promotion`/`applying` all point at `.claude/rules/jarvis.md` for the vault-reachability check). `context/` currently reads as scaffolding created ahead of real content landing in it, not a gap in something already in use.
