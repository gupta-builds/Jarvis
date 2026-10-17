---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
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
This is the standard for raw captures in `60_Claude/05_Clippings/Web`, `Videos`, and `PDFs`: web pages from the clipper, video transcripts, and PDFs waiting to be summarized. AI conversation exports have their own standard in [[Conversations]]. A clipping is read, summarized by [[Source Summary Standard]], and left alone.
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
## Headings
The body is the source. No headings are required and none are added.
### Frontmatter
`type: input`, `input_kind` (`clipping` for a page or PDF, `transcript` for spoken text), `status: seed`, `created`, `updated`, `tags`, and `source_url`. Keep the clipper's own keys (`title`, `source`, `author`, `published`, `description`). `review_state: raw` is optional.
*Density:* seven keys beyond what the clipper writes.
> [!WARNING]
> A clipping with the clipper's keys and no `type`. 23 of 24 web clips have exactly that, so no query finds them.
### Completing keys
The capture tool should write the keys. A clip that lacks them is completed once, at ingest, by `/ingest-clipping`, copying `source` into `source_url`. That one frontmatter change is the only edit after capture.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| Clipper keys only (`title`, `source`, `author`, `published`, `created`, `description`, `tags`) | Add `type: input`, `input_kind: clipping`, `status: seed`, `updated`, and `source_url` copied from `source` | mechanical, at ingest |
| Transcript with `input_kind: transcript` and `related_progress` | Keep; add `updated` | mechanical |
| Transcript or MinerU dump in a course or project folder | Move to `60_Claude/05_Clippings/Videos` or `PDFs` | judgment, needs a yes |
| A board or index typed `evergreen` (`Clippings board`) | Retype `dashboard` | mechanical |
## Done Conditions
- The body is byte-identical to what the tool captured.
- The seven keys are present and `source_url` resolves to the origin.
- One summary exists, or the clipping is marked `status: archived` with a reason in `notes`.
## Gold Standard Example
[[60_Claude/05_Clippings/Web/Claude Council|Claude Council]]: a clipper capture with title, source, author, and description intact. It lacks `type` and `input_kind`, which the Legacy Shapes table adds.
