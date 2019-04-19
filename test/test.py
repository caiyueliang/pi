from numba import jit
import time
import numpy as np

@jit
def foo(x, y):
    tt = time.time()
    s = 0
    for i in range(x, y):
        s += i
    print('Time used: {} sec'.format(time.time()-tt))
    return s


def foo_1(x, y):
    tt = time.time()
    s = 0
    for i in range(x, y):
        s += i
    print('Time used: {} sec'.format(time.time()-tt))
    return s


# 'f8(f8[:])': 表示sum1d()是一个参数为双精度浮点数的一维数组，返回值是一个双精度浮点数。
@jit
def sum1d(array):
    start = time.time()
    s = 0.0
    n = array.shape[0]
    for i in range(n):
        s += array[i]
    print(time.time() - start)
    return s

@jit('int32(int32[:])')
def sum2d(array):
    start = time.time()
    s = 0.0
    n = array.shape[0]
    for i in range(n):
        s += array[i]
    print(time.time() - start)
    return s


def sum3d(array):
    start = time.time()
    s = 0.0
    n = array.shape[0]
    for i in range(n):
        s += array[i]
    print(time.time() - start)
    return s


if __name__ == "__main__":
    # print(foo(1, 100000000))
    # print(foo_1(1, 100000000))

    print(sum1d(np.ones(100000000, dtype=np.int32)))
    print(sum2d(np.ones(100000000, dtype=np.int32)))
    print(sum3d(np.ones(100000000, dtype=np.int32)))

    # print(sum1d(np.ones(100000000, dtype=np.float32)))
    # print(sum1d(np.ones(100000000, dtype=np.float64)))
