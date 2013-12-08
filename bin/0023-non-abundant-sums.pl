#!/usr/bin/env perl

use strict;
use warnings;
use v5.16;

use Euler;

my $limit = $ARGV[0] // 28123;

my @abundants = ();

foreach my $number (1 .. $limit) {
    push @abundants => $number if is_abundant($number);
}

my %sum_of_abundants = ();

FIRST:
foreach my $first (@abundants) {
    foreach my $second (@abundants) {
        next FIRST if $first + $second > $limit;
        $sum_of_abundants{ $first + $second } = 1; 
    }
}

my %not_sum_of_abundants = ();
map { $not_sum_of_abundants{ $_ } = 1 } grep { !exists $sum_of_abundants{ $_ } } (1..$limit);

my $sum = 0;
map { $sum += $_ } keys %not_sum_of_abundants;
say "The sum of all integers that are not the sum of two abundant numbers is $sum";

sub is_abundant {
    my $number = shift;
    my $divisors = Euler::get_divisors($number);
    
    my $sum = 0;
    map { $sum += $_ } @{ $divisors };
    return $sum > $number;
}

=pod

Problem 23 - Non-abundant sums

A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

=cut