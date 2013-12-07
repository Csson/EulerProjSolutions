#!/usr/bin/env perl

use strict;
use warnings;
use v5.16;
use bigint;

my $factorial = $ARGV[0] // 100;

my $fact = 1;
my $sum = 0;
map { $fact *= $_} (1 .. $factorial);
map { $sum += $_ } split // => $fact;

say "The factorial $factorial is $fact";
say "The sum of the digits in the number $factorial! is $sum";

=pod

Problem 20 - Factorial digit sum

n! means n × (n − 1) × ... × 3 × 2 × 1

For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!

=cut