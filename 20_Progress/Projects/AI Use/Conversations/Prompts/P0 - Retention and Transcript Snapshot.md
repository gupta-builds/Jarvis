---
type: project
status: active
created: 2026-10-22
updated: 2026-10-22
tags:
  - project
  - ai
  - conversations
  - prompt
project_kind: prompt
task: retention-and-snapshot
model: claude-sonnet-5-5
---
# P0 - Retention and Transcript Snapshot
Run by Sonnet 5.5 inside the directory: `. `
Follow this prompting guide to lay it out correctly: `https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-sonnet-5-5`
## Prompt - 
````
## Why This Exists
Claude Code deletes raw transcripts after 30 days by default, and every day it runs it removes one more day of this machine's history. Everything the loop reads later (`/insights`, the digest's context sizes, a re-export) needs those files. This is build B0 in [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Build Plan|Build Plan]], moved to the front because it is the only build that stops a loss already in progress.
- **Verified 2026-10-22:** `cleanupPeriodDays` is absent from `C:\Users\anant\.claude\settings.json` (grep). The oldest top-level transcript is dated 2026-09-24 and moves forward daily. `.last-cleanup` is rewritten by each sweep.
- **Verified in the docs 2026-10-21 and 22:** default 30 days; the sweep also removes subagent files, tool results, file history, and `usage-data/` (the `/insights` reports); it keeps `history.jsonl`.
- **Conflicting evidence:** the docs reject `0`, but a public GitHub issue reports that `0` stopped transcripts being written at all. Treat `0` as dangerous and never use it.
- **Owner decision 2026-10-22:** 60 days on the Acer, which covers the whole working life of this laptop (notes start 2026-09-17). The Dell is decided separately in build B9.
- **Measured:** `~/.claude/projects` is about 606 MB at 30 days ([[20_Progress/Projects/AI Use/Conversations/Machine Audit 2026-10-22|Machine Audit]]), so about 1.2 GB at 60 days, on the C: drive.
- **Assumed, verify:** the sweep runs at session startup, so the new value takes effect at the next startup, not instantly.
## Hard Rules
- Scope is the Acer, Windows side, Claude Code only. Do not touch WSL, the Dell, Cowork, Cursor, Codex, or `.obsidian/`.
- Do not edit `30_Order/Standards`, `Templates`, or `Workflows`. Scripts and hooks under `30_Order/System/claude-workflow/` are the build surface.
- Never read or print `.credentials.json`, `.env*`, tokens, `history.jsonl` text, or transcript text. Count lines and bytes only.
- Search before creating. Write only the files named below. Scratch work goes to the session scratchpad. Nothing at the vault root.
- Do not run `git commit` or `git push`. `Jarvis-GitAutoSync` commits every 30 minutes and is the only git writer.
- After any vault write, search for `.sync-conflict-*` copies of the files you wrote and restore the corrected text if one exists.
- Notes: no em dashes, no blank line after a heading, path-qualified wikilinks, patch by heading, update `updated:`.
- Change exactly one key in `settings.json`, with a targeted edit, never a rewrite of the file. Back it up to the scratchpad first.
- Delete nothing in `~/.claude`, including the stray `.statusline-ratelimit-cache.json.tmp.*` files. Report only.
- Do not set the status of this prompt to `complete`. The owner does that after reviewing Report Back.
## Implementation Order
1. Record the before-state: oldest and newest top-level transcript date, transcript count, the contents of `.last-cleanup`, size of `~/.claude/projects`, free space on C: and D:.
2. Snapshot the live transcripts outside the vault: `robocopy "$env:USERPROFILE\.claude\projects" "D:\_Anant\99_Archive\Claude Transcript Snapshot 2026-10-22" /E /XD tool-results file-history`. Confirm file count and total bytes match the source. The folder is outside the vault, so it is not synced.
3. Copy `settings.json` to the scratchpad. Add `"cleanupPeriodDays": 60` as a top-level key with one Edit. Parse the result with `ConvertFrom-Json`, and confirm the set of other keys is unchanged.
4. Read only the block of `~/.claude/statusline.sh` that writes `.statusline-ratelimit-cache.json.tmp.*` (111 stray files, 18 zero bytes). Report why the rename fails and propose a fix. Do not edit the script or delete files.
5. Write the verification one-liner for the owner to run after the next session start: it prints the oldest transcript date, which must not be later than the before-state, and the new `.last-cleanup` value. Do not claim verified; say pending.
## Report Back
- The before/after table from step 1 and the snapshot counts from step 2.
- The key-set diff of `settings.json` (one key added) and the backup path.
- The statusline finding and proposed fix.
- The verification one-liner, marked pending, and the date it should be run.
- Anything not done, and anything that surprised you.
## What Not To Do
- Do not set `0` or any value under 45.
- Do not regenerate `settings.json` from a parsed object, which can reorder or drop keys.
- Do not treat the snapshot as the retention fix. It is a one-time safety copy.
## Related Notes
[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Build Plan|Build Plan]], [[20_Progress/Projects/AI Use/Conversations/Machine Audit 2026-10-22|Machine Audit 2026-10-22]], [[20_Progress/Projects/AI Use/Conversations/Claude Code Session Source|Claude Code Session Source]].
````