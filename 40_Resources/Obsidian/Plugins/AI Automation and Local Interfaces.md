---
type: evergreen
status: sprout
created: 2026-05-15
updated: 2026-09-20
tags:
  - evergreen
  - system
  - obsidian
  - ai-agents
  - automation
notes:
  - "[[AI_CONTEXT]]"
  - "[[HUMAN_WRITING]]"
  - "[[40_Resources/Obsidian/Vault Operating System]]"
  - "[[60_Claude/07_AI_Information/Plugins]]"
  - "[[00 Plugin Reference Index]]"
  - "[[Cross-Laptop Sync - Build 3 Findings]]"
---
# AI Automation and Local Interfaces

Copilot, QuickAdd AI, and Local REST API can make Obsidian programmable. They also create the highest safety risk in this plugin set.

Use them only when the user explicitly asks for automation through Obsidian or when a workflow has already been approved.

## Source Of Truth

The source of truth is the vault, not AI memory.

Read in this order:

1. [[AI_CONTEXT]]
2. [[HUMAN_WRITING]]
3. [[40_Resources/Obsidian/Vault Operating System]]
4. [[00_Dashboard]]
5. [[20_Progress/Projects/AI Use/Claude Kit/Log]]
6. relevant source, project, course, or concept notes

Copilot memory, chat history, embeddings, provider context, and recent files are secondary. They can suggest where to look; they do not overrule the notes.

## Copilot

**Resolved 2026-09-20 — real permission expansion, live now.** Copilot version is `4.0.9` (was documented as `3.2.7` — corrected in [[Plugin Inventory and Configuration Map]] too). The user asked for Copilot to get autonomous vault-edit access "routed through the same jarvis MCP mechanism the other AI tools use." Both proposed mechanisms were researched directly rather than guessed at:

- **(a) Copilot's own in-process Autonomous Agent mode** — real, confirmed live in this vault's `data.json`: `enableAutonomousAgent: true`, and `autonomousAgentEnabledToolIds` already includes **`writeFile` and `editFile`** alongside `localSearch`, `readNote`, `webSearch`, `pomodoro`, `youtubeTranscription`, and `updateMemory`. This is Copilot's own internal tool-calling against Obsidian's app API — nothing to do with MCP.
- **(b) Copilot as an MCP client** — checked directly: **not present.** A full scan of Copilot's `data.json` (106 top-level keys) found zero keys matching `mcp` in any form, and the plugin's own GitHub release notes (v4.0.0–v4.0.9) contain no mention of MCP or Model Context Protocol anywhere. Copilot does not connect to this vault's `.mcp.json` `obsidian` server (the `mcp-obsidian` bridge that Claude Code and Cursor use) or to any other MCP server.

**The real answer is (a), not (b).** Copilot already has autonomous, unlogged vault-write access via `writeFile`/`editFile` in its own tool-calling loop — this is **live right now**, not a change made this session (the flags were already `true`/enabled before this session started; the only thing this session added was confirming which mechanism it actually is and updating the Risk Register accordingly). This means Copilot can create or overwrite vault files outside of any agent's review, on its own timing, with no session log entry and no Write Contract enforcement — it doesn't read CLAUDE.md/AGENTS.md the way an agent invoked through Claude Code does.

**Separately, this Copilot version also ships an unrelated "Agent Chat" feature** (Settings → Copilot → Basic → Agents) that can run **Claude Code, Codex, or opencode** natively inside Obsidian as one of three selectable coding-agent backends. This is not MCP either — it's Copilot shelling out to (or, for opencode/Codex, optionally auto-installing) each tool's own binary. See the opencode section below; this is very likely what the user's `opencode` install is actually for.

Other observed facts:

- Installed and lazy-loaded with long delay.
- Conversations saved under `50_Archive/copilot/copilot-conversations`.
- Custom prompts under `50_Archive/copilot/copilot-custom-prompts`.
- Autosave chat, inline citations, and saved memory are all enabled.

Rules:

- Treat `50_Archive/copilot` as read-only historical context unless the user asks.
- Do not copy provider credentials, auth material, memory internals, or generated indexes into notes.
- Prefer vault notes and dashboards over Copilot memory when facts conflict.
- **Autonomous vault-write access is no longer a hypothetical to flag — it is live.** If a note looks edited in a way no logged agent session accounts for, Copilot's autonomous agent is a real candidate, not just Copilot memory or manual edits. This doesn't change any agent's own behavior, but it changes what "unexplained edit" should make an agent suspect.

## Local REST API

**Resolved 2026-09-20 — standardized on the insecure port, by user decision.** This vault's `mcp-obsidian` bridge (both Claude Code and Cursor connect through it, via `.mcp.json`'s `obsidian` server) doesn't have a straightforward way to trust the plugin's self-signed HTTPS certificate authority. The plugin's own README frames the insecure port as exactly this fallback, not a general convenience — so `.mcp.json` is configured to default `OBSIDIAN_PORT` to `27123` (confirmed directly in this vault's `.mcp.json`), and this is the settled design, not a compromise pending a better fix.

Observed safe facts (re-verified directly against `.obsidian/plugins/obsidian-local-rest-api/data.json` this session — **the secure port number was previously documented wrong**, see below):

- Secure port: **`27126`** — corrected 2026-09-20; every prior note and the tracker said `27124`, which does not match the live config. Not a bug, just documentation drift (likely from a port regenerating at some point after a conflict); `27124` is stale everywhere it appears and has been corrected in this pass.
- Insecure port: `27123` — this is the port actually in use for all MCP traffic (Claude Code, Cursor).
- Insecure server: enabled (`enableInsecureServer: true`).
- Secure server: also enabled (`enableSecureServer: true`) — left on, since nothing about standardizing MCP traffic on `27123` requires turning `27126` off; a tool that *can* trust the CA still has the option.
- API credential material exists (`crypto.privateKey`, `apiKey`) and must not be exposed — confirmed present, values never read or copied into any note.

The plugin documentation describes local HTTP endpoints for vault file operations, search, commands, and note/block/heading style updates. In Jarvis, this is the bridge for *external* MCP-based automation; direct filesystem edits remain easier to audit for an agent already working in the vault.

Rules:

- Do not call Local REST API unless the user explicitly asks.
- Do not expose credential values.
- Prefer filesystem edits for documentation and note work — the REST API is for external tools that need HTTP, not a shortcut for an in-editor agent.
- If an automation later uses the API, constrain it to exact paths and operations.

**Binding host, resolved 2026-09-19, still true:** the plugin's server binds to a "Binding Host" setting whose documented default is `127.0.0.1` — *"Setting this to `0.0.0.0` allows access from other devices on the network"* ([Local REST API installation/configuration reference](https://deepwiki.com/coddingtonbear/obsidian-local-rest-api/1.1-installation-and-configuration)). This vault's `data.json` has no `bindingHost` override, so it runs on the plugin default — localhost-only on both ports. The `27123` gap is transport encryption within this one machine (a browser tab or another local process could technically read the plaintext request), not network exposure.

Needs verification:

- Whether command endpoints should be allowed for any AI workflow — none currently approved.

## opencode
**Researched 2026-09-20, partially resolved.** The user installed `opencode` (the open-source AI coding CLI, supports free/open model providers) believing it was related to Obsidian Copilot, then hit an error running the `opencode` command in a terminal — exact error text not yet captured.

What's confirmed from Copilot's own documentation (fetched this session, `docs.obsidiancopilot.com`): opencode genuinely is one of three real, first-class agent backends in Copilot's **Agent Chat** feature (Settings → Copilot → Basic → Agents), alongside Claude Code and Codex — described as "the best starting point" of the three. Setup has two paths:
- **"Managed by Copilot"** → Download & install — Copilot downloads and manages its own opencode binary internally. The docs explicitly note this path **"does not require a PowerShell command or PATH changes"** — it never touches the system terminal or PATH at all.
- **"My own binary"** → point Copilot at an existing install (auto-detect, or the full path to `opencode.exe`).

**This strongly suggests the user's install is a separate, standalone `opencode` install** (e.g. via `npm install -g opencode-ai` or similar) made outside Copilot's managed flow — Copilot's own managed path wouldn't produce a terminal error at all, since it never runs `opencode` as a user-typed command. That lines up with the user's own second goal: using `opencode` **standalone**, independent of Copilot, for free/open-model work — that's inherently a system-PATH CLI install, not Copilot's internal managed one. The two may end up pointing at the same binary eventually (Copilot's "My own binary" option can target a standalone install), but they are functionally two different setup paths today.

**Checked directly on this machine (Dell), 2026-09-20:** `opencode` is not on PATH in either PowerShell (`Get-Command opencode` finds nothing) or Git Bash (`which opencode` finds nothing), and it is not installed as a global npm package under either `opencode` or `opencode-ai` (`npm list -g` shows neither). This means the most likely explanation is simply that `opencode` was never actually installed as a standalone CLI on this machine — the error the user saw was probably a plain "command not found" / "'opencode' is not recognized," not a deeper configuration problem. This doesn't rule out WSL (not checked from this session) or the possibility that it's only ever been set up through Copilot's own managed sandbox, which deliberately doesn't touch PATH.

Still needed from the user before this can be fixed:
- Confirmation of the exact error text and which terminal/shell it was run in (PowerShell, Git Bash, WSL) — to confirm it matches the "not installed" theory above rather than something else (a version mismatch, a permissions error, a corrupted partial install).
- Whether they want the standalone CLI working first (`npm install -g opencode-ai`, for free/open models on its own, independent of Obsidian), the Copilot-managed integration (Settings → Copilot → Basic → Agents → opencode → Configure, inside Obsidian, no terminal), or both.

## Lean Terminal
Lean Terminal embeds an `xterm.js` terminal panel inside Obsidian, so CLI agents (Claude Code, Codex) can run directly in the vault workspace instead of a separate window.

**Audited 2026-09-19, cross-laptop sync Build 3.** Two findings from reading `.obsidian/plugins/lean-terminal/data.json` directly:

- `persistBuffer: true` with `recentSessionsMax: 10` means the plugin writes the **full raw scrollback** of up to 10 recent terminal sessions to disk — every line a CLI tool printed, ANSI escape codes included, not just a summary. This is the same class of risk as Copilot's saved memory: whatever appeared in that terminal (including anything sensitive typed or echoed) sits in a plaintext settings file.
- Each saved session's `cwd` field is a full absolute path (`D:\Users\_Anant\10_Areas\Documents\Jarvis` on this machine). A second laptop with a different drive letter or username would restore a `cwd` that does not exist there.

Both findings are why `.obsidian/plugins/lean-terminal/data.json` was added to `.stignore` in Build 3 — see [[Cross-Laptop Sync - Build 3 Findings]]. Agents should treat this file the same as the other high-risk `data.json` files below: read behavior, never copy buffer contents into a note.

## QuickAdd AI

QuickAdd can run capture choices, macros, and scripts. The current settings show no choices, while AI provider configuration exists.

Safe first step after approval:

1. Add non-AI capture choices.
2. Test destinations and templates.
3. Only then consider AI-assisted transforms.

Agents should not configure AI providers, add credentials, or write macros during documentation work.

## What Agents May Use

Agents may:

- read safe documentation and plugin settings
- document observed non-secret behavior
- write Markdown docs in approved folders
- suggest QuickAdd/REST/Copilot workflows as recommendations
- log meaningful vault changes

Agents may not:

- call Local REST API without explicit approval
- expose credential material
- change Copilot memory or autonomous settings
- edit plugin `data.json`
- enable Templater system commands
- write raw clippings or archive material unless explicitly asked
- run Obsidian commands through an API as a shortcut

## Safe Automation Pattern

Before automating:

1. Define the destination folders.
2. Define allowed operations: read, create, append, patch heading, search, or command.
3. Exclude `.obsidian`, secrets, clippings, archive folders, and Git operations unless explicitly included.
4. Add dry-run output for broad changes.
5. Log meaningful edits in `60_Claude/10_Session_Logs/log.md`.

Automation should make the vault easier to audit, not harder.

## Risk Surfaces

| Surface | Risk | Jarvis rule |
|---|---|---|
| Copilot autonomous tools | **Live, not hypothetical, as of this session's confirmation.** `writeFile`/`editFile` are enabled tool IDs — Copilot can edit vault notes on its own, unlogged, outside the Write Contract. | Vault notes beat Copilot memory when facts conflict. An unexplained edit is now a real candidate to check against Copilot's autonomous agent, not just manual edits. |
| Copilot memory | Stale or unreviewed facts. | Vault notes beat memory. |
| Local REST API secure port `27126` | Programmatic writes if called. | Do not call unless asked. |
| Local REST API insecure port `27123` | **Resolved 2026-09-20 — standardized on, by design.** Still requires the API key; the gap is transport encryption within this one machine, not authentication or network exposure (binding host confirmed localhost-only). This is the port both Claude Code and Cursor's MCP bridge actually use. | Settled design, not a pending review — see the Local REST API section above. |
| QuickAdd AI | Capture macros can mix raw and processed material. | Configure capture first, AI later. |
| DataviewJS/HTML | Executable dashboard behavior. | Prefer plain Dataview. |

## Integration Map
- **Copilot ↔ vault (one-way trust):** Copilot reads the vault and stores memory under `50_Archive/copilot/`; the vault never trusts Copilot memory back. When facts conflict, notes win. Copilot's autonomous mode could write notes in parallel — that is the drift risk, so treat it as off until a workflow is approved.
- **Local REST API ↔ MCP/filesystem:** the API exposes the same vault operations an agent already has via filesystem edits. For documentation and note work, prefer filesystem edits — they are easier to audit than HTTP calls. The API is a bridge for *external* tools, not a shortcut for an in-editor agent.
- **Secrets ↔ `.gitignore`:** `copilot`, `quickadd`, and `local-rest-api` `data.json` files are gitignored precisely because they can hold credentials. This is why these docs describe behavior, never values. See [[Git Recovery and Vault Safety]].
## Gold-Standard Example
The correct pattern is restraint, so the example is a boundary, not a feature: `50_Archive/copilot/copilot-conversations` is read-only historical context — an agent may read it for continuity but must not treat it as a write target or as authority over current notes. **Updated 2026-09-20:** Copilot's own autonomous vault-write access is now a real, approved exception to "no automation workflow yet" — but it's Copilot's own internal tool-calling, not something other agents gain access to, and it doesn't change the rule for any agent working through Claude Code or Cursor: the safe default there stays "filesystem edits, logged."
## Verified Open State
- Which, if any, AI workflow is approved to call Local REST API command endpoints? — *none currently approved; the port/standardization decision is settled, command-endpoint usage is a separate, still-open question*
- Should Lean Terminal's `persistBuffer` stay on, given it writes full session scrollback (and machine-specific `cwd` paths) to a plaintext `data.json`? — *unresolved; flagged 2026-09-19, mitigated for sync by excluding the file via `.stignore`, not by changing the plugin setting. Lowering `recentSessionsMax` from `10` to `3`-`5` would shrink the standing local exposure window without touching whether buffering itself is on — a cheap partial mitigation, not acted on without the user's say-so since it trades away scrollback they may actually use.*
- opencode: exact error text, shell used, and standalone-vs-Copilot-managed intent — *see the opencode section above; this machine's own PATH/npm state was checked directly, the rest needs the user.*

## Sources

- [Copilot docs](https://www.obsidiancopilot.com/en/docs)
- [Copilot Vault QA](https://www.obsidiancopilot.com/en/docs/vault-qa)
- [Copilot — Autonomous Agent docs](https://docs.obsidiancopilot.com/autonomous-agent/) and [Agent Chat overview](https://docs.obsidiancopilot.com/agent-mode-and-tools/) — tool-calling mechanism, opencode/Claude Code/Codex agent backends, fetched 2026-09-20
- [Copilot — Windows setup for Agent Chat](https://docs.obsidiancopilot.com/agent-mode-windows-setup/) — opencode Managed-by-Copilot install path, fetched 2026-09-20
- [Copilot GitHub releases](https://github.com/logancyang/obsidian-copilot/releases) — checked for any MCP mention (none found) and opencode/Codex/Claude Code agent feature history, fetched 2026-09-20
- [Local REST API README](https://github.com/coddingtonbear/obsidian-local-rest-api)
- [Local REST API docs](https://coddingtonbear.github.io/obsidian-local-rest-api/)
- [Local REST API installation/configuration reference](https://deepwiki.com/coddingtonbear/obsidian-local-rest-api/1.1-installation-and-configuration) — Binding Host default
- [QuickAdd docs](https://quickadd.obsidian.guide/docs/)
- [QuickAdd Capture choice](https://quickadd.obsidian.guide/docs/Choices/CaptureChoice)
- Direct read of `.obsidian/plugins/copilot/data.json` (non-secret keys only), `.obsidian/plugins/obsidian-local-rest-api/data.json` (non-secret keys only), `.mcp.json`, and `.obsidian/plugins/lean-terminal/data.json` — this session, 2026-09-20
- `Get-Command opencode` / `which opencode` / `npm list -g` checked directly on this machine — this session, 2026-09-20
- [[AI_CONTEXT]]
- [[Agent Operating Guide]]
