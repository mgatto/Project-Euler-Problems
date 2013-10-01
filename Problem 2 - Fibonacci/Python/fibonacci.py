#! /usr/bin/env python


def sum_even_fibonaccis(limit=0):
    """
    Find the sum of all the even terms in the Fibonacci sequence below $x.
    """

    if limit == 0:
        return 0  # "you wanted nothing, so I gave you nothing"

    a, b, Sum = 0, 1, 0

    while b <= limit:
        a = b      # reassign next term to previous term
        b = a + b  # increment next term by the sum of it and previous term

        if a % 2 == 0:
            Sum += a  # only add it to the cumulative sum if its even

    return Sum


print sum_even_fibonaccis()
print sum_even_fibonaccis(0)
print sum_even_fibonaccis(1)
print sum_even_fibonaccis(6)
print sum_even_fibonaccis(4000)
print sum_even_fibonaccis(4000000)


"""
# this relies on the fact that every 3rd fib number is even
def PE0022(limit=4000000):
  a, b, Sum  =  1, 2, 0
  while b <= limit:
    a, b, Sum =  a + 2 * b, 2 * a + 3 * b, b + Sum
  return Sum


def PE0023(limit=4000000):
    a, b, Sum  =  0, 2, 0
    
    while b <= limit:
        a, b, Sum =  b, a + 4 *b, Sum + b
    
    return Sum


def fib(n):
    """ Golden ratio method """
    sqrt5=5**0.5

    print r"5**0.5 = ", sqrt5
    print r"(1 + sqrt5)**n = ", (1 + sqrt5)**n
    print r"(1 - sqrt5)**n = ", (1 - sqrt5)**n
    print r"(1 + sqrt5)**n - (1 - sqrt5)**n = ", (1 + sqrt5)**n - (1 - sqrt5)**n
    print r"(2**n * sqrt5) = ", (2**n * sqrt5)
    print r"((1 + sqrt5)**n - (1 - sqrt5)**n) / (2**n * sqrt5) = ", ((1 + sqrt5)**n - (1 - sqrt5)**n) / (2**n * sqrt5)

    return int( ((1 + sqrt5)**n - (1 - sqrt5)**n) / (2**n * sqrt5) )

print fib(3)
"""

