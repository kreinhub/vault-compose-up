#!/usr/bin/env bash

cnf_name=$1
openssl genrsa -aes256 -out ca.key.pem 2048
openssl req -new -x509 -subj "/CN=myca" -extensions v3_ca -days 3650 -key ca.key.pem -sha256 -out ca.pem -config $cnf_name.cnf
echo "Files ca.key.pem and ca.pem have been created in $PWD"
