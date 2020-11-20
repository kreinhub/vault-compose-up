#!/usr/bin/env bash

cname=$1
cnf_name=$2
exts=("cnf" "csr" "key.pem" "pem")
openssl genrsa -out $cname.key.pem 2048
openssl req -subj "/CN=$cname" -extensions v3_req -sha256 -new -key $cname.key.pem -out $cname.csr
openssl x509 -req -extensions v3_req -days 3650 -sha256 -in $cname.csr -CA ca.pem -CAkey ca.key.pem -CAcreateserial -out $cname.crt -extfile $cnf_name.cnf
echo -n "Files "
for ext in "${exts[@]}"
  do
    echo -n "$cname.$ext, "
done
echo "have been created in $PWD"
