import socket

serverSocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_addr = ('127.0.0.1', 1337)
#server_addr = (socket.gethostname(), 1337)
serverSocket.bind(server_addr)
serverSocket.listen(10)
while True:
    (clientSocket, addr) = serverSocket.accept()
    print(clientSocket.recv(1024))
