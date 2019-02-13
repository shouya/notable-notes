---
title: global proxy router
created: '2019-02-13T20:19:51.841Z'
modified: '2019-02-13T20:21:08.651Z'
tags: [Notebooks/Snippets]
---

on.sh

```sh
#!/bin/bash

# start SHADOWSOCKS
/etc/init.d/ss-redir start

# start dns
dnscrypt-proxy /etc/dnscrypt-proxy/dnscrypt-proxy.conf
# cp /etc/dnsmasq.conf.bak /etc/dnsmasq.conf
/etc/init.d/dnsmasq restart

# create chnroute ipset
ipset -N chnroute hash:net maxelem 65536
for ip in $(cat /etc/china_ip_list.txt); do
  ipset add chnroute $ip;
done

# new chain
iptables -t nat -N SHADOWSOCKS

# bypass shadowsocks server
iptables -t nat -A SHADOWSOCKS -d <SHADOWSOCKS_SERVER_IP> -j RETURN

# ignore internal ip
iptables -t nat -A SHADOWSOCKS -d 0.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 10.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 127.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 169.254.0.0/16 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 172.16.0.0/12 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 192.168.0.0/16 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 224.0.0.0/4 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 240.0.0.0/4 -j RETURN

# direct connect to chn ip
iptables -t nat -A SHADOWSOCKS -p tcp -m set --match-set chnroute dst -j RETURN

# otherwise go through proxy
iptables -t nat -A SHADOWSOCKS -p tcp -j REDIRECT --to-ports 1080

iptables -t nat -I PREROUTING -p tcp -j SHADOWSOCKS
```

off.sh

```sh
#!/bin/bash
/etc/init.d/ss-redir stop

# delete prerouting redirection
iptables -t nat -D PREROUTING -p tcp -j SHADOWSOCKS

# delete chain
iptables -t nat -F SHADOWSOCKS
iptables -t nat -X SHADOWSOCKS

# delete ipset
ipset destroy chnroute
```
