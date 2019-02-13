---
title: Strongswan IKEv2 VPN
created: '2019-02-13T20:19:51.838Z'
modified: '2019-02-13T20:29:42.918Z'
tags: [Notebooks/Snippets, security, vpn]
---

How to use Letsencrypt certificate?
-----------------------------------

* put `fullchain.pem` into `cacerts/`
* put `cert.pem` into `certs/`
* put `privkey` into `private/`

Remember the leftid should match the common name specified in the certificate.

E: Unable to locate package strongswan-plugin-eap-mschapv2?
-----------------------------------------------------------

`sudo apt install libcharon-standard-plugins`

What ciphers to use?
--------------------

```
conn %default
  keyexchange=ikev2
  ike=aes256gcm16-aes256gcm12-aes128gcm16-aes128gcm12-aesxcbc-sha256-sha1-modp4096-modp2048-modp1024,aes256-aes128-sha256-sha1-modp4096-modp2048-modp1024
  esp=aes128gcm12-aes128gcm16-aes256gcm12-aes256gcm16-modp4096-modp2048-modp1024,aes128-aes256-sha1-sha256-modp4096-modp2048-modp1024,aes128-sha1-modp4096,aes128-sha1-modp1024,aes128-sha1

```
