#!/bin/bash

# outputs:
#  issuer of cert: e.g. CN = mtls-demo
#  subject of the cert: e.g. CN = mtls-demo-root or CN = mtls-server
#  public key of subject, e.g. RSA + modulus + exponent
openssl x509 -noout -text -in $1

