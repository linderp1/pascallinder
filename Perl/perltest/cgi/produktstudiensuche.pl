#!/usr/local/bin/perl -w
#-------------------------------------
#
# Copyright 2000 F. Hoffmann - La Roche
#
# Author:       Antonino Buccheri, POBB
#               Klaus Zinsmeister, POBB
#
# Function:     This script select all Study
#		for a given Item No and returns the rows from
#		Pullsheetvw (Studybap)
#
# Call:         Called from the WebPage
#		see http://bali.roche.com
#
# Parameter:    itemnr
#
# Revision 1.0  17-May-2000
#               Initial revision
#
#
#
#-------------------------------------
use CGI;
use DBI;

# Database parameters
$dbname="studybap.bas.roche.com";
$user="chemstab";
$passwd="chemstab";

$query = new CGI;
$prdnr = $query->param('itemnr');
$wild = "%" . $prdnr . "%";


print $query->header;
print "<BODY BGCOLOR=#FFFFFF>";

# SQL query
if ($prdnr) {
	$sqlquery="	select * from	CS_BALI_PRODUCT_STUDY
								where	PRODUCTNAME like \'$wild\'";
								
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
	print "Produkt nicht gefunden.\n"; 
}



$count = $sth->rows;

print "<img src=\"http://newton.kau.roche.com/perltest/images/produktstudiensuche.gif\" width=\"384\" height=\"54\" alt=\"Sampletype\">";
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
					print "<th width=\"10%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Studien Nr.</font></strong> </th>";
    				print "<th width=\"10%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Produkt Nr.</font></strong> </th>";
					print "<th width=\"20%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Produktname</font></strong> </th>";
					print "<th width=\"10%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Batch Nr.</font></strong> </th>";
					print "<th width=\"15%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Verpackungs Nr.</font></strong> </th>";
					print "<th width=\"10%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Startdate</font></strong> </th>";
					print "<th width=\"10%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Status</font></strong> </th>";
					print "</tr>";
    			}
    		print "<tr>";
			if (@$temp[0]) { print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[0], "</font></td>";}
			else { print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", "leerer Datensatz", "</font></td>";}
			
			if (@$temp[1]) { print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[1], "</font></td>";}
			else { print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", "leerer Datensatz", "</font></td>";}
			
			if (@$temp[2]) { print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[2], "</font></td>";}
			else { print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", "leerer Datensatz", "</font></td>";}
			
			if (@$temp[3]) { print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[3], "</font></td>";}
			else { print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", "leerer Datensatz", "</font></td>";}
			
			if (@$temp[4]) { print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[4], "</font></td>";}
			else { print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", "leerer Datensatz", "</font></td>";}
			
			if (@$temp[5]) { print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[5], "</font></td>";}
			else { print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", "leerer Datensatz", "</font></td>";}

			if (@$temp[6]) { print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[6], "</font></td>";}
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


#if ($tbl_ary_ref = $sth->fetchall_arrayref) {
	print "<font face=\"Arial\" size=\"2\">", "Gesuchtes Produkt:  ", $prdnr , "</font> <BR>";
#} else {
	#print "<p><font face=\"Arial\" size=\"2\">", "Produkt nicht gefunden.\n"; 
#}
print "<p><font face=\"Arial\" size=\"2\">", "Anzahl gefunden: ", $count, "</font></p><BR>";

print $query->end_html;

exit(0);

       
