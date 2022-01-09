#!/bin/bash
openssl pkcs12 \
    -export \
    -in $1-signed.pem \
    -inkey $1.pem \
    -out $1.p12 \
    -name $1

