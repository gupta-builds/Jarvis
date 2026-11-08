---
type: system
status: sprout
created: 2026-08-28
updated: 2026-11-07
tags:
  - system
  - standards
  - internship
  - cover-letter
system_kind: standard
family: cover-letter
tier: 1
maps_to:
  - "[[Internship Cover Letter Template]]"
used_by: []
gold_standard: none
notes:
  - "[[Cover Letter Alteration]]"
  - "[[Resume Alteration Standard]]"
  - "[[Application Document Preparation]]"
  - "[[Human Writing Standard]]"
---
# Cover Letter Alteration Standard
==A cover letter recombines approved, evidence-backed fragments for one company, in 250 to 350 words, and invents neither enthusiasm nor company facts.==
This is the contract behind [[Cover Letter Alteration]]. It governs `Main Cover Letter.md`, the fragment bank, and the per-application DOCX files made from it. A cover letter is read start to finish by a person, so its rules are about selection and length, not keyword order. It is not the resume ([[Resume Alteration Standard]]), and its tone is checked by [[Human Writing Standard]]. No fragment bank exists yet, so no Right or Wrong line below is quoted from a real note.
## Spec
```json
{
  "family": "cover-letter",
  "tier": 1,
  "match": {"type": "output", "kind": "cover-letter", "path": "^20_Progress/Internship/Cover Letters/", "where": {}, "where_not": {}},
  "legacy_match": [],
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "output_kind", "status", "created", "updated", "tags", "source_note", "source_concepts", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "source_concepts": "list", "source_note": "text?", "next": "text?"},
  "headings": ["How This Bank Is Organized", "Opening Hooks", "Experience Paragraphs", "Closings", "Logged Gaps"],
  "optional_headings": []
}
```

| Item | Rule |
|---|---|
| Allowed folders | `20_Progress/Internship/Cover Letters/` |
| File name | `Main Cover Letter.md` for the bank; `<Role> - <Company>.docx` per application, flat in the folder. |
| Kind | `type: output` with `output_kind: cover-letter`. |
| Status | `seed` while fragments lack evidence, `sprout` once every fragment is tagged and confirmed, `tree` once a letter built from it was sent. |
## Headings
### Frontmatter
- **Write:** `type: output`, `output_kind: cover-letter`, `source_concepts` (the project notes behind the fragments), `source_note`, `next`.
- **Length:** one line per key.
- **Never:** `type: project`. The existing stub template was typed `project`.
- **Right:** None yet.
- **Wrong:** None seen.
### How This Bank Is Organized
- **Write:** the fragment types and their tags: `#hook/<archetype>`, `#experience/<theme>`, `#closing/standard`, and an evidence tag (`#evidence/user-confirmed-DATE`, or `#evidence/needed` for a placeholder).
- **Length:** one short paragraph.
- **Never:** a fragment type with no tag.
- **Right:** None yet.
- **Wrong:** None seen.
### Opening Hooks
- **Write:** one or more hooks per company archetype, each specific to the company.
- **Length:** one to three sentences per hook.
- **Never:** a general line about passion for the mission, or "I have always dreamed of working at X".
- **Right:** None yet.
- **Wrong:** None seen.
### Experience Paragraphs
- **Write:** one project or role per paragraph, each tracing to an approved fragment or a linked project note.
- **Length:** one paragraph each.
- **Never:** a paragraph with no confirmed evidence.
- **Right:** None yet.
- **Wrong:** None seen.
### Closings
- **Write:** restate fit and name the next step.
- **Length:** two or three sentences.
- **Never:** a closing that asks for nothing.
- **Right:** None yet.
- **Wrong:** None seen.
### Logged Gaps
- **Write:** claims without a confirmed fact.
- **Length:** one line per gap.
- **Never:** a placeholder filled with a plausible fragment to make the bank look complete. An honestly empty placeholder is correct until a real fact backs it.
- **Right:** None yet.
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| Markdown is authoritative. The `.docx` and `.pdf` are generated, never hand-edited | Two sources of truth disagree | Reader |
| Evidence only, fail closed. Every paragraph traces to an approved fragment, a linked project note, or a human-supplied fact. A real company fact cites its source | Invented enthusiasm and invented company facts are violations, not tone | Reader |
| Two or three real experiences that match the JD's top requirements, never more. Open with something specific to the company | A letter is read start to finish by a person | Reader |
| 250 to 350 words. A different length needs a reason on the content plan | The length is the contract | Reader |
| Plain text: no text boxes, images, color, or shading. Never presume a cover letter is required; follow the live posting | Parsers and readers drop formatting | Reader |
| One `<Role> - <Company>.docx` per application in `Cover Letters/`, overwritten in place until `date_applied` is set. An approved content plan comes before the humanizer gate | A sent letter is frozen | Reader |
| The five headings appear in order and none is empty | The bank is read by section | Lint, check 2 |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| Template typed `project`, `status: active` | `type: output`, `output_kind: cover-letter` | Mechanical |
| Five "Cover Letter - How to ..." stubs of about nine words (Be Human, Edit, Get the Job, Research, Style) | Write, or delete | Judgment, needs a yes |
| A "Not Yet Built" section in the bank | Remove once real fragments exist | Judgment |
## Done Conditions
- The bank holds real, tagged, reusable fragments, not one fixed letter.
- Every letter names two or three real experiences that trace to approved sources.
- No letter passes 350 words without a stated reason.
- The note passes [[Vault Lint]] for `cover-letter`.
## Gold Standard Example
None yet. No `Main Cover Letter.md` exists, and the Cover Letters folder holds only the five stubs. Measured 2026-11-07 with `--family cover-letter`: 0 notes. The first real bank should be named here.
