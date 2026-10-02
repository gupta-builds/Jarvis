---
type: evergreen
status: sprout
created: 2026-05-31
updated: 2026-09-20
tags:
  - evergreen
  - system
  - obsidian
  - omnisearch
  - search
notes:
  - "[[AI_CONTEXT]]"
  - "[[HUMAN_WRITING]]"
  - "[[40_Resources/Obsidian/Vault Operating System]]"
  - "[[60_Claude/07_AI_Information/Plugins]]"
  - "[[00 Plugin Reference Index]]"
  - "[[Search Linking and Navigation]]"
---
# Omnisearch and Retrieval
==Omnisearch is the fuzzy, ranked full-text search a human uses to find a note before creating a duplicate. As of 2026-09-20 it also indexes PDFs, images, and Office files — the Text Extractor companion plugin is installed and PDF/office/image indexing is turned on.==
## Mechanism
Omnisearch ranks results by relevance (filename, headings, body) with typo tolerance, instead of the core search's literal matching. The problem it solves in Jarvis: the "search before you create" rule in [[AGENTS]] only works if search actually surfaces the existing note. Core search misses fuzzy matches and aliases; Omnisearch catches them. It weights filename and headings highest, so **a note with a precise H1 and real `##` headings is far more findable** — which is why heading quality is a retrieval concern, not a cosmetic one.
## Exact Current Settings
Read from `.obsidian/plugins/omnisearch/data.json` this session (version `1.28.2` per [[Plugin Inventory and Configuration Map]]):
- `useCache`: `true`.
- `fuzziness`: `1` (moderate typo tolerance).
- `PDFIndexing`: **`true`** (enabled 2026-09-20); `officeIndexing`: **`true`** (enabled 2026-09-20); `imagesIndexing`: **`true`** (enabled 2026-09-20); `aiImageIndexing`: **`false`** — left off deliberately, see below.
- `httpApiEnabled`: `false` (port `51361`) — no external query surface.
- Weights: `weightBasename` `10`, `weightDirectory` `7`, `weightH1` `6`, `weightH2` `5`, `weightH3` `4`, `weightUnmarkedTags` `2`.
- `showExcerpt`: `true`; `highlight`: `true`; `showPreviousQueryResults`: `true`.
- `splitCamelCase`: `false`; `ignoreDiacritics`: `true`.
- `indexedFileTypes`: `[]` (no extra extensions).

## Text Extractor — installed 2026-09-20
Omnisearch's own docs name **Text Extractor** ([scambier/obsidian-text-extractor](https://github.com/scambier/obsidian-text-extractor)) as the required companion for PDF/image/Office indexing — it is not a checkbox inside Omnisearch itself, it's a separate plugin that does the extraction and Omnisearch reads its cache. Installed manually (not via the community plugin browser, which this session can't drive): fetched `main.js` and `manifest.json` from the GitHub Releases page (v0.7.0) into `.obsidian/plugins/text-extractor/`, registered it in Lazy Plugin Loader (`short` delay, alongside Omnisearch itself), validated the JSON, no BOM.

Mechanism, per the plugin's own README:
- Runs OCR **locally** via Tesseract.js and PDF text extraction via `pdf-extract` — file content never leaves the device.
- Needs internet **once**, to download OCR language files on first use; after that it's offline.
- Extracted text is cached as small `.json` files inside the plugin's own folder, which is how results survive across devices without re-running OCR everywhere.
- **Does not run on mobile at all** — falls back to whatever's already cached from a desktop run.
- The plugin's own maintenance status is worth knowing: **the repo says it is currently unmaintained**, though PRs are still accepted. Not a reason to avoid it (it's the dependency Omnisearch's own docs point to, and it still works), but a reason not to expect fixes if it breaks on a future Obsidian update.

**Do not confuse this with Microsoft PowerToys' "Text Extractor" utility.** They share a name and nothing else: PowerToys' version is a manual, on-demand screen-region OCR tool you trigger with a hotkey to copy text out of any image on screen into the clipboard — it has no relationship to Obsidian, does not touch the vault, and does not index anything. The plugin installed here is a background indexer that Omnisearch queries automatically. If either of these gets referenced again, they are not interchangeable.

`aiImageIndexing` was deliberately left `false`: that flag is a further step beyond Text Extractor's local OCR (routing image content through an AI captioning/description model), a materially bigger privacy step than local Tesseract OCR, and the user's decision only specified "PDFs, images, and Office files" become searchable — not that images should additionally be AI-described. If that's wanted later, it's a one-line flag flip, but it's a separate decision.

## Integration Map
- **Omnisearch → "search before create":** it is the human-facing implementation of [[Search Linking and Navigation]] step 1. Agents use filesystem `Grep`/`Glob` instead, but both serve the same anti-duplication rule.
- **Omnisearch ← headings/filenames:** the weight table means [[Jarvis Writing and Formatting]]'s "name the mechanism in the heading" rule directly raises a note's rank. Headings like "Overview" rank a note for nothing.
- **Omnisearch + Text Extractor, now live:** PDFs, images, and Office files in the vault (including `05_Clippings/`) are indexed once Text Extractor has run OCR/extraction on them and cached the result — this happens lazily, not instantly on plugin install, so a just-added PDF may take a search pass or an Obsidian restart before Text Extractor has extracted it.
- **Omnisearch's PDF-extraction path still matters as a fallback:** the pypdf-based manual extraction workflow into a `60_Claude/10_Source_Summaries/` note remains the *reliable* way to get a PDF's content into the vault as durable, human-reviewed prose — Text Extractor's own docs describe PDF extraction as frequently failing, so treat automatic indexing as "helps you find it," not "replaces summarizing it."

## Agent Rules
- Don't assume automatic indexing is instant or perfectly reliable — Text Extractor's PDF extraction specifically is documented as failure-prone. If a fact matters, it still belongs in a proper source summary, not just "now Omnisearch can technically see the PDF."
- When writing a note, treat the H1 and `##` headings as search keys: name the mechanism, not the mood.
- Agents should retrieve with `Grep`/`Glob` (exact, scriptable) and reserve Omnisearch guidance for the human workflow.
- Do not flip `aiImageIndexing` on, or change other Text Extractor/Omnisearch settings, without explicit user approval — the PDF/image/office indexing enablement itself was pre-approved by the user for this batch; further changes are not.

## Failure Modes
- **PDF extraction failure (real, documented):** Text Extractor's own README flags PDF extraction as frequently failing — a PDF that "should" be searchable now may still return nothing. Don't treat a miss as proof the plugin is misconfigured; check whether extraction actually ran for that file before assuming it's broken.
- **Mobile blind spot:** Text Extractor does not run on mobile; only whatever was already cached from a desktop pass is available there.
- **Vague headings:** a note titled with generic headings ranks poorly and effectively hides behind better-named notes.
- **Assuming attachments are indexed instantly:** a PDF/image just added to the vault needs an extraction pass first; it is not searchable the instant it's saved.
## Gold-Standard Example
The retrieval target Omnisearch should surface is a well-headed source summary or course note — e.g. [[40_Resources/UMN/Previous Classes/Minor/MGMT 3001/Week - 4|Week - 4]], whose precise H1 and section headings (`## Lecture-to-textbook synthesis`, `## Examples worth keeping`) are exactly the high-weight fields Omnisearch ranks on. A raw PDF in `60_Claude/05_Clippings/PDFs/` is now indexable directly once Text Extractor has run on it, but a proper source summary still ranks higher (better headings, higher basename/H1 weight) and is the only form guaranteed not to depend on OCR succeeding.
Query syntax, confirmed from Omnisearch's own "How to use" docs: `"exact phrase"` for phrase matching, `-term` to exclude, `path:"<folder>"` to restrict to a directory, `ext:png` or `ext:"png jpg"` for file type ([Omnisearch — How to use Omnisearch](https://publish.obsidian.md/omnisearch/How+to+use+Omnisearch)). No tag-filter syntax exists — confirmed absent from the docs, not just undocumented — so `path:` is the closest Omnisearch gets to scoping a search by topic; e.g. `path:"20_Progress"` to check one folder before creating a duplicate project note.

## Verified Open State
- `useCache`'s refresh timing isn't documented anywhere in Omnisearch's own docs (they describe the cache existing, not its refresh trigger) — a live test (create a throwaway note, search for a unique string immediately) would answer it but hasn't been run. Treat "just-created note not yet in search results" as expected latency, not a bug, until this is tested.
- `httpApiEnabled` stays off (`false`, port `51361`) — the safe default, no change made, no stated need for an external query surface.

## Sources
- [Omnisearch docs](https://publish.obsidian.md/omnisearch/Index)
- [Omnisearch — How to use Omnisearch](https://publish.obsidian.md/omnisearch/How+to+use+Omnisearch) — query syntax (`"phrase"`, `-exclude`, `path:`, `ext:`), fetched 2026-09-19
- [Omnisearch community plugin page](https://community.obsidian.md/plugins/omnisearch)
- [Text Extractor plugin — GitHub](https://github.com/scambier/obsidian-text-extractor) — mechanism, local OCR, mobile limitation, unmaintained status, fetched 2026-09-20
- [Text Extractor releases](https://github.com/scambier/obsidian-text-extractor/releases) — v0.7.0 install source, fetched 2026-09-20
- Direct read of `.obsidian/plugins/omnisearch/data.json` and `.obsidian/plugins/lazy-plugins/data.json`, before and after this session's changes, 2026-09-20
- [[Search Linking and Navigation]]
