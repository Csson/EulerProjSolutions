#!/usr/bin/env perl

use strict;
use warnings;
use v5.18;

use Time::HiRes qw/time tv_interval/;

my $start = [ time ];

my $limit = $ARGV[0] // 2000000;

main();
say 'Done in ' . sprintf ('%.5f' => tv_interval $start) . ' seconds.';

sub main {
    my $sum = 0;
    map { $sum += $_ } @{ get_primes() };
    say "The sum of all primes < $limit is $sum";
}

sub get_primes {
    my $primes = [2];
    
    say "Getting primes <= $limit";
    
    NUMBER:
    foreach my $number (3 .. $limit - 1) {
        next NUMBER if $number % 2 == 0;
        PRIME:
        foreach my $prime (@{ $primes }) {
            next NUMBER if $number % $prime == 0;
        }
        push @{ $primes } => $number;
        say $number . ': ' . scalar @{ $primes } if scalar @{ $primes } % 100 == 0;
    }
    return $primes;
}

=pod

Problem 10 - Summation of primes

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17

Find the sum of all the primes below two million.


Solution

Very slow. 1700+ seconds for 2000000.

=cut