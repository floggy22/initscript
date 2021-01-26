#!/bin/bash
echo "Install Bootstrap-Image"

sudo coreos-installer install /dev/sda --image-url http://172.16.16.50:8080/okd4/fcos.raw.xz  --ignition-url http://172.16.16.50:8080/okd4/master.ign --insecure-ignition
