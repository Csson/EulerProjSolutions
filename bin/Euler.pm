package Euler {
	use feature 'say';
	sub factorial {
		my $factorial = shift;
		my $fact = 1;
		map { $fact *= $_} (1 .. $factorial);
		return $fact;
	}
	
	sub get_factors {
	    my $number = shift;
	    my $primes = shift;
	    my @factors = ();

	    NUMBER:
	    while($number > 1) {

	        foreach my $prime (@{ $primes }) {
	            if($number % $prime == 0) {
	                $number /= $prime;
	                push @factors => $prime;
	
	                last NUMBER if $number == 1;
	                redo NUMBER;
	            }
	        }
	
	    }
	
	    return \@factors;
	}
	
	sub get_primes {
		my $limit = shift;
	    my $primes = [2];
	
	    NUMBER:
	    foreach my $number (3 .. $limit) {
	        
	        PRIME:
	        foreach my $prime (@{ $primes }) {
	            next NUMBER if $number % $prime == 0;
	        }
	        push @{ $primes } => $number;
	    }
	    return $primes;
	}
	
	sub get_divisors {
		my $number = shift;
		my @divisors = ();
		foreach my $div (1 .. $number - 1) {
			push @divisors => $div if $number % $div == 0;
		}
		return \@divisors;
	} 
}


1;
