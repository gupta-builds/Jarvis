---
type: system
status: sprout
created: 2026-11-21
updated: 2026-11-21
tags:
  - system
  - standards
  - internship
  - resume
  - cover-letter
system_kind: standard
family: application-documents
tier: 1
maps_to:
  - "[[Internship Cover Letter Template]]"
used_by:
  - "[[Application Document Preparation]]"
gold_standard: none
notes:
  - "[[Resume Alteration]]"
  - "[[Cover Letter Alteration]]"
  - "[[Applying Standard]]"
  - "[[Human Writing Standard]]"
  - "[[Internship Apply Lane]]"
---
# Application Documents Standard
==Every line of every resume and letter traces to approved evidence, tailoring only selects, orders and rephrases what is already true, and nothing is sent before Anant approves it.==
This is the contract behind [[Resume Alteration]] and [[Cover Letter Alteration]]. It governs `Main Resume.md`, the `Main Cover Letter.md` fragment bank, and the per-application DOCX files made from them. It is not the tone check: a document can pass every rule here and still fail [[Human Writing Standard]]. Resumes, letters and the archived packet are private; `Resumes/` is git-ignored today, `Cover Letters/` and `Sent/` have an ignore rule pending.
## Spec
```json
{
  "family": "resume-alteration",
  "tier": 1,
  "match": {"type": "output", "kind": "resume", "path": "^20_Progress/Internship/Resumes/", "where": {}, "where_not": {}},
  "legacy_match": [{"path": "^20_Progress/Internship/Resumes/Main Resume\\.md$"}],
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "output_kind", "status", "created", "updated", "tags", "source_note", "source_concepts", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "source_concepts": "list", "source_note": "text?", "next": "text?"},
  "headings": ["Header", "Education", "Skills", "Experience", "Projects", "Logged Gaps", "Tailoring Notes"],
  "optional_headings": ["Objective", "Certifications"]
}
```
```json
{
  "family": "cover-letter",
  "template": "Internship Cover Letter Template",
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
| Allowed folders | Banks and working drafts: `20_Progress/Internship/Resumes/` and `Cover Letters/`, flat. The sent packet: `20_Progress/Internship/Sent/<dossier file name>/`. |
| File name | `Main Resume.md` and `Main Cover Letter.md` for the banks; `<Role> - <Company>.docx` per application, overwritten until the packet is archived, then frozen in `Sent/`. |
| Kind | `type: output` with `output_kind: resume` or `cover-letter`. |
| Status | `seed` while fragments lack evidence, `sprout` once every fragment is tagged and confirmed, `tree` once an application went out on it. |
## Headings
Paths in the Right and Wrong lines start at `20_Progress/Internship/Resumes/`.
### Frontmatter
- **Write:** `type: output`, `output_kind` (`resume` or `cover-letter`), `source_concepts` (the project notes the content draws on), `source_note` (the exported PDF), `next`.
- **Length:** one line per key.
- **Never:** `type: project`. Main Resume is typed `project`, so it is not found as an output and matches neither Spec.
- **Right:** `source_note: "[[Main Resume.pdf]]"` (`Main Resume.md`)
- **Wrong:** `type: project` (`Main Resume.md`)
### Resume: Header, Education, Skills
- **Write:** contact details in the body, the degree with its expected date, and grouped skills actually used, each with a `#skill/<group>` tag and an evidence tag.
- **Length:** one paragraph each; five or six skill lines.
- **Never:** contact details in a text box or header, where a parser drops them, or a skill never used in a project even if the posting asks for it.
- **Right:** `#skill/programming` (`Main Resume.md`)
- **Wrong:** None seen.
### Resume: Experience, Projects, Logged Gaps, Tailoring Notes
- **Write:** bullets, each tracing to an approved fragment, a linked project note, or a fact Anant supplied, with an evidence tag. Logged Gaps names claims with no confirmed fact so they stay out of any variant. Tailoring Notes holds choices that carry across applications.
- **Length:** two to four bullets per role; one line per gap.
- **Never:** a bullet, metric, tool or outcome that was invented, a changed number, or inflated scope.
- **Right:** `Built and deployed Assisto with Next.js, React.js, JavaScript, and Tailwind CSS.` (`Main Resume.md`)
- **Wrong:** None seen.
### Letter bank
- **Write:** `How This Bank Is Organized` names the fragment types and tags (`#hook/<archetype>`, `#experience/<theme>`, `#closing/standard`, an evidence tag). Hooks are specific to a company. Experience paragraphs are one project or role each. Closings restate fit and name the next step. Logged Gaps names claims with no confirmed fact.
- **Length:** a hook of one to three sentences; a closing of two or three; a letter is 250 to 350 words unless the plan says why not.
- **Never:** a line about passion for the mission, or a placeholder filled with a plausible fragment. An honestly empty placeholder is correct.
- **Right:** None yet. No `Main Cover Letter.md` exists.
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| Markdown is authoritative. The DOCX and PDF are generated, never hand-edited; if they disagree, regenerate | Two sources of truth drift | Reader |
| Evidence only, fail closed. Every bullet, skill, metric and paragraph traces to an approved bullet in `Main Resume.md`, a fragment, a linked project note, or a fact Anant supplied. A company fact cites its source. A posting requirement with none is a gap, never invented | A resume is a claim an employer will test | Reader |
| Tailoring may select, reorder and rephrase to the posting's terms if the fact is unchanged. It may not invent, change a number, claim an unused skill, or inflate scope | Tailoring changes emphasis, not facts | Reader |
| The resume variant comes from the dossier's `resume_variant` (`ai`, `fullstack`, `systems`, `other`) and only selects tagged bullets | A variant is a view of approved content | Reader |
| The letter follows `letter_mode`: `tailored` for tier 1, `bank` plus one company hook for tier 2, `none` for tier 3 unless the form requires one. Open with something specific to the company; use two or three real experiences | A letter is read start to finish by a person | Reader |
| ATS baseline: single column, no tables, text boxes or graphics; familiar section names; one date format; standard fonts; a text-based PDF; one page. Posting terms only where they truthfully describe work | A parser that drops a section loses the evidence. Sources: [[Resume & Cover Letter - ATS Research Log]] | Reader |
| Anant approves everything before it is sent. Tier 1 and tier 2: the Applying note's `stage` reaches `approved` after the content plan and the humanized draft are approved, and before anything is archived. Tier 3: `mark_applied` asks for confirmation before it archives. The Tracker carries no approval key | Evidence and tone are separate checks, and nothing leaves unapproved | Reader |
| The humanizer gate runs on every draft before a DOCX is written: a pass or fail with line-level flags, never a silent rewrite | Tone is checked after evidence | Reader |
| The packet in `Sent/<dossier file name>/` holds the exact resume DOCX, the letter DOCX when one is sent, and `posting.md`, and is never edited after | The record of what was sent must be the file that was sent | Reader |
| The resume has its seven headings and the letter bank its five, in order | The banks are read by section | Lint, check 2 |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: project`, `status: active` (Main Resume) | `type: output`, `output_kind: resume`, `status` by maturity | Mechanical |
| No `source_concepts` | Add the project notes the content uses | Judgment |
| Five "Resume - How to ..." and five "Cover Letter - How to ..." stubs of about nine words | Write or delete; a named empty file is not progress | Judgment, needs a yes |
| `Altered/` or `Tailored/` subfolder, or `Build the first Tailored/ cut` in `next` | Flatten into `Resumes/` | Mechanical |
| A "Not Yet Built" section in a bank | Remove once real fragments exist | Judgment |
## Done Conditions
- `Main Resume.md` holds evidence-tagged bullets Anant approved, and the letter bank holds real, tagged fragments.
- A spot-check traces any line of a sent document to an approved source or a logged gap.
- Every sent application has its packet in `Sent/`, and its approval reached `approved` first (tier 1 and tier 2) or was confirmed at archive (tier 3).
- The notes pass [[Vault Lint]] for `resume-alteration` and `cover-letter`.
## Gold Standard Example
None yet. `Main Resume.md` is the bullet bank with evidence tags, Logged Gaps and Tailoring Notes, but it is typed `project`, so it matches neither Spec and does not pass lint. No `Main Cover Letter.md` exists. The first note that passes should be named here.
Measured 2026-11-21 with `--family resume-alteration` and `--family cover-letter`: 0 notes each.
