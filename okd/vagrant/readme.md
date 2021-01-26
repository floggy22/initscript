server and services:
;Openshift Server
okd4-bootstrap.labor.lan.   IN A 172.16.16.40
okd4-master1.labor.lan.     IN A 172.16.16.41
okd4-master2.labor.lan.     IN A 172.16.16.42
okd4-master3.labor.lan.     IN A 172.16.16.43
okd4-worker1.labor.lan.     IN A 172.16.16.44
okd4-worker2.labor.lan.     IN A 172.16.16.45
okd4-services.labor.lan.    IN A 172.16.16.50
okd4-pfsense.labor.lan.     IN A 172.16.16.1

;Openshift internal stuff
api.labor.lan.       IN    A    172.16.16.50
api-int.labor.lan.   IN    A    172.16.16.50
*.apps.labor.lan.    IN    A    172.16.16.50
etcd-0.labor.lan.    IN    A    172.16.16.41
etcd-1.labor.lan.    IN    A    172.16.16.42
etcd-2.labor.lan.    IN    A    172.16.16.43
console-openshift-console.apps.labor.lan.     IN     A 172.16.16.50
oauth-openshift.apps.labor.lan.               IN     A 172.16.16.50

;Openshift internal srv
_etcd-server-ssl._tcp.labor.lan.    86400     IN    SRV     0    10    2380    etcd-0
_etcd-server-ssl._tcp.labor.lan.    86400     IN    SRV     0    10    2380    etcd-1
_etcd-server-ssl._tcp.labor.lan.    86400     IN    SRV     0    10    2380    etcd-2
