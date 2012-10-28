#!/usr/local/bin/perl -w
#-------------------------------------
#
# Copyright 2000 F. Hoffmann - La Roche
#
# Author:       Antonino Buccheri, POBB
#               #
# Function:     This script select all Arbeitsbl&auml;tter
#		for all existing Arbeitsbl&auml;tter,
#
# Call:         Called from the WebPage
#		see http://bali.roche.com
#
# Parameter:    arbblid
#
# Revision 1.0  19-Dec-2000
#               Initial revision
#
#
#
#-------------------------------------
use CGI;
use DBI;

# Database parameters
$dbname="arlp1bap.bas.roche.com";
$user="wwwread";
$passwd="wwwread";

$query = new CGI;
$prdnr = $query->param('arbblid');
$wild = "%" . $prdnr . "%";


print $query->header;
print $prdnr
print "<BODY BGCOLOR=#FFFFFF>";

# SQL query
if ($prdnr) {
	$sqlquery="	select	*
				from	arbeitsblaetter
				where upper (ablname) like upper (\'$wild\')";

} else {

  	print "Error ! No parameter found !\n"; 
	print $query->end_html;
	exit(0);
}

$dbh = DBI->connect("dbi:Oracle:$dbname", $user, $passwd);
$sth = $dbh->prepare($sqlquery);
$sth->execute;

if ($tbl_ary_ref = $sth->fetchall_arrayref) {
	print "\n";
} else {
	print "Arbeitsblatt nicht gefunden.\n"; 
}



$count = $sth->rows;

print "<img src=\"http://newton.kau.roche.com/perltest/images/arbeitsblaetter.gif\" width=\"342\" height=\"54\" alt=\"Arbeitsblatt\">";
print "<hr>";


# output if rows found
if ($count > 0)
	{
	print "<table border=\"0\" width=\"100%\">";
    	$i = 0;
    	while($i < $count)
    	{
       		$temp = @$tbl_ary_ref[$i];
    		if ($i == 0)
    			{ 
    				print "<tr>"; 
					print "<th width=\"20%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Arbeitsbl&auml;tter Nr.</font></strong> </th>";
    				print "<th width=\"65%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Arbeitsbl&auml;ttername</font></strong> </th>";
					print "</tr>";
    			}
    		print "<tr>";
			if (@$temp[0]) { print "<td align=\"left\"><font face=\"Arial\" size=\"2\"><a href=\"http://baliprod.bas.roche.com/BALI_ARBEITSBLAETTER/", @$temp[0] , ".doc\">", @$temp[0], "</font></a></td>";}
			else { print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", "leerer Datensatz", "</font></td>";}
			
			if (@$temp[1]) { print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[1], "</font></td>";}
			else { print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", "leerer Datensatz", "</font></td>";}
				
              	$i++;
              	print "</tr>"
        }
    	print "</table>";
		print "<hr>";
		print "<p></p>";
		print "<p></p>";
    	}
else {
	print "<p><font face=\"Arial\" size=\"2\" color=\"#FF0000\"> <blink> ", "Keine Datensätze gefunden !", "</font> </blink> </p>";
}


if ($wild) {

	print "<font face=\"Arial\" size=\"2\">", "Gesuchtes Produkt:  ", $prdnr , "</font> <BR>";
	
} else {

	print "<p><font face=\"Arial\" size=\"2\">", "Keine Arbeitsbl&auml;tter gefunden.\n"; 
	
}

print "<p><font face=\"Arial\" size=\"2\">", "Anzahl gefunden Arbeitsbl&auml;tter: ", $count, "</font></p><BR>";

print $query->end_html;

exit(0);

       
