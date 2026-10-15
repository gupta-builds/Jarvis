---
type: evergreen
status: sprout
created: 2026-10-15
updated: 2026-10-15
tags:
  - system
  - standards
notes:
  - "[[Tool Calls]]"
  - "[[Memory Management]]"
  - "[[Jarvis OS — North Star]]"
  - "[[CLAUDE]]"
---
# Orchestration
==Read wide in a subagent, decide in the main window: the agent returns the conclusion, not the transcript.==
This is the behavior standard for when a task goes to a subagent, a skill, or stays inline, and how a subagent file is shaped. It governs a different question than [[Tool Calls]]: Tool Calls picks the single tool for one step, Orchestration picks who runs the whole task. Plugin choice (Dataview, Tasks, Kanban) is a third question and lives in the Workflow Chooser of [[AI_CONTEXT]].
## Spawn threshold
Spawn a subagent when a side task would flood the main conversation with reading you will not reference again: a search that must open twenty notes to find three, a full-source ingestion, a link audit. Keep it inline when one or two tool calls finish the job.
- Use `Explore` to find files when the path is unknown and the search needs three or more queries.
- Use `research-distiller` for long PDFs that need section-by-section extraction.
- Use `fork` when the work needs the context already in the conversation.
- A subagent starts cold. Brief it with the goal, what is already ruled out, and the exact paths to read.
## Skill, agent, or inline
- **Skill (a `/command`):** a repeatable procedure with a fixed checklist, run in the main window. Examples: `/startday`, `/closeday`, `/ingest-clipping`, `/weekly-review`.
- **Agent:** isolated context for heavy reading or a distinct role. Examples below.
- **Inline:** everything else.
## Agent file shape
Each agent is `.claude/agents/<name>.md` with frontmatter `name`, `description`, `tools`, and `model`. The description is third person and says when to use it: "Use proactively for... MUST BE USED for...". The `tools` list holds only what the role needs, so a read-only role cannot write.
## Roster
| Agent | Use for | Tools |
|---|---|---|
| `ingestion` | any new source: YouTube, transcript, clipping, PDF | Read, Write, WebFetch, Bash |
| `research-distiller` | deep multi-source or long-PDF distillation | Read, Glob, Grep, Edit, Write, Bash, WebFetch |
| `human-operator` | default writer for new vault prose | Read, Write, Edit |
| `anti-slop-editor` | rewriting AI-sounding notes | Read, Glob, Grep, Edit, Write |
| `note-to-actions` | turning a note into an action map | Read, Write |
| `learning-agent` | drills, spaced repetition, learning from the vault only | Read, Glob, Grep, Edit, Write |
| `professor` | coordinating coursework skills | Read, Grep, Glob, Edit |
| `daily-operator` | dashboard, plans, rollover, deadlines | Read, Grep, Glob, Edit |
| `career-operator` | applications, resume, portfolio briefs | Read, Glob, Grep, Edit, Write |
| `vault-curator` | links, orphans, duplicates, Write Contract checks | Read, Glob, Grep, Edit, Write |
| `llm-council` | high-stakes decisions needing five advisors | Read, Grep, Glob |
Counts and tool lists drift. The folder `.claude/agents/` is the truth; fix this table when it disagrees.
> [!WARNING]
> Treating a subagent's report as fact. A report describes what the agent intended to do. On 2026-10-15 a survey agent returned a "will report back" line with zero tool uses recorded. Check tool-use counts, and read the files that carry the conclusion before acting on it.
> [!WARNING]
> Spawning an agent for a one- or two-call task. The briefing costs more than the work.
## Done Conditions
- Wide reading happened in a subagent, and only its conclusion entered the main window.
- Every agent used appears in the roster, and its file follows the shape above.
- Anything an agent reported that changes the vault was checked against the files before it was written.
## Gold Standard Example
`.claude/agents/anti-slop-editor.md`: one role, a trigger sentence, a minimal tool list, and a short rule list the agent can follow without asking.
