---
title: systemd timer
created: '2019-02-13T20:19:51.846Z'
modified: '2019-02-13T21:14:30.050Z'
tags: [Notebooks/Snippets, systemd]
---

```ini
# sync-portage.timer
[Unit]
Description=Update Portage daily

[Timer]
OnBootSec=1min
OnUnitActiveSec=2h
Unit=sync-portage.service

[Install]
WantedBy=timers.target
```
