---
title: Win10 troubleshooting tricks
created: '2019-02-13T21:27:14.933Z'
modified: '2019-02-13T21:29:29.530Z'
tags: [windows]
---

# Win10 troubleshooting tricks

## Check for power requests

```powershell
# if won't go to sleep
powercfg -requests
# if waken unexpectedly
powercfg -lastwake
```

ref.https://www.makeuseof.com/tag/fix-windows-10-sleep-mode/
