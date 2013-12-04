#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use Euler;

my $limit = $ARGV[0] // 2000000;

my $sum = 0;

my $primes = sundaram();
map { $sum += $_ } @{ $primes };
say "The sum of all primes < $limit is $sum";


sub sundaram {
    
    my $truelimit = int $limit / 2;
    my %not_primes = ();
    my @primes = (2);

    foreach my $i (1 .. $truelimit - 1) {
        my $denominator = $i * 2 + 1;
        my $maxvalue = int( ($truelimit - $i) / $denominator );
        
        foreach my $j ($i .. $maxvalue) {
            my $key = $i + $j * $denominator;
            $not_primes{ $key } = 1;
        }
        if(!exists $not_primes{ $i }) {
            push @primes => $i * 2 + 1;
        }
    }

    return \@primes; 
}

=pod

Problem 10 - Summation of primes

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17

Find the sum of all the primes below two million.

=cut