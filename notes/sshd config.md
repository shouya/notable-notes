---
title: sshd config
created: '2019-02-13T20:19:51.845Z'
modified: '2019-02-13T20:21:08.665Z'
tags: [Notebooks/Snippets]
---

```sh
Port 233
ListenAddress 0.0.0.0
Protocol 2
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
RSAAuthentication yes
AllowUsers shou git
AcceptEnv LANG LC_*

Ciphers aes128-ctr,aes192-ctr,aes256-ctr,arcfour256,arcfour128,aes128-cbc,3des-cbc
HostKeyAlgorithms ssh-rsa,ssh-dss
MACs hmac-md5,hmac-sha1,hmac-ripemd160
LogLevel VERBOSE

```
