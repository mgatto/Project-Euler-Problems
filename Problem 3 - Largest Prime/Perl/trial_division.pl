#! /usr/bin/env perl

##
## This solution takes some time, but not too much.
##

use Modern::Perl '2012';
# All operators (including basic math operations) are overloaded by the
# bigint pragma
use bigint lib => 'Calc,GMP';
use Regexp::Common;
use List::Util qw/ max /;
use Carp qw/ confess /;

# Gives us a nice little stack trace
$SIG{__DIE__} = sub {
    confess @_;
};

sub big_factors {
    my $n = shift;
    my $d = 2;
    my @factors;

    # ensure $n is an integer
    if ($n !~ /$RE{num}{real}/) {
        die "Argument was not a real number.";
    }

    while ($n > 1) {
        while ( 0 == $n % $d) {
            push @factors, $d;
            $n /= $d;
        }

        $d += 1;

        if ($d**2 > $n) {
            # test again since $n _could_ be 1 after lineno 29
            if ($n > 1) {
                push @factors, $n;
                last;
            }
        }
    }

    return @factors;
}

my @result = big_factors(600_851_475_143);
say max @result;
