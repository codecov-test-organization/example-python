def fib(n):
    if n < 0:
        return 0
    if n <= 1:
        return 1
    return fib(n - 1) + fib(n - 2)

def something():
    return True

def times_2(x):
    return x*2

def untested_code(a):
    raise Exception()
