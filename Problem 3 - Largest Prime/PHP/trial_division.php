<?php
/*
 * Project Euler: Problem 3 - First Try
 *
 * The prime factors of 13195 are 5, 7, 13 and 29.
 * What is the largest prime factor of the number 600851475143?
 */

/* use Project Euler's mandated number! */
$number = "600851475143";

/* Allow to be used from command line, too! */
/* argv[0] is the name of this script */
if ( ! empty($argv[1]) ) {
    /* its already a string, for gmp's sake */
    $number = $argv[1];
}

echo "Finding all factors of $number ..." . PHP_EOL;

/* call the factoring function */
$all_factors = gmp_factors($number);

/* tell the user! */
echo "All factors: ", join(',', $all_factors), PHP_EOL, "Largest factor: ", max($all_factors), PHP_EOL;


/**
 * Calculate a number's list of factors using the gmp library.
 *
 * PHP_INT_MAX = 2147483647; thus, use the GMP extension.
 *
 * @param string $n     Example: "4345789213455666666"; quotes are important since GMP can make a bigint from a stringified integer.
 * @return mixed        List of numbers, which are the argument's factors
 */
function gmp_factors($n)
{
    /* cast to a gmp resource */
    $n = gmp_init($n, 10); //explicitly make it decimal/Base10

    $factors = array();
    $d = gmp_init(2, 10); //explicitly make it decimal/Base10

    /* args to gmp_cmp() should be a string per docs, though in the docs for gmp_init() say this isn't necessary */
    while ( 0 < gmp_cmp($n, '1') ) {
        while ( '0' === gmp_strval(gmp_mod($n, $d)) ) {
            array_push($factors, gmp_strval($d)); //also: $factors[] = gmp_strval($d);
            $n = gmp_div($n, $d);
        }

        $d = gmp_add($d, '1');

        /* gmp_cmp(): "Returns a positive value if a > b, zero if a = b and a negative value if a < b."
         * But, -n is not false in php's if(), but it is for empty()! */
        if ( 0 < gmp_cmp(gmp_pow($d, '2'), $n)) {
            if (0 < gmp_cmp($n, '1')) {
                array_push($factors, gmp_strval($n));
                break;
            }
        }
    }

    return $factors;
}

