---
title: Query IP UA from CLI
created: '2019-02-13T20:19:51.836Z'
modified: '2019-02-13T20:27:10.074Z'
tags: [cmdline, network, Notebooks/Snippets]
---

**Fast!**

`curl ident.me`

`curl v4.ident.me`

`curl v6.ident.me`

**Without cURL**

`dig +short myip.opendns.com @resolver1.opendns.com`

`wget -O - -q icanhazip.com`

**Alternative**

`curl icanhazip.com`

`curl ipv4.icanhazip.com`
