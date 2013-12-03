#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

my $nth_prime = $ARGV[0] // 10001;

my @primes = (2);
    
my $number = 2;
    
NUMBER:
while(++$number) {
        
    PRIME:
    foreach my $prime (@primes) {
        next NUMBER if $number % $prime == 0;
    }
    push @primes => $number;
    last NUMBER if scalar @primes == $nth_prime;
}
say "The $nth_prime prime number is $number";


=pod

Problem 7 - 10001st prime

By listing the first six prime numbers: 2, 3, 5, 7, 11 and 13, we can see that the 6th prime is 13.

What is the 10001st prime number?


=cut
