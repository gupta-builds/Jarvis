---
type: review
status: seed
created: 2026-11-07
updated: 2026-11-07
tags:
  - review
  - ai-tools
review_kind: weekly
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Intervention Ledger|Intervention Ledger]]"
next: "Blind pass: read each sampled prompt on the sheet, write the first thing that went wrong in your own words, code it. Do not open the key."
---
# AI Tools Weekly Review - 2026-W43
## Period Covered
2026-10-19 (Monday) through 2026-10-25 (Sunday), ISO week 2026-W43, a complete calendar week. Acer notes only, chosen by `started_at` (local time) from all six folders under `60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/` (Jarvis, The Plan, Home, UMN Courses, Scratch, Unknown). The dates were confirmed by a calendar calculation on 2026-11-07.
Frame:
- 15 session notes: Jarvis 13, Home 1, The Plan 1. Scratch, UMN Courses and Unknown hold none this week.
- 153 turns by the sum of `turn_count`. That field counts `## You` plus `## Claude` sections, so it is not a count of typed prompts.
- 87 `## You` sections: 10 are slash-command markup, 6 are injected task notifications, 71 are typed prompts.
- 56 Stop events in the activity log. By day: 10-19 13, 10-20 1, 10-21 14, 10-22 10, 10-23 13, 10-25 5, none on 10-24.
Frame check: the 2026-10-30 verification gave 14 notes and 138 turns. The notes now give 15 and 153. The extra note started on 10-25 and was exported on 2026-11-04, after that check. Without it the other 14 notes sum to 126 turns, not 138, and the 12-turn gap is unexplained (see Open Questions).
## Sources Reviewed
Opened this pass:
- [x] The 15 session notes in the six folders above, read by script for structure (section headings, tool-call lists, sizes). Prompt text was used only to compute the flag rules and was never printed or read by me.
- [x] `C:\Users\anant\.claude\jarvis-session-activity.jsonl`, counted by event with the byte-order mark stripped (Stop and SessionEnd for this week).

Not opened: the Tool log, both `Sync-Log.md` files, the Claude Kit Log, and any digest (none exists yet). `history.jsonl` stays closed by rule.

Sample sheet. 25 prompts in one shuffled list. To find one, paste its session id into Obsidian search. Turn N is the Nth `## You` heading in that note, counting slash-command markup. Read the prompt and what Claude did, then write one or two sentences about the first thing that went wrong and assign codes from the [[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]]. Put your notes in Findings. Do not name, quote or paraphrase the prompt. Allow 15 to 20 minutes and write down the start and end time. Do not open the key below until your notes are written.

| # | Session id | Turn |
|---|---|---|
| 1 | 5f49feca-0111-4148-9a2d-a1762c529116 | 1 |
| 2 | c444e1cb-b1fd-4c4e-a3c6-55f5d4180bcd | 16 |
| 3 | 347b4ad6-7080-4cb8-80e4-ec6fe2db5e3a | 1 |
| 4 | c444e1cb-b1fd-4c4e-a3c6-55f5d4180bcd | 15 |
| 5 | a89d5721-ad89-4818-92ab-7e5878fb7e94 | 1 |
| 6 | 27ce02c5-1ff0-4ea5-8ce6-ea96493f43b7 | 4 |
| 7 | c444e1cb-b1fd-4c4e-a3c6-55f5d4180bcd | 11 |
| 8 | 386009d6-8935-488f-b28f-dba43cbb7562 | 1 |
| 9 | ece45872-bf03-496d-9562-1a214203ed3d | 1 |
| 10 | c444e1cb-b1fd-4c4e-a3c6-55f5d4180bcd | 13 |
| 11 | a8711819-664b-4922-952b-4190546bfc01 | 1 |
| 12 | 8dd06cb4-7eae-4aa4-b321-1d131b9bb8f9 | 4 |
| 13 | 27ce02c5-1ff0-4ea5-8ce6-ea96493f43b7 | 9 |
| 14 | a8711819-664b-4922-952b-4190546bfc01 | 2 |
| 15 | 0d05cbdb-2e2e-4069-b1e1-f61b06e23026 | 2 |
| 16 | c444e1cb-b1fd-4c4e-a3c6-55f5d4180bcd | 9 |
| 17 | ece45872-bf03-496d-9562-1a214203ed3d | 3 |
| 18 | 6d181994-d9a9-4c34-83f3-121483af5faa | 2 |
| 19 | ece45872-bf03-496d-9562-1a214203ed3d | 4 |
| 20 | c444e1cb-b1fd-4c4e-a3c6-55f5d4180bcd | 6 |
| 21 | 386009d6-8935-488f-b28f-dba43cbb7562 | 8 |
| 22 | a8711819-664b-4922-952b-4190546bfc01 | 5 |
| 23 | 8e752096-5c56-48a9-86d5-2255b709648e | 2 |
| 24 | a8711819-664b-4922-952b-4190546bfc01 | 3 |
| 25 | 8e752096-5c56-48a9-86d5-2255b709648e | 4 |

> [!info]- Key, open after your notes
> Do not open this until step 6 of the protocol, after your own notes are written.
> - Seed: 20261043, .NET `System.Random(seed)`. Pool: the 71 typed prompts, sorted by session id then turn, shuffled once (Fisher-Yates). The first 10 are the random draw.
> - Flagged: 30 of the remaining 61 prompts met at least one rule. They were ranked by number of rules met, ties by the shuffle order, and the top 15 were taken. The final 25 were shuffled with the same generator.
> - Rules, all computed from the notes: (1) the next typed prompt in the same note starts with no, nope, don't, dont, do not, wrong or "not what"; (2) the prompt is in the top tenth by size in its note (the notes carry no per-turn tokens, so size is the characters of the prompt, the reply and its tool output, and the count is the top ceil(n/10) typed prompts of each note); (3) the reply contains done, passes, passed, complete, completed or finished, and no Bash or PowerShell call follows its last Edit, Write, MultiEdit or NotebookEdit; (4) the reply has the most tool calls in its note.
> - A reply is attributed to the last `## You` before it. A prompt followed directly by another prompt has no reply of its own.
> - Random draw: 10 rows. 3 of them also met at least one flag rule.
> - Flagged: 15 rows.
> - Rule hits across the sheet (a row can meet more than one):
> - most tool calls in its session : 12 of the 25 rows
> - says done, no Bash or PowerShell after last Edit or Write : 16 of the 25 rows
> - top tenth by size in its note : 11 of the 25 rows
>
> | # | Origin | Rules met |
> |---|---|---|
> | 1 | flagged | top tenth by size in its note; says done, no Bash or PowerShell after last Edit or Write; most tool calls in its session |
> | 2 | flagged | top tenth by size in its note; says done, no Bash or PowerShell after last Edit or Write |
> | 3 | random | top tenth by size in its note; says done, no Bash or PowerShell after last Edit or Write; most tool calls in its session |
> | 4 | flagged | says done, no Bash or PowerShell after last Edit or Write |
> | 5 | flagged | top tenth by size in its note; most tool calls in its session |
> | 6 | flagged | says done, no Bash or PowerShell after last Edit or Write; most tool calls in its session |
> | 7 | random | none |
> | 8 | flagged | top tenth by size in its note; says done, no Bash or PowerShell after last Edit or Write; most tool calls in its session |
> | 9 | flagged | top tenth by size in its note; says done, no Bash or PowerShell after last Edit or Write; most tool calls in its session |
> | 10 | random | none |
> | 11 | random | none |
> | 12 | flagged | top tenth by size in its note; most tool calls in its session |
> | 13 | random | none |
> | 14 | flagged | says done, no Bash or PowerShell after last Edit or Write |
> | 15 | flagged | top tenth by size in its note; says done, no Bash or PowerShell after last Edit or Write; most tool calls in its session |
> | 16 | flagged | says done, no Bash or PowerShell after last Edit or Write; most tool calls in its session |
> | 17 | random | none |
> | 18 | flagged | top tenth by size in its note; says done, no Bash or PowerShell after last Edit or Write; most tool calls in its session |
> | 19 | random | says done, no Bash or PowerShell after last Edit or Write |
> | 20 | random | none |
> | 21 | random | none |
> | 22 | flagged | says done, no Bash or PowerShell after last Edit or Write; most tool calls in its session |
> | 23 | random | says done, no Bash or PowerShell after last Edit or Write; most tool calls in its session |
> | 24 | flagged | top tenth by size in its note; says done, no Bash or PowerShell after last Edit or Write |
> | 25 | flagged | top tenth by size in its note; says done, no Bash or PowerShell after last Edit or Write |
## What Ran This Period
Pending (protocol step 7).
## Sync & Capture Health
Pending (protocol step 7).
## Findings
Pending. The owner's first-failure notes and codes go here as written, before anything else is added (protocol steps 5 and 6).
## Decided Fixes
Pending (protocol step 9, once, after the last week).
## Open Questions
- [ ] Where do the 12 missing turns come from? The 2026-10-30 check reported 14 notes and 138 turns for this week, and the 14 notes that existed then sum to 126 now.
- [ ] Minutes per step and whether the blind pass felt too long (step 10).
## Next Period's Watch List
Pending.
