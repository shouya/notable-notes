---
title: systemd user mode
created: '2019-02-13T20:19:51.847Z'
modified: '2019-02-13T21:14:23.607Z'
tags: [Notebooks/Snippets, systemd]
---

## Automatic start-up of systemd user instances

    $ loginctl enable-linger username

## Directories

* `/usr/lib/systemd/user/` where units provided by installed packages belong.
* `~/.local/share/systemd/user/` where units of packages that have been installed in the home directory belong.
* `/etc/systemd/user/` where system-wide user units are placed by the system administrator.
* `~/.config/systemd/user/` where the user puts its own units.

## Commands

    journalctl --user -u <unit-name.service>

ref. <https://wiki.archlinux.org/index.php/Systemd/User>
