---
type: evergreen
status: sprout
created: 2026-05-15
updated: 2026-09-20
tags:
  - evergreen
  - system
  - obsidian
  - search
notes:
  - "[[AI_CONTEXT]]"
  - "[[HUMAN_WRITING]]"
  - "[[40_Resources/Obsidian/Vault Operating System]]"
  - "[[60_Claude/07_AI_Information/Plugins]]"
  - "[[00 Plugin Reference Index]]"
  - "[[Cross-Laptop Sync - Build 3 Findings]]"
---
# Search Linking and Navigation

Jarvis depends on retrieval. Search, links, previews, and pinned navigation should make the correct note easier to find than creating a duplicate.

## Search Before Create

Before creating a note:

1. Search exact title candidates.
2. Search likely aliases and abbreviations.
3. Check relevant boards and dashboards.
4. Check backlinks from the closest existing concept/project/source note.
5. Extend the canonical note unless the new note has a distinct durable job.

Agents should use filesystem search or available vault search tools first. Humans should use Omnisearch, Quick Switcher, backlinks, and dashboards.

## Backlinks and Unlinked Mentions

Backlinks work when links are intentional.

Use wikilinks when:

- a project uses a concept
- a course note depends on a concept
- a source supports a claim
- a summary should lead back to the source
- an agent workflow explains a repeated action

Use unlinked mentions to discover missed connections, not as proof that two notes belong together.

Do not link every keyword. Link retrieval paths.

## Page Preview and Hover Editor

Page Preview and Hover Editor make headings and first paragraphs matter.

Current Hover Editor settings:

- Auto focus: enabled.
- Auto pin: `onMove`.
- Trigger delay: `300ms`.
- Close delay: `600ms`.
- Initial size: `400px` by `340px`.
- Embeds in hover: enabled.

Writing implication: the first paragraph under a heading should say the mechanism or decision, not warm-up prose. A hover preview should let the reader decide whether to open the note.

## Omnisearch
Omnisearch has its own deep reference now: [[Omnisearch and Retrieval]]. Short version: fuzzy ranked full-text search, weights filenames and headings highest. **Updated 2026-09-20:** PDF, Office, and image indexing are now on via the newly installed Text Extractor plugin — see that note for the mechanism, reliability caveats, and why AI image indexing specifically was left off. Use Omnisearch for broad human retrieval; don't assume indexing is instant even now that attachments are covered.

## Quick Switcher, Recent Files, and Recent Edits

Quick Switcher is for known-note navigation. It is useful when the note name is already close to mind.

Recent Files is weak session context. It can help a human resume work, but agents should not treat it as the source of truth. Read [[00_Dashboard]] and the session log instead.

**Recent Edits, added 2026-09-20** (`recent-edits`, v1.6.0) is a different tool from Recent Files, not a duplicate. Recent Files answers "what did I open recently" (a session-navigation aid); Recent Edits answers "what actually changed, and by what" — it groups modified files by day and, critically, **tags each edit with its source**: an in-app edit vs. a filesystem write made outside Obsidian (an agent, a script, the sync task). Confirmed genuinely in use, not just installed: this vault's `data.json` holds a live `lookbackDays: 7` window and dozens of real tracked edits, including this exact session's own file writes, each correctly marked `"external"`. Settings as configured: 7-day lookback, external-edit color `#D97757`, two-line row layout, hover preview off, size-delta indicator off. This is the tool to use when the question is specifically "what did an agent or script touch recently" — Recent Files can't answer that distinction at all.

Wiring note: `cmdr` and `recent-edits` were both installed on disk but wired into neither `community-plugins.json` nor Lazy Plugin Loader — confirmed 2026-09-20 they would not have activated on the next full Obsidian restart. Both now registered in Lazy Plugin Loader (`short` delay). See [[Plugin Inventory and Configuration Map]].

## Commander — active but not yet configured, needs manual setup
**Confirmed live 2026-09-20**, in a real running Obsidian session via the `jarvis` MCP command list: `cmdr:open-commander-settings` is a registered command, meaning Commander is genuinely active now (the Lazy Plugin Loader fix worked). But `.obsidian/plugins/cmdr/` still has no `data.json` — zero commands added anywhere. This is the honest reason it isn't "in use" yet despite being called useful: it's a UI-configuration plugin with no queryable or scriptable setup path. Per its own README ([phibr0/obsidian-commander](https://github.com/phibr0/obsidian-commander)), adding a command is entirely an in-app action — Settings → Commander → add/remove/reorder/edit commands — for four supported locations: **ribbon** (the left sidebar icon bar), **editor toolbar**, **file menu**, and **status bar**. There is no documented `data.json` schema to author blindly from outside Obsidian; this genuinely needs Anant to open Settings → Commander himself and add the specific commands he wants one-click access to.

**This is the general pattern for "plugin says it's useful but nothing to show for it":** an agent can install, enable, and wire a plugin's activation path, but a UI-configuration plugin's actual payoff only exists once a human uses its settings panel. Don't read "no data.json" as "not really wanted" for this class of plugin — it's the expected state right after activation, before the first real setup pass.

## File Explorer++

File Explorer++ supports pinned and hidden navigation filters.

**Overlap with Recent Files, checked against both plugins' own READMEs (2026-09-19): none.** They answer different questions. Recent Files tracks *time* — a chronological list of files most recently opened, filtered by excluded paths/tags/bookmarks ([Recent Files README](https://github.com/tgrosinger/recent-files-obsidian)). File Explorer++ tracks *standing structure* — wildcard/regex filters that pin or hide items in the static file tree, with no concept of recency at all ("enhances the built-in file explorer" through hide/pin filtering only — [File Explorer++ README](https://github.com/kelszo/obsidian-file-explorer-plus)). Recent Files answers "what did I just touch"; File Explorer++ answers "what should always be visible regardless of when I touched it." A dashboard pinned in File Explorer++ stays pinned whether or not it was opened today; a dashboard opened once shows in Recent Files whether or not it's pinned. Keep both.

Treat pinned files as navigation landmarks:

- dashboards
- course boards
- project boards
- habit boards
- system reference notes

Do not rewrite pin/hide filters during documentation work. These are human layout preferences.

## Homepage
Homepage opens a chosen note, canvas, base, or workspace whenever the vault starts, instead of restoring whatever was open last.

**Corrected 2026-09-20 — the 2026-09-19 "not yet configured" finding was itself wrong, and for an instructive reason.** Homepage *was* already configured (`openOnStartup: true`), but `.obsidian/plugins/homepage/data.json` carried a **UTF-8 BOM** — the exact class of silent-corruption bug this vault's own edit workaround exists to prevent. A BOM breaks strict JSON parsing (confirmed: Node's `JSON.parse` throws on it directly), which is almost certainly why the prior pass read this file and concluded it was unconfigured — a parser choking on the BOM can misread or fail on the whole structure. Separately, the configured target itself was also wrong: `value` pointed at `10_Areas/AI/Jarvis OS Dashboard`, a path that has never existed — the real file is `10_Areas/Jarvis OS Dashboard.canvas`, directly under `10_Areas/`, no `AI/` subfolder. Both fixed this session: BOM stripped, `value` corrected to `10_Areas/Jarvis OS Dashboard`. The vault now genuinely opens to `10_Areas/Jarvis OS Dashboard.canvas` on startup, not [[00_Dashboard]] — that's a different, already-existing choice (a Canvas landing view rather than the Markdown dashboard note), left as-is since it was clearly a deliberate prior setup, just broken in execution.

## Paste URL Into Selection

Paste URL into selection is a human link hygiene tool. It turns selected text into a Markdown link when a URL is pasted.

Agents writing directly should create normal Markdown links:

```markdown
[source label](https://example.com)
```

Use `source_url` in frontmatter when a note has one primary external source.

## Headings, Aliases, and Wikilinks

Retrieval improves when notes have:

- specific H1 titles
- headings that name mechanisms, not moods
- aliases when a concept has multiple names
- wikilinks from projects, courses, and source summaries
- source anchors near claims

Avoid:

- duplicate notes with slightly different titles
- orphan stable docs
- headings like "Overview" repeated everywhere without context
- source links buried at the bottom when the claim needs them nearby

## Agent Workflow

When an agent cannot find a note:

1. Search title and alias variants.
2. Search by folder role.
3. Search by likely field values, such as `type: project` or `#cards`.
4. Check relevant dashboards.
5. Create a new note only after naming why it is not a duplicate.

## Integration Map
- **Hover Editor ← first lines:** the `300ms` hover preview shows a note's opening. So the rule "the first line under a heading states the mechanism, not warm-up prose" is a Hover Editor optimization, not a style preference — a good first line lets the reader decide without opening the note.
- **Hover Editor → Omnisearch:** both reward the same thing — precise headings and a useful first paragraph. Omnisearch ranks them; Hover Editor displays them. See [[Omnisearch and Retrieval]].
- **File Explorer++ → navigation landmarks:** pinned dashboards/boards are the human entry points; agents should read [[00_Dashboard]] and the session log instead of relying on Recent Files, which is weak session context.
## Gold-Standard Example
[[HeapSort|HeapSort]] previews well on hover because its first lines state the mechanism, and it ranks well in Omnisearch because its headings name specific things. Contrast a note whose first heading is "Overview" followed by warm-up prose — it previews as noise and ranks for nothing.
## Verified Open State
- Should source-summary folders (`60_Claude/10_Source_Summaries/`) be pinned in File Explorer++ for quick navigation? — *human layout preference; not acted on here, these are human pin/hide filters this batch does not rewrite*
- The `Alt+C` Calendar hotkey is confirmed dead (no `calendar` plugin folder exists) but the binding itself was not removed this session — that edit belongs to [[Core Plugins Hotkeys and Defaults]], not duplicated here.
- File Explorer++ and Recent Files render in two different UI panels (the file tree vs. a separate recent-files list) and were never competing for the same space — a file hidden in the tree still shows in Recent Files. Not actually ambiguous; no further resolution needed.
## Sources

- [Obsidian Help - Backlinks](https://help.obsidian.md/plugins)
- [Omnisearch docs](https://publish.obsidian.md/omnisearch/Index)
- [Omnisearch community plugin page](https://community.obsidian.md/plugins/omnisearch)
- [Recent Edits plugin](https://github.com/cwagner223355) — mechanism (day-grouped edits, external-write tagging), fetched 2026-09-20
- Direct read of `.obsidian/plugins/homepage/data.json` (before and after the BOM/path fix), `.obsidian/plugins/recent-edits/data.json`, `.obsidian/plugins/cmdr/` (no data.json — never configured), and `.obsidian/plugins/lazy-plugins/data.json` — this session, 2026-09-20
- [Hover Editor README](https://github.com/nothingislost/obsidian-hover-editor)
- [File Explorer++ README](https://github.com/kelszo/obsidian-file-explorer-plus)
- [Recent Files README](https://github.com/tgrosinger/recent-files-obsidian)
- [Paste URL into selection README](https://github.com/denolehov/obsidian-url-into-selection)
