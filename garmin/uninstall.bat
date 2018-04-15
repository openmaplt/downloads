echo off
echo -
echo -
echo -  This batch will uninstall map from Mapsource.
echo -
echo -  Map:  "OSM Lithuania"
echo -  FID:  8570
echo -  PID:  1
echo -
echo -  Press Enter to continue or Ctrl-C to abort.
echo -
pause

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

reg DELETE %KEY%\Families\FAMILY_8570 /f
pause
exit 0

