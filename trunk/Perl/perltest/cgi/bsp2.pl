#!/usr/local/bin/perl -w
#-------------------------------------
#
# Copyright 2000 F. Hoffmann - La Roche
#
# Author:       Antonino Buccheri, POBB
#               Klaus Zinsmeister, POBB
#
# Function:     This script select all Login-Configuration
#		for a given Item No and returns the Sampletype,
#		KIS-Item and Mainlab
#
# Call:         Called from the WebPage
#		see http://bali.roche.com
#
# Parameter:    itemnr
#
# Revision 1.0  12-May-2000
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
	$sqlquery="	select	admin.sampletype,
				admin.productcode,
				vars.DEFAULTVALUE
			from	gwloginkeysadmin admin,
				GWLOGINKEYVALS vals,
				GWLOGINATTRIBVARS vars,
				ITEM
			where	ITEM.ITEMNO = \'$prdnr\'
			and	ITEM.KISITEMNO_KEY = admin.productcode
			and	admin.SAMPLETYPE = vals.SAMPLETYPE
			and	admin.PRODUCTCODE = vals.PRODUCTCODE
			and	vals.LOGINCONFIGID = vars.LOGINCONFIGID
			and	vars.VARNAME = \'MAINLAB\$\'
			order by admin.sampletype";

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

print "<img src=\"http://newton.kau.roche.com/perltest/images/LoginConfSuche.gif\" width=\"404\" height=\"54\" alt=\"Sampletype\">";
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
    				print "<th width=\"33%\" align=\"left\"><img src=\"http://newton.kau.roche.com/perltest/images/sampletype.gif\" width=\"141\" height=\"52\" alt=\"Sampletype\"></th>";
    				print "<th width=\"33%\" align=\"center\"><img src=\"http://newton.kau.roche.com/perltest/images/kisitem.gif\" width=\"113\" height=\"52\" alt=\"KIS-Item\"></th>";
    				print "<th width=\"33%\" align=\"left\"><img src=\"http://newton.kau.roche.com/perltest/images/mainlab.gif\" width=\"111\" height=\"52\" alt=\"MainLab\"></th>";
    				print "</tr>";
    			}
    		print "<tr>";
    		print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[0], "</font></td>";
    		print "<td align=\"center\"><font face=\"Arial\" size=\"2\">", @$temp[1], "</font></td>";
    		print "<td align=\"left\"><font face=\"Arial\" size=\"2\">", @$temp[2], "</font></td>";
              	$i++;
              	print "</tr>"
        }
    	print "</table>";
		print "<hr>";
		print "<p></p>";
		print "<p></p>";
    	}
else {
	print "Keine Datensätze gefunden !", "<BR>";
}


if ($tbl_ary_ref = $sth->fetchall_arrayref) {
	print "<font face=\"Arial\" size=\"2\">", "Gesuchtes Produkt:  ", $prdnr , "</font><BR>";
} else {
	print "<p><font face=\"Arial\" size=\"2\">", "Produkt nicht gefunden.\n"; 
}
print "<p><font face=\"Arial\" size=\"2\">", "Anzahl gefunden: ", $count, "</font></p><BR>";

print $query->end_html;

exit(0);

       
