PHP Solution
============

Algorithm
---------

I needed an algorithm, since its been quite a while since math classes.

So, I went to Wikipedia and then to Wolfram's Math World. I quickly discovered I merely needed to factor the number and then test if the number was prime. Later, it seemed obvious that constant refactoring will eventually get down to a prime number. I told you, its been a long time since my College math classes.

Trial division seemed the most useful-looking algorthim which would be easy to implement for a first pass.

Coding
------

"Regular" PHP won't work in this case since PHP_INT_MAX is 2147483647; Problem 3's integer, 600851475143 is too large. I could have either cast "600851475143" to float or use the
GMP extension. BCMath didn't seem appropriate, though.

Initial work was to make the factorial algorithm work. Once that was done, the second step was to port it to using gmp_* functions. This wasn't as straighforward as it could have been. For example, `gmp_cmp($a, $b)` returns returns -1 when $a is less than $b. Now, PHP considers a negative number as `TRUE` in conditional tests, not `FALSE`! Thus, any test can't be simply for `TRUE` or `FALSE`, but testing whether the string value of the GMP resource is less than 0 or not.

Lessons Learned
---------------

* I need to learn more mathematical symbols to understand the notation; I found it impossible to translate the mathematical notation of algorithms to code since I could not understand all the notation symbols.