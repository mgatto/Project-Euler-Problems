#! /usr/bin/env perl

use Modern::Perl '2012';
use utf8;

my ($sum3, $sum5, $sum15);

$sum3 = sum_arithmetic(3, 1000);
$sum5 = sum_arithmetic(5, 1000);
$sum15 = sum_arithmetic(15, 1000);

say $sum3 + $sum5 - $sum15;

=head2

Sum terms with an arithmetical series algorithm.

=cut
sub sum_arithmetic {
    my ($multiple, $limit) = @_;
    
    # find max term for each multiple
    my $max_term = int(($limit - 1) / $multiple);
                
    # sum arithmetically
    return ($multiple * ($max_term * ($max_term + 1))) / 2;
}

