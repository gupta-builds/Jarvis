---
type: system
status: sprout
created: 2026-08-28
updated: 2026-10-16
tags:
  - system
  - standards
  - internship
  - cover-letter
system_kind: standard
family: cover-letter
tier: 1
maps_to:
  - "[[Cover Letter Template]]"
used_by: []
gold_standard: none
notes:
  - "[[Cover Letter Alteration]]"
  - "[[Resume Alteration Standard]]"
  - "[[Application Document Preparation]]"
  - "[[Humanized Writing Standard]]"
---
# Cover Letter Alteration Standard
==A cover letter recombines approved, evidence-backed fragments for one company, in 250 to 350 words, and invents neither enthusiasm nor company facts.==
This is the contract behind [[Cover Letter Alteration]]. It governs `Main Cover Letter.md`, the fragment bank, and the per-application DOCX files made from it. A cover letter is read start to finish by a person, so its rules are about selection and length, not keyword order. The bank does not exist yet; the first one built from [[Cover Letter Template]] should replace the empty Gold Standard Example.
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
## Headings
### Frontmatter
`type: output`, `output_kind: cover-letter`. `source_concepts` lists the project notes behind the fragments.
### Rules
- **Markdown is authoritative.** The `.docx` and `.pdf` are generated, never hand-edited.
- **Evidence only, fail closed.** Every paragraph traces to an approved fragment, a linked project note, or a human-supplied fact. Invented enthusiasm ("I have always dreamed of working at X") and invented company facts are violations, not tone. A real company fact cites its source, such as the Program note's Company Information.
- **Selection.** Two or three real experiences that match the JD's top requirements, never more. Open with something specific to the company, never a general line about passion for the mission.
- **Length.** 250 to 350 words. A different length needs a reason on the content plan, such as the company asking for another format.
- **Format.** Plain text content: no text boxes, images, color, or shading. Never presume a cover letter is required; follow the live posting.
- **Files, overwrite, and approval.** One `<Role> - <Company>.docx` per application in `Cover Letters/`, overwritten in place until `date_applied` is set. The same two-gate order as the resume: approved content plan, then the Humanizer gate.
### Bank sections
Fragments carry tags: `#hook/<archetype>`, `#experience/<theme>`, `#closing/standard`, and an evidence tag (`#evidence/user-confirmed-DATE`, or `#evidence/needed` for a placeholder). A fragment with no confirmed evidence is not eligible. `How This Bank Is Organized` states the fragment types. `Opening Hooks` has one or more hooks per company archetype. `Experience Paragraphs` has one project or role per paragraph. `Closings` restates fit and names the next step. `Logged Gaps` holds claims without a confirmed fact.
> [!WARNING]
> Filling a placeholder with a plausible fragment to make the bank look complete. An honestly empty placeholder is correct until a real fact backs it.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| Template typed `project`, `status: active` | `type: output`, `output_kind: cover-letter` | mechanical |
| Five "Cover Letter - How to ..." stubs of about nine words | Write, or delete | judgment, needs a yes |
| A "Not Yet Built" section in the bank | Remove once real fragments exist | judgment |
## Done Conditions
- The bank holds real, tagged, reusable fragments, not one fixed letter.
- Every letter names two or three real experiences that trace to approved sources.
- No letter passes 350 words without a stated reason.
## Gold Standard Example
None yet. Name the first real `Main Cover Letter.md` here.
