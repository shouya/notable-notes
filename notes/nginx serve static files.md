---
title: nginx serve static files
created: '2019-02-13T20:19:51.843Z'
modified: '2019-02-13T20:21:08.658Z'
tags: [Notebooks/Snippets]
---

```sh
location /ut-list/ {
    alias /home/shou/ut-downloads/;
    index nofileisindex.html;
    autoindex on;
    
    allow <MY IP>;
    deny all;
}
```

#nginx
