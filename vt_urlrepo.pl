 #!usr/bin/perl

# Copyright 2012- Christopher M. Frenz
# This script is free software - it may be used, copied, redistributed, and/or modified
# under the terms laid forth in the Perl Artistic License
#
# This script retrieve URL scan reports
# 2016/2 modified by mona4911

use LWP::UserAgent;
use Data::Dumper;
use JSON;
use strict;

my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 1 });
my $scanurl=<STDIN>;

my $key='your api key';


my $url='https://www.virustotal.com/vtapi/v2/url/report';

# Retrieving URL scan reports
my $response = $ua->post( $url,
    [
    'resource' => $scanurl,
    'apikey' => $key,
    ]
  );
die "$url error: ", $response->status_line
   unless $response->is_success;
my $results=$response->content;

my $json = JSON->new->allow_nonref;
my $decjson = $json->decode( $results);
#print "scan_date,url,positives,total,positives detail\n";
print $decjson->{"scan_date"}.",";
print $decjson->{"url"}.",";
print $decjson->{"positives"}.",";
print $decjson->{"total"}.",";

my $count = 0;
while (my ($key, $value) = each(%{$decjson->{"scans"}})){

  if($value->{"detected"} == 1) {
    if($count != 0) {
      print ";"
    }

    print $key.":";
    print $value->{"result"};

    $count++;
  }
}

print "\n";

# if you want to see all json object, please comment out here
#print Dumper($decjson)."\n";

# if you want to see all scans json object, please comment out here
#print Dumper($decjson->{"scans"});