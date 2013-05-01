"""
Finds the largest prime factor of a number using trial division
"""
def largest_prime_factor(number):
    n = number
    d = 2
    factors = []

    while n > 1:
        while 0 == n % d:
            factors.append(d)
            n /= d

        d += 1

        if d**2 > n:
            # test again since $n _could_ be 1 after lineno 29
            if n > 1:
                factors.append(n)

    return max(factors);

print largest_prime_factor(600851475143)
