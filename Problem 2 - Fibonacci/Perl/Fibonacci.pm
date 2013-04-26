package Fibonacci;

require Exporter;
@ISA = qw(Exporter);
#@EXPORT = qw(fibonacci sequence_members fibonacci2 fibonacci3 fibonacci4);

sub series {
    my $limit = shift;

    my ($a, $b) = (0, 1);
    for (my $i = 0; $i <= $limit; $i++)
    {
        print "$a\n";
        ($a, $b) = ($b, $a + $b);
    }
}

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

1;
