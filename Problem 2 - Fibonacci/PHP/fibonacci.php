<?php

/**
 * Find the sum of all the even terms in the Fibonacci sequence below $x.
 *
 * @param number $limit     The limit of which the sms may not exceed
 * @return number           The sum of all even numbers in the fibonacci sequence
 *                          beneath $limit
 */
function sum_even_fibonacci($limit = 4000000)
{
    /* The first three terms of a fib sequence; if I only use 0,1, then I get
     * infinite recursion since 0 + 1 always = 1... */
    $sequence = array(0, 1);
    $evens = array();

    /* Its rediculous that PHP doesn't support [-1] to get the last item */
    while( $sequence[count($sequence)-1] < $limit ) {
        /* must separate sequence generation from filtering for evens */
        $term = $sequence[count($sequence)-1] + $sequence[count($sequence)-2];

        //echo $sequence[count($sequence)-1], ' + ', $sequence[count($sequence)-2], '= ', $term, '; limit = ',$limit , PHP_EOL;

        $sequence[] = $term;

        /* only add it if its an even number */
        if ( 0 === $term % 2 ) {
            $evens[] = $term;
        }
    }

    return array_sum($evens);
}

echo sum_even_fibonacci();
