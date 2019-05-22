---
title: Find files older than X days
created: '2019-05-22T12:11:51.576Z'
modified: '2019-05-22T12:13:32.226Z'
tags: [shell]
---

## Find files older than X days

```
find . -depth 1 -type d -mtime +10 -exec echo {} +
```
