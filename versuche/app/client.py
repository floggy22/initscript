#%%

import socket

clientSocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_addr = ('127.0.0.1', 1337)
clientSocket.connect(server_addr)


for i in range(1,10):
    clientSocket.send(bytes("Hi" + str(i), "utf8"))


# %%
