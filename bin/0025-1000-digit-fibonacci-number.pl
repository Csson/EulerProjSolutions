#!/usr/bin/env perl

use strict;
use warnings;
no warnings 'recursion';
use v5.16;
use bigint;

my $digitcount = $ARGV[0] // 1000;

my $fibos = fibo([1, 1]);
my $fibo = scalar @{ $fibos };

say "The term of the first Fibonacci number with $digitcount digits is $fibo";

sub fibo {
    my $fibos = shift;

    my $next_fibo = $fibos->[-1] + $fibos->[-2];
    push @{ $fibos } => $next_fibo;
    return $fibos if length $next_fibo >= $digitcount;
    fibo($fibos);
}


=pod

Problem 25 - 1000-digit Fibonacci number

The Fibonacci sequence is defined by the recurrence relation:

    Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.

Hence the first 12 terms will be:

    F1 = 1
    F2 = 1
    F3 = 2
    F4 = 3
    F5 = 5
    F6 = 8
    F7 = 13
    F8 = 21
    F9 = 34
    F10 = 55
    F11 = 89
    F12 = 144

The 12th term, F12, is the first term to contain three digits.

What is the first term in the Fibonacci sequence to contain 1000 digits?

=cut