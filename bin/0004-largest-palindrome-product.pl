#!/usr/bin/env perl

use strict;
use warnings;
use v5.18;

use Time::HiRes qw/time tv_interval/;

my $start = [ time ];
main();
say 'Done in ' . sprintf ('%.5f' => tv_interval $start) . ' seconds.';

sub main {
    my $highest = { sum => 0, i => 0, j => 0 };
    
    PALINDROME:
    foreach my $i (reverse 100 .. 999) {
        last PALINDROME if $i * $i < $highest->{'sum'};
        foreach my $j (reverse 100 .. $i) {
            my $sum = $i * $j;
            if($sum eq reverse ($sum) && $sum > $highest->{'sum'}) {
                $highest = { i => $i, j => $j, sum => $sum };
                next PALINDROME;
            }
        }
    }

    say "$highest->{'i'} * $highest->{'j'} = $highest->{'sum'}";
}


=pod

Problem 4 - Largest palindrome product

A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 * 99.

Find the largest palindrome made from the product of two 3-digit numbers.

=cut