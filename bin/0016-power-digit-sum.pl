#!/usr/bin/env perl

use strict;
use warnings;
use v5.16;
use bigint;

my $power = $ARGV[0] // 1000;
my $sum = 0;
my $twotopower = 2**$power;
map { $sum += $_ } split // => $twotopower;
say "2 to the power of $power is : $twotopower";
say "The sum of the numbers of 2**$power is $sum";


=pod

Problem 16 - Power digit sum

2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?


=cut