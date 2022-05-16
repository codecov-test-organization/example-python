import awesome
from awesome.code_fib import fib, something, times_2


def test_something():
    assert awesome.smile() == ':)'
    assert something()

def test_fib():
    assert fib(1) == 1

def test_times_2():
    assert times_2(2) == 4

def test_fib_second():
    assert fib(3) == 3
    assert fib(5) == 8


def test_something_wrong():
    assert awesome.smile() != 1

def test_useless():
    assert 2+2 == 4

def test_another():
    assert awesome.k('2') == '22'
