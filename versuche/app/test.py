




class Master():
    def __init__(self):
        print("master")
    
    def funcA(self):
        print("Funktion A")

class Client(Master):
    def __init__(self):
        super().__init__()
        print("client")
    def funcB(self):
        print("Funktion B")

a = 20

def data():
    a = 3
    print("Value: ", a)

def main():
    print("MAIN")
    print("MValue:", a)
    data()
    print("MValue:", a)

    m = Master()
    c = Client()
    c.funcA()
    c.funcB()
    list = {34,34,23}
    print(list)

if __name__ == '__main__':
    main()