IPTable Rule Definitions

  On T1 edit the /proc/sys/net/ipv4/ip_forward file to enable IP Forwarding. Change the value from 0 to 1.

  On T1 change the FORWARD policy back to ACCEPT.

  Configure POSTROUTING chain to translate T5 IP address to T1 (Create the rule by specifying the Interface information first then Layer 3)

Once these steps have been completed and tested, go to Pivot and open up a netcat listener on port 9004 and wait up to 2 minutes for your flag. 
If you did not successfully accomplish the tasks above, then you will not receive the flag.

    sudo iptables -L
    sudo iptables -t nat -A POSTROUTING -o eth0 -s 192.168.1.10 -j SNAT --to-source 172.16.82.106
    nc -lvp 9004
_______________________________________________________________________________________________________________________
NFTable Rule Definitions

NFTable: NAT
Family: ip

  On T2 edit the /proc/sys/net/ipv4/ip_forward file to enable IP Forwarding. Change the value from 0 to 1.

  Create POSTROUTING and PREROUTING base chains with:
  
  Hooks
  
  Priority of 0
  
  No Policy Needed

  Configure POSTROUTING chain to translate T6 IP address to T2 (Create the rule by specifying the Interface information first then Layer 3)

Once these steps have been completed and tested, go to Pivot and open up a netcat listener on port 9005 and wait up to 2 minutes for your flag.
If you did not successfully accomplish the tasks above, then you will not receive the flag.

    sudo nft add table ip NAT
    sudo nft add chain ip NAT PREROUTING {type nat hook prerouting priority 0 \; }
    sudo nft add chain ip NAT POSTROUTING {type nat hook postrouting priority 0 \; }
    sudo nft add rule ip NAT POSTROUTING ip saddr 192.168.3.30 oif eth0 masquerade
    nc -lvp 9005
_______________________________________________________________________________________________________________________
IPTable Rule Definitions

  Allow New and Established traffic to/from via SSH, TELNET, and RDP

  Change the Default Policy in the Filter Table for the INPUT, OUTPUT, and FORWARD chains to DROP

  Allow ping (ICMP) requests (and reply) to and from the Pivot.

  Allow ports 6579 and 4444 for both udp and tcp traffic

  Allow New and Established traffic to/from via HTTP

Once these steps have been completed and tested, go to Pivot and open up a netcat listener on port 9001 and wait up to 2 minutes for your flag. If you did not successfully accomplish the tasks above, then you will not receive the flag.

    sudo iptables -A INPUT -p tcp -m state --state NEW,ESTABLISHED -m multiport --ports 22,23,3389 -j ACCEPT
    sudo iptables -A OUTPUT -p tcp -m state --state NEW,ESTABLISHED -m multiport --ports 22,23,3389 -j ACCEPT
    sudo iptables -P INPUT DROP
    sudo iptables -P OUTPUT DROP
    sudo iptables -P FORWARD DROP
    sudo iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
    sudo iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
    sudo iptables -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT
    sudo iptables -A OUTPUT -p icmp --icmp-type echo-reply -j ACCEPT
    sudo iptables -A INPUT -p tcp -m multiport --dports 6579,4444 -j ACCEPT
    sudo iptables -A INPUT -p udp -m multiport --dports 6579,4444 -j ACCEPT
    sudo iptables -A OUTPUT -p tcp -m multiport --sports 6579,4444 -j ACCEPT
    sudo iptables -A OUTPUT -p udp -m multiport --sports 6579,4444 -j ACCEPT
    sudo iptables -A INPUT -p tcp -m state --state NEW,ESTABLISHED --dport 80 -j ACCEPT
    sudo iptables -A OUTPUT -p tcp -m state --state NEW,ESTABLISHED --dport 80 -j ACCEPT
    nc -lvp 9001
______________________________________________________________________________________________________________________

______________________________________________________________________________________________________________________

______________________________________________________________________________________________________________________

______________________________________________________________________________________________________________________

______________________________________________________________________________________________________________________

______________________________________________________________________________________________________________________

______________________________________________________________________________________________________________________

______________________________________________________________________________________________________________________

______________________________________________________________________________________________________________________

______________________________________________________________________________________________________________________
