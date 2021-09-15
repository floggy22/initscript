from multiprocessing import Pool, Process

def f(x):
    return x*x

def f1(name):
    print("hello: ", name)

def main():
    print("Hallo")
    with Pool(5) as p:
        print(p.map(f, [1, 2, 3]))
    
    p = Process(target=f1, args=('bob',))
    p.start()
    p.join()


if __name__ == '__main__':
    main()