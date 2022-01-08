#!/bin/bash
openssl verify -CAfile cacert.pem -show_chain $1-signed.pem
