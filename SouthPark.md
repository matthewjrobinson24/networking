student@blue-internet-host-student-12:~$ nmap -T4 -vvvv -p 21-23,80 TargetIP
_______________________________________________________________________________________________
student@blue-internet-host-student-12:~$ nc & wget -r TargetIP Port then cat | eom | eog
_______________________________________________________________________________________________
student@blue-internet-host-student-12:~$ telnet TargetIP
_______________________________________________________________________________________________
Eric@Eric:~$ Host Enumeration
_______________________________________________________________________________________________
Eric@Eric:~$ ssh student@10.50.24.152 -R 51299:127.0.0.1:8462 -NT
# |
student@blue-internet-host-student-12:~$ ss -ntlp
_______________________________________________________________________________________________
student@blue-internet-host-student-12:~$ nc 127.0.0.1 51299
# |
student@blue-internet-host-student-12:~$ ssh Eric@127.0.0.1 -p 51299
# |
student@blue-internet-host-student-12:~$ ssh Eric@127.0.0.1 -p 51299 -D 9050 -NT
# |
student@blue-internet-host-student-12:~$ proxychains nmap -T4 -vvvv -p 21-23,80
_______________________________________________________________________________________________
student@blue-internet-host-student-12:~$ proxychains nc & wget -r
# |
student@blue-internet-host-student-12:~$ ssh Eric@127.0.0.1 -p 51299 -L 51200:192.168.100.60:22 -NT
_______________________________________________________________________________________________
student@blue-internet-host-student-12:~$ ss -ntlp
_______________________________________________________________________________________________
student@blue-internet-host-student-12:~$ nc 127.0.0.1 51200
# |
student@blue-internet-host-student-12:~$ ssh Kenny@127.0.0.1 -p 51200
_______________________________________________________________________________________________
Kenny@kenny:~$ Host Enumeration
_______________________________________________________________________________________________
# |
student@blue-internet-host-student-12:~$ ssh Kenny@127.0.0.1 -p 51200 -D 9050 -NT
# |
_______________________________________________________________________________________________
student@blue-internet-host-student-12:~$ proxychains nmap -T4 -vvvv -p 21-23,80
_______________________________________________________________________________________________
student@blue-internet-host-student-12:~$ proxychains nc & wget -r
_______________________________________________________________________________________________
student@blue-internet-host-student-12:~$ proxychains nmap -T4 -vvvv -p1024
# |
student@blue-internet-host-student-12:~$ ssh Kenny@127.0.0.1 -p 51200 -L 51201:10.90.50.140:6481 -NT
_______________________________________________________________________________________________
student@blue-internet-host-student-12:~$ ss -ntlp
_______________________________________________________________________________________________
student@blue-internet-host-student-12:~$ nc 127.0.0.1 51201
# |
student@blue-internet-host-student-12:~$ ssh Kyle@127.0.0.1 -51201
_______________________________________________________________________________________________
Kyle@kyle:~$ Host Enumeration
# |
student@blue-internet-host-student-12:~$ ssh Kyle@127.0.0.1 -p 51201 -D 9050 -NT 
# |
student@blue-internet-host-student-12:~$ proxychains nmap -T4 -vvvv -p 21-23,80
_______________________________________________________________________________________________
student@blue-internet-host-student-12:~$ proxychains nc & wget -r & eom | eog
# |
student@blue-internet-host-student-12:~$ ssh Kyle@127.0.0.1 -p 51201 -L 51202:172.20.21.5:23 -NT
_______________________________________________________________________________________________
student@blue-internet-host-student-12:~$ ss -ntlp
_______________________________________________________________________________________________
student@blue-internet-host-student-12:~$ nc 127.0.0.1 51202
# |
student@blue-internet-host-student-12:~$ telnet 127.0.0.1 51202
_______________________________________________________________________________________________
Stan@stan:~$ Host Enumeration
_______________________________________________________________________________________________
