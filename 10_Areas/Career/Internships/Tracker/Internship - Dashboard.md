---
type: dashboard
dashboard_kind: dashboard
status: active
created: 2026-07-09
updated: 2026-11-21
tags: [internship, dashboard]
notes:
  - "[[30_Order/Standards/Operations/Dashboard Standard]]"
---
# Internship Dashboard
Open [[20_Progress/Internship/Applying/Apply Today|Apply Today]] for work in flight and [[20_Progress/Internship/Applying/Now|Now]] for submissions.
## Today’s tasks
> [!NOTE]
> ==Read incomplete internship tasks from today’s daily note.==

```dataviewjs
const day = dv.date("today").toFormat("yyyy-MM-dd");
const daily = dv.page("10_Areas/Life/Enumerate/Daily/" + day);
const tasks = daily ? daily.file.tasks.where(t => !t.completed && /internship|apply today/i.test(t.text)) : [];
if (tasks.length) dv.taskList(tasks, false); else dv.paragraph("No matching tasks in today’s daily note.");
```
## What shipped
> [!NOTE]
> ==Read completed internship tasks recorded in the daily notes.==

```dataviewjs
const day = dv.date("today").startOf("day");
const daily = dv.pages('"10_Areas/Life/Enumerate/Daily"').where(p => p.file.day);
for (const [label, from, to] of [["Yesterday",day.minus({days:1}),day.minus({days:1})],["This week",day.startOf("week"),day]]) {
  const tasks = daily.where(p => p.file.day >= from && p.file.day <= to).file.tasks.where(t => t.completed && /internship|apply today/i.test(t.text));
  dv.header(3,label);
  if (tasks.length) dv.taskList(tasks,false); else dv.paragraph("No matching completed tasks.");
}
```
## Career streak
> [!NOTE]
> ==Count consecutive daily notes with `win_career` checked.==

```dataviewjs
const root = "10_Areas/Life/Enumerate/Daily/";
let day = dv.date("today").startOf("day");
if (!dv.page(root + day.toFormat("yyyy-MM-dd"))) day = day.minus({days:1});
let count = 0;
while (dv.page(root + day.toFormat("yyyy-MM-dd"))?.win_career === true) {
  count++;
  day = day.minus({days:1});
}
dv.paragraph(count + (count === 1 ? " day" : " days"));
```
## Dossier capacity
> [!NOTE]
> ==Count the four role folders and the Career Fair folder.==

```dataviewjs
const root = "10_Areas/Career/Internships/List/Dossiers";
const buckets = ["1 - AI & ML","2 - Fullstack","3 - CyS & Finance","Other","_Career Fair"];
const counts = buckets.map(name => [name,dv.pages(`"${root}/${name}"`).where(p => p.file.folder === root + "/" + name && p.company).length]);
dv.table(["Folder","Dossiers"],counts);
```
See [[20_Progress/Internship/Building System/Source of Truth|Source of Truth]] for limits.
## Escalations
==Use [[10_Areas/Career/Internships/Tracker/Main Log|Main Log]] to review unresolved issues that have been verified.==
