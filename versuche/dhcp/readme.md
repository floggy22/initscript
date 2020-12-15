DHCP  
------------  

dnf install dhcpd  

firewall-cmd --add-port=67/udp --permanent
Reload FirewallD

firewall-cmd --reload
