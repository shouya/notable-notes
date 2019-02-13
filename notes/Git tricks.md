---
title: Git tricks
created: '2019-02-13T20:19:51.834Z'
modified: '2019-02-13T20:24:14.196Z'
tags: [git, Notebooks/Snippets]
---

## Rebase

### Change of the base of a branch

Say you have:

    master ----- o -- o
          \
           ----- o -- o -- staging 
                               \
                                ---- A -- B -- C (your-branch)

Run:

```bash
git checkout your-branch
git rebase --onto master staging your-branch
```

> --onto A B C: replay actions C relative to B on A
