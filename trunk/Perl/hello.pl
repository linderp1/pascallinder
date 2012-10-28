#!/bin/perl
use CGI_Lite;
$cgi=new CGI_Lite;
%in = $cgi->parse_form_data;
print "Content-type: text/html\n\n";

# main
print "<h1>Hello $in{'name'} !</h1>;
