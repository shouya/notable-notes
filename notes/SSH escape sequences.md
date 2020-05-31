---
title: SSH escape sequences
created: '2019-02-13T20:19:51.838Z'
modified: '2019-02-13T20:21:08.639Z'
tags: [Notebooks/Snippets]
---

```
Supported escape sequences:
  ~.  - terminate connection (and any multiplexed sessions)
  ~B  - send a BREAK to the remote system
  ~C  - open a command line
  ~R  - Request rekey (SSH protocol 2 only)
  ~^Z - suspend ssh
  ~#  - list forwarded connections
  ~&  - background ssh (when waiting for connections to terminate)
  ~?  - this message
  ~~  - send the escape character by typing it twice
```

ref. https://lonesysadmin.net/2011/11/08/ssh-escape-sequences-aka-kill-dead-ssh-sessions/
