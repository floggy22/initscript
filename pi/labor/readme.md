Disable DNS from dnsmasq: 
 /etc/default/dnsmasq  
    DNSMASQ_OPTS="-p0"  
    DNSMASQ_EXCEPT=lo  
    
 Check with: netstat -pnltu | grep dnsmasq
