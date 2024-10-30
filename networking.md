    https://net.cybbh.io/public/networking/latest/index.html

    10.50.23.214:8000
____________________________________________________________________________________________________________________
    https://net.cybbh.io/-/public/-/jobs/878264/artifacts/modules/networking/slides-v4/01_data.html
____________________________________________________________________________________________________________________
    https://miro.com/app/board/o9J_klSqCSY=/
____________________________________________________________________________________________________________________
    duckduckgo
____________________________________________________________________________________________________________________
# Networking - 1 - Fundamentals - Task 3 - Basic Analysis
Enter the Filter syntax with no spaces

- CTFD will only accept BPF filters, &&, and || as answers with no spaces.

- CTFD will not accept TCPdump Primitives as answers.

- Keep your values in all the same format. HEX or Decimal. Do not mix.
____________________________________________________________________________________________________________________
## What is the Berkeley Packet Filter, using tcpdump, to capture all packets with a ttl of 64 and less, utilizing the IPv4 or IPv6 Headers? There should be 8508 packets.

$ sudo tcpdump -n "```ip[8]<=64||ip6[7]<=64```" -r /home/activity_resources/pcaps/BPFCheck.pcap | wc -l
____________________________________________________________________________________________________________________
## What is the Berkeley Packet Filter, using tcpdump, to capture all IPv4 packets with at least the Dont Fragment bit set? There should be 2321 packets.

$ sudo tcpdump -n "```ip[6]&0x40!=0```" -r /home/activity_resources/pcaps/BPFCheck.pcap | wc -l
____________________________________________________________________________________________________________________
## What is the Berkeley Packet Filter, using tcpdump, to capture traffic with a Source Port higher than 1024, utilizing the correct Transport Layer Headers? There should be 7805 packets.

$ sudo tcpdump -n "```tcp[0:2]>1024||udp[0:2]>1024```" -r /home/activity_resources/pcaps/BPFCheck.pcap | wc -l
____________________________________________________________________________________________________________________
## What is the Berkeley Packet Filter, using tcpdump, to capture all Packets with UDP protocol being set, utilizing the IPv4 or IPv6 Headers? There should be 1277 packets.

$ sudo tcpdump -n "```ip[9]=0x11||ip6[6]=0x11```" -r /home/activity_resources/pcaps/BPFCheck.pcap | wc -l
____________________________________________________________________________________________________________________
## What is the Berkeley Packet Filter, using tcpdump, to capture only packets with the ACK/RST or ACK/FIN flag set, utilizing the correct Transport Layer Header? There should be 1201 packets.

$ sudo tcpdump -n "```tcp[13]=0x14||tcp[13]=0x11```" -r /home/activity_resources/pcaps/BPFCheck.pcap | wc -l
____________________________________________________________________________________________________________________
## What is the Berkeley Packet Filter, using tcpdump, to capture all packets with an IP ID field of 213? There should be 10 packets.

$ sudo tcpdump -n "```ip[4:2]=213```" -r /home/activity_resources/pcaps/BPFCheck.pcap | wc -l
____________________________________________________________________________________________________________________
## What is the Berkeley Packet Filter, using tcpdump, to capture all traffic that contains a VLAN tag? There should be 182 packets.

$ sudo tcpdump -n "``````" -r /home/activity_resources/pcaps/BPFCheck.pcap | wc -l
____________________________________________________________________________________________________________________
## What is the Berkeley Packet Filter, using tcpdump, to capture all IPv4 packets relating to DNS? There should be 63 packets.

$ sudo tcpdump -n "``````" -r /home/activity_resources/pcaps/BPFCheck.pcap | wc -l
____________________________________________________________________________________________________________________
## What is the Berkeley Packet Filter, using tcpdump, to capture the initial packets from a client trying to initiate a TCP connection? There should be 3447 packets.

$ sudo tcpdump -n "``````" -r /home/activity_resources/pcaps/BPFCheck.pcap | wc -l
____________________________________________________________________________________________________________________
## What is the Berkeley Packet Filter, using tcpdump, to capture the response packets from a server listening on an open TCP ports? There should be 277 packets.

$ sudo tcpdump -n "``````" -r /home/activity_resources/pcaps/BPFCheck.pcap | wc -l
____________________________________________________________________________________________________________________
## What is the Berkeley Packet Filter, using tcpdump, to capture the response packets from a server with closed TCP ports There should be 17 packets.

$ sudo tcpdump -n "``````" -r /home/activity_resources/pcaps/BPFCheck.pcap | wc -l
____________________________________________________________________________________________________________________
## What is the Berkeley Packet Filter, using tcpdump, to capture all TCP and UDP packets sent to the well known ports? There should be 3678 packets.

$ sudo tcpdump -n "``````" -r /home/activity_resources/pcaps/BPFCheck.pcap | wc -l
____________________________________________________________________________________________________________________
## What is the Berkeley Packet Filter, using tcpdump, to capture all HTTP traffic? There should be 1404 packets.

$ sudo tcpdump -n "``````" -r /home/activity_resources/pcaps/BPFCheck.pcap | wc -l
____________________________________________________________________________________________________________________
## What is the Berkeley Packet Filter, using tcpdump, to capture all telnet traffic? There should be 62 packets.

$ sudo tcpdump -n "``````" -r /home/activity_resources/pcaps/BPFCheck.pcap | wc -l
____________________________________________________________________________________________________________________
## What is the Berkeley Packet Filter, using tcpdump, to capture all ARP traffic? There should be 40 packets.

$ sudo tcpdump -n "``````" -r /home/activity_resources/pcaps/BPFCheck.pcap | wc -l
____________________________________________________________________________________________________________________
## What is the Berkeley Packet Filter, using tcpdump, to capture if the "Evil bit" is set? There should be 197 packets.

$ sudo tcpdump -n "``````" -r /home/activity_resources/pcaps/BPFCheck.pcap | wc -l
____________________________________________________________________________________________________________________
## What is the Berkeley Packet Filter, using tcpdump, to capture any packets containing the CHAOS protocol within an IPv4 header? There should be 139 packets.

$ sudo tcpdump -n "``````" -r /home/activity_resources/pcaps/BPFCheck.pcap | wc -l
____________________________________________________________________________________________________________________
## What is the Berkeley Packet Filter, using tcpdump, to capture all IPv4 packets with the DSCP field of 37? There should be 42 packets.

$ sudo tcpdump -n "``````" -r /home/activity_resources/pcaps/BPFCheck.pcap | wc -l
____________________________________________________________________________________________________________________
## What is the Berkeley Packet Filter, using tcpdump, to capture all IPv4 packets targeting just the beginning of potential traceroutes as it's entering your network. This can be from a Windows or Linux machine using their default settings? There should be 83 packets.

$ sudo tcpdump -n "``````" -r /home/activity_resources/pcaps/BPFCheck.pcap | wc -l
____________________________________________________________________________________________________________________
## What is the Berkeley Packet Filter, using tcpdump, to capture all packets where the URG flag is not set and URG pointer has a value? There should be 43 packets.

$ sudo tcpdump -n "``````" -r /home/activity_resources/pcaps/BPFCheck.pcap | wc -l
____________________________________________________________________________________________________________________
## What is the Berkeley Packet Filter, using tcpdump, to capture a TCP null scan to the host 10.10.10.10? There should be 19 packets.

$ sudo tcpdump -n "``````" -r /home/activity_resources/pcaps/BPFCheck.pcap | wc -l
____________________________________________________________________________________________________________________
## What is the Berkeley Packet Filter, using tcpdump, to capture an attacker using vlan hopping to move from vlan 1 to vlan 10? There should be 15 packets.

$ sudo tcpdump -n "``````" -r /home/activity_resources/pcaps/BPFCheck.pcap | wc -l
____________________________________________________________________________________________________________________
##  

$ sudo tcpdump -n "``````" -r /home/activity_resources/pcaps/BPFCheck.pcap | wc -l
____________________________________________________________________________________________________________________
