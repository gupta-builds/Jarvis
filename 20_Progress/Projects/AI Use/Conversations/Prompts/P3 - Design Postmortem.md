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
task: design-postmortem
model: claude-opus-5-5
---
# P3 - Design Postmortem
Paste into a fresh Claude Code session started in the Jarvis vault: `Read and run 20_Progress/Projects/AI Use/Conversations/Prompts/P3 - Design Postmortem.md. Follow Hard Rules and Report Back exactly.`
## Why This Exists
[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]] is locked pending a stress test, and its `next` says to write one before any loop build starts (P0 to P2 are repairs and do not wait for it). The test is one finding per layer, L0 to L5, each stressed against the audit evidence, ending in keep, change, or cut. It sits beside the first postmortem as `review_kind: audit`.
- **Seed findings from the 2026-10-22 context pass.** These are leads, not conclusions. Check each against the live docs, the audit, and the machine, and cite what you find. Drop any that do not hold.
  1. [[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]] says the events folder is "already ignored by git and Syncthing". `.gitignore` and `.stignore` list specific log file names only, so a new `events-*.jsonl` would be tracked.
  2. Hooks matching an event run in parallel, and `PostToolUse` fires concurrently for parallel tool calls, so many processes append to one JSONL file at once.
  3. `prompt_id` is documented as absent until the first user input, and subagent hooks carry `agent_id`. The design keys everything on `prompt_id` alone.
  4. `transcript_path` may lag the live turn. Any step that folds a record from the transcript at `Stop` time can be one turn stale.
  5. Headless runs (`claude -p`, the `sdk-cli` entries, including the weekly review) kill async hooks at teardown. Events from those sessions would be lost.
  6. `history.jsonl` counts typed prompts including slash commands. `UserPromptSubmit` and `UserPromptExpansion` are separate events. The coverage line may never reach 100%.
  7. The weekly note's home in [[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]] (`30_Reviews/AI/Conversations/`) conflicts with the Note Type Registry and [[30_Order/Standards/AI Loop/Review System|Review System]] (`30_Reviews/AI/Scheduled/Weekly/` from the AI Weekly Review Template, eight fixed headings).
  8. Nothing schedules the digest or tells the owner a review is due, and Review System says "nothing runs on its own". The design has no scheduler and no end-to-end test.
  9. `agent_lines_kept_7d` needs a git-blame replay against commits. High cost, and the weekly output check (step 7) can be done by hand on five files.
  10. Global hooks fire in every project, including The Plan, which holds personal-life content that Jarvis rules keep out of this vault. Events from those sessions would put prompt text in Jarvis logs.
  11. The digest syncs between laptops, so it must carry ids and links, not prompt text.
- **Owner decisions 2026-10-22:** the human does the weekly blind pass and the local model flags afterward; events stay per machine; retention is 60 days on the Acer; the Dell is repo-conversations only and comes later; skills live in the Jarvis `.claude/` only; the Acer tree is fresh and is the test bed.
- **Verified inputs to read, not to restate:** [[20_Progress/Projects/AI Use/Conversations/Machine Audit 2026-10-22|Machine Audit]], [[20_Progress/Projects/AI Use/Conversations/Conversation Layer Postmortem|Conversation Layer Postmortem]], [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Sources|Conversation Loop Sources]], the Report Back of P0, P1, and P2.
## Hard Rules
- Scope is the design and the Acer. Do not build anything and do not change any script, hook, or setting.
- Do not edit `30_Order/Standards`, `Templates`, or `Workflows`.
- Never read or print `.credentials.json`, `.env*`, tokens, `history.jsonl` text, or transcript text.
- Do not write the postmortem from memory of the design. Every finding cites a file, a line, a count, or a documented sentence opened this session. A source not opened is listed as not reviewed.
- Search before creating. Write only the files named below. Nothing at the vault root. Do not run `git commit`.
- After any vault write, search for `.sync-conflict-*` copies and restore corrected text.
- Notes: no em dashes, no blank line after a heading, path-qualified wikilinks, patch by heading. Follow [[30_Order/Standards/AI Loop/Review System|Review System]] rules: reviews do not fix, Open Questions carry.
- Do not change the body of the Design. Corrections go in a dated `## Corrections` layer that keeps the original.
- Do not set the status of this prompt to `complete`.
## Implementation Order
1. Read the Design, the Build Plan, and the inputs above. Re-check the hook payload fields the design relies on against `https://code.claude.com/docs/en/hooks.md`. The agent `claude-code-guide` may do that read.
2. Read the Audit Report Standard and its template in the Note Type Registry (`audit-report`) and use that shape.
3. Write `20_Progress/Projects/AI Use/Conversations/Conversation Loop Design Postmortem.md` with `type: review`, `review_kind: audit`, `status: sprout`. One finding per layer (L0 Capture, L1 Digest, L2 Local reviewer, L3 Weekly review, L4 Monthly review, L5 `/insights`), plus three cross-cutting findings: scheduling and nudge, test and acceptance, scope and privacy. Each finding has how it could fail, the evidence, and a decision: keep, change, or cut.
4. Add a dated `## Corrections` entry to the Design and the Build Plan for every change or cut, and update the Build Plan's order if a decision reorders it. Update the hub's `next` and Open Questions.
5. If any decision needs the owner, put it in Open Questions as a `- [ ]` task and say so first in Report Back.
## Report Back
- A table of the nine findings with their decision.
- Which seed findings held, which did not, and why.
- The notes you patched, with the heading changed in each.
- Decisions the owner must make, and whether P4 through P9 need changes.
## What Not To Do
- Do not bless the design. A finding with no way to fail is not a finding.
- Do not turn a cut into a rewrite of the Design.
- Do not start P4.
## Related Notes
[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]], [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Build Plan|Build Plan]], [[20_Progress/Projects/AI Use/Conversations/Conversation Layer Postmortem|Conversation Layer Postmortem]].
