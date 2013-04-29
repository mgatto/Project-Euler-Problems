Porting Solution to Perl
========================

I ported the Python solution to Perl. In Perl, I needed to use Math::BigInt.

When I completed the port, I kept getting an exception from List::Util's max().
Athenaus from PerlMonks.org helped by pointing out that I initialized @factors
as an anonymous array, which is unnecessary in Perl.

```Perl
@factors = [];
```

This caused the first item in @factors to be an unblessed reference, which
resulted in the exception relating to max().

PHP and Python probably influenced me:

```PHP
<?php
    $factors = array();
?>
```

```Python
factors = []
```
