;Openshift Server
okd4-bootstrap.lab.okd.lan.   IN A 192.168.56.40
okd4-master1.lab.okd.lan.     IN A 192.168.56.41
okd4-master2.lab.okd.lan.     IN A 192.168.56.42
okd4-master3.lab.okd.lan.     IN A 192.168.56.43
okd4-worker1.lab.okd.lan.     IN A 192.168.56.44
okd4-worker2.lab.okd.lan.     IN A 192.168.56.45
okd4-services.okd.lan.        IN A 192.168.56.50
okd4-pfsense.okd.lan.         IN A 192.168.56.1

;Openshift internal stuff
api.lab.okd.lan.       IN    A    192.168.56.50
api-int.lab.okd.lan.   IN    A    192.168.56.50
*.apps.lab.okd.lan.    IN    A    192.168.56.50
etcd-0.lab.okd.lan.    IN    A    192.168.56.41
etcd-1.lab.okd.lan.    IN    A    192.168.56.42
etcd-2.lab.okd.lan.    IN    A    192.168.56.43
console-openshift-console.apps.lab.okd.lan.     IN     A 192.168.56.50
oauth-openshift.apps.lab.okd.lan.               IN     A 192.168.56.50

;Openshift internal srv
_etcd-server-ssl._tcp.lab.okd.lan.    86400     IN    SRV     0    10    2380    etcd-0.lab.
_etcd-server-ssl._tcp.lab.okd.lan.    86400     IN    SRV     0    10    2380    etcd-1.lab.
_etcd-server-ssl._tcp.lab.okd.lan.    86400     IN    SRV     0    10    2380    etcd-2.lab.


08:00:27:9a:c7:b9	192.168.56.40	okd4-bootstrap		 
08:00:27:67:d3:98	192.168.56.41	okd4-master1		 
08:00:27:7c:b1:57	192.168.56.42	okd4-master2		 
08:00:27:15:e1:e7	192.168.56.43	okd4-master3		 
08:00:27:36:5b:fd	192.168.56.44	okd4-worker1		 
08:00:27:37:77:49	192.168.56.45	okd4-worker2
08:00:27:40:74:a7	192.168.56.50	okd4-services