<?php

/* must have an initialized variable so we can += below! */
$sum = 0;

for ( $x=3; $x < 1000; $x++ ) {
    /* only sum factors of 3 or 5 */
    if ( (0 === $x % 3) || ( 0 === $x % 5) ) {
        $sum += $x;
    }
}

print $sum . PHP_EOL;
