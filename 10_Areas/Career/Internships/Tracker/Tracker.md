---
type: dashboard
dashboard_kind: board
status: active
created: 2026-11-21
updated: 2026-11-21
tags: [internship, dashboard]
kanban-plugin: board
notes:
  - "[[30_Order/Standards/Operations/Dashboard Standard]]"
---
# Internship Tracker
==Use the board to glance at manual work, then open the corresponding note to update it.==
> [!NOTE] Researched vs. submitted
> Researched counts Program notes. Submitted counts dated Trackers in `Applied/`.

```dataviewjs
const p = dv.pages('"10_Areas/Career/Internships/Programs"').where(n => n.company && (n.reference_kind === "program" || !n.type));
const t = dv.pages('"10_Areas/Career/Internships/Tracker/Each One"').where(n => n.file.folder === "10_Areas/Career/Internships/Tracker/Each One/Applied" && n.type === "tracker" && n.date_applied);
dv.table(["Researched", "Submitted"], [[p.length, t.length]]);
```
## Interesting
## To Apply
## Applying Today
## Applied
%% kanban:settings
```
{"kanban-plugin":"board","list-collapse":[false,false,false,false]}
```
%%
