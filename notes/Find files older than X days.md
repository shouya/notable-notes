---
title: Find files older than X days
created: '2019-05-22T12:11:51.576Z'
modified: '2019-05-29T04:10:13.778Z'
tags: [shell]
---

## Find files older than X days

```
find . -maxdepth 1 -type d -mtime +10 -exec echo {} +
```
