---
title: nginx ssl
created: '2019-02-13T20:19:51.843Z'
modified: '2019-02-13T21:09:36.622Z'
tags: [nginx, Notebooks/Snippets, security]
---

```perl
# ssl.conf

ssl_certificate /etc/letsencrypt/live/lain.li/fullchain.pem;
ssl_certificate_key /etc/letsencrypt/live/lain.li/privkey.pem;

ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
ssl_prefer_server_ciphers on;
ssl_dhparam /etc/ssl/certs/dhparams.pem;
ssl_ciphers 'EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH';
# ssl_ciphers 'EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:ECDHE-RSA-AES128-SHA:DHE-RSA-AES128-GCM-SHA256:AES256+EDH:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA256:ECDHE-RSA-AES256-SHA:DHE-RSA-AES256-SHA256:DHE-RSA-AES128-SHA256:DHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA:ECDHE-RSA-DES-CBC3-SHA:EDH-RSA-DES-CBC3-SHA:AES256-GCM-SHA384:AES128-GCM-SHA256:AES256-SHA256:AES128-SHA256:AES256-SHA:AES128-SHA:DES-CBC3-SHA:HIGH:!aNULL:!eNULL:!EXPORT:!DES:!MD5:!PSK:!RC4';
ssl_session_timeout 1d;
ssl_session_cache shared:SSL:50m;

ssl_stapling on;
ssl_stapling_verify on;

add_header Strict-Transport-Security max-age=15768000;
```

```perl
# conf.d/default.conf

server {
    listen 443 ssl;
    server_name catnode.lain.li lin.lain.li cat.lin.lain.li;

    include ssl.conf;

    location /ut-list/ {
        alias /home/shou/ut-downloads/;
        index nofileisindex.html;
        autoindex on;
        autoindex_exact_size off;
        include ip_whitelist_admin.conf;
    }
}

server {
    listen 80;
    server_name catnode.lain.li lin.lain.li cat.lin.lain.li;
    return 301 https://$host$request_uri;
}
```

```perl
# Generating custom dhparam.pem

$ openssl dhparam -out dhparams.pem 2048
```

SSL Test:

<https://www.ssllabs.com/ssltest/>

Security guide:

<https://scotthelme.co.uk/a-plus-rating-qualys-ssl-test/>
