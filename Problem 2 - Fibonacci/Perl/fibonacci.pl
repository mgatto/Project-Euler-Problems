use Modern::Perl '2012';
use bigint;
use List::Util qw / reduce /;
use Fibonacci;

chomp(my $x = $ARGV[0]);

my @fibs = Fibonacci::series($x);
say "@fibs";

my @evens = Fibonacci::filter_evens(\@fibs);
say "@evens";

my $sum = reduce {$a + $b} @evens;
say $sum;

#exit;
