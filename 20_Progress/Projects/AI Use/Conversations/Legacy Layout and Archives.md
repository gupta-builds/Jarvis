---
type: project
status: active
created: 2026-10-21
updated: 2026-10-28
tags:
  - project
  - ai
  - conversations
  - legacy
project_kind: spec
next: Decide whether the legacy Windows trees are retired, then use the duplicate list in the postmortem to pick which copy survives.
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Layer|Conversation Layer]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Layer Postmortem|Conversation Layer Postmortem]]"
  - "[[60_Claude/05_Clippings/AI Conversations/README|AI Conversations README]]"
  - "[[30_Order/Standards/AI Loop/Conversations|Conversations]]"
---
# Legacy Layout and Archives
## What This Is
==The archive holds three layouts at once: the machine-first tree that new exports use, the older `Windows/` tree that old markers still protect, and 14 `_archive-pre-fix` folders from two rewrites.==
The live tree is authoritative, as the README says. This note records what sits outside it, so a count of "sessions" is not read as a count of distinct work. Measured 2026-10-21.
## The live layout
`<Machine>/<OS>/<Tool>/<Project>/`, with Machine `Dell` or `Acer`, OS `Windows` or `WSL`, Tool `Claude` (Claude Code, with Cowork inside it on Windows) or `Cursor`, and Project the cwd leaf. Rolled out 2026-10-17 in Build 5c; the Dell had the same shape from the 10-08 reorganization.
## The legacy `Windows/` tree
| Folder | Notes | Also under |
|---|---|---|
| `Windows/Claude Code/Home` | 7 | no copy elsewhere |
| `Windows/Claude Code/Jarvis` | 34 | `Dell/Windows/Claude/Jarvis` (all 34) |
| `Windows/Claude Code/The Plan` | 1 | no copy elsewhere |
| `Windows/Claude Code/Unknown` | 0 | empty |
| `Windows/Cowork/2026-06` | 43 | `Dell/Windows/Claude/Cowork/2026-06` |
| `Windows/Cowork/2026-07` | 20 | `Dell/Windows/Claude/Cowork/2026-07` |
The exporter does not write here. It reads the `.exported` markers here so a session already exported is not exported again. The tree was left in place when the Dell copy was made. Every Cowork note and all 34 Jarvis notes here have a Dell copy, but the 7 Home notes and the 1 The Plan note exist only here, so deleting the tree wholesale would lose 8 sessions.
## Duplicates by `session_id`
630 parsed notes hold 523 distinct sessions, so 107 notes repeat one that exists elsewhere.

| Where the copies sit | Sessions |
|---|---|
| `Dell/Windows/Claude` and the legacy Cowork tree | 62 |
| `Dell/Windows/Claude` and the legacy Claude Code tree | 34 |
| `Dell/Windows/Claude` and both legacy trees (three copies) | 1 |
| Two project folders inside `Dell/WSL/Claude` | 6 |
| Two project folders inside `Acer/Windows/Claude` | 3 |
The first three rows come from the Dell copy and the older tree both surviving. The last two rows have a different cause that I have not confirmed: one session recorded under two project names, possibly because its cwd changed mid-session. The Standard's Legacy Shapes table covers the first case ("keep the later `exported_at`, flag the other, judgment") and not the second.
## The 14 archive folders
`_archive-pre-fix` holds notes from before the 2026-07-30 rewrite, `_archive-pre-fix-2` from before the 2026-07-31 rewrite. 141 notes in total, excluded from the 630 above.

| Folder | Notes |
|---|---|
| `Dell/Windows/Claude/Cowork/_archive-pre-fix` | 63 |
| `Dell/Windows/Claude/_archive-pre-fix` | 23 |
| `Dell/WSL/Claude/CausalOps/_archive-pre-fix-2` | 14 |
| `Dell/WSL/Claude/portfolio/_archive-pre-fix-2` | 11 |
| `Dell/WSL/Claude/tradingview/_archive-pre-fix-2` | 9 |
| `Dell/WSL/Claude/internship-research-loop/_archive-pre-fix-2` | 7 |
| `Dell/WSL/Claude/portfolio/_archive-pre-fix` | 4 |
| `Dell/WSL/Claude/CausalOps/_archive-pre-fix` | 3 |
| `Dell/Windows/Cursor/_archive-pre-fix` | 3 |
| `Dell/WSL/Claude/second-brain-claudekit/_archive-pre-fix-2` | 2 |
| `Dell/WSL/Claude/gupta-builds/_archive-pre-fix-2` | 1 |
| `Dell/WSL/Cursor/_archive-pre-fix` | 1 |
| `Dell/WSL/Claude/ecc/_archive-pre-fix-2`, `everything-claude-code/_archive-pre-fix-2` | 0 |
They were archived, not deleted, and have not been compared with the live notes for the same sessions.
## Empty and stray folders
- Empty scaffolds on the Acer only: `Acer/WSL/{AGY,Codex,Cursor,Kiro,Local}` and `Acer/Windows/{AGY,Codex,Kiro,Local}`, with an empty `Home` under `Acer/Windows/AGY`, `Acer/Windows/Codex`, and `Acer/WSL/Claude`. The Dell has none of them.
- Empty on the Dell: `Dell/WSL/Claude/{capture-test,ecc,everything-claude-code}`, `Dell/Windows/Claude/Unknown`, `Dell/Windows/Cursor/Home`.
- One-off project folders created by the cwd rule on the Acer: `Code`, `CSCI 5304`, `csci4061-fa26`, `denytest` (a permissions test), `Jesse`, `Plans`, `sync-workflow`, each with one or two notes.
- Documented but never created: the README still lists `Claude App/` and `OpenCode/`.
## Backup copies that share live names
`40_Resources/CS/Concepts/New Laptop/Old Laptop Rebuild/Runs/_backups/acer-5c-20261017/` holds copies of notes that Build 5c edited, including `Conversation Capture.md` and `log.md`, under their live file names. A bare `[[Conversation Capture]]` link therefore matches two files, which is why several conversation notes in this layer use path-qualified links.
## Corrections
**2026-10-28.** The Acer tree under `Acer/Windows/Claude` was reorganized, and the stray-folder and duplicate findings above no longer describe it. It now holds five project folders: `Jarvis` (83 notes), `The Plan` (20), `Home` (17), `UMN Courses` (5), and `Scratch` (1), chosen by `capture-projects.json` (rules in [[20_Progress/Projects/AI Use/Conversations/Capture Registration|Capture Registration]]). The seven one-off folders (`Code`, `CSCI 5304`, `csci4061-fa26`, `denytest`, `Jesse`, `Plans`, `sync-workflow`) are gone from the vault, and the four Acer sessions that had two notes now have one.
- *Where things went:* nothing was deleted. Retired folders, the older copy of each duplicate, and the two notes replaced by regeneration are in `D:\_Anant\99_Archive\Acer Conversation Reroute 2026-10-22`, with a SHA-256 `MANIFEST.csv` of 36 rows (8 files moved inside the vault, 28 archived). Four notes whose transcripts were already swept moved to the right folder with their `project:` line rewritten; a pre-edit copy is in the archive's `moved-originals` folder.
- *Regenerated:* the 103 sessions with a live transcript and an assistant turn were re-rendered with `export-claude-session.ps1 -BackfillAll -Force` in the finished format. The 23 notes whose transcripts are gone kept their old bytes and still lack `review_state`.
- *Not changed:* the legacy `Windows/` trees, the `_archive-pre-fix` folders, and everything under `Dell/`. The exporter and `capture-projects.json` sit in the vault folder both laptops share, so the Dell receives them through Syncthing; a Dell note exported at 21:30 on 2026-10-28 already carries `review_state: raw`. Whether the Dell holds the routing file and what its `Home`, `UMN Courses` and `Scratch` paths resolve to was not checked on the Dell. How the scripts work: [[20_Progress/Projects/AI Use/Conversations/Capture Scripts|Capture Scripts]].
## Non-Goals
This does not recommend which copy to keep or whether to delete the archives. It does not cover the files inside `_raw_jsonl`.
