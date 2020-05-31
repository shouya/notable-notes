---
title: Manually ban nginx malicous requests
tags: [Notebooks]
created: '2019-06-18T10:50:13.029Z'
modified: '2019-06-18T10:50:41.927Z'
---

# Manually ban nginx malicous requests

```
sudo grep 'wp-login' /var/log/nginx/access.log.1 | awk '{print $1}' | sort | uniq | xargs -I{} echo ufw deny from {}/32
```


