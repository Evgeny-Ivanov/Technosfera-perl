package SecretSanta;

use 5.010;
use strict;
use warnings;
use DDP;
use Data::Dumper;

sub isNotGiving {#этот человек не дарил тебе 
	my ($you, $giving, @res) = @_;
	for my $v (@res) {
		if($v->[0] eq $giving && $v->[1] eq $you) {
			return 0;
		}
	}

	return 1;
}

sub isNotHost {#тебе еще не дарили
	my ($host, @res) = @_;
	for my $v (@res) {
		if($v->[1] eq $host) {
			return 0;
		}
	}

	return 1;
}



sub cal {
	my ($counter, @members) = @_;
	my @res;

		while(my ($i, $v) = each @members) {			
			my $tryPickPair = sub {
				my $v = shift;
				my @candidatesForGift = @members;
				splice @candidatesForGift, $i, 1;#никто не дарит подарок сам себе и супругу

				while ($#candidatesForGift + 1) {
					#незнал что последний аргумент не включается
					my $hostIndex = int(rand ($#candidatesForGift + 1) );
					my $host = $candidatesForGift[$hostIndex];

					if(ref $host eq '' && 
						isNotGiving($v, $host, @res) && 
						isNotHost($host, @res)) {
						push @res, [$v, $host];
						return 1;
					} elsif(ref $host eq 'ARRAY') {
						foreach my $hostv (@$host){
							if(isNotGiving($v, $hostv, @res) && 
								isNotHost($hostv, @res)) {
								push @res, [$v, $hostv];
								return 1;
							}
						}
					}

					splice @candidatesForGift, $hostIndex, 1;
				}
				return 0;
			}; 

			my $flag = 0;

			if(ref $v eq '') {
				$flag = $tryPickPair->($v);
			}	

			if(ref $v eq 'ARRAY') {
				$flag = $tryPickPair->($v->[0]) && $tryPickPair->($v->[1]);
			}

			return cal($counter - 1, @members) if !$flag && $counter > 0;
			return () if $counter <= 0;
		}

	return @res;
}


sub calculate {
	my @members = @_;
	my $counter = 20;
	return cal($counter, @members);
}

1;
