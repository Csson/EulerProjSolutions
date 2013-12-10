#!/usr/bin/env perl

use strict;
use warnings;
use v5.16;

my $divisors_for = get_divisors_for_all(2, 1000, 300);

my $increase = 0;
my $number = 0;

my $highest = { number => 0, divisors => 0 };

TRIANGLE:
while(++$increase) {
    $number += $increase;
    
    my $try = 0;
    DIVISOR:
    foreach my $divisor (keys %{ $divisors_for }) {
        if($number % $divisor == 0) {
            ++$try;
        }
    }
    next TRIANGLE if $try < 70;
    
    my $trydiv = 0;
    my $divcount = 0;
    
    TRYDIV:
    while(++$trydiv && $trydiv <= $number) {
        next TRYDIV if $number % $trydiv != 0;
        ++$divcount;
    }
    if($divcount > $highest->{'divisors'}) {
        $highest->{'divisors'} = $divcount;
        $highest->{'number'} = $number;
    }

    last TRIANGLE if $divcount > 500;
}

say "The first triangle number with over 500 divisors is $number";

sub get_divisors_for_all {
    my $low = shift;
    my $high = shift;
    my $top = shift;
    
    my $divisors_for = {};
    
    foreach my $number ($low .. $high) {
        
        foreach my $div ($low .. $high) {
            my $is_divider = $number % $div == 0;
            
            if($is_divider) {
                if(!exists $divisors_for->{ $number }) {
                    $divisors_for->{ $number } = [];
                }
                push @{ $divisors_for->{ $number } } => $div;
            }
        }
    }
    my $count = 0;
    my $important_divisors = {};
    map { $important_divisors->{ $_ } = $divisors_for->{ $_ } } (sort { scalar @{ $divisors_for->{ $b } } <=> scalar @{ $divisors_for->{ $a } } } keys %{ $divisors_for })[0..$top - 1 ];
    
    return $important_divisors;
}


=pod

Problem 12 - Highly divisible triangular number

The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number 
would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

Let us list the factors of the first seven triangle numbers:

     1: 1
     3: 1,3
     6: 1,2,3,6
    10: 1,2,5,10
    15: 1,3,5,15
    21: 1,3,7,21
    28: 1,2,4,7,14,28

We can see that 28 is the first triangle number to have over five divisors.

What is the value of the first triangle number to have over five hundred divisors?

=cut