---
title: systemd unit file
created: '2019-02-13T20:19:51.847Z'
modified: '2019-02-13T21:14:26.890Z'
tags: [Notebooks/Snippets, systemd]
---

```ini
# /etc/systemd/system/xxx.service
[Unit]
Description=

[Service]
#Type=simple
#WorkingDirectory=/home/shou/opt/grafana
ExecStart=
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

```ini
# Specify binary with relative path
WorkingDirectory=/home/shou/opt/fondbot-rust
ExecStart=/usr/bin/env sh -c "exec ./fondbot"
```

```ini
# Startup notification
Environment=TELEGRAM_BOT_TOKEN=<YOUR_TOKEN>
Environment=TELEGRAM_LOG_CHANNEL=<CHANNEL_ID>
ExecStartPre=/usr/bin/env sh -c 'curl "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage?text=Service%20started&chat_id=${TELEGRAM_LOG_CHANNEL}" 2>/dev/null'
```

```ini
# Redirect stdin/stdout to files
[Unit]
StandardOutput=/home/shou/opt/fondbot-rust/out.log
StandardError=/home/shou/opt/fondbot-rust/err.log
```

```ini
[Unit]
# Periodically kill and restart
Restart=always
WatchdogSec=86400
```

See:

* [https://access.redhat.com/documentation/en-US/Red\_Hat\_Enterprise\_Linux/7/html/System\_Administrators\_Guide/sect-Managing\_Services\_with\_systemd-Unit\_Files.html](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/System_Administrators_Guide/sect-Managing_Services_with_systemd-Unit_Files.html)
* [systemctl commands](quiver:///notes/059932C4-818F-42EF-AD33-1259D2CB7752)
