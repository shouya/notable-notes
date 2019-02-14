---
title: FLAC to MP3
created: '2019-02-14T09:08:15.624Z'
modified: '2019-02-14T09:10:55.260Z'
---

# FLAC to MP3

```
find -name "*.flac" -exec bash -c 'ffmpeg -i "{}" -y -map_metadata 0 -id3v2_version 3 -ab 256k "$(dirname "{}")/$(basename "{}" .flac).mp3"' \;
```

ref.https://unix.stackexchange.com/questions/114908/bash-script-to-convert-all-flac-to-mp3-with-ffmpeg w/ modification
