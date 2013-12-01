#!/usr/bin/env perl

use strict;
use warnings;
use v5.18;

use Getopt::Long;
use Time::HiRes qw/time tv_interval/;

my $arg_factorof = 600_851_475_143;
my $arg_maxprime = 10000;

GetOptions('--factor-of=i' => \$arg_factorof,
           '--max-prime=i' => \$arg_maxprime) or die ('Getoptions: ' . $!);

my $start = [ time ];
main();
say 'Done in ' . sprintf ('%.5f' => tv_interval $start) . ' seconds.';

sub main {
    my $primes = get_primes();
    say 'Found ' . scalar @{ $primes } . ' primes';
    say '-' x 15;
    my @factors = get_factors($primes);
    my $sum = 1;
    map { $sum *= $_ } @factors;
    say "Prime factors of $arg_factorof: " . join (' * ' => sort { $b <=> $a } @factors) . " = $sum";
    say 'Number of prime factors: ' . scalar @factors;
}

sub get_factors {
    my $primes = shift;
    my $number = $arg_factorof;
    my @factors = ();
    
    say 'Searching for prime factors.';
    
    NUMBER:
    while($number > 1) {
        say '----';
        say "Number: $number";

        foreach my $prime (@{ $primes }) {
                
            if($number % $prime == 0) {
                $number /= $prime;
                push @factors => $prime;
                say "Factors: " . join ', ' => @factors;
                last NUMBER if $number == 1;
                redo NUMBER;
            }
        }
    }

    say ' = =' x 10;
    return @factors;
}

sub get_primes {
    my $primes = [2];
    
    say "Getting primes <= $arg_maxprime";
    
    NUMBER:
    foreach my $number (3 .. $arg_maxprime) {
        
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

Problem 3.

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143?

=cut





