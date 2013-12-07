#!/usr/bin/env perl

use strict;
use warnings;
no warnings 'recursion';
use v5.16;

my $arg_limit = $ARGV[0] // 1_000_000;
my $limit = $arg_limit - 1;

my $collatzes = {};
my $global_collatzes = {};
my $depth = 0;
my $maxdepth = 0;
my $max = { number => 0, sequence => [0] };
my $lowest_global = { number => 0, scalar => 0 };

foreach my $start (0 .. 9) {
	partition($start);
}

sub partition {
	my $partition = shift;
	
	$collatzes = $global_collatzes;
	my $start = $partition * int($arg_limit / 10);
	$start = 1 if $start == 0;
	
	my $end = $start + int($arg_limit / 10) - 1;
	say "$start -> $end";
	say scalar keys %{ $global_collatzes };
	foreach my $number ($start .. $end) {
		if($number % ($arg_limit / 100) == 0) {
	        say ' ' x 30 . $number;
	        say ' ' x 40 . $maxdepth;
	    }
	    my $sequence = collatz($number, []);
	    $collatzes->{ $number } = $sequence;
	    if(scalar @{ $sequence } > scalar @{ $max->{'sequence'} }) {
	        $max = { number => $number,
	                 sequence => $sequence,
	               };
	    }
	    if(scalar @{ $sequence } > $lowest_global->{'scalar'}) {
	    	$global_collatzes->{ $number } = $sequence;
	    	if(scalar keys %{ $global_collatzes } > 10) {
	    		my $lownumber = (sort { scalar $global_collatzes->{ $a } <=> scalar $global_collatzes->{ $a } } keys %{ $global_collatzes })[0];
	    		delete $global_collatzes->{ $lownumber };
	    	}
	    	
	    }
	}
	
}
=pod
foreach my $number (500000 .. $limit) {
	if($number % ($arg_limit / 100) == 0) {
        say ' ' x 30 . $number;
        say ' ' x 40 . $maxdepth;
	}
    my $sequence = collatz($number, []);
    $collatzes->{ $number } = $sequence;
    if(scalar @{ $sequence } > scalar @{ $max->{'sequence'} }) {
    	$max = { number => $number,
    		     sequence => $sequence,
    	       };
    }
    
}
=cut
say 'done';
#my $longest_number = (sort { scalar @{ $collatzes->{ $b } } <=> scalar @{ $collatzes->{ $a } } } keys %{ $collatzes })[0];

say sprintf "The number with longest Collatz sequence (%d) starting under %d is %d:" => scalar @{ $max->{'sequence'}},
                                                                                        $limit + 1,
                                                                                        $max->{'number'};;
say join ', ' => @{ $max->{'sequence' }};
say "maximum depth reached was $maxdepth";

sub collatz {
    my $number = shift;
    my $sequence = shift;
    
    ++$depth;
    #say "$number causes depth: $depth";
    $maxdepth = $depth if $depth > $maxdepth;
    
    
    
    if($number == 1) {
    	--$depth;
        return $sequence;
    }
    elsif(exists $collatzes->{ $number }) {
    	--$depth;
        push @{ $sequence } => @{ $collatzes->{ $number }};
        return $sequence;
    }
    elsif($number % 2 == 0) {
    	
        my $next = $number / 2;
        push @{ $sequence } => $next;
        collatz($next, $sequence);
    }
    else {
        my $next = $number * 3 + 1;
        push @{ $sequence } => $next;
        collatz($next, $sequence);
    }
    --$depth;
    return $sequence;
}

=pod

Problem 14 - Longest Collatz sequence

The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:
13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.


=cut