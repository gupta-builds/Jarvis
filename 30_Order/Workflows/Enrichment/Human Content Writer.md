---
type: system
status: sprout
created: 2026-09-15
updated: 2026-10-16
tags:
  - system
  - workflow
  - writing
system_kind: workflow
serves: "[[Human Writing Standard]]"
trigger: Any session drafts new prose for a note, or rewrites a note that reads as generic.
notes:
  - "[[HUMAN_WRITING]]"
  - "[[Researcher]]"
  - "[[Decoration]]"
---
# Human Content Writer
Draft prose that already passes the prose check, so cleanup is a final pass and not a rescue.
## Use when
New content will be read later as finished prose (a note, summary, distillation, or log entry), or an existing note sounds generic, inflated, or repetitive.
## Steps
1. Pick the role. For new content use the `human-operator` agent. For an existing note use the `anti-slop-editor` agent or `/remove-ai-slop "path"`. The `human-operator` agent file is still a scaffold, so the checks below are what it applies.
2. Read [[HUMAN_WRITING]], then the note family's Standard and Template. Start from the Template.
3. Gather the facts first with [[Researcher]]. Write only what a vault note or a recorded source supports.
4. Draft one section at a time. Each section does at least one job from check 2 of [[Human Writing Standard]].
5. Run the nine checks of [[Human Writing Standard]] on the draft. Delete first, then replace abstraction with a mechanism, a contrast, or an example from this vault.
6. Mark inferences as inferred and say what is still unclear. Where the thinking is thin, say so; do not polish it.
7. Run [[Decoration]] once the wording is final.
8. Save, then run [[Vault Lint]] on the path.
9. Report which kinds of slop were removed, whether a higher-signal section was added, and any section that is still weak.
## Do not
Do not invent a fact, overwrite a raw clipping, or change frontmatter keys or wikilink targets. Do not make a partial understanding sound finished.
## Done when
- The draft passes the nine checks and the report names any thin section.
- Facts trace to a vault note or a recorded source.
- The note passes [[Vault Lint]].
