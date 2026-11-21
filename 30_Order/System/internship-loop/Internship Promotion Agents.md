---
type: system
status: sprout
created: 2026-11-21
updated: 2026-11-21
tags:
  - system
  - tooling
  - internship
system_kind: spec
trigger: Started by Anant in a Claude Code session, with a consent gate before any write: /promote-dossier, /promote-manual-find, and the agents promotion, program-writer, tracking, contact-researcher and applying.
owner: Anant, who answers every consent gate and notices a wrong note.
notes:
  - "[[Program Standard]]"
  - "[[Contact Standard]]"
  - "[[Internship Tracker Standard]]"
  - "[[Loop Contract Change]]"
---
# Internship Promotion Agents
## Purpose
The skills and agents in the loop repo's `.claude/` that write Program, Contact, Tracker and Applying notes into the vault, one at a time, after Anant says yes. Without them those notes are written by hand. Checked 2026-11-21: `.claude/agents` holds `applying`, `contact-researcher`, `cover-letter-builder`, `loop-verifier`, `program-writer`, `promotion`, `testing-tools` and `tracking`; the skills include `promote-dossier` and `promoting-manual-find`. Batch creation of notes is not built, so tier 2 Program and Contact notes are made one at a time with `/promote-dossier`. The `applying` agent refuses to draft until `Main Resume.md` and `Main Cover Letter.md` are real.
## Trigger
On demand, from a Claude Code session in the loop repo or the vault. No schedule and no hook starts them. They reach the vault through the `jarvis` MCP tools or a sibling checkout, as the repo's `.claude/rules/jarvis.md` says.
## Inputs and Outputs
Reads a dossier in `10_Areas/Career/Internships/List/Dossiers/`, the vault Standards, and public sources for contact signal. Writes notes of the families `internship-program`, `internship-contact`, `internship-tracker` and `internship-applying`. The field lists they copy live in the loop repo's `CLAUDE.md` and `.claude/skills/promote-dossier/reference/note-templates.md`, and they disagree with the Standards: the `tracking` agent still creates the Tracker at promotion into `Tracker/Each One/Current/`, while the Tracker Standard now says at submission into `Applied/`. The `jarvis-internship-note-guard.ps1` hook, in `30_Order/System/claude-workflow/hooks/`, reports a missing key after any write into these folders.
## State
None of their own. The hook appends one line per write to `30_Order/System/claude-workflow/logs/internship-note-guard.jsonl`, which the root `.gitignore` ignores. `contact-researcher` keeps a local cache under `.claude/agent-memory-local/`, ignored by the loop repo.
## Failure Behavior
A write happens only after the consent gate. `contact-researcher` reports "nothing found" and never invents a person. The hook fails open and only reports. No secret is used by these agents themselves; they depend on the `jarvis` MCP server being reachable, which failed with a 401 on 2026-09-12 per the Build Log. A wrong field list is a silent failure until the hook reports it, which is why [[Loop Contract Change]] exists.
## Verify
Run the hook against a real note and read its output; on 2026-11-21 it listed exactly the Spec's missing keys for each family, for example `type`, `reference_kind`, `status`, `created`, `updated` on `2027-Nuro-AI-Platform-SWE`.
```powershell
$p = @{ tool_name = 'Write'; tool_input = @{ file_path = '<absolute path of one note>' } } | ConvertTo-Json -Compress
$p | pwsh -NoProfile -File 30_Order/System/claude-workflow/hooks/jarvis-internship-note-guard.ps1
```
## Retire
Delete the agent and skill files in the loop repo and the hook's entry in the project `.claude/settings.json`, in one commit that states the reason. Notes already written stay in the vault.
