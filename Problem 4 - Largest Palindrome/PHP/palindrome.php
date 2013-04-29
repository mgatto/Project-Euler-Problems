<?php

function generate_largest_palindrome($min, $max)
{
    /* PHP can't " use function return value in write context" which is why
     * range() must assign to a variable first, instead of inlining it in the
     * foreach loop! */
    $range = range($min, $max, 1);

    /* PHP foreach loops reverse the order usually expected in Python or Perl? */
    foreach ( $range as $j ) {
        foreach ( $range as $k ) {
            $candidate = $k * $j;

            if ( "$candidate" === strrev("$candidate")) {
                $candidates[] = $candidate;
            }
        }
    }

    return max($candidates);
}

$palindrome = generate_largest_palindrome(100, 999);
echo $palindrome . PHP_EOL;
