Based on Only for Lab: https://github.com/justmeandopensource/kubernetes/

all YdxjfZB3J-F4PYGxyFWx

kubectl create deployment nginxfff --image=nginx


Pull from private registry (insecure)
https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/


kubectl create --insecure-skip-tls-verify -f [file.yaml]

or add own ca to the cluster
/usr/local/share/ca-certificates/
update-ca-certificates
reboot