Problem #4
==========

"A palindromic number reads the same both ways. The largest palindrome made
from the product of two 2-digit numbers is 9009 = 91 � 99.

Find the largest palindrome made from the product of two 3-digit numbers."


Approaches
==========

Mathworld[http://mathworld.wolfram.com/PalindromicNumber.html]

What does "closed form" mean?

1. The highest 3-digit numbers to make such a product would be 999.
2. The lowest 3-digit numbers to make such a product would be 100.
3. I can add a number "to its reverse until a palindrome appears".
4. The sum of the inverse of palindromes approaches a constant: 3.37028.


Candidate Algorithms
====================

Brute Force
-----------
loop from 100 to 999 for i
    loop from 100 to 999 for j
        multiply i with j
        test for palindrome = if $n == reverse $n

        add to high water mark maximum (if current is bigger than older...)

We want to find the largest, so lets start from 999 instead and work down,
then we don't need a high-water-mark check.

No, actually this does not produce the desired answer. The algorithm itself is
flawed since a product lower down on the sequence 999..100 may be larger.

Largest is the product of 995 and 583: 580085
Largest is the product of 995 and 517: 514415
Largest is the product of 993 and 913: 906609
Largest is the product of 991 and 121: 119911
Largest is the product of 987 and 286: 282282
Largest is the product of 987 and 143: 141141
Largest is the product of 982 and 869: 853358

Push onto an array and max() it.


Addendum
========

This is actually the first of the 4 Project Euler problems where I didn't have
to look up an algorithm in a math text :-) All on my own!
