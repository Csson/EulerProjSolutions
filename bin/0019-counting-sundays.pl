#!/usr/bin/env perl

use strict;
use warnings;
use v5.16;

use Getopt::Long;

my $known_sunday = { year       => 1899,
                     month      => 12,
                     dayofmonth => 31,
                   };
my $date = $known_sunday;
my $first_sunday_dates = [];
my $days_since_sunday = 0;

my $search_from_year = $known_sunday->{'year'};

SEARCH:
while(1) {
    $date = next_date($date);
    last SEARCH if $date->{'year'} > 2000;
    ++$days_since_sunday;

    if($days_since_sunday == 7) {
        $days_since_sunday = 0;
        
        if($date->{'year'} >= 1901 && $date->{'year'} <= 2000 && $date->{'dayofmonth'} == 1) {
            push @{ $first_sunday_dates } => $date;
        }
    }

}

say sprintf "The number on Sundays happening on the first of the month during the 20th century is %d." => scalar @{ $first_sunday_dates };

sub next_date {
    my $date = shift;
    
    return $date->{'month'} == 12 && $date->{'dayofmonth'} == days_in_month($date->{'year'}, $date->{'month'}) ?   { year => $date->{'year'} + 1, month => 1,                    dayofmonth => 1 }
         : $date->{'dayofmonth'} == days_in_month($date->{'year'}, $date->{'month'})                           ?   { year => $date->{'year'},     month => $date->{'month'} + 1, dayofmonth => $date->{'dayofmonth'} = 1 }
         :                                                                                                         { year => $date->{'year'},     month => $date->{'month'}    , dayofmonth => $date->{'dayofmonth'} + 1 }
         ;
    
}

sub days_in_month {
    my $year = shift;
    my $month = shift;

    #        1      2   3   4   5   6   7   8   9  10  11  12
    return (31, undef, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)[ $month - 1 ] if $month != 2;
    return $year % 400 == 0 || ($year % 4 == 0 && $year % 100 != 0) ? 29 : 28;
    
}

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