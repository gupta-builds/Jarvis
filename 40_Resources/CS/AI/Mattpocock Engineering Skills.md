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
# Mattpocock Engineering Skills

## For future Claude
Real "how Anant actually uses this now" content, written 2026-09-05. Short answer: **not yet in real use** — reviewed as a batch, individually untested, sitting in the second-look stage. Don't cite this as a live tool without checking the "Install state" section below first, it may have moved.

## What it is
41 skills total from `mattpocock/skills` (not the 18 originally assumed — a real correction from actually running the installer), targeting common agent failure modes. Only the `engineering/` category (17 skills — `code-review`, `tdd`, `diagnosing-bugs`, `implement`, `research`, `to-spec`, `to-tickets`, `codebase-design`, `domain-modeling`, `improve-codebase-architecture`, `resolving-merge-conflicts`, `triage`, `wayfinder`, `ask-matt`, `grill-with-docs`, `prototype`, `setup-matt-pocock-skills`) has been looked at; `personal`, `productivity`, `misc`, `in-progress`, `deprecated` haven't.

## Install state
**Cleared `sandbox/`, sitting in `tested-tools/skills/mattpocock-engineering/` (batch-reviewed, ungrouped — no `<use-case>/` layer yet, per `60_Claude/vault-rules/pipeline-conventions.md`'s "reviewed as a batch, not yet split" convention). Not promoted to any rigid folder.** Cited to `Tool Map.md`'s "mattpocock-skills (`engineering/` category)" row. As of 2026-09-05, **still 0 of the 17 skills individually tested** — `second-brain-claudekit/tests/skills/mattpocock-engineering/README.md`'s dated backlog table (created 2026-08-19, re-checked 2026-09-05) has every row marked `No`, unchanged.

## The real command that worked (and the one that didn't)
The interactive picker doesn't complete non-interactively:
```bash
bunx skills@latest add mattpocock/skills   # picker hangs waiting for interactive input — doesn't work headless
```
The actual workaround, disclosed rather than hidden: the whole `engineering/` category was copied by hand for manual review instead of cherry-picked live through the picker.

## What it's for, if promoted
Likely global (generic engineering-process skills, not tied to a specific stack) — `code-review`, `tdd`, `diagnosing-bugs` etc. don't obviously duplicate anything already installed, but per `_docs/Promotion-Criteria.md` that's exactly what individual testing exists to confirm before promotion, not something to assume from the category name.

## WSL vs. Windows split
These are generic software-engineering skills (code review, TDD, merge-conflict resolution) — squarely WSL-side once any are individually tested and promoted, since WSL is where Anant's real code projects (BOOM, Portfolio, CausalOps) live. Nothing here is Jarvis/Obsidian-specific.

## Links
[[20_Progress/Projects/AI Use/Claude Kit/Tool Map|Tool Map]] for the pipeline-stage record. [[40_Resources/CS/Repos|Repos]] for the wider inventory.
