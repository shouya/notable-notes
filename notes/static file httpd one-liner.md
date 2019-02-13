---
title: static file httpd one-liner
created: '2019-02-13T20:19:51.845Z'
modified: '2019-02-13T20:21:08.667Z'
tags: [Notebooks/Snippets]
---

```sh
# WEBricks
# multi-threaded, cont, full speed

ruby -run -ehttpd . -p8000
```

```sh
# Doc

shou@catnode:~$ ruby -run -ehttpd -- --help
Run WEBrick HTTP server.

  ruby -run -e httpd -- [OPTION] DocumentRoot

  --bind-address=ADDR         address to bind
  --port=NUM                  listening port number
  --max-clients=MAX           max number of simultaneous clients
  --temp-dir=DIR              temporary directory
  --do-not-reverse-lookup     disable reverse lookup
  --request-timeout=SECOND    request timeout in seconds
  --http-version=VERSION      HTTP version
  -v                          verbose

```

Other alternatives:

<https://gist.github.com/willurd/5720255>

#http
