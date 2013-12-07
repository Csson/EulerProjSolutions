#!/usr/bin/env perl

use strict;
use warnings;
use v5.16;

my $lengths = {
1 => { length => '3', word => 'one' },
2 => { length => '3', word => 'two' },
3 => { length => '5', word => 'three' },
4 => { length => '4', word => 'four' },
5 => { length => '4', word => 'five' },
6 => { length => '3', word => 'six' },
7 => { length => '5', word => 'seven' },
8 => { length => '5', word => 'eight' },
9 => { length => '4', word => 'nine' },
10 => { length => '3', word => 'ten' },
11 => { length => '6', word => 'eleven' },
12 => { length => '6', word => 'twelve' },
13 => { length => '8', word => 'thirteen' },
14 => { length => '8', word => 'fourteen' },
15 => { length => '7', word => 'fifteen' },
16 => { length => '7', word => 'sixteen' },
17 => { length => '9', word => 'seventeen' },
18 => { length => '8', word => 'eighteen' },
19 => { length => '8', word => 'nineteen' },
20 => { length => '6', word => 'twenty' },
30 => { length => '6', word => 'thirty' },
40 => { length => '5', word => 'forty' },
50 => { length => '5', word => 'fifty' },
60 => { length => '5', word => 'sixty' },
70 => { length => '7', word => 'seventy' },
80 => { length => '6', word => 'eighty' },
90 => { length => '6', word => 'ninety' },
100 => { length => '7', word => 'hundred' },
1000 => { length => '11', word => 'onethousand' },
and => { length => '3', word => 'and' },
};

my $length = 0;
my @words = ();

NUMBER:
foreach my $number (1 .. 1000) {
    my @localwords = ();
	if($number == 1000) {
		$length += $lengths->{'1000'}{'length'};
		next NUMBER;
	}
	if($number >= 100) {
		my $hundred = substr $number, 0, 1;
		$number -= ($hundred * 100);
		$length += $lengths->{ $hundred }{'length'} + $lengths->{'100'}{'length'};
		
        next NUMBER if $number % 100 == 0;
	    $length += $lengths->{'and'}{'length'};
	}
	if($number <= 20) {
        $length += $lengths->{ $number }{'length'};
        next NUMBER;
    }
	my $lastdigit = $number % 10;
	my $tens = $number - $lastdigit;
	$length += $lengths->{ $tens }{'length'};

    next NUMBER if $lastdigit == 0;
	$length += $lengths->{ $lastdigit }{'length'};
	
}

say "The number of letters in every number from 1 to 1000 is $length";

=pod

Problem 17 - Number letter counts

If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.


=cut