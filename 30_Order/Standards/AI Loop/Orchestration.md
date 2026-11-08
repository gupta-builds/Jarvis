---
type: system
status: sprout
created: 2026-10-15
updated: 2026-11-07
tags:
  - system
  - standards
system_kind: standard
family: policy
maps_to: []
used_by: []
gold_standard: none
notes:
  - "[[Tool Calls]]"
  - "[[Memory Management]]"
  - "[[Jarvis OS — North Star]]"
  - "[[CLAUDE]]"
---
# Orchestration
==Read wide in a subagent, decide in the main window: the agent returns the conclusion, not the transcript.==
This is the behavior policy for when a task goes to a subagent, a skill, or stays inline, and how an agent file is shaped. It picks who runs the whole task; [[Tool Calls]] picks the single tool for one step. Plugin choice (Dataview, Tasks, Kanban) is a third question, answered by the Workflow Chooser in [[AI_CONTEXT]].
## Rules
| Rule | Why | Enforced by |
|---|---|---|
| Spawn a subagent when a side task would flood the main conversation with reading you will not reference again: a search that must open twenty notes to find three, a full-source ingestion, a link audit | The main window should hold decisions, not reading | Reader |
| Keep a task inline when one or two tool calls finish it | The briefing costs more than the work | Reader |
| Use `Explore` when the path is unknown and the search needs three or more queries; `research-distiller` for long PDFs that need section-by-section extraction; `fork` when the work needs the context already in the conversation | Each has the right context for its job | Reader |
| A subagent starts cold: brief it with the goal, what is already ruled out, and the exact paths to read | An agent that has to rediscover the goal repeats ruled-out work | Reader |
| A skill (`/command`) is a repeatable procedure with a fixed checklist, run in the main window: `/startday`, `/closeday`, `/ingest-clipping`, `/weekly-review` | A fixed procedure needs no isolated context | Reader |
| An agent is isolated context for heavy reading or a distinct role | Isolation is the point | Reader |
| An agent file is `.claude/agents/<name>.md` with frontmatter `name`, `description`, `tools`, and `model`. The description is third person and says when to use it: "Use proactively for... MUST BE USED for...". `tools` lists only what the role needs | A read-only role cannot write if it lacks Write and Edit | Reader |
| Check a subagent's tool-use count and read the files that carry its conclusion before acting on it | A survey agent once returned a "will report back" line with zero tool uses recorded | Reader |
## Roster
Checked against `.claude/agents/` on 2026-11-07: 11 files. The folder is the truth; fix this table when it disagrees.

| Agent | Use for | Tools | Model |
|---|---|---|---|
| `ingestion` | any new source: YouTube, transcript, clipping, PDF | Read, Write, WebFetch, Bash | claude-sonnet-5 |
| `research-distiller` | deep multi-source or long-PDF distillation | Read, Glob, Grep, Edit, Write, Bash, WebFetch | claude-sonnet-4-6 |
| `human-operator` | default writer for new vault prose | Read, Write, Edit | claude-sonnet-5 |
| `anti-slop-editor` | rewriting AI-sounding notes | Read, Glob, Grep, Edit, Write | claude-sonnet-4-6 |
| `meeting-operator` | a meeting transcript through brief then action note, asking at each checkpoint | Read, Glob, Grep, Write, Edit, Bash | inherit |
| `learning-agent` | drills, spaced repetition, learning from the vault only | Read, Glob, Grep, Edit, Write | claude-sonnet-4-6 |
| `professor` | coordinating coursework skills | Read, Grep, Glob, Edit | claude-sonnet-5 |
| `daily-operator` | dashboard, plans, rollover, deadlines | Read, Grep, Glob, Edit | claude-sonnet-5 |
| `career-operator` | applications, resume, portfolio briefs | Read, Glob, Grep, Edit, Write | claude-sonnet-4-6 |
| `vault-curator` | links, orphans, duplicates, Write Contract checks | Read, Glob, Grep, Edit, Write | claude-sonnet-4-6 |
| `llm-council` | high-stakes decisions needing five advisors | Read, Grep, Glob | claude-sonnet-5 |
## Example
- **Right:** `Use proactively for rewriting or cleaning markdown notes that sound generic,`
- **Wrong:** None seen.
## Done Conditions
- Wide reading happened in a subagent, and only its conclusion entered the main window.
- Every agent used appears in the roster, and its file follows the shape above.
- Anything an agent reported that changes the vault was checked against the files before it was written.
## Gold Standard Example
None. A policy has no instance. `.claude/agents/anti-slop-editor.md` is the closest to the agent file shape: one role, a trigger sentence, a minimal tool list. It was not reviewed against a real delegation.
