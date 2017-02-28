#!/usr/bin/perl

use strict;
use warnings;

=encoding UTF8
=head1 SYNOPSYS

Поиск количества вхождений строки в подстроку.

=head1 run ($str, $substr)

Функция поиска количества вхождений строки $substr в строку $str.
Пачатает количество вхождений в виде "$count\n"
Если вхождений нет - печатает "0\n".

Примеры: 

run("aaaa", "aa") - печатает "2\n".

run("aaaa", "a") - печатает "4\n"

run("abcab", "ab") - печатает "2\n"

run("ab", "c") - печатает "0\n"

=cut

sub run {
    my ($str, $substr) = @_;
    my $num = 0;

    my $currentIndex = 0;
    while ($currentIndex != -1) {
    	$currentIndex = index($str, $substr, $currentIndex);
    	if($currentIndex != -1) {
    		$num++;
    		$currentIndex += length($substr);
    	}
    }

    print "$num\n";
}

1;
