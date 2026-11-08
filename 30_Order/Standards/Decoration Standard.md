---
type: system
status: sprout
created: 2026-09-15
updated: 2026-11-07
tags:
  - system
  - standards
  - writing
system_kind: standard
family: policy
maps_to: []
used_by:
  - "[[Decoration]]"
gold_standard: "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]]"
notes:
  - "[[Jarvis Writing and Formatting]]"
  - "[[Plugins Usage Standard]]"
  - "[[Human Writing Standard]]"
---
# Decoration Standard
==Every marker in a note tells review, search, or the reader what to do with a line. A marker that carries no job is removed.==
This is the Standard for the markers inside a note body: highlight, bold, italic labels, callouts, tables, embeds, math, and code. It gives counts and triggers that a reviewer can check. It is not the syntax and blank-line rules ([[Jarvis Writing and Formatting]]) and not the choice of plugin or card syntax ([[Plugins Usage Standard]]).
## Markers
| Marker | Use | Never | Why | Enforced by |
|---|---|---|---|---|
| `==highlight==` | Exactly one per `##` section, on the one most important definitional claim. In a note tagged `#cards` it becomes a cloze card | A second highlight in a section: it makes an accidental flashcard. The one exception is `## Flashcards`, where each card carries its own cloze | A highlight is a cloze in a #cards note, so an extra one is an accidental flashcard | Reader |
| **Bold** | A named concept, entity, or category label, on first introduction. In a `#cards` section every bold term is a cloze | A whole sentence, or general emphasis | Bold marks a term to remember, and a cloze in a card section | Reader |
| *Italic label* | `*Mechanism:*`, `*Failure mode:*`, `*Interview value:*` introduce a sub-group | Using it as a cloze | The label names a sub-group; a card needs a cloze, a label is not one | Reader |
| Numbered item with a bold title | `1. **Title**`, with sub-content indented by a tab | Spaces for the indent | A tab keeps sub-content nested when Obsidian renders the list | Reader |
| Table | Compare rows | A list Dataview could derive from frontmatter. That is a query, not a hand-built table | A hand-built table drifts from the notes it lists | Reader; the blank line above a table is Lint, check 5 (warning) |
| Embed (Excalidraw, Canvas) | Sits beside a paragraph that states the mechanism in words | An image-only diagram: it is invisible to search | Search reads words, not drawings | Reader |
| Math | `$...$` with a sentence saying what it means; `$$...$$` only for an equation worth its own line | Bare notation | Search and the reader cannot read bare notation | Reader |
| Code block | A language identifier, kept short | Raw source material in a durable note. Long captures go to `60_Claude/05_Clippings/` or a source summary | A language identifier lets tools highlight the block | Reader |
## Callouts
| Type | Use when |
|---|---|
| `NOTE` | Source context or background the reader needs |
| `TIP` | A practical shortcut |
| `WARNING` | A correctness or safety risk, or the main failure mode of a concept |
| `QUESTION` | An unresolved question or known gap |
| `SUMMARY` | A section or source summary |
| `EXAMPLE` | A worked example |
`IMPORTANT` and `DANGER` appear in [[HUMAN_WRITING]] for its do and do-not pair. `INFO`, `CAUTION`, and `DECISION` appear in older notes and are not in the documented set: add no new ones, and when touching a note map `INFO` to `NOTE` and `CAUTION` to `WARNING`. Callouts are not stacked, and one blank line follows a callout before prose.
## Examples
### Highlight
- **Right:** `UNIX exposes hardware and kernel services to every program through one disciplined boundary, the ==system call interface==`
- **Wrong:** None seen.
### Bold
- **Right:** `- **kernel**: Software that provides the core operating system environment and resource control (p. 1).`
- **Wrong:** None seen.
### Italic label
- **Right:** `*Mechanism:* The kernel is the only software allowed to touch hardware directly.`
- **Wrong:** None seen.
### Callout
- **Right:** `> [!NOTE]`
- **Wrong:** `> [!INFO] The textbook assumes no antiparallel edges`
## Done Conditions
- Every `##` section outside `## Flashcards` holds exactly one `==...==`.
- Every callout type is in the table above, no two callouts touch, and each is followed by one blank line and prose, or ends its section.
- No bold on a whole sentence, and no bold used only to emphasize.
- Each embedded drawing has a text paragraph next to it that names the relationship it shows.
- No hand-built table lists rows that a Dataview block could generate.
- Points 8 to 12 of the Quality Gate in [[Jarvis Writing and Formatting]] pass.
## Gold Standard Example
[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]]: six of its seven sections hold exactly one highlight (measured 2026-11-07; Connections holds none), its `NOTE` callouts carry real caveats, and its cards use cloze highlights. It does not pass lint: `input_kind: book` and `#` in its tags are old shapes. The `INFO` callout in `CSCI 4041/Textbook/Chapter - 24` is the thing to fix on its next touch.
