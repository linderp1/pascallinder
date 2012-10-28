#!/usr/local/bin/perl -w
#-----------------------------------------------------------------
#
# Copyright 2001 F. Hoffmann - La Roche
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

$dbname="arlp1bap.bas.roche.com";
$query = new CGI;
$prdnr = $query->param('item');
$userid = $query->param('userid');
$passwrd = $query->param('password');
$user = $userid;
$passwd = $passwrd;

print $query->header;

print "<BODY BGCOLOR=#FFFFFF>";


# Parameter Check

if ($userid) {
	print "\n";
	} else {
	print "Error ! No UserID parameter found !\n";
	exit(0);
	}
	
if ($passwd) {
	print "\n";
	} else {
	print "Error ! No Password parameter found !\n";
	exit(0);
	}
		
		
# SQL Query 1

if ($prdnr) {
	$sqlquery1=" select ITEMNO,
						ITEMDESCR_ENGLISH,
						DISPOSALCODE,
						MUST_TEMPERATURE
						from EXTERNAL.T_ITEM
						where ITEMNO = \'$prdnr\'";
						
} else {
  	print "Error ! No Item Nr parameter found !\n"; 
	print $query->end_html;
	exit(0);
}

$dbh = DBI->connect("dbi:Oracle:$dbname", $user, $passwd)
	or die "Couldn't connect to database: " . print "Couldn't connect to database: Invalid UserID or Password";

$sth = $dbh->prepare($sqlquery1)
	or die "Couldn't prepare statement: " . print "Couldn't prepare statement: ";

$sth->execute
	or die "Couldn't execute statement: " . print "Couldn't execute statement:";
	
if ($tbl_ary_ref = $sth->fetchall_arrayref) {
	print "\n";
} else {
	print "Produkt nicht gefunden.\n";
	   }

$count = $sth->rows;

@row = $sth->fetchrow_array;

print "<th width=\"15%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"4\" color=\"#666699\">BALI Item Tabellenpflege</font></strong> </th>";

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

	print "<p><font face=\"Arial\" size=\"2\" color=\"#FF0000\"> <blink> Keine Datensätze gefunden fuer Item Nr.:    ", $prdnr, "</font> </blink> </p>";
	exit(0);
}

if ($tbl_ary_ref = $sth->fetchall_arrayref) {
	
	print "<hr>";
	
	# Aufbau der Tabelle
	
	print "<form action=\"/test-cgi/kisitemupdate.pl\" method=\"post\">";
	
	print "<table border=\"0\" width=\"100%\">";
			
	print "<tr>";
	print "<td width=\"33%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\"></font></strong> </td>";
	print "<td width=\"33%\" align=\"left\"><strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">AKTUELL</font></strong> </td>";
	print "<td width=\"33%\" align=\"left\"><strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">NEU</font></strong> </td>";
	print "</tr>";				

	
	
	print "<tr>";
	print "<th width=\"33%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Item Nr.</font></strong> </th>";
			if (@$temp[0])  {
				print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[0], "</font></td>";
									}
								else	{
										print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", "leerer Datensatz" , "</font></td>";
										}
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

									print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[2], "</font></td>";
										}
										
									print "<td align=\"left\"><font face=\"Arial\" size=\"2\"><select size=\"1\" name=\"DISPCODE\">
											<option value=\"03\">03</option>
        									<option>04</option>
        									<option>05</option>
        									<option>06</option>
											<option>07</option>
											<option>09</option>
											<option>32</option>
											<option>34</option>
											<option>35</option>
											<option>36</option>
											<option>37</option>
											<option>38</option>
											<option>39</option>
											<option>41</option>
											<option>42</option>
											<option>43</option>
											<option>44</option>
											<option>45</option>
											<option>83</option>
											<option>86</option>
											<option>99</option></select></font></td>";
					
											print "</tr>";					

					
	print "<tr>";
	print "<th width=\"33%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Lager Temperatur</font></strong> </th>";
    				if (@$temp[3])  {
									print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[3], "</font></td>";
									}
								else 	{
										print "<td valign=\"top\" align=\"left\"><font face=\"Arial\" size=\"2\">", "leerer Datensatz" , "</font></td>";
										}
										print "<td align=\"left\"><font face=\"Arial\" size=\"2\"> <select size=\"1\" name=\"TEMPERATUR\">
											<option value=\"20\">20</option>
        									<option>35</option>
        									<option>30</option>
        									<option>25</option>
											<option>21</option>
											<option>15</option>
											<option>8</option>
											<option>5</option>
											<option>0</option>
											<option>-5</option>
											<option>-70</option></select></font></td>";
										
										print "<input type=\"hidden\" name=\"item\" value=\"", $prdnr, "\">";
										print "<input type=\"hidden\" name=\"userid\" value=\"", $userid, "\">";
										print "<input type=\"hidden\" name=\"password\" value=\"", $passwrd, "\">";
																											
										print "<input type=\"submit\" value=\"Updaten\" name=\"B1\"><input type=\"reset\" value=\"Cancel\" name=\"B2\"></p>";
										
	print "</tr>";
	print "</table>";
		
	print "<hr>";
	}
	
print $query->end_html;

exit(0);



       

