---
title: GnuPG config
created: '2019-02-13T20:19:51.834Z'
modified: '2019-02-13T20:26:08.180Z'
tags: [gpg, Notebooks/Snippets]
---

## Cache password

So you can cache the password for a period of time without having to input it over and over again. This is done by configuring gpg-agent.

Add these lines to `~/.gnupg/gpg-agent.conf`:

```
default-cache-ttl 3600
max-cache-ttl 3600
```

Where `3600` means 1 hour (3600 seconds) here.

## Pinentry

Pinentry is a collection of passphrase entry dialogs which is required for almost all usages of GnuPG.

Set/add this line in the configuration `~/.gnupg/gpg-agent.conf`:

```
pinentry-program /usr/local/bin/pinentry
```

The default value for the option is `/usr/[local/]bin/pinentry`, so `ln -s <your-pinentry> /usr/local/bin/pinentry` might work, too.

Remember you should NOT append any text after this path, otherwise the text will be interpreted as part of the path (like `/usr/local/bin/pinentry;`)

After changing the conf, run `gpgconf --kill gpg-agent` (or `killall gpg-agent`) to restart the gpg-agent.

### pinentry-curses

This is the default one that got install when installing `gnupg` with brew. It's often got linked to `/usr/local/bin/pinentry` as the default pinentry program.

![pinentry-curses](resources/E265D94CA79B26736CDF6679EECB7544.jpg)

Note this program doesn't work when tty is very small.

### pinentry-mac

Install with `brew install pinentry-mac`

![pinentry-mac](resources/DEE7A33A2C6A7FDD5B35E0E15328C2AF.jpg)

This pinentry program could ultilize keychain.


#gpg #security
