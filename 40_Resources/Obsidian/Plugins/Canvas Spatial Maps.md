---
type: evergreen
status: sprout
created: 2026-05-31
updated: 2026-05-31
tags:
  - evergreen
  - system
  - obsidian
  - canvas
  - visual-thinking
notes:
  - "[[AI_CONTEXT]]"
  - "[[HUMAN_WRITING]]"
  - "[[40_Resources/Obsidian/Vault Operating System]]"
  - "[[60_Claude/07_AI_Information/Plugins]]"
  - "[[00 Plugin Reference Index]]"
  - "[[Visual Thinking with Canvas and Excalidraw]]"
---
# Canvas Spatial Maps
==Canvas is for laying out existing notes in 2D so you can see how they connect — it is a map of the vault, not a drawing tool.== It is a core plugin, enabled, and has **zero usage in Jarvis**: no `.canvas` file exists anywhere in the vault.
## Mechanism
Canvas gives an infinite 2D surface where each card can be a real note, a media file, a text card, or a web page, connected by labelled directed lines. It saves as a `.canvas` file in the open [JSON Canvas](https://jsoncanvas.org/) format. The problem it solves: backlinks and the graph show *that* notes connect, but not *how they sit relative to each other*. Canvas answers "what is the shape of this topic / project / source cluster?" — a question prose and the graph view both answer badly. Because cards can be live note references, **a Canvas is a reusable view over the vault, not a snapshot.**
## Exact Current Settings
Canvas is a **core plugin** — it has no `data.json` and no configurable settings beyond being enabled in `.obsidian/core-plugins.json`. There is nothing plugin-specific to document except behavior. Confirmed enabled in [[Plugin Inventory and Configuration Map]].
## Card Types and Behavior
From the official Canvas docs:
- **Note card:** references a real vault note; edits sync both ways. This is the card type that makes Canvas a *view*, not a copy.
- **Media card:** image, audio, PDF, or other file from the vault.
- **Text card:** Markdown that lives only on the canvas — **does not appear in backlinks** until converted to a file.
- **Web card:** an embedded URL.
- **Connections:** directed lines, optionally labelled and colored, that describe the relationship between two cards.
- **Groups:** named regions that cluster related cards.
- Embed a canvas in a note with `![[Name.canvas]]`.
## Integration Map
- **Canvas → notes (backlinks):** note cards create real link context; **text-only cards do not.** If a card represents something you'll want to find later, make it a note card or convert it to a file. This is the single most important Canvas rule for a link-dependent vault like Jarvis.
- **Canvas vs Excalidraw:** Canvas when the objects are *notes* (course maps, project maps, source-to-concept layouts); Excalidraw when the objects are *shapes and arrows* (architecture, state machines, annotated figures). See [[Excalidraw Diagrams and Annotation]] and [[Visual Thinking with Canvas and Excalidraw]].
- **Canvas → boards/dashboards:** a Canvas is a spatial complement to a Dataview board, not a replacement. Dataview answers "which notes match this query"; Canvas answers "how do these specific notes relate." Do not rebuild a queryable list as a static Canvas.
## Agent Rules
- Agents generally should **not** author `.canvas` JSON by hand. Canvas is a human spatial-thinking surface; create one only when the user explicitly asks.
- If asked to scaffold a Canvas, prefer note cards over text cards so the layout stays linked to real notes.
- Never store the only copy of an idea in a text-only card — it will not surface in backlinks or search.
- Keep a short Markdown note that links the Canvas (`[[Topic Map.canvas]]`) so the spatial view has a searchable text entry point.
## Where A Canvas Earns Its Place
- A course's concept web: lay out the `Concept - X` notes for one class and draw prerequisite arrows.
- A project's architecture-of-notes: brief, decisions, source summaries, and `next:` in one frame.
- A source cluster: one PDF's summary in the center, the concepts it feeds radiating out.
If the same information is better as a Dataview list or a short table, skip the Canvas.
## Failure Modes
- **Text-only cards as the source of truth:** they vanish from backlinks and Omnisearch; the thinking is trapped on one canvas.
- **Static duplication of a query:** a hand-arranged Canvas of "active projects" goes stale the moment a project changes; a Dataview board would not.
- **Canvas instead of a note:** a spatial map with no accompanying text note has no searchable entry point.
## Gold-Standard Example
None exists — there is no `.canvas` file in the vault, which confirms the audit's "Canvas: zero usage." There is honestly nothing real to point at. The first candidate is a single-course concept map (e.g. the MGMT 3001 concept notes laid out with prerequisite arrows) linked from [[40_Resources/UMN/Previous Classes/Minor/MGMT 3001/MGMT 3001 Board|the MGMT 3001 Board]]. Do not invent a `.canvas` reference that does not exist.
## Verified Open State
- Is Canvas deliberately unused, or just never started? — *unverified; no `.canvas` files exist, but the plugin is enabled*
- Would one course concept-map Canvas be worth building as the seed example, or does the graph view already cover this need? — *open question for the user*
## Suggestions
- **Building the MGMT 3001 concept-map Canvas: yes, worth it, and it's the same recommendation [[Visual Thinking with Canvas and Excalidraw]] makes independently** — doing it once closes the "zero usage" gap in both notes instead of leaving each to flag it separately. For Anant specifically, the payoff isn't the Canvas itself, it's seeing prerequisite structure across a course's concepts at a glance before an exam, something the linear note list and the graph view both do badly per this note's own Mechanism section.
- **JSON Canvas's `color` field, confirmed real via the spec** (preset index 1-6 or a hex value — [JSON Canvas spec](https://jsoncanvas.org/spec/1.0/)), **and confirmed operable in Obsidian's own UI**: select a card, use "Set color" in the selection controls that appear above it, pick from the palette ([Obsidian Help — Canvas](https://obsidian.md/help/plugins/canvas)). **Worth it: yes, for the course concept-map use case specifically** — coloring by concept type (prerequisite vs application) or mastery status turns the Canvas into a status view, not just a layout, at zero cost beyond a few clicks per card. Not worth doing for a Canvas with more than a handful of cards; recoloring by hand doesn't scale and there's no bulk/rule-based coloring in the base plugin.
- **Groups vs folders: worth one line, not worth more.** A Canvas Group is purely a named visual boundary on that one canvas — it does nothing to the vault's folder structure, confirmed by how JSON Canvas stores groups (a node type with a bounding box, no path reference). The actual risk this note is guarding against is narrow but real: an agent told to "organize" a Canvas group could otherwise infer a file-move is wanted. One clarifying sentence closes that; it doesn't need its own section.
## Sources
- [Obsidian Help - Canvas](https://help.obsidian.md/plugins/canvas)
- [JSON Canvas format](https://jsoncanvas.org/)
- [Obsidian Help - Embed files](https://help.obsidian.md/embeds)
- [[Visual Thinking with Canvas and Excalidraw]]
