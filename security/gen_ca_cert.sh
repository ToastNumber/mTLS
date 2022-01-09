#!/bin/bash

key=cakey.pem
cert=cacert.pem

# man openssl req
# The req command primarily creates and processes certificate requests in PKCS#10 format. It
# can additionally create self signed certificates for use as root CAs for example

# Straight from the manpage: Generate a self signed root certificate:

# -x509: outputs a self signed certificate instead of a certificate request
# -newkey: creates a new certificate request and new private key
# -out: where to output the certificate request
# -nodes: private key ... will not be encrypted
# -keyout: need this for signing certificate requests later
openssl req \
    -x509 \
    -newkey rsa:2048 \
    -keyout $key \
    -out $cert \
    -nodes \
    -subj "/CN=mtls-demo-root"

echo "--> $key, $cert"
