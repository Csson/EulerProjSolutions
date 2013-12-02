#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use bigint;

my $upto = $ARGV[0] // 20;


my $primes = get_primes();
my $factors = {};
map { $factors->{ $_ } = [] } @{ $primes };
    
foreach my $number (1 .. $upto) {
    my %number_factors = ();
    
    foreach my $factor (get_factors($number, $primes)) {
         $number_factors{ $factor } = 0 if !exists $number_factors{ $factor };
         ++$number_factors{ $factor };
    }
    
    foreach my $factor (keys %number_factors) {
        while(scalar @{ $factors->{ $factor } } < $number_factors{ $factor }) {
            push @{ $factors->{ $factor } } => $factor;
        }
    }
}
    
my @all = ();
my $sum = 1;
foreach my $fact (keys %{ $factors }) {
    push @all => @{ $factors->{ $fact }};
}
map { $sum *= $_ } sort { $a <=> $b } @all;
say "The smallest number divisible by every number from 1 to $upto = $sum";

sub get_factors {
    my $number = shift;
    my $primes = shift;
    my @factors = ();

    NUMBER:
    while($number > 1) {

        foreach my $prime (@{ $primes }) {
                
            if($number % $prime == 0) {
                $number /= $prime;
                push @factors => $prime;

                last NUMBER if $number == 1;
                redo NUMBER;
            }
        }

    }

    return @factors;
}

sub get_primes {
    my $primes = [2];
    
    #say "Getting primes <= $upto";
    
    NUMBER:
    foreach my $number (3 .. $upto) {
        
        PRIME:
        foreach my $prime (@{ $primes }) {
            next NUMBER if $number % $prime == 0;
        }
        push @{ $primes } => $number;
    }
    return $primes;
}


=pod

Problem 5 - Smallest multiple

2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?


Solution

On my system this solution solves for 
--upto=20    in < 0.01 seconds
--upto=500   in 0.6 seconds
--upto=5000  in 24 seconds
--upto=20000 in 270 seconds (it's a number 8676 digits long with 2328 factors) 

=cut
