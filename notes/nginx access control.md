---
title: nginx access control
created: '2019-02-13T20:19:51.842Z'
modified: '2019-02-13T20:21:08.657Z'
tags: [Notebooks/Snippets]
---

```sh
# Basic auth

auth_basic "user:pass";
```

```sh
# Either Basic auth or HTTP access

location / {
  satisfy    any;
  
  allow      192.168.1.0/32;
  allow      127.0.0.0/32;
  deny       all;
  
  auth_basic "user:pass";
}
```
