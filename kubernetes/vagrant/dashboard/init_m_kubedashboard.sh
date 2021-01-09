#!/bin/bash

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml
#kubectl create serviceaccount admin-dashboard -n kubernetes-dashboard
kubectl apply -f /vagrant/dashboard/dashboard.yaml


kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-dashboard | awk '{print $1}')