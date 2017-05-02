@echo off
REM *******************************************************************************
REM  Name:	_mapDrives.cmd
REM 
REM  Purpose: 	Map user shares
REM 
REM  Usage:	_mapDrives.cmd
REM 
REM  Version:	1.0
REM  Date:	October, 28th 2005
REM  Author:	Pascal Linder, ATLas Center of Excellence
REM  Location:	C:\
REM
REM ******************************************************************************
REM
REM  Version:	1.1
REM  Date:	August, 31th 2006
REM  Author:	Pascal Linder, ATLas Center of Excellence
REM  Location:	C:\
REM
REM ******************************************************************************
REM
REM  Version:	1.2
REM  Date:	May, 3rd 2011
REM  Author:	Pascal Linder, FIMQ
REM  Location:	C:\
REM
REM ******************************************************************************

cls
echo *----------------------------------------------------------------------------
echo *
echo *          Shared drives mapping batch file
echo *                    
echo *----------------------------------------------------------------------------
echo *
echo *
echo *----------------------------------------------------------------------------
echo * ATLas shares
echo *----------------------------------------------------------------------------
NET USE I: \\server\dept_poy\_org\pgsq
NET USE J: \\server\dept_poy\_org\pgsq\02_ATLas
NET USE L: \\server\dept_poy\_org\pgsq\02_ATLas\03_Projects\2009-RLP-One6
echo *
echo *----------------------------------------------------------------------------
echo * NAS server shares
echo *----------------------------------------------------------------------------
echo *
NET USE O: \\rbavmwcdb024\Data
NET USE P: \\rbavmwcdb024\linderp1$
echo *
echo *----------------------------------------------------------------------------
echo * Roche user shares (U and V drives)
echo *----------------------------------------------------------------------------
echo *
NET USE U: \\rbamscoe101\U_linderp1$
NET USE V: \\rbamscoe131.bas.roche.com\Dept_POY
echo *----------------------------------------------------------------------------
echo PGSQ "Special" share
echo *----------------------------------------------------------------------------
echo *
NET USE X: \\rbamscoe131.bas.roche.com\dept_poy\_Special\PGSQ
echo *
