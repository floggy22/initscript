DNS  - Test  
----------------  
dnf install bind bind-utils -y  
  
firewall-cmd --permanent --add-port={53/udp,53/tcp}  
systemctl reload firewalld
