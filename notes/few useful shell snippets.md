---
title: few useful shell snippets
created: '2019-02-13T20:19:51.840Z'
modified: '2019-02-13T21:06:39.098Z'
tags: [Notebooks/Snippets, shell]
attachments: [shell-startup-order.png]
---

## Bash tricks

Exit on error:

    set -e

Output commands as they run:

    set -x

## Argument tricks

Last arg:

    !$

All arg except first ($0):

    !:1-$

Remove everything up to the folder (like dirname):

    cd !$:h

## Startup order

![](@attachment/shell-startup-order.png)

src. https://blog.flowblok.id.au/2013-02/shell-startup-scripts.html

## Watch file change & build

Build latex doc on the fly: 

    fswatch *.tex | while read; do (pdflatex master.tex <&-); done
