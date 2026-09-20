---
type: evergreen
status: sprout
created: 2026-09-05
updated: 2026-09-05
tags: [evergreen, ai, tooling, second-brain-claudekit]
notes:
  - "[[40_Resources/CS/Repos]]"
  - "[[20_Progress/Projects/AI Use/Claude Kit/Tool Map]]"
---
# Spec Kit (github/spec-kit)

## For future Claude
Real "how Anant actually uses this now" content, written 2026-09-05. Short answer: **installed and run once, for real, but not yet compared against this repo's own workflow or promotion-decided.**

## What it is
GitHub's spec-driven development tooling: `constitution` → `specify` → `clarify` → `plan` → `tasks` → `implement`, forcing alignment before code is written. Previously listed as a "Tier-1, unexecuted" item in this repo's own docs history (`_docs/Design.md`'s Minimal-Footprint section) before this run.

## Install state
**Real next step executed, 2026-08-20** — cited to `Tool Map.md`'s sandbox-triage section. Not promoted, not yet compared feature-by-feature against anything.

## The real commands that worked
```bash
uv tool install specify-cli                                          # real, from PyPI
specify init spec-kit-test --integration claude --non-interactive    # in a scratch project
```
Result: **10 skill files scaffolded for real** into `.claude/skills/speckit-{constitution,specify,plan,tasks,implement,converge,clarify,analyze,checklist,taskstoissues}` — a genuine success, not a README claim.

## What it's for, if promoted
Spec-driven workflow for non-trivial feature work — the framing use case is "use before writing code on anything real," but this hasn't been weighed against `second-brain-claudekit`'s own (currently non-live) brainstorming/planning workflow yet, and that comparison is the actual next decision, not another install.

## WSL vs. Windows split
`uv`/Python CLI tooling scaffolding into a project's `.claude/skills/` — WSL-side, tied to real code projects. Not Jarvis/Obsidian-specific.

## Links
[[20_Progress/Projects/AI Use/Claude Kit/Tool Map|Tool Map]] for the pipeline-stage record. [[40_Resources/CS/Repos|Repos]] for the wider inventory.
