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
#-----------------------------------------------------------------

use CGI;
use DBI;


# Database parameters

$dbname="arlp1bap.bas.roche.com";
$user="wwwread";
$passwd="wwwread";


$query = new CGI;
$prdnr = $query->param('item');


print $query->header;

print "<BODY BGCOLOR=#FFFFFF>";



# SQL query 1

if ($prdnr) {
	$sqlquery1=" select ITEMNO,
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

$dbh = DBI->connect("dbi:Oracle:$dbname", $user, $passwd);
$sth = $dbh->prepare($sqlquery1);
$sth->execute;

if ($tbl_ary_ref = $sth->fetchall_arrayref) {
	print "\n";
} else {
	print "Produkt nicht gefunden.\n"; 
}

$count = $sth->rows;

@row = $sth->fetchrow_array;

print "<th width=\"15%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"4\" color=\"#666699\">BALI Item Tabellenpflege</font></strong> </th>";

print "<p>&nbsp;</p>";

print "<th width=\"15%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"2\" color=\"#666699\">aktuelle Werte für Produkt:   ", $prdnr , "</font></strong> </th>";


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
					print "<th width=\"15%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Item 								Nr.</font></strong> </th>";
    				print "<th width=\"15%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Item 				Description</font></strong> </th>";
					print "<th width=\"15%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Disposal Code</font></strong> </th>";
    				print "<th width=\"15%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Lager Temperature</font></strong> </th>";
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
		print "<p>&nbsp;</p>";
	}
		
else {

	print "<p><font face=\"Arial\" size=\"2\" color=\"#FF0000\"> <blink> ", "Keine Datensätze gefunden !", "</font> </blink> </p>";

}

if ($tbl_ary_ref = $sth->fetchall_arrayref) {

	print "<p>&nbsp;</p>";
	print "<p>&nbsp;</p>";
	
	print "<hr>";
	
	print "<table border=\"0\" width=\"100%\">";
	
	# Test 1
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

	
	# Test 1
	
	
	
	
	
	
	print "<tr>"; 
	print "<th width=\"15%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Item Nr.</font></strong></th>";
    print "<th width=\"15%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Item 				Description</font></strong> </th>";
	print "<th width=\"15%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Disposal Code</font></strong> </th>";
    print "<th width=\"15%\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Lager Temperature</font></strong> </th>";


	print "<tr>";
    			print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[0], "</font></td>";
    			print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[1], "</font></td>";
				print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[2], "<select size=\"1\" name=\"B\">
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
				print "<td align=\"left\"><font face=\"Arial\" size=\"2\"> <select size=\"1\" name=\"C\">
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
				
				
				
	print "</tr>";
	
	print "</table>";
	print "<hr>";
	
	
	print "<p>&nbsp;</p>";
	print "<p>&nbsp;</p>";
	print "<p>&nbsp;</p>";
	print "<p>&nbsp;</p>";
	print "<p>&nbsp;</p>";
	print "<p>&nbsp;</p>";
	print "<p>&nbsp;</p>";
	print "<p>&nbsp;</p>";
	print "<p>&nbsp;</p>";

	
	print "<font face=\"Arial\" size=\"2\">", "Gesuchte Item Nr. :  ", $prdnr , "</font><BR>";
} else {
	print "<p><font face=\"Arial\" size=\"2\">", "Item Nr. nicht gefunden.\n"; 
}





print $query->end_html;

exit(0);



       

