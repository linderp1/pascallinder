#!/usr/local/bin/perl -w
#-------------------------------------
use CGI;
use DBI;

# Database parameters
$dbname="arlp1bap.bas.roche.com";
$user="wwwread";
$passwd="wwwread";

$query = new CGI;
$prdnr = $query->param('prdnr');

print $query->header;
print "<BODY BGCOLOR=#FFFFFF>";


if ($prdnr) {
	$sqlquery="select distinct sampletype,productcode from gwloginkeysadmin where productcode = \'$prdnr\'";
} else {
  	print "Error\n"; 
	print $query->end_html;
	exit(0);
}

$dbh = DBI->connect("dbi:Oracle:$dbname", $user, $passwd);
$sth = $dbh->prepare($sqlquery);
$sth->execute;

	print "Existierenden LoginConfigurationen für KIS-Item-Nr. : ", $prdnr, " in folgenden SampleTypes", "<BR>";
while (@row = $sth->fetchrow_array) {
	print  $row[0], "<BR>";
	@toni = @row;
}

print $toni[0] , " " , $toni[1];
print $query->end_html;

$dbh->disconnect;

exit(0);

       
