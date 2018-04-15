echo off
echo -
echo -
echo -  This batch will install map for Mapsource
echo -
echo -  Map:  "OSM Lithuania"
echo -  FID:  8570
echo -  PID:  1
echo -
echo -  Press Enter to continue or Ctrl-C to abort.
echo -
pause

echo Adding registry keys.

set KEY=HKLM\SOFTWARE\Garmin\MapSource
reg QUERY %KEY% 2>NUL >NUL
if not errorlevel 1 goto key_ok
set KEY=HKLM\SOFTWARE\Wow6432Node\Garmin\MapSource
reg QUERY %KEY% 2>NUL >NUL
if not errorlevel 1 goto key_ok
REM Mapsource not installed?
reg QUERY HKLM\SOFTWARE\Wow6432Node 2>NUL >NUL
if not errorlevel 1 goto key_ok
set KEY=HKLM\SOFTWARE\Garmin\MapSource
:key_ok

reg ADD %KEY%\Families\FAMILY_8570 /v ID /t REG_BINARY /d 7A21 /f
reg ADD %KEY%\Families\FAMILY_8570 /v IDX /t REG_SZ /d "%~dp085700010.mdx" /f
reg ADD %KEY%\Families\FAMILY_8570 /v MDR /t REG_SZ /d "%~dp085700010_mdr.img" /f
reg ADD %KEY%\Families\FAMILY_8570\1 /v Loc /t REG_SZ /d "%~dp0\" /f
reg ADD %KEY%\Families\FAMILY_8570\1 /v Bmap /t REG_SZ /d "%~dp085700010.img" /f
reg ADD %KEY%\Families\FAMILY_8570\1 /v Tdb /t REG_SZ /d "%~dp085700010.tdb" /f
pause
exit 0

