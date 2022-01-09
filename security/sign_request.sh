#!/bin/bash

# man openssl x509 > examples > Sign a certificate request using the CA certificate ...

req=$1-req.pem
out=$1-signed.pem

# -req: input is a certificate _request_ rather than a certificate
# -in: input file
# -CA: the CA certificate used for signing ... input file is signed by this CA ... its issuer name is set to the subject name of the CA ...
# -CAkey: the private key to sign the certificate with

openssl x509 \
    -req \
    -in $req \
    -CA cacert.pem \
    -CAkey cakey.pem \
    -CAcreateserial \
    -out $out

echo "--> $out"
