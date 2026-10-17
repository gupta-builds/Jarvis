---
type: system
status: sprout
created: 2026-05-31
updated: 2026-10-16
tags:
  - system
  - workflow
system_kind: workflow
serves: "[[Output Standard]]"
trigger: You need an artifact for an outsider: an interview story, a portfolio bullet, or a project one-pager.
notes:
  - "[[Evergreen Standard]]"
  - "[[HUMAN_WRITING]]"
---
# Output with Provenance
Build a deliverable for someone else and keep every claim traceable to a vault note.
## Use when
You would put it on a resume, send it to a mentor, or paste it into an application. If it only teaches you, it is a distilled note instead.
## Steps
1. Pick the kind: `story`, `bullet`, or `one-pager`. Other kinds have no Standard yet.
2. List the concepts and project evidence it draws on, such as a distilled note or a project's Current State.
3. Copy the matching template: [[Output Template]] (story), [[Output Bullet Template]], or [[Output One-Pager Template]].
4. Save it next to the project it serves, for example `20_Progress/Projects/Research/BOOM/`. There is no Outputs folder and no Output Index.
5. Set `source_concepts` to those notes and open each link to confirm it resolves.
6. Write it tight and concrete for a reader who has no context ([[HUMAN_WRITING]]).
7. Run [[Vault Lint]] on the path and add one line to the session log.
## Do not
Do not file an output in `40_Resources/` or write a claim with no source concept behind it.
## Done when
- The artifact reads cleanly to an outsider.
- `source_concepts` traces every claim to a real note.
- It sits beside its project and passes lint for its kind.
