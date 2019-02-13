---
title: Private API
created: '2019-02-13T20:19:51.836Z'
modified: '2019-02-13T20:54:36.866Z'
tags: [Notebooks/Snippets]
---

## Private API

## Express tracking

Query for service provider:

https://www.kuaidi100.com/autonumber/autoComNum?text=\<tracking-no>

Query for progresss:

https://www.kuaidi100.com/query?type=debangwuliu&postid=\<tracking-no>

use the service provider acquired using the API above. Also:

http://biz.trace.ickd.cn/auto/\<tracking-no>?callback=abc

where 'abc' is the jsonp callback name
