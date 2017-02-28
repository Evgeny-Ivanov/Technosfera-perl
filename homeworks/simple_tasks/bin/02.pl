#!/usr/bin/perl

use strict;
use warnings;

=encoding UTF8
=head1 SYNOPSYS

Вычисление простых чисел

=head1 run ($x, $y)

Функция вычисления простых чисел в диапазоне [$x, $y].
Пачатает все положительные простые числа в формате "$value\n"
Если простых чисел в указанном диапазоне нет - ничего не печатает.

Примеры: 

run(0, 1) - ничего не печатает.

run(1, 4) - печатает "2\n" и "3\n"

=cut

sub run {
    my ($x, $y) = @_;
    if($x < 2) {
    	$x = 2;
    }

    for (my $i = $x; $i <= $y; $i++) {
    	my $flag = 1;
    	for(my $j = 2; $j <= sqrt($i); $j++) {
    		if($i % $j == 0) {
    			$flag = 0;
    		}
    	}

    	if($flag) {
    		print "$i\n";
    	}
    }
}

1;
