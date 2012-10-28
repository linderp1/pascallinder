#!/usr/local/bin/perl -w
#-----------------------------------------------------------------
#
# Copyright 2000 F. Hoffmann - La Roche
#
# Author:       Antonino Buccheri, POBB
#               Klaus Zinsmeister, POBB
#
# Function:     This script select the record
#		for a given Analyse No and returns the rows
#		from the BALI_Samplehistory to view the status
#
# Call:         Called from the WebPage
#		see http://bali.roche.com
#
# Parameter:    Analysen Nr.
#
# Revision 1.0  15-May-2000
#               Initial revision
#
# Revision 1.1  16-May-2000
#				Inc. 2 Query for Responsible analyst buc/zi
#-----------------------------------------------------------------

use CGI;
use DBI;



# Database parameters

$dbname="arlp1bap.bas.roche.com";
$user="wwwread";
$passwd="wwwread";


$query = new CGI;
$prdnr = $query->param('anr');





print $query->header;

print "<BODY BGCOLOR=#FFFFFF>";



# SQL query 1

if ($prdnr) {
	$sqlquery1=" select SAMPLENAME,
						STATUS,
						TO_CHAR(CHANGE,'DD-MM-YYYY HH24:MI:SS') CHANGE,
						NAME
						from BALI_SAMPLEHISTORYVW
						where SAMPLENAME = \'$prdnr\'
						order by AUIX";
						
} else {
  	print "Error ! No parameter found !\n"; 
	print $query->end_html;
	exit(0);
}

$dbh = DBI->connect("dbi:Oracle:$dbname", $user, $passwd);
$sth = $dbh->prepare($sqlquery1);
$sth->execute;

if ($tbl_ary_ref = $sth->fetchall_arrayref) {
	print "\n";
} else {
	print "Produkt nicht gefunden.\n"; 
}

$count = $sth->rows;

# SQL query 2

if ($prdnr) {
	$sqlquery2=" select RESPONSIBLEANALYST
						from BALI_ATTRIB_RESPANALYSTVW
						where SAMPLENAME = \'$prdnr\'";
} else {
  	print "Error ! No parameter found !\n"; 
	print $query->end_html;
	exit(0);
}

$dbh = DBI->connect("dbi:Oracle:$dbname", $user, $passwd);
$sth = $dbh->prepare($sqlquery2);
$sth->execute;

@row = $sth->fetchrow_array;

print "<img src=\"http://newton.kau.roche.com/perltest/images/samplehistory.gif\" width=\"364\" height=\"54\" alt=\"Sampletype\">";
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
					print "<th width=\"15%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Analysen Nr.</font></strong> </th>";
    				print "<th width=\"15%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Status</font></strong> </th>";
					print "<th width=\"15%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Datum / Zeit</font></strong> </th>";
    				print "<th width=\"15%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">BALI User</font></strong> </th>";
					print "</tr>";
    			}
    			print "<tr>";
    			print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[0], "</font></td>";
    			print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[1], "</font></td>";
    			print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[2], "</font></td>";
				print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[3], "</font></td>";
              	$i++;
              	print "</tr>"
        }
    	print "</table>";
		print "<hr>";
		print "<p></p>";
		
		if ($row[0]) 	{
						print "<p align=\"right\"><font face=\"Arial\" size=\"2\">", "Responsible Analyst:  ", $row[0] , "</font><BR>";
							}
						
					else	{
							print "<p align=\"right\"><font face=\"Arial\" size=\"2\">", "Responsible Analyst:  ", "leerer Datensatz" , "</font><BR>";
							}
							
		print "<p></p>";

    	}

else {

	print "<p><font face=\"Arial\" size=\"2\" color=\"#FF0000\"> <blink> ", "Keine Datensätze gefunden !", "</font> </blink> </p>";

}


if ($tbl_ary_ref = $sth->fetchall_arrayref) {
	print "<font face=\"Arial\" size=\"2\">", "Gesuchte Analyse:  ", $prdnr , "</font><BR>";
} else {
	print "<p><font face=\"Arial\" size=\"2\">", "Analyse nicht gefunden.\n"; 
}

print $query->end_html;

exit(0);



       

