---
title: systemctl commands
created: '2019-02-13T20:19:51.846Z'
modified: '2019-02-13T21:14:46.417Z'
tags: [Notebooks/Snippets, systemd]
---

```sh
# inspect unit file
systemctl cat <unit>

# patch a unit (will start an $EDITOR)
systemctl edit <unit>

# reload after editing/adding unit files
systemctl daemon-reload

# check detailed log
journalctl -u influxdb

```

See [systemd unit file](quiver:///notes/3A52A7FE-0285-49A5-856D-36D4E4B0EB28)
