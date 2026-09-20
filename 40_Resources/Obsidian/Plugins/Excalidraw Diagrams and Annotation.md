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
- `templateFilePath`: `10_Areas/Excalidraw/Template.excalidraw` — **fixed 2026-09-20** (was `10_Area/...`, missing the `s`, so the template never resolved until now). No file exists at this path yet — the setting is correct and ready, the template itself is not built.
- `autosave`: `true`; desktop interval `60000ms`, mobile `30000ms`.
- `compress`: `true` — scene data is compressed; **never hand-edit it.**
- `embedUseExcalidrawFolder`: `true`; `previewImageType`: `SVGIMG`.
- `renderImageInMarkdownReadingMode`: `false`; `renderImageInHoverPreviewForMDNotes`: `true` — embeds show on hover but not inline in reading mode by default.
- Auto-export SVG/PNG: not enabled — no flat image is written alongside the drawing.
- AI features exist in settings; keys are protected and must not be copied.
- `10_Areas/Excalidraw/Scripts/` — checked directly, 2026-09-20: **empty.** No `ExcalidrawAutomate` scripts exist yet; nothing to document here.

## How Templates Actually Work
A template is just a normal `.excalidraw.md` drawing — there is no separate template file format. You build one like any other drawing (set up the shapes, arrows, and default stroke/fill/font styles you want new drawings to start with) and save it as the template file. The official plugin docs confirm styling round-trips through templates: a template *"will restore stroke properties"* so new drawings inherit stroke color, width, opacity, font family, font size, and fill/stroke style without resetting them each time ([Excalidraw plugin docs](https://github.com/zsviczian/obsidian-excalidraw-plugin)).
Two ways to apply one:
- *Single default template:* set `templateFilePath` in plugin settings (**Settings → Excalidraw → New drawing → Template**) to one file. Every new drawing created via the normal "Create new drawing" command inherits it. This path is correctly configured now, pointing at a template file that doesn't exist yet — creating a new drawing today inherits nothing until one is saved at that exact path.
- *Choosing between multiple templates:* the plugin's own settings only support one default template, so applying a different template per drawing needs the scripted path — `ExcalidrawAutomate`'s `ea.create()` call, which takes a `templatePath` argument per call, e.g. `templatePath:"Excalidraw/Template2.excalidraw"` ([apply_template.md example](https://github.com/zsviczian/obsidian-excalidraw-plugin/blob/master/docs/Examples/apply_template.md)). A Templater script wired to a QuickAdd choice (or two separate QuickAdd choices) is the practical way to offer "system architecture map" and "course concept/PDF annotation map" as two distinct starting points, since the plugin has no built-in template picker in its UI.
**Concrete path for the two proposed templates, when the first real drawing exists to justify them** (deliberately not built yet — see Verified Open State):
1. Build both drawings normally, save as `10_Areas/Excalidraw/Templates/System Architecture.excalidraw.md` and `10_Areas/Excalidraw/Templates/Concept-PDF Annotation.excalidraw.md`.
2. Point the default (`templateFilePath`) at whichever one gets used more, and reach the other through a QuickAdd choice running an `ea.create({templatePath: ...})` script — this is the only way the plugin supports picking between two templates per new drawing.
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
- **Hand-edited scene data:** corrupts the compressed drawing irrecoverably.
- **Drawing used to look finished:** a weak note with a diagram on top is still a weak note.
- **Assuming `templateFilePath` being correct means a template is applied:** the path is fixed and correct as of 2026-09-20, but no file exists there yet. A new drawing today still inherits nothing until a template is actually saved to that path.
## Gold-Standard Example
None exists yet — the vault contains no hand-authored `.excalidraw.md` drawing (`10_Areas/Excalidraw/` holds only `excalibrain.md`, a plugin artifact, not a diagram). The first real example should be a PDF-derived diagram embedded from a source summary in `60_Claude/10_Source_Summaries/`. Until one exists, this section is honestly empty; do not invent a fake reference.
## Verified Open State
- Should the two proposed templates (system architecture map, course concept/PDF annotation map) be built now? — **No, deliberately deferred.** The mechanism is fully documented above and ready to use; the actual blocker is that zero real drawings exist in this vault to justify a template yet. Build the first real drawing (per [[Visual Thinking with Canvas and Excalidraw]]) before investing in templates for a habit that doesn't exist — templating an unused workflow optimizes the wrong thing first.
- Should auto-export SVG/PNG be enabled so diagrams survive outside Obsidian (e.g. in Git diffs or Publish)? — *needs user decision, not urgent with zero drawings in the vault yet*
## Sources
- [Excalidraw plugin README](https://github.com/zsviczian/obsidian-excalidraw-plugin)
- [Excalidraw plugin docs](https://excalidraw-obsidian.online/)
- [apply_template.md — ExcalidrawAutomate template example](https://github.com/zsviczian/obsidian-excalidraw-plugin/blob/master/docs/Examples/apply_template.md)
- [[Visual Thinking with Canvas and Excalidraw]]
- [[40_Resources/Obsidian/Vault Operating System]]
