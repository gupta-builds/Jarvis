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
# CPR — Compress, Preserve, Resume (EliaAlberti)

## For future Claude
Real "how Anant actually uses this now" content, written 2026-09-05. Important, non-obvious state: **`/compress`, `/preserve`, `/resume` are NOT currently live slash commands in `second-brain-claudekit` at all** — the old hand-authored trio was archived, the new blended trio was never promoted. Don't assume `second-brain-claudekit/CLAUDE.md`'s "Session Memory (CPR Pattern)" section describes a working command today without checking `.claude/commands/` directly.

## What it is
Three markdown slash commands (`compress`, `preserve`, `resume`) implementing the same Compress→Preserve→Resume session-continuity idea `second-brain-claudekit` had already hand-built (added commit `726f6de`, 2026-04-03).

## Install state: cleared, blend verdict, unpromoted
Cited to `Tool Map.md`'s "cpr-compress-preserve-resume (EliaAlberti)" row and `tested-tools/commands/cpr-compress-preserve-resume/VERDICT.md`. This is `second-brain-claudekit`'s **first individually-tested, evidence-backed promotion decision** (2026-08-19) — verdict: **blend**, not adopt-wholesale or keep-as-is. Confirmed directly 2026-09-05: the blended `compress.md`/`preserve.md`/`resume.md` sit only in `tested-tools/commands/cpr-compress-preserve-resume/`; `second-brain-claudekit/.claude/commands/` has neither the old nor the new trio (the old one is archived at `.claude/_archive/superseded-commands/`). **This is the second "cleared but unpromoted" gap this pipeline has, alongside GBrain** — ready to execute, no further review needed, just the copy step into `.claude/commands/`.

## What was adopted into the blend (the version to promote from)
1. `AskUserQuestion` multi-select, replacing free-text prompts.
2. `allowed-tools:` frontmatter, scoped per command.
3. The real repo's concrete 280-line `/preserve` budget + archive-file logic — adapted to archive into `60_Claude/Sessions/_archive/`, not the source repo's bare `CLAUDE-Archive.md`.
4. Topic-named session-log filenames (`{{date}}-{{time}}-{{topic}}.md`), still inside `60_Claude/Sessions/` (not the source repo's per-project-root `CC-Session-Logs/`).
5. `/resume`'s topic-keyword grep search across `60_Claude/Sessions/*.md`.

## Deliberately NOT adopted
`model: opus` pinning (this repo's other commands don't pin models), full raw-conversation logging in session logs (conflicts with `CLAUDE.md`'s "Progressive summarisation" principle — this repo's logs are structured-summary-only), and per-project-root detection via `CC-Session-Logs/` (superseded by the fixed `60_Claude/Sessions/` anchor this repo already uses).

## What it's for
Session-lifecycle commands scoped to `second-brain-claudekit` itself, not a general promotion candidate elsewhere — per the VERDICT's own `destination:` field.

## WSL vs. Windows split
This is a repo-scoped command set for `second-brain-claudekit`, a real code project that lives in WSL — squarely WSL-side, not a Windows/Jarvis-vault concern.

## Links
[[20_Progress/Projects/AI Use/Claude Kit/Tool Map|Tool Map]] for the pipeline-stage record. [[40_Resources/CS/Repos|Repos]] for the wider inventory.
