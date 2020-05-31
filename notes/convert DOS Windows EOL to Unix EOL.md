---
title: convert DOS Windows EOL to Unix EOL
created: '2019-02-13T20:19:51.838Z'
modified: '2019-02-13T20:30:08.730Z'
tags: [Notebooks/Snippets, vim]
---

Convert "\r\n" (`^M`) to "\n" in a file.

```viml
" open the file with vim
:set ff=unix
" :set ff=dos (if you want dos EOL)
:wq
```

To enter `^M`, hit `^V^M`.
