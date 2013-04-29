#!/usr/bin/env perl
use Modern::Perl '2012';
use List::Util qw(max);

# no inputs;
sub generate_largest_palindrome {
    my @candidates;

    for (my $j = 999; $j >= 100; $j--) {
        for (my $k = 999; $k >= 100; $k--) {
            my $candidate = $j * $k;

            if ( "$candidate" eq reverse "$candidate" ) {
                push @candidates, $candidate;
                #say "Largest is the product of $j and $k: " . $candidate;
            }
        }
    }

    return max @candidates;
}

say generate_largest_palindrome();


=begin Explanation

=end
