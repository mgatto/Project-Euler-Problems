<?php
/*
 * Project Euler: Problem 3 - First Try
 *
 * The prime factors of 13195 are 5, 7, 13 and 29.
 * What is the largest prime factor of the number 600851475143?
 *
 * PHP_INT_MAX = 2147483647; cast 600851475143 to float, or use the
 * GMP extensions.
 */

/**
 *
 * @param unknown $n
 * @return multitype:
 */
function factors($n)
{
    /* cast to int, in case stringified int was passed... */
    $n = (int) $n; // or intval($n);

    $factors = array();
    $d = 2;

    while ( $n > 1 ) {
        //echo $n, ' ', $d , ' ', $n % $d , "\r\n";
        while ( 0 == $n % $d ) {
            array_push($factors, $d);
            $n /= $d;
        }

        $d += 1;

        if ( pow($d, 2) > $n) { //also: if( d*d > $n )
            if ( $n > 1 ) {
                array_push($factors, $n);
            }

            break;
        }
    }

    return array_unique($factors);
}

/**
 *
 * @param string $n Example: "4345789213455666666"; quotes are important since GMP can make a bigint from a stringified integer.
 * @return multitype:
 */
function gmp_factors($n)
{
    /* cast to a gmp resource */
    $n = gmp_init($n, 10); //explicitly make it decimal/Base10

    $factors = array();
    $d = gmp_init(2, 10); //explicitly make it decimal/Base10

    /* args to gmp_cmp() should be a string per docs, though in the docs for gmp_init() say this isn't necessary */
    while ( 0 < gmp_cmp($n, '1') ) {
        echo gmp_strval($n), ' ', gmp_strval($d), ' ', gmp_strval(gmp_mod($n, $d)), "\r\n";
        while ( '0' === gmp_strval(gmp_mod($n, $d)) ) {
            array_push($factors, gmp_strval($d));
            $n = gmp_div($n, $d);
        }

        $d = gmp_add($d, '1');

        $squared_d = gmp_pow($d, '2');
        /* gmp_cmp(): "Returns a positive value if a > b, zero if a = b and a negative value if a < b."
         * But, -n is not false in php's if(), but it is for empty()! */
        if ( 0 < gmp_cmp($squared_d, $n)) {
            if (gmp_cmp($n, '1')) {
                array_push($factors, gmp_strval($n));
                break;
            }
        }
    }

    return $factors;
}

/* 600851475143   ~600 billion! */
//$number = "600851475143";
$number = "600851475143";
if ($number > PHP_INT_MAX) {
    echo "selecting 'gmp_factor()'\r\n";
    $factors_of_bigint = gmp_factors($number);
} else {
    echo "selecting regular 'factor()'\r\n";
    $factors_of_bigint = factors($number);
}

print join(',', $factors_of_bigint);
echo "\r\n";
print max($factors_of_bigint);
