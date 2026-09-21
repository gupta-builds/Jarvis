---
type: evergreen
status: sprout
created: 2026-05-15
updated: 2026-09-19
tags:
  - evergreen
  - system
  - obsidian
  - writing
notes:
  - "[[AI_CONTEXT]]"
  - "[[HUMAN_WRITING]]"
  - "[[40_Resources/Obsidian/Vault Operating System]]"
  - "[[60_Claude/07_AI_Information/Plugins]]"
  - "[[00 Plugin Reference Index]]"
  - "[[Cross-Laptop Sync - Build 3 Findings]]"
---
# Appearance Code Math and Reading Experience

The visual system should make dense notes easier to read. It should not encourage decorative formatting or hide meaning in theme styling.

## Theme and Style Settings

Current appearance:

- Theme: AnuPpuccin.
- Style Settings plugin: enabled.
- Accent color: default/blank.
- Readable line length: enabled.

Agents should document current behavior but not edit theme settings, Style Settings values, or snippets unless the user explicitly asks.

## CSS Snippets

Enabled snippets:

| Snippet | Likely role | Agent rule |
|---|---|---|
| `headerspace.css` | Heading spacing. | Write normal headings; do not compensate with blank-line hacks. |
| `readingview.css` | Reading-view tweaks. | Keep notes readable in plain Markdown too. |
| `rainbowfile_colors.css` | File explorer colors. | Do not store meaning only in folder color. |
| `myedits.css` | Broad custom theme edits. | Needs verification before documenting exact visual effects. |

Do not modify snippets during documentation work.

## Code Styler

Current Code Styler facts:

- Selected theme: Solarized.
- Codeblock line numbers: enabled in the selected theme.
- Lines unwrap by default.
- Gutter highlight: enabled.
- Inline code styling: enabled.
- Excluded languages: `ad-*`, `reference`.
- Processed codeblock whitelist: `run-*`, `include`.

Use fenced code blocks for code, commands, queries, configuration examples, and exact syntax. Include a language whenever possible.

Example:

````markdown
```ts title:"status.ts" hl:2
type Status = "seed" | "sprout" | "tree";
const current: Status = "sprout";
```
````

Do not paste large source files into evergreen notes. Summarize the mechanism and link the source.

## Code Block Rules

Use:

````markdown
```dataview
TABLE status, next
FROM "20_Progress"
WHERE type = "project"
```
````

Use:

````markdown
```tasks
not done
path includes 20_Progress
sort by due
```
````

Use:

````markdown
```yaml
type: evergreen
status: sprout
```
````

Avoid:

- unlabeled code fences when a language exists
- code screenshots instead of text
- giant dumps from source files
- decorative code blocks that do not teach syntax

## Latex Suite

Latex Suite is enabled for math ergonomics.

Use inline math for short notation:

```markdown
The heapify bound is `$O(n)$`, not `$O(n \log n)$`.
```

Use display math when the structure matters:

```markdown
$$
T(n) = 2T(n/2) + O(n)
$$
```

Course-note rule: explain the equation in prose. Math notation should compress a mechanism, not replace it.

Needs verification: user-specific Latex Suite snippets and whether any custom snippets should be documented.

## Ninja Cursor

Ninja Cursor is UI-only. It affects cursor visibility and typing feel, not note syntax or vault structure.

Agents should not mention it in workflow instructions except in inventory/safety docs.

## Multi-Column Markdown
Multi-Column Markdown renders content into side-by-side columns in reading/preview mode, using a fenced block syntax rather than raw HTML:

```markdown
=== multi-column-start
Left column content.

--- column-end ---

Right column content.
=== multi-column-end
```

**Researched 2026-09-19.** Installed and lazy-loaded (`short`), not yet used anywhere in the vault. It is a reading-experience plugin, not a data plugin — it changes layout only, so it does not interact with Dataview, Tasks, or frontmatter. The natural fit here is dense comparison notes (contrast tables in [[HUMAN_WRITING]]'s "prefer contrast" pattern, or side-by-side before/after code) where a Markdown table would otherwise force short lines to wrap awkwardly. Do not reach for it as a default layout tool — most notes in this vault read better as a single column, per [[HUMAN_WRITING]]'s short-paragraph rule.

## Callouts and Reading View

Use callouts sparingly:

```markdown
> [!warning]
> DataviewJS is enabled. Prefer plain Dataview unless JavaScript is necessary.
```

Good callouts flag warnings, source status, decisions, or open questions. Bad callouts turn ordinary paragraphs into decoration.

## Markdown That Works Here

Use:

- YAML frontmatter
- specific headings
- short paragraphs
- comparison tables
- wikilinks
- normal Markdown links for external sources
- fenced code blocks with languages
- Tasks-compatible checkboxes
- concise Dataview blocks

Avoid:

- HTML layout
- color-coded prose
- hidden meaning stored only in styling
- random bolding in learning notes, because bold clozes are enabled
- image-only explanations
- generic "overview" sections that do not aid retrieval

The final test is still [[HUMAN_WRITING]]: the note should contain mechanism, contrast, examples, or decisions.

## Integration Map
- **Latex Suite → SR cloze interaction:** math written as `$...$` is safe in a `#cards` section, but wrapping a term in `**bold**` *inside* a card to "emphasize" it creates an unwanted cloze. Keep emphasis in math notation, not bold, inside card answers. See [[Spaced Repetition and Learning Loops]].
- **Code Styler → fenced blocks:** language-tagged fences (` ```dataview `, ` ```tasks `, ` ```yaml `) are what make Dataview/Tasks blocks executable and readable. An unlabeled fence loses both styling and, for query languages, execution.
- **Appearance → semantic Markdown:** `headerspace.css` handles heading spacing, which is *why* the vault's zero-blank-line rule works — blank lines added "for breathing room" are redundant with the CSS and count as errors. The styling layer enables the formatting rule.
## Gold-Standard Example
[[HeapSort|HeapSort]] is the model for math + code in one note: inline `$O(n)$` vs `$O(n \log n)$` distinctions explained in prose, with the mechanism stated rather than the formula left to stand alone. Contrast the anti-pattern — spelling out "n log n" in words when the symbol is clearer, or pasting a full source file into an evergreen note.
## Verified Open State
- Which Latex Suite snippets are active, and should any custom ones be documented as vault conventions (e.g. preferred notation for probability/expectation)? — *unverified; snippet config not yet read*
- Does `myedits.css` change anything semantically relevant, or is it purely cosmetic? — *needs verification before relying on its effects*
- Should Multi-Column Markdown be used anywhere yet? — *mechanism confirmed 2026-09-19, no current use; not a gap, just unconfigured*
## Suggestions
- **Correcting the CSS Snippets table: worth it, and it's a correction, not a suggestion — this note currently gives a weaker answer than one that already exists elsewhere in the vault.** [[40_Resources/Obsidian/Settings/Appearance Theme and CSS Snippets]] confirms `myedits.css` and `rainbowfile_colors.css` are AnuPpuccin's own files, not vault edits, while this table still labels them "Broad custom theme edits" / "File explorer colors" with agent rules implying they might be hand-edited. An agent reading only this table would get the wrong impression of what's safe to touch.
- **Reading Latex Suite's actual configured snippets: worth doing before it matters, not urgently.** No course note has hit this gap yet, but the first one that needs a specific probability/expectation or vector notation convention will silently assume a snippet exists that may not — cheap to check now, more annoying to debug mid-note later.
- **Code Styler's `ad-*`/`reference` exclusions and `run-*`/`include` whitelist, confirmed directly from the plugin's own README (not guessed):** `ad-*` excludes Admonitions-plugin callout code fences from getting Code Styler's own decoration; `run-*` and `include` are whitelist entries for the Execute Code Plugin and File Include Plugin respectively ([Code Styler README](https://github.com/mayurankv/Obsidian-Code-Styler)). **Worth noting, low priority: neither Execute Code Plugin nor File Include Plugin is installed in this vault** — confirmed against the 12-entry `community-plugins.json` and the lazy-loaded plugin list, neither appears. The `run-*`/`include` whitelist entries are currently inert settings carried over from somewhere else, not active configuration. Worth one line saying so; not worth removing them, since they cost nothing sitting unused.
## Sources

- [Obsidian Help - Appearance](https://obsidian.md/help/appearance)
- [Code Styler README](https://github.com/mayurankv/Obsidian-Code-Styler) — excluded-language and processed-codeblock whitelist mechanism, fetched 2026-09-19
- [Latex Suite README](https://github.com/artisticat1/obsidian-latex-suite)
- [Style Settings README](https://github.com/obsidian-community/obsidian-style-settings)
- [Multi-Column Markdown README](https://github.com/ckRobinson/multi-column-markdown)
- [Ninja Cursor README](https://github.com/vrtmrz/ninja-cursor)
- [[HUMAN_WRITING]]
