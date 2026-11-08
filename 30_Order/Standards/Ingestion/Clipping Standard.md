---
type: system
status: sprout
created: 2026-10-16
updated: 2026-11-07
tags:
  - system
  - standards
system_kind: standard
family: clipping
tier: 2
maps_to: []
used_by: []
gold_standard: "[[60_Claude/05_Clippings/Web/Claude Council|Claude Council]]"
notes:
  - "[[Source Summary Standard]]"
  - "[[Frontmatter Standard]]"
---
# Clipping Standard
==A clipping is the source exactly as it arrived: its body is never edited, and its frontmatter only says what it is and where it came from.==
This is the Standard for raw captures in `60_Claude/05_Clippings/Web`, `Videos`, and `PDFs`: web pages from the clipper, video transcripts, and PDFs waiting to be summarized. It is not an AI conversation export ([[Conversations]]), not a meeting transcript ([[Transcript Standard]]), and not the summary made from the clipping ([[Source Summary Standard]]).
## Spec
```json
{
  "family": "clipping",
  "tier": 2,
  "match": {"type": "input", "kind": null, "path": "^60_Claude/05_Clippings/(Web|Videos|PDFs)/", "strict_path": true, "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "input_kind", "source_url"],
  "key_types": {"created": "date", "updated": "date", "tags": "list"},
  "headings": [],
  "optional_headings": [],
  "skip_checks": [3, 5],
  "legacy_match": [{"path": "^60_Claude/05_Clippings/(Web|Videos|PDFs)/"}]
}
```
`skip_checks` drops the link and hygiene checks because the body is a verbatim capture of someone else's page: its blank lines and brackets are the source's, not the vault's.

| Item | Rule |
|---|---|
| Allowed folders | `60_Claude/05_Clippings/Web/`, `Videos/`, or `PDFs/`. |
| File name | The title the capture tool wrote. Never renamed by hand, so a clipping can be matched to its source. |
| Kind | `type: input` with `input_kind: clipping` (a page or PDF) or `transcript` (spoken text). |
| Status | `seed` at capture. `archived` when it will not be summarized, with the reason in `notes`. |
## Headings
No headings are required and none are added. The body is the source.
### Frontmatter
- **Write:** `type: input`, `input_kind`, `status: seed`, `created`, `updated`, `tags`, and `source_url`, the origin. Keep the clipper's own keys (`title`, `source`, `author`, `published`, `description`). `review_state: raw` is optional.
- **Length:** seven keys beyond what the clipper writes.
- **Never:** a clipping with the clipper's keys and no `type`. 23 of 24 clips are exactly that, so no query finds them.
- **Right:** `input_kind: transcript`
- **Wrong:** `source_url:`
### Body
- **Write:** the capture, byte for byte as the tool wrote it.
- **Length:** whatever the source is.
- **Never:** an edit, a heading, or leftover template text. A clipping holds the source and nothing else.
- **Right:** `> Stop letting Claude tell you what you want to hear.`
- **Wrong:** `Paste the untouched transcript below, inside the fence.`
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| The body is byte-identical to what the tool captured | A summary can only be checked against an unchanged source | Reader |
| The only edit after capture is completing the missing frontmatter keys, with `source_url` copied from `source` | The capture tool should write them; a later fix must not touch the body | Reader |
| The seven keys are present and `source_url` resolves to the origin | A query for clippings finds notes by `type` and `input_kind` | Lint, check 1 |
| The clipping lives in `Web`, `Videos`, or `PDFs` | Raw sources are read-only after capture ([[AGENTS]]) | Lint, check 4 |
| One summary exists, or the clipping is `archived` with a reason in `notes` | A clip nobody summarizes is storage, not knowledge | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| Clipper keys only: `title`, `source`, `author`, `published`, `created`, `description`, `tags` (23 clips) | Add `type: input`, `input_kind: clipping`, `status: seed`, `updated`, and `source_url` copied from `source` | Mechanical, at ingest |
| Transcript with `input_kind: transcript` and `related_progress` | Keep; add `updated` | Mechanical |
| A transcript still holding the meeting starter ("Paste the untouched transcript"), in `Videos/` | Delete the instruction; fill `source_url` | Mechanical |
| Transcript or MinerU dump in a course or project folder | Move to `60_Claude/05_Clippings/Videos` or `PDFs` | Judgment, needs a yes |
| A board or index typed `evergreen` (`Clippings board`) | Retype `dashboard` | Mechanical |
## Done Conditions
- The body is byte-identical to what the tool captured.
- The seven keys are present and `source_url` resolves to the origin.
- One summary exists, or the clipping is marked `status: archived` with a reason in `notes`.
- The note passes [[Vault Lint]] for the `clipping` family.
## Gold Standard Example
[[60_Claude/05_Clippings/Web/Claude Council|Claude Council]]: a clipper capture with title, source, description, and a verbatim body. It does not pass lint: it lacks `type`, `input_kind`, `status`, `updated`, and `source_url`, which the Legacy Shapes table adds.
Measured 2026-11-07 with `--family clipping`: 24 notes, 0 pass. 23 share the missing keys above.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| Claude Council (gold) | `60_Claude/05_Clippings/Web/` | Clipper keys intact, body untouched | Five keys |
| L8's Principal's Engineering Workflow Trasncript | `60_Claude/05_Clippings/Videos/` | Has `type` and `input_kind` | `updated`, `source_url`, and a leftover starter instruction in the body |
