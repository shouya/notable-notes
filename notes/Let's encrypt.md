---
title: Let's encrypt
created: '2019-02-13T20:19:51.835Z'
modified: '2019-02-13T20:21:08.633Z'
tags: [Notebooks/Snippets]
---

```sh
# /etc/nginx/letsencrypt_webroot.conf

location /.well-known/acme-challenge {
    alias /etc/letsencrypt/webrootauth/.well-known/acme-challenge;
    location ~ /.well-known/acme-challenge/(.*) {
        add_header Content-Type application/jose+json;
    }
}
```

```sh
# /etc/nginx/conf.d/default.conf

server {
    listen 80;
    server_name lain.li linode.lain.li services.lain.li log.lain.li;
    include letsencrypt_webroot.conf;
    return 301 https://$host$request_uri;
}
```

#ssl
