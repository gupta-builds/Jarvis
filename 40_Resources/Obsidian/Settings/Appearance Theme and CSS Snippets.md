---
type: evergreen
status: sprout
created: 2026-09-19
tags:
  - evergreen
  - system
  - obsidian
  - settings
notes:
  - "[[AI_CONTEXT]]"
  - "[[HUMAN_WRITING]]"
  - "[[40_Resources/Obsidian/Vault Operating System]]"
  - "[[00 Plugin Reference Index]]"
  - "[[Plugin Inventory and Configuration Map]]"
  - "[[File Handling and Properties]]"
next: "[[File Handling and Properties]]"
---
# Appearance Theme and CSS Snippets
==Two of this vault's five enabled CSS snippets are not custom edits despite their names — `myedits.css` (3,910 lines) is AnuPpuccin's own extended Style Settings schema, and `rainbowfile_colors.css` (2,662 lines) is a third-party AnuPpuccin add-on by AnubisNekhet — only `headerspace.css`, `readingview.css`, and `dashboard.css` were actually written for this vault.==
## What This Note Covers
[[Plugin Inventory and Configuration Map]] states the theme and snippet names in one line. This note documents what each snippet actually contains, sourced from reading the files directly, plus the AnuPpuccin theme's Style Settings configuration in `.obsidian/plugins/obsidian-style-settings/data.json`, which no existing note covers.
## Theme
`.obsidian/appearance.json` sets `cssTheme: AnuPpuccin`. Per the theme's own repository, AnuPpuccin won Obsidian's "Best Theme" Gems of the Year award in 2022, and its author describes it as built to stay optional — *"completely optional so users can maintain a vanilla experience if preferred"* — with nearly all visual behavior routed through the Style Settings plugin rather than hardcoded, which is why a plain theme name in `appearance.json` says almost nothing about the actual look without also reading Style Settings' `data.json`.
## Style Settings Configuration (Actual Values)
Read directly from `.obsidian/plugins/obsidian-style-settings/data.json`:
- *Color base:* dark theme set to `ctp-mocha` (Catppuccin Mocha), accent `ctp-accent-lavender`. Light theme has no accent (`none`) and the light-theme extended toggle is off — this vault is configured for dark mode only, light mode is not tuned.
- *Extended themes:* `anp-theme-ext-dark` and `anp-theme-ext-amoled` are both on; `anp-theme-ext-light` is off. The AMOLED-extended dark variant is also active (`ctp-amoled-dark`), which pushes background values toward true black rather than Mocha's default dark gray.
- *Reading and editing toggles on:* active-line highlight is explicitly disabled (`anp-no-highlight`), callout colors, custom checkboxes, codeblock line numbers, colored inline LaTeX (`anp-latex-inline-lavender`), list and table styling, table auto-width, table header highlighting, toggle-style callouts, kanban lane styling (with card menus, card borders, and lane borders all hidden), full-width kanban search, colored headers with margin and divider styling, H1 dividers, and colorful window-frame accents (dark mode only).
- *Explicitly off:* table cell highlighting, kanban lane auto-collapse, titlebar auto-hide, status bar hiding, custom scrollbars, and tooltips.
- *Hover Editor color overrides:* pinned and inactive title bars forced to pure black (`#000000`) in dark mode, layered on top of the AMOLED extended theme rather than duplicating it.
The overall shape: an AMOLED-leaning dark Catppuccin Mocha with lavender accents, heavy Kanban-board decluttering (borders and menus stripped), and reading-flow choices — no active-line highlight, no distracting scrollbars or tooltips — that favor a quiet Live Preview surface over a chrome-heavy one.
## CSS Snippets, By What They Actually Are
`.obsidian/appearance.json` enables all five in this order: `dashboard`, `myedits`, `rainbowfile_colors`, `readingview`, `headerspace`.
- **`headerspace.css`** (27 lines) — vault-authored. Tightens Live Preview heading line-height and padding, with an extra rule that removes the gap between two consecutive headings. Exists because default heading spacing read as too loose for this vault's dense, heading-heavy notes.
- **`myedits.css`** (3,910 lines) — **not custom**, despite the filename. Its own header identifies it as `AnuPpuccin Themes Extended`, `id: anuppuccin-theme-settings-extended` — this is the theme's own extended Style Settings schema file, distributed as a snippet because Style Settings reads its `@settings` blocks from CSS files. Every toggle described above under "extended themes" is defined here, not written by hand.
- **`rainbowfile_colors.css`** (2,662 lines) — **not custom**. Third-party AnuPpuccin add-on, licensed AGPLv3, authored by AnubisNekhet, distributed as `AnuPpuccin Custom Rainbow Folder Colors`. Per the theme's own docs it ships two variants — one that colors only the root directory's first layer of folders, one that colors every folder recursively — and exposes the choice as a Style Settings dropdown (`rainbow-color-repeat`) rather than requiring manual edits to this file.
- **`readingview.css`** (32 lines) — vault-authored. Reading-view-only heading spacing fix, deliberately separate from `headerspace.css` because Live Preview and Reading View use different DOM structures and needed different margin values to look consistent with each other.
- **`dashboard.css`** (179 lines) — vault-authored. Defines `.dashboard-grid` and `.card` layout classes for the two-column stat-tile grid used by `00_Dashboard` and other dashboard notes, built to work with Meta Bind and Dataview blocks rendered inside those cards.
> [!NOTE]
> Per Obsidian's own CSS snippets documentation, snippets apply live on save with no reload needed, and exist specifically as a lighter-weight alternative to building a full theme — which is exactly how this vault uses them: two small hand-written layout fixes plus one hand-written dashboard stylesheet, sitting alongside two large third-party AnuPpuccin extension files that happen to also be delivered as snippets.

Practical implication for agents: never treat `myedits.css` or `rainbowfile_colors.css` as vault-specific customization to preserve or migrate carefully — they are theme add-ons, replaceable by re-downloading from AnuPpuccin if lost. Only `headerspace.css`, `readingview.css`, and `dashboard.css` represent choices unique to this vault, and only those three would need hand-recreating on a fresh install.
## Suggestions
- **The Acer-theme-installation concern from before Build 6 is resolved, not just checked — the theme folder itself syncs, not just its name.** Confirmed directly: `.obsidian/themes/AnuPpuccin/` exists as real local files on the Dell, and `.stignore` has no line touching `themes/` anywhere — so the actual theme CSS files propagate to the Acer via Syncthing the same as any other vault content, alongside `appearance.json`'s `cssTheme` reference. There is no separate "browse and install from Community Themes" step required on the Acer; the synced files are the installed files. Genuinely useful to know, and now a closed question rather than an open one — worth one visual glance on the Acer after full sync just to eyeball that AnuPpuccin actually renders, since a byte-identical file tree and a running theme are still two different things to confirm once, not two things to assume are the same.
- **`headerspace.css`, `readingview.css`, and `dashboard.css` are the only three files worth versioning carefully — real, standing guidance, not a one-time task.** If any hand-written CSS work happens on this vault going forward, it belongs in one of these three, not `myedits.css` or `rainbowfile_colors.css` — editing the theme's own extended-settings file directly would get silently overwritten the next time AnuPpuccin ships an update to that schema. Worth Anant keeping in his head permanently, since the failure mode (losing custom CSS to a theme update) only shows up months later when it's hard to trace back.
- **A short comment header inside each of the three vault-authored snippets is low-effort and genuinely worth doing, not just tidy.** One line each (`headerspace.css`, `readingview.css`, `dashboard.css`) stating "hand-written for this vault, do not treat as a theme file" turns a fact that currently lives only in this note into something visible the moment anyone (Anant, or an agent) opens Community Themes → Snippets without vault-history context. Costs nothing, prevents a real future mistake (editing the wrong file, or deleting a "duplicate-looking" custom snippet during a cleanup pass).
## Sources
- [AnuPpuccin theme repository](https://github.com/AnubisNekhet/AnuPpuccin) — theme description, extended colorschemes, rainbow-folder snippet variants, fetched 2026-09-19
- [Obsidian Help — CSS snippets](https://obsidian.md/help/Extending+Obsidian/CSS+snippets) — snippet activation and live-reload behavior, fetched 2026-09-19
- Direct read of `.obsidian/appearance.json`, `.obsidian/plugins/obsidian-style-settings/data.json`, and all five files under `.obsidian/snippets/` — this session, 2026-09-19
- Direct filesystem check of `.obsidian/themes/AnuPpuccin/` (exists) and `.stignore` (no `themes/` exclusion) — confirms the theme folder syncs via Syncthing, this session, 2026-09-19
