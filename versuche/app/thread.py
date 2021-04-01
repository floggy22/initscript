import threading
import time
import logging


def tfunc(value):
    i = 0
    print("Start")
    #while True:
    time.sleep(5)
    print("Value: ", i)
    i += 1

def main():
    print("Hallo")
    format = "%(asctime)s: %(message)s"
    logging.basicConfig(format=format, level=logging.INFO, datefmt="%H:%M:%S")
    logging.info("Main   : before creating thread")
    x  = threading.Thread(target=tfunc, args=(34, ))
    x.daemon = True
    x.start()
    logging.info("Main : wait")
    #x.join()
    logging.info("Main : ready")
    


if __name__ == "__main__":
    main()