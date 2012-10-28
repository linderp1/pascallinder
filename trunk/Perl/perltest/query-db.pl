#!/usr/local/bin/perl -w
#
# $Id: query-db.pl,v 1.2 2000/04/20 15:30:10 joe Exp $
#
# Uebung fuer CGI Kurs: Zugriff auf DB

use strict;
use DBI;

#
# Eingaben von der Kommandozeile pruefen
#
sub usage {
    die "usage: $0 <column-name> <value>\n";
}

usage() unless ($#ARGV == 1);

my $column = $ARGV[0];
my $value = $ARGV[1];

#
# ORACLE Umgebung definieren
#
$ENV{'ORACLE_HOME'} = "/dc/oracle";

#
# DB oeffnen und abfragen
#
my ($dbh, $stmt, $rv, @row);

$dbh = DBI->connect("dbi:Oracle:COMPANY", "cgi", "digicomp");
$stmt = $dbh->prepare("select name, vorname, abteilung, rang " .
			 "from EMP where $column like ?");
$rv = $stmt->execute($value);

while (@row = $stmt->fetchrow_array) {
	print "ROW: " . join('|', @row) . "\n";
}

exit(0);
