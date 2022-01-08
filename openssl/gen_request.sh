#!/bin/bash
key=$1.pem
req=$1-req.pem
openssl genrsa -out $1.pem 2048 &>/dev/null
openssl req -new -key $key -out $req -subj "/CN=$1"
echo "--> $key, $req"
