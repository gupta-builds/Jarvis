---
type: evergreen
status: sprout
created: 2026-05-31
updated: 2026-09-18
tags:
  - evergreen
  - system
  - obsidian
  - excalidraw
  - visual-thinking
notes:
  - "[[AI_CONTEXT]]"
  - "[[HUMAN_WRITING]]"
  - "[[40_Resources/Obsidian/Vault Operating System]]"
  - "[[60_Claude/07_AI_Information/Plugins]]"
  - "[[00 Plugin Reference Index]]"
  - "[[Visual Thinking with Canvas and Excalidraw]]"
---
# Excalidraw Diagrams and Annotation
==Excalidraw is for the cases where the relationship between things is the content — arrows, flows, state transitions, annotated figures — not where a list or table would say it faster.== In Jarvis it is installed and configured but barely used: no hand-made `.excalidraw.md` drawing exists in the vault yet.
## Mechanism
Excalidraw stores a drawing as a Markdown file with compressed scene data plus a readable text layer. You embed it with a wikilink (`![[Name.excalidraw]]`), and it renders as an image in reading view and hover previews. The problem it solves in Jarvis: a PDF or system note often contains a diagram that prose flattens into a worse description. Excalidraw lets you **recreate the spatial structure once and link it back to the note that explains it**, keeping searchable text next to the picture.
## Exact Current Settings
Read from `.obsidian/plugins/obsidian-excalidraw-plugin/data.json`:
- `folder`: `10_Areas/Excalidraw` — drawings live here.
- `cropFolder`: `10_Areas/Excalidraw/Cropping`; `annotateFolder`: `10_Areas/Excalidraw/Annotation`.
- `scriptFolderPath`: `10_Areas/Excalidraw/Scripts`.
- `templateFilePath`: `10_Area/Excalidraw/Template.excalidraw` — **broken path: `10_Area` is missing the `s`.** The template will not resolve until this is corrected to `10_Areas/Excalidraw/Template.excalidraw`.
- `autosave`: `true`; desktop interval `60000ms`, mobile `30000ms`.
- `compress`: `true` — scene data is compressed; **never hand-edit it.**
- `embedUseExcalidrawFolder`: `true`; `previewImageType`: `SVGIMG`.
- `renderImageInMarkdownReadingMode`: `false`; `renderImageInHoverPreviewForMDNotes`: `true` — embeds show on hover but not inline in reading mode by default.
- Auto-export SVG/PNG: not enabled — no flat image is written alongside the drawing.
- AI features exist in settings; keys are protected and must not be copied.
> [!WARNING]
> The `templateFilePath` typo (`10_Area` vs `10_Areas`) means a new drawing does not inherit the intended template. Flag this to the user before relying on Excalidraw templates.

## How Templates Actually Work
**Researched 2026-09-18.** A template is just a normal `.excalidraw.md` drawing — there is no separate template file format. You build one like any other drawing (set up the shapes, arrows, and default stroke/fill/font styles you want new drawings to start with) and save it as the template file. The official plugin docs confirm styling round-trips through templates: a template *"will restore stroke properties"* so new drawings inherit stroke color, width, opacity, font family, font size, and fill/stroke style without resetting them each time ([Excalidraw plugin docs](https://github.com/zsviczian/obsidian-excalidraw-plugin)).
Two ways to apply one:
- *Single default template:* set `templateFilePath` in plugin settings (**Settings → Excalidraw → New drawing → Template**) to one file. Every new drawing created via the normal "Create new drawing" command inherits it. This is the setting with the current typo (`10_Area` instead of `10_Areas`) — fix it before relying on this path.
- *Choosing between multiple templates:* the plugin's own settings only support one default template, so applying a different template per drawing needs the scripted path — `ExcalidrawAutomate`'s `ea.create()` call, which takes a `templatePath` argument per call, e.g. `templatePath:"Excalidraw/Template2.excalidraw"` ([apply_template.md example](https://github.com/zsviczian/obsidian-excalidraw-plugin/blob/master/docs/Examples/apply_template.md)). A Templater script wired to a QuickAdd choice (or two separate QuickAdd choices) is the practical way to offer "system architecture map" and "course concept/PDF annotation map" as two distinct starting points, since the plugin has no built-in template picker in its UI.
**Concrete path for the two proposed templates**, once approved:
1. Fix `templateFilePath` to `10_Areas/Excalidraw/Template.excalidraw` — the single-default slot, best used for whichever template is reached for more often.
2. Build both drawings normally, save as `10_Areas/Excalidraw/Templates/System Architecture.excalidraw.md` and `10_Areas/Excalidraw/Templates/Concept-PDF Annotation.excalidraw.md`.
3. Point the default (`templateFilePath`) at whichever one gets used more, and reach the other through a QuickAdd choice running an `ea.create({templatePath: ...})` script — this is the only way the plugin supports picking between two templates per new drawing.
## Integration Map
- **Excalidraw → host note:** a drawing is never the whole note. It is embedded in a concept, project, or source-summary note that states the mechanism in text. The drawing makes relationships visible; the text makes them searchable. See [[Visual Thinking with Canvas and Excalidraw]] for Canvas-vs-Excalidraw choice.
- **Excalidraw → PDF ingestion:** when a clipping in `60_Claude/05_Clippings/PDFs/` contains a framework or flowchart, the ingestion workflow should produce `[Source Name] - Diagrams.excalidraw` in `10_Areas/Excalidraw/` and embed it from the source summary. This is the integration the audit flagged as missing.
- **Excalidraw → Omnisearch:** Excalidraw files are excluded from `#cards` review (SR ignores `**/*.excalidraw.md`) and are not full-text useful — so the **text anchor in the host note is the only retrieval path.** A drawing with no host-note text is effectively invisible to search.
## Agent Rules
- Embed with a wikilink, never an image path: `![[RAG Failure Map.excalidraw]]`.
- Always write the host note's text first; add the drawing only for relationships that are clearer spatially.
- Do not hand-edit compressed `.excalidraw.md` scene data.
- Do not create a drawing in `60_Claude/05_Clippings/` — raw capture stays raw.
- Do not fabricate `.excalidraw` files unless the user asks for visual creation; you may write a Markdown scaffold with a labelled embed placeholder for the user to fill.
- Keep diagrams in `10_Areas/Excalidraw/` and link from the note they support.
## When To Use vs Not
- *Use:* system architecture, algorithm state transitions, feedback loops, dependency graphs, annotated PDF figures.
- *Do not use:* anything a 5-row table or short list states more precisely. A drawing that only restates a list adds maintenance cost and no retrieval value.
## Failure Modes
- **Image without text anchor:** the relationship is visible but unsearchable; a future agent cannot find or cite it.
- **Broken template path (current):** drawings created now do not inherit `Template.excalidraw` because the configured path is wrong.
- **Hand-edited scene data:** corrupts the compressed drawing irrecoverably.
- **Drawing used to look finished:** a weak note with a diagram on top is still a weak note.
## Gold-Standard Example
None exists yet — the vault contains no hand-authored `.excalidraw.md` drawing (`10_Areas/Excalidraw/` holds only `excalibrain.md`, a plugin artifact, not a diagram). The first real example should be a PDF-derived diagram embedded from a source summary in `60_Claude/10_Source_Summaries/`. Until one exists, this section is honestly empty; do not invent a fake reference.
## Verified Open State
- Should `templateFilePath` be fixed from `10_Area/...` to `10_Areas/...`? (Edits `data.json`; needs user approval.) — *clear bug, awaiting permission to fix*
- Should the two proposed templates (system architecture map, course concept/PDF annotation map) be built? — *how-to guidance now documented above; templates themselves not yet created, awaiting approval*
- Does `10_Areas/Excalidraw/Scripts` contain scripts that should be documented? — *unverified; folder referenced in settings, contents not yet read*
- Should auto-export SVG/PNG be enabled so diagrams survive outside Obsidian (e.g. in Git diffs or Publish)? — *needs user decision*
- Is `excalibrain` intentionally referenced by hotkeys/Lazy Loader with no plugin folder, or is it a leftover? — *unresolved across plugin docs*
## Suggestions
- **The last `Verified Open State` bullet is stale, corrected here rather than left standing:** [[Plugin Inventory and Configuration Map]] resolved this 2026-09-19 — Excalibrain is fully installed, configured `long`, no gap. Treat the inventory note as current on this point.
- **Fixing the `templateFilePath` typo: worth it, trivially so — a one-character edit that currently makes templating not work at all.** Bundling it with the two-template build into one approval request is the efficient path, but even fixing the typo alone with no templates built yet still restores the single-default-template mechanism to working order for whatever gets saved there next. **Worth it: yes, low effort, unblocks a feature that's currently silently broken.**
- **Building the two proposed templates: worth it for Anant specifically, conditional on him actually starting the visual habit this note keeps flagging as unused.** The mechanism is fully documented above (single default via `templateFilePath`, a second reachable through a QuickAdd-triggered `ea.create({templatePath:...})` script) — the real blocker isn't know-how, it's that Excalidraw has zero real drawings in the vault to justify a template yet. Build the first real drawing (per [[Visual Thinking with Canvas and Excalidraw]]'s suggestion) before investing in templates for a habit that doesn't exist yet; templating a workflow with no usage optimizes the wrong thing first.
- **Checking `10_Areas/Excalidraw/Scripts`: worth five minutes, not more.** If it's empty, this note needs no change. If it holds real `ExcalidrawAutomate` scripts already, this note is currently missing a whole section on working automation — worth knowing which case is true before assuming either.
## Sources
- [Excalidraw plugin README](https://github.com/zsviczian/obsidian-excalidraw-plugin)
- [Excalidraw plugin docs](https://excalidraw-obsidian.online/)
- [apply_template.md — ExcalidrawAutomate template example](https://github.com/zsviczian/obsidian-excalidraw-plugin/blob/master/docs/Examples/apply_template.md)
- [[Visual Thinking with Canvas and Excalidraw]]
- [[40_Resources/Obsidian/Vault Operating System]]
