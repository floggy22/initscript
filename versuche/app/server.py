import socket
import threading

class Server:
    serverSocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    connections = []

    def __init__(self):
        server_address = ('127.0.0.1', 1337)
        self.serverSocket.bind(server_address)
        self.serverSocket.listen(1)
    
    def handler(self, c, a):
        while True:
            data = c.recv(1024)
            print(data)
            for connection in self.connections:
                connection.send(data)
            if not data:
                break

    def run(self):
        print("Run Server...wait for connections")
        while True:
            c, a = self.serverSocket.accept()
            cThread = threading.Thread(target=self.handler, args=(c, a))
            cThread.daemon = True
            cThread.start()
            self.connections.append(c)
            print(self.connections)

server = Server()
server.run()