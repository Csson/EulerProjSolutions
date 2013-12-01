#!/usr/bin/env perl

use strict;
use warnings;
use v5.18;

use Time::HiRes qw/time tv_interval/;

my $start = [ time ];
main();
say 'Done in ' . sprintf ('%.5f' => tv_interval $start) . ' seconds.';

sub main {
	PALINDROME:
    foreach my $i (reverse 100 .. 999) {
    	foreach my $j (reverse 100 .. 999) {
    		my $sum = $i * $j;
    		if($sum eq reverse $sum) {
    			say "$i * $j = $sum";
    			last PALINDROME;
    		}
    	}
    }
}


=pod

Problem 4 - Largest palindrome product

A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 * 99.

Find the largest palindrome made from the product of two 3-digit numbers.

=cut