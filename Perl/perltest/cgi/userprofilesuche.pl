#!/usr/local/bin/perl -w
#-----------------------------------------------------------------
#
# Copyright 2000 F. Hoffmann - La Roche
#
# Author:       Antonino Buccheri, POBB
#               Klaus Zinsmeister, POBB
#
# Function:     This script select the record
#		for a given UserID and returns the rows
#		from the BALI_User Tables !
#
# Call:         Called from the WebPage
#		see http://bali.roche.com
#
# Parameter:    Analysen Nr.
#
# Revision 1.0  22-May-2000
#               Initial revision
#-----------------------------------------------------------------

use CGI;
use DBI;



# Database parameters

$dbname="arlp1bap.bas.roche.com";
$user="wwwread";
$passwd="wwwread";


$query = new CGI;
$prdnr = $query->param('userid');


print $query->header;

print "<BODY BGCOLOR=#FFFFFF>";



# Start - SQL query 1 ---------------------------------------------------------------------------------------------------------------

if ($prdnr) {
	$sqlquery1=" SELECT 	LMSUSER.NAME,
							LMSUSER.FULLNAME,
							LMSUSER.CAPLEVEL,
							DECODE (LMSUSER.CAPLEVEL, '1', 'System User', '2', 'ResultEntry User',
							'3', 'ResultEntry User', '4', 'System User', '5', 'Review Level 5',
							'6', 'Review Level 6', '7', 'Final Reviewer / Approver', '8', 'ChemLMS Superuser',
							'9', 'BALI Admin User') PROFILE
							FROM 
 							LMSUSER
							WHERE  (LMSUSER.STATE IS NULL OR LMSUSER.STATE = '*')
							AND LMSUSER.NAME = UPPER (\'$prdnr\')";
						
} else {
  	print "Error ! No parameter found !\n"; 
	print $query->end_html;
	exit(0);
}

$dbh = DBI->connect("dbi:Oracle:$dbname", $user, $passwd);
$sth = $dbh->prepare($sqlquery1);
$sth->execute;

if (@user = $sth->fetchrow_array) {
	print "\n";
} 

# End - SQL query 1 ---------------------------------------------------------------------------------------------------------------

# Start - SQL query 2 -------------------------------------------------------------------------------------------------------------

if ($prdnr) {
	$sqlquery2 = " select 	BALI_GROUPMEMBERS_CURRENTVW.GROUPNAME
							from BALI_GROUPMEMBERS_CURRENTVW
							where BALI_GROUPMEMBERS_CURRENTVW.USERNAME = UPPER (\'$prdnr\')
							order by groupname";
} else {
  	print "Error ! No parameter found !\n"; 
	print $query->end_html;
	exit(0);
}

#$dbh = DBI->connect("dbi:Oracle:$dbname", $user, $passwd);
$sth = $dbh->prepare($sqlquery2);
$sth->execute;

if ($tbl_ary_refgroup = $sth->fetchall_arrayref) {
	print "\n";
} else {
	print "User/Gruppe Relation nicht gefunden.\n"; 
}

$count = $sth->rows;

# End - SQL query 2 ---------------------------------------------------------------------------------------------------------------

# Start - SQL query 3 -------------------------------------------------------------------------------------------------------------

if ($prdnr) {
	$sqlquery3 = " 	SELECT MODULENAME
					FROM
					GWUSERMODULES
					where USERNAME = UPPER (\'$prdnr\')
					order by MODULENAME";		
						
} else {
  	print "Error ! No parameter found !\n"; 
	print $query->end_html;
	exit(0);
}

#$dbh = DBI->connect("dbi:Oracle:$dbname", $user, $passwd);
$sth = $dbh->prepare($sqlquery3);
$sth->execute;

if ($tbl_ary_refmodule = $sth->fetchall_arrayref) {
	print "\n";
} else {
	print "User/Module Relation nicht gefunden.\n"; 
}

$count2 = $sth->rows;

# End - SQL query 3 ---------------------------------------------------------------------------------------------------------------

# Start - SQL query 4 -------------------------------------------------------------------------------------------------------------

if ($prdnr) {
	$sqlquery4 = " 	SELECT EVENTNAME
					FROM
					GWUSEREVENTSVW
					where USERNAME = UPPER (\'$prdnr\')
					order by EVENTNAME";		
						
} else {
  	print "Error ! No parameter found !\n"; 
	print $query->end_html;
	exit(0);
}

#$dbh = DBI->connect("dbi:Oracle:$dbname", $user, $passwd);
$sth = $dbh->prepare($sqlquery4);
$sth->execute;

if ($tbl_ary_refevent = $sth->fetchall_arrayref) {
	print "\n";
} else {
	print "User/Event Relation nicht gefunden.\n"; 
}

$count4 = $sth->rows;

# End - SQL query 4 ---------------------------------------------------------------------------------------------------------------



# Start Generate the HTML-Page for UserProfile - Query ----------------------------------------------------------------------------


print "<img src=\"http://newton.kau.roche.com/perltest/images/userprofile.gif\" width=\"302\" height=\"54\" alt=\"UserProfileSuche\">";
print "<hr>";


# Start output if rows found for query 1 ---------------------------------------------------------------------------------------------------------

if (@user) {

					print "<table border=\"0\" width=\"100%\">";

    				print "<tr>"; 
					print "<th width=\"0\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">UserID</font></strong> </th>";
    				print "<th width=\"0\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">User Name</font></strong> </th>";
					print "<th width=\"0\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Profil</font></strong> </th>";
					print "</tr>";
    				print "<tr>";
    				print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", $user[0], "</font></td>";
    				print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", $user[1], "</font></td>";
    				print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", $user[3], "</font></td>";
					print "</tr>";
	
              		print "</tr>"
  			}
		

else 		{

					print "<p><font face=\"Arial\" size=\"2\" color=\"#FF0000\"> <blink> ", "Keine Datensätze gefunden !", "</font> </blink> </p>";

			}
		
    				print "</table>";
		
# End output if rows found for query 1 ----------------------------------------------------------------------------------------------------

# Start output if rows found for query 2 --------------------------------------------------------------------------------------------------
		
		
					print "<p></p>";
					
					print "<table border=\"0\" width=\"100%\" align=\"center\">";
					
if ($count > 0)
	{
	   	$i = 0;

					print "<tr>";
					print "<th width=\"0\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Group</font></strong> </th>";
					print "</tr>";
		
    	while($i < $count)
    	{
       		$temp = @$tbl_ary_refgroup[$i];

    		if ($i >= 0)
			
				{
    				print "<tr>";
					print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[0], "</font></td>";
					print "</tr>";
					print "<p></p>";
					
				}
				
				$i++;
				
              	print "</tr>";
        }
	}
	
				print "</table>";

# End output if rows found for query 2 ----------------------------------------------------------------------------------------------------

# Start output if rows found for query 3 ---------------------------------------------------------------------------------------------------


					print "<p></p>";
					
					print "<table border=\"0\" width=\"100%\">";
					
if ($count2 > 0)
	{
	   	$x = 0;

					print "<tr>";
					print "<th width=\"0\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Module</font></strong> </th>";
					print "</tr>";
		
    	while($x < $count2)
    	{
       		$module = @$tbl_ary_refmodule[$x];

    		if ($x >= 0)
			
				{
    				print "<tr>";
					print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", @$module[0], "</font></td>";
					print "</tr>";
					print "<p></p>";
					
				}
				
				$x++;
				
              	print "</tr>";
        }
	}
	
				print "</table>";
				
# End output if rows found for query 3 ----------------------------------------------------------------------------------------------------

# Start output if rows found for query 4 ---------------------------------------------------------------------------------------------------

					print "<p></p>";
					
					print "<table border=\"0\" width=\"100%\">";
					
if ($count4 > 0)
	{
	   	$y = 0;

					print "<tr>";
					print "<th width=\"0\" align=\"left\"> <strong> <font face=\"Arial\" size=\"3\" color=\"#666699\">Event</font></strong> </th>";
					print "</tr>";
		
    	while($y < $count4)
    	{
       		$event = @$tbl_ary_refevent[$y];

    		if ($y >= 0)
			
				{
    				print "<tr>";
					print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", @$event[0], "</font></td>";
					print "</tr>";
					print "<p></p>";
					
				}
				
				$y++;
				
              	print "</tr>";
        }
	}
	
				print "</table>";
				
# End output if rows found for query 4 ----------------------------------------------------------------------------------------------------
		
		print "<hr>";
		print "<p></p>";
		print "<p></p>";

if (@user) {
	print "<font face=\"Arial\" size=\"2\">", "Gesuchter User:  ", $prdnr , "</font><BR>";
} else { }

print $query->end_html;

exit(0);