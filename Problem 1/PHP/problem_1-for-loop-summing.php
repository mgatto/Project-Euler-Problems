<?php
/**
 * This solution reflects the spirit of the canonical solution contained in 
 * Project Euler's PDF. The canonical solution uses a defined function, then 
 * calls it thrice: once to sum factors of 3, once for factors of 5 and lastly 
 * to sum factors of 15: F(3) + F(5) - F(15).
 *
 * This uses a test nested within a for loop. The test contains two triggers 
 * and sums at once.
 *
 * Some posted solutions for PHP append each sum into an array and then add 
 * them at the end. I think that takes more memory than addition+substitution 
 * in place.
 *
 * This solution also append an EOL char so it leaves a clean console :-)
 */

/* must have an initialized variable so we can += below! */
$sum = 0;

for ( $x=3; $x < 1000; $x++ ) {
    /* only sum factors of 3 or 5 */
    if ( (0 === $x % 3) || ( 0 === $x % 5) ) {
        $sum += $x;
    }
}

print $sum . PHP_EOL;
