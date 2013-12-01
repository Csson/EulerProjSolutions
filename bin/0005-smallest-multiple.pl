#!/usr/bin/env perl

use strict;
use warnings;
use v5.18;

use Time::HiRes qw/time tv_interval/;

my $start = [ time ];
main();
say 'Done in ' . sprintf ('%.5f' => tv_interval $start) . ' seconds.';

sub main {
    
    my $limit = $ARGV[0] // 10;
    my $number = 1;
    my %found = ();
    NUMBER:
    while(++$number) {
    	foreach my $div (1 .. $limit) {
    		next NUMBER if $number % $div != 0;
    		if(!exists $found{$div}) {
    			$found{$div} = $number;
    			say "$div: $number";
    		}
    	}
    	last NUMBER;
    }
    say "Lowest number evenly divisible by every number 1..$limit: " . $number;
    
}

=pod

2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

=cut
