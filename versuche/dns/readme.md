DNS  - Test  
----------------  
firewall-cmd --permanent --add-port={53/udp,53/tcp}  
systemctl reload firewalld
