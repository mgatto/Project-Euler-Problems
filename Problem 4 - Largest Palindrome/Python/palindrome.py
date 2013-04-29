#!/usr/bin/env python

def generate_largest_palindrome(min_lim, max_lim):
    candidates = []

    # Using a variable named 'max' interferes with the built-in function max()!
    # http://stackoverflow.com/questions/5581719/python-min-apparently-not-accepting-list-of-ints
    for j in range(min_lim, max_lim, 1):
        for k in range(min_lim, max_lim, 1):
            candidate = j * k

            # extended slice operator; same as s.join(reversed(s))
            if str(candidate) == str(candidate)[::-1]:
                candidates.append(candidate)

    return max(candidates)

print generate_largest_palindrome(100, 999)
