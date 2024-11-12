student@blue-internet-host-student-12:~$ nmap -T4 -vvvv -p21-23,80 10.50.24.223

Starting Nmap 7.70 ( https://nmap.org ) at 2024-11-07 14:25 UTC

Nmap scan report for 10.50.24.223
Host is up, received user-set (0.00079s latency).
Scanned at 2024-11-07 14:38:07 UTC for 0s

PORT   STATE  SERVICE REASON
21/tcp closed ftp     conn-refused
22/tcp closed ssh     conn-refused
23/tcp open   telnet  syn-ack
80/tcp open   http    syn-ack

student@blue-internet-host-student-12:~$ nc 10.50.24.223 23
���� ��#��'

student@blue-internet-host-student-12:~$ nc 10.50.24.223 80
adasas
HTTP/1.1 400 Bad Request

student@blue-internet-host-student-12:~$ wget -r 10.50.24.223
--2024-11-07 14:26:35--  http://10.50.24.223/
Connecting to 10.50.24.223:80... connected.

--2024-11-07 14:26:35--  http://10.50.24.223/Rick-http.png
Reusing existing connection to 10.50.24.223:80.
HTTP request sent, awaiting response... 200 OK
Length: 5477 (5.3K) [image/png]
Saving to: ‘10.50.24.223/Rick-http.png’

10.50.24.223/Rick-http.pn 100%[=====================================>]   5.35K  --.-KB/s    in 0s      

2024-11-07 14:26:35 (1.83 GB/s) - ‘10.50.24.223/Rick-http.png’ saved [5477/5477]

student@blue-internet-host-student-12:~$ cat 10.50.24.223/index.html 
<html>
<a href="./Rick-http.png">Rick-http.png</a>
</html>

student@blue-internet-host-student-12:~$ eog 10.50.24.223/Rick-http.png 

student@blue-internet-host-student-12:~$ telnet 10.50.24.223
Trying 10.50.24.223...
Connected to 10.50.24.223.
Escape character is '^]'.
Debian GNU/Linux 10
rick login: Rick
Password: password

Rick@rick:~$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc pfifo_fast state UP group default qlen 1000
    link/ether fa:16:3e:21:b7:d6 brd ff:ff:ff:ff:ff:ff
    inet 10.1.2.17/28 brd 10.1.2.31 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::f816:3eff:fe21:b7d6/64 scope link 
       valid_lft forever preferred_lft forever

Rick@rick:~$ ip n
10.1.2.18 dev eth0 lladdr fa:16:3e:32:47:85 REACHABLE
10.1.2.30 dev eth0 lladdr fa:16:3e:6c:4e:10 REACHABLE
10.1.2.27 dev eth0 lladdr fa:16:3e:8f:1a:3b STALE

Rick@rick:~$ ip r
default via 10.1.2.30 dev eth0 
10.1.2.16/28 dev eth0 proto kernel scope link src 10.1.2.17 

Rick@rick:~$ ss -ntlp
State        Recv-Q       Send-Q               Local Address:Port               Peer Address:Port       
LISTEN       0            128                        0.0.0.0:22                      0.0.0.0:*          
LISTEN       0            128                        0.0.0.0:23                      0.0.0.0:*          
LISTEN       0            128                        0.0.0.0:80                      0.0.0.0:*          
LISTEN       0            128                           [::]:22                         [::]:*          
LISTEN       0            128                           [::]:80                         [::]:*          
LISTEN       0            128                              *:21                            *:*          

Rick@rick:~$ for i in {17..30}; do (ping -c 1 10.1.2.$i | grep "bytes from" &) ; done
64 bytes from 10.1.2.17: icmp_seq=1 ttl=64 time=0.016 ms
64 bytes from 10.1.2.18: icmp_seq=1 ttl=64 time=0.202 ms
64 bytes from 10.1.2.27: icmp_seq=1 ttl=64 time=1.07 ms
64 bytes from 10.1.2.30: icmp_seq=1 ttl=64 time=0.107 ms

Rick@rick:~$ ping 10.10.0.40
PING 10.10.0.40 (10.10.0.40) 56(84) bytes of data.
64 bytes from 10.10.0.40: icmp_seq=1 ttl=61 time=0.408 ms
64 bytes from 10.10.0.40: icmp_seq=2 ttl=61 time=0.531 ms
64 bytes from 10.10.0.40: icmp_seq=3 ttl=61 time=0.637 ms
64 bytes from 10.10.0.40: icmp_seq=4 ttl=61 time=0.511 ms
64 bytes from 10.10.0.40: icmp_seq=5 ttl=61 time=0.513 ms
64 bytes from 10.10.0.40: icmp_seq=6 ttl=61 time=0.451 ms

--- 10.10.0.40 ping statistics ---
6 packets transmitted, 6 received, 0% packet loss, time 108ms
rtt min/avg/max/mdev = 0.408/0.508/0.637/0.074 ms

Rick@rick:~$ ss -antp
State      Recv-Q  Send-Q   Local Address:Port     Peer Address:Port                                    
LISTEN     0       128            0.0.0.0:22            0.0.0.0:*                                       
LISTEN     0       128            0.0.0.0:23            0.0.0.0:*                                       
LISTEN     0       128            0.0.0.0:80            0.0.0.0:*                                       
LISTEN     0       128               [::]:22               [::]:*                                       
LISTEN     0       128               [::]:80               [::]:*                                       
LISTEN     0       128                  *:21                  *:*                                       

Rick@rick:~$ ssh student@10.50.24.152 -R 51299:127.0.0.1:22
Could not create directory '/home/Rick/.ssh'.
The authenticity of host '10.50.24.152 (10.50.24.152)' can't be established.
ECDSA key fingerprint is SHA256:Aa3DdURnrDwLwmp2VRuMbghlUL+eAL0FoDLsY6i191Y.
Are you sure you want to continue connecting (yes/no)? yes^C

Rick@rick:~$ ssh student@10.50.24.152 -R 51299:127.0.0.1:22 -NT
Could not create directory '/home/Rick/.ssh'.
The authenticity of host '10.50.24.152 (10.50.24.152)' can't be established.
ECDSA key fingerprint is SHA256:Aa3DdURnrDwLwmp2VRuMbghlUL+eAL0FoDLsY6i191Y.
Are you sure you want to continue connecting (yes/no)? yes
Failed to add the host to the list of known hosts (/home/Rick/.ssh/known_hosts).

student@10.50.24.152's password:

________________________________________________________________________________________________________

student@blue-internet-host-student-12:~$ ss -ntlp
State        Recv-Q       Send-Q              Local Address:Port                Peer Address:Port       
LISTEN       0            128                       0.0.0.0:80                       0.0.0.0:*          
LISTEN       0            128                       0.0.0.0:22                       0.0.0.0:*          
LISTEN       0            128                       0.0.0.0:23                       0.0.0.0:*          
LISTEN       0            128                     127.0.0.1:6010                     0.0.0.0:*          
LISTEN       0            128                     127.0.0.1:51299                    0.0.0.0:*          
LISTEN       0            128                          [::]:80                          [::]:*          
LISTEN       0            128                             *:21                             *:*          
LISTEN       0            2                           [::1]:3350                        [::]:*          
LISTEN       0            128                          [::]:22                          [::]:*          
LISTEN       0            128                         [::1]:6010                        [::]:*          
LISTEN       0            2                               *:3389                           *:*          
LISTEN       0            128                         [::1]:51299                       [::]:*          

student@blue-internet-host-student-12:~$ nc 127.0.0.1 51299
SSH-2.0-OpenSSH_7.9p1 Debian-10+deb10u2

student@blue-internet-host-student-12:~$ ssh Rick@127.0.0.1 -p 51299
The authenticity of host '[127.0.0.1]:51299 ([127.0.0.1]:51299)' can't be established.
ECDSA key fingerprint is SHA256:UqKHM1OH5cVculumfoYyQiy/VUrZHku8sD6iNCDkvPo.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '[127.0.0.1]:51299' (ECDSA) to the list of known hosts.
Rick@127.0.0.1's password: password
Linux rick 4.19.0-18-cloud-amd64 #1 SMP Debian 4.19.208-1 (2021-09-29) x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Thu Nov  7 14:35:38 2024 from 127.0.0.1 

_________________________________________________________________________________________________________

student@blue-internet-host-student-12:~$ ssh Rick@127.0.0.1 -p 51299 -D 9050 -NT
Rick@127.0.0.1's password:

_________________________________________________________________________________________________________

student@blue-internet-host-student-12:~$ proxychains nmap -Pn -T4 -vvvv -p21-23,80 10.1.2.18,27
ProxyChains-3.1 (http://proxychains.sf.net)
Starting Nmap 7.70 ( https://nmap.org ) at 2024-11-07 14:38 UTC

Nmap scan report for 10.1.2.18
Host is up, received user-set (0.00079s latency).
Scanned at 2024-11-07 14:38:07 UTC for 0s

PORT   STATE  SERVICE REASON
21/tcp open   ftp     syn-ack
22/tcp closed ssh     conn-refused
23/tcp closed telnet  conn-refused
80/tcp open   http    syn-ack

Nmap scan report for 10.1.2.27
Host is up, received user-set (0.032s latency).
Scanned at 2024-11-07 14:38:07 UTC for 0s

PORT   STATE  SERVICE REASON
21/tcp closed ftp     conn-refused
22/tcp closed ssh     conn-refused
23/tcp closed telnet  conn-refused
80/tcp closed http    conn-refused

Read data files from: /usr/bin/../share/nmap
Nmap done: 2 IP addresses (2 hosts up) scanned in 0.11 seconds

proxychains wget -r

proxychains nmap -Pn -T4 -vvvv -p1024- 10.1.2.18

_____________________________________________________________________________________________________


student@blue-internet-host-student-12:~$ ssh Rick@127.0.0.1 -p 51299 -L 51200:10.1.2.18:2222 -NT
Rick@127.0.0.1's password:

_____________________________________________________________________________________________________

student@blue-internet-host-student-12:~$ nc 127.0.0.1 51200
SSH-2.0-OpenSSH_7.9p1 Debian-10+deb10u2

student@blue-internet-host-student-12:~$ ssh Morty@127.0.0.1 -p 51200
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Add correct host key in /home/student/.ssh/known_hosts to get rid of this message.
Offending ECDSA key in /home/student/.ssh/known_hosts:10
  remove with:
  ssh-keygen -f "/home/student/.ssh/known_hosts" -R "[127.0.0.1]:51200"
ECDSA host key for [127.0.0.1]:51200 has changed and you have requested strict checking.
Host key verification failed.

student@blue-internet-host-student-12:~$ ssh-keygen -f "/home/student/.ssh/known_hosts" -R "[127.0.0.1]:51200"
# Host [127.0.0.1]:51200 found: line 10
/home/student/.ssh/known_hosts updated.
Original contents retained as /home/student/.ssh/known_hosts.old
student@blue-internet-host-student-12:~$ ssh Morty@127.0.0.1 -p 51200
The authenticity of host '[127.0.0.1]:51200 ([127.0.0.1]:51200)' can't be established.
ECDSA key fingerprint is SHA256:FPiaYsZ8ENnBu27xQplEmUH+sEcLyV+ZfGUpiNfHgzs.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '[127.0.0.1]:51200' (ECDSA) to the list of known hosts.
Morty@127.0.0.1's password: password
Linux morty 4.19.0-18-cloud-amd64 #1 SMP Debian 4.19.208-1 (2021-09-29) x86_64

Morty@morty:~$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc pfifo_fast state UP group default qlen 1000
    link/ether fa:16:3e:32:47:85 brd ff:ff:ff:ff:ff:ff
    inet 10.1.2.18/28 brd 10.1.2.31 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::f816:3eff:fe32:4785/64 scope link 
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc pfifo_fast state UP group default qlen 1000
    link/ether fa:16:3e:83:70:3c brd ff:ff:ff:ff:ff:ff
    inet 172.16.10.120/27 brd 172.16.10.127 scope global eth1
       valid_lft forever preferred_lft forever
    inet6 fe80::f816:3eff:fe83:703c/64 scope link 
       valid_lft forever preferred_lft forever

Morty@morty:~$ ip n | grep 172
172.16.10.121 dev eth1 lladdr fa:16:3e:d4:f9:d7 REACHABLE
172.16.10.126 dev eth1 lladdr fa:16:3e:db:de:31 STALE
172.16.10.112 dev eth1 lladdr fa:16:3e:6d:b1:18 STALE

Morty@morty:~$ ip r
default via 10.1.2.30 dev eth0 
default via 172.16.10.126 dev eth1 
10.1.2.16/28 dev eth0 proto kernel scope link src 10.1.2.18 
172.16.10.96/27 dev eth1 proto kernel scope link src 172.16.10.120 

Morty@morty:~$ ss -nltp
State        Recv-Q       Send-Q               Local Address:Port               Peer Address:Port       
LISTEN       0            128                        0.0.0.0:2222                    0.0.0.0:*          
LISTEN       0            128                        0.0.0.0:80                      0.0.0.0:*          
LISTEN       0            128                           [::]:2222                       [::]:*          
LISTEN       0            128                           [::]:80                         [::]:*          
LISTEN       0            128                              *:21                            *:*          

Morty@morty:~$ for i in {97..126}; do (ping -c 1 172.16.10.$i | grep "bytes from" &) ; done
64 bytes from 172.16.10.112: icmp_seq=1 ttl=64 time=0.306 ms
64 bytes from 172.16.10.120: icmp_seq=1 ttl=64 time=0.012 ms
64 bytes from 172.16.10.121: icmp_seq=1 ttl=64 time=0.261 ms
64 bytes from 172.16.10.126: icmp_seq=1 ttl=64 time=0.129 ms

___________________________________________________________________________________________________________

student@blue-internet-host-student-12:~$ ssh Morty@127.0.0.1 -p 51200 -D 9050 -NT

___________________________________________________________________________________________________________

Morty@morty:~$ 64 bytes from 172.16.10.126: icmp_seq=1 ttl=64 time=0.129 ms
logout
Connection to 127.0.0.1 closed.

student@blue-internet-host-student-12:~$ nmap -T4 -vvvv -p21-23,80 172.16.10.112,121
Starting Nmap 7.70 ( https://nmap.org ) at 2024-11-07 14:55 UTC
Initiating Ping Scan at 14:55
Scanning 2 hosts [2 ports/host]
Completed Ping Scan at 14:55, 2.00s elapsed (2 total hosts)
Nmap scan report for 172.16.10.112 [host down, received no-response]
Nmap scan report for 172.16.10.121 [host down, received no-response]
Read data files from: /usr/bin/../share/nmap
Nmap done: 2 IP addresses (0 hosts up) scanned in 2.03 seconds

student@blue-internet-host-student-12:~$ proxychains nmap -T4 -vvvv -p21-23,80 172.16.10.112,121
ProxyChains-3.1 (http://proxychains.sf.net)
Starting Nmap 7.70 ( https://nmap.org ) at 2024-11-07 14:56 UTC

Nmap scan report for 172.16.10.112
Host is up, received conn-refused (0.0017s latency).
Scanned at 2024-11-07 14:56:05 UTC for 0s

PORT   STATE  SERVICE REASON
21/tcp closed ftp     conn-refused
22/tcp closed ssh     conn-refused
23/tcp closed telnet  conn-refused
80/tcp closed http    conn-refused

Nmap scan report for 172.16.10.121
Host is up, received syn-ack (0.0016s latency).
Scanned at 2024-11-07 14:56:05 UTC for 0s

PORT   STATE  SERVICE REASON
21/tcp open   ftp     syn-ack
22/tcp closed ssh     conn-refused
23/tcp closed telnet  conn-refused
80/tcp open   http    syn-ack

student@blue-internet-host-student-12:~$ proxychains wget -r 172.16.10.121
ProxyChains-3.1 (http://proxychains.sf.net)
--2024-11-07 14:57:28--  http://172.16.10.121/
Connecting to 172.16.10.121:80... |S-chain|-<>-127.0.0.1:9050-<><>-172.16.10.121:80-<><>-OK
connected.
HTTP request sent, awaiting response... 200 OK
Length: 61 [text/html]
Saving to: ‘172.16.10.121/index.html’

172.16.10.121/index.html  100%[=====================================>]      61  --.-KB/s    in 0s      

2024-11-07 14:57:28 (22.9 MB/s) - ‘172.16.10.121/index.html’ saved [61/61]

Loading robots.txt; please ignore errors.
--2024-11-07 14:57:28--  http://172.16.10.121/robots.txt
Reusing existing connection to 172.16.10.121:80.
HTTP request sent, awaiting response... 404 Not Found
2024-11-07 14:57:28 ERROR 404: Not Found.

--2024-11-07 14:57:28--  http://172.16.10.121/Jerry-http.png
Reusing existing connection to 172.16.10.121:80.
HTTP request sent, awaiting response... 200 OK
Length: 7674 (7.5K) [image/png]
Saving to: ‘172.16.10.121/Jerry-http.png’

172.16.10.121/Jerry-http. 100%[=====================================>]   7.49K  --.-KB/s    in 0s      

2024-11-07 14:57:28 (2.27 GB/s) - ‘172.16.10.121/Jerry-http.png’ saved [7674/7674]

student@blue-internet-host-student-12:~$ proxychains wget -r ftp://172.16.10.121
ProxyChains-3.1 (http://proxychains.sf.net)
--2024-11-07 14:57:34--  ftp://172.16.10.121/
           => ‘172.16.10.121/.listing’
Connecting to 172.16.10.121:21... |S-chain|-<>-127.0.0.1:9050-<><>-172.16.10.121:21-<><>-OK
connected.
Logging in as anonymous ... Logged in!
==> SYST ... done.    ==> PWD ... done.
==> TYPE I ... done.  ==> CWD not needed.
==> PASV ... |S-chain|-<>-127.0.0.1:9050-<><>-172.16.10.121:39127-<><>-OK
done.    ==> LIST ... done.

172.16.10.121/.listing        [ <=>                                  ]     255  --.-KB/s    in 0.04s   

2024-11-07 14:57:44 (5.69 KB/s) - ‘172.16.10.121/.listing’ saved [255]

Removed ‘172.16.10.121/.listing’.
--2024-11-07 14:57:44--  ftp://172.16.10.121/Jerry-ftp.png
           => ‘172.16.10.121/Jerry-ftp.png’
==> CWD not required.
==> PASV ... |S-chain|-<>-127.0.0.1:9050-<><>-172.16.10.121:44963-<><>-OK
done.    ==> RETR Jerry-ftp.png ... done.
Length: 7674 (7.5K)

172.16.10.121/Jerry-ftp.p 100%[=====================================>]   7.49K  --.-KB/s    in 0.04s   

2024-11-07 14:57:45 (180 KB/s) - ‘172.16.10.121/Jerry-ftp.png’ saved [7674]

--2024-11-07 14:57:45--  ftp://172.16.10.121/welcome.msg
           => ‘172.16.10.121/welcome.msg’
==> CWD not required.
==> PASV ... |S-chain|-<>-127.0.0.1:9050-<><>-172.16.10.121:41673-<><>-OK
done.    ==> RETR welcome.msg ... done.
Length: 170

172.16.10.121/welcome.msg 100%[=====================================>]     170  --.-KB/s    in 0s      

2024-11-07 14:57:45 (45.1 MB/s) - ‘172.16.10.121/welcome.msg’ saved [170]

student@blue-internet-host-student-12:~$ eom 172.16.10.121/
index.html      Jerry-ftp.png   Jerry-http.png  welcome.msg     

student@blue-internet-host-student-12:~$ eom 172.16.10.121/Jerry-
Jerry-ftp.png   Jerry-http.png  

student@blue-internet-host-student-12:~$ eom 172.16.10.121/*.png

student@blue-internet-host-student-12:~$ proxychains nmap -Pn -T4 -vvvv -p1024- 172.16.10.121
Completed Connect Scan at 15:00, 43.28s elapsed (64512 total ports)
Nmap scan report for 172.16.10.121
Host is up, received user-set (0.00051s latency).

PORT     STATE SERVICE REASON
2323/tcp open  3d-nfsd syn-ack

student@blue-internet-host-student-12:~$ proxychains nc 172.16.10.121 2323
ProxyChains-3.1 (http://proxychains.sf.net)
|S-chain|-<>-127.0.0.1:9050-<><>-172.16.10.121:2323-<><>-OK
SSH-2.0-OpenSSH_7.9p1 Debian-10+deb10u2

___________________________________________________________________________________________________

student@blue-internet-host-student-12:~$ ssh Morty@127.0.0.1 -p 51200 -L 51201:172.16.10.121:2323  -NT
Morty@127.0.0.1's password:

___________________________________________________________________________________________________

student@blue-internet-host-student-12:~$ ssh Jerry@127.0.0.1 -p 51201
The authenticity of host '[127.0.0.1]:51201 ([127.0.0.1]:51201)' can't be established.
ECDSA key fingerprint is SHA256:pbFNI6EPhuuFDZZm4uVwpqF56PoDPihnZxpbDbw1Ink.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '[127.0.0.1]:51201' (ECDSA) to the list of known hosts.
Jerry@127.0.0.1's password: 

Jerry@jerry:~$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc pfifo_fast state UP group default qlen 1000
    link/ether fa:16:3e:d4:f9:d7 brd ff:ff:ff:ff:ff:ff
    inet 172.16.10.121/27 brd 172.16.10.127 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::f816:3eff:fed4:f9d7/64 scope link 
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc pfifo_fast state UP group default qlen 1000
    link/ether fa:16:3e:8f:e0:64 brd ff:ff:ff:ff:ff:ff
    inet 192.168.10.71/26 brd 192.168.10.127 scope global eth1
       valid_lft forever preferred_lft forever
    inet6 fe80::f816:3eff:fe8f:e064/64 scope link 
       valid_lft forever preferred_lft forever

Jerry@jerry:~$ ip neigh | grep fa:16
172.16.10.112 dev eth0 lladdr fa:16:3e:6d:b1:18 STALE
192.168.10.69 dev eth1 lladdr fa:16:3e:63:de:f6 STALE
172.16.10.126 dev eth0 lladdr fa:16:3e:db:de:31 REACHABLE
192.168.10.126 dev eth1 lladdr fa:16:3e:68:98:a5 STALE
192.168.10.81 dev eth1 lladdr fa:16:3e:bd:9f:58 STALE
172.16.10.120 dev eth0 lladdr fa:16:3e:83:70:3c REACHABLE

___________________________________________________________________________________________________

^Cstudent@blue-internet-host-student-12:~$ ssh Jerry@127.0.0.1 -p 51201 -D 9050 -NT
Jerry@127.0.0.1's password: 

___________________________________________________________________________________________________
