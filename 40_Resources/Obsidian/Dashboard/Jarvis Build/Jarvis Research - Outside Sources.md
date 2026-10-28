---
type: reference
status: seed
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - jarvis
  - research
reference_kind: research
notes:
  - "[[Jarvis Build Hub]]"
  - "[[Jarvis Architecture]]"
  - "[[Jarvis Spec - Dashboard Page]]"
  - "[[Jarvis Spec - Day Model and Streak]]"
  - "[[Jarvis Spec - Automation Layer]]"
---
# Jarvis Research - Outside Sources
==What the web and the typed Obsidian documentation say about each specific the Jarvis design leans on, how sure each finding is, and what it changed.== All pages were read on 2026-10-26 through search results and the Obsidian API documentation index. Findings marked Secondary come from a summary and not from the primary page.

## Obsidian plugin API
| Topic | Finding | Source | Confidence | What it changes |
|---|---|---|---|---|
| `Vault.process` | Atomically reads, modifies and saves a note. The callback is synchronous and returns the new text. | [Vault.process](https://docs.obsidian.md/Reference/TypeScript+API/Vault/process), [Vault API](https://github.com/obsidianmd/obsidian-api/blob/master/_autodocs/api-reference/vault.md) | High. Locking against external disk changes is not described. | Every tick and edit uses it, with a stale-line check on top, because atomic does not mean the line is still the one the page saw. |
| `read` and `cachedRead` | `read` reads from disk and is for content you will modify. `cachedRead` is for display. | [obsidian.d.ts](https://github.com/obsidianmd/obsidian-api/blob/master/obsidian.d.ts) | High | The page displays from `cachedRead`. The edit path re-reads before checking a line. |
| `processFrontMatter` | Atomically changes a note's frontmatter. The note must be markdown. It can throw a YAML parse error. | [processFrontMatter](https://docs.obsidian.md/Reference/TypeScript+API/FileManager/processFrontMatter) | High | Used only for `lc_count` and `study_today`, with errors handled. |
| `processFrontMatter` bug report | A forum user reported that from Obsidian 1.5.5 it did not insert the frontmatter delimiters on a new file. No resolution found. | [Forum thread](https://forum.obsidian.md/t/processfronmatter-not-inserting-in-frontmatter/76982) | Low, one report | The create-note path writes the whole frontmatter from the template and does not rely on `processFrontMatter` for a new file. |
| Vault events at load | `create` also fires for every existing file at initial load. Register inside `Workspace.onLayoutReady`. | [Vault API](https://github.com/obsidianmd/obsidian-api/blob/master/_autodocs/api-reference/vault.md) | High | The plugin registers `create`, `modify`, `delete` and `rename` inside `onLayoutReady`. |
| Metadata cache events | `changed` fires when a file is indexed and is not called on rename. | [MetadataCache API](https://github.com/obsidianmd/obsidian-api/blob/master/_autodocs/api-reference/metadata-cache.md) | High | The tracker count listens to `changed` and to the vault `rename` event. |
| Views and leaves | `onLayoutReady` runs at once if the layout is ready. `revealLeaf` brings a leaf forward and should be awaited. | [Workspace API](https://github.com/obsidianmd/obsidian-api/blob/master/_autodocs/api-reference/workspace.md) | High | The open command finds the leaf by type, never stores a view. |
| Desktop only | A plugin that uses Node modules such as `fs`, `crypto` or `os` must set `isDesktopOnly` to true. | [Submission requirements](https://docs.obsidian.md/Plugins/Releasing/Submission+requirements+for+plugins), [Manifest](https://docs.obsidian.md/Reference/Manifest) | High | `isDesktopOnly: true` is allowed, and version 1 still uses no Node API. |
| `isDesktopOnly` reset | A forum user reported that a plugin update reset a manually set value. | [Forum thread](https://forum.obsidian.md/t/when-updating-a-plugin-dont-reset-the-isdesktoponly-value-in-manifest-json/108368) | Low, user report | The manifest is checked by `doctor` after each deploy. |
| Homepage | Runs any Obsidian command when it opens the homepage. | [Homepage listing](https://community.obsidian.md/plugins/homepage) | Medium | The route is a command that opens the plugin view. |

## Layout
| Topic | Finding | Source | Confidence | What it changes |
|---|---|---|---|---|
| Container query units | `cqw`, `cqh`, `cqi`, `cqb`, `cqmin` and `cqmax` size things relative to a query container. `cqh` needs `container-type: size`. | [Can I use](https://caniuse.com/css-container-query-units), [Frontend Masters](https://frontendmasters.com/blog/container-queries-and-units/) | Medium | Kept as an alternative to measured scaling. |
| Support | Chromium from about version 105, Firefox from 110, Safari from 16. | [Can I use](https://caniuse.com/mdn-css_types_length_container_query_length_units) | Medium, a dated snapshot | Obsidian's bundled Chromium version is unverified, so measured scaling is the plan. |
| `clamp()` with container units | No source found for the exact pattern. | | Unverified | Not relied on. |

## Habits and streaks
| Topic | Finding | Source | Confidence | What it changes |
|---|---|---|---|---|
| Habit time | Lally and colleagues found a median of 66 days to reach automaticity, with a range of 18 to 254 days. | [UCL news, 2009](https://www.ucl.ac.uk/news/2009/aug/how-long-does-it-take-form-habit) | Secondary. The 2010 paper was not retrieved. | The 66 day milestone in the streak table is grounded, and the page does not promise 66 days for everything. |
| One miss | The researchers reported that missing one opportunity did not materially affect habit formation, while a pattern of skipping did. | The same page and secondary summaries | Secondary | Supports the forgiven isolated miss and the two in a row reset. |
| Intact streaks | A seven study paper found that highlighting an intact streak increased later engagement more than highlighting a broken one. | [INSEAD](https://www.insead.edu/faculty-research/publications/journal-articles/or-track-how-broken-streaks-affect-consumer) | Medium. Abstract only. | The page shows the intact streak and never a broken count. |
| Streak freeze | Duolingo reports that a freeze keeps learners engaged. Its numbers are its own and not independently verified. | [Duolingo blog](https://blog.duolingo.com/how-duolingo-streak-builds-habit/) | Low. Company evidence. | One forgiven miss is the design's version of a freeze. No purchasable or stackable freeze. |
| Vendor claims | A glossary claimed a 20 to 40 percent daily-active lift with no source. | | Not used | Ignored. |

## Time tracking, for reference only
| Topic | Finding | Source | Confidence | What it changes |
|---|---|---|---|---|
| Time entries list | The Toggl v9 list endpoint takes RFC3339 `start_date` and `end_date` and returns at most 1000 entries. | [Time entries](https://engineering.toggl.com/docs/track/api/time_entries/) | Medium | Jarvis does not call it. The Plan decides how its notes get the data. |
| Detailed reports | The Reports API pages detailed entries at 50 per call, using response headers for the next page. | [Reports start](https://engineering.toggl.com/docs/track/reports_start/) | Medium | Same. |
| CSV export | Time entries can be exported as CSV from the Detailed Report page in the web app. | [Exporting data](https://support.toggl.com/en/articles/2564936-exporting-data) | Medium | One way The Plan could build its detailed time log notes. |
| Detailed CSV by API | No official endpoint path was found. | | Unverified | Not relied on. |

## What was not verified
- Whether the Homepage plugin has a view kind called "Nothing". The search did not confirm it. The Plan's earlier audit read its settings and saw that kind and a command, so the Jarvis route is the command.
- Playwright as the real-browser test tool, and the Chromium that Obsidian bundles.
- The names of Obsidian's theme colour variables. They are confirmed against the live theme in the build.
- The original Lally paper's exact wording.
- Whether a controlled study shows that streak freezes help long-term retention.
