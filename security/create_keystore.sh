#!/bin/bash
keytool -importkeystore \
    -srcstorepass '' \
    -srckeystore $1.p12 \
    -keystore $1.jks \
    -storepass password
