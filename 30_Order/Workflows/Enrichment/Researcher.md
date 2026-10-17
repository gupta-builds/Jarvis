---
type: system
status: sprout
created: 2026-09-15
updated: 2026-10-16
tags:
  - system
  - workflow
  - research
system_kind: workflow
serves: "[[Human Writing Standard]]"
trigger: A question needs an answer built from sources, or a topic is new to the vault.
notes:
  - "[[Human Content Writer]]"
  - "[[Capture to Summary]]"
  - "[[Summary to Distilled]]"
---
# Researcher
Answer a question from the vault first, go outside only when asked or when the vault is empty on it, and record where every claim came from.
## Use when
A question or topic needs sourced claims: "what do I know about X", a new concept, a comparison, or a note that needs evidence.
## Steps
1. State the question and the note it will feed, so the result has a destination before the search starts.
2. Search the Claude layer first (`60_Claude/44_Indexes/Claude Layer Index.md`), then the wider vault with the search tools or `jarvis-cli`'s read-only commands. Do not scan folders.
3. Read the few notes that match and answer from them, citing each with a wikilink. These claims are `vault-grounded`.
4. If the vault has nothing, say so plainly. Go external only if the user asked, through the ingestion path: the `ingestion` agent or `/ingest-clipping` lands the raw source in `60_Claude/05_Clippings/`. The `learning-agent` never uses the web for this.
5. Record each outside source with `source_url`, title, and the date read. For a many-source question the `deep-research` skill can coordinate the searching; its output returns here.
6. Label every claim `vault-grounded`, `externally-sourced`, or `uncertain`, and mark inferences as inferred. Set `source_status` on the result to `vault-grounded`, `externally-sourced`, `mixed`, or `uncertain`.
7. Route the result. One source becomes a summary ([[Capture to Summary]]). Several summaries on one idea become a distilled note ([[Summary to Distilled]]). An answer with no lasting value stays in chat.
8. Write any note with [[Human Content Writer]], and offer the `learning-agent` a drill if a concept is worth keeping.
## Do not
Do not answer from general knowledge and present it as vault-grounded. Do not paste a raw source into a durable note. Do not search the web for a vault-only request.
## Done when
- Every claim carries a label and a link or a recorded source.
- The result sits in a note of the right family, or the answer says it is not worth keeping.
