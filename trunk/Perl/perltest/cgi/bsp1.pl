#!/usr/local/bin/perl
#-------------------------------------
use CGI;
use DBI;

# Database parameters
$dbname="arlp1bap.bas.roche.com";
$user="wwwread";
$passwd="wwwread";

$query = new CGI;
$anlnr = $query->param('anlnr');

print $query->header;
print "<BODY BGCOLOR=#FFFFFF>";

if ($anlnr) {
	$sqlquery="select sampstatus from samplestat where sampname = \'$anlnr\' and currauditflag=\'1\'";
} else {
  	print "Error\n"; 
	print $query->end_html;
	exit(0);
}

$dbh = DBI->connect("dbi:Oracle:$dbname", $user, $passwd);
$sth = $dbh->prepare($sqlquery);
$sth->execute;

if (@row = $sth->fetchrow_array) {
	print "Analysis No. : ", $anlnr, "<BR>";
	print "Status : ", $row[0], "<BR>";
} else {
	print "Analysis not found.\n"; 
}

print $query->end_html;

exit(0);

       
