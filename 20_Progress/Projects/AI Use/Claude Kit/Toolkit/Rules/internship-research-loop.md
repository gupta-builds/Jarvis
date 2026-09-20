---
type: evergreen
status: sprout
created: 2026-09-06
updated: 2026-09-06
tags:
  - claude-kit
  - rules
  - internship-research-loop
notes: []
next: null
---
# internship-research-loop — Rules

Real inventory of `.claude/rules/` in `gupta-builds/internship-research-loop`, all 5 files read directly this session. Every file here is a deliberately thin pointer or a narrowly-scoped addition — this project's own `CLAUDE.md` states the reason directly: "none restates content that already lives somewhere else, per the Jarvis vault build standard's anti-duplication principle." Worth reading that way — a short file here is not an unfinished one. No links out from this note on purpose — this project's Toolkit layer is still being built out.

## internship-loop.md

**File:** `.claude/rules/internship-loop.md`

The thinnest of the five, and deliberately so: a pointer to `CLAUDE.md`'s own "Conventions this codebase enforces" section (the same four load-bearing conventions cited throughout the Skills/Agents/Hooks notes — zero-LLM unattended path, permissive-by-default filtering, fail-closed write-gate ordering, cited-real-data rule comments), explicitly **not** restated here. Its own last line names which two tools mechanically check these: `/review-loop-change` checks a diff against all four; `testing-tools` checks new tests against the fourth (cited real data) specifically.

**Why this rule exists at all if it just points elsewhere:** the always-loaded `rules/` mechanism means this content is reinforced on every session start without a human having to remember to go read `CLAUDE.md` — the pointer earns its place by being always-on, not by adding new information.

## jarvis.md

**File:** `.claude/rules/jarvis.md`

The vault-reachability check every vault-writing agent/skill needs, stated once instead of five times across `program-writer`, `tracking`, `promotion`, `applying`, `/promote-dossier`, `/promote-manual-find`, and `/tailoring-application`. Names exactly two legitimate ways to reach the Jarvis vault — a sibling git checkout (the layout `run_pipeline.py`'s own `JARVIS_DIR` env var and CI's `jarvis-checkout/` already expect) or the `jarvis`/`jarvis-fs` Obsidian MCP tools, confirmed live with a cheap `mcp__jarvis__vault_list` call before being trusted (an error there means "not connected," not "empty vault"). Explicitly forbids a third path: writing across repos via the GitHub API as a substitute for either — `core/git_ops.py` exists specifically to solve the two-writer collision problem for this repo's one automated writer, and a second interactive writer via the API would reintroduce that exact race with no retry/rebase handling. States plainly that the write itself is always consent-gated by whichever skill invokes it — this file governs *how* the vault is reached, not the consent gate itself. Closes by pointing at `CLAUDE.md`'s "Note-template contracts" section and `note-templates.md` for the actual field-by-field shape, rather than restating it a third time.

## mcp-permissions.md

**File:** `.claude/rules/mcp-permissions.md`

Explains why `.claude/settings.json` pre-approves every `jarvis`/`jarvis-fs` call **except** `mcp__jarvis__vault_delete`, which stays in the `ask` list. The reasoning is explicit and worth citing exactly: the MCP-level permission was never the real safety mechanism — every skill/agent that calls a write/patch/move tool already enforces its own human consent gate *before* making that call, so gating the MCP call a second time "would just be the same approval asked twice." `vault_delete` is different because **no skill or agent in this repo has a legitimate reason to call it at all** — nothing in the promotion/tracking/applying flows ever deletes a vault note, so an unexpected `vault_delete` call is itself the signal something's wrong (a bad path, a hallucinated cleanup step), which is exactly the case where an interactive prompt earns its cost. Names that `vault-write-guard.sh` (see Hooks note) adds one line of context on every one of these calls but does not change what's actually gated — that's this file and `settings.json` alone.

## hooks.md

**File:** `.claude/rules/hooks.md`

Catalog of this repo's two real hooks (`review-reminder.sh`, `vault-write-guard.sh` — full detail in the Hooks note) plus the one governing principle stated once here: **"hooks here inform, they never deny."** Names the real permission gate these hooks are not a substitute for (`.claude/settings.json`'s `ask` entries — currently just `mcp__jarvis__vault_delete` and a few `git`/`gh` commands) and states both hooks fail open on any parse problem, on purpose — "a broken hook must never block real work." Closes with a real, forward-looking constraint for anyone adding a new hook later, worth quoting directly: any new hook touching the vault-writing agents "should keep this same shape: advisory, fail-open, one line of `additionalContext`... don't silently upgrade an existing advisory hook to a denying one."

## autonomous.md

**File:** `.claude/rules/autonomous.md`

Sorts all 7 agents into exactly two classes — worth restating precisely since it's the single clearest safety-relevant fact in this whole `.claude/` layer:

- **Safe to run fully autonomously** (read-only, no vault write, no repo write): `loop-verifier`, `testing-tools`, `contact-researcher`. Each one's own file independently states the same constraint in its own words (`loop-verifier`: "never modify code, never write to the vault... reports; a human or a separate task acts on it"); this rule file is the one place that states the *pattern* across all three rather than leaving a reader to notice it three separate times.
- **Never autonomous** (always gated behind explicit human consent): `program-writer` and `tracking` (invoked only after their caller already got an explicit yes/no — never called directly against a vault write without that gate already having happened), `promotion` (the consent gate lives *inside* this agent, its own step 4's explicit "write the three notes now?" ask — answering the two prior questions is not the same as authorizing the write), and `applying` (which additionally self-gates on `Main Resume.md`/`Main Cover Letter.md` not being real yet, refusing to draft against filler content even if asked to proceed).

States the reasoning for the split directly, worth quoting: "a read-only agent's worst-case failure is a wrong report, which a human catches on the next real check; a write-capable agent's worst-case failure is a fabricated fact landing in a personal record that gets acted on" — the asymmetry is why the write-capable group's gate is non-negotiable and the read-only group's isn't. Points to `CLAUDE.md`'s own "Auto-mode classifier notes" section for repo-level operational boundaries (secrets, protected branches, soft-deny list) rather than restating those here — this file is scoped to agent-level autonomy specifically.
