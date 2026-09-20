---
type: evergreen
status: sprout
created: 2026-05-31
updated: 2026-09-19
tags:
  - evergreen
  - system
  - obsidian
  - quickadd
  - capture
notes:
  - "[[AI_CONTEXT]]"
  - "[[HUMAN_WRITING]]"
  - "[[40_Resources/Obsidian/Vault Operating System]]"
  - "[[60_Claude/07_AI_Information/Plugins]]"
  - "[[00 Plugin Reference Index]]"
  - "[[Templates Capture and Periodic Notes]]"
---
# QuickAdd Capture Menu
==QuickAdd is the one-keystroke bridge between "I have a thought" and "it landed in the right folder with the right frontmatter" — without it, every new note is a manual decision an agent or a tired human gets wrong.== Today that bridge is not built: `choices` is empty, so `Alt+Q` runs a menu with nothing in it.
## Mechanism
QuickAdd binds a **choice** (a capture rule) to a command. Each choice names a destination folder, a template, and a format string, so pressing the hotkey skips the "where does this go / what frontmatter" decision that the [[AGENTS|Write Contract]] otherwise forces a human to make by hand. The plugin solves one problem in Jarvis: **routing-by-default**. The routing table in [[AGENTS]] is correct but inert until something acts on it at capture time. QuickAdd is that something.
## Exact Current Settings
Read from `.obsidian/plugins/quickadd/data.json` (version `2.12.3`):
- `choices`: `[]` — **zero choices configured.** The menu is empty.
- Hotkey: `Alt+Q` runs QuickAdd (from the hotkeys map).
- `disableOnlineFeatures`: `true` — AI/network actions are off.
- `useSelectionAsCaptureValue`: `true` — selected text becomes `{{VALUE}}` in a capture.
- `enableRibbonIcon`: `false` — no ribbon button; hotkey/palette only.
- `templateFolderPath`: `""` — no template folder bound to QuickAdd yet.
- `ai.providers`: OpenAI and Gemini provider blocks exist with `apiKey: ""`; the `migrateProviderApiKeysToSecretStorage` migration is `true`, so **real keys live in Obsidian secret storage, not in this file.** Do not attempt to read or surface them.
> [!NOTE]
> `quickadd/data.json` is gitignored and may contain provider config. Document that AI providers exist; never copy key material.

## Four Choice Types
QuickAdd has four building blocks (from the official docs):
1. **Template choice** — create a new note from a reusable template file. Use for PDF summary, concept note, project note.
2. **Capture choice** — append text to an existing file. Use for inbox thoughts, daily-log lines, flashcard candidates.
3. **Macro choice** — run commands/scripts/other choices in sequence. Defer until non-AI capture works.
4. **Multi choice** — a nested menu grouping the above. Use to fold all six captures behind one `Alt+Q`.
Format syntax available in any choice: `{{DATE}}`, `{{VALUE}}` (selection), `{{FIELD:status}}` (prompt for a field). The suggester gives fuzzy search over files, tags, headings, fields.
## Integration Map
- **QuickAdd → Templater:** a Template choice points at a file in `30_Order/Templates/`. QuickAdd creates the note; Templater's `QuickAdd Capture Menu` and folder-template logic fill it. They must agree on the destination folder, or QuickAdd's folder wins and Templater's folder template may not fire. See [[Templates Capture and Periodic Notes]].
- **QuickAdd → routing table:** each choice encodes one row of the [[AGENTS]] "Where does this note go?" table. The Inbox choice is the physical implementation of "when unsure, write to `60_Claude/00_Inbox/`."
- **QuickAdd → Dataview:** a capture lands a note with clean frontmatter, which is exactly what dashboard queries in [[Dataview and Dashboards]] read. A capture that omits `type:`/`status:` produces a note that no dashboard surfaces.
- **QuickAdd → Spaced Repetition:** the "flashcard candidate" capture should append a `#review`-tagged prompt, not a finished `#cards` card — cards come after distillation, per [[Spaced Repetition and Learning Loops]].
## Agent Rules
- **Do not configure choices during documentation or note-writing work.** Adding choices changes `data.json`, a settings file. That requires explicit user approval (Vault Rules Part 13).
- When the user approves, propose the six choices below, build them **without AI actions first**, and test each into a disposable note before wiring the Multi menu.
- When writing notes outside Obsidian, you cannot trigger QuickAdd — manually apply the same destination + frontmatter the choice would have produced.
## Proposed Capture Menu (recommendation, not yet built)
| Choice | Type | Destination | Produces |
|---|---|---|---|
| Inbox thought | Capture | `60_Claude/00_Inbox/` | One dated line or stub; minimal frontmatter; review later. |
| Source clipping | Template | `60_Claude/05_Clippings/` | Raw container; content pasted, not rewritten. |
| Source summary | Template | `60_Claude/10_Source_Summaries/` | `Clipping Distill Template` with `input_kind`, `track`, `source_note`. |
| Concept note | Template | `60_Claude/20_Distilled_Notes/` | `Concept Template` with `track`, mechanism scaffold. |
| Project note | Template | `20_Progress/` | `For Progress` with `next:` prompt. |
| Flashcard candidate | Capture | current note | Appends a `#review` prompt, not a finished card. |
## How to Configure a Choice
Documented for when the user approves building this menu — not executed here, per Agent Rules below. Steps and field names verified against the [QuickAdd docs](https://quickadd.obsidian.guide/docs/Choices/CaptureChoice) ([Template choice](https://quickadd.obsidian.guide/docs/Choices/TemplateChoice)), 2026-09-19.
**General steps, both types:**
1. Settings → QuickAdd.
2. Type the choice name, pick **Capture** or **Template** from the dropdown, click **Add Choice**.
3. Click the gear icon next to the new choice to open its builder.
**Capture choice fields** (`Capture To`, `Capture format`, `Create file if it doesn't exist`, `Write position`) — these two of the six proposed choices need no template file, so they can be built today:
| Choice | Capture To | Capture format | Create if missing |
|---|---|---|---|
| Inbox thought | `60_Claude/00_Inbox/{{DATE:YYYY-MM-DD}} Inbox.md` | `- {{DATE:HH:mm}} {{VALUE}}` | On |
| Flashcard candidate | current file (leave `Capture To` on "Active file") | `> [!question]- {{VALUE}} #review` | Off (must already exist) |
**Template choice fields** (`Template Path`, `File Name Format`, `New Note Location`) — the other four proposed choices (source clipping, source summary, concept note, project note) are **blocked**: `30_Order/Templates/` currently holds only `MOC.md` ([[MOC Standard]]'s template). Binding a Template choice needs a real template file to point `Template Path` at, so building these four has to wait until the corresponding templates exist — this is the same block the "Verified Open State" section below already names.
## Failure Modes
- **Empty menu (current state):** `Alt+Q` does nothing useful, so capture stays manual and notes get misfiled. This is the failure the plugin exists to prevent.
- **Choice folder disagrees with Templater folder template:** the note is created in QuickAdd's folder but the wrong template fills it, producing mismatched frontmatter.
- **AI capture before plain capture:** wiring `ai.*` macros first mixes raw source and model output in one note, breaking the raw-vs-distilled separation the vault depends on.
- **Capture that skips frontmatter:** a note with no `type:`/`status:` is invisible to every Dataview dashboard.
## Gold-Standard Example
None exists yet — `choices` is empty, so there is no real QuickAdd workflow in this vault to point at. The closest correct artifacts are the destinations a choice should produce: a filed source summary like the MGMT 3001 week notes ([[40_Resources/UMN/Previous Classes/Minor/MGMT 3001/Week - 9|Week - 9]]) and the routing table in [[AGENTS]]. Treat building the first Inbox capture as the action that creates this example.
## Verified Open State
- Should QuickAdd be configured with the six choices above? (User decision; requires editing `data.json`.) — *unresolved, needs user approval*
- Which template file should each Template choice bind to once the `30_Order/Templates/` files are rewritten? — *answerable after templates are finalized*
- Should `templateFolderPath` be set to `30_Order/Templates` so the suggester finds templates? — *needs user decision*
## Suggestions
- **Shipping just the 2 unblocked choices now: yes, clearly worth it.** Inbox thought and Flashcard candidate need no template file and are buildable today per the field tables above. For Anant, this converts "I have a thought mid-study-session" from a manual folder-and-frontmatter decision into one keystroke — the exact friction QuickAdd exists to remove, per this note's own One-Line Answer. Waiting for all six to be ready before building any of them means the highest-value, lowest-cost habit (frictionless capture) sits unused for no real reason.
- **`enableRibbonIcon: false`: leave it off, not worth changing.** A ribbon icon adds a permanent visible button for something `Alt+Q` already reaches in one keystroke — for a hotkey-driven workflow like the rest of this vault (QuickAdd, Omnisearch, backlinks are all already hotkey-bound per [[Core Plugins Hotkeys and Defaults]]), a ribbon icon is redundant screen space, not missing discoverability. Only reconsider if `Alt+Q` itself stops being memorable in practice, which isn't the case now.
- **Setting `templateFolderPath` to `30_Order/Templates`: worth it, but only once the Template-type choices are actually being built.** Doing it now, with zero Template choices configured, changes nothing observable — it's a precondition for the file picker being useful, not a standalone improvement. Bundle it into the same approval as building the four Template-type choices rather than a separate round-trip now.
## Sources
- [QuickAdd docs](https://quickadd.obsidian.guide/docs/)
- [QuickAdd Capture choice](https://quickadd.obsidian.guide/docs/Choices/CaptureChoice)
- [QuickAdd Template choice](https://quickadd.obsidian.guide/docs/Choices/TemplateChoice)
- [QuickAdd format syntax](https://quickadd.obsidian.guide/docs/FormatSyntax)
- [[Templates Capture and Periodic Notes]]
- [[AGENTS]]
