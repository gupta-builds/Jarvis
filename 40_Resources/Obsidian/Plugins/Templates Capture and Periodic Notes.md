---
type: evergreen
status: sprout
created: 2026-05-15
updated: 2026-09-20
tags:
  - evergreen
  - system
  - obsidian
  - templates
notes:
  - "[[AI_CONTEXT]]"
  - "[[HUMAN_WRITING]]"
  - "[[40_Resources/Obsidian/Vault Operating System]]"
  - "[[60_Claude/07_AI_Information/Plugins]]"
  - "[[00 Plugin Reference Index]]"
---
# Templates Capture and Periodic Notes

Templater is the active template engine. Periodic Notes owns daily, weekly, and monthly reviews. QuickAdd is installed, but it is not yet doing the capture work it could do.

Core Templates is disabled. Do not document or depend on the core Templates plugin as the active system.

## Current Templater State
**Corrected 2026-09-20** against a direct read of `.obsidian/plugins/templater-obsidian/data.json` — the settings below and the folder-template map were previously described from memory/prose, not verified, and both were wrong in ways that mattered.

- Templates folder: `30_Order/Templates`.
- Trigger on new file creation mode: `folder` (Templater's own three modes are `none`/`folder`/`regex` — [Templater settings docs](https://silentvoid13.github.io/Templater/settings.html)). This means every new note is checked against `folder_templates`, and per Templater's own rule the **most specific (deepest) matching folder wins** if nesting ever overlaps.
- Folder templates: 6 entries configured (all fixed this session — see below).
- File templates (regex mode): empty array — not in use; folder mode is the only active matcher.
- System commands: no explicit enable/disable field exists in this plugin version's `data.json`; `shell_path` is empty and `command_timeout` sits at its default (`5`s). No template in this vault calls `tp.system.*`, so this is inactive in practice, not actively disabled by a setting.
- User scripts folder: empty (unused).
- Syntax highlighting: on (desktop and mobile).

### Folder template map — fixed 2026-09-20
Two bugs existed, not one. The tracker had already found that `10_UMN` and `60_Claude/30_Source_Summaries` pointed at nonexistent folders. Checking every template file directly against disk (not just the folder side) found a second, larger bug: **four of the six entries pointed at `30_Order/Templates/Metadata/`, a folder that doesn't exist at all** — the real folder is `30_Order/Templates/Frontmatter/`, apparently renamed at some point after these entries were set. So effectively only 1 of 6 entries (`20_Progress`... no, actually only the folder half of the UMN entry) was fully correct before this fix; the rest silently did nothing.

| Folder | Template | Verified this session |
|---|---|---|
| `10_Areas/UMN` | `30_Order/Templates/Classes/Week Template.md` | Template file exists. **The folder itself does not exist yet** — this vault's real UMN coursework material lives outside the vault (see the `10_Areas/UMN` routing convention in [[AGENTS]]); the entry is correctly pointed but dormant until a note is actually created there. |
| `20_Progress` | `30_Order/Templates/Frontmatter/For Progress.md` | Fixed: was `Metadata/For Progress.md` (nonexistent path). |
| `40_Resources` | `30_Order/Templates/Frontmatter/For Evergreen.md` | Fixed: was `Metadata/For Evergreen.md` (nonexistent path). |
| `60_Claude/20_Distilled_Notes` | `30_Order/Templates/Frontmatter/For Evergreen.md` | Fixed: was `Metadata/For Evergreen.md` (nonexistent path). |
| `60_Claude/10_Source_Summaries` | `30_Order/Templates/Frontmatter/For Inputs.md` | Fixed: folder was `60_Claude/30_Source_Summaries` (dead path, real folder is `10_Source_Summaries`) **and** template was `Metadata/For Inputs.md` (nonexistent path) — both wrong. |
| `60_Claude/40_Project_Briefs` | `30_Order/Templates/Frontmatter/For Progress.md` | Fixed: was `Metadata/For Progress.md` (nonexistent path). |

All six template target files were confirmed to exist on disk after the fix; all five real target folders (everything but the not-yet-created `10_Areas/UMN`) were confirmed to exist. Edited via a Node script (not the Edit/Write tool — `.obsidian/` files trigger a Write Contract hook false-positive) and validated with `node -e "JSON.parse(...)"` plus a BOM check, per this vault's standard `.obsidian/` edit workaround.

Resolved: `60_Claude/07_AI_Information` correctly gets no folder template — it holds system/operating docs (`AI_CONTEXT.md`, `Jarvis OS — North Star.md`), not evergreen knowledge notes, so none of the existing template shapes fit it. No template is the correct state here.

## Manual Template Matching

When an agent writes files through the filesystem, Obsidian may not run Templater. The agent must manually match the template intent:

- `40_Resources/Obsidian/Plugins` -> evergreen/system frontmatter.
- `60_Claude/10_Source_Summaries` -> input/source frontmatter with source grounding.
- `20_Progress` -> project/progress frontmatter with `next:` when a concrete action exists.
- `10_Areas/Life/Enumerate/` -> periodic-note frontmatter and review date; not a Claude-layer folder, so agents rarely write here directly.

Do not leave a note without frontmatter because the file was created outside Obsidian.

## QuickAdd
QuickAdd has its own deep reference now: [[QuickAdd Capture Menu]]. **Updated 2026-09-20:** no longer empty. Two Capture-type choices are live (`Inbox thought`, `Flashcard candidate`), confirmed directly in `quickadd/data.json`'s `choices` array. The other four proposed choices are Template-type and stay blocked until dedicated capture templates exist for source clipping, source summary, concept note, and project note. Full detail and exact field values in [[QuickAdd Capture Menu]].

## Periodic Notes Review Flow
**Corrected 2026-09-20** against a direct read of `.obsidian/plugins/periodic-notes/data.json` — every folder and template path below was previously wrong, and Yearly was documented as disabled when it is actually enabled.

Configured reviews:

| Review | Format | Folder | Template | Enabled? |
|---|---|---|---|---|
| Daily | `YYYY-MM-DD` | `10_Areas/Life/Enumerate/Daily` | `30_Order/Templates/Enumerate/Better Today.md` | yes |
| Weekly | `YYYY-[W]ww` | `10_Areas/Life/Enumerate/Weekly` | `30_Order/Templates/Enumerate/Better Weekly.md` | yes |
| Monthly | `YYYY-MM` | `10_Areas/Life/Enumerate/Monthly` | `30_Order/Templates/Enumerate/Better Month.md` | yes |
| Yearly | — | `10_Areas/Life/Enumerate/Yearly` | `30_Order/Templates/Enumerate/Better Year.md` | yes |
| Quarterly | — | (unconfigured — empty strings) | (unconfigured) | present in `data.json` but never set up; not in use |

All four active templates and all four active folders were confirmed to exist on disk. This is the mechanism behind `/startday` and `/closeday` (CLAUDE.md's Daily Operations Cadence): those skills read and write into `10_Areas/Life/Enumerate/Daily`, which is exactly what Periodic Notes is configured to create.

Review notes should pull from [[00_Dashboard]], recent session log entries, open tasks, and active projects. Do not create daily notes in a second folder — `60_Claude/50_Reviews/` (what this note previously claimed) does not exist and was never the real destination.

Separately, `60_Claude/30_Reviews/Weekly Synthesis/` holds a different, unrelated note type — Capability Engine "Weekly Synthesis" notes made from `30_Order/Templates/Capability/Weekly Synthesis Template.md`, not something Periodic Notes produces. Don't conflate the two: Periodic Notes owns the daily/weekly/monthly/yearly personal cadence notes; Weekly Synthesis is a manually-created knowledge-synthesis artifact.

## Capture Destination Rules

Use [[Agent Operating Guide]] as the full folder map. The short rule:

- Raw or imported material -> `60_Claude/05_Clippings`.
- AI output awaiting review -> `60_Claude/00_Inbox`.
- Source-grounded summary -> `60_Claude/10_Source_Summaries`.
- Durable synthesis -> `60_Claude/20_Distilled_Notes` or `40_Resources`.
- Active execution -> `20_Progress`.
- Reviews -> `60_Claude/50_Reviews`.

The failure mode is mixing raw capture and durable synthesis in the same note. That makes source claims hard to audit later.

## Note Composer Boundaries

Use Note Composer only when the split or merge boundary is obvious:

- A source summary has become a reusable concept note.
- A long project note contains a separable decision record.
- A course note has a standalone concept worth linking elsewhere.

Do not split stable notes just because they are long. Add a precise heading or dated addendum first.

## Agent Workflow

When creating a note:

1. Search for an existing canonical note.
2. Decide whether the material is raw, source-grounded, durable, active, or review.
3. Use the folder and metadata that match that role.
4. Add links to projects, courses, concepts, or dashboards that should rediscover it.
5. Add `next:` only when there is a concrete next step.

The template gets the note into the right shape. [[HUMAN_WRITING]] decides whether the prose is worth keeping.

## Integration Map
- **Templater → frontmatter schema:** the folder template fires on note creation inside Obsidian and stamps canonical fields. This is the mechanism that keeps [[Dataview and Dashboards]] queries reliable — a note created outside Obsidian skips Templater, so the agent must apply the same fields by hand.
- **Templater ↔ QuickAdd:** a QuickAdd Template choice points at a `30_Order/Templates/` file; QuickAdd places the note and Templater fills it. They must agree on the destination folder. See [[QuickAdd Capture Menu]].
- **Periodic Notes → reviews:** Periodic Notes creates dated review notes from the Enumerate templates into `10_Areas/Life/Enumerate/{Daily,Weekly,Monthly,Yearly}`. The review pulls from [[00_Dashboard]], the session log tail, and open tasks — it is a read-of-state, not a new data source.
- **Templater bug surface, resolved 2026-09-20:** all six `folder_templates` entries were checked against disk and all had at least one wrong path component (a nonexistent `Metadata/` template folder, a dead `10_UMN`/`60_Claude/30_Source_Summaries` folder alias, or both). Fixed in full — see the Folder template map above.
## Gold-Standard Example
- *Templater output:* [[40_Resources/UMN/Previous Classes/Minor/MGMT 3001/Week - 9|Week - 9]] is what the `Week Template` folder template should produce — class frontmatter, the right section skeleton, ready for content.
- *Periodic Notes output:* `10_Areas/Life/Enumerate/Weekly/2026-W27.md` is a real review note in the actual configured folder (corrected 2026-09-20 — the note previously pointed at a `60_Claude/30_Reviews/Weekly Synthesis` file, which is a different, unrelated note type; see the Periodic Notes Review Flow section above).
## Verified Open State
- Several `Frontmatter/For *` templates (`For Evergreen`, `For Progress`, `For Inputs`) are frontmatter-only shells — whether they need bodies before they teach anything is a template-content question, not a settings gap, and stays out of scope for this note.
- Quarterly review is present but unconfigured in Periodic Notes (`data.json` has an empty `quarterly` block) — open question whether a quarterly cadence is wanted at all; not acted on here.
## Sources

- [Templater docs](https://silentvoid13.github.io/Templater/)
- [Templater settings reference](https://silentvoid13.github.io/Templater/settings.html) — trigger modes, folder-template specificity rule, system command settings, fetched 2026-09-20
- [QuickAdd docs](https://quickadd.obsidian.guide/docs/)
- [QuickAdd Capture choice](https://quickadd.obsidian.guide/docs/Choices/CaptureChoice)
- [QuickAdd Macro choice](https://quickadd.obsidian.guide/docs/Choices/MacroChoice/)
- [Periodic Notes README](https://github.com/liamcain/obsidian-periodic-notes)
- Direct read of `.obsidian/plugins/templater-obsidian/data.json`, `.obsidian/plugins/periodic-notes/data.json`, and `.obsidian/plugins/quickadd/data.json` — this session, 2026-09-20
- [[40_Resources/Obsidian/Vault Operating System]]
- [[Agent Operating Guide]]
