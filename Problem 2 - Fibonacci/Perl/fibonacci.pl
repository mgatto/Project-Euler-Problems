use Modern::Perl;
# use bigint;
require Fibonacci;

chomp(my $x = $ARGV[0]);

say Fibonacci::sequence_members($x);

my @fibs = Fibonacci::fibonacci4($x);
print "@fibs";

exit;
