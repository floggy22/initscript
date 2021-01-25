#!/bin/bash


#Create key
openssl genrsa -out labor.lan.key 2048

#Create certificate (for wildcard *.labor.lan as fqdn)
openssl req -new -key labor.lan.key -out labor.lan.csr

#Sign certificate with ca
openssl x509 -req -in labor.lan.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out labor.lan.crt

#convert crt to pem
openssl x509 -in labor.lan.crt -out labor.lan.pem -outform PEM