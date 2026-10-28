---
type: project
status: active
created: 2026-10-21
updated: 2026-10-28
tags:
  - project
  - ai
  - conversations
  - conformance
project_kind: spec
next: Re-measure these counts after any exporter change; they come from a script run on 2026-10-21 and will drift.
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Layer|Conversation Layer]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Capture Scripts|Capture Scripts]]"
  - "[[30_Order/Standards/AI Loop/Conversations|Conversations]]"
  - "[[30_Order/Standards/Frontmatter Standard|Frontmatter Standard]]"
  - "[[30_Order/Standards/MOC Standard|MOC Standard]]"
---
# Export Conformance
## What This Is
==Every exported note breaks the Conversations Standard on arrival, because the exporter predates the Standard and nobody has run the migration the Standard describes.==
This sets the Standard's rules for raw exports beside what the Windows exporter writes and what the notes on disk contain. The corpus is 630 notes parsed on 2026-10-21 (Dell 399, Acer 126, legacy `Windows/` 105, with overlaps; see [[20_Progress/Projects/AI Use/Conversations/Legacy Layout and Archives|Legacy Layout and Archives]]), excluding archive folders and generated index files. Cursor notes (78) carry no tokens or cost by design. `Vault Lint` was not run.
## Frontmatter
| Key | Standard asks | Exporter writes | Corpus of 630 |
|---|---|---|---|
| `type`, `input_kind` | `input`, `ai-conversation` | same | as expected in the sample |
| `status` | `seed` | `raw` (exporter line 692) | `raw` on 630, a value the Frontmatter Standard bans |
| `review_state` | `raw` | not written | 0 |
| `created`, `updated` | required dates | not written | 0 |
| `tags` | list, no `#` | list of four words | sample clean; not counted |
| `source_app`, `source_os` | `claude-code`, `windows` | same | `source_os` on 630 |
| `title`, `started_at`, `exported_at` | required | written | present in the sample |
| `project`, `session_id` | required | written | 630 and 630 |
| `ended_at`, `duration_minutes`, `turn_count` | optional | written | present in the sample |
| `cwd` | not named | written | 503 (the 127 without it are mostly Cursor and Cowork notes, unchecked) |
| `tools_used` | optional map | written | map of tool name to count |
| `tokens` | optional map | input, output, cache_creation, cache_read, total | 552 |
| `cost_usd` | optional | number, or `null` for an unpriced model | 552 keys, many null |
| `model`, `files_touched` | optional lists | written | present in the sample |
Cost is null for at least 73 notes whose only model is missing from the price table (`claude-opus-5-5` 14, `claude-sonnet-5-5` 52, `claude-haiku-5-5` 7), and for 6 `claude-sonnet-5` notes that likely mixed in an unpriced model. Costs are published-price estimates, not billing, and the Sonnet 5 rate in the table is the introductory one.
## File encoding
The Frontmatter Standard asks for UTF-8 with no byte-order mark. 351 of the 630 notes start with one. The exporter runs under Windows PowerShell 5.1 and writes with `Set-Content -Encoding UTF8`, which on that version adds a BOM; that is the likely cause and I did not test it. The 279 notes without one probably include the WSL and Cursor exports, which were not checked by source.
## Generated files
`00 - Session Index.md` and `00 - Tool Usage Rollup.md` are typed `index`, with only `type: index` as frontmatter. The Standard and the MOC Standard's legacy table want `type: generated` with `gen_kind: index`. 56 of each exist. 24 of the 56 Session Indexes query a folder other than their own (15 Cursor, 9 other), so they render empty or wrong. Their Dataview `WHERE type = "input"` depends on the note type staying `input`.
## Body
The body follows the Standard: `## You` and `## Claude` per turn, a `### Tool Calls` list, and `## Actions Taken`. The Standard says re-export updates the same note in place, and the exporter does. What the body leaves out, from [[20_Progress/Projects/AI Use/Conversations/Claude Code Session Source|Claude Code Session Source]]: slash-command turns, thinking, system entries, permission mode, tool-result error flags, subagent transcripts. A Bash command spanning several lines is written inside one inline-backtick span, which the Tasks plugin parses as task syntax and warns on.
## Source format
The exporter reads Claude Code's internal transcript JSONL directly. The docs warn that format "changes between versions" and can break scripts "on any release", and recommend `transcript_path`, `/export`, or `claude -p --output-format stream-json`. Tokens are summed from every assistant line's `usage`, and Claude Code writes one API message across several lines. Checked 2026-10-21 on two exported sessions by recomputing with one count per message id and request id: the notes' totals equal the naive sum exactly (16,317,683 against 6,536,644 deduplicated, a factor of 2.5; 721,116 against 323,638, a factor of 2.2). Every `tokens` and `cost_usd` value in the archive should be read as roughly 2 to 3 times too high until the exporter deduplicates. Two sessions is a small sample, and the 630 notes were not each recomputed.
## Naming
Notes are `MM-DD {title}.md`, as the Standard says for Claude Code. Titles come from the last `ai-title` entry, else a slug of the first real human turn. A project folder is the cwd leaf, so a one-off directory creates a one-off project folder.
## Summaries
Five summaries exist; four are Cursor, one is Claude Code. The Standard's summary family needs `source_note`, `decision_count`, `action_count`, and nine headings. The Claude Code summary is the Standard's gold standard example.
## Corrections
**2026-10-28.** The Windows exporter was fixed for notes it writes from now on. Notes already on disk keep their bytes; none was rewritten, so every count above still describes the old corpus. Checked by `scripts/run-all-tests.ps1` (all tests under PowerShell 7 and 5.1) and by exporting two real Acer sessions to a scratch folder, where the token totals matched an independent count exactly.
- *Fixed, new notes only:* `status: seed` with `review_state: raw`, and `created` and `updated` as dates. UTF-8 written without a byte-order mark for notes, markers, and both rollup files. Marker and note-head reads now name UTF-8, so a title with an en dash still finds its own note on re-export. Rollups are `type: generated` with `generator: claude-session-exporter` and `gen_kind: index`. Bash and PowerShell commands are fenced blocks, so the Tasks plugin no longer parses command lines. Fences and inline spans grow past any backtick run in the content, and every line of an Edit diff carries its `-` or `+`.
- *Fixed, new notes only:* prices for `claude-opus-5-5`, `claude-sonnet-5-5`, and `claude-haiku-5-5`. Cache reads on the two 5.5 models cost 0.05 of the input rate, not 0.1, so the old flat multiplier was also wrong for them. The Sonnet 5 rate of $2 and $10 is now the standard price, not an introductory one. Source: the Anthropic pricing page, read 2026-10-28.
- *Fixed earlier, 2026-10-22:* token deduplication by message id and project routing (a session keeps the folder holding its marker). The "2 to 3 times too high" warning under Source format applies to notes written before that date.
- *Still open:* the old notes (BOM, `status: raw`, no `created` or `updated`, inflated tokens, null costs, old rollup types). The Legacy Shapes migration has not run. The WSL exporter still writes `status: raw` with no `review_state`, `created`, or `updated`, rollups typed `dashboard`, no prices for the three 5.5 models, and a flat 0.1 cache-read rate.
- *Still open, found while fixing:* Haiku 5.5 over 100,000 prompt tokens is billed at higher rates and is not priced; `claude-fable-5-1` has no table entry and gets a null cost; the command in a Bash or PowerShell call line and in the `Commands run` list is not passed through `Redact-Secrets`.
## Non-Goals
This is a measurement, not a migration. Nothing was rewritten. The Legacy Shapes table in the Standard names the mechanical fixes; they stay unrun until the Standard is final.
