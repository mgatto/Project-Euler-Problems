#!/usr/bin/env perl
use Modern::Perl '2012';
use List::Util qw(max);

sub generate_largest_palindrome {
    my($min_limit, $max_limit) = @_;
    my @candidates;

    for (my $j = $max_limit; $j >= $min_limit; $j--) {
        for (my $k = $max_limit; $k >= $min_limit; $k--) {
            my $candidate = $j * $k;

            if ( "$candidate" eq reverse "$candidate" ) {
                push @candidates, $candidate;
                #say "Largest is the product of $j and $k: " . $candidate;
            }
        }
    }

    return max @candidates;
}

say generate_largest_palindrome(100, 999);
say generate_largest_palindrome({
    -min => 100,
    -max => 999,
});

=begin Explanation

=end
=cut
