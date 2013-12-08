#!/usr/bin/env perl

use strict;
use warnings;
use v5.16;

my $count = $ARGV[0] // 1_000_000;

my @numbers = 0..9;
my $counter = 0;

PERMUTE:
foreach my $n1 (@numbers) {
    my @n1 = @numbers;
    my ($index) = grep { $n1[ $_ ] == $n1 } 0..$#n1;
    splice @n1, $index, 1;

    foreach my $n2 (@n1) {
        my @n2 = @n1;
        my ($index) = grep { $n2[ $_ ] == $n2 } 0..$#n2;
        splice @n2, $index, 1;
        
        foreach my $n3 (@n2) {
            my @n3 = @n2;
            my ($index) = grep { $n3[ $_ ] == $n3 } 0..$#n3;
            splice @n3, $index, 1;
            
            foreach my $n4 (@n3) {
                my @n4 = @n3;
                my ($index) = grep { $n4[ $_ ] == $n4 } 0..$#n4;
                splice @n4, $index, 1;
                
                foreach my $n5 (@n4) {
                    my @n5 = @n4;
                    my ($index) = grep { $n5[ $_ ] == $n5 } 0..$#n5;
                    splice @n5, $index, 1;
                    
                    foreach my $n6 (@n5) {
                        my @n6 = @n5;
                        my ($index) = grep { $n6[ $_ ] == $n6 } 0..$#n6;
                        splice @n6, $index, 1;
                        
                        foreach my $n7 (@n6) {
                            my @n7 = @n6;
                            my ($index) = grep { $n7[ $_ ] == $n7 } 0..$#n7;
                            splice @n7, $index, 1;
                            
                            foreach my $n8 (@n7) {
                                my @n8 = @n7;
                                my ($index) = grep { $n8[ $_ ] == $n8 } 0..$#n8;
                                splice @n8, $index, 1;

                                foreach my $n9 (@n8) {
                                    my @n9 = @n8;
                                    my ($index) = grep { $n9[ $_ ] == $n9 } 0..$#n9;
                                    splice @n9, $index, 1;
                                    
                                    foreach my $n10 (@n9) {
                                        my @n10 = @n9;
                                        my ($index) = grep { $n10[ $_ ] == $n10 } 0..$#n10;
                                        splice @n10, $index, 1;
                                        
                                        ++$counter;
                                        if($counter == $count) {
                                            say "The $count lexicographic permutation of 0123456789 is: " . join '' => ($n1, $n2, $n3, $n4, $n5, $n6, $n7, $n8, $n9, $n10);
                                            last PERMUTE;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }    
            }
        }
    }
}

=pod

Problem 24 - Lexicographic permutations

A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:

012   021   102   120   201   210

What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

=cut