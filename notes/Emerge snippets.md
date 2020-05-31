---
title: Emerge snippets
created: '2019-02-13T20:19:51.833Z'
modified: '2019-02-13T20:53:37.963Z'
tags: [gentoo, Notebooks/Snippets]
---

# Emerge snippets
## Purge

```
emerge -C <pkg-name>
emerge --depclean # or -c
```

## Update system

```
emerge -avuDU --keep-going \
  --with-bdeps=y --verbose-conflicts \
  @world
```

- `-a`: ask
- `-v`: verbose
- `-u`: upgrade packeges
- `-D`: deep
- `-U`: changed-use
- `--keep-going`: don't interrupt on individual failure
- `--with-bdeps=y`: prserve bdeps
- `--verbose-conflicts`: self-explanatory
