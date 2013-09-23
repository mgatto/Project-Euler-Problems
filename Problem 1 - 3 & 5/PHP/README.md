# Php Solutions

## My Problem Solving Progression

### First Try

I started with a simple while loop:

```php
<?php

$sum = 0;
$x = 0;
$max = 1000;
while ( $x < $max ) {
    if ( (0 === $x % 3) || ( 0 === $x % 5) ) {
        $sum += $x;
    }
    /* increment so we can loop to the next value */
    $x++;
}

print $sum;
```

Surely, this is non-optimal: how many times will this loop run? 1000? Surely we can reduce it!

Possible optimizations include:
* Start at 3 instead of 0!
* Surely we can skip numbers if we do find a multiple of 3 or 5? That is, keep adding 3 to previous number and sum the additions, same with 5.
    
OK, let's do that.

### Second Try

```php
<?php 

$threes = 0;
$fives = 0;
$x = 0;
$y = 0;

while ( $x < 1000 ) {
    $x += 3;
    $threes += $x;
}
while ( $y < 1000 ) {
    $y += 5;
    $fives += $y;
}

print $threes + $fives;
```

But, this is wrong because I didn't factor out repeated numbers in this, such as those divisable by both 3*5 (i.e. 15)!

### Final Solutions

#### #1. For Loop Summing

This uses a test nested within a `for` loop. The test contains two conditions and sums at once.
  
Some posted solutions for PHP append each sum into an array and then add them at the end. I think that takes more memory than addition+substitution in place.

```php
<?php
function sum_for_loop(Array $terms, $max = 0) {
    /* must have initialized variable so we can += below without PHP errors */
    $sum = 0;

    for ( $x=0; $x < $max; $x++ ) {
        /* only sum factors of 3 or 5 */
        if ( (0 === $x % $terms[0]) || ( 0 === $x % $terms[1]) ) {
            $sum += $x;
        }
    }

    return $sum;
}
```

Of course, this semi-generalized solution assumes that the `$terms` array will only have two elements. I'll need to explore how to loop through the terms and handle them, possibly with code generation?

#### #2. Arithmetic Series

This solution reflects the spirit of the canonical solution contained in Project Euler's PDF.
It is, by far, the most efficient algorithm.

```php
function sum_arithmetic($multiple = 1, $limit = 0) {
    $max_term = intval(($limit - 1) / $multiple);
    
    return ($multiple * ($max_term * ($max_term + 1))) / 2;
}
```

The parentheses placement were key...