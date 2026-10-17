---
type: system
status: sprout
created: 2026-09-15
updated: 2026-10-16
tags:
  - system
  - workflow
  - plugins
system_kind: workflow
serves: "[[Plugins Usage Standard]]"
trigger: A note needs a live list, a task, a card, a board, a widget, or a diagram.
notes:
  - "[[40_Resources/Obsidian/Plugins/00 Plugin Reference Index|Plugin Reference Index]]"
  - "[[Decoration]]"
---
# Plugins Usage
Add plugin syntax to a note so it returns something real and survives the next folder move.
## Use when
Writing or fixing a Dataview block, a Tasks line, a `#cards` card, a Kanban board, a Meta Bind input, or an Excalidraw or Canvas embed.
## Steps
1. Name the job in one line, for example "list active projects without a `next:`".
2. Pick the plugin from the table in [[Plugins Usage Standard]]. If a list or a sentence would do, write that.
3. Read the plugin's reference note from the [[40_Resources/Obsidian/Plugins/00 Plugin Reference Index|Plugin Reference Index]] for its exact syntax. For templates and dates, `Templater` is the active engine.
4. For Dataview, open three notes that should match and confirm every field in `WHERE` and `TABLE` exists in them.
5. Write the smallest block that does the job. Restrict `FROM` to a folder. Add a one-sentence explanation above any DataviewJS.
6. Confirm every `FROM` path exists as a folder or note today.
7. Open the note in reading view, or run `node vault-lint.js --path <note>` from [[Vault Lint]], which reports `dead-dataview-from`. An empty result needs a reason beside it.
8. For cards, write them only after the concept is explained, with `#cards/<track>`. For open questions use `- [ ]` tasks.
## Do not
Do not edit `.obsidian/`, a plugin `data.json`, or any secret. Do not run a Meta Bind button that executes a command without approval. Do not start a second task system in inline fields.
## Done when
- The block does one job from the Standard and returns rows, or states why it returns none.
- Every path and field it reads exists.
- [[Vault Lint]] reports no `dead-dataview-from` for the note.
