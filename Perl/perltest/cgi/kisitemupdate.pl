#!/usr/local/bin/perl -w
#-----------------------------------------------------------------
#
# Copyright 2000 F. Hoffmann - La Roche
#
# Author:       Antonino Buccheri, POBB
#               Klaus Zinsmeister, POBB
#
# Function:     This script make an record update
#				for a given Item No and returns the rows
#				from the T_Item table
#
# Call:         Called from the WebPage
#				see http://bali.roche.com
#
# Parameter:    Item Nr.
#
# Revision 1.0  05.07.2001
#               Initial revision
#-----------------------------------------------------------------

use CGI;
use DBI;


# Database parameters

$query = new CGI;
$dbname="arlp1bap.bas.roche.com";
$user = $query->param('userid');
$passwd = $query->param('password');
$zeit = localtime ;
$prdnr = $query->param('item');
$disp = $query->param('DISPCODE');
$temperature = $query->param('TEMPERATUR');

print $query->header;

print "<BODY BGCOLOR=#FFFFFF>";

# SQL query 1 forming

if ($prdnr) {
	$sqlquery1=" update external.t_item set disposalcode = \'$disp\', must_temperature = \'$temperature\' where itemno = \'$prdnr\'";
						
} else {
  	print "Error ! No parameter found !\n"; 
	print $query->end_html;
	exit(0);
}


# SQL query 2 forming

if ($prdnr) {
	$sqlquery2=" select ITEMNO,
						ITEMDESCR_ENGLISH,
						DISPOSALCODE,
						MUST_TEMPERATURE
						from EXTERNAL.T_ITEM
						where ITEMNO = \'$prdnr\'";
						
} else {
  	print "Error ! No parameter found !\n"; 
	print $query->end_html;
	exit(0);
}

# SQL query 1 executing

$dbh = DBI->connect("dbi:Oracle:$dbname", $user, $passwd)
	or die "Couldn't connect to database: " . print "Couldn't connect to database: Invalid UserID or Password";

$sth = $dbh->prepare($sqlquery1)
	or die "Couldn't prepare statement: " . print "You don't have the right for updating the record !!! ";
	
$sth->execute
	or die "Couldn't execute statement: " . print "Couldn't execute statement:";

# SQL query 2 executing

$dbh = DBI->connect("dbi:Oracle:$dbname", $user, $passwd)
	or die "Couldn't connect to database: " . print "Couldn't connect to database: Invalid UserID or Password";

$sth = $dbh->prepare($sqlquery2)
	or die "Couldn't prepare statement: " . print "You don't have the right for updating the record !!! ";
	
$sth->execute
	or die "Couldn't execute statement: " . print "Couldn't execute statement:";

	
	
if ($tbl_ary_ref = $sth->fetchall_arrayref) {
	print "\n";
} else {
	print "Produkt nicht gefunden.\n"; 
}

$count = $sth->rows;

@row = $sth->fetchrow_array;


# Initialising the HTML table

print "<th width=\"15%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"5\" color=\"#666699\">BALI Item Tabellenpflege</font></strong> </th>";

print "<p>&nbsp;</p>";



# output if rows found

if ($count > 0)
	{
	print "<table border=\"0\" width=\"100%\">";
    	$i = 0;
    	while($i < $count)
   	{
       		$temp = @$tbl_ary_ref[$i];
   		if ($i == 0)
						{ }
    		
             	$i++;
              	print "</tr>"
        }
    	print "</table>";
	}
		
else {

	print "<p><font face=\"Arial\" size=\"2\" color=\"#FF0000\"> <blink> ", "Keine Datensätze gefunden !", "</font> </blink> </p>";

}

if ($tbl_ary_ref = $sth->fetchall_arrayref) {
	
	print "<hr>";
	
	# Table details
	
	print "<form action=\"/test-cgi/kisitemupdate.pl\" method=\"post\">";
	
	print "<table border=\"0\" width=\"100%\">";
			
	print "<tr>";
	print "<td width=\"0%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\"></font></strong> </td>";
	print "<td width=\"0%\" align=\"left\"><strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">AKTUELL</font></strong> </td>";

	print "</tr>";				

	
	
	print "<tr>";
	print "<th width=\"33%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Item Nr.</font></strong> </th>";
			if (@$temp[0])  {
				print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[0], "</font></td>";
									}
								else	{
										print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", "leerer Datensatz" , "</font></td>";
										}
						
										
	print "</tr>";				

	print "<tr>";
    print "<th width=\"33%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Item Description</font></strong> </th>";
				if (@$temp[1])  {
						print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[1], "</font></td>";
									}
								else 	{
										print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", "leerer Datensatz" , "</font></td>";
										}
										

										
	print "</tr>";	


	print "<tr>";
	print "<th width=\"33%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Disposal Code</font></strong> </th>";
					if (@$temp[2])  {
									print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[2], "</font></td>";
									}
								else 	{
										print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", "leerer Datensatz" , "</font></td>";
										}
																			
									
	print "</tr>";					

					
	print "<tr>";
	print "<th width=\"33%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Lager Temperatur</font></strong> </th>";
    				if (@$temp[3])  {
									print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[3], "</font></td>";
									}
								else 	{
										print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", "leerer Datensatz" , "</font></td>";
										}
										
										
	print "</tr>";
	print "</table>";
		
	print "<hr>";
	
	
	# Print the localdate
	
	print "<p align=\"right\"><font face=\"Arial\" size=\"2\">", $zeit , "</font></p>";

	
	}
	

print $query->end_html;

exit(0);



       

