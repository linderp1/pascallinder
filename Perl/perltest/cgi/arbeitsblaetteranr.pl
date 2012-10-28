#!/usr/local/bin/perl -w
#-------------------------------------
#
# Copyright 2000 F. Hoffmann - La Roche
#
# Author:       Antonino Buccheri, POBB
#               
#
# Function:     This script select the Int. Nr.
#				for a given Int. Arbeitblatt Nr and
#				returns the Analysen Nr.
#
# Call:         Called from the WebPage
#				see http://bali.roche.com
#
# Parameter:    anr
#
# Revision 1.0  22. September 2000
#               Initial revision
#
# Revision 1.1	14-Aug-2001
# Author		A.Buccheri
# Change		Added the Abllist field as Output in the HTML page
#-------------------------------------


# Call of the used Perl-Modules
use CGI;
use DBI;



# Database parameters
$dbname="arlp1bap.bas.roche.com";
$user="wwwread";
$passwd="wwwread";

$query = new CGI;
$prdnr = $query->param('anr');
$wild = $prdnr . "%";

# Start of HTML page (HEAD)
print $query->header;
print "<BODY BGCOLOR=#FFFFFF>";



# SQL query for db (arlp1bap.bas.roche.com)
if ($prdnr) {

	$sqlquery="	select LIMSNR, INTERNALNR, USERID, PRINTDATE, ABLLIST from arbeitsblaetterlog where LIMSNR like upper (\'$wild\') ";

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

print "<img src=\"http://newton.kau.roche.com/perltest/images/anrarbeitbltnrsuche.gif\" width=\"420\" height=\"54\" alt=\"Analysen Nr.\">";
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

					print "<th width=\"15%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Analysen Nr.</font></strong> </th>";

    				print "<th width=\"15%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Interne Nr.</font></strong> </th>";

					print "<th width=\"15%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">UserID</font></strong> </th>";

					print "<th width=\"15%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Print Date</font></strong> </th>";
					
					print "<th width=\"15%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Arbeitsblätter</font></strong> </th>";

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

	print "<font face=\"Arial\" size=\"2\">", "Gesuchte Analysen Nr.:  ", $prdnr , "</font> <BR>";

} else {

	print "<p><font face=\"Arial\" size=\"2\">", "int. Nr. nicht gefunden.\n"; 

}

print "<p><font face=\"Arial\" size=\"2\">", "Anzahl gefunden: ", $count, "</font></p><BR>";


# End of HTML page
print $query->end_html;

# End of PERL Script
exit(0);



       

