---
title: openssl self-signed certificate (CA)
created: '2019-02-13T20:19:51.844Z'
modified: '2019-02-13T21:10:58.440Z'
tags: [Notebooks/Snippets, ssl]
---

Creating CA
-----------

```sh
# generate CA private key
openssl genrsa -out ca/private/ca.key 2048

# generate cert request
openssl req -new -key ca/private/ca.key -out ca/certs/ca.csr

# generate x509 cert
openssl x509 -req -days 3650 -in ca/certs/ca.csr -signkey ca/private/ca.key -out ca/certs/ca.crt -extfile openssl.cnf -extensions v3_ca

# setup CA
echo 1000 > ca/serial
touch ca/index.txt
cat << EOF > ca/openssl.cnf
[ ca ]
default_ca = my_ca

[ my_ca ]
dir = ./ca
database = $dir/index.txt
new_certs_dir = $dir/new_certs
serial = $dir/serial

certificate = $dir/certs/ca.crt
private_key = $dir/private/ca.key
RANDFILE = $dir/private/.rand

default_days = 365
default_md = sha256
unique_subject = no

policy = default_policy

basicConstraints = CA:true
keyUsage = cRLSign, keyCertSign, digitalSignature, nonRepudiation,keyEncipherment, dataEncipherment, keyAgreement, keyCertSign, cRLSign

[ default_policy ]
countryName = optional
organizationName = optional
stateOrProvinceName = optional
organizationalUnitName = optional
localityName = optional
commonName = supplied
emailAddress = optional


[ req ]
# Options for the `req` tool (`man req`).
default_bits        = 4096
distinguished_name  = req_distinguished_name
string_mask         = utf8only

# SHA-1 is deprecated, so use SHA-2 instead.
default_md          = sha256

# Extension to add when the -x509 option is used.
x509_extensions     = v3_ca

[ req_distinguished_name ]
# See <https://en.wikipedia.org/wiki/Certificate_signing_request>.
countryName                     = Country Name (2 letter code)
stateOrProvinceName             = State or Province Name
localityName                    = Locality Name
0.organizationName              = Organization Name
organizationalUnitName          = Organizational Unit Name
commonName                      = Common Name
emailAddress                    = Email Address

[ v3_ca ]
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid:always,issuer
basicConstraints = critical, CA:true
keyUsage = critical, digitalSignature, cRLSign, keyCertSign

[ v3_intermediate_ca ]
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid:always,issuer
basicConstraints = critical, CA:true, pathlen:0
keyUsage = critical, digitalSignature, cRLSign, keyCertSign

[ usr_cert ]
# Extensions for client certificates (`man x509v3_config`).
basicConstraints = CA:FALSE
nsCertType = client, email
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid,issuer
keyUsage = critical, nonRepudiation, digitalSignature, keyEncipherment
extendedKeyUsage = clientAuth, emailProtection

EOF
```

Signing a client certificate
----------------------------

```sh
openssl genrsa -out client.key 2048
openssl req -new -key client.key -out client.csr
openssl ca -config ca/openssl.cnf -out client.crt
```

Converting key format
---------------------

```sh
# p12 is a format for importing user certificate into chrome
openssl pkcs12 -export -clcerts -in client.crt -inkey client.key -out client.p12
```

Nginx client cert verification (required)
    -----------------------------------------

```coffee
# nginx.conf

server {
  ssl on;
  # ...
  
  ssl_client_certificate /path/to/ca/certs/ca.crt;
  ssl_verify_client on; # or off,optional,optional_no_ca;
}
```

Nginx client cert vertification (optional)
------------------------------------------

```coffee
# default.conf
server {
  ssl on;
  # ...
  
  ssl_client_certificate /path/to/ca/certs/ca.crt;
  ssl_verify_client optional;
  
  location /a {
    # access without restriction
  }
  
  location /b {
    # require client cert to access
    include client_cert_required.conf;
  }
}

# client_cert_required.conf
if ($ssl_client_verify != "SUCCESS") {
  return 404;
}
allow all;
```

Script to automate client cert generation
-----------------------------------------

```sh
#!/bin/bash

PASSWORD="p12 export password"
cfg="$(dirname $(readlink -f $0))/openssl.cnf"
if [[ -z "$cn" ]]; then
  read -p 'Enter Common Name(CN): ' cn
fi

echo ======Generating key======
[ -f client.key ] || openssl genrsa -out client.key 2048

echo ======Generating CSR======
[ -f client.csr ] || openssl req -new \
  -key client.key \
  -subj "/CN=$cn" \
  -out client.csr

echo ======Signing with CA======
cwd="$(pwd)"
pushd "$(dirname $cfg)" >/dev/null
[ -f client.crt ] || \
  openssl ca \
    -batch \
    -config "$cfg" \
    -extensions usr_cert \
    -in "$cwd/client.csr" \
    -out "$cwd/client.crt"
popd >/dev/null
[ -f client.crt ] && rm -f client.csr

echo ======Exporting as p12======
[ -f client.crt -a -f client.key ] && \
  openssl pkcs12 -export \
                 -in client.crt \
		 -inkey client.key \
		 -out client.p12 \
		 -passout pass:$PASSWORD

echo ======Deleting intermediate files======
rm -f client.{crt,key}
mv client.p12 "clients/$cn.p12"

echo "Client key exported to file [$cn.p12], export key: [$PASSWORD]"
```

ref.

- https://nginx.org/en/docs/http/ngx_http_ssl_module.html#ssl_verify_client
- https://blog.imdst.com/nginx-ssl-shuang-xiang-ren-zheng-key-sheng-cheng-he-pei-zhi/
- http://tchuairen.blog.51cto.com/3848118/1782945
