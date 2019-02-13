---
title: Docker proxy &amp; networking
created: '2019-02-13T20:19:51.839Z'
modified: '2019-02-13T20:57:22.730Z'
tags: [docker, Notebooks/Snippets]
---

## Docker proxy & networking


### Build with http proxy

```
docker build --build-arg HTTP_PROXY=http://172.17.0.1:6152 --build-arg HTTPS_PROXY=http://172.17.0.1:6152 .
```

```
docker build --build-arg ALL_PROXY=socks5://172.17.0.1:6153 .
```

### Get host ip

```
docker network inspect bridge --format "{{(index .IPAM.Config 0).Gateway}}"
```


### Get docker ip

`docker-machine ip default`

### Set the registry mirror manually

1. Enter the machine: `docker-machine ssh`
2. Open the config file `sudo vi /var/lib/boot2docker/profile`
3. Edit these line below:

```
EXTRA_ARGS='
--label provider=vmwarefusion
--registry-mirror <mirror>
'
```

1. Remember to `docker-machine restart` after editing the file
