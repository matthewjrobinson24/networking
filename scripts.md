# vim stream.py

    #!/usr/bin/python3
    import socket
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM, 0)
    ip_addr = '127.0.0.1'
    port = 1111
    s.connect((ip_addr, port))
    message = b"Message"
    s.send(message)
    data, conn = s.recvfrom(1024)
    print(data.decode('utf-8'))
    s.close()
    
## chmod +x stream.py
______________________________________________________________________________________________________
# vim streamrecv.py

    #!/usr/bin/python3
    import socket
    import os
    port = 1111
    message = b"Connected to TCP Server on port %i\n" % port
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM, 0)
    s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    s.bind(('', port))
    s.listen(1)
    os.system("clear")
    print ("Waiting for TCP connections\n")
    while 1:
        conn, addr = s.accept()
        connect = conn.recv(1024)
        address, port = addr
        print ("Message Received - '%s'" % connect.decode())
        print ("Sent by -", address, "port -", port, "\n")
        conn.sendall(message)
        conn.close()

## chmod +x streamrecv.py
______________________________________________________________________________________________________
# vim datagram.py

    #!/usr/bin/python3
    import socket
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, 0)
    ip_addr = '127.0.0.1'
    port = 2222
    message = b"Message"
    s.sendto(message, (ip_addr, port))
    data, addr = s.recvfrom(1024)
    print(data.decode())

## chmod +x datagram.py
______________________________________________________________________________________________________
# vim datagramrecv.py

    #!/usr/bin/python3
    import socket
    import os
    port = 2222
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM,0)
    s.bind(('', port))
    os.system("clear")
    print ("Awaiting UDP Messages")
    while True:
        data, addr = s.recvfrom(1024)
        address, port = addr
        print ("\nMessage Received: '%s'" % data.decode())
        print ("Sent by -", address, "port", port)
        s.sendto(b"Message received by the UDP Message Server!", addr)


## chmod +x datagramrecv.py
______________________________________________________________________________________________________

















