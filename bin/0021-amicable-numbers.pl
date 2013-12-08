#!/usr/bin/env perl

use strict;
use warnings;
use v5.16;

use Euler;

my $limit = $ARGV[0] // 10000;

my %amicables = ();

NUMBER:
foreach my $number (1 .. $limit - 1) {
    my $sum = 0;
    my $divisors = Euler::get_divisors($number);

    map { $sum += $_ } @{ Euler::get_divisors($number) };
    next NUMBER if $sum == $number;

    my $sum2 = 0;
    map { $sum2 += $_ } @{ Euler::get_divisors($sum) };

    next NUMBER if $number != $sum2;

    $amicables{ $number } = 1;
    $amicables{ $sum2 } = 1;
}
my $sum = 0;
map { $sum += $_ } keys %amicables;

say "All amicable numbers below $limit: " . join ', ' => sort { $a <=> $b } keys %amicables;
say "The sum of all amicable numbers under $limit is $sum";

=pod

Problem 21 - Amicable numbers

Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.

=cut