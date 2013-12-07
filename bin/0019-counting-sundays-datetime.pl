#!/usr/bin/env perl

use strict;
use warnings;
use v5.16;
use DateTime;

my $date = DateTime->new(year => 1899, month => 12, day => 31);
my $first_sunday_dates = [];

SEARCH:
while(1) {

    if($date->year >= 1901 && $date->year <= 2000 && $date->day_of_month == 1) {
        push @{ $first_sunday_dates } => $date;
        $date->add(days => 28);
    }
    else {
        $date->add(days => 7);
    }
    last SEARCH if $date->year > 2000;
}

say sprintf "The number on Sundays happening on the first of the month during the 20th century is %d." => scalar @{ $first_sunday_dates };


=pod

Problem 19 - Counting sundays

You are given the following information, but you may prefer to do some research for yourself.

    1 Jan 1900 was a Monday.
    Thirty days has September,
    April, June and November.
    All the rest have thirty-one,
    Saving February alone,
    Which has twenty-eight, rain or shine.
    And on leap years, twenty-nine.
    A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

=cut