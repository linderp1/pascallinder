#!/usr/local/bin/perl -w
#-------------------------------------
#
# Copyright 2001 F. Hoffmann - La Roche
#
# Author:       Antonino Buccheri, POBB
#               #
# Function:     This script select all Arbeitsbl&auml;tter
#		for all existing Arbeitsbl&auml;tter,
#
# Call:         Called from the WebPage
#		see http://bali.roche.com
#
# Parameter:    scaid
#
# Revision 1.0  26-April-2001
#               Initial revision
#
#
#
#-------------------------------------
use CGI;
use DBI;

# Database parameters
$dbname="psca.bas.roche.com";
$user="sca_bg";
$passwd="sca_bg";

$query = new CGI;
$scaroles = $query->param('scaid');

print $query->header;
print "<BODY BGCOLOR=#FFFFFF>";

# SQL query
if ($scaroles) {
	$sqlquery="	select	t.name, t.orcl_usr_id, db.GRANTED_ROLE, tg.BEZEICHNUNG_KURZ, t.GUELTIG_BIS
				from	t_sca_benutzer t, t_sca_benutzer_gruppe tg, sys.DBA_ROLE_PRIVS db
				where db.GRANTED_ROLE = \'$scaroles\'
				and t.orcl_usr_id <> 'SCA'
				and t.orcl_usr_id <> 'SCA_SUPER_USER'
				and t.orcl_usr_id <> 'SCA_USER'
				and t.BENGR_ID = tg.BENGR_ID
				and t.orcl_usr_id = db.GRANTEE
				order by 2";
				
} else {

  	print "Fehler ! Es wurde kein Parameter eingeben !\n"; 
	print $query->end_html;
	exit(0);
}

$dbh = DBI->connect("dbi:Oracle:$dbname", $user, $passwd);
$sth = $dbh->prepare($sqlquery);
$sth->execute;

if ($tbl_ary_ref = $sth->fetchall_arrayref) {
	print "\n";
} else {
	print "User nicht gefunden.\n"; 
}



$count = $sth->rows;

print "<img src=\"http://newton.kau.roche.com/perltest/images/scausersuche.gif\" width=\"396\" height=\"54\" alt=\"SCA User Profile\">";
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
					print "<th width=\"25%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Name Vorname</font></strong> </th>";
    				print "<th width=\"15%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">UserID</font></strong> </th>";
					print "<th width=\"20%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">SCA Rolle</font></strong> </th>";
					print "<th width=\"20%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">SCA Gruppe</font></strong> </th>";
					print "<th width=\"20%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">gültig bis</font></strong> </th>";
			
					print "</tr>";
    			}
    		print "<tr>";
			
			if (@$temp[0]) { print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[0], "</font></td>";}
			else { print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", "leerer Datensatz", "</font></td>";}
			
			if (@$temp[1]) { print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[1], "</font></td>";}
			else { print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", "leerer Datensatz", "</font></td>";}
			
			if (@$temp[2]) { print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[2], "</font></td>";}
			else { print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", "keine Rolle gespeichert", "</font></td>";}
			
			if (@$temp[3]) { print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[3], "</font></td>";}
			else { print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", "keine Gruppe gespeichert", "</font></td>";}
	
			if (@$temp[4]) { print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[4], "</font></td>";}
			else { print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", "kein Datum vorhanden", "</font></td>";}

				
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


if ($scaroles) {

	print "<font face=\"Arial\" size=\"2\">", "Gesuchte Rolle:  ", $scaroles , "</font> <BR>";
	
} else {

	print "<p><font face=\"Arial\" size=\"2\">", "Kein User gefunden.\n"; 
	
}

print "<p><font face=\"Arial\" size=\"2\">", "Anzahl gefundene User: ", $count, "</font></p><BR>";

print $query->end_html;

exit(0);

       
