#!/usr/bin/env perl
use Modern::Perl '2012';
use List::Util qw(max);

sub generate_largest_palindrome {
    my($args_ref) = @_;
    my $min = $args_ref->{'min'};
    my $max = $args_ref->{'max'};

    my @candidates;

    for (my $j = $max; $j >= $min; $j--) {
        for (my $k = $max; $k >= $min; $k--) {
            my $candidate = $j * $k;

            if ( "$candidate" eq reverse "$candidate" ) {
                push @candidates, $candidate;
                #say "Largest is the product of $j and $k: " . $candidate;
            }
        }
    }

    return max @candidates;
}

say generate_largest_palindrome({
    min => 100,
    max => 999,
});

=begin Explanation

=end
=cut
