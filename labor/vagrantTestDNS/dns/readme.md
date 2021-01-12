DNS  - Test  
----------------  
https://linuxconfig.org/configure-rndc-key-for-bind-dns-server-on-centos-7
https://docs.oracle.com/cd/E55956_01/doc.11123/administrator_guide/content/admin_dns_wildcards.html


dnf install bind bind-utils -y  
  
firewall-cmd --permanent --add-port={53/udp,53/tcp}  
firewall-cmd --permanent --add-port={953/udp,953/tcp}  
systemctl reload firewalld


rndc-confgen -a
chgrp named /etc/rndc.key
chmod g+r /etc/rndc.key


/etc/named.conf
/etc/named.zones

/var/named/foward.labor
/var/named/reverse.labor
