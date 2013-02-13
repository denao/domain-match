domain-match
============

Very simple, yet fun script. 
It will match a string against the official TLD list from iana.org and shows the matches.

Tries to acquire the official TLD list from iana.org usign LWP::Simple.

Example: 

denao:$ perl domainmatch.pl
Use: domainmatch.pl <domain>|<word>

denao:$ perl domainmatch.pl denis
Wed Feb 13 18:56:35 2013 Acquiring domain tlds from iana... done.
Wed Feb 13 18:56:36 2013 Loading...317 TLDs.
Match: http://de.NI/s
Match: http://den.IS/

Drop me a line for comments or suggestions! 
