---
type: system
status: sprout
created: 2026-10-16
updated: 2026-11-07
tags:
  - system
  - standards
system_kind: standard
family: machine-runbook
tier: 1
maps_to:
  - "[[Machine Setup Runbook Template]]"
used_by: []
gold_standard: "[[40_Resources/CS/Concepts/New Laptop/Sync/Cross-Laptop Sync - Known Failure Modes and Prevention|Cross-Laptop Sync - Known Failure Modes and Prevention]]"
notes:
  - "[[Logs]]"
  - "[[System Component Standard]]"
---
# Machine Runbook Standard
==A runbook says why it exists, what must be true before starting, the steps, and the dated checkpoints that prove each step happened on the real machine.==
This is the Standard for notes that rebuild, migrate, or configure a computer: the New Laptop set (Acer and Dell rebuild, WSL, VS Code, sync, decommission). They are `reference` notes of kind `runbook`, not course concepts. It is not the documentation of tooling the vault runs ([[System Component Standard]]), and a machine's dotfile snapshots are not notes.
## Spec
```json
{
  "family": "machine-runbook",
  "tier": 1,
  "match": {"type": "reference", "kind": "runbook", "path": "^40_Resources/CS/", "where": {}, "where_not": {}},
  "legacy_match": [{"path": "^40_Resources/CS/Concepts/New Laptop/"}],
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "reference_kind"],
  "key_types": {"created": "date", "updated": "date", "tags": "list"},
  "headings": ["Why This Note Exists", "Steps", "Checkpoints"],
  "optional_headings": ["Gate", "Sources", "Open Questions", "Related Notes"]
}
```

| Item | Rule |
|---|---|
| Allowed folders | `40_Resources/CS/`, today under `Concepts/New Laptop/`. |
| File name | The job and the machine or tool (`VS Code - Install Loop`). Unique in the vault. |
| Kind | `type: reference` with `reference_kind: runbook`. |
| Status | `seed` while unverified, `sprout` while being run, `tree` once a full run confirmed it, `archived` when the machine is retired. |
## Headings
### Frontmatter
- **Write:** `type: reference`, `reference_kind: runbook`, `status`, dates, `tags`. `machine` (acer, dell, or both) and `next` are optional but used.
- **Length:** one line per key.
- **Never:** course keys (`course`, `track`, `prerequisites`, `mastery_level`). A runbook built on the Concept template carries them; 44 New Laptop notes do.
- **Right:** `reference_kind: runbook`
- **Wrong:** `course: Life`
### Why This Note Exists
- **Write:** the situation, the machine, and what this note decides or does that no other note does. A superseding note is named here.
- **Length:** two to four sentences.
- **Never:** a heading in lower case ("Why this note exists"): the Spec matches the title.
- **Right:** `This runbook records recurring failures in the Acer-Dell Syncthing and Git backup setup, with the cause and repair for each.`
- **Wrong:** `## Why this note exists`
### Gate
- **Write:** optional. What must be true before the steps start, as checks that can fail. Real runbooks put a gate before anything destructive.
- **Length:** two to five checks.
- **Never:** a gate that cannot fail.
- **Right:** `Before changing Git history, confirm Syncthing is idle, reports zero errors and pending items, and shows 100% peer completion.`
- **Wrong:** `## Execution gate`
### Steps
- **Write:** numbered, in order, with the exact command or setting and the expected result. Mark a step that changes state, such as a delete, a registry edit, or a sync reset.
- **Length:** every step runnable by someone who was not there.
- **Never:** "set up sync" with no command.
- **Right:** `Use the matching failure-mode entry below to identify the cause and recovery.`
- **Wrong:** `## Decommission steps (once the gate above is fully checked)`
### Checkpoints
- **Write:** dated entries, newest last, recording what was observed on the machine: `**YYYY-MM-DD, machine:** what ran, what the output showed`. A correction is a new checkpoint; the earlier one stays.
- **Length:** one to three sentences per entry.
- **Never:** a dated section named for a checkpoint ("Done, 2026-09-28"). It splits the record.
- **Right:** `**2026-10-19, Dell:** patched`
- **Wrong:** `## Done, 2026-09-28 (Acer Side)`
### Sources
- **Write:** optional. Official docs or notes the steps came from.
- **Length:** one line each.
- **Never:** a source not opened.
- **Right:** None yet.
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| Why This Note Exists, Steps, and Checkpoints appear in order | An operator finds the gate and the record by name | Lint, check 2 |
| `reference_kind: runbook` and no course keys | A runbook is looked up, not studied | Lint, check 1 (kind); Reader (course keys) |
| Each state-changing step is marked, and its checkpoint names the machine and the date | The same step can differ between the Acer and the Dell | Reader |
| A correction is a new checkpoint, never an edit | The earlier line shows what was true then | Reader |
| No Flashcards section | A runbook is not a study note | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: note`, `concept`, `project`, `input`, or `evergreen` under New Laptop | `type: reference`, `reference_kind: runbook` | Mechanical |
| `course: Life`, `track: [laptop]`, `prerequisites`, `tags: [note]` | Remove; move useful links to `notes:` | Mechanical |
| `status: seedling` | `seed` | Mechanical |
| One-Line Answer, Mechanism, Evidence From This Vault, Flashcards | Why This Note Exists, Steps, Checkpoints; drop Flashcards | Judgment |
| Phase or Day sections, "Decommission steps" | Steps | Judgment |
| Sections titled "Live checkpoint", "Acer checkpoint", or "Done, date" | Checkpoints entries | Judgment |
| Dotfile snapshots (`.pre-acer`, `.bak-*`, plugin trees) in the same folders | Not notes; keep out of the vault tree | Out of scope here |
## Done Conditions
- The note has Why This Note Exists, Steps, and Checkpoints, with `reference_kind: runbook`.
- Each state-changing step is marked, and its checkpoint names the machine and the date.
- No course keys or Flashcards remain.
- The note passes [[Vault Lint]] for `machine-runbook`.
## Gold Standard Example
[[40_Resources/CS/Concepts/New Laptop/Sync/Cross-Laptop Sync - Known Failure Modes and Prevention|Cross-Laptop Sync - Known Failure Modes and Prevention]] passes lint: a stated reason, a gate that can fail, steps keyed to named failure modes, and dated per-machine checkpoints. Its checkpoints are partly split into `## Done` sections, which Legacy Shapes treats as a judgment move.
Measured 2026-11-07 with `--family machine-runbook`: 91 notes, 1 passes. 11 of them are backups in `Old Laptop Rebuild/Runs/_backups/`.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| Cross-Laptop Sync - Known Failure Modes and Prevention (gold) | `40_Resources/CS/Concepts/New Laptop/Sync/` | Gate, steps, dated checkpoints | Two `Done` sections beside Checkpoints |
| Old Laptop Decommission Checklist | `40_Resources/CS/Concepts/New Laptop/` | A stated reason, a gate, decided exclusions | `type: note`, `course: Life`, lower-case headings |
| Cross-Laptop Sync - Operations Reference | `40_Resources/CS/Concepts/New Laptop/Sync/` | A short live check | `reference_kind`, Steps, Checkpoints |
