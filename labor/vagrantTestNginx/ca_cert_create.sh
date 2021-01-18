#!/bin/bash


#CA
#KeyFile private
openssl genrsa -out ca.key 4096

#Certificate for CA with keyfile
openssl req -new -x509 -key ca.key -out ca.crt
