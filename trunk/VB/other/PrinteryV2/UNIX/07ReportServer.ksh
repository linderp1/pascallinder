#! /bin/ksh

########################################################################
#
# Copyright 1999 Hoffmann-La Roche
#
# Source:       $APP_BAS/bin/RLPReportSvr.ksh
#
# Author:       K. Zinsmeister, PSQI
#
# Function:     This script executes the generation of InfoReports 
#		server on a RLP1 HP-UX server machine. 
#               
# Description:  The script first create a temporary parameter file
#               based of the default parameter file for the specified
#               report. Then it spawns InfoReports server to generate
#               the report as xls or postscript file.
#		The postscript file could be converted to pdf or printed
#		directly.
#               This script is the main script to generate reports with cron jobs.
#               We have some paths hardcoded bedause this is a BALI script
#		and these paths are fixed
#
# Call: 	07ReportServer.ksh 	<ReportName>	worklist
#					<OutputType> 	PS/PDF/EXCEL
#					<OutputPath>	ldap/public
#					<Printer>	needed for PS
#					<DatabaseType>	ACTIVE ..
#					<User>
#					<Password>
#					<Parameter01>	The report parameter
#					<Parameter02>	second report parameter
#					<Parameter02>	third report parameter
#
# Comment:	Not part of the deliverables of RLP/1
#
#
# Functional Area: Infor Report Server
#
# Revision 		1.00
# 07-MAR-1999 by K. Zinsmeister, Initial revision
#
# Revision 		1.1
# 14-Oct-1999 by K. Zinsmeister
# Now we support 2 parameter for a report
#
# Revision 		1.2
# 14-Oct-1999 by K. Zinsmeister
# Changed delimiter for sed from "/" to "~"
# Because of problems with Parameter witch contains "/"
#
# Revision 		1.3
# 13-Mar-2003 by K. Zinsmeister
# Added support for 3 Parameter
# Needed for the Report PSL_Spec
#
# Revision 		1.4
# 23-Jul-2003 by K. Zinsmeister
# Added parameter to PDF generation for a better quality of a GIF
# 
########################################################################


# First we load some enviroment to set variables to RLP1

. /etc/config.RLP1 > /dev/null

# The variable INFOSVRPATH contains the full directory path of the
# InfoReports server software. This variable is hardcoded

INFOSVRPATH=/opt/HP/InfoRep

# The variable INFOSVRTMP contains the directory used for storing 
# temporary files. By default it is the sub directory tmp in the
# InfoReports server directory.
INFOSVRTMP=$INFOSVRPATH/tmp

# The variable REPORT_FILE contains the InfoReports description
# file name for the actual report to be printed. The name of
# the file is passed as parameter. This parameter
# should not contains the extension (.rep by default).
# It is also the filename for the output
REPORT_FILE=$INFOSVRPATH"/reports/"$1".rep"
# show the name in the logfile
echo "report file : "$REPORT_FILE


# The variable PARAM_FILE_DEF contains the InfoReports parameter file
# to be supplied at runtime with the report file. This parameter file
# is edited to set the actual value of the parameter for the report.
# This is done through the use of the sed(1) command. Sed replace all
# occurences of the string "RLPInfoSrvWrpSmpName". This quick and 
# dirty way of doint it allows for a simple macro. (Sorry for the 
# purists). The result of editing the standard parameter file is
# stored under the tmp sub-directory with the same name except for
# the extension which is changed into .PID. PID being the process Id
# of this process.
PARAM_FILE_DEF=$INFOSVRPATH"/reports/"$1".par"
# echo "source parameter file: "$PARAM_FILE_DEF
PARAM_FILE_CUR=$INFOSVRTMP"/"$1"."$$
# echo "tailored parameter file: "$PARAM_FILE_CUR

# The variable REPORT_OUTPUT contains the postscript output of 
# InfoReport Server. Testing prouved it far more reliable to generate
# an output file and print it later on. At the same time it is more
# easy, working that way, to maintain and modify this script.
REPORT_OUTPUT=$INFOSVRTMP"/"$1"."$$"ps"
echo "output file : "$REPORT_OUTPUT


# The variable DESTINATION contains the path where the report
# should stored. Only needed for PDF and Excel reports.
BALI_reports=/var/opt/reports/bali
DESTINATION=$BALI_reports"/other/"$3

# The variable PRINTER contains the printer destination. It is only
# used if the user has parameter <OutputType> set to PS. We suggest
# that the user wants to print the report.
PRINTER=$4
echo "printer     : "$PRINTER
# The variable DBTYPE contains the type of the target database
# Valid values are "ACTIVE, TEST, HISTORICAL"
DBTYPE=$5
#echo "Database Type : "$DBTYPE

# The variable DBUSER contains the user name used for the Oracle 
# connection
DBUSER=$6
#echo "DB User    : "$DBUSER

# The variable DBPASSWD contains the user password used for the Oracle 
# connection
DBPASSWD=$7

# The variable PAR01 contains the parameter 01 for the report. To be
# compabilty with RLP1 we replace the string "RLPInfoSrvWrpSmpName" with
# parameter 01. For futher versions we need a naming convention for parameters
# if there are more then one for a report. This has to be cleared together
# with HP.
PAR01=$8
echo "parameter 01: "$PAR01

# For BALI we set the replace string for the 2. parameter
# to BALIParSec. This is a local implementation !!
# Check of existence of 9 parameters
if [ $# -eq 9 ]
then
	PAR02=$9
	echo "parameter 02: "$PAR02
fi

# Check of existence of 10 parameters (third report parameter
if [ $# -eq 10 ]
then
	PAR02=$9
	echo "parameter 02: "$PAR02

	PAR03=${10}
	echo "parameter 03: "$PAR03
fi

if [ $# -eq 8 ]
then

	########################################################################
	# Warning: The next lines are piped together to perform various adaptation
	# of the parameter file. 
	########################################################################

        # 1) Set the Database Name
        # The variable DBNAME contains the name of the target database 
        # extracted from the /etc/config.DATA file. The extraction process 
        # assumes there is a line starting with the keyword $DBTYPE 
        # (ACTIVE, TEST, HISTORICAL), followed by a colon, followed by the 
        # instance name. No blanks should be present before or after the 
        # colon or the $DBTYPE token.
        DBNAME=`awk -F: "/^"$DBTYPE"/ { print "\$"2 }" /etc/config.DATA`
        #echo "Database DNS : "$DBNAME
        sed "s~RLP1~"$DBNAME"~g" $PARAM_FILE_DEF |

       	# 2) Set the Sample Name
       	# Set the sample name in the InfoReport parameter file for
       	# the current report
       	sed "s~RLPInfoSrvWrpSmpName~"$PAR01"~g" | 

       	# 3) Set the User Name
       	# Set the user name in the InfoReport parameter file for
       	# the current report
       	sed "s~DBUSER~"$DBUSER"~g"  |

        # 4) Set the Password
        # Set the user password in the InfoReport parameter file for
        # the current report
        sed "s~DBPASSWD~"$DBPASSWD"~g"  > $PARAM_FILE_CUR
fi

if [ $# -eq 9 ]
then

	########################################################################
	# Warning: The next lines are piped together to perform various adaptation
	# of the parameter file. 
	########################################################################

        # 1) Set the Database Name
        # The variable DBNAME contains the name of the target database 
        # extracted from the /etc/config.DATA file. The extraction process 
        # assumes there is a line starting with the keyword $DBTYPE 
        # (ACTIVE, TEST, HISTORICAL), followed by a colon, followed by the 
        # instance name. No blanks should be present before or after the 
        # colon or the $DBTYPE token.
        DBNAME=`awk -F: "/^"$DBTYPE"/ { print "\$"2 }" /etc/config.DATA`
        #echo "Database DNS : "$DBNAME
        sed "s~RLP1~"$DBNAME"~g" $PARAM_FILE_DEF |

       	# 2) Set the first parameter
       	# Set the first parameter in the InfoReport parameter file for
       	# the current report
       	sed "s~RLPInfoSrvWrpSmpName~$PAR01~g" | 

       	# 3) Set the second parameter
       	# Set second parameter in the InfoReport parameter file for
       	# the current report
       	sed "s~BALIParSec~$PAR02~g" | 

       	# 4) Set the User Name
       	# Set the user name in the InfoReport parameter file for
       	# the current report
       	sed "s~DBUSER~"$DBUSER"~g"  |

        # 5) Set the Password
        # Set the user password in the InfoReport parameter file for
        # the current report
        sed "s~DBPASSWD~"$DBPASSWD"~g"  > $PARAM_FILE_CUR
fi


if [ $# -eq 10 ]
then

	########################################################################
	# Warning: The next lines are piped together to perform various adaptation
	# of the parameter file. 
	########################################################################

        # 1) Set the Database Name
        # The variable DBNAME contains the name of the target database 
        # extracted from the /etc/config.DATA file. The extraction process 
        # assumes there is a line starting with the keyword $DBTYPE 
        # (ACTIVE, TEST, HISTORICAL), followed by a colon, followed by the 
        # instance name. No blanks should be present before or after the 
        # colon or the $DBTYPE token.
        DBNAME=`awk -F: "/^"$DBTYPE"/ { print "\$"2 }" /etc/config.DATA`
        #echo "Database DNS : "$DBNAME
        sed "s~RLP1~"$DBNAME"~g" $PARAM_FILE_DEF |

       	# 2) Set the first parameter
       	# Set the first parameter in the InfoReport parameter file for
       	# the current report
       	sed "s~RLPInfoSrvWrpSmpName~$PAR01~g" | 

       	# 3) Set the second parameter
       	# Set second parameter in the InfoReport parameter file for
       	# the current report
       	sed "s~BALIParSec~$PAR02~g" | 

       	# 4) Set the second parameter
       	# Set second parameter in the InfoReport parameter file for
       	# the current report
       	sed "s~BALIParThr~$PAR03~g" | 

       	# 5) Set the User Name
       	# Set the user name in the InfoReport parameter file for
       	# the current report
       	sed "s~DBUSER~"$DBUSER"~g"  |

        # 6) Set the Password
        # Set the user password in the InfoReport parameter file for
        # the current report
        sed "s~DBPASSWD~"$DBPASSWD"~g"  > $PARAM_FILE_CUR
fi

########################################################################
# Now the main work begins. We have to check what the user wants.
#
# First if the user wants a postscript to be printed.

if [ $2 = PS ]
then
	
	#
	# Spawn InfoReport server with as parameters:
	#     the report file:             -rep $REPORT_FILE
	#     the parameter file:          -par $PARAM_FILE_CUR
	#     the output postscript file : -out $REPORT_OUTPUT

	$INFOSVRPATH/infsrv/proserv -rep $REPORT_FILE -par $PARAM_FILE_CUR -out $REPORT_OUTPUT 

	# and print it

	lp -oraw -onb -d$PRINTER $REPORT_OUTPUT 

	# Remove the temporary files: first the current parameter file, then the
	# postscript file.

	rm -f $PARAM_FILE_CUR 
	rm -f $PARAM_FILE_CUR"db"
	rm -f $REPORT_OUTPUT 

	# done and quit

	exit 0


elif [ $2 = PDF ]
then
	
	#
	# Spawn InfoReport server with as parameters:
	#     the report file:             -rep $REPORT_FILE
	#     the parameter file:          -par $PARAM_FILE_CUR
	#     the output postscript file : -out $REPORT_OUTPUT

	$INFOSVRPATH/infsrv/proserv -rep $REPORT_FILE -par $PARAM_FILE_CUR -out $REPORT_OUTPUT 

	# now we convert it to PDF

	DISTILLER=/opt/ADOBE/Acrobat3/bin/distill

	# next line necessary to stop distiller asking for compatibilty
	# set $HOME and put Conf-File there 'AcrobatDistiller'
	# we use the HOME of pdba where the software is installed
	# pe, 8-nov-1998

	HOME=/opt/ADOBE/Acrobat3
	export HOME
	echo "moving PS file" $REPORT_OUTPUT "to destination ..."
	mv $REPORT_OUTPUT $BALI_reports/tmp/$1.ps

	# Remove the temporary files: first the current parameter file, then the
	# postscript file.

	rm -f $PARAM_FILE_CUR 
	rm -f $PARAM_FILE_CUR"db"
	rm -f $REPORT_OUTPUT 
	# Now we can start to distill
	echo "Now Distilling PS-Report..." 
	cd $BALI_reports/tmp/
	$DISTILLER -quiet -graydownsample false -compatlevel 3.0 -pagesize 21.0 29.7 cm -resolution 600 $1.ps
	chmod 440 $1.pdf

	echo "Moving PDF and Log File" 
	mv -f $1.pdf $DESTINATION"/"$1"_"$8".pdf"
	rm -f $1.log 
	rm -f $1.ps

	# done and quit
	exit 0

elif [ $2 = EXCEL ]
then
	
	#
	# Spawn InfoReport server with as parameters:
	#     the report file:             -rep $REPORT_FILE
	#     the parameter file:          -par $PARAM_FILE_CUR
	#     the output postscript file : -out $REPORT_OUTPUT
	$INFOSVRPATH/infsrv/proserv -rep $REPORT_FILE -par $PARAM_FILE_CUR -out $REPORT_OUTPUT -cvt excel
	echo "moving EXCEL file" $REPORT_OUTPUT "to destination ..."
	mv $REPORT_OUTPUT $DESTINATION"/"$1"_"$8".xls"
	# Remove the temporary files: first the current parameter file, then the
	# postscript file.
	rm -f $PARAM_FILE_CUR 
	rm -f $PARAM_FILE_CUR"db"
	rm -f $REPORT_OUTPUT 
	# done and quit
	exit 0
	
elif [ $2 = HTML ]
then
	
	#
	# Spawn InfoReport server with as parameters:
	#     the report file:             -rep $REPORT_FILE
	#     the parameter file:          -par $PARAM_FILE_CUR
	#     the output postscript file : -out $REPORT_OUTPUT
	$INFOSVRPATH/infsrv/proserv -rep $REPORT_FILE -par $PARAM_FILE_CUR -out $REPORT_OUTPUT -cvt html
	echo "moving HTML file" $REPORT_OUTPUT "to destination ..."
	mv $REPORT_OUTPUT $DESTINATION"/"$1"_"$8".htm"
	# Remove the temporary files: first the current parameter file, then the
	# postscript file.
	rm -f $PARAM_FILE_CUR 
	rm -f $PARAM_FILE_CUR"db"
	rm -f $REPORT_OUTPUT 
	# done and quit
	exit 0

fi
