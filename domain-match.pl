#!/usr/bin/perl
# Author: Denis A.V.Jr. - davieira AT gmail DOT com
$|=1;
$dom=$ARGV[0];
$DOM_TLDs="./tlds-alpha-by-domain.txt";
if (!defined($dom)) { uso(); }

if (! -e $DOM_TLDs) {
    print scalar localtime, " Acquiring domain tlds from iana... ";
    use LWP::Simple;

    $url="http://data.iana.org/TLD/tlds-alpha-by-domain.txt";
    $content = get $url;
    die "Could not acquire the TLD list ($url)" unless defined $content;
    open (OUT_TLDs, ">$DOM_TLDs");
    print OUT_TLDs $content;
    close(OUT_TLDs);
    print "done.\n";
}

print scalar localtime, " Loading...";
open (TLDs, "tlds-alpha-by-domain.txt") || die "no TLDs file found.\n";
while (<TLDs>) {
     chomp;
     $TLD{$_}=1;
}
print scalar keys(%TLD), " TLDs.\n";

foreach $t (keys %TLD) {
      if ($dom=~/(.+)$t(.*)/i) {
         print "Match: http\:\/\/$1\.$t\/$2\n";
      } else { next; }
}

sub uso() {
    print "Use: $0 <domain>|<word>\n";
    exit 1;
}
