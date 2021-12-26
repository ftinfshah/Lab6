import socket
import signal
import sys

ClientSocket = socket.socket()
host = '192.168.56.5'
port = 8888

print('Waiting for connection')
try:
    ClientSocket.connect((host, port))
except socket.error as e:
    print(str(e))

Response = ClientSocket.recv(1024)
print(Response)
Response = ClientSocket.recv(1024)
print(Response)


while True:
    
    Input = input('Enter an operation and a number: ')
    if Input == 'out':
        break
    else:
        ClientSocket.send(str.encode(Input))
        Response = ClientSocket.recv(1024)
        print(Response.decode('utf-8'))

ClientSocket.close()
