#!/usr/bin/env perl
use Modern::Perl '2012';
use List::Util qw(max);

sub generate_largest_palindrome {
    my %args = @_;
    my @candidates;

    for (my $j = $args{max}; $j >= $args{min}; $j--) {
        for (my $k = $args{max}; $k >= $args{min}; $k--) {
            my $candidate = $j * $k;

            if ( "$candidate" eq reverse "$candidate" ) {
                push @candidates, $candidate;
                #say "Largest is the product of $j and $k: " . $candidate;
            }
        }
    }

    return max @candidates;
}

say generate_largest_palindrome(
    min => 100,
    max => 999,
);

=begin Explanation

=end
=cut
