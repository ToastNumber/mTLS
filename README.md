
## Commands
* `openssl req`: generating/displaying **certificate requests**, i.e. files with subject + public key; can also create a self-signed certificate directly with this command. Examples:
    * [gen_ca_cert.sh](openssl/gen_ca_cert.sh)
    * [gen_server_cert.sh](openssl/gen_server_cert.sh)
    * [gen_client_cert.sh](openssl/gen_client_cert.sh)
* `openssl x509`: **display** certificate details and **sign** other certificates. Examples:
    * [show_cert.sh](openssl/show_cert.sh)
* `openssl genrsa`: using RSA, generate **public and private key**. Examples:
    * [gen_ca_cert_req.sh](openssl/gen_ca_cert_req.sh)
* Certificate vs certificate request:
	* Certificate has validity period
	* Certificate has issuer (i.e. the subject who signed the certificate request)
	* Certificate has different signature (since signed by both CA and subject)

## Instructions
1. Generate self-signed root certificate with `openssl req`:
    ```
    openssl$ ./gen_ca_cert.sh
    --> cakey.pem, cacert.pem
    ```
2. Generate keys and certificate requests with `openssl genrsa` and `openssl req`:
    ```
    openssl$ ./gen_request.sh server
    --> server.pem, server-req.pem

    openssl$ ./gen_request.sh client
    --> client.pem, client-req.pem
    ```
3. Sign the certificate request with root certificate using `openssl x509 -req`:
    ```
	openssl$ ./sign_request.sh server
	Signature ok
	subject=CN = server
	Getting CA Private Key
	--> server-signed.pem

	openssl$ ./sign_request.sh client
	Signature ok
	subject=CN = client
	Getting CA Private Key
	--> client-signed.pem
    ```
4. Show certificate chains with `openssl verify`
	```
	openssl$ ./show_chain.sh server
	server-signed.pem: OK
	Chain:
	depth=0: CN = server (untrusted)
	depth=1: CN = mtls-demo-root

	openssl$ ./show_chain.sh client
	client-signed.pem: OK
	Chain:
	depth=0: CN = client (untrusted)
	depth=1: CN = mtls-demo-root
	```



