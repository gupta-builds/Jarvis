---
type: system
status: sprout
created: 2026-05-31
updated: 2026-10-16
tags:
  - system
  - workflow
system_kind: workflow
serves: "[[Reference Standard|Reference Standard]]"
trigger: A distilled note is trusted, has been reused, and reads like lookup material or domain truth.
notes:
  - "[[Evergreen Standard]]"
  - "[[40_Resources/Obsidian/Jarvis Vault Architecture]]"
---
# Promotion
Move a matured note out of the AI workshop into a durable layer, one note at a time, so `60_Claude` stays a workshop.
## Use when
A `20_Distilled_Notes` note is `status: tree` and linked from a project, a brief, or another concept.
## Steps
1. Confirm it is `tree` and actually reused. If not, leave it where it is.
2. Pick the target. Canonical truth about a domain (career, trading thesis, studies) is patched into the `10_Areas/` hub by heading. Something you look up to do the work becomes one `40_Resources/` entry.
3. For `40_Resources/`, retype it `reference`, set `reference_kind` and `area`, and place the single note with a backlink to its `10_Areas` domain ([[Reference Standard|Reference Standard]]).
4. Leave a pointer in the origin that links forward. The origin keeps its provenance links.
5. Repoint every link that named the old location.
6. Run [[Vault Lint]] on the new path and add one line to the session log.
## Do not
Do not promote a batch, and do not promote on your own judgment. An agent proposes and backlinks; the owner decides whether the note earns a place in the hub. When in doubt, flag it and leave it.
## Done when
- The durable note lives in the right layer and backlinks to its domain.
- Nothing was bulk-written into `40_Resources/`.
- Links resolve and the origin points forward.
