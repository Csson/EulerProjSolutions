#!/usr/bin/env perl

use strict;
use warnings;
use v5.18;

use Time::HiRes qw/time tv_interval/;

my $start = [ time ];

my $pyth = $ARGV[0] // 1000;

main();
say 'Done in ' . sprintf ('%.5f' => tv_interval $start) . ' seconds.';

sub main {
    
    PYTH:
    foreach my $d (1 .. $pyth - 1) {
        foreach my $e (1 .. $pyth - 1) {
            my $f = $pyth - $d - $e;
            next if $d**2 + $e**2 != $f**2;
            next if $d + $e + $f != $pyth;
            say "The product is " . ($d * $e * $f) . " ($d**2 + $e**2 = $f**2)";
            last PYTH;
        }
    }
}

=pod

Problem 9 - Special Pythagorean triplet

A Pythagorean triplet is a set of three natural numbers, a < b < c, for which, a² + b² = c²

For example, 3² + 4² = 9 + 16 = 25 = 5²

There exists exactly one Pythagorean triplet for which a + b + c = 1000.

Find the product a * b * c.

=cut