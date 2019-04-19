import time


def foo(x, y):
    tt = time.time()
    s = 0
    for i in range(x, y):
        s += i
    print('Time used: {} sec'.format(time.time()-tt))
    return s


if __name__ == "__main__":
    print(foo(1, 100000000))
