---
type: system
status: sprout
created: 2026-05-31
updated: 2026-10-16
tags:
  - system
  - workflow
system_kind: workflow
serves: "[[Source Summary Standard]]"
trigger: A clipping, PDF, web page, or video is worth keeping but too noisy to act on.
notes:
  - "[[Clipping Standard]]"
  - "[[Repo Evaluation Standard]]"
  - "[[PDF Extraction]]"
---
# Capture to Summary
Turn one raw source into one summary that replaces it: raw stays raw, the summary carries the claims.
## Use when
A source sits in `60_Claude/05_Clippings/` (`Web`, `Videos`, `PDFs`) and has no summary yet.
## Steps
1. Confirm the raw source is in `05_Clippings/` with its frontmatter complete ([[Clipping Standard]]). Pasted text with no home goes there first. Never edit the body.
2. For a PDF, extract clean text first with [[PDF Extraction]].
3. Search `10_Source_Summaries/` for an existing summary of this source and extend it instead.
4. Copy [[Clipping Distill Template]] into the matching folder: `PDF Ingestion/Read/`, `Web Ingestion/`, or `Video Ingestion/`. A GitHub repo uses [[Repo Evaluation Template]] in `Github Ingestion/` instead.
5. Write it from [[Source Summary Standard]]: the source line, every key claim, the full content in the source's order, and why it matters here.
6. Label the strength of each claim. Say when the source is weak, partial, or one person's opinion, and mark your own inference as inferred.
7. Wikilink the clipping and any existing concept or project the source touches. Write missing targets in the body as `(to create)`.
8. Add the flashcards last, and a `- [ ]` under Open Questions if any claim deserves a distilled note.
9. Run [[Vault Lint]] on the path and add one line to the session log.
## Do not
Do not edit the clipping, write cards from the raw clip, or use this template for a repository.
## Done when
- Reopening the source reveals nothing the summary lacks.
- The clipping is unchanged and the summary links to it.
- The note passes lint for `source-summary` and the log has its line.
