---
type: system
status: sprout
created: 2026-05-31
updated: 2026-10-16
tags:
  - system
  - workflow
  - enrichment
system_kind: workflow
serves: "[[Editing Standard]]"
trigger: An existing note matters enough to deepen but is thin, with no examples, source anchors, or drills.
notes:
  - "[[40_Resources/Obsidian/Jarvis Enrichment Engine]]"
  - "[[HUMAN_WRITING]]"
---
# Enrichment
Strengthen an existing note without flattening it. Depth is added under the owner's text, never over it.
## Use when
A note you rely on has thin content and its family Standard says what is missing. Enrichment applies in place and never moves the note.
## Steps
1. Profile the note: its family, the headings it has, and what the Standard says it lacks (example, contrast, source anchor, failure mode).
2. Pick a level. *Light* adds a definition, links, and a few questions. *Standard* adds mechanism, an example, a contrast, misconceptions, and source anchors. *Deep* adds a formal model, an implementation, worked examples, and evidence.
3. Retrieve the related notes and sources first. Enrichment is grounded in the vault, not invented.
4. Draft the addition, then read it against [[HUMAN_WRITING]]: mechanism over vibes, real examples, honest uncertainty.
5. Append it under `## Jarvis Enrichment` (or `## Addendum YYYY-MM-DD`), leaving the original structure and wording visible.
6. Add cards only for concepts the note already explains.
7. Move `updated`, bring the frontmatter to its Standard ([[Conformance on Touch]]), and add one session-log line naming the note and level.
## Do not
Do not rewrite the owner's prose or restructure a `status: tree` note without proposing it first. The keys `enrichment_status` and `enrichment_level` are dormant: no note uses them, so do not add them unless you are running this workflow on purpose, and they are never required.
## Done when
- The original text is intact and the addition carries a mechanism, a concrete example, and a source anchor.
- The note fits its family Standard better than before.
- The session log has the line.
