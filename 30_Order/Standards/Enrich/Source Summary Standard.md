---
type: system
status: sprout
created: 2026-06-01
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: source-summary
tier: 1
maps_to:
  - "[[Clipping Distill Template]]"
used_by:
  - "[[Capture to Summary]]"
gold_standard: "[[BASWE 15 AI Engineering Projects That Land Jobs (PDF)]]"
notes:
  - "[[PDF Extraction Standard]]"
  - "[[Jarvis Writing and Formatting]]"
  - "[[HUMAN_WRITING]]"
---
# Source Summary Standard
==A source summary captures one PDF, web page, or video so completely that reopening the original reveals nothing new: it replaces the source, it does not advertise it.==
This is the standard for the summary of one source in `60_Claude/10_Source_Summaries/` (`PDF Ingestion`, `Web Ingestion`, `Video Ingestion`). GitHub repositories have their own shape in [[Repo Evaluation Standard]]; conversations are in [[Conversations]]. The raw clipping stays untouched, and the summary carries the claims.
## Spec
```json
{
  "family": "source-summary",
  "tier": 1,
  "match": {"type": "input", "kind": null, "path": "^60_Claude/10_Source_Summaries/(PDF Ingestion|Web Ingestion|Video Ingestion)/", "strict_path": true, "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "input_kind", "track", "source_note", "source_url", "notes"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "notes": "list"},
  "headings": ["Source", "Key Claims", "Full Content", "Why It Matters", "Links Into The Vault", "Open Questions", "Flashcards"],
  "optional_headings": [],
  "legacy_match": [{"type": "input", "path": "^60_Claude/10_Source_Summaries/(PDF Ingestion|Web Ingestion|Video Ingestion)/"}]
}
```
## Headings
### Frontmatter and title lines
`input_kind` is `pdf-summary`, `web-summary`, or `video-summary`. `track` names the subject (`ai`, `systems`, `algorithms`, `career`, `trading`, `general`) and is the flashcard deck. `source_note` is a quoted wikilink to the raw clipping with its extension and no folder (`"[[Quant Foundations.pdf]]"`); `source_url` is the path or live link. After the `# Title - Summary` line come three bold lines: `**Source:**`, `**Ingested:**`, `**Pages:**`.
> [!WARNING]
> A `source_note` written as a full folder path or without the extension, or a `track` that does not match the deck in Flashcards.
### Source
One to three sentences: what it is, who made it, its stated purpose. Bold the source type and named people or firms on first mention.
### Key Claims
One bullet per distinct claim, with the key term in bold. Both halves of a contrast are separate claims.
*Density:* Quant Foundations carries 12. Do not merge claims to look short.
### Full Content
The complete capture in the source's own section order, as `###` headings using the source's exact titles. Reproduce every numbered list, framework, and checklist. Each `###` carries one `==highlight==`. Sub-content under numbered items is tab-indented, source emphasis becomes a callout, and notation uses `$...$`.
*Density:* the bulk of the note. A 12-page source is a long section, not a paragraph.
> [!WARNING]
> Compressing ("Part II covers probability") instead of reproducing, or a section with no highlight.
### Why It Matters
Two to four sentences naming the project, course, or concept this serves. No "valuable resource" padding.
### Links Into The Vault
Verified wikilinks only. A target that does not exist yet is written in this section and labeled `(to create)`, never in frontmatter. For a tool or technique, link the matching list in `40_Resources/CS/AI/` if one exists, and propose rather than write a new entry.
### Open Questions
Every item as `- [ ]`, with a date marker when a real date exists. Typically two to five.
### Flashcards
Ends every summary. Three to five cards on `#cards/<track>` that test a mechanism, contrast, or failure mode, written after Full Content has explained it. Bold only the term meant to be hidden. Cards are never made from a raw clipping.
> [!WARNING]
> Label trivia such as `RAG stands for::...`.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `input_kind: pdf`, `web`, `video` | `pdf-summary`, `web-summary`, `video-summary` | mechanical |
| `## Full Content - the roadmap, by section` (6 notes) | `## Full Content`, the suffix moves into the first `###` | mechanical |
| No Full Content (about half): `## Executive Summary`, `## Part N` | Wrap the source-order sections as `###` under `## Full Content` | judgment |
| No Open Questions (10 notes) or no Flashcards (2 notes) | Add the section | judgment |
| `source_note` as a folder path or without the extension | `"[[Name.pdf]]"` | mechanical |
| Missing `updated`, `input_kind`, `track`, or `source_note` | Add; `updated` from the last edit | mechanical |
| A list or index typed `input` in the folder | Retype `index` | judgment |
## Done Conditions
- Reopening the source reveals nothing the note lacks.
- The seven headings appear in order, each `###` in Full Content carries one highlight, and the deck matches `track`.
- Every wikilink resolves, with stubs labeled in the body.
- The note passes [[Vault Lint]] for `source-summary` and the Quality Gate in [[Jarvis Writing and Formatting]].
## Gold Standard Example
[[BASWE 15 AI Engineering Projects That Land Jobs (PDF)]]: all seven headings in order, no dead links, and it fails only the old `input_kind: pdf` value, which Legacy Shapes rewrites. Ten other summaries are in the same position. [[Quant Foundations (PDF)]] was the earlier example and has the structure but no Flashcards section.
