---
title: Get script dir
created: '2019-02-14T09:19:31.775Z'
modified: '2019-02-14T09:24:53.460Z'
---

# Get script dir

```bash
# save to var
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# just cd
cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1

# without hiding error messages
cd "$(dirname "${BASH_SOURCE[0]}")"
```

https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself
