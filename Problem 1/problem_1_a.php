<?php
$sum = 0;
$x = 0;
$max = 1000;
while ( $x < $max ) {
    if ( (0 === $x % 3) || ( 0 === $x % 5) ) {
        $sum += $x;
        print $x . "\r\n";
    }
    /* increment so we can loop to the next value */
    //surely we can skip numbers if we do find a multiple of 3 or 5?
    $x++;
}

print $sum;
//how many times will this loop run? 1000? surely we can reduce it!
//Optimizations
//#1: start at 3 instead of 0   lol
//alternative: keep adding 3 to previous number and sum the additions, same with 5.



















