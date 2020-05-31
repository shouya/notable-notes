---
title: NGINX custom build
created: '2019-02-13T20:19:51.842Z'
modified: '2019-02-13T21:26:37.148Z'
tags: [nginx, Notebooks/Snippets]
---

NGINX custom build

Options for reference (based on default ubuntu version):

```
./configure --with-cc-opt='-g -O2 -fPIE -fstack-protector-strong -Wformat -Werror=format-security -fPIC -Wdate-time -D_FORTIFY_SOURCE=2' --with-ld-opt='-Wl,-Bsymbolic-functions -fPIE -pie -Wl,-z,relro -Wl,-z,now -fPIC' --prefix=/usr --conf-path=/etc/nginx/nginx.conf --http-log-path=/var/log/nginx/access.log --error-log-path=/var/log/nginx/error.log --lock-path=/var/lock/nginx.lock --pid-path=/run/nginx.pid --modules-path=/usr/lib/nginx/modules --http-client-body-temp-path=/var/lib/nginx/body --http-fastcgi-temp-path=/var/lib/nginx/fastcgi --http-proxy-temp-path=/var/lib/nginx/proxy --http-scgi-temp-path=/var/lib/nginx/scgi --http-uwsgi-temp-path=/var/lib/nginx/uwsgi --with-debug --with-pcre-jit --with-ipv6 --with-http_ssl_module --with-http_stub_status_module --with-http_realip_module --with-http_auth_request_module --with-http_v2_module --with-http_dav_module --with-http_slice_module --with-threads --with-http_addition_module --with-http_geoip_module=dynamic --with-http_gunzip_module --with-http_gzip_static_module --with-http_image_filter_module=dynamic --with-http_sub_module --with-http_xslt_module=dynamic --with-stream=dynamic --with-stream_ssl_module --with-mail=dynamic --with-mail_ssl_module --add-module=./ngx_http_google_filter_module --add-module=./ngx_http_substitutions_filter_module --add-module=./echo-nginx-module

```

Libs required:

- libxml: libxml2-dev
- libxslt: libxslt-dev
- GD: libgd2-xpm-dev
- geoip: libgeoip-dev

Change server name/version number:

```
nano src/http/ngx_http_header_filter_module.c
static char ngx_http_server_string[] = "Server: nginx" CRLF;

```

and

```
nano src/core/nginx.h 
#define NGINX_VER          "nginx/" NGINX_VERSION
#define NGINX_VERSION      "5.5.5"

```
