<?php 

$threes = 0;
$fives = 0;
$x = 0;
$y = 0;
/*$sum_threes = function($number) {
    return $number + 3;
};*/

//this is wrong because I didn't factor out repeated numbers in this, such as those divisable by 3*5 (i.e. 15)!


while ( $x < 1000 ) {
    $x += 3;
    $threes += $x;
}
while ( $y < 1000 ) {
    $y += 5;
    $fives += $y;
}

print $threes + $fives;