# EulerProjSolutions

Solutions for projecteuler.net.

## Problem 1

Status: Solved

### Timings

    $ time ./0001-multiples3and5.pl 1000
    Multiples of all multiples of 3 or 5 less than 1000: ***

    real    0m0.009s
    user    0m0.004s
    sys     0m0.000s


    $ time ./0001-multiples3and5.pl 100000
    Multiples of all multiples of 3 or 5 less than 100000: 2333316668

    real    0m0.049s
    user    0m0.036s
    sys     0m0.000s


    $ time ./0001-multiples3and5.pl 10000000
    Multiples of all multiples of 3 or 5 less than 10000000: 23333331666668

    real    0m3.601s
    user    0m2.684s
    sys     0m0.304s

## Problem 2

Status: Solved

### Timings

    $ time ./0002-even-fibonacci-numbers.pl
    Sum of the 11 even-valued fibonaccis < 4000000: ***

    real    0m0.007s
    user    0m0.000s
    sys     0m0.004s


    $ time ./0002-even-fibonacci-numbers.pl 100000000
    Sum of the 13 even-valued fibonaccis < 100000000: 82790070

    real    0m0.009s
    user    0m0.004s
    sys     0m0.000s


    $ time ./0002-even-fibonacci-numbers.pl 100000000000000000000
    Sum of the 32 even-valued fibonaccis < 100000000000000000000: 67650926172353373024

    real    0m0.094s
    user    0m0.040s
    sys     0m0.012s

## Problem 3

Status: Solved, but could have better prime calculations.

### Timings

    $ time ./0003-largest-prime-factor.pl 
    Largest of the *** prime factors (***) of 600851475143: ***

    real    0m0.149s
    user    0m0.096s
    sys     0m0.012s

## Problem 4

Status: Solved

### Timings

    $ time ./0004-largest-palindrome-product.pl 
    ??? * ??? = ***

    real    0m0.025s
    user    0m0.016s
    sys     0m0.004s


## Problem 5

Status: Solved, but primes...

### Timings

    $ time ./0005-smallest-multiple.pl 
    The smallest number divisible by every number from 1 to 20 = ***

    real    0m0.097s
    user    0m0.028s
    sys     0m0.028s


    $ time ./0005-smallest-multiple.pl 1000
    The smallest number divisible by every number from 1 to 1000 = 71288652746650930 [ ... 400 digits ... ] 7950931603520000

    real    0m1.946s
    user    0m1.580s
    sys     0m0.028s


    time ./0005-smallest-multiple.pl 20000
    The smallest number divisible by every number from 1 to 20000 = 487932562728827051 [ ... 8600 digits ... ] 547411295098112000000

    real    4m2.742s
    user    3m24.856s
    sys     0m1.408s



## Problem 6

Status: Solved

### Timings

    $ time ./0006-sum-square-difference.pl
    The difference between the sum of squares and square of sum for numbers <= 100 is ***

    real    0m0.008s
    user    0m0.000s
    sys     0m0.004s

    $ time ./0006-sum-square-difference.pl 10000
    The difference between the sum of squares and square of sum for numbers <= 10000 is 2500166641665000

    real    0m0.931s
    user    0m0.728s
    sys     0m0.024s

    $ time ./0006-sum-square-difference.pl 50000
    The difference between the sum of squares and square of sum for numbers <= 50000 is 1562520832708325000

    real    0m4.386s
    user    0m3.596s
    sys     0m0.056s



## Problem 7

Status: Solved, but slow (and primes)

### Timings

    $ time ./0007-nth-prime.pl 
    The 10001 prime number is ***

    real    0m6.335s
    user    0m5.268s
    sys     0m0.064s


    $ time ./0007-nth-prime.pl 20000
    The 20000 prime number is 224737

    real    0m25.730s
    user    0m21.632s
    sys     0m0.172s


## Problem 8

Status: Solved

### Timings

    $ time ./0008-largest-product-in-a-series.pl 
    Highest product of five consecutive numbers = ***

    real    0m0.009s
    user    0m0.004s
    sys     0m0.000s


## Problem 9

Status: Solved

### Timings

    $ time ./0009-special-pythagorean-triplet.pl 
    The product is *** (???**2 + ???**2 = ???**2)

    real    0m0.129s
    user    0m0.076s
    sys     0m0.004s


## Problem 10

Status: Solved

### Timings

    $ time ./0010-summation-of-primes.pl 2000000
    The sum of all primes < 2000000 is ***

    real    0m6.912s
    user    0m5.392s
    sys     0m0.176s

    $ time ./0010-summation-of-primes.pl 10000000
    The sum of all primes < 10000000 is 3203324994356

    real    0m45.376s
    user    0m35.628s
    sys     0m0.900s



## Problem 11

Status: Solved

### Timings

    $ time ./0011-largest-product-in-a-grid.pl 
    Largest product of four: ***

    real    0m0.010s
    user    0m0.000s
    sys     0m0.008s



## Problem 12

Status: Unsolved

### Timings


## Problem 13

Status: Solved

### Timings

    $ time ./0013-large-sum.pl 
    The full sum is ***
    The first ten digits is ***

    real    0m0.070s
    user    0m0.036s
    sys     0m0.008s


## Problem 14

Status: Correct answer, but slow.

### Timings

    $ time ./0014-longest-collatz-sequence.pl
    The number with longest Collatz sequence (524) starting under 1000000 is ***:
    maximum depth reached was 525

    real    3m26.452s
    user    2m59.712s
    sys     0m1.528s


## Problem 15

Status: Solved

### Timings

    (without bigint)
    $ time ./0015-lattice-paths.pl 
    Number of routes through a grid with a side of 20: ***

    real    0m0.007s
    user    0m0.004s
    sys     0m0.000s

    (with bigint)
    $ time ./0015-lattice-paths.pl 100
    Number of routes through a grid with a side of 100: 90548514656103281165404177077484163874504589675413336841320

    real    0m1.166s
    user    0m1.008s
    sys     0m0.028s

    $ time ./0015-lattice-paths.pl 500
    Number of routes through a grid with a side of 500: 270288240945436569515614693625975275496152008446548287007392875106625428705522193898612483924502370165362606085021546104802209750050679917549894219699518475423665484263751733356162464079737887344364574161119497604571044985756287880514600994219426752366915856603136862602484428109296905863799821216320

    real    0m29.819s
    user    0m26.148s
    sys     0m0.492s


## Problem 16

Status: Status

### Timings

    $ time ./0016-power-digit-sum.pl 
    2 to the power of 1000 is : ???
    The sum of the numbers of 2**1000 is ***

    real    0m0.090s
    user    0m0.048s
    sys     0m0.008s

    $ time ./0016-power-digit-sum.pl 50000
    2 to the power of 50000 is : 316069943685631 [ ... 15000 digits ... ] 131085235835109376
    The sum of the numbers of 2**50000 is 67585

    real    0m1.049s
    user    0m0.900s
    sys     0m0.020s

## Problem 

Status: 

### Timings


## Problem 

Status: 

### Timings


## Problem 

Status: 

### Timings


## Problem 

Status: 

### Timings


## Problem 

Status: 

### Timings


## Problem 

Status: 

### Timings


## Problem 

Status: 

### Timings


## Problem 

Status: 

### Timings


## Problem 

Status: 

### Timings


## Problem 

Status: 

### Timings


## Problem 

Status: 

### Timings


## Problem 

Status: 

### Timings


## Problem 

Status: 

### Timings


## Problem 

Status: 

### Timings


## Problem 

Status: 

### Timings


## Problem 

Status: 

### Timings


## Problem 

Status: 

### Timings















