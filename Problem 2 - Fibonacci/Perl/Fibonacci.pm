package Fibonacci;

# return the fibonacci series until a limit of iterations
#@TODO need to make limit a number
sub series {
    my $limit = shift;
    my @fibs;

    my ($a, $b) = (0, 1);
    for (my $i = 0; $i <= $limit; $i++)
    {
        push @fibs, $a if  $a < 4_000_000;
        ($a, $b) = ($b, $a + $b);
    }

    #my ($n, $a, $b) = (shift, 0, 1);
    #($a, $b) = ($b, $a + $b) while $n-- > 0;
    #$a;

    # Implicit return in Perl, since it returns the last evaluated statement
    # if there is no 'return' keyword.
    @fibs;
}


#determine if series members are even
sub filter_evens {
    my @fibs = @{$_[0]};

    my $index = 0;
    while ($index <= $#fibs ) {
        my $value = $fibs[$index];

        if ( 1 == $value % 2) {
            splice @fibs, $index, 1;
        } else {
            $index++;
        }
    }

    # in this way, some values were skipped over during the iteration; it seems to be a bug, or at least referred to that way.
    #foreach (@fibs) {
    #    $r = $_ % 2;
    #    print 'divide ' . $_ . ' by 2 = ' . $r . "\r\n";

    #    if ($_ % 2 == 1) {
            #just throw it away...
    #        splice(@fibs, $_, 1);
    #    }
    #}

    # implicit return
    @fibs;
}


=begin GHOSTCODE

# this is recursive and should not be used!
sub fibonacci_by_recursion {
  # nth Fib number = a*x^n + (1-a)*y^n

    my $n = shift;
    return $n if $n < 2;
}

=end GHOSTCODE
=cut

1;
