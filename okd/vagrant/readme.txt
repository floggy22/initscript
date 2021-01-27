;Openshift Server
okd4-bootstrap.lab.labor.lan.   IN A 172.16.16.40
okd4-master1.lab.labor.lan.     IN A 172.16.16.41
okd4-master2.lab.labor.lan.     IN A 172.16.16.42
okd4-master3.lab.labor.lan.     IN A 172.16.16.43
okd4-worker1.lab.labor.lan.     IN A 172.16.16.44
okd4-worker2.lab.labor.lan.     IN A 172.16.16.45
okd4-services.labor.lan.        IN A 172.16.16.50
okd4-pfsense.labor.lan.         IN A 172.16.16.1

;Openshift internal stuff
api.lab.labor.lan.       IN    A    172.16.16.50
api-int.lab.labor.lan.   IN    A    172.16.16.50
*.apps.lab.labor.lan.    IN    A    172.16.16.50
etcd-0.lab.labor.lan.    IN    A    172.16.16.41
etcd-1.lab.labor.lan.    IN    A    172.16.16.42
etcd-2.lab.labor.lan.    IN    A    172.16.16.43
console-openshift-console.apps.lab.labor.lan.     IN     A 172.16.16.50
oauth-openshift.apps.lab.labor.lan.               IN     A 172.16.16.50

;Openshift internal srv
_etcd-server-ssl._tcp.lab.labor.lan.    86400     IN    SRV     0    10    2380    etcd-0.lab.
_etcd-server-ssl._tcp.lab.labor.lan.    86400     IN    SRV     0    10    2380    etcd-1.lab.
_etcd-server-ssl._tcp.lab.labor.lan.    86400     IN    SRV     0    10    2380    etcd-2.lab.


08:00:27:9a:c7:b9	172.16.16.40	okd4-bootstrap		 
08:00:27:67:d3:98	172.16.16.41	okd4-master1		 
08:00:27:7c:b1:57	172.16.16.42	okd4-master2		 
08:00:27:15:e1:e7	172.16.16.43	okd4-master3		 
08:00:27:36:5b:fd	172.16.16.44	okd4-worker1		 
08:00:27:37:77:49	172.16.16.45	okd4-worker2
08:00:27:40:74:a7	172.16.16.50	okd4-services