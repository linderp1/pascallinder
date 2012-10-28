@echo off
REM *******************************************************************************
REM  Name:	_mapDrivesWWW.cmd
REM 
REM  Purpose: 	Map user shares for the WWW server
REM 
REM  Usage:	_mapDrivesWWW.cmd
REM 
REM  Version:	1.0
REM  Date:	October, 28th 2005
REM  Author:	Pascal Linder, ATLas Center of Excellence
REM  Location:	C:\
REM
REM ******************************************************************************
REM
cls
echo *----------------------------------------------------------------------------
echo *
echo *          Shared drives mapping batch file
echo *                    
echo *          Pascal Linder - October, 28th 2005
echo *
echo *----------------------------------------------------------------------------
echo *
echo *
echo *----------------------------------------------------------------------------
echo BALI Web shares (Test, Prod)
echo *----------------------------------------------------------------------------
echo *
NET USE W: \\rbamsbali02.bas.roche.com\f$\www /USER:Administrator
