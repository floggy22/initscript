import socket

HOST = 'localhost'
PORT = 45834

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((HOST, PORT))
s.listen()
conn, addr = s.accept()

with conn:
    print("Connected by ", addr)
    while True:
        data = conn.recv(1024)
        if not data:
            break
        conn.sendall(data)

def connect():
    pass

def main():
    #input("Bla: ")
    print("Hallo Welt")
    


if __name__ == "__main__":
    main()