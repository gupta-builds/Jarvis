---
type: system
status: sprout
created: 2026-09-15
updated: 2026-10-16
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
This is the standard for the markers inside a note body: highlight, bold, italic labels, callouts, tables, embeds, math, and code. It gives counts and triggers that a reviewer can check. Syntax and blank-line rules stay in [[Jarvis Writing and Formatting]]; card syntax and plugin choice are in [[Plugins Usage Standard]].
## Markers
- **Highlight.** Exactly one `==highlight==` per `##` section, on the one most important definitional claim. In a note tagged `#cards` it becomes a cloze card, so a second highlight makes an accidental flashcard. Under `## Flashcards` each card carries its own cloze, which is the one exception.
- **Bold.** A named concept, entity, or category label, on its first introduction. In a `#cards` section every bold term is a cloze. Never a whole sentence and never general emphasis.
- **Italic label.** `*Mechanism:*`, `*Failure mode:*`, `*Interview value:*` introduce a sub-group. It is not a cloze.
- **Numbered items with a bold title.** `1. **Title**` with the sub-content indented by a tab, not spaces.
## Callouts
| Type | Use when |
|---|---|
| `NOTE` | Source context or background the reader needs |
| `TIP` | A practical shortcut |
| `WARNING` | A correctness or safety risk, or the main failure mode of a concept |
| `QUESTION` | An unresolved question or known gap |
| `SUMMARY` | A section or source summary |
| `EXAMPLE` | A worked example |
`IMPORTANT` and `DANGER` appear in [[HUMAN_WRITING]] for its do and do-not pair. `INFO`, `CAUTION`, and `DECISION` appear in older notes and are not in the documented set: add no new ones, and when touching a note map `INFO` to `NOTE` and `CAUTION` to `WARNING`. Do not stack callouts. One blank line follows a callout before prose, and that is the only blank line allowed.
## Tables, embeds, math, code
- A table compares rows. A list that Dataview can derive from frontmatter is a query, not a hand-built table.
- An Excalidraw or Canvas embed sits beside a paragraph that states the mechanism in words. An image-only diagram is invisible to search.
- Notation goes in `$...$` with a sentence saying what it means. Use `$$...$$` only for an equation worth reading on its own line.
- Code blocks carry a language identifier and stay short.
- Raw source material does not belong in a durable note. Long captures go to `60_Claude/05_Clippings/` or a source summary.
## Done Conditions
- Every `##` section outside `## Flashcards` holds exactly one `==...==`.
- Every callout type is in the table above, no two callouts touch, and each is followed by one blank line and prose, or ends its section.
- No bold on a whole sentence, and no bold used only to emphasize.
- Each embedded drawing has a text paragraph next to it that names the relationship it shows.
- No hand-built table lists rows that a Dataview block could generate.
- Points 8 to 12 of the Quality Gate in [[Jarvis Writing and Formatting]] pass.
## Gold Standard Example
[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]]: six of its seven sections hold exactly one highlight, its `NOTE` callouts carry real caveats (the thread-local `errno`), and its cards use cloze highlights. Its Key Concepts list highlights every term, which breaks the one-per-section rule and is the thing to fix on the next touch.
