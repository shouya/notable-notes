---
title: sudoers (visudo)
created: '2019-02-13T20:19:51.845Z'
modified: '2019-02-13T20:21:08.667Z'
tags: [Notebooks/Snippets]
---

Env variables keep:

```sh
Defaults        env_keep += "LANG LANGUAGE LINGUAS LC_* _XKB_CHARSET"
Defaults        env_keep += "EDITOR http_proxy https_proxy"
```

Set default editor:

```sh
Defaults        editor = "/usr/bin/vim"
```

Set nopasswd for specific user:

```sh
shou    ALL=(ALL) NOPASSWD: ALL
```

> put this line after `%sudo` so the config for the group will not override yours

Set nopassword for a group:

```sh
%sudo   ALL=(ALL) NOPASSWD: ALL
```

Whole file to be tee-ed:

```sh
#
# This file MUST be edited with the 'visudo' command as root.
#
# Please consider adding local content in /etc/sudoers.d/ instead of
# directly modifying this file.
#
# See the man page for details on how to write a sudoers file.
#
Defaults	env_reset
Defaults	mail_badpass
Defaults	secure_path="/snap/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
Defaults	editor="/usr/bin/vim"

# Host alias specification

# User alias specification

# Cmnd alias specification

# User privilege specification
root	ALL=(ALL:ALL) ALL


# Members of the admin group may gain root privileges
%admin ALL=(ALL) ALL

# Allow members of group sudo to execute any command
%sudo	ALL=(ALL:ALL) ALL
shou	ALL=(ALL) NOPASSWD: ALL

# See sudoers(5) for more information on "#include" directives:

#includedir /etc/sudoers.d
```
