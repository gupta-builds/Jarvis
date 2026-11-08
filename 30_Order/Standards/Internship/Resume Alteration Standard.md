---
type: system
status: sprout
created: 2026-08-28
updated: 2026-11-07
tags:
  - system
  - standards
  - internship
  - resume
system_kind: standard
family: resume-alteration
tier: 1
maps_to: []
used_by: []
gold_standard: "[[20_Progress/Internship/Resumes/Main Resume]]"
notes:
  - "[[Resume Alteration]]"
  - "[[Cover Letter Alteration Standard]]"
  - "[[Application Document Preparation]]"
  - "[[Human Writing Standard]]"
---
# Resume Alteration Standard
==Every line of every resume traces to approved evidence, and tailoring only selects, orders, and rephrases what is already true.==
This is the contract behind [[Resume Alteration]] (the narrative). It governs `Main Resume.md`, the authoritative bullet bank, and the per-application DOCX files made from it. It is not the tone check: a resume can pass every rule here and still fail [[Human Writing Standard]]. It is not the cover letter ([[Cover Letter Alteration Standard]]).
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

| Item | Rule |
|---|---|
| Allowed folders | `20_Progress/Internship/Resumes/`, flat, no subfolders. |
| File name | `Main Resume.md` for the bank; `<Role> - <Company>.docx` per application. Overwritten in place until `date_applied` is set, then frozen. |
| Kind | `type: output` with `output_kind: resume`. |
| Status | `seed` while bullets lack evidence, `sprout` once every bullet is tagged, `tree` once an application went out on it. |
## Headings
### Frontmatter
- **Write:** `type: output`, `output_kind: resume`, `source_concepts` (the project notes the bullets draw on), `source_note` (the exported PDF), `next`.
- **Length:** one line per key.
- **Never:** `type: project`. Main Resume is typed `project`, so it is not found as an output and does not match this family.
- **Right:** `source_note: "[[Main Resume.pdf]]"`
- **Wrong:** `type: project`
### Header, Education
- **Write:** contact details in the body and the degree with its expected date, each with an evidence tag.
- **Length:** one paragraph each.
- **Never:** contact details in a text box or header, where a parser drops them.
- **Right:** `Pursuing a Bachelor of Science in Computer Science`
- **Wrong:** None seen.
### Skills
- **Write:** grouped lines of skills actually used, each with a `#skill/<group>` tag and an evidence tag.
- **Length:** five or six lines.
- **Never:** a skill never used in a project, even if the JD asks for it.
- **Right:** `#skill/programming`
- **Wrong:** None seen.
### Experience, Projects
- **Write:** bullets, each tracing to an approved fragment, a linked project note, or a fact the human supplied, with an evidence tag.
- **Length:** two to four bullets per role.
- **Never:** a bullet, metric, tool, or outcome that was invented, a changed number, or inflated scope.
- **Right:** `Built and deployed Assisto with Next.js, React.js, JavaScript, and Tailwind CSS.`
- **Wrong:** None seen.
### Logged Gaps
- **Write:** claims with no confirmed fact, named so they stay out of any tailored resume until a real fact backs them.
- **Length:** one line per gap.
- **Never:** a gap filled with an inferred skill.
- **Right:** `The following project names were supplied without a fact inventory.`
- **Wrong:** None seen.
### Tailoring Notes
- **Write:** choices that carry across applications.
- **Length:** three to six lines.
- **Never:** a tailoring choice that invents.
- **Right:** `- Reorder skills only when the named skill was actually used.`
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| Markdown is authoritative. `Main Resume.docx` and `.pdf` are generated, never hand-edited; if they disagree, regenerate | Two sources of truth drift | Reader |
| Evidence only, fail closed. Every bullet, skill, and metric traces to an approved bullet in `Main Resume.md`, a linked project note, or a fact the human supplied that pass. A JD requirement with none is a gap in the content plan, never invented | A resume is a claim an employer will test | Reader |
| Tailoring may select bullets, reorder bullets and Skills, and rephrase to the JD's terms if the fact is unchanged. It may not invent, change a number, claim an unused skill, or inflate scope | Tailoring changes emphasis, not facts | Reader |
| ATS baseline: single column, no tables, text boxes, or graphics; familiar section names; contact details in the body; one date format; standard fonts at 10 to 12 pt; a text-based PDF under 2.5 MB; one page. JD terms only where they truthfully describe work. GPA only when asked | A parser that drops a section loses the evidence. Sources: [[Resume & Cover Letter - ATS Research Log]] | Reader |
| One `<Role> - <Company>.docx` per application, flat in `Resumes/`, overwritten until `date_applied` is set | A frozen file is the record of what was sent | Reader |
| A human approves the traceable content plan, then the draft passes the humanizer gate; neither substitutes for the other | Evidence and tone are separate checks | Reader |
| The seven headings appear in order | The bank is read by section | Lint, check 2 |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: project`, `status: active` (Main Resume) | `type: output`, `output_kind: resume`, `status` by maturity | Mechanical |
| No `source_concepts` | Add the project notes the bullets use | Judgment |
| Five "Resume - How to ..." stubs of nine words or fewer | Write, or delete; a named empty file is not progress | Judgment, needs a yes |
| `Altered/` or `Tailored/` subfolder, or `Build the first Tailored/ cut` in `next` | Flatten into `Resumes/` | Mechanical |
## Done Conditions
- `Main Resume.md` holds evidence-tagged bullets a human approved, not generic filler.
- A spot-check traces any line of a per-application resume to an approved source or a logged gap.
- No per-application file sits outside `Resumes/` or collides with `Main Resume.*`.
- The note passes [[Vault Lint]] for `resume-alteration`.
## Gold Standard Example
[[20_Progress/Internship/Resumes/Main Resume]]: the bullet bank with evidence tags, Logged Gaps, and Tailoring Notes. It does not match this family and so does not pass lint: it is typed `project`.
Measured 2026-11-07 with `--family resume-alteration`: 0 notes. The one resume note is outside the Spec's `output` type.
