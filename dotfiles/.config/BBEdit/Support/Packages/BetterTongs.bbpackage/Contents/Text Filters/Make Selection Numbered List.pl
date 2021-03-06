#!/usr/bin/perl -w

# ThisService Perl service script example
# Service type: Filter.
# Revision 1.

# from: <http://brettterpstra.com/projects/markdown-service-tools/>

# Perl practices:
#  Enables strict mode, requiring that variables are first declared with 'my'.
#  This, along with specifying '-w' in the magic first line, is widely 
#  considered good Perl practice.
use strict;

# Unicode considerations:
#  '-CIO' in the magic first line enables Perl to consider STDIN to always 
#  contain UTF-8, and to always output to STDOUT in UTF-8.

my $result = "";
my %last_marker = ();	# Store last marker used for each list depth
$last_marker{0} = "";

my $last_leading_space = "";
my $g_tab_width = 4;
my $g_list_level = 0;

my $line;
my $marker;
my $item;
my $leading_space;

while ($line = <>) {
  next if $line =~ /^[\s\t]*$/;
  $line =~ s/^([ \t]*)(\d+\. |[\*\+\-] )?/${1}1. /;
	$line =~ /^([ \t]*)([\*\+\-]|\d+\.)(\.?\s*)(.*)/;
	$leading_space = $1;
	$marker = $2;
	$item = " " . $4;

	$leading_space =~ s/\t/    /g;	# Convert tabs to spaces
	
	if ( $line !~ /^([ \t]*)([\*\+\-]|\d+\.)/) {
		#$result .= "a";
		# not a list line
		$result .= $line;
		$marker = $last_marker{$g_list_level};
	} elsif (length($leading_space) > length($last_leading_space)+3) {
		# New list level
		#$result .= "b";
		$g_list_level++;
		
		$marker =~ s{
			(\d+)
		}{
			# Reset count
			"1";
		}ex;

		$last_leading_space = $leading_space;
		
		$result .= "\t" x $g_list_level;
		$result .= $marker . $item . "\n";
	} elsif (length($leading_space)+3 < length($last_leading_space)) {
		#$result .= "c";
		# back to prior list level
		$g_list_level = length($leading_space) / 4;
		
		# update marker
		$marker = $last_marker{$g_list_level};
		$marker =~ s{
			(\d+)
		}{
			$1+1;
		}ex;
		
		$last_leading_space = $leading_space;

		$result .= "\t" x $g_list_level;
		$result .= $marker . $item . "\n";
	} else {
		# No change in level
		#$result .= "d";

		# update marker if it exists
		if ($last_marker{$g_list_level} ne "") {
			$marker = $last_marker{$g_list_level};
			$marker =~ s{
				(\d+)
			}{
				$1+1;
			}ex;
		}
		
		
		$last_leading_space = $leading_space;

		$result .= "\t" x $g_list_level;
		$result .= $marker . $item . "\n";	
	}

		$last_marker{$g_list_level} = $marker;
}

print $result;