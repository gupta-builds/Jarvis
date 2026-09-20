---
type: evergreen
status: sprout
created: 2026-05-15
updated: 2026-09-19
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

Observed safe facts:

- Installed and lazy-loaded with long delay.
- Conversations are saved under `50_Archive/copilot/copilot-conversations`.
- Custom prompts are under `50_Archive/copilot/copilot-custom-prompts`.
- Autosave chat is enabled.
- Inline citations are enabled.
- Saved memory is enabled.
- Autonomous agent mode is enabled.

Docs describe Copilot as supporting vault QA, citations, memory, custom prompts, and agent-like tool use. In Jarvis, this is useful for human-in-Obsidian questioning, but it should not become an unlogged parallel agent.

Rules:

- Treat `50_Archive/copilot` as read-only historical context unless the user asks.
- Do not copy provider credentials, auth material, memory internals, or generated indexes into notes.
- Prefer vault notes and dashboards over Copilot memory when facts conflict.
- Treat autonomous tools as high-risk until the user approves a specific workflow.

## Local REST API

Observed safe facts:

- Secure port: `27124`.
- Insecure port: `27123`.
- Insecure server: enabled.
- API credential material exists and must not be exposed.

The plugin documentation describes local HTTP endpoints for vault file operations, search, commands, and note/block/heading style updates. In Jarvis, this is a possible bridge for external automation, but direct filesystem edits are easier to audit in Codex.

Rules:

- Do not call Local REST API unless the user explicitly asks.
- Do not expose credential values.
- Prefer filesystem edits for documentation work.
- Treat insecure port `27123` as a risk surface and `needs verification`.
- If an automation later uses the API, constrain it to exact paths and operations.

**Researched 2026-09-18:** the plugin's own README frames the insecure port as a fallback, not a general convenience. Port `27124` serves HTTPS over a locally generated, name-constrained certificate authority — *"it can only vouch for `127.0.0.1`, `localhost`, your configured binding host, and the hostnames you list under Subject alternative names"* — and every request on either port still requires the API key as a bearer token. Port `27123` exists only because some HTTP clients (the README names MCP clients specifically) cannot be configured to trust a locally generated CA, so the plugin exposes the same authenticated API without TLS as a fallback ([Local REST API README](https://github.com/coddingtonbear/obsidian-local-rest-api)).

**Resolved 2026-09-19:** the binding-host gap flagged below is closed. The plugin's server binds to a "Binding Host" setting whose documented default is `127.0.0.1` — *"Setting this to `0.0.0.0` allows access from other devices on the network"* ([Local REST API installation/configuration reference](https://deepwiki.com/coddingtonbear/obsidian-local-rest-api/1.1-installation-and-configuration)). This vault's `.obsidian/plugins/obsidian-local-rest-api/data.json` has no `bindingHost` key set, which means it is running on the plugin's default — localhost-only on both `27123` and `27124`. The real gap on `27123` is still transport encryption, not network exposure: an unencrypted request never leaves this machine, but anything else running locally that can reach `127.0.0.1:27123` (a browser tab, another process) sees the API key and payload in plaintext.

Needs verification:

- Which local tools are expected to use the insecure endpoint (the README's own use case is MCP clients that cannot trust a self-signed CA).
- Whether command endpoints should be allowed for any AI workflow.

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
| Copilot autonomous tools | Parallel writes and hidden context drift. | Use only after workflow approval. |
| Copilot memory | Stale or unreviewed facts. | Vault notes beat memory. |
| Local REST API secure port `27124` | Programmatic writes. | Do not call unless asked. |
| Local REST API insecure port `27123` | Still requires the API key — the gap is transport encryption, not authentication. Its own README frames it as an MCP-client fallback for clients that cannot trust a locally generated CA, not a general convenience. | Review whether it should remain enabled; verify its binding host is localhost-only. |
| QuickAdd AI | Capture macros can mix raw and processed material. | Configure capture first, AI later. |
| DataviewJS/HTML | Executable dashboard behavior. | Prefer plain Dataview. |

## Integration Map
- **Copilot ↔ vault (one-way trust):** Copilot reads the vault and stores memory under `50_Archive/copilot/`; the vault never trusts Copilot memory back. When facts conflict, notes win. Copilot's autonomous mode could write notes in parallel — that is the drift risk, so treat it as off until a workflow is approved.
- **Local REST API ↔ MCP/filesystem:** the API exposes the same vault operations an agent already has via filesystem edits. For documentation and note work, prefer filesystem edits — they are easier to audit than HTTP calls. The API is a bridge for *external* tools, not a shortcut for an in-editor agent.
- **Secrets ↔ `.gitignore`:** `copilot`, `quickadd`, and `local-rest-api` `data.json` files are gitignored precisely because they can hold credentials. This is why these docs describe behavior, never values. See [[Git Recovery and Vault Safety]].
## Gold-Standard Example
The correct pattern is restraint, so the example is a boundary, not a feature: `50_Archive/copilot/copilot-conversations` is read-only historical context — an agent may read it for continuity but must not treat it as a write target or as authority over current notes. There is no approved automation workflow in the vault yet, which is itself the honest current state: the safe default is "filesystem edits, logged."
## Verified Open State
- Should the Local REST API insecure server on port `27123` remain enabled, and which local tool needs it? — *security decision; insecure server is currently on. `27123` skips TLS, not authentication — it exists for MCP clients that cannot trust the plugin's self-signed CA. Binding host resolved 2026-09-19: defaults to `127.0.0.1`, and this vault has no override, so it is localhost-only today.*
- Should Copilot's autonomous agent mode be allowed to make vault edits, or stay human-facing Q&A? — *unresolved; high-risk until scoped*
- Which, if any, AI workflow is approved to call command endpoints? — *none currently approved*
- Should Lean Terminal's `persistBuffer` stay on, given it writes full session scrollback (and machine-specific `cwd` paths) to a plaintext `data.json`? — *unresolved; flagged 2026-09-19, mitigated for sync by excluding the file via `.stignore`, not by changing the plugin setting*
## Suggestions
- **Build 3's `.stignore` fix solves the sync-exposure problem but not the standing local one — this is the real remaining decision, not a footnote to the sync fix.** `persistBuffer: true` means every CLI session Anant runs through Lean Terminal (Claude Code, Codex, inside the vault workspace) has its full raw output sitting in a plaintext file on this one machine, whether or not it ever syncs anywhere. **Worth deciding: yes** — this is a local-machine question independent of cross-laptop sync, and it's currently framed as settled when only the sync half is.
- **Local REST API's insecure-server decision and Copilot's autonomous-mode decision are both already tracked** in [[Plugin Gaps Recommendations and Verification]] — do not re-decide them here.
- **Lowering `recentSessionsMax` from 10: worth it as a cheap partial mitigation, not a fix.** Fewer retained sessions shrinks the standing exposure window (less history sitting in plaintext at any moment) without touching whether `persistBuffer` itself is on — a reasonable middle ground if turning buffering off entirely would lose scrollback Anant actually wants to scroll back to mid-session. Not worth agonizing over the exact number; 3-5 sessions instead of 10 gets most of the benefit with no real workflow cost.
## Sources

- [Copilot docs](https://www.obsidiancopilot.com/en/docs)
- [Copilot Vault QA](https://www.obsidiancopilot.com/en/docs/vault-qa)
- [Local REST API README](https://github.com/coddingtonbear/obsidian-local-rest-api)
- [Local REST API docs](https://coddingtonbear.github.io/obsidian-local-rest-api/)
- [Local REST API installation/configuration reference](https://deepwiki.com/coddingtonbear/obsidian-local-rest-api/1.1-installation-and-configuration) — Binding Host default
- [QuickAdd docs](https://quickadd.obsidian.guide/docs/)
- [QuickAdd Capture choice](https://quickadd.obsidian.guide/docs/Choices/CaptureChoice)
- Direct read of `.obsidian/plugins/lean-terminal/data.json` — this session, 2026-09-19
- [[AI_CONTEXT]]
- [[Agent Operating Guide]]
