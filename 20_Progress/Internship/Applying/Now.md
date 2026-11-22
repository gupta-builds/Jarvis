---
type: dashboard
dashboard_kind: dashboard
status: active
created: 2026-07-26
updated: 2026-11-21
tags: [internship, dashboard]
notes:
  - "[[30_Order/Standards/Operations/Dashboard Standard]]"
---
# Now
Private, ignore rule pending. Open this after submission to see the Tracker record and the next scheduled follow-up.
## Submitted applications
==A row appears when the submission Tracker is in `Applied/` and has `date_applied`.==
> [!NOTE] Reading a row
> Title comes from the Tracker filename. The date column shows the next scheduled checkpoint from the submission date. Check the Timeline for follow-ups already sent.

```dataviewjs
const root = "10_Areas/Career/Internships/Tracker/Each One";
const today = dv.date("today").startOf("day");
const items = dv.pages(`"${root}"`).where(p => p.file.folder === root + "/Applied" && p.type === "tracker" && p.date_applied).sort(p => p.date_applied, "desc");
dv.table(["Company", "Title", "Tier", "Applied", "Next follow-up date", "Result", "Tracker"], items.map(p => {
  const suffix = p.company ? " - " + p.company : "";
  const title = suffix && p.file.name.endsWith(suffix) ? p.file.name.slice(0, -suffix.length) : p.file.name;
  const applied = dv.date(p.date_applied).startOf("day");
  const checkpoints = [7, 14].map(days => applied.plus({days}));
  const due = checkpoints.find(date => date >= today) ?? null;
  return [p.company, title, p.tier, applied, due, p.result, p.file.link];
}));
```
Keep in-flight work in [[20_Progress/Internship/Applying/Apply Today|Apply Today]].
