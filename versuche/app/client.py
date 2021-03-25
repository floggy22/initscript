#%%
import socket
import threading

class client:
    clientSocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    def sendMsg(self):
        while True:
            self.clientSocket.send(bytes(input("")), 'utf-8')

    def __init__(self):
        server_addr = ('127.0.0.1', 1337)
        self.clientSocket.connect(server_addr)
        iThread = threading.Thread(target=self.sendMsg)
        iThread.daemon = True
        iThread.start

        while True:
            data = self.clientSocket.recv(1024)
            if not data:
                break  
            print(data)  


# %%
