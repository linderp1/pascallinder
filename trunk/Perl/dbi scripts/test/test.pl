#!/bin/perl
use DBI;                  # use DBI module

$dbh = DBI->connect("dbi:Oracle:ARLP1ACT", 'chemlms/chemlms');

# Prepare query
$sel = $dbh->prepare("select * from gwdestconfvw");
$sel->execute || die "Selection problem : $DBI::errstr";

print "Query result: ";

while (($devicename, $parameter) = $sel->fetchrow_array) {
# For each line received from query
    print "Device $devicename is called $parameter on UNIX\n";
}
$sel->finish;              # close
$dbh->disconnect;          # disconnect from DB
