#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

my $upto = $ARGV[0] // 100;

my $sum_of_squares = 0;
my $square_of_sum = 0;
map { $sum_of_squares += $_**2; $square_of_sum += $_ } (1 .. $upto);
    
say sprintf "The difference between the sum of squares and square of sum for numbers <= %d is %d" => $upto, ($square_of_sum**2 - $sum_of_squares); 


=pod

Problem 6 - Sum square difference

The sum of the squares of the first ten natural numbers is: 1^2 + 2^2 + ... + 10^2 = 385

The square of the sum of the first ten natural numbers is: (1 + 2 + ... + 10)^2 = 55^2 = 3025

Hensce the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 - 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.


Solution

Solves for

100      in 0.0003 second
10000    in 0.01 second
1000000  in 0.5 second
10000000 in <5 seconds
=cut
