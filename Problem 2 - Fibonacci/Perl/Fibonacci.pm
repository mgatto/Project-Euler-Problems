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

sub nth_term {
    my $n = shift;
    return $n if $n < 2;
    return fibonacci($n-1) + fibonacci($n-2);
}

{ my @fib;
  sub nth_term_mimoized {
    my $n = shift;
    return $fib[$n] if defined $fib[$n];
    return $fib[$n] = $n if $n < 2;
    $fib[$n] = fib($n-1) + fib($n-2);
  }
}

sub fibonacci2 {
    my $n = shift;
    my $f;

    return undef if $n < 0;

    if ($n == 0) {
        $f = 0;
    } elsif ($n == 1) {
        $f = 1;
    } else {
        $f = fibonacci2($n - 1) + fibonacci2($n - 2);
    }

    return $f;
}

sub fibonacci3 {
    my ($n) = @_;
    ($n < 2) ? $n : fibonacci3($n - 2) + fibonacci3($n - 1);
}

# iterative
sub fibonacci4 {
    my ($n, $a, $b) = (shift, 0, 1);
    ($a, $b) = ($b, $a + $b) while $n-- > 0;
    $a;
}
=end GHOSTCODE
=cut

1;
