#!/usr/bin/perl

use strict;
use warnings;

=encoding UTF8
=head1 SYNOPSYS

Вычисление корней квадратного уравнения a*x**2+b*x+c=0.

=head1 run ($a_value, $b_value, $c_value)

Функция вычисления корней квадратного уравнения.
Принимает на вход  коэфиценты квадратного уравнения $a_value, $b_value, $c_value.
Вычисляет корни в переменные $x1 и $x2.
Печатает результат вычисления в виде строки "$x1, $x2\n".
Если уравнение не имеет решания должно быть напечатано "No solution!\n"

Примеры: 

run(1, 0, 0) - печатает "0, 0\n"

run(1, 1, 0) - печатает "0, -1\n"

run(1, 1, 1) - печатает "No solution!\n"

=cut

sub run {
    my ($a, $b, $c) = @_;

    my $d = $b * $b - 4 * $a * $c;

    if($d >= 0 && $a != 0) {
	    my $x1 = (-$b + sqrt($d)) / (2 * $a);
	    my $x2 = (-$b - sqrt($d)) / (2 * $a);

	    print "$x1, $x2\n";
    } else {
    	print "No solution!\n";
    }

}

1;
