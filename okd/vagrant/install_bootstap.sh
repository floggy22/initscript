#!/bin/bash
echo "Install Bootstrap-Image"

sudo coreos-installer install /dev/sda --image-url http://192.168.56.150:8080/okd4/fcos.raw.xz  --ignition-url http://192.168.56.150:8080/okd4/bootstrap.ign --insecure-ignition
