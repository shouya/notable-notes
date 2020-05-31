---
title: Rails Tips & Tricks
created: '2019-02-13T20:19:51.836Z'
modified: '2019-02-13T20:21:08.637Z'
tags: [Notebooks/Snippets]
---

**Reset primary key sequence:**

`ActiveRecord::Base.connection.reset_pk_sequence!('table_name')`

ref. <https://stackoverflow.com/a/33963039/1232832>

**List all tables:**

`ActiveRecord::Base.connection.tables.each`

ref. <https://stackoverflow.com/a/155723/1232832>

**Execute SQL**:

```ruby
# select a list of hashes
query = 'SELECT a,b FROM t'
ActiveRecord::Base.connection.select_all(query).to_hash

# select a single value
query = 'SELECT count(*) FROM t'
ActiveRecord::Base.connection.select_value(query).to_hash
```
