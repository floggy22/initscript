DHCP  
------------  

dnf install -y dhcp-server

firewall-cmd --add-port=67/udp --permanent  

Reload FirewallD  
firewall-cmd --reload
