#!/usr/bin/env perl

use strict;
use warnings;
use v5.16;

my $position = 0;
my $total_score = 0;
my $letters = join ('' => 'A' .. 'Z');

map { $total_score += name_score($_) * ++$position } get_names();

say "The total score of all names in the file is $total_score"; 

sub name_score {
    my $score = 0;
    map { $score += 1 + index $letters, $_ } split // => shift;
    return $score;
}

sub get_names {
    open my $fh, '<', '../files/0022-names.txt' or die "Can't open name file: $!";
    my $contents = do { local $/, <$fh> };
    close $fh or die $!;
    
    $contents =~ s{"}{}g;
    return sort split /,/ => $contents;
}


=pod

Problem 22 - Names scores

Using names.txt, a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

What is the total of all the name scores in the file?

=cut