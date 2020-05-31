---
title: Run your own TOR relay
created: '2019-02-13T20:19:51.837Z'
modified: '2019-02-13T21:26:59.578Z'
tags: [Notebooks/Snippets]
---

# Run your own TOR relay

## Concepts

* Relay: will be found in main discovery
* Bridge: will not be found in main discovery
* Exit-node: self-explanatory

I typically run a bridge relay, which is the most stealth and safe one.

## Config

```
DataDirectory /home/shou/.arm/tor_data # location to store runtime data
Log notice file /home/shou/.arm/tor_log # location to log notices, warnings, and errors
ControlPort 9052              # port controllers can connect to
CookieAuthentication 1        # method for controller authentication
RunAsDaemon 0                 # runs as a background process

ORPort 9001                   # port used for relaying traffic
BridgeRelay 1                 # makes us a bridge rather than a public relay
PublishServerDescriptor 0     # keeps our bridge descriptor private
AccountingMax 100 GB          # maximum amount of traffic we'll relay per month
SocksPort 0                   # prevents tor from being used as a client
ExitPolicy reject *:*         # prevents us from connecting to non-relays

```

## Tor-arm

This tool enables you to view tor stats.

    $ sudo apt install tor-arm
    $ sudo arm
