---
type: evergreen
status: sprout
created: 2026-10-15
updated: 2026-10-15
tags:
  - system
  - workflow
  - claude-kit
notes:
  - "[[00_Workflows Index]]"
  - "[[Tool Map]]"
  - "[[The Qualification Pipeline]]"
  - "[[30_Order/Standards/AI Loop/Logs|Logs]]"
---
# Tools Tracking
Keep the Tool Map true whenever a tool moves through the Claude Kit pipeline.
**Use when:** a tool is ingested, tested, promoted, blocked, dropped, or parked in `second-brain-claudekit`.
**Standard:** none yet. The row shape is defined by the header of [[Tool Map]] and the stage definitions by [[The Qualification Pipeline]]. If this becomes a repeated process with drift, write a Standard first ([[30_Order/00_How This Folder Works|How This Folder Works]]).
## Steps
1. Note the new stage. The stages are `sandbox`, `tested-tools`, `promoted (repo-scoped)`, `promoted (global)`, `blocked`, `dropped`, `undecided`, `parked (future)`.
2. In the same session, add or update the tool's `### <Tool>` section in [[Tool Map]] with its bullets: What, Useful for, Global vs. project-scoped, Pipeline stage, Displaces.
3. Append a narrative entry to `20_Progress/Projects/AI Use/Claude Kit/Log.md` naming what changed and what was verified, not what was reported ([[30_Order/Standards/AI Loop/Logs|Logs]]).
4. If the tool reached a real project, update that project's `Setup.md` under `20_Progress/AI/Claude Code/<Project>/`, which lists what is actually deployed.
5. Check the real repo directly, not the Jarvis mirror, before writing that a stage change landed.
## Done when
- The Tool Map row and the Log entry both exist and agree.
- Any deployed change is reflected in the project's `Setup.md`.
