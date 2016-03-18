#!/usr/bin/perl
use strict;
use warnings;

my $line = "";
my $fileContent = "";

foreach $line ( <STDIN> ) {
	#chomp( $line );
	$fileContent = $fileContent . $line;
}
$fileContent =~ s/(^-[-])\[\[(.|[\r\n])*?\]\]//g;

$fileContent =~ s/([-][-])(.*)//g;

# $fileContent =~ s/\r\n/ /g;
# $fileContent =~ s/\n/ /g;
$fileContent =~ s/[ \t]{2,}/ /g;

print "$fileContent";

