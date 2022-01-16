#!/bin/bash
clientType=$1
java \
    -Djavax.net.ssl.keyStore=./security/$clientType.jks \
    -Djavax.net.ssl.keyStorePassword=password \
    -Djavax.net.ssl.trustStore=./security/cacerts.jks \
    -Djavax.net.ssl.trustStorePassword=password \
    -Djavax.net.debug=ssl,handshake \
    java/"${clientType^}".java
