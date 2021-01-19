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

create secret from type docker-registy
kubectl create secret docker-registry gitlab --docker-server=https://gitlab.labor.lan:5050 --docker-username=[user] --docker-password=[password] --docker-email=user@server.labor.lan

apiVersion: v1
kind: Pod
metadata:
  name: private-reg
spec:
  containers:
  - name: private-reg-container
    image: gitlab.labor.lan:5050/root/test2/nginx
  imagePullSecrets:
  - name: gitlab