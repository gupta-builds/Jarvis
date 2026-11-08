---
type: system
status: sprout
created: 2026-06-01
updated: 2026-11-07
tags:
  - system
  - standards
system_kind: standard
family: source-summary
tier: 1
maps_to:
  - "[[Source Summary Template]]"
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
This is the Standard for the summary of one source in `60_Claude/10_Source_Summaries/` (`PDF Ingestion`, `Web Ingestion`, `Video Ingestion`). It is not a GitHub repo card ([[Repo Evaluation Standard]]) and not an AI conversation summary ([[Conversations]]). The raw clipping stays untouched ([[Clipping Standard]]), and the summary carries the claims.
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

| Item | Rule |
|---|---|
| Allowed folders | `60_Claude/10_Source_Summaries/PDF Ingestion/`, `Web Ingestion/`, or `Video Ingestion/`. |
| File name | The source's title plus its kind in parentheses (`BASWE 15 AI Engineering Projects That Land Jobs (PDF)`). Unique in the vault. |
| Kind | `type: input` with `input_kind: pdf-summary`, `web-summary`, or `video-summary`. |
| Status | `seed` while the capture is partial, `sprout` once all seven sections are written, `tree` after the owner has checked it against the source. |
## Headings
### Frontmatter and title lines
- **Write:** `input_kind`, `track` (the subject and the flashcard deck: `ai`, `systems`, `algorithms`, `career`, `trading`, `general`), `source_note` (a quoted wikilink to the raw clipping with its extension and no folder), `source_url` (the path or live link). After the `# Title - Summary` line come `**Source:**`, `**Ingested:**`, `**Pages:**`.
- **Length:** one line per key; three bold lines.
- **Never:** `input_kind: pdf` or `web`, a `source_note` written as a folder path or without the extension, or a `track` that does not match the deck in Flashcards.
- **Right:** `source_note: "[[BASWE__15_AI_Engineering_Projects_Guide.docx.pdf]]"`
- **Wrong:** `input_kind: pdf`
### Source
- **Write:** what it is, who made it, its stated purpose. Bold the source type and named people or firms on first mention.
- **Length:** one to three sentences.
- **Never:** a review of the source. It states what the source is.
- **Right:** `A build-guide from **BASWE / AiEngineerAccelerator™**: fifteen portfolio-project blueprints for mid-level software engineers moving into AI engineering.`
- **Wrong:** None seen.
### Key Claims
- **Write:** one bullet per distinct claim, with the key term in bold. Both halves of a contrast are separate claims.
- **Length:** seven to twelve bullets. Do not merge claims to look short.
- **Never:** a claim the source does not make.
- **Right:** `- **Build 2–3 deeply, not all 15**`
- **Wrong:** None seen.
### Full Content
- **Write:** the complete capture in the source's own section order, as `###` headings using the source's exact titles. Reproduce every numbered list, framework, and checklist. Each `###` carries one `==highlight==`. Sub-content under numbered items is tab-indented, source emphasis becomes a callout, and notation uses `$...$`.
- **Length:** the bulk of the note. A 12-page source is a long section, not a paragraph.
- **Never:** compressing ("Part II covers probability") instead of reproducing, or a section with no highlight.
- **Right:** `==A CI/CD pipeline that tests any LLM feature against a golden dataset on every prompt/model change, detects quality regressions, and Slack-alerts before bad output ships.==`
- **Wrong:** `## Executive Summary: The Core Strategy`
### Why It Matters
- **Write:** the project, course, or concept this serves.
- **Length:** two to four sentences.
- **Never:** "valuable resource" padding.
- **Right:** `This is the concrete project menu for the exact bar the [[How to Pivot into an AI-ML Engineering Role in 2026 (PDF)]] guide sets`
- **Wrong:** None seen.
### Links Into The Vault
- **Write:** verified wikilinks only. A target that does not exist yet is written in this section and labeled `(to create)`, never in frontmatter. For a tool or technique, link the matching list in `40_Resources/CS/AI/` if one exists, and propose rather than write a new entry.
- **Length:** three to eight links, each with a clause.
- **Never:** a dead link without `(to create)`.
- **Right:** `- [[Claude OS]]`
- **Wrong:** None seen.
### Open Questions
- **Write:** every item as `- [ ]`, with a date marker when a real date exists.
- **Length:** two to five items.
- **Never:** a question the summary already answers.
- **Right:** `- [ ] Can Project 1 (regression detection) be turned inward as the missing eval layer for the Jarvis writing skills?`
- **Wrong:** None seen.
### Flashcards
- **Write:** ends every summary. Cards on `#cards/<track>` that test a mechanism, contrast, or failure mode, written after Full Content has explained it. Bold only the term meant to be hidden. Cards are never made from a raw clipping.
- **Length:** three to five cards (the gold note carries six).
- **Never:** label trivia such as a card that only asks what an acronym stands for.
- **Right:** `What's the core advice on how many of the 15 projects to build?::Build **2–3 exceptionally well**, not all 15`
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| The seven headings appear in order and none is empty | A reader and a skill find sections by name | Lint, check 2 |
| `input_kind` is `pdf-summary`, `web-summary`, or `video-summary` | The vocabulary has no `pdf` or `web` | Lint, check 1 |
| Every wikilink resolves, with stubs labeled `(to create)` in the body | A dead link looks like a note that exists | Lint, check 3 |
| Each `###` in Full Content carries one highlight | A highlight is the card or claim a reader keeps | Reader |
| Reopening the source reveals nothing the note lacks | A summary that sends you back to the source is an advertisement | Reader |
| Cards come after the concept is explained | A card on an unexplained concept is trivia | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `input_kind: pdf` (28 notes), `web` (17), `video` | `pdf-summary`, `web-summary`, `video-summary` | Mechanical |
| `## Full Content - the roadmap, by section` | `## Full Content`, the suffix moves into the first `###` | Mechanical |
| No Full Content (23 notes): `## Executive Summary`, `## Part N` | Wrap the source-order sections as `###` under `## Full Content` | Judgment |
| No Open Questions (10 notes) or no Flashcards (2 notes) | Add the section | Judgment |
| `source_note` as a folder path or without the extension | `"[[Name.pdf]]"` | Mechanical |
| Missing `updated`, `input_kind`, `track`, or `source_note` | Add; `updated` from the last edit | Mechanical |
| A list or index typed `input` in the folder | Retype `index` | Judgment |
## Done Conditions
- Reopening the source reveals nothing the note lacks.
- The seven headings appear in order, each `###` in Full Content carries one highlight, and the deck matches `track`.
- Every wikilink resolves, with stubs labeled in the body.
- The note passes [[Vault Lint]] for `source-summary` and the Quality Gate in [[Jarvis Writing and Formatting]].
## Gold Standard Example
[[BASWE 15 AI Engineering Projects That Land Jobs (PDF)]]: all seven headings in order, no dead links, a highlight under every `###`, and it fails only the old `input_kind: pdf` value, which Legacy Shapes rewrites.
Measured 2026-11-07 with `--family source-summary`: 45 notes, 0 pass; all 45 fail the kind value (28 `pdf`, 17 `web`). Other failures: 23 without Full Content, 22 dead frontmatter links, 14 dead body links.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| BASWE 15 AI Engineering Projects That Land Jobs (PDF) (gold) | `60_Claude/10_Source_Summaries/PDF Ingestion/Read/` | All seven headings | Only the `input_kind` value |
| MavGPT AI Resume & Job Search Guide (PDF) | `60_Claude/10_Source_Summaries/PDF Ingestion/` | Real content | `## Executive Summary` in place of Full Content |
