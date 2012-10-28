#!/usr/local/bin/perl -w
#-------------------------------------
#
# Copyright 2000 F. Hoffmann - La Roche
#
# Author:       Antonino Buccheri, POBB
#               Klaus Zinsmeister, POBB
#
# Function:     This script select the record
#		for a given Item No and returns the rows
#		from the BALI: KIS-Item table
#
# Call:         Called from the WebPage
#		see http://bali.roche.com
#
# Parameter:    itemnr
#
# Revision 1.0  15-May-2000
# Author		A.Buccheri              
# Change		Initial revision
#
# Revision 1.1	13-Aug-2001
# Author		A.Buccheri
# Change		Added the Timestampfield as Output in the HTML page
#-------------------------------------

# Call of the used Perl-Modules
use CGI;
use DBI;

# Database parameters
$dbname="arlp1bap.bas.roche.com";
$user="wwwread";
$passwd="wwwread";

$query = new CGI;
$prdnr = $query->param('itemnr');

# Start of HTML page (HEAD)
print $query->header;
print "<BODY BGCOLOR=#FFFFFF>";

# SQL query for db (arlp1bap.bas.roche.com)
if ($prdnr) {
	$sqlquery=" select 
  				ITEMNO,
  				DEFAULT_SMP_TYPE,             
  				ITEMDESCR_ENGLISH,           
  				ITEMDESCR_LOCALLANG,         
  				LOTQUANTITY_UNITOFMEASURE, 
  				DISPOSALCODE, 
  				MUST_TEMPERATURE, 
  				GENISYS_NO,
				TO_CHAR(AUDITTIMESTAMP,'DD-MM-YYYY HH24:MI:SS') AUDITTIMESTAMP  
				from ITEM  
  				where ITEMNO = \'$prdnr\'";

} else {

  	print "Error ! No parameter found !\n"; 
	print $query->end_html;
	exit(0);
}

# Execution of the SQL query
$dbh = DBI->connect("dbi:Oracle:$dbname", $user, $passwd);
$sth = $dbh->prepare($sqlquery);
$sth->execute;

# Fetching the return values of db
if ($tbl_ary_ref = $sth->fetchall_arrayref) {
	print "\n";
} else {
	print "Produkt nicht gefunden.\n"; 
}

$count = $sth->rows;

print "<img src=\"http://newton.kau.roche.com/perltest/images/kisitemtabellensuche.gif\" width=\"396\" height=\"54\" alt=\"Sampletype\">";
print "<hr>";

# Generating the HTML page (BODY) automatically, with the fetched data

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
					print "<th width=\"33%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Produkt Nr.</font></strong> </th>";
					if (@$temp[0])  {
									print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[0], "</font></td>";
									}
								else	{
										print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", "leerer Datensatz" , "</font></td>";
										}
					print "</tr>";				

					print "<tr>";
    				print "<th width=\"33%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Sampletyp</font></strong> </th>";
					if (@$temp[1])  {
									print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[1], "</font></td>";
									}
								else 	{
										print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", "leerer Datensatz" , "</font></td>";
										}
					print "</tr>";	


					print "<tr>";
					print "<th width=\"33%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Produkt Name (D)</font></strong> </th>";
					if (@$temp[2])  {
									print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[2], "</font></td>";
									}
								else 	{
										print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", "leerer Datensatz" , "</font></td>";
										}
					print "</tr>";					

					
					print "<tr>";
					print "<th width=\"33%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Produkt Name (E)</font></strong> </th>";
    				if (@$temp[3])  {
									print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[3], "</font></td>";
									}
								else 	{
										print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", "leerer Datensatz" , "</font></td>";
										}
					print "</tr>";

					
					print "<tr>";
					print "<th width=\"33%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Einheit</font></strong> </th>";
    				if (@$temp[4])  {
									print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[4], "</font></td>";
									}
								else	{ 
										print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", "leerer Datensatz" , "</font></td>";
										}
					print "</tr>";

					
					print "<tr>";
					print "<th width=\"33%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Entsorgungscode</font></strong> </th>";
					if (@$temp[5]) 	{
									print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[5], "</font></td>";
									}
								else 	{ 
										print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", "leerer Datensatz" , "</font></td>";
										}
					print "</tr>";
					

					print "<tr>";
					print "<th width=\"33%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Lagertemperatur</font></strong> </th>";
					if (@$temp[6])	{
									print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[6], "</font></td>";
									}
								else 	{ 
									print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", "leerer Datensatz" , "</font></td>";
										}
					print "</tr>";
				

					print "<tr>";
					print "<th width=\"33%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Genisys Nr.</font></strong> </th>";
					if (@$temp[7]) 	{
    								print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[7], "</font></td>";
									}
								else	{ 
									print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", "leerer Datensatz" , "</font></td>";
										}
					print "</tr>";
					
					print "<tr>";
					print "<th width=\"33%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Datum</font></strong> </th>";
					if (@$temp[8]) 	{
    								print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[8], "</font></td>";
									}
								else	{ 
									print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", "leerer Datensatz" , "</font></td>";
										}
					print "</tr>";

    			}

    		print "<tr>";

              	$i++;
              	print "</tr>"

        }

    	print "</table>";
		print "<hr>";
		print "<p></p>";
		print "<p></p>";
    	}
		
# Message if no db values are found
else {
	print "<p><font face=\"Arial\" size=\"2\" color=\"#FF0000\"> <blink> ", "Keine Datensätze gefunden !", "</font> </blink> </p>";
}

# Message of searched parameter, they are included in the HTML page for user information
if ($tbl_ary_ref = $sth->fetchall_arrayref) {
	print "<font face=\"Arial\" size=\"2\">", "Gesuchtes Produkt:  ", $prdnr , "</font><BR>";
} else {
	print "<p><font face=\"Arial\" size=\"2\">", "Produkt nicht gefunden.\n"; 
}
print "<p><font face=\"Arial\" size=\"2\">", "Anzahl gefunden: ", $count, "</font></p><BR>";

# End of HTML page
print $query->end_html;

# End of PERL Script
exit(0);



       

