---
title: SQL Snippets
created: '2019-02-13T20:19:51.837Z'
modified: '2019-02-13T20:29:18.324Z'
tags: [Notebooks/Snippets, sql]
---

## Remove duplicate rows (pg):

```sql
delete from hub_investments
where id in (
	select t.id from
	(
		select id, row_number() over (partition by invest_case_id, organization_id) as rnum
		from hub_investments
	) t
	where t.rnum > 1
);
```
