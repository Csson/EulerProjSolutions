#!/usr/bin/env perl

use strict;
use warnings;
use v5.16;
use bigint;

my $arg_side = $ARGV[0] // 20;
my $counts = {};

map { $counts->{ $_ }{ $arg_side } = 1 } (0 .. $arg_side);
map { $counts->{ $arg_side }{ $_ } = 1 } (0 .. $arg_side);
delete $counts->{ $arg_side }{ $arg_side };

foreach my $row (reverse 0 .. $arg_side - 1) {
    
    foreach my $col (reverse 0 .. $arg_side - 1) {
        $counts->{ $row }{ $col } = $counts->{ $row }{ $col + 1 } + $counts->{ $row + 1 }{ $col }; 
    }
}
say "Number of routes through a grid with a side of $arg_side: $counts->{'0'}{'0'}";


=pod

Problem 15 - Lattice paths

Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20×20 grid?

=cut