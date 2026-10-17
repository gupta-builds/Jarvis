---
type: system
status: sprout
created: 2026-10-15
updated: 2026-10-16
tags:
  - system
  - workflow
  - claude-kit
system_kind: workflow
serves: "[[Logs]]"
trigger: A tool is ingested, tested, promoted, blocked, dropped, or parked in second-brain-claudekit.
notes:
  - "[[Tool Map]]"
  - "[[Tool Setup]]"
  - "[[Files Tracking]]"
---
# Tools Tracking
Keep the Tool Map true whenever a tool moves through the Claude Kit pipeline.
## Use when
A tool is ingested, tested, promoted, blocked, dropped, or parked. The row shape is set by the header of [[Tool Map]], a single living note with no Standard of its own; the entry is a narrative log entry shaped by [[Logs]].
## Steps
1. Note the new stage: `sandbox`, `tested-tools`, `promoted (repo-scoped)`, `promoted (global)`, `blocked`, `dropped`, `undecided`, or `parked (future)`.
2. In the same session, add or update the tool's `### <Tool>` section in [[Tool Map]] with its bullets: What, Useful for, Global vs. project-scoped, Pipeline stage, Displaces.
3. Append a narrative entry to `20_Progress/Projects/AI Use/Claude Kit/Log.md` naming what changed and what was verified, not what was reported.
4. If the tool reached a real project, update that project's `Setup.md` under `20_Progress/AI/Claude Code/<Project>/` with [[Files Tracking]]. It lists what is actually deployed.
5. Check the real repo directly, not the Jarvis mirror, before writing that a stage change landed.
## Do not
Do not log a stage change from a report alone, or change a Tool Map row without the matching log entry.
## Done when
- The Tool Map row and the Log entry both exist and agree.
- Any deployed change is reflected in the project's `Setup.md`.
