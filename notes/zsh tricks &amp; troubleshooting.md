---
title: zsh tricks &amp; troubleshooting
tags: [Notebooks/Snippets]
created: '2019-02-13T21:26:29.662Z'
modified: '2019-02-13T21:25:59.544Z'
---

## zsh tricks & troubleshooting

### measure startup time

```bash
time zsh -i -c exit
```

ref.http://blog.askesis.pl/post/2017/04/how-to-debug-zsh-startup-time.html

### .zshistory won't stay as symlink

```
export HISTSIZE=10000000
export SAVEHIST=10000000
export HISTFILE=~/Sync/config/.zshistory
```
