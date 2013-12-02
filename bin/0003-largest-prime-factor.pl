#!/usr/bin/env perl

use strict;
use warnings;
use v5.18;

use Getopt::Long;

my $arg_factorof = 600_851_475_143;
my $arg_maxprime = 10000;

GetOptions('--factor-of=i' => \$arg_factorof,
           '--max-prime=i' => \$arg_maxprime) or die ('Getoptions: ' . $!);


my $primes = get_primes();
my @factors = sort { $b <=> $a } get_factors($primes);
my $sum = 1;
map { $sum *= $_ } @factors;
say sprintf "Largest of the %d prime factors (%s) of %d: %d" => scalar @factors,
                                                                join (', ' => @factors), 
                                                                $arg_factorof,
                                                                $factors[0];



sub get_factors {
    my $primes = shift;
    my $number = $arg_factorof;
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
        if($number > $primes->[-1]) {
        	die "No prime large enough. Increase --max-prime=$arg_maxprime";
        }
    }
    return @factors;
}

sub get_primes {
    my $primes = [2];

    NUMBER:
    foreach my $number (3 .. $arg_maxprime) {
        
        PRIME:
        foreach my $prime (@{ $primes }) {
            next NUMBER if $number % $prime == 0;
        }
        push @{ $primes } => $number;
    }
    return $primes;
}

=pod

Problem 3.

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143?

=cut





