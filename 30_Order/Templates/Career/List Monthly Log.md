---
type: dashboard
dashboard_kind: dashboard
status: active
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - internship
  - list
month: <% tp.date.now("YYYY-MM") %>
next:
---
# <% tp.file.title %>
## Postings
```dataview
TABLE company, title as "Role", url as "Link", matched_reason as "Why It Matched", status
FROM "10_Areas/Career/Internships/List/Dossiers"
WHERE date_found >= date(this.month + "-01") AND date_found < date(this.month + "-01") + dur(1 month)
SORT date_found DESC
```
## Promotion Rule
<!-- A dossier moves to seed, tree, or archived by the Internship Notes Standard; promotion creates a Program, Contact, and Tracker note. -->
