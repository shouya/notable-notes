---
title: docker clean up
created: '2019-02-13T20:19:51.839Z'
modified: '2019-02-13T20:57:34.152Z'
tags: [docker, Notebooks/Snippets]
---

```sh
# 1. Make sure that exited containers are deleted.

docker rm -v $(docker ps -a -q -f status=exited)


# 2. Remove unwanted ‘dangling’ images.

docker rmi $(docker images -f "dangling=true" -q)


# 3. Still not enough space? What is this ‘vfs’ directory?

docker volume rm $(docker volume ls -qf dangling=true)
```

ref: <http://blog.yohanliyanage.com/2015/05/docker-clean-up-after-yourself/>
