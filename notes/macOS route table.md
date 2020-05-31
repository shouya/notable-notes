---
title: macOS route table
created: '2019-02-13T20:19:51.842Z'
modified: '2019-02-13T21:08:28.745Z'
tags: [cmdline, Notebooks/Snippets]
---

**List table**:

    netstat -rn

**Check rule**:

    route -n get 10.241.116.71

**Modify table**:

    route -n add -net 10.241.0.0/16 -interface zt1
    route -n add -net 10.241.0.0/16 -gw 192.168.1.1
    route -n delete default
    route change default -interface $INTF

**Modify table**:

    route -n add -net 10.241.0.0/16 -interface zt1
    route -n add -net 10.241.0.0/16 -gw 192.168.1.1
    route -n delete default
    route change default -interface $INTF

**Set priority (metric)**:

    route add -net 1.2.3.0 123.123.123.123 0.0.0.0 -hopcount 4
    # The larger a hopcount, the lower the priority

**Flags**:

- U (route is up)
- H (target is a host)
- G (use gateway)
- R (reinstate route for dynamic routing)
- D (dynamically installed by daemon or redirect)
- M (modified from routing daemon or redirect)
- A (installed by addrconf)
- C (cache entry)
- ! (reject route)

#cmdline
