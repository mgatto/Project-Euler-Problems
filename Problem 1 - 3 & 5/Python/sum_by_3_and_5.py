#! /usr/bin/env python


def sum(multiple = 0, limit = 0):
    """ sum a term arithmetically until a limit """

    max_term = int( (limit - 1) / multiple );
    sum = ( multiple * (max_term * (max_term + 1)) ) / 2;

    return sum


if __name__ == "__main__":
    print sum(3, 1000) + sum(5, 1000) - sum(15, 1000)
