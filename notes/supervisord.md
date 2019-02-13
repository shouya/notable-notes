---
title: supervisord
created: '2019-02-13T20:19:51.846Z'
modified: '2019-02-13T20:21:08.668Z'
tags: [Notebooks/Snippets]
---

Sample config:

```sh
[program:ss-4444]
command=/home/shou/opt/shadowsocks-libev/src/ss-server -c /home/shou/data/ss-4444.conf -v
autostart=true
autorestart=true
# specify user other than root to run the program
user=shou
# because `supervisorctl tail` is so stupid
stderr_logfile=/var/log/ss444.err.log
stdout_logfile=/var/log/ss444.out.log
```

After adding config:

```sh
# reload config file
$ supervisorctl reread
# add new unit(s) to process group
$ supervisorctl update
```

Reloading:

```sh
# all process will be restarted, will take few seconds to be available
$ supervisorctl reload
```
