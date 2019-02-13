---
title: Kernel enable BBR
created: '2019-02-13T20:19:51.841Z'
modified: '2019-02-13T21:07:55.698Z'
tags: [kernel, Notebooks/Snippets]
---

Kernel enable BBR

Check up:

```sh
# List currently available congestion control strategies
sysctl net.ipv4.tcp_available_congestion_control

# Check current TCP congestion control, should be cubic or so
sysctl net.ipv4.tcp_congestion_control

# Check current default qdisk
sysctl net.core.default_qdisc
```

Try enabling the bbr:

```sh
sudo sysctl net.ipv4.tcp_congestion_control=bbr
sudo sysctl net.core.default_qdisc=fq

# Check if bbr is now available
sysctl net.ipv4.tcp_available_congestion_control
```

Consolidate the setting:

```sh
sudo bash -c 'echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf'
sudo bash -c 'echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf'
```

#kernel
