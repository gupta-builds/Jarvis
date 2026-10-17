---
type: system
status: sprout
created: 2026-08-28
updated: 2026-10-16
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
  - "[[Humanized Writing Standard]]"
---
# Resume Alteration Standard
==Every line of every resume traces to approved evidence, and tailoring only selects, orders, and rephrases what is already true.==
This is the contract behind [[Resume Alteration]] (the narrative). It governs `Main Resume.md`, the authoritative bullet bank, and the per-application DOCX files made from it. Tone is checked separately by [[Humanized Writing Standard]]. A resume can pass every rule here and still fail that gate.
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
## Headings
### Frontmatter
`type: output`, `output_kind: resume`. `source_concepts` lists the project notes the bullets draw on. `source_note` links the exported PDF.
### Rules
- **Markdown is authoritative.** `Main Resume.docx` and `.pdf` are generated, never hand-edited. If they disagree, regenerate.
- **Evidence only, fail closed.** Every bullet, skill, and metric traces to an approved bullet in `Main Resume.md`, a linked Jarvis project note, or a fact the human supplied during that application's pass. A JD requirement with none of these is a gap in the content plan, never invented.
- **Tailoring may** select bullets, reorder bullets and Skills, and rephrase to the JD's terms if the fact is unchanged. It may not invent a bullet, metric, tool, or outcome, change a number, claim an unused skill, or inflate scope.
- **ATS baseline.** Single column with no tables, text boxes, or graphics. Familiar section names. Contact details in the body. One consistent date format. Standard fonts at 10 to 12 pt. A text-based PDF under 2.5 MB. One page. JD terms only where they truthfully describe work, each with context and a result; never the same phrase twice with nothing new. GPA only when asked or expected. Sources: [[Resume & Cover Letter - ATS Research Log]].
- **Files.** One `<Role> - <Company>.docx` per application in `Resumes/`, flat, no subfolders. It is overwritten in place until `date_applied` is set, then frozen.
- **Approval gate, in order.** A human approves the traceable content plan, then the draft passes the Humanizer gate. Neither substitutes for the other.
### Main Resume sections
Header, Education, Skills, Experience, Projects, each bullet carrying an evidence tag. `Logged Gaps` holds claims with no confirmed fact. `Tailoring Notes` holds choices that carry across applications.
> [!WARNING]
> Generic filler bullets in the bank. A bullet with no evidence tag is not eligible for a real resume.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: project`, `status: active` | `type: output`, `output_kind: resume`, `status` by maturity | mechanical |
| No `source_concepts` | Add the project notes the bullets use | judgment |
| Five "Resume - How to ..." stubs of nine words or fewer | Write, or delete; a named empty file is not progress | judgment, needs a yes |
| `Altered/` or `Tailored/` subfolder | Flatten into `Resumes/` | mechanical |
## Done Conditions
- `Main Resume.md` holds evidence-tagged bullets a human approved, not generic filler.
- A spot-check traces any line of a per-application resume to an approved source or a logged gap.
- No per-application file sits outside `Resumes/` or collides with `Main Resume.*`.
## Gold Standard Example
[[20_Progress/Internship/Resumes/Main Resume]]: the bullet bank with Logged Gaps and Tailoring Notes. It predates the `output` type and is still partly generic.
