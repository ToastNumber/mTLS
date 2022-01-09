#!/bin/bash
keytool -importcert \
    -trustcacerts \
    -file cacert.pem \
    -keystore cacerts.jks \
    -storepass password \
    -noprompt


