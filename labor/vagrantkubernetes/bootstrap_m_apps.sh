#!/bin/bash

echo "AP 1 - MetalLB"
echo "https://metallb.universe.tf/installation/"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

echo "AP 1a - MetalLB - ConfigMap"
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: metallb-system
  name: config
data:
  config: |
    address-pools:
    - name: default
      protocol: layer2
      addresses:
      - 172.16.16.80-172.16.16.99
EOF

echo "AP2 - Ingress Nginx (helm)"
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx                                                          
helm repo update
helm show values ingress-nginx/ingress-nginx > /tmp/ingress-nginx.yaml

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Namespace
metadata:
  name: ingress-nginx
EOF

echo "Change values file /tmp/ingress-nginx.yaml"
echo "  hostNetwork: true"
echo " hostPort:  enabled: true"
echo " kind: DaemonSet"
echo "helm install myingress ingress-nginx/ingress-nginx -n ingress-nginx --values /tmp/ingress-nginx.yaml"