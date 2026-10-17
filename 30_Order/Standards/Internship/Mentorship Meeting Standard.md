---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - standards
  - mentorship
system_kind: standard
family: mentorship-meeting
tier: 1
maps_to:
  - "[[Mentorship Meeting Template]]"
used_by: []
gold_standard: "[[20_Progress/Mentorship Program/Meetings/Mentor Meeting - One-Pager]]"
notes:
  - "[[Brief Standard]]"
  - "[[Action Standard]]"
  - "[[Transcript to Brief]]"
---
# Mentorship Meeting Standard
==A mentor meeting is one loop: a short plan before, a raw transcript during, a brief and an action map after, and one dated line in the Playbook. This Standard owns the plan; the rest reuse existing Standards.==
This is the standard for the pre-meeting plan in `20_Progress/Mentorship Program/Meetings/` and `Plans/`. The meeting rhythm is alternate Mondays. The standing format is demo, then shipped, blocked, and deciding, then one ask, rotating through the four goals in the Playbook so none is skipped for months.
## Spec
```json
{
  "family": "mentorship-meeting",
  "tier": 1,
  "match": {"type": "project", "kind": "plan", "path": "^20_Progress/Mentorship Program/", "where": {}, "where_not": {}},
  "legacy_match": [{"path": "^20_Progress/Mentorship Program/(Meetings/Mentor Meeting - One-Pager|Plans/Mentor Meeting - Hackathons, Summer, and Networking)\\.md$"}],
  "status": ["active", "paused", "complete", "archived"],
  "required_keys": ["type", "project_kind", "status", "created", "updated", "tags", "meeting_date", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "meeting_date": "text?", "next": "text?"},
  "headings": ["Meeting Focus", "Demo and State", "Questions", "Ask", "After the Meeting"],
  "optional_headings": []
}
```
## Headings
### Frontmatter
`type: project`, `project_kind: plan`, `status: active` until the meeting happens, then `complete`. `meeting_date` is the planned date.
### Meeting Focus
Which of the standing goals this meeting leans on, and the one outcome you want from it.
### Demo and State
One updated artifact to show. Then what shipped, what is blocked, and what you are deciding, each honest about what was real and what was mocked.
### Questions
Two or three questions that only the mentor can answer, each with the decision it would unblock.
### Ask
One concrete ask, such as an introduction, a review, or a recommendation.
### After the Meeting
Task lines: log the actual answers, confirm the next date on the calendar, send the thank-you within a day.
### The rest of the loop
The raw transcript goes in `Meetings/Transcripts/` as an `input` with `input_kind: transcript`. The brief goes in `Meetings/Briefs/` per [[Brief Standard]]. The actions go in `Meetings/Action/` per [[Action Standard]]. The Playbook gets one dated `###` entry in its Session Log, appended and never overwritten.
> [!WARNING]
> Pasting the transcript into the plan note. The transcript is raw and stays untouched; the plan stays short.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| One-Pager: `3 Goals`, `2 Project Pitches`, `3 Questions`, `1 Concrete Ask`, `1 Next Step` | `Meeting Focus`, `Demo and State`, `Questions`, `Ask`, `After the Meeting` | judgment |
| Plan note: `What I Have Done Recently`, `Current Direction`, `What I Want From` the mentor, `Summer Options`, `Meeting Questions`, `Meeting Flow` | The first two become `Demo and State`, the third becomes `Ask`, `Summer Options` folds into `Meeting Focus`, `Meeting Questions` becomes `Questions`, and `Meeting Flow` is dropped because the standing format replaces it | judgment |
| `type: project` with `related:` | Add `project_kind: plan`; move `related` links into `notes` | mechanical |
## Done Conditions
- The plan fits on one screen and ends with a dated checklist.
- The transcript, brief, and actions exist for every held meeting and link to each other.
- The Playbook has an entry for the meeting.
## Gold Standard Example
[[20_Progress/Mentorship Program/Meetings/Mentor Meeting - One-Pager]]: goals, questions, one ask, one next step. It is marked superseded and uses the older headings.
