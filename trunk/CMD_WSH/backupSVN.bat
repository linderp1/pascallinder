
::Echo off

::Grabbing date variables...


@For /F "tokens=1 delims=/ " %%A in ('Date /t') do set DAY=%%A
@For /F "tokens=2 delims=/ " %%B in ('Date /t') do set MM=%%B
@For /F "tokens=3 delims=/ " %%C in ('Date /t') do set DD=%%C
@For /F "tokens=4 delims=/ " %%D in ('Date /t') do set YY=%%D

Set CUSTOMDATE=%DD%-%MM%-%YY%

Set filename=svn_repo_%CUSTOMDATE%


E:\CollabNetSVN\bin\svnadmin dump E:\CollabNetSVN\data\repositories\FIMQ > c:\temp\%filename%.dump


7z a  c:\temp\%filename%.zip c:\temp\%filename%.dump
del c:\temp\%filename%.dump

robocopy c:\temp\ \\rbavmwcdb024.bas.roche.com\backup\

del c:\temp\%filename%.zip

exit 0