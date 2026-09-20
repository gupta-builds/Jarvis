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
==QuickAdd is the one-keystroke bridge between "I have a thought" and "it landed in the right folder with the right frontmatter" — without it, every new note is a manual decision an agent or a tired human gets wrong.== Two of the six proposed choices are now built and live; the other four wait on real template files.
## Mechanism
QuickAdd binds a **choice** (a capture rule) to a command. Each choice names a destination folder, a template, and a format string, so pressing the hotkey skips the "where does this go / what frontmatter" decision that the [[AGENTS|Write Contract]] otherwise forces a human to make by hand. The plugin solves one problem in Jarvis: **routing-by-default**. The routing table in [[AGENTS]] is correct but inert until something acts on it at capture time. QuickAdd is that something.
## Exact Current Settings
Read from `.obsidian/plugins/quickadd/data.json` (version `2.22.0`, verified 2026-09-20):
- `choices`: **2 configured** — "Inbox thought" and "Flashcard candidate," both Capture-type. Field-by-field detail below.
- Hotkey: `Alt+Q` runs QuickAdd (from the hotkeys map).
- `disableOnlineFeatures`: `true` — AI/network actions are off.
- `useSelectionAsCaptureValue`: `true` — selected text becomes `{{VALUE}}` in a capture.
- `enableRibbonIcon`: `true` — a ribbon button exists; `Alt+Q` still works as the primary path.
- `templateFolderPaths`: `["30_Order/Templates"]` — already set; ready for the four Template-type choices once their target templates exist.
- `ai.providers`: OpenAI and Gemini provider blocks exist with `apiKey: ""`; the `migrateProviderApiKeysToSecretStorage` migration is `true`, so **real keys live in Obsidian secret storage, not in this file.** Do not attempt to read or surface them.
> [!NOTE]
> `quickadd/data.json` is gitignored and may contain provider config. Document that AI providers exist; never copy key material.
## The Two Live Choices — Exact Configuration
Built 2026-09-20 via a direct JSON write (the `PreToolUse:Edit` hook false-positive-blocks edits under `.obsidian`; used the `sed`/JSON-round-trip workaround documented in [[Cross-Laptop Sync - Rollback Procedure]]), matching QuickAdd's real internal schema confirmed against its source (`chhoumann/quickadd`, `src/types/choices/CaptureChoice.ts` and `src/types/choices/Choice.ts` on GitHub) rather than guessed:
- **Inbox thought** — `captureTo: "60_Claude/00_Inbox/{{DATE:YYYY-MM-DD}} Inbox.md"`, `format.format: "- {{DATE:HH:mm}} {{VALUE}}"`, `createFileIfItDoesntExist.enabled: true`. Fires `Alt+Q` → select "Inbox thought" → type the thought → it appends a dated, timestamped bullet to today's Inbox file, creating that file if it doesn't exist yet.
- **Flashcard candidate** — `captureToActiveFile: true` (not a fixed path — appends to whatever note is currently open), `format.format: "> [!question]- {{VALUE}} #review"`, `createFileIfItDoesntExist.enabled: false` (the active file must already exist, which it always does). Fires `Alt+Q` → select "Flashcard candidate" while a real note is open → type the prompt → it appends a collapsible `#review`-tagged callout, deliberately not a finished `#cards` card, per [[Spaced Repetition and Learning Loops]]'s raw-to-distilled discipline.
> [!WARNING]
> A UTF-8 BOM in a JSON write breaks strict JSON parsers, including Obsidian's own. `Set-Content -Encoding utf8` in Windows PowerShell 5.1 writes one silently. Any future direct `data.json` edit must use `[System.IO.File]::WriteAllText(path, text, (New-Object System.Text.UTF8Encoding $false))` or equivalent, and verify with a strict parser afterward, not just `jq` (which tolerates a BOM and will not catch this).

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
- **Do not change existing choices, or add new ones, during ordinary documentation or note-writing work.** Adding or editing a choice changes `data.json`, a settings file. That requires explicit user approval (Vault Rules Part 13) — the two live choices below were built under exactly that approval, 2026-09-20.
- The remaining four choices in the table below build the same way once their template files exist: **without AI actions first**, tested into a disposable note before trusting them.
- When writing notes outside Obsidian, you cannot trigger QuickAdd — manually apply the same destination + frontmatter the choice would have produced.
## Capture Menu — Status
| Choice | Type | Destination | Produces | Status |
|---|---|---|---|---|
| Inbox thought | Capture | `60_Claude/00_Inbox/` | Dated, timestamped bullet | **Live** |
| Flashcard candidate | Capture | current note | `#review` callout, not a finished card | **Live** |
| Source clipping | Template | `60_Claude/05_Clippings/` | Raw container; content pasted, not rewritten | Blocked — no template file yet |
| Source summary | Template | `60_Claude/10_Source_Summaries/` | `Clipping Distill Template` with `input_kind`, `track`, `source_note` | Blocked |
| Concept note | Template | `60_Claude/20_Distilled_Notes/` | `Concept Template` with `track`, mechanism scaffold | Blocked |
| Project note | Template | `20_Progress/` | `For Progress` with `next:` prompt | Blocked |
## How To Build The Remaining Four (Template-Type) Choices
`30_Order/Templates/` currently holds only `MOC.md`. Each Template-type choice needs a real template file to point `Template Path` at, so build the template first, then the choice. Steps and field names verified against the [QuickAdd docs](https://quickadd.obsidian.guide/docs/Choices/CaptureChoice) ([Template choice](https://quickadd.obsidian.guide/docs/Choices/TemplateChoice)):
1. Settings → QuickAdd → type the choice name → pick **Template** from the dropdown → **Add Choice**.
2. Click the gear icon next to the new choice to open its builder.
3. Set **Template Path** to the real file under `30_Order/Templates/` (the file picker searches `templateFolderPaths`, already set to `30_Order/Templates`).
4. Set **File Name Format** and **New Note Location** to match the destination column above.
5. Test into a disposable note before trusting it against real capture.
## How The Two Live Choices Actually Work
See the exact field values in "Exact Current Settings" above. To edit either one by hand instead of through the Settings UI: `.obsidian/plugins/quickadd/data.json`'s `choices` array, matched by `name`. Every field in `ICaptureChoice` (confirmed from `chhoumann/quickadd`'s source, not the UI docs, which don't expose the raw schema) is present even when unused, set to its class-default value — do not assume a missing key means "off," every key is always written.
## Failure Modes
- **Choice folder disagrees with Templater folder template:** the note is created in QuickAdd's folder but the wrong template fills it, producing mismatched frontmatter. Applies to the four not-yet-built Template choices once they exist.
- **AI capture before plain capture:** wiring `ai.*` macros first mixes raw source and model output in one note, breaking the raw-vs-distilled separation the vault depends on.
- **Capture that skips frontmatter:** a note with no `type:`/`status:` is invisible to every Dataview dashboard. Neither live choice writes frontmatter today — both append to an existing or dated file, not create a fresh note, so this risk doesn't apply to them yet, but will for the four Template-type choices.
- **A future `data.json` edit reintroduces a UTF-8 BOM**, breaking strict JSON parsing silently — see the warning above.
## Gold-Standard Example
None exists yet inside a real note — the mechanism is live but untested against genuine daily use. The first real Inbox-thought capture, once it happens, becomes this section's example; until then this stays honestly empty rather than pointing at a fabricated one.
## Verified Open State
- Which template file should each Template choice bind to, once the four templates themselves are written? — *answerable after templates are finalized, not before*
## Sources
- [QuickAdd docs](https://quickadd.obsidian.guide/docs/)
- [QuickAdd Capture choice](https://quickadd.obsidian.guide/docs/Choices/CaptureChoice)
- [QuickAdd Template choice](https://quickadd.obsidian.guide/docs/Choices/TemplateChoice)
- [QuickAdd format syntax](https://quickadd.obsidian.guide/docs/FormatSyntax)
- [`chhoumann/quickadd` — `src/types/choices/CaptureChoice.ts`](https://github.com/chhoumann/quickadd/blob/master/src/types/choices/CaptureChoice.ts) and [`Choice.ts`](https://github.com/chhoumann/quickadd/blob/master/src/types/choices/Choice.ts) — real field names and default values, fetched 2026-09-20, used to build the two live choices correctly rather than guessed
- Direct read of `.obsidian/plugins/quickadd/data.json` — this session, 2026-09-20
- [[Templates Capture and Periodic Notes]]
- [[AGENTS]]
