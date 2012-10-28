#!/usr/local/bin/perl -w
#-------------------------------------
#
# Copyright 2000 F. Hoffmann - La Roche
#
# Author:       Antonino Buccheri, POBB
#               Klaus Zinsmeister, POBB
#
# Function:     This script select all SampleType Configuration
#		for a given Sampletypename and returns the Sampletype
#		Configuration
#
# Call:         Called from the WebPage
#		see http://bali.roche.com
#
# Parameter:    Sampletype
#
# Revision 1.0  18-May-2000
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
$prdnr = $query->param('itemnr');


print $query->header;
print "<BODY BGCOLOR=#FFFFFF>";

# SQL query
if ($prdnr) {
	$sqlquery="	select 	SAMPLETYPE,
	   					EVENTNAME,
	   					TRIGGERSTATUS,
	   					DESCRIPTION,
						decode (TRIGGERSTATUS, 'LoggedIn', 0, 'Requested', 1, 'Released', 2, 'Scheduled', 3, 'Result exits', 4, 'Completed', 5,
			  									'ValidatedLevel0', 6, 'ValidatedLevel1', 7, 'ValidatedLevel2',
			  									8, 'ValidatedLevel3', 9, 'ValidatedLevel4', 10, 'ValidatedLevel5',
			  									11, 'ValidatedLevel6', 12, 'Validated', 16, 'Approved',
			  									17, 'Archived', 18, 'Reopen', 19, 'Canceled', 20) STATUS
	   					from GWSAMPLECONFEVENTSVW
	   					where SAMPLETYPE = \'$prdnr\'
						ORDER BY STATUS";

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

print "<img src=\"http://newton.kau.roche.com/perltest/images/sampletypeconf.gif\" width=\"528\" height=\"54\" alt=\"Sampletype\">";
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
					print "<th width=\"0\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Sampletype</font></strong> </th>";
    				print "<th width=\"0\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Event Name</font></strong> </th>";
					print "<th width=\"0\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Status</font></strong> </th>";
    				print "<th width=\"0\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Event Description</font></strong> </th>";
					print "</tr>";
    			}
    		print "<tr>";
			if (@$temp[0]) { print "<td align=\"left\"><font face=\"Arial\" size=\"1\">", @$temp[0], "</font></td>";}
			else { print "<td align=\"left\"><font face=\"Arial\" size=\"1\">", "leerer Datensatz", "</font></td>";}
			
			if (@$temp[1]) { print "<td align=\"left\"><font face=\"Arial\" size=\"1\">", @$temp[1], "</font></td>";}
			else { print "<td align=\"left\"><font face=\"Arial\" size=\"1\">", "leerer Datensatz", "</font></td>";}
			
			if (@$temp[2]) { print "<td align=\"left\"><font face=\"Arial\" size=\"1\">", @$temp[2], "</font></td>";}
			else { print "<td align=\"left\"><font face=\"Arial\" size=\"1\">", "leerer Datensatz", "</font></td>";}
	
			if (@$temp[3]) { print "<td align=\"left\"><font face=\"Arial\" size=\"1\">", @$temp[3], "</font></td>";}
			else { print "<td align=\"left\"><font face=\"Arial\" size=\"1\">", "leerer Datensatz", "</font></td>";}	
			
			
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

	print "<font face=\"Arial\" size=\"2\">", "Gesuchter Sampletype:  ", $prdnr , "</font> <BR>";

print $query->end_html;

exit(0);

       
